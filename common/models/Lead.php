<?php

namespace common\models;


use Yii;

use yii\base\Event;
use yii\behaviors\TimestampBehavior;
use yii\helpers\ArrayHelper;


/**
 * This is the model class for table "lead".
 */
class Lead extends \yii\db\ActiveRecord
{
    public const STATUS_CRM_APPROVED = 5;

    public const EVENT_AFTER_LEAD_IS_APPROVED = 'after_lead_is_approved';

    // Bot dialog state const
    public const CACHE_KEY_TAXI_OPERATOR_BOT_STATE_PREFIX = 'taxiOperatorBotState';
    public const TAXI_OPERATOR_BOT_STATE_PHONE_NUMBER = 1;
    public const TAXI_OPERATOR_BOT_STATE_CAR_NUMBER = 2;
    public const TAXI_OPERATOR_BOT_STATE_DRIVER_NAME = 3;


    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%lead}}';
    }

    /**
     * {@inheritdoc}
     */
    public function init(): void
    {
        parent::init();
        $this->on(self::EVENT_AFTER_LEAD_IS_APPROVED, [$this, 'afterLeadIsApproved']);
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            LeadDistributeToCC::class,
            TimestampBehavior::class,
            ActiveRecordLogableBehavior::class,
            LeadDefaultStatusBehavior::class,
            LeadNotificationBehavior::class,
            LeadQueuedOperatorBehavior::class
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
        ];
    }

    public function delete()
    {
        $this->status = self::STATUS_DELETED;
        $this->save();
    }

    public function setIpaddr($val)
    {
        $this->ip = ip2long($val);
    }

    public function getIpaddr()
    {
        return long2ip($this->ip);
    }

    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }

    public static function findByStatus($status)
    {
        return self::find()->where(['status' => $status])->all();
    }

    public function getCategory()
    {
        return $this->hasOne(CategoryToMatch::class, ['name' => 'lead_information']);
    }

    public function getLeadCity()
    {
        return $this->hasOne(City::class, ['id' => 'city']);
    }

    public static function getLeadsCount()
    {
        $query = self::find()
            ->where('created_at BETWEEN ' . strtotime(date('d.m.Y') . '00:00:00') . ' AND ' . time());

        if (Yii::$app->user->can(User::ROLE_LEADGEN)) {
            $query->andWhere(['user_id' => Yii::$app->user->id]);
            $query->andWhere(['>=', 'status', 0]);
        } elseif (Yii::$app->user->can(User::ROLE_PARTNERSHIP)) {
            $query->andWhere(['partnership_id' => Yii::$app->user->id]);
            $query->andWhere(['>=', 'status', 0]);
        }

        return $query->count();
    }

    /**
     * Получить комментарии к лиду
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(LeadComment::class, ['lead_id' => 'id']);
    }

    /**
     * Получить самый свежий комментарий к лиду
     * @return \yii\db\ActiveQuery
     */
    public function getLatestComment()
    {
        return $this->hasOne(LeadComment::class, ['lead_id' => 'id'])->orderBy(['id' => SORT_DESC]);
    }

    /**
     * {@inheritDoc}
     */
    public function afterSave($insert, $changedAttributes): void
    {
        if (!$insert) {
            if (!Yii::$app->user->isGuest) {
                if ($this->status === self::STATUS_CRM_APPROVED && Yii::$app->user->can(User::ROLE_PICKUP_POINT)) {
                    $this->trigger(self::EVENT_AFTER_LEAD_IS_APPROVED);
                }
            }
        }

        parent::afterSave($insert, $changedAttributes);
    }

    /**
     * Event handler to catch if order status is collected
     *
     * @param Event $event
     */
    public function afterLeadIsApproved(Event $event): void
    {
        // Sends telegram bot notification
        $taxi = Taxi::find()
            ->select('id')
            ->where(['point_id' => Yii::$app->user->id]);
        $taxiOperators = TaxiOperator::find()
            ->select('telegram_account_id')
            ->where(['taxi_id' => $taxi])
            ->asArray()
            ->all();

        foreach ($taxiOperators as $taxiOperator) {
            TaxiOperator::updateAll(['active_lead_id' => $this->id], ['telegram_account_id' => $taxiOperator['telegram_account_id']]);

            TelegramHelper::sendToChat('Новый заказ ' . $this->id .
                ";\nАдрес подачи: " . Yii::$app->user->identity->address .
                ";\nАдрес назначения: " . $this->address_information .
                ";\nТелефон: " . Yii::$app->user->identity->phone . '', $taxiOperator['telegram_account_id']);
            TelegramHelper::sendToChat('Введите номер телефона таксиста', $taxiOperator['telegram_account_id']);
            /*
             * Set bot dialog state
             */
            Yii::$app->cache->set(
                self::CACHE_KEY_TAXI_OPERATOR_BOT_STATE_PREFIX . $this->id . $taxiOperator['telegram_account_id'],
                self::TAXI_OPERATOR_BOT_STATE_PHONE_NUMBER
            );
        }
    }
}
