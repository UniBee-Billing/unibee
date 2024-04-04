/*
 Navicat Premium Data Transfer

 Source Server         : unibee-stage-mysql
 Source Server Type    : MySQL
 Source Server Version : 80013 (8.0.13)
 Source Host           : api.unibee.top:13306
 Source Schema         : unib

 Target Server Type    : MySQL
 Target Server Version : 80013 (8.0.13)
 File Encoding         : 65001

 Date: 04/04/2024 15:50:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for country_rate
-- ----------------------------
DROP TABLE IF EXISTS `country_rate`;
CREATE TABLE `country_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `gateway` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'vat gateway name, em vatsense',
  `country_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'country_code',
  `country_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'country_name',
  `latitude` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'latitude',
  `longitude` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'longitude',
  `vat` int(11) NOT NULL DEFAULT '0' COMMENT 'vat contains，1-yes，2-no',
  `eu` int(11) NOT NULL DEFAULT '0' COMMENT 'is eu member state, 1-yes, 2-no',
  `standard_tax_percentage` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Standard Tax Scale，1000 = 10%',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'other rates(json)',
  `standard_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'standard_description',
  `standard_types` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'standard_typs ',
  `provinces` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Whether the country has provinces with provincial sales tax',
  `mamo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mamo',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`merchant_id`,`gateway`,`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1419 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Country Rate';

-- ----------------------------
-- Table structure for email_default_template
-- ----------------------------
DROP TABLE IF EXISTS `email_default_template`;
CREATE TABLE `email_default_template` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_attach_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_default_template_unique` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Email Default Template';

-- ----------------------------
-- Table structure for file_upload
-- ----------------------------
DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='File Upload';

-- ----------------------------
-- Table structure for gateway_http_log
-- ----------------------------
DROP TABLE IF EXISTS `gateway_http_log`;
CREATE TABLE `gateway_http_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'request url',
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'request body(json)',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'response(json)',
  `request_id` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'request_id',
  `mamo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mamo',
  `gateway_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'gateway_id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Channel Http Log';

-- ----------------------------
-- Table structure for gateway_user
-- ----------------------------
DROP TABLE IF EXISTS `gateway_user`;
CREATE TABLE `gateway_user` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `user_id` bigint(64) unsigned NOT NULL COMMENT 'userId',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `gateway_user_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway_user_Id',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `gateway_default_payment_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway_default_payment_method',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gateway_user_unique` (`user_id`,`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Channel User';

-- ----------------------------
-- Table structure for gateway_vat_rate
-- ----------------------------
DROP TABLE IF EXISTS `gateway_vat_rate`;
CREATE TABLE `gateway_vat_rate` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `vat_rate_id` bigint(64) NOT NULL COMMENT 'vat_rate_id',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `gateway_vat_rate_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway_vat_rate_Id',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gateway_vat_rate_unique` (`vat_rate_id`,`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Channel Vat Rate';

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant_id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'userId',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription_id',
  `invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'invoice_id',
  `invoice_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice name',
  `unique_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique_id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `total_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'total amount, cent',
  `tax_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'tax amount,cent',
  `subscription_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sub amount,cent',
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `lines` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'lines( json)',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'status，0-Init | 1-pending｜2-processing｜3-paid | 4-failed | 5-cancelled ',
  `send_status` int(11) NOT NULL DEFAULT '0' COMMENT 'email send status，0-No | 1- YES| 2-Unnecessary',
  `send_email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'email',
  `send_pdf` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'pdf link',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `link` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice link',
  `payment_link` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice payment link',
  `gateway_status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_payment_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_invoice_pdf` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_scale` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Tax scale，1000 = 10%',
  `send_note` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'send_note',
  `send_terms` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'send_terms',
  `total_amount_excluding_tax` bigint(20) NOT NULL DEFAULT '0',
  `subscription_amount_excluding_tax` bigint(20) NOT NULL DEFAULT '0',
  `period_start` bigint(20) DEFAULT '0' COMMENT 'period_start, utc time',
  `period_end` bigint(20) DEFAULT '0' COMMENT 'period_end utc time',
  `period_start_time` timestamp NULL DEFAULT NULL,
  `period_end_time` timestamp NULL DEFAULT NULL,
  `payment_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paymentId',
  `refund_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'refundId',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'data (json)',
  `biz_type` int(11) DEFAULT NULL COMMENT 'biz type from payment 1-single payment, 3-subscription',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `crypto_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'crypto_amount, cent',
  `crypto_currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'crypto_currency',
  `finish_time` bigint(20) DEFAULT NULL COMMENT 'utc time of enter process ',
  `day_util_due` bigint(20) DEFAULT '3' COMMENT 'day util due after process',
  `last_track_time` bigint(20) DEFAULT NULL COMMENT 'last process invoice track time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `invoice_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Invoice';

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'merchant_id',
  `company_id` bigint(64) DEFAULT NULL COMMENT 'company_id',
  `user_id` bigint(64) DEFAULT NULL COMMENT 'create_user_id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'type',
  `company_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'company_name',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'email',
  `business_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'business_num',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'name',
  `idcard` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'idcard',
  `location` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'location',
  `address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'address',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `company_logo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'company_logo',
  `home_url` varchar(200) DEFAULT NULL,
  `phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'phone',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `time_zone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'merchant default time zone',
  `host` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'merchant user portal host',
  `api_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'merchant open api key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15656 DEFAULT CHARSET=utf8 COMMENT='Merchant';

-- ----------------------------
-- Table structure for merchant_config
-- ----------------------------
DROP TABLE IF EXISTS `merchant_config`;
CREATE TABLE `merchant_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT 'merchantId',
  `config_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'config_key',
  `config_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'config_value',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_config_unique` (`merchant_id`,`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=15714 DEFAULT CHARSET=utf8 COMMENT='Merchant Config';

-- ----------------------------
-- Table structure for merchant_country_config
-- ----------------------------
DROP TABLE IF EXISTS `merchant_country_config`;
CREATE TABLE `merchant_country_config` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `country_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `merchant_country_config_unique` (`merchant_id`,`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Merchant Country Config';

-- ----------------------------
-- Table structure for merchant_email_history
-- ----------------------------
DROP TABLE IF EXISTS `merchant_email_history`;
CREATE TABLE `merchant_email_history` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach_file` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4649 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Email History';

-- ----------------------------
-- Table structure for merchant_email_template
-- ----------------------------
DROP TABLE IF EXISTS `merchant_email_template`;
CREATE TABLE `merchant_email_template` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `template_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_attach_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `status` bigint(20) NOT NULL DEFAULT '0' COMMENT '0-Active,1-InActive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `merchant_email_template_unique` (`merchant_id`,`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Email Template';

-- ----------------------------
-- Table structure for merchant_gateway
-- ----------------------------
DROP TABLE IF EXISTS `merchant_gateway`;
CREATE TABLE `merchant_gateway` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'gateway_id',
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant_id',
  `enum_key` bigint(20) DEFAULT '0' COMMENT 'enum key , match in gateway implementation',
  `gateway_type` bigint(11) NOT NULL DEFAULT '1' COMMENT 'gateway type，1-Default｜ 2-Crypto',
  `gateway_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway name',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'name',
  `sub_gateway` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sub_gateway_enum',
  `brand_data` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway logo',
  `host` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pay host',
  `gateway_account_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway account id',
  `gateway_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gateway_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'secret',
  `custom` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'custom',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'description',
  `webhook_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'webhook_key',
  `webhook_secret` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'webhook_secret',
  `unique_product_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'unique  gateway productId, only stripe need',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `crypto_receive_currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_gateway_unique` (`merchant_id`,`gateway_name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Merchant Channel Config   Grab：https://developer.grab.com/docs/payment-otc/api/v2/#tag/otc-api   Klarna：https://docs.adyen.com/api-explorer/Checkout/latest/post/payments';

-- ----------------------------
-- Table structure for merchant_member
-- ----------------------------
DROP TABLE IF EXISTS `merchant_member`;
CREATE TABLE `merchant_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'userId',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `merchant_id` bigint(64) unsigned NOT NULL COMMENT 'merchant id',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'password',
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user name',
  `mobile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mobile',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email',
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'first name',
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'last name',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'role',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_member_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Merchant Member';

-- ----------------------------
-- Table structure for merchant_metric
-- ----------------------------
DROP TABLE IF EXISTS `merchant_metric`;
CREATE TABLE `merchant_metric` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT 'merchantId',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code',
  `metric_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'metric name',
  `metric_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'metric description',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1-limit_metered，2-charge_metered(come later),3-charge_recurring(come later)',
  `aggregation_type` int(11) NOT NULL DEFAULT '0' COMMENT '1-count，2-count unique, 3-latest, 4-max, 5-sum',
  `aggregation_property` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'aggregation property',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_metric_unique` (`merchant_id`,`code`,`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=15695 DEFAULT CHARSET=utf8 COMMENT='Merchant Metric';

-- ----------------------------
-- Table structure for merchant_metric_event
-- ----------------------------
DROP TABLE IF EXISTS `merchant_metric_event`;
CREATE TABLE `merchant_metric_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `merchant_id` bigint(64) unsigned NOT NULL COMMENT 'merchantId',
  `metric_id` bigint(64) unsigned NOT NULL COMMENT 'metric_id',
  `external_event_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'external_event_id, should be unique',
  `user_id` bigint(64) NOT NULL COMMENT 'user_id',
  `aggregation_property_int` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'aggregation property int, use for metric of max|sum type ',
  `aggregation_property_string` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'aggregation property string, use for metric of count|count_unique type ',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `aggregation_property_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'aggregation property data (Json)',
  `aggregation_property_unique_id` varchar(500) DEFAULT NULL,
  `subscription_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subscription_period_start` bigint(20) DEFAULT NULL COMMENT 'matched subscription''s current_period_start',
  `subscription_period_end` bigint(20) DEFAULT NULL COMMENT 'matched subscription''s current_period_end',
  `metric_limit` bigint(20) unsigned DEFAULT NULL,
  `used` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_metric_event_unique` (`aggregation_property_unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15697 DEFAULT CHARSET=utf8 COMMENT='Merchant Metric Event';

-- ----------------------------
-- Table structure for merchant_metric_plan_limit
-- ----------------------------
DROP TABLE IF EXISTS `merchant_metric_plan_limit`;
CREATE TABLE `merchant_metric_plan_limit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `merchant_id` bigint(64) unsigned NOT NULL COMMENT 'merchantId',
  `metric_id` bigint(64) unsigned NOT NULL COMMENT 'metricId',
  `plan_id` bigint(64) unsigned NOT NULL COMMENT 'plan_id',
  `metric_limit` bigint(64) unsigned NOT NULL COMMENT 'plan metric limit',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_metric_plan_limit_unique` (`merchant_id`,`plan_id`,`metric_id`,`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=15695 DEFAULT CHARSET=utf8 COMMENT='Merchant Metric Plan Limit';

-- ----------------------------
-- Table structure for merchant_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `merchant_operation_log`;
CREATE TABLE `merchant_operation_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` bigint(20) NOT NULL COMMENT 'company id',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'merchant Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'user_id',
  `opt_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'admin account',
  `client_type` int(11) NOT NULL DEFAULT '0' COMMENT 'client type',
  `biz_type` int(11) NOT NULL DEFAULT '0' COMMENT 'biz_type',
  `opt_target` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'operation target',
  `opt_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'operation content',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'operation create utc time',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `queryport_request_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'queryport id',
  `server_type` int(11) DEFAULT '0' COMMENT 'server type',
  `server_type_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'server type description',
  PRIMARY KEY (`id`),
  UNIQUE KEY `queryport_request_id_unique` (`queryport_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3915687 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Merchant Operation Log';

-- ----------------------------
-- Table structure for merchant_role
-- ----------------------------
DROP TABLE IF EXISTS `merchant_role`;
CREATE TABLE `merchant_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'userId',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `merchant_id` bigint(64) unsigned NOT NULL COMMENT 'merchant id',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'role',
  `permission_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'permission_data（json）',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_role_unique` (`merchant_id`,`role`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Merchant Role';

-- ----------------------------
-- Table structure for merchant_vat_number_verify_history
-- ----------------------------
DROP TABLE IF EXISTS `merchant_vat_number_verify_history`;
CREATE TABLE `merchant_vat_number_verify_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT 'merchantId',
  `vat_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'vat_number',
  `valid` bigint(64) DEFAULT '0' COMMENT '0-Invalid，1-Valid',
  `validate_gateway` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'validate_gateway',
  `country_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'country_code',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'company_name',
  `company_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'company_address',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `validate_message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'validate_message',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_vat_number_verify_unique` (`merchant_id`,`vat_number`)
) ENGINE=InnoDB AUTO_INCREMENT=15699 DEFAULT CHARSET=utf8 COMMENT='Merchant Vat Number Verify History';

-- ----------------------------
-- Table structure for merchant_webhook
-- ----------------------------
DROP TABLE IF EXISTS `merchant_webhook`;
CREATE TABLE `merchant_webhook` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'webhook url',
  `webhook_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'webhook url',
  `webhook_events` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'webhook_events,split dot',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchant_webhook_unique` (`merchant_id`,`webhook_url`)
) ENGINE=InnoDB AUTO_INCREMENT=22165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Merchant Webhook';

-- ----------------------------
-- Table structure for merchant_webhook_log
-- ----------------------------
DROP TABLE IF EXISTS `merchant_webhook_log`;
CREATE TABLE `merchant_webhook_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'webhook url',
  `endpoint_id` bigint(20) DEFAULT NULL,
  `reconsume_count` int(11) DEFAULT NULL,
  `webhook_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'webhook url',
  `webhook_event` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'webhook_event',
  `request_id` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'request_id',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'body(json)',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'response',
  `mamo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mamo',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Webhook Log';

-- ----------------------------
-- Table structure for merchant_webhook_message
-- ----------------------------
DROP TABLE IF EXISTS `merchant_webhook_message`;
CREATE TABLE `merchant_webhook_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'merchantId',
  `webhook_event` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'webhook_event',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'data(json)',
  `websocket_status` int(11) NOT NULL DEFAULT '10' COMMENT 'status  10-pending，20-success',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Merchant Webhook Message';

-- ----------------------------
-- Table structure for open_api_config
-- ----------------------------
DROP TABLE IF EXISTS `open_api_config`;
CREATE TABLE `open_api_config` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `qps` int(11) NOT NULL DEFAULT '0' COMMENT 'total qps control',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant id',
  `hmac` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'webhook hmac key',
  `callback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'callback url',
  `api_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'api key',
  `token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'api token',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `validips` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gateway_callback_response` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'callback return response',
  `company_id` bigint(64) DEFAULT NULL COMMENT 'company id',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_key` (`api_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Open Api Config';

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` bigint(20) DEFAULT NULL COMMENT 'company id',
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant id',
  `open_api_id` bigint(20) DEFAULT NULL COMMENT 'open api id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'user_id',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `biz_type` int(11) DEFAULT NULL COMMENT 'biz_type 1-onetime payment, 3-subscription',
  `external_payment_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'external_payment_id',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'currency，“SGD” “MYR” “PHP” “IDR” “THB”',
  `payment_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'payment id',
  `total_amount` bigint(20) NOT NULL COMMENT 'total amount',
  `payment_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'payment_amount',
  `balance_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'balance_amount',
  `refund_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'total refund amount',
  `status` int(11) NOT NULL DEFAULT '10' COMMENT 'status  10-pending，20-success，30-failure, 40-cancel',
  `terminal_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'client ip',
  `country_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'country code',
  `authorize_status` int(11) NOT NULL DEFAULT '0' COMMENT 'authorize status，0-waiting authorize，1-authorized，2-authorized_request',
  `authorize_reason` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `gateway_payment_intent_id` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'gateway_payment_intent_id',
  `gateway_payment_id` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'gateway_payment_id',
  `capture_delay_hours` int(11) NOT NULL DEFAULT '0' COMMENT 'capture_delay_hours',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create time, utc time',
  `cancel_time` bigint(20) DEFAULT NULL COMMENT 'cancel time, utc time',
  `paid_time` bigint(20) DEFAULT NULL COMMENT 'paid time, utc time',
  `invoice_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'invoice id',
  `app_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'app id',
  `return_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'return url',
  `gateway_edition` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway edition',
  `hide_payment_methods` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'hide_payment_methods',
  `verify` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'codeVerify',
  `code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meta_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'meta_data (json)',
  `automatic` int(11) NOT NULL DEFAULT '0' COMMENT '0-no,1-yes',
  `failure_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_reason` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'payment create data (json)',
  `unique_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique id',
  `balance_start` bigint(20) DEFAULT NULL COMMENT 'balance_start, utc time',
  `balance_end` bigint(20) DEFAULT NULL COMMENT 'balance_end, utc time',
  `invoice_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway_payment_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gas_payer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'who pay the gas, merchant|user',
  `expire_time` bigint(20) DEFAULT NULL COMMENT 'expire time, utc time',
  `gateway_link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `crypto_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'crypto_amount, cent',
  `crypto_currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'crypto_currency',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payment_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Payment';

-- ----------------------------
-- Table structure for payment_event
-- ----------------------------
DROP TABLE IF EXISTS `payment_event`;
CREATE TABLE `payment_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT 'user_id',
  `merchant_member_id` bigint(20) NOT NULL COMMENT 'merchant_user_id',
  `open_api_id` bigint(20) DEFAULT NULL COMMENT 'open api id',
  `terminal_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'terminal_ip',
  `biz_type` int(11) NOT NULL DEFAULT '0' COMMENT 'biz_type=1，Payment表',
  `biz_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'biz_type=1，pay；',
  `fee` bigint(20) NOT NULL COMMENT 'amount, cent',
  `event_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-unknown',
  `event` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'event',
  `relative_trade_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'relative trade no',
  `unique_no` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'unique no',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'message',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_unique_no` (`unique_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27758 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Payment Event';

-- ----------------------------
-- Table structure for payment_timeline
-- ----------------------------
DROP TABLE IF EXISTS `payment_timeline`;
CREATE TABLE `payment_timeline` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'userId',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription id',
  `invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice id',
  `unique_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique id',
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `total_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'total amount',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `payment_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PaymentId',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending, 1-success, 2-failure',
  `timeline_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-pay, 1-refund',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payment_timeline_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=938 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payment Timelin';

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `company_id` bigint(64) DEFAULT NULL COMMENT 'company id',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'merchant id',
  `plan_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PlanName',
  `amount` bigint(20) NOT NULL COMMENT 'amount, cent, without tax',
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `interval_unit` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'period unit,day|month|year|week',
  `interval_count` int(11) NOT NULL DEFAULT '1' COMMENT 'period unit count',
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'description',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'image_url',
  `home_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'home_url',
  `gateway_product_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway product name',
  `gateway_product_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway product description',
  `tax_scale` int(11) NOT NULL DEFAULT '0' COMMENT 'tax scale 1000 = 10%',
  `tax_inclusive` int(11) NOT NULL DEFAULT '1' COMMENT 'deperated',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT 'type，1-main plan，2-recurring addon plan 3-onetime addon plan',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'status，1-editing，2-active，3-inactive，4-expired',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `binding_addon_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'binded recurring addon planIds，split with ,',
  `binding_onetime_addon_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'binded onetime addon planIds，split with ,',
  `publish_status` int(11) NOT NULL DEFAULT '1' COMMENT '1-UnPublish,2-Publish, Use For Display Plan At UserPortal',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `extra_metric_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'meta_data(json)',
  `gas_payer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'who pay the gas, merchant|user',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Plan';

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` bigint(20) DEFAULT NULL COMMENT 'company id',
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'user_id',
  `open_api_id` bigint(20) DEFAULT NULL COMMENT 'open api id',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `biz_type` int(11) NOT NULL COMMENT 'biz type, copy from payment.biz_type',
  `external_refund_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'external_refund_id',
  `country_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'country code',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `payment_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'relative payment id',
  `refund_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'refund id (system generate)',
  `refund_amount` bigint(20) NOT NULL COMMENT 'refund amount, cent',
  `refund_comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'refund comment',
  `status` int(11) NOT NULL DEFAULT '10' COMMENT 'status。10-pending，20-success，30-failure, 40-cancel',
  `refund_time` bigint(20) DEFAULT NULL COMMENT 'refund success time',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `gateway_refund_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'gateway refund id',
  `app_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'app id',
  `refund_comment_explain` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'refund comment ',
  `return_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'return url after refund success',
  `meta_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'meta_data(json)',
  `unique_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique id',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription id',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1-gateway refund,2-mark refund',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `refund_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Refund';

-- ----------------------------
-- Table structure for subscription
-- ----------------------------
DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'subscription id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'userId',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `task_time` timestamp NULL DEFAULT NULL COMMENT 'task_time',
  `amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'amount, cent',
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'merchant id',
  `plan_id` bigint(64) unsigned NOT NULL COMMENT 'plan id',
  `quantity` bigint(20) NOT NULL COMMENT 'quantity',
  `addon_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'plan addon json data',
  `latest_invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'latest_invoice_id',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT 'sub type, 0-gateway sub, 1-unibee sub',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'status，0-Init | 1-Create｜2-Active｜3-PendingInActive | 4-Cancel | 5-Expire | 6- Suspend| 7-Incomplete',
  `gateway_subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway subscription id',
  `customer_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'customer_name',
  `customer_email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'customer_email',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `gateway_default_payment_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway status，Stripe：https://stripe.com/docs/billing/subscriptions/webhooks  Paypal：https://developer.paypal.com/docs/api/subscriptions/v1/#subscriptions_get',
  `gateway_item_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'gateway_item_data',
  `cancel_at_period_end` int(11) NOT NULL DEFAULT '0' COMMENT 'whether cancel at period end，0-false | 1-true ',
  `gateway_latest_invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway latest invoice id',
  `last_update_time` bigint(20) DEFAULT NULL,
  `current_period_start` bigint(20) DEFAULT NULL COMMENT 'current_period_start, utc time',
  `current_period_end` bigint(20) DEFAULT NULL COMMENT 'current_period_end, utc time',
  `current_period_start_time` timestamp NULL DEFAULT NULL,
  `current_period_end_time` timestamp NULL DEFAULT NULL,
  `billing_cycle_anchor` bigint(20) DEFAULT NULL COMMENT 'billing_cycle_anchor',
  `dunning_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'dunning_time, utc time',
  `trial_end` bigint(20) DEFAULT NULL COMMENT 'trial_end, utc time',
  `return_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_paid_time` bigint(20) DEFAULT NULL COMMENT 'first success payment time',
  `cancel_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_scale` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Tax Scale，1000 = 10%',
  `vat_verify_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pendingUpdateId` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `test_clock` bigint(20) NOT NULL DEFAULT '0' COMMENT 'test_clock, simulator clock for subscription, if set , sub will out of cronjob controll',
  `meta_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'meta_data(json)',
  `gas_payer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'who pay the gas, merchant|user',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `subscription_unique` (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Subscription';

-- ----------------------------
-- Table structure for subscription_admin_note
-- ----------------------------
DROP TABLE IF EXISTS `subscription_admin_note`;
CREATE TABLE `subscription_admin_note` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'modify_time',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'subscription_id',
  `merchant_member_id` bigint(64) NOT NULL COMMENT 'merchant_user_id',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'note',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Subscription Admin Note';

-- ----------------------------
-- Table structure for subscription_onetime_addon
-- ----------------------------
DROP TABLE IF EXISTS `subscription_onetime_addon`;
CREATE TABLE `subscription_onetime_addon` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'modify_time',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'subscription_id',
  `addon_id` bigint(20) unsigned NOT NULL COMMENT 'onetime addonId',
  `quantity` bigint(20) NOT NULL DEFAULT '1' COMMENT 'quantity',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'status, 1-create, 2-paid, 3-cancel, 4-expired',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `payment_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'paymentId',
  `meta_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'meta_data(json)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Subscription one-time addon';

-- ----------------------------
-- Table structure for subscription_pending_update
-- ----------------------------
DROP TABLE IF EXISTS `subscription_pending_update`;
CREATE TABLE `subscription_pending_update` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT 'merchant id',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'subscription id',
  `pending_update_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pending update unique id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'name',
  `invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway update payment id assosiate to this update, use payment.paymentId',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'amount of this period, cent',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'status，0-Init | 1-Create｜2-Finished｜3-Cancelled ',
  `proration_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'proration amount of this pending update , cent',
  `update_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'the amount after update',
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency of this period',
  `update_currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the currency after update',
  `plan_id` bigint(64) unsigned NOT NULL COMMENT 'the plan id of this period',
  `update_plan_id` bigint(64) unsigned NOT NULL COMMENT 'the plan id after update',
  `quantity` bigint(20) NOT NULL COMMENT 'quantity of this period',
  `update_quantity` bigint(20) NOT NULL COMMENT 'quantity after update',
  `addon_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'plan addon data (json) of this period',
  `update_addon_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'plan addon data (json) after update',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'userId',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `paid` int(11) NOT NULL DEFAULT '0' COMMENT 'paid，0-no，1-yes',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment link',
  `gateway_status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gateway status',
  `merchant_member_id` bigint(20) DEFAULT NULL COMMENT 'merchant_user_id',
  `data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `effect_immediate` int(11) DEFAULT NULL COMMENT 'effect immediate，0-no，1-yes',
  `effect_time` bigint(20) DEFAULT NULL COMMENT 'effect_immediate=0, effect time, utc_time',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'note',
  `proration_date` bigint(20) DEFAULT NULL COMMENT 'merchant_user_id',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `meta_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'meta_data(json)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `subscription_pending_update_unique` (`pending_update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Subscription Pending Update';

-- ----------------------------
-- Table structure for subscription_timeline
-- ----------------------------
DROP TABLE IF EXISTS `subscription_timeline`;
CREATE TABLE `subscription_timeline` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'userId',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription id',
  `period_start` bigint(20) DEFAULT '0' COMMENT 'period_start',
  `period_end` bigint(20) DEFAULT '0' COMMENT 'period_end',
  `period_start_time` timestamp NULL DEFAULT NULL COMMENT 'period start (datetime)',
  `period_end_time` timestamp NULL DEFAULT NULL COMMENT 'period end (datatime)',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `invoice_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice id',
  `unique_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique id',
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'currency',
  `plan_id` bigint(64) unsigned NOT NULL COMMENT 'PlanId',
  `quantity` bigint(20) NOT NULL COMMENT 'quantity',
  `addon_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'plan addon json data',
  `gateway_id` bigint(20) unsigned NOT NULL COMMENT 'gateway_id',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `unique_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'unique key (deperated)',
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1-processing,2-finish',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `subscription_timeline_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=827 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Subscription Timeline';

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'userId',
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant_id',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-UnDeleted，1-Deleted',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'password , encrypt',
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user name',
  `mobile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mobile',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gender',
  `avatar_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'avator url',
  `re_mark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'note',
  `is_special` int(11) NOT NULL DEFAULT '0' COMMENT 'is special account（0.no，1.yes）- deperated',
  `birthday` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'brithday',
  `profession` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'profession',
  `school` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'school',
  `custom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'custom',
  `last_login_at` bigint(20) DEFAULT NULL COMMENT 'last login time, utc time',
  `is_risk` int(11) DEFAULT '0' COMMENT 'is risk account (deperated)',
  `gateway_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'gateway_id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT 'version',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'phone',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'address',
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'first name',
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'last name',
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'company name',
  `VAT_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'vat number',
  `Telegram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'telegram',
  `WhatsAPP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'whats app',
  `WeChat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wechat',
  `TikTok` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tictok',
  `LinkedIn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'linkedin',
  `Facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'facebook',
  `other_social_info` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'country_code',
  `country_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'country_name',
  `subscription_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription name',
  `subscription_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subscription id',
  `subscription_status` int(11) DEFAULT NULL COMMENT 'sub status，0-Init | 1-Create｜2-Active｜3-PendingInActive | 4-Cancel | 5-Expire | 6- Suspend| 7-Incomplete',
  `recurring_amount` bigint(20) NOT NULL DEFAULT '0' COMMENT 'total recurring amount, cent',
  `billing_type` int(11) NOT NULL DEFAULT '0' COMMENT '1-recurring,2-one-time',
  `time_zone` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL COMMENT 'create utc time',
  `external_user_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'external_user_id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-Active, 2-Frozen',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_account_unique` (`merchant_id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2235428055 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='User Account';

SET FOREIGN_KEY_CHECKS = 1;
