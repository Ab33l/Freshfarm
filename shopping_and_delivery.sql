-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2018 at 09:52 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_and_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Categoryid` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Categoryid`, `Name`, `Parent`) VALUES
(1, 'Fruit', 0),
(2, 'Vegetables', 0),
(3, 'Cereals', 0),
(4, 'Herbs', 0),
(5, 'Spices', 0),
(6, 'Berries', 1),
(7, 'Pits', 1),
(8, 'Core', 1),
(9, 'Citrus Fruits', 1),
(10, 'Melons', 1),
(11, 'Tropical Fruits', 1),
(12, 'Tubers', 2),
(13, 'Bulbs', 2),
(14, 'Flowers', 2),
(15, 'Leaves', 2),
(16, 'Roots', 2),
(17, 'Stems', 2),
(18, 'Seeds', 3),
(19, 'Dried Herbs', 4),
(20, 'Fresh Herbs', 4),
(21, 'Dried Spices', 5),
(22, 'Spice Blends', 5),
(24, 'Legumes', 3),
(25, 'Nuts', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `email`, `phone`, `address`, `created`, `modified`, `status`, `firstname`, `lastname`, `description`) VALUES
(1, 'testuser@gmail.com', '9999999999', 'New York, NY, USA', '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1', 'Test ', 'User', 'Very fragile. Hold Up.'),
(2, 'amoskibe@yahoo.com', '0711000333', 'Kenya meat Commission, 2nd floor', '2017-11-10 00:00:00', '2017-11-10 00:00:00', '1', 'Amos', 'Kibet', 'To be delivered by 9AM'),
(3, 'abellwasike@gmail.com', '0702675898', 'Langata Akila Room 4', '2017-11-14 04:21:45', '2017-11-14 04:22:57', '1', 'Abel', 'Wasike', 'Handle with Care'),
(4, 'cyril@gmail.com', '0702675898', 'Huddersfield, 2nd Floor', '2018-06-04 13:11:13', '2017-11-14 05:44:26', '1', 'Cyril', 'Odhiambo', '	Take your time\r\n		');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total_price`, `created`, `modified`, `status`) VALUES
(1, 1, 120.00, '2017-11-05 10:37:51', '2017-11-05 10:37:51', '1'),
(2, 1, 25.00, '2017-11-05 12:04:46', '2017-11-05 12:04:46', '1'),
(4, 1, 25.00, '2017-11-05 12:55:48', '2017-11-05 12:55:48', '1'),
(5, 1, 15.00, '2017-11-05 13:08:49', '2017-11-05 13:08:49', '1'),
(6, 1, 15.00, '2017-11-05 14:32:00', '2017-11-05 14:32:00', '1'),
(39, 1, 12.00, '2017-11-13 16:41:33', '2017-11-13 16:41:33', '1'),
(40, 3, 35.40, '2017-11-14 03:09:43', '2017-11-14 03:09:43', '1'),
(41, 4, 12.00, '2017-11-14 03:44:33', '2017-11-14 03:44:33', '1'),
(42, 4, 46.40, '2017-11-14 04:13:04', '2017-11-14 04:13:04', '1'),
(43, 4, 23.00, '2017-11-14 04:19:17', '2017-11-14 04:19:17', '1'),
(44, 4, 12.40, '2017-11-14 04:32:48', '2017-11-14 04:32:48', '1'),
(45, 4, 12.00, '2017-11-14 10:33:01', '2017-11-14 10:33:01', '1'),
(46, 4, 46.80, '2017-11-14 11:51:14', '2017-11-14 11:51:14', '1'),
(47, 4, 90.74, '2017-11-14 12:22:17', '2017-11-14 12:22:17', '1'),
(48, 4, 48.00, '2018-01-22 19:16:32', '2018-01-22 19:16:32', '1'),
(49, 4, 12.00, '2018-02-11 20:10:18', '2018-02-11 20:10:18', '1'),
(50, 4, 12.00, '2018-04-29 22:46:13', '2018-04-29 22:46:13', '1'),
(51, 4, 12.40, '2018-04-30 10:31:29', '2018-04-30 10:31:29', '1'),
(52, 4, 24.00, '2018-04-30 11:05:13', '2018-04-30 11:05:13', '1'),
(53, 4, 12.40, '2018-05-04 12:48:54', '2018-05-04 12:48:54', '1'),
(54, 4, 12.40, '2018-05-04 12:49:41', '2018-05-04 12:49:41', '1'),
(55, 4, 24.00, '2018-06-01 16:31:55', '2018-06-01 16:31:55', '1'),
(56, 4, 124.00, '2018-06-01 16:44:34', '2018-06-01 16:44:34', '1'),
(57, 4, 12.00, '2018-06-01 17:03:17', '2018-06-01 17:03:17', '1'),
(58, 4, 34.00, '2018-06-01 17:15:50', '2018-06-01 17:15:50', '1'),
(59, 4, 26.00, '2018-06-25 00:27:07', '2018-06-25 00:27:07', '1'),
(60, 0, 12.40, '2018-07-12 12:14:09', '2018-07-12 12:14:09', '1'),
(61, 0, 37.20, '2018-07-12 13:53:50', '2018-07-12 13:53:50', '1'),
(62, 0, 12.00, '2018-12-05 21:20:38', '2018-12-05 21:20:38', '1'),
(63, 0, 12.00, '2018-12-05 21:21:22', '2018-12-05 21:21:22', '1');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 3),
(3, 2, 2, 1),
(6, 4, 2, 1),
(7, 5, 1, 1),
(8, 6, 1, 1),
(53, 39, 1, 1),
(54, 40, 5, 1),
(55, 40, 17, 1),
(56, 41, 1, 1),
(57, 42, 7, 1),
(58, 42, 5, 1),
(59, 43, 17, 1),
(60, 44, 5, 1),
(61, 45, 1, 1),
(62, 46, 4, 1),
(63, 46, 5, 2),
(64, 47, 7, 2),
(65, 47, 33, 2),
(66, 48, 1, 4),
(67, 49, 9, 1),
(68, 50, 9, 1),
(69, 51, 5, 1),
(70, 52, 1, 2),
(71, 53, 5, 1),
(72, 54, 5, 1),
(73, 55, 1, 2),
(74, 56, 5, 10),
(75, 57, 1, 1),
(76, 58, 7, 1),
(77, 59, 2, 1),
(78, 60, 5, 1),
(79, 61, 5, 3),
(80, 62, 1, 1),
(81, 63, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Productid` int(11) NOT NULL,
  `Category` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `Image` varchar(250) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `Deleted` int(11) DEFAULT NULL,
  `Featured` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Productid`, `Category`, `Name`, `UnitPrice`, `Image`, `date_added`, `Deleted`, `Featured`) VALUES
(1, 6, 'Strawberries', 12, '/copy/strawberry.jpg', '2017-11-04 16:00:00', 0, 1),
(2, 6, 'Blackberries', 26, '/copy/blackberry.jpg', '2017-11-04 16:01:00', 0, 0),
(3, 6, 'Grapes', 21, '/copy/grape.jpg', '2017-11-04 16:02:00', 0, 0),
(4, 6, 'Blueberries', 22, '/copy/blueberries.jpg', '2017-11-04 16:03:00', 0, 0),
(5, 7, 'Plums', 12.4, '/copy/plums.jpg', '2017-11-04 16:05:00', 0, 1),
(6, 7, 'Cherries', 45.12, '/copy/cherries.jpg', '0000-00-00 00:00:00', 0, 0),
(7, 8, 'Green Apples', 34, '/copy/greenapples.jpg', '2017-11-04 16:07:00', 0, 1),
(8, 8, 'Red Apples', 25.12, '/copy/redapples.jpg', '2017-11-04 16:08:00', 0, 0),
(9, 9, 'Oranges', 12, '/copy/orangee.jpg', '2017-11-04 16:09:00', 0, 1),
(10, 9, 'Limes', 25.98, '/copy/lime.jpg', '2017-11-04 16:10:00', 0, 0),
(11, 9, 'Lemons', 10.11, '/copy/lemon.jpg', '2017-11-04 16:10:04', 0, 0),
(12, 10, 'Watermelons', 15.14, '/copy/melon.jpg', '2017-11-04 16:11:00', 0, 0),
(13, 10, 'Honeydews', 34, '/copy/honeydew.jpg', '2017-11-04 16:12:00', 0, 1),
(14, 11, 'Kiwi', 45, '/copy/k1.jpg', '2017-11-04 16:13:00', 0, 1),
(15, 11, 'Dates', 16.99, '/copy/dates.jpg', '2017-11-04 16:14:00', 0, 0),
(16, 12, 'Sweet Potatoes', 29.61, '/copy/sweetpot.jpg', '2017-11-04 16:15:00', 0, 0),
(17, 12, 'Potatoes', 23, '/copy/pt.jpg', '2017-11-04 16:16:00', 0, 1),
(18, 12, 'Yams', 12.45, '/copy/yam1.jpg', '2017-11-04 16:18:00', 0, 0),
(19, 13, 'Onions', 34.21, '/copy/onion2.jpg', '2017-11-04 16:19:00', 0, 0),
(20, 13, 'Garlic', 12.54, '/copy/g1.jpg', '2017-11-04 16:20:00', 0, 0),
(21, 14, 'Broccoli', 34.54, '/copy/broc.jpg', '2017-11-04 16:21:00', 0, 0),
(22, 14, 'Cauliflower', 23.46, '/copy/cau.jpg', '2017-11-04 16:22:00', 0, 0),
(23, 15, 'Green Cabbages', 12.78, '/copy/cabg.jpg', '2017-11-04 16:23:00', 0, 0),
(24, 15, 'Red Cabbages', 12.45, '/copy/cabred.jpg', '2017-11-04 16:24:00', 0, 0),
(25, 16, 'Carrots', 12.45, '/copy/carrot2.jpg', '2017-11-04 16:24:00', 0, 0),
(26, 16, 'Radishes', 15.11, '/copy/rad.jpg', '2017-11-04 16:25:00', 0, 0),
(28, 17, 'Celery', 10.67, '/copy/celery.jpg', '2017-11-04 16:30:00', 0, 0),
(29, 17, 'Kohlrabi', 12.23, '/copy/koh.jpg', '2017-11-04 16:31:00', 0, 0),
(30, 18, 'Soybeans', 34.11, '/copy/soybeans.jpg', '2017-11-04 16:32:00', 0, 0),
(31, 18, 'Peas', 34.87, '/copy/peas1.jpg', '2017-11-04 16:34:00', 0, 0),
(32, 19, 'Chia Seeds', 10.34, '/copy/chia.jpg', '2017-11-04 16:36:00', 0, 0),
(33, 19, 'Caraway seeds', 11.37, '/copy/caraway.jpg', '2017-11-04 16:39:00', 0, 1),
(34, 20, 'Parsley', 16.45, '/copy/parsley.jpg', '2017-11-04 16:40:00', 0, 0),
(35, 20, 'Nutmeg', 78.21, '/copy/nutmeg.jpg', '2017-11-04 16:41:00', 0, 0),
(36, 21, 'Rosemary', 78.06, '/copy/rosemary.jpg', '2017-11-04 16:39:31', 0, 0),
(37, 21, 'Cinnamon', 65.98, '/copy/cinnamon.jpg', '2017-11-04 16:40:00', 0, 0),
(38, 22, 'Cayenne pepper', 67.99, '/copy/cayenne.jpg', '2017-11-04 17:00:00', 0, 0),
(39, 22, 'Chilli Powder', 55.55, '/copy/cpowder.jpg', '2017-11-04 17:07:13', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Sessionid` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `UserType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Sessionid`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Password`, `Timestamp`, `UserType`) VALUES
(1, 'Abell', 'Wasike', 'abellwasike@gmail.com', 702676898, '$2y$10$OuF2rOUS1ag56E61Go.xv.At5KUN/mcEvxG5A0skicIZemkNqreS2', '2018-12-05 22:42:08', 'admin'),
(3, 'Leo', 'Messi', 'leomessi@gmail.com', 738272855, '$2y$10$zjwruNjPWK3K7.zEdsuN3.u0/nMvzpZZLalOZm22367MOeZcUMVZe', '2017-11-09 18:29:00', 'customer'),
(4, 'kawhi', 'leo', 'kawhileo@gmail.com', 702675898, '$2y$10$rqBc9FOV9REuOcmB5pNt8er/JbXp5gr7euYvDWkO6C3XnyIzPCbhq', NULL, 'agent'),
(5, 'Cyril', 'Odhiambo', 'cyril@gmail.com', 702675898, '$2y$10$OxOODQl.TVSxBMJrkcSk3OkozRzBSiBxShrl/jn.oirTSPiYoCgiy', NULL, 'user'),
(6, 'Alvin', 'Kamara', 'akamara@gmail.com', 701020304, '$2y$10$UD6A0TCFYoACaApgl2C8MeEybTQt2A26hOJaH17ryCdcOxS05f6.i', NULL, 'user'),
(7, 'Darius', 'Mutisya', 'dariusm@gmail.com', 701020304, '$2y$10$vZSODDrkw4KnhI9E1dz2OOm.FiKU5B/abNQv2q0YQqmAXnrIoW342', NULL, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Categoryid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Productid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Sessionid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Sessionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
