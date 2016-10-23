-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2016 at 04:42 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobilestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customername` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customergroup` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `customername`, `phone`, `address`, `customergroup`, `username`, `mail`) VALUES
('KH0004', 'Tran Phuc Tai', '0123456789', '27c Tran QUang Khai, P.Tan Dinh, Q.1, TP. Ho Chi minh', 'Khách hàng 1', NULL, 'Don''t have yet'),
('KH001', 'Khach hang 1', '0123456789', '280 An Duong Vuong', 'Khách hàng 2', 'admin123', 'khongco@ahihi'),
('KH002', 'Ahihi admin ne', '01248596587', '280 An Duong Vuong Q.5 TP.Ho Chi Minh', 'Khách hàng 1', NULL, 'KHongcodau@ahii.com');

-- --------------------------------------------------------

--
-- Table structure for table `customergroup`
--

CREATE TABLE `customergroup` (
  `cgroupid` int(11) NOT NULL,
  `cgroupname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cgroupnote` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customergroup`
--

INSERT INTO `customergroup` (`cgroupid`, `cgroupname`, `cgroupnote`) VALUES
(1, 'Khách hàng 1', 'Khách hàng bình thường'),
(2, 'Khách hàng 2', 'Đại gia có tiền'),
(5, 'Ã¡das', 'Ã¡dasd'),
(6, 'Ã¡das123', 'aqweqswdasda'),
(7, 'adssa', 'Ä?Ã¢sdasdsadasdsa'),
(8, 'dasd', 'sadasdas');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `producer` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supiler` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prductimg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricein` int(11) NOT NULL,
  `priceout` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `productname`, `unit`, `producer`, `supiler`, `groupid`, `prductimg`, `note`, `pricein`, `priceout`, `vat`, `detail`) VALUES
('SP001', 'Sản phẩm 1', 'Cái', 'Samsung', 'SamsungVN', 'Sản phẩm 1', '', '', 10000, 12000, 10, ''),
('SP002', 'Sáº£n pháº©m 2', 'CÃ¡i', 'LG', 'LG Viá»?t Nam', 'all', NULL, 'xxxyyy', 20000, 25000, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `productid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontcam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backcam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ram` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdcard` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sim` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `battery` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`productid`, `display`, `os`, `frontcam`, `backcam`, `cpu`, `ram`, `storage`, `sdcard`, `sim`, `battery`) VALUES
('SP001', '5inch, FullHD, Amoled ', 'Android 6.0', '5.0MP', '8.0MP', 'Snapdragon 650', '4GB', '64GB', '256GB', '2 Sim', '3000 mAh');

-- --------------------------------------------------------

--
-- Table structure for table `receiptandpayment`
--

CREATE TABLE `receiptandpayment` (
  `billid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `billtype` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receivername` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash` int(11) DEFAULT NULL,
  `reason` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `receiptandpayment`
--

INSERT INTO `receiptandpayment` (`billid`, `billtype`, `receivername`, `phone`, `cash`, `reason`, `address`, `date`) VALUES
(' zxc', 'Thu', ' Ã¡dsadsa', ' sadsadsa', 132123, ' dsadsadsad', ' adsasdsad', '2016-09-28'),
('BL001', 'Thu', 'TÃ i Ä?T 2', '01246675972', 5000000, 'Tráº£ ná»£', '27c Tráº§n Quang Kháº£i, Q.1, TP.HCM', '2016-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `suplierid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supliername` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `supliergroup` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`suplierid`, `supliername`, `phone`, `address`, `supliergroup`, `mail`) VALUES
('NCC001', 'CÃ´ng ty 1', '0123456789', 'BÃªn hÃ´ng chá»£ lá»?n', 'Nhom1', 'heocon91095@gmail.com'),
('SP003', 'TÃ©t cÃ¡i  2', ' 0123456789', ' ai bi?t', NULL, ' mail@mail.com.vn');

-- --------------------------------------------------------

--
-- Table structure for table `supliergroup`
--

CREATE TABLE `supliergroup` (
  `sgroupid` int(11) NOT NULL,
  `sgroupname` varchar(50) NOT NULL,
  `sgroupnote` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supliergroup`
--

INSERT INTO `supliergroup` (`sgroupid`, `sgroupname`, `sgroupnote`) VALUES
(1, 'Nhom1', 'Ahihi'),
(2, 'NhÃ³m 2', 'Ai mÃ  biáº¿t');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(25) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `email`, `address`, `phone`) VALUES
(1, 'admin', 'admin', 'Trann Phuc Tai', 'admin@admin.com', '280 An Duong Vuong, Q.5, TP.HCM', '0123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `customergroup`
--
ALTER TABLE `customergroup`
  ADD PRIMARY KEY (`cgroupid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `receiptandpayment`
--
ALTER TABLE `receiptandpayment`
  ADD PRIMARY KEY (`billid`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`suplierid`);

--
-- Indexes for table `supliergroup`
--
ALTER TABLE `supliergroup`
  ADD PRIMARY KEY (`sgroupid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customergroup`
--
ALTER TABLE `customergroup`
  MODIFY `cgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `supliergroup`
--
ALTER TABLE `supliergroup`
  MODIFY `sgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
