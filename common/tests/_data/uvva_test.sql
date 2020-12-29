-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: uvva
-- ------------------------------------------------------
-- Server version       5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','1',1575469221),('enterpreneur','4',1575470920),('enterpreneur','9',1580201580),('financier','2',1575469231),('leadgen','10',1580214596),('leadgen','5',1575470937),('operator','3',1575469403),('operator','6',1578510367),('operator','7',1578511275),('partner','8',1579770229);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,NULL,NULL,NULL,1575469220,1575469220),('courier',1,NULL,NULL,NULL,1575469220,1575469220),('enterpreneur',1,NULL,NULL,NULL,1575469220,1575469220),('financier',1,NULL,NULL,NULL,1575469231,1575469231),('leadgen',1,NULL,NULL,NULL,1575469220,1575469220),('operator',1,NULL,NULL,NULL,1575469220,1575469220),('partner',1,NULL,NULL,NULL,1579770187,1579770187),('shop',1,NULL,NULL,NULL,1575469220,1575469220);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_to_match`
--

DROP TABLE IF EXISTS `category_to_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_to_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_to_match`
--

LOCK TABLES `category_to_match` WRITE;
/*!40000 ALTER TABLE `category_to_match` DISABLE KEYS */;
INSERT INTO `category_to_match` VALUES (1,1,'Бесконтактный термометр Non-contact Thermometer',1,1575470898,1575470898,'',NULL);
/*!40000 ALTER TABLE `category_to_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `className` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration`
--

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;
INSERT INTO `integration` VALUES (1,'crm','LeadVertex','common\\api\\LeadVertex'),(2,'delivery','PingDelivery','common\\api\\PingDelivery'),(3,'crm','RetailCRM','common\\api\\RetailCRM'),(4,'crm','Bitrix','common\\api\\Bitrix'),(5,'crm_telephony','PipeDrive','common\\api\\PipeDriveTelephony'),(6,'crm_telephony','Bitrix','common\\api\\BitrixTelephony'),(7,'crm_partner','PipeDrive','common\\api\\PipeDrivePartner'),(8,'crm','PipeDrive','common\\api\\PipeDrive');
/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration_status_map`
--

DROP TABLE IF EXISTS `integration_status_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration_status_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `integration_id` int(11) NOT NULL,
  `status_type` int(11) NOT NULL,
  `integration_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `local_status` int(11) NOT NULL,
  `local_sub_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration_status_map`
--

LOCK TABLES `integration_status_map` WRITE;
/*!40000 ALTER TABLE `integration_status_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration_status_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead`
--

DROP TABLE IF EXISTS `lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `enterpreneur_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `address_information` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_information` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `sub_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `crm_id` int(11) DEFAULT '0',
  `delivery_id` int(11) DEFAULT '0',
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `information` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leadgen_status` smallint(6) DEFAULT NULL,
  `paid_per_lead` smallint(6) DEFAULT '0',
  `utm_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid_per_lead_time` int(11) DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `pay_type` smallint(6) DEFAULT '0',
  `pay_price` float DEFAULT NULL,
  `is_test` smallint(6) DEFAULT '0',
  `has_error` smallint(6) DEFAULT '0',
  `offer_state` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lead_status_history`
--

DROP TABLE IF EXISTS `lead_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `lead_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `sub_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_status_history`
--

LOCK TABLES `lead_status_history` WRITE;
/*!40000 ALTER TABLE `lead_status_history` DISABLE KEYS */;
INSERT INTO `lead_status_history` VALUES (1,1,1,1,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 0\n    [updated_at] => 1575471183\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1575472478,1575472478),(2,1,2,1,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 0\n    [updated_at] => 1575472026\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1575473327,1575473327),(3,1,3,40,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => -10\n    [updated_at] => 1575472141\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1575473487,1575473487),(4,1,4,1,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 0\n    [updated_at] => 1575902135\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1575902630,1575902630),(5,1,5,1,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 0\n    [updated_at] => 1575985980\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1575986015,1575986015),(6,1,6,35,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 0\n    [updated_at] => 1576844959\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1576844984,1576844984),(7,1,4,0,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [status] => 1\n    [updated_at] => 1575902630\n    [crm_id] => 0\n    [delivery_id] => 0\n    [leadgen_status] => \n)\n',1576854461,1576854461),(8,0,4,1,NULL,NULL,1576854934,1576854934),(9,1,4,0,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [status] => 1\n    [updated_at] => 1576854934\n    [crm_id] => 35807\n    [delivery_id] => 0\n    [leadgen_status] => \n)\n',1576855040,1576855040),(10,1,4,50,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [status] => 0\n    [updated_at] => 1576855040\n    [crm_id] => 35807\n    [delivery_id] => 0\n    [leadgen_status] => \n)\n',1576855113,1576855113),(11,1,8,0,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [name] => [TPLD] тест блэк лист 3\n    [phone] => 1576844954\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 35\n    [updated_at] => 1576845010\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1576855132,1576855132),(12,1,8,50,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [status] => 0\n    [updated_at] => 1576855132\n    [crm_id] => 0\n    [delivery_id] => 0\n    [leadgen_status] => \n)\n',1576856347,1576856347),(13,1,9,50,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => 0\n    [updated_at] => 1579274106\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1579274155,1579274155),(14,1,10,-1,NULL,'Array\n(\n    [status] => 0\n    [updated_at] => 1579280516\n)\n',1579526674,1579526674),(15,1,11,-1,NULL,'Array\n(\n    [status] => 0\n    [updated_at] => 1579508327\n)\n',1579526680,1579526680),(16,1,12,-1,NULL,'Array\n(\n    [status] => 0\n    [updated_at] => 1579520900\n)\n',1579526687,1579526687),(17,1,15,1,NULL,'Array\n(\n    [enterpreneur_id] => 4\n    [city] => \n    [street] => \n    [house] => \n    [apt] => \n    [address_information] => \n    [status] => -10\n    [updated_at] => 1579547204\n    [crm_id] => 0\n    [delivery_id] => 0\n    [information] => \n    [leadgen_status] => \n)\n',1579547571,1579547571);
/*!40000 ALTER TABLE `lead_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadgen_entrepreneur`
--

DROP TABLE IF EXISTS `leadgen_entrepreneur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leadgen_entrepreneur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leadgen_id` int(11) NOT NULL,
  `entrepreneur_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadgen_entrepreneur`
--

LOCK TABLES `leadgen_entrepreneur` WRITE;
/*!40000 ALTER TABLE `leadgen_entrepreneur` DISABLE KEYS */;
INSERT INTO `leadgen_entrepreneur` VALUES (1,10,9,1580201656,1580215533),(2,5,4,1580306208,1580306208);
/*!40000 ALTER TABLE `leadgen_entrepreneur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1575469045),('m130524_201442_init',1575469050),('m140506_102106_rbac_init',1575469112),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1575469112),('m180523_151638_rbac_updates_indexes_without_prefix',1575469112),('m181128_081828_create_order_table',1575469050),('m181203_135611_add_user_integration_table',1575469050),('m181213_085029_create_category_to_match_table',1575469050),('m181218_120224_add_ids',1575469051),('m181221_141605_add_country_to_user',1575469051),('m190114_071503_add_fields_to_leads',1575469051),('m190114_144152_add_fields_to_category',1575469052),('m190116_105514_add_leadgen_statuses',1575469052),('m190125_130500_add_utm_labels_to_lead',1575469053),('m190128_111031_add_offers_tables',1575469053),('m190206_091838_add_lead_status_history',1575469053),('m190208_072156_add_is_active_to_offer',1575469053),('m190210_192220_add_offer_payment_geo_table',1575469054),('m190211_150922_add_postback_url_to_user',1575469054),('m190214_083118_update_lead_table',1575469054),('m190218_221746_create_offer_landing_geo_table',1575469054),('m190221_170129_update_lead_table',1575469055),('m190223_002220_update_user_table',1575469056),('m190227_192423_add_delivery_to_user',1575469056),('m190306_204640_update_lead_table',1575469057),('m190312_043629_create_notification_table',1575469057),('m190320_060622_create_telegram_tables',1575469058),('m190930_123002_add_bitrix_crm',1575469058),('m191104_115628_create_telephony_access',1575469058),('m191105_081447_add_integration_for_telephony',1575469058),('m191113_190905_create_integration_status_map_table',1575469058),('m191128_093124_create_telephony_record',1575469058),('m191230_082402_telephony_app_data',1577697080),('m200123_083826_add_integration_for_partner',1579859200),('m200128_083611_create_leadgen_entrepreneur_table',1580201626),('m200128_120810_add_pipedrive_crm',1580213951);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` varchar(512) DEFAULT NULL,
  `is_checked` smallint(6) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(450) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approve_price` float NOT NULL,
  `buyout_price` float NOT NULL,
  `cr1` float DEFAULT NULL,
  `cr2` float DEFAULT NULL,
  `epc` float NOT NULL,
  `approve_percent` float NOT NULL,
  `public_access` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `is_active` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_geo`
--

DROP TABLE IF EXISTS `offer_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_geo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `country_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_geo`
--

LOCK TABLES `offer_geo` WRITE;
/*!40000 ALTER TABLE `offer_geo` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_landing`
--

DROP TABLE IF EXISTS `offer_landing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_landing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr1` float DEFAULT NULL,
  `cr2` float DEFAULT NULL,
  `epc` float DEFAULT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_landing`
--

LOCK TABLES `offer_landing` WRITE;
/*!40000 ALTER TABLE `offer_landing` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_landing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_landing_geo`
--

DROP TABLE IF EXISTS `offer_landing_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_landing_geo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_landing_id` int(11) NOT NULL,
  `country_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_landing_geo`
--

LOCK TABLES `offer_landing_geo` WRITE;
/*!40000 ALTER TABLE `offer_landing_geo` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_landing_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_payout`
--

DROP TABLE IF EXISTS `offer_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_payout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approve_price` float NOT NULL,
  `buyout_price` float NOT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `is_inherit_geo` smallint(6) DEFAULT '0',
  `is_cost` smallint(6) DEFAULT '0',
  `is_test` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_payout`
--

LOCK TABLES `offer_payout` WRITE;
/*!40000 ALTER TABLE `offer_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_payout_geo`
--

DROP TABLE IF EXISTS `offer_payout_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_payout_geo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_payout_id` int(11) NOT NULL,
  `country_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_payout_geo`
--

LOCK TABLES `offer_payout_geo` WRITE;
/*!40000 ALTER TABLE `offer_payout_geo` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_payout_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_user`
--

DROP TABLE IF EXISTS `offer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_user`
--

LOCK TABLES `offer_user` WRITE;
/*!40000 ALTER TABLE `offer_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_user_landing`
--

DROP TABLE IF EXISTS `offer_user_landing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_user_landing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `offer_landing_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_user_landing`
--

LOCK TABLES `offer_user_landing` WRITE;
/*!40000 ALTER TABLE `offer_user_landing` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_user_landing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_has_shop_item`
--

DROP TABLE IF EXISTS `order_has_shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_has_shop_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_shop_item`
--

LOCK TABLES `order_has_shop_item` WRITE;
/*!40000 ALTER TABLE `order_has_shop_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_has_shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_item`
--

DROP TABLE IF EXISTS `shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `upsale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `additional_information` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_item`
--

LOCK TABLES `shop_item` WRITE;
/*!40000 ALTER TABLE `shop_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_item_image`
--

DROP TABLE IF EXISTS `shop_item_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_item_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_item_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_item_image`
--

LOCK TABLES `shop_item_image` WRITE;
/*!40000 ALTER TABLE `shop_item_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_item_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariff`
--

DROP TABLE IF EXISTS `tariff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` float DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariff`
--

LOCK TABLES `tariff` WRITE;
/*!40000 ALTER TABLE `tariff` DISABLE KEYS */;
/*!40000 ALTER TABLE `tariff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_botan_shortener`
--

DROP TABLE IF EXISTS `telegram_botan_shortener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_botan_shortener` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_botan_shortener`
--

LOCK TABLES `telegram_botan_shortener` WRITE;
/*!40000 ALTER TABLE `telegram_botan_shortener` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_botan_shortener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_callback_query`
--

DROP TABLE IF EXISTS `telegram_callback_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_callback_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `chat_id` bigint(20) DEFAULT NULL,
  `message_id` bigint(20) DEFAULT NULL,
  `inline_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_callback_query`
--

LOCK TABLES `telegram_callback_query` WRITE;
/*!40000 ALTER TABLE `telegram_callback_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_callback_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_chat`
--

DROP TABLE IF EXISTS `telegram_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `all_members_are_administrators` smallint(1) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_chat`
--

LOCK TABLES `telegram_chat` WRITE;
/*!40000 ALTER TABLE `telegram_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_conversation`
--

DROP TABLE IF EXISTS `telegram_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `chat_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `command` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_conversation`
--

LOCK TABLES `telegram_conversation` WRITE;
/*!40000 ALTER TABLE `telegram_conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_edited_message`
--

DROP TABLE IF EXISTS `telegram_edited_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_edited_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) DEFAULT NULL,
  `message_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_edited_message`
--

LOCK TABLES `telegram_edited_message` WRITE;
/*!40000 ALTER TABLE `telegram_edited_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_edited_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_inline_query`
--

DROP TABLE IF EXISTS `telegram_inline_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_inline_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_inline_query`
--

LOCK TABLES `telegram_inline_query` WRITE;
/*!40000 ALTER TABLE `telegram_inline_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_inline_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_message`
--

DROP TABLE IF EXISTS `telegram_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `forward_from` int(11) DEFAULT NULL,
  `forward_from_chat` int(11) DEFAULT NULL,
  `forward_from_message_id` int(11) DEFAULT NULL,
  `forward_date` timestamp NULL DEFAULT NULL,
  `reply_to_chat` int(11) DEFAULT NULL,
  `reply_to_message` int(11) DEFAULT NULL,
  `media_group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sticker` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_chat_members` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `left_chat_member` int(11) DEFAULT NULL,
  `new_chat_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_chat_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_chat_photo` smallint(1) DEFAULT '0',
  `group_chat_created` smallint(1) DEFAULT '0',
  `supergroup_chat_created` smallint(1) DEFAULT '0',
  `channel_chat_created` smallint(1) DEFAULT '0',
  `migrate_to_chat_id` int(11) DEFAULT NULL,
  `migrate_from_chat_id` int(11) DEFAULT NULL,
  `pinned_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `animation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `game` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connected_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_message`
--

LOCK TABLES `telegram_message` WRITE;
/*!40000 ALTER TABLE `telegram_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_request_limiter`
--

DROP TABLE IF EXISTS `telegram_request_limiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_request_limiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) DEFAULT NULL,
  `inline_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_request_limiter`
--

LOCK TABLES `telegram_request_limiter` WRITE;
/*!40000 ALTER TABLE `telegram_request_limiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_request_limiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_telegram_update`
--

DROP TABLE IF EXISTS `telegram_telegram_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_telegram_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) NOT NULL,
  `message_id` bigint(20) DEFAULT NULL,
  `inline_query_id` int(11) DEFAULT NULL,
  `chosen_inline_result_id` int(11) DEFAULT NULL,
  `callback_query_id` int(11) DEFAULT NULL,
  `edited_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_telegram_update`
--

LOCK TABLES `telegram_telegram_update` WRITE;
/*!40000 ALTER TABLE `telegram_telegram_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_telegram_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_user`
--

DROP TABLE IF EXISTS `telegram_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT '1',
  `is_bot` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_user`
--

LOCK TABLES `telegram_user` WRITE;
/*!40000 ALTER TABLE `telegram_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_user_chat`
--

DROP TABLE IF EXISTS `telegram_user_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_user_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `chat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_user_chat`
--

LOCK TABLES `telegram_user_chat` WRITE;
/*!40000 ALTER TABLE `telegram_user_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_user_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephony_app`
--

DROP TABLE IF EXISTS `telephony_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telephony_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephony_app`
--

LOCK TABLES `telephony_app` WRITE;
/*!40000 ALTER TABLE `telephony_app` DISABLE KEYS */;
INSERT INTO `telephony_app` VALUES (1,'1.0','sdfsdfdsf','5e09d97bc7571.apk',1577703803,1577703803),(2,'1.1','sdfdsffsdf','5e09d9c925a45.apk',1577703881,1577703881),(3,'1.2','sdfsdfsdf','5e1328a45ca46.apk',1578313892,1578313892),(6,'1.5','132ewrdfsdf','5e132aa2cc243.png',1578314402,1578314402),(7,'1.6','xsdfdf','5e132bad75cd1.apk',1578314669,1578314669),(8,'1.7','fdgfdg','5e132c6820fde.apk',1578314856,1578314856),(17,'1.9','dgdgdgr','5e1596984bdcf.apk',1578473112,1578473112),(24,'1.15','тест1','5e15f8d14e890.apk',1578498257,1578498257),(25,'1.16','тест2','5e16214c54e12.apk',1578508620,1578508620),(26,'1.17','тест3','5e162546ca322.apk',1578509638,1578509638),(27,'1.13','test','5e16767cae035.apk',1578530428,1578530704),(28,'1.14','test','5e16786b3fcd5.apk',1578530923,1578530923);
/*!40000 ALTER TABLE `telephony_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephony_record`
--

DROP TABLE IF EXISTS `telephony_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telephony_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `record` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephony_record`
--

LOCK TABLES `telephony_record` WRITE;
/*!40000 ALTER TABLE `telephony_record` DISABLE KEYS */;
INSERT INTO `telephony_record` VALUES (1,3,1,'5de8c80214387.amr',1575536642,1575536642),(2,3,2,'5de8c817e93fe.amr',1575536663,1575536663),(3,3,2,'5dee57f223b94.amr',1575901170,1575901170),(4,3,2,'5dee58346e90a.amr',1575901236,1575901236),(5,3,2,'5dee5978f2a3d.amr',1575901560,1575901560),(6,3,2,'5dee9aa4698b5.amr',1575918244,1575918244),(7,3,2,'5dee9ac3b7790.amr',1575918275,1575918275),(8,3,2,'5dee9bb64e89b.amr',1575918518,1575918518),(9,3,4,'5dee9d1e67e17.amr',1575918878,1575918878),(10,3,2,'5dee9d34e4163.amr',1575918900,1575918900),(11,3,2,'5dee9ef9db6b3.amr',1575919353,1575919353),(12,3,2,'5deea9b83a46d.amr',1575922104,1575922104),(13,3,2,'5deea9ecd9d0d.amr',1575922156,1575922156),(14,3,2,'5deeb0bfe35e1.amr',1575923903,1575923903),(15,3,2,'5deeb0d10a87c.amr',1575923921,1575923921),(16,3,4,'5deeb53d4e710.amr',1575925053,1575925053),(17,3,2,'5deeb54cdd02c.amr',1575925068,1575925068),(18,3,2,'5deeb55cec010.amr',1575925084,1575925084),(19,3,2,'5deeb74b909f7.amr',1575925579,1575925579),(20,3,2,'5def97f793fea.amr',1575983095,1575983095),(21,3,4,'5def998e0aae6.amr',1575983502,1575983502),(22,3,2,'5defa04180e47.amr',1575985217,1575985217),(23,3,2,'5defa065c9a70.amr',1575985253,1575985253),(24,3,2,'5defa069c8c71.amr',1575985257,1575985257),(25,3,2,'5defa06d2da17.amr',1575985261,1575985261),(26,3,4,'5defad74d9938.amr',1575988596,1575988596),(27,3,4,'5defbebb315d1.amr',1575993019,1575993019),(28,3,2,'5defbf03395ec.amr',1575993091,1575993091),(29,3,2,'5defbf1251374.amr',1575993106,1575993106),(30,3,4,'5defc80b290c1.amr',1575995403,1575995403),(31,3,2,'5defed1bdc2dc.amr',1576004891,1576004891),(32,3,2,'5defeed40a6c7.amr',1576005332,1576005332),(33,3,2,'5deff1eea82c6.amr',1576006126,1576006126),(34,3,2,'5df02005395cb.amr',1576017925,1576017925),(35,3,2,'5df0201526dd3.amr',1576017941,1576017941),(36,3,4,'5df0aa102be1d.amr',1576053264,1576053264),(37,3,2,'5df0bf9f5dd26.amr',1576058783,1576058783),(38,3,2,'5df0bfafbdade.amr',1576058799,1576058799),(39,3,2,'5df0c31ef28ac.amr',1576059678,1576059678),(40,3,2,'5df0c32d428ce.amr',1576059693,1576059693),(41,3,2,'5df0caefbbd3a.amr',1576061679,1576061679),(42,3,2,'5df0ce1f03c4c.amr',1576062495,1576062495),(43,3,2,'5df0d4ca49266.amr',1576064202,1576064202),(44,3,2,'5df0ec36d988c.amr',1576070198,1576070198),(45,3,2,'5df0f11f95a30.amr',1576071455,1576071455),(46,3,4,'5df0f4bd5a449.amr',1576072381,1576072381),(47,3,2,'5df105ba58d6e.amr',1576076730,1576076730),(48,3,2,'5df1067619c3b.amr',1576076918,1576076918),(49,3,2,'5df11c99de709.amr',1576082585,1576082585),(50,3,2,'5df11cfea5dc1.amr',1576082686,1576082686),(51,3,2,'5df13641dc600.amr',1576089153,1576089153),(52,3,4,'5df13851c3bee.amr',1576089681,1576089681),(53,3,4,'5df13907de662.amr',1576089863,1576089863),(54,3,4,'5df13c58aea53.amr',1576090712,1576090712),(55,3,4,'5df13ce1e6ba7.amr',1576090849,1576090849),(56,3,4,'5df13dc8e12e3.amr',1576091080,1576091080),(57,3,4,'5df13ddd5064e.amr',1576091101,1576091101),(58,3,4,'5df13def85551.amr',1576091119,1576091119),(59,3,4,'5df13e5cafe6c.amr',1576091228,1576091228),(60,3,4,'5df13f2009660.amr',1576091424,1576091424),(61,3,4,'5df13f35a5609.amr',1576091445,1576091445),(62,3,4,'5df13f49db83d.amr',1576091465,1576091465),(63,3,4,'5df13f5f4ea76.amr',1576091487,1576091487),(64,3,4,'5df13f743a3f6.amr',1576091508,1576091508),(65,3,4,'5df1410fc584d.amr',1576091919,1576091919),(66,3,4,'5df1412623a93.amr',1576091942,1576091942),(67,3,4,'5df1413f1dea3.amr',1576091967,1576091967),(68,3,4,'5df1415c58369.amr',1576091996,1576091996),(69,3,4,'5df141bd860c9.amr',1576092093,1576092093),(70,3,4,'5df141d093136.amr',1576092112,1576092112),(71,3,4,'5df1426862551.amr',1576092264,1576092264),(72,3,4,'5df1427ee7b7a.amr',1576092286,1576092286),(73,3,4,'5df1487d2d042.amr',1576093821,1576093821),(74,3,4,'5df148cd4e31d.amr',1576093901,1576093901),(75,3,4,'5df14fb345b5b.amr',1576095667,1576095667),(76,3,2,'5df15dd723523.amr',1576099287,1576099287),(77,3,2,'5df15feea4ecc.amr',1576099822,1576099822),(78,3,2,'5df1612707806.amr',1576100135,1576100135),(79,3,2,'5df16172c8f94.amr',1576100210,1576100210),(80,3,2,'5df16181e3b96.amr',1576100225,1576100225),(81,3,2,'5df1618d47b69.amr',1576100237,1576100237),(82,3,2,'5df1619c68f9c.amr',1576100252,1576100252),(83,3,2,'5df161a88f93f.amr',1576100264,1576100264),(84,3,4,'5df21b8989f2a.amr',1576147849,1576147849),(85,3,4,'5df21c341f790.amr',1576148020,1576148020),(86,3,4,'5df21c481f0f4.amr',1576148040,1576148040),(87,3,4,'5df21c5ea1177.amr',1576148062,1576148062),(88,3,4,'5df21c723e939.amr',1576148082,1576148082),(89,3,4,'5df21c83baf45.amr',1576148099,1576148099),(90,3,4,'5df21dd7ce5cf.amr',1576148439,1576148439),(91,3,4,'5df21e5857771.amr',1576148568,1576148568),(92,3,4,'5df21e7291e8e.amr',1576148594,1576148594),(93,3,4,'5df21e866b47a.amr',1576148614,1576148614),(94,3,4,'5df21e9c5d6c3.amr',1576148636,1576148636),(95,3,4,'5df21eadf26de.amr',1576148653,1576148653),(96,3,4,'5df22c31b465a.amr',1576152113,1576152113),(97,3,4,'5df22c4430674.amr',1576152132,1576152132),(98,3,2,'5df2598b45825.amr',1576163723,1576163723),(99,3,2,'5df25cbe93d3a.amr',1576164542,1576164542),(100,3,2,'5df25f85b1ec6.amr',1576165253,1576165253),(101,3,2,'5df382519675e.amr',1576239697,1576239697),(102,3,2,'5df38280623fe.amr',1576239744,1576239744),(103,3,4,'5df3a33c34bab.amr',1576248124,1576248124),(104,3,4,'5df3a35ccc373.amr',1576248156,1576248156),(105,3,4,'5df3a37d39502.amr',1576248189,1576248189),(106,3,4,'5df3a3b52aa76.amr',1576248245,1576248245),(107,3,4,'5df3a3c6eeea3.amr',1576248262,1576248262),(108,3,4,'5df3a3da7098c.amr',1576248282,1576248282),(109,3,4,'5df3a3eb9b910.amr',1576248299,1576248299),(110,3,4,'5df3a3fc5426d.amr',1576248316,1576248316),(111,3,4,'5df3a426a3ec4.amr',1576248358,1576248358),(112,3,4,'5df3a437d3262.amr',1576248375,1576248375),(113,3,4,'5df3a44976c66.amr',1576248393,1576248393),(114,3,4,'5df3a470927bc.amr',1576248432,1576248432),(115,3,5,'5df75dc6e1407.wav',1576492486,1576492486),(116,3,5,'5df75dffc2f2a.wav',1576492543,1576492543),(117,3,2,'5df902103e163.amr',1576600080,1576600080),(118,3,2,'5df902bba6f40.amr',1576600251,1576600251),(119,3,2,'5df904676f016.amr',1576600679,1576600679),(120,3,0,'5df90bb438b17.amr',1576602548,1576602548),(121,3,0,'5df92b41b95f0.amr',1576610625,1576610625),(122,3,0,'5df92b9501bfb.amr',1576610709,1576610709),(123,3,0,'5df95ea77ffae.amr',1576623783,1576623783),(124,3,0,'5dfbe3d682f60.amr',1576788950,1576788950),(125,3,0,'5dfbe3dde9445.amr',1576788957,1576788957),(126,3,0,'5dfbe3e1f3288.amr',1576788961,1576788961),(127,3,0,'5dfbe98614020.amr',1576790406,1576790406),(128,3,0,'5dfbe98bbe6bc.amr',1576790411,1576790411),(129,3,0,'5dfbe997889b5.amr',1576790423,1576790423),(130,3,0,'5dfbe99c61184.amr',1576790428,1576790428),(131,3,0,'5dfbe99fac4fa.amr',1576790431,1576790431),(132,3,0,'5dfbe9a1b1628.amr',1576790433,1576790433),(133,3,0,'5dfbe9a3ce9b5.amr',1576790435,1576790435),(134,3,0,'5dfbe9a5c0554.amr',1576790437,1576790437),(135,3,0,'5dfbe9adb3f54.amr',1576790445,1576790445),(136,3,35807,'5dff682b3c874.amr',1577019435,1577019435),(137,3,35807,'5dff682fd2c0a.amr',1577019439,1577019439),(138,3,35807,'5dff68359c9d6.amr',1577019445,1577019445),(139,3,0,'5dff7629e2f79.amr',1577023017,1577023017),(140,3,0,'5dff7643b63ae.amr',1577023043,1577023043),(141,3,0,'5dff7c54a6854.amr',1577024596,1577024596),(142,3,35807,'5dff7c73d356e.amr',1577024627,1577024627),(143,3,0,'5dff7cbc429dd.amr',1577024700,1577024700),(144,3,0,'5dff7e2052e4a.amr',1577025056,1577025056),(145,3,0,'5dff7eb58ed78.amr',1577025205,1577025205),(146,3,0,'5dff7f945f8cb.amr',1577025428,1577025428),(147,3,0,'5dff80a159e9b.amr',1577025697,1577025697),(148,3,0,'5dff81a138096.amr',1577025953,1577025953),(149,3,0,'5dff822122b18.amr',1577026081,1577026081),(150,3,35807,'5dff8264037d8.amr',1577026148,1577026148),(151,3,0,'5dff8269cddbf.amr',1577026153,1577026153),(152,3,0,'5dff8273dce8b.amr',1577026163,1577026163),(153,3,35807,'5dff827c41991.amr',1577026172,1577026172),(154,3,35807,'5dff82c3156e0.amr',1577026243,1577026243),(155,3,35807,'5dff83cd9a992.amr',1577026509,1577026509),(156,3,0,'5e2610e94dc93.amr',1579553001,1579553001),(157,3,0,'5e2612bb24b91.amr',1579553467,1579553467),(158,3,0,'5e2652ef52766.amr',1579569903,1579569903),(159,3,0,'5e2652fd83acf.amr',1579569917,1579569917),(160,3,0,'5e2653672e47b.amr',1579570023,1579570023),(161,3,0,'5e26537d2e5fc.amr',1579570045,1579570045),(162,3,0,'5e27383ce148b.amr',1579628604,1579628604),(163,3,0,'5e275d0ae6ddc.amr',1579638026,1579638026),(164,3,0,'5e275d53ca707.amr',1579638099,1579638099),(165,3,0,'5e2761ae5342b.amr',1579639214,1579639214),(166,3,0,'5e2762145124c.amr',1579639316,1579639316),(167,3,0,'5e2775a507965.amr',1579644325,1579644325),(168,3,0,'5e28516b2f540.amr',1579700587,1579700587),(169,3,0,'5e2851a100df9.amr',1579700641,1579700641),(170,3,0,'5e2853d18c6bc.amr',1579701201,1579701201),(171,3,0,'5e28544ff2840.amr',1579701327,1579701327),(172,3,0,'5e28550300adc.amr',1579701507,1579701507),(173,3,0,'5e285624b3f11.amr',1579701796,1579701796),(174,3,0,'5e285672d16cf.amr',1579701874,1579701874),(175,3,0,'5e28cdd8cfc46.amr',1579732440,1579732440),(176,3,0,'5e28d8c5b3334.amr',1579735237,1579735237),(177,3,0,'5e28d9124a51a.amr',1579735314,1579735314);
/*!40000 ALTER TABLE `telephony_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephony_user_lead`
--

DROP TABLE IF EXISTS `telephony_user_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telephony_user_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `is_auto` smallint(6) DEFAULT '1',
  `is_active` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephony_user_lead`
--

LOCK TABLES `telephony_user_lead` WRITE;
/*!40000 ALTER TABLE `telephony_user_lead` DISABLE KEYS */;
INSERT INTO `telephony_user_lead` VALUES (1,3,1,1,0,1575472681,1576682401),(2,3,2,1,0,1575473341,1576683002),(3,3,4,1,0,1575902641,1577112361),(4,3,5,1,0,1575986041,1577195761),(5,3,8,1,0,1576856402,1578066121),(6,3,9,1,1,1579274162,1579274162),(7,3,15,1,1,1579547641,1579547641);
/*!40000 ALTER TABLE `telephony_user_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `balance` float DEFAULT '0',
  `is_admin` tinyint(3) DEFAULT NULL,
  `lead_tarif_id` int(11) DEFAULT NULL,
  `platform_tarif_id` int(11) DEFAULT NULL,
  `integration_crm_id` int(11) DEFAULT NULL,
  `integration_delivery_id` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `country` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` smallint(6) DEFAULT NULL,
  `postback_url_new` text COLLATE utf8_unicode_ci,
  `postback_url_update` text COLLATE utf8_unicode_ci,
  `approved_leads_fee` float DEFAULT NULL,
  `royalty_type` smallint(6) DEFAULT '0',
  `royalty_price` float DEFAULT NULL,
  `royalty_percent` float DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telegram_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','czXj2tljKtBT52ZvD32c0xAqwBQttDsw','$2y$13$MpgeErU6IPUmVRKKX/e7FuvB4FVP0jcZeynzS..5k5ndByly4nUqu',NULL,'admin@admin.admin','mglhjVQUh42CZ9E2uk0_6EZtZIDazeuz',10,0,NULL,NULL,NULL,NULL,NULL,1575469221,1577357614,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(2,'financier','IByp-i9Lz0fLR2iwEk-fHDOeUn8QXpiY','$2y$13$hKe08kDPxm2l0H7weaTgR.nQ5WyvxqmqJL64zlyp5HG0EAZWhzhxq',NULL,'financier@financier.financier',NULL,10,0,NULL,NULL,NULL,NULL,NULL,1575469231,1575469231,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),(3,'operator1','MGpHgBo2-kcXvMfK52ZcWN32nzw16mZV','$2y$13$kYLgzCn.OTaJ9imeEvvJdeXgWoe/93Tzw9KEsDgDqO5P899m4Wqye',NULL,'operator1@plado.market','CXklL8uZ0HoSnY7v-fI3HsiXedrsjZPt',10,0,NULL,NULL,NULL,NULL,NULL,1575469397,1579628291,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(4,'entrepreneur','OkjTJTu64hIH27PrQVjD9V5aixz3Q5Tn','$2y$13$rRG6pHK7iieo675673h5zeaf.8emvWjfwm9AbSIGZ7gu1olVT5A82',NULL,'entrepreneur@plado.market',NULL,10,0,NULL,NULL,NULL,NULL,NULL,1575469424,1575470920,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(5,'leadgen','WPwz3NQUp5mKBmMio7Jg4uvSTcYILqff','$2y$13$hZqVj2dIU6JCQAt9TEi0g.eT6GCPAoBDBJhBLtBdzQGacrebVtor2',NULL,'leadgen@plado.market','T1oz9tTeSbUSUXsWe2vv9VlsTzLWbMMJ',10,0,NULL,NULL,NULL,NULL,NULL,1575469464,1575471101,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(6,'operator2','o5iwWXWHu9EeOxRwXbDzrkH_0swM9cqi','$2y$13$HH.2/n/de9oeYNXmwp915OMX9cRRLBZ961wDuT3B350mAkGBlhIr6',NULL,'operator2t@plado.market',NULL,10,0,NULL,NULL,NULL,NULL,NULL,1578509237,1578510386,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(7,'operator3','FNincONrbw3SXDNWKpRgtGiLyvvysCQW','$2y$13$feXGF0B7c1W9i0qM4mJ2AeotxgeHbJBmHgZkI1/dioha6s.4GGbiu',NULL,'operator3t@plado.com','PgGFlplQEbl267_IeHdCprJKLIU5XcAG',10,0,NULL,NULL,NULL,NULL,NULL,1578511262,1578568587,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(8,'Test organization','Qm8sHt8p7AX-MQxcxv4bbkqADwW8stMN','$2y$13$bhIWtFrN3A6qpHXAiMipz.VuX2X.6ZyGDltAdmjeiQOAedVRcOKVK',NULL,'partner01@plado.market',NULL,10,0,NULL,NULL,NULL,NULL,NULL,1579769096,1579770229,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(9,'entrepreneur_pd','6ieJvrZHjNqBqBdTLVWhaGHDFV5oY21g','$2y$13$YW97FutGmXpj2udzrKERt.SgzTLFAePGiZUHozkG8aCjJzUzR6UiK',NULL,'entrepreneur_pd@plado.market',NULL,10,0,NULL,NULL,NULL,NULL,NULL,1580201570,1580201580,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL),(10,'leadgen_pd','YQ2-mCK5HLEKgxYcAI1cr06nBGTYErmO','$2y$13$Mof4nVl/wp9WbNe/IUMZFOhzxAQEZ6kNlrJmW2htlQW25N77oGPxS',NULL,'leadgen_pd@plado.market','69KEbtZVExuz8-MMgOoWjxLSd5p1iem4',10,0,NULL,NULL,NULL,NULL,NULL,1580214583,1580215086,'uz',1,NULL,NULL,NULL,0,NULL,NULL,'','',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_app`
--

DROP TABLE IF EXISTS `user_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_app`
--

LOCK TABLES `user_app` WRITE;
/*!40000 ALTER TABLE `user_app` DISABLE KEYS */;
INSERT INTO `user_app` VALUES (2,3,1,1578310947,1578310947),(3,3,2,1578313264,1578313264),(4,3,5,1578314174,1578314174),(5,3,6,1578314402,1578314402),(6,3,7,1578314669,1578314669),(7,3,8,1578314856,1578314856),(8,3,9,1578431571,1578431571),(9,3,10,1578437036,1578437036),(14,3,11,1578440814,1578440814),(16,3,12,1578441957,1578441957),(17,3,13,1578442056,1578442056),(18,3,14,1578442346,1578442346),(22,3,15,1578480098,1578480098),(23,3,18,1578480216,1578480216),(24,3,19,1578480837,1578480837),(25,3,20,1578480994,1578480994),(26,3,21,1578483422,1578483422),(27,3,22,1578483603,1578483603),(28,3,23,1578483698,1578483698),(29,3,24,1578498257,1578498257),(30,3,25,1578508620,1578508620),(32,6,26,1578511288,1578511288),(33,7,26,1578511288,1578511288),(35,3,27,1578530704,1578530704),(36,3,28,1578530923,1578530923);
/*!40000 ALTER TABLE `user_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_balance_history`
--

DROP TABLE IF EXISTS `user_balance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_balance_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sum` float NOT NULL,
  `status` int(11) NOT NULL,
  `bundle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_balance_history`
--

LOCK TABLES `user_balance_history` WRITE;
/*!40000 ALTER TABLE `user_balance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_balance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_category_to_match`
--

DROP TABLE IF EXISTS `user_has_category_to_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_category_to_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_to_match_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_category_to_match`
--

LOCK TABLES `user_has_category_to_match` WRITE;
/*!40000 ALTER TABLE `user_has_category_to_match` DISABLE KEYS */;
INSERT INTO `user_has_category_to_match` VALUES (1,4,1),(3,5,1),(5,9,1),(7,10,1);
/*!40000 ALTER TABLE `user_has_category_to_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_integration`
--

DROP TABLE IF EXISTS `user_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `integration_id` int(11) DEFAULT NULL,
  `config` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_integration`
--

LOCK TABLES `user_integration` WRITE;
/*!40000 ALTER TABLE `user_integration` DISABLE KEYS */;
INSERT INTO `user_integration` VALUES (1,3,6,'{\"userId\":\"11\"}',NULL,1575472680,1575472680),(2,4,4,'{\"domain\":\"https:\\/\\/pld.bitrix24.ru\",\"webmasterId\":\"123\",\"token\":\"hzkzranx2hckjqw5\"}',NULL,1576854799,1576854799),(3,8,7,'{\"organizationId\":\"13\"}',NULL,1579859323,1579859323),(4,9,8,'{\"token\":\"a865ffe66d283494ed5a92e264dde9dd0916fbfa\"}',NULL,1580213990,1580213990);
/*!40000 ALTER TABLE `user_integration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29 13:57:35
