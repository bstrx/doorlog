-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: 10.7.0.36    Database: savage-db
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Current Database: `savage-db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `savage-db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `savage-db`;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `chief_id` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'QA',''),(2,'ONP',''),(4,'RU.projects','36'),(5,'Administration','');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `key` char(20) character set utf8 collate utf8_unicode_ci NOT NULL,
  `name` char(20) character set utf8 collate utf8_unicode_ci NOT NULL,
  `permission_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `permission_group_id` (`permission_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'access_admin','Доступ к админке',1),(2,'access_reports','Доступ к отчетам',2);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_group`
--

DROP TABLE IF EXISTS `permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_group` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_group`
--

LOCK TABLES `permission_group` WRITE;
/*!40000 ALTER TABLE `permission_group` DISABLE KEYS */;
INSERT INTO `permission_group` VALUES (1,'админка'),(2,'отчетность');
/*!40000 ALTER TABLE `permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (2,'Тестировщик'),(3,'Младший программист'),(4,'Старший программист');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(20) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Админ'),(2,'Бухгалтер'),(4,'Новая роль');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_permissions` (
  `id_role` int(11) NOT NULL,
  `id_permission` int(11) NOT NULL,
  PRIMARY KEY  (`id_role`,`id_permission`),
  KEY `id_role` (`id_role`),
  KEY `id_permission` (`id_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permissions`
--

LOCK TABLES `roles_permissions` WRITE;
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;
INSERT INTO `roles_permissions` VALUES (1,1),(2,1),(2,2),(4,1);
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `personal_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (155,129,0,'godrave@yandex.ru','843a1bbbdf70c29e5995981a06bddd40aa852ab0','JT7m6',0,'2013-02-27 17:25:40'),(160,10,0,'groundsale@yandex.ru','703b058618d65461cc1b0b394710227999649458','DkYnk',0,'2013-02-28 18:50:14'),(161,120,0,'bstrxx@gmail.com','a64e68d6dcf5fd8320c86d657fbecf5128221681','N0pxn',0,'2013-03-01 11:33:29'),(162,64,0,'groundsale@yadd.ru','652ff0bdcd3465ef76123333faa47a2a743bc962','YfzOh',0,'2013-03-01 13:57:08'),(163,0,0,'','','',0,'2013-03-01 14:58:37'),(164,118,0,'electrik@toka.net','2149de1a8acd650e8bba1dd0c0f3ab0e61a9d33d','4bjH9',2,'2013-03-01 15:33:24'),(165,20,0,'elena','62a9a99fff7565968596dffa351dacf697a0353b','18xjk',1,'2013-03-01 16:14:24'),(166,59,0,'dm@dm','d2473920cb161f3838bfd933454ea8777f7c34b7','8Bhk9',0,'2013-03-01 17:29:55'),(169,95,0,'kd@kd.ru','4f85238e20d68d14fea6bf977e7f00bcd9635339','CEmNV',0,'2013-03-05 14:12:47'),(170,124,2,'kirill.kaplin@opensoftdev.ru','8306f51ea4aa7364b0bc832e5d3a165bcbe66037','RDxN8',4,'2013-03-07 12:34:29'),(171,123,2,'a@a','\nbe01c271f85d8f7d725720dba255db5c49c9bed2','T8VxH',4,'2013-03-07 12:37:35'),(172,122,0,'','7faaa029a3cfb1c080e2a2c89f69f6c616d2211c','YVb3M',1,'2013-03-12 20:43:22'),(173,96,0,'julia','acc3f4393900284d2771b0ad6cddfeabcc8fc9d0','tbebQ',5,'2013-03-13 12:54:38'),(174,98,0,'fsfsd','38b83d5bf752212576f8352f4bcdb3f3bc63d685','5dweI',4,'2013-03-14 15:03:03'),(175,130,0,'groundsale@yandex.ru','5be25f136e35ac5a46dbb2245fe387ed665f8348','HykUF',1,'2013-03-14 17:42:37'),(176,21,0,'groundsale@yandex.ru','da3088aeaf4d888ca7179fdc43aa89d9968cc868','B86In',4,'2013-03-14 17:56:09'),(177,24,0,'bstrxx@gmail.com','46cf360f199b0d4ff4f2dffc1effbfa2016e1489','XyN9o',2,'2013-03-14 17:59:56'),(178,45,0,'groundsale@yandex.ru','f5f952401db3906153b4e048dc2714c30f8b59fb','sp4kz',2,'2013-03-14 18:01:56'),(179,26,0,'bstrxx@gmail.com','55fc6ce62df104dc7e75ca931db4f8d0a5be752e','kDGIN',5,'2013-03-14 18:02:46'),(180,51,0,'t','2d9d1aef9d6eaec29d7a84bf093b60c270e93e55','UwEBx',2,'2013-03-18 15:51:58');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `id_person` int(11) unsigned NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY  (`id_role`,`id_person`),
  KEY `id_person` (`id_person`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (106,1),(106,2),(107,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_statuses`
--

DROP TABLE IF EXISTS `users_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_statuses` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_statuses`
--

LOCK TABLES `users_statuses` WRITE;
/*!40000 ALTER TABLE `users_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-28 18:02:45
