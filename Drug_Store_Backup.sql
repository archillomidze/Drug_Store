-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2020 at 01:34 AM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Drug_Store`
--
CREATE DATABASE IF NOT EXISTS `Drug_Store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Drug_Store`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--
-- Creation: Jan 06, 2020 at 09:27 PM
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `is_capital` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `city`:
--   `country_id`
--       `country` -> `country_id`
--

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `country_id`, `is_capital`) VALUES
(1, 'Tbilisi', 1, 1),
(2, 'Tokyo', 2, 1),
(3, 'Brussels', 3, 1),
(4, 'Minsk', 4, 1),
(5, 'Brasillia', 5, 1),
(6, 'Ottawa', 6, 1),
(7, 'Santiago', 7, 1),
(8, 'Cairo', 8, 1),
(9, 'Paris', 9, 1),
(10, 'Berlin', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--
-- Creation: Jan 06, 2020 at 09:27 PM
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `country_alpha_code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `country`:
--

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_alpha_code`) VALUES
(1, 'Georgia', 'GE'),
(2, 'Japan', 'JP'),
(3, 'Belgium', 'BE'),
(4, 'Belarus', 'BY'),
(5, 'Brazil', 'BR'),
(6, 'Canada', 'CA'),
(7, 'Chile', 'CL'),
(8, 'Egypt', 'EG'),
(9, 'France', 'FR'),
(10, 'Germany', 'DE');

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--
-- Creation: Jan 06, 2020 at 09:27 PM
--

DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(100) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `manufacturer_description` text,
  `drug_type` enum('ointment','tablet','liquid') DEFAULT NULL,
  `drug_quantity` int(11) NOT NULL,
  `drug_unit` enum('pieces','grams') DEFAULT NULL,
  `drug_dosage_unit` int(11) DEFAULT NULL,
  `drug_dosage` enum('grams','milligrams') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `drug`:
--   `city_id`
--       `city` -> `city_id`
--   `manufacturer_id`
--       `manufacturer` -> `manufacturer_id`
--

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`drug_id`, `drug_name`, `city_id`, `manufacturer_id`, `manufacturer_description`, `drug_type`, `drug_quantity`, `drug_unit`, `drug_dosage_unit`, `drug_dosage`) VALUES
(1, 'ketotifeni', 3, 2, 'es kompania gamoircheva siswrafit da xarisxiani produqtit', 'tablet', 50, 'pieces', 2000, 'grams'),
(2, 'ToTalflue', 7, 4, 'kompania shedarebit axalia magram yavs kargi staffi da gamoircheva pasuxismgeblobit', 'liquid', 60, 'grams', 275, 'milligrams'),
(3, 'Mig400', 1, 7, 'ert-erti wamyvani kompania', 'tablet', 30, 'pieces', 1000, 'grams'),
(4, 'iodi', 5, 3, 'ert-erti udzvelesi kompania', 'liquid', 100, 'grams', 200, 'milligrams'),
(5, 'Etanoli', 10, 6, 'kompania wlebtan ertad ufro dzlierdeba', 'liquid', 150, 'grams', 150, 'grams'),
(6, 'Ketanoli', 2, 1, 'cudi staffis miuxedavad ar kargad xarisxs', 'tablet', 30, 'pieces', 500, 'grams'),
(7, 'Omega3', 8, 5, 'ramdenjerme gakotrebis miuxedavad kvlav fexze dgas', 'tablet', 30, 'pieces', 400, 'grams'),
(8, 'fastumgel', 6, 1, 'cudi staffis miuxedavad ar kargad xarisxs', 'ointment', 250, 'grams', 250, 'grams'),
(9, 'Dufalaki', 5, 5, 'ramdenjerme gakotrebis miuxedavad kvlav fexze dgas', 'liquid', 150, 'grams', 140, 'grams'),
(10, 'Noshpa', 4, 7, 'ert-erti wamyvani kompania', 'tablet', 40, 'pieces', 1000, 'grams'),
(11, 'Regidroni', 9, 3, 'ert-erti udzvelesi kompania', 'liquid', 300, 'grams', 400, 'milligrams'),
(12, 'kolxuri', 1, 7, 'ert-erti wamyvani kompania', 'ointment', 240, 'grams', 450, 'milligrams');

-- --------------------------------------------------------

--
-- Table structure for table `drug_sales`
--
-- Creation: Jan 06, 2020 at 09:27 PM
--

DROP TABLE IF EXISTS `drug_sales`;
CREATE TABLE `drug_sales` (
  `drug_sales_id` int(11) NOT NULL,
  `drug_series_id` int(11) DEFAULT NULL,
  `drug_sale_quantity` int(11) NOT NULL,
  `drug_sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `drug_price` decimal(12,4) DEFAULT NULL,
  `sale_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `drug_sales`:
--   `drug_series_id`
--       `drug_series` -> `drug_series_id`
--   `sale_user`
--       `users` -> `user_id`
--

--
-- Dumping data for table `drug_sales`
--

INSERT INTO `drug_sales` (`drug_sales_id`, `drug_series_id`, `drug_sale_quantity`, `drug_sale_date`, `drug_price`, `sale_user`) VALUES
(1, 4, 23, '2020-01-08 04:32:00', '15.7000', 4),
(2, 1, 30, '2004-07-12 02:45:00', '12.8900', 3),
(3, 2, 20, '2019-01-02 22:22:00', '6.1200', 20),
(4, 5, 10, '2006-10-05 04:00:00', '3.9000', 17),
(5, 3, 4, '2000-08-06 20:32:00', '13.4000', 11),
(6, 7, 17, '2013-04-10 04:00:00', '5.2800', 7),
(7, 6, 60, '2004-03-18 20:12:00', '9.5000', 1),
(8, 11, 41, '2001-12-27 20:00:00', '10.2000', 5),
(9, 10, 5, '2016-07-09 01:34:00', '5.4300', 6),
(10, 12, 18, '2008-08-08 04:32:00', '2.2500', 8),
(11, 14, 9, '2005-12-14 03:05:20', '7.8000', 14),
(12, 13, 4, '2009-09-30 03:34:00', '1.5000', 18);

-- --------------------------------------------------------

--
-- Table structure for table `drug_series`
--
-- Creation: Jan 06, 2020 at 09:27 PM
--

DROP TABLE IF EXISTS `drug_series`;
CREATE TABLE `drug_series` (
  `drug_series_id` int(11) NOT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `drug_manufacture_date` date NOT NULL,
  `drug_expiration_date` date NOT NULL,
  `drug_buy_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `drug_buy_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `drug_series`:
--   `drug_id`
--       `drug` -> `drug_id`
--

--
-- Dumping data for table `drug_series`
--

INSERT INTO `drug_series` (`drug_series_id`, `drug_id`, `drug_manufacture_date`, `drug_expiration_date`, `drug_buy_date`, `drug_buy_quantity`) VALUES
(1, 5, '2001-11-02', '2006-12-20', '2020-01-03 15:11:41', 3000),
(2, 3, '2000-11-11', '2003-12-31', '2020-01-03 15:11:41', 5000),
(3, 1, '2001-02-28', '2004-04-02', '2020-01-03 15:11:41', 1000),
(4, 7, '2004-11-02', '2007-04-10', '2020-01-03 15:11:41', 3500),
(5, 6, '2002-05-10', '2004-10-06', '2020-01-03 15:11:41', 5000),
(6, 4, '2004-01-02', '2006-08-18', '2020-01-03 15:11:41', 1400),
(7, 10, '2000-11-10', '2003-06-21', '2020-01-03 15:11:41', 2000),
(8, 12, '2001-08-02', '2005-09-30', '2020-01-03 15:11:41', 2000),
(9, 11, '2002-09-11', '2006-12-02', '2020-01-03 15:11:41', 1400),
(10, 8, '2004-12-10', '2007-01-01', '2020-01-03 15:11:41', 5000),
(11, 9, '2000-03-03', '2003-05-16', '2020-01-03 15:11:41', 3000),
(12, 7, '2003-07-19', '2005-11-02', '2020-01-03 15:11:41', 1000),
(13, 2, '2005-10-04', '2008-07-17', '2020-01-03 15:11:41', 4500),
(14, 1, '2002-01-13', '2005-10-19', '2020-01-03 15:11:41', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--
-- Creation: Jan 06, 2020 at 09:27 PM
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `manufacturer_name` varchar(50) NOT NULL,
  `manufacturer_license_code` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `manufacturer_address` varchar(50) NOT NULL,
  `manufacturer_annotation` text,
  `manufacturer_email` varchar(50) DEFAULT NULL,
  `manufacturer_establish_date` date NOT NULL,
  `manufacturer_closure_date` date DEFAULT NULL,
  `mother_company` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `manufacturer`:
--   `city_id`
--       `city` -> `city_id`
--   `mother_company`
--       `manufacturer` -> `manufacturer_id`
--

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `manufacturer_name`, `manufacturer_license_code`, `city_id`, `manufacturer_address`, `manufacturer_annotation`, `manufacturer_email`, `manufacturer_establish_date`, `manufacturer_closure_date`, `mother_company`) VALUES
(1, 'BTG', 1234567, 1, 'Pekinis #5', 'am wamalma sheidzleba gamoiwviso guldzmarva', 'marting@gmail.com', '2019-12-02', '2019-12-19', 1),
(2, 'Ego', 453, 3, 'kofuku #12', 'ukuchvnebebi: halucinaciebi, gulisreva da udziloba', 'egodisco@gmail.com', '2002-04-30', NULL, 2),
(3, 'Faron', 323, 2, 'Greentown #34', 'ukuchveneba: sheidzleba gamoiwvios saxsrebis tkivili', 'faroni@gmail.com', '1980-03-15', '2007-01-12', 3),
(4, 'Jazz', 12, 5, 'Stalin #56', 'ukuchveba: iwvevs aknes', 'HealthyJazz@gmail.com', '2007-12-01', NULL, 4),
(5, 'Leo', 54, 4, 'tree #4', 'iwvevs wonashi momatebas', 'Leonard@gmail.com', '1999-03-09', NULL, 5),
(6, 'Kite', 68, 6, 'meliqishvili #6', 'hormonaluri dargvevebi', 'wildkitten@gmail.com', '1978-05-04', '1980-12-04', 6),
(7, 'King', 70, 7, 'dolidze #8', 'ukontrolo kleba wonashi', 'KingPharmacy01@gmail.com', '2001-07-11', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--
-- Creation: Jan 06, 2020 at 09:31 PM
-- Last update: Jan 06, 2020 at 09:31 PM
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `drug_price_id` int(11) NOT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `drug_price` decimal(12,4) NOT NULL,
  `price_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `price`:
--

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`drug_price_id`, `drug_id`, `drug_price`, `price_date`) VALUES
(1, 6, '15.7000', '2020-01-03 15:17:14'),
(2, 4, '12.8900', '2020-01-03 15:17:14'),
(3, 2, '6.1200', '2020-01-03 15:17:14'),
(4, 1, '3.9000', '2020-01-03 15:17:14'),
(5, 8, '13.4000', '2020-01-03 15:17:14'),
(6, 12, '5.2800', '2020-01-03 15:17:14'),
(7, 3, '9.2800', '2020-01-03 15:17:14'),
(8, 5, '10.2000', '2020-01-03 15:17:14'),
(9, 6, '5.4300', '2020-01-03 15:17:14'),
(10, 6, '2.2500', '2020-01-03 15:17:14'),
(11, 6, '7.8000', '2020-01-03 15:17:14'),
(12, 6, '1.5000', '2020-01-03 15:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Jan 06, 2020 at 09:32 PM
-- Last update: Jan 06, 2020 at 09:32 PM
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_personal_id` int(11) NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_birth_date` date DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_telephone` varchar(25) NOT NULL,
  `user_registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_personal_id`, `user_first_name`, `user_last_name`, `user_birth_date`, `user_address`, `user_telephone`, `user_registration_date`) VALUES
(1, 987654335, 'Tatia', 'Oqropiridze', '1999-11-01', 'pekinis 21', '555566302', '2019-12-29 20:43:23'),
(2, 987654336, 'Giorgi', 'Khitarishvili', '1998-12-28', 'vaja pshavelas 7', '591953681', '2019-12-29 20:43:23'),
(3, 987654337, 'Archil', 'Lomidze', '1998-09-09', 'oqros qucha 3', '598868948', '2019-12-29 20:43:23'),
(4, 987654338, 'Tornike', 'Tetiashvili', '1998-10-07', 'javaxetis 5', '592277317', '2019-12-29 20:43:23'),
(5, 987654339, 'Giorgi', 'Shainidze', '1976-11-15', 'pushkinis 111', '577536753', '2019-12-29 20:43:23'),
(6, 987654340, 'Luka', 'Miqadze', '1997-02-01', 'stalinis 12', '555123465', '2019-12-29 20:43:23'),
(7, 987654341, 'Giorgi', 'Zoidze', '1998-05-26', 'cxakaias 10', '568394867', '2019-12-29 20:43:23'),
(8, 987654342, 'Marina', 'Maxaradzse', '1977-11-19', 'shafatavas 49', '555463909', '2019-12-29 20:43:23'),
(9, 987654343, 'Irina', 'Tavadze', '1977-05-19', 'telmanis 76', '599019384', '2019-12-29 20:43:23'),
(10, 987654344, 'Mediko', 'khujadze', '1978-11-16', 'kirovis 90', '557685948', '2019-12-29 20:43:23'),
(11, 987654345, 'Ana', 'Loria', '1980-07-08', 'tabidzis 32', '598576843', '2019-12-29 20:43:23'),
(12, 987654346, 'Tamuna', 'Pircxalaishvili', '1999-10-10', 'abuselidzis 9', '555470010', '2019-12-29 20:43:23'),
(13, 987654347, 'Ana', 'Khoperia', '2001-06-05', 'telmanis 50', '592114549', '2019-12-29 20:43:23'),
(14, 987654348, 'Givi', 'Xucishvili', '2000-11-07', 'chavchavadzis 41', '557424710', '2019-12-29 20:43:23'),
(15, 987654349, 'Giorgi', 'Lezhava', '1998-09-12', 'weretlis 45', '557773374', '2019-12-29 20:43:23'),
(16, 987654350, 'Tornike', 'Gujabidze', '2000-06-10', 'lermontovis 11', '574881689', '2019-12-29 20:43:23'),
(17, 987654351, 'Nika', 'Lortqifanidze', '2000-02-03', 'ninoshvilis 54', '577286967', '2019-12-29 20:43:23'),
(18, 987654352, 'Mako', 'Papuashvili', '1995-04-06', 'vercxlis quchis 19', '597996296', '2019-12-29 20:43:23'),
(19, 987654353, 'Saba', 'Megrelishvili', '2000-12-01', 'kldiashvilis 66', '557932288', '2019-12-29 20:43:23'),
(20, 987654354, 'Luka', 'Toradze', '1999-11-03', 'ximshiashvilis 8', '593563388', '2019-12-29 20:43:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country_name` (`country_name`),
  ADD UNIQUE KEY `country_alpha_code` (`country_alpha_code`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `drug_id_2` (`drug_id`);

--
-- Indexes for table `drug_sales`
--
ALTER TABLE `drug_sales`
  ADD PRIMARY KEY (`drug_sales_id`),
  ADD KEY `drug_series_id` (`drug_series_id`),
  ADD KEY `sale_user` (`sale_user`);

--
-- Indexes for table `drug_series`
--
ALTER TABLE `drug_series`
  ADD PRIMARY KEY (`drug_series_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `drug_series_id` (`drug_series_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`),
  ADD UNIQUE KEY `manufacturer_name` (`manufacturer_name`),
  ADD UNIQUE KEY `manufacturer_license_code` (`manufacturer_license_code`),
  ADD UNIQUE KEY `manufacturer_email` (`manufacturer_email`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `mother_company` (`mother_company`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`drug_price_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `drug_price_id` (`drug_price_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_personal_id` (`user_personal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `drug_price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_personal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=987654355;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `drug_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`);

--
-- Constraints for table `drug_sales`
--
ALTER TABLE `drug_sales`
  ADD CONSTRAINT `drug_sales_ibfk_1` FOREIGN KEY (`drug_series_id`) REFERENCES `drug_series` (`drug_series_id`),
  ADD CONSTRAINT `drug_sales_ibfk_2` FOREIGN KEY (`sale_user`) REFERENCES `Drug_Store_Old`.`users` (`user_id`);

--
-- Constraints for table `drug_series`
--
ALTER TABLE `drug_series`
  ADD CONSTRAINT `drug_series_ibfk_1` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`);

--
-- Constraints for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `manufacturer_ibfk_2` FOREIGN KEY (`mother_company`) REFERENCES `manufacturer` (`manufacturer_id`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table city
--

--
-- Metadata for table country
--

--
-- Metadata for table drug
--

--
-- Metadata for table drug_sales
--

--
-- Metadata for table drug_series
--

--
-- Metadata for table manufacturer
--

--
-- Metadata for table price
--

--
-- Metadata for table users
--

--
-- Metadata for database Drug_Store
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
