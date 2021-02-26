# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: zwork
# Generation Time: 2020-04-04 02:53:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
