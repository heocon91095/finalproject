-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2016 at 03:32 AM
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
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `billid` int(11) NOT NULL,
  `customerid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `excess` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billid`, `customerid`, `total`, `tax`, `pay`, `excess`, `note`, `status`) VALUES
(1, 'KH001', 0, 10, 23, 23, '123456', ''),
(2, 'KH001', 0, 0, 15, 15, '123', ''),
(3, 'KH001', 132312, 0, 150000, 17688, 'ok 1 2 3', ''),
(4, 'KH002', 180312, 0, 200000, 20000, '1231231', ''),
(5, 'KH002', 264000, 0, 100000, -164000, 'ádsad', ''),
(6, 'KH0004', 72000, 0, 100000, 28000, 'asdqweqw', ''),
(7, 'KH001', 252000, 0, 123, -251877, '19156', ''),
(8, 'KH001', 84000, 0, 10000, -74000, '156132', ''),
(9, 'KH001', 132000, 0, 20000, -112000, '1231231', ''),
(10, 'KH001', 132000, 0, 20000, -112000, '1231231', ''),
(11, 'KH001', 132000, 0, 20000, -112000, '1231231', ''),
(12, 'KH0004', 84000, 0, 50000, -34000, 'asdsad', ''),
(13, 'KH001', 120000, 0, 100, -119900, '', ''),
(14, 'KH0004', 633, 0, 1233, 600, '', ''),
(15, 'KH0004', 72000, 0, 12345, -59655, '', ''),
(16, '', 1596, 0, 12343, 10747, 'asdsadsa', '?ã giao hàng');

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `billid` int(11) NOT NULL,
  `productid` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `unitprice` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billdetail`
--

INSERT INTO `billdetail` (`billid`, `productid`, `productname`, `number`, `unitprice`, `totalprice`) VALUES
(14, 'asdf', 'asfd', 0, 321, 321),
(14, 'qwe', 'qew', 0, 312, 312),
(15, 'SP001', 'S?n', 1, 12000, 12000),
(15, 'SP002', 'LG', 1, 60000, 60000),
(16, 'asd56', 'das', 3, 321, 321),
(16, 'asd789', 'as', 1, 312, 312),
(16, 'asdf', 'asfd', 1, 321, 321);

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
(' KHSP01', ' KH hom nay', ' 01234567', ' khong co', 'KhÃ¡ch hÃ ng 1', NULL, ' khongco@gmail.com'),
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
('asd45', 'dsa', 'sad', 'sad', 'dsa', 'Nhom 1', NULL, 'sad', 123, 321, 132, NULL),
('asd56', 'das', 'sad', 'asd', 'asd', 'Nhom 1', NULL, 'ads', 123, 321, 123, NULL),
('asd789', 'as', 'sadsa', 'sADAS', 'A', 'Nhom 1', NULL, 'sadsa', 123, 312, 312, NULL),
('asdf', 'asfd 123', 'sdfa', 'sdfa', 'fdsa', 'Group 1', NULL, 'sdfa', 132, 321, 312, NULL),
('qwe', 'qew', 'qwe', 'qew', 'qwe', 'Group 1', NULL, 'eqw', 312, 312, 132, NULL),
('sad', 'sadasd', 'asd', 'sad', 'sadd', 'Nhom 1', NULL, 'sadsad', 321, 123, 123, NULL),
('sad123', 'sad', 'sadsad', 'sad', 'sadsa', 'Group 1', NULL, 'sadsadsa', 123, 123, 123, NULL),
('sda321', 'asdasd', 'asd', 'dsa', 'sadsda', 'Nhom 1', NULL, 'saddas', 123, 321, 123, NULL),
('SP001', 'S?n ph?m 1', 'Cái', 'Samsung', 'SamsungVN', 'Group 1', NULL, '', 10000, 12000, 10, NULL),
('SP002', 'LG G2', 'Cai', 'LG', 'LG VN', 'Nhom 1', NULL, 'LG G2', 50000, 60000, 10, NULL),
('SP003', 'iphone', '123', 'Apple', 'Khong co', 'Nhom 1', NULL, 'ahihihiasd', 123, 123, 123, NULL),
('SP004', 'adssad', 'sadsad', 'sad', 'sad', 'Nhom 1', NULL, 'asdsad', 123, 123, 123, NULL),
('SP005', 'sad', 'asd', 'sad', 'asd', 'Nhom 1', NULL, 'sdasad', 123, 123, 123, NULL);

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
  `battery` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`productid`, `display`, `os`, `frontcam`, `backcam`, `cpu`, `ram`, `storage`, `sdcard`, `sim`, `battery`, `image`, `special`) VALUES
('1234', 'asd', 'sadads', 'sad', 'sad', 'sda', 'sadads', 'sad', 'sad', 'sad', 'ads', '', 'sad'),
('asd45', 'dsasa', 'sad', 'das', 'ads', 'das', 'ads', 'sadsad', 'sad', 'sad', 'ads', '', 'asddas'),
('asd56', 'sda', 'das', 'asd', 'sad', 'sad', 'dsa', 'asd', 'sadsad', 'ads', 'asd', 'iphone.jpg', 'asd'),
('asd789', 'asd', 'das', 'dsa', 'das', 'sad', 'sadsad', 'das', 'sda', 'sad', 'sad', 'user1.png', 'asdsadsadsad'),
('asdf', 'fd123', 'fsaddf', 'dfsa', 'asdf', 'asfdsa', 'fd', 'fsadfsad', 'fasd', 'sadf', 'fsad', 'galaxynote7.jpg', 'fasd'),
('qwe', 'das', 'das', 'dsa', 'sda', 'asd', 'sad', 'sad', 'sda', 'dsa', 'sda', 'galaxynote7.jpg', 'sadsda'),
('sad', 'ads', 'asdsad', 'adsd', 'sad', 'dasd', 'das', 'ads', 'dsa', 'sad', 'dsa', 'user1.png', 'sad'),
('sad123', 'sda', 'das', 'asd', 'asd', 'sad', 'sad', 'sad', 'dsa', 'asd', 'sda', 'iphone.jpg', 'ads'),
('sda123', 'ads', 'asd', 'sad', 'sad', 'das', 'das', 'sad', 'dsa', 'asd', 'dsa', 'iphone.jpg', 'sad'),
('sda321', 'dsad', 'asdsad', 'sad', 'sad', 'das', 'sad', 'sad', 'ads', 'sad', 'ads', '', 'ads'),
('SP001', '5inch, FullHD, Amoled ', 'Android 6.0', '5.0MP', '8.0MP', 'Snapdragon 650', '4GB', '64GB', '256GB', '2 Sim', '3000 mAh', 'galaxynote7.jpg', ''),
('SP002', '5inch, FullHD', 'Android', '8MP', '13MP', 'SnapDragon 800', '2Gb', '16GB', '25GB', '1 Sim', '3400 mAh', 'galaxynote7.jpg', ''),
('SP003', '123', 'ad', 'sad', 'ad', 'sdsad', 'dasd', 'ads', 'asd', 'ads', 'ads', 'iphone.jpg', 'adsdas'),
('SP004', 'asd', '312', 'ads', '231', 'sad', 'asd', 'asd', 'ads', 'ads', 'ads', 'iphone.jpg', 'das'),
('SP005', '231', '123', '213231', '13', 'qsdsa', 'dasdas', 'ad', 'da', 'dsa', 'sad', 'iphone.jpg', 'ads'),
('SP006', 'dsa', 'das', 'sad', 'sad', 'dsa', 'dsa', 'sad', 'sad', 'dsa', 'sad', '', 'ads');

-- --------------------------------------------------------

--
-- Table structure for table `productgroup`
--

CREATE TABLE `productgroup` (
  `pgroupid` int(11) NOT NULL,
  `pgroupname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pgroupnote` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productgroup`
--

INSERT INTO `productgroup` (`pgroupid`, `pgroupname`, `pgroupnote`) VALUES
(1, 'Nhom 1', 'Ahihi'),
(2, 'Group 1', 'This is group1');

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
(' B1234', 'Thu', ' 123', ' asd', 12321, ' asdas', ' dasd', '2016-11-03'),
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
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billid`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`billid`,`productid`);

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
-- Indexes for table `productgroup`
--
ALTER TABLE `productgroup`
  ADD PRIMARY KEY (`pgroupid`);

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
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `customergroup`
--
ALTER TABLE `customergroup`
  MODIFY `cgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `productgroup`
--
ALTER TABLE `productgroup`
  MODIFY `pgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
