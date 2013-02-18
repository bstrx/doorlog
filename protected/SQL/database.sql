-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: 10.7.0.36    Database: tc-db-main
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt
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
-- Current Database: `tc-db-main`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tc-db-main` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tc-db-main`;

--
-- Table structure for table `accessrules`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessrules` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) character set utf8 default NULL,
  `DESCRIPTION` blob,
  `POWERIDX` int(11) default NULL,
  `STARTDATE` date default NULL,
  `ENDDATE` date default NULL,
  `STATUS` enum('AVAILABLE','DELETED') default 'AVAILABLE',
  `CREATEDTIME` datetime default NULL,
  `DELETEDTIME` datetime default NULL,
  `NRULES` int(11) default NULL,
  `NSPECRULES` int(11) default NULL,
  `STDWEEKMODE` tinyint(1) default '0',
  `RULE0` blob,
  `RULE1` blob,
  `RULE2` blob,
  `RULE3` blob,
  `RULE4` blob,
  `RULE5` blob,
  `RULE6` blob,
  `RULE7` blob,
  `RULE8` blob,
  `RULE9` blob,
  `RULE10` blob,
  `RULE11` blob,
  `RULE12` blob,
  `RULE13` blob,
  `RULE14` blob,
  `RULE15` blob,
  `RULE16` blob,
  `RULE17` blob,
  `RULE18` blob,
  `RULE19` blob,
  `RULE20` blob,
  `RULE21` blob,
  `RULE22` blob,
  `RULE23` blob,
  `RULE24` blob,
  `RULE25` blob,
  `RULE26` blob,
  `RULE27` blob,
  `RULE28` blob,
  `RULE29` blob,
  `RULE30` blob,
  `RULE31` blob,
  `SPECDATE0` date default NULL,
  `SPECRULE0` blob,
  `SPECDATE1` date default NULL,
  `SPECRULE1` blob,
  `SPECDATE2` date default NULL,
  `SPECRULE2` blob,
  `SPECDATE3` date default NULL,
  `SPECRULE3` blob,
  `SPECDATE4` date default NULL,
  `SPECRULE4` blob,
  `SPECDATE5` date default NULL,
  `SPECRULE5` blob,
  `SPECDATE6` date default NULL,
  `SPECRULE6` blob,
  `SPECDATE7` date default NULL,
  `SPECRULE7` blob,
  `SPECDATE8` date default NULL,
  `SPECRULE8` blob,
  `SPECDATE9` date default NULL,
  `SPECRULE9` blob,
  `SPECDATE10` date default NULL,
  `SPECRULE10` blob,
  `SPECDATE11` date default NULL,
  `SPECRULE11` blob,
  `SPECDATE12` date default NULL,
  `SPECRULE12` blob,
  `SPECDATE13` date default NULL,
  `SPECRULE13` blob,
  `SPECDATE14` date default NULL,
  `SPECRULE14` blob,
  `SPECDATE15` date default NULL,
  `SPECRULE15` blob,
  `SPECDATE16` date default NULL,
  `SPECRULE16` blob,
  `SPECDATE17` date default NULL,
  `SPECRULE17` blob,
  `SPECDATE18` date default NULL,
  `SPECRULE18` blob,
  `SPECDATE19` date default NULL,
  `SPECRULE19` blob,
  `SPECDATE20` date default NULL,
  `SPECRULE20` blob,
  `SPECDATE21` date default NULL,
  `SPECRULE21` blob,
  `SPECDATE22` date default NULL,
  `SPECRULE22` blob,
  `SPECDATE23` date default NULL,
  `SPECRULE23` blob,
  `SPECDATE24` date default NULL,
  `SPECRULE24` blob,
  `SPECDATE25` date default NULL,
  `SPECRULE25` blob,
  `SPECDATE26` date default NULL,
  `SPECRULE26` blob,
  `SPECDATE27` date default NULL,
  `SPECRULE27` blob,
  `SPECDATE28` date default NULL,
  `SPECRULE28` blob,
  `SPECDATE29` date default NULL,
  `SPECRULE29` blob,
  `SPECDATE30` date default NULL,
  `SPECRULE30` blob,
  `SPECDATE31` date default NULL,
  `SPECRULE31` blob,
  `BOOLPARAM1` tinyint(1) default '0',
  `BOOLPARAM2` tinyint(1) default '0',
  `BOOLPARAM3` tinyint(1) default '0',
  `BOOLPARAM4` tinyint(1) default '0',
  `SPEC_OPREQA` tinyint(1) default '0',
  `SPEC_OPREQB` tinyint(1) default '0',
  `SPEC_EXTREADERA` enum('DEFAULT','GUESTREADER','REGISTRATOR','PRIMARYONLY') default 'DEFAULT',
  `SPEC_EXTREADERB` enum('DEFAULT','GUESTREADER','REGISTRATOR','PRIMARYONLY') default 'DEFAULT',
  `SPEC_DPASSA` tinyint(1) default '0',
  `SPEC_DPASSB` tinyint(1) default '0',
  `SPEC_REQPINA` tinyint(1) default '0',
  `SPEC_REQPINB` tinyint(1) default '0',
  `OVERRIDE_WT` tinyint(1) default '0',
  `SIDEPARAM0` varbinary(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessrules`
--

INSERT INTO `accessrules` VALUES (1,'По умолчанию','Режим по умолчанию.\nСвободный доступ.\nВсе вновь создаваемые объекты доступа\nавтоматически получают этот режим.',15,'2010-12-09','2010-12-10','AVAILABLE','2010-12-09 17:26:44',NULL,7,0,1,'\0\0','\0\0','\0\0','\0\0','\0\0','\0\0','\0\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'DEFAULT','DEFAULT',0,0,0,0,0,NULL);
INSERT INTO `accessrules` VALUES (2,'общий','',15,'2010-12-10','2010-12-10','DELETED','2010-12-10 16:11:25','2010-12-10 16:45:22',7,0,1,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'DEFAULT','DEFAULT',0,0,0,0,0,NULL);

--
-- Table structure for table `alarmlines`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarmlines` (
  `ID` int(11) NOT NULL,
  `PARENT_ID` int(11) default '0',
  `TYPE` enum('GROUP','LINE') default 'LINE',
  `NAME` varchar(200) character set utf8 default NULL,
  `LINETYPE` enum('NOT_SET','ER300') default 'NOT_SET',
  `AP` int(11) default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmlines`
--


--
-- Table structure for table `alarmlog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarmlog` (
  `ID` int(11) NOT NULL,
  `LOGTIME` datetime default NULL,
  `LINEID` int(11) default '-1',
  `NEWSTATE` int(11) default '-1',
  PRIMARY KEY  (`ID`),
  KEY `LOGTIME` (`LOGTIME`),
  KEY `LINEID` (`LINEID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmlog`
--


--
-- Table structure for table `badges`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) character set utf8 default NULL,
  `TYPE` enum('REGULAR','GUEST') default 'REGULAR',
  `WIDTH` int(11) default '320',
  `HEIGHT` int(11) default '200',
  `BINBACKGROUND` longblob,
  `POS_XPOS` int(11) default '563',
  `POS_YPOS` int(11) default '421',
  `POS_WIDTH` int(11) default '407',
  `POS_HEIGHT` int(11) default '79',
  `POS_ISVISIBLE` tinyint(1) default '1',
  `POS_FONT_MIN` int(11) default '8',
  `POS_FONT_DEF` int(11) default '53',
  `POS_FONT_COLOR_R` int(11) default '0',
  `POS_FONT_COLOR_B` int(11) default '0',
  `POS_FONT_COLOR_G` int(11) default '0',
  `POS_EBA` tinyint(1) default '1',
  `POS_ALIGN` enum('LEFT','CENTER','RIGHT') default 'CENTER',
  `NUM_XPOS` int(11) default '563',
  `NUM_YPOS` int(11) default '50',
  `NUM_WIDTH` int(11) default '407',
  `NUM_HEIGHT` int(11) default '79',
  `NUM_ISVISIBLE` tinyint(1) default '1',
  `NUM_FONT_MIN` int(11) default '8',
  `NUM_FONT_DEF` int(11) default '50',
  `NUM_FONT_COLOR_R` int(11) default '0',
  `NUM_FONT_COLOR_B` int(11) default '0',
  `NUM_FONT_COLOR_G` int(11) default '0',
  `NUM_EBA` tinyint(1) default '0',
  `NUM_ALIGN` enum('LEFT','CENTER','RIGHT') default 'RIGHT',
  `DEP_XPOS` int(11) default '87',
  `DEP_YPOS` int(11) default '24',
  `DEP_WIDTH` int(11) default '416',
  `DEP_HEIGHT` int(11) default '63',
  `DEP_ISVISIBLE` tinyint(1) default '0',
  `DEP_FONT_MIN` int(11) default '8',
  `DEP_FONT_DEF` int(11) default '53',
  `DEP_FONT_COLOR_R` int(11) default '0',
  `DEP_FONT_COLOR_B` int(11) default '0',
  `DEP_FONT_COLOR_G` int(11) default '0',
  `DEP_EBA` tinyint(1) default '0',
  `DEP_ALIGN` enum('LEFT','CENTER','RIGHT') default 'CENTER',
  `FIO_XPOS` int(11) default '563',
  `FIO_YPOS` int(11) default '167',
  `FIO_WIDTH` int(11) default '407',
  `FIO_HEIGHT` int(11) default '212',
  `FIO_ISVISIBLE` tinyint(1) default '1',
  `FIO_FONT_MIN` int(11) default '8',
  `FIO_FONT_DEF` int(11) default '72',
  `FIO_FONT_COLOR_R` int(11) default '0',
  `FIO_FONT_COLOR_B` int(11) default '0',
  `FIO_FONT_COLOR_G` int(11) default '0',
  `FIO_EBA` tinyint(1) default '0',
  `FIO_ALIGN` enum('LEFT','CENTER','RIGHT') default 'LEFT',
  `FIO_STYLE` enum('STYLE1','STYLE2','STYLE3','STYLE4') default 'STYLE4',
  `EXPTIME_XPOS` int(11) default '563',
  `EXPTIME_YPOS` int(11) default '520',
  `EXPTIME_WIDTH` int(11) default '407',
  `EXPTIME_HEIGHT` int(11) default '79',
  `EXPTIME_ISVISIBLE` tinyint(1) default '0',
  `EXPTIME_FONT_MIN` int(11) default '8',
  `EXPTIME_FONT_DEF` int(11) default '72',
  `EXPTIME_FONT_COLOR_R` int(11) default '0',
  `EXPTIME_FONT_COLOR_B` int(11) default '0',
  `EXPTIME_FONT_COLOR_G` int(11) default '0',
  `EXPTIME_EBA` tinyint(1) default '0',
  `EXPTIME_ALIGN` enum('LEFT','CENTER','RIGHT') default 'LEFT',
  `EXPTIME_STYLE` enum('STYLE1','STYLE2') default 'STYLE1',
  `PHOTO_XPOS` int(11) default '38',
  `PHOTO_YPOS` int(11) default '83',
  `PHOTO_WIDTH` int(11) default '472',
  `PHOTO_HEIGHT` int(11) default '472',
  `PHOTO_ISVISIBLE` tinyint(1) default '1',
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` VALUES (1,'','REGULAR',320,200,NULL,563,421,407,79,1,8,53,0,0,0,1,'CENTER',563,50,407,79,1,8,50,0,0,0,0,'RIGHT',87,24,416,63,0,8,53,0,0,0,0,'CENTER',563,167,407,212,1,8,72,0,0,0,0,'LEFT','STYLE4',563,520,407,79,0,8,72,0,0,0,0,'LEFT','STYLE1',38,83,472,472,1);
INSERT INTO `badges` VALUES (2,'посетителя (постоянный)','GUEST',320,200,NULL,563,421,407,79,0,8,53,0,0,0,1,'CENTER',563,50,407,79,0,8,50,0,0,0,0,'RIGHT',87,24,416,63,0,8,53,0,0,0,0,'CENTER',37,242,942,154,1,8,84,0,0,0,0,'CENTER','STYLE4',563,520,407,79,0,8,72,0,0,0,0,'LEFT','STYLE1',38,83,472,472,0);

--
-- Table structure for table `devbindings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devbindings` (
  `EMP_ID` int(11) NOT NULL default '0',
  `DEV_ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`EMP_ID`,`DEV_ID`),
  KEY `EMP_ID` (`EMP_ID`),
  KEY `DEV_ID` (`DEV_ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devbindings`
--

INSERT INTO `devbindings` VALUES (6,1);
INSERT INTO `devbindings` VALUES (8,1);
INSERT INTO `devbindings` VALUES (10,1);
INSERT INTO `devbindings` VALUES (11,1);
INSERT INTO `devbindings` VALUES (12,1);
INSERT INTO `devbindings` VALUES (15,1);
INSERT INTO `devbindings` VALUES (16,1);
INSERT INTO `devbindings` VALUES (18,1);
INSERT INTO `devbindings` VALUES (19,1);
INSERT INTO `devbindings` VALUES (20,1);
INSERT INTO `devbindings` VALUES (21,1);
INSERT INTO `devbindings` VALUES (22,1);
INSERT INTO `devbindings` VALUES (23,1);
INSERT INTO `devbindings` VALUES (24,1);
INSERT INTO `devbindings` VALUES (25,1);
INSERT INTO `devbindings` VALUES (26,1);
INSERT INTO `devbindings` VALUES (27,1);
INSERT INTO `devbindings` VALUES (28,1);
INSERT INTO `devbindings` VALUES (29,1);
INSERT INTO `devbindings` VALUES (30,1);
INSERT INTO `devbindings` VALUES (31,1);
INSERT INTO `devbindings` VALUES (32,1);
INSERT INTO `devbindings` VALUES (34,1);
INSERT INTO `devbindings` VALUES (35,1);
INSERT INTO `devbindings` VALUES (36,1);
INSERT INTO `devbindings` VALUES (37,1);
INSERT INTO `devbindings` VALUES (38,1);
INSERT INTO `devbindings` VALUES (39,1);
INSERT INTO `devbindings` VALUES (40,1);
INSERT INTO `devbindings` VALUES (41,1);
INSERT INTO `devbindings` VALUES (42,1);
INSERT INTO `devbindings` VALUES (43,1);
INSERT INTO `devbindings` VALUES (44,1);
INSERT INTO `devbindings` VALUES (45,1);
INSERT INTO `devbindings` VALUES (47,1);
INSERT INTO `devbindings` VALUES (48,1);
INSERT INTO `devbindings` VALUES (49,1);
INSERT INTO `devbindings` VALUES (50,1);
INSERT INTO `devbindings` VALUES (51,1);
INSERT INTO `devbindings` VALUES (52,1);
INSERT INTO `devbindings` VALUES (53,1);
INSERT INTO `devbindings` VALUES (54,1);
INSERT INTO `devbindings` VALUES (55,1);
INSERT INTO `devbindings` VALUES (56,1);
INSERT INTO `devbindings` VALUES (57,1);
INSERT INTO `devbindings` VALUES (58,1);
INSERT INTO `devbindings` VALUES (59,1);
INSERT INTO `devbindings` VALUES (60,1);
INSERT INTO `devbindings` VALUES (61,1);
INSERT INTO `devbindings` VALUES (62,1);
INSERT INTO `devbindings` VALUES (63,1);
INSERT INTO `devbindings` VALUES (64,1);
INSERT INTO `devbindings` VALUES (65,1);
INSERT INTO `devbindings` VALUES (66,1);
INSERT INTO `devbindings` VALUES (67,1);
INSERT INTO `devbindings` VALUES (69,1);
INSERT INTO `devbindings` VALUES (71,1);
INSERT INTO `devbindings` VALUES (72,1);
INSERT INTO `devbindings` VALUES (73,1);
INSERT INTO `devbindings` VALUES (74,1);
INSERT INTO `devbindings` VALUES (75,1);
INSERT INTO `devbindings` VALUES (76,1);
INSERT INTO `devbindings` VALUES (77,1);
INSERT INTO `devbindings` VALUES (78,1);
INSERT INTO `devbindings` VALUES (79,1);
INSERT INTO `devbindings` VALUES (80,1);
INSERT INTO `devbindings` VALUES (81,1);
INSERT INTO `devbindings` VALUES (82,1);
INSERT INTO `devbindings` VALUES (83,1);
INSERT INTO `devbindings` VALUES (84,1);
INSERT INTO `devbindings` VALUES (85,1);
INSERT INTO `devbindings` VALUES (86,1);
INSERT INTO `devbindings` VALUES (87,1);
INSERT INTO `devbindings` VALUES (88,1);
INSERT INTO `devbindings` VALUES (89,1);
INSERT INTO `devbindings` VALUES (90,1);
INSERT INTO `devbindings` VALUES (91,1);
INSERT INTO `devbindings` VALUES (92,1);
INSERT INTO `devbindings` VALUES (93,1);
INSERT INTO `devbindings` VALUES (94,1);
INSERT INTO `devbindings` VALUES (95,1);
INSERT INTO `devbindings` VALUES (96,1);
INSERT INTO `devbindings` VALUES (97,1);
INSERT INTO `devbindings` VALUES (98,1);
INSERT INTO `devbindings` VALUES (99,1);
INSERT INTO `devbindings` VALUES (100,1);
INSERT INTO `devbindings` VALUES (101,1);
INSERT INTO `devbindings` VALUES (102,1);
INSERT INTO `devbindings` VALUES (103,1);
INSERT INTO `devbindings` VALUES (104,1);
INSERT INTO `devbindings` VALUES (105,1);
INSERT INTO `devbindings` VALUES (106,1);
INSERT INTO `devbindings` VALUES (107,1);
INSERT INTO `devbindings` VALUES (108,1);
INSERT INTO `devbindings` VALUES (110,1);
INSERT INTO `devbindings` VALUES (111,1);
INSERT INTO `devbindings` VALUES (113,1);
INSERT INTO `devbindings` VALUES (114,1);
INSERT INTO `devbindings` VALUES (115,1);
INSERT INTO `devbindings` VALUES (116,1);
INSERT INTO `devbindings` VALUES (117,1);
INSERT INTO `devbindings` VALUES (118,1);
INSERT INTO `devbindings` VALUES (119,1);
INSERT INTO `devbindings` VALUES (120,1);
INSERT INTO `devbindings` VALUES (121,1);
INSERT INTO `devbindings` VALUES (122,1);
INSERT INTO `devbindings` VALUES (123,1);
INSERT INTO `devbindings` VALUES (124,1);
INSERT INTO `devbindings` VALUES (125,1);
INSERT INTO `devbindings` VALUES (126,1);
INSERT INTO `devbindings` VALUES (127,1);
INSERT INTO `devbindings` VALUES (128,1);

--
-- Table structure for table `devempidx`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devempidx` (
  `DEVID` int(11) NOT NULL default '0',
  `EMPID` int(11) NOT NULL default '0',
  `EMPIDX` int(11) default NULL,
  PRIMARY KEY  (`DEVID`,`EMPID`),
  KEY `DEVID` (`DEVID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devempidx`
--

INSERT INTO `devempidx` VALUES (1,61,64);
INSERT INTO `devempidx` VALUES (1,100,63);
INSERT INTO `devempidx` VALUES (1,91,62);
INSERT INTO `devempidx` VALUES (1,21,61);
INSERT INTO `devempidx` VALUES (1,53,60);
INSERT INTO `devempidx` VALUES (1,59,59);
INSERT INTO `devempidx` VALUES (1,64,58);
INSERT INTO `devempidx` VALUES (1,58,57);
INSERT INTO `devempidx` VALUES (1,30,56);
INSERT INTO `devempidx` VALUES (1,42,55);
INSERT INTO `devempidx` VALUES (1,88,54);
INSERT INTO `devempidx` VALUES (1,27,53);
INSERT INTO `devempidx` VALUES (1,24,52);
INSERT INTO `devempidx` VALUES (1,37,51);
INSERT INTO `devempidx` VALUES (1,26,50);
INSERT INTO `devempidx` VALUES (1,20,49);
INSERT INTO `devempidx` VALUES (1,44,48);
INSERT INTO `devempidx` VALUES (1,22,47);
INSERT INTO `devempidx` VALUES (1,108,46);
INSERT INTO `devempidx` VALUES (1,18,45);
INSERT INTO `devempidx` VALUES (1,15,44);
INSERT INTO `devempidx` VALUES (1,113,43);
INSERT INTO `devempidx` VALUES (1,16,42);
INSERT INTO `devempidx` VALUES (1,31,41);
INSERT INTO `devempidx` VALUES (1,119,40);
INSERT INTO `devempidx` VALUES (1,45,39);
INSERT INTO `devempidx` VALUES (1,29,38);
INSERT INTO `devempidx` VALUES (1,56,37);
INSERT INTO `devempidx` VALUES (1,96,36);
INSERT INTO `devempidx` VALUES (1,11,35);
INSERT INTO `devempidx` VALUES (1,47,34);
INSERT INTO `devempidx` VALUES (1,34,33);
INSERT INTO `devempidx` VALUES (1,110,32);
INSERT INTO `devempidx` VALUES (1,43,31);
INSERT INTO `devempidx` VALUES (1,117,30);
INSERT INTO `devempidx` VALUES (1,128,29);
INSERT INTO `devempidx` VALUES (1,84,28);
INSERT INTO `devempidx` VALUES (1,99,27);
INSERT INTO `devempidx` VALUES (1,85,26);
INSERT INTO `devempidx` VALUES (1,127,25);
INSERT INTO `devempidx` VALUES (1,124,24);
INSERT INTO `devempidx` VALUES (1,95,23);
INSERT INTO `devempidx` VALUES (1,98,22);
INSERT INTO `devempidx` VALUES (1,52,21);
INSERT INTO `devempidx` VALUES (1,49,20);
INSERT INTO `devempidx` VALUES (1,107,19);
INSERT INTO `devempidx` VALUES (1,102,18);
INSERT INTO `devempidx` VALUES (1,111,17);
INSERT INTO `devempidx` VALUES (1,106,16);
INSERT INTO `devempidx` VALUES (1,116,15);
INSERT INTO `devempidx` VALUES (1,126,14);
INSERT INTO `devempidx` VALUES (1,48,13);
INSERT INTO `devempidx` VALUES (1,114,12);
INSERT INTO `devempidx` VALUES (1,123,11);
INSERT INTO `devempidx` VALUES (1,125,10);
INSERT INTO `devempidx` VALUES (1,115,9);
INSERT INTO `devempidx` VALUES (1,51,8);
INSERT INTO `devempidx` VALUES (1,104,7);
INSERT INTO `devempidx` VALUES (1,122,6);
INSERT INTO `devempidx` VALUES (1,50,5);
INSERT INTO `devempidx` VALUES (1,103,4);
INSERT INTO `devempidx` VALUES (1,105,3);
INSERT INTO `devempidx` VALUES (1,121,2);
INSERT INTO `devempidx` VALUES (1,120,1);
INSERT INTO `devempidx` VALUES (1,118,0);

--
-- Table structure for table `deviceconfs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceconfs` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `CONFDATA` binary(128) default NULL,
  `IOCOUNT` int(11) default NULL,
  `IOREC` binary(86) default NULL,
  `GATESM` int(11) default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceconfs`
--


--
-- Table structure for table `devices`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `ID` int(11) NOT NULL default '0',
  `NAME` varchar(100) character set utf8 default NULL,
  `AREA` int(11) default '0',
  `LINKTYPE` enum('FT','ETH','ETHACTIVE') default 'FT',
  `LINKPARAM1` varbinary(100) default '0',
  `LINKPARAM2` varbinary(100) default '0',
  `HWCONF` enum('UNKNOWN','TURNSTILE','DOOR','GATE','REG') default 'UNKNOWN',
  `CONTROLSPERIMETER` tinyint(1) default '1',
  `ZONEA` int(11) default '0',
  `ZONEB` int(11) default '0',
  `CAMA_TYPE` enum('NOT_AVAILABLE','DOMINATION','EWCLID','TRASSIR') default 'NOT_AVAILABLE',
  `CAMA_PARAM1` varbinary(1000) default '',
  `CAMA_PARAM2` varbinary(1000) default '',
  `CAMA_PARAM3` varbinary(100) default '',
  `CAMA_PARAM4` varbinary(100) default '',
  `CAMA_LPR` tinyint(1) default '0',
  `CAMB_TYPE` enum('NOT_AVAILABLE','DOMINATION','EWCLID','TRASSIR') default 'NOT_AVAILABLE',
  `CAMB_PARAM1` varbinary(1000) default '',
  `CAMB_PARAM2` varbinary(1000) default '',
  `CAMB_PARAM3` varbinary(100) default '',
  `CAMB_PARAM4` varbinary(100) default '',
  `CAMB_LPR` tinyint(1) default '0',
  `PINMAGICA` enum('OFF','ON') default 'OFF',
  `PINMAGICB` enum('OFF','ON') default 'OFF',
  `GATESM` int(11) default '1',
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` VALUES (1,'Точка доступа 1',0,'FT','1','1','DOOR',1,0,1,'NOT_AVAILABLE','','','','',0,'NOT_AVAILABLE','','','','',0,'OFF','OFF',1);

--
-- Table structure for table `devrulebindings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devrulebindings` (
  `DEV_ID` int(11) NOT NULL default '0',
  `RULE_ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`DEV_ID`,`RULE_ID`),
  KEY `DEV_ID` (`DEV_ID`),
  KEY `RULE_ID` (`RULE_ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devrulebindings`
--

INSERT INTO `devrulebindings` VALUES (1,2);

--
-- Table structure for table `evaction`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaction` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `TYPE` enum('DO_NOTHING','HTTP_REQUEST','GSM_SMS','GUEST_CLOSE','NOTIFY_EXTSYS') default 'DO_NOTHING',
  `PARAM1` varbinary(10240) default NULL,
  `PARAM2` varbinary(10240) default NULL,
  `PARAM3` varbinary(10240) default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaction`
--


--
-- Table structure for table `evcond`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evcond` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `TYPE` enum('NEVER','ON_PASS','ON_DENY','ON_BREAK','ON_APSTATECHA') default 'NEVER',
  `PARAM1` varbinary(10240) default NULL,
  `PARAM2` varbinary(10240) default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evcond`
--


--
-- Table structure for table `evcondaction`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evcondaction` (
  `COND` int(11) NOT NULL default '0',
  `ACTION` int(11) NOT NULL default '0',
  PRIMARY KEY  (`COND`,`ACTION`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evcondaction`
--


--
-- Table structure for table `evcondap`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evcondap` (
  `COND` int(11) NOT NULL default '0',
  `AP` int(11) NOT NULL default '0',
  PRIMARY KEY  (`COND`,`AP`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evcondap`
--


--
-- Table structure for table `evcondemp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evcondemp` (
  `COND` int(11) NOT NULL default '0',
  `EMP` int(11) NOT NULL default '0',
  PRIMARY KEY  (`COND`,`EMP`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evcondemp`
--


--
-- Table structure for table `gsmsmsqueue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsmsmsqueue` (
  `ID` int(11) NOT NULL,
  `PUSHTIME` datetime default NULL,
  `TARGETNUMBER` varchar(20) character set utf8 default NULL,
  `SMSTEXT` varchar(2000) character set utf8 default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsmsmsqueue`
--


--
-- Table structure for table `guestbindings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestbindings` (
  `ID` int(11) NOT NULL,
  `CARD_ID` int(11) default NULL,
  `DATECRE` datetime default NULL,
  `DATEFIN` datetime default NULL,
  `DATEEXP` datetime default NULL,
  `DOCTYPE` enum('PASSPORT','DRIVERS','OTHER') default NULL,
  `DOCNAME` varchar(50) character set utf8 default NULL,
  `NAME` varchar(255) character set utf8 default NULL,
  `BIRTHDATE` date default NULL,
  `SERIES` varchar(10) character set utf8 default NULL,
  `NUMBER` varchar(20) character set utf8 default NULL,
  `WHOISSUED` varchar(255) character set utf8 default NULL,
  `WHENISSUED` date default NULL,
  `ADDRESS` varchar(255) character set utf8 default NULL,
  `COMMENT` varchar(255) character set utf8 default NULL,
  PRIMARY KEY  (`ID`),
  KEY `CARD_ID` (`CARD_ID`),
  KEY `DATEFIN` (`DATEFIN`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbindings`
--


--
-- Table structure for table `guestphoto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestphoto` (
  `ID` int(11) NOT NULL default '0',
  `CARDID` int(11) default NULL,
  `TS` int(11) default '0',
  `PREVIEW_WIDTH` int(11) default NULL,
  `PREVIEW_HEIGHT` int(11) default NULL,
  `PREVIEW_RASTER` longblob,
  `HIRES_WIDTH` int(11) default NULL,
  `HIRES_HEIGHT` int(11) default NULL,
  `HIRES_RASTER` longblob,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestphoto`
--


--
-- Table structure for table `monview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monview` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `MONTEMPLATE` enum('CLASSIC','EMP_ONLY','RIGHT_PHOTO','BIG_PHOTO','FULL_SCREEN_PHOTO','EMPRULE_ONLY','PLAN_LOG_PHOTO') default 'CLASSIC',
  `FILTER_PASSDETECTED` tinyint(1) default '1',
  `FILTER_PASSDENY` tinyint(1) default '1',
  `FILTER_PANELPASSDETECTED` tinyint(1) default '1',
  `FILTER_BREAKINGPASS` tinyint(1) default '1',
  `FILTER_TRACE` tinyint(1) default '1',
  `FILTER_FIREUNLOCK` tinyint(1) default '1',
  `FILTER_BOXOPEN` tinyint(1) default '1',
  `FILTER_APONLINESTATUS` tinyint(1) default '1',
  `FILTER_PASSALLOWED` tinyint(1) default '1',
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monview`
--

INSERT INTO `monview` VALUES (1,'По умолчанию','CLASSIC',1,1,1,1,1,1,1,1,1);

--
-- Table structure for table `monviewap`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monviewap` (
  `MONVIEW` int(11) NOT NULL default '0',
  `AP` int(11) NOT NULL default '0',
  PRIMARY KEY  (`MONVIEW`,`AP`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monviewap`
--


--
-- Table structure for table `monviewuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monviewuser` (
  `MONVIEW` int(11) NOT NULL default '0',
  `USERID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`MONVIEW`,`USERID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monviewuser`
--


--
-- Table structure for table `paramb`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paramb` (
  `NAME` char(30) NOT NULL default '',
  `PARAMVALUE` varchar(100) character set utf8 default NULL,
  PRIMARY KEY  (`NAME`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paramb`
--

INSERT INTO `paramb` VALUES ('PHOTO_ASPECT_RATIO','RATIO1');
INSERT INTO `paramb` VALUES ('AUTOBACKUP_LASTDATE','0000-00-00');
INSERT INTO `paramb` VALUES ('DOMINATION_CLIENT_LOGIN','root');
INSERT INTO `paramb` VALUES ('DOMINATION_CLIENT_PASS','masterkey');
INSERT INTO `paramb` VALUES ('DOMINATION_CLIENT_HOST','127.0.0.1');
INSERT INTO `paramb` VALUES ('GSM_CON_TYPE','NONE');
INSERT INTO `paramb` VALUES ('GSM_CON_PARAM1','');
INSERT INTO `paramb` VALUES ('GSM_CON_PARAM2','');
INSERT INTO `paramb` VALUES ('TRASSIR_LOGIN','admin');
INSERT INTO `paramb` VALUES ('TRASSIR_PASS','');
INSERT INTO `paramb` VALUES ('TRASSIR_HOST','127.0.0.1');
INSERT INTO `paramb` VALUES ('INTELLECT_HOST','127.0.0.1');
INSERT INTO `paramb` VALUES ('INTELLECT_IIDK_ID','1');

--
-- Table structure for table `parami`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parami` (
  `NAME` char(30) NOT NULL default '',
  `PARAMVALUE` int(11) default NULL,
  `VALUE` int(11) default NULL,
  PRIMARY KEY  (`NAME`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parami`
--

INSERT INTO `parami` VALUES ('DBVER',63,63);
INSERT INTO `parami` VALUES ('PIX_PER_INCH',300,NULL);
INSERT INTO `parami` VALUES ('BADGE_WIDTH',1016,NULL);
INSERT INTO `parami` VALUES ('BADGE_HEIGHT',638,NULL);
INSERT INTO `parami` VALUES ('APB_TIME',0,NULL);
INSERT INTO `parami` VALUES ('ID_AUTOPARK',1,NULL);
INSERT INTO `parami` VALUES ('ID_OFFICIAL_TRANSPORT',4,NULL);
INSERT INTO `parami` VALUES ('ID_PERSONAL_TRANSPORT',3,NULL);
INSERT INTO `parami` VALUES ('ID_GUESTS',2,NULL);
INSERT INTO `parami` VALUES ('ID_GUEST_BADGE',2,NULL);
INSERT INTO `parami` VALUES ('DEF_GUEST_EXPTIME',480,NULL);
INSERT INTO `parami` VALUES ('ID_DEFAULT_RULE',1,NULL);
INSERT INTO `parami` VALUES ('AUTOBACKUP_ON',0,NULL);
INSERT INTO `parami` VALUES ('AUTOBACKUP_PERIOD',1,NULL);
INSERT INTO `parami` VALUES ('AUTOBACKUP_STORAGESIZE',10,NULL);
INSERT INTO `parami` VALUES ('DOMINATION_ENABLED',0,NULL);
INSERT INTO `parami` VALUES ('DOMINATION_CLIENT_PORT',8765,NULL);
INSERT INTO `parami` VALUES ('AUTOCHECKDB_ON',1,NULL);
INSERT INTO `parami` VALUES ('BADGE_PAGE_WIDTH',2209,NULL);
INSERT INTO `parami` VALUES ('BADGE_PAGE_HEIGHT',3189,NULL);
INSERT INTO `parami` VALUES ('BADGE_PAGE_LMARGIN',0,NULL);
INSERT INTO `parami` VALUES ('BADGE_PAGE_RMARGIN',0,NULL);
INSERT INTO `parami` VALUES ('BADGE_PAGE_TMARGIN',0,NULL);
INSERT INTO `parami` VALUES ('BADGE_PAGE_BMARGIN',0,NULL);
INSERT INTO `parami` VALUES ('BADGE_LINE_SEP',1,NULL);
INSERT INTO `parami` VALUES ('TRASSIR_ENABLED',0,NULL);
INSERT INTO `parami` VALUES ('TRASSIR_PORT_HTTP',8080,NULL);
INSERT INTO `parami` VALUES ('TRASSIR_PORT_EVENTS',10000,NULL);
INSERT INTO `parami` VALUES ('INTELLECT_ENABLED',0,NULL);
INSERT INTO `parami` VALUES ('INTELLECT_PORT_IIDK',1030,NULL);
INSERT INTO `parami` VALUES ('EWCLID_ENABLED',0,NULL);

--
-- Table structure for table `payaccs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payaccs` (
  `ID` int(11) NOT NULL,
  `TYPEID` int(11) default NULL,
  `OBJID` int(11) default NULL,
  `CURVALUE` double default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payaccs`
--


--
-- Table structure for table `payacctypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payacctypes` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `UNITNAME` varchar(200) character set utf8 default NULL,
  `VALUESTEP` double default NULL,
  `CREDIT` double default NULL,
  `CREATE_BY_DEFAULT` tinyint(1) default '1',
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payacctypes`
--


--
-- Table structure for table `paylog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paylog` (
  `ID` int(11) NOT NULL,
  `LOGTIME` datetime default NULL,
  `USERID` int(11) default NULL,
  `ACCID` int(11) default NULL,
  `OPTYPE` enum('MANUAL_SET','AUTO_PAY_SET','MENU_PAY') default NULL,
  `OLDVALUE` double default NULL,
  `NEWVALUE` double default NULL,
  PRIMARY KEY  (`ID`),
  KEY `LOGTIME` (`LOGTIME`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paylog`
--


--
-- Table structure for table `paylogdetails`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paylogdetails` (
  `ID` int(11) NOT NULL,
  `LOGID` int(11) default NULL,
  `ITEMID` int(11) default NULL,
  `COSTVALUE` double default NULL,
  `COUNTVALUE` double default NULL,
  PRIMARY KEY  (`ID`),
  KEY `LOGID` (`LOGID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paylogdetails`
--


--
-- Table structure for table `paymenuitemacctypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenuitemacctypes` (
  `ITEMID` int(11) NOT NULL default '0',
  `TYPEID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ITEMID`,`TYPEID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenuitemacctypes`
--


--
-- Table structure for table `paymenuitems`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenuitems` (
  `ID` int(11) NOT NULL,
  `MENUID` int(11) default NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `NUMBER` varchar(200) character set utf8 default NULL,
  `UNITNAME` varchar(200) character set utf8 default NULL,
  `COSTVALUE` double default NULL,
  `INCACC_TYPEID` int(11) default '-1',
  `INCACC_VALUE` double default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenuitems`
--


--
-- Table structure for table `paymenus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenus` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `STARTDATE` date default NULL,
  `ENDDATE` date default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenus`
--


--
-- Table structure for table `paymenuusers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymenuusers` (
  `MENUID` int(11) NOT NULL default '0',
  `USERID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`MENUID`,`USERID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenuusers`
--


--
-- Table structure for table `personal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `ID` int(11) NOT NULL,
  `PARENT_ID` int(11) default NULL,
  `TYPE` enum('DEP','EMP') default NULL,
  `NAME` varchar(100) character set utf8 default NULL,
  `DESCRIPTION` varchar(255) character set utf8 default NULL,
  `POS` varchar(255) character set utf8 default NULL,
  `TABID` varchar(20) character set utf8 default NULL,
  `STATUS` enum('AVAILABLE','FIRED') default 'AVAILABLE',
  `CODEKEY` tinyblob,
  `CODEKEYTIME` datetime default NULL,
  `EXPTIME` datetime default NULL,
  `CREATEDTIME` datetime default NULL,
  `FIREDTIME` datetime default NULL,
  `BADGE` int(11) default '1',
  `BOOLPARAM1` tinyint(1) default '0',
  `BOOLPARAM2` tinyint(1) default '0',
  `BOOLPARAM3` tinyint(1) default '0',
  `BOOLPARAM4` tinyint(1) default '0',
  `LOCATIONZONE` int(11) default '0',
  `LOCATIONACT` datetime default NULL,
  `APB_ON` tinyint(1) default '1',
  `SIDEPARAM0` varbinary(255) default NULL,
  `SIDEPARAM1` varbinary(255) default NULL,
  `SIDEPARAM2` varbinary(255) default NULL,
  `SIDEPARAM3` varbinary(255) default NULL,
  `SIDEPARAM4` varbinary(255) default NULL,
  `SMS_TARGETNUMBER` varchar(50) character set utf8 default NULL,
  `SMS_STARTDATE` date default NULL,
  `SMS_ENDDATE` date default NULL,
  `SMS_TEXT` varchar(1000) character set utf8 default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`),
  KEY `PARENT_ID` (`PARENT_ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` VALUES (1,0,'DEP','Автопарк','Создан автоматически',NULL,NULL,'AVAILABLE',NULL,NULL,NULL,'2010-12-09 17:26:44',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (2,0,'DEP','Посетители','Создан автоматически',NULL,NULL,'AVAILABLE',NULL,NULL,NULL,'2010-12-09 17:26:44',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (3,1,'DEP','Личный автотранспорт','Создан автоматически',NULL,NULL,'AVAILABLE',NULL,NULL,NULL,'2010-12-09 17:26:44',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (4,1,'DEP','Служебный автотранспорт','Создан автоматически',NULL,NULL,'AVAILABLE',NULL,NULL,NULL,'2010-12-09 17:26:44',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (5,0,'DEP','Сотрудники',NULL,NULL,'','AVAILABLE',NULL,'2010-12-10 16:06:27',NULL,'2010-12-10 16:06:27',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (6,5,'EMP','IT',NULL,NULL,'','FIRED',NULL,'2010-12-10 16:06:46',NULL,'2010-12-10 16:06:46','2010-12-10 16:06:53',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (7,5,'DEP','IT',NULL,NULL,'','AVAILABLE',NULL,'2010-12-10 16:07:01',NULL,'2010-12-10 16:07:01',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (8,7,'EMP','Пономарев Иван ','ivan.ponomarev','','111','FIRED','��\0\0\0\0\0','2010-12-10 17:15:27',NULL,'2010-12-10 16:07:20','2012-02-20 08:13:17',1,0,0,0,0,0,'2012-01-25 07:54:14',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (9,5,'DEP','Администрация',NULL,NULL,'','AVAILABLE',NULL,'2010-12-10 16:09:33',NULL,'2010-12-10 16:09:33',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (10,9,'EMP','Варенов П.П.','','Директор','','FIRED','\0\0\0\0\0\0\0\0','2012-04-11 11:32:14',NULL,'2010-12-10 16:10:02','2012-06-07 09:37:06',1,0,0,0,0,1,'2011-12-23 17:44:55',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (11,17,'EMP','Горборуков Николай','','','','AVAILABLE','�V�\0\0\0\0','2010-12-10 17:23:26',NULL,'2010-12-10 17:23:20',NULL,1,0,0,0,0,1,'2013-02-12 19:34:33',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (12,7,'EMP','Догонов Максим','maxim.dogonov','Начальник Телекомуникации','','FIRED','��?\0\0\0\0','2012-03-27 09:54:48',NULL,'2010-12-10 17:25:53','2012-06-07 12:58:32',1,0,0,0,0,0,'2012-06-07 11:06:54',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (13,5,'DEP','QA\\',NULL,NULL,'','FIRED',NULL,'2010-12-10 17:30:03',NULL,'2010-12-10 17:30:03','2010-12-10 17:30:10',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (14,5,'DEP','QA','',NULL,'','AVAILABLE',NULL,'2010-12-10 17:30:17',NULL,'2010-12-10 17:30:17',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (15,14,'EMP','Калачев Антон','','','','AVAILABLE','�l�\0\0\0\0','2012-04-13 10:55:51',NULL,'2010-12-10 17:30:48',NULL,1,0,0,0,0,0,'2013-02-13 11:53:32',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (16,14,'EMP','Пипич Юлия ','','','','AVAILABLE','�iY\0\0\0\0','2010-12-10 17:31:32',NULL,'2010-12-10 17:31:20',NULL,1,0,0,0,0,0,'2013-02-11 14:16:11',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (17,5,'DEP','Программисты',NULL,NULL,'','AVAILABLE',NULL,'2010-12-10 17:44:43',NULL,'2010-12-10 17:44:43',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (18,17,'EMP','Мурылев Сергей','andrey.limachko','Java Программист','','AVAILABLE','�m�\0\0\0\0','2010-12-10 17:45:15',NULL,'2010-12-10 17:44:51',NULL,1,0,0,0,0,0,'2013-02-13 09:18:32',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (19,17,'EMP','Сарбаев Юрий','yuri.sarbaev','Ведущий Разработчик','','FIRED','�J�\0\0\0\0','2010-12-10 18:00:13',NULL,'2010-12-10 17:59:59','2012-08-09 13:39:56',1,0,0,0,0,1,'2012-08-08 18:23:25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (20,17,'EMP','Кучелаева Елена ','','','','AVAILABLE','�u\0\0\0\0','2011-04-25 10:48:30',NULL,'2010-12-10 18:19:08',NULL,1,0,0,0,0,1,'2012-08-29 17:07:39',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (21,17,'EMP','Айрапетьянц Георгий','george.ayrapetiants','Старший Инженер Программист','','AVAILABLE','��D\0\0\0\0','2010-12-10 18:20:56',NULL,'2010-12-10 18:20:47',NULL,1,0,0,0,0,0,'2013-02-13 13:21:50',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (22,17,'EMP','Гусаков Кирилл','kirill.gusakov','Инженер Программист','','AVAILABLE','�s\0\0\0\0','2010-12-10 18:22:04',NULL,'2010-12-10 18:21:50',NULL,1,0,0,0,0,0,'2013-02-13 14:21:18',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (23,17,'EMP','Афоничев Иван','ivan.afonichev','Программист','','FIRED','�|\0\0\0\0','2010-12-10 18:22:37',NULL,'2010-12-10 18:22:33','2013-01-30 15:32:49',1,0,0,0,0,1,'2012-07-20 19:41:10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (24,17,'EMP','Рафиков Руслан','ruslan.rafikov','','','AVAILABLE','�z\0\0\0\0','2010-12-10 18:59:11',NULL,'2010-12-10 18:57:18',NULL,1,0,0,0,0,0,'2013-02-13 12:09:30',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (25,9,'EMP','Молодцова Дарья','darya.molodtsova','','','FIRED','�j�\0\0\0\0','2010-12-11 13:20:37',NULL,'2010-12-11 13:20:07','2012-05-28 09:48:27',1,0,0,0,0,1,'2012-05-14 13:21:30',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (26,7,'EMP','Артур  Захаров','','админ','','AVAILABLE','�x�\0\0\0\0','2012-05-28 10:07:06',NULL,'2010-12-11 13:21:38',NULL,1,0,0,0,0,0,'2013-02-13 14:37:42',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (27,17,'EMP','Дьяконов Михаил ','','','','AVAILABLE','�|�\0\0\0\0','2010-12-11 14:01:12',NULL,'2010-12-11 14:01:07',NULL,1,0,0,0,0,0,'2013-02-13 16:39:02',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (28,17,'EMP','Матюшкин Дмитрий ','dmitry.matushkin','','','FIRED','�H�\0\0\0\0','2010-12-11 14:01:41',NULL,'2010-12-11 14:01:35','2012-05-28 09:49:59',1,0,0,0,0,1,'2011-03-04 13:10:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (29,17,'EMP','Мартиросян Алексей','','','','AVAILABLE','�\\�\0\0\0\0','2010-12-11 14:02:13',NULL,'2010-12-11 14:02:02',NULL,1,0,0,0,0,1,'2013-02-06 12:43:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (30,17,'EMP','Николаев Алексей','alexey.nikolaev','','','AVAILABLE','��\0\0\0\0','2010-12-11 14:02:42',NULL,'2010-12-11 14:02:27',NULL,1,0,0,0,0,0,'2013-02-13 13:03:03',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (31,17,'EMP','Плясунова Мария','maria.plyasunova','','','AVAILABLE','�g\0\0\0\0','2010-12-11 14:03:05',NULL,'2010-12-11 14:02:51',NULL,1,0,0,0,0,0,'2013-02-13 09:41:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (32,17,'EMP','Яраев Дмитрий','damir.yaraev','','','FIRED','�X\0\0\0\0','2010-12-11 14:03:26',NULL,'2010-12-11 14:03:15','2012-04-03 17:29:03',1,0,0,0,0,1,'2012-04-03 17:14:05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (33,5,'DEP','Уборщицы','',NULL,'','AVAILABLE',NULL,'2010-12-11 14:05:48',NULL,'2010-12-11 14:05:48',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (34,33,'EMP','Тимошина Нина','','','','AVAILABLE','�M\0\0\0\0','2010-12-11 14:06:54',NULL,'2010-12-11 14:06:32',NULL,1,0,0,0,0,1,'2013-02-13 09:06:24',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (35,17,'EMP','Бочастый Алексей','','','','FIRED','�L�\0\0\0\0','2010-12-13 15:06:04',NULL,'2010-12-13 15:05:42','2013-01-30 15:33:00',1,0,0,0,0,0,'2012-06-04 10:50:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (36,17,'EMP','Демидов Кирилл','','','','FIRED','��o\0\0\0\0','2010-12-13 15:06:35',NULL,'2010-12-13 15:06:16','2012-07-09 11:20:07',1,0,0,0,0,1,'2012-07-03 15:31:52',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (37,14,'EMP','Исхакова Алия','','','','AVAILABLE','�y\0\0\0\0','2010-12-13 15:07:04',NULL,'2010-12-13 15:06:50',NULL,1,0,0,0,0,1,'2013-01-18 19:49:39',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (38,14,'EMP','Приказчиков Никита','nikita.prikazchikov',NULL,'','FIRED',NULL,'2010-12-13 15:07:14',NULL,'2010-12-13 15:07:14','2010-12-13 15:07:23',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (39,14,'EMP','Федотов Николай','','','','FIRED','��&\0\0\0\0','2010-12-13 15:09:11',NULL,'2010-12-13 15:08:58','2012-05-28 09:48:06',1,0,0,0,0,0,'2011-11-29 14:06:07',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (40,17,'EMP','Грошев Иван','','','','FIRED','pk/\0\0\0\0','2011-10-12 14:29:03',NULL,'2010-12-13 15:09:40','2012-02-20 08:13:56',1,0,0,0,0,1,'2012-02-06 15:29:24',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (41,14,'EMP','Масунов Андрей','','','','FIRED','�p\0\0\0\0','2010-12-13 15:10:29',NULL,'2010-12-13 15:10:08','2012-02-20 08:13:36',1,0,0,0,0,0,'2012-02-17 15:54:29',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (42,9,'EMP','Шитова Оксана','','','','AVAILABLE','��-\0\0\0\0','2011-07-07 09:02:25',NULL,'2010-12-13 15:10:39',NULL,1,0,0,0,0,1,'2013-02-13 17:22:26',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (43,9,'EMP','Хользунова Наталья','','','','AVAILABLE','�IG\0\0\0\0','2010-12-13 15:11:09',NULL,'2010-12-13 15:10:58',NULL,1,0,0,0,0,1,'2013-02-13 13:52:05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (44,17,'EMP','Косова Иветта','','','','AVAILABLE','�t>\0\0\0\0','2010-12-13 16:55:53',NULL,'2010-12-13 16:55:42',NULL,1,0,0,0,0,1,'2013-02-13 17:17:19',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (45,17,'EMP','Ирматов Павел ','','Программист','','AVAILABLE','�d&\0\0\0\0','2011-01-10 15:09:10',NULL,'2011-01-10 15:09:05',NULL,1,0,0,0,0,0,'2013-02-13 13:00:41',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (46,5,'DEP','Гости',NULL,NULL,'','AVAILABLE',NULL,'2011-01-10 15:11:01',NULL,'2011-01-10 15:11:01',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (47,46,'EMP','Гость','','','','AVAILABLE','�T�\0\0\0\0','2011-01-10 15:11:54',NULL,'2011-01-10 15:11:10',NULL,1,0,0,0,0,0,'2012-06-06 10:57:05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (48,46,'EMP','Гость','','','','AVAILABLE','-�w\0\0\0\0','2011-01-10 15:12:05',NULL,'2011-01-10 15:11:14',NULL,1,0,0,0,0,1,'2011-09-19 13:30:31',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (49,46,'EMP','Гость','','','','AVAILABLE','1�\0\0\0\0','2011-01-10 15:12:14',NULL,'2011-01-10 15:11:23',NULL,1,0,0,0,0,0,'2012-02-24 12:15:16',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (50,46,'EMP','Гость','','','','AVAILABLE','-OX\0\0\0\0','2011-01-10 15:12:22',NULL,'2011-01-10 15:11:34',NULL,1,0,0,0,0,0,'2012-04-09 13:09:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (51,7,'EMP','Дячук Александр','','','','AVAILABLE','-`�\0\0\0\0','2011-01-10 15:12:30',NULL,'2011-01-10 15:11:38',NULL,1,0,0,0,0,0,'2013-02-13 11:40:22',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (52,46,'EMP','Гость','','','','AVAILABLE','1��\0\0\0\0','2011-01-10 15:12:36',NULL,'2011-01-10 15:11:42',NULL,1,0,0,0,0,0,'2011-12-13 20:01:40',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (53,46,'EMP','Управляющая','','','','AVAILABLE','���\0\0\0\0','2011-01-11 15:48:32',NULL,'2011-01-11 15:47:58',NULL,1,0,0,0,0,1,'2012-02-10 16:46:00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (54,7,'EMP','Чекунов Алексей ','','','','FIRED','�g�\0\0\0\0','2011-01-19 12:43:31',NULL,'2011-01-19 12:39:11','2012-04-16 12:16:45',1,0,0,0,0,0,'2012-04-16 11:36:24',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (55,7,'EMP','Поленчук Михаил ','','','','FIRED','1�8\0\0\0\0','2011-10-21 09:55:07',NULL,'2011-01-19 12:40:00','2012-02-20 08:13:20',1,0,0,0,0,1,'2012-02-17 17:24:42',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (56,17,'EMP','Петров Дмитрий ','','','','AVAILABLE','�Y�\0\0\0\0','2011-02-02 17:56:46',NULL,'2011-02-02 17:54:41',NULL,1,0,0,0,0,1,'2013-02-13 16:26:11',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (57,17,'EMP','Бочкарев Александр','','','','FIRED','�x�\0\0\0\0','2011-03-18 15:14:59',NULL,'2011-03-18 15:13:39','2012-05-28 09:49:31',1,0,0,0,0,0,'2012-05-05 09:52:53',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (58,17,'EMP','Ткаченко Андрей ','','','','AVAILABLE','���\0\0\0\0','2011-03-22 11:00:57',NULL,'2011-03-22 10:59:33',NULL,1,0,0,0,0,0,'2013-02-13 13:18:14',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (59,17,'EMP','Друзина Мария','','','','AVAILABLE','��M\0\0\0\0','2011-04-04 12:17:20',NULL,'2011-04-04 12:14:57',NULL,1,0,0,0,0,0,'2013-02-13 07:30:46',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (60,17,'EMP','Королев Алексей','','','','FIRED','���\0\0\0\0','2011-04-12 12:26:05',NULL,'2011-04-12 12:24:07','2011-12-19 15:58:05',1,0,0,0,0,0,'2011-12-19 16:11:29',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (61,17,'EMP','Халдеев Иван','','','','AVAILABLE','���\0\0\0\0','2011-05-10 16:31:38',NULL,'2011-05-10 16:30:10',NULL,1,0,0,0,0,0,'2013-02-13 11:15:40',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (62,17,'EMP','','','','','FIRED','\0\0\0\0\0\0\0\0','2012-04-23 15:06:08',NULL,'2011-06-22 14:45:54','2012-04-23 15:06:18',1,0,0,0,0,1,'2012-04-23 14:04:22',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (63,17,'EMP','Заровный Алексей','','','','FIRED','�|�\0\0\0\0','2011-07-12 17:32:27',NULL,'2011-07-12 17:31:08','2012-02-21 07:40:47',1,0,0,0,0,0,'2012-02-16 14:02:40',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (64,17,'EMP','Ланда Дмитрий','','','','AVAILABLE','���\0\0\0\0','2011-08-02 09:14:52',NULL,'2011-08-02 09:12:20',NULL,1,0,0,0,0,0,'2013-02-13 11:22:56',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (65,7,'EMP','Авдеев Алексей','','','','FIRED','��?\0\0\0\0','2011-08-09 16:02:26','2012-03-16 18:00:00','2011-08-09 16:02:01','2012-03-27 09:54:24',1,0,0,0,0,1,'2012-03-16 17:34:32',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (66,17,'EMP','Дураков Тимофей ','','','','FIRED','�n�\0\0\0\0','2011-08-17 15:54:28',NULL,'2011-08-17 15:54:17','2012-08-06 15:47:24',1,0,0,0,0,1,'2012-08-03 17:39:43',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (67,14,'EMP','Александров Илья ','','','','FIRED','���\0\0\0\0','2011-08-25 14:41:02',NULL,'2011-08-25 14:38:35','2012-04-05 12:20:28',1,0,0,0,0,0,'2012-03-07 10:52:02',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (68,5,'DEP','парамонова','',NULL,'','FIRED',NULL,'2011-09-27 15:27:38',NULL,'2011-09-27 15:27:38','2012-04-03 17:37:08',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (69,68,'EMP','Мезникова Галина','','','','FIRED','\0\0\0\0\0\0\0\0','2011-09-27 15:33:44',NULL,'2011-09-27 15:28:28','2011-09-27 15:34:34',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (70,68,'EMP','Мезникова Галина','','','','FIRED','�J\0\0\0\0','2011-09-27 15:36:44',NULL,'2011-09-27 15:35:30','2012-01-20 13:15:44',1,0,0,0,0,0,'2012-01-02 18:06:16',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (71,68,'EMP','Михайлова Екатерина','','','','FIRED','�S�\0\0\0\0','2011-09-27 15:39:38',NULL,'2011-09-27 15:39:16','2012-04-03 17:36:54',1,0,0,0,0,1,'2012-02-09 18:01:11',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (72,68,'EMP','Курнушко Елена','','','','FIRED','�la\0\0\0\0','2011-09-27 15:43:35',NULL,'2011-09-27 15:42:59','2012-04-03 17:36:48',1,0,0,0,0,1,'2012-02-17 19:18:26',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (73,68,'EMP','Николаева Наталья','','','','FIRED','�mD\0\0\0\0','2011-09-27 15:46:05',NULL,'2011-09-27 15:45:41','2012-04-03 17:36:57',1,0,0,0,0,1,'2012-03-23 16:56:30',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (74,68,'EMP','Петрова Полина','','','','FIRED','�u�\0\0\0\0','2011-09-27 15:48:13',NULL,'2011-09-27 15:47:29','2012-04-03 17:37:01',1,0,0,0,0,1,'2012-03-23 14:59:10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (75,68,'EMP','Евдокимова Екатерина','','','','FIRED','���\0\0\0\0','2011-09-27 15:50:01',NULL,'2011-09-27 15:49:42','2012-04-03 17:36:43',1,0,0,0,0,1,'2012-03-24 09:38:56',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (76,68,'EMP','Ефремова Наталия','','','','FIRED','p\'\0\0\0\0','2011-10-12 10:38:34',NULL,'2011-10-12 10:33:45','2012-04-03 17:36:46',1,0,0,0,0,1,'2012-03-22 15:59:58',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (77,68,'EMP','Галимова Альфия','','','','FIRED','p1�\0\0\0\0','2011-10-12 10:37:49',NULL,'2011-10-12 10:34:22','2012-04-03 17:36:40',1,0,0,0,0,1,'2012-03-23 20:06:08',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (78,68,'EMP','Вострова Юлия','','','','FIRED','p94\0\0\0\0','2011-10-12 10:38:21',NULL,'2011-10-12 10:35:03','2012-04-03 17:36:38',1,0,0,0,0,1,'2012-03-16 20:01:56',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (79,68,'EMP','Матыцина Анастасия','','','','FIRED','p�\0\0\0\0','2011-10-12 10:38:03',NULL,'2011-10-12 10:36:00','2012-04-03 17:36:51',1,0,0,0,0,1,'2012-03-20 20:01:13',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (80,68,'EMP','Белякова Анна','','','','FIRED','pr\0\0\0\0','2011-10-12 10:39:40',NULL,'2011-10-12 10:39:29','2012-04-03 17:36:32',1,0,0,0,0,1,'2012-03-22 19:55:22',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (81,17,'EMP','Милов Иван ','','','','FIRED','o+g\0\0\0\0','2012-10-04 15:43:30',NULL,'2011-11-29 16:32:56','2013-01-30 15:34:49',1,0,0,0,0,0,'2012-10-04 14:39:49',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (82,17,'EMP','Колачев Антон',NULL,NULL,'','FIRED',NULL,'2011-12-19 15:55:51',NULL,'2011-12-19 15:55:51','2012-04-13 11:00:03',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (83,17,'EMP','Королев Алексей ','','','','FIRED','���\0\0\0\0','2011-12-20 10:47:52',NULL,'2011-12-20 10:46:30','2012-08-06 15:46:52',1,0,0,0,0,1,'2012-08-06 08:40:04',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (84,9,'EMP','Лариса Александровна','','','','AVAILABLE','r\r\0\0\0\0','2012-03-05 13:04:36',NULL,'2012-02-14 12:20:12',NULL,1,0,0,0,0,1,'2013-01-15 14:27:12',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (85,9,'EMP','Управляющая','','','','AVAILABLE','p?�\0\0\0\0','2012-02-14 12:21:45',NULL,'2012-02-14 12:21:14',NULL,1,0,0,0,0,0,'2013-02-07 12:13:50',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (86,9,'EMP','Румен','','','','FIRED','1�8\0\0\0\0','2012-02-20 10:19:43',NULL,'2012-02-20 10:18:58','2012-03-05 15:06:15',1,0,0,0,0,1,'2012-03-05 14:03:53',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (87,9,'EMP','Балдур','','','','FIRED','�p\0\0\0\0','2012-02-20 10:20:55',NULL,'2012-02-20 10:20:22','2012-03-15 07:42:33',1,0,0,0,0,0,'2012-03-15 08:39:17',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (88,14,'EMP','Волков Антон','','','','AVAILABLE','�|�\0\0\0\0','2012-02-21 07:41:09',NULL,'2012-02-20 12:44:26',NULL,1,0,0,0,0,1,'2013-02-13 17:09:53',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (89,17,'EMP','Васильев Роман','','','','FIRED','1�8\0\0\0\0','2012-03-05 15:06:58',NULL,'2012-03-05 15:06:45','2012-08-21 18:32:41',1,0,0,0,0,1,'2012-08-21 10:13:48',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (90,33,'EMP','111',NULL,NULL,'','FIRED',NULL,'2012-04-03 17:31:15',NULL,'2012-04-03 17:31:15','2012-08-06 15:46:22',1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (91,17,'EMP','Бакулин Алексей','','','','AVAILABLE','���\0\0\0\0','2012-04-05 12:20:49',NULL,'2012-04-05 12:19:18',NULL,1,0,0,0,0,0,'2013-02-13 10:43:25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (92,17,'EMP','Рухленко Игорь ','','','','FIRED','p94\0\0\0\0','2012-06-07 10:36:20',NULL,'2012-04-11 11:27:16','2013-01-30 15:38:34',1,0,0,0,0,1,'2013-01-30 16:17:31',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (93,7,'EMP','Чекунов Алексей','','','','FIRED','�g�\0\0\0\0','2012-04-16 12:18:00',NULL,'2012-04-16 12:17:45','2012-05-28 09:47:39',1,0,0,0,0,0,'2012-04-20 15:27:36',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (94,17,'EMP','','','','','FIRED','��\0\0\0\0\0','2012-05-05 10:50:43',NULL,'2012-05-05 10:49:45','2012-05-05 15:36:46',1,0,0,0,0,0,'2012-05-05 13:11:47',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (95,7,'EMP','Кирилл Демидов','','','','AVAILABLE','p\'\0\0\0\0','2012-06-04 12:08:57',NULL,'2012-05-28 10:58:22',NULL,1,0,0,0,0,1,'2013-02-08 19:02:40',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (96,9,'EMP','Жиганова Юлия','','офис--менеджер','','AVAILABLE','�X\0\0\0\0','2012-06-04 09:19:41',NULL,'2012-06-04 09:18:52',NULL,1,0,0,0,0,0,'2013-02-13 15:28:03',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (97,7,'EMP','z','','','','FIRED','��?\0\0\0\0','2012-06-07 13:00:16',NULL,'2012-06-07 12:59:59','2012-07-16 10:25:34',1,0,0,0,0,0,'2012-06-08 11:06:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (98,17,'EMP','Авдеев Алексей','','','','AVAILABLE','pr\0\0\0\0','2012-06-07 15:03:04',NULL,'2012-06-07 15:02:08',NULL,1,0,0,0,0,1,'2013-01-16 19:33:50',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (99,9,'EMP','Петрунин Вадим','','','','AVAILABLE','pk/\0\0\0\0','2012-07-12 09:56:08',NULL,'2012-07-12 09:55:48',NULL,1,0,0,0,0,0,'2013-02-13 09:41:47',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (100,17,'EMP','Яковлев Евгений','','','','AVAILABLE','��?\0\0\0\0','2012-07-16 10:25:51',NULL,'2012-07-16 10:24:32',NULL,1,0,0,0,0,0,'2013-02-13 11:40:16',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (101,14,'EMP','Башкевич Алексей','','','','FIRED','�la\0\0\0\0','2012-07-23 10:53:59',NULL,'2012-07-23 10:32:54','2012-09-13 17:09:09',1,0,0,0,0,0,'2012-09-10 10:19:10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (102,7,'EMP','Стюшин Максим','','','','AVAILABLE','1��\0\0\0\0','2012-07-25 11:59:03',NULL,'2012-07-25 11:58:47',NULL,1,0,0,0,0,0,'2013-02-13 17:16:31',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (103,14,'EMP','Номеровская Елена','','','','AVAILABLE','-I�\0\0\0\0','2012-07-30 16:30:24',NULL,'2012-07-30 16:29:58',NULL,1,0,0,0,0,0,'2013-02-13 16:02:41',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (104,17,'EMP','Симонова Евгения','','','','AVAILABLE','-V}\0\0\0\0','2012-07-30 16:35:37',NULL,'2012-07-30 16:35:10',NULL,1,0,0,0,0,1,'2013-02-13 12:52:26',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (105,17,'EMP','Молчанов Иван','','','','AVAILABLE','*��\0\0\0\0','2012-07-30 16:38:08',NULL,'2012-07-30 16:37:24',NULL,1,0,0,0,0,0,'2013-02-13 08:46:17',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (106,17,'EMP','Маслов Святослав','','','','AVAILABLE','-��\0\0\0\0','2012-07-30 16:42:30',NULL,'2012-07-30 16:42:04',NULL,1,0,0,0,0,0,'2013-02-13 10:59:05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (107,17,'EMP','Гаврилюк Евгений','','','','AVAILABLE','1�\0\0\0\0','2012-07-30 16:47:28',NULL,'2012-07-30 16:44:03',NULL,1,0,0,0,0,0,'2013-02-13 11:05:33',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (108,17,'EMP','Олейников Владислав','','','','AVAILABLE','�n�\0\0\0\0','2012-08-09 13:38:56',NULL,'2012-08-09 13:38:34',NULL,1,0,0,0,0,0,'2013-02-13 13:04:12',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (109,5,'DEP','Учителя английского',NULL,NULL,'','AVAILABLE',NULL,'2012-08-21 18:27:49',NULL,'2012-08-21 18:27:49',NULL,1,0,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (110,109,'EMP','Разумова Маргарита','','','','AVAILABLE','�J�\0\0\0\0','2012-08-21 18:29:43',NULL,'2012-08-21 18:29:15',NULL,1,0,0,0,0,0,'2013-02-13 14:58:20',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (111,109,'EMP','Дубровина Ирина','','','','AVAILABLE','1�8\0\0\0\0','2012-08-21 18:33:17',NULL,'2012-08-21 18:30:50',NULL,1,0,0,0,0,0,'2012-09-06 19:05:00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (112,9,'EMP','потеряли карту','Потеряна 26.12.2012 (Каплин Кирилл)','','','FIRED','p!�\0\0\0\0','2012-09-10 17:10:52',NULL,'2012-09-10 17:10:34','2012-12-26 12:27:18',1,0,0,0,0,1,'2012-12-18 17:37:13',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (113,109,'EMP','Кленова Анастаия','','','','AVAILABLE','�la\0\0\0\0','2012-09-13 17:10:00',NULL,'2012-09-13 17:08:07',NULL,1,0,0,0,0,1,'2013-02-05 19:08:55',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (114,17,'EMP','Лунев Артем','','','','AVAILABLE','-z1\0\0\0\0','2012-10-01 13:49:15',NULL,'2012-10-01 13:48:30',NULL,1,0,0,0,0,0,'2013-02-13 14:42:41',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (115,17,'EMP','Конуров Дмитрий','','','','AVAILABLE','-e\0\0\0\0','2012-10-09 16:16:08',NULL,'2012-10-09 16:15:27',NULL,1,0,0,0,0,0,'2013-02-13 13:13:43',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (116,17,'EMP','Черкасов Андрей','','','','AVAILABLE','-�\0\0\0\0','2012-10-09 16:17:22',NULL,'2012-10-09 16:16:49',NULL,1,0,0,0,0,0,'2013-02-13 13:13:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (117,17,'EMP','Матюшкин Дмитрий','','','','AVAILABLE','�H�\0\0\0\0','2012-10-15 13:49:43',NULL,'2012-10-15 13:49:20',NULL,1,0,0,0,0,1,'2013-01-31 21:37:25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (118,2,'EMP','Electrik',NULL,NULL,'1','AVAILABLE',';\0\0\0\0','2012-10-26 13:32:35',NULL,'2012-10-26 13:32:03',NULL,2,0,0,0,0,1,'2013-02-13 14:39:05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (119,14,'EMP','Лисина Александра','','','','AVAILABLE','�f+\0\0\0\0','2012-11-19 10:47:18',NULL,'2012-11-13 14:17:47',NULL,1,0,0,0,0,0,'2013-02-13 16:02:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (120,17,'EMP','Прудилин Владимир','','','','AVAILABLE','*p\"\0\0\0\0','2012-11-13 14:19:30',NULL,'2012-11-13 14:19:11',NULL,1,0,0,0,0,0,'2013-02-13 11:43:41',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (121,14,'EMP','Пименов Александр','','','','AVAILABLE','*��\0\0\0\0','2012-11-26 13:51:13',NULL,'2012-11-26 13:50:54',NULL,1,0,0,0,0,0,'2013-02-13 14:11:14',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (122,14,'EMP','Абдулин Руслан','','','','AVAILABLE','-R�\0\0\0\0','2012-12-05 15:23:10',NULL,'2012-12-05 15:22:52',NULL,1,0,0,0,0,0,'2013-02-13 14:43:05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (123,9,'EMP','Михеева Алена','','','','AVAILABLE','-l�\0\0\0\0','2012-12-05 15:24:22',NULL,'2012-12-05 15:24:08',NULL,1,0,0,0,0,1,'2013-02-01 21:03:22',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (124,9,'EMP','Каплин Кирилл','','','','AVAILABLE','p�\0\0\0\0','2012-12-26 12:30:01',NULL,'2012-12-26 12:27:40',NULL,1,0,0,0,0,0,'2013-02-13 16:11:14',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (125,14,'EMP','Алексей Трубавин','','','','AVAILABLE','-i\0\0\0\0\0','2013-01-09 16:06:31',NULL,'2013-01-09 16:06:00',NULL,1,0,0,0,0,0,'2013-02-13 15:02:43',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (126,14,'EMP','Эдуард Сухарев','','','','AVAILABLE','-�\0\0\0\0','2013-01-09 16:07:53',NULL,'2013-01-09 16:07:32',NULL,1,0,0,0,0,0,'2013-02-13 11:02:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (127,46,'EMP','Качурин Дмитрий','','','','AVAILABLE','p94\0\0\0\0','2013-01-30 15:39:30',NULL,'2013-01-30 15:27:17',NULL,1,0,0,0,0,0,'2013-02-07 17:45:00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `personal` VALUES (128,14,'EMP','Сластнева Алина','','','','AVAILABLE','���\0\0\0\0','2013-01-30 15:29:22',NULL,'2013-01-30 15:29:09',NULL,1,0,0,0,0,0,'2013-02-13 09:58:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`ivan`@`%` */ /*!50003 TRIGGER `update_personal` AFTER UPDATE ON `personal` FOR EACH ROW BEGIN
    INSERT INTO `tc-db-log`.`our_log` Set person = NEW.ID, logtime = NEW.LOCATIONACT, zone = NEW.LOCATIONZONE;
 END */;;
DELIMITER ;



/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */


--
-- Структура таблицы `permission_groups`
--

CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `group_name`) VALUES
(1, 'админка'),
(2, 'отчетность');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permission_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_group_id` (`permission_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `name`, `permission_group_id`) VALUES
(1, 'access_admin', 'Доступ к админке', 1),
(2, 'access_reports', 'Доступ к отчетам', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Админ'),
(2, 'Бухгалтер');

-- --------------------------------------------------------

--
-- Структура таблицы `roles_permissions`
--

CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `id_role` int(11) NOT NULL,
  `id_permission` int(11) NOT NULL,
  KEY `id_role` (`id_role`),
  KEY `id_permission` (`id_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles_permissions`
--

INSERT INTO `roles_permissions` (`id_role`, `id_permission`) VALUES
(1, 1),
(2, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `persons_roles`
--

CREATE TABLE IF NOT EXISTS `persons_roles` (
  `id_person` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  KEY `id_person` (`id_person`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_roles`
--

INSERT INTO `persons_roles` (`id_person`, `id_role`) VALUES
(106, 1),
(107, 2),
(106, 2);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`id_permission`) REFERENCES `permissions` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_roles`
--
ALTER TABLE `persons_roles`
  ADD CONSTRAINT `persons_roles_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `personal` (`ID`),
  ADD CONSTRAINT `persons_roles_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`);


/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */
/* //////////////////////////////////////////// */


--
-- Table structure for table `photo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `ID` int(11) NOT NULL default '0',
  `TS` int(11) default '0',
  `PREVIEW_WIDTH` int(11) default NULL,
  `PREVIEW_HEIGHT` int(11) default NULL,
  `PREVIEW_RASTER` longblob,
  `HIRES_WIDTH` int(11) default NULL,
  `HIRES_HEIGHT` int(11) default NULL,
  `HIRES_RASTER` longblob,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--


--
-- Table structure for table `planfloors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planfloors` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `ORDERIDX` int(11) default '0',
  `WIDTH` varchar(50) character set utf8 default NULL,
  `HEIGHT` varchar(50) character set utf8 default NULL,
  `SCALE` varchar(50) character set utf8 default NULL,
  `COLOR` int(11) default '0',
  `KEEPBGAR` tinyint(1) default '1',
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planfloors`
--


--
-- Table structure for table `planobjects`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planobjects` (
  `ID` int(11) NOT NULL,
  `TYPE` enum('POLY','PICTURE','TEXT','ACCESS_POINT','CAMERA') default NULL,
  `FLOORID` int(11) default '0',
  `APID` int(11) default '0',
  `ZONEID` int(11) default '0',
  `CAMID` int(11) default '0',
  `CAM_TYPE` enum('NOT_AVAILABLE','TRASSIR') default 'NOT_AVAILABLE',
  `CAM_PARAM1` varbinary(1000) default '',
  `CAM_PARAM2` varbinary(1000) default '',
  `XPOS` varchar(32) character set utf8 default NULL,
  `YPOS` varchar(32) character set utf8 default NULL,
  `WIDTH` varchar(32) character set utf8 default NULL,
  `HEIGHT` varchar(32) character set utf8 default NULL,
  `ANGLE` double default '0',
  `ZPOS` int(11) default '0',
  `LINE_COLOR` int(11) default '0',
  `LINE_WIDTH` varchar(32) character set utf8 default NULL,
  `TEXT` varchar(400) character set utf8 default NULL,
  `TEXT_FONTSIZE` varchar(32) character set utf8 default NULL,
  `TEXT_FONTCOLOR` int(11) default '0',
  `TEXT_HALIGN` enum('LEFT','CENTER','RIGHT') default NULL,
  `TEXT_VALIGN` enum('LEFT','CENTER','RIGHT') default NULL,
  `TEXT_WORDWRAP` tinyint(1) default '0',
  `FILL_COLOR` int(11) default '0',
  `PARAM1` varbinary(32768) default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planobjects`
--


--
-- Table structure for table `planobjectsbin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planobjectsbin` (
  `ID` int(11) NOT NULL,
  `FLOORID` int(11) default '0',
  `OBJID` int(11) default '0',
  `BINDATA` longblob,
  PRIMARY KEY  (`ID`),
  KEY `FLOORID` (`FLOORID`),
  KEY `OBJID` (`OBJID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planobjectsbin`
--


--
-- Table structure for table `reportuserdep`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportuserdep` (
  `USER_ID` int(11) NOT NULL default '0',
  `EMP_ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`USER_ID`,`EMP_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `EMP_ID` (`EMP_ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportuserdep`
--


--
-- Table structure for table `rulebindings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rulebindings` (
  `PERSONAL_ID` int(11) NOT NULL default '0',
  `RULE_ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`PERSONAL_ID`,`RULE_ID`),
  KEY `RULE_ID` (`RULE_ID`),
  KEY `PERSONAL_ID` (`PERSONAL_ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rulebindings`
--

INSERT INTO `rulebindings` VALUES (6,1);
INSERT INTO `rulebindings` VALUES (8,1);
INSERT INTO `rulebindings` VALUES (10,1);
INSERT INTO `rulebindings` VALUES (11,1);
INSERT INTO `rulebindings` VALUES (12,1);
INSERT INTO `rulebindings` VALUES (15,1);
INSERT INTO `rulebindings` VALUES (16,1);
INSERT INTO `rulebindings` VALUES (18,1);
INSERT INTO `rulebindings` VALUES (19,1);
INSERT INTO `rulebindings` VALUES (20,1);
INSERT INTO `rulebindings` VALUES (21,1);
INSERT INTO `rulebindings` VALUES (22,1);
INSERT INTO `rulebindings` VALUES (23,1);
INSERT INTO `rulebindings` VALUES (24,1);
INSERT INTO `rulebindings` VALUES (25,1);
INSERT INTO `rulebindings` VALUES (26,1);
INSERT INTO `rulebindings` VALUES (27,1);
INSERT INTO `rulebindings` VALUES (28,1);
INSERT INTO `rulebindings` VALUES (29,1);
INSERT INTO `rulebindings` VALUES (30,1);
INSERT INTO `rulebindings` VALUES (31,1);
INSERT INTO `rulebindings` VALUES (32,1);
INSERT INTO `rulebindings` VALUES (34,1);
INSERT INTO `rulebindings` VALUES (35,1);
INSERT INTO `rulebindings` VALUES (36,1);
INSERT INTO `rulebindings` VALUES (37,1);
INSERT INTO `rulebindings` VALUES (38,1);
INSERT INTO `rulebindings` VALUES (39,1);
INSERT INTO `rulebindings` VALUES (40,1);
INSERT INTO `rulebindings` VALUES (41,1);
INSERT INTO `rulebindings` VALUES (42,1);
INSERT INTO `rulebindings` VALUES (43,1);
INSERT INTO `rulebindings` VALUES (44,1);
INSERT INTO `rulebindings` VALUES (45,1);
INSERT INTO `rulebindings` VALUES (47,1);
INSERT INTO `rulebindings` VALUES (48,1);
INSERT INTO `rulebindings` VALUES (49,1);
INSERT INTO `rulebindings` VALUES (50,1);
INSERT INTO `rulebindings` VALUES (51,1);
INSERT INTO `rulebindings` VALUES (52,1);
INSERT INTO `rulebindings` VALUES (53,1);
INSERT INTO `rulebindings` VALUES (54,1);
INSERT INTO `rulebindings` VALUES (55,1);
INSERT INTO `rulebindings` VALUES (56,1);
INSERT INTO `rulebindings` VALUES (57,1);
INSERT INTO `rulebindings` VALUES (58,1);
INSERT INTO `rulebindings` VALUES (59,1);
INSERT INTO `rulebindings` VALUES (60,1);
INSERT INTO `rulebindings` VALUES (61,1);
INSERT INTO `rulebindings` VALUES (62,1);
INSERT INTO `rulebindings` VALUES (63,1);
INSERT INTO `rulebindings` VALUES (64,1);
INSERT INTO `rulebindings` VALUES (65,1);
INSERT INTO `rulebindings` VALUES (66,1);
INSERT INTO `rulebindings` VALUES (67,1);
INSERT INTO `rulebindings` VALUES (69,1);
INSERT INTO `rulebindings` VALUES (70,1);
INSERT INTO `rulebindings` VALUES (71,1);
INSERT INTO `rulebindings` VALUES (72,1);
INSERT INTO `rulebindings` VALUES (73,1);
INSERT INTO `rulebindings` VALUES (74,1);
INSERT INTO `rulebindings` VALUES (75,1);
INSERT INTO `rulebindings` VALUES (76,1);
INSERT INTO `rulebindings` VALUES (77,1);
INSERT INTO `rulebindings` VALUES (78,1);
INSERT INTO `rulebindings` VALUES (79,1);
INSERT INTO `rulebindings` VALUES (80,1);
INSERT INTO `rulebindings` VALUES (81,1);
INSERT INTO `rulebindings` VALUES (82,1);
INSERT INTO `rulebindings` VALUES (83,1);
INSERT INTO `rulebindings` VALUES (84,1);
INSERT INTO `rulebindings` VALUES (85,1);
INSERT INTO `rulebindings` VALUES (86,1);
INSERT INTO `rulebindings` VALUES (87,1);
INSERT INTO `rulebindings` VALUES (88,1);
INSERT INTO `rulebindings` VALUES (89,1);
INSERT INTO `rulebindings` VALUES (90,1);
INSERT INTO `rulebindings` VALUES (91,1);
INSERT INTO `rulebindings` VALUES (92,1);
INSERT INTO `rulebindings` VALUES (93,1);
INSERT INTO `rulebindings` VALUES (94,1);
INSERT INTO `rulebindings` VALUES (95,1);
INSERT INTO `rulebindings` VALUES (96,1);
INSERT INTO `rulebindings` VALUES (97,1);
INSERT INTO `rulebindings` VALUES (98,1);
INSERT INTO `rulebindings` VALUES (99,1);
INSERT INTO `rulebindings` VALUES (100,1);
INSERT INTO `rulebindings` VALUES (101,1);
INSERT INTO `rulebindings` VALUES (102,1);
INSERT INTO `rulebindings` VALUES (103,1);
INSERT INTO `rulebindings` VALUES (104,1);
INSERT INTO `rulebindings` VALUES (105,1);
INSERT INTO `rulebindings` VALUES (106,1);
INSERT INTO `rulebindings` VALUES (107,1);
INSERT INTO `rulebindings` VALUES (108,1);
INSERT INTO `rulebindings` VALUES (110,1);
INSERT INTO `rulebindings` VALUES (111,1);
INSERT INTO `rulebindings` VALUES (112,1);
INSERT INTO `rulebindings` VALUES (113,1);
INSERT INTO `rulebindings` VALUES (114,1);
INSERT INTO `rulebindings` VALUES (115,1);
INSERT INTO `rulebindings` VALUES (116,1);
INSERT INTO `rulebindings` VALUES (117,1);
INSERT INTO `rulebindings` VALUES (118,1);
INSERT INTO `rulebindings` VALUES (119,1);
INSERT INTO `rulebindings` VALUES (120,1);
INSERT INTO `rulebindings` VALUES (121,1);
INSERT INTO `rulebindings` VALUES (122,1);
INSERT INTO `rulebindings` VALUES (123,1);
INSERT INTO `rulebindings` VALUES (124,1);
INSERT INTO `rulebindings` VALUES (125,1);
INSERT INTO `rulebindings` VALUES (126,1);
INSERT INTO `rulebindings` VALUES (127,1);
INSERT INTO `rulebindings` VALUES (128,1);

--
-- Table structure for table `sm`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sm` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `DESCRIPTION` varchar(2000) character set utf8 default NULL,
  `INITIAL_STATE` int(11) default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sm`
--

INSERT INTO `sm` VALUES (1,'Прямое управление приводами','Direct motor control',12);
INSERT INTO `sm` VALUES (2,'Открыть, закрыть, стоп. Логика \"B\"','25-27',11);
INSERT INTO `sm` VALUES (3,'Открыть, закрыть, стоп. Режим \"C\". Нормально замкнутые датчики.','37-39, DET_INACTIVE=0',0);
INSERT INTO `sm` VALUES (4,'Открыть, закрыть, стоп. Режим \"C\". Нормально разомкнутые датчики.','37-39, DET_INACTIVE=1',0);
INSERT INTO `sm` VALUES (5,'Открыть и стоп. Режим \"Е\". Нормально замкнутые датчики.','30-32, DET_INACTIVE=0',0);
INSERT INTO `sm` VALUES (6,'Открыть и стоп. Режим \"Е\". Нормально разомкнутые датчики.','30-32, DET_INACTIVE=1',0);

--
-- Table structure for table `smstates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smstates` (
  `SMID` int(11) NOT NULL default '0',
  `STATEID` int(11) NOT NULL default '0',
  `NAME` varchar(200) character set utf8 default NULL,
  `FLAGS` int(11) default '0',
  `OUTPUT_PORT` int(11) default '-1',
  `OUTPUT_VALUE` int(11) default '0',
  PRIMARY KEY  (`SMID`,`STATEID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smstates`
--

INSERT INTO `smstates` VALUES (1,0,'Stopping_1',0,13,0);
INSERT INTO `smstates` VALUES (1,1,'Stopping_2',0,15,0);
INSERT INTO `smstates` VALUES (1,2,'Stopping_3',0,14,0);
INSERT INTO `smstates` VALUES (1,3,'Stopped',0,16,0);
INSERT INTO `smstates` VALUES (1,4,'Closed_idle',1,13,0);
INSERT INTO `smstates` VALUES (1,5,'Opening_1',0,14,1);
INSERT INTO `smstates` VALUES (1,6,'Opening_2',0,16,1);
INSERT INTO `smstates` VALUES (1,7,'Opening_3',0,14,0);
INSERT INTO `smstates` VALUES (1,8,'Opened_idle',2,16,0);
INSERT INTO `smstates` VALUES (1,9,'Closing_1',0,15,1);
INSERT INTO `smstates` VALUES (1,10,'Closing_2',0,13,1);
INSERT INTO `smstates` VALUES (1,11,'Closing_3',0,15,0);
INSERT INTO `smstates` VALUES (1,12,'Init_1',0,13,0);
INSERT INTO `smstates` VALUES (1,13,'Init_2',0,14,0);
INSERT INTO `smstates` VALUES (1,14,'Init_3',0,15,0);
INSERT INTO `smstates` VALUES (1,15,'Init_4',0,16,0);
INSERT INTO `smstates` VALUES (2,0,'Stopping_1',0,13,1);
INSERT INTO `smstates` VALUES (2,1,'Stopping_2',0,13,0);
INSERT INTO `smstates` VALUES (2,2,'Stopped',0,-1,0);
INSERT INTO `smstates` VALUES (2,3,'Opening_1',0,14,1);
INSERT INTO `smstates` VALUES (2,4,'Opening_2',0,14,0);
INSERT INTO `smstates` VALUES (2,5,'Opening',0,-1,0);
INSERT INTO `smstates` VALUES (2,6,'Opened',2,-1,0);
INSERT INTO `smstates` VALUES (2,7,'Closing_1',0,15,1);
INSERT INTO `smstates` VALUES (2,8,'Closing_2',0,15,0);
INSERT INTO `smstates` VALUES (2,9,'Closing',0,-1,0);
INSERT INTO `smstates` VALUES (2,10,'Closed',1,-1,0);
INSERT INTO `smstates` VALUES (2,11,'Init_1',0,13,0);
INSERT INTO `smstates` VALUES (2,12,'Init_2',0,15,0);
INSERT INTO `smstates` VALUES (2,13,'Init_3',0,14,0);
INSERT INTO `smstates` VALUES (3,0,'Initial',0,13,0);
INSERT INTO `smstates` VALUES (3,1,'Stopping_1',0,14,0);
INSERT INTO `smstates` VALUES (3,2,'Stopping_2',0,15,0);
INSERT INTO `smstates` VALUES (3,3,'Stopped',0,13,1);
INSERT INTO `smstates` VALUES (3,4,'Closed',1,-1,0);
INSERT INTO `smstates` VALUES (3,5,'Opened',2,-1,0);
INSERT INTO `smstates` VALUES (3,6,'Opening_1',0,13,0);
INSERT INTO `smstates` VALUES (3,7,'Opening_2',0,14,1);
INSERT INTO `smstates` VALUES (3,8,'Opening_3',0,14,0);
INSERT INTO `smstates` VALUES (3,9,'Opening_4',0,13,1);
INSERT INTO `smstates` VALUES (3,10,'Closing_1',0,13,0);
INSERT INTO `smstates` VALUES (3,11,'Closing_2',0,15,1);
INSERT INTO `smstates` VALUES (3,12,'Closing_3',0,15,0);
INSERT INTO `smstates` VALUES (3,13,'Closing_4',0,13,1);
INSERT INTO `smstates` VALUES (4,0,'Initial',0,13,0);
INSERT INTO `smstates` VALUES (4,1,'Stopping_1',0,14,0);
INSERT INTO `smstates` VALUES (4,2,'Stopping_2',0,15,0);
INSERT INTO `smstates` VALUES (4,3,'Stopped',0,13,1);
INSERT INTO `smstates` VALUES (4,4,'Closed',1,-1,0);
INSERT INTO `smstates` VALUES (4,5,'Opened',2,-1,0);
INSERT INTO `smstates` VALUES (4,6,'Opening_1',0,13,0);
INSERT INTO `smstates` VALUES (4,7,'Opening_2',0,14,1);
INSERT INTO `smstates` VALUES (4,8,'Opening_3',0,14,0);
INSERT INTO `smstates` VALUES (4,9,'Opening_4',0,13,1);
INSERT INTO `smstates` VALUES (4,10,'Closing_1',0,13,0);
INSERT INTO `smstates` VALUES (4,11,'Closing_2',0,15,1);
INSERT INTO `smstates` VALUES (4,12,'Closing_3',0,15,0);
INSERT INTO `smstates` VALUES (4,13,'Closing_4',0,13,1);
INSERT INTO `smstates` VALUES (5,0,'Init_1',0,14,0);
INSERT INTO `smstates` VALUES (5,1,'Init_2',0,13,0);
INSERT INTO `smstates` VALUES (5,2,'Closed_idle',1,-1,0);
INSERT INTO `smstates` VALUES (5,3,'Opened_idle',2,-1,0);
INSERT INTO `smstates` VALUES (5,4,'Stopping_1',0,13,1);
INSERT INTO `smstates` VALUES (5,5,'Stopping_2',0,13,0);
INSERT INTO `smstates` VALUES (5,6,'Stopped_in_the_middle',0,-1,0);
INSERT INTO `smstates` VALUES (5,7,'Opening_1',0,14,1);
INSERT INTO `smstates` VALUES (5,8,'Opening_2',0,14,0);
INSERT INTO `smstates` VALUES (5,9,'Opening',0,-1,0);
INSERT INTO `smstates` VALUES (5,10,'Closing_1',0,14,1);
INSERT INTO `smstates` VALUES (5,11,'Closing_2',0,14,0);
INSERT INTO `smstates` VALUES (5,12,'Closing',0,-1,0);
INSERT INTO `smstates` VALUES (5,13,'Closing_to_open_1',0,14,1);
INSERT INTO `smstates` VALUES (5,14,'Closing_to_open_2',0,14,0);
INSERT INTO `smstates` VALUES (5,15,'Closing_to_open',0,-1,0);
INSERT INTO `smstates` VALUES (5,16,'EmgLock',0,-1,0);
INSERT INTO `smstates` VALUES (5,17,'EmgLockPassed',0,-1,0);
INSERT INTO `smstates` VALUES (6,0,'Init_1',0,14,0);
INSERT INTO `smstates` VALUES (6,1,'Init_2',0,13,0);
INSERT INTO `smstates` VALUES (6,2,'Closed_idle',1,-1,0);
INSERT INTO `smstates` VALUES (6,3,'Opened_idle',2,-1,0);
INSERT INTO `smstates` VALUES (6,4,'Stopping_1',0,13,1);
INSERT INTO `smstates` VALUES (6,5,'Stopping_2',0,13,0);
INSERT INTO `smstates` VALUES (6,6,'Stopped_in_the_middle',0,-1,0);
INSERT INTO `smstates` VALUES (6,7,'Opening_1',0,14,1);
INSERT INTO `smstates` VALUES (6,8,'Opening_2',0,14,0);
INSERT INTO `smstates` VALUES (6,9,'Opening',0,-1,0);
INSERT INTO `smstates` VALUES (6,10,'Closing_1',0,14,1);
INSERT INTO `smstates` VALUES (6,11,'Closing_2',0,14,0);
INSERT INTO `smstates` VALUES (6,12,'Closing',0,-1,0);
INSERT INTO `smstates` VALUES (6,13,'Closing_to_open_1',0,14,1);
INSERT INTO `smstates` VALUES (6,14,'Closing_to_open_2',0,14,0);
INSERT INTO `smstates` VALUES (6,15,'Closing_to_open',0,-1,0);
INSERT INTO `smstates` VALUES (6,16,'EmgLock',0,-1,0);
INSERT INTO `smstates` VALUES (6,17,'EmgLockPassed',0,-1,0);

--
-- Table structure for table `smtrans`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smtrans` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) character set utf8 default NULL,
  `SMID` int(11) default NULL,
  `SOURCE_STATE` int(11) default NULL,
  `TARGET_STATE` int(11) default NULL,
  `TYPE` enum('IMMEDIATE','TIME','TIMEPARAM','PORT') default 'IMMEDIATE',
  `TRTIME` int(11) default '-1',
  `TIMEPARAM` int(11) default '-1',
  `PORT` int(11) default '-1',
  `PORTVALUE` int(11) default '0',
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smtrans`
--

INSERT INTO `smtrans` VALUES (1,'Stopping_1 -> Stopping_2',1,0,1,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (2,'Stopping_2 -> Stopping_3',1,1,2,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (3,'Stopping_3 -> Stopped',1,2,3,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (4,'Opening_1 -> Opening_2',1,5,6,'TIMEPARAM',-1,13,-1,0);
INSERT INTO `smtrans` VALUES (5,'Opening_2 -> Opening_3',1,6,7,'TIMEPARAM',-1,12,-1,0);
INSERT INTO `smtrans` VALUES (6,'Opening_3 -> Opened_idle',1,7,8,'TIMEPARAM',-1,13,-1,0);
INSERT INTO `smtrans` VALUES (7,'Opening_1 -> Stopping_1',1,5,0,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (8,'Opening_2 -> Stopping_1',1,6,0,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (9,'Opening_3 -> Stopping_1',1,7,0,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (10,'Closing_1 -> Closing_2',1,9,10,'TIMEPARAM',-1,13,-1,0);
INSERT INTO `smtrans` VALUES (11,'Closing_2 -> Closing_3',1,10,11,'TIMEPARAM',-1,12,-1,0);
INSERT INTO `smtrans` VALUES (12,'Closing_3 -> Closed_idle',1,11,4,'TIMEPARAM',-1,13,-1,0);
INSERT INTO `smtrans` VALUES (13,'Closing_1 -> Stopping_1',1,9,0,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (14,'Closing_2 -> Stopping_1',1,10,0,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (15,'Closing_3 -> Stopping_1',1,11,0,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (16,'Stopped -> Opening_1',1,3,5,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (17,'Stopped -> Closing_1',1,3,9,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (18,'Closed_idle -> Opening_1',1,4,5,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (19,'Opened_idle -> Closing_1',1,8,9,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (20,'Init_1 -> Init_2',1,12,13,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (21,'Init_2 -> Init_3',1,13,14,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (22,'Init_3 -> Init_4',1,14,15,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (23,'Init_4 -> Closed_idle',1,15,4,'TIMEPARAM',-1,8,-1,0);
INSERT INTO `smtrans` VALUES (24,'Stopping_1 -> Stopping_2',2,0,1,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (25,'Stopping_2 -> Stopped',2,1,2,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (26,'Opening_1 -> Opening_2',2,3,4,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (27,'Opening_2 -> Opening',2,4,5,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (28,'Opening -> Opened',2,5,6,'TIMEPARAM',-1,11,-1,0);
INSERT INTO `smtrans` VALUES (29,'Closing_1 -> Closing_2',2,7,8,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (30,'Closing_2 -> Closing',2,8,9,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (31,'Closing -> Closed',2,9,10,'TIMEPARAM',-1,11,-1,0);
INSERT INTO `smtrans` VALUES (32,'Opening -> Stopping_1',2,5,0,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (33,'Opened -> Stopping_1',2,6,0,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (34,'Closing -> Stopping_1',2,9,0,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (35,'Closed -> Stopping_1',2,10,0,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (36,'Stopped -> Opening_1',2,2,3,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (37,'Stopped -> Closing_1',2,2,7,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (38,'Init_1 -> Init_2',2,11,12,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (39,'Init_2 -> Init_3',2,12,13,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (40,'Init_3 -> Stopping_1',2,13,0,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (41,'Initial -> Stopping_1',3,0,1,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (42,'Stopping_1 -> Stopping_2',3,1,2,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (43,'Stopping_2 -> Stopped',3,2,3,'PORT',-1,-1,65,1);
INSERT INTO `smtrans` VALUES (44,'Closed -> Opening_1',3,4,6,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (45,'Opening_1 -> Opening_2',3,6,7,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (46,'Opening_2 -> Opening_3',3,7,8,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (47,'Opening_3 -> Opening_4',3,8,9,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (48,'Opening_4 -> Opened',3,9,5,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (49,'Opened -> Closing_1',3,5,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (50,'Closing_1 -> Closing_2',3,10,11,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (51,'Closing_2 -> Closing_3',3,11,12,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (52,'Closing_3 -> Closing_4',3,12,13,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (53,'Closing_4 -> Closed',3,13,4,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (54,'Opening_2 -> Stopping_1',3,7,1,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (55,'Closing_2 -> Stopping_1',3,11,1,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (56,'Stopping_2 -> Opening_2',3,2,7,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (57,'Stopping_2 -> Closing_2',3,2,11,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (58,'Stopped -> Opening_1',3,3,6,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (59,'Stopped -> Closing_1',3,3,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (60,'Stopped -> Closed',3,3,4,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (61,'Stopped -> Opened',3,3,5,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (62,'Closed -> Stopped',3,4,3,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (63,'Opened -> Stopped',3,5,4,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (64,'Initial -> Stopping_1',4,0,1,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (65,'Stopping_1 -> Stopping_2',4,1,2,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (66,'Stopping_2 -> Stopped',4,2,3,'PORT',-1,-1,65,1);
INSERT INTO `smtrans` VALUES (67,'Closed -> Opening_1',4,4,6,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (68,'Opening_1 -> Opening_2',4,6,7,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (69,'Opening_2 -> Opening_3',4,7,8,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (70,'Opening_3 -> Opening_4',4,8,9,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (71,'Opening_4 -> Opened',4,9,5,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (72,'Opened -> Closing_1',4,5,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (73,'Closing_1 -> Closing_2',4,10,11,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (74,'Closing_2 -> Closing_3',4,11,12,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (75,'Closing_3 -> Closing_4',4,12,13,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (76,'Closing_4 -> Closed',4,13,4,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (77,'Opening_2 -> Stopping_1',4,7,1,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (78,'Closing_2 -> Stopping_1',4,11,1,'PORT',-1,-1,66,0);
INSERT INTO `smtrans` VALUES (79,'Stopping_2 -> Opening_2',4,2,7,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (80,'Stopping_2 -> Closing_2',4,2,11,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (81,'Stopped -> Opening_1',4,3,6,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (82,'Stopped -> Closing_1',4,3,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (83,'Stopped -> Closed',4,3,4,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (84,'Stopped -> Opened',4,3,5,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (85,'Closed -> Stopped',4,4,3,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (86,'Opened -> Stopped',4,5,4,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (87,'Init_1 -> Init_2',5,0,1,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (88,'Init_2 -> Closed_idle',5,1,2,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (89,'Init_2 -> Opened_idle',5,1,3,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (90,'Init_2 -> Stopping_1',5,1,4,'TIMEPARAM',-1,8,-1,0);
INSERT INTO `smtrans` VALUES (91,'Opening_1 -> Opening_2',5,7,8,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (92,'Opening_2 -> Opening',5,8,9,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (93,'Opening -> Opened_idle',5,9,3,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (94,'Closing_1 -> Closing_2',5,10,11,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (95,'Closing_2 -> Closing',5,11,12,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (96,'Closing -> Closed_idle',5,12,2,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (97,'Closing_to_open_1 -> Closing_to_open_2',5,13,14,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (98,'Closing_to_open_2 -> Closing_to_open',5,14,15,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (99,'Closing_to_open -> Closed_idle',5,15,2,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (100,'Closed_idle -> Opening_1',5,2,7,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (101,'Opened_idle -> Closing_1',5,3,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (102,'Opening -> Stopping_1',5,9,4,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (103,'Closing -> Stopping_1',5,12,4,'PORT',-1,-1,65,1);
INSERT INTO `smtrans` VALUES (104,'Closed_idle -> Stopping_1',5,2,4,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (105,'Opened_idle -> Stopping_1',5,3,4,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (106,'Closing_to_open -> Stopping_1',5,15,4,'PORT',-1,-1,67,1);
INSERT INTO `smtrans` VALUES (107,'Stopping_1 -> Stopping_2',5,4,5,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (108,'Stopping_2 -> Stopped_in_the_middle',5,5,6,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (109,'Stopped_in_the_middle -> Closed_idle',5,6,2,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (110,'Stopped_in_the_middle -> Opened_idle',5,6,3,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (111,'Stopped_in_the_middle -> Closing_1',5,6,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (112,'Stopped_in_the_middle -> EmgLock',5,6,16,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (113,'EmgLock -> EmgLockPassed',5,16,17,'PORT',-1,-1,67,0);
INSERT INTO `smtrans` VALUES (114,'EmgLockPassed -> Stopped_in_the_middle',5,17,6,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (115,'EmgLockPassed -> Closing_to_open_1',5,17,13,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (116,'Init_1 -> Init_2',6,0,1,'IMMEDIATE',-1,-1,-1,0);
INSERT INTO `smtrans` VALUES (117,'Init_2 -> Closed_idle',6,1,2,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (118,'Init_2 -> Opened_idle',6,1,3,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (119,'Init_2 -> Stopping_1',6,1,4,'TIMEPARAM',-1,8,-1,0);
INSERT INTO `smtrans` VALUES (120,'Opening_1 -> Opening_2',6,7,8,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (121,'Opening_2 -> Opening',6,8,9,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (122,'Opening -> Opened_idle',6,9,3,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (123,'Closing_1 -> Closing_2',6,10,11,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (124,'Closing_2 -> Closing',6,11,12,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (125,'Closing -> Closed_idle',6,12,2,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (126,'Closing_to_open_1 -> Closing_to_open_2',6,13,14,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (127,'Closing_to_open_2 -> Closing_to_open',6,14,15,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (128,'Closing_to_open -> Closed_idle',6,15,2,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (129,'Closed_idle -> Opening_1',6,2,7,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (130,'Opened_idle -> Closing_1',6,3,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (131,'Opening -> Stopping_1',6,9,4,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (132,'Closing -> Stopping_1',6,12,4,'PORT',-1,-1,65,1);
INSERT INTO `smtrans` VALUES (133,'Closed_idle -> Stopping_1',6,2,4,'PORT',-1,-1,5,1);
INSERT INTO `smtrans` VALUES (134,'Opened_idle -> Stopping_1',6,3,4,'PORT',-1,-1,6,1);
INSERT INTO `smtrans` VALUES (135,'Closing_to_open -> Stopping_1',6,15,4,'PORT',-1,-1,67,1);
INSERT INTO `smtrans` VALUES (136,'Stopping_1 -> Stopping_2',6,4,5,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (137,'Stopping_2 -> Stopped_in_the_middle',6,5,6,'TIMEPARAM',-1,7,-1,0);
INSERT INTO `smtrans` VALUES (138,'Stopped_in_the_middle -> Closed_idle',6,6,2,'PORT',-1,-1,5,0);
INSERT INTO `smtrans` VALUES (139,'Stopped_in_the_middle -> Opened_idle',6,6,3,'PORT',-1,-1,6,0);
INSERT INTO `smtrans` VALUES (140,'Stopped_in_the_middle -> Closing_1',6,6,10,'PORT',-1,-1,66,1);
INSERT INTO `smtrans` VALUES (141,'Stopped_in_the_middle -> EmgLock',6,6,16,'PORT',-1,-1,64,1);
INSERT INTO `smtrans` VALUES (142,'EmgLock -> EmgLockPassed',6,16,17,'PORT',-1,-1,67,0);
INSERT INTO `smtrans` VALUES (143,'EmgLockPassed -> Stopped_in_the_middle',6,17,6,'PORT',-1,-1,64,0);
INSERT INTO `smtrans` VALUES (144,'EmgLockPassed -> Closing_to_open_1',6,17,13,'PORT',-1,-1,64,1);

--
-- Table structure for table `userlog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `ID` int(11) NOT NULL,
  `LOGTIME` datetime default NULL,
  `USERID` int(11) default '0',
  `CLIENTIP` varchar(16) character set utf8 default NULL,
  `APID` int(11) default '-1',
  `OBJID` int(11) default '-1',
  `TEXT` varchar(256) character set utf8 default NULL,
  PRIMARY KEY  (`ID`),
  KEY `LOGTIME` (`LOGTIME`),
  KEY `USERID` (`USERID`),
  KEY `APID` (`APID`),
  KEY `OBJID` (`OBJID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` VALUES (1,'2010-12-09 17:28:52',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (2,'2010-12-09 17:30:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-09 - 2010-12-09.');
INSERT INTO `userlog` VALUES (3,'2010-12-09 17:32:06',1,'127.0.0.1',1,0,'Изменены свойства точки доступа.');
INSERT INTO `userlog` VALUES (4,'2010-12-09 17:32:18',1,'127.0.0.1',2,0,'Изменены свойства точки доступа.');
INSERT INTO `userlog` VALUES (5,'2010-12-09 17:33:08',1,'127.0.0.1',2,0,'Изменены свойства точки доступа.');
INSERT INTO `userlog` VALUES (6,'2010-12-09 17:33:49',1,'127.0.0.1',1,0,'Изменены параметры точки доступа.');
INSERT INTO `userlog` VALUES (7,'2010-12-09 17:34:01',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (8,'2010-12-09 17:34:09',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (9,'2010-12-09 17:37:39',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-09 - 2010-12-09.');
INSERT INTO `userlog` VALUES (10,'2010-12-09 19:11:47',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (11,'2010-12-10 15:04:45',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (12,'2010-12-10 15:06:59',1,'127.0.0.1',1,0,'Изменены параметры точки доступа.');
INSERT INTO `userlog` VALUES (13,'2010-12-10 15:07:55',1,'127.0.0.1',2,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (14,'2010-12-10 15:07:57',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (15,'2010-12-10 15:10:03',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (16,'2010-12-10 15:39:47',1,'127.0.0.1',1,0,'Изменены параметры точки доступа.');
INSERT INTO `userlog` VALUES (17,'2010-12-10 15:39:50',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (18,'2010-12-10 15:54:51',1,'127.0.0.1',1,0,'Изменены параметры точки доступа.');
INSERT INTO `userlog` VALUES (19,'2010-12-10 16:02:22',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Объект\".');
INSERT INTO `userlog` VALUES (20,'2010-12-10 16:02:22',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Автопарк\".');
INSERT INTO `userlog` VALUES (21,'2010-12-10 16:02:22',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Личный автотранспорт\".');
INSERT INTO `userlog` VALUES (22,'2010-12-10 16:02:22',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Служебный автотранспорт\".');
INSERT INTO `userlog` VALUES (23,'2010-12-10 16:02:22',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Посетители\".');
INSERT INTO `userlog` VALUES (24,'2010-12-10 16:06:27',1,'127.0.0.1',0,0,'Создан отдел \"Сотрудники\".');
INSERT INTO `userlog` VALUES (25,'2010-12-10 16:06:47',1,'127.0.0.1',0,6,'В отделе \"Сотрудники\" создан сотрудник \"IT\".');
INSERT INTO `userlog` VALUES (26,'2010-12-10 16:06:53',1,'127.0.0.1',0,6,'Объект доступа \"IT\" удален.');
INSERT INTO `userlog` VALUES (27,'2010-12-10 16:07:01',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"IT\".');
INSERT INTO `userlog` VALUES (28,'2010-12-10 16:07:20',1,'127.0.0.1',0,8,'В отделе \"IT\" создан сотрудник \"Иван Пономарев\".');
INSERT INTO `userlog` VALUES (29,'2010-12-10 16:07:46',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (30,'2010-12-10 16:09:33',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"Администрация\".');
INSERT INTO `userlog` VALUES (31,'2010-12-10 16:10:02',1,'127.0.0.1',0,10,'В отделе \"Администрация\" создан сотрудник \"Варенов П.П.\".');
INSERT INTO `userlog` VALUES (32,'2010-12-10 16:10:16',1,'127.0.0.1',0,10,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (33,'2010-12-10 16:10:28',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Заблокировано\".');
INSERT INTO `userlog` VALUES (34,'2010-12-10 16:10:41',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (35,'2010-12-10 16:10:43',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (36,'2010-12-10 16:11:05',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (37,'2010-12-10 16:11:25',1,'127.0.0.1',0,0,'Создан режим доступа \"общий\".');
INSERT INTO `userlog` VALUES (38,'2010-12-10 16:15:35',1,'127.0.0.1',0,0,'Изменен режим доступа \"По умолчанию\".');
INSERT INTO `userlog` VALUES (39,'2010-12-10 16:15:55',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (40,'2010-12-10 16:17:12',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (41,'2010-12-10 16:17:40',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (42,'2010-12-10 16:18:08',1,'127.0.0.1',0,0,'Изменен режим доступа \"По умолчанию\".');
INSERT INTO `userlog` VALUES (43,'2010-12-10 16:18:43',1,'127.0.0.1',0,0,'Изменен режим доступа \"По умолчанию\".');
INSERT INTO `userlog` VALUES (44,'2010-12-10 16:18:57',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (45,'2010-12-10 16:19:30',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (46,'2010-12-10 16:26:46',1,'127.0.0.1',0,0,'Изменен режим доступа \"По умолчанию\".');
INSERT INTO `userlog` VALUES (47,'2010-12-10 16:27:30',1,'127.0.0.1',0,0,'Изменен режим доступа \"По умолчанию\".');
INSERT INTO `userlog` VALUES (48,'2010-12-10 16:27:48',1,'127.0.0.1',0,0,'Изменен режим доступа \"По умолчанию\".');
INSERT INTO `userlog` VALUES (49,'2010-12-10 16:28:21',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (50,'2010-12-10 16:28:55',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (51,'2010-12-10 16:29:24',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (52,'2010-12-10 16:29:32',1,'127.0.0.1',2,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (53,'2010-12-10 16:29:57',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (54,'2010-12-10 16:35:23',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (55,'2010-12-10 16:36:11',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (56,'2010-12-10 16:36:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (57,'2010-12-10 16:37:34',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (58,'2010-12-10 16:37:53',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (59,'2010-12-10 16:38:23',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (60,'2010-12-10 16:38:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (61,'2010-12-10 16:39:13',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (62,'2010-12-10 16:39:22',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-08 - 2010-12-10.');
INSERT INTO `userlog` VALUES (63,'2010-12-10 16:43:02',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (64,'2010-12-10 16:43:07',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (65,'2010-12-10 16:44:09',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (66,'2010-12-10 16:44:16',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (67,'2010-12-10 16:45:22',1,'127.0.0.1',0,0,'Удален режим доступа \"общий\".');
INSERT INTO `userlog` VALUES (68,'2010-12-10 16:45:28',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (69,'2010-12-10 17:14:04',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (70,'2010-12-10 17:15:27',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (71,'2010-12-10 17:15:34',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (72,'2010-12-10 17:15:55',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (73,'2010-12-10 17:22:49',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (74,'2010-12-10 17:22:51',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (75,'2010-12-10 17:23:20',1,'127.0.0.1',0,11,'В отделе \"Администрация\" создан сотрудник \"Пантелеев Алексей\".');
INSERT INTO `userlog` VALUES (76,'2010-12-10 17:23:26',1,'127.0.0.1',0,11,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (77,'2010-12-10 17:25:53',1,'127.0.0.1',0,12,'В отделе \"IT\" создан сотрудник \"Догонов Максим\".');
INSERT INTO `userlog` VALUES (78,'2010-12-10 17:25:58',1,'127.0.0.1',0,12,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (79,'2010-12-10 17:27:18',1,'127.0.0.1',0,12,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (80,'2010-12-10 17:27:30',1,'127.0.0.1',0,12,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (81,'2010-12-10 17:27:53',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (82,'2010-12-10 17:30:03',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"QA\\\".');
INSERT INTO `userlog` VALUES (83,'2010-12-10 17:30:10',1,'127.0.0.1',0,0,'Отдел \"QA\\\" удален.');
INSERT INTO `userlog` VALUES (84,'2010-12-10 17:30:17',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"QA\\\".');
INSERT INTO `userlog` VALUES (85,'2010-12-10 17:30:22',1,'127.0.0.1',0,0,'Изменены параметры отдела \"QA\".');
INSERT INTO `userlog` VALUES (86,'2010-12-10 17:30:48',1,'127.0.0.1',0,15,'В отделе \"QA\" создан сотрудник \"Приказчиков Никита\\\".');
INSERT INTO `userlog` VALUES (87,'2010-12-10 17:31:05',1,'127.0.0.1',0,15,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (88,'2010-12-10 17:31:20',1,'127.0.0.1',0,16,'В отделе \"QA\" создан сотрудник \"Никишов Константин\".');
INSERT INTO `userlog` VALUES (89,'2010-12-10 17:31:32',1,'127.0.0.1',0,16,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (90,'2010-12-10 17:31:38',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (91,'2010-12-10 17:37:33',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (92,'2010-12-10 17:41:39',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (93,'2010-12-10 17:44:43',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"Программисты\".');
INSERT INTO `userlog` VALUES (94,'2010-12-10 17:44:51',1,'127.0.0.1',0,18,'В отделе \"Программисты\" создан сотрудник \"Лимачко Андрей\".');
INSERT INTO `userlog` VALUES (95,'2010-12-10 17:45:15',1,'127.0.0.1',0,18,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (96,'2010-12-10 17:45:20',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (97,'2010-12-10 17:45:45',1,'127.0.0.1',0,18,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (98,'2010-12-10 17:45:51',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (99,'2010-12-10 17:49:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-10.');
INSERT INTO `userlog` VALUES (100,'2010-12-10 17:51:00',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Список персонала\".');
INSERT INTO `userlog` VALUES (101,'2010-12-10 17:52:52',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (102,'2010-12-10 17:53:55',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (103,'2010-12-10 17:54:19',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (104,'2010-12-10 17:54:38',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (105,'2010-12-10 17:54:40',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (106,'2010-12-10 17:54:43',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (107,'2010-12-10 17:54:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-10.');
INSERT INTO `userlog` VALUES (108,'2010-12-10 17:56:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-10.');
INSERT INTO `userlog` VALUES (109,'2010-12-10 17:56:38',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-11.');
INSERT INTO `userlog` VALUES (110,'2010-12-10 17:56:57',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-11.');
INSERT INTO `userlog` VALUES (111,'2010-12-10 17:57:39',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-11.');
INSERT INTO `userlog` VALUES (112,'2010-12-10 17:57:58',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2010-12-10 - 2010-12-11.');
INSERT INTO `userlog` VALUES (113,'2010-12-10 17:59:59',1,'127.0.0.1',0,19,'В отделе \"Программисты\" создан сотрудник \"Сарбаев Юрий\".');
INSERT INTO `userlog` VALUES (114,'2010-12-10 18:00:13',1,'127.0.0.1',0,19,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (115,'2010-12-10 18:00:18',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (116,'2010-12-10 18:01:07',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (117,'2010-12-10 18:01:30',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (118,'2010-12-10 18:19:08',1,'127.0.0.1',0,20,'В отделе \"Программисты\" создан сотрудник \"Руденко Евгений\".');
INSERT INTO `userlog` VALUES (119,'2010-12-10 18:19:40',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (120,'2010-12-10 18:20:47',1,'127.0.0.1',0,21,'В отделе \"Программисты\" создан сотрудник \"Айрапетьянц Георгий\".');
INSERT INTO `userlog` VALUES (121,'2010-12-10 18:20:56',1,'127.0.0.1',0,21,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (122,'2010-12-10 18:21:15',1,'127.0.0.1',0,21,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (123,'2010-12-10 18:21:50',1,'127.0.0.1',0,22,'В отделе \"Программисты\" создан сотрудник \"Гусаков Кирил\".');
INSERT INTO `userlog` VALUES (124,'2010-12-10 18:22:04',1,'127.0.0.1',0,22,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (125,'2010-12-10 18:22:33',1,'127.0.0.1',0,23,'В отделе \"Программисты\" создан сотрудник \"Афоничев Иван\".');
INSERT INTO `userlog` VALUES (126,'2010-12-10 18:22:37',1,'127.0.0.1',0,23,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (127,'2010-12-10 18:22:50',1,'127.0.0.1',0,23,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (128,'2010-12-10 18:22:54',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (129,'2010-12-10 18:57:18',1,'127.0.0.1',0,24,'В отделе \"Программисты\" создан сотрудник \"Рафиков Руслан\".');
INSERT INTO `userlog` VALUES (130,'2010-12-10 18:59:11',1,'127.0.0.1',0,24,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (131,'2010-12-10 18:59:17',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (132,'2010-12-10 19:06:13',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (133,'2010-12-11 13:20:07',1,'127.0.0.1',0,25,'В отделе \"Администрация\" создан сотрудник \"Молодцова Дарья\".');
INSERT INTO `userlog` VALUES (134,'2010-12-11 13:20:37',1,'127.0.0.1',0,25,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (135,'2010-12-11 13:20:43',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (136,'2010-12-11 13:21:38',1,'127.0.0.1',0,26,'В отделе \"IT\" создан сотрудник \"Кадников Владимир\".');
INSERT INTO `userlog` VALUES (137,'2010-12-11 13:22:10',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (138,'2010-12-11 13:22:16',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (139,'2010-12-11 13:22:35',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (140,'2010-12-11 13:26:08',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2010-12-10 00:00:00 - 2010-12-10 23:59:00.');
INSERT INTO `userlog` VALUES (141,'2010-12-11 13:26:45',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (142,'2010-12-11 13:27:36',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2010-12-10 - 2010-12-11.');
INSERT INTO `userlog` VALUES (143,'2010-12-11 13:33:32',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (144,'2010-12-11 14:01:07',1,'127.0.0.1',0,27,'В отделе \"Программисты\" создан сотрудник \"Чеглеев Илья\".');
INSERT INTO `userlog` VALUES (145,'2010-12-11 14:01:12',1,'127.0.0.1',0,27,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (146,'2010-12-11 14:01:35',1,'127.0.0.1',0,28,'В отделе \"Программисты\" создан сотрудник \"Дмитрий Матюшкин\".');
INSERT INTO `userlog` VALUES (147,'2010-12-11 14:01:41',1,'127.0.0.1',0,28,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (148,'2010-12-11 14:02:02',1,'127.0.0.1',0,29,'В отделе \"Программисты\" создан сотрудник \"Моторжин Андрей\".');
INSERT INTO `userlog` VALUES (149,'2010-12-11 14:02:13',1,'127.0.0.1',0,29,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (150,'2010-12-11 14:02:27',1,'127.0.0.1',0,30,'В отделе \"Программисты\" создан сотрудник \"Николаев Алексей\".');
INSERT INTO `userlog` VALUES (151,'2010-12-11 14:02:42',1,'127.0.0.1',0,30,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (152,'2010-12-11 14:02:51',1,'127.0.0.1',0,31,'В отделе \"Программисты\" создан сотрудник \"Плясунова Мария\".');
INSERT INTO `userlog` VALUES (153,'2010-12-11 14:03:05',1,'127.0.0.1',0,31,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (154,'2010-12-11 14:03:15',1,'127.0.0.1',0,32,'В отделе \"Программисты\" создан сотрудник \"Яраев Дмитрий\".');
INSERT INTO `userlog` VALUES (155,'2010-12-11 14:03:26',1,'127.0.0.1',0,32,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (156,'2010-12-11 14:03:44',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (157,'2010-12-11 14:05:48',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"Уборщица\".');
INSERT INTO `userlog` VALUES (158,'2010-12-11 14:05:59',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Уборщицаы\".');
INSERT INTO `userlog` VALUES (159,'2010-12-11 14:06:10',1,'127.0.0.1',0,0,'Изменены параметры отдела \"Уборщицы\".');
INSERT INTO `userlog` VALUES (160,'2010-12-11 14:06:32',1,'127.0.0.1',0,34,'В отделе \"Уборщицы\" создан сотрудник \"Тимошина Нина\".');
INSERT INTO `userlog` VALUES (161,'2010-12-11 14:06:54',1,'127.0.0.1',0,34,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (162,'2010-12-11 14:06:59',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (163,'2010-12-11 17:25:36',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Нормальный режим\".');
INSERT INTO `userlog` VALUES (164,'2010-12-13 15:04:35',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (165,'2010-12-13 15:05:42',1,'127.0.0.1',0,35,'В отделе \"Администрация\" создан сотрудник \"Бочастый Александр\".');
INSERT INTO `userlog` VALUES (166,'2010-12-13 15:06:04',1,'127.0.0.1',0,35,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (167,'2010-12-13 15:06:16',1,'127.0.0.1',0,36,'В отделе \"Программисты\" создан сотрудник \"Карякин Анатолий\".');
INSERT INTO `userlog` VALUES (168,'2010-12-13 15:06:35',1,'127.0.0.1',0,36,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (169,'2010-12-13 15:06:50',1,'127.0.0.1',0,37,'В отделе \"QA\" создан сотрудник \"Исхакова Алия\".');
INSERT INTO `userlog` VALUES (170,'2010-12-13 15:07:04',1,'127.0.0.1',0,37,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (171,'2010-12-13 15:07:14',1,'127.0.0.1',0,38,'В отделе \"QA\" создан сотрудник \"Приказчиков Никита\".');
INSERT INTO `userlog` VALUES (172,'2010-12-13 15:07:23',1,'127.0.0.1',0,38,'Объект доступа \"Приказчиков Никита\" удален.');
INSERT INTO `userlog` VALUES (173,'2010-12-13 15:07:27',1,'127.0.0.1',0,15,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (174,'2010-12-13 15:08:58',1,'127.0.0.1',0,39,'В отделе \"QA\" создан сотрудник \"Федотов Николай\".');
INSERT INTO `userlog` VALUES (175,'2010-12-13 15:09:11',1,'127.0.0.1',0,39,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (176,'2010-12-13 15:09:40',1,'127.0.0.1',0,40,'В отделе \"Программисты\" создан сотрудник \"Грошев Иван\".');
INSERT INTO `userlog` VALUES (177,'2010-12-13 15:09:53',1,'127.0.0.1',0,40,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (178,'2010-12-13 15:10:08',1,'127.0.0.1',0,41,'В отделе \"Программисты\" создан сотрудник \"Масунов Андрей\".');
INSERT INTO `userlog` VALUES (179,'2010-12-13 15:10:29',1,'127.0.0.1',0,41,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (180,'2010-12-13 15:10:39',1,'127.0.0.1',0,42,'В отделе \"Администрация\" создан сотрудник \"Гузева Юлия\".');
INSERT INTO `userlog` VALUES (181,'2010-12-13 15:10:49',1,'127.0.0.1',0,42,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (182,'2010-12-13 15:10:58',1,'127.0.0.1',0,43,'В отделе \"Администрация\" создан сотрудник \"Хользунова Наталья\".');
INSERT INTO `userlog` VALUES (183,'2010-12-13 15:11:09',1,'127.0.0.1',0,43,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (184,'2010-12-13 15:11:15',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (185,'2010-12-13 16:55:42',1,'127.0.0.1',0,44,'В отделе \"Администрация\" создан сотрудник \"Егорушкина Анастасия\".');
INSERT INTO `userlog` VALUES (186,'2010-12-13 16:55:53',1,'127.0.0.1',0,44,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (187,'2010-12-13 16:55:58',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (188,'2010-12-14 08:44:29',1,'127.0.0.1',1,0,'Запрошено изменение режима точки доступа на \"Разблокировано\".');
INSERT INTO `userlog` VALUES (189,'2010-12-25 12:49:21',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (190,'2010-12-25 12:49:48',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-25 - 2010-12-25.');
INSERT INTO `userlog` VALUES (191,'2010-12-25 12:50:06',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (192,'2010-12-25 12:50:24',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (193,'2010-12-25 12:50:37',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (194,'2010-12-25 12:51:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Присутствие на предприятии\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (195,'2010-12-25 12:51:57',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (196,'2010-12-25 12:53:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (197,'2010-12-25 12:54:06',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (198,'2010-12-25 12:58:51',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (199,'2010-12-25 12:59:00',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (200,'2010-12-25 13:00:10',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (201,'2010-12-25 13:01:00',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Кто где был в заданный момент времени\" за период 2010-12-25 13:01:00 - 2010-12-25 13:01:00.');
INSERT INTO `userlog` VALUES (202,'2010-12-25 13:01:29',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Список режимов \".');
INSERT INTO `userlog` VALUES (203,'2010-12-25 13:01:43',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (204,'2010-12-27 09:24:28',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (205,'2010-12-30 14:28:49',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (206,'2010-12-30 14:29:24',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (207,'2010-12-30 14:30:05',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-01 - 2010-12-25.');
INSERT INTO `userlog` VALUES (208,'2010-12-30 14:30:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-20 - 2010-12-30.');
INSERT INTO `userlog` VALUES (209,'2010-12-30 14:35:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-20 - 2010-12-30.');
INSERT INTO `userlog` VALUES (210,'2010-12-30 14:35:47',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-20 - 2010-12-30.');
INSERT INTO `userlog` VALUES (211,'2010-12-30 14:36:02',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-20 - 2010-12-30.');
INSERT INTO `userlog` VALUES (212,'2010-12-30 14:36:56',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-20 - 2010-12-30.');
INSERT INTO `userlog` VALUES (213,'2010-12-30 14:37:30',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2010-12-20 - 2010-12-30.');
INSERT INTO `userlog` VALUES (214,'2011-01-10 15:07:23',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (215,'2011-01-10 15:09:05',1,'127.0.0.1',0,45,'В отделе \"Программисты\" создан сотрудник \"Павел Ирматов\".');
INSERT INTO `userlog` VALUES (216,'2011-01-10 15:09:10',1,'127.0.0.1',0,45,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (217,'2011-01-10 15:09:24',1,'127.0.0.1',0,45,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (218,'2011-01-10 15:11:01',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"Гости\".');
INSERT INTO `userlog` VALUES (219,'2011-01-10 15:11:10',1,'127.0.0.1',0,47,'В отделе \"Гости\" создан сотрудник \"Гость\".');
INSERT INTO `userlog` VALUES (220,'2011-01-10 15:11:14',1,'127.0.0.1',0,48,'В отделе \"Гости\" создан сотрудник \"Гость\".');
INSERT INTO `userlog` VALUES (221,'2011-01-10 15:11:24',1,'127.0.0.1',0,49,'В отделе \"Гости\" создан сотрудник \"Гость\".');
INSERT INTO `userlog` VALUES (222,'2011-01-10 15:11:34',1,'127.0.0.1',0,50,'В отделе \"Гости\" создан сотрудник \"Гость\".');
INSERT INTO `userlog` VALUES (223,'2011-01-10 15:11:38',1,'127.0.0.1',0,51,'В отделе \"Гости\" создан сотрудник \"Гость\".');
INSERT INTO `userlog` VALUES (224,'2011-01-10 15:11:42',1,'127.0.0.1',0,52,'В отделе \"Гости\" создан сотрудник \"Гость\".');
INSERT INTO `userlog` VALUES (225,'2011-01-10 15:11:54',1,'127.0.0.1',0,47,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (226,'2011-01-10 15:12:05',1,'127.0.0.1',0,48,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (227,'2011-01-10 15:12:14',1,'127.0.0.1',0,49,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (228,'2011-01-10 15:12:22',1,'127.0.0.1',0,50,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (229,'2011-01-10 15:12:30',1,'127.0.0.1',0,51,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (230,'2011-01-10 15:12:36',1,'127.0.0.1',0,52,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (231,'2011-01-10 15:12:42',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (232,'2011-01-10 15:12:50',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (233,'2011-01-11 13:07:34',1,'127.0.0.2',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (234,'2011-01-11 13:07:52',1,'127.0.0.2',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (235,'2011-01-11 15:47:17',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (236,'2011-01-11 15:47:58',1,'127.0.0.1',0,53,'В отделе \"Гости\" создан сотрудник \"Управляющая\".');
INSERT INTO `userlog` VALUES (237,'2011-01-11 15:48:32',1,'127.0.0.1',0,53,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (238,'2011-01-11 15:48:37',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (239,'2011-01-11 15:48:42',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (240,'2011-01-14 12:22:53',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (241,'2011-01-14 12:27:40',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-01-14 - 2011-01-14.');
INSERT INTO `userlog` VALUES (242,'2011-01-14 12:28:11',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-01-14 - 2011-01-14.');
INSERT INTO `userlog` VALUES (243,'2011-01-14 12:28:44',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-01-14 - 2011-01-14.');
INSERT INTO `userlog` VALUES (244,'2011-01-14 12:28:58',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-01-14 - 2011-01-14.');
INSERT INTO `userlog` VALUES (245,'2011-01-14 12:29:30',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (246,'2011-01-14 12:30:52',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (247,'2011-01-14 12:31:10',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (248,'2011-01-14 12:31:37',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (249,'2011-01-14 12:33:55',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (250,'2011-01-14 12:34:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (251,'2011-01-14 12:35:55',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (252,'2011-01-14 12:36:29',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (253,'2011-01-14 12:36:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (254,'2011-01-14 12:37:24',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (255,'2011-01-14 14:31:51',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (256,'2011-01-14 14:32:38',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-01-14 - 2011-01-14.');
INSERT INTO `userlog` VALUES (257,'2011-01-14 14:33:13',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (258,'2011-01-14 14:35:42',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-01 - 2011-01-14.');
INSERT INTO `userlog` VALUES (259,'2011-01-17 13:19:53',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (260,'2011-01-17 13:20:36',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (261,'2011-01-17 13:20:52',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (262,'2011-01-17 15:55:07',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (263,'2011-01-17 15:58:06',1,'127.0.0.1',0,0,'Пользователь изменил пароль пользователя \"maxi\".');
INSERT INTO `userlog` VALUES (264,'2011-01-17 15:58:13',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (265,'2011-01-17 15:58:22',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (266,'2011-01-17 16:20:51',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (267,'2011-01-17 16:24:56',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (268,'2011-01-19 12:18:08',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (269,'2011-01-19 12:21:04',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (270,'2011-01-19 12:39:11',1,'127.0.0.1',0,54,'В отделе \"IT\" создан сотрудник \"Алексей Чекунов\".');
INSERT INTO `userlog` VALUES (271,'2011-01-19 12:40:00',1,'127.0.0.1',0,55,'В отделе \"IT\" создан сотрудник \"Михаил Поленчук\".');
INSERT INTO `userlog` VALUES (272,'2011-01-19 12:43:31',1,'127.0.0.1',0,54,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (273,'2011-01-19 12:43:44',1,'127.0.0.1',0,55,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (274,'2011-01-19 12:43:50',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (275,'2011-01-19 12:43:55',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (276,'2011-01-21 16:09:55',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (277,'2011-01-21 16:10:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-21 - 2011-01-21.');
INSERT INTO `userlog` VALUES (278,'2011-01-21 16:11:36',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-21.');
INSERT INTO `userlog` VALUES (279,'2011-01-21 16:15:43',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-21.');
INSERT INTO `userlog` VALUES (280,'2011-01-21 16:17:43',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-21.');
INSERT INTO `userlog` VALUES (281,'2011-01-21 16:20:43',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-21.');
INSERT INTO `userlog` VALUES (282,'2011-01-21 17:11:06',1,'127.0.0.1',0,41,'Объект доступа перенесен в отдел \"QA\".');
INSERT INTO `userlog` VALUES (283,'2011-01-21 17:11:21',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (284,'2011-01-25 13:21:45',1,'127.0.0.1',0,35,'Объект доступа перенесен в отдел \"Программисты\".');
INSERT INTO `userlog` VALUES (285,'2011-01-25 13:21:56',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (286,'2011-01-27 15:24:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-27.');
INSERT INTO `userlog` VALUES (287,'2011-01-28 15:19:03',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-27.');
INSERT INTO `userlog` VALUES (288,'2011-01-28 15:21:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-27.');
INSERT INTO `userlog` VALUES (289,'2011-01-28 15:23:13',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-14 - 2011-01-27.');
INSERT INTO `userlog` VALUES (290,'2011-01-31 12:31:14',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (291,'2011-01-31 13:06:24',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-10 - 2011-01-16.');
INSERT INTO `userlog` VALUES (292,'2011-01-31 13:07:44',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-10 - 2011-01-16.');
INSERT INTO `userlog` VALUES (293,'2011-01-31 14:34:13',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-10 - 2011-01-28.');
INSERT INTO `userlog` VALUES (294,'2011-02-02 17:54:41',1,'127.0.0.1',0,56,'В отделе \"Программисты\" создан сотрудник \"Дмитрий Петров\".');
INSERT INTO `userlog` VALUES (295,'2011-02-02 17:56:46',1,'127.0.0.1',0,56,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (296,'2011-02-02 17:56:53',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (297,'2011-02-04 15:37:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-02-04.');
INSERT INTO `userlog` VALUES (298,'2011-02-04 15:38:11',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-04.');
INSERT INTO `userlog` VALUES (299,'2011-02-09 13:03:30',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (300,'2011-02-09 13:05:15',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-31 - 2011-02-04.');
INSERT INTO `userlog` VALUES (301,'2011-02-09 14:27:58',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (302,'2011-02-09 16:47:57',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (303,'2011-02-11 14:03:16',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-02-11.');
INSERT INTO `userlog` VALUES (304,'2011-02-11 14:03:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-02-11.');
INSERT INTO `userlog` VALUES (305,'2011-02-11 14:03:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-03-11.');
INSERT INTO `userlog` VALUES (306,'2011-02-11 14:04:29',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-03-11.');
INSERT INTO `userlog` VALUES (307,'2011-02-11 14:05:09',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-11.');
INSERT INTO `userlog` VALUES (308,'2011-02-11 14:06:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-11.');
INSERT INTO `userlog` VALUES (309,'2011-02-11 14:08:09',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-11.');
INSERT INTO `userlog` VALUES (310,'2011-02-11 14:09:31',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-11.');
INSERT INTO `userlog` VALUES (311,'2011-02-11 14:10:37',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-11.');
INSERT INTO `userlog` VALUES (312,'2011-02-16 12:23:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-03 - 2011-02-04.');
INSERT INTO `userlog` VALUES (313,'2011-02-16 12:24:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-01-28 - 2011-02-04.');
INSERT INTO `userlog` VALUES (314,'2011-02-18 14:46:26',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-04 - 2011-02-11.');
INSERT INTO `userlog` VALUES (315,'2011-02-18 15:04:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-11 - 2011-02-14.');
INSERT INTO `userlog` VALUES (316,'2011-02-18 15:04:34',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-11 - 2011-02-14.');
INSERT INTO `userlog` VALUES (317,'2011-02-18 15:20:43',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-11 - 2011-02-18.');
INSERT INTO `userlog` VALUES (318,'2011-02-22 16:59:24',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (319,'2011-02-22 17:05:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-07 - 2011-02-19.');
INSERT INTO `userlog` VALUES (320,'2011-02-24 12:07:48',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (321,'2011-02-24 12:09:05',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-18 - 2011-02-18.');
INSERT INTO `userlog` VALUES (322,'2011-02-24 12:09:10',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-18 - 2011-02-18.');
INSERT INTO `userlog` VALUES (323,'2011-02-25 13:20:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-18 - 2011-02-25.');
INSERT INTO `userlog` VALUES (324,'2011-02-25 13:22:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-18 - 2011-02-25.');
INSERT INTO `userlog` VALUES (325,'2011-02-25 13:23:15',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-18 - 2011-02-25.');
INSERT INTO `userlog` VALUES (326,'2011-02-25 13:23:58',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-18 - 2011-02-25.');
INSERT INTO `userlog` VALUES (327,'2011-03-03 12:02:59',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (328,'2011-03-03 14:26:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (329,'2011-03-03 14:26:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (330,'2011-03-03 14:27:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (331,'2011-03-03 14:28:05',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (332,'2011-03-03 14:28:37',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (333,'2011-03-04 08:29:04',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Присутствие на предприятии\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (334,'2011-03-04 08:29:25',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (335,'2011-03-04 08:30:36',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (336,'2011-03-04 08:32:56',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Наработка персонала (Табель)\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (337,'2011-03-04 08:33:35',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (338,'2011-03-04 08:34:59',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (339,'2011-03-04 08:35:17',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (340,'2011-03-05 11:38:44',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-02-01 - 2011-02-28.');
INSERT INTO `userlog` VALUES (341,'2011-03-05 14:21:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Все проходы персонала\" за период 2011-02-25 - 2011-03-05.');
INSERT INTO `userlog` VALUES (342,'2011-03-05 14:21:23',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-03-05.');
INSERT INTO `userlog` VALUES (343,'2011-03-05 14:21:49',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-03-05.');
INSERT INTO `userlog` VALUES (344,'2011-03-05 14:22:13',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-03-05.');
INSERT INTO `userlog` VALUES (345,'2011-03-05 14:22:51',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-25 - 2011-03-05.');
INSERT INTO `userlog` VALUES (346,'2011-03-09 11:55:46',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (347,'2011-03-09 11:55:54',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (348,'2011-03-09 11:56:15',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (349,'2011-03-09 14:15:19',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-05 - 2011-03-05.');
INSERT INTO `userlog` VALUES (350,'2011-03-09 15:58:54',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (351,'2011-03-09 15:58:59',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (352,'2011-03-14 12:36:08',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-04 - 2011-03-11.');
INSERT INTO `userlog` VALUES (353,'2011-03-14 12:36:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-04 - 2011-03-11.');
INSERT INTO `userlog` VALUES (354,'2011-03-14 12:36:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-04 - 2011-03-11.');
INSERT INTO `userlog` VALUES (355,'2011-03-14 12:38:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-04 - 2011-03-11.');
INSERT INTO `userlog` VALUES (356,'2011-03-14 12:39:10',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (357,'2011-03-17 12:02:15',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (358,'2011-03-18 12:21:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (359,'2011-03-18 12:23:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (360,'2011-03-18 12:24:23',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (361,'2011-03-18 12:24:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (362,'2011-03-18 12:25:31',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (363,'2011-03-18 12:26:17',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-28 - 2011-03-11.');
INSERT INTO `userlog` VALUES (364,'2011-03-18 12:47:40',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-11 - 2011-03-18.');
INSERT INTO `userlog` VALUES (365,'2011-03-18 12:47:47',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-02-11 - 2011-03-18.');
INSERT INTO `userlog` VALUES (366,'2011-03-18 12:48:09',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-11 - 2011-03-18.');
INSERT INTO `userlog` VALUES (367,'2011-03-18 12:49:11',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-11 - 2011-03-18.');
INSERT INTO `userlog` VALUES (368,'2011-03-18 12:49:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-11 - 2011-03-18.');
INSERT INTO `userlog` VALUES (369,'2011-03-18 15:13:39',1,'127.0.0.1',0,57,'В отделе \"Программисты\" создан сотрудник \"Бочкорев Александр\".');
INSERT INTO `userlog` VALUES (370,'2011-03-18 15:14:59',1,'127.0.0.1',0,57,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (371,'2011-03-18 15:15:08',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (372,'2011-03-22 10:59:33',1,'127.0.0.1',0,58,'В отделе \"Программисты\" создан сотрудник \"Александр Бочкарев\".');
INSERT INTO `userlog` VALUES (373,'2011-03-22 11:00:57',1,'127.0.0.1',0,58,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (374,'2011-03-23 14:23:37',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (375,'2011-03-25 09:19:17',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-01 - 2011-03-25.');
INSERT INTO `userlog` VALUES (376,'2011-03-25 09:20:03',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-01 - 2011-03-25.');
INSERT INTO `userlog` VALUES (377,'2011-03-25 09:21:04',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-01 - 2011-03-25.');
INSERT INTO `userlog` VALUES (378,'2011-03-25 09:22:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-01 - 2011-03-25.');
INSERT INTO `userlog` VALUES (379,'2011-03-25 09:22:42',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-01 - 2011-03-25.');
INSERT INTO `userlog` VALUES (380,'2011-03-25 09:27:24',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-18 - 2011-03-25.');
INSERT INTO `userlog` VALUES (381,'2011-03-25 09:28:01',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-18 - 2011-03-25.');
INSERT INTO `userlog` VALUES (382,'2011-03-25 09:28:33',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-18 - 2011-03-25.');
INSERT INTO `userlog` VALUES (383,'2011-03-25 09:28:57',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-18 - 2011-03-25.');
INSERT INTO `userlog` VALUES (384,'2011-03-25 13:48:01',1,'127.0.0.1',0,58,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (385,'2011-03-25 13:48:26',1,'127.0.0.1',0,57,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (386,'2011-03-25 13:48:54',1,'127.0.0.1',0,35,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (387,'2011-03-25 13:49:00',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (388,'2011-03-27 03:00:18',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (389,'2011-03-31 13:05:31',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (390,'2011-04-01 08:47:30',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (391,'2011-04-01 08:49:10',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (392,'2011-04-01 08:50:03',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-04-01 - 2011-04-01.');
INSERT INTO `userlog` VALUES (393,'2011-04-01 08:50:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (394,'2011-04-01 08:50:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (395,'2011-04-01 08:51:25',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (396,'2011-04-01 08:51:41',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (397,'2011-04-01 08:53:52',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (398,'2011-04-01 08:54:19',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (399,'2011-04-01 08:55:03',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (400,'2011-04-01 08:55:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-25 - 2011-04-01.');
INSERT INTO `userlog` VALUES (401,'2011-04-01 15:52:55',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-03-01 - 2011-03-31.');
INSERT INTO `userlog` VALUES (402,'2011-04-04 12:14:57',1,'127.0.0.1',0,59,'В отделе \"Программисты\" создан сотрудник \"Дружина Мария\".');
INSERT INTO `userlog` VALUES (403,'2011-04-04 12:17:20',1,'127.0.0.1',0,59,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (404,'2011-04-04 12:17:35',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (405,'2011-04-08 10:06:03',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-01 - 2011-04-08.');
INSERT INTO `userlog` VALUES (406,'2011-04-08 10:07:00',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-01 - 2011-04-08.');
INSERT INTO `userlog` VALUES (407,'2011-04-08 10:07:45',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-01 - 2011-04-08.');
INSERT INTO `userlog` VALUES (408,'2011-04-08 10:08:34',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-01 - 2011-04-08.');
INSERT INTO `userlog` VALUES (409,'2011-04-12 11:55:57',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (410,'2011-04-12 12:24:07',1,'127.0.0.1',0,60,'В отделе \"Программисты\" создан сотрудник \"Королев Алексей\".');
INSERT INTO `userlog` VALUES (411,'2011-04-12 12:26:05',1,'127.0.0.1',0,60,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (412,'2011-04-12 12:26:11',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (413,'2011-04-14 16:27:05',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (414,'2011-04-14 16:27:22',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (415,'2011-04-14 16:28:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-13 - 2011-04-14.');
INSERT INTO `userlog` VALUES (416,'2011-04-14 16:29:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-13 - 2011-04-14.');
INSERT INTO `userlog` VALUES (417,'2011-04-15 09:16:09',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (418,'2011-04-15 09:17:31',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (419,'2011-04-15 09:18:16',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (420,'2011-04-15 09:19:05',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (421,'2011-04-19 16:27:28',1,'127.0.0.1',0,16,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (422,'2011-04-19 16:27:34',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (423,'2011-04-22 14:05:08',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (424,'2011-04-22 14:05:49',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (425,'2011-04-22 14:06:15',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-08 - 2011-04-15.');
INSERT INTO `userlog` VALUES (426,'2011-04-22 14:06:59',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-15 - 2011-04-22.');
INSERT INTO `userlog` VALUES (427,'2011-04-22 14:07:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-15 - 2011-04-22.');
INSERT INTO `userlog` VALUES (428,'2011-04-22 14:09:01',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-15 - 2011-04-22.');
INSERT INTO `userlog` VALUES (429,'2011-04-22 14:09:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-15 - 2011-04-22.');
INSERT INTO `userlog` VALUES (430,'2011-04-24 14:02:42',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (431,'2011-04-25 10:47:43',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (432,'2011-04-25 10:48:30',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (433,'2011-04-25 10:48:36',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (434,'2011-04-29 08:51:45',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-15 - 2011-04-22.');
INSERT INTO `userlog` VALUES (435,'2011-04-29 08:52:08',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-22 - 2011-04-29.');
INSERT INTO `userlog` VALUES (436,'2011-04-29 08:52:35',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-22 - 2011-04-29.');
INSERT INTO `userlog` VALUES (437,'2011-04-29 08:52:56',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-22 - 2011-04-29.');
INSERT INTO `userlog` VALUES (438,'2011-04-29 08:53:23',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-22 - 2011-04-29.');
INSERT INTO `userlog` VALUES (439,'2011-04-29 13:15:06',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-19 - 2011-04-29.');
INSERT INTO `userlog` VALUES (440,'2011-04-29 14:45:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-15 - 2011-04-21.');
INSERT INTO `userlog` VALUES (441,'2011-05-01 14:05:08',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (442,'2011-05-03 08:51:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-04-29.');
INSERT INTO `userlog` VALUES (443,'2011-05-03 08:56:04',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-01 - 2011-04-08.');
INSERT INTO `userlog` VALUES (444,'2011-05-03 09:17:36',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-04-29.');
INSERT INTO `userlog` VALUES (445,'2011-05-03 09:18:22',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-04-29.');
INSERT INTO `userlog` VALUES (446,'2011-05-03 12:43:33',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-03 - 2011-05-03.');
INSERT INTO `userlog` VALUES (447,'2011-05-06 15:59:47',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-05-06.');
INSERT INTO `userlog` VALUES (448,'2011-05-06 16:01:02',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-05-06.');
INSERT INTO `userlog` VALUES (449,'2011-05-08 14:03:27',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (450,'2011-05-10 08:42:11',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-05-06.');
INSERT INTO `userlog` VALUES (451,'2011-05-10 08:42:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-04-29 - 2011-05-06.');
INSERT INTO `userlog` VALUES (452,'2011-05-10 16:30:10',1,'127.0.0.1',0,61,'В отделе \"Программисты\" создан сотрудник \"Халдеев Иван\".');
INSERT INTO `userlog` VALUES (453,'2011-05-10 16:31:38',1,'127.0.0.1',0,61,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (454,'2011-05-10 16:31:44',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (455,'2011-05-13 09:29:59',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (456,'2011-05-13 09:31:12',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (457,'2011-05-13 09:31:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (458,'2011-05-13 09:32:31',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (459,'2011-05-13 15:52:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (460,'2011-05-13 15:53:39',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (461,'2011-05-13 15:54:23',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (462,'2011-05-13 15:54:59',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-06 - 2011-05-13.');
INSERT INTO `userlog` VALUES (463,'2011-05-15 14:05:03',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (464,'2011-05-20 15:48:44',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-13 - 2011-05-20.');
INSERT INTO `userlog` VALUES (465,'2011-05-20 15:50:15',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-13 - 2011-05-20.');
INSERT INTO `userlog` VALUES (466,'2011-05-20 15:50:56',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-13 - 2011-05-20.');
INSERT INTO `userlog` VALUES (467,'2011-05-22 14:04:14',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (468,'2011-05-27 08:30:34',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-20 - 2011-05-27.');
INSERT INTO `userlog` VALUES (469,'2011-05-27 08:31:27',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-20 - 2011-05-27.');
INSERT INTO `userlog` VALUES (470,'2011-05-27 08:32:08',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-20 - 2011-05-27.');
INSERT INTO `userlog` VALUES (471,'2011-05-27 08:32:56',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-20 - 2011-05-27.');
INSERT INTO `userlog` VALUES (472,'2011-05-29 14:05:35',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (473,'2011-05-30 08:58:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-01 - 2011-05-30.');
INSERT INTO `userlog` VALUES (474,'2011-05-30 08:59:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-01 - 2011-05-30.');
INSERT INTO `userlog` VALUES (475,'2011-05-30 09:00:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-01 - 2011-05-30.');
INSERT INTO `userlog` VALUES (476,'2011-05-30 09:01:07',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-01 - 2011-05-30.');
INSERT INTO `userlog` VALUES (477,'2011-06-01 08:43:55',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-31 - 2011-05-31.');
INSERT INTO `userlog` VALUES (478,'2011-06-01 12:10:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-05-31.');
INSERT INTO `userlog` VALUES (479,'2011-06-01 12:11:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-05-31.');
INSERT INTO `userlog` VALUES (480,'2011-06-01 12:11:49',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-05-31.');
INSERT INTO `userlog` VALUES (481,'2011-06-01 12:12:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-05-31.');
INSERT INTO `userlog` VALUES (482,'2011-06-01 14:09:32',1,'127.0.0.1',0,11,'Объект доступа перенесен в отдел \"Программисты\".');
INSERT INTO `userlog` VALUES (483,'2011-06-01 14:10:43',1,'127.0.0.1',0,11,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (484,'2011-06-01 14:10:49',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (485,'2011-06-01 16:31:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-05-31.');
INSERT INTO `userlog` VALUES (486,'2011-06-01 16:32:22',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-05-31.');
INSERT INTO `userlog` VALUES (487,'2011-06-05 14:05:05',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (488,'2011-06-06 12:57:05',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-06-03.');
INSERT INTO `userlog` VALUES (489,'2011-06-06 12:57:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-06-03.');
INSERT INTO `userlog` VALUES (490,'2011-06-06 12:58:31',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-06-03.');
INSERT INTO `userlog` VALUES (491,'2011-06-06 12:59:04',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-06-03.');
INSERT INTO `userlog` VALUES (492,'2011-06-07 11:27:25',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (493,'2011-06-07 11:30:24',1,'127.0.0.1',0,27,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (494,'2011-06-07 11:30:41',1,'127.0.0.1',0,27,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (495,'2011-06-07 11:31:38',1,'127.0.0.1',0,11,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (496,'2011-06-07 11:31:43',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (497,'2011-06-07 12:40:58',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (498,'2011-06-10 11:36:06',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (499,'2011-06-10 11:36:14',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (500,'2011-06-10 11:36:22',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (501,'2011-06-10 11:37:24',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-03 - 2011-06-10.');
INSERT INTO `userlog` VALUES (502,'2011-06-10 11:37:58',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-03 - 2011-06-10.');
INSERT INTO `userlog` VALUES (503,'2011-06-10 11:40:02',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-03 - 2011-06-10.');
INSERT INTO `userlog` VALUES (504,'2011-06-10 11:41:13',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-03 - 2011-06-10.');
INSERT INTO `userlog` VALUES (505,'2011-06-10 11:41:49',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-03 - 2011-06-10.');
INSERT INTO `userlog` VALUES (506,'2011-06-14 09:31:01',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-06-14.');
INSERT INTO `userlog` VALUES (507,'2011-06-14 11:54:16',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (508,'2011-06-14 11:54:16',1,'127.0.0.1',0,20,'Объект доступа перенесен в отдел \"Администрация\".');
INSERT INTO `userlog` VALUES (509,'2011-06-14 11:55:03',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (510,'2011-06-14 11:55:09',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (511,'2011-06-17 09:09:33',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-16 - 2011-06-17.');
INSERT INTO `userlog` VALUES (512,'2011-06-17 09:10:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-05-30 - 2011-06-17.');
INSERT INTO `userlog` VALUES (513,'2011-06-17 09:11:05',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-06 - 2011-06-17.');
INSERT INTO `userlog` VALUES (514,'2011-06-17 09:59:40',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-10 - 2011-06-17.');
INSERT INTO `userlog` VALUES (515,'2011-06-17 10:00:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-10 - 2011-06-17.');
INSERT INTO `userlog` VALUES (516,'2011-06-17 10:00:39',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-10 - 2011-06-17.');
INSERT INTO `userlog` VALUES (517,'2011-06-17 10:01:09',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-10 - 2011-06-17.');
INSERT INTO `userlog` VALUES (518,'2011-06-22 14:45:54',1,'127.0.0.1',0,62,'В отделе \"Программисты\" создан сотрудник \"Ольга Брук\".');
INSERT INTO `userlog` VALUES (519,'2011-06-22 14:48:25',1,'127.0.0.1',0,62,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (520,'2011-06-22 14:48:31',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (521,'2011-06-23 10:20:23',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (522,'2011-06-24 11:24:35',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (523,'2011-06-24 11:25:59',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (524,'2011-06-24 11:26:33',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (525,'2011-06-24 11:27:02',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (526,'2011-06-24 11:27:50',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (527,'2011-06-24 11:28:18',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (528,'2011-06-24 12:58:38',1,'127.0.0.1',0,59,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (529,'2011-06-24 12:58:43',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (530,'2011-07-01 08:48:14',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (531,'2011-07-01 08:48:42',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (532,'2011-07-01 08:49:04',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (533,'2011-07-01 08:49:28',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-17 - 2011-06-24.');
INSERT INTO `userlog` VALUES (534,'2011-07-01 09:50:46',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-24 - 2011-07-01.');
INSERT INTO `userlog` VALUES (535,'2011-07-01 09:51:18',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-24 - 2011-07-01.');
INSERT INTO `userlog` VALUES (536,'2011-07-01 09:51:45',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-24 - 2011-07-01.');
INSERT INTO `userlog` VALUES (537,'2011-07-01 09:52:08',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-06-24 - 2011-07-01.');
INSERT INTO `userlog` VALUES (538,'2011-07-07 09:02:25',1,'127.0.0.1',0,42,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (539,'2011-07-07 09:02:45',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (540,'2011-07-11 09:54:21',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-07-01 - 2011-07-08.');
INSERT INTO `userlog` VALUES (541,'2011-07-11 09:55:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-07-01 - 2011-07-08.');
INSERT INTO `userlog` VALUES (542,'2011-07-11 09:56:16',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-07-01 - 2011-07-08.');
INSERT INTO `userlog` VALUES (543,'2011-07-11 09:56:53',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал входов-выходов на территорию\" за период 2011-07-01 - 2011-07-08.');
INSERT INTO `userlog` VALUES (544,'2011-07-12 09:58:22',1,'127.0.0.1',0,16,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (545,'2011-07-12 09:58:33',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (546,'2011-07-12 09:58:37',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (547,'2011-07-12 17:30:28',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (548,'2011-07-12 17:31:08',1,'127.0.0.1',0,63,'В отделе \"Программисты\" создан сотрудник \"Александр Лобов\".');
INSERT INTO `userlog` VALUES (549,'2011-07-12 17:32:27',1,'127.0.0.1',0,63,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (550,'2011-07-12 17:32:32',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (551,'2011-08-02 09:12:20',1,'127.0.0.1',0,64,'В отделе \"Программисты\" создан сотрудник \"Дмитрий Ланда\".');
INSERT INTO `userlog` VALUES (552,'2011-08-02 09:12:38',1,'127.0.0.1',0,64,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (553,'2011-08-02 09:14:52',1,'127.0.0.1',0,64,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (554,'2011-08-02 09:14:59',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (555,'2011-08-09 16:02:02',1,'127.0.0.1',0,65,'В отделе \"IT\" создан сотрудник \"Алексей Авдеев\".');
INSERT INTO `userlog` VALUES (556,'2011-08-09 16:02:26',1,'127.0.0.1',0,65,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (557,'2011-08-09 16:02:38',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (558,'2011-08-17 15:54:18',1,'127.0.0.1',0,66,'В отделе \"Программисты\" создан сотрудник \"Тиофей Дураков\".');
INSERT INTO `userlog` VALUES (559,'2011-08-17 15:54:28',1,'127.0.0.1',0,66,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (560,'2011-08-17 15:54:34',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (561,'2011-08-24 08:05:00',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (562,'2011-08-25 14:38:35',1,'127.0.0.1',0,67,'В отделе \"QA\" создан сотрудник \"Илья Александров\".');
INSERT INTO `userlog` VALUES (563,'2011-08-25 14:41:03',1,'127.0.0.1',0,67,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (564,'2011-08-25 14:41:11',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (565,'2011-09-07 10:15:04',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (566,'2011-09-19 14:24:06',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (567,'2011-09-27 15:26:19',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (568,'2011-09-27 15:27:38',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"парамонова\".');
INSERT INTO `userlog` VALUES (569,'2011-09-27 15:28:28',1,'127.0.0.1',0,69,'В отделе \"парамонова\" создан сотрудник \"Мезникова Галина\".');
INSERT INTO `userlog` VALUES (570,'2011-09-27 15:30:33',1,'127.0.0.1',0,69,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (571,'2011-09-27 15:33:44',1,'127.0.0.1',0,69,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (572,'2011-09-27 15:34:34',1,'127.0.0.1',0,69,'Объект доступа \"Мезникова Галина\" удален.');
INSERT INTO `userlog` VALUES (573,'2011-09-27 15:35:30',1,'127.0.0.1',0,70,'В отделе \"парамонова\" создан сотрудник \"Mezni]v\".');
INSERT INTO `userlog` VALUES (574,'2011-09-27 15:36:44',1,'127.0.0.1',0,70,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (575,'2011-09-27 15:36:50',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (576,'2011-09-27 15:38:12',1,'127.0.0.1',0,70,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (577,'2011-09-27 15:38:21',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (578,'2011-09-27 15:39:16',1,'127.0.0.1',0,71,'В отделе \"парамонова\" создан сотрудник \"Михайлова Екатерина\".');
INSERT INTO `userlog` VALUES (579,'2011-09-27 15:39:38',1,'127.0.0.1',0,71,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (580,'2011-09-27 15:39:44',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (581,'2011-09-27 15:40:28',1,'127.0.0.1',0,0,'Изменены параметры отдела \"парамонова\".');
INSERT INTO `userlog` VALUES (582,'2011-09-27 15:40:28',1,'127.0.0.1',0,70,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (583,'2011-09-27 15:40:28',1,'127.0.0.1',0,71,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (584,'2011-09-27 15:40:56',1,'127.0.0.1',0,0,'Изменены параметры отдела \"парамонова\".');
INSERT INTO `userlog` VALUES (585,'2011-09-27 15:40:56',1,'127.0.0.1',0,70,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (586,'2011-09-27 15:40:56',1,'127.0.0.1',0,71,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (587,'2011-09-27 15:42:59',1,'127.0.0.1',0,72,'В отделе \"парамонова\" создан сотрудник \"Курнушко Елена\".');
INSERT INTO `userlog` VALUES (588,'2011-09-27 15:43:35',1,'127.0.0.1',0,72,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (589,'2011-09-27 15:43:45',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (590,'2011-09-27 15:45:41',1,'127.0.0.1',0,73,'В отделе \"парамонова\" создан сотрудник \"Николаева Наталья\".');
INSERT INTO `userlog` VALUES (591,'2011-09-27 15:46:05',1,'127.0.0.1',0,73,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (592,'2011-09-27 15:46:14',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (593,'2011-09-27 15:47:29',1,'127.0.0.1',0,74,'В отделе \"парамонова\" создан сотрудник \"Петрова Полина\".');
INSERT INTO `userlog` VALUES (594,'2011-09-27 15:48:13',1,'127.0.0.1',0,74,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (595,'2011-09-27 15:48:26',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (596,'2011-09-27 15:49:42',1,'127.0.0.1',0,75,'В отделе \"парамонова\" создан сотрудник \"Евдокимова Екатерина\".');
INSERT INTO `userlog` VALUES (597,'2011-09-27 15:50:01',1,'127.0.0.1',0,75,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (598,'2011-09-27 15:50:09',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (599,'2011-09-28 08:27:44',1,'127.0.0.1',0,70,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (600,'2011-09-28 08:27:51',1,'127.0.0.1',0,71,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (601,'2011-09-28 08:28:01',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (602,'2011-10-03 15:26:54',1,'127.0.0.1',0,62,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (603,'2011-10-03 15:27:00',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (604,'2011-10-11 08:37:00',1,'127.0.0.1',0,51,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (605,'2011-10-11 08:37:40',1,'127.0.0.1',0,51,'Объект доступа перенесен в отдел \"IT\".');
INSERT INTO `userlog` VALUES (606,'2011-10-11 08:37:54',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (607,'2011-10-12 10:33:45',1,'127.0.0.1',0,76,'В отделе \"парамонова\" создан сотрудник \"Ефремова Наталия\".');
INSERT INTO `userlog` VALUES (608,'2011-10-12 10:34:22',1,'127.0.0.1',0,77,'В отделе \"парамонова\" создан сотрудник \"Галимова Альфия\".');
INSERT INTO `userlog` VALUES (609,'2011-10-12 10:35:03',1,'127.0.0.1',0,78,'В отделе \"парамонова\" создан сотрудник \"Вострова Юлия\".');
INSERT INTO `userlog` VALUES (610,'2011-10-12 10:36:00',1,'127.0.0.1',0,79,'В отделе \"парамонова\" создан сотрудник \"Матыцина Анастасия\".');
INSERT INTO `userlog` VALUES (611,'2011-10-12 10:37:49',1,'127.0.0.1',0,77,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (612,'2011-10-12 10:38:04',1,'127.0.0.1',0,79,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (613,'2011-10-12 10:38:22',1,'127.0.0.1',0,78,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (614,'2011-10-12 10:38:34',1,'127.0.0.1',0,76,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (615,'2011-10-12 10:39:29',1,'127.0.0.1',0,80,'В отделе \"парамонова\" создан сотрудник \"Белякова Анна\".');
INSERT INTO `userlog` VALUES (616,'2011-10-12 10:39:41',1,'127.0.0.1',0,80,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (617,'2011-10-12 10:39:46',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (618,'2011-10-12 14:29:03',1,'127.0.0.1',0,40,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (619,'2011-10-12 14:29:48',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (620,'2011-10-21 09:55:07',1,'127.0.0.1',0,55,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (621,'2011-10-21 09:55:13',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (622,'2011-10-25 12:43:06',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (623,'2011-11-08 13:48:16',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (624,'2011-11-08 13:49:54',1,'127.0.0.1',0,63,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (625,'2011-11-08 13:50:33',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (626,'2011-11-08 13:51:20',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (627,'2011-11-15 13:08:04',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (628,'2011-11-29 17:32:56',1,'127.0.0.1',0,81,'В отделе \"Программисты\" создан сотрудник \"Иван Милов\".');
INSERT INTO `userlog` VALUES (629,'2011-11-29 17:34:50',1,'127.0.0.1',0,81,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (630,'2011-11-29 17:34:57',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (631,'2011-12-15 03:17:35',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (632,'2011-12-19 16:54:01',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (633,'2011-12-19 16:55:51',1,'127.0.0.1',0,82,'В отделе \"Программисты\" создан сотрудник \"Колачев Антон\".');
INSERT INTO `userlog` VALUES (634,'2011-12-19 16:58:05',1,'127.0.0.1',0,60,'Объект доступа \"Королев Алексей\" удален.');
INSERT INTO `userlog` VALUES (635,'2011-12-19 17:00:59',1,'127.0.0.1',0,15,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (636,'2011-12-19 17:01:12',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (637,'2011-12-20 11:46:30',1,'127.0.0.1',0,83,'В отделе \"Программисты\" создан сотрудник \"Алексей Королев\".');
INSERT INTO `userlog` VALUES (638,'2011-12-20 11:47:52',1,'127.0.0.1',0,83,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (639,'2011-12-20 11:48:16',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (640,'2011-12-28 09:36:28',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (641,'2012-01-13 16:32:20',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (642,'2012-01-13 16:33:58',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (643,'2012-01-13 16:34:31',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (644,'2012-01-13 16:37:39',1,'127.0.0.1',0,20,'Объект доступа перенесен в отдел \"Программисты\".');
INSERT INTO `userlog` VALUES (645,'2012-01-13 16:47:04',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (646,'2012-01-13 16:47:10',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (647,'2012-01-18 09:20:31',1,'127.0.0.1',0,36,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (648,'2012-01-18 09:20:41',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (649,'2012-01-18 09:20:58',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (650,'2012-01-20 14:14:24',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (651,'2012-01-20 14:15:34',1,'127.0.0.1',0,70,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (652,'2012-01-20 14:15:44',1,'127.0.0.1',0,70,'Объект доступа \"Мезникова Галина\" удален.');
INSERT INTO `userlog` VALUES (653,'2012-01-20 14:15:50',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (654,'2012-01-31 09:32:46',1,'127.0.0.1',0,36,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (655,'2012-01-31 09:32:55',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (656,'2012-01-31 09:33:09',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (657,'2012-01-31 15:41:35',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (658,'2012-01-31 15:42:20',1,'127.0.0.1',0,36,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (659,'2012-01-31 15:42:29',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (660,'2012-01-31 15:43:00',1,'127.0.0.1',0,65,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (661,'2012-01-31 15:43:20',1,'127.0.0.1',0,54,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (662,'2012-01-31 15:43:42',1,'127.0.0.1',0,55,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (663,'2012-01-31 15:44:20',1,'127.0.0.1',0,8,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (664,'2012-01-31 15:44:38',1,'127.0.0.1',0,67,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (665,'2012-01-31 15:44:55',1,'127.0.0.1',0,16,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (666,'2012-01-31 15:45:01',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (667,'2012-01-31 15:45:34',1,'127.0.0.1',0,83,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (668,'2012-01-31 15:45:53',1,'127.0.0.1',0,58,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (669,'2012-01-31 15:46:12',1,'127.0.0.1',0,28,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (670,'2012-01-31 15:46:28',1,'127.0.0.1',0,56,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (671,'2012-01-31 15:46:42',1,'127.0.0.1',0,20,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (672,'2012-01-31 15:46:58',1,'127.0.0.1',0,81,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (673,'2012-01-31 15:47:16',1,'127.0.0.1',0,45,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (674,'2012-01-31 15:47:48',1,'127.0.0.1',0,66,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (675,'2012-01-31 15:48:00',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (676,'2012-02-14 13:20:12',1,'127.0.0.1',0,84,'В отделе \"Администрация\" создан сотрудник \"Лариса Александровна\".');
INSERT INTO `userlog` VALUES (677,'2012-02-14 13:20:49',1,'127.0.0.1',0,84,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (678,'2012-02-14 13:21:14',1,'127.0.0.1',0,85,'В отделе \"Администрация\" создан сотрудник \"Управляющая\".');
INSERT INTO `userlog` VALUES (679,'2012-02-14 13:21:37',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (680,'2012-02-14 13:21:45',1,'127.0.0.1',0,85,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (681,'2012-02-14 13:21:50',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (682,'2012-02-15 03:18:13',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (683,'2012-02-20 09:12:13',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (684,'2012-02-20 09:13:17',1,'127.0.0.1',0,8,'Объект доступа \"Пономарев Иван \" удален.');
INSERT INTO `userlog` VALUES (685,'2012-02-20 09:13:20',1,'127.0.0.1',0,55,'Объект доступа \"Поленчук Михаил \" удален.');
INSERT INTO `userlog` VALUES (686,'2012-02-20 09:13:36',1,'127.0.0.1',0,41,'Объект доступа \"Масунов Андрей\" удален.');
INSERT INTO `userlog` VALUES (687,'2012-02-20 09:13:56',1,'127.0.0.1',0,40,'Объект доступа \"Грошев Иван\" удален.');
INSERT INTO `userlog` VALUES (688,'2012-02-20 09:14:26',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (689,'2012-02-20 11:18:58',1,'127.0.0.1',0,86,'В отделе \"Администрация\" создан сотрудник \"Румен\".');
INSERT INTO `userlog` VALUES (690,'2012-02-20 11:19:19',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (691,'2012-02-20 11:19:43',1,'127.0.0.1',0,86,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (692,'2012-02-20 11:20:22',1,'127.0.0.1',0,87,'В отделе \"Администрация\" создан сотрудник \"Балдур\".');
INSERT INTO `userlog` VALUES (693,'2012-02-20 11:20:56',1,'127.0.0.1',0,87,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (694,'2012-02-20 11:21:01',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (695,'2012-02-20 13:44:26',1,'127.0.0.1',0,88,'В отделе \"QA\" создан сотрудник \"Волков Антон\".');
INSERT INTO `userlog` VALUES (696,'2012-02-20 13:44:42',1,'127.0.0.1',0,88,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (697,'2012-02-20 13:44:52',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (698,'2012-02-21 08:40:47',1,'127.0.0.1',0,63,'Объект доступа \"Заровный Алексей\" удален.');
INSERT INTO `userlog` VALUES (699,'2012-02-21 08:41:09',1,'127.0.0.1',0,88,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (700,'2012-02-21 08:41:19',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (701,'2012-03-05 14:04:36',1,'127.0.0.1',0,84,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (702,'2012-03-05 14:04:42',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (703,'2012-03-05 16:06:15',1,'127.0.0.1',0,86,'Объект доступа \"Румен\" удален.');
INSERT INTO `userlog` VALUES (704,'2012-03-05 16:06:45',1,'127.0.0.1',0,89,'В отделе \"Программисты\" создан сотрудник \"Васильев Роман\".');
INSERT INTO `userlog` VALUES (705,'2012-03-05 16:06:58',1,'127.0.0.1',0,89,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (706,'2012-03-05 16:07:06',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (707,'2012-03-15 03:17:36',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (708,'2012-03-15 08:42:06',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (709,'2012-03-15 08:42:33',1,'127.0.0.1',0,87,'Объект доступа \"Балдур\" удален.');
INSERT INTO `userlog` VALUES (710,'2012-03-15 08:43:41',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (711,'2012-03-15 08:43:59',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (712,'2012-03-15 08:44:09',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (713,'2012-03-16 08:51:22',1,'127.0.0.1',0,42,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (714,'2012-03-16 08:51:29',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (715,'2012-03-16 17:37:11',1,'127.0.0.1',0,65,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (716,'2012-03-16 17:37:19',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (717,'2012-03-27 09:54:24',1,'127.0.0.1',0,65,'Объект доступа \"Авдеев Алексей\" удален.');
INSERT INTO `userlog` VALUES (718,'2012-03-27 09:54:48',1,'127.0.0.1',0,12,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (719,'2012-03-27 09:55:11',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (720,'2012-04-03 17:29:03',1,'127.0.0.1',0,32,'Объект доступа \"Яраев Дмитрий\" удален.');
INSERT INTO `userlog` VALUES (721,'2012-04-03 17:29:13',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (722,'2012-04-03 17:31:15',1,'127.0.0.1',0,90,'В отделе \"Уборщицы\" создан сотрудник \"111\".');
INSERT INTO `userlog` VALUES (723,'2012-04-03 17:33:06',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (724,'2012-04-03 17:33:18',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (725,'2012-04-03 17:36:32',1,'127.0.0.1',0,80,'Объект доступа \"Белякова Анна\" удален.');
INSERT INTO `userlog` VALUES (726,'2012-04-03 17:36:38',1,'127.0.0.1',0,78,'Объект доступа \"Вострова Юлия\" удален.');
INSERT INTO `userlog` VALUES (727,'2012-04-03 17:36:40',1,'127.0.0.1',0,77,'Объект доступа \"Галимова Альфия\" удален.');
INSERT INTO `userlog` VALUES (728,'2012-04-03 17:36:43',1,'127.0.0.1',0,75,'Объект доступа \"Евдокимова Екатерина\" удален.');
INSERT INTO `userlog` VALUES (729,'2012-04-03 17:36:46',1,'127.0.0.1',0,76,'Объект доступа \"Ефремова Наталия\" удален.');
INSERT INTO `userlog` VALUES (730,'2012-04-03 17:36:48',1,'127.0.0.1',0,72,'Объект доступа \"Курнушко Елена\" удален.');
INSERT INTO `userlog` VALUES (731,'2012-04-03 17:36:51',1,'127.0.0.1',0,79,'Объект доступа \"Матыцина Анастасия\" удален.');
INSERT INTO `userlog` VALUES (732,'2012-04-03 17:36:54',1,'127.0.0.1',0,71,'Объект доступа \"Михайлова Екатерина\" удален.');
INSERT INTO `userlog` VALUES (733,'2012-04-03 17:36:57',1,'127.0.0.1',0,73,'Объект доступа \"Николаева Наталья\" удален.');
INSERT INTO `userlog` VALUES (734,'2012-04-03 17:37:01',1,'127.0.0.1',0,74,'Объект доступа \"Петрова Полина\" удален.');
INSERT INTO `userlog` VALUES (735,'2012-04-03 17:37:08',1,'127.0.0.1',0,0,'Отдел \"парамонова\" удален.');
INSERT INTO `userlog` VALUES (736,'2012-04-03 17:37:15',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (737,'2012-04-05 12:19:19',1,'127.0.0.1',0,91,'В отделе \"Программисты\" создан сотрудник \"Бакулин Алексей\".');
INSERT INTO `userlog` VALUES (738,'2012-04-05 12:20:11',1,'127.0.0.1',0,91,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (739,'2012-04-05 12:20:28',1,'127.0.0.1',0,67,'Объект доступа \"Александров Илья \" удален.');
INSERT INTO `userlog` VALUES (740,'2012-04-05 12:20:49',1,'127.0.0.1',0,91,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (741,'2012-04-05 12:20:55',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (742,'2012-04-10 12:52:57',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (743,'2012-04-11 11:27:17',1,'127.0.0.1',0,92,'В отделе \"Программисты\" создан сотрудник \"Игорь Рухленко\".');
INSERT INTO `userlog` VALUES (744,'2012-04-11 11:32:14',1,'127.0.0.1',0,10,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (745,'2012-04-11 11:32:19',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (746,'2012-04-11 11:32:52',1,'127.0.0.1',0,92,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (747,'2012-04-11 11:32:58',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (748,'2012-04-11 11:33:17',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (749,'2012-04-13 10:52:32',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (750,'2012-04-13 10:54:50',1,'127.0.0.1',0,15,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (751,'2012-04-13 10:55:03',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (752,'2012-04-13 10:55:51',1,'127.0.0.1',0,15,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (753,'2012-04-13 10:56:02',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (754,'2012-04-13 11:00:03',1,'127.0.0.1',0,82,'Объект доступа \"Колачев Антон\" удален.');
INSERT INTO `userlog` VALUES (755,'2012-04-13 11:00:08',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (756,'2012-04-16 12:16:45',1,'127.0.0.1',0,54,'Объект доступа \"Чекунов Алексей \" удален.');
INSERT INTO `userlog` VALUES (757,'2012-04-16 12:16:52',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (758,'2012-04-16 12:17:45',1,'127.0.0.1',0,93,'В отделе \"IT\" создан сотрудник \"Чекунов Алексей\".');
INSERT INTO `userlog` VALUES (759,'2012-04-16 12:18:00',1,'127.0.0.1',0,93,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (760,'2012-04-16 12:18:06',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (761,'2012-04-23 15:05:16',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (762,'2012-04-23 15:05:16',1,'127.0.0.1',0,26,'Объект доступа перенесен в отдел \"Программисты\".');
INSERT INTO `userlog` VALUES (763,'2012-04-23 15:06:08',1,'127.0.0.1',0,62,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (764,'2012-04-23 15:06:18',1,'127.0.0.1',0,62,'Объект доступа \"\" удален.');
INSERT INTO `userlog` VALUES (765,'2012-04-23 15:06:40',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (766,'2012-05-05 10:49:45',1,'127.0.0.1',0,94,'В отделе \"Программисты\" создан сотрудник \"Иветта Косова\".');
INSERT INTO `userlog` VALUES (767,'2012-05-05 10:50:43',1,'127.0.0.1',0,94,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (768,'2012-05-05 10:51:19',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (769,'2012-05-05 15:36:46',1,'127.0.0.1',0,94,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (770,'2012-05-05 15:36:46',1,'127.0.0.1',0,94,'Объект доступа \"Иветта Косова\" удален.');
INSERT INTO `userlog` VALUES (771,'2012-05-05 15:38:11',1,'127.0.0.1',0,44,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (772,'2012-05-05 15:38:11',1,'127.0.0.1',0,44,'Объект доступа перенесен в отдел \"Программисты\".');
INSERT INTO `userlog` VALUES (773,'2012-05-05 15:38:22',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (774,'2012-05-05 15:38:34',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (775,'2012-05-10 03:21:48',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (776,'2012-05-28 09:45:00',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (777,'2012-05-28 09:46:56',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (778,'2012-05-28 09:46:56',1,'127.0.0.1',0,26,'Объект доступа перенесен в отдел \"IT\".');
INSERT INTO `userlog` VALUES (779,'2012-05-28 09:47:15',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (780,'2012-05-28 09:47:40',1,'127.0.0.1',0,93,'Объект доступа \"Чекунов Алексей\" удален.');
INSERT INTO `userlog` VALUES (781,'2012-05-28 09:48:06',1,'127.0.0.1',0,39,'Объект доступа \"Федотов Николай\" удален.');
INSERT INTO `userlog` VALUES (782,'2012-05-28 09:48:27',1,'127.0.0.1',0,25,'Объект доступа \"Молодцова Дарья\" удален.');
INSERT INTO `userlog` VALUES (783,'2012-05-28 09:49:31',1,'127.0.0.1',0,57,'Объект доступа \"Бочкарев Александр\" удален.');
INSERT INTO `userlog` VALUES (784,'2012-05-28 09:49:59',1,'127.0.0.1',0,28,'Объект доступа \"Матюшкин Дмитрий \" удален.');
INSERT INTO `userlog` VALUES (785,'2012-05-28 09:50:23',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (786,'2012-05-28 09:52:45',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (787,'2012-05-28 10:02:54',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (788,'2012-05-28 10:02:58',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (789,'2012-05-28 10:03:22',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (790,'2012-05-28 10:03:31',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (791,'2012-05-28 10:05:15',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (792,'2012-05-28 10:05:20',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (793,'2012-05-28 10:07:06',1,'127.0.0.1',0,26,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (794,'2012-05-28 10:07:11',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (795,'2012-05-28 10:08:17',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (796,'2012-05-28 10:58:22',1,'127.0.0.1',0,95,'В отделе \"Программисты\" создан сотрудник \"Роман Испаев\".');
INSERT INTO `userlog` VALUES (797,'2012-05-28 10:58:51',1,'127.0.0.1',0,95,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (798,'2012-05-28 10:59:01',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (799,'2012-06-04 09:18:52',1,'127.0.0.1',0,96,'В отделе \"Администрация\" создан сотрудник \"Жиганова Юлия\".');
INSERT INTO `userlog` VALUES (800,'2012-06-04 09:19:41',1,'127.0.0.1',0,96,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (801,'2012-06-04 09:19:47',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (802,'2012-06-04 10:57:47',1,'127.0.0.1',0,95,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (803,'2012-06-04 10:57:52',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (804,'2012-06-04 12:08:57',1,'127.0.0.1',0,95,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (805,'2012-06-04 12:09:03',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (806,'2012-06-04 16:58:41',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2012-05-28 - 2012-05-28.');
INSERT INTO `userlog` VALUES (807,'2012-06-04 16:58:54',1,'127.0.0.1',0,0,'Запрошена генерация отчета \"Журнал событий системы\" за период 2012-05-28 - 2012-05-28.');
INSERT INTO `userlog` VALUES (808,'2012-06-05 03:15:41',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (809,'2012-06-07 09:35:48',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (810,'2012-06-07 09:37:06',1,'127.0.0.1',0,10,'Объект доступа \"Варенов П.П.\" удален.');
INSERT INTO `userlog` VALUES (811,'2012-06-07 09:38:15',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (812,'2012-06-07 09:39:09',1,'127.0.0.1',0,92,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (813,'2012-06-07 09:39:17',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (814,'2012-06-07 09:42:51',1,'127.0.0.1',0,92,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (815,'2012-06-07 09:43:27',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (816,'2012-06-07 09:43:37',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (817,'2012-06-07 09:44:10',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (818,'2012-06-07 10:36:20',1,'127.0.0.1',0,92,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (819,'2012-06-07 10:36:27',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (820,'2012-06-07 10:36:43',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (821,'2012-06-07 12:40:49',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2012-06-07 00:00:00 - 2012-06-07 23:59:00.');
INSERT INTO `userlog` VALUES (822,'2012-06-07 12:41:00',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2012-06-07 00:00:00 - 2012-06-07 23:59:00.');
INSERT INTO `userlog` VALUES (823,'2012-06-07 12:41:20',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2012-06-07 00:00:00 - 2012-06-07 23:59:00.');
INSERT INTO `userlog` VALUES (824,'2012-06-07 12:41:32',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2012-05-07 00:00:00 - 2012-06-07 23:59:00.');
INSERT INTO `userlog` VALUES (825,'2012-06-07 12:41:39',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2012-05-07 00:00:00 - 2012-06-07 23:59:00.');
INSERT INTO `userlog` VALUES (826,'2012-06-07 12:58:32',1,'127.0.0.1',0,12,'Объект доступа \"Догонов Максим\" удален.');
INSERT INTO `userlog` VALUES (827,'2012-06-07 12:59:59',1,'127.0.0.1',0,97,'В отделе \"IT\" создан сотрудник \"mmmm\".');
INSERT INTO `userlog` VALUES (828,'2012-06-07 13:00:16',1,'127.0.0.1',0,97,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (829,'2012-06-07 13:02:51',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (830,'2012-06-07 13:05:25',1,'127.0.0.1',0,97,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (831,'2012-06-07 13:05:31',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (832,'2012-06-07 13:05:38',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (833,'2012-06-07 15:00:56',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (834,'2012-06-07 15:02:08',1,'127.0.0.1',0,98,'В отделе \"Программисты\" создан сотрудник \"Авдеев Алексей\".');
INSERT INTO `userlog` VALUES (835,'2012-06-07 15:03:04',1,'127.0.0.1',0,98,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (836,'2012-06-07 15:03:10',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (837,'2012-06-07 15:03:34',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (838,'2012-06-13 03:23:06',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (839,'2012-07-03 16:10:45',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (840,'2012-07-03 17:45:52',1,'127.0.0.1',0,36,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (841,'2012-07-03 18:02:35',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (842,'2012-07-03 18:02:53',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (843,'2012-07-03 18:12:40',1,'127.0.0.1',0,36,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (844,'2012-07-03 18:13:26',1,'127.0.0.1',0,29,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (845,'2012-07-03 18:13:55',1,'127.0.0.1',0,95,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (846,'2012-07-09 11:13:27',1,'127.0.0.1',0,95,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (847,'2012-07-09 11:13:33',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (848,'2012-07-09 11:13:41',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (849,'2012-07-09 11:14:15',1,'127.0.0.1',0,95,'Объект доступа перенесен в отдел \"IT\".');
INSERT INTO `userlog` VALUES (850,'2012-07-09 11:14:22',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (851,'2012-07-09 11:16:39',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (852,'2012-07-09 11:20:07',1,'127.0.0.1',0,36,'Объект доступа \"Демидов Кирилл\" удален.');
INSERT INTO `userlog` VALUES (853,'2012-07-09 11:20:18',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (854,'2012-07-09 11:34:56',1,'127.0.0.1',0,0,'Запрошена выборка из архива событий за период 2012-07-03 00:00:00 - 2012-07-03 23:59:00.');
INSERT INTO `userlog` VALUES (855,'2012-07-12 03:17:46',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (856,'2012-07-12 09:53:26',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (857,'2012-07-12 09:55:48',1,'127.0.0.1',0,99,'В отделе \"Администрация\" создан сотрудник \"Петрунин Вадим\".');
INSERT INTO `userlog` VALUES (858,'2012-07-12 09:56:08',1,'127.0.0.1',0,99,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (859,'2012-07-12 09:56:22',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (860,'2012-07-12 09:56:32',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (861,'2012-07-16 10:24:32',1,'127.0.0.1',0,100,'В отделе \"Программисты\" создан сотрудник \"Яковлев Евгений\".');
INSERT INTO `userlog` VALUES (862,'2012-07-16 10:25:27',1,'127.0.0.1',0,100,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (863,'2012-07-16 10:25:34',1,'127.0.0.1',0,97,'Объект доступа \"z\" удален.');
INSERT INTO `userlog` VALUES (864,'2012-07-16 10:25:51',1,'127.0.0.1',0,100,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (865,'2012-07-16 10:25:56',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (866,'2012-07-18 13:28:29',1,'127.0.0.1',0,18,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (867,'2012-07-18 13:28:35',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (868,'2012-07-23 10:32:54',1,'127.0.0.1',0,101,'В отделе \"QA\" создан сотрудник \"Башкевич Алексей\".');
INSERT INTO `userlog` VALUES (869,'2012-07-23 10:33:52',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (870,'2012-07-23 10:53:55',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (871,'2012-07-23 10:53:59',1,'127.0.0.1',0,101,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (872,'2012-07-23 10:54:06',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (873,'2012-07-25 11:58:47',1,'127.0.0.1',0,102,'В отделе \"IT\" создан сотрудник \"Стюшин Алексей\".');
INSERT INTO `userlog` VALUES (874,'2012-07-25 11:59:03',1,'127.0.0.1',0,102,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (875,'2012-07-25 11:59:10',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (876,'2012-07-26 16:22:06',1,'127.0.0.1',0,102,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (877,'2012-07-26 16:22:11',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (878,'2012-07-30 16:27:21',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (879,'2012-07-30 16:29:58',1,'127.0.0.1',0,103,'В отделе \"QA\" создан сотрудник \" Номеровская Елена\".');
INSERT INTO `userlog` VALUES (880,'2012-07-30 16:30:24',1,'127.0.0.1',0,103,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (881,'2012-07-30 16:30:31',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (882,'2012-07-30 16:35:10',1,'127.0.0.1',0,104,'В отделе \"Программисты\" создан сотрудник \"Симонова Евгения\".');
INSERT INTO `userlog` VALUES (883,'2012-07-30 16:35:37',1,'127.0.0.1',0,104,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (884,'2012-07-30 16:35:42',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (885,'2012-07-30 16:37:24',1,'127.0.0.1',0,105,'В отделе \"Программисты\" создан сотрудник \"Молчанов Иван\".');
INSERT INTO `userlog` VALUES (886,'2012-07-30 16:38:08',1,'127.0.0.1',0,105,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (887,'2012-07-30 16:38:15',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (888,'2012-07-30 16:42:04',1,'127.0.0.1',0,106,'В отделе \"Программисты\" создан сотрудник \"Маслов Святолсав\".');
INSERT INTO `userlog` VALUES (889,'2012-07-30 16:42:30',1,'127.0.0.1',0,106,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (890,'2012-07-30 16:42:38',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (891,'2012-07-30 16:44:03',1,'127.0.0.1',0,107,'В отделе \"Программисты\" создан сотрудник \"Ставрилюк Евгений\".');
INSERT INTO `userlog` VALUES (892,'2012-07-30 16:44:09',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (893,'2012-07-30 16:47:28',1,'127.0.0.1',0,107,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (894,'2012-07-30 16:47:37',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (895,'2012-08-01 15:14:40',1,'127.0.0.1',0,103,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (896,'2012-08-01 15:14:53',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (897,'2012-08-06 15:46:22',1,'127.0.0.1',0,90,'Объект доступа \"111\" удален.');
INSERT INTO `userlog` VALUES (898,'2012-08-06 15:46:30',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (899,'2012-08-06 15:46:48',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (900,'2012-08-06 15:46:52',1,'127.0.0.1',0,83,'Объект доступа \"Королев Алексей \" удален.');
INSERT INTO `userlog` VALUES (901,'2012-08-06 15:47:24',1,'127.0.0.1',0,66,'Объект доступа \"Дураков Тимофей \" удален.');
INSERT INTO `userlog` VALUES (902,'2012-08-06 15:47:29',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (903,'2012-08-09 13:38:34',1,'127.0.0.1',0,108,'В отделе \"Программисты\" создан сотрудник \"Олейников Владислав\".');
INSERT INTO `userlog` VALUES (904,'2012-08-09 13:38:56',1,'127.0.0.1',0,108,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (905,'2012-08-09 13:39:02',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (906,'2012-08-09 13:39:56',1,'127.0.0.1',0,19,'Объект доступа \"Сарбаев Юрий\" удален.');
INSERT INTO `userlog` VALUES (907,'2012-08-16 03:17:51',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (908,'2012-08-21 18:26:28',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (909,'2012-08-21 18:27:49',1,'127.0.0.1',0,0,'В отделе \"Сотрудники\" создан подотдел \"Учителя английского\".');
INSERT INTO `userlog` VALUES (910,'2012-08-21 18:29:15',1,'127.0.0.1',0,110,'В отделе \"Учителя английского\" создан сотрудник \"Разумова Маргарита\".');
INSERT INTO `userlog` VALUES (911,'2012-08-21 18:29:43',1,'127.0.0.1',0,110,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (912,'2012-08-21 18:29:49',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (913,'2012-08-21 18:30:50',1,'127.0.0.1',0,111,'В отделе \"Учителя английского\" создан сотрудник \"Дубровина Ирина\".');
INSERT INTO `userlog` VALUES (914,'2012-08-21 18:32:41',1,'127.0.0.1',0,89,'Объект доступа \"Васильев Роман\" удален.');
INSERT INTO `userlog` VALUES (915,'2012-08-21 18:33:04',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (916,'2012-08-21 18:33:17',1,'127.0.0.1',0,111,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (917,'2012-08-21 18:33:24',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (918,'2012-08-22 12:51:32',1,'127.0.0.1',0,15,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (919,'2012-09-10 17:07:53',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (920,'2012-09-10 17:10:34',1,'127.0.0.1',0,112,'В отделе \"Программисты\" создан сотрудник \"Каплин Кирилл\".');
INSERT INTO `userlog` VALUES (921,'2012-09-10 17:10:52',1,'127.0.0.1',0,112,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (922,'2012-09-10 17:10:59',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (923,'2012-09-10 17:12:12',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (924,'2012-09-13 17:06:44',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (925,'2012-09-13 17:08:07',1,'127.0.0.1',0,113,'В отделе \"Учителя английского\" создан сотрудник \"Кленова Анастаия\".');
INSERT INTO `userlog` VALUES (926,'2012-09-13 17:09:09',1,'127.0.0.1',0,101,'Объект доступа \"Башкевич Алексей\" удален.');
INSERT INTO `userlog` VALUES (927,'2012-09-13 17:10:00',1,'127.0.0.1',0,113,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (928,'2012-09-13 17:10:07',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (929,'2012-09-23 03:15:50',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (930,'2012-09-26 11:22:07',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (931,'2012-09-26 11:25:16',1,'127.0.0.1',1,0,'Изменены свойства точки доступа.');
INSERT INTO `userlog` VALUES (932,'2012-09-26 11:25:23',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (933,'2012-09-26 11:51:18',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (934,'2012-10-01 13:45:03',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (935,'2012-10-01 13:48:30',1,'127.0.0.1',0,114,'В отделе \"Программисты\" создан сотрудник \"Лунев Артем\".');
INSERT INTO `userlog` VALUES (936,'2012-10-01 13:49:01',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (937,'2012-10-01 13:49:15',1,'127.0.0.1',0,114,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (938,'2012-10-01 13:49:21',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (939,'2012-10-01 13:49:39',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (940,'2012-10-04 15:43:30',1,'127.0.0.1',0,81,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (941,'2012-10-04 15:43:35',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (942,'2012-10-04 15:43:43',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (943,'2012-10-09 16:15:27',1,'127.0.0.1',0,115,'В отделе \"Программисты\" создан сотрудник \"Конуров Дмитрий\".');
INSERT INTO `userlog` VALUES (944,'2012-10-09 16:15:46',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (945,'2012-10-09 16:16:08',1,'127.0.0.1',0,115,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (946,'2012-10-09 16:16:49',1,'127.0.0.1',0,116,'В отделе \"Программисты\" создан сотрудник \"Черкасов Андрей\".');
INSERT INTO `userlog` VALUES (947,'2012-10-09 16:17:22',1,'127.0.0.1',0,116,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (948,'2012-10-09 16:17:31',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (949,'2012-10-09 16:18:02',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (950,'2012-10-11 03:17:42',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (951,'2012-10-15 13:47:03',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (952,'2012-10-15 13:49:20',1,'127.0.0.1',0,117,'В отделе \"Программисты\" создан сотрудник \"Матюшкин Дмитрий\".');
INSERT INTO `userlog` VALUES (953,'2012-10-15 13:49:43',1,'127.0.0.1',0,117,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (954,'2012-10-15 13:50:04',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (955,'2012-10-26 13:32:03',1,'127.0.0.1',0,118,'Создан пропуск посетителя \"Пропуск посетителя № 1\".');
INSERT INTO `userlog` VALUES (956,'2012-10-26 13:32:35',1,'127.0.0.1',0,118,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (957,'2012-10-26 13:32:43',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (958,'2012-11-13 15:17:47',1,'127.0.0.1',0,119,'В отделе \"QA\" создан сотрудник \"Лисина Александра\".');
INSERT INTO `userlog` VALUES (959,'2012-11-13 15:18:02',1,'127.0.0.1',0,119,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (960,'2012-11-13 15:18:18',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (961,'2012-11-13 15:19:11',1,'127.0.0.1',0,120,'В отделе \"Программисты\" создан сотрудник \"Прудилин Владимир\".');
INSERT INTO `userlog` VALUES (962,'2012-11-13 15:19:30',1,'127.0.0.1',0,120,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (963,'2012-11-13 15:19:36',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (964,'2012-11-15 03:21:04',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (965,'2012-11-19 11:45:40',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (966,'2012-11-19 11:47:18',1,'127.0.0.1',0,119,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (967,'2012-11-19 11:47:26',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (968,'2012-11-19 11:47:35',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (969,'2012-11-22 03:23:05',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (970,'2012-11-26 14:50:54',1,'127.0.0.1',0,121,'В отделе \"QA\" создан сотрудник \"Пименов Александр\".');
INSERT INTO `userlog` VALUES (971,'2012-11-26 14:51:13',1,'127.0.0.1',0,121,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (972,'2012-11-26 14:51:18',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (973,'2012-12-05 16:22:52',1,'127.0.0.1',0,122,'В отделе \"QA\" создан сотрудник \"Абдулин Руслан\".');
INSERT INTO `userlog` VALUES (974,'2012-12-05 16:23:10',1,'127.0.0.1',0,122,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (975,'2012-12-05 16:23:16',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (976,'2012-12-05 16:24:08',1,'127.0.0.1',0,123,'В отделе \"Администрация\" создан сотрудник \"Михеева Алена\".');
INSERT INTO `userlog` VALUES (977,'2012-12-05 16:24:22',1,'127.0.0.1',0,123,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (978,'2012-12-05 16:24:27',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (979,'2012-12-05 16:26:35',1,'127.0.0.1',0,112,'Объект доступа перенесен в отдел \"Администрация\".');
INSERT INTO `userlog` VALUES (980,'2012-12-05 16:26:41',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (981,'2012-12-13 03:17:59',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (982,'2012-12-26 13:21:09',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (983,'2012-12-26 13:23:46',1,'127.0.0.1',0,112,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (984,'2012-12-26 13:24:13',1,'127.0.0.1',0,112,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (985,'2012-12-26 13:27:18',1,'127.0.0.1',0,112,'Объект доступа \"потеряли карту\" удален.');
INSERT INTO `userlog` VALUES (986,'2012-12-26 13:27:40',1,'127.0.0.1',0,124,'В отделе \"Администрация\" создан сотрудник \"Каплин Кирилл\".');
INSERT INTO `userlog` VALUES (987,'2012-12-26 13:30:01',1,'127.0.0.1',0,124,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (988,'2012-12-26 13:33:13',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (989,'2012-12-26 13:39:33',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (990,'2013-01-09 17:04:04',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (991,'2013-01-09 17:06:01',1,'127.0.0.1',0,125,'В отделе \"QA\" создан сотрудник \"Алексей Трубавин\".');
INSERT INTO `userlog` VALUES (992,'2013-01-09 17:06:31',1,'127.0.0.1',0,125,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (993,'2013-01-09 17:07:32',1,'127.0.0.1',0,126,'В отделе \"QA\" создан сотрудник \"Эдуард Сухарев\".');
INSERT INTO `userlog` VALUES (994,'2013-01-09 17:07:53',1,'127.0.0.1',0,126,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (995,'2013-01-09 17:08:33',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (996,'2013-01-09 17:08:41',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (997,'2013-01-14 17:13:16',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (998,'2013-01-14 17:14:22',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');
INSERT INTO `userlog` VALUES (999,'2013-01-30 16:23:14',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (1000,'2013-01-30 16:27:17',1,'127.0.0.1',0,127,'В отделе \"Администрация\" создан сотрудник \"Качурин Дмитрий\".');
INSERT INTO `userlog` VALUES (1001,'2013-01-30 16:29:09',1,'127.0.0.1',0,128,'В отделе \"QA\" создан сотрудник \"Сластнева Алина\".');
INSERT INTO `userlog` VALUES (1002,'2013-01-30 16:29:22',1,'127.0.0.1',0,128,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (1003,'2013-01-30 16:29:32',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (1004,'2013-01-30 16:32:49',1,'127.0.0.1',0,23,'Объект доступа \"Афоничев Иван\" удален.');
INSERT INTO `userlog` VALUES (1005,'2013-01-30 16:33:00',1,'127.0.0.1',0,35,'Объект доступа \"Бочастый Алексей\" удален.');
INSERT INTO `userlog` VALUES (1006,'2013-01-30 16:33:54',1,'127.0.0.1',0,127,'Объект доступа перенесен в отдел \"Гости\".');
INSERT INTO `userlog` VALUES (1007,'2013-01-30 16:34:49',1,'127.0.0.1',0,81,'Объект доступа \"Милов Иван \" удален.');
INSERT INTO `userlog` VALUES (1008,'2013-01-30 16:34:54',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (1009,'2013-01-30 16:38:34',1,'127.0.0.1',0,92,'Объект доступа \"Рухленко Игорь \" удален.');
INSERT INTO `userlog` VALUES (1010,'2013-01-30 16:38:40',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (1011,'2013-01-30 16:39:30',1,'127.0.0.1',0,127,'Изменены параметры объекта доступа.');
INSERT INTO `userlog` VALUES (1012,'2013-01-30 16:39:35',1,'127.0.0.1',1,0,'Автономная база данных контроллера обновлена.');
INSERT INTO `userlog` VALUES (1013,'2013-02-04 14:02:44',1,'127.0.0.1',0,0,'Пользователь присоединился к серверу');
INSERT INTO `userlog` VALUES (1014,'2013-02-09 07:02:33',1,'127.0.0.1',0,0,'Пользователь отсоединился от сервера');

--
-- Table structure for table `waybills`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waybills` (
  `ID` int(11) NOT NULL,
  `NUM` int(7) default NULL,
  `AUTO_ID` int(11) default NULL,
  `PERSON_ID` int(11) default NULL,
  `DATECRE` datetime default NULL,
  `DATEACT` datetime default NULL,
  `DATEFIN` datetime default NULL,
  `COMMENT` varchar(500) character set utf8 default NULL,
  `TYPE` enum('PERM','TEMP') default NULL,
  PRIMARY KEY  (`ID`),
  KEY `AUTO_ID` (`AUTO_ID`),
  KEY `PERSON_ID` (`PERSON_ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waybills`
--


--
-- Table structure for table `zones`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `ID` int(11) NOT NULL default '0',
  `NAME` varchar(100) character set utf8 default NULL,
  PRIMARY KEY  (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` VALUES (0,'внешняя территория');
INSERT INTO `zones` VALUES (1,'внутренняя территория');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-13 17:24:03
