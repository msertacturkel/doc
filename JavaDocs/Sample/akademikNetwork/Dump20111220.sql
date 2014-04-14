-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: academicnetwork
-- ------------------------------------------------------
-- Server version	5.1.41

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
-- Current Database: `academicnetwork`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `academicnetwork` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `academicnetwork`;

--
-- Table structure for table `academicperson`
--

DROP TABLE IF EXISTS `academicperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academicperson` (
  `personId` int(11) NOT NULL,
  PRIMARY KEY (`personId`),
  KEY `fk_AcademicPerson_Person1` (`personId`),
  CONSTRAINT `fk_AcademicPerson_Person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicperson`
--

LOCK TABLES `academicperson` WRITE;
/*!40000 ALTER TABLE `academicperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `academicperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `personId` int(11) NOT NULL,
  PRIMARY KEY (`personId`),
  CONSTRAINT `fk_Admin_Person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arranges`
--

DROP TABLE IF EXISTS `arranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arranges` (
  `profileId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`eventId`),
  KEY `fk_Profile_has_Event_Event1` (`eventId`),
  KEY `fk_Profile_has_Event_Profile1` (`profileId`),
  CONSTRAINT `fk_Profile_has_Event_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Event_Event1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arranges`
--

LOCK TABLES `arranges` WRITE;
/*!40000 ALTER TABLE `arranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `arranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio` (
  `contentId` int(11) NOT NULL,
  `numOfListening` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  CONSTRAINT `fk_Audio_Content1` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio`
--

LOCK TABLES `audio` WRITE;
/*!40000 ALTER TABLE `audio` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `companyName` varchar(45) NOT NULL,
  `companyWebsite` varchar(45) DEFAULT NULL,
  `companyAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('IBM','www.ibm.com','');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competes`
--

DROP TABLE IF EXISTS `competes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competes` (
  `profileId` int(11) NOT NULL,
  `competitionId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`competitionId`),
  KEY `fk_Profile_has_Competition_Competition2` (`competitionId`),
  KEY `fk_Profile_has_Competition_Profile2` (`profileId`),
  CONSTRAINT `fk_Profile_has_Competition_Profile2` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Competition_Competition2` FOREIGN KEY (`competitionId`) REFERENCES `competition` (`competitionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competes`
--

LOCK TABLES `competes` WRITE;
/*!40000 ALTER TABLE `competes` DISABLE KEYS */;
INSERT INTO `competes` VALUES (2,1);
/*!40000 ALTER TABLE `competes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition` (
  `competitionId` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `competitionName` varchar(45) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `competitionDate` date DEFAULT NULL,
  PRIMARY KEY (`competitionId`),
  KEY `fk_Competition_CompetitionCategory1` (`category`),
  CONSTRAINT `fk_Competition_CompetitionCategory1` FOREIGN KEY (`category`) REFERENCES `competitioncategory` (`category`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` VALUES (1,'Computer Science','IBM','asdasdasd sad','2011-12-19');
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitioncategory`
--

DROP TABLE IF EXISTS `competitioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitioncategory` (
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitioncategory`
--

LOCK TABLES `competitioncategory` WRITE;
/*!40000 ALTER TABLE `competitioncategory` DISABLE KEYS */;
INSERT INTO `competitioncategory` VALUES ('Computer Science');
/*!40000 ALTER TABLE `competitioncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connection` (
  `mprofileId` int(11) NOT NULL,
  `cprofileId` int(11) NOT NULL,
  PRIMARY KEY (`mprofileId`,`cprofileId`),
  KEY `fk_Connection_Profile2` (`cprofileId`),
  CONSTRAINT `fk_Connection_Profile1` FOREIGN KEY (`mprofileId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Connection_Profile2` FOREIGN KEY (`cprofileId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
INSERT INTO `connection` VALUES (5,2),(28,2),(2,5),(5,6),(25,6),(26,6),(27,6),(28,6);
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contains` (
  `universityName` varchar(40) NOT NULL,
  `facultyName` varchar(40) NOT NULL,
  PRIMARY KEY (`universityName`,`facultyName`),
  KEY `fk_University_has_Faculty_Faculty1` (`facultyName`),
  KEY `fk_University_has_Faculty_University1` (`universityName`),
  CONSTRAINT `fk_University_has_Faculty_University1` FOREIGN KEY (`universityName`) REFERENCES `university` (`universityName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_University_has_Faculty_Faculty1` FOREIGN KEY (`facultyName`) REFERENCES `faculty` (`facultyName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES ('Istanbul Technical University','Computer and Information Technology'),('Yildiz Technical University','Computer and Information Technology');
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `contentId` int(11) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(45) NOT NULL,
  `contentName` varchar(45) NOT NULL,
  `contentURL` varchar(300) NOT NULL,
  PRIMARY KEY (`contentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'Image','avatar','images/avatar.jpg');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates`
--

DROP TABLE IF EXISTS `creates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creates` (
  `profileId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`projectId`),
  KEY `fk_Profile_has_Project_Project1` (`projectId`),
  KEY `fk_Profile_has_Project_Profile1` (`profileId`),
  CONSTRAINT `fk_Profile_has_Project_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Project_Project1` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates`
--

LOCK TABLES `creates` WRITE;
/*!40000 ALTER TABLE `creates` DISABLE KEYS */;
/*!40000 ALTER TABLE `creates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `deptName` varchar(45) NOT NULL,
  `facultyName` varchar(45) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`deptName`),
  KEY `fk_Department_Faculty1` (`facultyName`),
  KEY `fk_Department_Company1` (`companyName`),
  CONSTRAINT `fk_Department_Faculty1` FOREIGN KEY (`facultyName`) REFERENCES `faculty` (`facultyName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Department_Company1` FOREIGN KEY (`companyName`) REFERENCES `company` (`companyName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `date` date NOT NULL,
  `website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiences` (
  `profileId` int(11) NOT NULL,
  `jobId` int(11) DEFAULT NULL,
  `deptName` varchar(45) DEFAULT NULL,
  `startDate` date NOT NULL,
  `finishDate` date DEFAULT NULL,
  `experienceDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profileId`),
  KEY `fk_Profile_has_Job_Job1` (`jobId`),
  KEY `fk_Profile_has_Job_Profile1` (`profileId`),
  KEY `fk_Experiences_Department1` (`deptName`),
  CONSTRAINT `fk_Profile_has_Job_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Job_Job1` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiences_Department1` FOREIGN KEY (`deptName`) REFERENCES `department` (`deptName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extraemail`
--

DROP TABLE IF EXISTS `extraemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extraemail` (
  `email` varchar(45) NOT NULL,
  `profileId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`email`),
  KEY `fk_ExtraEmail_Profile1` (`profileId`),
  CONSTRAINT `fk_ExtraEmail_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extraemail`
--

LOCK TABLES `extraemail` WRITE;
/*!40000 ALTER TABLE `extraemail` DISABLE KEYS */;
INSERT INTO `extraemail` VALUES ('yigit353@msn.com',2),('yigit353@yahoo.com',2),('hjk',27);
/*!40000 ALTER TABLE `extraemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `facultyName` varchar(40) NOT NULL,
  PRIMARY KEY (`facultyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('Computer and Information Technology');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `fieldName` varchar(45) NOT NULL,
  PRIMARY KEY (`fieldName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
INSERT INTO `field` VALUES ('Biology'),('Computer Science'),('Geometry'),('Physics');
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has` (
  `contentId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`contentId`,`postId`),
  KEY `fk_Has_Post1` (`postId`),
  CONSTRAINT `fk_Has_Content1` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Has_Post1` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `contentId` int(11) NOT NULL,
  `numOfView` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  CONSTRAINT `fk_Image_Content1` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,10);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(45) NOT NULL,
  `jobDescription` varchar(450) NOT NULL,
  `startDate` date NOT NULL,
  `finishDate` date NOT NULL,
  PRIMARY KEY (`jobId`),
  KEY `fk_Job_Company1` (`companyName`),
  CONSTRAINT `fk_Job_Company1` FOREIGN KEY (`companyName`) REFERENCES `company` (`companyName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joins`
--

DROP TABLE IF EXISTS `joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joins` (
  `profileId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`projectId`),
  KEY `fk_Profile_has_Project_Project2` (`projectId`),
  KEY `fk_Profile_has_Project_Profile2` (`profileId`),
  CONSTRAINT `fk_Profile_has_Project_Profile2` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Project_Project2` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joins`
--

LOCK TABLES `joins` WRITE;
/*!40000 ALTER TABLE `joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT '(no title)',
  `message` varchar(500) DEFAULT NULL,
  `sentDate` date NOT NULL,
  `messageRead` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Message','asdsdasd asdasdas adasdasd','2011-12-17',0),(2,'(no title)','asdasd asdashdas asgd asgd ajsgd','2012-10-12',1),(3,'Messd','sadas askdjhad akjshd askjdhaskd jhasdk asjhd aksjhd awkjh askdjhasd ?kjahdksjhd','2013-12-21',0),(4,'(no title)','asdasdasd','2011-12-12',0),(22,'Guzel bir deneme','Mesaj ulasir mi acaba?','2011-12-18',0),(23,NULL,'Bu bir denemedir','2011-12-19',0),(24,'Hello IBM Guy','That\'s waszzzusb','2011-12-19',0),(25,'SADHasdjhaslkdjh','ajdaskjdakjda?skldja?skdj?','2011-12-19',0),(26,'Deneme','asdja?sdjasd','2011-12-19',0),(27,'Deneme','Dedasdjas?kdja?sdjk','2011-12-19',0),(28,'Deneme','asd','2011-12-19',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizes`
--

DROP TABLE IF EXISTS `organizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizes` (
  `profileId` int(11) NOT NULL,
  `competitionId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`competitionId`),
  KEY `fk_Profile_has_Competition_Competition1` (`competitionId`),
  KEY `fk_Profile_has_Competition_Profile1` (`profileId`),
  CONSTRAINT `fk_Profile_has_Competition_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Competition_Competition1` FOREIGN KEY (`competitionId`) REFERENCES `competition` (`competitionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizes`
--

LOCK TABLES `organizes` WRITE;
/*!40000 ALTER TABLE `organizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participates`
--

DROP TABLE IF EXISTS `participates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participates` (
  `profileId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`eventId`),
  KEY `fk_Profile_has_Event_Event2` (`eventId`),
  KEY `fk_Profile_has_Event_Profile2` (`profileId`),
  CONSTRAINT `fk_Profile_has_Event_Profile2` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Event_Event2` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participates`
--

LOCK TABLES `participates` WRITE;
/*!40000 ALTER TABLE `participates` DISABLE KEYS */;
/*!40000 ALTER TABLE `participates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `universityName` varchar(40) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`personId`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Person_University1` (`universityName`),
  KEY `fk_Person_Company1` (`companyName`),
  CONSTRAINT `fk_Person_University1` FOREIGN KEY (`universityName`) REFERENCES `university` (`universityName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Company1` FOREIGN KEY (`companyName`) REFERENCES `company` (`companyName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Yigit Bekir','Kaya','019910','kayayig@itu.edu.tr','Istanbul Technical University',NULL),(3,'Yidiz','SSS','123123','sds@yildiz.edu.tr','Yildiz Technical University',NULL),(4,'Someguy','FromIBM','12312344','some@ibm.com',NULL,'IBM'),(5,'vcvxv','xcvxcv','sfsdfsdf','fsfsdfdf','Istanbul Technical University',NULL),(6,'Hasan','Mallow','inanma','gh@sd.com','Yildiz Technical University',NULL),(7,'Deneme','denene','asdasds sad','kayayi2g@itu.edu.tr','Yildiz Technical University',NULL),(8,'asd','asd','adad','asdasd','Istanbul Technical University',NULL),(9,'d','s','d','a','Istanbul Technical University',NULL),(10,'ds','sd','asd','asd','Istanbul Technical University',NULL),(11,'fdg','dfg','dfg','dfg','Istanbul Technical University',NULL),(13,'asd','asd','asdasd','asdasdasd','Istanbul Technical University',NULL),(14,'asd','asd','asdsd','yeni','Istanbul Technical University',NULL),(15,'1','1','1','1','Yildiz Technical University',NULL),(16,'2','2','2','2','Istanbul Technical University',NULL),(17,'asd','dsd','3424','4','Istanbul Technical University',NULL),(18,'asd','asd','asd','333123','Istanbul Technical University',NULL),(19,'34','24','234234','1234','Istanbul Technical University',NULL),(20,'asd','ad','1sad','22222','Istanbul Technical University',NULL),(21,'ad','asd','123','123123','Istanbul Technical University',NULL),(22,'asd','asd','asd','ykjjshnkdjfhksdjfnk','Istanbul Technical University',NULL),(24,'asdas','sadasd','asdasd','adadsd','Istanbul Technical University',NULL),(25,'3','3','333','3','Istanbul Technical University',NULL),(26,'9','9','9','9','Istanbul Technical University',NULL),(27,'8','8','8','8','Istanbul Technical University',NULL),(28,'5','5','15','5','Yildiz Technical University',NULL),(29,'6','6','16','6','Yildiz Technical University',NULL),(31,'213','123','123','1231233123','Istanbul Technical University',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(45) NOT NULL,
  `profileId` int(11) NOT NULL,
  `postTitle` varchar(45) DEFAULT '(no title)',
  `postText` varchar(5000) DEFAULT NULL,
  `postDate` date NOT NULL,
  PRIMARY KEY (`postId`),
  KEY `fk_Post_Subject1` (`subjectName`),
  KEY `fk_Post_Profile1` (`profileId`),
  CONSTRAINT `fk_Post_Subject1` FOREIGN KEY (`subjectName`) REFERENCES `subject` (`subjectName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Post_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Relational Algebra',2,'(no title)','asdasdasdasd','2011-12-18'),(2,'Relational Algebra',2,'asds','adasdadasdas','2011-12-18');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentation`
--

DROP TABLE IF EXISTS `presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentation` (
  `contentId` int(11) NOT NULL,
  `numOfSlides` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  CONSTRAINT `fk_Presentation_Content1` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentation`
--

LOCK TABLES `presentation` WRITE;
/*!40000 ALTER TABLE `presentation` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `birthDate` date DEFAULT NULL,
  `personId` int(11) NOT NULL,
  `contentId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`),
  KEY `fk_Profile_Person` (`personId`),
  KEY `fk_Profile_Image1` (`contentId`),
  CONSTRAINT `fk_Profile_Person` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_Image1` FOREIGN KEY (`contentId`) REFERENCES `image` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (2,'1990-05-03',1,1),(5,'1994-12-23',3,1),(6,'1970-02-23',4,1),(19,NULL,20,1),(20,NULL,21,1),(21,NULL,22,1),(22,'1990-05-03',24,1),(23,NULL,25,1),(24,NULL,26,1),(25,NULL,27,1),(26,NULL,28,1),(27,'1234-02-12',29,1),(28,'1990-04-03',31,1);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projectId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(450) NOT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (0,'sdf','sdfsdf','1990-12-12');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication` (
  `contentId` int(11) NOT NULL,
  `numOfCitation` int(11) DEFAULT NULL,
  `numOfReading` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  KEY `fk_Publication_Content1` (`contentId`),
  CONSTRAINT `fk_Publication_Content1` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishes`
--

DROP TABLE IF EXISTS `publishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishes` (
  `profileId` int(11) NOT NULL,
  `contentId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`contentId`),
  KEY `fk_Profile_has_Publication_Profile1` (`profileId`),
  KEY `fk_Publishes_Publication1` (`contentId`),
  CONSTRAINT `fk_Profile_has_Publication_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publishes_Publication1` FOREIGN KEY (`contentId`) REFERENCES `publication` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishes`
--

LOCK TABLES `publishes` WRITE;
/*!40000 ALTER TABLE `publishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `publishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receives`
--

DROP TABLE IF EXISTS `receives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receives` (
  `profileId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`messageId`),
  KEY `fk_Profile_has_Message_Message2` (`messageId`),
  KEY `fk_Profile_has_Message_Profile2` (`profileId`),
  CONSTRAINT `fk_Profile_has_Message_Profile2` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Message_Message2` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receives`
--

LOCK TABLES `receives` WRITE;
/*!40000 ALTER TABLE `receives` DISABLE KEYS */;
INSERT INTO `receives` VALUES (2,1),(2,2),(5,22),(5,23),(6,24),(5,25),(5,26),(6,27),(6,28);
/*!40000 ALTER TABLE `receives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward` (
  `rewardId` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` int(11) NOT NULL,
  `competitionId` int(11) NOT NULL,
  `rewardDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rewardId`),
  KEY `fk_Reward_Competes1` (`profileId`,`competitionId`),
  CONSTRAINT `fk_Reward_Competes1` FOREIGN KEY (`profileId`, `competitionId`) REFERENCES `competes` (`profileId`, `competitionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward`
--

LOCK TABLES `reward` WRITE;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
INSERT INTO `reward` VALUES (2,2,1,'1st place'),(3,2,1,'2nd place');
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sends`
--

DROP TABLE IF EXISTS `sends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sends` (
  `profileId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  PRIMARY KEY (`profileId`,`messageId`),
  KEY `fk_Profile_has_Message_Message1` (`messageId`),
  KEY `fk_Profile_has_Message_Profile1` (`profileId`),
  CONSTRAINT `fk_Profile_has_Message_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Message_Message1` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sends`
--

LOCK TABLES `sends` WRITE;
/*!40000 ALTER TABLE `sends` DISABLE KEYS */;
INSERT INTO `sends` VALUES (5,1),(6,2),(2,22),(2,23),(2,24),(2,25),(2,26),(27,27),(28,28);
/*!40000 ALTER TABLE `sends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectName` varchar(45) NOT NULL,
  `fieldName` varchar(45) NOT NULL,
  `profileId` int(11) NOT NULL,
  `subjectDescription` varchar(1000) NOT NULL,
  `hours` int(11) NOT NULL,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`subjectName`),
  KEY `fk_Subject_Field1` (`fieldName`),
  KEY `fk_Subject_Profile1` (`profileId`),
  CONSTRAINT `fk_Subject_Field1` FOREIGN KEY (`fieldName`) REFERENCES `field` (`fieldName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subject_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('Relational Algebra','Computer Science',2,'bla bla bladaa dasdasd a',6,'2011-10-23');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribesto`
--

DROP TABLE IF EXISTS `subscribesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribesto` (
  `profileId` int(11) NOT NULL,
  `subjectName` varchar(45) NOT NULL,
  PRIMARY KEY (`profileId`,`subjectName`),
  KEY `fk_Profile_has_Subject_Subject1` (`subjectName`),
  KEY `fk_Profile_has_Subject_Profile1` (`profileId`),
  CONSTRAINT `fk_Profile_has_Subject_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_Subject_Subject1` FOREIGN KEY (`subjectName`) REFERENCES `subject` (`subjectName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribesto`
--

LOCK TABLES `subscribesto` WRITE;
/*!40000 ALTER TABLE `subscribesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `university` (
  `universityName` varchar(40) NOT NULL,
  `universityWebsite` varchar(100) DEFAULT NULL,
  `universityAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`universityName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES ('Istanbul Technical University','www.itu.edu.tr',''),('Yildiz Technical University','www.yildiz.edu.tr','');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `contentId` int(11) NOT NULL,
  `numOfWatching` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  KEY `fk_Video_Content1` (`contentId`),
  CONSTRAINT `fk_Video_Content1` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website` (
  `website` varchar(45) NOT NULL,
  `profileId` int(11) NOT NULL,
  PRIMARY KEY (`website`,`profileId`),
  KEY `fk_Website_Profile1` (`profileId`),
  CONSTRAINT `fk_Website_Profile1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES ('darklordofsoftware.blogspot.com',2),('www.dasd',2),('www.web.itu.edu.tr/kayayig',2),('asd',27),('da',27),('gf',27);
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-12-20  1:31:09
