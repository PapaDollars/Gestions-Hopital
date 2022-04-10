-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 03:46 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `healthforall`
--

-- --------------------------------------------------------

--
-- Table structure for table `bilan`
--

CREATE TABLE IF NOT EXISTS `bilan` (
  `DATE` date DEFAULT NULL,
  `CONSULTER` varchar(3) DEFAULT NULL,
  `IDBILAN` int(11) NOT NULL AUTO_INCREMENT,
  `CODEP` varchar(8) NOT NULL,
  `DESCRIPTIONBILAN` text,
  PRIMARY KEY (`IDBILAN`),
  KEY `FK_FAIRE` (`CODEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `docteur`
--

CREATE TABLE IF NOT EXISTS `docteur` (
  `CODEDOC` varchar(5) NOT NULL,
  `NOMDOC` varchar(18) DEFAULT NULL,
  `PRENOMDOC` varchar(8) DEFAULT NULL,
  `NUMERODOC` int(11) DEFAULT NULL,
  `SPECIALITEDOC` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CODEDOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `docteur`
--

INSERT INTO `docteur` (`CODEDOC`, `NOMDOC`, `PRENOMDOC`, `NUMERODOC`, `SPECIALITEDOC`) VALUES
('Alain', 'Fouba', 'Alain', 677765541, 'Cardio'),
('DD1', 'Fouba', 'Alain', 695143565, 'Cardiologie'),
('DDD', 'T', 'A', 6, 'C'),
('DDT', 'Alain', 'ttt', 1111, 'sdsd');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `CODEP` varchar(8) NOT NULL,
  `NOMP` varchar(18) DEFAULT NULL,
  `PRENOMP` varchar(8) DEFAULT NULL,
  `AGEP` int(11) DEFAULT NULL,
  `TAILLEP` float DEFAULT NULL,
  `POIDSP` float DEFAULT NULL,
  `ETATCOVIDP` varchar(7) DEFAULT NULL,
  `PASSWORD` varchar(12) NOT NULL,
  PRIMARY KEY (`CODEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`CODEP`, `NOMP`, `PRENOMP`, `AGEP`, `TAILLEP`, `POIDSP`, `ETATCOVIDP`, `PASSWORD`) VALUES
('15Alain', 'Alain', 'Fouba', 15, 1.45, 85, '', 'gta123'),
('20V2060', 'Lekene', 'cedric', 10, 85, 85, '', 'hacker-man');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `DESCRIPTIONPRESCRIPTION` text,
  `IDPRESCRIPTION` int(11) NOT NULL AUTO_INCREMENT,
  `CODEDOC` varchar(5) NOT NULL,
  `CODEP` varchar(8) NOT NULL,
  PRIMARY KEY (`IDPRESCRIPTION`),
  KEY `FK_PRESCRIRE` (`CODEDOC`),
  KEY `FK_RECEVOIR` (`CODEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `traitement`
--

CREATE TABLE IF NOT EXISTS `traitement` (
  `NOMTRAITEMENT` varchar(18) DEFAULT NULL,
  `IMAGE` varchar(150) DEFAULT NULL,
  `DESCRIPTIONTRAITEMENT` text,
  `IDTRAITEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `CODEDOC` varchar(5) NOT NULL,
  PRIMARY KEY (`IDTRAITEMENT`),
  KEY `FK_AJOUTER` (`CODEDOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilan`
--
ALTER TABLE `bilan`
  ADD CONSTRAINT `FK_FAIRE` FOREIGN KEY (`CODEP`) REFERENCES `patient` (`CODEP`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `FK_PRESCRIRE` FOREIGN KEY (`CODEDOC`) REFERENCES `docteur` (`CODEDOC`),
  ADD CONSTRAINT `FK_RECEVOIR` FOREIGN KEY (`CODEP`) REFERENCES `patient` (`CODEP`);

--
-- Constraints for table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `FK_AJOUTER` FOREIGN KEY (`CODEDOC`) REFERENCES `docteur` (`CODEDOC`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
