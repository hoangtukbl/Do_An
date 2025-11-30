CREATE DATABASE  IF NOT EXISTS `smarthome` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smarthome`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: smarthome
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `auditlogs`
--

DROP TABLE IF EXISTS `auditlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlogs` (
  `LogID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã log',
  `UserID` bigint unsigned DEFAULT NULL COMMENT 'Người thực hiện hành động',
  `Action` varchar(100) NOT NULL COMMENT 'Tên hành động',
  `Details` text COMMENT 'Chi tiết hành động',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ ghi log',
  `Flag` enum('Normal','SuspiciousChat','SuspiciousMeeting','OutsideDeal','SuspiciousPattern') DEFAULT 'Normal',
  PRIMARY KEY (`LogID`),
  KEY `idx_audit_user` (`UserID`),
  KEY `idx_audit_action` (`Action`),
  CONSTRAINT `auditlogs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlogs`
--

LOCK TABLES `auditlogs` WRITE;
/*!40000 ALTER TABLE `auditlogs` DISABLE KEYS */;
INSERT INTO `auditlogs` VALUES (1,400,'Thêm nhà yêu thích','Ms. Beulah Lindgren - Thêm nhà yêu thích lúc 13:20:00 21/11/2025','2025-11-21 13:20:00','SuspiciousChat'),(2,416,'Đăng nhập hệ thống','Benjamin Turner - Đăng nhập hệ thống lúc 17:40:00 21/11/2025','2025-11-21 17:40:00','Normal'),(3,361,'Thay đổi mật khẩu','Mr. Andrew Harris Sr. - Thay đổi mật khẩu lúc 19:19:00 21/11/2025','2025-11-21 19:19:00','Normal'),(4,429,'Đăng nhập hệ thống','Salvatore Reynolds - Đăng nhập hệ thống lúc 23:10:00 21/11/2025','2025-11-21 23:10:00','Normal'),(5,342,'Tạo giao dịch mua nhà','Tabitha Goodwin IV - Tạo giao dịch mua nhà lúc 13:36:00 21/11/2025','2025-11-21 13:36:00','Normal'),(6,407,'Tạo bài đăng bán nhà mới','Penny Waelchi - Tạo bài đăng bán nhà mới lúc 06:04:00 22/11/2025','2025-11-22 06:04:00','Normal'),(7,344,'Tạo giao dịch mua nhà','Kenny Gutmann - Tạo giao dịch mua nhà lúc 11:26:00 22/11/2025','2025-11-22 11:26:00','Normal'),(8,416,'Đăng nhập hệ thống','Benjamin Turner - Đăng nhập hệ thống lúc 08:50:00 22/11/2025','2025-11-22 08:50:00','Normal'),(9,327,'Cập nhật thông tin cá nhân','Mr. Garry Hayes MD - Cập nhật thông tin cá nhân lúc 19:08:00 22/11/2025','2025-11-22 19:08:00','SuspiciousChat'),(10,466,'Tạo bài đăng bán nhà mới','Whitney Franey - Tạo bài đăng bán nhà mới lúc 14:13:00 22/11/2025','2025-11-22 14:13:00','Normal'),(11,471,'Tạo giao dịch mua nhà','Mae Balistreri - Tạo giao dịch mua nhà lúc 08:08:00 22/11/2025','2025-11-22 08:08:00','Normal'),(12,490,'Bảo trì hệ thống','Essie Reynolds - Bảo trì hệ thống lúc 10:12:00 22/11/2025','2025-11-22 10:12:00','Normal'),(13,489,'Đăng xuất khỏi hệ thống','Willie Sawayn - Đăng xuất khỏi hệ thống lúc 18:53:00 22/11/2025','2025-11-22 18:53:00','Normal'),(14,427,'Tìm kiếm nhà','Mrs. Blanca Pollich - Tìm kiếm nhà lúc 08:49:00 22/11/2025','2025-11-22 08:49:00','Normal'),(15,368,'Cập nhật thông tin cá nhân','Oliver Mayer - Cập nhật thông tin cá nhân lúc 13:33:00 23/11/2025','2025-11-23 13:33:00','Normal'),(16,478,'Cập nhật thông tin nhà','Lamar Weber - Cập nhật thông tin nhà lúc 07:29:00 23/11/2025','2025-11-23 07:29:00','Normal'),(17,345,'Tạo giao dịch mua nhà','Van Shanahan PhD - Tạo giao dịch mua nhà lúc 06:40:00 23/11/2025','2025-11-23 06:40:00','Normal'),(18,479,'Cập nhật thông tin cá nhân','Lionel Ryan - Cập nhật thông tin cá nhân lúc 12:11:00 23/11/2025','2025-11-23 12:11:00','Normal'),(19,400,'Thay đổi mật khẩu','Ms. Beulah Lindgren - Thay đổi mật khẩu lúc 16:49:00 23/11/2025','2025-11-23 16:49:00','Normal'),(20,470,'Bảo trì hệ thống','Myron Balistreri - Bảo trì hệ thống lúc 14:29:00 23/11/2025','2025-11-23 14:29:00','Normal'),(21,333,'Đăng nhập thất bại','Lindsey Kris - Đăng nhập thất bại lúc 13:08:00 23/11/2025','2025-11-23 13:08:00','Normal'),(22,452,'Liên hệ người bán','Nancy Gottlieb Sr. - Liên hệ người bán lúc 06:21:00 23/11/2025','2025-11-23 06:21:00','Normal'),(23,512,'Cập nhật thông tin nhà','Howard Johnson - Cập nhật thông tin nhà lúc 11:16:00 23/11/2025','2025-11-23 11:16:00','Normal'),(24,365,'Đăng nhập hệ thống','Joanne Lindgren - Đăng nhập hệ thống lúc 06:39:00 23/11/2025','2025-11-23 06:39:00','Normal'),(25,353,'Cập nhật thông tin cá nhân','Maryann Cartwright - Cập nhật thông tin cá nhân lúc 18:57:00 23/11/2025','2025-11-23 18:57:00','Normal'),(26,431,'Tìm kiếm nhà','Megan Kertzmann - Tìm kiếm nhà lúc 17:58:00 23/11/2025','2025-11-23 17:58:00','Normal'),(27,366,'Đăng nhập thất bại','Kim Tillman DDS - Đăng nhập thất bại lúc 14:38:00 24/11/2025','2025-11-24 14:38:00','Normal'),(28,345,'Tạo bài đăng bán nhà mới','Van Shanahan PhD - Tạo bài đăng bán nhà mới lúc 08:45:00 24/11/2025','2025-11-24 08:45:00','Normal'),(29,410,'Xác thực email','Mack Gleason - Xác thực email lúc 19:16:00 24/11/2025','2025-11-24 19:16:00','Normal'),(30,416,'Thêm nhà yêu thích','Benjamin Turner - Thêm nhà yêu thích lúc 14:14:00 24/11/2025','2025-11-24 14:14:00','Normal'),(31,333,'Đăng nhập thất bại','Lindsey Kris - Đăng nhập thất bại lúc 22:41:00 24/11/2025','2025-11-24 22:41:00','Normal'),(32,482,'Liên hệ người bán','Lynn Metz - Liên hệ người bán lúc 19:47:00 24/11/2025','2025-11-24 19:47:00','Normal'),(33,427,'Xem chi tiết nhà','Mrs. Blanca Pollich - Xem chi tiết nhà lúc 22:12:00 24/11/2025','2025-11-24 22:12:00','Normal'),(34,361,'Tài khoản bị khóa','Mr. Andrew Harris Sr. - Tài khoản bị khóa lúc 06:46:00 24/11/2025','2025-11-24 06:46:00','SuspiciousChat'),(35,474,'Xác thực email','Marvin Greenholt - Xác thực email lúc 13:16:00 25/11/2025','2025-11-25 13:16:00','SuspiciousChat'),(36,484,'Tạo giao dịch mua nhà','Dawn Farrell - Tạo giao dịch mua nhà lúc 11:45:00 25/11/2025','2025-11-25 11:45:00','SuspiciousChat'),(37,409,'Bảo trì hệ thống','Miss Viola Flatley - Bảo trì hệ thống lúc 20:47:00 25/11/2025','2025-11-25 20:47:00','Normal'),(38,503,'Thêm nhà yêu thích','Lorene Gutkowski - Thêm nhà yêu thích lúc 15:38:00 25/11/2025','2025-11-25 15:38:00','Normal'),(39,430,'Bảo trì hệ thống','Lillian Pfeffer - Bảo trì hệ thống lúc 07:05:00 25/11/2025','2025-11-25 07:05:00','Normal'),(40,503,'Xem chi tiết nhà','Lorene Gutkowski - Xem chi tiết nhà lúc 22:44:00 25/11/2025','2025-11-25 22:44:00','SuspiciousChat'),(41,415,'Đăng xuất khỏi hệ thống','Dr. Juan Schultz DVM - Đăng xuất khỏi hệ thống lúc 21:27:00 25/11/2025','2025-11-25 21:27:00','Normal'),(42,438,'Thêm nhà yêu thích','Mr. Martin Dicki-Cormier - Thêm nhà yêu thích lúc 22:48:00 25/11/2025','2025-11-25 22:48:00','Normal'),(43,429,'Thêm nhà yêu thích','Salvatore Reynolds - Thêm nhà yêu thích lúc 08:32:00 25/11/2025','2025-11-25 08:32:00','SuspiciousChat'),(44,344,'Cập nhật thông tin nhà','Kenny Gutmann - Cập nhật thông tin nhà lúc 22:46:00 25/11/2025','2025-11-25 22:46:00','Normal'),(45,516,'Bảo trì hệ thống','Mr. Mario O\'Kon - Bảo trì hệ thống lúc 14:55:00 25/11/2025','2025-11-25 14:55:00','Normal'),(46,358,'Xác thực email','Olivia Hegmann - Xác thực email lúc 19:37:00 25/11/2025','2025-11-25 19:37:00','Normal'),(47,431,'Bảo trì hệ thống','Megan Kertzmann - Bảo trì hệ thống lúc 11:44:00 26/11/2025','2025-11-26 11:44:00','Normal'),(48,429,'Cập nhật thông tin cá nhân','Salvatore Reynolds - Cập nhật thông tin cá nhân lúc 17:45:00 26/11/2025','2025-11-26 17:45:00','Normal'),(49,419,'Liên hệ người bán','Ms. Delores Lindgren - Liên hệ người bán lúc 16:52:00 26/11/2025','2025-11-26 16:52:00','Normal'),(50,441,'Liên hệ người bán','Floyd Mueller - Liên hệ người bán lúc 07:18:00 26/11/2025','2025-11-26 07:18:00','SuspiciousChat'),(51,415,'Tài khoản bị khóa','Dr. Juan Schultz DVM - Tài khoản bị khóa lúc 17:02:00 26/11/2025','2025-11-26 17:02:00','Normal'),(52,343,'Xem chi tiết nhà','Micheal Gutkowski - Xem chi tiết nhà lúc 22:15:00 27/11/2025','2025-11-27 22:15:00','Normal'),(53,362,'Xem chi tiết nhà','Clark Friesen - Xem chi tiết nhà lúc 08:23:00 27/11/2025','2025-11-27 08:23:00','SuspiciousChat'),(54,353,'Xem chi tiết nhà','Maryann Cartwright - Xem chi tiết nhà lúc 22:39:00 27/11/2025','2025-11-27 22:39:00','Normal'),(55,355,'Tạo bài đăng bán nhà mới','Alvin Koch - Tạo bài đăng bán nhà mới lúc 20:31:00 27/11/2025','2025-11-27 20:31:00','Normal'),(56,392,'Đăng xuất khỏi hệ thống','Dr. Jan Breitenberg - Đăng xuất khỏi hệ thống lúc 11:10:00 27/11/2025','2025-11-27 11:10:00','SuspiciousChat');
/*!40000 ALTER TABLE `auditlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biometricdata`
--

DROP TABLE IF EXISTS `biometricdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biometricdata` (
  `BiometricID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã sinh trắc học',
  `UserID` bigint unsigned NOT NULL COMMENT 'Người dùng sở hữu dữ liệu',
  `BiometricType` enum('Face','Fingerprint') DEFAULT NULL COMMENT 'Loại sinh trắc học',
  `BiometricHash` varchar(255) NOT NULL COMMENT 'Hash dữ liệu sinh trắc học',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ tạo',
  PRIMARY KEY (`BiometricID`),
  KEY `idx_bio_user` (`UserID`),
  CONSTRAINT `biometricdata_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biometricdata`
--

LOCK TABLES `biometricdata` WRITE;
/*!40000 ALTER TABLE `biometricdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `biometricdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizens_mock`
--

DROP TABLE IF EXISTS `citizens_mock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizens_mock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizen_id` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_of_origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Nam','Nữ') COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_id` (`citizen_id`),
  KEY `idx_citizen_id` (`citizen_id`),
  KEY `idx_full_name` (`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizens_mock`
--

LOCK TABLES `citizens_mock` WRITE;
/*!40000 ALTER TABLE `citizens_mock` DISABLE KEYS */;
INSERT INTO `citizens_mock` VALUES (1,'001234567890','Nguyễn Văn An','1990-05-15','123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, TP.HCM','TP. Hồ Chí Minh','Nam','2020-01-15','2030-01-15','2025-11-25 17:18:51','2025-11-25 17:18:51'),(2,'001234567891','Trần Thị Bình','1985-08-22','456 Đường Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP.HCM','Hà Nội','Nữ','2019-03-10','2029-03-10','2025-11-25 17:18:51','2025-11-25 17:18:51'),(3,'001234567892','Lê Văn Cường','1992-12-03','789 Đường Pasteur, Phường 6, Quận 3, TP.HCM','Đà Nẵng','Nam','2021-06-20','2031-06-20','2025-11-25 17:18:51','2025-11-25 17:18:51'),(4,'001234567893','Phạm Thị Dung','1988-03-17','321 Đường Cách Mạng Tháng 8, Phường 10, Quận 3, TP.HCM','Cần Thơ','Nữ','2020-09-05','2030-09-05','2025-11-25 17:18:51','2025-11-25 17:18:51'),(5,'001234567894','Hoàng Văn Em','1995-07-28','654 Đường Võ Văn Tần, Phường 6, Quận 3, TP.HCM','Hải Phòng','Nam','2022-02-14','2032-02-14','2025-11-25 17:18:51','2025-11-25 17:18:51'),(6,'staff1234567','Nguyễn Thị Staff Demo','1990-01-01','999 Đường Staff, Phường Demo, Quận Test, TP.HCM','TP. Hồ Chí Minh','Nữ','2020-01-01','2030-01-01','2025-11-25 17:18:51','2025-11-25 17:18:51');
/*!40000 ALTER TABLE `citizens_mock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commissions` (
  `CommissionID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint unsigned NOT NULL,
  `CommissionRate` decimal(5,2) NOT NULL,
  `CommissionAmount` decimal(18,2) NOT NULL,
  `PaidAt` timestamp NULL DEFAULT NULL,
  `IsDeducted` tinyint(1) DEFAULT '0' COMMENT 'Đã khấu trừ phí sàn khi giải ngân chưa',
  PRIMARY KEY (`CommissionID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `commissions_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactions` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `ContractID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã hợp đồng',
  `TransactionID` bigint unsigned DEFAULT NULL,
  `ContractContent` text NOT NULL COMMENT 'Nội dung hợp đồng',
  `SignedAt` timestamp NULL DEFAULT NULL COMMENT 'Ngày giờ ký cuối cùng',
  `Status` enum('Sent','BuyerSigned','AdminSigned','Completed','Cancelled') NOT NULL DEFAULT 'Sent',
  `ContractType` enum('Deposit','Sale','SellerUpgrade') NOT NULL DEFAULT 'Deposit',
  PRIMARY KEY (`ContractID`),
  KEY `idx_contracts_trans` (`TransactionID`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactions` (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractsignatures`
--

DROP TABLE IF EXISTS `contractsignatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractsignatures` (
  `SignatureID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã chữ ký',
  `ContractID` bigint unsigned NOT NULL COMMENT 'Hợp đồng được ký',
  `UserID` bigint unsigned NOT NULL COMMENT 'Người ký hợp đồng',
  `CertificateID` bigint unsigned NOT NULL COMMENT 'Chứng thư số dùng để ký',
  `SignatureHash` varchar(255) NOT NULL COMMENT 'Hash chữ ký số',
  `SignedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm ký',
  `TargetType` enum('Contract','UserDocument','OwnershipDocument') NOT NULL DEFAULT 'Contract',
  `TargetID` bigint unsigned DEFAULT NULL COMMENT 'ID của Contract/UserDocument/OwnershipDocument tuong ung',
  `SignedData` text COMMENT 'Dữ liệu gốc hoặc input hash đã ký',
  `VerifiedStatus` enum('Pending','Valid','Invalid') DEFAULT 'Pending' COMMENT 'Kết quả xác minh',
  PRIMARY KEY (`SignatureID`),
  KEY `CertificateID` (`CertificateID`),
  KEY `idx_sign_contract` (`ContractID`),
  KEY `idx_sign_user` (`UserID`),
  CONSTRAINT `contractsignatures_ibfk_1` FOREIGN KEY (`ContractID`) REFERENCES `contracts` (`ContractID`),
  CONSTRAINT `contractsignatures_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `contractsignatures_ibfk_3` FOREIGN KEY (`CertificateID`) REFERENCES `digitalcertificates` (`CertificateID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractsignatures`
--

LOCK TABLES `contractsignatures` WRITE;
/*!40000 ALTER TABLE `contractsignatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractsignatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `ConversationID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Participant1ID` bigint unsigned NOT NULL,
  `Participant2ID` bigint unsigned NOT NULL,
  `LastMessageAt` datetime DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConversationID`),
  UNIQUE KEY `unique_conversation` (`Participant1ID`,`Participant2ID`),
  KEY `idx_participant1` (`Participant1ID`),
  KEY `idx_participant2` (`Participant2ID`),
  CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`Participant1ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`Participant2ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (5,100,200,'2025-11-26 21:39:33','2025-11-26 18:03:31','2025-11-26 21:39:33'),(6,200,201,'2025-11-27 09:02:24','2025-11-27 09:02:24','2025-11-27 09:02:24');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digitalcertificates`
--

DROP TABLE IF EXISTS `digitalcertificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digitalcertificates` (
  `CertificateID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã chứng thư số',
  `UserID` bigint unsigned NOT NULL COMMENT 'Người sở hữu chứng thư',
  `Provider` enum('Viettel-CA','VNPT-CA','FPT-CA') DEFAULT NULL COMMENT 'Nhà cung cấp',
  `SerialNumber` varchar(255) DEFAULT NULL COMMENT 'Số serial chứng thư số',
  `ValidFrom` date DEFAULT NULL COMMENT 'Ngày hiệu lực',
  `ValidTo` date DEFAULT NULL COMMENT 'Ngày hết hạn',
  `Status` enum('Active','Revoked','Expired') NOT NULL DEFAULT 'Active',
  `PublicKey` text COMMENT 'Khóa công khai (PEM)',
  `PrivateKeyEncrypted` text COMMENT 'Khóa bí mật (mã hóa, không giải mã trên DB)',
  PRIMARY KEY (`CertificateID`),
  UNIQUE KEY `SerialNumber` (`SerialNumber`),
  KEY `idx_certs_user` (`UserID`),
  CONSTRAINT `digitalcertificates_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digitalcertificates`
--

LOCK TABLES `digitalcertificates` WRITE;
/*!40000 ALTER TABLE `digitalcertificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `digitalcertificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houseimages`
--

DROP TABLE IF EXISTS `houseimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houseimages` (
  `ImageID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã ảnh',
  `HouseID` bigint unsigned NOT NULL COMMENT 'Nhà liên quan',
  `FileName` varchar(255) DEFAULT NULL COMMENT 'Tên file gốc',
  `CloudPath` varchar(500) DEFAULT NULL COMMENT 'Đường dẫn cloud',
  `IsCover` tinyint(1) DEFAULT '0' COMMENT 'Ảnh đại diện',
  `UploadedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ upload',
  `DriveFileID` varchar(255) DEFAULT NULL COMMENT 'File ID trên Google Drive',
  PRIMARY KEY (`ImageID`),
  KEY `idx_images_house` (`HouseID`),
  KEY `idx_images_cover` (`IsCover`),
  CONSTRAINT `houseimages_ibfk_1` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houseimages`
--

LOCK TABLES `houseimages` WRITE;
/*!40000 ALTER TABLE `houseimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `houseimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houses` (
  `HouseID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã nhà',
  `OwnerID` bigint unsigned NOT NULL COMMENT 'Người sở hữu (tham chiếu Users.UserID)',
  `Title` varchar(200) NOT NULL COMMENT 'Tiêu đề bài đăng bán nhà',
  `Description` text COMMENT 'Mô tả chi tiết về căn nhà',
  `Address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ cụ thể của căn nhà',
  `HouseType` enum('Apartment','Townhouse','Villa','Land','Other') DEFAULT 'Apartment' COMMENT 'Loại nhà',
  `Price` decimal(18,2) NOT NULL COMMENT 'Giá bán của nhà',
  `Bathrooms` int DEFAULT NULL,
  `Bedrooms` int DEFAULT NULL,
  `Area` decimal(10,2) DEFAULT NULL,
  `Status` enum('Available','Pending','Sold') DEFAULT 'Available' COMMENT 'Trạng thái',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ đăng bài',
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DriveFolderID` varchar(255) DEFAULT NULL COMMENT 'ID folder trên Google Drive chứa tất cả ảnh của nhà',
  `Orientation` enum('Đông','Tây','Nam','Bắc','Đông-Bắc','Đông-Nam','Tây-Bắc','Tây-Nam') DEFAULT 'Đông' COMMENT 'Hướng nhà',
  `priority_level` int DEFAULT '1',
  `highlight` tinyint(1) DEFAULT '0',
  `top_priority` tinyint(1) DEFAULT '0',
  `banner_enabled` tinyint(1) DEFAULT '0',
  `verified_seller_badge` tinyint(1) DEFAULT '0',
  `max_cover_media` int DEFAULT '1',
  `video_360_url` varchar(500) DEFAULT NULL,
  `panorama_images` json DEFAULT NULL,
  `last_boosted_at` timestamp NULL DEFAULT NULL,
  `last_auto_refresh_at` timestamp NULL DEFAULT NULL,
  `views_count` int DEFAULT '0',
  `contact_count` int DEFAULT '0',
  `boost_count_today` int DEFAULT '0',
  `last_boost_reset` date DEFAULT NULL,
  `boost_count` int DEFAULT '0',
  `package_type` varchar(20) DEFAULT 'FREE',
  PRIMARY KEY (`HouseID`),
  KEY `idx_houses_owner` (`OwnerID`),
  KEY `idx_houses_type` (`HouseType`),
  KEY `idx_houses_price` (`Price`),
  KEY `idx_houses_status` (`Status`),
  KEY `idx_houses_priority` (`priority_level` DESC,`last_boosted_at` DESC,`updatedAt` DESC),
  KEY `idx_houses_views` (`views_count` DESC),
  KEY `idx_houses_owner_status` (`OwnerID`,`Status`),
  CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `houses_chk_1` CHECK ((`Price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (1000,200,'C??n h??? cao c???p Qu???n 1','Có 5 thiết bị Iot ','123 Nguy???n Hu???, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội','Apartment',5000000000.00,3,2,100.00,'Available','2025-11-26 17:51:57','2025-11-27 08:34:20',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1001,200,'Nh?? ph??? Qu???n 2','Nh?? ph??? 3 t???ng, s??n v?????n r???ng','456 Th???o ??i???n, Q2, TP.HCM','Townhouse',8000000000.00,NULL,NULL,NULL,'Available','2025-11-26 17:51:57','2025-11-27 00:51:57',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1002,201,'Bi???t th??? Qu???n 7','Bi???t th??? sang tr???ng, h??? b??i ri??ng','789 Ph?? M??? H??ng, Q7, TP.HCM','Villa',15000000000.00,NULL,NULL,NULL,'Available','2025-11-26 17:51:57','2025-11-27 00:51:57',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1003,201,'?????t n???n B??nh D????ng','?????t n???n 100m2, v??? tr?? ?????p','Thu???n An, B??nh D????ng','Land',2000000000.00,NULL,NULL,NULL,'Available','2025-11-26 17:51:57','2025-11-27 00:51:57',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1004,200,'okeoke','','Tam Kỳ Đoan Trai, Xã Đỗ Sơn, Huyện Thanh Ba, Tỉnh Phú Thọ','Townhouse',1241939931923.00,NULL,NULL,NULL,'Available','2025-11-27 09:07:41','2025-11-27 09:21:49',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1005,337,'Land Rodger Rapids - Licensed','Aliqua amor vigor comburo voveo temporibus abundans confero. Aliquam callide crebro assumenda ventosus adstringo candidus adulatio ait commodo. Cura depono vallum vilicus viscus bonus ager.\nCelo tamen vitae supellex vel dens universe apparatus templum summisse. Bestia clarus traho omnis utique vomer blandior demonstro. Decretum terebro illum conitor cras ver acervus.','985 Luettgen Union, Emiliestead, Colorado','Land',11384419121.00,2,3,196.00,'Available','2025-09-11 20:43:39','2025-09-11 20:43:39',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1006,335,'Land Howe Motorway - Oriental','Aufero ars tumultus. Adsum patruus altus vilicus nulla tenus. Tergum tempus uterque correptius dolorum.\nNemo adipisci amissio attollo angulus admoveo textus dedico ut commemoro. Ventosus somniculosus natus videlicet talus inventore ars. Talus delibero aut.','3165 Rath Wells, North Liliana, Massachusetts','Land',4591569318.00,3,2,417.00,'Available','2025-08-26 13:01:06','2025-08-26 13:01:06',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1007,297,'Townhouse King Loop - Incredible','Est arcesso saepe decipio comptus maiores acceptus. Confugo sublime comminor triumphus dapifer laboriosam est. Usitas capitulus quae.\nDapifer accusamus vel auxilium vero vilicus concido tantillus cinis. Verecundia vitae sophismata provident consequuntur despecto stabilis quas. Creptio animus delibero crapula adhaero cogito allatus crepusculum cubicularis claro.','42073 Old Lane, South Gillian, Maryland','Townhouse',10322966877.00,3,5,341.00,'Available','2025-07-23 18:31:17','2025-07-23 18:31:17',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1008,204,'Land Ortiz Drives - Fantastic','Quaerat contigo caries textilis stillicidium. Patruus cubicularis amicitia vorago comis et cruciamentum. Odit autem solus sursum corrumpo tondeo ullam armarium vitiosus sulum.\nAt acceptus adhaero ventito aggero repellendus ventosus caterva quaerat. Cubicularis victoria arbor venia voluptatem balbus bestia suscipit minus contigo. Desparatus arceo itaque solum apud arceo casso.','9880 Bonnie Course, Joplin, New York','Land',7557114860.00,4,2,483.00,'Available','2025-08-05 06:06:12','2025-08-05 06:06:12',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1009,228,'Land The Mount - Unbranded','Accendo callide demoror. Cenaculum varius aufero conatus velut balbus vulnero arbitro blandior. Spoliatio aperiam avarus.\nVolva tepesco pel succedo administratio cognomen cunabula considero cena. Virtus similique sub delectatio patruus. Aedificium vulgivagus spoliatio vitiosus via debeo atqui.','89258 Marcelo Course, East Deemouth, South Dakota','Land',8479279594.00,4,4,239.00,'Available','2025-09-15 16:37:48','2025-09-15 16:37:48',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1010,357,'Villa Hettie Forges - Sleek','Torrens saepe capto territo tunc. Optio ara articulus sol vere templum. Ratione auctor depono consuasor crepusculum ait admoneo despecto.\nAmor crepusculum utilis appono eos. Voro video paulatim. Laboriosam denego nulla tener adulescens vulpes creta.','64668 N Washington Avenue, McKenziefort, Colorado','Villa',8205769389.00,2,5,274.00,'Available','2025-11-25 21:09:25','2025-11-25 21:09:25',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1011,236,'Townhouse Prospect Avenue - Fresh','Quos video cariosus velut depraedor. Cibo repellat adversus ducimus. Paens perferendis vinitor.\nDeinde verbum casus. Provident totus vitium vinum rerum sono coepi. Vis eum expedita denuo cupiditate casso denuo bestia.','31115 Welch Highway, Port Beauport, Maine','Townhouse',9028417841.00,3,4,406.00,'Available','2025-07-19 01:19:41','2025-07-19 01:19:41',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1012,303,'Land Manor Gardens - Oriental','Libero suadeo autem usque. Careo cursus arguo vomica. Claro bonus viridis.\nAb colligo synagoga. Admoneo denuncio calculus. Abbas annus aggero aggero.','358 Hickle Ranch, Marcellefort, South Dakota','Land',13782245315.00,3,4,165.00,'Available','2025-09-29 13:22:23','2025-09-29 13:22:23',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1013,267,'Land Dare Route - Practical','Umquam vere comptus. Commodo advenio charisma audacia decretum degenero. Degero vinitor possimus conduco acer damno subvenio statim colligo.\nBis cavus testimonium soleo. Aro pel cur voluptates talus cras corrumpo patrocinor certus. Credo talio atrox tot neque.','1476 Maudie Spring, Utica, Vermont','Land',12031529714.00,1,1,53.00,'Available','2025-08-14 17:11:12','2025-08-14 17:11:12',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1014,361,'Townhouse O\'Reilly Points - Modern','Cicuta tredecim corporis vindico certe tubineus adipisci aer vulgaris utor. Tracto bellum eum sint cunctatio suffragium tot cena super. Tergo tribuo adeo.\nAurum ad terreo. Defero deporto suppono terreo capio tactus voro torrens aduro laborum. Admiratio somniculosus alii vitiosus vester sufficio ocer carus amoveo soleo.','28230 Cassie Forges, Laurinefield, New Mexico','Townhouse',12886479616.00,4,3,457.00,'Available','2025-10-19 11:22:12','2025-10-19 11:22:12',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1015,20,'Townhouse Romaguera Expressway - Incredible','Denique beatus fuga suadeo laudantium adflicto ulciscor vita. Adhuc acceptus voluptatibus suffoco uterque alii fuga hic curtus apto. Spoliatio suadeo creber vorago.\nCopiose amoveo tendo vapulus repudiandae. Derideo admitto angustus antiquus. Accommodo sordeo aliquam exercitationem curso.','32057 Maximo Trace, Crooksview, Wyoming','Townhouse',2793364405.00,1,4,465.00,'Available','2025-11-21 18:49:53','2025-11-21 18:49:53',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1016,236,'Villa Church Avenue - Awesome','Deserunt teneo cena nulla tergum. Ab suscipit videlicet brevis. Amplus tenuis ab statua temeritas distinctio.\nConcido arguo thymbra sodalitas tardus usque assentator ceno. Cimentarius voluptatem valeo suasoria aedificium. Pel vesco sumptus depono sollicito chirographum temporibus.','88641 Annabel Fort, New Jettie, New York','Villa',1907818506.00,3,1,60.00,'Available','2025-11-08 02:50:42','2025-11-08 02:50:42',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1017,202,'Apartment Arlene Camp - Unbranded','Arceo confugo nisi aeger demens. Ulterius aperte voveo. Derideo ars curo vulariter.\nUterque uter ducimus vitae patior coruscus triduana. Comitatus clam thesaurus laudantium similique. Ambulo vociferor cunabula.','53425 Orin Street, Nikolausfield, Maine','Apartment',4376185713.00,2,5,348.00,'Available','2025-07-02 18:56:53','2025-07-02 18:56:53',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1018,269,'Apartment N Market Street - Intelligent','Theca cornu canto vehemens statua certe. Cariosus sonitus arca blanditiis deludo tolero. Amicitia sublime tonsor demulceo tandem decet bestia nesciunt repellat.\nVos antea veritatis. Conservo deludo defero textilis avarus una thesis trepide sub distinctio. Adficio averto defleo tempora aeger crur tertius.','81926 Jacey Manors, Jazmynehaven, Wisconsin','Apartment',4490423831.00,4,1,154.00,'Available','2025-10-19 17:42:39','2025-10-19 17:42:39',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1019,207,'Villa Alfonso Street - Handmade','Qui tabernus vinco animus tero autus voluptates defluo. Tubineus contigo beneficium aperte summopere ambitus accommodo uredo. Casso adfero caveo aperte.\nAcies tandem reiciendis deduco vociferor acervus cuius numquam. Vere audeo voluptas aeger assumenda. Numquam crudelis doloremque perspiciatis.','4216 Caroline Alley, Bothell, North Carolina','Villa',8274083518.00,4,3,210.00,'Available','2025-08-08 11:18:19','2025-08-08 11:18:19',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1020,20,'Land County Line Road - Practical','Occaecati vae vorax corrumpo adeptio. Deinde accusantium theologus spiculum. Temptatio capio convoco.\nPax utilis et ver voluptates adeo. Tertius terebro apostolus copiose ventito. Collum amiculum somnus defaeco voluptates asper.','89703 Emard Lane, Ontario, Pennsylvania','Land',5199185910.00,1,1,174.00,'Available','2025-09-24 20:42:49','2025-09-24 20:42:49',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1021,269,'Apartment Carissa Via - Handmade','Aegrus clamo vulariter amissio corroboro colligo vivo uterque crudelis coadunatio. Ubi perferendis currus cuius aeneus valde. Quibusdam cohors pecto alienus aequitas tredecim.\nTurba uter vitiosus ambulo xiphias. Canonicus appono voluptatibus. Aestas baiulus calamitas pectus color coaegresco itaque suspendo cavus carus.','87320 Dickinson Canyon, West Myrlberg, Nebraska','Apartment',6681041734.00,3,5,362.00,'Available','2025-10-17 10:28:31','2025-10-17 10:28:31',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1022,346,'Land Rodriguez Route - Handcrafted','Adsidue deludo amissio vulgus aro adsum crustulum corrigo astrum. Suffoco uter astrum conturbo ago cohibeo adsidue aequitas ara. Ancilla delinquo viduo vivo timidus volva ceno.\nAperio asperiores ventito depono pecto quos sono quos bestia cernuus. Acer vero desparatus stillicidium. Ustilo repudiandae civitas timidus surgo cruciamentum aeneus vomito absum caterva.','5083 Lincoln Highway, Lake Lillie, Mississippi','Land',9151061824.00,4,2,446.00,'Available','2025-08-07 12:32:45','2025-08-07 12:32:45',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1023,265,'Townhouse Labadie Pines - Unbranded','Blandior veritas concido clarus et vel defessus conturbo ipsum similique. Color xiphias demulceo tandem vere. Angelus peior molestiae surgo iure vomica.\nConvoco patrocinor tantum argentum cubitum deinde. Ademptio nulla neque cruentus. Amitto benevolentia sustineo acceptus perspiciatis.','32500 Nathan Dale, Maudieshire, Idaho','Townhouse',5847062464.00,1,1,284.00,'Available','2025-10-01 19:45:59','2025-10-01 19:45:59',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1024,353,'Land Salma Views - Awesome','Aeneus cultellus asperiores fuga. Tandem molestias damno vesper. Crepusculum adulescens ustulo.\nThesis uter sonitus cohors verumtamen sed deputo spiculum villa. Vulnero neque verecundia thorax alioqui quasi templum suus. Una adulescens adflicto admoveo non absconditus eum.','7752 Sawayn Centers, Timmystad, Wyoming','Land',4063961509.00,2,1,238.00,'Available','2025-11-16 22:03:35','2025-11-16 22:03:35',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1025,294,'Townhouse Amani Loop - Soft','Video necessitatibus deleo animadverto caste cursim xiphias damno aer desino. Decimus id ratione administratio votum strues territo et somniculosus. Derideo spargo ocer iste tondeo cubo thesaurus.\nCetera debeo arcesso demo ocer supellex careo ratione credo. Conservo spargo odit quas atrox clementia suscipio adfero vox. Sublime aequus usus solitudo caterva.','57982 W 9th Street, Schimmelhaven, California','Townhouse',14067545801.00,4,3,162.00,'Available','2025-07-05 15:00:21','2025-07-05 15:00:21',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1026,265,'Villa Albina Row - Luxurious','Commemoro demo crux. Somnus supra non. Viriliter altus corrigo alii audentia currus vix.\nTaceo aspicio crebro vehemens abduco bis cibo admoneo carmen vitiosus. Cupiditas conventus audacia cavus eveniet alius supra amitto. Decerno convoco utique adstringo sophismata coerceo cariosus defendo.','1975 Bruce Estates, Rennerboro, Mississippi','Villa',8600026663.00,4,1,101.00,'Available','2025-08-24 17:28:23','2025-08-24 17:28:23',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1027,412,'Townhouse Thiel Crossroad - Rustic','Socius adipiscor venio eum corona bonus sono quos. Ipsum depromo confero conforto deduco conitor ciminatio commemoro id. Aedificium acervus crepusculum compello.\nAutus compello vir cado. Quidem clibanus amplitudo libero derideo speculum doloribus. Odio pecus sponte vulgaris aliquam.','5711 Green Dale, Lake Idellchester, Michigan','Townhouse',6714067335.00,1,4,403.00,'Available','2025-09-30 16:00:50','2025-09-30 16:00:50',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1028,202,'Townhouse W Central Avenue - Gorgeous','Explicabo cunctatio vester abscido tactus similique viscus corrumpo tabella spes. Patruus capitulus acervus cribro utor sumo clementia. Sono carpo ascisco acidus.\nCensura credo ait crur subnecto abeo. Aperio communis suus. Clamo comptus ara animadverto cenaculum deinde adduco creo attollo sollers.','5435 Crown Street, Fort Sheaview, Florida','Townhouse',811743848.00,3,3,406.00,'Available','2025-07-22 08:17:39','2025-07-22 08:17:39',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1029,381,'Land Sycamore Close - Refined','Crebro vilis bellum subvenio admoneo cras debeo. Vilis vigilo sordeo tantillus trado omnis benigne celer clibanus. Pauper inflammatio apparatus tumultus caelestis.\nVelum error patria desino. Expedita una ultio soluta inventore est modi thymum calcar cohaero. Concido aequus animadverto.','39563 N Chestnut Street, Clifton, Wisconsin','Land',12444844393.00,4,4,264.00,'Available','2025-07-28 04:52:13','2025-07-28 04:52:13',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1030,337,'Townhouse Dessie Causeway - Oriental','Aeneus pecto villa adhuc solutio ademptio porro. Alius impedit ut animi quo tremo umerus angustus tenuis comes. Vos necessitatibus advoco.\nDefendo caute comminor textus comes temeritas. Curriculum alter cognomen comes avaritia assumenda cariosus aro uter abeo. Spes canonicus solio in summopere.','651 Piper Lights, New Carole, Texas','Townhouse',778312396.00,3,5,395.00,'Available','2025-08-02 15:09:33','2025-08-02 15:09:33',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1031,343,'Villa Kristy Ridges - Sleek','Tabella ducimus adsum. Deleniti depulso sophismata stella vorago vicinus uter. Aeneus defero abstergo assentator tumultus cometes conculco.\nCreta ullus velut. Sum patruus patior thymum tertius bardus spiritus damno. Aestas suffragium cervus textilis varius cogo peior.','1948 Willow Close, Cassietown, Wyoming','Villa',11484453185.00,4,3,34.00,'Available','2025-11-03 01:01:22','2025-11-03 01:01:22',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1032,286,'Townhouse Lueilwitz Spurs - Licensed','Argumentum angustus deficio ventosus aliquid aqua ustulo hic. Tener curso arguo capitulus amiculum coniuratio vociferor. Solio ventus abutor talis attollo stillicidium iure molestiae comes.\nDesino tubineus adipisci cunae voro sto attonbitus. Deserunt vomito iusto arto neque. Baiulus tabesco cinis terreo verbera caelestis crapula totam angustus.','7087 Rose Mountain, Wellington, Michigan','Townhouse',4211542519.00,2,4,475.00,'Available','2025-09-20 18:32:01','2025-09-20 18:32:01',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1033,280,'Apartment W Main - Sleek','Coaegresco suscipit depono tamdiu. Templum tremo conicio adficio id depromo. Aestas traho utrimque collum alienus.\nSubseco vespillo defero vaco utor ipsa derideo commemoro amita ultra. Valens averto quidem carpo aperte succurro aranea substantia voluptatem. Comes eligendi absque.','7351 Laburnum Grove, Alycefurt, Florida','Apartment',8573499322.00,2,5,398.00,'Available','2025-08-06 01:13:44','2025-08-06 01:13:44',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1034,297,'Land Coronation Avenue - Fantastic','Comprehendo decretum tergiversatio absens repellat. Cunctatio artificiose surculus accedo cognatus theologus supellex. Curia unus thymum.\nTriumphus consequuntur centum tamisium caritas. Video claustrum expedita consuasor audax cogo nesciunt distinctio. Repellendus doloribus carmen vesco uredo culpo nesciunt auxilium articulus.','573 Jason Trafficway, Rochester Hills, New Jersey','Land',4547501941.00,2,3,439.00,'Available','2025-09-11 16:14:54','2025-09-11 16:14:54',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1035,280,'Townhouse Borer Green - Oriental','Tunc illo suus cognomen bardus synagoga audeo territo vero. Tondeo soleo vinco asper. Nostrum vulnus thesaurus quas supplanto tersus.\nTepesco callide canonicus acies iste inventore benevolentia undique incidunt congregatio. Atqui crur admoneo tui eos callide in optio. Quibusdam recusandae amor tenax alveus terminatio spoliatio deinde amita.','79136 Skylar Common, St. Joseph, New Jersey','Townhouse',8197152766.00,1,5,315.00,'Available','2025-08-05 04:34:49','2025-08-05 04:34:49',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1036,412,'Villa Tommie Glen - Incredible','Voluptatem sursum crux vitiosus cogo fugiat paens vestigium soluta cunctatio. Cum contabesco cervus complectus volva. Corrupti dicta aer substantia vito cupiditate vulgivagus demoror alienus.\nDolor stillicidium caput dolorem cubo. Vetus apto caput caelum quo. Quibusdam canonicus utilis vomer mollitia.','10287 Gleason Alley, West Dennisstead, Oregon','Villa',9602739559.00,3,5,462.00,'Available','2025-11-03 01:26:12','2025-11-03 01:26:12',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1037,417,'Land Riverside - Handcrafted','Tollo arbustum aperiam architecto crinis artificiose bene pauper. Synagoga color acsi tametsi credo cultura dolorem. Cohibeo certus confugo suppono aliqua.\nCaelestis comis aliqua aedificium crepusculum allatus deficio velit. Adsuesco non vel nesciunt officia officiis calculus. Aliquam deputo clamo aro caelestis aeneus cimentarius agnitio.','92655 Center Street, Stephantown, Oregon','Land',9401635595.00,1,4,214.00,'Available','2025-10-23 01:50:36','2025-10-23 01:50:36',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1038,315,'Villa Jones Landing - Electronic','Amita sublime una. Deduco substantia coaegresco decerno aeternus tantillus solium dapifer. Totus bis adsuesco desino.\nStultus cetera catena tenax debitis. Uterque cursus thymum conservo tabgo. Cunctatio laudantium casus sol iure adficio custodia torqueo ceno.','678 Casper Pine, Pomona, Missouri','Villa',9840717944.00,3,4,239.00,'Available','2025-09-07 18:28:41','2025-09-07 18:28:41',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1039,204,'Land 4th Avenue - Awesome','Acquiro vulnero administratio. Provident adversus arcesso cunae depono super compono vapulus aestus. Vinum sumo cresco aggredior numquam bardus appositus coniecto.\nAetas volubilis chirographum certe video. Cunae talio auctor. Conscendo decet tenus quas.','949 Old Road, New Alize, Alabama','Land',1778443170.00,3,2,68.00,'Available','2025-08-22 16:11:31','2025-08-22 16:11:31',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1040,256,'Apartment Funk Haven - Electronic','Rem ratione nesciunt labore sequi cariosus ambulo ultra civis tribuo. Ad ipsa cetera. Itaque ager esse.\nDoloribus abutor confido rerum. Eius tamisium corona vero depromo. Altus taedium depopulo acerbitas.','1139 Gusikowski Motorway, Lake Leilaniworth, Washington','Apartment',11713409978.00,4,3,409.00,'Available','2025-09-19 04:03:00','2025-09-19 04:03:00',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1041,377,'Land Metz Cliffs - Recycled','Aer ocer defendo patria. Tero tenus harum sopor. Quibusdam surculus illum.\nValetudo patior cerno delibero delinquo vestigium super. Tener bardus contabesco calco temeritas aequitas fugiat subito. Deputo theologus doloribus hic.','51820 Friesen Center, Port Coltentown, Kentucky','Land',11910034209.00,4,2,199.00,'Available','2025-10-10 13:38:53','2025-10-10 13:38:53',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1042,280,'Land Golden Garden - Bespoke','Benigne adipiscor ara apostolus. Victoria rerum repellendus. Curvo curia tunc tumultus amiculum.\nDeserunt apud tepidus ventus claro quos aspicio tero quisquam. Expedita terra aequus beatus nostrum. Ventito ex tamen cribro consequuntur adeo vulariter vestigium abduco sustineo.','34125 Cedar Road, Fort Toneyborough, Mississippi','Land',9714069419.00,4,3,113.00,'Available','2025-07-13 10:16:24','2025-07-13 10:16:24',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1043,396,'Villa Harvey Trace - Refined','Alius utrimque universe celo tres confero. Terra cognomen synagoga exercitationem vestigium vinco vomito vindico appositus terreo. Audio utrum cibo curvo aliqua ullam virtus atrox demo.\nValeo comminor vomito centum causa libero socius. Adnuo utrum aggredior canto. Facere recusandae assumenda tabula amet ipsam abscido testimonium alius.','31247 Dallin Bridge, Littlestad, Hawaii','Villa',4052570364.00,3,2,107.00,'Available','2025-09-01 08:27:02','2025-09-01 08:27:02',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1044,385,'Townhouse Murazik Shore - Intelligent','Cuppedia voveo sonitus spes sursum theatrum. Eligendi acquiro vester vito dicta statua nobis arguo ceno. Comminor consequatur calculus vetus cilicium.\nCorrupti inventore vulgaris vitae. Colo deporto minus tamdiu aestus. Alii pauci tam.','52569 Chris Terrace, New Kelvin, New York','Townhouse',9574237026.00,3,4,463.00,'Available','2025-07-29 01:33:31','2025-07-29 01:33:31',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1045,303,'Villa Stark Streets - Handmade','Theatrum decipio explicabo civitas acceptus suscipit vix. Stultus clamo admiratio soleo adipiscor tenuis magnam provident vinum debeo. Crustulum quis capitulus turbo auditor.\nValidus autus absum eum. Suadeo ademptio culpo abbas deorsum. Suspendo id amissio vitiosus adduco arca appositus alter solitudo.','91300 Lakin Pines, South Bayleefield, Missouri','Villa',13800125360.00,1,4,416.00,'Available','2025-11-05 16:01:02','2025-11-05 16:01:02',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1046,462,'Apartment Susan Throughway - Handmade','Civitas aegre cito iure consequatur arbustum deinde vilis. Bis vulgaris vorago antea molestiae aptus trado statua. Dolor vito varius nesciunt arx patrocinor tracto trucido textilis umquam.\nViduo virgo avaritia. Texo deinde clibanus perferendis debilito pel adeo. Vinculum soluta abscido appono centum amissio adfero textus atqui termes.','35227 Laburnum Grove, Kochborough, Colorado','Apartment',7373463982.00,3,2,220.00,'Available','2025-07-29 17:26:25','2025-07-29 17:26:25',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1047,374,'Apartment Medhurst Glen - Gorgeous','Umerus suppono adstringo civitas culpa abeo alo creo. Vitium teres decretum substantia alius acer. Porro viridis tergo aedificium auctus copiose urbanus tunc vinco suus.\nVorago vulariter vapulus conatus ago. Censura tum crastinus brevis casus calculus vicinus. Vaco arcus valeo tondeo ago turbo vestigium.','918 Ash Road, Killeen, New Mexico','Apartment',2659848626.00,4,4,165.00,'Available','2025-11-01 15:38:16','2025-11-01 15:38:16',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1048,343,'Villa N Harrison Street - Fresh','Confido vinco vitium decor admitto tersus occaecati decimus comparo tutamen. Depereo succedo tum tertius quia cito cursim. Vindico beneficium terror contabesco crebro iste clamo iure.\nTres coepi torrens accommodo contra dapifer constans asper. Sol casus ceno super dolor. Utor nemo voveo.','5975 Kingsway, Des Moines, Idaho','Villa',7463356805.00,1,5,393.00,'Available','2025-10-29 11:48:22','2025-10-29 11:48:22',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1049,406,'Land N Jefferson Street - Recycled','Umbra depromo creo ars soluta sophismata vivo adulescens. Itaque tero sublime. Tergiversatio sortitus turbo aut damnatio pax sequi antiquus abscido.\nVesica venia adfectus vociferor versus. Veritatis tui sum. Utpote nobis verto tamquam voveo tertius utroque socius.','1016 Hawthorn Avenue, Browntown, New Mexico','Land',13873906664.00,1,1,104.00,'Available','2025-08-14 01:08:58','2025-08-14 01:08:58',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1050,453,'Townhouse Yasmin Curve - Luxurious','Attero theatrum nulla amissio sapiente reprehenderit acerbitas. Terga templum censura surgo desparatus creo similique hic. Non centum porro demonstro dolorem.\nUbi uterque accusantium fugiat. Contra ut corrupti illum sequi vitiosus caveo. Thorax volo video qui subiungo cariosus antea adicio benigne.','32021 Elizabeth Summit, Romaguerastad, Nevada','Townhouse',4334315846.00,3,4,228.00,'Available','2025-10-15 21:41:51','2025-10-15 21:41:51',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1051,377,'Villa S Main - Unbranded','Volva somnus viridis theatrum vix. Adduco verus auctus pecto audio vesper tondeo vergo. Victoria denuncio altus curso ut rerum quis alias aiunt.\nRepudiandae bonus cupiditas surgo decor arcesso aperio amicitia compello error. Accusamus thesis atque quaerat spargo. Arcesso vilitas credo.','6990 Corine Streets, Kittyfurt, Oregon','Villa',13369665746.00,2,4,496.00,'Available','2025-07-18 19:37:56','2025-07-18 19:37:56',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1052,297,'Townhouse Lenore Grove - Sleek','Verus tunc delego ver communis venio. Dolorem accendo demergo dolorem tubineus arceo corrigo solus assumenda denuo. Eius tres usitas demens.\nCunae quaerat atrocitas suasoria cauda itaque ventito. Aperte bene spiculum. Aureus vulgaris tametsi quibusdam video acer asper thesis avarus.','2300 University Avenue, Port Linnea, Utah','Townhouse',12235541154.00,3,4,158.00,'Available','2025-07-28 01:24:03','2025-07-28 01:24:03',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1053,398,'Townhouse Bauch Crest - Practical','Cattus valetudo nihil ago minima. Consuasor facilis saepe calcar tabula conqueror ustulo volo vesco aegre. Adeo cum teneo id aveho.\nOccaecati cultellus celo cuppedia cibo. Alias carmen abutor valens sollicito vicinus. Corrigo clarus barba credo celebrer aequitas corrupti adulatio velociter.','58774 Castle Lane, East Kathryn, Wisconsin','Townhouse',14680621092.00,4,1,440.00,'Available','2025-10-06 13:49:02','2025-10-06 13:49:02',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1054,281,'Land Claremont Road - Oriental','Brevis tamdiu abbas testimonium ascit cometes cibus artificiose cogo. Truculenter denuo sumo. Deprecator benigne crepusculum at ipsam conspergo umbra temperantia.\nAnimi dedecor tredecim umerus sursum arbitro. Vallum sponte angustus denuncio. Appono stips perferendis defleo demum.','712 Second Avenue, Electahaven, New Hampshire','Land',11287783611.00,1,4,213.00,'Available','2025-08-26 19:52:18','2025-08-26 19:52:18',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1055,430,'Townhouse Gleichner Meadows - Ergonomic','Tenetur advenio clamo defleo aperte carpo casus vorago valetudo totus. Ars supplanto vae clibanus. Derelinquo convoco teneo unus voluptatibus.\nAperte aetas quas tabernus desino colligo corona. Facilis curis abduco decet ver subvenio. Tener depono bis.','59471 Hoeger Groves, Earleneworth, North Carolina','Townhouse',4819161157.00,2,3,205.00,'Available','2025-09-01 17:15:03','2025-09-01 17:15:03',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1056,466,'Villa Dallin Throughway - Small','Nobis conatus viduo coniuratio adeo repellendus ipsam. Nam ultio voluptas acies peior derelinquo universe claustrum coniecto adopto. Conqueror demo volva cenaculum adduco.\nStudio acer occaecati suppono cur catena. Numquam decerno asperiores cotidie sollicito tabella verus. Adversus anser amicitia nihil chirographum talus atque ascisco ut.','52415 Lee Street, Schadenchester, Wyoming','Villa',558302955.00,2,4,173.00,'Available','2025-08-02 11:16:31','2025-08-02 11:16:31',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1057,406,'Townhouse S 8th Street - Recycled','Pariatur commemoro quaerat combibo votum tergo ustilo. Advoco allatus umbra velum. Asporto somniculosus thymbra adhaero vociferor crudelis suggero.\nDecor amitto clibanus auxilium. Vinum dicta depraedor timidus undique curtus vinitor. Doloribus tres cenaculum denique decumbo.','3782 Laurence Ports, West Chadd, Tennessee','Townhouse',8305921215.00,1,3,51.00,'Available','2025-07-26 22:23:39','2025-07-26 22:23:39',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1058,315,'Villa Martina Shore - Refined','Surgo usque tyrannus cado solutio demulceo. Aperiam censura cupio clam ocer textor ocer amicitia vesco. Sono in vulpes.\nDerelinquo thesaurus molestias una apostolus baiulus approbo solum ver comis. Corrupti ea tertius ulterius desidero. Cavus tonsor ea tendo circumvenio urbs cogo.','26996 Adrienne Curve, Port Darrickhaven, North Carolina','Villa',8227815156.00,3,4,296.00,'Available','2025-09-27 06:29:26','2025-09-27 06:29:26',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1059,319,'Villa School Lane - Elegant','Corona conor centum molestiae dicta abutor. Arma calco uter absconditus confero adulatio absorbeo. Demens fugiat modi vociferor cervus depromo valde curriculum.\nSolvo victus blanditiis aegre tepesco dolores cogo sit. Tergum custodia arceo textilis acsi dolorem tero possimus. Depromo vita tenuis officia vociferor suspendo arma.','910 Favian Meadow, Dearborn Heights, Maine','Villa',6726073935.00,2,1,212.00,'Available','2025-08-02 16:53:19','2025-08-02 16:53:19',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1060,378,'Apartment Derwent Close - Frozen','Minima vesper compello vestrum tener. Ceno cubitum trepide contigo abundans. Appositus volup auctus vulnus amitto.\nComplectus vere allatus voco arma. Caritas vita harum addo aegrotatio audentia vulgus. Talio terreo ars adversus.','82055 Brook Lane, Port Brendon, Utah','Apartment',7553164620.00,1,5,400.00,'Available','2025-09-11 01:00:00','2025-09-11 01:00:00',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1061,438,'Townhouse Metz Terrace - Elegant','Ustulo ver derelinquo damno commemoro vinum corpus abduco. Curatio ocer laborum tametsi canto venustas cicuta subiungo reprehenderit pariatur. Cauda comedo aliquam aureus virgo ademptio.\nUredo utor turpis. Corporis desparatus magnam sophismata adstringo cogito alveus. Coma acceptus peior cubicularis.','22463 School Close, Emmitttown, Idaho','Townhouse',3848082225.00,1,3,55.00,'Available','2025-07-08 00:21:26','2025-07-08 00:21:26',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1062,342,'Apartment Cecil Spring - Oriental','Crinis quas concido antiquus decimus suasoria aveho. Fugit tener curtus ustulo vitae creber aureus cras adamo aduro. Repellat supplanto tutamen crebro unde cura.\nSpiritus aveho conicio. Amo sortitus conitor perferendis vinitor comminor atrox. Angelus vacuus atqui traho ager dolore inventore.','17308 Ova Pines, West Myrlview, North Carolina','Apartment',13373272680.00,1,1,266.00,'Available','2025-10-23 18:14:56','2025-10-23 18:14:56',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1063,404,'Villa Chyna Canyon - Refined','Confido conservo custodia vereor altus sit explicabo. Dedico utpote cauda cubo utilis vulgus stips textor speciosus. Subvenio adsum triduana repellat.\nAngustus pariatur arca tui praesentium ara virgo abundans. Demulceo termes vito eius. Auditor tero temporibus titulus totam sunt cui.','6348 River Road, Lodi, Virginia','Villa',12968635072.00,4,2,490.00,'Available','2025-09-25 16:26:58','2025-09-25 16:26:58',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1064,453,'Villa Esmeralda Divide - Handcrafted','Sequi amitto considero calcar vomito cumque iure spiritus cohibeo vere. Impedit vomer thymbra bellum vulnero adeo agnitio. Suffragium apparatus ustulo cinis abutor velit officia tersus callide advoco.\nAnimus cruentus crastinus appello blanditiis temperantia sumptus. Terreo cultura appono convoco. Tui modi somnus tenetur vesco cubicularis complectus damnatio tenuis saepe.','190 Magnus Valleys, Marleehaven, Wisconsin','Villa',592118633.00,4,2,258.00,'Available','2025-10-21 21:35:29','2025-10-21 21:35:29',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1065,421,'Townhouse Williamson Center - Electronic','Commodi tactus at suadeo vesco terra. Sollicito territo usque. Caecus volubilis crur decens capitulus delectatio in cavus.\nTitulus pecto ducimus quisquam. Antiquus vehemens acer acerbitas. Denego terreo deprimo tempus caveo delectus cultellus.','66899 Ruth Divide, Fort Henriette, Indiana','Townhouse',2372258888.00,3,4,385.00,'Available','2025-08-14 16:56:16','2025-08-14 16:56:16',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1066,357,'Apartment Belmont Road - Sleek','Itaque comedo alioqui contego accommodo. Adnuo considero solus ter atqui talio. Cruciamentum sulum acervus tepidus adamo trucido cohaero.\nCupio accendo tolero. Clarus sopor ratione triduana tribuo stillicidium super. Sortitus trepide defaeco cultellus tonsor.','45962 Beatty Extension, Dariontown, Alabama','Apartment',4276922449.00,2,3,324.00,'Available','2025-08-04 02:18:50','2025-08-04 02:18:50',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1067,439,'Apartment Moore Shore - Generic','Quasi titulus tepidus credo. Exercitationem ascit titulus cras conservo. Acidus depopulo caste depraedor degusto enim tempus succedo viridis tibi.\nSublime truculenter valens. Condico laborum sapiente bonus dolores capitulus tersus verbera clibanus. Vulpes ipsum utpote demitto cruentus.','698 Commercial Street, South Donnieborough, Delaware','Apartment',14679874657.00,4,5,493.00,'Available','2025-07-04 08:16:57','2025-07-04 08:16:57',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1068,353,'Townhouse Volkman Spring - Luxurious','Cauda crapula thesis ater vitiosus textor numquam. Vaco celer stabilis apto atrox ait rem acsi adhuc collum. Incidunt calamitas audentia defungo quo aliquam tibi.\nSui subiungo spargo canto aestus magni ad conqueror tabella. Stillicidium vulgivagus ea valeo. Spectaculum magnam volubilis tabgo statua voluptatibus.','78736 Alec Causeway, Robelville, Missouri','Townhouse',3389957339.00,2,2,362.00,'Available','2025-10-21 22:26:42','2025-10-21 22:26:42',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1069,432,'Land Charles Street - Incredible','Dolor desparatus sordeo ullam nobis advenio templum vorago theologus. Tametsi dens ustilo. Omnis amita decipio vilitas coma utrum.\nVoveo bonus animadverto canonicus brevis. Unde urbanus deporto voluptates mollitia demens. Vix adicio vos vomer vulgaris adsum carbo.','892 S Water Street, East Damarisbury, Florida','Land',3144716610.00,3,3,332.00,'Available','2025-09-02 03:07:21','2025-09-02 03:07:21',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1070,517,'Apartment Ciara Corners - Practical','Aranea tersus curo deduco. Quidem ex adamo aedificium. Excepturi adipisci curo ventosus necessitatibus denuncio vesper supra aegrus.\nEnim aranea uredo tactus supellex defetiscor iusto audeo culpa. Vulpes textilis venio timidus. Conitor appositus barba.','780 W State Street, West Adrien, Wyoming','Apartment',12389578962.00,3,1,230.00,'Available','2025-08-16 03:08:24','2025-08-16 03:08:24',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1071,522,'Apartment Kent Road - Gorgeous','Cur considero quos. Cattus demo colo audio repudiandae eveniet coniuratio similique. Spoliatio argentum cuppedia combibo atrox.\nCapitulus viridis sperno vere adflicto ad. Officia solvo utique vilis decumbo socius solitudo communis timor admitto. Aurum curatio vos absens.','6079 S Central Avenue, West Ernestberg, Louisiana','Apartment',5101588256.00,2,1,453.00,'Available','2025-08-20 20:32:02','2025-08-20 20:32:02',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1072,517,'Apartment Bernier Mall - Practical','Dolor verecundia terror defero aspernatur iusto ceno voco. Caecus vigilo ventito una conforto blandior. Admiratio bibo utilis et corrupti vilitas spero vesica truculenter.\nArchitecto somnus vestrum absum quo temporibus. Odit depraedor cerno aperte voluptate creo antea sumo sollicito cupiditas. Adeptio acervus ceno concedo ipsa.','63107 Clay Lane, Danialmouth, Maine','Apartment',9442707454.00,4,1,430.00,'Available','2025-09-20 02:31:20','2025-09-20 02:31:20',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1073,430,'Apartment Enid Gardens - Gorgeous','Suasoria coadunatio bellum coaegresco nostrum adimpleo. Adficio vestigium tubineus sed officia complectus tribuo. Pauci aegrus copiose tempus tergeo ciminatio.\nSupellex apostolus absens illum. Ars facilis verbera. Curatio cuius virgo deficio cum defluo abstergo degusto.','57974 Kirk Walks, Fort Janeview, North Dakota','Apartment',4204878776.00,2,3,473.00,'Available','2025-07-22 15:08:49','2025-07-22 15:08:49',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1074,382,'Townhouse Reynolds Valleys - Sleek','Crinis comitatus commodo. Arbor derelinquo solium approbo. Depulso vulnus unus confero.\nCuria textus ustulo toties cognomen peccatus desino voveo adopto color. Vehemens adstringo voluptatum sursum decet conicio solio corroboro. Utrimque curo asper aegrus taedium arma aestas defero bonus.','24681 Woodlands Close, Richmond, Vermont','Townhouse',3220984887.00,2,1,83.00,'Available','2025-08-02 00:51:31','2025-08-02 00:51:31',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1075,520,'Villa Johnnie Parks - Frozen','Ait atqui despecto dolores conculco cribro adsidue. Theca sto spiritus ustilo thymbra sapiente creta. Timidus vociferor reiciendis censura reiciendis sublime.\nStillicidium coma angelus auctor aptus dedico. Voluptas eius summa acer demergo cognomen theatrum artificiose crudelis. Cumque crastinus depono tantillus id unus.','4968 Krajcik Crescent, Fort Aisha, California','Villa',13419255596.00,2,2,438.00,'Available','2025-11-04 17:15:01','2025-11-04 17:15:01',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1076,450,'Villa Hyatt Underpass - Licensed','Arma cum volaticus tollo vester coadunatio praesentium tandem amo. Acervus crepusculum perspiciatis amissio. Deficio absque claro deputo est velit vorago audentia nisi.\nVestigium adopto deleo beatae absconditus ambitus coepi bestia. Peccatus supra adflicto. Odit bestia ut basium subvenio ab depono voluptas convoco bellicus.','1721 Minnie Streets, Johnsonstead, New Jersey','Villa',7690499415.00,3,2,284.00,'Available','2025-10-09 15:24:53','2025-10-09 15:24:53',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1077,421,'Villa Bruen Ports - Fantastic','Minus decimus textus summa. Quibusdam repellendus celebrer viscus ad comptus aranea error cunctatio. Sapiente stabilis demitto sufficio nemo confido caelum talis dapifer.\nVolo terreo degusto desipio. Occaecati depulso antepono eligendi non comes curiositas. Amaritudo taceo corrumpo succurro voro creator.','57316 Prospect Place, East Warrenshire, Iowa','Villa',12760727222.00,1,3,39.00,'Available','2025-10-16 00:16:40','2025-10-16 00:16:40',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1078,406,'Townhouse Spencer Center - Rustic','Bibo videlicet est terror aperte commodi cotidie ipsa sub. Thymbra ullus ter unde quod caritas aliquid cetera cubicularis articulus. Corrumpo amita ver ambulo temeritas deputo vulnero territo.\nBene annus ancilla cohibeo censura aedificium vae. Quia arbitro torrens stella barba tener. Ultra deduco fugit supra laborum vulgivagus voluptates.','267 Ceasar Greens, Port Breanaborough, North Dakota','Townhouse',13749711718.00,2,2,306.00,'Available','2025-11-23 11:50:26','2025-11-23 11:50:26',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1079,424,'Apartment Ash Street - Fantastic','Stella cunabula quam stips suadeo condico magnam. Tabella celer bos arcesso. Substantia illo aliquid deficio bene creptio crux toties dignissimos.\nUtrimque vomica natus caecus nesciunt facere arca vilis tabula traho. Verbum denuo angelus bis doloremque vix audio caste beatus cervus. Odit error speculum.','53172 Schroeder Burg, West Manleyfort, Oklahoma','Apartment',10290714093.00,4,1,486.00,'Available','2025-07-27 22:39:38','2025-07-27 22:39:38',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1080,471,'Townhouse Lehner Ramp - Licensed','Dolorem non cena aperiam supellex despecto creptio paens vorax. Cribro tabesco civitas vomica basium arcus vito comitatus. Teneo cimentarius verbera.\nAstrum addo adfero patior tenax civitas tersus solum sono. Victoria atque subvenio conduco tertius nostrum. Vulgaris bos sint terra contigo acceptus derelinquo uberrime accedo.','755 S Washington Avenue, Lynnborough, New Hampshire','Townhouse',2994719181.00,2,5,197.00,'Available','2025-10-04 23:38:55','2025-10-04 23:38:55',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1081,522,'Villa Ottis Spring - Small','Arbitro nam aedificium umbra qui velut veritatis. Crastinus arma cuius adstringo amiculum aranea sulum spes corrumpo. Bellicus dens uredo traho calco addo.\nCruentus adaugeo vox pecus demum suffragium. Atavus deleo succedo. Coniecto argentum spoliatio voluptas urbs agnitio corrupti viriliter.','5557 Jeffery Turnpike, Lakeland, Nevada','Villa',629208839.00,4,4,73.00,'Available','2025-09-15 21:41:16','2025-09-15 21:41:16',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1082,514,'Villa Harrison Street - Small','Cupressus cauda vestrum crapula vomica. Adfero fuga rerum umbra conor defleo conforto quia aetas volo. Vilis aranea tabgo vitiosus spero eligendi vulnus.\nVinculum coaegresco contego deludo cunabula. Uxor vesica tepidus deleniti acervus tam velit cattus recusandae. Nisi socius arx apto animadverto aiunt voluptates sufficio tabesco truculenter.','229 Pagac Views, Oberbrunnerfort, Wyoming','Villa',6164588720.00,3,4,123.00,'Available','2025-07-20 03:42:37','2025-07-20 03:42:37',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1083,430,'Villa Denis Pike - Intelligent','Ceno demulceo texo cauda nesciunt vilis admoneo. Pel quaerat supellex adflicto. Thorax viriliter conventus.\nAccedo tepidus ustilo corrigo. Earum cultura vesica. Cumque urbanus utroque.','7104 N Locust Street, Owensboro, Kentucky','Villa',8670770313.00,2,2,476.00,'Available','2025-08-29 07:20:23','2025-08-29 07:20:23',NULL,'Tây',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1084,411,'Land Luz View - Practical','Vestigium tabernus acerbitas compello titulus vinco vallum curo. Repellat fuga voco depulso delego aduro tristis caecus abduco civitas. Amicitia ager sunt placeat defaeco constans delego reprehenderit.\nCombibo titulus arguo adstringo sonitus possimus caste. Nemo cunabula tendo cotidie dolorum adeptio. Iste stella bardus theca volup atque auctus basium auctor annus.','88504 Heather Field, Jastberg, Minnesota','Land',10322233125.00,4,5,400.00,'Available','2025-08-06 09:28:34','2025-08-06 09:28:34',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1085,504,'Apartment Willy Garden - Handcrafted','Deorsum videlicet tamdiu allatus terebro volubilis apud ver. Commodi dolor sublime conturbo bellum. Subseco dignissimos pauci aliquam decor adfectus carcer commemoro adimpleo ulciscor.\nAurum tonsor conventus odit sumptus supplanto modi amo correptius. Abundans in ustilo ultio sollers. Amplexus strenuus coepi curto.','6550 Nolan Cliff, Port Faustoport, Nebraska','Apartment',6929285777.00,3,5,499.00,'Available','2025-08-05 05:20:30','2025-08-05 05:20:30',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1086,374,'Villa Memorial Drive - Rustic','Vociferor consectetur stella placeat acer aro creber summopere debitis. Comparo approbo contabesco cilicium suffoco fuga cohors magnam. Id pauci callide numquam paens sursum voluntarius sopor sodalitas uberrime.\nAt confido deputo caelum reprehenderit claudeo tot. Coma iure bellicus uter curvo uxor cohaero volup. Surgo cunctatio consuasor ipsa terebro.','3426 Harber Haven, New Darbymouth, Alabama','Villa',2617328774.00,3,4,351.00,'Available','2025-08-22 04:38:02','2025-08-22 04:38:02',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1087,432,'Land Kings Highway - Small','Adduco barba vociferor tendo socius anser xiphias aurum. Volo accommodo uxor video valens territo. Suadeo ter cauda atrocitas aqua solium arto anser quis.\nInflammatio totam ceno studio adeptio iste. Arca vorax argumentum carus adfectus contego coma strenuus. Aggredior tabella aequitas umerus calcar video tabgo vitium convoco.','542 Korey Prairie, Port Heather, Arkansas','Land',11462946512.00,2,1,277.00,'Available','2025-07-13 14:26:08','2025-07-13 14:26:08',NULL,'Bắc',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1088,385,'Land Homenick Bridge - Sleek','Contabesco velut carpo dolorum tonsor civitas coepi pauper. Vito solvo coadunatio cohors curo utrimque infit adamo aequitas. Absconditus quidem aggero sublime cauda video adicio adhuc.\nCollum consectetur consectetur turpis cattus aequitas charisma suppellex vinculum tubineus. Terra solium cinis cicuta abeo conitor. Textor tenetur ante vitae.','74646 University Avenue, Lake Gerardoport, Alaska','Land',11626655796.00,2,2,309.00,'Available','2025-07-26 15:49:44','2025-07-26 15:49:44',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1089,374,'Apartment Will Inlet - Practical','Suffoco tribuo libero canis circumvenio damno vito versus. Inflammatio vos beatae auctor. Coniecto addo voveo tyrannus aequitas voluptas.\nAdhuc tener vestrum adsidue somniculosus cohaero tabernus modi adipiscor tubineus. Curo stipes argumentum deporto. Contego toties suffoco.','8281 Roberts Square, Norman, Wisconsin','Apartment',12996005134.00,4,5,458.00,'Available','2025-11-14 17:16:56','2025-11-14 17:16:56',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1090,482,'Land Lizzie Cape - Rustic','Deinde defluo tergiversatio pel tamisium theatrum depromo delectus aedificium bibo. Catena totus ultra. Speciosus optio calamitas patrocinor.\nVomer tabula vallum. Adulatio celebrer quos. Vilitas consuasor congregatio ter civitas aestivus vitiosus tergiversatio.','73741 Parisian Shoal, Florissant, Kentucky','Land',1340601237.00,2,3,398.00,'Available','2025-08-08 13:09:55','2025-08-08 13:09:55',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1091,432,'Land Hegmann Ridge - Tasty','Utroque dens quod dolore verumtamen curtus antea. Iure vinum saepe deleo totam carcer calculus assentator. Doloribus adipisci agnosco vulgaris corona textor celebrer timor temporibus audax.\nTeneo antea tempus infit cribro. Ocer conduco adimpleo absconditus adeptio confero conforto alias. Bene sublime amo aegre tribuo textilis.','694 Vesta Lakes, North Garfield, Texas','Land',7468686045.00,2,3,476.00,'Available','2025-11-24 05:24:04','2025-11-24 05:24:04',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1092,398,'Villa Orchard Drive - Sleek','Thesaurus carus amor. Sponte arbor inflammatio bardus assentator. Sequi ultra voluptatem.\nNihil eos trepide stabilis blanditiis somnus. Deduco demonstro baiulus traho quaerat deripio cursus amaritudo amor. Vulgaris calamitas arto paens vel amplexus aureus anser cenaculum.','34140 Bechtelar Radial, Lake Mattiehaven, Massachusetts','Villa',12805329807.00,4,4,486.00,'Available','2025-11-12 01:29:46','2025-11-12 01:29:46',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1093,446,'Land Thiel Mount - Rustic','Desipio terreo suscipit veritas taceo caste acidus. Vita facere suus arx civis error iusto amita cernuus quasi. Canis curia ipsam temporibus harum minus cubo adinventitias.\nMinima accusator temptatio. Aptus cariosus virga. Adinventitias sint nobis aspernatur allatus sumo demoror comis cohaero consuasor.','5220 Weimann Wells, Kristown, Montana','Land',6966384288.00,2,5,301.00,'Available','2025-11-03 08:59:00','2025-11-03 08:59:00',NULL,'',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1094,412,'Land Konopelski Parks - Licensed','Cenaculum tricesimus ultio defleo tunc. Ventus claudeo suspendo coniuratio nam cupio tergeo patior rerum. Taedium astrum earum eius illum sopor.\nModi tendo velut caput. Cometes creta tantillus perferendis clarus caecus suus admiratio quo. Acsi bibo consequatur accommodo vestrum crustulum amiculum vere.','87496 Cronin Creek, Murray, Wisconsin','Land',2962960910.00,1,3,42.00,'Available','2025-07-12 09:40:50','2025-07-12 09:40:50',NULL,'Nam',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1095,532,'asa','ssa','âs, Xã Tát Ngà, Huyện Mèo Vạc, Tỉnh Hà Giang','Apartment',99999997.00,NULL,NULL,NULL,'Available','2025-11-27 15:36:59','2025-11-27 15:37:20',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1096,533,'sá','1221','Tam Kỳ Đoan Trai, Xã Ngũ Thái, Thị xã Thuận Thành, Tỉnh Bắc Ninh','Townhouse',12123123.00,NULL,NULL,NULL,'Pending','2025-11-27 21:20:57','2025-11-27 21:20:57',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1097,533,'sá','1221','Tam Kỳ Đoan Trai, Xã Ngũ Thái, Thị xã Thuận Thành, Tỉnh Bắc Ninh','Townhouse',12123123.00,NULL,NULL,NULL,'Pending','2025-11-27 21:20:57','2025-11-27 21:20:57',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1098,532,'sss','22112','ấ, Phường Ninh Sơn, Thị xã Việt Yên, Tỉnh Bắc Giang','Villa',123123123123.00,NULL,NULL,NULL,'Available','2025-11-28 07:41:34','2025-11-28 07:42:07',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE'),(1099,532,'dắ','111','ss, Xã Đồng Văn, Huyện Yên Lạc, Tỉnh Vĩnh Phúc','Villa',21121.00,NULL,NULL,NULL,'Pending','2025-11-28 08:25:07','2025-11-28 08:25:07',NULL,'Đông',1,0,0,0,0,1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'FREE');
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houseviewings`
--

DROP TABLE IF EXISTS `houseviewings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houseviewings` (
  `ViewingID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã lịch xem',
  `HouseID` bigint unsigned NOT NULL COMMENT 'Nhà muốn xem',
  `BuyerID` bigint unsigned NOT NULL,
  `SellerID` bigint unsigned NOT NULL,
  `UserID` bigint unsigned NOT NULL COMMENT 'Người đặt lịch xem',
  `ViewingDate` datetime NOT NULL COMMENT 'Ngày giờ hẹn xem',
  `Status` enum('PENDING','CONFIRMED','CANCELLED') DEFAULT 'PENDING' COMMENT 'Trạng thái',
  `VerifyCode` varchar(20) DEFAULT NULL COMMENT 'Mã xác minh buổi xem nhà (OTP/QR)',
  `VerifiedByAdmin` tinyint(1) DEFAULT '0' COMMENT 'Admin xác nhận hợp lệ',
  `VerifiedTime` datetime DEFAULT NULL COMMENT 'Thời điểm xác minh thực tế',
  `SuspiciousFlag` tinyint(1) DEFAULT '0' COMMENT 'Đánh dấu nghi ngờ giao dịch ngoài sàn',
  `StaffVerifyStatus` enum('Pending','Verified','Rejected') DEFAULT 'Pending',
  `StaffVerifyNote` text,
  `StaffVerifyTime` datetime DEFAULT NULL,
  `StaffID` bigint unsigned DEFAULT NULL COMMENT 'Nhan vien ho tro xem nha',
  PRIMARY KEY (`ViewingID`),
  KEY `idx_viewings_house` (`HouseID`),
  KEY `idx_viewings_user` (`UserID`),
  KEY `idx_viewings_status` (`Status`),
  KEY `idx_viewings_date` (`ViewingDate`),
  KEY `fk_viewing_staff` (`StaffID`),
  CONSTRAINT `fk_viewing_staff` FOREIGN KEY (`StaffID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `houseviewings_ibfk_1` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`),
  CONSTRAINT `houseviewings_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houseviewings`
--

LOCK TABLES `houseviewings` WRITE;
/*!40000 ALTER TABLE `houseviewings` DISABLE KEYS */;
/*!40000 ALTER TABLE `houseviewings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_alerts`
--

DROP TABLE IF EXISTS `iot_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_alerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` int NOT NULL,
  `house_id` int NOT NULL,
  `alert_type` enum('gas_leak','rain_detected','motion_detected','temperature_high','temperature_low','light_low','camera_offline') COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` enum('low','medium','high','critical') COLLATE utf8mb4_unicode_ci DEFAULT 'medium',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `threshold_value` decimal(10,2) DEFAULT NULL,
  `is_resolved` tinyint(1) DEFAULT '0',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_house_created` (`house_id`,`created_at`),
  KEY `idx_alert_type` (`alert_type`),
  KEY `idx_severity` (`severity`),
  KEY `idx_resolved` (`is_resolved`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_alerts`
--

LOCK TABLES `iot_alerts` WRITE;
/*!40000 ALTER TABLE `iot_alerts` DISABLE KEYS */;
INSERT INTO `iot_alerts` VALUES (1,7,1004,'gas_leak','high','Phát hiện nồng độ khí gas vượt ngưỡng an toàn',65.30,60.00,0,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(2,6,1004,'temperature_high','medium','Nhiệt độ trong nhà cao bất thường',28.50,28.00,0,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(3,10,1004,'rain_detected','low','Phát hiện mưa, tự động thu giàn phơi',1.00,1.00,0,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(4,9,1004,'motion_detected','low','Phát hiện chuyển động trong nhà',1.00,1.00,0,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49');
/*!40000 ALTER TABLE `iot_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_device_status`
--

DROP TABLE IF EXISTS `iot_device_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_device_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` int NOT NULL,
  `house_id` int NOT NULL,
  `is_online` tinyint(1) DEFAULT '1',
  `last_seen` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uptime_seconds` int DEFAULT '0',
  `connection_count` int DEFAULT '0',
  `disconnection_count` int DEFAULT '0',
  `firmware_version` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `battery_level` int DEFAULT NULL,
  `signal_strength` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_device_status` (`device_id`),
  KEY `idx_house_online` (`house_id`,`is_online`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_device_status`
--

LOCK TABLES `iot_device_status` WRITE;
/*!40000 ALTER TABLE `iot_device_status` DISABLE KEYS */;
INSERT INTO `iot_device_status` VALUES (1,6,1004,1,'2025-11-27 09:46:49',86400,1,0,NULL,NULL,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(2,7,1004,1,'2025-11-27 09:46:49',82800,1,1,NULL,NULL,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(3,8,1004,1,'2025-11-27 09:46:49',86100,1,0,NULL,NULL,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(4,9,1004,1,'2025-11-27 09:46:49',85200,1,0,NULL,NULL,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49'),(5,10,1004,0,'2025-11-27 09:46:49',72000,1,2,NULL,NULL,NULL,'2025-11-27 09:46:49','2025-11-27 09:46:49');
/*!40000 ALTER TABLE `iot_device_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_sensor_data`
--

DROP TABLE IF EXISTS `iot_sensor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_sensor_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` int NOT NULL,
  `house_id` int NOT NULL,
  `sensor_type` enum('temperature','gas','light','motion','rain','camera') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('normal','warning','critical') COLLATE utf8mb4_unicode_ci DEFAULT 'normal',
  PRIMARY KEY (`id`),
  KEY `idx_device_timestamp` (`device_id`,`timestamp`),
  KEY `idx_house_timestamp` (`house_id`,`timestamp`),
  KEY `idx_sensor_type` (`sensor_type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_sensor_data`
--

LOCK TABLES `iot_sensor_data` WRITE;
/*!40000 ALTER TABLE `iot_sensor_data` DISABLE KEYS */;
INSERT INTO `iot_sensor_data` VALUES (1,6,1004,'temperature',25.50,'°C','2025-11-27 08:46:49','normal'),(2,6,1004,'temperature',26.20,'°C','2025-11-27 07:46:49','normal'),(3,6,1004,'temperature',24.80,'°C','2025-11-27 06:46:49','normal'),(4,6,1004,'temperature',27.10,'°C','2025-11-27 05:46:49','normal'),(5,6,1004,'temperature',28.50,'°C','2025-11-27 04:46:49','warning'),(6,7,1004,'gas',45.20,'ppm','2025-11-27 08:46:49','normal'),(7,7,1004,'gas',52.80,'ppm','2025-11-27 07:46:49','normal'),(8,7,1004,'gas',48.10,'ppm','2025-11-27 06:46:49','normal'),(9,7,1004,'gas',65.30,'ppm','2025-11-27 05:46:49','warning'),(10,8,1004,'light',450.00,'lux','2025-11-27 08:46:49','normal'),(11,8,1004,'light',520.50,'lux','2025-11-27 07:46:49','normal'),(12,8,1004,'light',380.20,'lux','2025-11-27 06:46:49','normal'),(13,9,1004,'motion',1.00,'','2025-11-27 09:16:49','normal'),(14,9,1004,'motion',0.00,'','2025-11-27 09:01:49','normal'),(15,9,1004,'motion',1.00,'','2025-11-27 08:46:49','normal'),(16,10,1004,'rain',0.00,'','2025-11-27 08:46:49','normal'),(17,10,1004,'rain',1.00,'','2025-11-27 07:46:49','warning');
/*!40000 ALTER TABLE `iot_sensor_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_system_logs`
--

DROP TABLE IF EXISTS `iot_system_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_system_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house_id` int DEFAULT NULL,
  `device_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `log_level` enum('info','warning','error','critical') COLLATE utf8mb4_unicode_ci DEFAULT 'info',
  `event_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` json DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_house_created` (`house_id`,`created_at`),
  KEY `idx_log_level` (`log_level`),
  KEY `idx_event_type` (`event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_system_logs`
--

LOCK TABLES `iot_system_logs` WRITE;
/*!40000 ALTER TABLE `iot_system_logs` DISABLE KEYS */;
INSERT INTO `iot_system_logs` VALUES (1,1004,6,200,'info','device_connected','Cảm biến nhiệt độ đã kết nối thành công',NULL,NULL,NULL,'2025-11-27 09:46:49'),(2,1004,7,200,'warning','gas_threshold_exceeded','Nồng độ khí gas vượt ngưỡng cảnh báo',NULL,NULL,NULL,'2025-11-27 09:46:49'),(3,1004,10,200,'error','device_disconnected','Cảm biến mưa mất kết nối',NULL,NULL,NULL,'2025-11-27 09:46:49'),(4,1004,NULL,200,'info','user_login','Người dùng đăng nhập vào dashboard IoT',NULL,NULL,NULL,'2025-11-27 09:46:49');
/*!40000 ALTER TABLE `iot_system_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iotcontrollogs`
--

DROP TABLE IF EXISTS `iotcontrollogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iotcontrollogs` (
  `ControlID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã lệnh điều khiển',
  `DeviceID` bigint unsigned NOT NULL COMMENT 'Thiết bị được điều khiển',
  `UserID` bigint unsigned NOT NULL COMMENT 'Người thực hiện điều khiển',
  `Action` varchar(100) NOT NULL COMMENT 'Hành động',
  `Parameters` json DEFAULT NULL COMMENT 'Tham số điều khiển',
  `SentToKafka` tinyint(1) DEFAULT '1' COMMENT 'Có gửi Kafka không',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo lệnh',
  PRIMARY KEY (`ControlID`),
  KEY `idx_logs_device` (`DeviceID`),
  KEY `idx_logs_user` (`UserID`),
  CONSTRAINT `iotcontrollogs_ibfk_1` FOREIGN KEY (`DeviceID`) REFERENCES `iotdevices` (`DeviceID`),
  CONSTRAINT `iotcontrollogs_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iotcontrollogs`
--

LOCK TABLES `iotcontrollogs` WRITE;
/*!40000 ALTER TABLE `iotcontrollogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `iotcontrollogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iotdevices`
--

DROP TABLE IF EXISTS `iotdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iotdevices` (
  `DeviceID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã thiết bị IoT',
  `HouseID` bigint unsigned NOT NULL COMMENT 'Căn nhà sở hữu thiết bị',
  `DeviceName` varchar(100) NOT NULL COMMENT 'Tên thiết bị',
  `DeviceType` varchar(50) DEFAULT NULL COMMENT 'Loại thiết bị',
  `Status` enum('Active','Inactive') DEFAULT 'Active' COMMENT 'Trạng thái',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày thêm',
  PRIMARY KEY (`DeviceID`),
  KEY `idx_iotdevices_house` (`HouseID`),
  KEY `idx_iotdevices_type` (`DeviceType`),
  CONSTRAINT `iotdevices_ibfk_1` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iotdevices`
--

LOCK TABLES `iotdevices` WRITE;
/*!40000 ALTER TABLE `iotdevices` DISABLE KEYS */;
INSERT INTO `iotdevices` VALUES (1,1000,'Cảnh báo cháy','Actuator','Active','2025-11-27 08:54:39'),(2,1000,'Cảm biến nhiệt độ','Sensor','Active','2025-11-27 08:54:39'),(3,1000,'Cảm biến độ ẩm','Sensor','Active','2025-11-27 08:54:39'),(4,1000,'Đèn thông minh','Actuator','Active','2025-11-27 08:54:39'),(5,1000,'Phát đồ thông minh','Actuator','Active','2025-11-27 08:54:39'),(6,1004,'Đèn thông minh','Light','Active','2025-11-27 09:23:38'),(7,1004,'Khóa thông minh','Smart Lock','Active','2025-11-27 09:23:38'),(8,1004,'Camera an ninh','Camera','Active','2025-11-27 09:23:38'),(9,1004,'Cảm biến nhiệt độ','Temperature Sensor','Active','2025-11-27 09:23:38'),(10,1004,'Quạt thông minh','Fan','Active','2025-11-27 09:23:38');
/*!40000 ALTER TABLE `iotdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iotresponselogs`
--

DROP TABLE IF EXISTS `iotresponselogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iotresponselogs` (
  `ResponseID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã phản hồi',
  `ControlLogID` bigint unsigned NOT NULL COMMENT 'Liên kết với lệnh gốc',
  `DeviceID` bigint unsigned NOT NULL COMMENT 'Thiết bị trả lời',
  `ResponseStatus` enum('SUCCESS','FAILED','TIMEOUT') NOT NULL COMMENT 'Kết quả phản hồi',
  `ResponseMessage` text COMMENT 'Chi tiết phản hồi',
  `ReceivedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm nhận',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ ghi log',
  PRIMARY KEY (`ResponseID`),
  KEY `idx_reslog_control` (`ControlLogID`),
  KEY `idx_reslog_device` (`DeviceID`),
  CONSTRAINT `iotresponselogs_ibfk_1` FOREIGN KEY (`ControlLogID`) REFERENCES `iotcontrollogs` (`ControlID`),
  CONSTRAINT `iotresponselogs_ibfk_2` FOREIGN KEY (`DeviceID`) REFERENCES `iotdevices` (`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iotresponselogs`
--

LOCK TABLES `iotresponselogs` WRITE;
/*!40000 ALTER TABLE `iotresponselogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `iotresponselogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `MessageID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ConversationID` bigint unsigned NOT NULL,
  `SenderID` bigint unsigned NOT NULL,
  `MessageText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MessageType` enum('text','image','property_link') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `Metadata` json DEFAULT NULL,
  `IsEncrypted` tinyint(1) DEFAULT '1',
  `IsRead` tinyint(1) DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `idx_conversation` (`ConversationID`),
  KEY `idx_sender` (`SenderID`),
  KEY `idx_created` (`CreatedAt`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`ConversationID`) REFERENCES `conversations` (`ConversationID`) ON DELETE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`SenderID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (64,5,100,'http://localhost:3001/property/1001','property_link','\"{\\\"houseId\\\":1001,\\\"title\\\":\\\"Nh?? ph??? Qu???n 2\\\",\\\"address\\\":\\\"456 Th???o ??i???n, Q2, TP.HCM\\\",\\\"price\\\":\\\"8.000.000.000 ₫\\\",\\\"bedrooms\\\":null,\\\"bathrooms\\\":null,\\\"area\\\":null}\"',0,1,'2025-11-26 18:03:31','2025-11-26 18:08:23'),(65,5,100,'0678f0fc0aed6eac7af58a100e105ead:87815e55682076994c19b781453d8166','text',NULL,1,1,'2025-11-26 21:09:00','2025-11-26 21:39:23'),(66,5,100,'d888d947b6940339ec0b12a6e7e94cfd:dce14724dd6829c45bba7089555b1f2ab48584ac6a87e3d75d18315d6c73afb4','text',NULL,1,1,'2025-11-26 21:09:08','2025-11-26 21:39:23'),(67,5,200,'20fdd6f410004bd5f5aa07b5048dc84a:c448f262284b4f5a1ccc333d7d0b44f0','text',NULL,1,1,'2025-11-26 21:39:33','2025-11-27 09:32:18'),(68,6,200,'http://localhost:3001/property/1002','property_link','\"{\\\"houseId\\\":1002,\\\"title\\\":\\\"Bi???t th??? Qu???n 7\\\",\\\"address\\\":\\\"789 Ph?? M??? H??ng, Q7, TP.HCM\\\",\\\"price\\\":\\\"15.000.000.000 ₫\\\",\\\"bedrooms\\\":null,\\\"bathrooms\\\":null,\\\"area\\\":null}\"',0,0,'2025-11-27 09:02:24','2025-11-27 09:02:24');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `toUserId` bigint unsigned DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `isRead` tinyint(1) DEFAULT '0',
  `type` enum('system','promotion','maintenance','custom') COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `receiverId` bigint unsigned DEFAULT NULL,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_toUserId` (`toUserId`),
  KEY `idx_createdAt` (`createdAt`),
  KEY `idx_isRead` (`isRead`),
  KEY `idx_type` (`type`),
  KEY `idx_receiverId` (`receiverId`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`toUserId`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Chào mừng đến với hệ thống!','Chúc mừng bạn đã tham gia hệ thống bất động sản thông minh của chúng tôi. Hãy khám phá các tính năng mới!',NULL,'2025-11-27 10:55:48',0,'system',NULL,'2025-11-27 14:11:00'),(2,'Thông báo quan trọng','Bạn có một yêu cầu xác minh tài khoản mới cần được xử lý.',18,'2025-11-27 08:55:48',0,'system',18,'2025-11-27 14:11:00'),(3,'Cập nhật hệ thống','Hệ thống sẽ được bảo trì vào lúc 2:00 AM ngày mai. Vui lòng lưu ý.',NULL,'2025-11-26 10:55:48',0,'system',NULL,'2025-11-27 14:11:00'),(4,'Chào mừng đến với hệ thống!','Chúc mừng bạn đã tham gia hệ thống bất động sản thông minh của chúng tôi. Hãy khám phá các tính năng mới!',NULL,'2025-11-27 13:55:02',0,'system',NULL,'2025-11-27 14:11:00'),(5,'Thông báo quan trọng','Bạn có một yêu cầu xác minh tài khoản mới cần được xử lý.',18,'2025-11-27 11:55:02',0,'system',18,'2025-11-27 14:11:00'),(6,'Cập nhật hệ thống','Hệ thống sẽ được bảo trì vào lúc 2:00 AM ngày mai. Vui lòng lưu ý.',NULL,'2025-11-26 13:55:02',0,'system',NULL,'2025-11-27 14:11:00'),(7,'Loa loa','Loa loa loa',NULL,'2025-11-27 14:04:54',0,'system',NULL,'2025-11-27 14:11:00'),(8,'Chào mừng đến với hệ thống!','Chúc mừng bạn đã tham gia hệ thống bất động sản thông minh của chúng tôi. Hãy khám phá các tính năng mới!',NULL,'2025-11-27 14:20:39',0,'system',NULL,'2025-11-27 14:20:39'),(9,'Thông báo quan trọng','Bạn có một yêu cầu xác minh tài khoản mới cần được xử lý.',18,'2025-11-27 12:20:39',0,'system',NULL,'2025-11-27 14:20:39'),(10,'Cập nhật hệ thống','Hệ thống sẽ được bảo trì vào lúc 2:00 AM ngày mai. Vui lòng lưu ý.',NULL,'2025-11-26 14:20:39',0,'system',NULL,'2025-11-27 14:20:39'),(11,'as','as',NULL,'2025-11-27 14:25:23',0,'system',NULL,'2025-11-27 14:25:23'),(12,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',17,'2025-11-27 14:28:43'),(13,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',20,'2025-11-27 14:28:43'),(14,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',22,'2025-11-27 14:28:43'),(15,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',100,'2025-11-27 14:28:43'),(16,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',101,'2025-11-27 14:28:43'),(17,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',200,'2025-11-27 14:28:43'),(18,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',201,'2025-11-27 14:28:43'),(19,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',202,'2025-11-27 14:28:43'),(20,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',203,'2025-11-27 14:28:43'),(21,'? Thông báo test từ Admin','Đây là thông báo test để kiểm tra hệ thống thông báo. Hệ thống đã hoạt động bình thường! Thời gian: 21:28:43 27/11/2025',NULL,'2025-11-27 14:28:43',0,'system',204,'2025-11-27 14:28:43'),(22,'? THÔNG BÁO REALTIME TEST','Test thông báo realtime qua WebSocket! Thời gian: 21:39:16 27/11/2025',NULL,'2025-11-27 14:39:16',0,'system',17,'2025-11-27 14:39:16'),(23,'? THÔNG BÁO REALTIME TEST','Test thông báo realtime qua WebSocket! Thời gian: 21:39:16 27/11/2025',NULL,'2025-11-27 14:39:16',0,'system',20,'2025-11-27 14:39:16'),(24,'? THÔNG BÁO REALTIME TEST','Test thông báo realtime qua WebSocket! Thời gian: 21:39:16 27/11/2025',NULL,'2025-11-27 14:39:16',0,'system',22,'2025-11-27 14:39:16'),(25,'? THÔNG BÁO REALTIME TEST','Test thông báo realtime qua WebSocket! Thời gian: 21:39:16 27/11/2025',NULL,'2025-11-27 14:39:16',0,'system',100,'2025-11-27 14:39:16'),(26,'? THÔNG BÁO REALTIME TEST','Test thông báo realtime qua WebSocket! Thời gian: 21:39:16 27/11/2025',NULL,'2025-11-27 14:39:16',0,'system',101,'2025-11-27 14:39:16'),(27,'? Test từ Script','Test notification từ script - 21:42:01 27/11/2025',NULL,'2025-11-27 14:42:01',0,'system',507,'2025-11-27 14:42:01'),(28,'? Test từ Script','Test notification từ script - 21:42:01 27/11/2025',NULL,'2025-11-27 14:42:01',0,'system',317,'2025-11-27 14:42:01'),(29,'? Test từ Script','Test notification từ script - 21:42:01 27/11/2025',NULL,'2025-11-27 14:42:01',0,'system',405,'2025-11-27 14:42:01'),(30,'? Test Specific User','Test notification cho user cụ thể: Ada Kuhn',NULL,'2025-11-27 14:42:01',0,'custom',317,'2025-11-27 14:42:01'),(31,'','Test message',NULL,'2025-11-27 14:46:13',0,'system',317,'2025-11-27 14:46:13');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ownershipdocuments`
--

DROP TABLE IF EXISTS `ownershipdocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ownershipdocuments` (
  `DocumentID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `HouseID` bigint unsigned NOT NULL,
  `DocumentType` varchar(100) NOT NULL COMMENT 'SoDo, SoHong, GiayPhepXayDung...',
  `FilePath` varchar(500) NOT NULL,
  `FileHash` varchar(255) DEFAULT NULL COMMENT 'Hash SHA-256 để kiểm tra toàn vẹn',
  `Status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `UploadedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `VerifiedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`DocumentID`),
  KEY `idx_docs_house` (`HouseID`),
  CONSTRAINT `fk_ownershipdocs_house` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ownershipdocuments`
--

LOCK TABLES `ownershipdocuments` WRITE;
/*!40000 ALTER TABLE `ownershipdocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ownershipdocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `duration_days` int NOT NULL DEFAULT '30',
  `priority_level` int NOT NULL DEFAULT '1',
  `highlight` tinyint(1) DEFAULT '0',
  `top_priority` tinyint(1) DEFAULT '0',
  `boost_per_day` int DEFAULT '0',
  `max_cover_media` int DEFAULT '1',
  `banner_enabled` tinyint(1) DEFAULT '0',
  `auto_refresh` tinyint(1) DEFAULT '0',
  `verified_seller_badge` tinyint(1) DEFAULT '0',
  `ai_tools` json DEFAULT NULL,
  `features` json DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `daily_post` int NOT NULL DEFAULT '1',
  `daily_boost` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (10,'FREE','Gói Miễn Phí',0.00,365,1,0,0,0,3,0,0,0,'[]','[\"Đăng tối đa 3 bài viết\", \"Tối đa 3 hình ảnh mỗi bài\", \"Hỗ trợ cơ bản\", \"Tìm kiếm cơ bản\"]','Gói cơ bản',1,0,1,'2025-11-27 15:10:58','2025-11-28 08:05:04'),(11,'PRO','Gói PRO',99000.00,30,5,1,0,1,10,0,0,1,'[\"title_optimization\", \"description_generation\"]','[\"Đăng tối đa 20 bài viết\", \"Tối đa 10 hình ảnh mỗi bài\", \"AI tối ưu tiêu đề và mô tả\", \"1 lượt boost mỗi ngày\", \"Hỗ trợ ưu tiên\", \"Thống kê chi tiết\", \"Badge PRO\"]','Gói cho seller chuyên nghiệp',5,1,1,'2025-11-27 15:10:58','2025-11-28 08:05:04'),(12,'PREMIUM','Gói PREMIUM',199000.00,30,10,1,1,-1,20,1,1,1,'[\"title_optimization\", \"description_generation\", \"market_analysis\", \"price_suggestion\"]','[\"Đăng bài không giới hạn\", \"Tối đa 20 hình ảnh mỗi bài\", \"Tất cả tính năng AI\", \"Boost không giới hạn\", \"Ưu tiên hiển thị\", \"Badge PREMIUM\", \"Thống kê nâng cao\", \"Hỗ trợ 24/7\", \"Video panorama\", \"Báo cáo thị trường\"]','Gói đầy đủ tính năng',999,5,1,'2025-11-27 15:10:58','2025-11-28 08:05:04');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttransaction`
--

DROP TABLE IF EXISTS `paymenttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenttransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `orderId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'MOMO',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'PENDING',
  `package` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderId` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttransaction`
--

LOCK TABLES `paymenttransaction` WRITE;
/*!40000 ALTER TABLE `paymenttransaction` DISABLE KEYS */;
INSERT INTO `paymenttransaction` VALUES (1,1,'ORDER_1764130346556_0sbv85i55',99000.00,'MOMO','PENDING','PRO','2025-11-26 11:12:26','2025-11-26 11:12:26'),(2,1,'ORDER_1764131462509_9mpmdia3n',99000.00,'MOMO','PENDING','PRO','2025-11-26 11:31:02','2025-11-26 11:31:02'),(3,1,'ORDER_1764131738414_kvobfo0kb',299000.00,'MOMO','PENDING','PREMIUM','2025-11-26 11:35:38','2025-11-26 11:35:38'),(4,1,'ORDER_1764131988629_mhwdm2f98',299000.00,'MOMO','PENDING','PREMIUM','2025-11-26 11:39:48','2025-11-26 11:39:48'),(5,1,'ORDER_1764146796818_j68g3wqom',99000.00,'MOMO','PENDING','PRO','2025-11-26 15:46:37','2025-11-26 15:46:37');
/*!40000 ALTER TABLE `paymenttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_analytics`
--

DROP TABLE IF EXISTS `post_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_analytics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house_id` int NOT NULL,
  `event_type` enum('view','contact','boost','auto_refresh') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `referrer` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_house_event` (`house_id`,`event_type`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_analytics`
--

LOCK TABLES `post_analytics` WRITE;
/*!40000 ALTER TABLE `post_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `RatingID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã đánh giá',
  `HouseID` bigint unsigned NOT NULL COMMENT 'Nhà được đánh giá',
  `UserID` bigint unsigned NOT NULL COMMENT 'Người đánh giá',
  `Score` int DEFAULT NULL COMMENT 'Điểm đánh giá (1-5 sao)',
  `Comment` text COMMENT 'Nhận xét',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ tạo',
  PRIMARY KEY (`RatingID`),
  KEY `idx_ratings_house` (`HouseID`),
  KEY `idx_ratings_user` (`UserID`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `ratings_chk_1` CHECK ((`Score` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `RequestID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã yêu cầu',
  `HouseID` bigint unsigned DEFAULT NULL,
  `BuyerID` bigint unsigned NOT NULL COMMENT 'Người gửi yêu cầu (User)',
  `RequestType` enum('Rent','Buy','UpgradeToSeller') NOT NULL,
  `Message` text COMMENT 'Lời nhắn của người mua',
  `Status` enum('Pending','Approved','Rejected','Cancelled') NOT NULL DEFAULT 'Pending',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ tạo yêu cầu',
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FolderId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `HouseID` (`HouseID`),
  KEY `BuyerID` (`BuyerID`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`),
  CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`BuyerID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TransactionID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã giao dịch',
  `BuyerID` bigint unsigned NOT NULL COMMENT 'Người mua',
  `HouseID` bigint unsigned NOT NULL COMMENT 'Căn nhà được mua',
  `Amount` decimal(18,2) NOT NULL COMMENT 'Số tiền giao dịch',
  `Status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending' COMMENT 'Trạng thái',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ tạo',
  `PaymentMethod` enum('Bank','CreditCard','EWallet') NOT NULL,
  `coIsPaidToEscrow` tinyint(1) DEFAULT '0' COMMENT 'Buyer đã nộp cọc vào sàn chưa',
  `IsReleasedToSeller` tinyint(1) DEFAULT '0' COMMENT 'Tiền đã giải ngân cho Seller chưa',
  `ReleasedAt` timestamp NULL DEFAULT NULL COMMENT 'Thời điểm giải ngân cho Seller',
  `StaffID` bigint unsigned DEFAULT NULL COMMENT 'Nhan vien xu ly giao dich',
  PRIMARY KEY (`TransactionID`),
  KEY `idx_trans_buyer` (`BuyerID`),
  KEY `idx_trans_house` (`HouseID`),
  KEY `idx_trans_status` (`Status`),
  KEY `fk_transaction_staff` (`StaffID`),
  CONSTRAINT `fk_transaction_staff` FOREIGN KEY (`StaffID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`BuyerID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`HouseID`) REFERENCES `houses` (`HouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (2,328,1042,2008159.00,'Completed','2025-07-28 00:00:00','Bank',1,1,NULL,460),(3,442,1066,1849605.00,'Completed','2025-07-10 00:00:00','CreditCard',1,0,NULL,408),(4,306,1063,2456108.00,'Pending','2025-07-26 00:00:00','CreditCard',1,0,NULL,312),(5,331,1041,2246056.00,'Pending','2025-07-03 00:00:00','Bank',1,0,NULL,324),(6,433,1065,1894529.00,'Completed','2025-07-05 00:00:00','CreditCard',1,0,NULL,409),(7,300,1051,2291648.00,'Pending','2025-07-12 00:00:00','Bank',1,1,NULL,368),(8,454,1039,3799471.00,'Pending','2025-08-12 00:00:00','EWallet',1,0,NULL,324),(9,367,1059,2906794.00,'Pending','2025-08-08 00:00:00','CreditCard',1,0,NULL,447),(10,388,1062,3372615.00,'Completed','2025-08-08 00:00:00','Bank',1,1,NULL,312),(11,304,1044,3112376.00,'Completed','2025-08-25 00:00:00','EWallet',1,0,NULL,332),(12,348,1040,3436195.00,'Completed','2025-08-06 00:00:00','EWallet',1,1,NULL,423),(13,358,1045,5291402.00,'Completed','2025-09-24 00:00:00','EWallet',1,0,NULL,418),(14,367,1059,4135499.00,'Pending','2025-09-15 00:00:00','CreditCard',1,0,NULL,418),(15,359,1040,5262342.00,'Completed','2025-09-08 00:00:00','Bank',1,0,NULL,423),(16,282,1060,4441528.00,'Completed','2025-09-24 00:00:00','EWallet',1,0,NULL,324),(17,422,1022,4126287.00,'Completed','2025-10-01 00:00:00','Bank',1,1,NULL,311),(18,443,1026,3452983.00,'Completed','2025-10-25 00:00:00','Bank',1,0,NULL,447),(19,364,1033,2824925.00,'Completed','2025-10-04 00:00:00','CreditCard',1,0,NULL,431),(20,464,1043,3424384.00,'Completed','2025-10-23 00:00:00','EWallet',1,0,NULL,332),(21,299,1038,3926492.00,'Completed','2025-10-25 00:00:00','CreditCard',1,0,NULL,293),(22,428,1041,3531024.00,'Completed','2025-10-22 00:00:00','Bank',1,0,NULL,373),(23,316,1065,4332235.00,'Completed','2025-11-25 00:00:00','CreditCard',1,1,NULL,380),(24,271,1053,5702941.00,'Completed','2025-11-28 00:00:00','EWallet',1,0,NULL,355),(25,363,1025,4184031.00,'Completed','2025-11-03 00:00:00','CreditCard',1,1,NULL,312),(26,270,1058,3979884.00,'Completed','2025-11-08 00:00:00','EWallet',1,0,NULL,418),(27,386,1057,5138133.00,'Completed','2025-11-08 00:00:00','EWallet',1,1,NULL,447),(28,348,1091,1819136.00,'Completed','2025-07-12 00:00:00','Bank',1,1,NULL,362),(29,458,1054,1360310.00,'Pending','2025-07-13 00:00:00','EWallet',1,1,NULL,502),(30,341,1065,1408356.00,'Completed','2025-07-01 00:00:00','CreditCard',1,0,NULL,423),(31,327,1063,1549510.00,'Completed','2025-07-21 00:00:00','CreditCard',1,1,NULL,502),(32,403,1075,1426587.00,'Completed','2025-07-23 00:00:00','CreditCard',1,1,NULL,502),(33,351,1072,1378737.00,'Completed','2025-07-14 00:00:00','CreditCard',1,0,NULL,494),(34,351,1083,1535570.00,'Completed','2025-07-27 00:00:00','EWallet',1,1,NULL,380),(35,467,1089,1643895.00,'Completed','2025-07-12 00:00:00','EWallet',1,0,NULL,519),(36,384,1066,1718924.00,'Completed','2025-08-23 00:00:00','EWallet',1,1,NULL,519),(37,351,1056,1958502.00,'Completed','2025-08-12 00:00:00','Bank',1,1,NULL,345),(38,474,1067,1670929.00,'Completed','2025-08-20 00:00:00','CreditCard',1,0,NULL,491),(39,477,1073,2133590.00,'Completed','2025-08-24 00:00:00','CreditCard',1,0,NULL,513),(40,364,1093,1962181.00,'Completed','2025-08-18 00:00:00','Bank',1,1,NULL,497),(41,437,1056,2088720.00,'Pending','2025-08-05 00:00:00','CreditCard',1,0,NULL,332),(42,328,1050,2281119.00,'Pending','2025-08-13 00:00:00','CreditCard',1,1,NULL,362),(43,364,1052,2267817.00,'Completed','2025-08-08 00:00:00','EWallet',1,0,NULL,497),(44,407,1061,2682905.00,'Pending','2025-09-03 00:00:00','EWallet',1,0,NULL,362),(45,422,1048,2950035.00,'Completed','2025-09-13 00:00:00','Bank',1,0,NULL,332),(46,369,1090,2684201.00,'Completed','2025-09-04 00:00:00','EWallet',1,0,NULL,380),(47,333,1062,2336409.00,'Pending','2025-09-06 00:00:00','EWallet',1,1,NULL,355),(48,429,1054,3071455.00,'Pending','2025-09-21 00:00:00','EWallet',1,1,NULL,491),(49,379,1076,2461241.00,'Completed','2025-09-02 00:00:00','Bank',1,0,NULL,497),(50,487,1050,2878395.00,'Completed','2025-09-17 00:00:00','EWallet',1,0,NULL,423),(51,467,1068,2333921.00,'Completed','2025-10-22 00:00:00','Bank',1,1,NULL,355),(52,376,1076,2575514.00,'Completed','2025-10-05 00:00:00','EWallet',1,1,NULL,373),(53,392,1047,2445361.00,'Completed','2025-10-17 00:00:00','Bank',1,0,NULL,497),(54,419,1059,3103017.00,'Completed','2025-10-18 00:00:00','CreditCard',1,0,NULL,497),(55,387,1061,2296869.00,'Completed','2025-10-10 00:00:00','CreditCard',1,1,NULL,408),(56,428,1079,3062235.00,'Completed','2025-10-24 00:00:00','Bank',1,1,NULL,362),(57,344,1094,2642164.00,'Completed','2025-10-28 00:00:00','Bank',1,1,NULL,494),(58,480,1079,2517406.00,'Completed','2025-10-27 00:00:00','CreditCard',1,0,NULL,360),(59,327,1055,4015176.00,'Completed','2025-11-27 00:00:00','Bank',1,0,NULL,355),(60,339,1072,3504494.00,'Completed','2025-11-23 00:00:00','CreditCard',1,1,NULL,345),(61,429,1051,4407108.00,'Completed','2025-11-28 00:00:00','EWallet',1,1,NULL,460),(62,454,1074,3790453.00,'Completed','2025-11-02 00:00:00','Bank',1,0,NULL,368),(63,487,1062,4114348.00,'Completed','2025-11-10 00:00:00','EWallet',1,1,NULL,431),(64,511,1061,4607710.00,'Pending','2025-11-17 00:00:00','Bank',1,1,NULL,332);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_packages`
--

DROP TABLE IF EXISTS `user_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `package_id` int NOT NULL,
  `start_at` timestamp NOT NULL,
  `end_at` timestamp NOT NULL,
  `boost_used_today` int DEFAULT '0',
  `last_boost_reset` date DEFAULT NULL,
  `status` enum('active','expired','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `purchase_price` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_status` (`user_id`,`status`),
  KEY `idx_end_at` (`end_at`),
  KEY `idx_package_id` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_packages`
--

LOCK TABLES `user_packages` WRITE;
/*!40000 ALTER TABLE `user_packages` DISABLE KEYS */;
INSERT INTO `user_packages` VALUES (1,20,3,'2025-11-25 20:25:33','2025-12-25 20:25:33',0,NULL,'active',299000.00,NULL,NULL,'2025-11-25 20:25:33','2025-11-25 20:25:33'),(13,532,11,'2025-11-28 08:18:17','2025-12-28 08:18:17',0,'2025-11-28','active',99000.00,'manual','ASSIGN_1764317896513_532','2025-11-28 08:18:16','2025-11-28 08:18:16'),(14,533,12,'2025-11-28 08:18:30','2025-12-28 08:18:30',0,'2025-11-29','active',199000.00,'manual','ASSIGN_1764317910483_533','2025-11-28 08:18:30','2025-11-29 15:51:01');
/*!40000 ALTER TABLE `user_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdocuments`
--

DROP TABLE IF EXISTS `userdocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdocuments` (
  `DocumentID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - mã giấy tờ',
  `UserID` bigint unsigned NOT NULL COMMENT 'Người nộp giấy tờ',
  `DocumentType` varchar(20) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL COMMENT 'Tên file gốc',
  `FilePath` varchar(500) NOT NULL COMMENT 'Đường dẫn file lưu trữ (cloud/local, đã bảo mật)',
  `FileHash` varchar(255) DEFAULT NULL COMMENT 'Hash SHA256 để kiểm tra tính toàn vẹn',
  `Status` enum('Pending','Approved','Rejected') DEFAULT 'Pending' COMMENT 'Trạng thái xác minh',
  `UploadedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm upload',
  `VerifiedAt` timestamp NULL DEFAULT NULL COMMENT 'Thời điểm xác minh',
  `RequestID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`DocumentID`),
  UNIQUE KEY `uq_user_request_doc` (`UserID`,`RequestID`,`DocumentType`),
  KEY `idx_doc_user` (`UserID`),
  KEY `FK_UserDocuments_Request` (`RequestID`),
  CONSTRAINT `fk_doc_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `FK_UserDocuments_Request` FOREIGN KEY (`RequestID`) REFERENCES `requests` (`RequestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdocuments`
--

LOCK TABLES `userdocuments` WRITE;
/*!40000 ALTER TABLE `userdocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `userdocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính - định danh duy nhất cho mỗi người dùng',
  `FullName` varchar(100) NOT NULL COMMENT 'Họ và tên đầy đủ của người dùng',
  `Email` varchar(100) DEFAULT NULL COMMENT 'Email duy nhất, dùng để login / xác thực',
  `PhoneNumber` varchar(20) DEFAULT NULL COMMENT 'Số điện thoại duy nhất, dùng để login / xác thực',
  `AvatarUrl` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) NOT NULL COMMENT 'Mật khẩu đã băm để lưu trữ an toàn',
  `Role` enum('Admin','Buyer','Seller','Staff') DEFAULT 'Buyer',
  `Status` enum('Active','Inactive','Banned') DEFAULT 'Active' COMMENT 'Trạng thái tài khoản',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày giờ tạo tài khoản',
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OtpCode` varchar(10) DEFAULT NULL,
  `OtpExpiredAt` timestamp NULL DEFAULT NULL,
  `Gender` enum('Nam','Ná»¯','KhÃ¡c') DEFAULT NULL COMMENT 'Giá»?i tÃ­nh cá»§a ngÆ°á»?i dÃ¹ng',
  `Address` text COMMENT 'Ä?á»?a chá»? cá»§a ngÆ°á»?i dÃ¹ng',
  `Timezone` varchar(50) DEFAULT 'GMT+7 (ICT)' COMMENT 'MÃºi giá»?',
  `Website` varchar(255) DEFAULT NULL COMMENT 'Website cÃ¡ nhÃ¢n',
  `Bio` text COMMENT 'Ghi chÃº cÃ¡ nhÃ¢n',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  KEY `idx_users_email` (`Email`),
  KEY `idx_users_phone` (`PhoneNumber`),
  KEY `idx_users_role` (`Role`),
  KEY `idx_users_status` (`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (17,'Bùi Thanh Tân','buithanhtan16403@gmail.com','0931928752',NULL,'$2b$10$RccZGCxGAE4KnrhARpw5wOHFUn1YGIaMRGz8yQtemPWRCQ3YDTqV6','Buyer','Active','2025-11-25 15:30:56','2025-11-26 17:57:20','382612','2025-11-25 16:33:01',NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(18,'User Test PRO','admin@smarthome.com','0123456789',NULL,'$2b$10$gyW2BLovOEa6a9/3mdUA3Oo/DaR9uXP6w.vz.mJ7zSXmHqeLYYFte','Admin','Active','2025-11-25 15:39:18','2025-11-27 15:11:57',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(19,'Demo Staff','staff.demo@homex.local','0900000000',NULL,'$2b$10$tk/8AZiUPSLBU5R76sCLp.Fj.qxpH0aE9n8kwXKqWdcGovhHSTY8C','Staff','Active','2025-11-25 16:13:29','2025-11-25 16:13:29',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(20,'User Test PREMIUM','ai-seller@test.com','0987654321','/uploads/avatars/avatar_20_1764200581667.webp','$2b$10$gyW2BLovOEa6a9/3mdUA3Oo/DaR9uXP6w.vz.mJ7zSXmHqeLYYFte','Seller','Active','2025-11-25 20:25:17','2025-11-27 15:11:57','987013','2025-11-25 20:35:17',NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(22,'Thanh Tan K17 DN','tanbtde170754@fpt.edu.vn','G02511656',NULL,'61jl420qA1','Buyer','Active','2025-11-25 20:28:31','2025-11-25 20:28:31',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(100,'Nguy???n V??n Buyer','buyer1@test.com','0901234567',NULL,'$2b$12$owFrJcfieimm66fHSqOOG.EcbqD2yYbHtJsQDy38KavAgksrygxqa','Buyer','Active','2025-11-26 17:51:57','2025-11-26 17:59:34',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(101,'Tr???n Th??? Buyer','buyer2@test.com','0901234568',NULL,'$2b$12$owFrJcfieimm66fHSqOOG.EcbqD2yYbHtJsQDy38KavAgksrygxqa','Buyer','Active','2025-11-26 17:51:57','2025-11-26 17:59:34',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(200,'Bùi Thanh Tân','seller1@test.com','0931928652','/uploads/avatars/avatar_200_1764200368387.jpeg','$2b$10$OJEHmIzV/kD2UtSjIwIL4.RhvvyTskSE7KL3tD8yUX8spAWPVG092','Seller','Active','2025-11-26 17:51:57','2025-11-26 23:39:28',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(201,'Ph???m Th??? Seller','seller2@test.com','0902345679',NULL,'$2b$12$owFrJcfieimm66fHSqOOG.EcbqD2yYbHtJsQDy38KavAgksrygxqa','Seller','Active','2025-11-26 17:51:57','2025-11-26 17:59:34',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(202,'Nettie Hettinger','agustin.hills@yahoo.com','0957244179',NULL,'$2b$10$Y82bLUkbVvSwcbkxujebGOtqIRNAUXYZNEvbSKe61PMu76rICsxUS','Seller','Active','2025-07-16 17:00:00','2025-07-16 17:00:00',NULL,NULL,'Nam','9833 Church Hill, Lake Aurelio','GMT+7 (ICT)',NULL,'Laboriosam atrocitas casus concido terminatio.'),(203,'Sara Fadel','vivian.kirlin66@yahoo.com','0947875687',NULL,'$2b$10$HO3A1iCDEaHQOIuN2sFJYeREPFFxAZseC0AoijsRY8vMEkSH0IsRW','Buyer','Active','2025-07-17 17:00:00','2025-07-17 17:00:00',NULL,NULL,'','14532 Loma Knolls, Taylor','GMT+7 (ICT)',NULL,'Atrocitas tantillus utrum basium cado vigor delicate.'),(204,'Kristen Lubowitz','henry83@yahoo.com','0930226069',NULL,'$2b$10$zMhGowqNDJaazOFvYl1yxeHWll/.pUE0tkwx/jMMONTQeNkbwBq9m','Seller','Active','2025-07-26 17:00:00','2025-07-26 17:00:00',NULL,NULL,'','68582 Adams Wells, Lake Jeanie','GMT+7 (ICT)',NULL,'Dicta suppellex hic spero.'),(205,'Dr. Brent Mraz','marc_johns@yahoo.com','0919738202',NULL,'$2b$10$UVSc5KfIl/gGF.fsS4QaUe4fXRB8wJXe66p2DofOyq5loZAD/RA5.','Buyer','Active','2025-07-15 17:00:00','2025-07-15 17:00:00',NULL,NULL,'Nam','7391 Blanda Stream, Union City','GMT+7 (ICT)',NULL,'Confugo eius a super conculco tertius talus vinitor.'),(206,'Teresa Tremblay','don97@yahoo.com','0988081907',NULL,'$2b$10$HOaZg2uijlDdAvLKwHPbDOYVYA/O6HeL3vNm3hk9uaDq69P5GvyKO','Buyer','Active','2025-07-06 17:00:00','2025-07-06 17:00:00',NULL,NULL,'','1211 Doyle Trace, Victorville','GMT+7 (ICT)',NULL,'Veniam admoneo aiunt tempora coniecto incidunt.'),(207,'Simon Ferry','erica16@hotmail.com','0963614507',NULL,'$2b$10$SqRSrWJ7AFrINh.hvBKwiOXJT0ttseCDmNdGb7GSw9LEY5A4SrDoy','Seller','Active','2025-07-05 17:00:00','2025-07-05 17:00:00',NULL,NULL,'','50932 Camila Mill, South Marlen','GMT+7 (ICT)',NULL,'Corrupti nam claro creo cubicularis amissio aggero cursus urbs tonsor.'),(208,'Elena Donnelly','candace.west@hotmail.com','0929906200',NULL,'$2b$10$cGbk7InI0UGCjIwWucYyQu7mwxaEmRTcfuAxSzk/ePumpAMIYQvha','Buyer','Active','2025-07-09 17:00:00','2025-07-09 17:00:00',NULL,NULL,'','32879 Anabel Fords, Buckridgeboro','GMT+7 (ICT)',NULL,'Tamdiu urbs auctus molestias valde deprimo vero tepidus clamo una.'),(209,'Dianna Conn Jr.','demario_klocko99@yahoo.com','0943243522',NULL,'$2b$10$pV3XT23jCuZoyoFgy3z9X.axbXd8.P.QMOFkbz0egtYlbq7A3tsQS','Buyer','Active','2025-07-25 17:00:00','2025-07-25 17:00:00',NULL,NULL,'','979 Schneider Plaza, West Velma','GMT+7 (ICT)',NULL,'Eius decipio quia.'),(210,'Phyllis Bins','lea_waters-lockman@gmail.com','0930199535',NULL,'$2b$10$TdZUSPg66HaAgcptNyZQ2OGhDRGD.pLRkmzdfWeUmGUU92kzERwTa','Admin','Active','2025-08-05 17:00:00','2025-08-05 17:00:00',NULL,NULL,'Nam','3300 Greenway, New Francisca','GMT+7 (ICT)',NULL,'Capillus chirographum deripio reprehenderit cur vespillo.'),(211,'Stephanie Ankunding','demetrius12@hotmail.com','0975925268',NULL,'$2b$10$VzGqW1sd4rPAngL5zuLg5eskJL04ELbGPUGDZjGdMXzYByiqnP542','Buyer','Active','2025-08-16 17:00:00','2025-08-16 17:00:00',NULL,NULL,'','602 Lake Drive, Littleton','GMT+7 (ICT)',NULL,'Aeneus convoco vero odit.'),(212,'Jaime Abernathy V','arnoldo_aufderhar@yahoo.com','0912914455',NULL,'$2b$10$ynuRl/Fi0Bz1OFTNQwNdxeEXgOCHYDry8WjX/ZAGzZMKOZnXWmiNq','Buyer','Active','2025-08-02 17:00:00','2025-08-02 17:00:00',NULL,NULL,'','27721 Eddie Cliffs, Raleigh','GMT+7 (ICT)',NULL,'Commodi corroboro pectus sapiente amita.'),(213,'Heather Smitham','adrien.corwin@gmail.com','0924206362',NULL,'$2b$10$9f24lHwDwgPzqsjZrpXNhuXEwNWKhrDbjdFlPe0yHYTl9INtd5oIy','Buyer','Active','2025-07-31 17:00:00','2025-07-31 17:00:00',NULL,NULL,'','9496 Lemke Gardens, Port Edythland','GMT+7 (ICT)',NULL,'Deporto voco maxime thermae contego abutor deprimo censura.'),(214,'Mr. Marc Rosenbaum','aditya35@hotmail.com','0965963018',NULL,'$2b$10$VQcee2AVxpAsyA5zhzWzBOV5Xj.EM4l7c3xu6Nkj1f7Bd64xQ6XBm','Buyer','Active','2025-08-27 17:00:00','2025-08-27 17:00:00',NULL,NULL,'Nam','7867 Isabella Walk, Fort Greg','GMT+7 (ICT)',NULL,'Angelus taceo cedo voluptas cunabula sulum aliqua cenaculum abscido thymum.'),(215,'Sheri Gibson','eldon67@gmail.com','0989684864',NULL,'$2b$10$7S6tFYt0EkqbzU1ELjaLH.ig5shOyUilcSLoaHdiYgdW/Hgn5hf1C','Buyer','Active','2025-08-05 17:00:00','2025-08-05 17:00:00',NULL,NULL,'','7271 Maria Ways, East Reggie','GMT+7 (ICT)',NULL,'Iusto vero cornu conspergo et tumultus velit vindico utroque.'),(216,'Irvin Schiller','pearline.mayer@yahoo.com','0928087022',NULL,'$2b$10$yqW5Ylu7S69uYWrz/1bCr.AeGCuljAkQkj7f31jJ.3.lABhRkLqX.','Admin','Active','2025-08-10 17:00:00','2025-08-10 17:00:00',NULL,NULL,'Nam','229 S Washington Street, East Arvilla','GMT+7 (ICT)',NULL,'Thesis praesentium totam caecus angelus.'),(217,'Allan Gleason','brenden16@yahoo.com','0989177733',NULL,'$2b$10$o98Lomy9zhU2UPwTwWapyuz.FHJpYLTEZh/lMm80ZGka34I3MGVoW','Buyer','Active','2025-07-31 17:00:00','2025-07-31 17:00:00',NULL,NULL,'','406 Lawrence Street, North Bernita','GMT+7 (ICT)',NULL,'Adicio vitae quo apud pecco admoneo venio.'),(218,'Timothy Kozey','delmer_labadie86@yahoo.com','0973836308',NULL,'$2b$10$vkfU8RuXCVteftN62UB.tuHj95z7O9qCWOzVFnzgA3ac70HKRkFuO','Buyer','Active','2025-08-16 17:00:00','2025-08-16 17:00:00',NULL,NULL,'','44051 David Crossing, Runteview','GMT+7 (ICT)',NULL,'Curso tristis defetiscor utpote temporibus vetus versus congregatio.'),(219,'Gwendolyn Konopelski DVM','stephany_reichel@gmail.com','0986419883',NULL,'$2b$10$GVDAS9wyYtWkSJvq.zdCTufNlhg7CbCLiY8c9waEjWtfMc3wDDYJi','Buyer','Active','2025-09-09 17:00:00','2025-09-09 17:00:00',NULL,NULL,'','88327 Don Curve, Eulaborough','GMT+7 (ICT)',NULL,'Suscipio centum solutio deprecator consectetur desolo statim cado perspiciatis venustas.'),(220,'Alan Raynor','benjamin19@gmail.com','0919587404',NULL,'$2b$10$OPbFMeInKWrLdOseWeHj3u4DhZVrJR7q5i4e9RKYCMHcMT7/TH/Z2','Buyer','Active','2025-09-04 17:00:00','2025-09-04 17:00:00',NULL,NULL,'','9803 Robel Underpass, Lake Geovany','GMT+7 (ICT)',NULL,'Quos tempus claudeo aegrus animadverto tamen attonbitus bardus.'),(221,'Lila Cronin','valentin_bergnaum@gmail.com','0979244393',NULL,'$2b$10$NQm5WORl5qnAfN72PZ0M5uqNxg4f2UzUOnw2xhGEanWXVB7ly/rEu','Buyer','Active','2025-09-27 17:00:00','2025-09-27 17:00:00',NULL,NULL,'Nam','461 Sven Land, Waipahu','GMT+7 (ICT)',NULL,'Magnam comparo aegrus tamen.'),(222,'Santiago Batz II','remington.reynolds78@yahoo.com','0950190048',NULL,'$2b$10$CK0Jq4CnXqRSfUhkJNuVFORfcXVeLK8CczvS.A/DJk6caB4/TFpoK','Buyer','Active','2025-09-17 17:00:00','2025-09-17 17:00:00',NULL,NULL,'','91669 Veum Mission, Zoilaside','GMT+7 (ICT)',NULL,'Solio curtus sit accusamus.'),(223,'Erin Wintheiser','cruz.nicolas19@gmail.com','0984079175',NULL,'$2b$10$GKYkKMQVvNnoc0RDpJG6Ne99grhYy6HM.GxwAWc.bqd0hqGvw3VUe','Buyer','Active','2025-09-04 17:00:00','2025-09-04 17:00:00',NULL,NULL,'','501 Rogahn Junctions, MacGyvercester','GMT+7 (ICT)',NULL,'Concedo tabgo adicio capitulus supra compono admitto coma tardus inventore.'),(224,'Penny Braun','braxton.buckridge19@yahoo.com','0965831090',NULL,'$2b$10$2YGF4Kq8Kv6EsooP63H/peCRnmrMlzdqp1P5RW9IN08OqQHTbBjtm','Buyer','Active','2025-09-15 17:00:00','2025-09-15 17:00:00',NULL,NULL,'Nam','717 North Road, Lodi','GMT+7 (ICT)',NULL,'Tamisium temptatio repellat ventito vaco theologus textus.'),(225,'Matthew Doyle','alejandra45@gmail.com','0946366578',NULL,'$2b$10$zGKDgZuaF8eNrvGfV.gyTeVKk.5eHBsd9ggWGHhvIjzl9IJ31UXnC','Seller','Active','2025-09-22 17:00:00','2025-09-22 17:00:00',NULL,NULL,'Nam','411 Stokes Ranch, Port Keyshawn','GMT+7 (ICT)',NULL,'Denique amet cursus tabella spiritus conatus.'),(226,'Kerry Swaniawski DVM','evie_spinka93@gmail.com','0912586314',NULL,'$2b$10$vTxYFJmsG9RKv5STHWsarOzAt9BxfDjVNk2dvKOBNX7D2Ph97HTpS','Buyer','Active','2025-09-25 17:00:00','2025-09-25 17:00:00',NULL,NULL,'Nam','64545 N Union Street, North Annastad','GMT+7 (ICT)',NULL,'Atque vilitas turbo vindico creptio.'),(227,'Charlie Dare','bruce17@yahoo.com','0955272125',NULL,'$2b$10$d0OipNA2.WmNNZ5Aldw/cOGddayjZJR3hU0WghD2R6xq3yhZCjota','Buyer','Active','2025-09-19 17:00:00','2025-09-19 17:00:00',NULL,NULL,'','452 Freda Forest, Fort Zetta','GMT+7 (ICT)',NULL,'Vilitas umerus vergo termes strues.'),(228,'Marsha Price','harold5@yahoo.com','0985633690',NULL,'$2b$10$EnZPNne567C3w3CYcF1lFuxDQijFlAHL0UanUXaSG.YrGEmHGAJRu','Seller','Active','2025-10-03 17:00:00','2025-10-03 17:00:00',NULL,NULL,'Nam','4535 Abbey Road, Prohaskafield','GMT+7 (ICT)',NULL,'Cumque comptus autus sono corpus cultellus.'),(229,'Jose Brown','macy76@yahoo.com','0973300526',NULL,'$2b$10$dfKPofbO36YgjPZdRUKEp.aT7czmRl.VNLj6rk.umW5.8cfOH1WvG','Buyer','Active','2025-10-13 17:00:00','2025-10-13 17:00:00',NULL,NULL,'Nam','8353 S 2nd Street, Orlando','GMT+7 (ICT)',NULL,'Nemo quae capio delego.'),(230,'Carroll Herman','milo_block25@yahoo.com','0996925606',NULL,'$2b$10$NBg3C3.dX3OmrIr0t9ifHu96Xh2FHLsmhDy7OCfeUqABjvLZsf3Jy','Seller','Active','2025-10-23 17:00:00','2025-10-23 17:00:00',NULL,NULL,'Nam','29113 Mill Road, Henderson','GMT+7 (ICT)',NULL,'Thesis odit rerum abstergo amaritudo natus vociferor amita apostolus eius.'),(231,'Dr. Gordon Langworth','riley_schowalter@gmail.com','0917998409',NULL,'$2b$10$DCSQuTcSpqB6Ly6OR8IM0.xqi/D4tYQ5DI1hq/jL7oETgLTzkrxAe','Buyer','Active','2025-10-11 17:00:00','2025-10-11 17:00:00',NULL,NULL,'','770 Marc Forges, East Graceton','GMT+7 (ICT)',NULL,'Adficio advenio coniuratio suggero termes sub adnuo suadeo admoneo trado.'),(232,'Taylor Kassulke','manuel_gusikowski@gmail.com','0943296917',NULL,'$2b$10$FU.KeBfL58iJuCtZ7pUt0O.Hi.v0xGr4cTAhgV860232DNTjtpOc2','Buyer','Active','2025-10-11 17:00:00','2025-10-11 17:00:00',NULL,NULL,'','89939 N 9th Street, Kubville','GMT+7 (ICT)',NULL,'Usque dedecor collum arguo.'),(233,'Floyd Nikolaus','aurore_heller49@hotmail.com','0932650003',NULL,'$2b$10$3YS.lRdMiYDkCkSAiAMYFed1co8R2xCTHWN0vPRfhA6PxmHad2nla','Buyer','Active','2025-10-01 17:00:00','2025-10-01 17:00:00',NULL,NULL,'','8891 Hodkiewicz Glen, Lake Dane','GMT+7 (ICT)',NULL,'Arx ventus claustrum tollo capio cimentarius adstringo.'),(234,'Rogelio Leannon-West','diana_hamill65@hotmail.com','0929139592',NULL,'$2b$10$2UNn0HNX1z96EJ0MvF1YX.fNwsnjAH.IIezDU9Uysu30jWNvZ9J26','Buyer','Active','2025-10-21 17:00:00','2025-10-21 17:00:00',NULL,NULL,'','77067 Lyla Roads, East Hilton','GMT+7 (ICT)',NULL,'Ipsa velum cenaculum absorbeo.'),(235,'Ismael Davis','gertrude.hintz2@yahoo.com','0964072157',NULL,'$2b$10$lt7DhWTVGlOsThnbVw4LbeidWp/pR2K9QgBXGD5MNRPyZlVF3.G12','Buyer','Active','2025-10-26 17:00:00','2025-10-26 17:00:00',NULL,NULL,'Nam','12509 Church View, Trinityburgh','GMT+7 (ICT)',NULL,'Dicta vicissitudo confugo defetiscor capto alter bis vociferor.'),(236,'Cary Spencer','heber_prosacco72@hotmail.com','0967702843',NULL,'$2b$10$hbwy3ZfANRwW.h5QkcewG.SW0lrUWX173LPY.m4h2IO0/8utN/vtC','Seller','Active','2025-10-20 17:00:00','2025-10-20 17:00:00',NULL,NULL,'Nam','32330 Jalon Mews, North Yoshiko','GMT+7 (ICT)',NULL,'Toties quae degenero adnuo cernuus eos fuga adfero stultus.'),(237,'Garrett Harber','monroe68@hotmail.com','0963734017',NULL,'$2b$10$qyFc0KL7jlWMU6TljOE5VuqAbMWqqekNmfXlBawCI4ann9ShTPWvu','Buyer','Active','2025-10-20 17:00:00','2025-10-20 17:00:00',NULL,NULL,'Nam','5344 Emory Circles, Dejuanfort','GMT+7 (ICT)',NULL,'Adfectus depromo teneo sto vesica addo vulgo traho.'),(238,'Edwin Zieme','colby63@yahoo.com','0934596461',NULL,'$2b$10$F9UQ7fC5cqPQnH0trwLRyOWaz1W5UNNG1zX1mp/LTcvFWJtF96aS6','Buyer','Active','2025-10-16 17:00:00','2025-10-16 17:00:00',NULL,NULL,'Nam','76941 Brooks Green, Tyrellchester','GMT+7 (ICT)',NULL,'Solutio praesentium aptus statua depereo.'),(239,'Kelly Conn','antonio29@yahoo.com','0914388996',NULL,'$2b$10$rMpsWrsb4IrqowjJLAuptODS0Xt8OdHJWiihdBKPBY2MTmGlWpQIO','Buyer','Active','2025-10-10 17:00:00','2025-10-10 17:00:00',NULL,NULL,'Nam','60559 Nelson Road, Maverickside','GMT+7 (ICT)',NULL,'Virgo acer coma alias ater provident uxor crapula antepono cunae.'),(240,'Troy Walker','kylee90@yahoo.com','0991098637',NULL,'$2b$10$weEL.ANRBfi.ioI8n92rr.xC6uYcLEcWHGhJw8U1NN93CEEHDdI1u','Admin','Active','2025-10-21 17:00:00','2025-10-21 17:00:00',NULL,NULL,'','9860 Kshlerin Crest, Hicklecester','GMT+7 (ICT)',NULL,'Quisquam autus cibus crebro defluo adsuesco impedit sursum curia.'),(241,'Armando Smitham','olga.waelchi@hotmail.com','0933581607',NULL,'$2b$10$Jkl7Dgjh0o2Mlyg4Nf9gTO3L2dsGSorVap93Xm69vzCMe7QOabfJu','Buyer','Active','2025-10-13 17:00:00','2025-10-13 17:00:00',NULL,NULL,'','146 Airport Road, Port Asha','GMT+7 (ICT)',NULL,'Necessitatibus debilito somnus caste apostolus audax sunt.'),(242,'Jill Cronin','estelle_ondricka49@hotmail.com','0949592451',NULL,'$2b$10$tNYADYCOSJJUdKioQxs0jui2QWy9BkPhzYMBV7bEhM7A8IR2sfKZC','Buyer','Active','2025-11-11 17:00:00','2025-11-11 17:00:00',NULL,NULL,'Nam','6728 Brannon Via, New Dennisborough','GMT+7 (ICT)',NULL,'Atavus termes suspendo theatrum curtus charisma angulus aggredior curriculum natus.'),(243,'Gene Medhurst','catalina49@yahoo.com','0933640651',NULL,'$2b$10$YpRLKLAIMbqC9nRGaiZBqeGAUgggp.bNLLnVhxZN6Y/P7TMx3waxm','Buyer','Active','2025-11-04 17:00:00','2025-11-04 17:00:00',NULL,NULL,'Nam','210 Aimee Courts, Port Lavonnestead','GMT+7 (ICT)',NULL,'Aliquam vallum amiculum turbo.'),(244,'Iris Leffler','dashawn_pouros@yahoo.com','0969792872',NULL,'$2b$10$FBerAWhUiuGkJZN5HS2um.Y0.ccm.t95Cm1BBcNr8KCXFj8Oja2Wy','Seller','Active','2025-11-20 17:00:00','2025-11-20 17:00:00',NULL,NULL,'Nam','48460 Hansen Court, North Leanna','GMT+7 (ICT)',NULL,'Cogo vaco velum admoveo statua.'),(245,'Michele Swift','velma_rath67@yahoo.com','0964529918',NULL,'$2b$10$gxhRwjjvY7/OZUC.uDlr/OndOxh9x.3qrJdqgKJ1cTNEnYl26ADRq','Buyer','Active','2025-11-09 17:00:00','2025-11-09 17:00:00',NULL,NULL,'','60939 Ben Fork, Karianestad','GMT+7 (ICT)',NULL,'Admiratio amplus perspiciatis.'),(246,'Louise VonRueden','pascale.witting@yahoo.com','0999704194',NULL,'$2b$10$3OLELAyCTNtRFG9mp4Xxvem/Cwzvb88SN2PnH5NEd9kcexXGvYKyK','Buyer','Active','2025-11-16 17:00:00','2025-11-16 17:00:00',NULL,NULL,'','6113 Nathen Stream, Ianfield','GMT+7 (ICT)',NULL,'Benigne acies defessus carbo teres vicissitudo tum.'),(247,'Molly Tremblay','reynold87@yahoo.com','0977167064',NULL,'$2b$10$Hratu9QZhSJR7MXYEivOBuHNCOhOaOCotvuUdz.RHF4TAbJkF67gK','Seller','Active','2025-11-20 17:00:00','2025-11-20 17:00:00',NULL,NULL,'','563 Lodge Close, Amandafield','GMT+7 (ICT)',NULL,'Vinco careo velit ciminatio atque velum abduco.'),(248,'Chelsea Konopelski','theodore.ortiz@gmail.com','0972923533',NULL,'$2b$10$tyy80wtsjSssVWO2x8rmMegOKq4z5gxWb6tJRKTq7sV/J.74uvzFS','Admin','Active','2025-11-24 17:00:00','2025-11-24 17:00:00',NULL,NULL,'','72587 Jules Shores, Erwinland','GMT+7 (ICT)',NULL,'Artificiose illo odit ara.'),(249,'Flora Powlowski','maryse.dooley76@yahoo.com','0934428680',NULL,'$2b$10$4t0lMBrB8TcDES5mU8LhYOWFmfihckPokiUSs5LaWKfbwD9xYyq1S','Seller','Active','2025-11-16 17:00:00','2025-11-16 17:00:00',NULL,NULL,'Nam','7837 Hudson Way, San Jose','GMT+7 (ICT)',NULL,'Crapula suggero tergo.'),(250,'Ms. Pearl Bode','dena.fritsch40@hotmail.com','0935438724',NULL,'$2b$10$ctDMJBVj3wWlICOoKesMo.PwAwuT3b3CP2MBZ/ZdhDRHX2vAtQxGW','Admin','Active','2025-11-23 17:00:00','2025-11-23 17:00:00',NULL,NULL,'Nam','57169 Mabelle Islands, New Sydnee','GMT+7 (ICT)',NULL,'Coniecto rerum capio sponte.'),(251,'Margarita Ondricka V','hadley.beier@yahoo.com','0961219631',NULL,'$2b$10$qsRcSnO5pPtVk7fGOot11OW9b.0HLHsua1vr8kFQ9FtNLZY8T5dPy','Seller','Active','2025-11-24 17:00:00','2025-11-24 17:00:00',NULL,NULL,'Nam','684 Gracie Summit, East Cotyview','GMT+7 (ICT)',NULL,'Decens collum absens condico nesciunt amplitudo uter tergeo optio.'),(252,'Mrs. Claire Friesen DVM','jayde.prosacco@gmail.com','0985966028',NULL,'$2b$10$By9NL6WBM5aRx4oqhyN2fu9QgMVRBAxQWgCOWziZkX52zoXG/.D2a','Buyer','Active','2025-11-08 17:00:00','2025-11-08 17:00:00',NULL,NULL,'Nam','83735 Ernestina Parkways, North Heatherhaven','GMT+7 (ICT)',NULL,'Amplitudo allatus centum consuasor ipsam hic coniuratio.'),(253,'Dr. Rafael Stanton','dean_schoen93@hotmail.com','0942021192',NULL,'$2b$10$OmxRjWtpfsWLdiqqHxlRJ.Laq74ebjkachmpGpRJMbw20GNeWIpd2','Seller','Active','2025-11-15 17:00:00','2025-11-15 17:00:00',NULL,NULL,'Nam','6782 Corkery Road, Annieport','GMT+7 (ICT)',NULL,'Trans agnitio illo atqui crux paulatim patior bene.'),(254,'Dr. Leo O\'Connell','janae_paucek84@gmail.com','0936174668',NULL,'$2b$10$O6RoZxkh17Wb8TZsBkX94ufB3EfAOm4L8IkOsWxf62e75GlYwATVe','Seller','Active','2025-11-22 17:00:00','2025-11-22 17:00:00',NULL,NULL,'Nam','20765 Station Road, West Bennettshire','GMT+7 (ICT)',NULL,'Acies aer conitor sequi amitto patior laborum.'),(255,'Josephine Leannon','emanuel_dach@gmail.com','0963980144',NULL,'$2b$10$ycQXyAPPKW9UhR/RWy1Q6e50W0VPiwsuyxUKLCB7LlGLzIq29TiFC','Buyer','Active','2025-11-16 17:00:00','2025-11-16 17:00:00',NULL,NULL,'','40448 Arjun Centers, Waelchibury','GMT+7 (ICT)',NULL,'Tepesco uxor pauper talio conforto aro conduco attero.'),(256,'Dr. Clifton Rippin DVM','alden_willms39@gmail.com','0916389165',NULL,'$2b$10$KHmr2Lys2IYQ3rqiJeI75ues.jpfqYWHEZWhYu65Tckjp05uefuiK','Seller','Active','2025-11-16 17:00:00','2025-11-16 17:00:00',NULL,NULL,'Nam','6724 Halvorson Court, South Elza','GMT+7 (ICT)',NULL,'Spiculum convoco audentia architecto cubicularis.'),(257,'Henrietta Wisozk','sigrid_hansen@hotmail.com','0996808032',NULL,'$2b$10$tSw9qhClukauYXQkZqFPL.FA.rGwOfFG0emN8L4GAdohgOVxeSxdi','Buyer','Active','2025-07-03 17:00:00','2025-07-03 17:00:00',NULL,NULL,'Nam','650 Camden Grove, South Armandchester','GMT+7 (ICT)',NULL,'Undique repudiandae somniculosus usitas.'),(258,'Craig Torphy','kris.towne80@gmail.com','0920548781',NULL,'$2b$10$OZT5pCvucWjaS26t13aoPu/MA6lm0iAg8Cx75F86l0fQqZJqwhKIe','Seller','Active','2025-07-14 17:00:00','2025-07-14 17:00:00',NULL,NULL,'','1360 Pfannerstill Expressway, Paucekton','GMT+7 (ICT)',NULL,'Vestrum ipsum curvo tristis ventosus aliqua cupiditate.'),(259,'Faith Kerluke','helen1@hotmail.com','0913534494',NULL,'$2b$10$omqmI13vK2hdk.SRKPmkpuCTqvFfOPp0DphUf.Nat69cvo6I6BLKq','Buyer','Active','2025-07-05 17:00:00','2025-07-05 17:00:00',NULL,NULL,'','72579 Merritt Estates, Lake Marcia','GMT+7 (ICT)',NULL,'Volva uter similique statim solio bardus.'),(260,'Gregory Greenfelder','jennie85@hotmail.com','0942207979',NULL,'$2b$10$x/sun9udSV40yupYQoZEjeemo5enQ5sYknxJOMzq2Gbg4oSTYF2fK','Buyer','Active','2025-07-17 17:00:00','2025-07-17 17:00:00',NULL,NULL,'','426 W Broadway, East Shanny','GMT+7 (ICT)',NULL,'Concido varius adflicto.'),(261,'Dr. Bernice Feest','briana.schultz@yahoo.com','0962934265',NULL,'$2b$10$HHj2bW3l6fLpLEs35r9z.Ot5bUPnFFYdlkK4yLrjdIwoqXZLtHVFO','Buyer','Active','2025-07-25 17:00:00','2025-07-25 17:00:00',NULL,NULL,'Nam','43271 E State Street, West Alanna','GMT+7 (ICT)',NULL,'Amitto velum desipio inventore varietas blanditiis maxime stabilis.'),(262,'Jeannie Wiza','zion_jenkins86@gmail.com','0910996041',NULL,'$2b$10$8zahLZUL4HyBwD0FYr2Yle1DG00/N7A4KycVI9ecLSv07.9K/xgWW','Buyer','Active','2025-07-03 17:00:00','2025-07-03 17:00:00',NULL,NULL,'','4666 Napoleon Circle, Dejuanton','GMT+7 (ICT)',NULL,'Ipsa aequitas porro pax.'),(263,'Rochelle Lemke','leland_klein62@yahoo.com','0933326917',NULL,'$2b$10$EwFyWYfz9k3tLqOgKTxsWugUr3ExIXh9MvCAF2dezzuYmXxreonTy','Buyer','Active','2025-07-09 17:00:00','2025-07-09 17:00:00',NULL,NULL,'Nam','99372 Fabian Wall, West Jimmyton','GMT+7 (ICT)',NULL,'Ter exercitationem audio cupiditas villa laudantium arbustum decumbo tempus tardus.'),(264,'Anthony Bosco','demetris60@yahoo.com','0952040342',NULL,'$2b$10$wmHxJkq93xpbPppsaXADcOvmiNY8kqWTDITOBTZgB22JTkU4Mc/LK','Buyer','Active','2025-07-16 17:00:00','2025-07-16 17:00:00',NULL,NULL,'Nam','2901 Elm Road, West Xavier','GMT+7 (ICT)',NULL,'Sumptus stella adhaero adfectus dedico.'),(265,'Marion Ankunding II','carlotta93@yahoo.com','0979473458',NULL,'$2b$10$q.EMSCs38fNJLzux.jCFS.5M4fFSm7QK5Bx7YdyUBk0BzUCFxeLXK','Seller','Active','2025-07-21 17:00:00','2025-07-21 17:00:00',NULL,NULL,'Nam','80497 Spring Gardens, Fort Brandifurt','GMT+7 (ICT)',NULL,'Turbo aggredior aurum comitatus crapula communis creo ter.'),(266,'Lance Bergstrom','jerald.buckridge0@gmail.com','0943335098',NULL,'$2b$10$f1ztmth5Mjoz.7//BCiPL.rllKo5IdtGiw4Q.bW0nqqCcOzqfQ0aC','Seller','Active','2025-08-09 17:00:00','2025-08-09 17:00:00',NULL,NULL,'','6400 Chanel Field, Mertiefort','GMT+7 (ICT)',NULL,'Convoco victus ara terminatio appono thesis cognatus tubineus terror.'),(267,'Theresa Tillman','cory_blanda@yahoo.com','0921768930',NULL,'$2b$10$NsAcvk64umpfedzUYrAVvu2b7uVnpgyN130PDkc9uy2iFuxHvqgvK','Seller','Active','2025-08-18 17:00:00','2025-08-18 17:00:00',NULL,NULL,'','7996 Kuhn Crossroad, Highland','GMT+7 (ICT)',NULL,'Coma despecto cupio arto.'),(268,'Teri Goodwin','nannie.schimmel@yahoo.com','0973779359',NULL,'$2b$10$MD7Q7JC2NoEcLrSwciAKRuYOeSQ3pF8LitSTUX88AxXolCXv5Vuui','Buyer','Active','2025-08-25 17:00:00','2025-08-25 17:00:00',NULL,NULL,'Nam','612 Parisian Brooks, Port Cortney','GMT+7 (ICT)',NULL,'Antiquus incidunt depraedor ait.'),(269,'Bradford Kris','salvador.connelly@hotmail.com','0948018800',NULL,'$2b$10$HWtKaWmHUj8l7bfEu6S62e/2NsLAjiruxx0PD/haQRN2FXkE.R1xe','Seller','Active','2025-08-13 17:00:00','2025-08-13 17:00:00',NULL,NULL,'','2647 Hermina Extension, Aurorefort','GMT+7 (ICT)',NULL,'Inflammatio coepi velut laudantium absens adhuc amitto.'),(270,'Drew Miller','ahmed.emmerich93@gmail.com','0943877557',NULL,'$2b$10$CM7dnuqUZKiWtVys19QTp.VZv03tab.FEsW1HlEyymfCegiuzCZue','Buyer','Active','2025-08-01 17:00:00','2025-08-01 17:00:00',NULL,NULL,'Nam','32789 Poplar Road, Rhiannonhaven','GMT+7 (ICT)',NULL,'Desino stella communis cilicium ascisco beatae delego aegrotatio.'),(271,'Armando Macejkovic','lela7@hotmail.com','0933261212',NULL,'$2b$10$fxj9H27lRarKu6g.RtwuWuAmxBS1oTL9NZoLw5JeMwcpMFk1F0rwS','Buyer','Active','2025-08-22 17:00:00','2025-08-22 17:00:00',NULL,NULL,'','625 Eli Divide, Fremont','GMT+7 (ICT)',NULL,'Patria tamquam sit ago comptus tergo tolero.'),(272,'Monique Emmerich','retha28@gmail.com','0968706577',NULL,'$2b$10$L4JdNpytCCEyO7V.2yAwdOOhtvxmLOibM38sND9gHTc8MfU2nA2BW','Buyer','Active','2025-08-04 17:00:00','2025-08-04 17:00:00',NULL,NULL,'Nam','20533 W Broad Street, Tampa','GMT+7 (ICT)',NULL,'Cauda ocer volubilis ulterius circumvenio.'),(273,'Ms. Fannie Deckow','hiram.bode@yahoo.com','0987712899',NULL,'$2b$10$uhtTfxCO07frPuug/GVtBeAX7Y2IBXo3HyMn2HsifKysdqqymGRba','Buyer','Active','2025-08-23 17:00:00','2025-08-23 17:00:00',NULL,NULL,'Nam','1402 Ayden Views, Lake Rosendoton','GMT+7 (ICT)',NULL,'Ventito vere verus communis vitiosus.'),(274,'Lydia Pfeffer','lorna2@hotmail.com','0929880949',NULL,'$2b$10$NedCOvf2uB.WRKdgt/m92O9Dhf4ajCm3Qv7WhaPdRXx8/5.g5cnzy','Buyer','Active','2025-08-11 17:00:00','2025-08-11 17:00:00',NULL,NULL,'Nam','6085 Ruecker Motorway, Howellberg','GMT+7 (ICT)',NULL,'Suscipit pel dedico ater cuius via.'),(275,'Deborah Reynolds','aliza20@yahoo.com','0910215620',NULL,'$2b$10$E/t8I46UR60rN10ixd1KR.UdleFGw7R.uZ2v18gtVItnJgUU9Ff36','Buyer','Active','2025-08-13 17:00:00','2025-08-13 17:00:00',NULL,NULL,'Nam','75424 5th Avenue, Layton','GMT+7 (ICT)',NULL,'Amor copia comitatus supra admoveo abstergo absens.'),(276,'Perry Auer-Flatley','darryl.cummerata@hotmail.com','0960591731',NULL,'$2b$10$TjbbwiJz1mxUSg1MH9g2gu3ZgqmcL/XRabJRWmWymvgSB37yRMNRi','Buyer','Active','2025-08-14 17:00:00','2025-08-14 17:00:00',NULL,NULL,'','1340 Grange Road, Krajcikfort','GMT+7 (ICT)',NULL,'Vinco templum amiculum cupiditas ullus audio tergiversatio.'),(277,'Amy Gleason','kelsie.bechtelar28@yahoo.com','0977305262',NULL,'$2b$10$QoBtajGV9n/Qz64ef8hf8uzFQaa9F7N6kUvIaq9RMykyhGSBGZXq2','Buyer','Active','2025-07-31 17:00:00','2025-07-31 17:00:00',NULL,NULL,'','80108 N Maple Street, Port Oscarboro','GMT+7 (ICT)',NULL,'Acerbitas venia amo curtus.'),(278,'Dr. Stacy Howell','raphael.rutherford18@gmail.com','0936723798',NULL,'$2b$10$K8elzaEoGEguEj2bIFzIxe34io35Iigaw9gsYTUCMA.TQC46Gcyau','Seller','Active','2025-08-11 17:00:00','2025-08-11 17:00:00',NULL,NULL,'Nam','26345 Liberty Street, Hayesberg','GMT+7 (ICT)',NULL,'Titulus bellicus torqueo solum comprehendo convoco.'),(279,'Kari Stoltenberg','bill.klein30@hotmail.com','0915920769',NULL,'$2b$10$2NbnFQrzDXrKjNCCiJIJIOuoVWV8NNmvYZafMd.pBoxhtwj6tnyCC','Buyer','Active','2025-08-14 17:00:00','2025-08-14 17:00:00',NULL,NULL,'Nam','4111 Reinger Trace, Fort Pearlstead','GMT+7 (ICT)',NULL,'Quos aurum cumque accendo adsuesco.'),(280,'Heidi Braun','maud71@hotmail.com','0987380395',NULL,'$2b$10$LfN8UjKOhKtVlFPdLNxAoObZABgKGZoAl0BsWfpwZiyce1/7AX9de','Seller','Active','2025-08-26 17:00:00','2025-08-26 17:00:00',NULL,NULL,'Nam','86631 Little Tunnel, Bashirianfort','GMT+7 (ICT)',NULL,'Crur ipsa quos dignissimos ea.'),(281,'Willie Bradtke','lonzo.lindgren@yahoo.com','0935814265',NULL,'$2b$10$4CmWdvkOJxQbl1KFuu88XuzyGkU.ewhWwne6pXpx4PI5BtS.Ml2nS','Seller','Active','2025-09-05 17:00:00','2025-09-05 17:00:00',NULL,NULL,'Nam','673 Henry Street, Beattychester','GMT+7 (ICT)',NULL,'Pectus termes admoveo defaeco abduco bos acer suadeo.'),(282,'Celia Von','asa_harber@hotmail.com','0996665106',NULL,'$2b$10$u0phlwcOVGLxtqVb.31CX.WbUqb9rj2TEotJmRCWxK0pc9fm/TPb2','Buyer','Active','2025-08-31 17:00:00','2025-08-31 17:00:00',NULL,NULL,'','841 Hazel Grove, West Palm Beach','GMT+7 (ICT)',NULL,'Bos corona suadeo uterque amitto.'),(283,'Terry Murazik','maegan_daniel61@hotmail.com','0985658032',NULL,'$2b$10$nXRaxNp1mJucdkB5sIZdNO/r4iDBeC47iRgB6U/iMInX8wJIYlkDW','Buyer','Active','2025-09-04 17:00:00','2025-09-04 17:00:00',NULL,NULL,'Nam','125 Memorial Drive, Lednerstad','GMT+7 (ICT)',NULL,'Vesper provident tabella voluptate attollo amissio vehemens auxilium.'),(284,'Jeanne Schulist','brittany_schaefer@gmail.com','0951089142',NULL,'$2b$10$ggaaGh75WCdX0PlUFQ42SOfkF1PcwHUvWLVvb0ulf8BLQUcFBWwQu','Buyer','Active','2025-09-17 17:00:00','2025-09-17 17:00:00',NULL,NULL,'Nam','262 Cayla Ramp, Lake Horace','GMT+7 (ICT)',NULL,'Dolore vilis callide nisi creta contra antea voluptatibus.'),(285,'Stephanie Cremin','jo75@gmail.com','0979497544',NULL,'$2b$10$86fnRNvPPY9uB6Zqez7eGeUgDsH2A9wdqa5mQZUmB9O7GZzBGsbSG','Buyer','Active','2025-09-05 17:00:00','2025-09-05 17:00:00',NULL,NULL,'Nam','2606 Wehner Junctions, Runolfsdottirshire','GMT+7 (ICT)',NULL,'Vis vitium summopere beneficium ante cupiditate amicitia commodo uterque curriculum.'),(286,'Angel Luettgen','jasmin.connelly@gmail.com','0930488048',NULL,'$2b$10$WkDFzSLYv/gBdTp2nGwg5elDJsWCqZu6UmJUJQFHxe8QLwk8CP2ve','Seller','Active','2025-09-04 17:00:00','2025-09-04 17:00:00',NULL,NULL,'','83713 Ash Grove, Littleton','GMT+7 (ICT)',NULL,'Arto thalassinus comprehendo aequitas delectatio.'),(287,'Debbie Fisher','elwin.fritsch-sawayn45@gmail.com','0969016577',NULL,'$2b$10$lHNV4mRKM33xhkr52gLRYe1dt4mNjm3xCQF4SewqP0zar7CF2nNkm','Buyer','Active','2025-09-27 17:00:00','2025-09-27 17:00:00',NULL,NULL,'','381 Jaleel Bridge, New Clintonstead','GMT+7 (ICT)',NULL,'Spargo bos conor cohors vorax.'),(288,'Carole Nikolaus','edwina.dibbert60@yahoo.com','0940680399',NULL,'$2b$10$LcHsUVCQUGijR7vMQe9meOFkgyQhV6hdL5iqYhPCo1H7J44R1uzke','Buyer','Active','2025-09-08 17:00:00','2025-09-08 17:00:00',NULL,NULL,'Nam','13917 Franklin Street, Alexandraworth','GMT+7 (ICT)',NULL,'Vilitas spiritus crur decerno.'),(289,'Eloise Champlin','maudie.hyatt0@gmail.com','0993394802',NULL,'$2b$10$7WFesQCQDEk.L7dNGjfF.Oek.PuJ7SYWeTqvCntpYj5OYLq7iQ1ce','Buyer','Active','2025-09-07 17:00:00','2025-09-07 17:00:00',NULL,NULL,'Nam','83376 Main Road, Margareteland','GMT+7 (ICT)',NULL,'Suffragium amplus certus vetus calco vindico accedo.'),(290,'Phillip Bins','rick_turner@hotmail.com','0973558942',NULL,'$2b$10$2EaRCwaVn7WjKCmLiWpbDOiWnt0vmfALASoCFUn2PHDdX8Ew9lDvC','Admin','Active','2025-09-16 17:00:00','2025-09-16 17:00:00',NULL,NULL,'','9264 Blaze Place, Bergstromboro','GMT+7 (ICT)',NULL,'Appono taceo celebrer custodia vulgaris defetiscor super ara.'),(291,'Margaret Kunze','alvena_johns@yahoo.com','0937947605',NULL,'$2b$10$Dov7FnOrPKe9Xd0dnXbw0OrpEEze9VAZZ90.9gHfWMe0fo1gNl2lK','Seller','Active','2025-09-09 17:00:00','2025-09-09 17:00:00',NULL,NULL,'','8790 Pacocha Plain, West Enrique','GMT+7 (ICT)',NULL,'Defetiscor patrocinor facilis solio abstergo supellex turbo aut armarium.'),(292,'Ellen Towne','wyman99@yahoo.com','0938408337',NULL,'$2b$10$Lon3UjbjIPL0n51SgTaHtO2peKYRdg9MOv9R/nGc3/FPGl5.CLeh.','Buyer','Active','2025-09-01 17:00:00','2025-09-01 17:00:00',NULL,NULL,'Nam','411 Central Avenue, Reinastead','GMT+7 (ICT)',NULL,'Vergo alias color absconditus synagoga agnitio ustilo arto.'),(293,'Olive Jacobson','amya.wisozk@yahoo.com','0923486673',NULL,'$2b$10$Od4xO8X7DRgcJw13jbx9yu1YUaHRuoZ./oQqsTasb2.iFCrJhHvK.','Admin','Active','2025-09-15 17:00:00','2025-09-15 17:00:00',NULL,NULL,'Nam','94237 Bertrand Points, Bednarcester','GMT+7 (ICT)',NULL,'Varietas vetus quis ciminatio canto.'),(294,'Mr. Duane Robel','amber77@hotmail.com','0977202408',NULL,'$2b$10$JOpII99NdvBHJ5y.5NCi8O1wz3vNQQTSJlh7ptBAt1zwZ9bBX0Z4G','Seller','Active','2025-10-17 17:00:00','2025-10-17 17:00:00',NULL,NULL,'Nam','6036 Madison Street, Kreigerfurt','GMT+7 (ICT)',NULL,'Cicuta mollitia utique agnosco.'),(295,'Rodney Glover','alysson_schiller@gmail.com','0966602671',NULL,'$2b$10$K0cqQizBm63QySgq/uTPpu6y/6oxquNlP0LDAK7wLLYoDxexYbeES','Admin','Active','2025-10-17 17:00:00','2025-10-17 17:00:00',NULL,NULL,'Nam','4348 Olen Harbor, Vinceview','GMT+7 (ICT)',NULL,'Facere aegrus certus caritas surgo.'),(296,'Jody Corkery','tina54@hotmail.com','0926298004',NULL,'$2b$10$cybtqsMamA9ostMATj/SBOAPTydeRz9v85foEDHde.CVj8O4DvITO','Buyer','Active','2025-10-01 17:00:00','2025-10-01 17:00:00',NULL,NULL,'Nam','2819 Jeanette Plaza, Romaineberg','GMT+7 (ICT)',NULL,'Traho subnecto tego celer blanditiis triduana vesica doloremque.'),(297,'Andre Rogahn','maegan_jones46@gmail.com','0994999810',NULL,'$2b$10$oFwNleX5U1Bgksd.6z8FsOz8nBRh1BIBMiGuxrYNLNUxRWwFCW1nS','Seller','Active','2025-10-04 17:00:00','2025-10-04 17:00:00',NULL,NULL,'Nam','9177 Keven Locks, Port Kelsietown','GMT+7 (ICT)',NULL,'Usitas iste suscipit tergum solum color.'),(298,'Gwen Dach','mario.crist95@yahoo.com','0940546435',NULL,'$2b$10$Xp/u8/1ONnSIxJC8aiPn.u8kJf9MxNmGCAbjSXRYOHKE40Qz/j37y','Admin','Active','2025-10-14 17:00:00','2025-10-14 17:00:00',NULL,NULL,'Nam','8511 Terrence Union, Rogers','GMT+7 (ICT)',NULL,'Via placeat arcesso.'),(299,'Ms. Alyssa Willms','eve3@gmail.com','0933837523',NULL,'$2b$10$B5z6gMY81WMIUyVHqFOdeeq7BVaCF1XcNzJBiEpA/h8mFVFTe6ILq','Buyer','Active','2025-10-05 17:00:00','2025-10-05 17:00:00',NULL,NULL,'','2914 E North Street, Port Chrisboro','GMT+7 (ICT)',NULL,'Patria admiratio venio denego accusamus commodi adnuo certus eos comminor.'),(300,'Erik Metz','millie.adams-reynolds@hotmail.com','0937733261',NULL,'$2b$10$kBIPaKKFbQ3tozEMIRWx.usOcMKHUpisJGSim9y5U.vNHVB/XTChu','Buyer','Active','2025-10-12 17:00:00','2025-10-12 17:00:00',NULL,NULL,'Nam','2033 Broadway, Douglasstead','GMT+7 (ICT)',NULL,'Recusandae voveo capillus suppellex comptus adnuo corona denego.'),(301,'Monique Bednar','dominic.dooley@gmail.com','0996799578',NULL,'$2b$10$oenzXBNXB7i70lc/E9x2Nug8w/JJw8WvfWX/ZGomIeI5f9vA8zyvm','Buyer','Active','2025-10-27 17:00:00','2025-10-27 17:00:00',NULL,NULL,'Nam','96582 Mae Bridge, Marksland','GMT+7 (ICT)',NULL,'Totidem alienus suffoco accusamus spoliatio aeneus reprehenderit capio cupio.'),(302,'Evelyn Bogan','luciano.oberbrunner93@yahoo.com','0911413869',NULL,'$2b$10$1.mqjREWU1NRpUJ6Patt5eazLYTustSejgPpsdgEn5.I4WY588uSi','Seller','Active','2025-10-21 17:00:00','2025-10-21 17:00:00',NULL,NULL,'','56842 Ruth Route, Idaho Falls','GMT+7 (ICT)',NULL,'Aurum canis harum confugo.'),(303,'Mr. Darnell Lebsack MD','leanna.wintheiser@gmail.com','0958274626',NULL,'$2b$10$16w2e36nr.ozlrQ08EKF6u5m8yb6DgHbq0uPP6nIF483A9NUPji2e','Seller','Active','2025-11-27 17:00:00','2025-11-27 17:00:00',NULL,NULL,'Nam','8901 Ernser Keys, Mission','GMT+7 (ICT)',NULL,'Tamen adamo libero.'),(304,'Felicia Ernser-Larson','angus_hauck@gmail.com','0966289323',NULL,'$2b$10$C3xysdjjGUTn18ItMtU8FOZtr/UW14nM3RDUOZEppOnDk5sB9A6Py','Buyer','Active','2025-11-09 17:00:00','2025-11-09 17:00:00',NULL,NULL,'','54554 Glebe Close, Port Alvinaton','GMT+7 (ICT)',NULL,'Usitas amplus compello creo turba uredo vicissitudo.'),(305,'Carlos Nienow','torrance_wisozk70@yahoo.com','0966515257',NULL,'$2b$10$5nbwZWgHy.YpLVJUDJ9sZ.7Dq3nkk7HVJo1kqq9vvbTPfHY9.eDyO','Seller','Active','2025-11-06 17:00:00','2025-11-06 17:00:00',NULL,NULL,'','12784 Berge Cliffs, New Sydni','GMT+7 (ICT)',NULL,'Nulla arma aperte quo barba ventito denuncio cernuus temptatio vorax.'),(306,'Devin Cronin','christiana.rolfson-kuhic@hotmail.com','0934070953',NULL,'$2b$10$MyTsj26J38lr0wjlF5JVv.IY7HfdsdqB3aPiMlax9hAK9TXERs1BC','Buyer','Active','2025-11-20 17:00:00','2025-11-20 17:00:00',NULL,NULL,'Nam','422 Hanna Union, Theoland','GMT+7 (ICT)',NULL,'Clamo necessitatibus coepi valeo vallum vallum totus expedita.'),(307,'Guy Ferry','sherman.moen@gmail.com','0983501642',NULL,'$2b$10$mmEfhdRodxviSd/vkMKiEecWP2SOjQqwdXtbDLIPUkOR1Y.42N8au','Buyer','Active','2025-11-15 17:00:00','2025-11-15 17:00:00',NULL,NULL,'Nam','97093 Christian Prairie, Florence-Graham','GMT+7 (ICT)',NULL,'Tabesco benevolentia absorbeo contra eligendi versus victus.'),(308,'Ida Haag','sally.koch@yahoo.com','0993501221',NULL,'$2b$10$hrdArIMg3gREfRnYkUI6oOXpZOsj6QSJ/82JfVgkOfXRB6unbjAD.','Buyer','Active','2025-11-26 17:00:00','2025-11-26 17:00:00',NULL,NULL,'','77618 DuBuque Views, Jorgeborough','GMT+7 (ICT)',NULL,'Charisma contigo paulatim xiphias solus claustrum non ubi dolores tametsi.'),(309,'Alicia Kuphal','tatum54@gmail.com','0915454890',NULL,'$2b$10$IQAPOkuKZhuDXLsXDXM66OqI32b.5g5Oj6BD/r3tPBishr7AyuO.6','Seller','Active','2025-11-02 17:00:00','2025-11-02 17:00:00',NULL,NULL,'Nam','8143 Reichert Crescent, East Dariana','GMT+7 (ICT)',NULL,'Architecto maiores aptus crepusculum curriculum.'),(310,'Steve Lang','rollin.brekke34@yahoo.com','0926847210',NULL,'$2b$10$TIrPkKGQXVr9DgLbA17R/OEF.rofLTAk/UV.o.Qa6QYp4BhC3jFy6','Buyer','Active','2025-11-03 17:00:00','2025-11-03 17:00:00',NULL,NULL,'Nam','58830 Shanna Knoll, Bartolettiport','GMT+7 (ICT)',NULL,'Voveo sumptus tempus sint certus amplus.'),(311,'Mitchell Buckridge','joanne_oberbrunner@hotmail.com','0960873326',NULL,'$2b$10$p3LEa32eRQFUfvntzguWvOeckQdKE6ed9FE5psNL1rSkl/E4LcQ.a','Admin','Active','2025-11-08 17:00:00','2025-11-08 17:00:00',NULL,NULL,'','9701 Mary Street, La Mirada','GMT+7 (ICT)',NULL,'Utilis perferendis delicate.'),(312,'Estelle Herzog','lura_schuster53@yahoo.com','0949069880',NULL,'$2b$10$00sESOYvIKJIpJA5ZjNL0uFYCEtoxFJ/bZpFJ3RE1H7Ty.4SLFsMC','Admin','Active','2025-11-18 17:00:00','2025-11-18 17:00:00',NULL,NULL,'','23618 W 4th Street, Rempelfort','GMT+7 (ICT)',NULL,'Cursus cultura adiuvo callide adicio vitium benigne terebro.'),(313,'Joe Johnson','damon99@gmail.com','0993397378',NULL,'$2b$10$EWd9UPct2ltyScXirGNJIupmYCizSnNoh1IbWIzuzcClvLbKbRg9K','Buyer','Active','2025-07-17 17:00:00','2025-07-17 17:00:00',NULL,NULL,'Nam','697 Cecil Creek, West Fausto','GMT+7 (ICT)',NULL,'Deleniti temporibus collum certe.'),(314,'Eloise Nienow','brendon_kuvalis@hotmail.com','0960370271',NULL,'$2b$10$Zz5gr4J01cWtdUgDI4j8Su5oZ62/KWov7hDY5fLjTRaG6XnOr6eny','Buyer','Active','2025-07-06 17:00:00','2025-07-06 17:00:00',NULL,NULL,'','49241 S Washington Avenue, South Ivah','GMT+7 (ICT)',NULL,'Pecus deserunt verumtamen doloremque cauda porro conor desparatus.'),(315,'Joey Auer','major_braun@gmail.com','0910076584',NULL,'$2b$10$1dil6q.TjbC8TVnqdRcfcenq7awLxAub8H/HH1Ip3g2cUGJZgK/vG','Seller','Active','2025-07-05 17:00:00','2025-07-05 17:00:00',NULL,NULL,'Nam','116 S Maple Street, Millcreek','GMT+7 (ICT)',NULL,'Adduco caritas tabgo dignissimos.'),(316,'Agnes Kertzmann Jr.','kurt64@yahoo.com','0913030921',NULL,'$2b$10$3DcpLzIba20VowlvdhkFdeX77YC2ISIbUhD.Pg..ha2sUAObSCXPO','Buyer','Active','2025-07-05 17:00:00','2025-07-05 17:00:00',NULL,NULL,'','26548 Crona Corner, Hegmannfort','GMT+7 (ICT)',NULL,'Socius eligendi cicuta.'),(317,'Ada Kuhn','napoleon.kuhic@gmail.com','0938603133',NULL,'$2b$10$qZVzFQmPFQDeKWiakY3hkO8Uhmcva5qx0NMI49G6iZ/PsbBU.SdMS','Buyer','Active','2025-07-21 17:00:00','2025-07-21 17:00:00',NULL,NULL,'Nam','37884 Bogisich Junction, Nitzscheborough','GMT+7 (ICT)',NULL,'Nobis unus suadeo acies ascit.'),(318,'Teresa Breitenberg MD','meaghan29@yahoo.com','0938032786',NULL,'$2b$10$sggF1/VQAhOVeXYcXtDN9OKNoXjRGG9632RIwl4eSMv0V7u4dMygq','Buyer','Active','2025-07-14 17:00:00','2025-07-14 17:00:00',NULL,NULL,'Nam','859 Kautzer Garden, North Bessie','GMT+7 (ICT)',NULL,'Tertius tantillus veritas pectus dedecor aspicio thermae.'),(319,'Ricky Rodriguez','johnathan56@hotmail.com','0999384065',NULL,'$2b$10$7ilfXV/sgTS8zMhMC0cGCels7UL1w4Nysbo5cT/U1W9/uR4AuHB0m','Seller','Active','2025-07-16 17:00:00','2025-07-16 17:00:00',NULL,NULL,'','66255 Vernie Brooks, Macyburgh','GMT+7 (ICT)',NULL,'Video tertius aranea.'),(320,'Santiago Labadie','elias_strosin75@yahoo.com','0918004806',NULL,'$2b$10$bQ40E26OjMdyq/XYpwM5eOK5IZfAe1nAANipO2A1MYpLXkCof/Js2','Buyer','Active','2025-07-11 17:00:00','2025-07-11 17:00:00',NULL,NULL,'Nam','44385 Isaias Track, North Miami Beach','GMT+7 (ICT)',NULL,'Placeat tantum combibo vir vir tardus.'),(321,'Opal Goodwin','justyn_fritsch41@hotmail.com','0972046593',NULL,'$2b$10$bsMGJK2HSo3EYVN/.5mm5OPC55ePgEmjULQp6ZuwNlSsOfh/CXGdy','Buyer','Active','2025-07-17 17:00:00','2025-07-17 17:00:00',NULL,NULL,'Nam','78109 Fore Street, Petaluma','GMT+7 (ICT)',NULL,'Vester abutor vulgo consequuntur curia.'),(322,'Randy Langosh','vladimir28@yahoo.com','0971371822',NULL,'$2b$10$TIQo.isJFM6x0lzwdTBBHeHAh2CGmtVzPGONdi29MYeoAme4CT1la','Buyer','Active','2025-07-24 17:00:00','2025-07-24 17:00:00',NULL,NULL,'Nam','323 N Pine Street, Fort Shayleeland','GMT+7 (ICT)',NULL,'Autem nihil asperiores coaegresco crastinus vivo incidunt.'),(323,'Natasha McCullough','emery_stiedemann@yahoo.com','0930306558',NULL,'$2b$10$9EDUpndus8JUq7nBv6o/OOc5ItDg8WGAXt.JOenTYQfg9g8vBFSdm','Seller','Active','2025-07-09 17:00:00','2025-07-09 17:00:00',NULL,NULL,'Nam','8992 Leilani Unions, Karelleburgh','GMT+7 (ICT)',NULL,'Expedita cursus consequuntur succurro tergum.'),(324,'Adrienne Jast','gavin83@yahoo.com','0964625652',NULL,'$2b$10$ZgF6oDcLjNKCbXldCPTsZefm5Q1jcuEG8S82JphY5NpO6zeZ.y0uO','Admin','Active','2025-07-17 17:00:00','2025-07-17 17:00:00',NULL,NULL,'Nam','6605 Koelpin Dam, Cathedral City','GMT+7 (ICT)',NULL,'Teneo crustulum summa thema vindico contabesco charisma crebro esse quidem.'),(325,'Leroy Tremblay','albina.lind@hotmail.com','0981853306',NULL,'$2b$10$NndXP.oGAy6YY6SGKrqhp.3f05P9BZs8EKB89IJvKwk1DG2Tp.dx2','Buyer','Active','2025-07-01 17:00:00','2025-07-01 17:00:00',NULL,NULL,'Nam','42064 The Oaks, Collierville','GMT+7 (ICT)',NULL,'Deprecator adeo solus amoveo alii.'),(326,'Mathew Hane Jr.','althea_hoppe@hotmail.com','0975545349',NULL,'$2b$10$1qzNpiFhgxa1SPJyX9lC9uVKmc1AvjROsVnZqacBMeGyrADUQTqMS','Buyer','Active','2025-07-19 17:00:00','2025-07-19 17:00:00',NULL,NULL,'Nam','2114 Claremont Road, West Candidoshire','GMT+7 (ICT)',NULL,'Clamo autus rem solus abutor convoco textor sortitus.'),(327,'Mr. Garry Hayes MD','lynn_hudson@yahoo.com','0951747486',NULL,'$2b$10$SSRcb8LSiumFYZq8x12vfub/HVwiJGmWZyv5NIPXQeBjNzB3QpX56','Buyer','Active','2025-08-05 17:00:00','2025-08-05 17:00:00',NULL,NULL,'','476 Stiedemann Cliff, Meganeberg','GMT+7 (ICT)',NULL,'Ubi custodia amplus distinctio aequitas aggero tempora tamquam umerus.'),(328,'Rickey Cartwright','helga48@yahoo.com','0980254488',NULL,'$2b$10$lgtsEn9vKk0dppuvy.5ouuxYsi5oYsUj5KpIlG.K2nPGZNhd.mcvq','Buyer','Active','2025-08-18 17:00:00','2025-08-18 17:00:00',NULL,NULL,'Nam','99280 S Division Street, West Hartford','GMT+7 (ICT)',NULL,'Amo nostrum desidero tabesco doloremque repudiandae antiquus tenax adopto.'),(329,'Andre Graham','isaias_koepp@yahoo.com','0991322063',NULL,'$2b$10$aV1TdJH5D5IeWmASOtG0NuH/ipYuivbkBgTvz1ghGNkHeQMAz0n4a','Buyer','Active','2025-08-04 17:00:00','2025-08-04 17:00:00',NULL,NULL,'Nam','3960 Kenneth Ramp, Christiansenborough','GMT+7 (ICT)',NULL,'Bis calcar tonsor ager ullus vehemens quis neque tamisium.'),(330,'Mrs. Veronica Welch','novella.ankunding86@hotmail.com','0939614154',NULL,'$2b$10$oNuMg.CxZizihpb4RHMZOeeM89DGtq87Br1jwwIPkKh5oO8RNmJoW','Buyer','Active','2025-08-24 17:00:00','2025-08-24 17:00:00',NULL,NULL,'','869 Meadow Lane, Gutkowskihaven','GMT+7 (ICT)',NULL,'Calco talus defluo aegre tamisium capitulus est tyrannus.'),(331,'Wm Marks','horace.schaefer@yahoo.com','0919500624',NULL,'$2b$10$zar1htHk0hZbgIYCq2Ml4.NV79ZZcpIcYbj8561tqxNAYIOOK08pm','Buyer','Active','2025-08-13 17:00:00','2025-08-13 17:00:00',NULL,NULL,'Nam','943 Ruecker Keys, New Durward','GMT+7 (ICT)',NULL,'Damno debeo adamo caelum cotidie fuga quisquam vitiosus.'),(332,'Dr. Edward Bauch','mercedes_brakus58@hotmail.com','0940185899',NULL,'$2b$10$fx.uCqZuRmhJTBNk8v/zTus2tA1h3QjOsDMKQHGMGSrenN0q5Vasy','Admin','Active','2025-08-27 17:00:00','2025-08-27 17:00:00',NULL,NULL,'','9893 Stehr Stravenue, Darrelburgh','GMT+7 (ICT)',NULL,'Statua trepide vacuus assentator veniam comburo patior vociferor ipsa.'),(333,'Lindsey Kris','horacio_bahringer4@gmail.com','0916323877',NULL,'$2b$10$xgp0x0vbhrKfw7UifebEjOUdMU3x.iMImXh2oh1DXv/aHJU3DLJ1G','Buyer','Active','2025-07-31 17:00:00','2025-07-31 17:00:00',NULL,NULL,'Nam','3696 Roman Way, Laurianneberg','GMT+7 (ICT)',NULL,'Conicio commodi clarus velociter adversus utor.'),(334,'Randal Crona','judy.mertz36@yahoo.com','0938303070',NULL,'$2b$10$D6kmkBH7a.iRp7Iv0fck0ecXIjRrdNz4Ea8N0bSp92Qad3/bsopD.','Buyer','Active','2025-08-26 17:00:00','2025-08-26 17:00:00',NULL,NULL,'Nam','2984 Tressie Locks, Gertrudestad','GMT+7 (ICT)',NULL,'Exercitationem sumptus absum conatus appono tyrannus aranea tres.'),(335,'Ruth Kris','belle.pfannerstill@yahoo.com','0936140425',NULL,'$2b$10$p1q76O18CMYh/HFq.lUlZONBa7DI71tfaXN7H7BQDTwj/2lj6.kha','Seller','Active','2025-08-22 17:00:00','2025-08-22 17:00:00',NULL,NULL,'','1568 Grimes Dale, Lake Agustina','GMT+7 (ICT)',NULL,'Facilis thalassinus tum solutio conatus depono crapula surculus.'),(336,'Estelle Lind','adell.conn@yahoo.com','0937297768',NULL,'$2b$10$jQw6ygHZ6ngg4ir8jsdN0e1LJowxkDt4fDMnIKu3oQ7p97v1fa532','Buyer','Active','2025-08-06 17:00:00','2025-08-06 17:00:00',NULL,NULL,'','44979 Trinity Road, South Monaburgh','GMT+7 (ICT)',NULL,'Ultio aperiam adnuo spargo turbo bis ait temporibus succedo perspiciatis.'),(337,'Katrina Veum','nella_howell@gmail.com','0979039694',NULL,'$2b$10$1uRtNm258S..scSudhxKRuhCi92MoF8rXnuj6YW5YL8XRkt.jxbyS','Seller','Active','2025-09-18 17:00:00','2025-09-18 17:00:00',NULL,NULL,'Nam','69680 E Cedar Street, Elmhurst','GMT+7 (ICT)',NULL,'Aggredior sollicito desolo aggredior venustas.'),(338,'Virgil Crona','lee_johnston97@hotmail.com','0976582213',NULL,'$2b$10$Fa1gzdEhO1ZCloiD/HKwhewPsTWjV74NZ7RmZmMaRRZt9n/NtOxTG','Buyer','Active','2025-09-17 17:00:00','2025-09-17 17:00:00',NULL,NULL,'Nam','670 Tad Valleys, Bentonville','GMT+7 (ICT)',NULL,'Cultellus cuppedia ut.'),(339,'Cynthia Mann PhD','maeve58@gmail.com','0911454101',NULL,'$2b$10$.Kt43TNt9uE8GV82.v5aneyuNd/GYU03k3u.7Ke/MpOFN7zIdFDzy','Buyer','Active','2025-09-07 17:00:00','2025-09-07 17:00:00',NULL,NULL,'Nam','564 Littel Coves, Baytown','GMT+7 (ICT)',NULL,'Tantillus animi ater eius tricesimus veritatis umbra cogo cornu.'),(340,'Alberta Larkin PhD','davion_flatley21@gmail.com','0989213967',NULL,'$2b$10$o08glPo0Yp0dNjl.QrGxq.BVtlBGFKjzo7hoG2xN60X0yeGLgC5yC','Buyer','Active','2025-09-06 17:00:00','2025-09-06 17:00:00',NULL,NULL,'Nam','5002 Franecki Key, Lincoln','GMT+7 (ICT)',NULL,'Victoria corrumpo atqui.'),(341,'Bradford Murphy II','elisha_beier76@hotmail.com','0923689394',NULL,'$2b$10$Re2c8.lt3S.f1RxZQwk.IOL08jyHkzzUFJk9zVJpf/sikRnyjMR0G','Buyer','Active','2025-08-31 17:00:00','2025-08-31 17:00:00',NULL,NULL,'Nam','905 Mercedes Brooks, North Norval','GMT+7 (ICT)',NULL,'Aetas teneo combibo via carus sulum.'),(342,'Tabitha Goodwin IV','jaylen_lesch36@yahoo.com','0949071766',NULL,'$2b$10$76RBctfV468dZoQLzSgEgOYSz2rGfHaUYa1q1D6ndSBwo5OIK9iDa','Seller','Active','2025-09-21 17:00:00','2025-09-21 17:00:00',NULL,NULL,'Nam','97052 Rickey Viaduct, Goodwinworth','GMT+7 (ICT)',NULL,'Ager catena vetus dignissimos.'),(343,'Micheal Gutkowski','julian45@yahoo.com','0986339509',NULL,'$2b$10$dI/pC8Z1T6qKt5RmUsrcSOJ8aPvKYWTPLhYLe41OPSJUnZwgT8ig.','Seller','Active','2025-09-20 17:00:00','2025-09-20 17:00:00',NULL,NULL,'','60471 Griffin Ways, Boyerstad','GMT+7 (ICT)',NULL,'Tempora antiquus desino.'),(344,'Kenny Gutmann','nolan2@gmail.com','0967227593',NULL,'$2b$10$GmZxgR1mckisLkSWz3vrN.ucZnfXAbxZ2MrdpQmMXZVlP9lLEK6dK','Buyer','Active','2025-09-10 17:00:00','2025-09-10 17:00:00',NULL,NULL,'Nam','34315 N Water Street, Pueblo','GMT+7 (ICT)',NULL,'Concedo creo dapifer cupio deleo appello creber sophismata conspergo aequus.'),(345,'Van Shanahan PhD','lucio.bailey69@hotmail.com','0917497741',NULL,'$2b$10$Xt.VGjhAmh1FirhYwAa6Rua.5v3GaIzPiXMZgblUJKOnQbnVlFNPa','Admin','Active','2025-09-21 17:00:00','2025-09-21 17:00:00',NULL,NULL,'','955 Rosenbaum Shoal, Bednarstad','GMT+7 (ICT)',NULL,'Praesentium esse ipsum dolores contego ambitus.'),(346,'Bessie Hand','maggie6@yahoo.com','0991416681',NULL,'$2b$10$bEjo0bcQsHgrlvTNCFNq2e06jh8CpDWpzPULAm9MtiPsfRl.0lJym','Seller','Active','2025-10-07 17:00:00','2025-10-07 17:00:00',NULL,NULL,'','7309 Cleveland Oval, Bethesda','GMT+7 (ICT)',NULL,'Denuncio studio aetas perspiciatis spero.'),(347,'Wm Hartmann','fred.lynch6@hotmail.com','0929028764',NULL,'$2b$10$4fy0nX.1D5ndS42IYCFpSOWZzztYGgUnriQoKG1Nl/andlJng89cW','Seller','Active','2025-10-01 17:00:00','2025-10-01 17:00:00',NULL,NULL,'Nam','98294 Coronation Avenue, Marcuscester','GMT+7 (ICT)',NULL,'Aptus utilis spiritus fuga charisma expedita.'),(348,'Miguel Satterfield','jadon73@gmail.com','0931403839',NULL,'$2b$10$WIysBTN2G7kcwFxyI10t2.X.1DHBiMIgc9/6omsUHzEQdsXeutuOq','Buyer','Active','2025-10-17 17:00:00','2025-10-17 17:00:00',NULL,NULL,'','1493 Reanna Walk, North Kirabury','GMT+7 (ICT)',NULL,'Volutabrum vae libero.'),(349,'Barbara Marks','friedrich.parisian@yahoo.com','0975261613',NULL,'$2b$10$SdveYGXnPsJzila3eMuzhunmGDGLG78jUDQLVDeNfPQ/v11ajBk1m','Seller','Active','2025-09-30 17:00:00','2025-09-30 17:00:00',NULL,NULL,'','245 Marquardt Vista, Lake Diegotown','GMT+7 (ICT)',NULL,'Copiose solum ceno amicitia volutabrum consuasor adimpleo cerno.'),(350,'Mercedes Flatley DDS','cedrick_bauch@yahoo.com','0971127163',NULL,'$2b$10$O/p4vxYq197wtCXYHg38JeA3/9xeHA.1.1ddWC9Z6z4sIn1L.1QcW','Admin','Active','2025-10-20 17:00:00','2025-10-20 17:00:00',NULL,NULL,'','9557 N Central Avenue, Fort Erica','GMT+7 (ICT)',NULL,'Volo admiratio uterque arbor audacia comes.'),(351,'Julia Witting','alfreda.schoen-keebler@gmail.com','0992328476',NULL,'$2b$10$us/g61EkeI19zwMEODixFeKE6LAuUYJZuvt2tyqpe3Idn8LAi4.wq','Buyer','Active','2025-10-26 17:00:00','2025-10-26 17:00:00',NULL,NULL,'','36586 Vicarage Lane, Fort Jeffereyside','GMT+7 (ICT)',NULL,'Quas curiositas ver expedita nam.'),(352,'Joy Fisher','kailee_schaefer6@yahoo.com','0928398448',NULL,'$2b$10$TanKLGfXXfiIe9rHligR5Of/9.H1p3HAZJnqBMbLqrQFbFc7/AkXK','Buyer','Active','2025-10-11 17:00:00','2025-10-11 17:00:00',NULL,NULL,'Nam','9019 Tudor Close, Helenburgh','GMT+7 (ICT)',NULL,'Amet voluptatum verbera absconditus canonicus arca summisse.'),(353,'Maryann Cartwright','edmond24@hotmail.com','0945199803',NULL,'$2b$10$OM347DxSjKZTKkX.4PC03u47M/N/RDBpIlL056Ius9lsioON6js7q','Seller','Active','2025-10-19 17:00:00','2025-10-19 17:00:00',NULL,NULL,'','81603 Bryon Coves, North Tate','GMT+7 (ICT)',NULL,'Nulla xiphias aegrus capio molestiae rem allatus.'),(354,'Mr. Jermaine Pouros','virgil.cronin-schneider@gmail.com','0979514296',NULL,'$2b$10$Oveqw86HshFRa.100GQQUukdyDnWBOeNzCIbeEPRNAv6eTOICe08q','Buyer','Active','2025-10-27 17:00:00','2025-10-27 17:00:00',NULL,NULL,'','813 North Avenue, Hartmannchester','GMT+7 (ICT)',NULL,'Vester umquam tamisium.'),(355,'Alvin Koch','edgar81@gmail.com','0941289961',NULL,'$2b$10$QYYgz0yhmdDFPP3N8r3g7OO.KvWBWA2rgblZuqIqqeHw9Xbnnkxcq','Admin','Active','2025-10-23 17:00:00','2025-10-23 17:00:00',NULL,NULL,'Nam','215 N Broadway, West Mariano','GMT+7 (ICT)',NULL,'Coaegresco corroboro clam virtus quo eum deripio pectus utpote vado.'),(356,'Tonya Keeling','genesis.franecki@gmail.com','0946635315',NULL,'$2b$10$mNdYlRvli5qkI9P2EIKdXOiOeP8ZgEecCMQU7T0nq792zgU8Y10Qi','Buyer','Active','2025-10-08 17:00:00','2025-10-08 17:00:00',NULL,NULL,'Nam','801 Zoe Path, Rahulberg','GMT+7 (ICT)',NULL,'Subseco paulatim approbo degenero traho cognomen velut sto.'),(357,'Caleb Treutel','amani64@gmail.com','0924168311',NULL,'$2b$10$pkQSf6R3QH4.BZNnCZfeW.KnxJEhLzvPHHGTdBpIYr5iXEiqlbR7W','Seller','Active','2025-11-05 17:00:00','2025-11-05 17:00:00',NULL,NULL,'','9451 Hazel Grove, Fort Denaport','GMT+7 (ICT)',NULL,'Arca unde quaerat vigilo caput.'),(358,'Olivia Hegmann','rowan45@yahoo.com','0911846500',NULL,'$2b$10$b2OyQkZwAS5yfHBQAZDuA.MHSu1yl5RdEcnU6s9eq1iw3ob0j23V6','Buyer','Active','2025-11-27 17:00:00','2025-11-27 17:00:00',NULL,NULL,'Nam','8557 Donald Course, Damienshire','GMT+7 (ICT)',NULL,'Spoliatio timor curo depereo adipisci communis defaeco quis terror.'),(359,'Melba Jacobson','mariam55@yahoo.com','0943867150',NULL,'$2b$10$23c/TPNofnmEj9xnq4iaEukyGzrauZk/0Dfo1Wz8NfUY2bGx/qb8u','Buyer','Active','2025-11-27 17:00:00','2025-11-27 17:00:00',NULL,NULL,'','7111 Bruen Lakes, Kenneditown','GMT+7 (ICT)',NULL,'Voco convoco dicta cogito.'),(360,'Christian Block','uriel35@hotmail.com','0953294932',NULL,'$2b$10$tCjoUa7guNl0dxsjRbsHeugjGc1C4iaKiLrn.SwhzydtPo6VEoWt.','Admin','Active','2025-11-11 17:00:00','2025-11-11 17:00:00',NULL,NULL,'Nam','9947 Trever Meadows, Neilberg','GMT+7 (ICT)',NULL,'Video territo soluta certe cogo truculenter exercitationem.'),(361,'Mr. Andrew Harris Sr.','anabelle79@hotmail.com','0960401670',NULL,'$2b$10$8XYZULD90iilladPzt2JIeuvOBR7dNVNHEcvzBWPcLtMd95Hgeote','Seller','Active','2025-11-11 17:00:00','2025-11-11 17:00:00',NULL,NULL,'','500 Stracke Ferry, Abbottberg','GMT+7 (ICT)',NULL,'Tracto tenuis umbra totus ipsa thesaurus ratione delectus thalassinus utor.'),(362,'Clark Friesen','hosea.haley@hotmail.com','0950698184',NULL,'$2b$10$Bq3A6J.A2g.3HF4X5iOc0Oq7y15fZwSeFHOxiq7MVor0ayXrhExky','Admin','Active','2025-11-04 17:00:00','2025-11-04 17:00:00',NULL,NULL,'Nam','677 McCullough Harbors, North Dillon','GMT+7 (ICT)',NULL,'Sum aduro laboriosam coepi.'),(363,'Dr. Debbie Volkman I','osborne_smitham20@yahoo.com','0911370086',NULL,'$2b$10$keV3V2urIVB/ftxWvsFU0OSVf4D.pVzuK2zO4V57NdrnOMwIm.n4u','Buyer','Active','2025-11-21 17:00:00','2025-11-21 17:00:00',NULL,NULL,'Nam','251 Moises Land, Abilene','GMT+7 (ICT)',NULL,'Debeo ipsum patrocinor architecto tum cupio uter atrocitas error cervus.'),(364,'Randy Reilly','dayne_williamson48@yahoo.com','0914061472',NULL,'$2b$10$y2bdIxZkhSiMqbW8OzzGZev5XV8X.c4leCfZarUaHwk5lCcR0YFhq','Buyer','Active','2025-11-15 17:00:00','2025-11-15 17:00:00',NULL,NULL,'Nam','568 Orn Street, East Isabellatown','GMT+7 (ICT)',NULL,'Caries defungo crapula corrigo succedo avarus eligendi fuga sub.'),(365,'Joanne Lindgren','kaleb59@gmail.com','0985531503',NULL,'$2b$10$Rtc.ZqEocV0y5fV/rgnEVuZZm2MUQsio6vNdEShyJ8QFzxh8bQ6j.','Buyer','Active','2025-07-01 17:00:00','2025-07-01 17:00:00',NULL,NULL,'Nam','869 Bulah Streets, Rolfsonfort','GMT+7 (ICT)',NULL,'Cimentarius titulus stips.'),(366,'Kim Tillman DDS','tyrel63@hotmail.com','0940685071',NULL,'$2b$10$6vCAr3O.gwNZkrr0SAkiqeZ7qd7jUA9PTgfRpGWLTrXTM8Mvtbu1q','Buyer','Active','2025-07-21 17:00:00','2025-07-21 17:00:00',NULL,NULL,'','9133 Farrell Views, Sonnychester','GMT+7 (ICT)',NULL,'Doloremque expedita cruentus infit sumptus versus crux tabernus vix.'),(367,'Desiree Runolfsdottir','oswald7@hotmail.com','0921004943',NULL,'$2b$10$srTo.dx8tTpqZpM1ev3BpesGmVb9xYWWHTg9gXjkdDdsICccHPSK6','Buyer','Active','2025-07-16 17:00:00','2025-07-16 17:00:00',NULL,NULL,'Nam','6282 Cliff Road, Fort Evanburgh','GMT+7 (ICT)',NULL,'Amet ter nihil thesaurus deripio iusto derideo.'),(368,'Oliver Mayer','madisyn38@gmail.com','0962351833',NULL,'$2b$10$NtxE309gO3VpT1cT5Pc4Qe9MLR1cccypSsd7uBYzH8CckjwOAvxu2','Admin','Active','2025-07-18 17:00:00','2025-07-18 17:00:00',NULL,NULL,'','51789 Hazel Close, South Dessie','GMT+7 (ICT)',NULL,'Deporto uxor angustus cui tergum.'),(369,'Reginald Thiel','dixie10@hotmail.com','0948916320',NULL,'$2b$10$V3gcdLYfdk63Eos0vqH3Ve8fDJEgKRXcLJc85KMBeQjOsi1vl58Bu','Buyer','Active','2025-07-21 17:00:00','2025-07-21 17:00:00',NULL,NULL,'','9737 Eugenia Keys, Rialto','GMT+7 (ICT)',NULL,'Magnam suffragium trepide adeptio blandior minus verto tyrannus thymum.'),(370,'Ian Schneider','orland_ferry@hotmail.com','0946373386',NULL,'$2b$10$Qg1cxQk0VsnsCXlkOijTFOrnETOxz2QS2ygb9a7mksh59.mBCOv/u','Buyer','Active','2025-07-21 17:00:00','2025-07-21 17:00:00',NULL,NULL,'','82152 Devon Valley, Bridgeport','GMT+7 (ICT)',NULL,'Degero vulnus cetera surculus vindico sortitus quos ventus capitulus.'),(371,'Sherry Bashirian','trent67@gmail.com','0923948750',NULL,'$2b$10$D.P8p2J3YRK4ehCYBiZIVeJOXMFYdGEfjdNcVJAzRKKBiCnGNar/K','Buyer','Active','2025-07-20 17:00:00','2025-07-20 17:00:00',NULL,NULL,'Nam','9093 Riverside Avenue, New Bertrandport','GMT+7 (ICT)',NULL,'Coruscus cernuus tam attero.'),(372,'Beulah Beier','norwood_batz-bashirian@yahoo.com','0989902989',NULL,'$2b$10$l9nCVuUxqqTAysnyXOS0Q.FM7HR/1SD6jBBhhWB2r3622w6Y1MPMi','Buyer','Active','2025-07-26 17:00:00','2025-07-26 17:00:00',NULL,NULL,'Nam','7985 Smith Radial, Karichester','GMT+7 (ICT)',NULL,'Thymbra debilito blanditiis tabgo vilicus spoliatio.'),(373,'Patsy Heathcote','jalyn_rice45@yahoo.com','0943931772',NULL,'$2b$10$l1MZH1HJRORF2nqltojPeuUorHP3Npdzg.C4JMBgJL05qAlaH8o9S','Admin','Active','2025-07-26 17:00:00','2025-07-26 17:00:00',NULL,NULL,'','3197 Parker Underpass, New Terrellcester','GMT+7 (ICT)',NULL,'Ratione virtus subiungo peior et defessus.'),(374,'Wanda Kihn','nelda40@yahoo.com','0951074889',NULL,'$2b$10$iLEx8iBShEEnPfj23S0oneCvgFIWthbRZbXPlJskqerz0JWPRc1Oq','Seller','Active','2025-07-10 17:00:00','2025-07-10 17:00:00',NULL,NULL,'','17839 Kayli Pine, West Aftonhaven','GMT+7 (ICT)',NULL,'Coma audacia cogito cursim minus cubitum.'),(375,'Raul Cormier','viva_lueilwitz@hotmail.com','0956083080',NULL,'$2b$10$fiuCmvfwIrvM9aBSDdmc.eb8nN3R36NdWUoqHGGoXobWYO5iPw70O','Seller','Active','2025-07-15 17:00:00','2025-07-15 17:00:00',NULL,NULL,'','370 Waelchi Pines, West Tonistad','GMT+7 (ICT)',NULL,'Dolore super curo benigne.'),(376,'Sophie Hettinger','prince_mclaughlin@yahoo.com','0918872357',NULL,'$2b$10$GcVF/gF7C4OobrsRfxLwQek.hXHQiJOL8g9eqFoYTO.SSE1XJOm4G','Buyer','Active','2025-07-18 17:00:00','2025-07-18 17:00:00',NULL,NULL,'','659 Corwin Lane, Lake Aubreecester','GMT+7 (ICT)',NULL,'Auxilium curis creator antea tondeo basium.'),(377,'Corey Sipes','trevion.corkery27@hotmail.com','0996259895',NULL,'$2b$10$84YNIFtifq8IN3TrlBiLBeQ09MUdjCbkdh9fdMcP0sOS7juSRMYMG','Seller','Active','2025-08-07 17:00:00','2025-08-07 17:00:00',NULL,NULL,'','8722 Park Avenue, Orinside','GMT+7 (ICT)',NULL,'Viridis patruus viridis peccatus omnis porro deludo.'),(378,'Malcolm Murray','adalberto.thiel81@gmail.com','0913021972',NULL,'$2b$10$5udh9UWdlDvv3LSNzASV3eW2muZTJ3PK3vHSC7yXeXwH6mne4ntqC','Seller','Active','2025-08-22 17:00:00','2025-08-22 17:00:00',NULL,NULL,'','3552 Armstrong Camp, Khalidchester','GMT+7 (ICT)',NULL,'Avarus desino cursim unde triumphus cohibeo comptus derideo undique velociter.'),(379,'Lindsay Heathcote','angelita37@yahoo.com','0987951972',NULL,'$2b$10$ZAPXo8UAzECc4fzSgf.6GeiKhGvm1QghyiUpU72AvMRaOhlyM0RNC','Buyer','Active','2025-08-10 17:00:00','2025-08-10 17:00:00',NULL,NULL,'','2110 Fadel Fords, Port Jake','GMT+7 (ICT)',NULL,'Studio cras sui somniculosus vae.'),(380,'Bernard Stamm DVM','tracy_donnelly12@hotmail.com','0935922661',NULL,'$2b$10$Qn0dLatsuqQydMeioCWcwucDF.KeaROTrWSRZWEN38sDcGaeaXmeO','Admin','Active','2025-08-26 17:00:00','2025-08-26 17:00:00',NULL,NULL,'Nam','259 Brown Mill, Fisherfurt','GMT+7 (ICT)',NULL,'Sustineo tardus valetudo defendo statua candidus perspiciatis.'),(381,'Irving Lebsack','shemar84@yahoo.com','0918443034',NULL,'$2b$10$fB8EqlFzoYZ06jRIEkuLCembuqUDgebk6mjzvK985vHZ2ZH4WZm3K','Seller','Active','2025-08-12 17:00:00','2025-08-12 17:00:00',NULL,NULL,'Nam','12535 Graham Ferry, Gusikowskiport','GMT+7 (ICT)',NULL,'Traho surgo veritatis clibanus suasoria dignissimos.'),(382,'Glenn Bailey','colton_larkin@gmail.com','0925073064',NULL,'$2b$10$z0QR2olmzqs.iyhd/eNB5uFkFKE04B/W.hG4yQWLMYyTDvzAIpPuW','Seller','Active','2025-08-13 17:00:00','2025-08-13 17:00:00',NULL,NULL,'','996 Ayden Land, North Theresia','GMT+7 (ICT)',NULL,'Curis ager doloribus territo commemoro.'),(383,'Moses Tillman','faustino.koelpin@gmail.com','0977854943',NULL,'$2b$10$tF2aPrpWQMW1E9008Dnjm.3EOOWX55i73OuUOkxsxCW1JrgW1HGQG','Buyer','Active','2025-08-04 17:00:00','2025-08-04 17:00:00',NULL,NULL,'','91689 Jalon Fields, Abbottbury','GMT+7 (ICT)',NULL,'Cribro bene aliquam auditor.'),(384,'Krystal Kunze-Moore Jr.','gideon.stroman86@hotmail.com','0937511565',NULL,'$2b$10$P55MyLC0Sz6l0XcIkgBQ3eaScu7.hKouWUZj1Mf1.sXegiW/IgP62','Buyer','Active','2025-08-07 17:00:00','2025-08-07 17:00:00',NULL,NULL,'','52508 Lynch Glens, Port Clydefurt','GMT+7 (ICT)',NULL,'Tabernus admiratio voluptas consequatur appono necessitatibus subseco.'),(385,'Dr. Elbert Stark-Gibson MD','jan.yost34@yahoo.com','0913900758',NULL,'$2b$10$UcZwx6WDBWm0Nen4P4AMfOQ3akhK6H276izIidTniQjndTYop0yq2','Seller','Active','2025-08-09 17:00:00','2025-08-09 17:00:00',NULL,NULL,'','538 Savion Burgs, East Lue','GMT+7 (ICT)',NULL,'Quas depereo sulum cogo vitae arto curso.'),(386,'Edmond Considine III','adolfo.swift@yahoo.com','0931742454',NULL,'$2b$10$346FNQNWwLuruTY3yFrYbuislOFDMEQHCFBEzL6XLzUiFcnYWsl4K','Buyer','Active','2025-08-21 17:00:00','2025-08-21 17:00:00',NULL,NULL,'Nam','11627 Windsor Drive, East Guillermo','GMT+7 (ICT)',NULL,'Tamquam uberrime demum contra teneo.'),(387,'Alberto Jacobson-Jast DDS','coy.bernhard60@yahoo.com','0919067472',NULL,'$2b$10$pN01ICN7oEtqqlwkCDKyleFzd3rshhIzEZP.wRYp2i0zQcEegUelS','Buyer','Active','2025-08-14 17:00:00','2025-08-14 17:00:00',NULL,NULL,'Nam','53555 Highfield Road, Livermore','GMT+7 (ICT)',NULL,'Cicuta venustas verbum caelum quidem strues depono voco taedium vesco.'),(388,'Lora Pfannerstill II','mayra.mccullough@gmail.com','0973093244',NULL,'$2b$10$EqfStzHe97U/oCavtSP/xe9Dv7g8JPuU5U5kesOxjDgwt5c1ZIQGy','Buyer','Active','2025-08-03 17:00:00','2025-08-03 17:00:00',NULL,NULL,'','1179 Schuppe Falls, East Lysanne','GMT+7 (ICT)',NULL,'Suasoria iste vesper cruciamentum.'),(389,'Melanie Balistreri','jaclyn51@gmail.com','0923714739',NULL,'$2b$10$KpK5bb34AS9A326.Ji4PCeiUozTDKUOkA7Hk3DiNTV51mit41lSf2','Buyer','Active','2025-08-21 17:00:00','2025-08-21 17:00:00',NULL,NULL,'Nam','72594 Zieme Burg, Olympia','GMT+7 (ICT)',NULL,'Defaeco absconditus umbra contigo placeat debeo solus.'),(390,'Wilbert O\'Reilly','emerson.nader@hotmail.com','0965549244',NULL,'$2b$10$JTStNvTR0yYUPjbxdweokeqVNe0HE3/YOXoCOAw87zYN30z21xI0W','Seller','Active','2025-08-14 17:00:00','2025-08-14 17:00:00',NULL,NULL,'','7932 Fourth Avenue, Brielleport','GMT+7 (ICT)',NULL,'Sub ut comparo aetas.'),(391,'Jim Emard','stephania30@hotmail.com','0931704250',NULL,'$2b$10$/1K7m7X5Iv4NXiQvE37Fb.gI5vQZ7mP5u/n6xC7bLEJQmTtig30xy','Buyer','Active','2025-09-15 17:00:00','2025-09-15 17:00:00',NULL,NULL,'Nam','51581 The Square, Grahamland','GMT+7 (ICT)',NULL,'Quam deludo decipio bibo strenuus coadunatio.'),(392,'Dr. Jan Breitenberg','marley.mayert-konopelski@hotmail.com','0926113651',NULL,'$2b$10$xArgEF.zGy6xY0PMZQdQme6k3Aa4uVGomY/dCFJtmv94glwiH6HWe','Buyer','Active','2025-09-16 17:00:00','2025-09-16 17:00:00',NULL,NULL,'Nam','74956 Kertzmann Drives, Marcellecester','GMT+7 (ICT)',NULL,'Chirographum atrox vulticulus.'),(393,'Mable Botsford DDS','kendrick93@hotmail.com','0956809947',NULL,'$2b$10$IXKaP2IErNpO8goh1SsWru6r1IVkOsPEeiN0XKfTUrzgwD9PQsRxe','Buyer','Active','2025-09-09 17:00:00','2025-09-09 17:00:00',NULL,NULL,'','259 Hardy Spur, Ankundingfurt','GMT+7 (ICT)',NULL,'Odit astrum aperio.'),(394,'Dr. Duane Tremblay','elmore71@gmail.com','0918003183',NULL,'$2b$10$LApjdMeNRGajxTsurJP1P.Xx6E0ey4KI./SVVSeIxNhZOx5sogR5m','Seller','Active','2025-09-16 17:00:00','2025-09-16 17:00:00',NULL,NULL,'','21138 Willow Road, Conorboro','GMT+7 (ICT)',NULL,'Adversus tamen solvo exercitationem.'),(395,'Moses Mayer V','garnet32@gmail.com','0979988462',NULL,'$2b$10$oBu7/lFCjqB81d2RcxrjousC.XXk10B92p0KQIB0oYKZcNwYV6v4.','Buyer','Active','2025-09-05 17:00:00','2025-09-05 17:00:00',NULL,NULL,'Nam','5163 Ceasar Meadows, South Josie','GMT+7 (ICT)',NULL,'Amo sortitus vilicus apud arbustum aegrotatio demulceo textus cervus.'),(396,'Tyrone Durgan','jaden.king@hotmail.com','0932549152',NULL,'$2b$10$.REa0HmXaXWt0TswAQWeJOwxXRNW1vX4ihhwPY80XdjyaeCvsSM7i','Seller','Active','2025-09-02 17:00:00','2025-09-02 17:00:00',NULL,NULL,'','74377 Bogisich Overpass, West Babylon','GMT+7 (ICT)',NULL,'Vesper quisquam combibo subnecto uxor substantia villa.'),(397,'Vanessa Ferry','don.labadie@hotmail.com','0911290437',NULL,'$2b$10$wNBtSOb6JwWypg4zzyORdOm4m9.1Q.JFs.Dfu3ovJtjkeVRGcODnC','Buyer','Active','2025-09-21 17:00:00','2025-09-21 17:00:00',NULL,NULL,'','5181 Pine Close, Devenburgh','GMT+7 (ICT)',NULL,'Defessus amor architecto vito.'),(398,'Sheri Dicki V','leatha.schiller@yahoo.com','0944022417',NULL,'$2b$10$24Oim0G4qbxG06DBw4eV1O0.3pGTVv6.tTgjVM7QEk5Ar7FctjNWe','Seller','Active','2025-09-03 17:00:00','2025-09-03 17:00:00',NULL,NULL,'Nam','1905 Woodside Road, North Newtontown','GMT+7 (ICT)',NULL,'Patria volutabrum vereor.'),(399,'Marty Kshlerin','orval_rodriguez-langworth@yahoo.com','0980514903',NULL,'$2b$10$NsKZqeeb6NqGgiJ0PIWAH.oJtE4LOqtLJqihiOYj4Y2kjxwBQFNli','Buyer','Active','2025-09-02 17:00:00','2025-09-02 17:00:00',NULL,NULL,'','549 W 2nd Street, Encinitas','GMT+7 (ICT)',NULL,'Aut aperio peior amoveo defluo crastinus bibo auxilium turbo.'),(400,'Ms. Beulah Lindgren','stella_schuster20@gmail.com','0956120586',NULL,'$2b$10$CkL/stxKPkOYD.Vr1tmVJe01.sxTRRz0bPovCa/G2Kx2NNeAnyAHW','Buyer','Active','2025-10-23 17:00:00','2025-10-23 17:00:00',NULL,NULL,'','64800 Pfannerstill Dam, Schroederfield','GMT+7 (ICT)',NULL,'Tam tabesco spectaculum ultio conatus iste suppellex audax.'),(401,'Leslie Heaney','theodora.oconnell@hotmail.com','0924350535',NULL,'$2b$10$c.gHplxFFfMmHM8kL1qe9ORtlFh6WGJxIVGYosv6ZBzBUYfMt3NMm','Buyer','Active','2025-10-08 17:00:00','2025-10-08 17:00:00',NULL,NULL,'Nam','398 Kingsway, Somerville','GMT+7 (ICT)',NULL,'Comminor vorago patior perspiciatis caelestis repellat alioqui ulterius accusator viduo.'),(402,'Miss Robyn Rodriguez','cade8@yahoo.com','0972013240',NULL,'$2b$10$SSktxN3RPqMObsQvxcZkzuLd8hVVETwW8TujlkUq332kbaoHTZUDO','Buyer','Active','2025-10-18 17:00:00','2025-10-18 17:00:00',NULL,NULL,'','42829 W 7th Street, Bennettton','GMT+7 (ICT)',NULL,'Compello deleo comitatus sono.'),(403,'Frederick Okuneva','bonita.wehner13@yahoo.com','0926355578',NULL,'$2b$10$IsW2TLIC2W.s2RNkYpMUUeN.x0IYUhznJU8RftOcjz87ZrsmQuNR6','Buyer','Active','2025-10-17 17:00:00','2025-10-17 17:00:00',NULL,NULL,'','70708 Wellington Flat, Jesusborough','GMT+7 (ICT)',NULL,'Sollers ars coniuratio voluptatum vaco ver fuga.'),(404,'Joanna Heidenreich','cary1@yahoo.com','0995632512',NULL,'$2b$10$NaK6xPn5YWh5c8c2NlK6lOZgnFeylTkW8zn9DNVb7IH8vjadpoVNW','Seller','Active','2025-10-08 17:00:00','2025-10-08 17:00:00',NULL,NULL,'Nam','1636 Church Lane, Newark','GMT+7 (ICT)',NULL,'Denuncio cornu desparatus necessitatibus circumvenio tergiversatio.'),(405,'Ada Senger','christophe_roob88@hotmail.com','0952496025',NULL,'$2b$10$Lwu9h6dh0xbVOZ9fo.A6Bu3xOzroZi6TIG6gFiwTTAEXQ1CKyB2XK','Seller','Active','2025-10-13 17:00:00','2025-10-13 17:00:00',NULL,NULL,'','950 The Oval, Franeyfield','GMT+7 (ICT)',NULL,'Odit sol odio denuncio aduro culpa civis cuius veniam.'),(406,'Jimmy Wilkinson','alex_batz@yahoo.com','0998783533',NULL,'$2b$10$I8f74KzZynuXp.H8v4Vwv.QFhEzh18usxzkVXXW5z2ou8R/iQ5m82','Seller','Active','2025-10-16 17:00:00','2025-10-16 17:00:00',NULL,NULL,'','215 Spencer Mission, Fort Aronfield','GMT+7 (ICT)',NULL,'Decerno dolor tabella corona viscus creator nisi corroboro.'),(407,'Penny Waelchi','lavina.ferry51@gmail.com','0937984130',NULL,'$2b$10$CIszxvjOvPqKKEA/V3h5NOOAXYciu9Mr/HlPrzLsKct6X.Xo/9tv.','Buyer','Active','2025-10-19 17:00:00','2025-10-19 17:00:00',NULL,NULL,'Nam','96345 Price Ferry, Kaelaberg','GMT+7 (ICT)',NULL,'Antepono tracto surculus valetudo audacia.'),(408,'Rufus Heidenreich','jayne88@yahoo.com','0945573072',NULL,'$2b$10$3sUU1mDDR4XQXEzRXEMb/.XGCzdP9DjKrMtiKmYEafWpYYaqXu8ge','Admin','Active','2025-10-16 17:00:00','2025-10-16 17:00:00',NULL,NULL,'Nam','807 Ullrich Curve, Victormouth','GMT+7 (ICT)',NULL,'Carmen patrocinor caritas occaecati cornu sint.'),(409,'Miss Viola Flatley','george_abernathy45@yahoo.com','0989188619',NULL,'$2b$10$mLgoK0WV0kaG6EUoxeE.IuS1oOxzHjT/p9maQA0bWAIJwqrNPtdI.','Admin','Active','2025-10-14 17:00:00','2025-10-14 17:00:00',NULL,NULL,'','49897 Pennsylvania Avenue, New Crystelstad','GMT+7 (ICT)',NULL,'Vitiosus taedium nesciunt crur damno bis odio.'),(410,'Mack Gleason','curtis50@hotmail.com','0931917670',NULL,'$2b$10$hbebgBftMaDvGKegvoaAmON.PYB09tXLiQye8uzMOgh2l7awd6qNy','Buyer','Active','2025-10-08 17:00:00','2025-10-08 17:00:00',NULL,NULL,'','690 Mann Track, Port Haven','GMT+7 (ICT)',NULL,'Doloremque conor minima.'),(411,'Dr. Dennis Bogan-Hirthe','kathleen.pollich62@gmail.com','0912751351',NULL,'$2b$10$h4MavbD67ekdMqyVkuYUWeJt508AGKhO3/3qx2L8pFT7NQekw88Mi','Seller','Active','2025-10-04 17:00:00','2025-10-04 17:00:00',NULL,NULL,'','5472 E Oak Street, Fort Madalynside','GMT+7 (ICT)',NULL,'Suppono aetas vero trucido cado vitae admitto.'),(412,'Javier Brown Jr.','cale32@yahoo.com','0967657184',NULL,'$2b$10$l9h6STXrWpVdj0k.gBnwiuweW.EYdcOyOb8IVyiV2JN1C3dF1Y/nu','Seller','Active','2025-09-30 17:00:00','2025-09-30 17:00:00',NULL,NULL,'','475 Champlin Vista, East Judgeboro','GMT+7 (ICT)',NULL,'Confero textilis sono.'),(413,'Joel Daugherty','maxie43@gmail.com','0951197699',NULL,'$2b$10$8vQvk2IN0cJslFW1CG8Y2eiuwkq.SWUVejQh7BkdoOhjg.YHBmGWe','Seller','Active','2025-11-10 17:00:00','2025-11-10 17:00:00',NULL,NULL,'','9036 S Main Avenue, Bradtkeshire','GMT+7 (ICT)',NULL,'Coerceo adeptio thermae titulus aegrus tempus comes allatus capillus.'),(414,'Donna Heidenreich-Jenkins','patience.will@yahoo.com','0960868822',NULL,'$2b$10$T25xcOzLBne1DMUd3W5oWeeU42fPjp9vEf9XhZS9M/lvXf1h1Oho2','Buyer','Active','2025-11-18 17:00:00','2025-11-18 17:00:00',NULL,NULL,'','7292 Willow Canyon, Zemlakburgh','GMT+7 (ICT)',NULL,'Bis cur ut averto concedo sophismata eligendi succedo complectus.'),(415,'Dr. Juan Schultz DVM','jermaine.gutmann58@gmail.com','0938978464',NULL,'$2b$10$vxah3H2VtDTJVNJcUBIduOjmJhBsGJw2sQS2sYqQAcdEJbcOTuUHa','Buyer','Active','2025-11-06 17:00:00','2025-11-06 17:00:00',NULL,NULL,'','9919 Lee Street, New Deangelo','GMT+7 (ICT)',NULL,'Amplexus quasi comparo.'),(416,'Benjamin Turner','fannie47@hotmail.com','0981625762',NULL,'$2b$10$d6qBRL54Px4Bvw1.hf17Ou3JJEfvLO3xwdun88Xkye4TjsoMbpmx.','Buyer','Active','2025-11-13 17:00:00','2025-11-13 17:00:00',NULL,NULL,'','29383 Erdman Groves, Evefurt','GMT+7 (ICT)',NULL,'Alioqui adiuvo ratione laboriosam cunae.'),(417,'Rene Goldner DVM','allie90@yahoo.com','0951034567',NULL,'$2b$10$.X4Ai7XyBHiUgJcAwSYR8uVC5JzogJIKKBq8z.0EwpHDPt6x4qKjC','Seller','Active','2025-11-06 17:00:00','2025-11-06 17:00:00',NULL,NULL,'Nam','830 Green Close, Trompborough','GMT+7 (ICT)',NULL,'Eveniet deinde alter victus traho tumultus.'),(418,'Olive Little','kendrick_west-rutherford@gmail.com','0949243601',NULL,'$2b$10$2C589GvxiVCAZI0kAWEAFeYJEdJrMDzpPeJNRqHMeu5qIChyzcITC','Admin','Active','2025-11-22 17:00:00','2025-11-22 17:00:00',NULL,NULL,'Nam','92711 Lexie Loaf, North Anika','GMT+7 (ICT)',NULL,'Cavus caste supplanto similique nobis.'),(419,'Ms. Delores Lindgren','janet3@hotmail.com','0993101543',NULL,'$2b$10$saxMnC4/2s7C5bi.nq3RR.QrEriuvPw/WJ8KvJFePn8Rv78ogtR2K','Buyer','Active','2025-11-05 17:00:00','2025-11-05 17:00:00',NULL,NULL,'Nam','274 Hintz Extensions, Oakland','GMT+7 (ICT)',NULL,'Angustus demens demulceo cerno surculus ducimus venia barba pel.'),(420,'Dr. Felipe Lebsack','trey.streich86@gmail.com','0988483649',NULL,'$2b$10$GGivm/Rit4eJUG7HExmm/u0B06zlex3O3w7kOHxw.gRjqEPa8Xia2','Buyer','Active','2025-11-22 17:00:00','2025-11-22 17:00:00',NULL,NULL,'','96053 Salma Centers, Jamalfurt','GMT+7 (ICT)',NULL,'Surgo absconditus conservo viridis nesciunt succurro calco comitatus iste vesica.'),(421,'Ronnie Grant','davonte54@hotmail.com','0971254892',NULL,'$2b$10$C1o7HBpyTAYym9KTxbqUnu2W7YNMSX0q2A5G5Bh59/tYdEoPMnzn2','Seller','Active','2025-07-20 00:00:00','2025-07-20 00:00:00',NULL,NULL,'Nam','60998 Marquardt Highway, East Dudley','GMT+7 (ICT)',NULL,'Bestia sulum cum demulceo cubo.'),(422,'Johnathan Kemmer DDS','gerardo.cormier33@hotmail.com','0917658272',NULL,'$2b$10$7SpGzgpL2sza08SRH0EkMe0R9nnBhtxLAcnnw/FP4Cnap1oI91gZ6','Buyer','Active','2025-07-24 00:00:00','2025-07-24 00:00:00',NULL,NULL,'Nam','772 Ransom Corners, Nolaborough','GMT+7 (ICT)',NULL,'Tollo paens ceno validus.'),(423,'Jeffrey Thiel','bernita_grimes1@hotmail.com','0917867151',NULL,'$2b$10$fr8wc5wSIyWYADMjlCPS/ew/gg1.Ciao4zBHAOuAo/o.YLDawiuUK','Admin','Active','2025-07-02 00:00:00','2025-07-02 00:00:00',NULL,NULL,'Nam','854 Windermere Road, Brooklyn Park','GMT+7 (ICT)',NULL,'Dolor suasoria voluptatum sto tergo speciosus una vulgivagus civitas.'),(424,'Rex Auer','leonel.beier@gmail.com','0926761409',NULL,'$2b$10$b0mlxSyHpXTalsvgR.tVHO0G4KjnZ9DZftIToG3DPukRKTpZWJ4oK','Seller','Active','2025-07-04 00:00:00','2025-07-04 00:00:00',NULL,NULL,'','6821 Grange Avenue, Portage','GMT+7 (ICT)',NULL,'Vereor commemoro claro cometes tamdiu verumtamen.'),(425,'Ben Barrows','kayleigh_lowe@gmail.com','0939974392',NULL,'$2b$10$2fzdD7eNUcnx3hdsueQTjeVHYz6qgdeGlPj8bnnU8UC9RiK.i8gpm','Buyer','Active','2025-07-02 00:00:00','2025-07-02 00:00:00',NULL,NULL,'Nam','832 W Oak Street, New Carmelaton','GMT+7 (ICT)',NULL,'Voluptatem bellum somnus ultra.'),(426,'Vincent MacGyver','esperanza.jacobson51@hotmail.com','0983542714',NULL,'$2b$10$Tdy0px3oU4IPNQXU9vPowudtj6jjKOQ6KISVF0KIeFtuHgsBZxIeG','Seller','Active','2025-07-19 00:00:00','2025-07-19 00:00:00',NULL,NULL,'','7635 Marcelo Parkways, Fort Maryseworth','GMT+7 (ICT)',NULL,'Dignissimos vorax molestias degenero.'),(427,'Mrs. Blanca Pollich','ford3@gmail.com','0995754452',NULL,'$2b$10$i15TXReEGnuAIK8tL00mq.lqv1XwWFcD/ggSDnQ61PIUm5ttU0XHS','Buyer','Active','2025-07-14 00:00:00','2025-07-14 00:00:00',NULL,NULL,'Nam','51117 Tito Turnpike, North Halstead','GMT+7 (ICT)',NULL,'Defendo subvenio calamitas.'),(428,'Calvin Quigley II','jacky_krajcik@yahoo.com','0919855734',NULL,'$2b$10$iFfm/hulWffFX9daaBch/OBhGTah9UtehahJyyECsf6o8udaHvVsC','Buyer','Active','2025-07-21 00:00:00','2025-07-21 00:00:00',NULL,NULL,'Nam','8827 Zulauf Path, Orland Park','GMT+7 (ICT)',NULL,'Cur odit vesper cibo ultra venustas testimonium ater.'),(429,'Salvatore Reynolds','christiana_hoppe@hotmail.com','0982387425',NULL,'$2b$10$a0b.Klzj8QqtXc43MMWG/OmjxA7kW.pJck/oEkHzqxrIMrrxZQx1i','Buyer','Active','2025-08-23 00:00:00','2025-08-23 00:00:00',NULL,NULL,'Nam','666 Nelson Street, Findlay','GMT+7 (ICT)',NULL,'Spes vulgus tempora cedo complectus.'),(430,'Lillian Pfeffer','yazmin96@gmail.com','0976215604',NULL,'$2b$10$pmvCWZ3tY16vIxkZDi.vx.ZZk0o.ALpYhFjdt9DX1jQK9bqKOwe2O','Seller','Active','2025-08-12 00:00:00','2025-08-12 00:00:00',NULL,NULL,'','33431 Brycen Stream, Bellingham','GMT+7 (ICT)',NULL,'Confugo conspergo vere ambitus degenero vitiosus.'),(431,'Megan Kertzmann','peyton87@yahoo.com','0981756078',NULL,'$2b$10$wCSnepxfX/t.KxP5/U8zIu.QZHCtQDcM7wHXY9j.QPnxECCDxGRFK','Admin','Active','2025-08-01 00:00:00','2025-08-01 00:00:00',NULL,NULL,'Nam','899 Mill Street, Port Montanaport','GMT+7 (ICT)',NULL,'Voluntarius corporis cubicularis stips aeneus conservo accusantium caste conicio aegre.'),(432,'Domingo Trantow','kayden_schiller89@gmail.com','0944264214',NULL,'$2b$10$QK5kvZ3aA0/c9jkCSwSKCO3zBYj645K15q8gLgccO5.g9Cp6IuTZK','Seller','Active','2025-08-28 00:00:00','2025-08-28 00:00:00',NULL,NULL,'Nam','28300 Honeysuckle Close, Aureliebury','GMT+7 (ICT)',NULL,'Votum coruscus adsuesco tibi.'),(433,'Janis Aufderhar','bessie.jones@yahoo.com','0968554934',NULL,'$2b$10$SZOjN34iY7oo3VHWRhvHDeJQUBt.JmHIiKLQAozopMolrlJbzkCUC','Buyer','Active','2025-08-14 00:00:00','2025-08-14 00:00:00',NULL,NULL,'','812 Kreiger Freeway, East Kenny','GMT+7 (ICT)',NULL,'Vaco voluptate bonus.'),(434,'Tyler Klein-Leannon','evert.crona@hotmail.com','0975701451',NULL,'$2b$10$bvh1jWTVjnnfD7wzB3HjIOTTAl968AN0OHE.njtqLkOCjAjolkJ4e','Buyer','Active','2025-08-24 00:00:00','2025-08-24 00:00:00',NULL,NULL,'Nam','82444 Vilma Harbor, East Efrain','GMT+7 (ICT)',NULL,'Soleo acervus peccatus colligo adulescens est solvo triduana aperiam.'),(435,'Leigh VonRueden-Harvey','kaleigh97@gmail.com','0970212215',NULL,'$2b$10$r5jy5FAUn4HuTqYo9.0XG.rknpLW3fN2ONFXie1OBNVYDgbH4UF12','Buyer','Active','2025-08-25 00:00:00','2025-08-25 00:00:00',NULL,NULL,'','1931 Bogisich Forks, North Adolph','GMT+7 (ICT)',NULL,'Subvenio tertius amita nihil bestia deripio.'),(436,'Ernestine Gulgowski','jeff.beatty@hotmail.com','0936904751',NULL,'$2b$10$MJ12XhQfFOwEnCJO0PoV1.SAuPjyt1P8v2EjORZe1Hxgxja.XVnSi','Buyer','Active','2025-08-28 00:00:00','2025-08-28 00:00:00',NULL,NULL,'Nam','694 Bailey Forge, North Stanleyfort','GMT+7 (ICT)',NULL,'Viridis veritatis depono.'),(437,'Daisy Hauck','novella80@hotmail.com','0965643516',NULL,'$2b$10$dJSEGPPrRY64P5jpUzkya.2DsYvNy7jAGuny5fawgMmgUQT9oS.tW','Buyer','Active','2025-08-28 00:00:00','2025-08-28 00:00:00',NULL,NULL,'','3951 Ruben Junction, New Darien','GMT+7 (ICT)',NULL,'Solum colligo antepono cupressus creo ceno molestiae desidero.'),(438,'Mr. Martin Dicki-Cormier','blake34@hotmail.com','0977650678',NULL,'$2b$10$iQeQOXUcktiZqfbrdDpdOuVFLjWsle0.lIYGP38OcFW.upghNEGVy','Seller','Active','2025-08-09 00:00:00','2025-08-09 00:00:00',NULL,NULL,'Nam','88282 The Meadows, Revatown','GMT+7 (ICT)',NULL,'Distinctio aspicio aegrotatio turbo suscipio in damnatio casus sub.'),(439,'Marian Cruickshank','letha_bechtelar60@gmail.com','0996755768',NULL,'$2b$10$9yoAnV6WuomPcEZzWHCpq.cZBP8h9L05KrDbfpqdEpmh/wZQJMRZK','Seller','Active','2025-08-28 00:00:00','2025-08-28 00:00:00',NULL,NULL,'','50539 Charlie Overpass, North Christiana','GMT+7 (ICT)',NULL,'Calco vomito vulariter quo ars saepe contabesco demum vomito.'),(440,'Miss Marcia Ernser','oswald_schaefer@yahoo.com','0984745311',NULL,'$2b$10$2cMZ62Z5Bekuhqiq97W0K.3Aa.yoDuwM/VTZSqKYstqXRGvMtaBNe','Buyer','Active','2025-09-15 00:00:00','2025-09-15 00:00:00',NULL,NULL,'Nam','851 Roberts Cape, New Eric','GMT+7 (ICT)',NULL,'Ustilo adhuc cupio.'),(441,'Floyd Mueller','ellen58@hotmail.com','0983581620',NULL,'$2b$10$sErWn7hvEfXgYqhKD0WoruII7tIwfSjhZoyIAI9GbBIsi8O2Hh2R.','Seller','Active','2025-09-07 00:00:00','2025-09-07 00:00:00',NULL,NULL,'','998 S 1st Avenue, Ortizbury','GMT+7 (ICT)',NULL,'Condico doloribus placeat complectus tabella.'),(442,'Dr. Howard Miller','filomena30@yahoo.com','0926308441',NULL,'$2b$10$kkxvo/cZ5hMqpn4W7d7OG.Om7BFKCyKp2b0AGlPkqUoeQmJ292sJG','Buyer','Active','2025-09-04 00:00:00','2025-09-04 00:00:00',NULL,NULL,'','177 Isobel Motorway, Port Ally','GMT+7 (ICT)',NULL,'Verto alias coniecto conscendo pauci.'),(443,'Lorene Greenholt','gwen79@yahoo.com','0979825343',NULL,'$2b$10$VtFb8Ltm0bqk/m1DJytOCuEtkzA/91b5maKNvv88JrBFH4Mo96sM2','Buyer','Active','2025-09-26 00:00:00','2025-09-26 00:00:00',NULL,NULL,'','5847 Westgate, Abilene','GMT+7 (ICT)',NULL,'Cedo abundans caritas tersus amissio alienus sublime.'),(444,'Christie Dietrich','porter_medhurst39@yahoo.com','0925660813',NULL,'$2b$10$CQDgoSadqJ4HTARxTmRyaObDrTbwmYbqqDigfQNpxEM0kTSruDDF6','Seller','Active','2025-09-19 00:00:00','2025-09-19 00:00:00',NULL,NULL,'','70070 E High Street, North Jeremyfurt','GMT+7 (ICT)',NULL,'Textus decumbo ustilo delibero taceo crur ambitus.'),(445,'Miss Becky Daugherty','neha_ebert83@hotmail.com','0957940515',NULL,'$2b$10$IZe6XZ9U3zgpVHi6e1vrlOJQBSCSQ3CNFlNXTm623B1h0Bwtmfo3u','Buyer','Active','2025-09-02 00:00:00','2025-09-02 00:00:00',NULL,NULL,'Nam','117 Tamia Hill, Nameland','GMT+7 (ICT)',NULL,'Custodia casso blandior copia solvo armarium acervus.'),(446,'Simon Ryan','elenor11@gmail.com','0920784869',NULL,'$2b$10$nOmUoJEvncgtfXE9epma.OvONFOYsf3OA9Ksk6/F7qb6nF4dAigTi','Seller','Active','2025-09-04 00:00:00','2025-09-04 00:00:00',NULL,NULL,'Nam','157 Ellie River, Helenaland','GMT+7 (ICT)',NULL,'Barba tribuo ater sustineo cattus uberrime.'),(447,'Vivian Hills','marc_oreilly26@yahoo.com','0972731417',NULL,'$2b$10$SOEHDqYwhSPgAzFA7ME5JuSGCB7gaKyRcpshNTHxIumcAvkWfe1Vq','Admin','Active','2025-09-05 00:00:00','2025-09-05 00:00:00',NULL,NULL,'Nam','17520 Austyn Mills, Fort Herminio','GMT+7 (ICT)',NULL,'Curto testimonium conculco dens adulatio vereor molestias.'),(448,'Maria Franey','alessia87@hotmail.com','0923365856',NULL,'$2b$10$l8U4TcUKFIvB0dOnMZD/ROOjW08wsMuv9Ds6TFy1OlqjOkfeIAhYe','Buyer','Active','2025-09-05 00:00:00','2025-09-05 00:00:00',NULL,NULL,'Nam','3580 Miller Terrace, East Berniceburgh','GMT+7 (ICT)',NULL,'Ager possimus tui explicabo.'),(449,'Jeanne Kuhlman','alene.pfeffer@gmail.com','0911857960',NULL,'$2b$10$1BlRT02BSmhGA8Vet4ChxORtQ6SxCVDf9zdPuaaboYfqAohpMhXOS','Buyer','Active','2025-09-10 00:00:00','2025-09-10 00:00:00',NULL,NULL,'','4510 E Broad Street, West Abbie','GMT+7 (ICT)',NULL,'Desino verbum degero aggredior ambulo.'),(450,'Virgil O\'Hara','johnpaul94@gmail.com','0940132045',NULL,'$2b$10$iBMlA5bNeCAXaTcIPSAt7.dUBX178ZcSiv7pGk/GLj67P2sGkaKsO','Seller','Active','2025-10-22 00:00:00','2025-10-22 00:00:00',NULL,NULL,'','3111 Victoria Street, South Trevorbury','GMT+7 (ICT)',NULL,'Sortitus congregatio ullus cattus.'),(451,'Jerald Schmeler','madalyn_wehner@hotmail.com','0962861923',NULL,'$2b$10$BXQ/aE6YlTE5qTO7HTejOenF8lusk6J3yc7SxBbMrnf26Yn0x/bAC','Buyer','Active','2025-10-18 00:00:00','2025-10-18 00:00:00',NULL,NULL,'','9265 E 4th Avenue, Knoxville','GMT+7 (ICT)',NULL,'Tabella urbs degusto provident blanditiis barba incidunt adnuo.'),(452,'Nancy Gottlieb Sr.','milford.homenick@hotmail.com','0960743346',NULL,'$2b$10$RCJfW2d1HJYSgIPlT0vxhOKQshUypqtv0xxJwg/s0bHZwhma5RO0C','Seller','Active','2025-10-24 00:00:00','2025-10-24 00:00:00',NULL,NULL,'','865 Cruickshank Mount, San Marcos','GMT+7 (ICT)',NULL,'Summa delego atqui acer adiuvo vallum arceo armarium viriliter.'),(453,'Cassandra Jacobson V','tina_stroman25@gmail.com','0961317422',NULL,'$2b$10$gkusD/xucdTJEdyO8CllGOrXAyrxZM1Qsl06zV4saOh1tC.Bt5N56','Seller','Active','2025-10-24 00:00:00','2025-10-24 00:00:00',NULL,NULL,'','7949 Rath Glens, Jurupa Valley','GMT+7 (ICT)',NULL,'Vilicus dolorem volva antiquus victus antepono.'),(454,'Kristen Padberg','lester.conn@yahoo.com','0950948114',NULL,'$2b$10$bVQr0q1wuay1oB/CN7ccAuM.NGy5wh6g7n6EOs0i1d6Xi2tw5gTf6','Buyer','Active','2025-10-21 00:00:00','2025-10-21 00:00:00',NULL,NULL,'Nam','477 Stehr Grove, South Kelsiestead','GMT+7 (ICT)',NULL,'Facere cumque temporibus cras.'),(455,'Bonnie Bosco-Beer','julius.cummings42@gmail.com','0913725774',NULL,'$2b$10$s66RNtXfBDrgRwKRMlxbm.SZMBRwipltanGsCzIfQF9jlGSkKEpoW','Buyer','Active','2025-10-12 00:00:00','2025-10-12 00:00:00',NULL,NULL,'Nam','94835 Christopher Islands, Santa Monica','GMT+7 (ICT)',NULL,'Xiphias amita magnam alioqui angelus possimus accusantium usitas sui.'),(456,'Emilio Metz','evert29@hotmail.com','0928579273',NULL,'$2b$10$iLq.gsKQKVSonD3v186Szu.INtp3X3TKiKTJ5p1Ul9Hfifa3zNOx6','Seller','Active','2025-10-21 00:00:00','2025-10-21 00:00:00',NULL,NULL,'Nam','11727 Elliott Causeway, Bradenton','GMT+7 (ICT)',NULL,'Bibo cariosus vobis pariatur stella condico dedico considero at creo.'),(457,'Steven Schinner','gerry_waters@hotmail.com','0956356027',NULL,'$2b$10$wXMEtjMPGbRYT8xCNtdCCeQKLv2H8p8hYWXi/Ub41yuQ8y1PXIlXG','Seller','Active','2025-10-18 00:00:00','2025-10-18 00:00:00',NULL,NULL,'','47396 Gerson Mount, East Jamirfort','GMT+7 (ICT)',NULL,'Appello celer audeo cupio cursus cresco usitas.'),(458,'Mrs. Rochelle Wintheiser-Jakubowski','myra78@yahoo.com','0950111950',NULL,'$2b$10$FO0.FAyHaXQc9IbRFjbRPeBHSryhI.zwoR0nV5IPV9MRKSmfcvuhS','Buyer','Active','2025-10-17 00:00:00','2025-10-17 00:00:00',NULL,NULL,'','9732 Lea Park, Jamirstead','GMT+7 (ICT)',NULL,'Uxor calcar ducimus.'),(459,'Bernice Schmeler','corene.corwin45@hotmail.com','0944943095',NULL,'$2b$10$cVUlEgtwVQXiTo8cXfm.Wewtw7KdP1hi0jXkzp2BEJfb.CAkZiTNK','Seller','Active','2025-11-05 00:00:00','2025-11-05 00:00:00',NULL,NULL,'Nam','7909 Joany Forges, Oxnard','GMT+7 (ICT)',NULL,'Nesciunt sortitus creator.'),(460,'Darlene Bartell','kianna_carter11@hotmail.com','0981962093',NULL,'$2b$10$IgAi2sHl7Ksjam9C2r.3yuBfnjaSj5E450RKfbAfIB.gyj5lbRfCe','Admin','Active','2025-11-02 00:00:00','2025-11-02 00:00:00',NULL,NULL,'Nam','9881 Hayes Lane, Leuschkehaven','GMT+7 (ICT)',NULL,'Tonsor totus repudiandae.'),(461,'Preston McClure','amina_sawayn@hotmail.com','0991408506',NULL,'$2b$10$dRg3It6MN7eb8Doz7gKf3eU5pZu.Jvv8pE0uDhgocCCSCL0oqUnAe','Buyer','Active','2025-11-11 00:00:00','2025-11-11 00:00:00',NULL,NULL,'Nam','7824 Park Lane, Kossmouth','GMT+7 (ICT)',NULL,'Ustilo coaegresco temperantia depereo sopor bene contigo.'),(462,'Frankie Littel','santino94@gmail.com','0937732951',NULL,'$2b$10$auQxUgSmOq.1502kEkSP8OO9TKeeph3upBnWxNFSilv2AndzlCTZi','Seller','Active','2025-11-04 00:00:00','2025-11-04 00:00:00',NULL,NULL,'Nam','6227 Khalid Corners, Fort Jena','GMT+7 (ICT)',NULL,'Vinum benigne cum villa armarium.'),(463,'Neil Runolfsson','abbie61@gmail.com','0916535741',NULL,'$2b$10$NrYx7ybUXUYeKK6CHk3JAe1RciTLTMc4tCGh4L0Mlh6VIQx4HvtuS','Buyer','Active','2025-11-21 00:00:00','2025-11-21 00:00:00',NULL,NULL,'','48016 Waelchi Cove, Howellhaven','GMT+7 (ICT)',NULL,'Cariosus stabilis officiis vapulus nesciunt.'),(464,'Vivian Ebert','skye71@gmail.com','0949514307',NULL,'$2b$10$wLOqhMHuod2NS2GWvTjG1uI/bvuqmdWIzThq5AvZC.8k1hozkoWdm','Buyer','Active','2025-11-08 00:00:00','2025-11-08 00:00:00',NULL,NULL,'','92800 Denis Corner, Wylie','GMT+7 (ICT)',NULL,'Constans tenetur nesciunt paens tam peccatus quia degusto.'),(465,'Rodolfo McGlynn-Franey Sr.','gilbert.friesen9@hotmail.com','0958981589',NULL,'$2b$10$IkvKbMb3v3YuxCs/Cr5tXOFKSSugpwNrQylUd2PTAknv7YcfuM.Ra','Buyer','Active','2025-11-03 00:00:00','2025-11-03 00:00:00',NULL,NULL,'','81676 Lenny Overpass, North Brainbury','GMT+7 (ICT)',NULL,'Aliquid sortitus urbs bene creber.'),(466,'Whitney Franey','victoria.nienow17@gmail.com','0934681629',NULL,'$2b$10$mjlb640kmsjXlXmjFzjTje1Lo/GiH3TVBntyNikUWERaz4YWmAsAe','Seller','Active','2025-11-11 00:00:00','2025-11-11 00:00:00',NULL,NULL,'','17394 Maple Drive, Weberhaven','GMT+7 (ICT)',NULL,'Minima defaeco occaecati utroque ambulo.'),(467,'Hope Bosco','hillary_pagac@yahoo.com','0978292719',NULL,'$2b$10$PS6eQcVnQ3svVikjtLaAVOZjh8IJBZjmP6WLqwoZn9WimynhfZv/u','Buyer','Active','2025-11-02 00:00:00','2025-11-02 00:00:00',NULL,NULL,'','771 Shanahan Island, D\'Amorebury','GMT+7 (ICT)',NULL,'Capio tenetur titulus tremo quaerat.'),(468,'Dr. Chris Deckow Sr.','everette_langworth@hotmail.com','0925039471',NULL,'$2b$10$l26SKeVdoYr6zdtKBvYYA.5DzjMOHCh1s1IJ7mRYAw14ILGu3JqoK','Buyer','Active','2025-11-06 00:00:00','2025-11-06 00:00:00',NULL,NULL,'Nam','9348 Laurine Centers, Ornburgh','GMT+7 (ICT)',NULL,'Adeptio quam arguo doloribus decumbo.'),(469,'Glenda Jacobi','kadin_zieme15@yahoo.com','0955159624',NULL,'$2b$10$azprVPFxEUsTgp/UAfdkx.UeVV.R5XmM.Cj9sYvSn4yYqko8lFdE.','Buyer','Active','2025-07-27 00:00:00','2025-07-27 00:00:00',NULL,NULL,'','17501 Huels Mountain, Hodkiewiczview','GMT+7 (ICT)',NULL,'Aestas tempus defungo versus illo natus super depereo.'),(470,'Myron Balistreri','jaida35@gmail.com','0948291152',NULL,'$2b$10$dL0r9RaR8c9gMfNjIiyqtOOfbl.W4kdIMQWvSgQ.CWm9/wTxP93GO','Buyer','Active','2025-07-25 00:00:00','2025-07-25 00:00:00',NULL,NULL,'','4796 Woodside Road, Rathborough','GMT+7 (ICT)',NULL,'Tametsi aureus appono cupio copiose et tener.'),(471,'Mae Balistreri','vern_nitzsche17@yahoo.com','0977731089',NULL,'$2b$10$fAqksolx6xaV9bZkx8w3N.cW6aZiSQgX//K1a46uDmivN24t11r5a','Seller','Active','2025-07-15 00:00:00','2025-07-15 00:00:00',NULL,NULL,'Nam','95968 Rogahn Pike, East Tracy','GMT+7 (ICT)',NULL,'Sulum et tibi aut.'),(472,'Bradford Hoeger','meta_trantow-schumm@gmail.com','0913370231',NULL,'$2b$10$wIDELcOxAZtwz5.dPtbH5.hpxDG0L4xKJEW20i3fyEVuaZb3JGqda','Seller','Active','2025-07-20 00:00:00','2025-07-20 00:00:00',NULL,NULL,'Nam','67023 Albin Circle, East Marianatown','GMT+7 (ICT)',NULL,'Solium coepi stillicidium ubi cruciamentum deorsum comes caute terreo.'),(473,'Angela Hyatt','waino66@yahoo.com','0937424035',NULL,'$2b$10$CHGy14RVUCsUdwdcTV3oiOkqo4R0WnXQEKC9wG4gLKVGRDukDB052','Buyer','Active','2025-07-14 00:00:00','2025-07-14 00:00:00',NULL,NULL,'','4024 Jones Villages, North Deon','GMT+7 (ICT)',NULL,'Expedita volup copia pax.'),(474,'Marvin Greenholt','bradley52@gmail.com','0934953652',NULL,'$2b$10$yvJ.W1pxrCZTgtgQ4rR1GOuPZqBo0UmyX3hO1Mj5ZlyBzXYmz4ZVa','Buyer','Active','2025-07-28 00:00:00','2025-07-28 00:00:00',NULL,NULL,'Nam','6767 Heathcote Estates, Shanaside','GMT+7 (ICT)',NULL,'Alias uredo thalassinus tabesco vomer.'),(475,'Cesar Tremblay','amir95@yahoo.com','0952281291',NULL,'$2b$10$3xV1CIts3wTg17PBCJPS9OWlLXeeis4PSnp0Dz.1zoxJ2Dvfk1Gg2','Buyer','Active','2025-07-04 00:00:00','2025-07-04 00:00:00',NULL,NULL,'','54177 Dorcas Rapid, Fort Pearlie','GMT+7 (ICT)',NULL,'Cras ipsum terebro correptius blandior angulus.'),(476,'Herbert Bednar','jonas.kling@hotmail.com','0977009847',NULL,'$2b$10$po0R5B34nsGWOG4G8SwXzumTamUZmxRHBrF2H8h8RMovwlhejtQAK','Seller','Active','2025-07-03 00:00:00','2025-07-03 00:00:00',NULL,NULL,'Nam','5753 S 1st Street, Shawnfurt','GMT+7 (ICT)',NULL,'Aer vulariter copiose distinctio depulso.'),(477,'Andrea Bednar','orpha90@gmail.com','0951507352',NULL,'$2b$10$IJLXuWnNABEjz0v22.w4kOp5UcKSnKUvNAvP/twvIMf8WCncJvrKa','Buyer','Active','2025-07-19 00:00:00','2025-07-19 00:00:00',NULL,NULL,'','3445 Bechtelar Burgs, Sporershire','GMT+7 (ICT)',NULL,'Curso tero thesis teres itaque confugo convoco aliquid.'),(478,'Lamar Weber','catharine_gleichner@gmail.com','0971572387',NULL,'$2b$10$3ODXvZlaoe7OB9rTD071BeBWuSLXzpwfeRGEcQBlcOuG6v9vi9Stq','Seller','Active','2025-07-02 00:00:00','2025-07-02 00:00:00',NULL,NULL,'Nam','914 Lonnie Groves, Fort Garrisonchester','GMT+7 (ICT)',NULL,'Desolo adinventitias turpis voluptatum corona.'),(479,'Lionel Ryan','esmeralda.ortiz46@hotmail.com','0977891611',NULL,'$2b$10$8bgpYuyBX2W5b3XnYd8d4eK3pItIVz5wtQtK1O1u8ddmqwF.EJn0W','Buyer','Active','2025-07-02 00:00:00','2025-07-02 00:00:00',NULL,NULL,'','434 Chestnut Drive, Palm Coast','GMT+7 (ICT)',NULL,'Acquiro aptus numquam cogo eos degero expedita voluntarius campana audio.'),(480,'Catherine Lowe','giovanna.jones47@gmail.com','0916632980',NULL,'$2b$10$azFGh0P3V7g8rif98TwveenrsK28WK2HGDJchl.4facTTYYXafZ4y','Buyer','Active','2025-07-16 00:00:00','2025-07-16 00:00:00',NULL,NULL,'','397 Bruen Falls, Rathshire','GMT+7 (ICT)',NULL,'Pecus accendo custodia alius solitudo.'),(481,'Hugo Turner','tyrese.mills20@gmail.com','0981805565',NULL,'$2b$10$7yPGmSYX6a9jjWhrkCAIPO1AcnFFOnrDk1QqTSuhMiZe1KusK86vG','Seller','Active','2025-07-25 00:00:00','2025-07-25 00:00:00',NULL,NULL,'Nam','40564 Larson Ridge, Reno','GMT+7 (ICT)',NULL,'Sponte demoror deripio.'),(482,'Lynn Metz','kariane.gibson34@yahoo.com','0938302453',NULL,'$2b$10$7wqGyPN9lYMFSVfoNzQDD.8AFA5gCXAxW6WH9pZRTuRATlgSWO6qO','Seller','Active','2025-08-07 00:00:00','2025-08-07 00:00:00',NULL,NULL,'','5873 Gillian Center, Port Louisa','GMT+7 (ICT)',NULL,'Tabula cogito avarus canto.'),(483,'Horace Tillman','aurelio.bechtelar60@yahoo.com','0935361979',NULL,'$2b$10$AaEbOFCimPvpEsDal1RIDuCLYT0xl/2bsY7J8Bh/gWv73WkvSh0ci','Buyer','Active','2025-08-23 00:00:00','2025-08-23 00:00:00',NULL,NULL,'Nam','6845 Willow Drive, North Kylieburgh','GMT+7 (ICT)',NULL,'Bonus delectus subiungo cura tepidus nisi denique.'),(484,'Dawn Farrell','brenna_lubowitz5@gmail.com','0977160194',NULL,'$2b$10$wnbbgnLGRLowlLyEbJ4qQOFbPHG9KAmpGygtzHwoQyLqfSDhmICR.','Seller','Active','2025-08-28 00:00:00','2025-08-28 00:00:00',NULL,NULL,'','62094 Ramon Hill, Johnsberg','GMT+7 (ICT)',NULL,'Asporto cavus depromo censura theca cursus.'),(485,'Marilyn Runte','gia.fritsch49@hotmail.com','0949344714',NULL,'$2b$10$AqGXqh5Z2vSDlC/IqZSA3OPZeGayKhrgvc6FjO0/CbG7VBAOZ6JB2','Seller','Active','2025-08-04 00:00:00','2025-08-04 00:00:00',NULL,NULL,'Nam','163 Hahn Mews, Fort Wilhelm','GMT+7 (ICT)',NULL,'Vix sufficio ars vaco triduana necessitatibus truculenter deficio.'),(486,'Steven Borer','dahlia22@hotmail.com','0990421480',NULL,'$2b$10$u7JAnt6tS461B/VkWr9hFedmECUeV8ZiDtRfX8ScLF0BBVJJei.EK','Seller','Active','2025-08-04 00:00:00','2025-08-04 00:00:00',NULL,NULL,'Nam','357 Carlie Crescent, New Amanda','GMT+7 (ICT)',NULL,'Quisquam utor certe blandior tredecim vulariter arbitro ulciscor.'),(487,'Harry Kiehn-Weissnat DDS','skye_kovacek38@yahoo.com','0970438503',NULL,'$2b$10$DRdqQhlcG4sOuOzhGdPsiOiiIFCbLyoeeKsyoS/d9xXwy.Rm.LoM.','Buyer','Active','2025-08-20 00:00:00','2025-08-20 00:00:00',NULL,NULL,'Nam','7566 Joel Highway, Kohlerville','GMT+7 (ICT)',NULL,'Adimpleo turba perspiciatis cui stultus circumvenio appono arma ancilla confido.'),(488,'Martin Stark','darby0@hotmail.com','0978548640',NULL,'$2b$10$rT7hmNM2nDSn5rXIdyGBPuhEbAAUl11D47Hh1tvPgzcfRRPFAnuja','Admin','Active','2025-08-08 00:00:00','2025-08-08 00:00:00',NULL,NULL,'Nam','547 Hartmann Ways, Norwalk','GMT+7 (ICT)',NULL,'Abutor beatae sum conturbo adipisci adsuesco adeo adeo depopulo.'),(489,'Willie Sawayn','ellen28@hotmail.com','0931098538',NULL,'$2b$10$ejYhnepp3vpB8vQjdO0mCOWzJLyWrBLOl4X9rNLgjeboV5GHFj63m','Buyer','Active','2025-08-25 00:00:00','2025-08-25 00:00:00',NULL,NULL,'Nam','663 Ocie Bypass, Cristtown','GMT+7 (ICT)',NULL,'Ver coniecto dolores dignissimos volo coepi sumo apud adipisci bestia.'),(490,'Essie Reynolds','wallace.dubuque@yahoo.com','0921393770',NULL,'$2b$10$ttVtPkVcuPHA9OXozBjPVOWS1B.AdYNjNxaiax68W2pIpldlWPgt.','Admin','Active','2025-08-26 00:00:00','2025-08-26 00:00:00',NULL,NULL,'','88982 Albin Burg, South John','GMT+7 (ICT)',NULL,'Volva vereor dolores trans.'),(491,'Tricia Gleichner-Shanahan V','mitchell_hodkiewicz@hotmail.com','0966699823',NULL,'$2b$10$N1ILGRKatTrl5B2B9cXWiOYFgS.yXDEzkcv7BeSeUAjUdnRb3FGQK','Admin','Active','2025-08-26 00:00:00','2025-08-26 00:00:00',NULL,NULL,'Nam','559 Eli Junctions, Harberbury','GMT+7 (ICT)',NULL,'Suspendo trucido crur caste vulgo corrupti tunc.'),(492,'Dr. Faye Lynch','laurine6@hotmail.com','0982360989',NULL,'$2b$10$Mwja33R83id0/dX15BTCFuED6/stoXHTNyls5ooyttqGTgt5CgQly','Buyer','Active','2025-08-07 00:00:00','2025-08-07 00:00:00',NULL,NULL,'Nam','9292 Castle Lane, Joshuashire','GMT+7 (ICT)',NULL,'Tenetur territo apud.'),(493,'Jacob Bashirian','kiley_howe@yahoo.com','0999662581',NULL,'$2b$10$8MqncDmBMjY6NbYHtA7sYOFHeOBVYMzJx3Tdj8Tx96ud.Of5bldpK','Seller','Active','2025-08-01 00:00:00','2025-08-01 00:00:00',NULL,NULL,'Nam','263 Maple Close, Port Gretchenberg','GMT+7 (ICT)',NULL,'Ante curtus vinum acies deleniti blandior.'),(494,'Mr. Mathew Marquardt MD','morton.streich53@gmail.com','0937711504',NULL,'$2b$10$UIIccZw8e4w7WBb.YQBNYepWuAH703YWLvwtzochULvF6LjNik2Qa','Admin','Active','2025-09-11 00:00:00','2025-09-11 00:00:00',NULL,NULL,'Nam','5174 Telly Grove, Fort Melvin','GMT+7 (ICT)',NULL,'Calculus desidero impedit conturbo aetas adstringo cado.'),(495,'Vicki Green','mya.wintheiser50@gmail.com','0944905293',NULL,'$2b$10$fbCu0GpRSejbsl4SBYixe.gcokyibfCszTsnVHwkV5P97RKy6A2rG','Buyer','Active','2025-09-16 00:00:00','2025-09-16 00:00:00',NULL,NULL,'','62559 Wellington Road, West Kenyonberg','GMT+7 (ICT)',NULL,'Statua tenetur quibusdam vulgo correptius.'),(496,'Florence Dietrich','claud_schulist@hotmail.com','0961686655',NULL,'$2b$10$y3QeQhz05crR4DH5Zfcud.BeJZYMrpzrA8QlWBn1v0K6Ly.q4Ude6','Buyer','Active','2025-09-22 00:00:00','2025-09-22 00:00:00',NULL,NULL,'','253 Murphy Fords, Lake Randi','GMT+7 (ICT)',NULL,'Stips compello arto vir aiunt comprehendo spoliatio.'),(497,'Ramiro Corkery','enid18@gmail.com','0971116311',NULL,'$2b$10$8H.SROAZMC8Xsr1uWkdWau6R7ulZSY2Aq/xy9/AeBRL0.ajS1TRSm','Admin','Active','2025-09-14 00:00:00','2025-09-14 00:00:00',NULL,NULL,'','68112 Angus Motorway, Gerdaport','GMT+7 (ICT)',NULL,'Infit audio suppono tredecim.'),(498,'Lloyd Cremin','carmel36@hotmail.com','0966961000',NULL,'$2b$10$R/6PZjIFMxn66MzNJVLYHOFWFvKuWpy2K6Cj8NvVB7eE8oHMZHNiO','Seller','Active','2025-09-19 00:00:00','2025-09-19 00:00:00',NULL,NULL,'','67357 Francisca Forges, Lake Orval','GMT+7 (ICT)',NULL,'Vinco taedium dens adficio.'),(499,'Jay Renner','tyson36@hotmail.com','0985115803',NULL,'$2b$10$GNh0424Str3pEd1uzS2uKuXDERnwgOWXKVVnAfYqd.yyFx69Y7wBi','Buyer','Active','2025-09-08 00:00:00','2025-09-08 00:00:00',NULL,NULL,'','54646 Turcotte Mountain, West Cicerofield','GMT+7 (ICT)',NULL,'Fuga nobis adstringo accusantium conculco aliquid aqua barba desino.'),(500,'Dr. Philip Rutherford','jackson_witting90@hotmail.com','0994626973',NULL,'$2b$10$9Rm6G.MdCvx2K2SOm62HWeOfkUILrXrJRzANFsx3OUZ7TpP6udZp2','Buyer','Active','2025-09-13 00:00:00','2025-09-13 00:00:00',NULL,NULL,'','6581 Elm Road, West Zionton','GMT+7 (ICT)',NULL,'Corrumpo curso territo acquiro astrum reiciendis impedit magnam solium.'),(501,'Owen Kertzmann','alek69@gmail.com','0988883944',NULL,'$2b$10$/rqmR1apYBgZ26DVzd.S0Ojxsyr6taAtrFSfu7JTLs6XkPgplf1kO','Seller','Active','2025-09-23 00:00:00','2025-09-23 00:00:00',NULL,NULL,'Nam','47217 Charles Street, West Carmen','GMT+7 (ICT)',NULL,'Vicinus pectus tertius caries vespillo vitiosus.'),(502,'Maggie Wisoky','garth61@yahoo.com','0926529342',NULL,'$2b$10$Ej6od4/qMMZjE/06pfI9Buae6kL5mY2.WIuDM3fIz9cKx3O8DuXb2','Admin','Active','2025-09-26 00:00:00','2025-09-26 00:00:00',NULL,NULL,'','5105 Corkery Light, South Wendell','GMT+7 (ICT)',NULL,'Omnis centum provident ulterius cura abbas terebro patior.'),(503,'Lorene Gutkowski','branson.stehr@gmail.com','0946831327',NULL,'$2b$10$dszi6F/9rS7txO2TYNpRDusDExEN2U1SCjByKYEsEj.07ZSFH3xjO','Buyer','Active','2025-10-18 00:00:00','2025-10-18 00:00:00',NULL,NULL,'Nam','574 Feil Camp, Lilliestad','GMT+7 (ICT)',NULL,'Quae tredecim terebro.'),(504,'Dr. Elmer Altenwerth','adrien11@gmail.com','0950603749',NULL,'$2b$10$KIhu3tBmlm/QSxu0M03Iq.4jhWs6.XHSs6TyQkZPDNDp/89pajeg.','Seller','Active','2025-10-15 00:00:00','2025-10-15 00:00:00',NULL,NULL,'','9134 Rowan Close, Anchorage','GMT+7 (ICT)',NULL,'Degusto aggero allatus cohors cras vallum capto tersus conicio spes.'),(505,'Brittany Bauch','carmella.lakin@gmail.com','0941067583',NULL,'$2b$10$atYtRVX6s5f2twzeeQt/8ey4yaa66qM4MCQr7oxGFhY7HQyTKY3ra','Buyer','Active','2025-10-01 00:00:00','2025-10-01 00:00:00',NULL,NULL,'','82061 McClure Pine, Dorianport','GMT+7 (ICT)',NULL,'Uredo confugo aspicio termes ambitus.'),(506,'Paul Rowe DVM','yvette45@hotmail.com','0971740457',NULL,'$2b$10$.MQo.8Q1sOMUDmzWrpk7JOhl5fa3RYPg7slAdZTG/3134SAa8xR3W','Buyer','Active','2025-10-10 00:00:00','2025-10-10 00:00:00',NULL,NULL,'Nam','3407 Shanahan Trail, Aliso Viejo','GMT+7 (ICT)',NULL,'Deduco decor sui surculus trado tergeo vomer angelus vulticulus depono.'),(507,'Ada Powlowski V','kyleigh.carroll@gmail.com','0928272233',NULL,'$2b$10$bFIKJ4ezbX95cm3o.2PADu.0nRfRah6TW6zIbL1FpiSfnkrlCSNvm','Seller','Active','2025-10-13 00:00:00','2025-10-13 00:00:00',NULL,NULL,'','69014 Colten Causeway, Cristopherburgh','GMT+7 (ICT)',NULL,'Minima tribuo demum ceno solus cohaero summa.'),(508,'Wm Lind-Mosciski','haskell96@hotmail.com','0954860828',NULL,'$2b$10$JqHBH7wNYTotRcW1urOHnOdgDSBca50qiRZUqP6QjR1dz14QyvTaG','Buyer','Active','2025-10-25 00:00:00','2025-10-25 00:00:00',NULL,NULL,'','624 Hilda Light, New Marjorycester','GMT+7 (ICT)',NULL,'Aedificium corroboro coma fugiat.'),(509,'Myra Harris DVM','jarrell88@gmail.com','0920207166',NULL,'$2b$10$RAh/jWUS37Au/mBHlKf2wuy.cQZFRkpPeF.qWyaF0yknYAULyx5JW','Buyer','Active','2025-10-07 00:00:00','2025-10-07 00:00:00',NULL,NULL,'Nam','839 Lind Curve, McAllen','GMT+7 (ICT)',NULL,'Annus aufero vorago.'),(510,'Erma Breitenberg','denis.sipes62@yahoo.com','0962141675',NULL,'$2b$10$NBLeIBsSmgXDbocIrhUTg.NPCphqkHB8MFV/1Cz9q1HazhQFXEOiO','Buyer','Active','2025-10-27 00:00:00','2025-10-27 00:00:00',NULL,NULL,'Nam','56433 Dark Lane, South Gussieshire','GMT+7 (ICT)',NULL,'Subseco bellicus tres perspiciatis laborum tondeo aveho.'),(511,'Dr. Nora Keebler','isaias.haley80@gmail.com','0990852381',NULL,'$2b$10$NOvmo..G.liYapYgCdXRW.e2o0VUObuLior4YU3kl2ztp7anD7SJq','Buyer','Active','2025-10-03 00:00:00','2025-10-03 00:00:00',NULL,NULL,'','846 E 7th Street, North Alvistown','GMT+7 (ICT)',NULL,'Vinco appello strenuus cursus defessus defleo arcesso solutio.'),(512,'Howard Johnson','woodrow64@gmail.com','0952491205',NULL,'$2b$10$nLJzOoOqRClBj1gze0A6huuMMR.fL3xMFt3QEY4y8iA5Vsrq6qPXi','Seller','Active','2025-10-12 00:00:00','2025-10-12 00:00:00',NULL,NULL,'Nam','48860 Crist Manors, South Gladysfield','GMT+7 (ICT)',NULL,'Cui amoveo universe testimonium creator.'),(513,'Carlos Kovacek','eloise_mclaughlin65@yahoo.com','0977557598',NULL,'$2b$10$fG7Ov2NY2OdAx5KHPymque7B4ek0BHin5OJ9lYax9RdgREFUFuM.q','Admin','Active','2025-10-11 00:00:00','2025-10-11 00:00:00',NULL,NULL,'Nam','5578 Waverley Road, Adolfstad','GMT+7 (ICT)',NULL,'Texo dapifer adsuesco cinis.'),(514,'Gail Roob I','elise.mann68@gmail.com','0954340333',NULL,'$2b$10$UK305NsYMkh6auELlchusepowWiDkJn4U4QSr4bqEryru.Ia0svkK','Seller','Active','2025-10-23 00:00:00','2025-10-23 00:00:00',NULL,NULL,'','816 The Green, East Durwardboro','GMT+7 (ICT)',NULL,'Numquam vinitor admoneo possimus ventito.'),(515,'Emanuel Walker','pearline.bartoletti60@gmail.com','0972980897',NULL,'$2b$10$H6O42UMmPFEzRmKb32MzduuvlRCqpeb4wKk8E8u9Ni3HcOCtSCIqK','Seller','Active','2025-10-08 00:00:00','2025-10-08 00:00:00',NULL,NULL,'Nam','13833 2nd Avenue, Nicoleberg','GMT+7 (ICT)',NULL,'Sperno curso victus utique creber catena caelum cur.'),(516,'Mr. Mario O\'Kon','isabella85@yahoo.com','0991044486',NULL,'$2b$10$yY9sIXZpf7b.zMzpuskSpOVRMivOSZxI1vAGJGn0H81pOcEHEsJ8e','Buyer','Active','2025-11-28 00:00:00','2025-11-28 00:00:00',NULL,NULL,'Nam','788 E 4th Street, East Myrtis','GMT+7 (ICT)',NULL,'Urbs stultus praesentium vivo caelum tumultus cuius caecus ante deduco.'),(517,'Miss Julia Lockman II','paula_anderson97@hotmail.com','0930882946',NULL,'$2b$10$u4WmJYlmwI8gUNQX5nom6eQD1PAaZ.O5ZDygyHe2BZhwigPw6dHna','Seller','Active','2025-11-24 00:00:00','2025-11-24 00:00:00',NULL,NULL,'Nam','7690 Keagan Hollow, Lake Nina','GMT+7 (ICT)',NULL,'Solio claudeo cometes tamisium.'),(518,'Sonya Kassulke','dedrick_franey70@yahoo.com','0952719289',NULL,'$2b$10$R1dfX/8TDAuSVSRg8GmN1eZPqMdGgfSGy8B6Stba0Zepk/14GoDh6','Seller','Active','2025-11-15 00:00:00','2025-11-15 00:00:00',NULL,NULL,'','822 E Union Street, Joplin','GMT+7 (ICT)',NULL,'Alveus tenetur ascit ceno cupiditate.'),(519,'Shawn Rolfson','junior.frami77@gmail.com','0921008352',NULL,'$2b$10$oBsV2k3WipNcXh1xrQsD6erBHzuMVyRicuhbTRjWlkfxc5Qb.VhX2','Admin','Active','2025-11-16 00:00:00','2025-11-16 00:00:00',NULL,NULL,'Nam','41231 Serena Trail, Welchshire','GMT+7 (ICT)',NULL,'Tamisium appello vespillo deserunt quam aranea conitor supellex.'),(520,'Mabel Zboncak','hal31@gmail.com','0956650990',NULL,'$2b$10$ube.SA3iPTk1hwtlapMw4eaHEj1L4nnUVNPNnxdGbUqQXOx9on4qq','Seller','Active','2025-11-05 00:00:00','2025-11-05 00:00:00',NULL,NULL,'','501 Issac Bypass, Lake Dora','GMT+7 (ICT)',NULL,'Cibus cupio adflicto vestigium acerbitas aestivus absque asper videlicet.'),(521,'Holly Green','joey_ullrich@yahoo.com','0969209240',NULL,'$2b$10$b1Ksic60esIPEQYNBWFsZOleuWZytYMgDRy9rqia6d28McmvgMFD2','Seller','Active','2025-11-01 00:00:00','2025-11-01 00:00:00',NULL,NULL,'Nam','7348 Jaskolski Islands, Port Greg','GMT+7 (ICT)',NULL,'Bibo degero crinis ducimus coma.'),(522,'Tabitha White','zaria16@hotmail.com','0976458470',NULL,'$2b$10$1LbaXpSAN2daDNIbMikt8Of0DykXMXLrndj58MftN9BXkwNkfBhvq','Seller','Active','2025-11-04 00:00:00','2025-11-04 00:00:00',NULL,NULL,'','658 Ellen Hollow, Parkerhaven','GMT+7 (ICT)',NULL,'Tabernus arbitro thesis cui ait aestas beneficium.'),(523,'Dwight Sporer','cristina14@gmail.com','0983177089',NULL,'$2b$10$wb6q9wr4QLuHCmDcwGbAc.NR3vXyd3Sa30XdfeRFc7UUJB.XDoSp2','Buyer','Active','2025-11-09 00:00:00','2025-11-09 00:00:00',NULL,NULL,'','90922 Derby Road, New Gudrunboro','GMT+7 (ICT)',NULL,'Tristis earum laborum auctor ulciscor.'),(524,'Judy Bartoletti','lera_pfannerstill42@hotmail.com','0959277224',NULL,'$2b$10$S7sxHHTzSNxAMZBYatfQeOUynR5xh.ZovXgx6.QIJEKh6E8TlcGwS','Seller','Active','2025-11-13 00:00:00','2025-11-13 00:00:00',NULL,NULL,'','468 Nader Forks, Vista','GMT+7 (ICT)',NULL,'Repudiandae alter odit antiquus somnus aequus vulnus.'),(525,'Megan Franey','nella42@hotmail.com','0914449018',NULL,'$2b$10$cOdM/vjcd2t3vU5mqfmGGuWEPsAEbVgcZuqrOSb0mew/yYvG9T90O','Seller','Active','2025-11-06 00:00:00','2025-11-06 00:00:00',NULL,NULL,'Nam','952 Cary Terrace, Chasitymouth','GMT+7 (ICT)',NULL,'Vulnus deleo decerno clementia.'),(526,'Patrick Moore','alfred27@gmail.com','0998649793',NULL,'$2b$10$HLgkHTSLvsKDWmcYlYWoeOC4ci8WC0f1PZ0HNYc0gJ1wAdg7B7MTC','Seller','Active','2025-11-07 00:00:00','2025-11-07 00:00:00',NULL,NULL,'Nam','1849 Washington Avenue, Assuntashire','GMT+7 (ICT)',NULL,'Argumentum aequitas concedo spargo vilis amitto sequi.'),(529,'Test Admin','admin@test.com','0936709445',NULL,'$2b$12$glyyw9pvyGGOcMML8XvFHORUugZwtf2ntwPXnVeQdBlOzf81qtk4u','Admin','Active','2025-11-27 10:26:41','2025-11-27 10:26:41',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(532,'Test Pro User','pro_test@example.com',NULL,NULL,'$2b$10$DfkCcG3l2NBTlhImikHUmeTqfpWrfecWTtgSRBL0br77FPk631jpW','Seller','Active','2025-11-27 15:27:17','2025-11-28 08:05:04',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL),(533,'Test Premium User','premium_test@example.com',NULL,NULL,'$2b$10$DfkCcG3l2NBTlhImikHUmeTqfpWrfecWTtgSRBL0br77FPk631jpW','Seller','Active','2025-11-27 15:27:17','2025-11-28 08:05:04',NULL,NULL,NULL,NULL,'GMT+7 (ICT)',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersubscription`
--

DROP TABLE IF EXISTS `usersubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersubscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `package` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersubscription`
--

LOCK TABLES `usersubscription` WRITE;
/*!40000 ALTER TABLE `usersubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawals` (
  `WithdrawalID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SellerID` bigint unsigned NOT NULL,
  `TransactionID` bigint unsigned NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `Status` enum('Pending','Processing','Completed','Failed') DEFAULT 'Pending',
  `RequestedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ProcessedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`WithdrawalID`),
  KEY `SellerID` (`SellerID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `withdrawals_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `withdrawals_ibfk_2` FOREIGN KEY (`TransactionID`) REFERENCES `transactions` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawals`
--

LOCK TABLES `withdrawals` WRITE;
/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30  1:16:27
