-- Backup de datos de la base de datos 'nombre_base_de_datos'
-- Este archivo contiene solo los datos de las siguientes tablas:
-- equipos
-- estadios
-- partidos
-- jugadores

-- Los datos comienzan a continuación:

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonato_rugby_uruguayo
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `entrenadores_auditoria`
--

DROP TABLE IF EXISTS `entrenadores_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenadores_auditoria` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(45) NOT NULL,
  `accion` varchar(45) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `estadio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `idx_nombre_equipo` (`nombre_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estadios`
--

DROP TABLE IF EXISTS `estadios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadios` (
  `id_estadio` int NOT NULL AUTO_INCREMENT,
  `nombre_estadio` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id_estadio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `informacion_partidos`
--

DROP TABLE IF EXISTS `informacion_partidos`;
/*!50001 DROP VIEW IF EXISTS `informacion_partidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `informacion_partidos` AS SELECT 
 1 AS `id_partido`,
 1 AS `equipo_local`,
 1 AS `equipo_visitante`,
 1 AS `marcador_local`,
 1 AS `marcador_visitante`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `nombre_jugador` varchar(100) NOT NULL,
  `posicion` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `id_equipo` int DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `id_equipo` (`id_equipo`),
  KEY `idx_nombre_jugador` (`nombre_jugador`),
  CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `equipo_local` int DEFAULT NULL,
  `equipo_visitante` int DEFAULT NULL,
  `marcador_local` int DEFAULT NULL,
  `marcador_visitante` int DEFAULT NULL,
  `id_estadio` int DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `equipo_local` (`equipo_local`),
  KEY `equipo_visitante` (`equipo_visitante`),
  KEY `id_estadio` (`id_estadio`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`equipo_local`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`id_estadio`) REFERENCES `estadios` (`id_estadio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `promedio_puntos_anotados`
--

DROP TABLE IF EXISTS `promedio_puntos_anotados`;
/*!50001 DROP VIEW IF EXISTS `promedio_puntos_anotados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `promedio_puntos_anotados` AS SELECT 
 1 AS `nombre_equipo`,
 1 AS `promedio_puntos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultados` (
  `id_resultado` int NOT NULL AUTO_INCREMENT,
  `id_partido` int DEFAULT NULL,
  `marcador_local` int NOT NULL,
  `marcador_visitante` int NOT NULL,
  PRIMARY KEY (`id_resultado`),
  KEY `id_partido` (`id_partido`),
  CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vista_total_puntos_equipo`
--

DROP TABLE IF EXISTS `vista_total_puntos_equipo`;
/*!50001 DROP VIEW IF EXISTS `vista_total_puntos_equipo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_total_puntos_equipo` AS SELECT 
 1 AS `equipo`,
 1 AS `total_puntos_local`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `informacion_partidos`
--

/*!50001 DROP VIEW IF EXISTS `informacion_partidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `informacion_partidos` AS select `partidos`.`id_partido` AS `id_partido`,`partidos`.`equipo_local` AS `equipo_local`,`partidos`.`equipo_visitante` AS `equipo_visitante`,`partidos`.`marcador_local` AS `marcador_local`,`partidos`.`marcador_visitante` AS `marcador_visitante` from `partidos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `promedio_puntos_anotados`
--

/*!50001 DROP VIEW IF EXISTS `promedio_puntos_anotados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `promedio_puntos_anotados` AS select `e`.`nombre_equipo` AS `nombre_equipo`,(avg(`p1`.`marcador_local`) + avg(`p2`.`marcador_visitante`)) AS `promedio_puntos` from ((`equipos` `e` join `partidos` `p1` on((`e`.`id_equipo` = `p1`.`equipo_local`))) join `partidos` `p2` on((`e`.`id_equipo` = `p2`.`equipo_visitante`))) group by `e`.`nombre_equipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_total_puntos_equipo`
--

/*!50001 DROP VIEW IF EXISTS `vista_total_puntos_equipo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_total_puntos_equipo` AS select `partidos`.`equipo_local` AS `equipo`,sum(`partidos`.`marcador_local`) AS `total_puntos_local` from `partidos` group by `partidos`.`equipo_local` union all select `partidos`.`equipo_visitante` AS `equipo`,sum(`partidos`.`marcador_visitante`) AS `total_puntos_visitante` from `partidos` group by `partidos`.`equipo_visitante` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 15:37:37
