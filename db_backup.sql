-- MySQL dump 10.15  Distrib 10.0.15-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: banksimulation
-- ------------------------------------------------------
-- Server version	10.0.15-MariaDB-log

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
-- Table structure for table `Pain008File`
--

DROP TABLE IF EXISTS `Pain008File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pain008File` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `msgId` varchar(255) DEFAULT NULL,
  `nameHeader` varchar(255) DEFAULT NULL,
  `streetHeader` varchar(255) DEFAULT NULL,
  `townHeader` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pain008File`
--

LOCK TABLES `Pain008File` WRITE;
/*!40000 ALTER TABLE `Pain008File` DISABLE KEYS */;
INSERT INTO `Pain008File` VALUES (1,'FR','creditor@mail.com','myGeneratedFile1419601956430','DelaunayCreditor','Bd Vivier Merle','Lyon');
/*!40000 ALTER TABLE `Pain008File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BIC_creditor` varchar(255) DEFAULT NULL,
  `BIC_debitor` varchar(255) DEFAULT NULL,
  `IBAN_creditor` varchar(255) DEFAULT NULL,
  `IBAN_debitor` varchar(255) DEFAULT NULL,
  `amount` bigint(20) NOT NULL,
  `done` tinyint(1) NOT NULL,
  `dtOfSgntr` varchar(255) DEFAULT NULL,
  `endToEndId` varchar(255) DEFAULT NULL,
  `mndtId` varchar(255) DEFAULT NULL,
  `pmtInf` varchar(255) DEFAULT NULL,
  `proceced` tinyint(1) NOT NULL,
  `seqTp` varchar(255) DEFAULT NULL,
  `transfer` tinyint(1) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qc3lg9kaxh9q4su2m4tnhwiwq` (`file_id`),
  CONSTRAINT `FK_qc3lg9kaxh9q4su2m4tnhwiwq` FOREIGN KEY (`file_id`) REFERENCES `Pain008File` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES (1,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-01','UMR-01',NULL,0,'pain20TransactionsUDEV.xml',0,1),(2,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-02','UMR-02',NULL,0,'pain20TransactionsUDEV.xml',0,1),(3,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-03','UMR-03',NULL,0,'pain20TransactionsUDEV.xml',0,1),(4,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-04','UMR-04',NULL,0,'pain20TransactionsUDEV.xml',0,1),(5,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-05','UMR-05',NULL,0,'pain20TransactionsUDEV.xml',0,1),(6,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-06','UMR-06',NULL,0,'pain20TransactionsUDEV.xml',0,1),(7,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-07','UMR-07',NULL,0,'pain20TransactionsUDEV.xml',0,1),(8,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-08','UMR-08',NULL,0,'pain20TransactionsUDEV.xml',0,1),(9,'UDEVFRPPRIG','UDEVFRPPXXX','FR9999999999999999999999999','FR0000000000000000000000000',100,0,'26-10-114','E2E-09','UMR-09',NULL,0,'pain20TransactionsUDEV.xml',0,1);
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `pseudo` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Films'),('Livres'),('Musiques'),('Series');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_order`
--

DROP TABLE IF EXISTS `prod_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_order` (
  `order_num` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_order`
--

LOCK TABLES `prod_order` WRITE;
/*!40000 ALTER TABLE `prod_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Action','Series'),('Animation','Films'),('Aventure','Series'),('Cinéma','Livres'),('Design','Livres'),('Drame','Series'),('Erotique','Films'),('Fantastique','Series'),('Hard rock','Musiques'),('Horreur','Films'),('Nightcore','Musiques'),('Pop','Musiques'),('Reggae','Musiques'),('Rock','Musiques'),('Roman','Livres'),('Techno','Musiques'),('Western','Films');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_subs`
--

DROP TABLE IF EXISTS `product_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_subs` (
  `product_name` varchar(255) NOT NULL,
  `subs_name` varchar(255) NOT NULL,
  UNIQUE KEY `UK_chn8sjaw6o72ixd62uv5ovdkf` (`subs_name`),
  KEY `FK_r9g6rq2c6pueekvh071ik6f8x` (`product_name`),
  CONSTRAINT `FK_chn8sjaw6o72ixd62uv5ovdkf` FOREIGN KEY (`subs_name`) REFERENCES `subscription` (`name`),
  CONSTRAINT `FK_r9g6rq2c6pueekvh071ik6f8x` FOREIGN KEY (`product_name`) REFERENCES `product` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_subs`
--

LOCK TABLES `product_subs` WRITE;
/*!40000 ALTER TABLE `product_subs` DISABLE KEYS */;
INSERT INTO `product_subs` VALUES ('Animation','Annuel'),('Horreur','Mensuelle');
/*!40000 ALTER TABLE `product_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `name` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES ('Annuel',12,500),('Mensuelle',1,50);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-21  0:05:02
