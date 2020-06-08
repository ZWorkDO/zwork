# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: zwork
# Generation Time: 2020-06-06 21:52:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_categories`;

CREATE TABLE `article_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `article_categories` WRITE;
/*!40000 ALTER TABLE `article_categories` DISABLE KEYS */;

INSERT INTO `article_categories` (`id`, `title`, `slug`, `abstract`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'PSD Web Template','psd-web-template',NULL,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,'Digital Marketing','digital-marketing',NULL,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'PHP Development','php-development',NULL,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `article_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_category`;

CREATE TABLE `article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `article_category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category_article_id_foreign` (`article_id`),
  KEY `article_category_article_category_id_foreign` (`article_category_id`),
  CONSTRAINT `article_category_article_category_id_foreign` FOREIGN KEY (`article_category_id`) REFERENCES `article_categories` (`id`),
  CONSTRAINT `article_category_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_slug_unique` (`slug`),
  KEY `articles_user_id_foreign` (`user_id`),
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table badges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badges`;

CREATE TABLE `badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;

INSERT INTO `badges` (`id`, `title`, `slug`, `image`, `color`, `created_at`, `updated_at`)
VALUES
	(1,'Gold','gold','featured.png','#f1c40f','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,'Silver','silver','featured.png','#e67e22','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'Bronze','Bronze','featured.png','#2ecc71','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table camaras
# ------------------------------------------------------------

DROP TABLE IF EXISTS `camaras`;

CREATE TABLE `camaras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `camaras` WRITE;
/*!40000 ALTER TABLE `camaras` DISABLE KEYS */;

INSERT INTO `camaras` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(4,'Santo Domingo','santo-domingo','','2020-05-29 03:14:39','2020-05-29 03:14:39'),
	(5,'Santiago','santiago','','2020-05-29 03:14:45','2020-05-29 03:14:45'),
	(6,'La Altagracia','la-altagracia','','2020-05-29 03:15:09','2020-05-29 03:15:09'),
	(7,'San Pedro de Macorís','san-pedro-de-macoris','','2020-05-29 03:15:17','2020-05-29 03:15:17'),
	(8,'Puerto Plata','puerto-plata','','2020-05-29 03:15:30','2020-05-29 03:15:30'),
	(9,'Valverde','valverde','','2020-05-29 03:15:44','2020-05-29 03:15:44'),
	(10,'Espaillat','espaillat','','2020-05-29 03:15:52','2020-05-29 03:15:52'),
	(11,'San Cristóbal','san-cristobal','','2020-05-29 03:16:22','2020-05-29 03:16:22'),
	(12,'Duarte','duarte','','2020-05-29 03:16:34','2020-05-29 03:16:34'),
	(13,'Peravia','peravia','','2020-05-29 03:16:48','2020-05-29 03:16:48');

/*!40000 ALTER TABLE `camaras` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table catables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `catables`;

CREATE TABLE `catables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `catable_id` int(11) NOT NULL,
  `catable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `catables` WRITE;
/*!40000 ALTER TABLE `catables` DISABLE KEYS */;

INSERT INTO `catables` (`id`, `category_id`, `catable_id`, `catable_type`, `created_at`, `updated_at`)
VALUES
	(50,2,46,'App\\Job',NULL,NULL),
	(51,2,47,'App\\Job',NULL,NULL),
	(52,2,21,'App\\Service',NULL,NULL);

/*!40000 ALTER TABLE `catables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `title`, `slug`, `abstract`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Mobiles','mobiles','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585314711-mobiles.png','2020-03-05 13:56:45','2020-03-27 13:11:51'),
	(2,'Digital Marketing','digital-marketing','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585314727-marketing.png','2020-03-05 13:56:45','2020-03-27 13:12:07'),
	(3,'Writing & Translation','writing-translation','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585314740-translate.png','2020-03-05 13:56:45','2020-03-27 13:12:20'),
	(4,'Video & Animation','video-animation','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585314756-animation.png','2020-03-05 13:56:45','2020-03-27 13:12:36'),
	(5,'Music & Audio','music-audio','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585315220-audio.png','2020-03-05 13:56:45','2020-03-27 13:20:20'),
	(6,'Programming & Tech','programming-tech','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585315233-programing.png','2020-03-05 13:56:45','2020-03-27 13:20:33'),
	(7,'Business','business','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585315247-business.png','2020-03-05 13:56:45','2020-03-27 13:20:47'),
	(8,'Fun & Lifestyle','fun-lifestyle','Consectetur adipisicing elitaed eiusmod tempor incididuatna labore et dolore magna.','1585315262-lifestyle.png','2020-03-05 13:56:45','2020-03-27 13:21:02');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table child_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `child_location`;

CREATE TABLE `child_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table child_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `child_pages`;

CREATE TABLE `child_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `child_pages` WRITE;
/*!40000 ALTER TABLE `child_pages` DISABLE KEYS */;

INSERT INTO `child_pages` (`id`, `parent_id`, `child_id`, `created_at`, `updated_at`)
VALUES
	(29,1,3,NULL,NULL),
	(38,1,2,NULL,NULL),
	(39,1,5,NULL,NULL);

/*!40000 ALTER TABLE `child_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table delivery_times
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delivery_times`;

CREATE TABLE `delivery_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `delivery_times` WRITE;
/*!40000 ALTER TABLE `delivery_times` DISABLE KEYS */;

INSERT INTO `delivery_times` (`id`, `title`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'1-3 Días','1-3-dias','2020-03-05 13:56:45','2020-05-29 02:31:35'),
	(2,'1 Semana','1-semana','2020-03-05 13:56:45','2020-05-29 02:31:49'),
	(3,'15 Días','15-dias','2020-03-05 13:56:45','2020-05-29 02:32:16'),
	(4,'1 Mes','1-mes','2020-05-29 02:32:27','2020-05-29 02:32:27'),
	(5,'2-3 Meses','2-3-meses','2020-05-29 02:33:02','2020-05-29 02:33:02');

/*!40000 ALTER TABLE `delivery_times` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;

INSERT INTO `departments` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Salud','salud','','2020-04-03 20:25:10','2020-04-03 20:25:10'),
	(2,'Ciencias','ciencias','','2020-04-03 21:09:39','2020-04-03 21:09:39'),
	(3,'Ingeniería','ingenieria','','2020-04-03 21:09:47','2020-04-03 21:09:47'),
	(4,'Enseñanza','ensenanza','','2020-04-03 21:09:55','2020-04-03 21:09:55'),
	(5,'Empresarial','empresarial','','2020-04-03 21:10:03','2020-04-03 21:10:03'),
	(6,'Tecnología','tecnologia','','2020-04-03 21:10:09','2020-04-03 21:10:09'),
	(7,'Comunicaciones','comunicaciones','','2020-04-03 21:10:16','2020-04-03 21:10:16'),
	(8,'Ciencias Sociales','ciencias-sociales','','2020-04-03 21:10:26','2020-04-03 21:10:26'),
	(9,'Artes','artes','','2020-04-03 21:10:33','2020-04-03 21:10:33'),
	(10,'Servicios','servicios','','2020-04-03 21:10:40','2020-04-03 21:10:40'),
	(11,'Industrial','industrial','','2020-04-03 21:10:47','2020-04-03 21:10:47'),
	(12,'Cine','cine','','2020-04-03 21:10:55','2020-04-03 21:10:55'),
	(13,'Financiero','financiero','','2020-04-03 21:11:02','2020-04-03 21:11:02'),
	(14,'Comercial','comercial','','2020-04-03 21:11:09','2020-04-03 21:11:09'),
	(15,'Legal','legal','','2020-04-03 21:11:18','2020-04-03 21:11:18');

/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table disputes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `disputes`;

CREATE TABLE `disputes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_type_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;

INSERT INTO `email_templates` (`id`, `admin_email`, `email_type_id`, `title`, `subject`, `content`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'Registro','Nuevo Usuario Registrado','<p>Hola&nbsp;<strong>%name%!</strong>&nbsp;Gracias por registrarte a Z|Work. Ya puedes iniciar sesi&oacute;n y manejar tu cuenta usando los siguientes credenciales:<br /> <strong>Usuario:</strong> %name%<br /> <strong>Contrase&ntilde;a:</strong> %password%<br /> <strong>Email:</strong> %email%<br /> %signature%</p>','2020-03-05 13:56:45','2020-05-20 23:07:02'),
	(2,NULL,2,'Código de Verificación','Código de Verificación Recibido','<p>Hola&nbsp;<strong>%name%!</strong> Gracias por registrarte a Z|Work.<br />Este es el c&oacute;digo de verificaci&oacute;n que necesitas para completar tu proceso de registro:<br /> <strong>Nombre :</strong> %name%<br /> <strong>Email :</strong> %email%<br /><strong>C&oacute;digo de Verificaci&oacute;n:</strong> %verification_code%<br /> %signature%</p>','2020-03-05 13:56:45','2020-05-20 23:08:59'),
	(3,NULL,3,'Lost Password','Forgot Password','<p>Hi <strong>%name%!</strong> <strong>Lost Password reset</strong></p>\r\n                    <p>Someone requested to reset the password of following account:<br /> <strong>Email Address:</strong> %account_email%<br /> If this was a mistake, just ignore this email and nothing will happen.<br /> To reset your password, click reset link below:<br /> <a href=\"%link%\"><strong>Reset</strong></a></p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(4,NULL,4,'Account Verification','Account Verification','<p>Hi <strong>%name%</strong>! <strong>Verify Your Account</strong></p>\r\n                    <p>You account has created with below given email address:</p>\r\n                    <p><strong>Email Address:</strong> %account_email%</p>\r\n                    <p>If this was a mistake, just ignore this email and nothing will happen.</p>\r\n                    <p>To verifiy your account, click below link:</p>\r\n                    <p><strong><a href=\"%link%\">Verify</a> </strong></p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(5,NULL,5,'Invitation','Invitation','<p>Hi,</p>\r\n                    <p><strong>%username%</strong> has invited you to signup at <strong>%link%</strong>.</p>\r\n                    <p>You have invitation message given below</p>\r\n                    <p><strong>%message% </strong></p>\r\n                    <p><strong>%signature%</strong></p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(6,NULL,6,'Contact Form Received','Contact Form Received','<p>Hi,</p>\r\n                    <p>A person has contacted you,</p>\r\n                    <p>Description of message is given below.</p>\r\n                    <p><strong>Subject :</strong> %subject%</p>\r\n                    <p><strong>Name :</strong> %name%</p>\r\n                    <p><strong>Email :</strong> %email%</p>\r\n                    <p><strong>Phone Number :</strong> %phone%</p>\r\n                    <p><strong>Message :</strong> %message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(7,'info@yourdomain.com',7,'Admin Email Content - Registration','New Registration!','<p>Hey!</p>\r\n                    <p>A new user <strong>\"%username%\"</strong> with email address <strong>\"%email%\"</strong> has registered on your website.<br /> Please login to check user detail.<br /> You can check user detail at: <strong>%link% </strong></p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(8,'info@yourdomain.com',8,'Admin Email Content - Account Delete','Account Delete','<p>Hi, An existing user has deleted account due to following</p>\r\n                    <p><strong>Reason:</strong> %reason%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(9,'info@yourdomain.com',9,'Admin Email Content - Report Employer','Employer Reported','<p>Hello,</p>\r\n                    <p>An employer <strong><a href=\"%link%\"> %reported_employer% </a></strong> has been reported by <strong><a href=\"%report_by_link%\">%reported_by% </a></strong></p>\r\n                    <p>Message is given below.</p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(10,'info@yourdomain.com',10,'Admin Email Content - Report Project','Project Reported','<p>Hello,</p>\r\n                    <p>A project <strong><a href=\"%link\">%reported_project%</a></strong> has been reported by <strong><a href=\"%report_by_link%\">%reported_by% </a></strong></p>\r\n                    <p>Message is given below.</p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(11,'info@yourdomain.com',11,'Admin Email Content - Report Freelancer','A freelancer has been reported!','<p>Hello,</p>\r\n                    <p>A freelancer <a href=\"%link%\"><strong>%reported_freelancer%</strong></a> has been reported by<strong> <a href=\"%report_by_link%\">%reported_by% </a></strong>&nbsp;</p>\r\n                    <p>Message is given below.</p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(12,'info@yourdomain.com',12,'Admin Email Content - Job Posted','New Job Posted','<p>Hello,</p>\r\n                    <p>A new job is posted by <strong><a href=\"%employer_link%\">%employer_name%</a></strong>.</p>\r\n                    <p>Click to view the job link.</p>\r\n                    <p><a href=\"%job_link%\" target=\"_blank\" rel=\"noopener\"><strong>%job_title%</strong></a></p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(13,'info@yourdomain.com',13,'Admin Email Content - Job Completed','Job Completed','<p>Hello,</p>\r\n                    <p>The <a href=\"%freelancer_link%\"><strong>%freelancer_name%</strong></a> has completed the following project (<strong><a href=\"%project_link%\">%project_title%</a></strong>).</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(14,NULL,14,'Employer Email Content - Proposal Received','Proposal Received','<p>Hello <strong>%employer_name%</strong>,</p>\r\n                    <p><strong> <a href=\"%freelancer_link%\">%freelancer_name%</a></strong> has sent a new proposal on the following project <a href=\"%project_link%\"><strong>%project_title%</strong></a>. Project Information is given below.</p>\r\n                    <p><strong>Proposal Amount :</strong> %proposal_amount%</p>\r\n                    <p><strong>Project Duration :</strong> %proposal_duration%</p>\r\n                    <p><strong>Message:</strong></p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(15,NULL,15,'Employer Email Content - New Job Posted','New Job Posted','<p>Hello,</p>\r\n                    <p>A new job is posted by you <strong><a href=\"%employer_link%\">%employer_name%</a></strong>.</p>\r\n                    <p>Click to view the job link. <strong><a href=\"%job_link%\" target=\"_blank\" rel=\"noopener\">%job_title%</a></strong>&nbsp;</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(16,NULL,16,'Employer Email Content - Proposal Message','Proposal Message','<p>Hello <strong><a href=\"%employer_link%\">%employer_name%</a></strong>,</p>\r\n                    <p>The <a href=\"%freelancer_link%\"><strong>%freelancer_name%</strong></a> have submitted the proposal message on this job <strong><a href=\"%project_link%\">%project_title%</a></strong>.</p>\r\n                    <p>Login to view your proposal message.</p>\r\n                    <p><strong>Message: </strong></p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(17,NULL,17,'Employer Email Content - Package Purchased','Package Purchased','<p>Hello <a href=\"%employer_link%\"><strong>%employer_name%</strong></a>,</p>\r\n                    <p>You have subscribed to the following</p>\r\n                    <p><strong>%package_name%</strong> package at cost of <strong>%package_price%</strong> which will be expired on <strong>%package_expiry%</strong>.</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(18,NULL,18,'Freelancer Email Content - New Proposal Submitted','New Proposal Submitted','<p>Hello <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>,</p>\r\n                    <p>You have submitted the proposal against this job <strong><a href=\"%project_link%\">%project_title%</a></strong>. With the following details.</p>\r\n                    <p><strong>Project Proposal Amount :</strong> %proposal_amount%</p>\r\n                    <p><strong>Project Duration :</strong> %proposal_duration%</p>\r\n                    <p><strong>Message:</strong> %message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(19,NULL,19,'Freelancer Email Content - Hire Freelancer','Congratulation You are hired!','<p>Hello <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>,</p>\r\n                    <p>The <strong><a href=\"%employer_link%\">%employer_name%</a></strong> hired you for the following job <strong><a href=\"%project_link%\">%project_title%</a></strong>.</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(20,NULL,20,'Freelancer Email Content - Send Offer','Offer Received','<p>Hi <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>,</p>\r\n                    <p>The <a href=\"%employer_link%\"><strong>%employer_name%</strong></a> would like to invite you to consider working on the following project&nbsp;&nbsp;</p>\r\n                    <p><strong>Project Name :</strong> <strong><a href=\"%project_link%\">%project_title%</a> </strong></p>\r\n                    <p><strong>Message:</strong></p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(21,NULL,21,'Freelancer Email Content - Cancel Job','Job Cancelled','<p>Hello <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>,</p>\r\n                    <p>Unfortunately <strong><a href=\"%employer_link%\">%employer_name%</a></strong> cancelled the <strong><a href=\"%project_link%\">%project_title%</a></strong> due to following reasons.</p>\r\n                    <p>Job Cancel Reasons Below.</p>\r\n                    <p><strong>Message:</strong></p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(22,NULL,22,'Freelancer Email Content - Proposal Message','Proposal Message','<p>Hello <strong><a href=\"%employer_link%\">%employer_name%</a></strong>,</p>\r\n                    <p>The <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>&nbsp;has submitted the proposal message on this job <strong><a href=\"%project_link%\">%project_title%</a></strong>.</p>\r\n                    <p>Login to view your proposal message.</p>\r\n                    <p><strong>Message:</strong></p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(23,NULL,23,'Freelancer Email Content - Package Subscribed','Package Purchased','<p>Hello <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>,</p>\r\n                    <p>You have subscribed to the following <strong>%package_name%</strong> package at cost of <strong>%package_price%</strong> which will be expired on <strong>%package_expiry%</strong>.</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(24,NULL,24,'Freelancer Email Content - Job Completed','Job Completed','<p>Hello <strong><a href=\"%freelancer_link%\">%freelancer_name%</a></strong>,</p>\r\n                    <p>The <strong><a href=\"%employer_link%\">%employer_name%</a></strong>&nbsp;has confirmed that the following project (<a href=\"%project_link%\">\"<strong>%project_title%</strong>\"</a>) is completed.</p>\r\n                    <p>You have received the following ratings from employer.</p>\r\n                    <p><strong>Message: </strong></p>\r\n                    <p>%message%</p>\r\n                    <p><strong>Ratings:</strong> %ratings%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(25,'info@yourdomain.com',25,'Admin Email Content - Dispute Raised','A dispute has been rasied','<p>Hello,</p>\r\n                    <p>A dispute has been raised by freelancer <strong><a href=\"%freelancer_link%\"> %freelancer_name% </a></strong> against <a href=\"%project_link%\">\"<strong>%project_title%</strong>\"</a>&nbsp;.</p>\r\n                    <p><strong>Reason:</strong> \"%reason%\"</p>\r\n                    <p>Message is given below.</p>\r\n                    <p>%message%</p>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(26,NULL,26,'Password Reset','Password Reset','<p>Hello <strong>%name%</strong>,</p>\r\n                    <p>You password has been reset successfully.</p>\r\n                    <p>You can login to your account with new credentials</p>\r\n                    <p><strong>Email: </strong>%email%</p>\r\n                    <p><strong>Password: </strong>%password%</p><br>\r\n                    <p>%signature%</p>','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(27,'info@yourdomain.com',27,'Admin Email Content - Job Cancelled','Job Cancelled','  <p>Hello,</p>\r\n                                    <p>An Employer <a href=\"%employer_link%\">%employer_name%</a> has cancelled his ongoing project <a href=\"%project_link%\">%project_title%</a> assigned to <a href=\"%freelancer_link%\"> %freelancer_name% </a></p>\r\n                                    <p>Job Cancel Reason is given below.</p>\r\n                                    <p>%message%</p>\r\n                                    <p>%signature%,</p>','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_types`;

CREATE TABLE `email_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `email_type` enum('new_user','verification_code','lost_password','account_verification','invitation','contact_form_received','admin_email_registration','admin_email_delete_account','admin_email_report_employer','admin_email_report_project','admin_email_report_freelancer','admin_email_new_job_posted','admin_email_job_completed','employer_email_proposal_received','employer_email_new_job_posted','employer_email_proposal_message','employer_email_package_subscribed','freelancer_email_new_proposal_submitted','freelancer_email_hire_freelancer','freelancer_email_send_offer','freelancer_email_cancel_job','freelancer_email_proposal_message','freelancer_email_package_subscribed','freelancer_email_job_completed','admin_email_dispute_raised','reset_password_email','admin_email_cancel_job') COLLATE utf8mb4_unicode_ci NOT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `email_types` WRITE;
/*!40000 ALTER TABLE `email_types` DISABLE KEYS */;

INSERT INTO `email_types` (`id`, `role_id`, `email_type`, `variables`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'new_user','a:6:{i:0;a:2:{s:3:\"key\";s:4:\"name\";s:5:\"value\";s:6:\"%name%\";}i:1;a:2:{s:3:\"key\";s:5:\"email\";s:5:\"value\";s:7:\"%email%\";}i:2;a:2:{s:3:\"key\";s:8:\"username\";s:5:\"value\";s:10:\"%username%\";}i:3;a:2:{s:3:\"key\";s:8:\"password\";s:5:\"value\";s:10:\"%password%\";}i:4;a:2:{s:3:\"key\";s:17:\"verification_code\";s:5:\"value\";s:19:\"%verification_code%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,NULL,'verification_code','a:4:{i:0;a:2:{s:3:\"key\";s:4:\"name\";s:5:\"value\";s:6:\"%name%\";}i:1;a:2:{s:3:\"key\";s:5:\"email\";s:5:\"value\";s:7:\"%email%\";}i:2;a:2:{s:3:\"key\";s:17:\"verification_code\";s:5:\"value\";s:19:\"%verification_code%\";}i:3;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,NULL,'lost_password','a:3:{i:0;a:2:{s:3:\"key\";s:4:\"name\";s:5:\"value\";s:6:\"%name%\";}i:1;a:2:{s:3:\"key\";s:4:\"link\";s:5:\"value\";s:6:\"%link%\";}i:2;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(4,NULL,'account_verification','a:3:{i:0;a:2:{s:3:\"key\";s:4:\"name\";s:5:\"value\";s:6:\"%name%\";}i:1;a:2:{s:3:\"key\";s:4:\"link\";s:5:\"value\";s:6:\"%link%\";}i:2;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(5,NULL,'invitation','a:4:{i:0;a:2:{s:3:\"key\";s:8:\"username\";s:5:\"value\";s:10:\"%username%\";}i:1;a:2:{s:3:\"key\";s:4:\"link\";s:5:\"value\";s:6:\"%link%\";}i:2;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:3;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(6,NULL,'contact_form_received','a:6:{i:0;a:2:{s:3:\"key\";s:7:\"subject\";s:5:\"value\";s:9:\"%subject%\";}i:1;a:2:{s:3:\"key\";s:4:\"name\";s:5:\"value\";s:6:\"%name%\";}i:2;a:2:{s:3:\"key\";s:5:\"email\";s:5:\"value\";s:7:\"%email%\";}i:3;a:2:{s:3:\"key\";s:5:\"phone\";s:5:\"value\";s:7:\"%phone%\";}i:4;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(7,1,'admin_email_registration','a:4:{i:0;a:2:{s:3:\"key\";s:8:\"username\";s:5:\"value\";s:10:\"%username%\";}i:1;a:2:{s:3:\"key\";s:4:\"link\";s:5:\"value\";s:6:\"%link%\";}i:2;a:2:{s:3:\"key\";s:5:\"email\";s:5:\"value\";s:7:\"%email%\";}i:3;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(8,1,'admin_email_delete_account','a:5:{i:0;a:2:{s:3:\"key\";s:6:\"reason\";s:5:\"value\";s:8:\"%reason%\";}i:1;a:2:{s:3:\"key\";s:8:\"username\";s:5:\"value\";s:10:\"%username%\";}i:2;a:2:{s:3:\"key\";s:5:\"email\";s:5:\"value\";s:7:\"%email%\";}i:3;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:4;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(9,1,'admin_email_report_employer','a:6:{i:0;a:2:{s:3:\"key\";s:17:\"reported_employer\";s:5:\"value\";s:19:\"%reported_employer%\";}i:1;a:2:{s:3:\"key\";s:17:\"reported_employer\";s:5:\"value\";s:19:\"%reported_employer%\";}i:2;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:3;a:2:{s:3:\"key\";s:9:\"user_link\";s:5:\"value\";s:11:\"%user_link%\";}i:4;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(10,1,'admin_email_report_project','a:6:{i:0;a:2:{s:3:\"key\";s:16:\"reported_project\";s:5:\"value\";s:18:\"%reported_project%\";}i:1;a:2:{s:3:\"key\";s:11:\"reported_by\";s:5:\"value\";s:13:\"%reported_by%\";}i:2;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:3;a:2:{s:3:\"key\";s:9:\"user_link\";s:5:\"value\";s:11:\"%user_link%\";}i:4;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(11,1,'admin_email_report_freelancer','a:6:{i:0;a:2:{s:3:\"key\";s:19:\"reported_freelancer\";s:5:\"value\";s:21:\"%reported_freelancer%\";}i:1;a:2:{s:3:\"key\";s:11:\"reported_by\";s:5:\"value\";s:13:\"%reported_by%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:3;a:2:{s:3:\"key\";s:9:\"user_link\";s:5:\"value\";s:11:\"%user_link%\";}i:4;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(12,1,'admin_email_new_job_posted','a:5:{i:0;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:1;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:2;a:2:{s:3:\"key\";s:9:\"job_title\";s:5:\"value\";s:11:\"%job_title%\";}i:3;a:2:{s:3:\"key\";s:8:\"job_link\";s:5:\"value\";s:10:\"%job_link%\";}i:4;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(13,1,'admin_email_job_completed','a:5:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:4;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(14,2,'employer_email_proposal_received','a:9:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:3;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:5;a:2:{s:3:\"key\";s:15:\"proposal_amount\";s:5:\"value\";s:17:\"%proposal_amount%\";}i:6;a:2:{s:3:\"key\";s:17:\"proposal_duration\";s:5:\"value\";s:19:\"%proposal_duration%\";}i:7;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:8;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(15,2,'employer_email_new_job_posted','a:5:{i:0;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:1;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:2;a:2:{s:3:\"key\";s:9:\"job_title\";s:5:\"value\";s:11:\"%job_title%\";}i:3;a:2:{s:3:\"key\";s:8:\"job_link\";s:5:\"value\";s:10:\"%job_link%\";}i:4;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(16,2,'employer_email_proposal_message','a:8:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:6;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:7;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(17,2,'employer_email_package_subscribed','a:6:{i:0;a:2:{s:3:\"key\";s:12:\"package_name\";s:5:\"value\";s:14:\"%package_name%\";}i:1;a:2:{s:3:\"key\";s:13:\"package_price\";s:5:\"value\";s:15:\"%package_price%\";}i:2;a:2:{s:3:\"key\";s:14:\"package_expiry\";s:5:\"value\";s:16:\"%package_expiry%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(18,3,'freelancer_email_new_proposal_submitted','a:8:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:4;a:2:{s:3:\"key\";s:15:\"proposal_amount\";s:5:\"value\";s:17:\"%proposal_amount%\";}i:5;a:2:{s:3:\"key\";s:17:\"proposal_duration\";s:5:\"value\";s:19:\"%proposal_duration%\";}i:6;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:7;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(19,3,'freelancer_email_hire_freelancer','a:7:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:6;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(20,3,'freelancer_email_send_offer','a:8:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:6;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:7;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(21,3,'freelancer_email_cancel_job','a:8:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:6;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:7;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(22,3,'freelancer_email_proposal_message','a:8:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:6;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:7;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(23,3,'freelancer_email_package_subscribed','a:6:{i:0;a:2:{s:3:\"key\";s:12:\"package_name\";s:5:\"value\";s:14:\"%package_name%\";}i:1;a:2:{s:3:\"key\";s:13:\"package_price\";s:5:\"value\";s:15:\"%package_price%\";}i:2;a:2:{s:3:\"key\";s:14:\"package_expiry\";s:5:\"value\";s:16:\"%package_expiry%\";}i:3;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:4;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:5;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(24,3,'freelancer_email_job_completed','a:9:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:2;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:3;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:4;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:5;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:6;a:2:{s:3:\"key\";s:7:\"ratings\";s:5:\"value\";s:9:\"%ratings%\";}i:7;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:8;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(25,1,'admin_email_dispute_raised','a:7:{i:0;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:1;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:2;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:3;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:4;a:2:{s:3:\"key\";s:6:\"reason\";s:5:\"value\";s:8:\"%reason%\";}i:5;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:6;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(26,NULL,'reset_password_email','a:3:{i:0;a:2:{s:3:\"key\";s:4:\"name\";s:5:\"value\";s:6:\"%name%\";}i:1;a:2:{s:3:\"key\";s:5:\"email\";s:5:\"value\";s:7:\"%email%\";}i:2;a:2:{s:3:\"key\";s:8:\"password\";s:5:\"value\";s:10:\"%password%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(27,NULL,'admin_email_cancel_job','a:8:{i:0;a:2:{s:3:\"key\";s:13:\"employer_link\";s:5:\"value\";s:15:\"%employer_link%\";}i:1;a:2:{s:3:\"key\";s:13:\"employer_name\";s:5:\"value\";s:15:\"%employer_name%\";}i:2;a:2:{s:3:\"key\";s:12:\"project_link\";s:5:\"value\";s:14:\"%project_link%\";}i:3;a:2:{s:3:\"key\";s:13:\"project_title\";s:5:\"value\";s:15:\"%project_title%\";}i:4;a:2:{s:3:\"key\";s:15:\"freelancer_link\";s:5:\"value\";s:17:\"%freelancer_link%\";}i:5;a:2:{s:3:\"key\";s:15:\"freelancer_name\";s:5:\"value\";s:17:\"%freelancer_name%\";}i:6;a:2:{s:3:\"key\";s:7:\"message\";s:5:\"value\";s:9:\"%message%\";}i:7;a:2:{s:3:\"key\";s:9:\"signature\";s:5:\"value\";s:11:\"%signature%\";}}','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `email_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table followers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `followers`;

CREATE TABLE `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower` int(11) DEFAULT NULL,
  `following` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;

INSERT INTO `followers` (`id`, `follower`, `following`, `created_at`, `updated_at`)
VALUES
	(1,40,25,'2020-04-10 02:54:38','2020-04-10 02:54:38'),
	(2,40,42,'2020-05-25 02:03:39','2020-05-25 02:03:39'),
	(3,40,32,'2020-05-25 02:08:56','2020-05-25 02:08:56'),
	(4,40,32,'2020-05-25 02:08:56','2020-05-25 02:08:56');

/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;

INSERT INTO `grades` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Bachiller','bachiller','','2020-04-02 02:21:52','2020-04-02 02:21:52'),
	(2,'Estudiante','estudiante','','2020-04-02 02:22:08','2020-04-02 02:22:08'),
	(3,'Universitario','universitario','','2020-04-02 02:22:16','2020-04-02 02:22:16'),
	(4,'Postgrado','postgrado','','2020-04-02 02:22:25','2020-04-02 02:22:25'),
	(5,'Magister','magister','','2020-04-02 02:22:37','2020-04-02 02:22:37'),
	(6,'PhD','phd','','2020-04-02 02:22:48','2020-04-02 02:22:48');

/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table i_p_n_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `i_p_n_statuses`;

CREATE TABLE `i_p_n_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `payer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_tax` double NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_amount` double DEFAULT NULL,
  `handling_amount` double DEFAULT NULL,
  `insurance_amount` double DEFAULT NULL,
  `paypal_fee` double NOT NULL,
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `type` enum('trial','package','project') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `transection_doc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;

INSERT INTO `invoices` (`id`, `title`, `price`, `payer_name`, `payer_email`, `seller_email`, `currency_code`, `payer_status`, `transaction_id`, `sales_tax`, `invoice_id`, `customer_id`, `shipping_amount`, `handling_amount`, `insurance_amount`, `paypal_fee`, `payment_mode`, `paid`, `type`, `created_at`, `updated_at`, `detail`, `transection_doc`)
VALUES
	(1,'Invoice No. 1',0,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'trial','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(2,'Invoice No. 2',90,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'package','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(3,'Invoice No. 3',120,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'package','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(4,'Invoice No. 4',180,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'package','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(5,'Invoice No. 5',60,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'package','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(6,'Invoice No. 6',90,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'package','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(7,'Invoice No. 7',120,'Test Payer','payer@gmail.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'package','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL),
	(8,'Invoice No. xxx-xx',8000,'Cooper White','white@amentotech.com','seller@gmail.com','USD','unverified','xxxx_xxxx_xxxx',0,'xxx_xxx',NULL,0,0,0,0,'paypal',1,'project','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL,NULL);

/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` double NOT NULL,
  `item_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `invoice_id`, `product_id`, `subscriber`, `item_name`, `item_price`, `item_qty`, `created_at`, `updated_at`, `type`)
VALUES
	(25,1,1,25,'Trial Employer',0,1,'2020-03-27 19:07:57','2020-03-27 19:07:57',NULL),
	(26,1,2,26,'Trial Freelancer',0,1,'2020-03-27 22:49:28','2020-03-27 22:49:28',NULL),
	(27,1,2,27,'Trial Freelancer',0,1,'2020-03-28 00:27:17','2020-03-28 00:27:17',NULL),
	(28,1,2,28,'Trial Freelancer',0,1,'2020-03-28 00:40:56','2020-03-28 00:40:56',NULL),
	(29,1,1,29,'Trial Employer',0,1,'2020-03-31 04:32:16','2020-03-31 04:32:16',NULL),
	(30,1,1,30,'Trial Employer',0,1,'2020-03-31 12:39:31','2020-03-31 12:39:31',NULL),
	(31,1,1,31,'Trial Employer',0,1,'2020-03-31 13:13:36','2020-03-31 13:13:36',NULL),
	(32,1,1,32,'Trial Employer',0,1,'2020-03-31 13:34:59','2020-03-31 13:34:59',NULL),
	(33,1,1,33,'Trial Employer',0,1,'2020-03-31 13:37:44','2020-03-31 13:37:44',NULL),
	(34,1,2,34,'Trial Freelancer',0,1,'2020-04-01 22:17:00','2020-04-01 22:17:00',NULL),
	(35,1,2,35,'Trial Freelancer',0,1,'2020-04-01 22:27:13','2020-04-01 22:27:13',NULL),
	(36,1,1,36,'Trial Employer',0,1,'2020-04-03 01:32:48','2020-04-03 01:32:48',NULL),
	(37,1,1,37,'Trial Employer',0,1,'2020-04-08 02:23:02','2020-04-08 02:23:02',NULL),
	(38,1,1,38,'Trial Employer',0,1,'2020-04-10 00:48:03','2020-04-10 00:48:03',NULL),
	(39,1,2,39,'Trial Freelancer',0,1,'2020-04-10 00:52:14','2020-04-10 00:52:14',NULL),
	(40,1,2,40,'Trial Freelancer',0,1,'2020-04-10 02:01:50','2020-04-10 02:01:50',NULL),
	(42,1,1,42,'Trial Employer',0,1,'2020-05-08 18:32:13','2020-05-08 18:32:13',NULL),
	(43,1,1,43,'Trial Employer',0,1,'2020-05-08 18:46:13','2020-05-08 18:46:13',NULL),
	(44,1,2,44,'Trial Freelancer',0,1,'2020-05-08 19:24:26','2020-05-08 19:24:26',NULL),
	(45,1,1,45,'Trial Employer',0,1,'2020-05-22 00:54:56','2020-05-22 00:54:56',NULL);

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_skill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_skill`;

CREATE TABLE `job_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `job_skill` WRITE;
/*!40000 ALTER TABLE `job_skill` DISABLE KEYS */;

INSERT INTO `job_skill` (`id`, `job_id`, `skill_id`, `created_at`, `updated_at`)
VALUES
	(31,46,4,NULL,NULL),
	(32,46,7,NULL,NULL),
	(33,47,13,NULL,NULL);

/*!40000 ALTER TABLE `job_skill` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('posted','hired','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'posted',
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_level` enum('basic','medium','expensive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `freelancer_type` enum('pro_independent','pro_agency','independent','agency','rising_talent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `english_level` enum('basic','conversational','fluent','native','professional') COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_type` enum('hourly','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` text COLLATE utf8mb4_unicode_ci,
  `show_attachments` text COLLATE utf8mb4_unicode_ci,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobs_slug_unique` (`slug`),
  KEY `jobs_user_id_index` (`user_id`),
  CONSTRAINT `jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`id`, `user_id`, `title`, `slug`, `status`, `duration`, `project_level`, `freelancer_type`, `english_level`, `project_type`, `price`, `description`, `location_id`, `address`, `longitude`, `latitude`, `is_featured`, `show_attachments`, `attachments`, `code`, `created_at`, `updated_at`, `expiry_date`)
VALUES
	(26,1,'Software Applications Architect','software-applications-architect','posted','weekly','basic','pro_independent','basic','fixed',980,'<p>Excepteur sint occaecat cupidatat non proident, saeunt in culpa qui officia deserunt mollit anim laborum. Seden utem perspiciatis undesieu omnis voluptatem accusantium doque laudantium, totam rem aiam eaqueiu ipsa quae ab illoion inventore veritatisetm quasitea architecto beataea dictaed quia couuntur magni dolores eos aquist ratione vtatem seque nesnt. Neque porro quamest quioremas ipsum quiatem dolor sitem ameteism conctetur adipisci velit sedate quianon.</p>\r\n                    <p>Laborum sed ut perspiciatis unde omnis iste natus error sitems voluptatem accusantium doloremque laudantium, totam rem aiam eaque ipsa quae ab illo inventore veritatis etna quasi architecto beatae vitae dictation explicabo. nemo enim ipsam fugit.</p>\r\n                    <ul class=\"wt-projectliststyle\">\r\n                    <li>Nemo enim ipsam voluptatem quia</li>\r\n                    <li>Adipisci velit, sed quia non numquam eius modi tempora</li>\r\n                    <li>Eaque ipsa quae ab illo inventore veritatis et quasi architecto</li>\r\n                    <li>qui dolorem ipsum quia dolor sit amet</li>\r\n                    </ul>\r\n                    <p>Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porrom quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonae numquam eius modi tempora incidunt labore.</p>\r\n                    <p>Eomnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt.</p>\r\n                    <ul class=\"wt-projectliststyle\">\r\n                    <li>Adipisci velit, sed quia non numquam eius modi tempora</li>\r\n                    <li>Eaque ipsa quae ab illo inventore veritatis et quasi architecto</li>\r\n                    <li>Qui dolorem ipsum quia dolor sit amet</li>\r\n                    <li>Nemo enim ipsam voluptatem quia</li>\r\n                    </ul>\r\n                    <p>Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porrom quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonae numquam eius modi tempora incidunt labore ste natus error voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n                    <p>Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porrom quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia nonae numquam eius modi tempora incidunt labore.</p>  ',8,'Larapinta Dr Alice Springs NT 0870 Australia','133.368101','-24.004758','true','true','a:3:{i:0;s:39:\"1554458958-demo-import-in-WordPress.zip\";i:1;s:52:\"1554458958-How-to-run-mysql-command-in-database.docx\";i:2;s:38:\"1554458958-WordPress-customization.pdf\";}','A1UDS262','2020-03-05 13:56:45','2020-03-05 13:56:45',NULL),
	(46,25,'Marketing','marketing','posted','three_month','medium','independent','professional','fixed',15000,'<p>Se requiere profesional con experiencia en Mercadeo y/o Publicidad para realizar y ejecutar Estudio de Mercado y Plan de Marketing Digital.&nbsp;</p>',7,'Calle Máximo Avilés Blonda #12 Ensanche Julieta Morales. 10130. IM Plaza, Local 2-B.','18.471031','-69.945447','true','false',NULL,'421DZJVW','2020-03-31 21:11:48','2020-03-31 21:11:48','2020-04-30'),
	(47,43,'Estrategia de redes sociales','estrategia-de-redes-sociales','posted','more_than_six','medium','independent','conversational','fixed',10000,'<p>mmmmmmmmmmmmmmmmm,</p>',7,'','','','false','false',NULL,'O8BDZ9ZO','2020-05-09 20:53:10','2020-05-09 20:53:10','2020-05-31');

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table langables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `langables`;

CREATE TABLE `langables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `langable_id` int(11) NOT NULL,
  `langable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `langables` WRITE;
/*!40000 ALTER TABLE `langables` DISABLE KEYS */;

INSERT INTO `langables` (`id`, `language_id`, `langable_id`, `langable_type`, `created_at`, `updated_at`)
VALUES
	(39,13,25,'App\\User',NULL,NULL),
	(40,25,25,'App\\User',NULL,NULL),
	(41,25,46,'App\\Job',NULL,NULL),
	(42,13,40,'App\\User',NULL,NULL),
	(43,25,40,'App\\User',NULL,NULL),
	(44,25,47,'App\\Job',NULL,NULL),
	(45,25,21,'App\\Service',NULL,NULL);

/*!40000 ALTER TABLE `langables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(13,'English','en','','2020-03-05 13:56:45','2020-03-28 00:51:56'),
	(25,'Español','espanol','es','2020-03-28 00:51:30','2020-03-28 00:51:30');

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`id`, `title`, `slug`, `parent`, `flag`, `description`, `created_at`, `updated_at`)
VALUES
	(8,'Santo Domingo Este','santo-domingo-este',13,'1590720732-Dominican Republic.png','','2020-04-01 21:56:29','2020-05-29 02:52:12'),
	(13,'República Dominicana','republica-dominicana',0,'1590720717-Dominican Republic.png','','2020-05-21 23:36:11','2020-05-29 02:51:57'),
	(14,'Azua','azua',13,'1590720746-Dominican Republic.png','','2020-05-29 02:41:33','2020-05-29 02:52:26'),
	(15,'Bahoruco','bahoruco',13,'1590720395-pngguru.com (51).png','','2020-05-29 02:46:01','2020-05-29 02:46:35'),
	(16,'Barahona','barahona',13,'1590720883-Dominican Republic.png','','2020-05-29 02:54:43','2020-05-29 02:54:43'),
	(17,'Dajabón','dajabon',13,'1590720951-Dominican Republic.png','','2020-05-29 02:55:51','2020-05-29 02:57:24'),
	(18,'Distrito Nacional','distrito-nacional',13,'1590720980-Dominican Republic.png','','2020-05-29 02:56:20','2020-05-29 02:56:50'),
	(19,'Duarte','duarte',13,'1590720999-Dominican Republic.png','','2020-05-29 02:56:39','2020-05-29 02:56:39'),
	(20,'Elias Piña','elias-pina',13,'1590721153-Dominican Republic.png','','2020-05-29 02:59:13','2020-05-29 02:59:13'),
	(21,'El Seibo','el-seibo',13,'1590721171-Dominican Republic.png','','2020-05-29 02:59:31','2020-05-29 02:59:31'),
	(22,'Espaillat','espaillat',13,'1590721192-Dominican Republic.png','','2020-05-29 02:59:52','2020-05-29 02:59:52'),
	(23,'Hato Mayor','hato-mayor',13,'1590721209-Dominican Republic.png','','2020-05-29 03:00:09','2020-05-29 03:00:09'),
	(24,'Hermanas Mirabal','hermanas-mirabal',13,'1590721234-Dominican Republic.png','','2020-05-29 03:00:34','2020-05-29 03:00:34'),
	(25,'Independencia','independencia',13,'1590721251-Dominican Republic.png','','2020-05-29 03:00:51','2020-05-29 03:00:51'),
	(26,'La Altagracia','la-altagracia',13,'1590721310-Dominican Republic.png','','2020-05-29 03:01:50','2020-05-29 03:01:50'),
	(27,'La Romana','la-romana',13,'1590721338-Dominican Republic.png','','2020-05-29 03:02:18','2020-05-29 03:02:18'),
	(28,'La Vega','la-vega',13,'1590721365-Dominican Republic.png','','2020-05-29 03:02:45','2020-05-29 03:02:45'),
	(29,'María Trinidad Sánchez','maria-trinidad-sanchez',13,'1590721391-Dominican Republic.png','','2020-05-29 03:03:11','2020-05-29 03:03:11'),
	(30,'Monseñor Nouel','monsenor-nouel',13,'1590721406-Dominican Republic.png','','2020-05-29 03:03:26','2020-05-29 03:03:26'),
	(31,'Monte Cristi','monte-cristi',13,'1590721427-Dominican Republic.png','','2020-05-29 03:03:47','2020-05-29 03:03:47'),
	(32,'Monte Plata','monte-plata',13,'1590721442-Dominican Republic.png','','2020-05-29 03:04:02','2020-05-29 03:04:02'),
	(33,'Pedernales','pedernales',13,'1590721459-Dominican Republic.png','','2020-05-29 03:04:19','2020-05-29 03:04:19'),
	(34,'Peravia','peravia',13,'1590721479-Dominican Republic.png','','2020-05-29 03:04:39','2020-05-29 03:04:39'),
	(35,'Puerto Plata','puerto-plata',13,'1590721506-Dominican Republic.png','','2020-05-29 03:05:06','2020-05-29 03:05:06'),
	(36,'Samaná','samana',13,'1590721519-Dominican Republic.png','','2020-05-29 03:05:19','2020-05-29 03:05:19'),
	(37,'San Cristóbal','san-cristobal',13,'1590721575-Dominican Republic.png','','2020-05-29 03:06:15','2020-05-29 03:06:15'),
	(38,'San José de Ocoa','san-jose-de-ocoa',13,'1590721594-Dominican Republic.png','','2020-05-29 03:06:34','2020-05-29 03:06:34'),
	(39,'San Juan','san-juan',13,'1590721611-Dominican Republic.png','','2020-05-29 03:06:51','2020-05-29 03:06:51'),
	(40,'San Pedro de Macorís','san-pedro-de-macoris',13,'1590721640-Dominican Republic.png','','2020-05-29 03:07:20','2020-05-29 03:07:20'),
	(41,'Sánchez Ramírez','sanchez-ramirez',13,'1590721669-Dominican Republic.png','','2020-05-29 03:07:49','2020-05-29 03:07:49'),
	(42,'Santiago','santiago',13,'1590721692-Dominican Republic.png','','2020-05-29 03:08:12','2020-05-29 03:08:12'),
	(43,'Santiago Rodríguez','santiago-rodriguez',13,'1590721718-Dominican Republic.png','','2020-05-29 03:08:38','2020-05-29 03:08:38'),
	(44,'Santo Domingo Este','santo-domingo-este-1',13,'1590721785-Dominican Republic.png','','2020-05-29 03:09:45','2020-05-29 03:09:45'),
	(45,'Santo Domingo Norte','santo-domingo-norte',13,'1590721798-Dominican Republic.png','','2020-05-29 03:09:58','2020-05-29 03:09:58'),
	(46,'Valverde','valverde',13,'1590721811-Dominican Republic.png','','2020-05-29 03:10:11','2020-05-29 03:10:11');

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `receiver_id` int(11) NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_user_id_index` (`user_id`),
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `user_id`, `receiver_id`, `body`, `status`, `created_at`, `updated_at`)
VALUES
	(4,25,39,'Hi, The employer Z|A Consulting would like to invite you to consider working on the following project<br>Employer Link = https://zwork.com.do/profile/za-consulting<br>Project Title = Marketing<br>Project Link = https://zwork.com.do/job/marketing<br>Message: Oferta',0,'2020-04-30 22:25:59','2020-04-30 22:25:59'),
	(5,25,39,'Hola Renato! Cómo estas? Para que me salieras aquí tuve que enviarte una oferta primero, lo cuál me gusta mucho, porque así tengo un control de las personas que han interactuado por primera vez a través de la página y podemos medir cuantas interacciones resultan en contrataciones',0,'2020-04-30 22:29:13','2020-04-30 22:29:13'),
	(6,25,39,'Hola Renato! Cómo estas? Para que me salieras aquí tuve que enviarte una oferta primero, lo cuál me gusta mucho, porque así tengo un control de las personas que han interactuado por primera vez a través de la página y podemos medir cuantas interacciones resultan en contrataciones',0,'2020-04-30 22:29:14','2020-04-30 22:29:14'),
	(7,40,44,'HOLA',0,'2020-05-25 02:19:03','2020-05-25 02:19:03');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table metas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `metas`;

CREATE TABLE `metas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `metable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `metas_metable_type_metable_id_index` (`metable_type`,`metable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;

INSERT INTO `metas` (`id`, `meta_key`, `meta_value`, `metable_type`, `metable_id`, `created_at`, `updated_at`)
VALUES
	(22,'title','1','App\\Page',1,'2020-03-21 21:41:14','2020-03-21 21:41:14'),
	(128,'title','1','App\\Page',3,'2020-03-27 21:08:23','2020-03-27 21:08:23'),
	(129,'title','1','App\\Page',4,'2020-03-27 21:12:32','2020-03-27 21:12:32'),
	(167,'content0','a:4:{s:11:\"description\";s:1477:\"<div class=\'wt-greetingcontent\'>\r\n        <div class=\'wt-sectionhead\'>\r\n        <div class=\'wt-sectiontitle\'>\r\n        <h2>Greetings &amp; Welcome</h2>\r\n        <span>Start Today For a Great Future</span></div>\r\n        <div class=\'wt-description\'>\r\n        <p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua eniina ilukita ylokem lokateise ination voluptate velite esse cillum dolore eu fugnulla pariatur lokaim urianewce anim id est laborumed.</p>\r\n        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa officia deserunt mollit anim id est laborumed perspiciatis unde omnis isteatus error aluptatem accusantium doloremque laudantium.</p>\r\n        </div>\r\n        </div>\r\n        <div id=\'wt-statistics\' class=\'wt-statistics\'>\r\n        <div class=\'wt-statisticcontent wt-countercolor1\'>\r\n        <h3 data-from=\'0\' data-to=\'1500\' data-speed=\'8000\' data-refresh-interval=\'50\'>1,500</h3>\r\n        <em>k</em>\r\n        <h4>Active Projects</h4>\r\n        </div>\r\n        <div class=\'wt-statisticcontent wt-countercolor2\'>\r\n        <h3 data-from=\'0\' data-to=\'99\' data-speed=\'8000\' data-refresh-interval=\'5.9\'>99</h3>\r\n        <em>%</em>\r\n        <h4>Great Feedback</h4>\r\n        </div>\r\n        <div class=\'wt-statisticcontent wt-countercolor3\'>\r\n        <h3 data-from=\'0\' data-to=\'5000\' data-speed=\'8000\' data-refresh-interval=\'100\'>5,000</h3>\r\n        <em>k</em>\r\n        <h4>Active Freelancers</h4>\r\n        </div>\r\n        </div>\r\n        </div>\";s:12:\"sectionColor\";s:7:\"#f7f7f7\";s:2:\"id\";i:4;s:11:\"parentIndex\";i:0;}','App\\Page',2,'2020-05-27 15:06:27','2020-05-27 15:06:27'),
	(168,'title','1','App\\Page',2,'2020-05-27 15:06:27','2020-05-27 15:06:27'),
	(169,'cat1','a:6:{s:5:\"title\";s:23:\"Explora las Categorías\";s:8:\"subtitle\";s:28:\"Profesionales por Categoría\";s:11:\"description\";s:135:\"<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget leo rutrum, ullamcorper dolor eu, faucibus massa.</span></p>\";s:2:\"id\";i:2;s:11:\"parentIndex\";i:1;s:12:\"sectionColor\";s:7:\"#ffffff\";}','App\\Page',5,'2020-06-01 21:32:22','2020-06-01 21:32:22'),
	(170,'welcome_sections2','a:12:{s:18:\"welcome_background\";s:22:\"1585330246-bg_home.png\";s:11:\"first_title\";s:19:\"Únete como Cliente\";s:9:\"first_url\";s:1:\"#\";s:16:\"first_url_button\";s:14:\"Regístrate ya\";s:17:\"first_description\";s:172:\"Consectetur adipisicing elit sed dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim poskina ilukita ylokem lokateise ination voluptate velit esse cillum.\";s:12:\"second_title\";s:23:\"Únete como Profesional\";s:10:\"second_url\";s:1:\"#\";s:17:\"second_url_button\";s:14:\"Regístrate ya\";s:18:\"second_description\";s:172:\"Consectetur adipisicing elit sed dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim poskina ilukita ylokem lokateise ination voluptate velit esse cillum.\";s:2:\"id\";i:4;s:11:\"parentIndex\";i:2;s:12:\"sectionColor\";s:7:\"#2f4d81\";}','App\\Page',5,'2020-06-01 21:32:22','2020-06-01 21:32:22'),
	(171,'sliders0','a:13:{s:5:\"style\";s:6:\"style1\";s:12:\"slider_image\";a:1:{i:0;s:23:\"1591047142-banner-2.jpg\";}s:18:\"inner_banner_image\";s:22:\"1590530062-front_1.png\";s:16:\"floating_image01\";s:22:\"1585088411-front_3.png\";s:16:\"floating_image02\";s:22:\"1585004983-front_3.png\";s:5:\"title\";s:28:\"Profesionales especializados\";s:8:\"subtitle\";s:31:\"que dan vida a ideas grandiosas\";s:11:\"description\";s:0:\"\";s:10:\"video_link\";s:43:\"https://www.youtube.com/watch?v=J37W6DjqT3Q\";s:11:\"video_title\";s:17:\"See For Yourself!\";s:17:\"video_description\";s:43:\"How it works & experience the ultimate joy.\";s:2:\"id\";i:1;s:11:\"parentIndex\";i:0;}','App\\Page',5,'2020-06-01 21:32:22','2020-06-01 21:32:22'),
	(172,'app_section3','a:11:{s:5:\"title\";s:20:\"Limitless Experience\";s:8:\"subtitle\";s:30:\"Roam Around With Your Business\";s:11:\"description\";s:460:\"<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim poskina ilukita ylokem lokateise ination voluptate velit esse cillum dolore eu fugiat nulla pariatur lokaim urianewce.</p>\r\n    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget leo rutrum, ullamcorper dolor eu, faucibus massa. Etiam placerat mattis pellentesque. Mauris eu mollis arcu. Nullam tincidunt auctor mattis. Donec pretium porta est ut ullamcorper.&nbsp;</p>\";s:11:\"andriod_url\";s:1:\"#\";s:7:\"ios_url\";s:1:\"#\";s:5:\"style\";s:6:\"style1\";s:16:\"background_image\";N;s:9:\"app_image\";s:47:\"1579153406-1558518016-1557484284-mobile-img.png\";s:2:\"id\";i:5;s:11:\"parentIndex\";i:3;s:12:\"sectionColor\";s:7:\"#ffffff\";}','App\\Page',5,'2020-06-01 21:32:22','2020-06-01 21:32:22'),
	(173,'title','0','App\\Page',5,'2020-06-01 21:32:22','2020-06-01 21:32:22');

/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_01_21_082930_create_site_managements_table',1),
	(4,'2019_01_21_083223_create_categories_table',1),
	(5,'2019_01_21_083659_create_pages_table',1),
	(6,'2019_01_21_084005_child_pages',1),
	(7,'2019_01_21_084332_create_locations_table',1),
	(8,'2019_01_21_084630_create_skills_table',1),
	(9,'2019_01_21_084946_private_messages',1),
	(10,'2019_01_21_085428_private_messages_to',1),
	(11,'2019_01_21_103956_create_languages_table',1),
	(12,'2019_01_21_104105_create_jobs_table',1),
	(13,'2019_01_21_105235_create_proposals_table',1),
	(14,'2019_01_21_105802_proposal_documents',1),
	(15,'2019_01_23_063619_create_child_location_table',1),
	(16,'2019_01_23_064221_create_permission_tables',1),
	(17,'2019_01_25_070119_profile',1),
	(18,'2019_01_25_074332_departments',1),
	(19,'2019_01_29_113201_create_skill_user_table',1),
	(20,'2019_01_29_130030_create_catables_table',1),
	(21,'2019_02_01_140348_create_langables_table',1),
	(22,'2019_02_12_082928_create_job_skill_table',1),
	(23,'2019_02_16_103711_create_reports_table',1),
	(24,'2019_02_26_122204_followers',1),
	(25,'2019_02_28_115604_create_email_types_table',1),
	(26,'2019_02_28_115655_create_email_templates_table',1),
	(27,'2019_03_01_071107_create_review-options_table',1),
	(28,'2019_03_01_124110_create_reviews_table',1),
	(29,'2019_03_04_070237_create_packages_table',1),
	(30,'2019_03_04_085836_create_invoices_table',1),
	(31,'2019_03_04_112418_create_orders_table',1),
	(32,'2019_03_04_112537_create_items_table',1),
	(33,'2019_03_04_112635_create_i_p_n_statuses_table',1),
	(34,'2019_03_15_103524_create_messages_table',1),
	(35,'2019_03_19_125626_create_offers_table',1),
	(36,'2019_03_19_125645_create_disputes_table',1),
	(37,'2019_04_06_122330_create_badges_table',1),
	(38,'2019_04_10_131904_create_payouts_table',1),
	(39,'2019_06_17_080227_create_delivery_time_table',1),
	(40,'2019_06_17_080252_create_response_time_table',1),
	(41,'2019_06_17_084715_create_services_table',1),
	(42,'2019_06_18_113753_create_service_user_table',1),
	(43,'2019_06_25_121752_update_profile',1),
	(44,'2019_06_25_135732_update_private_messages',1),
	(45,'2019_06_26_070540_delete_profile_rating',1),
	(46,'2019_07_01_123323_update_reviews',1),
	(47,'2019_07_02_124918_update_payouts',1),
	(48,'2019_07_03_130706_update_packages',1),
	(49,'2019_07_31_080556_update_profile_payout',1),
	(50,'2019_08_01_095648_add_to_payout_type',1),
	(51,'2019_08_05_083823_add_is_active_to_users',1),
	(52,'2019_10_18_133239_add_paid_to_proposals',1),
	(53,'2019_10_18_133520_add_paid_to_service_user',1),
	(54,'2019_10_28_123201_add_videos_to_profiles_table',1),
	(55,'2019_10_31_083735_add_paid_progress_to_proposals',1),
	(56,'2019_10_31_085942_add_paid_progress_to_service_user',1),
	(57,'2019_10_31_104244_add_projects_ids_to_payouts',1),
	(58,'2019_12_17_080700_add_expiry_to_jobs_table',1),
	(59,'2019_12_18_150007_add_bank_column_to_invoices_table',1),
	(60,'2019_12_20_105734_add_type_to_orders_table',1),
	(61,'2019_12_20_142840_add_type_to_items_table',1),
	(62,'2019_12_24_140115_create_metas_table',1),
	(63,'2019_12_24_142522_add_sections_to_pages_table',1),
	(64,'2020_01_20_055407_create_article_categories_table',1),
	(65,'2020_01_20_061623_create_articles_table',1),
	(66,'2020_01_20_062131_create_article_category_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\User',1),
	(2,'App\\User',25),
	(3,'App\\User',26),
	(3,'App\\User',27),
	(3,'App\\User',28),
	(2,'App\\User',29),
	(2,'App\\User',30),
	(2,'App\\User',31),
	(2,'App\\User',32),
	(2,'App\\User',33),
	(3,'App\\User',34),
	(3,'App\\User',35),
	(2,'App\\User',36),
	(2,'App\\User',37),
	(2,'App\\User',38),
	(3,'App\\User',39),
	(3,'App\\User',40),
	(2,'App\\User',42),
	(2,'App\\User',43),
	(3,'App\\User',44),
	(2,'App\\User',45);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table offers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offers`;

CREATE TABLE `offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `freelancer_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;

INSERT INTO `offers` (`id`, `user_id`, `freelancer_id`, `project_id`, `description`, `created_at`, `updated_at`)
VALUES
	(1,25,39,46,'Oferta','2020-04-30 22:25:59','2020-04-30 22:25:59');

/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `invoice_id`, `status`, `created_at`, `updated_at`, `type`)
VALUES
	(1,25,21,NULL,'pending','2020-05-22 00:13:43','2020-05-22 00:13:43',NULL),
	(2,25,21,NULL,'pending','2020-05-22 00:17:09','2020-05-22 00:17:09',NULL),
	(3,25,21,NULL,'pending','2020-05-22 00:17:29','2020-05-22 00:17:29',NULL),
	(4,25,21,NULL,'pending','2020-05-22 00:17:37','2020-05-22 00:17:37',NULL),
	(5,25,21,NULL,'pending','2020-05-22 00:17:58','2020-05-22 00:17:58',NULL),
	(6,25,21,NULL,'pending','2020-05-22 00:17:59','2020-05-22 00:17:59',NULL),
	(7,25,21,NULL,'pending','2020-05-22 00:18:27','2020-05-22 00:18:27',NULL),
	(8,25,21,NULL,'pending','2020-05-22 00:18:40','2020-05-22 00:18:40',NULL),
	(9,45,21,NULL,'pending','2020-05-22 00:58:23','2020-05-22 00:58:23',NULL),
	(10,45,21,NULL,'pending','2020-05-22 00:58:36','2020-05-22 00:58:36',NULL),
	(11,45,21,NULL,'pending','2020-05-22 01:06:47','2020-05-22 01:06:47',NULL),
	(12,39,3,NULL,'pending','2020-05-22 01:11:50','2020-05-22 01:11:50',NULL),
	(13,25,21,NULL,'pending','2020-05-22 02:34:16','2020-05-22 02:34:16',NULL),
	(14,40,3,NULL,'pending','2020-05-22 02:40:59','2020-05-22 02:40:59',NULL),
	(15,25,21,NULL,'pending','2020-05-22 02:43:47','2020-05-22 02:43:47',NULL),
	(16,25,2,NULL,'pending','2020-05-22 02:52:33','2020-05-22 02:52:33',NULL),
	(17,45,21,NULL,'pending','2020-05-22 17:33:53','2020-05-22 17:33:53',NULL),
	(18,45,21,NULL,'pending','2020-05-22 17:36:18','2020-05-22 17:36:18',NULL),
	(19,45,21,NULL,'pending','2020-05-22 17:38:28','2020-05-22 17:38:28',NULL),
	(20,45,21,NULL,'pending','2020-05-22 17:54:30','2020-05-22 17:54:30',NULL),
	(21,45,21,NULL,'pending','2020-05-22 18:28:45','2020-05-22 18:28:45',NULL),
	(22,45,21,NULL,'pending','2020-05-22 18:28:59','2020-05-22 18:28:59',NULL),
	(23,45,21,NULL,'pending','2020-05-22 18:31:08','2020-05-22 18:31:08',NULL),
	(24,45,21,NULL,'pending','2020-05-22 19:16:27','2020-05-22 19:16:27',NULL),
	(25,45,21,NULL,'pending','2020-05-22 19:16:44','2020-05-22 19:16:44',NULL),
	(26,25,21,NULL,'pending','2020-05-22 23:02:06','2020-05-22 23:02:06',NULL);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table packages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `packages`;

CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL,
  `role_id` int(11) NOT NULL,
  `trial` tinyint(4) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;

INSERT INTO `packages` (`id`, `title`, `subtitle`, `slug`, `cost`, `role_id`, `trial`, `badge_id`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Trial Employer','30 Days Trial','trial-employer',0.00,2,1,0,'a:5:{s:4:\"jobs\";s:1:\"5\";s:13:\"featured_jobs\";s:1:\"2\";s:8:\"duration\";s:2:\"30\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,'Trial Freelancer','30 Days Trial','trial-freelancer',0.00,3,1,0,'a:7:{s:14:\"no_of_connects\";s:2:\"10\";s:12:\"no_of_skills\";s:1:\"3\";s:14:\"no_of_services\";s:1:\"5\";s:23:\"no_of_featured_services\";s:1:\"5\";s:8:\"duration\";s:2:\"10\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'Basic','Extended Plan For Managerial','basic',60.00,3,0,1,'a:8:{s:14:\"no_of_connects\";s:2:\"60\";s:12:\"no_of_skills\";s:2:\"15\";s:14:\"no_of_services\";s:1:\"8\";s:23:\"no_of_featured_services\";s:1:\"5\";s:8:\"duration\";s:2:\"10\";s:5:\"badge\";s:1:\"1\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(4,'Plus Members','Starter Plan For Newbie','plus-member',90.00,3,0,2,'a:8:{s:14:\"no_of_connects\";s:2:\"90\";s:12:\"no_of_skills\";s:2:\"20\";s:14:\"no_of_services\";s:2:\"10\";s:23:\"no_of_featured_services\";s:1:\"8\";s:8:\"duration\";s:2:\"10\";s:5:\"badge\";s:1:\"2\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(5,'Pro Members','Popular Plan For Professionals','pro-members',120.00,3,0,3,'a:8:{s:14:\"no_of_connects\";s:3:\"120\";s:12:\"no_of_skills\";s:2:\"30\";s:14:\"no_of_services\";s:2:\"20\";s:23:\"no_of_featured_services\";s:2:\"10\";s:8:\"duration\";s:2:\"10\";s:5:\"badge\";s:1:\"3\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(6,'Paltinum','For Employers','paltinum',90.00,2,0,0,'a:5:{s:4:\"jobs\";s:2:\"15\";s:13:\"featured_jobs\";s:1:\"5\";s:8:\"duration\";s:2:\"10\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(7,'Silver','Package for Employers','silver',120.00,2,0,0,'a:5:{s:4:\"jobs\";s:1:\"5\";s:13:\"featured_jobs\";s:1:\"3\";s:8:\"duration\";s:2:\"30\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(8,'Gold','Package for Employers','gold',180.00,2,0,0,'a:5:{s:4:\"jobs\";s:2:\"10\";s:13:\"featured_jobs\";s:1:\"5\";s:8:\"duration\";s:3:\"360\";s:13:\"banner_option\";s:4:\"true\";s:12:\"private_chat\";s:4:\"true\";}','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation_type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sections` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `title`, `slug`, `body`, `relation_type`, `created_at`, `updated_at`, `sections`)
VALUES
	(1,'Info','info','<div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">\n<div class=\"wt-greeting-holder\">\n<div class=\"row\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-7 float-left\">\n<div class=\"wt-greetingcontent\">\n<div class=\"wt-sectionhead\">\n<div class=\"wt-sectiontitle\">\n<h2>Bienvenidos!</h2>\nTrabajando hacia el futuro!</div>\n<div class=\"wt-description\">\n<p>Somos fieles creyentes de que estamos rodeados de talentos escondidos, profesionales altamente capacitados que solo necesitan una oportunidad para brillar. Z Work es la herramienta que nace para ayudarte a cerrar brechas entre tus sue&ntilde;os y la realidad.</p>\n<p>Crea tu perfil y dale a tu vida profesional o a tu empresa el giro que necesita con opciones que responden a tu estilo de vida, tu ideolog&iacute;a de trabajo, tu modelo de negocio, tu presupuesto, y tu tiempo, sin tener que salir de casa o de tu oficina.</p>\n</div>\n</div>\n<div id=\"wt-statistics\" class=\"wt-statistics\">\n<div class=\"wt-statisticcontent wt-countercolor1\">\n<h3 data-from=\"0\" data-to=\"1500\" data-speed=\"8000\" data-refresh-interval=\"50\">1,500</h3>\n<em>k</em>\n<h4>Proyectos Activos</h4>\n</div>\n<div class=\"wt-statisticcontent wt-countercolor2\">\n<h3 data-from=\"0\" data-to=\"99.6\" data-speed=\"8000\" data-refresh-interval=\"5.9\">75</h3>\n<em>%</em>\n<h4>Clientes Satisfechos</h4>\n</div>\n<div class=\"wt-statisticcontent wt-countercolor3\">\n<h3 data-from=\"0\" data-to=\"5000\" data-speed=\"8000\" data-refresh-interval=\"100\">5,000</h3>\n<em>k</em>\n<h4>Profesionales Activos</h4>\n</div>\n</div>\n</div>\n</div>\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-5 float-left\">\n<div class=\"wt-greetingvideo\">\n<figure><a href=\"https://www.youtube.com/watch?v=B-ph2g5o2K4\" rel=\"prettyPhoto[video]\" data-rel=\"prettyPhoto[video]\"><img src=\"http://www.amentotech.com/projects/worketic/images/video-img.png\" alt=\"video\" width=\"415\" height=\"450\" /> </a></figure>\n</div>\n</div>\n</div>\n</div>\n</div>',0,'2020-03-05 13:56:45','2020-03-21 21:41:14',NULL),
	(2,'Nuestro Equipo','nuestro-equipo','null',1,'2020-03-05 13:56:45','2020-03-23 16:35:09','a:1:{i:0;O:8:\"stdClass\":5:{s:4:\"name\";s:19:\"Description Section\";s:7:\"section\";s:15:\"content_section\";s:5:\"value\";s:7:\"content\";s:4:\"icon\";s:10:\"img-09.png\";s:2:\"id\";i:4;}}'),
	(3,'Como Funciona','como-funciona','<div class=\"wt-contentwrappers\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-12 float-left\">\n<div class=\"wt-howitwork-hold wt-bgwhite wt-haslayout\">\n<ul class=\"wt-navarticletab wt-navarticletabvtwo nav navbar-nav\">\n<li class=\"nav-item\"><a id=\"all-tab\" class=\"active\" href=\"#forhiring\" data-toggle=\"tab\">Para Clientes</a></li>\n<li class=\"nav-item\"><a id=\"trading-tab\" href=\"#faq\" data-toggle=\"tab\">FAQ</a></li>\n</ul>\n<div class=\"tab-content wt-haslayout\">\n<div id=\"forhiring\" class=\"wt-contentarticle tab-pane active fade show\">\n<div class=\"row\">\n<div class=\"wt-starthiringhold wt-innerspace wt-haslayout\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-7 float-left\">\n<div class=\"wt-starthiringcontent\">\n<div class=\"wt-sectionhead\">\n<div class=\"wt-sectiontitle\">\n<h2>Contrata Servicios o Profesionales</h2>\nTrabajando hacia el Futuro!</div>\n<div class=\"wt-description\">\n<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua eniina ilukita ylokem lokateise ination voluptate velite esse cillum dolore eu fugnulla pariatur lokaim urianewce animid <a>Learn more</a></p>\n</div>\n</div>\n<ul class=\"wt-accordionhold accordion\">\n<li>\n<div id=\"headingOne\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapseOne\">Adipisicing elit, sed do eiusmod tempor incididunt?</div>\n<div id=\"collapseOne\" class=\"wt-accordiondetails collapse show\" aria-labelledby=\"headingOne\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore eta dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingtwo\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsetwo\">Dolore magna aliqua enim ad minim veniam?</div>\n<div id=\"collapsetwo\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingtwo\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingthreea\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsethree\">Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo?</div>\n<div id=\"collapsethree\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingthreea\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-5 float-right\">\n<div class=\"wt-howtoworkimg\">\n<figure><img src=\"http://www.amentotech.com/projects/worketic/images/work/img-01.jpg\" alt=\"img description\" width=\"415\" height=\"386\" /></figure>\n</div>\n</div>\n</div>\n<div class=\"wt-starthiringhold wt-innerspace wt-haslayout\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-7 float-right\">\n<div class=\"wt-starthiringcontent\">\n<div class=\"wt-sectionhead\">\n<div class=\"wt-sectiontitle\">\n<h2>Obt&eacute;n Resultados</h2>\nDise&ntilde;a un Equipo a la Medida</div>\n<div class=\"wt-description\">\n<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua eniina ilukita ylokem lokateise ination voluptate velite esse cillum dolore eu fugnulla pariatur lokaim urianewce animid learn <a>more</a></p>\n</div>\n</div>\n<ul class=\"wt-accordionhold accordion\">\n<li>\n<div id=\"headingtwo2\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsetwo2\">Nostrud exercitation ullamco laboris nisi ut aliquip?</div>\n<div id=\"collapsetwo2\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingtwo2\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingtwo4\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsetwo4\">Commodo consequat aute irure dolor in reprehenderit in voluptate velit?</div>\n<div id=\"collapsetwo4\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingtwo4\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingthree2\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsethree2\">Cillum dolore eu fugiat nulla pariatur?</div>\n<div id=\"collapsethree2\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingthree2\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-5 float-left\">\n<div class=\"wt-howtoworkimg\">\n<figure><img src=\"http://www.amentotech.com/projects/worketic/images/work/img-02.jpg\" alt=\"img description\" /></figure>\n</div>\n</div>\n</div>\n<div class=\"wt-starthiringhold wt-innerspace wt-haslayout\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-7 float-left\">\n<div class=\"wt-starthiringcontent\">\n<div class=\"wt-sectionhead\">\n<div class=\"wt-sectiontitle\">\n<h2>Invirtiendo en Talento</h2>\nTu equipo es tu mayor activo</div>\n<div class=\"wt-description\">\n<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua eniina ilukita ylokem lokateise ination voluptate velite esse cillum dolore eu fugnulla pariatur lokaim urianewce animid learn <a>more</a></p>\n</div>\n</div>\n<ul class=\"wt-accordionhold accordion\">\n<li>\n<div id=\"headingOne3\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapseOne3\">Excepteur sint occaecat cupidatat non proident?</div>\n<div id=\"collapseOne3\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingOne3\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingtwo3\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsetwo3\">Sunt in culpa qui officia deserunt mollit anim id est laborum?</div>\n<div id=\"collapsetwo3\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingtwo3\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingthree3\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsethree3\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem?</div>\n<div id=\"collapsethree3\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingthree3\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-5 float-right\">\n<div class=\"wt-howtoworkimg\">\n<figure><img src=\"http://www.amentotech.com/projects/worketic/images/work/img-03.jpg\" alt=\"img description\" width=\"415\" height=\"386\" /></figure>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div id=\"forfreelancing\" class=\"wt-contentarticle tab-pane fade\">\n<div class=\"row\">\n<div class=\"wt-starthiringhold wt-innerspace wt-haslayout\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-7 float-right\">\n<div class=\"wt-starthiringcontent\">\n<div class=\"wt-sectionhead\">\n<div class=\"wt-sectiontitle\">\n<h2>Postea Servicios o Aplica a Proyectos</h2>\nStart Today For a Great Future</div>\n<div class=\"wt-description\">\n<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua eniina ilukita ylokem lokateise ination voluptate velite esse cillum dolore eu fugnulla pariatur lokaim urianewce animid learn <a>more</a></p>\n</div>\n</div>\n<ul class=\"wt-accordionhold accordion\">\n<li>\n<div id=\"headingOneq\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapseOneq\">Adipisicing elit, sed do eiusmod tempor incididunt?</div>\n<div id=\"collapseOneq\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingOneq\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingtwoq\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsetwoq\">Dolore magna aliqua enim ad minim veniam?</div>\n<div id=\"collapsetwoq\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingtwoq\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingthreeq\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsethreeq\">Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo?</div>\n<div id=\"collapsethreeq\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingthreeq\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-5 float-left\">\n<div class=\"wt-howtoworkimg\">\n<figure><img src=\"http://www.amentotech.com/projects/worketic/images/work/img-01.jpg\" alt=\"img description\" width=\"415\" height=\"386\" /></figure>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div id=\"faq\" class=\"wt-contentarticle tab-pane fade\">\n<div class=\"row\">\n<div class=\"wt-starthiringhold wt-innerspace wt-haslayout\">\n<div class=\"col-12 col-sm-12 col-md-12 col-lg-7 float-left\">\n<div class=\"wt-starthiringcontent\">\n<div class=\"wt-sectionhead\">\n<div class=\"wt-sectiontitle\">\n<h2>Postea Servicios o Aplica a Proyectos</h2>\nStart Today For a Great Future</div>\n<div class=\"wt-description\">\n<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua eniina ilukita ylokem lokateise ination voluptate velite esse cillum dolore eu fugnulla pariatur lokaim urianewce animid learn <a>more</a></p>\n</div>\n</div>\n<ul class=\"wt-accordionhold accordion\">\n<li>\n<div id=\"headingOnea\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapseOnea\">Nostrud exercitation ullamco laboris nisi ut aliquip?</div>\n<div id=\"collapseOnea\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingOne\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingtwoa\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsetwoa\">Commodo consequat aute irure dolor in reprehenderit in voluptate velit?</div>\n<div id=\"collapsetwoa\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingtwoa\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n<li>\n<div id=\"headingthree\" class=\"wt-accordiontitle collapsed\" data-toggle=\"collapse\" data-target=\"#collapsethreea\">Cillum dolore eu fugiat nulla pariatur?</div>\n<div id=\"collapsethreea\" class=\"wt-accordiondetails collapse\" aria-labelledby=\"headingthree\">\n<div class=\"wt-title\">\n<h3>Digital Marketing</h3>\n</div>\n<div class=\"wt-description\">\n<p>Consectetur adipisicing elit sed aeiusmisuod tempor incididunt labore dolore ma alaeiqua enim ade minim veniam quis nostr xecitation ullamcoaris nisi ut aliquipa extaea coedmmmodo equate irure dolawor in reprehenderit.</p>\n</div>\n<div class=\"wt-likeunlike\">Did you find this useful?</div>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"col-12 col-sm-12 col-md-4 col-lg-5 float-right\">\n<div class=\"wt-howtoworkimg\">\n<figure><img src=\"http://www.amentotech.com/projects/worketic/images/work/img-01.jpg\" alt=\"img description\" width=\"415\" height=\"386\" /></figure>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>',1,'2020-03-05 13:56:45','2020-03-21 22:00:51',NULL),
	(4,'Política de Privacidad','politica-de-privacidad','<div id=\"wt-twocolumns\" class=\"wt-twocolumns wt-haslayout\">\r\n                    <div class=\"col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-4 float-left\">\r\n                    <aside id=\"wt-sidebar\" class=\"wt-sidebar\">\r\n                    <div class=\"wt-widget wt-effectiveholder\">\r\n                    <div class=\"wt-widgettitle\">\r\n                    <h2>Effective T&amp;C</h2>\r\n                    </div>\r\n                    <div class=\"wt-widgetcontent\">\r\n                    <ul class=\"wt-effectivecontent\">\r\n                    <li><a>Adipisicing elit sed do eiusmod</a></li>\r\n                    <li><a>Tempor incididunt</a></li>\r\n                    <li><a>How To Submit Claim Report</a></li>\r\n                    <li><a>Ut enim ad minim veniam</a></li>\r\n                    <li><a>Quis nostrud exercitation</a></li>\r\n                    <li><a>Ullamco laboris nisiut</a></li>\r\n                    <li><a>Aliquip ex ea commodo</a></li>\r\n                    <li><a>Consequat duis aute</a></li>\r\n                    <li><a>Irure dolorin</a></li>\r\n                    <li><a>Reprehenderit</a></li>\r\n                    <li><a>Voluptate velit esse cillum</a></li>\r\n                    </ul>\r\n                    </div>\r\n                    </div>\r\n                    </aside>\r\n                    </div>\r\n                    <div class=\"col-xs-12 col-sm-12 col-md-7 col-lg-7 col-xl-8 float-left\">\r\n                    <div class=\"wt-submitreportholder wt-bgwhite\">\r\n                    <div class=\"wt-titlebar\">\r\n                    <h2>How To Submit Claim Report</h2>\r\n                    </div>\r\n                    <div class=\"wt-reportdescription\">\r\n                    <div class=\"wt-description\">\r\n                    <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud <a href=\"javascrip:void(0);\"> exercitation ullamco laboris</a> nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut <a href=\"javascrip:void(0);\"> perspiciatis unde</a> omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n                    <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet consectetur, adipisci velit, sed quia magnam aliquam quaerat voluptatem.</p>\r\n                    </div>\r\n                    <div class=\"wt-title\">\r\n                    <h3>Step #01</h3>\r\n                    </div>\r\n                    <div class=\"wt-description\">\r\n                    <p>Aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n                    <p>Voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n                    <p>Odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet consectetur, adipisci velit, sed quia magnam aliquam quaerat voluptatem.</p>\r\n                    </div>\r\n                    <div class=\"wt-title\">\r\n                    <h3>Step #02</h3>\r\n                    </div>\r\n                    <div class=\"wt-description\">\r\n                    <p>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n                    <p>Consequuntur magni dolores eios qui ratione voluptatem sequi nesciunt. Nequerro quisquam est, qui dolorem ipsum quia dolor sit amet consectetur, adipisci velit, sed quia magnam aliquam quaerat voluptatem.</p>\r\n                    </div>\r\n                    <div class=\"wt-title\">\r\n                    <h3>Step #03</h3>\r\n                    </div>\r\n                    <div class=\"wt-description\">\r\n                    <p>Dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet consectetur adipisci velit.</p>\r\n                    </div>\r\n                    </div>\r\n                    </div>\r\n                    </div>\r\n                    </div>',0,'2020-03-05 13:56:45','2020-03-23 16:36:07',NULL),
	(5,'Home','home','null',1,'2020-03-05 13:56:45','2020-03-25 00:35:17','a:4:{i:0;O:8:\"stdClass\":5:{s:4:\"name\";s:14:\"Slider Section\";s:7:\"section\";s:6:\"slider\";s:5:\"value\";s:7:\"sliders\";s:4:\"icon\";s:10:\"img-01.png\";s:2:\"id\";i:1;}i:1;O:8:\"stdClass\":5:{s:4:\"name\";s:16:\"Category Section\";s:7:\"section\";s:8:\"category\";s:5:\"value\";s:3:\"cat\";s:4:\"icon\";s:10:\"img-02.png\";s:2:\"id\";i:2;}i:2;O:8:\"stdClass\":5:{s:4:\"name\";s:15:\"Welcome Section\";s:7:\"section\";s:15:\"welcome_section\";s:5:\"value\";s:16:\"welcome_sections\";s:4:\"icon\";s:10:\"img-03.png\";s:2:\"id\";i:4;}i:3;O:8:\"stdClass\":5:{s:4:\"name\";s:11:\"APP Section\";s:7:\"section\";s:11:\"app_section\";s:5:\"value\";s:11:\"app_section\";s:4:\"icon\";s:10:\"img-04.png\";s:2:\"id\";i:5;}}');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;

INSERT INTO `password_resets` (`email`, `token`, `created_at`)
VALUES
	('renatofk+free@gmail.com','$2y$10$iaCdqvN3SksR709bm6n2W.8egHj0bosvaszB9Kqs4N9DFV9gJhyWm','2020-05-18 14:43:04');

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payouts`;

CREATE TABLE `payouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `type` enum('job','service') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job',
  `bank_details` text COLLATE utf8mb4_unicode_ci,
  `projects_ids` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `payouts_user_id_index` (`user_id`),
  CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table private_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `private_messages`;

CREATE TABLE `private_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `notify` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_type` enum('job','service') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `private_messages` WRITE;
/*!40000 ALTER TABLE `private_messages` DISABLE KEYS */;

INSERT INTO `private_messages` (`id`, `author_id`, `proposal_id`, `content`, `attachments`, `notify`, `created_at`, `updated_at`, `project_type`)
VALUES
	(1,4,1,'<p><span style=\"font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in risus id mauris convallis sollicitudin. Etiam porta, massa finibus bibendum fermentum, velit diam hendrerit libero, eu consectetur sapien velit ac nibh. Ut in volutpat nisi, et suscipit libero.</span></p>',NULL,0,'2020-03-05 13:56:45','2020-03-05 13:56:45','job'),
	(2,21,1,'Donec placerat, massa eu tincidunt volutpat.','a:1:{i:0;s:52:\"1555913392-How-to-run-mysql-command-in-database.docx\";}',0,'2020-03-05 13:56:45','2020-03-05 13:56:45','job'),
	(3,4,1,'Donec placerat, massa eu tincidunt volutpat.',NULL,0,'2020-03-05 13:56:45','2020-03-05 13:56:45','job'),
	(4,21,1,'Donec placerat, massa eu tincidunt volutpat.','a:1:{i:0;s:52:\"1555913456-How-to-run-mysql-command-in-database.docx\";}',0,'2020-03-05 13:56:45','2020-03-05 13:56:45','job');

/*!40000 ALTER TABLE `private_messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table private_messages_to
# ------------------------------------------------------------

DROP TABLE IF EXISTS `private_messages_to`;

CREATE TABLE `private_messages_to` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `private_message_id` int(11) DEFAULT NULL,
  `recipent_id` int(11) NOT NULL,
  `message_read` tinyint(4) NOT NULL,
  `read_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `private_messages_to` WRITE;
/*!40000 ALTER TABLE `private_messages_to` DISABLE KEYS */;

INSERT INTO `private_messages_to` (`id`, `private_message_id`, `recipent_id`, `message_read`, `read_date`, `created_at`, `updated_at`)
VALUES
	(1,1,21,0,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,2,4,0,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,3,21,0,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(4,4,4,0,NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `private_messages_to` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table professions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `professions`;

CREATE TABLE `professions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;

INSERT INTO `professions` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Abogado','abogado','','2020-04-04 02:37:30','2020-04-04 02:37:30'),
	(2,'Actor','actor','','2020-04-04 02:37:37','2020-04-04 02:37:37'),
	(3,'Actuario','actuario','','2020-04-04 02:37:44','2020-04-04 02:37:44'),
	(4,'Administrador de Base de Datos','administrador-de-base-de-datos','','2020-04-04 02:37:54','2020-04-04 02:37:54'),
	(5,'Administrador de Empresas','administrador-de-empresas','','2020-04-04 02:38:05','2020-04-04 02:38:05'),
	(6,'Administrador de Sistemas','administrador-de-sistemas','','2020-04-04 02:49:45','2020-04-04 02:49:45'),
	(7,'Agente de Viajes','agente-de-viajes','','2020-04-04 02:49:52','2020-04-04 02:49:52'),
	(8,'Agrimensor','agrimensor','','2020-04-04 02:49:59','2020-04-04 02:49:59'),
	(9,'Alguacil','alguacil','','2020-04-04 02:50:05','2020-04-04 02:50:05'),
	(10,'Arquitecto','arquitecto','','2020-04-04 02:50:10','2020-04-04 02:50:10'),
	(11,'Arreglista','arreglista','','2020-04-04 02:50:18','2020-04-04 02:50:18'),
	(12,'Artista Digital','artista-digital','','2020-04-04 02:50:25','2020-04-04 02:50:25'),
	(13,'Asesor','asesor','','2020-04-04 02:50:31','2020-04-04 02:50:31'),
	(14,'Auditor','auditor','','2020-04-04 02:50:37','2020-04-04 02:50:37'),
	(15,'Biólogo','biologo','','2020-04-04 02:50:43','2020-04-04 02:50:43'),
	(16,'Biotecnólogo','biotecnologo','','2020-04-04 02:51:03','2020-04-04 02:51:03'),
	(17,'Blogger','blogger','','2020-04-04 02:51:09','2020-04-04 02:51:09');

/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `no_of_employees` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freelancer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `english_level` enum('basic','conversational','fluent','native','professional') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hourly_rate` int(11) DEFAULT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `education` text COLLATE utf8mb4_unicode_ci,
  `awards` text COLLATE utf8mb4_unicode_ci,
  `projects` text COLLATE utf8mb4_unicode_ci,
  `saved_freelancer` text COLLATE utf8mb4_unicode_ci,
  `offers` text COLLATE utf8mb4_unicode_ci,
  `saved_jobs` text COLLATE utf8mb4_unicode_ci,
  `saved_employers` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avater` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `delete_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_searchable` text COLLATE utf8mb4_unicode_ci,
  `profile_blocked` text COLLATE utf8mb4_unicode_ci,
  `weekly_alerts` text COLLATE utf8mb4_unicode_ci,
  `message_alerts` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `saved_services` text COLLATE utf8mb4_unicode_ci,
  `ratings` text COLLATE utf8mb4_unicode_ci,
  `payout_settings` text COLLATE utf8mb4_unicode_ci,
  `videos` text COLLATE utf8mb4_unicode_ci,
  `company_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rnc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rte_id` int(11) DEFAULT NULL,
  `camara_id` int(11) DEFAULT NULL,
  `nr` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_activity` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `marital_status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;

INSERT INTO `profiles` (`id`, `user_id`, `department_id`, `no_of_employees`, `freelancer_type`, `english_level`, `hourly_rate`, `experience`, `education`, `awards`, `projects`, `saved_freelancer`, `offers`, `saved_jobs`, `saved_employers`, `address`, `longitude`, `latitude`, `avater`, `banner`, `gender`, `tagline`, `description`, `delete_reason`, `delete_description`, `payout_id`, `profile_searchable`, `profile_blocked`, `weekly_alerts`, `message_alerts`, `created_at`, `updated_at`, `saved_services`, `ratings`, `payout_settings`, `videos`, `company_name`, `phone`, `contact_name`, `position`, `rnc`, `rte_id`, `camara_id`, `nr`, `main_activity`, `nationality`, `birthdate`, `marital_status`, `id_type`, `id_number`, `profession_id`, `grade_id`)
VALUES
	(1,1,NULL,NULL,'Basic',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','1590014969-Picture1.png','1590014969-Picture3.png','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-05 13:56:45','2020-05-20 22:49:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(25,25,1,'10','Basic','professional',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Calle Máximo Avilés Blonda #12 Ensanche Julieta Morales. 10130. IM Plaza, Local 2-B.','18.471031','-69.945447','1585688204-LOGO 2020.png','1585689456-Picture1.png','','Innovation is our rule!','Empresa dedicada a la consultoría empresarial compuesta por un equipo de profesionales altamente cualificados, enfocados en ofrecer soluciones orientadas al desarrollo social y al crecimiento sostenido de nuestros clientes mediante servicios vanguardistas, bajo los más altos estándares de calidad.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-27 19:07:57','2020-05-22 02:50:56',NULL,NULL,'a:2:{s:4:\"type\";s:6:\"paypal\";s:12:\"paypal_email\";s:17:\"zworkrd@gmail.com\";}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(26,38,2,'sas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rua Joao Alves de Moraes, 205 - Pirituba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-10 00:48:03','2020-04-10 00:48:03',NULL,NULL,NULL,NULL,'Mobilog','8492208455','Renato','CEO','1123123',1,1,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(27,39,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Luis Alberti 28 Naco',NULL,NULL,NULL,NULL,'male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-10 00:52:14','2020-04-10 00:52:14',NULL,NULL,NULL,NULL,NULL,'8492208455',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brasil','1988-06-05','Married','C','4022512329-4',7,2),
	(28,40,15,NULL,'Basic','professional',150,'a:1:{i:0;a:5:{s:9:\"job_title\";s:19:\"Chief Legal Officer\";s:10:\"start_date\";s:10:\"2019-03-14\";s:8:\"end_date\";s:11:\"Fecha final\";s:13:\"company_title\";s:33:\"Zapata Aquino & Asociados, S.R.L.\";s:11:\"description\";N;}}','a:1:{i:0;a:5:{s:12:\"degree_title\";s:41:\"LL.M. Securities and Financial Regulation\";s:10:\"start_date\";s:10:\"2017-05-21\";s:8:\"end_date\";s:10:\"2015-08-24\";s:15:\"institute_title\";s:32:\"Georgetown University Law Center\";s:11:\"description\";N;}}',NULL,NULL,'a:1:{i:0;i:32;}',NULL,NULL,'a:2:{i:0;i:25;i:1;i:42;}','C/ El Retiro 5A Piantini','','','DC261759-2D79-4580-B5A8-765BB077FD11_1_105_c.jpeg','1586488587-Alexandra.png','female','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-10 02:01:49','2020-05-25 02:08:56',NULL,NULL,'a:0:{}','a:1:{i:0;a:1:{s:3:\"url\";N;}}',NULL,'8097075377',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Dominicana','1991-08-25','Single','C','40220856633',0,5),
	(30,42,4,'srl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Santo Domingo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-08 18:32:13','2020-05-08 18:32:13',NULL,NULL,NULL,NULL,'Stamina','8098888888','Nohely','CEO','112265566',0,2,'d5522','Asesoría y capacitación',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(31,43,4,'srl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'STO DGO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-08 18:46:13','2020-05-08 18:46:13',NULL,NULL,NULL,NULL,'st','8099658855','n','CEO','123456',0,0,'SS1123','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(32,44,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'female',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-08 19:24:26','2020-05-08 19:24:26',NULL,NULL,NULL,NULL,NULL,'8097418520',NULL,NULL,NULL,NULL,NULL,NULL,'','dominicaa','1992-01-03','Single','C','40221687367',13,5),
	(33,45,6,'srl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Luis Alberti 28 Naco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-22 00:54:56','2020-05-22 00:54:56',NULL,NULL,NULL,NULL,'FosterTech','+18492208455','Renato','Gerente','132071506',0,2,'123123123','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table proposal_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proposal_documents`;

CREATE TABLE `proposal_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table proposals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proposals`;

CREATE TABLE `proposals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `freelancer_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `completion_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `hired` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('pending','hired','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paid` enum('pending','completed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_progress` enum('in-progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in-progress',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;

INSERT INTO `proposals` (`id`, `freelancer_id`, `job_id`, `content`, `amount`, `completion_time`, `attachments`, `hired`, `status`, `created_at`, `updated_at`, `paid`, `paid_progress`)
VALUES
	(2,39,46,'Soy Renato',500,'weekly',NULL,0,'pending','2020-04-30 22:29:24','2020-04-30 22:29:24',NULL,'in-progress'),
	(4,44,47,'aaaaaaaaaaaaaaa',9995,'six_month',NULL,0,'pending','2020-05-10 19:47:16','2020-05-10 19:47:16',NULL,'in-progress');

/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportable_id` int(11) NOT NULL,
  `reportable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table response_times
# ------------------------------------------------------------

DROP TABLE IF EXISTS `response_times`;

CREATE TABLE `response_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `response_times` WRITE;
/*!40000 ALTER TABLE `response_times` DISABLE KEYS */;

INSERT INTO `response_times` (`id`, `title`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'1 Hour','1-hour','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,'2 Hours','2-hours','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'3 Hours','3-hours','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `response_times` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table review_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_options`;

CREATE TABLE `review_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `review_options` WRITE;
/*!40000 ALTER TABLE `review_options` DISABLE KEYS */;

INSERT INTO `review_options` (`id`, `title`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'How was my proffesional behaviour?','how-was-my-proffesional-behaviour?','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,'How was my quality of work?','how-was-my-quality-of-work?','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'Was I focused to deadline?','was-i-focused-to-deadline?','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(4,'Was it worth it having my services?','was-it-worth-it-having-my-services?','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `review_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `receiver_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avg_rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_type` enum('job','service') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job',
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_index` (`user_id`),
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `role_type`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','admin','web','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(2,'employer','employer','web','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'freelancer','freelancer','web','2020-03-05 13:56:45','2020-03-05 13:56:45');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rtes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rtes`;

CREATE TABLE `rtes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rtes` WRITE;
/*!40000 ALTER TABLE `rtes` DISABLE KEYS */;

INSERT INTO `rtes` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Exportadores','exportadores','','2020-04-02 02:21:52','2020-04-02 02:21:52');

/*!40000 ALTER TABLE `rtes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_user`;

CREATE TABLE `service_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `type` enum('seller','employer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'seller',
  `status` enum('hired','completed','cancelled','pending','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid` enum('pending','completed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_progress` enum('in-progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in-progress',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `service_user` WRITE;
/*!40000 ALTER TABLE `service_user` DISABLE KEYS */;

INSERT INTO `service_user` (`id`, `service_id`, `user_id`, `seller_id`, `type`, `status`, `paid`, `paid_progress`)
VALUES
	(21,21,44,44,'seller','published',NULL,'in-progress');

/*!40000 ALTER TABLE `service_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('published','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `delivery_time_id` int(11) NOT NULL,
  `response_time_id` int(11) NOT NULL,
  `english_level` enum('basic','conversational','fluent','native','professional') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` text COLLATE utf8mb4_unicode_ci,
  `show_attachments` text COLLATE utf8mb4_unicode_ci,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;

INSERT INTO `services` (`id`, `title`, `slug`, `status`, `delivery_time_id`, `response_time_id`, `english_level`, `price`, `description`, `location_id`, `address`, `longitude`, `latitude`, `is_featured`, `show_attachments`, `attachments`, `code`, `views`, `created_at`, `updated_at`)
VALUES
	(8,'I Will Create Automated Shopify Dropshipping Store','i-will-develop-ios-and-android-mobile-app-using-react-native-8','published',3,3,'fluent',20,'<p>Excepteur sint occaecat cupidatat non proident, saeunt in culpa qui officia deserunt mollit anim id est laborum. Seden utem perspiciatis undesieu.</p>\r\n                    <p>Accusantium doque laudantium, totam rem aiam eaqueiu ipsa quae ab illoion inventoren veritatisetm quasitea architecto beataea dictaed quia couuntur magni dolores eos quistm ratione vtatem seque nesnt. Neque porro quamest quioremas ipsum quiatem dolor situe sitem amet conctetur adipisci velit sedate quianon.</p>\r\n                    <div class=\"wt-title\">\r\n                    <h3>Why Should You Hire Me?</h3>\r\n                    </div>\r\n                    <p>Laborum sed ut perspiciatis unde omnis iste natus error sitems voluptatem accusantium doloremque laudantium, totam rem aiam eaque ipsa quae ab illo inventore veritatis etna quasi architecto beatae vitae dictation explicabo. nemo enim ipsam fugit.</p>\r\n                    <p>Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nequei porrom quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velitn, sed quia nonae numquam eius modi tempora incidunt labore omnis iste natus error sites voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quaem ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia conseq aeuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>',6,'test address','4568','4512','true','true','a:3:{i:0;s:17:\"1562310637-04.jpg\";i:1;s:17:\"1562310637-05.jpg\";i:2;s:17:\"1562310637-16.jpg\";}','K7YLR93Q',4,'2020-03-05 13:56:45','2020-05-27 23:50:00'),
	(21,'Manejo de reses sociales','manejo-de-reses-sociales','published',3,3,'conversational',5000,'<p>mmmmmm.</p>',7,'DN','','','false','false',NULL,'LAFM9V92',8,'2020-05-09 22:27:42','2020-05-22 23:01:46');

/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table site_managements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site_managements`;

CREATE TABLE `site_managements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `site_managements` WRITE;
/*!40000 ALTER TABLE `site_managements` DISABLE KEYS */;

INSERT INTO `site_managements` (`id`, `meta_key`, `meta_value`, `created_at`, `updated_at`)
VALUES
	(15,'access_type','both','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(20,'show-page-7','0','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(21,'show-banner-7','0','2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(33,'homepage','a:1:{s:4:\"home\";s:1:\"5\";}','2020-03-11 15:19:26','2020-03-11 15:19:26'),
	(38,'commision','a:1:{i:0;a:7:{s:9:\"commision\";s:2:\"20\";s:10:\"min_payout\";s:3:\"250\";s:14:\"payment_method\";a:1:{i:0;s:6:\"paypal\";}s:8:\"currency\";s:3:\"USD\";s:15:\"enable_packages\";s:4:\"true\";s:16:\"employer_package\";s:4:\"true\";s:12:\"payment_mode\";s:4:\"true\";}}','2020-03-11 20:51:37','2020-03-11 20:51:37'),
	(39,'show-page-1','1','2020-03-21 21:41:14','2020-03-21 21:41:14'),
	(40,'show-banner-1','0','2020-03-21 21:41:14','2020-03-21 21:41:14'),
	(45,'section_settings','a:1:{i:0;a:15:{s:19:\"cat_section_display\";s:5:\"false\";s:13:\"cat_sec_title\";N;s:16:\"cat_sec_subtitle\";N;s:20:\"home_section_display\";s:4:\"true\";s:10:\"section_bg\";s:21:\"1557484284-banner.jpg\";s:13:\"company_title\";s:16:\"Start As Company\";s:12:\"company_desc\";s:172:\"Consectetur adipisicing elit sed dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim poskina ilukita ylokem lokateise ination voluptate velit esse cillum.\";s:11:\"company_url\";s:1:\"#\";s:16:\"freelancer_title\";s:19:\"Start As Freelancer\";s:15:\"freelancer_desc\";s:172:\"Consectetur adipisicing elit sed dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim poskina ilukita ylokem lokateise ination voluptate velit esse cillum.\";s:14:\"freelancer_url\";s:1:\"#\";s:19:\"app_section_display\";s:4:\"true\";s:16:\"download_app_img\";s:36:\"1558518016-1557484284-mobile-img.png\";s:9:\"app_title\";s:20:\"Limitless Experience\";s:12:\"app_subtitle\";s:30:\"Roam Around With Your Business\";}}','2020-03-21 22:52:23','2020-03-21 22:52:23'),
	(46,'app_desc','<p>Dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim poskina ilukita ylokem lokateise ination voluptate velit esse cillum dolore eu fugiat nulla pariatur lokaim urianewce.</p>\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumed perspiciatis.</p>','2020-03-21 22:52:23','2020-03-21 22:52:23'),
	(47,'app_android_link','https://play.google.com/store/apps/details?id=com.app.amento.worketic','2020-03-21 22:52:23','2020-03-21 22:52:23'),
	(48,'app_ios_link','#','2020-03-21 22:52:23','2020-03-21 22:52:23'),
	(51,'home_settings','a:1:{i:0;a:8:{s:11:\"home_banner\";N;s:17:\"home_banner_image\";s:10:\"img-01.png\";s:12:\"banner_title\";s:31:\"Contrata profesionales expertos\";s:15:\"banner_subtitle\";s:39:\"para cualquier tipo de proyecto, Online\";s:18:\"banner_description\";s:101:\"Consectetur adipisicing elit sed dotem eiusmod tempor incuntes ut labore etdolore maigna aliqua enim.\";s:10:\"video_link\";s:43:\"https://www.youtube.com/watch?v=B-ph2g5o2K4\";s:11:\"video_title\";s:17:\"See For Yourself!\";s:10:\"video_desc\";s:43:\"How it works & experience the ultimate joy.\";}}','2020-03-21 22:55:12','2020-03-21 22:55:12'),
	(60,'show-page-6','0','2020-03-23 16:33:39','2020-03-23 16:33:39'),
	(61,'show-banner-6','0','2020-03-23 16:33:39','2020-03-23 16:33:39'),
	(108,'show-page-3','0','2020-03-27 21:08:23','2020-03-27 21:08:23'),
	(109,'show-banner-3','1','2020-03-27 21:08:23','2020-03-27 21:08:23'),
	(110,'page-banner-3','1585343303-bg_home.png','2020-03-27 21:08:23','2020-03-27 21:08:23'),
	(111,'show-page-4','0','2020-03-27 21:12:32','2020-03-27 21:12:32'),
	(112,'show-banner-4','1','2020-03-27 21:12:32','2020-03-27 21:12:32'),
	(113,'page-banner-4','1585343552-bg_home.png','2020-03-27 21:12:32','2020-03-27 21:12:32'),
	(123,'show-page-8','0','2020-03-27 21:16:33','2020-03-27 21:16:33'),
	(124,'show-banner-8','1','2020-03-27 21:16:33','2020-03-27 21:16:33'),
	(125,'page-banner-8','1585343715-bg_home.png','2020-03-27 21:16:33','2020-03-27 21:16:33'),
	(135,'inner_page_data','a:1:{i:0;a:16:{s:17:\"f_list_meta_title\";N;s:16:\"f_list_meta_desc\";N;s:13:\"show_f_banner\";s:5:\"false\";s:19:\"emp_list_meta_title\";N;s:18:\"emp_list_meta_desc\";N;s:15:\"show_emp_banner\";s:5:\"false\";s:19:\"job_list_meta_title\";N;s:18:\"job_list_meta_desc\";N;s:15:\"show_job_banner\";s:5:\"false\";s:23:\"service_list_meta_title\";N;s:22:\"service_list_meta_desc\";N;s:19:\"show_service_banner\";s:5:\"false\";s:23:\"article_list_meta_title\";N;s:22:\"article_list_meta_desc\";N;s:19:\"show_article_banner\";s:5:\"false\";s:14:\"f_inner_banner\";s:11:\"bg_home.png\";}}','2020-03-28 01:37:55','2020-03-28 01:37:55'),
	(137,'reg_form_settings','a:1:{i:0;a:14:{s:11:\"step1-title\";N;s:14:\"step1-subtitle\";N;s:11:\"step2-title\";N;s:14:\"step2-subtitle\";N;s:15:\"step2-term-note\";N;s:19:\"show_emplyr_inn_sec\";s:4:\"true\";s:11:\"step3-title\";N;s:14:\"step3-subtitle\";N;s:10:\"step3-page\";N;s:14:\"register_image\";N;s:11:\"step4-title\";N;s:14:\"step4-subtitle\";N;s:20:\"show_reg_form_banner\";s:5:\"false\";s:15:\"reg_form_banner\";N;}}','2020-04-04 14:20:01','2020-04-04 14:20:01'),
	(143,'email_data','a:1:{i:0;a:7:{s:10:\"from_email\";s:17:\"info@zwork.com.do\";s:13:\"from_email_id\";s:5:\"ZWork\";s:11:\"sender_name\";s:6:\"Z|Work\";s:14:\"sender_tagline\";s:30:\"Oportunidades que transforman.\";s:10:\"sender_url\";s:39:\"http://amentotech.com/projects/worketic\";s:10:\"email_logo\";s:23:\"1590017220-Picture1.png\";s:12:\"email_banner\";s:21:\"1555743744-banner.jpg\";}}','2020-05-20 23:27:00','2020-05-20 23:27:00'),
	(144,'socials','a:4:{i:0;a:2:{s:5:\"title\";s:8:\"facebook\";s:3:\"url\";s:1:\"#\";}i:1;a:2:{s:5:\"title\";s:9:\"instagram\";s:3:\"url\";s:9:\"@zwork.do\";}i:2;a:2:{s:5:\"title\";s:7:\"youtube\";s:3:\"url\";s:1:\"#\";}i:3;a:2:{s:5:\"title\";s:9:\"instagram\";s:3:\"url\";s:1:\"#\";}}','2020-05-20 23:31:20','2020-05-20 23:31:20'),
	(145,'search_menu','a:4:{i:0;a:2:{s:5:\"title\";s:19:\"Servicio al Cliente\";s:3:\"url\";s:1:\"#\";}i:1;a:2:{s:5:\"title\";s:16:\"Soporte Técnico\";s:3:\"url\";s:1:\"#\";}i:2;a:2:{s:5:\"title\";s:20:\"Preguntas Frecuentes\";s:3:\"url\";s:43:\"https://zwork.com.do/page/como-funciona#faq\";}i:3;a:2:{s:5:\"title\";s:9:\"Contactos\";s:3:\"url\";s:1:\"#\";}}','2020-05-20 23:32:03','2020-05-20 23:32:03'),
	(146,'menu_title','Enlaces','2020-05-20 23:32:03','2020-05-20 23:32:03'),
	(156,'payment_settings','a:1:{i:0;a:4:{s:9:\"client_id\";s:22:\"zworkrd_api1.gmail.com\";s:15:\"paypal_password\";s:16:\"ZLX56B9QUF4UX4SE\";s:13:\"paypal_secret\";s:56:\"AoyDpTj5ucLcYzyDWN51fBr3zPWLAeO.sQ1Qo9hOJXEEBwBLkjRE4sLq\";s:14:\"enable_sandbox\";s:5:\"false\";}}','2020-05-22 19:16:38','2020-05-22 19:16:38'),
	(167,'show-page-2','0','2020-05-27 15:06:27','2020-05-27 15:06:27'),
	(168,'show-banner-2','1','2020-05-27 15:06:27','2020-05-27 15:06:27'),
	(169,'page-banner-2','1590591987--Landing-Nuestro-equipo.jpg','2020-05-27 15:06:27','2020-05-27 15:06:27'),
	(170,'settings','a:1:{i:0;a:10:{s:5:\"title\";s:8:\"Z | Work\";s:16:\"connects_per_job\";s:1:\"1\";s:12:\"gmap_api_key\";s:39:\"AIzaSyCPRkF6oBqYm_f7DiEhDX4IjVZZS4fiUJE\";s:12:\"chat_display\";s:4:\"true\";s:18:\"enable_theme_color\";s:4:\"true\";s:13:\"primary_color\";s:7:\"#039ce3\";s:4:\"logo\";s:23:\"1590019348-Picture3.png\";s:7:\"favicon\";s:23:\"1590019348-Picture1.png\";s:8:\"language\";s:2:\"es\";s:15:\"body-lang-class\";s:7:\"lang-es\";}}','2020-05-27 15:19:50','2020-05-27 15:19:50'),
	(171,'show-page-5','0','2020-06-01 21:32:22','2020-06-01 21:32:22'),
	(172,'show-banner-5','1','2020-06-01 21:32:22','2020-06-01 21:32:22'),
	(173,'footer_settings','a:5:{s:11:\"footer_logo\";s:27:\"1585357256-Logo - white.png\";s:11:\"description\";s:278:\"¿Sabes cuántas ideas grandiosas no han podido hacerse realidad por falta de oportunidades y recursos disponibles? Z|Work es una plataforma digital con acceso ilimitado a profesionales especializados que diariamente hacen realidad proyectos, de los que nos sentimos orgullosos.\";s:9:\"copyright\";s:24:\"Copyright © 2020 Z|Work\";s:12:\"menu_title_1\";s:6:\"Z|Work\";s:12:\"menu_pages_1\";a:3:{i:0;s:1:\"2\";i:1;s:1:\"3\";i:2;s:1:\"4\";}}','2020-06-01 21:47:02','2020-06-01 21:47:02');

/*!40000 ALTER TABLE `site_managements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skill_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_user`;

CREATE TABLE `skill_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_rating` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;

INSERT INTO `skills` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Redacción de Contenido ','redaccion-de-contenido',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(3,'Diseño Sitio Web','diseno-sitio-web',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(4,'Desarrollo de Ecommerce','desarrollo-de-ecommerce',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(5,'Gestión de Productos','gestion-de-productos',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(6,'Scrum Master','scrum-master',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(7,'Desarrollo de Juegos','desarrollo-de-juegos',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(8,'Desarrollo de Software','desarrollo-de-software',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(9,'Control y Pruebas de Calidad ','control-y-pruebas-de-calidad',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(10,'Control de Calidad Funcional','control-de-calidad-funcional',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(11,'Control de Calidad de Automotización','control-de-calidad-de-automotizacion',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(12,'Diseño Móvil','diseno-movil',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(13,'Desarrollo de Aplicaciones Móviles','desarrollo-de-aplicaciones-moviles',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(14,'Desarrollo de Juegos Móviles','desarrollo-de-juegos-moviles',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(15,'Investigación del Usuario','investigacion-del-usuario',NULL,'2020-03-05 13:56:45','2020-03-05 13:56:45'),
	(16,'Diseño UX/UI','diseno-ux-ui','','2020-05-29 03:21:43','2020-05-29 03:21:43'),
	(17,'Creación de Prototipos','creacion-de-prototipos','','2020-05-29 03:22:22','2020-05-29 03:27:43'),
	(18,'Desarrollo Web','desarrollo-web','','2020-05-29 03:22:36','2020-05-29 03:22:36'),
	(19,'Desarrollo de Back-End','desarrollo-de-back-end','','2020-05-29 03:22:46','2020-05-29 03:22:46'),
	(20,'Desarrollo de Front-End','desarrollo-de-front-end','','2020-05-29 03:22:54','2020-05-29 03:22:54'),
	(21,'Desarrollo de CMS','desarrollo-de-cms','','2020-05-29 03:23:09','2020-05-29 03:24:54'),
	(22,'Personalización de CMS','personalizacion-de-cms','','2020-05-29 03:23:17','2020-05-29 03:23:17'),
	(23,'Desarrollo Completo','desarrollo-completo','','2020-05-29 03:23:26','2020-05-29 03:24:17'),
	(24,'Desarrollo de Firmware','desarrollo-de-firmware','','2020-05-29 03:23:35','2020-05-29 03:23:35'),
	(25,'Desarrollo AR/VR','desarrollo-ar-vr','','2020-05-29 03:25:25','2020-05-29 03:25:25'),
	(26,'Desarrollo de Base de Datos','desarrollo-de-base-de-datos','','2020-05-29 03:25:31','2020-05-29 03:25:31'),
	(27,'Tecnología Emergente','tecnologia-emergente','','2020-05-29 03:25:41','2020-05-29 03:25:41'),
	(28,'Tutoría de Desarrllo de Software','tutoria-de-desarrllo-de-software','','2020-05-29 03:25:54','2020-05-29 03:25:54'),
	(29,'Estrategia de Marca','estrategia-de-marca','','2020-05-29 03:26:01','2020-05-29 03:26:01'),
	(30,'Diseño de Identidad de Marca','diseno-de-identidad-de-marca','','2020-05-29 03:26:11','2020-05-29 03:26:11'),
	(31,'Estrategia de Redes Sociales','estrategia-de-redes-sociales','','2020-05-29 03:26:21','2020-05-29 03:26:21'),
	(32,'Animación','animacion','','2020-05-29 03:26:30','2020-05-29 03:26:30'),
	(33,'Animación 2D','animacion-2d','','2020-05-29 03:26:45','2020-05-29 03:26:45'),
	(34,'Animación 3D','animacion-3d','','2020-05-29 03:26:50','2020-05-29 03:26:50'),
	(35,'Diseño AR/VR','diseno-ar-vr','','2020-05-29 03:26:54','2020-05-29 03:26:54'),
	(36,'Diseño de Presentaciones','diseno-de-presentaciones','','2020-05-29 03:27:01','2020-05-29 03:27:01'),
	(37,'Diseño Gráfico en Movimiento','diseno-grafico-en-movimiento','','2020-05-29 03:27:13','2020-05-29 03:27:13'),
	(38,'Producción de Audio','produccion-de-audio','','2020-05-29 03:27:49','2020-05-29 03:27:49'),
	(39,'Músico/a','musico-a','','2020-05-29 03:30:30','2020-05-29 03:30:30'),
	(40,'Producción Musical','produccion-musical','','2020-05-29 03:30:42','2020-05-29 03:32:39'),
	(41,'Composición Musical','composicion-musical','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(43,'Producción de Video','produccion-de-video','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(44,'Actor / Actriz','actor-actriz','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(45,'Escritura de Guión','escritura-de-guion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(46,'Edición de Audio / Post-Producción','edicion-de-audio-post-produccion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(47,'Camarógrafo','camarografo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(48,'Productor de Video','productor-de-video','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(49,'Talento de Voz','talento-de-voz','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(50,'Vocalista','vocalista','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(51,'Diseño Físico','diseno-fisico','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(52,'Diseño de Exhibiciones','diseno-de-exhibiciones','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(53,'Diseño de Moda','diseno-de-moda','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(54,'Diseño de Joyas','diseno-de-joyas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(55,'Gráficas & Diseño','graficas-diseno','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(56,'Dirección Artística','direccion-artistica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(57,'Dirección Creativa','direccion-creativa','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(58,'Diseño Gráfico','diseno-grafico','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(59,'Diseño Editorial','diseno-editorial','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(60,'Arte','arte','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(61,'Caricaturista','caricaturista','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(62,'Iliustrador/a','iliustrador-a','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(63,'Fotografía','fotografia','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(64,'Edición de Imágenes / Retoque','edicion-de-imagenes-retoque','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(65,'Automatización','automatizacion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(66,'Edición & Corrección','edicion-correccion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(67,'Escritura Fantasma','escritura-fantasma','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(68,'Grant Writing','grant-writing','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(69,'Tutoría de Escritura','tutoria-de-escritura','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(70,'Coaching Profesional','coaching-profesional','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(71,'Escritura Creativa','escritura-creativa','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(72,'Derechos de Autor','derechos-de-autor','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(73,'Escritura Técnica','escritura-tecnica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(74,'Escritura de Negocios','escritura-de-negocios','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(75,'Estrategia de Mercado','estrategia-de-mercado','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(76,'Estrategia de Contenido','estrategia-de-contenido','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(77,'Mercadeo en Redes Sociales','mercadeo-en-redes-sociales','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(78,'Gestión de Cuentas','gestion-de-cuentas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(79,'Anuncios','anuncios','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(80,'Gestión de Campañas','gestion-de-campanas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(81,'Mercadeo Digital','mercadeo-digital','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(82,'Telemercadeo','telemercadeo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(83,'Generación de Clientes','generacion-de-clientes','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(84,'Ventas & Desarrollo de Negocios','ventas-desarrollo-de-negocios','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(85,'Relaciones Públicas','relaciones-publicas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(86,'Investigación de Mercado','investigacion-de-mercado','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(87,'Automatización de Correo Electrónico','automatizacion-de-correo-electronico','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(88,'Automatización de Mercadeo','automatizacion-de-mercadeo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(89,'Posicionamiento en Buscadores','posicionamiento-en-buscadores','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(90,'Mercadeo en Motores de Búsqueda','mercadeo-en-motores-de-busqueda','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(91,'Asistente Administrativa/Virtual','asistente-administrativa-virtual','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(92,'Gestión de Proyectos','gestion-de-proyectos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(93,'Procesamiento de Pedidos','procesamiento-de-pedidos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(94,'Registro de Datos','registro-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(95,'Transcripción','transcripcion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(96,'Investigación En Línea','investigacion-en-linea','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(97,'Servicio al Cliente','servicio-al-cliente','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(98,'Soporte Técnico','soporte-tecnico','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(99,'Minería de Datos','mineria-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(100,'Análisis de Datos','analisis-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(101,'Extracción de Datos','extraccion-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(102,'Deep Learning','deep-learning','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(103,'Machine Learning','machine-learning','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(104,'A/B Testing','a-b-testing','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(105,'Ingienería de Datos','ingieneria-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(106,'Visualización de Datos','visualizacion-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(107,'Procesamiento de Datos','procesamiento-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(108,'Representación del Conocimiento','representacion-del-conocimiento','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(109,'Experimentación & Prueba','experimentacion-prueba','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(111,'Ingeniería Estructura','ingenieria-estructura','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(112,'Modelado BIM','modelado-bim','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(113,'Tasación','tasacion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(114,'Ingeniería Civil','ingenieria-civil','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(115,'Arquitectura','arquitectura','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(116,'Paisajismo','paisajismo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(117,'Ingeniería Mecánica','ingenieria-mecanica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(118,'Diseño HVAC & MEP','diseno-hvac-mep','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(119,'Ingeniería Eléctrica','ingenieria-electrica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(120,'Abastecimiento & Compras','abastecimiento-compras','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(121,'Modelado 3D & CAD','modelado-3d-cad','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(122,'3D Rendering','3d-rendering','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(123,'Modelado #D','modelado-d','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(124,'Visualización #D','visualizacion-d','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(125,'CAD','cad','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(126,'Diseño de Interiores','diseno-de-interiores','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(127,'Ingeniería Química','ingenieria-quimica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(128,'Ingeniería de Hidrocarburos','ingenieria-de-hidrocarburos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(129,'Ingeniería de Procesos','ingenieria-de-procesos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(130,'Diseño de Productos','diseno-de-productos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(131,'Diseño Industrial','diseno-industrial','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(132,'Otras Ingenierías & Arquitectura','otras-ingenierias-arquitectura','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(133,'Ingeniería Electrónica','ingenieria-electronica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(134,'Gestión y Modelado de Energía','gestion-y-modelado-de-energia','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(135,'Gestión de Logística & Cadena de Suministro','gestion-de-logistica-cadena-de-suministro','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(136,'Energía Renovable','energia-renovable','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(137,'Energía Hidráulica','energia-hidraulica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(138,'Biología','biologia','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(139,'Física','fisica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(140,'Tutoría de Ciencias','tutoria-de-ciencias','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(141,'Química','quimica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(142,'Tutoría de Ingeniería','tutoria-de-ingenieria','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(143,'Matemáticas','matematicas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(144,'Diseño PCB','diseno-pcb','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(145,'Contabilidad','contabilidad','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(146,'Presentación de Impuestos','presentacion-de-impuestos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(147,'Sistema de Contabilidad','sistema-de-contabilidad','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(148,'Consultoría','consultoria','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(149,'Análisis de Negocios','analisis-de-negocios','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(150,'Diseño Instructivo','diseno-instructivo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(151,'Selección y Capacitación de Personal','seleccion-y-capacitacion-de-personal','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(152,'Análisis Financiero','analisis-financiero','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(153,'Modelos Financieros','modelos-financieros','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(154,'Consultoría de Gestión','consultoria-de-gestion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(155,'Administración de Recursos Humanos','administracion-de-recursos-humanos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(156,'Entrenamiento & Desarrollo','entrenamiento-desarrollo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(157,'Legal','legal','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(158,'Corporativo & de Negocios','corporativo-de-negocios','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(159,'Impositivo','impositivo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(160,'Derecho Internacional','derecho-internacional','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(161,'Mercado de Valores & Financiero','mercado-de-valores-financiero','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(162,'Propiedad Intelectual','propiedad-intelectual','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(163,'Asesoría Legal General','asesoria-legal-general','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(164,'Derecho Laboral','derecho-laboral','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(165,'Derecho Administrativo','derecho-administrativo','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(166,'Inmigración','inmigracion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(167,'Paralegal','paralegal','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(168,'Intérprete Judicial','interprete-judicial','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(169,'Alguacil','alguacil','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(170,'Notario','notario','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(171,'Traducciones','traducciones','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(172,'Traducción Legal','traduccion-legal','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(173,'Tutoría de Idiomas','tutoria-de-idiomas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(174,'Traducción Técnica','traduccion-tecnica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(175,'Traducción Médica','traduccion-medica','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(176,'IT & Networking','it-networking','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(177,'Seguridad de Redes','seguridad-de-redes','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(178,'Seguridad de Información','seguridad-de-informacion','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(179,'Soluciones Arquitectónicas','soluciones-arquitectonicas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(180,'Ingeniería de Sistemas','ingenieria-de-sistemas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(181,'Administración de Sistemas','administracion-de-sistemas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(182,'Cumplimiento de Sistemas','cumplimiento-de-sistemas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(183,'Administración de Base de Datos','administracion-de-base-de-datos','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(184,'Ingeniería DevOps','ingenieria-devops','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(185,'Arquitectura de Sistemas','arquitectura-de-sistemas','','2020-06-03 13:30:00','2020-06-03 13:30:00'),
	(186,'Administración de Redes','administracion-de-redes','','2020-06-03 13:30:00','2020-06-03 13:30:00');

/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_verified` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_disabled` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `slug`, `email`, `password`, `badge_id`, `expiry_date`, `location_id`, `verification_code`, `user_verified`, `remember_token`, `created_at`, `updated_at`, `is_disabled`)
VALUES
	(1,'Administración','ZWork','administracion-zwork','admin@amentotech.com','$2y$10$3.yBasEg2z7VWJD06J/rdeFQc1gktZAYpA2k3kirsvc5imaV7N7hS',NULL,NULL,NULL,NULL,1,'FupMDzOJfxhgKY4bqhess0eluxLl2aLycUDKwUuFvrLZHah7zqVdblgRy7bZ','2020-03-05 13:56:43','2020-05-20 22:49:29','false'),
	(25,'Z|A','Consulting','za-consulting','a.zapata@zapataaquino.com','$2y$10$I1PJVM76IEQAwNLKHl0Z3.Kh.mo0lL0GFikaFzf56K1MK3zlNGtxG',NULL,NULL,7,'',1,'Wdit7CGzIysBNnKZRaa0F7OJRk6qxmwb9ESS96KXplSpC5YvmYZOrTo6gOj3','2020-03-27 19:07:57','2020-03-31 20:56:44','false'),
	(38,'RENATO','KIMIZUKA','renato-kimizuka','renatofk@gmail.com','$2y$10$jtcWpu/oPtptfDQjyPOWjevRFoHREDFUhdJA8N6ep4UBG5ThQrpTq',NULL,NULL,8,NULL,1,'DY0fEneXnQNSh1jvFaR4RO1iuIIPjFad1c8T3snLCyr6cHWtIPoajdJaUzgu','2020-04-10 00:48:03','2020-04-10 00:48:33','false'),
	(39,'RENATO','KIMIZUKA','renato-kimizuka-1','renatofk+free@gmail.com','$2y$10$m1vfKjOkvM.B/fMzV0r9feszEq4VhabvaEC9EomOhoL2bGR1YKwSq',NULL,NULL,7,NULL,1,'wjUjMMQKkxxWDwpIe0iQ3TIDbAsbYjAj9XwoPhKIYGsBAjpE0tTsoTdTM59G','2020-04-10 00:52:14','2020-04-10 00:56:43','false'),
	(40,'Alexandra','Zapata','alexandra-zapata','azapataaquino@gmail.com','$2y$10$BjnwpWhGi4V01ycTptzTV.T7HdpsfPh4OhblLR/gjynFLt9w1tFWe',NULL,NULL,7,NULL,1,'YrkE2Vxbw0cR4P6irWjZca4OWeVuQ0Jv554mmdu0Vy0kMINfPLh24gboaKJT','2020-04-10 02:01:49','2020-04-10 02:07:56','false'),
	(42,'Nohely','Cliente','nohely-cliente','nohely.fabian@gmail.com','$2y$10$LcaWDJdByhmxTdXlRI5IKOvEz0xXsN8hp4j8px44CGvd2saOhkVx2',NULL,NULL,7,'GST0',0,'JVQCClSdSakCTdEPgGx37NC6HiVz0gu9EqBPuIADe2pMyr3Sxkj456M11GYM','2020-05-08 18:32:13','2020-05-08 18:32:13','false'),
	(43,'Nohely','Cliente','nohely-cliente-1','nohelyf@hotmail.com','$2y$10$/x9.2SSH6qXYgm88EYQl0OIjtC.ocLG0bqNnuldG3v7B6I7NeaReC',NULL,NULL,7,NULL,1,'6tl8AbAOaQx5ixScAwKp5LrX55ajksFEvW3NudBfPEu0g9nbLhZPKy1EaqVU','2020-05-08 18:46:13','2020-05-08 18:50:14','false'),
	(44,'Nohely','PROFESIONAL','nohely-profesional','staminard@gmail.com','$2y$10$wDHOKgbl9IPya9AyfAgFiu4fJRXboIyvd0WvkZgDX.koc83nGA84W',NULL,NULL,7,NULL,1,'teD0qS5euCvjpdAFZxR8Q4ZGME1SZCQyjpMtUgrXKYCCHo6qcELsO70qDXyd','2020-05-08 19:24:26','2020-05-08 19:25:49','false'),
	(45,'FosterTech','Solutions','fostertech-solutions','renato@fostertech.me','$2y$10$Qr8HmSZcpthZYyKnp3ZOHuK9XJD0xSvkel9PWGXb/VqA2AADEpJuC',NULL,NULL,7,NULL,1,'iWQmwEbNr4B2YSGiyvHrTVKQAgRmvR3TmhVHTQrDSmmMnsjJSVyW53U3P5L3','2020-05-22 00:54:56','2020-05-22 00:56:05','false');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
