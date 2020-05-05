-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for mobile_sale
CREATE DATABASE IF NOT EXISTS `mobile_sale` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mobile_sale`;

-- Dumping structure for table mobile_sale.chi_tiet_hoa_don
CREATE TABLE IF NOT EXISTS `chi_tiet_hoa_don` (
  `id_chi_tiet_hoa_don` int NOT NULL AUTO_INCREMENT,
  `gia_san_pham` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `id_hoa_don` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  PRIMARY KEY (`id_chi_tiet_hoa_don`),
  UNIQUE KEY `UKd2mkbcv90fpcpq94jdfk9bxdg` (`id_san_pham`,`id_hoa_don`),
  KEY `FK31sf8k3yqnfleh44ma6i914rj` (`id_hoa_don`),
  CONSTRAINT `FK31sf8k3yqnfleh44ma6i914rj` FOREIGN KEY (`id_hoa_don`) REFERENCES `hoa_don` (`id_hoa_don`),
  CONSTRAINT `FKe4kcvug12v0ntmb6q7x06w6v1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.chi_tiet_hoa_don: ~12 rows (approximately)
/*!40000 ALTER TABLE `chi_tiet_hoa_don` DISABLE KEYS */;
INSERT INTO `chi_tiet_hoa_don` (`id_chi_tiet_hoa_don`, `gia_san_pham`, `so_luong`, `id_hoa_don`, `id_san_pham`) VALUES
	(11, 2290000, 2, 11, 11),
	(13, 22990000, 2, 12, 30),
	(14, 33990000, 1, 13, 17),
	(15, 14500000, 1, 14, 92),
	(16, 11990000, 1, 15, 76),
	(17, 30990000, 1, 16, 29),
	(18, 30990000, 1, 17, 49),
	(19, 11990000, 1, 18, 50),
	(20, 17000000, 1, 18, 52),
	(21, 23000000, 3, 19, 60),
	(22, 2290000, 2, 22, 11),
	(23, 30990000, 1, 23, 49);
/*!40000 ALTER TABLE `chi_tiet_hoa_don` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.chi_tiet_phieu_nhap
CREATE TABLE IF NOT EXISTS `chi_tiet_phieu_nhap` (
  `gia_san_pham` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `id_san_pham` int NOT NULL,
  `id_phieu_nhap` int NOT NULL,
  PRIMARY KEY (`id_san_pham`,`id_phieu_nhap`),
  KEY `FK4ch9gntospo9etytfiil0kf4s` (`id_phieu_nhap`),
  CONSTRAINT `FK4ch9gntospo9etytfiil0kf4s` FOREIGN KEY (`id_phieu_nhap`) REFERENCES `phieu_nhap` (`id_phieu_nhap`),
  CONSTRAINT `FKbstfbrsp7du0eqywh4k6ne51d` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.chi_tiet_phieu_nhap: ~0 rows (approximately)
/*!40000 ALTER TABLE `chi_tiet_phieu_nhap` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhap` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.chi_tiet_san_pham
CREATE TABLE IF NOT EXISTS `chi_tiet_san_pham` (
  `id_chi_tiet_san_pham` int NOT NULL AUTO_INCREMENT,
  `gia_cu` int DEFAULT NULL,
  `gia_hien_tai` int DEFAULT NULL,
  `image` varchar(155) DEFAULT NULL,
  `mau_sac` varchar(10) DEFAULT NULL,
  `version` varchar(55) DEFAULT NULL,
  `id_khuyen_mai` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  PRIMARY KEY (`id_chi_tiet_san_pham`),
  KEY `FKq2877t55thubstdrd7ujr7hxi` (`id_khuyen_mai`),
  KEY `FKhry1oewlwwhwhuqhr1tinw6l6` (`id_san_pham`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.chi_tiet_san_pham: 110 rows
/*!40000 ALTER TABLE `chi_tiet_san_pham` DISABLE KEYS */;
INSERT INTO `chi_tiet_san_pham` (`id_chi_tiet_san_pham`, `gia_cu`, `gia_hien_tai`, `image`, `mau_sac`, `version`, `id_khuyen_mai`, `id_san_pham`) VALUES
	(1, 100000000, 20000000, NULL, 'BLACK', '1GB/64GB', NULL, 1),
	(2, 200000000, 40000000, NULL, 'BLACK', '2GB/64GB', NULL, 1),
	(3, 300000000, 60000000, NULL, 'BLACK', '3GB/64GB', NULL, 1),
	(4, 400000000, 80000000, NULL, 'BLACK', '4GB/64GB', NULL, 1),
	(5, 500000000, 100000000, NULL, 'BLACK', '5GB/64GB', NULL, 1),
	(6, 100000000, 20000000, NULL, 'BLACK', '1GB/64GB', NULL, 1),
	(7, 200000000, 40000000, NULL, 'BLACK', '2GB/64GB', NULL, 1),
	(8, 300000000, 60000000, NULL, 'BLACK', '3GB/64GB', NULL, 1),
	(9, 400000000, 80000000, NULL, 'BLACK', '4GB/64GB', NULL, 1),
	(10, 500000000, 100000000, NULL, 'BLACK', '5GB/64GB', NULL, 1),
	(11, -1, 2290000, NULL, 'BLACK', NULL, NULL, NULL),
	(12, -1, 22990000, NULL, 'BLACK', NULL, NULL, NULL),
	(13, -1, 36000000, NULL, 'BLACK', NULL, NULL, NULL),
	(14, 19890000, 21990000, NULL, NULL, NULL, NULL, NULL),
	(15, 20490000, 21990000, NULL, NULL, NULL, NULL, NULL),
	(16, 17200000, 19990000, NULL, NULL, NULL, NULL, NULL),
	(17, 29990000, 33990000, NULL, NULL, NULL, NULL, NULL),
	(18, -1, 31990000, NULL, NULL, NULL, NULL, NULL),
	(19, 7350000, 7990000, NULL, NULL, NULL, NULL, NULL),
	(20, -1, 24990000, NULL, NULL, NULL, NULL, NULL),
	(21, 13890000, 15500000, NULL, NULL, NULL, NULL, NULL),
	(22, 9850000, 10490000, NULL, NULL, NULL, NULL, NULL),
	(23, 13050000, 13990000, NULL, NULL, NULL, NULL, NULL),
	(24, 22990000, 26000000, NULL, NULL, NULL, NULL, NULL),
	(25, 25000000, 26990000, NULL, NULL, NULL, NULL, NULL),
	(26, -1, 3790000, NULL, NULL, NULL, NULL, NULL),
	(27, 21300000, 22990000, NULL, NULL, NULL, NULL, NULL),
	(28, 4300000, 4990000, NULL, NULL, NULL, NULL, NULL),
	(29, 27790000, 30990000, NULL, NULL, NULL, NULL, NULL),
	(30, 9990000, 11990000, NULL, NULL, NULL, NULL, NULL),
	(31, -1, 2290000, NULL, NULL, NULL, NULL, NULL),
	(32, -1, 22990000, NULL, NULL, NULL, NULL, NULL),
	(33, -1, 36000000, NULL, NULL, NULL, NULL, NULL),
	(34, 19890000, 21990000, NULL, NULL, NULL, NULL, NULL),
	(35, 20490000, 21990000, NULL, NULL, NULL, NULL, NULL),
	(36, 17200000, 19990000, NULL, NULL, NULL, NULL, NULL),
	(37, 29990000, 33990000, NULL, NULL, NULL, NULL, NULL),
	(38, -1, 31990000, NULL, NULL, NULL, NULL, NULL),
	(39, 7350000, 7990000, NULL, NULL, NULL, NULL, NULL),
	(40, -1, 24990000, NULL, NULL, NULL, NULL, NULL),
	(41, 9850000, 10490000, NULL, NULL, NULL, NULL, NULL),
	(42, 13050000, 13990000, NULL, NULL, NULL, NULL, NULL),
	(43, 13890000, 15500000, NULL, NULL, NULL, NULL, NULL),
	(44, 22990000, 26000000, NULL, NULL, NULL, NULL, NULL),
	(45, 25000000, 26990000, NULL, NULL, NULL, NULL, NULL),
	(46, -1, 3790000, NULL, NULL, NULL, NULL, NULL),
	(47, 21300000, 22990000, NULL, NULL, NULL, NULL, NULL),
	(48, 4300000, 4990000, NULL, NULL, NULL, NULL, NULL),
	(49, 27790000, 30990000, NULL, NULL, NULL, NULL, NULL),
	(50, 9990000, 11990000, NULL, NULL, NULL, NULL, NULL),
	(51, 16500000, 28990000, NULL, NULL, NULL, NULL, NULL),
	(52, 16190000, 17000000, NULL, NULL, NULL, NULL, NULL),
	(53, -1, 21990000, NULL, NULL, NULL, NULL, NULL),
	(54, 4590000, 4990000, NULL, NULL, NULL, NULL, NULL),
	(55, 2850000, 3690000, NULL, NULL, NULL, NULL, NULL),
	(56, 22590000, 23990000, NULL, NULL, NULL, NULL, NULL),
	(57, 12990000, 22990000, NULL, NULL, NULL, NULL, NULL),
	(58, -1, 1990000, NULL, NULL, NULL, NULL, NULL),
	(59, 17590000, 19900000, NULL, NULL, NULL, NULL, NULL),
	(60, 20290000, 23000000, NULL, NULL, NULL, NULL, NULL),
	(61, -1, 3490000, NULL, NULL, NULL, NULL, NULL),
	(62, 7899000, 8990000, NULL, NULL, NULL, NULL, NULL),
	(63, 3550000, 4390000, NULL, NULL, NULL, NULL, NULL),
	(64, 35290000, 37990000, NULL, NULL, NULL, NULL, NULL),
	(65, 4990000, 5990000, NULL, NULL, NULL, NULL, NULL),
	(66, 4790000, 6190000, NULL, NULL, NULL, NULL, NULL),
	(67, 8000000, 9290000, NULL, NULL, NULL, NULL, NULL),
	(68, 4190000, 4490000, NULL, NULL, NULL, NULL, NULL),
	(69, 11190000, 14990000, NULL, NULL, NULL, NULL, NULL),
	(70, 3490000, 3990000, NULL, NULL, NULL, NULL, NULL),
	(71, -1, 990000, NULL, NULL, NULL, NULL, NULL),
	(72, -1, 1390000, NULL, NULL, NULL, NULL, NULL),
	(73, 7790000, 7990000, NULL, NULL, NULL, NULL, NULL),
	(74, 16390000, 18000000, NULL, NULL, NULL, NULL, NULL),
	(75, -1, 50000000, NULL, NULL, NULL, NULL, NULL),
	(76, 8200000, 11990000, NULL, NULL, NULL, NULL, NULL),
	(77, 7790000, 8500000, NULL, NULL, NULL, NULL, NULL),
	(78, 4800000, 6990000, NULL, NULL, NULL, NULL, NULL),
	(79, 5790000, 5990000, NULL, NULL, NULL, NULL, NULL),
	(80, 2990000, 3790000, NULL, NULL, NULL, NULL, NULL),
	(81, 7250000, 7990000, NULL, NULL, NULL, NULL, NULL),
	(82, 3290000, 3990000, NULL, NULL, NULL, NULL, NULL),
	(83, 5990000, 6990000, NULL, NULL, NULL, NULL, NULL),
	(84, 5150000, 6290000, NULL, NULL, NULL, NULL, NULL),
	(85, 19390000, 20990000, NULL, NULL, NULL, NULL, NULL),
	(86, 3790000, 3990000, NULL, NULL, NULL, NULL, NULL),
	(87, 3590000, 5290000, NULL, NULL, NULL, NULL, NULL),
	(88, 5890000, 6690000, NULL, NULL, NULL, NULL, NULL),
	(89, 32590000, 34990000, NULL, NULL, NULL, NULL, NULL),
	(90, 24290000, 25990000, NULL, NULL, NULL, NULL, NULL),
	(91, 12500000, 14500000, NULL, NULL, NULL, NULL, NULL),
	(92, 13500000, 14500000, NULL, NULL, NULL, NULL, NULL),
	(93, 3100000, 4290000, NULL, NULL, NULL, NULL, NULL),
	(94, 2290000, 2590000, NULL, NULL, NULL, NULL, NULL),
	(95, 3990000, 4290000, NULL, NULL, NULL, NULL, NULL),
	(96, 27500000, 30000000, NULL, NULL, NULL, NULL, NULL),
	(97, 1990000, 2490000, NULL, NULL, NULL, NULL, NULL),
	(98, 0, 0, NULL, NULL, NULL, NULL, NULL),
	(99, 3150000, 3290000, NULL, NULL, NULL, NULL, NULL),
	(100, 11490000, 14990000, NULL, NULL, NULL, NULL, NULL),
	(101, 3790000, 4990000, NULL, NULL, NULL, NULL, NULL),
	(102, 38990000, 43990000, NULL, NULL, NULL, NULL, NULL),
	(103, 5990000, 9190000, NULL, NULL, NULL, NULL, NULL),
	(104, -1, 3690000, NULL, NULL, NULL, NULL, NULL),
	(105, 4990000, 7490000, NULL, NULL, NULL, NULL, NULL),
	(106, 0, 0, NULL, NULL, NULL, NULL, NULL),
	(107, 6490000, 7000000, NULL, NULL, NULL, NULL, NULL),
	(108, 6990000, 7990000, NULL, NULL, NULL, NULL, NULL),
	(109, 1490000, 2490000, NULL, NULL, NULL, NULL, NULL),
	(110, 27500000, 31000000, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `chi_tiet_san_pham` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.danh_gia
CREATE TABLE IF NOT EXISTS `danh_gia` (
  `id_danh_gia` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(155) DEFAULT NULL,
  `vote` tinyint DEFAULT NULL,
  `id_khach_hang` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  PRIMARY KEY (`id_danh_gia`),
  KEY `FK68jrfrkfa5ygoyaaa01cdvgre` (`id_khach_hang`),
  KEY `FKkwxf9squw667fr5ep11khljuk` (`id_san_pham`),
  CONSTRAINT `FK68jrfrkfa5ygoyaaa01cdvgre` FOREIGN KEY (`id_khach_hang`) REFERENCES `khach_hang` (`id_khach_hang`),
  CONSTRAINT `FKkwxf9squw667fr5ep11khljuk` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.danh_gia: ~120 rows (approximately)
/*!40000 ALTER TABLE `danh_gia` DISABLE KEYS */;
INSERT INTO `danh_gia` (`id_danh_gia`, `comment`, `vote`, `id_khach_hang`, `id_san_pham`) VALUES
	(1, 'Sản phẩm tốt', 5, 16, 11),
	(2, 'Sản phẩm tốt', 5, 16, 11),
	(3, 'Sản phẩm tốt', 5, 16, 11),
	(4, 'Sản phẩm tốt', 4, 16, 11),
	(5, 'Sản phẩm tốt', 4, 16, 11),
	(6, 'Sản phẩm tốt', 5, 16, 11),
	(7, 'Sản phẩm tốt', 4, 16, 11),
	(8, 'Sản phẩm tốt', 3, 16, 11),
	(9, 'Sản phẩm tốt', 3, 16, 135),
	(10, 'Sản phẩm tốt', 4, 16, 88),
	(11, 'Sản phẩm tốt', 5, 16, 113),
	(13, 'Sản phẩm tốt', 4, 16, 148),
	(14, 'Sản phẩm tốt', 3, 16, 114),
	(15, 'Sản phẩm tốt', 3, 16, 134),
	(19, 'Sản phẩm tốt', 3, 16, 145),
	(20, 'Sản phẩm tốt', 5, 16, 54),
	(21, 'Sản phẩm tốt', 4, 16, 68),
	(22, 'Sản phẩm tốt', 5, 16, 109),
	(23, 'Sản phẩm tốt', 5, 16, 70),
	(25, 'Sản phẩm tốt', 3, 16, 76),
	(26, 'Sản phẩm tốt', 4, 16, 130),
	(29, 'Sản phẩm tốt', 5, 16, 29),
	(30, 'Sản phẩm tốt', 5, 16, 111),
	(31, 'Sản phẩm tốt', 5, 16, 95),
	(32, 'Sản phẩm tốt', 4, 16, 122),
	(33, 'Sản phẩm tốt', 4, 16, 70),
	(34, 'Sản phẩm tốt', 5, 16, 53),
	(36, 'Sản phẩm tốt', 3, 16, 134),
	(39, 'Sản phẩm tốt', 5, 16, 52),
	(40, 'Sản phẩm tốt', 4, 16, 134),
	(42, 'Sản phẩm tốt', 3, 16, 35),
	(44, 'Sản phẩm tốt', 3, 16, 99),
	(45, 'Sản phẩm tốt', 3, 16, 126),
	(46, 'Sản phẩm tốt', 4, 16, 115),
	(48, 'Sản phẩm tốt', 4, 16, 60),
	(50, 'Sản phẩm tốt', 5, 16, 62),
	(51, 'Sản phẩm tốt', 5, 16, 91),
	(52, 'Sản phẩm tốt', 4, 16, 122),
	(53, 'Sản phẩm tốt', 4, 16, 97),
	(54, 'Sản phẩm tốt', 5, 16, 50),
	(55, 'Sản phẩm tốt', 3, 16, 92),
	(56, 'Sản phẩm tốt', 3, 16, 68),
	(57, 'Sản phẩm tốt', 4, 16, 117),
	(59, 'Sản phẩm tốt', 4, 16, 103),
	(61, 'Sản phẩm tốt', 4, 16, 72),
	(64, 'Sản phẩm tốt', 3, 16, 73),
	(65, 'Sản phẩm tốt', 4, 16, 112),
	(66, 'Sản phẩm tốt', 5, 16, 86),
	(67, 'Sản phẩm tốt', 3, 16, 107),
	(69, 'Sản phẩm tốt', 4, 16, 122),
	(71, 'Sản phẩm tốt', 4, 16, 107),
	(72, 'Sản phẩm tốt', 4, 16, 60),
	(76, 'Sản phẩm tốt', 4, 16, 148),
	(78, 'Sản phẩm tốt', 5, 4, 100),
	(79, 'Sản phẩm tốt', 4, 6, 94),
	(83, 'Sản phẩm tốt', 4, 11, 96),
	(84, 'Sản phẩm tốt', 4, 3, 130),
	(85, 'Sản phẩm tốt', 5, 15, 94),
	(86, 'Sản phẩm tốt', 4, 5, 135),
	(89, 'Sản phẩm tốt', 5, 12, 119),
	(90, 'Sản phẩm tốt', 5, 7, 64),
	(92, 'Sản phẩm tốt', 4, 3, 135),
	(94, 'Sản phẩm tốt', 4, 7, 126),
	(96, 'Sản phẩm tốt', 4, 7, 145),
	(97, 'Sản phẩm tốt', 4, 7, 119),
	(101, 'Sản phẩm tốt', 5, 6, 131),
	(102, 'Sản phẩm tốt', 4, 8, 76),
	(103, 'Sản phẩm tốt', 5, 4, 76),
	(105, 'Sản phẩm tốt', 4, 9, 29),
	(106, 'Sản phẩm tốt', 4, 13, 49),
	(108, 'Sản phẩm tốt', 5, 9, 148),
	(109, 'Sản phẩm tốt', 4, 5, 54),
	(110, 'Sản phẩm tốt', 5, 6, 24),
	(112, 'Sản phẩm tốt', 5, 10, 50),
	(113, 'Sản phẩm tốt', 5, 13, 122),
	(115, 'Sản phẩm tốt', 5, 7, 96),
	(117, 'Sản phẩm tốt', 5, 7, 90),
	(118, 'Sản phẩm tốt', 5, 4, 83),
	(119, 'Sản phẩm tốt', 5, 12, 26),
	(121, 'Sản phẩm tốt', 5, 3, 52),
	(122, 'Sản phẩm tốt', 4, 13, 82),
	(124, 'Sản phẩm tốt', 4, 3, 77),
	(127, 'Sản phẩm tốt', 5, 1, 88),
	(129, 'Sản phẩm tốt', 4, 12, 91),
	(130, 'Sản phẩm tốt', 5, 8, 81),
	(131, 'Sản phẩm tốt', 4, 2, 24),
	(132, 'Sản phẩm tốt', 4, 12, 68),
	(133, 'Sản phẩm tốt', 5, 6, 143),
	(134, 'Sản phẩm tốt', 5, 3, 11),
	(135, 'Sản phẩm tốt', 5, 1, 99),
	(137, 'Sản phẩm tốt', 5, 4, 109),
	(138, 'Sản phẩm tốt', 5, 2, 14),
	(142, 'Sản phẩm tốt', 4, 4, 134),
	(143, 'Sản phẩm tốt', 5, 9, 124),
	(144, 'Sản phẩm tốt', 4, 9, 86),
	(146, 'Sản phẩm tốt', 5, 4, 116),
	(147, 'Sản phẩm tốt', 5, 5, 130),
	(148, 'Sản phẩm tốt', 4, 11, 122),
	(149, 'Sản phẩm tốt', 5, 13, 80),
	(151, 'Sản phẩm tốt', 4, 6, 142),
	(155, 'Sản phẩm tốt', 4, 12, 140),
	(156, 'Sản phẩm tốt', 4, 13, 11),
	(157, 'Sản phẩm tốt', 5, 10, 43),
	(158, 'Sản phẩm tốt', 4, 8, 17),
	(159, 'Sản phẩm tốt', 4, 14, 35),
	(164, 'Sản phẩm tốt', 5, 5, 30),
	(166, 'Sản phẩm tốt', 5, 8, 120),
	(167, 'Sản phẩm tốt', 4, 12, 74),
	(171, 'Sản phẩm tốt', 5, 13, 104),
	(172, 'Sản phẩm tốt', 5, 3, 44),
	(173, 'Sản phẩm tốt', 5, 14, 87),
	(175, 'Sản phẩm tốt', 4, 9, 103),
	(177, 'Sản phẩm tốt', 5, 15, 37),
	(179, 'Sản phẩm tốt', 4, 12, 44),
	(180, 'Sản phẩm tốt', 4, 13, 96),
	(181, 'Sản phẩm tốt', 5, 9, 123),
	(183, 'Sản phẩm tốt', 4, 1, 138),
	(184, 'Sản phẩm tốt', 4, 11, 102),
	(187, 'Sản phẩm tốt', 5, 14, 111),
	(189, 'Sản phẩm tốt', 5, 5, 129),
	(191, 'Chán', 2, 17, 140),
	(192, 'Chất lượng tốt', 5, 17, 15),
	(193, 'Ok Được', 5, 17, 15),
	(194, 'Được', 5, 17, 15),
	(195, 'Tạm được', 4, 17, 28),
	(196, 'Tạm được', 4, 17, 28),
	(197, 'Tạm được', 4, 17, 28),
	(198, 'Tạm được', 4, 17, 28),
	(199, 'Tạm được', 4, 17, 28),
	(200, 'Tạm được', 4, 17, 28);
/*!40000 ALTER TABLE `danh_gia` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.hang
CREATE TABLE IF NOT EXISTS `hang` (
  `id_hang` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT '/image/hang/samsung.png',
  `name` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_hang`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.hang: ~14 rows (approximately)
/*!40000 ALTER TABLE `hang` DISABLE KEYS */;
INSERT INTO `hang` (`id_hang`, `image`, `name`) VALUES
	(1, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'Samsung'),
	(2, 'https://img.favpng.com/20/22/23/apple-logo-computer-icons-png-favpng-wbktiZSkBkzbdeyzUjybp9ke7.jpg', 'Apple'),
	(3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Xiaomi_logo.svg/1024px-Xiaomi_logo.svg.png', 'Xiaomi'),
	(4, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'Sony'),
	(5, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'HTC'),
	(6, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'Nokia'),
	(7, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'Lumia'),
	(8, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'BlackBerry'),
	(9, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'VSmart'),
	(10, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'BPhone'),
	(11, 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', 'Oppo'),
	(12, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Xiaomi_logo.svg/1024px-Xiaomi_logo.svg.png', 'RealMe'),
	(13, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Xiaomi_logo.svg/1024px-Xiaomi_logo.svg.png', 'asus'),
	(14, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Xiaomi_logo.svg/1024px-Xiaomi_logo.svg.png', 'huawei');
/*!40000 ALTER TABLE `hang` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table mobile_sale.hibernate_sequence: 1 rows
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(11);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.hoa_don
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `id_hoa_don` int NOT NULL AUTO_INCREMENT,
  `ngay_lap` datetime(6) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `id_khach_hang` int DEFAULT NULL,
  `id_nhan_vien` int DEFAULT NULL,
  PRIMARY KEY (`id_hoa_don`),
  KEY `FKrygimdf5nr1g2t6u03gvtr1te` (`id_khach_hang`),
  KEY `FKkuxkrkgq8yftm4d8d7o0w6nbv` (`id_nhan_vien`),
  CONSTRAINT `FKkuxkrkgq8yftm4d8d7o0w6nbv` FOREIGN KEY (`id_nhan_vien`) REFERENCES `nhan_vien` (`id_nhan_vien`),
  CONSTRAINT `FKrygimdf5nr1g2t6u03gvtr1te` FOREIGN KEY (`id_khach_hang`) REFERENCES `khach_hang` (`id_khach_hang`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.hoa_don: ~13 rows (approximately)
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` (`id_hoa_don`, `ngay_lap`, `status`, `id_khach_hang`, `id_nhan_vien`) VALUES
	(11, '2020-02-20 09:23:53.000000', 'HoanThanh', 11, NULL),
	(12, '2020-02-20 09:26:21.000000', 'HoanThanh', 11, NULL),
	(13, '2020-02-21 03:58:12.000000', 'HoanThanh', 11, NULL),
	(14, '2020-02-21 04:03:20.000000', 'DaHuy', 11, NULL),
	(15, '2020-04-15 08:46:52.000000', 'HoanThanh', 12, NULL),
	(16, '2020-02-25 08:48:36.000000', 'HoanThanh', 13, NULL),
	(17, '2020-02-26 07:40:55.000000', 'HoanThanh', 11, NULL),
	(18, '2020-03-26 07:41:11.000000', 'HoanThanh', 11, NULL),
	(19, '2020-02-26 07:42:57.000000', 'HoanThanh', 11, NULL),
	(20, '2020-02-28 21:29:36.000000', 'DangXacNhan', 15, NULL),
	(21, '2020-02-28 21:33:35.000000', 'DangXacNhan', 15, NULL),
	(22, '2020-04-14 17:02:31.000000', 'HoanThanh', 16, NULL),
	(23, '2020-04-16 21:19:46.000000', 'HoanThanh', 16, NULL);
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.hoi_dap
CREATE TABLE IF NOT EXISTS `hoi_dap` (
  `id_hoi_dap` int NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `noi_dung` varchar(512) DEFAULT NULL,
  `reply` varchar(512) DEFAULT NULL,
  `id_khach_hang` int DEFAULT NULL,
  `id_nhan_vien` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  PRIMARY KEY (`id_hoi_dap`),
  KEY `FKipc5osyq9xo4h97gwrby0iwdj` (`id_khach_hang`),
  KEY `FKl2yb8n5povgl70fbml2actkm8` (`id_nhan_vien`),
  KEY `FKq4ic92tbhupf6vytfm3inh84h` (`id_san_pham`),
  CONSTRAINT `FKipc5osyq9xo4h97gwrby0iwdj` FOREIGN KEY (`id_khach_hang`) REFERENCES `khach_hang` (`id_khach_hang`),
  CONSTRAINT `FKl2yb8n5povgl70fbml2actkm8` FOREIGN KEY (`id_nhan_vien`) REFERENCES `nhan_vien` (`id_nhan_vien`),
  CONSTRAINT `FKq4ic92tbhupf6vytfm3inh84h` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.hoi_dap: ~12 rows (approximately)
/*!40000 ALTER TABLE `hoi_dap` DISABLE KEYS */;
INSERT INTO `hoi_dap` (`id_hoi_dap`, `create_at`, `noi_dung`, `reply`, `id_khach_hang`, `id_nhan_vien`, `id_san_pham`) VALUES
	(1, '2020-02-26 02:44:39', 'Sản phẩm này còn không?', 'Còn nhé bạn', 11, 1, 11),
	(4, '2020-02-26 02:44:39', 'Sản phẩm này còn không?', 'hết rồi', 11, 1, 11),
	(5, '2020-02-26 06:12:39', 'Còn không bạn?', 'Chào bạn.\r\nSản phẩm còn hàng nhé', 11, 2, 11),
	(6, '2020-02-26 06:11:47', 'Dùng nhanh hư không?', 'Nhanh hư lắm bạn nhé', 14, 1, 11),
	(7, '2020-02-26 06:16:12', 'Sản phẩm này dùng có tốt khồng?', NULL, 11, NULL, 50),
	(9, '2020-02-26 06:22:17', 'Alooooooooo', 'ádsdfasdgádfasdf', 11, 1, 44),
	(10, '2020-02-26 07:41:27', 'còn không bạn?', NULL, 11, NULL, 29),
	(11, '2020-02-26 07:41:32', 'Alooo', NULL, 11, NULL, 29),
	(12, '2020-04-17 09:09:42', 'fdasdf', 'okkkkkkkkkkkkkkkkkkkkkkkkkkk', 11, 1, 49),
	(13, '2020-02-26 07:43:35', 'dfhsfth', NULL, 11, NULL, 11),
	(14, '2020-02-27 03:42:16', 'a lo  alkoafssdgh', 'dfhsrthhhhhhhhhhhhhhhhhhhh', 11, 1, 86),
	(15, '2020-04-17 07:57:16', 'Sản phẩm còn không bạn?', NULL, 14, NULL, 11),
	(16, '2020-05-05 08:28:21', 'Sản phẩm còn hàng không??\r\n', NULL, 17, NULL, 35),
	(17, '2020-05-05 08:53:52', 'Còn không shop?????????????????', NULL, 17, NULL, 140);
/*!40000 ALTER TABLE `hoi_dap` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.khach_hang
CREATE TABLE IF NOT EXISTS `khach_hang` (
  `id_khach_hang` int NOT NULL AUTO_INCREMENT,
  `address` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_khach_hang`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.khach_hang: ~16 rows (approximately)
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
INSERT INTO `khach_hang` (`id_khach_hang`, `address`, `email`, `name`, `phone`) VALUES
	(1, 'Viet Nam', NULL, 'Khach Hang 1', '098416132131'),
	(2, 'Viet Nam', NULL, 'Khach Hang 2', '098416132132'),
	(3, 'Viet Nam', NULL, 'Khach Hang 3', '098416132133'),
	(4, 'Viet Nam', NULL, 'Khach Hang 4', '098416132134'),
	(5, 'Viet Nam', NULL, 'Khach Hang 5', '098416132135'),
	(6, 'Viet Nam', NULL, 'Khach Hang 6', '098416132136'),
	(7, 'Viet Nam', NULL, 'Khach Hang 7', '098416132137'),
	(8, 'Viet Nam', NULL, 'Khach Hang 8', '098416132138'),
	(9, 'Viet Nam', NULL, 'Khach Hang 9', '098416132139'),
	(10, 'Viet Nam', NULL, 'Khach Hang 10', '0984161321310'),
	(11, 'asfasgadf', 'adhuy@nexcert.vn', 'Tran Quang Hoang', '03265464'),
	(12, 'Hà n?i', 'hoang@ghmailsdfs.com', 'Nguy?n V?n A', '03246497'),
	(13, 'Hà nội', 'asdashdjf@gmail.com', 'Nguyễn Thị B', '03265498'),
	(14, NULL, 'email@gmail.com', 'hoang', '032654656'),
	(15, 'Ha noi', 'hoang@gmaj.cm', 'Hoang', '0946784826'),
	(16, 'ha noi', 'kingplaxe9x@gmail.com', 'Tran Quang Hoang', '03246489849'),
	(17, NULL, 'huy123@gmail.com', 'Nguyễn Quang Huy', '03546857465');
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.khuyen_mai
CREATE TABLE IF NOT EXISTS `khuyen_mai` (
  `id_khuyen_mai` int NOT NULL AUTO_INCREMENT,
  `chi_tiet` varchar(255) DEFAULT NULL,
  `phan_tram` int DEFAULT NULL,
  PRIMARY KEY (`id_khuyen_mai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.khuyen_mai: ~10 rows (approximately)
/*!40000 ALTER TABLE `khuyen_mai` DISABLE KEYS */;
INSERT INTO `khuyen_mai` (`id_khuyen_mai`, `chi_tiet`, `phan_tram`) VALUES
	(1, 'Giam gia 10%', 10),
	(2, 'Giam gia 20%', 20),
	(3, 'Giam gia 30%', 30),
	(4, 'Giam gia 40%', 40),
	(5, 'Giam gia 50%', 50),
	(6, 'Giam gia 60%', 60),
	(7, 'Giam gia 70%', 70),
	(8, 'Giam gia 80%', 80),
	(9, 'Giam gia 90%', 90),
	(10, 'Giam gia 100%', 100);
/*!40000 ALTER TABLE `khuyen_mai` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.nhan_vien
CREATE TABLE IF NOT EXISTS `nhan_vien` (
  `id_nhan_vien` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(55) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `username` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_nhan_vien`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.nhan_vien: ~6 rows (approximately)
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
INSERT INTO `nhan_vien` (`id_nhan_vien`, `full_name`, `image`, `password`, `phone`, `role`, `status`, `username`) VALUES
	(1, 'Hoàng', 'https://source.unsplash.com/QAB-WJcbgJk/60x60', '$2a$10$L6auYTu7kVJrjX60RptjouJe0r/LF2cEF5zLsK.kBVDx0dYIDT.a6', '03264645', 'ALL', b'1', 'operator'),
	(2, 'Huy', 'https://logos-download.com/wp-content/uploads/2016/02/Samsung_logo-700x236.png', '$2a$10$uHgD5tAA3VsHpcST6TYE8.zIRN9J8pw1CIAbXcj.KQ0Za1GxCnz0O', '03265464', 'ADMIN', b'1', 'nguyenhuy'),
	(3, 'Nhân viên kho', 'https://source.unsplash.com/QAB-WJcbgJk/60x60', '$2a$10$MewAn.6diglVON7.E5VwFuP2sCrMLX.Ih5Xnqx/mRXVOijCJ.jEKq', '032464564', 'MANAGER', b'1', 'kho'),
	(14, '123451345', '123541345', '$2a$10$eJjDcGRc1Oy1/HJnp29SFOKoTFMwUtnKq9j0wo1/08NNLpxJO8vwC', '13245234', 'ORDER', b'0', '134512345'),
	(15, '1345234', '24153', '$2a$10$8jYIsRsnBs61JhlmRbpI.eWlhKq2Wytq7wd8vwwyX3SDw/gCDlfz.', '13451345', 'MANAGER', b'0', '13452435'),
	(16, 'Hoàng 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Xiaomi_logo.svg/1024px-Xiaomi_logo.svg.png', '$2a$10$4kMtC6vpmLH/.W0ObX6IGOSwV1Za1i6ZsTby/8DsxZc8ifc0.2ag6', '03254646', 'ORDER', b'1', 'hoang');
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.nha_cung_cap
CREATE TABLE IF NOT EXISTS `nha_cung_cap` (
  `id_nha_cung_cap` int NOT NULL AUTO_INCREMENT,
  `address` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_nha_cung_cap`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.nha_cung_cap: ~10 rows (approximately)
/*!40000 ALTER TABLE `nha_cung_cap` DISABLE KEYS */;
INSERT INTO `nha_cung_cap` (`id_nha_cung_cap`, `address`, `email`, `name`, `phone`) VALUES
	(1, 'Ha Noi', 'NCC1@email.com', 'NCC1', '0999999'),
	(2, 'Ha Noi', 'NCC2@email.com', 'NCC2', '0999999'),
	(3, 'Ha Noi', 'NCC3@email.com', 'NCC3', '0999999'),
	(4, 'Ha Noi', 'NCC4@email.com', 'NCC4', '0999999'),
	(5, 'Ha Noi', 'NCC5@email.com', 'NCC5', '0999999'),
	(6, 'Ha Noi', 'NCC6@email.com', 'NCC6', '0999999'),
	(7, 'Ha Noi', 'NCC7@email.com', 'NCC7', '0999999'),
	(8, 'Ha Noi', 'NCC8@email.com', 'NCC8', '0999999'),
	(9, 'Ha Noi', 'NCC9@email.com', 'NCC9', '0999999'),
	(10, 'Ha Noi', 'NCC10@email.com', 'NCC10', '0999999');
/*!40000 ALTER TABLE `nha_cung_cap` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.phieu_nhap
CREATE TABLE IF NOT EXISTS `phieu_nhap` (
  `id_phieu_nhap` int NOT NULL AUTO_INCREMENT,
  `ngay_lap` datetime(6) DEFAULT NULL,
  `id_nha_cung_cap` int DEFAULT NULL,
  `id_nhan_vien` int DEFAULT NULL,
  PRIMARY KEY (`id_phieu_nhap`),
  KEY `FKnsfcy8luy1j3ndfc2bggd5cjm` (`id_nha_cung_cap`),
  KEY `FK9ti1b1rl0ualylqr4ctqi85ap` (`id_nhan_vien`),
  CONSTRAINT `FK9ti1b1rl0ualylqr4ctqi85ap` FOREIGN KEY (`id_nhan_vien`) REFERENCES `nhan_vien` (`id_nhan_vien`),
  CONSTRAINT `FKnsfcy8luy1j3ndfc2bggd5cjm` FOREIGN KEY (`id_nha_cung_cap`) REFERENCES `nha_cung_cap` (`id_nha_cung_cap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.phieu_nhap: ~0 rows (approximately)
/*!40000 ALTER TABLE `phieu_nhap` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieu_nhap` ENABLE KEYS */;

-- Dumping structure for table mobile_sale.san_pham
CREATE TABLE IF NOT EXISTS `san_pham` (
  `id_san_pham` int NOT NULL AUTO_INCREMENT,
  `cpu` varchar(100) DEFAULT NULL,
  `bo_nho_trong` varchar(55) DEFAULT NULL,
  `camera` varchar(100) DEFAULT NULL,
  `cong_nghe_man_hinh` varchar(55) DEFAULT NULL,
  `cua_hang` int DEFAULT NULL,
  `descripsion` varchar(500) DEFAULT NULL,
  `do_phan_giai_man_hinh` varchar(55) DEFAULT NULL,
  `id_hang` int DEFAULT NULL,
  `image` varchar(155) DEFAULT NULL,
  `kich_thuoc_man_hinh` float DEFAULT NULL,
  `link` varchar(55) DEFAULT NULL,
  `man_hinh` varchar(100) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `sim` varchar(55) DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `view` int DEFAULT NULL,
  `id_nhan_vien` int DEFAULT NULL,
  PRIMARY KEY (`id_san_pham`),
  KEY `FKedkyygo5bcgl0q89wtql40bcg` (`id_nhan_vien`),
  KEY `FKtev3uxk5c5bhpm74iw36dwuck` (`id_hang`),
  CONSTRAINT `FKedkyygo5bcgl0q89wtql40bcg` FOREIGN KEY (`id_nhan_vien`) REFERENCES `nhan_vien` (`id_nhan_vien`),
  CONSTRAINT `FKtev3uxk5c5bhpm74iw36dwuck` FOREIGN KEY (`id_hang`) REFERENCES `hang` (`id_hang`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- Dumping data for table mobile_sale.san_pham: ~106 rows (approximately)
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` (`id_san_pham`, `cpu`, `bo_nho_trong`, `camera`, `cong_nghe_man_hinh`, `cua_hang`, `descripsion`, `do_phan_giai_man_hinh`, `id_hang`, `image`, `kich_thuoc_man_hinh`, `link`, `man_hinh`, `name`, `pin`, `price`, `sim`, `so_luong`, `type`, `updated_at`, `view`, `id_nhan_vien`) VALUES
	(11, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart-live-den.jpg', 5.5, NULL, NULL, 'VSmart Yoy3', 3000, 2090000, '2 sim', 86, 'DIENTHOAI', '2020-04-23 12:35:08.000000', 1537, 1),
	(14, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-midnight-green-select-2019_6.png', 5.5, NULL, NULL, 'iPhone 11 Chính hãng (VN/A)', 3000, 21990000, '2 sim', 43, NULL, '2020-04-23 12:35:08.000000', 7565, 1),
	(15, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 13, '_600x600__crop_600_asus_rog_phone2_min_1.jpg', 5.5, NULL, NULL, 'ASUS ROG Phone 2 512GB', 3000, 21990000, '2 sim', 60, NULL, '2020-04-23 12:35:08.000000', 3186, 1),
	(17, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-max-space-select-2019.png', 5.5, NULL, NULL, 'iPhone 11 Pro Max Chính hãng (VN/A)', 3000, 33990000, '2 sim', 69, NULL, '2020-04-23 12:35:08.000000', 3148, 1),
	(21, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '8-plus-3_1.jpg', 5.5, NULL, NULL, 'iPhone 8 Plus 64GB Chính hãng (mã VN/A)', 3000, 15500000, '2 sim', 66, NULL, '2020-04-23 12:35:08.000000', 6249, 1),
	(24, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_xs_max_64gb.jpg', 5.5, NULL, NULL, 'Apple iPhone XS Max 64GB Chính hãng (VN/A)', 3000, 26000000, '2 sim', 23, NULL, '2020-04-23 12:35:08.000000', 1800, 1),
	(26, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart-live-xanh_1.jpg', 5.5, NULL, NULL, 'Vsmart Live 6GB', 3000, 3790000, '2 sim', 18, NULL, '2020-04-23 12:35:08.000000', 257, 1),
	(28, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, '637060410960077373_xiaomi-redmi-note-8-xanh-1.png', 5.5, NULL, NULL, 'Xiaomi Redmi Note 8', 3000, 4990000, '2 sim', 21, NULL, '2020-04-23 12:35:08.000000', 5897, 1),
	(29, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-midnight-green-select-2019.png', 5.5, NULL, NULL, 'iPhone 11 Pro Chính hãng (VN/A)', 3000, 30990000, '2 sim', 48, NULL, '2020-04-23 12:35:08.000000', 8648, 1),
	(30, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '600_iphone_7_plus_silver_800x800_1_1.jpg', 5.5, NULL, NULL, 'Apple iPhone 7 Plus 32GB Chính hãng (Mã VN/A)', 3000, 11990000, '2 sim', 80, NULL, '2020-04-23 12:35:08.000000', 5585, 1),
	(34, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone11-purple-select-2019.png', 5.5, NULL, NULL, 'iPhone 11 Chính hãng (VN/A)', 3000, 21990000, '2 sim', 57, NULL, '2020-04-23 12:35:08.000000', 1986, 1),
	(35, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 13, '_600x600__crop_600_asus_rog_phone2_min_1.jpg', 5.5, NULL, NULL, 'ASUS ROG Phone 2 512GB', 3000, 21990000, '2 sim', 43, NULL, '2020-04-23 12:35:08.000000', 3206, 1),
	(37, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-max-space-select-2019.png', 5.5, NULL, NULL, 'iPhone 11 Pro Max Chính hãng (VN/A)', 3000, 33990000, '2 sim', 44, NULL, '2020-04-23 12:35:08.000000', 9906, 1),
	(43, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '8-plus-3_1.jpg', 5.5, NULL, NULL, 'iPhone 8 Plus 64GB Chính hãng (mã VN/A)', 3000, 15500000, '2 sim', 92, NULL, '2020-04-23 12:35:08.000000', 14, 1),
	(44, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_xs_max_64gb.jpg', 5.5, NULL, NULL, 'Apple iPhone XS Max 64GB Chính hãng (VN/A)', 3000, 26000000, '2 sim', 26, NULL, '2020-04-23 12:35:08.000000', 349, 1),
	(46, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart-live-xanh_1.jpg', 5.5, NULL, NULL, 'Vsmart Live 6GB', 3000, 3790000, '2 sim', 55, NULL, '2020-04-23 12:35:08.000000', 1703, 1),
	(48, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, '637060410960077373_xiaomi-redmi-note-8-xanh-1.png', 5.5, NULL, NULL, 'Xiaomi Redmi Note 8', 3000, 4990000, '2 sim', 96, NULL, '2020-04-23 12:35:08.000000', 7470, 1),
	(49, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-midnight-green-select-2019.png', 5.5, NULL, NULL, 'iPhone 11 Pro Chính hãng (VN/A)', 3000, 30990000, '2 sim', 17, NULL, '2020-04-23 12:35:08.000000', 2240, 1),
	(50, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '600_iphone_7_plus_silver_800x800_1_1.jpg', 5.5, NULL, NULL, 'Apple iPhone 7 Plus 32GB Chính hãng (Mã VN/A)', 3000, 11990000, '2 sim', 97, NULL, '2020-04-23 12:35:08.000000', 8791, 1),
	(52, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_xr_64gb.png', 5.5, NULL, NULL, 'Apple iPhone XR 64GB Chính hãng (VN/A)', 3000, 17000000, '2 sim', 35, NULL, '2020-04-23 12:35:08.000000', 7235, 1),
	(53, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 14, 'mate30__0002_layer_8.jpg', 5.5, NULL, NULL, 'Huawei Mate 30 Pro', 3000, 21990000, '2 sim', 82, NULL, '2020-04-23 12:35:08.000000', 9802, 1),
	(54, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart-active-3-6gb-ram-1_6_2.jpg', 5.5, NULL, NULL, 'Vsmart Active 3 6GB Ram', 3000, 4990000, '2 sim', 4, NULL, '2020-04-23 12:35:08.000000', 7304, 1),
	(56, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone11-green-select-2019_2.png', 5.5, NULL, NULL, 'iPhone 11 128GB Chính hãng (VN/A)', 3000, 23990000, '2 sim', 75, NULL, '2020-04-23 12:35:08.000000', 7116, 1),
	(58, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart_joy2__viridian_blue_thumbnail_2500x2500_1.jpg', 5.5, NULL, NULL, 'Vsmart Joy 2 Plus 2GB', 3000, 1990000, '2 sim', 61, NULL, '2020-04-23 12:35:08.000000', 3666, 1),
	(59, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_x_64gb.jpg', 5.5, NULL, NULL, 'iPhone X 64GB chính hãng (mã VN/A)', 3000, 19900000, '2 sim', 82, NULL, '2020-04-23 12:35:08.000000', 6982, 1),
	(60, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_xs_64gb.jpg', 5.5, NULL, NULL, 'Apple iPhone XS 64GB Chính hãng (VN/A)', 3000, 23000000, '2 sim', 28, NULL, '2020-04-23 12:35:08.000000', 3914, 1),
	(61, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart-live-den.jpg', 5.5, NULL, NULL, 'Vsmart Live', 3000, 3490000, '2 sim', 91, NULL, '2020-04-23 12:35:08.000000', 8624, 1),
	(62, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '7jet.jpg', 5.5, NULL, NULL, 'Apple iPhone 7 32GB Chính hãng (mã VN/A)', 3000, 8990000, '2 sim', 72, NULL, '2020-04-23 12:35:08.000000', 1376, 1),
	(64, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-max-midnight-green-select-2019_1.png', 5.5, NULL, NULL, 'iPhone 11 Pro Max 256GB Chính hãng (VN/A)', 3000, 37990000, '2 sim', 89, NULL, '2020-04-23 12:35:08.000000', 1008, 1),
	(65, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 12, 'realme_5_pro_xanh_la.jpg', 5.5, NULL, NULL, 'Realme 5 Pro', 3000, 5990000, '2 sim', 26, NULL, '2020-04-23 12:35:08.000000', 911, 1),
	(66, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 6, 'nokia_7.2_xanh.jpg', 5.5, NULL, NULL, 'Nokia 7.2', 3000, 6190000, '2 sim', 65, NULL, '2020-04-23 12:35:08.000000', 1532, 1),
	(68, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart-active-3-6gb-ram-1_6_2.png', 5.5, NULL, NULL, 'Vsmart Active 3 4GB Ram', 3000, 4490000, '2 sim', 43, NULL, '2020-04-23 12:35:08.000000', 4928, 1),
	(70, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 12, 'realme_5_xanh.jpg', 5.5, NULL, NULL, 'Realme 5', 3000, 3990000, '2 sim', 72, NULL, '2020-04-23 12:35:08.000000', 41, 1),
	(71, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'bee_indigo_blue_thumbnail_2500.jpg', 5.5, NULL, NULL, 'Vsmart Bee', 3000, 990000, '2 sim', 30, NULL, '2020-04-23 12:35:08.000000', 5424, 1),
	(72, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, '4ba2vt.jpg', 5.5, NULL, NULL, 'Vsmart Star', 3000, 1390000, '2 sim', 37, NULL, '2020-04-23 12:35:08.000000', 6997, 1),
	(73, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 11, 'reno_2f_2.jpg', 5.5, NULL, NULL, 'Oppo Reno 2F', 3000, 7990000, '2 sim', 92, NULL, '2020-04-23 12:35:08.000000', 8711, 1),
	(74, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone8-plus-silver-select-2018.png', 5.5, NULL, NULL, 'Apple iPhone 8 Plus 128GB Chính hãng (mã VN/A)', 3000, 18000000, '2 sim', 49, NULL, '2020-04-23 12:35:08.000000', 2565, 1),
	(76, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, '600_mi9_tim_800x800_2.jpg', 5.5, NULL, NULL, 'Xiaomi Mi 9', 3000, 11990000, '2 sim', 69, NULL, '2020-04-23 12:35:08.000000', 6694, 1),
	(77, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '6s_rose_2.jpg', 5.5, NULL, NULL, 'Apple iPhone 6S Plus 32GB Chính hãng (mã VN/A)', 3000, 8500000, '2 sim', 99, NULL, '2020-04-23 12:35:08.000000', 5772, 1),
	(79, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 11, '637098372491881462_oppo-a9-trang-1-2.png', 5.5, NULL, NULL, 'Oppo A9 2020', 3000, 5990000, '2 sim', 33, NULL, '2020-04-23 12:35:08.000000', 8781, 1),
	(80, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 13, '0mtjgefggujzwdnb_setting_fff_1_90_end_500.jpg', 5.5, NULL, NULL, 'Asus Zenfone Max M2 4GB', 3000, 3790000, '2 sim', 7, NULL, '2020-04-23 12:35:08.000000', 6587, 1),
	(81, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, 'mi-9t-red.jpg', 5.5, NULL, NULL, 'Xiaomi Mi 9T', 3000, 7990000, '2 sim', 38, NULL, '2020-04-23 12:35:08.000000', 6593, 1),
	(82, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 6, '636737264632684088_nokia6plus-trang-1.jpg', 5.5, NULL, NULL, 'Nokia 6.1 Plus', 3000, 3990000, '2 sim', 66, NULL, '2020-04-23 12:35:08.000000', 3203, 1),
	(83, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 12, 'realme_5_pro_xanh_la_2.jpg', 5.5, NULL, NULL, 'Realme 5 Pro 8GB', 3000, 6990000, '2 sim', 18, NULL, '2020-04-23 12:35:08.000000', 6236, 1),
	(86, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 11, 'oppo_a5_2020_trang.jpg', 5.5, NULL, NULL, 'Oppo A5 2020', 3000, 3990000, '2 sim', 93, NULL, '2020-04-23 12:35:08.000000', 1570, 1),
	(87, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 13, 'zfmaxpro_m2__front_darkblue.jpg', 5.5, NULL, NULL, 'ASUS ZenFone Max Pro M2 3GB', 3000, 5290000, '2 sim', 11, NULL, '2020-04-23 12:35:08.000000', 9143, 1),
	(88, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, 'xiaomi_mi_9_lite_05_negro_ad_l.jpg', 5.5, NULL, NULL, 'Xiaomi Mi 9 Lite', 3000, 6690000, '2 sim', 77, NULL, '2020-04-23 12:35:08.000000', 1005, 1),
	(89, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-gold-select-2019_1.png', 5.5, NULL, NULL, 'iPhone 11 Pro 256GB Chính hãng (VN/A)', 3000, 34990000, '2 sim', 51, NULL, '2020-04-23 12:35:08.000000', 7597, 1),
	(90, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone11-red-select-2019_1.png', 5.5, NULL, NULL, 'iPhone 11 256GB Chính hãng (VN/A)', 3000, 25990000, '2 sim', 25, NULL, '2020-04-23 12:35:08.000000', 4970, 1),
	(91, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_8_64gb.jpg', 5.5, NULL, NULL, 'Apple iPhone 8 64GB Chính hãng (mã VN/A)', 3000, 14500000, '2 sim', 71, NULL, '2020-04-23 12:35:08.000000', 2061, 1),
	(92, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '600_7_plus_800x800_1_1.jpg', 5.5, NULL, NULL, 'Apple iPhone 7 Plus 128GB Chính hãng (Mã VN/A)', 3000, 14500000, '2 sim', 78, NULL, '2020-04-23 12:35:08.000000', 5392, 1),
	(93, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, 'redmi_note7_-8_5119_1547135161_1548129034.jpg_1_1_1.jpg', 5.5, NULL, NULL, 'Redmi Note 7 32GB', 3000, 4290000, '2 sim', 79, NULL, '2020-04-23 12:35:08.000000', 776, 1),
	(94, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 6, 'nokia_23_vang.jpg', 5.5, NULL, NULL, 'Nokia 2.3', 3000, 2590000, '2 sim', 61, NULL, '2020-04-23 12:35:08.000000', 7704, 1),
	(95, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 12, '637123489264613139_realme-5i-green-1.png', 5.5, NULL, NULL, 'Realme 5i', 3000, 4290000, '2 sim', 69, NULL, '2020-04-23 12:35:08.000000', 6194, 1),
	(96, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_xs_max_256gb.jpg', 5.5, NULL, NULL, 'Apple iPhone XS Max 256GB Chính hãng (VN/A)', 3000, 30000000, '2 sim', 61, NULL, '2020-04-23 12:35:08.000000', 7857, 1),
	(97, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 6, 'b4fcf7b3dbdc61cbb0d0f92c16d3c316.jpg', 5.5, NULL, NULL, 'Nokia 3.2 2GB', 3000, 2490000, '2 sim', 97, NULL, '2020-04-23 12:35:08.000000', 702, 1),
	(99, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 11, 'mau-up-web-a5s-black.jpg', 5.5, NULL, NULL, 'Oppo A5s', 3000, 3290000, '2 sim', 4, NULL, '2020-04-23 12:35:08.000000', 9939, 1),
	(100, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 11, '637037229706723788_oppo-reno-2-5.png', 5.5, NULL, NULL, 'Oppo Reno 2', 3000, 14990000, '2 sim', 26, NULL, '2020-04-23 12:35:08.000000', 7590, 1),
	(101, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, 'photo_2019-02-25_16-38-44_5.jpg', 5.5, NULL, NULL, 'Redmi Note 7', 3000, 4990000, '2 sim', 20, NULL, '2020-04-23 12:35:08.000000', 8135, 1),
	(102, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone-11-pro-max-gold-select-2019_2.png', 5.5, NULL, NULL, 'iPhone 11 Pro Max 512GB Chính hãng (VN/A)', 3000, 43990000, '2 sim', 22, NULL, '2020-04-23 12:35:08.000000', 7902, 1),
	(103, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 3, '636683033477213503_xiaomi-mi8-xanh-1.jpg', 5.5, NULL, NULL, 'Xiaomi Mi 8 64GB', 3000, 9190000, '2 sim', 51, NULL, '2020-04-23 12:35:08.000000', 5108, 1),
	(104, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 9, 'vsmart_joy2__borealis_thumbnail_2500x2500.jpg', 5.5, NULL, NULL, 'Vsmart Joy 2 Plus', 3000, 3690000, '2 sim', 89, NULL, '2020-04-23 12:35:08.000000', 1832, 1),
	(105, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 12, 'realme-3-pro_2.jpg', 5.5, NULL, NULL, 'Realme 3 Pro 6GB', 3000, 7490000, '2 sim', 93, NULL, '2020-04-23 12:35:08.000000', 3837, 1),
	(107, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, '6s_gold_2.jpg', 5.5, NULL, NULL, 'Apple iPhone 6S 32GB Chính hãng (VN/A)', 3000, 7000000, '2 sim', 98, NULL, '2020-04-23 12:35:08.000000', 3690, 1),
	(108, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 12, '637092380829657558_realme-xt-trang-1.png', 5.5, NULL, NULL, 'Realme XT', 3000, 7990000, '2 sim', 10, NULL, '2020-04-23 12:35:08.000000', 6939, 1),
	(109, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 13, 'zenfonelive-l1-blk-1.png.jpg', 5.5, NULL, NULL, 'Asus Zenfone Live L1', 3000, 2490000, '2 sim', 55, NULL, '2020-04-23 12:35:08.000000', 3626, 1),
	(110, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, '\r\n	Tình trạng\r\nMáy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối\r\nHộp bao gồm\r\n- Máy\r\n- Sạc USB-C 18W\r\n- Cáp USB-C to Lightning\r\n- Tai nghe\r\n- Que lấy SIM, sách hướng dẫn\r\nBảo hành\r\nBảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất\r\n', '1080x720', 2, 'iphone_xs_max_512gb.jpg', 5.5, NULL, NULL, 'Apple iPhone XS Max 512GB Chính hãng (VN/A)', 3000, 31000000, '2 sim', 45, NULL, '2020-04-23 12:35:08.000000', 7312, 1),
	(111, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'note_10_plus_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Note 10+ (Plus)', 3000, 26990000, '2 sim', 77, NULL, '2020-04-23 12:35:08.000000', 5681, 1),
	(112, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a50s_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A50s', 3000, 6990000, '2 sim', 17, NULL, '2020-04-23 12:35:08.000000', 6471, 1),
	(113, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'samsung-galaxy-a51-black_10.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A51', 3000, 7990000, '2 sim', 48, NULL, '2020-04-23 12:35:08.000000', 5312, 1),
	(114, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636863659522918468_ss-galaxy-s10-plus-xanh-1.png', 5.5, NULL, NULL, 'Samsung Galaxy S10+ (Plus)', 3000, 22990000, '2 sim', 89, NULL, '2020-04-23 12:35:08.000000', 7147, 1),
	(115, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636703736254310068_note9-xanh-1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Note 9', 3000, 22990000, '2 sim', 0, NULL, '2020-04-23 12:35:08.000000', 9800, 1),
	(116, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'note_10_plus_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Note 10+ (Plus)', 3000, 26990000, '2 sim', 36, NULL, '2020-04-23 12:35:08.000000', 7557, 1),
	(117, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a50s_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A50s', 3000, 6990000, '2 sim', 67, NULL, '2020-04-23 12:35:08.000000', 8386, 1),
	(118, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636907475981220637_samsung-galaxy-a70-den-1.png', 5.5, NULL, NULL, 'Samsung Galaxy A70', 3000, 9290000, '2 sim', 31, NULL, '2020-04-23 12:35:08.000000', 9260, 1),
	(119, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '600_samsung-galaxy-a71_1_1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A71', 3000, 10490000, '2 sim', 8, NULL, '2020-04-23 12:35:08.000000', 1142, 1),
	(120, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 2, '6s_rose_2.jpg', 5.5, NULL, NULL, 'Apple iPhone 6S Plus 32GB Chính hãng (mã VN/A)', 3000, 8500000, '2 sim', 50, NULL, '2020-04-23 12:35:08.000000', 7931, 1),
	(121, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a80_blackpin_1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A80', 3000, 14990000, '2 sim', 26, NULL, '2020-04-23 12:35:08.000000', 6227, 1),
	(122, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 3, '637060435932431657_xiaomi-redmi-note-8-pro-xanh-1_1.png', 5.5, NULL, NULL, 'Xiaomi Redmi Note 8 Pro 128GB', 3000, 6490000, '2 sim', 79, NULL, '2020-04-23 12:35:08.000000', 7341, 1),
	(123, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'samsung-galaxy-note-10-lite-chi-tiet-1-400x460.png', 5.5, NULL, NULL, 'Samsung Galaxy Note 10 Lite', 3000, 13990000, '2 sim', 47, NULL, '2020-04-23 12:35:08.000000', 8027, 1),
	(124, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a10scdo.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A10s', 3000, 3690000, '2 sim', 86, NULL, '2020-04-23 12:35:08.000000', 8112, 1),
	(126, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'sm-t295_001_front_sil1er.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Tab A8 2019 (T295)', 3000, 3690000, '2 sim', 15, NULL, '2020-04-23 12:35:08.000000', 6477, 1),
	(127, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '637049168075038350_ss-a20s-den-1.png', 5.5, NULL, NULL, 'Samsung Galaxy A20s', 3000, 4390000, '2 sim', 15, NULL, '2020-04-23 12:35:08.000000', 8048, 1),
	(129, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'galaxyfold.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Fold', 3000, 50000000, '2 sim', 56, NULL, '2020-04-23 12:35:08.000000', 811, 1),
	(130, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636863643187455627_ss-galaxy-s10-trang-1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy S10', 3000, 20990000, '2 sim', 73, NULL, '2020-04-23 12:35:08.000000', 9911, 1),
	(131, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636872943529900358_samsung-galaxy-a50-trang-1_3.png', 5.5, NULL, NULL, 'Samsung Galaxy A50 128GB', 3000, 7990000, '2 sim', 24, NULL, '2020-04-23 12:35:08.000000', 7121, 1),
	(133, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'note_10_plus_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Note 10+ (Plus)', 3000, 26990000, '2 sim', 2, NULL, '2020-04-23 12:35:08.000000', 5874, 1),
	(134, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a50s_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A50s', 3000, 6990000, '2 sim', 38, NULL, '2020-04-23 12:35:08.000000', 8004, 1),
	(135, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'samsung-galaxy-a51-black_10.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A51', 3000, 7990000, '2 sim', 86, NULL, '2020-04-23 12:35:08.000000', 2401, 1),
	(136, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636863659522918468_ss-galaxy-s10-plus-xanh-1.png', 5.5, NULL, NULL, 'Samsung Galaxy S10+ (Plus)', 3000, 22990000, '2 sim', 16, NULL, '2020-04-23 12:35:08.000000', 7990, 1),
	(137, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636703736254310068_note9-xanh-1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Note 9', 3000, 22990000, '2 sim', 4, NULL, '2020-04-23 12:35:08.000000', 2749, 1),
	(138, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'note_10_plus_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Note 10+ (Plus)', 3000, 26990000, '2 sim', 73, NULL, '2020-04-23 12:35:08.000000', 9775, 1),
	(139, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a50s_xanh.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A50s', 3000, 6990000, '2 sim', 53, NULL, '2020-04-23 12:35:08.000000', 626, 1),
	(140, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636907475981220637_samsung-galaxy-a70-den-1.png', 5.5, NULL, NULL, 'Samsung Galaxy A70', 3000, 9290000, '2 sim', 46, NULL, '2020-04-23 12:35:08.000000', 3812, 1),
	(141, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '600_samsung-galaxy-a71_1_1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A71', 3000, 10490000, '2 sim', 77, NULL, '2020-04-23 12:35:08.000000', 7160, 1),
	(142, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 2, '6s_rose_2.jpg', 5.5, NULL, NULL, 'Apple iPhone 6S Plus 32GB Chính hãng (mã VN/A)', 3000, 8500000, '2 sim', 40, NULL, '2020-04-23 12:35:08.000000', 4375, 1),
	(143, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a80_blackpin_1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A80', 3000, 14990000, '2 sim', 27, NULL, '2020-04-23 12:35:08.000000', 397, 1),
	(144, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 3, '637060435932431657_xiaomi-redmi-note-8-pro-xanh-1_1.png', 5.5, NULL, NULL, 'Xiaomi Redmi Note 8 Pro 128GB', 3000, 6490000, '2 sim', 14, NULL, '2020-04-23 12:35:08.000000', 8857, 1),
	(145, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'samsung-galaxy-note-10-lite-chi-tiet-1-400x460.png', 5.5, NULL, NULL, 'Samsung Galaxy Note 10 Lite', 3000, 13990000, '2 sim', 92, NULL, '2020-04-23 12:35:08.000000', 3098, 1),
	(148, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'sm-t295_001_front_sil1er.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Tab A8 2019 (T295)', 3000, 3690000, '2 sim', 60, NULL, '2020-04-23 12:35:08.000000', 8916, 1),
	(149, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '637049168075038350_ss-a20s-den-1.png', 5.5, NULL, NULL, 'Samsung Galaxy A20s', 3000, 4390000, '2 sim', 67, NULL, '2020-04-23 12:35:08.000000', 5286, 1),
	(150, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 2, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'a30s_trang.jpg', 5.5, NULL, NULL, 'Samsung Galaxy A30s', 3000, 6290000, '2 sim', 54, NULL, '2020-04-23 12:35:08.000000', 9685, 1),
	(151, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, 'galaxyfold.jpg', 5.5, NULL, NULL, 'Samsung Galaxy Fold', 3000, 50000000, '2 sim', 71, NULL, '2020-04-23 12:35:08.000000', 2564, 1),
	(152, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636863643187455627_ss-galaxy-s10-trang-1.jpg', 5.5, NULL, NULL, 'Samsung Galaxy S10', 3000, 20990000, '2 sim', 90, NULL, '2020-04-23 12:35:08.000000', 3767, 1),
	(153, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 1, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 1, '636872943529900358_samsung-galaxy-a50-trang-1_3.png', 5.5, NULL, NULL, 'Samsung Galaxy A50 128GB', 3000, 7990000, '2 sim', 48, NULL, '2020-04-23 12:35:08.000000', 1141, 1),
	(155, 'Chip Apple A10', '64GB', '16 MPx', 'Retina', 0, 'Tình trạng Máy mới 100% , chính hãng Apple Việt Nam. CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam do Viettel phân phối Hộp bao gồm - Máy - Sạc USB-C 18W - Cáp USB-C to Lightning - Tai nghe - Que lấy SIM, sách hướng dẫn Bảo hành Bảo hành chính hãng 12 tháng tại trung tâm bảo hành của Apple Việt Nam. Đổi mới trong 30 ngày tại CellphoneS nếu có lỗi nhà sản xuất', '1080x720', 10, '600_7_plus_800x800_1_1.jpg', 5.5, NULL, NULL, 'B phone 3', 3000, 5990000, '2 sim', 95, 'DIENTHOAI', '2020-04-23 12:35:08.000000', 4406, 1);
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
