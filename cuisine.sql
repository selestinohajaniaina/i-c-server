-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 03, 2023 at 05:48 PM
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
  `nom_plat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`avi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avis`
--

INSERT INTO `avis` (`avi_id`, `id_plat`, `temps`, `dificulte`, `etoile`, `nom_plat`) VALUES
(30, '8', '5', 'facile', '5', 'salade'),
(23, '7', '1', 'moyen', '1', 'oeuf sur plat'),
(32, '2', '35', 'moyen', '4', 'poulet avec legume'),
(29, '9', '50', 'difficile', '3', 'gateau'),
(33, '10', '50', 'moyen', '3', 'Riz cantonais'),
(34, '13', '60', 'difficile', '3', 'Hamburger '),
(35, '11', '120', 'difficile', '2', 'pizza'),
(36, '12', '180', 'moyen', '4', 'Godrogodro'),
(37, '14', '60', 'moyen', '5', 'misao'),
(38, '15', '50', 'facile', '5', 'soupe chinoise ');

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

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
(40, 'LI', 'liquide');

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
CREATE TABLE IF NOT EXISTS `description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plat` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `img` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`id`, `id_plat`, `description`, `img`) VALUES
(1, 9, 'Un gâteau est une pâtisserie préparée à partir d\'une pâte sucrée cuite au four, généralement dans un moule. Il peut être garni de crème, de fruits, de chocolat ou de glaçage. Il se mange au goûter, ou à la fin du repas, au dessert. Le gâteau est généralement de forme ronde, carrée ou rectangulaire et plutôt plate.', 'gat.jpg'),
(2, 10, 'Le riz cantonais ou à la cantonaise est un riz cuit à l\'eau, sauté avec des œufs, des légumes, des morceaux de jambon et parfois des crevettes. Cette recette apparaît dans les textes français dans les années 1960 mais sa notoriété date du XXI e siècle avec la vogue de la cuisine chinoise.', 'riz_ca.jpg'),
(3, 7, 'Un œuf au plat ou œuf sur le plat, proche de œuf miroir, est un œuf, généralement de poule, cuit sur un plat, une poêle ou sur une plaque préalablement chauffée et beurrée ou huilée.', 'oeu_pl.jpg'),
(4, 2, 'La recette emincé de poulet aux légumes de provence en image et facile à réaliser.\r\nLamelles de poulet, courgettes, aubergine et poivron composent ce plat complet aux senteurs de Provence.', 'pou_leg.jpeg'),
(5, 8, 'entrée vinaigrette avant le repas.', 'sal.jpg'),
(6, 11, 'La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d\'huile d\'olive, de sauce tomate, de mozzarella et d\'autres ingrédients et cuite au four.', 'piz.jpg'),
(7, 12, 'Godrogodro, est le gâteau de riz au coco malgache.', 'godro.jpg'),
(8, 13, 'Un hamburger, ou par aphérèse burger, est un sandwich d\'origine allemande, composé de deux pains de forme ronde généralement garnis d\'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.', 'ember.jpg'),
(9, 14, 'Le mì xào (mì veut dire nouilles de blé et xào sautées) est un plat d\'origine chinoise.\r\nCette recette chinoise se retrouve aussi à Madagascar sous le nom de mi-sao.', 'misao.jpg'),
(10, 15, 'composant du spaghetti et legume.', 'soupe.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailplat`
--

INSERT INTO `detailplat` (`id`, `id_plat`, `libellePro`, `variete`, `qte`) VALUES
(19, '9', 'cocombre=kg', 'rouge', '1'),
(11, '2', 'poulet=kg', 'de chair', '0.25'),
(8, '2', 'poivre=kg', 'en graine', '0.01'),
(9, '2', 'pomme de terre=kg', NULL, '0.25'),
(10, '2', 'corgette=kg', NULL, '0.15'),
(14, '2', 'zebus=kg', '', '2'),
(15, '2', 'carrotte=kg', '', '1'),
(22, '10', 'carrotte=kg', '', '0.25'),
(26, '10', 'poulet=kg', 'de chair', '0.25'),
(24, '10', 'haricots verts =kg', '', '0.25'),
(25, '10', 'sel=pcs', 'fin avec petit cuillère ', '1'),
(27, '10', 'huile =L', '', '0.002'),
(28, '10', 'riz=kg', 'blanc', '0.3'),
(29, '10', 'eau=L', 'propre ', '0.25'),
(30, '10', 'carry=pcs', 'avec petit cuillère ', '1'),
(31, '10', 'oeuf =pcs', 'de poule ', '1'),
(32, '10', 'petit poids =kg', '', '0.1'),
(33, '7', 'oeuf =pcs', 'de poulet ', '1'),
(35, '7', 'poivre =pcs', 'avec culière du cafe', '0.5');

-- --------------------------------------------------------

--
-- Table structure for table `favory`
--

DROP TABLE IF EXISTS `favory`;
CREATE TABLE IF NOT EXISTS `favory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nom_plat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favory`
--

INSERT INTO `favory` (`id`, `id_plat`, `id_user`, `nom_plat`) VALUES
(6, 9, 2, 'gateau'),
(8, 2, 2, 'poulet avec legume'),
(9, 8, 2, 'salade');

-- --------------------------------------------------------

--
-- Table structure for table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id_plat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(255) NOT NULL,
  PRIMARY KEY (`id_plat`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom_plat`) VALUES
(2, 'poulet avec legume'),
(7, 'oeuf sur plat'),
(8, 'salade'),
(9, 'gateau'),
(10, 'Riz cantonais'),
(11, 'pizza'),
(12, 'Godrogodro'),
(13, 'Hamburger '),
(14, 'misao'),
(15, 'soupe chinoise ');

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`codePro`, `libellePro`, `variete`, `codeCa`, `unite`) VALUES
(2, 'carrotte', NULL, 'LE', 'kg'),
(3, 'poulet', NULL, 'V', 'kg'),
(13, 'zebus', NULL, 'V', 'kg'),
(5, 'pomme de terre', NULL, 'LE', 'kg'),
(6, 'poulet de chair', NULL, 'V', 'kg'),
(33, 'poivre ', NULL, 'E', 'pcs'),
(9, 'corgette', NULL, 'LE', 'kg'),
(11, 'vinaigre', NULL, 'LQ', 'L'),
(12, 'citron', NULL, 'F', 'pcs'),
(17, 'cocombre', NULL, 'LE', 'kg'),
(16, 'lait', NULL, 'LI', 'L'),
(18, 'sel', NULL, 'E', 'pcs'),
(19, 'fromage', NULL, 'LI', 'kg'),
(24, 'tomate', NULL, 'LE', 'pcs'),
(25, 'haricots verts ', NULL, 'LE', 'kg'),
(26, 'Oignon ', NULL, 'LE', 'pcs'),
(27, 'huile ', NULL, 'LI', 'L'),
(28, 'riz', NULL, 'P', 'kg'),
(29, 'eau', NULL, 'LI', 'L'),
(30, 'carry', NULL, 'E', 'pcs'),
(31, 'oeuf ', NULL, 'V', 'pcs'),
(32, 'petit poids ', NULL, 'LE', 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`) VALUES
(1, 'Selestino', 'selestinoolivier@gmail.com', '1234'),
(2, 'Alexandre', 'me.mail@gmail.com', 'azerty');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
