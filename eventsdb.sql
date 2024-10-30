-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 30, 2024 at 05:49 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`) VALUES
(1, 'Bucuresti'),
(2, 'Cluj-Napoca'),
(3, 'Iasi');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `city_id` int DEFAULT NULL,
  `event_type_id` int DEFAULT NULL,
  `event_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `event_type_id` (`event_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `city_id`, `event_type_id`, `event_time`) VALUES
(1, 'Concert Rock', 1, 1, '2023-11-05 20:00:00'),
(2, 'Piesa de teatru', 2, 2, '2023-11-10 18:00:00'),
(3, 'Conferinta IT', 3, 3, '2023-11-15 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
CREATE TABLE IF NOT EXISTS `event_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `type_name`) VALUES
(1, 'Concert'),
(2, 'Teatru'),
(3, 'Conferinta');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
