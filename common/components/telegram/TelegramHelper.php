<?php

namespace common\components\telegram;

use yii\httpclient\Client;
use Yii;

class TelegramHelper {
    private static $token = '';
    private static $chatId = '';

	public static function sendToChat($text, $chat_id)
	{
		$url = "https://api.telegram.org/bot" . self::$token . "/sendMessage?chat_id=" . $chat_id . "&text=" . urlencode($text);
		$c = curl_init($url);
		curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($c, CURLOPT_POST, false);
		curl_exec($c);
		curl_close($c);
	}

    /**
     * Receives taxi operator chat latest chat
     *
     * @return array
     * @throws \yii\httpclient\Exception
     */
    public static function getLatestChat(): array
    {
        $url = 'https://api.telegram.org/bot' . self::$token;

        /*
         * Save the bot latest message id to receive only new one
         *
         * offset is for receiving only latest message
         */
        $offset = 0;
        if (Yii::$app->cache->get('telegramBotUpdateId') !== false) {
            $offset = Yii::$app->cache->get('telegramBotUpdateId');
        }

        $client = new Client(['baseUrl' => $url]);
        $response = $client->get('getUpdates', ['offset' => $offset + 1, 'limit' => 1])->send();

        if ($response->isOk) {
            $data = ($response->data)['result'];
            if (empty($data)) {
                return [];
            }

            // get first elem of array because it is only latest message
            $data = $data[0];
            Yii::$app->cache->set('telegramBotUpdateId', $data['update_id']);

            return $data;
        }

        return [];
    }
}
