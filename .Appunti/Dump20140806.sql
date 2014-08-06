CREATE DATABASE  IF NOT EXISTS `devise-pundit_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `devise-pundit_development`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: devise-pundit_development
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'user','2014-07-26 19:52:12','2014-07-26 19:52:12'),(2,'vip','2014-07-26 20:22:37','2014-07-26 20:22:37'),(3,'admin','2014-07-26 20:24:22','2014-07-26 20:24:22');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles_users`
--

DROP TABLE IF EXISTS `admin_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles_users`
--

LOCK TABLES `admin_roles_users` WRITE;
/*!40000 ALTER TABLE `admin_roles_users` DISABLE KEYS */;
INSERT INTO `admin_roles_users` VALUES (1,1,3,'2014-07-26 23:49:56','2014-07-26 23:49:56'),(2,2,1,'2014-07-27 11:53:07','2014-07-27 11:53:07'),(3,2,2,'2014-07-27 11:56:06','2014-07-27 11:56:06'),(4,3,1,'2014-07-27 11:56:27','2014-07-27 11:56:27'),(7,4,3,'2014-08-06 16:41:10','2014-08-06 16:41:10');
/*!40000 ALTER TABLE `admin_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140723210246'),('20140723210247'),('20140723210249'),('20140724202722'),('20140724212546'),('20140726191100'),('20140726205951'),('20140726211011');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL,
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'g.piazzesi@corpoforestale.it','$2a$10$oeu55slwoanju437zstEpuplW1WZCMQd5qvAtC1uyKdeynRTnw42e','VwMz5AHhJwsGDcwb8JsK',NULL,NULL,56,'2014-08-06 16:40:35','2014-08-05 19:08:37','127.0.0.1','127.0.0.1','2014-07-23 22:24:24','2014-08-06 16:40:35','Giacomo Piazzesi','g.piazzesi',0,NULL,NULL),(2,'g.vadala@corpoforestale.it','$2a$10$QuhVX0VzmxIowKMXyoHXwuQHwsCiXsrk2nqQDh4kSCoVYtOC6rBlS','',NULL,NULL,13,'2014-07-26 16:27:29','2014-07-26 14:08:20','127.0.0.1','127.0.0.1','2014-07-23 22:39:50','2014-07-26 16:27:29','Dir. Sup. Giuseppe Vadalà','g.vadala',0,NULL,NULL),(3,'goriverna@gmail.com','$2a$10$UbnZDNEQp9fD1Jb5Zr1YEeEgz1BFuhQGlIMiWMqoEnyDZskVH2ahK',NULL,NULL,NULL,12,'2014-08-05 19:42:11','2014-07-27 16:44:31','127.0.0.1','127.0.0.1','2014-07-26 15:41:28','2014-08-05 19:42:11','Marco Vernaccini','m.vernaccini',0,NULL,NULL),(4,'lucaspanthe@gmail.com','$2a$10$wlUz3tJUpxJA6QFa5/dyHu1AX3r3lI6uSMMP7fLlH1KHxMTJY64Ba',NULL,NULL,NULL,2,'2014-07-27 16:12:06','2014-07-27 15:59:24','127.0.0.1','127.0.0.1','2014-07-26 16:07:28','2014-07-27 16:12:06','Luca Panteghini','l.panteghini',0,NULL,NULL),(5,'s.baroni@gmail.com','$2a$10$geDpjXdaz/m2tAq1F/B//OegCVroDdHteobEJ98IZWMzVo8pSfwP6',NULL,NULL,NULL,1,'2014-08-05 19:01:22','2014-08-05 19:01:22','127.0.0.1','127.0.0.1','2014-08-05 17:51:53','2014-08-05 19:01:22','Sabrina Baroni','s.baroni',0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-06 18:42:17
