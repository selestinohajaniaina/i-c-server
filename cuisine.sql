-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: sql.freedb.tech:3306
-- Generation Time: Mar 31, 2023 at 12:42 PM
-- Server version: 8.0.28
-- PHP Version: 8.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freedb_dbcuisine`
--

-- --------------------------------------------------------

--
-- Table structure for table `avis`
--

CREATE TABLE `avis` (
  `avi_id` int NOT NULL,
  `id_plat` varchar(255) DEFAULT NULL,
  `temps` varchar(255) DEFAULT NULL,
  `dificulte` varchar(255) DEFAULT NULL,
  `etoile` varchar(255) DEFAULT NULL,
  `nom_plat` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avis`
--

INSERT INTO `avis` (`avi_id`, `id_plat`, `temps`, `dificulte`, `etoile`, `nom_plat`) VALUES
(30, '8', '5', 'facile', '5', 'salade'),
(23, '7', '1', 'moyen', '1', 'oeuf sur plat'),
(18, '2', '7', 'facile', '2', 'poulet avec legume'),
(29, '9', '50', 'difficile', '3', 'gateau');

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `cat_id` int NOT NULL,
  `cat_code` varchar(255) DEFAULT NULL,
  `libelleCa` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(40, 'LI', 'liquide'),
(47, 'O', 'Oeuf ');

-- --------------------------------------------------------

--
-- Table structure for table `detailplat`
--

CREATE TABLE `detailplat` (
  `id` int NOT NULL,
  `id_plat` varchar(255) NOT NULL,
  `libellePro` varchar(255) NOT NULL,
  `variete` varchar(255) DEFAULT NULL,
  `qte` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(20, '9', 'sel=pcs', 'Fin', '0.5');

-- --------------------------------------------------------

--
-- Table structure for table `plat`
--

CREATE TABLE `plat` (
  `id_plat` int NOT NULL,
  `nom_plat` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom_plat`) VALUES
(2, 'poulet avec legume'),
(7, 'oeuf sur plat'),
(8, 'salade'),
(9, 'gateau');

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `codePro` int NOT NULL,
  `libellePro` varchar(255) NOT NULL,
  `variete` varchar(255) DEFAULT NULL,
  `codeCa` varchar(255) NOT NULL,
  `unite` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(17, 'cocombre', NULL, 'LE', 'kg'),
(16, 'lait', NULL, 'LI', 'L'),
(18, 'sel', NULL, 'E', 'pcs'),
(23, 'Oeuf', NULL, 'O', 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`) VALUES
(1, 'Selestino', 'selestinoolivier@gmail.com', '123'),
(2, 'Alexandre', 'me.mail@gmail.com', 'azerty'),
(4, 'test', 'bmwailers@gmail.com', 'test123'),
(5, 'test', 'bmwailers@gmail.com', 'test123'),
(6, 'Rolf', 'rolf@gmail.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`avi_id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `detailplat`
--
ALTER TABLE `detailplat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id_plat`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`codePro`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avis`
--
ALTER TABLE `avis`
  MODIFY `avi_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `cat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `detailplat`
--
ALTER TABLE `detailplat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `plat`
--
ALTER TABLE `plat`
  MODIFY `id_plat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `codePro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
