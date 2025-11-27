/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: projekt_db
-- ------------------------------------------------------
-- Server version	11.8.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendees` (
  `AttendeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(150) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AttendeeID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendees`
--

LOCK TABLES `attendees` WRITE;
/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `attendees` VALUES
(1,'Ali Ahmad','ali@example.com','2025-11-24 09:51:17'),
(2,'Anna Svensson','anna@example.com','2025-11-24 09:51:17'),
(3,'Jon Doe','jon@example.com','2025-11-24 09:51:17'),
(4,'Sara Lindgren','sara@example.com','2025-11-24 10:07:35'),
(5,'Mikael Karlsson','mikael@example.com','2025-11-24 10:07:35');
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `eventregistrations`
--

DROP TABLE IF EXISTS `eventregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventregistrations` (
  `RegistrationID` int(11) NOT NULL AUTO_INCREMENT,
  `EventID` int(11) NOT NULL,
  `AttendeeID` int(11) NOT NULL,
  `TicketID` int(11) DEFAULT NULL,
  `RegisteredAt` timestamp NULL DEFAULT current_timestamp(),
  `Status` varchar(30) DEFAULT 'registered',
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `uniq_event_attendee` (`EventID`,`AttendeeID`),
  KEY `TicketID` (`TicketID`),
  KEY `idx_reg_event` (`EventID`),
  KEY `idx_reg_attendee` (`AttendeeID`),
  CONSTRAINT `eventregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`) ON DELETE CASCADE,
  CONSTRAINT `eventregistrations_ibfk_2` FOREIGN KEY (`AttendeeID`) REFERENCES `attendees` (`AttendeeID`) ON DELETE CASCADE,
  CONSTRAINT `eventregistrations_ibfk_3` FOREIGN KEY (`TicketID`) REFERENCES `tickets` (`TicketID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventregistrations`
--

LOCK TABLES `eventregistrations` WRITE;
/*!40000 ALTER TABLE `eventregistrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `eventregistrations` VALUES
(1,1,1,1,'2025-11-24 09:51:25','registered'),
(2,1,2,2,'2025-11-24 09:51:25','registered'),
(3,2,3,3,'2025-11-24 09:51:25','registered'),
(7,2,1,3,'2025-11-24 10:07:45','registered'),
(8,1,4,5,'2025-11-24 10:07:45','registered');
/*!40000 ALTER TABLE `eventregistrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `EventID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `idx_events_startdate` (`StartDate`),
  KEY `idx_events_location` (`LocationID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`LocationID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `events` VALUES
(1,'Intro to Databases','2025-12-01','2025-12-01',1,'A basic introduction to SQL and databases.'),
(2,'DevOps Conference','2026-01-20','2026-01-22',2,'Three-day conference focused on DevOps.');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `locations` VALUES
(1,'Main Hall','Storgatan 1','Stockholm','11122'),
(2,'Conference Center','Mäster Samuelsgatan 10','Stockholm','11157');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `TicketID` int(11) NOT NULL AUTO_INCREMENT,
  `EventID` int(11) NOT NULL,
  `Type` varchar(80) NOT NULL,
  `Price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `QuantityAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  UNIQUE KEY `uniq_event_ticket_type` (`EventID`,`Type`),
  KEY `idx_tickets_event` (`EventID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tickets` VALUES
(1,1,'Standard',100.00,100),
(2,1,'Student',50.00,50),
(3,2,'Standard',350.00,300),
(4,2,'VIP',800.00,20),
(5,1,'EarlyBird',80.00,20);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-24 15:31:40
