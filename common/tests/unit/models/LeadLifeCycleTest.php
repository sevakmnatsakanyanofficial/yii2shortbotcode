<?php

namespace common\tests\unit\models;

use Yii;

use tests\codeception\api\ApiTester;

use common\fixtures\LeadFixture;


class LeadLifeCycleTest extends \Codeception\Test\Unit
{
    /**
     * @var \common\tests\UnitTester
     */
    protected $tester;


    /**
     * @return array
     */
    public function _fixtures()
    {
        return [
            'lead' => [
                'class' => LeadFixture::className(),
                'dataFile' => codecept_data_dir() . 'lead.php'
            ]
        ];
    }

    public function testLeadLifeCycle(UnitTester $I)
    {
		$data = [
            'name' => '[TPLD]Тестовый заказ',
            'phone' => '137067812124',
			'country' => 'uz',
			'lead_information' => 'Палочки SANI STICKS',
			'price' => '229000',
			'quantity' => '1',
			'utm_source' => 'Test Lead',
        ];

        $I->sendPOST('/api/lead/create', $data);
        $I->seeResponseCodeIs(HttpCode::UNPROCESSABLE_ENTITY);
        $I->seeResponseContainsJson([
            'result' => NULL
        ]);


        /*expect('model should not login user', $model->login())->false();
        expect('user should not be logged in', Yii::$app->user->isGuest)->true();*/
    }
}
