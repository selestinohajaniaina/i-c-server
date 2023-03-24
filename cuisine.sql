-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2023 at 10:37 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuisine`
--

-- --------------------------------------------------------

--
-- Table structure for table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `avi_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plat` varchar(255) DEFAULT NULL,
  `temps` varchar(255) DEFAULT NULL,
  `dificulte` varchar(255) DEFAULT NULL,
  `etoile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`avi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avis`
--

INSERT INTO `avis` (`avi_id`, `id_plat`, `temps`, `dificulte`, `etoile`) VALUES
(9, '2', '10', 'moyenne', 'â­â­â­â­â­');

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_code` varchar(255) DEFAULT NULL,
  `libelleCa` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`cat_id`, `cat_code`, `libelleCa`) VALUES
(1, 'LE', 'legume'),
(16, 'V', 'viande'),
(6, 'E', 'epice'),
(12, 'F', 'fruit'),
(13, 'P', 'poisson'),
(14, 'LG', 'legumineuse'),
(29, 'LI', 'liquide');

-- --------------------------------------------------------

--
-- Table structure for table `detailplat`
--

DROP TABLE IF EXISTS `detailplat`;
CREATE TABLE IF NOT EXISTS `detailplat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plat` varchar(255) NOT NULL,
  `libellePro` varchar(255) NOT NULL,
  `variete` varchar(255) DEFAULT NULL,
  `qte` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailplat`
--

INSERT INTO `detailplat` (`id`, `id_plat`, `libellePro`, `variete`, `qte`) VALUES
(11, '2', 'poulet=kg', 'de chair', '0.25'),
(8, '2', 'poivre=kg', 'en graine', '0.01'),
(9, '2', 'pomme de terre=kg', NULL, '0.25'),
(10, '2', 'corgette=kg', NULL, '0.15');

-- --------------------------------------------------------

--
-- Table structure for table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id_plat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(255) NOT NULL,
  PRIMARY KEY (`id_plat`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom_plat`) VALUES
(2, 'poulet avec legume'),
(7, 'oeuf sur plat'),
(8, 'salade');

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `codePro` int(11) NOT NULL AUTO_INCREMENT,
  `libellePro` varchar(255) NOT NULL,
  `variete` varchar(255) DEFAULT NULL,
  `codeCa` varchar(255) NOT NULL,
  `unite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codePro`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`codePro`, `libellePro`, `variete`, `codeCa`, `unite`) VALUES
(2, 'carrotte', NULL, 'LE', 'kg'),
(3, 'poulet', NULL, 'V', 'kg'),
(13, 'zebus', NULL, 'V', 'kg'),
(5, 'pomme de terre', NULL, 'LE', 'kg'),
(6, 'poulet de chair', NULL, 'V', 'kg'),
(8, 'poivre', NULL, 'E', 'kg'),
(9, 'corgette', NULL, 'LE', 'kg'),
(11, 'vinaigre', NULL, 'LQ', 'L'),
(12, 'citron', NULL, 'F', 'pcs'),
(16, 'lait', NULL, 'LI', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `codeRe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(255) NOT NULL,
  `nbr_per` int(11) NOT NULL,
  PRIMARY KEY (`codeRe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
