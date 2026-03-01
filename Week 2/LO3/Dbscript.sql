-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab2_task
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `StudentRegNo` varchar(15) DEFAULT NULL,
  `Course_ID` varchar(10) DEFAULT NULL,
  `TimeStamp` datetime NOT NULL,
  `Status` tinyint(1) NOT NULL,
  KEY `StudentRegNo` (`StudentRegNo`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`StudentRegNo`) REFERENCES `student` (`RegistrationNumber`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('2023-CS-01','CS202','2023-10-25 09:00:00',1),('2023-CS-45','CS202','2023-10-25 09:05:00',1),('2023-EE-12','EE101','2023-10-25 11:00:00',0),('2023-CS-01','CS101','2023-10-26 10:00:00',1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_ID` varchar(10) NOT NULL,
  `Course_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CS101','Programming Fundamentals'),('CS202','Database Systems'),('EE101','Basic Electronics');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `StudentRegNo` varchar(15) DEFAULT NULL,
  `Course_ID` varchar(10) DEFAULT NULL,
  KEY `StudentRegNo` (`StudentRegNo`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentRegNo`) REFERENCES `student` (`RegistrationNumber`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES ('2023-CS-01','CS202'),('2023-CS-45','CS202'),('2023-EE-12','EE101'),('2023-CS-01','CS101');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `RegistrationNumber` varchar(15) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Department` varchar(50) NOT NULL,
  `Session` int NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RegistrationNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1','ali','comp',2023,'Address'),('2023-CS-01','Muhammad Ahmed','CS',2023,'Hno 45, Street 3, Model Town'),('2023-CS-45','Ali Hamza','CS',2023,'Gulberg 3, Near Main Market'),('2023-EE-12','Bilal Khan','EE',2023,'Johar Town, Block J'),('2023-ME-05','Zainab Bibi','ME',2023,'Wapda Town, Phase 1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-01 23:39:23
