<?php

use common\tests\AcceptanceTester;
use console\controllers\ProcessController;

use \Codeception\Util\HttpCode;

$I = new AcceptanceTester($scenario);
$I->amBearerAuthenticated('T1oz9tTeSbUSUXsWe2vv9VlsTzLWbMMJ');
$json = file_get_contents(__DIR__ . '/../_data/lead.json');
$I->sendPOST('lead/create', $json);
$I->seeResponseCodeIs(HttpCode::OK);
$I->seeResponseContainsJson([
    'success' => true
]);

$leadId = $I->grabDataFromResponseByJsonPath('$.lead.id')[0];
    
$params = [];
$controller = new ProcessController('process', Yii::$app);
$controller->run('index', $params);

$crmId = $I->grabColumnFromDatabase('lead', 'crm_id', ['id' => $leadId])[0];
$I->assertNotEquals($crmId, "0");