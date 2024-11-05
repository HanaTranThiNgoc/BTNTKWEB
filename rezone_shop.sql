-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 05, 2024 at 06:07 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rezone_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE IF NOT EXISTS `admin_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`id`, `name`, `email`, `password`) VALUES
(1, 'Admin 1', 'admin1@gmail.com', 'abc123'),
(2, 'Admin 2', 'admin2@gmail.com', 'abc123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_user_idfk` (`user_id`),
  KEY `cart_product_idfk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`) VALUES
(1, 4, 8),
(2, 4, 22),
(3, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `img_library`
--

DROP TABLE IF EXISTS `img_library`;
CREATE TABLE IF NOT EXISTS `img_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `img_library_idfk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `img_library`
--

INSERT INTO `img_library` (`id`, `img`, `product_id`) VALUES
(1, 'Dior_Dress with belt_1.JPG', 6),
(2, 'Dior_Dress with belt_2.JPG', 6),
(3, 'Dior_Asymmetrical long skirt_1.JPG', 7),
(4, 'Dior_Asymmetrical long skirt_2.JPG', 7),
(5, 'Dior_Macrocannage panel pea coat_1.JPG', 8),
(6, 'Dior_Macrocannage panel pea coat_2.JPG', 8),
(7, 'Dior_Jogging pants_1.JPG', 9),
(8, 'Dior_Jogging pants_2.JPG', 9),
(9, 'Dior_CD 1947 Short-sleeved jumper_1.JPG', 10),
(10, 'Dior_CD 1947 Short-sleeved jumper_2.JPG', 10),
(11, 'burberry_Horseferry Print Check Cotton Shirt.JPG', 11),
(12, 'burberry_Horseferry Print Check Cotton Shirt_2.JPG', 11),
(13, 'burberry_Monogram Motif Silk Oversized Shirt.JPG', 12),
(14, 'burberry_Monogram Motif Silk Oversized Shirt_2.JPG', 12),
(15, 'burberry_Slim Fit Wool Mohair Suit.JPG', 14),
(16, 'burberry_Slim Fit Wool Mohair Suit_2.JPG', 14),
(17, 'B-Intarsia-knit cardigan-model.jpg', 21),
(18, 'B-Intarsia-knit cardigan-zoom.jpg', 21),
(19, 'B-Intarsia-knit cardigan.jpg', 21),
(20, 'B-Oversized embroidered shell track jacket-model.jpg', 22),
(21, 'B-Oversized embroidered shell track jacket-zoom.jpg', 22),
(22, 'B-Oversized embroidered shell track jacket.jpg', 22),
(23, 'B-Swing Twisted oversized cotton-blend poplin shirt-model.jpg', 23),
(24, 'B-Swing Twisted oversized cotton-blend poplin shirt-zoom.jpg', 23),
(25, 'B-Swing Twisted oversized cotton-blend poplin shirt.jpg', 23),
(26, 'B-Printed high-rise straight-leg jeans-model.jpg', 24),
(27, 'B-Printed high-rise straight-leg jeans-zoom.jpg', 24),
(28, 'B-Printed high-rise straight-leg jeans.jpg', 24),
(29, 'B-Oversized asymmetric striped cotton shirt-model.jpg', 25),
(30, 'B-Oversized asymmetric striped cotton shirt-zoom.jpg', 25),
(31, 'B-Oversized asymmetric striped cotton shirt.jpg', 25);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_product_idfk` (`cart_id`),
  KEY `order_items_user_idfk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `cart_id`, `user_id`) VALUES
(1, 1, 4),
(2, 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `season` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `price`, `date_added`, `img`, `color`, `sex`, `category_name`, `brand`, `season`, `size`) VALUES
(1, 'D-Ring Turtleneck Sweater', 2220, '2022-10-28', 'LouisVuitton_D_Ring.png', 'Milk White', 'Female', 'Tops', 'Louis Vuitton', 'Winter', 'XL'),
(2, 'Double Face Monogram A-Line Mini', 1940, '2022-02-24', 'LouisVuitton_Double_Face.png', 'Pastel Yellow', 'Female', 'Bottoms', 'Louis Vuitton', 'Spring', 'S'),
(3, 'LV VUITTON Sporty Skirt', 1040, '2022-01-17', 'LouisVuitton_LVVUITTON_Sporty.png', 'Optical White', 'Female', 'Sporty', 'Louis Vuitton', 'Spring', 'M'),
(4, 'Classic Shirt', 2080, '2022-11-18', 'LouisVuitton_Classic.png', 'White', 'Male', 'Tops', 'Louis Vuitton', 'Winter', 'L'),
(5, 'Damier Spread Short-Sleeved Hook Detail Shirt', 1040, '2022-08-22', 'LouisVuitton_Damier.png', 'Blue Shadow', 'Male', 'Tops', 'Louis Vuitton', 'Fall', 'S'),
(6, 'Dress with belt', 2200, '2022-08-03', 'Dior_Dress with belt_1.JPG', 'Beige', 'Female', 'Dresses', 'Dior', 'Fall', 'XL'),
(7, 'Asymmetrical long skirt', 3000, '2022-09-09', 'Dior_Asymmetrical long skirt_1.JPG', 'Beige', 'Female', 'Bottoms', 'Dior', 'Fall', 'L'),
(8, 'Macrocannage panel pea coat', 2900, '2022-10-12', 'Dior_Macrocannage panel pea coat_1.JPG', 'Black and white', 'Female', 'Tops', 'Dior', 'Winter', 'S'),
(9, 'Jogging pants', 850, '2022-11-20', 'Dior_Jogging pants_1.JPG', 'Black', 'Male', 'Bottoms', 'Dior', 'Winter', 'M'),
(10, 'CD 1947 Short-sleeved jumper', 900, '2022-02-01', 'Dior_CD 1947 Short-sleeved jumper_1.JPG', 'Gray', 'Male', 'Tops', 'Dior', 'Spring', 'XL'),
(11, 'Horseferry Print Check Cotton Shirt', 1490, '2022-10-01', 'burberry_Horseferry Print Check Cotton Shirt.JPG', 'Archive Beige', 'Female', 'Tops', 'Burberry', 'Fall', 'S'),
(12, 'Monogram Motif Silk Oversized Shirt', 1850, '2022-09-23', 'burberry_Monogram Motif Silk Oversized Shirt.JPG', 'Black', 'Female', 'Tops', 'Burberry', 'Fall', 'XL'),
(13, 'Long-sleeve Icon Stripe Collar Cotton Polo Shirt', 860, '2022-11-20', 'burberry_Long-sleeve Icon Stripe Collar Cotton Polo Shirt.JPG', 'Black', 'Male', 'Tops', 'Burberry', 'Winter', 'S'),
(14, 'Slim Fit Wool Mohair Suit', 3150, '2022-04-19', 'burberry_Slim Fit Wool Mohair Suit.JPG', 'Black', 'Male', 'Suits', 'Burberry', 'Summer', 'M'),
(15, 'Sleeveless Silk Satin Gown', 7500, '2022-05-30', 'burberry_Sleeveless Silk Satin Gown.JPG', 'Black', 'Female', 'Dresses', 'Burberry', 'Summer', 'M'),
(16, 'Short tulle dress with graffiti logo print', 2395, '2022-09-25', 'DG_shorttutle.jpg', 'Multicolor', 'Female', 'Dresses', 'DOLCE & GABBANA', 'Fall', 'S'),
(17, 'Jersey calf-length dress with zipper', 2770, '2022-08-12', 'DG_jersey.jpg', 'Black', 'Female', 'Dresses', 'DOLCE & GABBANA', 'Summer', 'XL'),
(18, '\"Ciao, Kim\" Ice cream-print T-shirt', 220, '2022-07-10', 'DG_Ciao, Kim.jpg', 'White', 'Male', 'Tops', 'DOLCE & GABBANA', 'Summer', 'M'),
(19, 'Sleeveless short woolen dress', 2065, '2022-06-01', 'DG_Sleeveless.jpg', 'Pink', 'Female', 'Dresses', 'DOLCE & GABBANA', 'Summer', 'L'),
(20, 'Bouclé hoodie with DG patch', 1495, '2022-11-01', 'DG_Boucle hoodie.jpg', 'Black', 'Male', 'Tops', 'DOLCE & GABBANA', 'Winter', 'L'),
(21, 'Intarsia-knit cardigan', 2300, '2022-10-02', 'B-Intarsia-knit cardigan.jpg', 'Grey', 'Female', 'Tops', 'Balenciaga', 'Winter', 'M'),
(22, 'Oversized embroidered shell track jacket', 2850, '2022-11-28', 'B-Oversized embroidered shell track jacket.jpg', 'Black', 'Male', 'Tops', 'Balenciaga', 'Winter', 'L'),
(23, 'Swing Twisted oversized cotton-blend poplin shirt', 1550, '2022-05-05', 'B-Swing Twisted oversized cotton-blend poplin shirt.jpg', 'Blue', 'Female', 'Tops', 'Balenciaga', 'Summer', 'L'),
(24, 'Printed high-rise straight-leg jeans', 1250, '2022-01-08', 'B-Printed high-rise straight-leg jeans.jpg', 'Dark blue', 'Female', 'Bottoms', 'Balenciaga', 'Spring', 'S'),
(25, 'Oversized asymmetric striped cotton shirt', 1450, '2022-06-26', 'B-Oversized asymmetric striped cotton shirt.jpg', 'Liac blue', 'Female', 'Tops', 'Balenciaga', 'Summer', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_numb` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `user_name`, `email`, `password`, `phone_numb`, `address`) VALUES
(1, 'User 1', 'user1@gmail.com', '123456', '0123456789', 'Vietnam'),
(2, 'hana', '2902@gmail.com', 'hana', '0999999999', 'gdgd'),
(3, 'hana', 'hana@gmail.com', 'hana', '0333333333', 'hfhgdf'),
(4, 'hana', 'ttnhngochan29@gmail.com', 'hana', '0999999999', 'haha'),
(5, 'hana', 'tranthingochan292002@gmail.com', 'sa', '0999999999', 'dsds');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `img_library`
--
ALTER TABLE `img_library`
  ADD CONSTRAINT `img_library_idfk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
