<?php

namespace api\controllers;



use common\components\telegram\TelegramHelper;

use Yii;
use yii\filters\VerbFilter;
use yii\helpers\BaseStringHelper;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\MethodNotAllowedHttpException;
use yii\web\NotAcceptableHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class WebHookController extends Controller
{
    public $enableCsrfValidation = false;

    /**
     * Receives telegram bot dialog updates
     * It is for bot dialog with taxi operators
     *
     * @throws \yii\httpclient\Exception
     */
    public function actionTelegramBotUpdates()
    {
        $data = TelegramHelper::getLatestChat();

        if (!isset($data['message'])) {
            // TODO: throw error
            return;
        }

        $taxiOperatorTelegramAccountId = $data['message']['chat']['id'];
        $taxiOperator = TaxiOperator::find()
            ->where(['telegram_account_id' => $taxiOperatorTelegramAccountId])
            ->asArray()
            ->one();

        if ($taxiOperator === null) {
            // TODO: error
            return;
        }

        // get taxi operator current lead
        $leadId = $taxiOperator['active_lead_id'];

        // get operator dialog state
        $state = Yii::$app->cache->get(Lead::CACHE_KEY_TAXI_OPERATOR_BOT_STATE_PREFIX . $leadId . $taxiOperator['telegram_account_id']);

        if ($state === false) {
            //TODO: error
            return;
        }

        switch ($state) {
            case Lead::TAXI_OPERATOR_BOT_STATE_PHONE_NUMBER:
                $taxiData = [];
                $taxiData['phoneNumber'] = $data['message']['text'];
                Yii::$app->cache->set(
                    'taxiData' . $leadId . $taxiOperator['telegram_account_id'],
                    $taxiData
                );
                TelegramHelper::sendToChat('Введите номер машины', $taxiOperator['telegram_account_id']);
                /*
                * Set bot dialog state
                */
                Yii::$app->cache->set(
                    Lead::CACHE_KEY_TAXI_OPERATOR_BOT_STATE_PREFIX . $leadId . $taxiOperator['telegram_account_id'],
                    Lead::TAXI_OPERATOR_BOT_STATE_CAR_NUMBER
                );
                break;
            case Lead::TAXI_OPERATOR_BOT_STATE_CAR_NUMBER:
                $taxiData = Yii::$app->cache->get('taxiData' . $leadId . $taxiOperator['telegram_account_id']);
                $taxiData['carNumber'] = $data['message']['text'];
                Yii::$app->cache->set(
                    'taxiData' . $leadId . $taxiOperator['telegram_account_id'],
                    $taxiData
                );
                TelegramHelper::sendToChat('Введите имя таксиста', $taxiOperator['telegram_account_id']);
                Yii::$app->cache->set(
                    Lead::CACHE_KEY_TAXI_OPERATOR_BOT_STATE_PREFIX . $leadId . $taxiOperator['telegram_account_id'],
                    Lead::TAXI_OPERATOR_BOT_STATE_DRIVER_NAME
                );
                break;
            case Lead::TAXI_OPERATOR_BOT_STATE_DRIVER_NAME:
                $taxiData = Yii::$app->cache->get('taxiData' . $leadId . $taxiOperator['telegram_account_id']);
                $taxiData['driverName'] = $data['message']['text'];

                // remove state cache for all operators of the taxi
                $subQuery = TaxiOperator::find()
                    ->select('taxi_id')
                    ->where(['telegram_account_id' => $taxiOperator['telegram_account_id']]);
                $taxiAllOperators = TaxiOperator::find()
                    ->select('telegram_account_id')
                    ->where(['taxi_id' => $subQuery])
                    ->asArray()
                    ->all();

                foreach ($taxiAllOperators as $operator) {
                    Yii::$app->cache->delete('taxiData' . $leadId . $operator['telegram_account_id']);
                    Yii::$app->cache->delete(Lead::CACHE_KEY_TAXI_OPERATOR_BOT_STATE_PREFIX . $leadId . $operator['telegram_account_id']);
                }

                // deactivate all busy operators for the lead
                TaxiOperator::updateAll(['active_lead_id' => null], ['active_lead_id' => $leadId]);

                /*
                 * it is finish step of dialog
                 * so it needs to save data in the deal table
                 */
                $dealModel = Deal::find()->where(['lead_id' => $leadId])->one();
                $dealModel->taxi_driver_info = $taxiData['phoneNumber'] . '|' . $taxiData['carNumber'] . '|' . $taxiData['driverName'];
                $dealModel->save();

                TelegramHelper::sendToChat(
                    'Спасибо. На заказ ' . $leadId . ' назначен водитель: ' .
                    "\nТелефон: " . $taxiData['phoneNumber'] .
                    "\nНомер машины: " . $taxiData['carNumber'] .
                    "\nИмя: " . $taxiData['driverName'] . '', $taxiOperator['telegram_account_id']
                );
                break;
        }
    }
}