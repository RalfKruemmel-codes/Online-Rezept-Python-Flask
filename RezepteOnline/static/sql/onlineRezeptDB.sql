CREATE DATABASE  IF NOT EXISTS `onlinerezeptapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `onlinerezeptapp`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: onlinerezeptapp
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `rezept_zutaten`
--

DROP TABLE IF EXISTS `rezept_zutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezept_zutaten` (
  `RezeptID` int NOT NULL,
  `ZutatenID` int NOT NULL,
  `Menge` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RezeptID`,`ZutatenID`),
  KEY `ZutatenID` (`ZutatenID`),
  CONSTRAINT `rezept_zutaten_ibfk_1` FOREIGN KEY (`RezeptID`) REFERENCES `rezepte` (`RezeptID`),
  CONSTRAINT `rezept_zutaten_ibfk_2` FOREIGN KEY (`ZutatenID`) REFERENCES `zutaten` (`ZutatenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezept_zutaten`
--

LOCK TABLES `rezept_zutaten` WRITE;
/*!40000 ALTER TABLE `rezept_zutaten` DISABLE KEYS */;
INSERT INTO `rezept_zutaten` VALUES (1,1,500.00),(1,2,200.00),(1,3,250.00),(1,4,100.00),(1,5,4.00),(1,10,150.00),(3,6,300.00),(3,7,150.00),(3,8,5.00),(4,7,10.00),(4,18,10.00),(4,19,300.00),(4,22,15.00),(4,23,150.00),(4,64,10.00),(5,7,10.00),(5,10,100.00),(5,18,10.00),(5,19,500.00),(5,22,15.00),(5,23,250.00),(5,25,20.00),(10,3,45.00),(10,48,150.00),(12,3,150.00),(12,5,4.00),(12,10,150.00),(12,12,250.00),(12,13,100.00);
/*!40000 ALTER TABLE `rezept_zutaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezepte`
--

DROP TABLE IF EXISTS `rezepte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezepte` (
  `RezeptID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Beschreibung` text,
  `Zubereitungszeit` int DEFAULT NULL,
  `Portionen` int DEFAULT NULL,
  `Zubereitung` text,
  PRIMARY KEY (`RezeptID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezepte`
--

LOCK TABLES `rezepte` WRITE;
/*!40000 ALTER TABLE `rezepte` DISABLE KEYS */;
INSERT INTO `rezepte` VALUES (1,'Spaghetti Carbonara','Klassisches italienisches Pasta-Gericht mit Speck und Sahnesauce.',30,4,NULL),(2,'Gemüsecurry','Würziges Curry mit einer Vielzahl von Gemüsesorten und Kokosmilch.',45,4,NULL),(3,'Apfelkuchen','Süßer Kuchen mit frischen Äpfeln und Zimt.',60,8,NULL),(4,'Baguette','Einfaches Baguette',120,1,NULL),(5,'Brötchen','Einfache Brötchen',60,8,'Die frische Hefe mit dem Wasser und Zucker mischen und rühren bis sich alles aufgelöst hat.\n\nDie Hefelösung in eine Schüssel gießen. Nun das Mehl, Salz und Butter hinzufügen und 20 Minuten Kneten.\n\nDanach zu einer Kugel Kneten und Abgedeckt 20 Minuten ruhen lassen. \n\nDanach den Teig in 8 Gleichgroße Stücke teilen. Jeder Teigling wird dann in die Form geknetet die man haben möchte. \n\nDen Backofen vorheizen auf 30-40 Grad. Die Teiglinge auf ein Backleck legen und 30 Minuten im Ofen gehen lassen.\n\nNun die Teiglinge vorsichtig mit Wasser bestreichen. Den Ofen auf 200 Grad Umluft vorheizen. die Teiglinge 13-15 Minuten backen.\n\n\n'),(10,'EIN SUPERBROT','SUPER SUPER ',2000,2,'SUPERBROT MIT LANGER STANDZEIT'),(12,'Eierauflauf','Leckerer Eierauflauf schnell',20,2,'Eier in Auflaufform Gemüse mit rein Sahne  Käse und ab in Ofen 200 Grad');
/*!40000 ALTER TABLE `rezepte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umrechnungsfaktoren`
--

DROP TABLE IF EXISTS `umrechnungsfaktoren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umrechnungsfaktoren` (
  `EinheitVon` varchar(50) NOT NULL,
  `EinheitNach` varchar(50) NOT NULL,
  `Faktor` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`EinheitVon`,`EinheitNach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umrechnungsfaktoren`
--

LOCK TABLES `umrechnungsfaktoren` WRITE;
/*!40000 ALTER TABLE `umrechnungsfaktoren` DISABLE KEYS */;
INSERT INTO `umrechnungsfaktoren` VALUES ('g','kg',0.0010),('kg','g',1000.0000),('l','ml',1000.0000),('ml','l',0.0000);
/*!40000 ALTER TABLE `umrechnungsfaktoren` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zutaten`
--

DROP TABLE IF EXISTS `zutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zutaten` (
  `ZutatenID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Basismenge` decimal(10,2) DEFAULT NULL,
  `Basiseinheit` varchar(50) NOT NULL,
  PRIMARY KEY (`ZutatenID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zutaten`
--

LOCK TABLES `zutaten` WRITE;
/*!40000 ALTER TABLE `zutaten` DISABLE KEYS */;
INSERT INTO `zutaten` VALUES (1,'Spaghetti',1.00,'g'),(2,'Speck',1.00,'g'),(3,'Sahne',1.00,'ml'),(4,'Parmesan',1.00,'g'),(5,'Ei',1.00,'Stück'),(6,'Pfeffer',1.00,'g'),(7,'Salz',1.00,'g'),(8,'Kokosmilch',1.00,'ml'),(9,'Currypaste',1.00,'g'),(10,'Brokkoli',1.00,'g'),(11,'Karotten',1.00,'g'),(12,'Paprika',1.00,'g'),(13,'Zwiebel',1.00,'g'),(14,'Knoblauch',1.00,'g'),(15,'Ingwer',1.00,'g'),(16,'Koriander',1.00,'g'),(17,'Äpfel',1.00,'g'),(18,'Zucker',1.00,'g'),(19,'Mehl',1.00,'g'),(20,'Zimt',1.00,'g'),(21,'Natron',1.00,'g'),(22,'Hefe',1.00,'g'),(23,'Wasser',1.00,'g'),(24,'Milch',1.00,'g'),(25,'Butter',1.00,'g'),(26,'Öl',1.00,'g'),(27,'Vanilleextrakt',1.00,'g'),(28,'Kakao',1.00,'g'),(29,'Schokolade',1.00,'g'),(30,'Honig',1.00,'g'),(31,'Ahornsirup',1.00,'g'),(32,'Essig',1.00,'g'),(33,'Wein',1.00,'g'),(34,'Bier',1.00,'g'),(35,'Käse',1.00,'g'),(36,'Joghurt',1.00,'g'),(37,'Quark',1.00,'g'),(38,'Nüsse',1.00,'g'),(39,'Rosinen',1.00,'g'),(40,'Haferflocken',1.00,'g'),(41,'Marmelade',1.00,'g'),(42,'Senf',1.00,'g'),(43,'Ketchup',1.00,'g'),(44,'Puderzucker',1.00,'g'),(45,'Muskatnuss',1.00,'g'),(46,'Ingwer',1.00,'g'),(47,'Kurkuma',1.00,'g'),(48,'Paprika',1.00,'g'),(49,'Chilipulver',1.00,'g'),(50,'Koriander',1.00,'g'),(51,'Petersilie',1.00,'g'),(52,'Dill',1.00,'g'),(53,'Basilikum',1.00,'g'),(54,'Thymian',1.00,'g'),(55,'Oregano',1.00,'g'),(56,'Majoran',1.00,'g'),(57,'Lorbeerblätter',1.00,'g'),(58,'Schnittlauch',1.00,'g'),(59,'Zitronensaft',1.00,'g'),(60,'Orangensaft',1.00,'g'),(61,'Apfelessig',1.00,'g'),(62,'Sojasauce',1.00,'g'),(63,'Worcestersauce',1.00,'g'),(64,'Olivenöl',1.00,'g'),(65,'Kokosöl',1.00,'g'),(66,'Sesamöl',1.00,'g'),(67,'Rapsöl',1.00,'g'),(68,'Sonnenblumenöl',1.00,'g'),(69,'Mandelöl',1.00,'g'),(70,'Walnussöl',1.00,'g'),(71,'Leinsamenöl',1.00,'g'),(72,'Traubenkernöl',1.00,'g'),(73,'Erdnussöl',1.00,'g');
/*!40000 ALTER TABLE `zutaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'onlinerezeptapp'
--

--
-- Dumping routines for database 'onlinerezeptapp'
--
/*!50003 DROP FUNCTION IF EXISTS `Umrechnen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Umrechnen`(Menge DECIMAL(10,4), EinheitVon VARCHAR(50), EinheitNach VARCHAR(50)) RETURNS decimal(10,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE umgerechneteMenge DECIMAL(10,4);
    SELECT Faktor INTO umgerechneteMenge
    FROM Umrechnungsfaktoren
    WHERE EinheitVon = EinheitVon AND EinheitNach = EinheitNach
    LIMIT 1;
    IF umgerechneteMenge IS NULL THEN
        RETURN NULL; -- Kann nicht umgerechnet werden
    ELSE
        RETURN Menge * umgerechneteMenge;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12 11:27:08
