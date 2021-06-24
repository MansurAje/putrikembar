-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.48-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for putrikembar
CREATE DATABASE IF NOT EXISTS `putrikembar` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `putrikembar`;

-- Dumping structure for table putrikembar.cms_apicustom
CREATE TABLE IF NOT EXISTS `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tabel` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aksi` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kolom` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderby` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sql_where` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `responses` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_apicustom: ~0 rows (approximately)
DELETE FROM `cms_apicustom`;
/*!40000 ALTER TABLE `cms_apicustom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_apicustom` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_apikey
CREATE TABLE IF NOT EXISTS `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_apikey: ~0 rows (approximately)
DELETE FROM `cms_apikey`;
/*!40000 ALTER TABLE `cms_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_apikey` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_dashboard
CREATE TABLE IF NOT EXISTS `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_dashboard: ~0 rows (approximately)
DELETE FROM `cms_dashboard`;
/*!40000 ALTER TABLE `cms_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_dashboard` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_email_queues
CREATE TABLE IF NOT EXISTS `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8_unicode_ci,
  `email_attachments` text COLLATE utf8_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_email_queues: ~0 rows (approximately)
DELETE FROM `cms_email_queues`;
/*!40000 ALTER TABLE `cms_email_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_email_queues` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_email_templates
CREATE TABLE IF NOT EXISTS `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_email_templates: ~1 rows (approximately)
DELETE FROM `cms_email_templates`;
/*!40000 ALTER TABLE `cms_email_templates` DISABLE KEYS */;
INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
	(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2021-06-24 04:42:26', NULL);
/*!40000 ALTER TABLE `cms_email_templates` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_logs
CREATE TABLE IF NOT EXISTS `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useragent` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_logs: ~7 rows (approximately)
DELETE FROM `cms_logs`;
/*!40000 ALTER TABLE `cms_logs` DISABLE KEYS */;
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
	(1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-06-24 04:47:29', NULL),
	(2, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/m_kandang/add-save', 'Add New Data  at kandang', '', 1, '2021-06-24 07:04:00', NULL),
	(3, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/m_pelanggan/add-save', 'Add New Data  at pelanggan', '', 1, '2021-06-24 07:06:04', NULL),
	(4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/m_supir/add-save', 'Add New Data  at supir', '', 1, '2021-06-24 07:06:16', NULL),
	(5, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/t_beli/add-save', 'Add New Data  at beli', '', 1, '2021-06-24 07:07:06', NULL),
	(6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/t_beli/add-save', 'Add New Data  at beli', '', 1, '2021-06-24 07:14:31', NULL),
	(7, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/t_beli/delete/2', 'Delete data 2 at beli', '', 1, '2021-06-24 07:14:44', NULL),
	(8, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0', 'http://localhost:8000/admin/t_jual/add-save', 'Add New Data  at jual', '', 1, '2021-06-24 07:29:34', NULL);
/*!40000 ALTER TABLE `cms_logs` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_menus
CREATE TABLE IF NOT EXISTS `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_menus: ~5 rows (approximately)
DELETE FROM `cms_menus`;
/*!40000 ALTER TABLE `cms_menus` DISABLE KEYS */;
INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
	(1, 'kandang', 'Route', 'AdminMKandangControllerGetIndex', NULL, 'fa fa-home', 0, 1, 0, 1, 1, '2021-06-24 06:54:33', NULL),
	(2, 'pelanggan', 'Route', 'AdminMPelangganControllerGetIndex', NULL, 'fa fa-user', 0, 1, 0, 1, 2, '2021-06-24 06:58:59', NULL),
	(3, 'supir', 'Route', 'AdminMSupirControllerGetIndex', NULL, 'fa fa-car', 0, 1, 0, 1, 3, '2021-06-24 07:00:07', NULL),
	(4, 'beli', 'Route', 'AdminTBeliControllerGetIndex', NULL, 'fa fa-shopping-basket', 0, 1, 0, 1, 4, '2021-06-24 07:02:37', NULL),
	(5, 'jual', 'Route', 'AdminTJualControllerGetIndex', NULL, 'fa fa-shopping-cart', 0, 1, 0, 1, 5, '2021-06-24 07:23:52', NULL);
/*!40000 ALTER TABLE `cms_menus` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_menus_privileges
CREATE TABLE IF NOT EXISTS `cms_menus_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_menus_privileges: ~5 rows (approximately)
DELETE FROM `cms_menus_privileges`;
/*!40000 ALTER TABLE `cms_menus_privileges` DISABLE KEYS */;
INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 1),
	(5, 5, 1);
/*!40000 ALTER TABLE `cms_menus_privileges` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_moduls
CREATE TABLE IF NOT EXISTS `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_moduls: ~16 rows (approximately)
DELETE FROM `cms_moduls`;
/*!40000 ALTER TABLE `cms_moduls` DISABLE KEYS */;
INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2021-06-24 04:42:26', NULL, NULL),
	(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2021-06-24 04:42:26', NULL, NULL),
	(12, 'kandang', 'fa fa-home', 'm_kandang', 'm_kandang', 'AdminMKandangController', 0, 0, '2021-06-24 06:54:33', NULL, NULL),
	(13, 'pelanggan', 'fa fa-user', 'm_pelanggan', 'm_pelanggan', 'AdminMPelangganController', 0, 0, '2021-06-24 06:58:59', NULL, NULL),
	(14, 'supir', 'fa fa-car', 'm_supir', 'm_supir', 'AdminMSupirController', 0, 0, '2021-06-24 07:00:07', NULL, NULL),
	(15, 'beli', 'fa fa-shopping-basket', 't_beli', 't_beli', 'AdminTBeliController', 0, 0, '2021-06-24 07:02:37', NULL, NULL),
	(16, 'jual', 'fa fa-shopping-cart', 't_jual', 't_jual', 'AdminTJualController', 0, 0, '2021-06-24 07:23:52', NULL, NULL);
/*!40000 ALTER TABLE `cms_moduls` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_notifications
CREATE TABLE IF NOT EXISTS `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_notifications: ~0 rows (approximately)
DELETE FROM `cms_notifications`;
/*!40000 ALTER TABLE `cms_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_notifications` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_privileges
CREATE TABLE IF NOT EXISTS `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_privileges: ~1 rows (approximately)
DELETE FROM `cms_privileges`;
/*!40000 ALTER TABLE `cms_privileges` DISABLE KEYS */;
INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
	(1, 'Super Administrator', 1, 'skin-blue', '2021-06-24 04:42:26', NULL);
/*!40000 ALTER TABLE `cms_privileges` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_privileges_roles
CREATE TABLE IF NOT EXISTS `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_privileges_roles: ~6 rows (approximately)
DELETE FROM `cms_privileges_roles`;
/*!40000 ALTER TABLE `cms_privileges_roles` DISABLE KEYS */;
INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
	(12, 1, 1, 1, 1, 1, 1, 4, NULL, NULL),
	(13, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
	(14, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
	(15, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
	(16, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
	(17, 1, 1, 1, 1, 1, 1, 16, NULL, NULL);
/*!40000 ALTER TABLE `cms_privileges_roles` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_settings
CREATE TABLE IF NOT EXISTS `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `content_input_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataenum` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `helper` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_settings: ~16 rows (approximately)
DELETE FROM `cms_settings`;
/*!40000 ALTER TABLE `cms_settings` DISABLE KEYS */;
INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
	(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2021-06-24 04:42:26', NULL, 'Login Register Style', 'Login Background Color'),
	(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2021-06-24 04:42:26', NULL, 'Login Register Style', 'Login Font Color'),
	(3, 'login_background_image', NULL, 'upload_image', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Login Register Style', 'Login Background Image'),
	(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Email Setting', 'Email Sender'),
	(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2021-06-24 04:42:26', NULL, 'Email Setting', 'Mail Driver'),
	(6, 'smtp_host', '', 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Email Setting', 'SMTP Host'),
	(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2021-06-24 04:42:26', NULL, 'Email Setting', 'SMTP Port'),
	(8, 'smtp_username', '', 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Email Setting', 'SMTP Username'),
	(9, 'smtp_password', '', 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Email Setting', 'SMTP Password'),
	(10, 'appname', 'Putri Kembar', 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Application Setting', 'Application Name'),
	(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2021-06-24 04:42:26', NULL, 'Application Setting', 'Default Paper Print Size'),
	(12, 'logo', NULL, 'upload_image', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Application Setting', 'Logo'),
	(13, 'favicon', NULL, 'upload_image', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Application Setting', 'Favicon'),
	(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2021-06-24 04:42:26', NULL, 'Application Setting', 'API Debug Mode'),
	(15, 'google_api_key', NULL, 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Application Setting', 'Google API Key'),
	(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2021-06-24 04:42:26', NULL, 'Application Setting', 'Google FCM Key');
/*!40000 ALTER TABLE `cms_settings` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_statistics
CREATE TABLE IF NOT EXISTS `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_statistics: ~0 rows (approximately)
DELETE FROM `cms_statistics`;
/*!40000 ALTER TABLE `cms_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_statistics` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_statistic_components
CREATE TABLE IF NOT EXISTS `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_statistic_components: ~0 rows (approximately)
DELETE FROM `cms_statistic_components`;
/*!40000 ALTER TABLE `cms_statistic_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_statistic_components` ENABLE KEYS */;

-- Dumping structure for table putrikembar.cms_users
CREATE TABLE IF NOT EXISTS `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.cms_users: ~1 rows (approximately)
DELETE FROM `cms_users`;
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;
INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
	(1, 'Super Admin', NULL, 'admin@crudbooster.com', '$2y$10$1XLEWrCFaWLMir3Ei7goGOpQAWmbU6zey6fbNgyjuKjGwBgRqc2yC', 1, '2021-06-24 04:42:26', NULL, 'Active');
/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;

-- Dumping structure for table putrikembar.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table putrikembar.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.migrations: ~27 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2016_08_07_145904_add_table_cms_apicustom', 1),
	(3, '2016_08_07_150834_add_table_cms_dashboard', 1),
	(4, '2016_08_07_151210_add_table_cms_logs', 1),
	(5, '2016_08_07_151211_add_details_cms_logs', 1),
	(6, '2016_08_07_152014_add_table_cms_privileges', 1),
	(7, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
	(8, '2016_08_07_152320_add_table_cms_settings', 1),
	(9, '2016_08_07_152421_add_table_cms_users', 1),
	(10, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
	(11, '2016_08_07_154624_add_table_cms_moduls', 1),
	(12, '2016_08_17_225409_add_status_cms_users', 1),
	(13, '2016_08_20_125418_add_table_cms_notifications', 1),
	(14, '2016_09_04_033706_add_table_cms_email_queues', 1),
	(15, '2016_09_16_035347_add_group_setting', 1),
	(16, '2016_09_16_045425_add_label_setting', 1),
	(17, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
	(18, '2016_10_01_141740_add_method_type_apicustom', 1),
	(19, '2016_10_01_141846_add_parameters_apicustom', 1),
	(20, '2016_10_01_141934_add_responses_apicustom', 1),
	(21, '2016_10_01_144826_add_table_apikey', 1),
	(22, '2016_11_14_141657_create_cms_menus', 1),
	(23, '2016_11_15_132350_create_cms_email_templates', 1),
	(24, '2016_11_15_190410_create_cms_statistics', 1),
	(25, '2016_11_17_102740_create_cms_statistic_components', 1),
	(26, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
	(27, '2019_08_19_000000_create_failed_jobs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table putrikembar.m_kandang
CREATE TABLE IF NOT EXISTS `m_kandang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vNama` varchar(300) DEFAULT NULL,
  `mAlamat` text,
  `vCp` varchar(255) DEFAULT NULL,
  `vNo_telp` varchar(50) DEFAULT NULL,
  `dCreated` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table putrikembar.m_kandang: ~1 rows (approximately)
DELETE FROM `m_kandang`;
/*!40000 ALTER TABLE `m_kandang` DISABLE KEYS */;
INSERT INTO `m_kandang` (`id`, `vNama`, `mAlamat`, `vCp`, `vNo_telp`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, 'Mariftul', 'reresasasa', 'op', '081', '2021-06-24 14:04:00', NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `m_kandang` ENABLE KEYS */;

-- Dumping structure for table putrikembar.m_pelanggan
CREATE TABLE IF NOT EXISTS `m_pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vNama` varchar(300) DEFAULT NULL,
  `mAlamat` text,
  `vNo_telp` varchar(50) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table putrikembar.m_pelanggan: ~1 rows (approximately)
DELETE FROM `m_pelanggan`;
/*!40000 ALTER TABLE `m_pelanggan` DISABLE KEYS */;
INSERT INTO `m_pelanggan` (`id`, `vNama`, `mAlamat`, `vNo_telp`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, 'hendra', 'sasasasasaasasa', '100', NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `m_pelanggan` ENABLE KEYS */;

-- Dumping structure for table putrikembar.m_supir
CREATE TABLE IF NOT EXISTS `m_supir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vNama` varchar(300) DEFAULT NULL,
  `mAlamat` text,
  `vNo_telp` varchar(50) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table putrikembar.m_supir: ~1 rows (approximately)
DELETE FROM `m_supir`;
/*!40000 ALTER TABLE `m_supir` DISABLE KEYS */;
INSERT INTO `m_supir` (`id`, `vNama`, `mAlamat`, `vNo_telp`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, 'ssss', 'ssssssss', 'ssssssss', NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `m_supir` ENABLE KEYS */;

-- Dumping structure for table putrikembar.t_beli
CREATE TABLE IF NOT EXISTS `t_beli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dTanggal` date DEFAULT NULL,
  `mKeterangan` text,
  `dCreated` datetime DEFAULT NULL COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table putrikembar.t_beli: ~1 rows (approximately)
DELETE FROM `t_beli`;
/*!40000 ALTER TABLE `t_beli` DISABLE KEYS */;
INSERT INTO `t_beli` (`id`, `dTanggal`, `mKeterangan`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, '2021-06-24', 'hari ini harga lagi bagus, jadi ambil 2 tempat', NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `t_beli` ENABLE KEYS */;

-- Dumping structure for table putrikembar.t_beli_detail
CREATE TABLE IF NOT EXISTS `t_beli_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_beli_id` int(11) DEFAULT NULL,
  `supir_id` int(11) DEFAULT NULL,
  `kandang_id` int(11) DEFAULT NULL,
  `yHarga` double DEFAULT NULL,
  `yJumlah` double DEFAULT NULL,
  `yOperasional` double DEFAULT NULL,
  `yPlus` double DEFAULT NULL,
  `yMinus` double DEFAULT NULL,
  `yNawar` double DEFAULT NULL,
  `mKeterangan` text,
  `dCreated` datetime DEFAULT NULL COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_beli_id` (`t_beli_id`),
  KEY `supir_id` (`supir_id`),
  KEY `kandang_id` (`kandang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table putrikembar.t_beli_detail: ~1 rows (approximately)
DELETE FROM `t_beli_detail`;
/*!40000 ALTER TABLE `t_beli_detail` DISABLE KEYS */;
INSERT INTO `t_beli_detail` (`id`, `t_beli_id`, `supir_id`, `kandang_id`, `yHarga`, `yJumlah`, `yOperasional`, `yPlus`, `yMinus`, `yNawar`, `mKeterangan`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `t_beli_detail` ENABLE KEYS */;

-- Dumping structure for table putrikembar.t_jual
CREATE TABLE IF NOT EXISTS `t_jual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dTanggal` date DEFAULT NULL,
  `mKeterangan` text,
  `dCreated` datetime DEFAULT NULL COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table putrikembar.t_jual: ~0 rows (approximately)
DELETE FROM `t_jual`;
/*!40000 ALTER TABLE `t_jual` DISABLE KEYS */;
INSERT INTO `t_jual` (`id`, `dTanggal`, `mKeterangan`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, '2021-06-24', 'Penjualan target 1000', NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `t_jual` ENABLE KEYS */;

-- Dumping structure for table putrikembar.t_jual_detail
CREATE TABLE IF NOT EXISTS `t_jual_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_jual_id` int(11) DEFAULT NULL,
  `pelanggan_id` int(11) DEFAULT NULL,
  `yHarga` double DEFAULT NULL,
  `yJumlah` double DEFAULT NULL,
  `mKeterangan` text,
  `dCreated` datetime DEFAULT NULL COMMENT 'tanggal create',
  `cCreated` char(50) DEFAULT NULL COMMENT 'nip create',
  `dUpdated` datetime DEFAULT NULL COMMENT 'tanggal update',
  `cUpdated` char(50) DEFAULT NULL COMMENT 'nip update',
  `lDeleted` tinyint(4) DEFAULT '0' COMMENT 'status delete',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_jual_id` (`t_jual_id`),
  KEY `pelanggan_id` (`pelanggan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table putrikembar.t_jual_detail: ~0 rows (approximately)
DELETE FROM `t_jual_detail`;
/*!40000 ALTER TABLE `t_jual_detail` DISABLE KEYS */;
INSERT INTO `t_jual_detail` (`id`, `t_jual_id`, `pelanggan_id`, `yHarga`, `yJumlah`, `mKeterangan`, `dCreated`, `cCreated`, `dUpdated`, `cUpdated`, `lDeleted`) VALUES
	(1, 1, 1, 10, 10, '10', NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `t_jual_detail` ENABLE KEYS */;

-- Dumping structure for table putrikembar.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table putrikembar.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
