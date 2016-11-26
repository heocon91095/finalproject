-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2016 at 05:31 PM
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
  `customerid` int(11) DEFAULT '0',
  `total` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `excess` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billid`, `customerid`, `total`, `tax`, `pay`, `excess`, `note`, `status`, `day`) VALUES
(1, 0, 32000000, 0, 32000000, 0, '', 'Chờ xử lý', '2016-11-25'),
(2, 0, 32000000, 0, 123456789, 91456789, '', 'Đã giao hàng', '2016-11-25'),
(3, 0, 17000000, 0, 100, -16999900, '', 'Đã giao hàng', '2016-11-25'),
(4, 0, 17000000, 0, 100, -16999900, '', 'Đã giao hàng', '2016-11-25'),
(5, 0, 32000000, 0, 0, 0, '', 'Đã giao hàng', '2016-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `billid` int(11) NOT NULL,
  `productid` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `productname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `unitprice` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `billdetail`
--

INSERT INTO `billdetail` (`billid`, `productid`, `productname`, `number`, `unitprice`, `totalprice`) VALUES
(1, '1', 'Samsung', 1, 15000000, 15000000),
(1, '2', 'Samsung', 1, 17000000, 17000000),
(2, '1', 'Samsung', 1, 15000000, 15000000),
(2, '2', 'Samsung', 1, 17000000, 17000000),
(3, '2', 'Samsung', 1, 17000000, 17000000),
(5, '1', 'Samsung', 1, 15000000, 15000000),
(5, '2', 'Samsung', 1, 17000000, 17000000);

-- --------------------------------------------------------

--
-- Table structure for table `billtemplate`
--

CREATE TABLE `billtemplate` (
  `id` int(11) NOT NULL,
  `header` text COLLATE utf8_unicode_ci NOT NULL,
  `footer` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerid` int(10) NOT NULL,
  `customername` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customergroup` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `customername`, `phone`, `address`, `customergroup`, `mail`) VALUES
(0, 'Khách vãng lai', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customergroup`
--

CREATE TABLE `customergroup` (
  `cgroupid` int(11) NOT NULL,
  `cgroupname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cgroupnote` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeid` int(11) NOT NULL,
  `employeename` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeid`, `employeename`, `phone`, `address`, `mail`, `username`) VALUES
(1, 'admin', '123456789', 'admin@admin', 'admin@admin', 'admin'),
(2, 'Sal Filane', NULL, NULL, NULL, 'heocon91095');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `infoid` int(11) NOT NULL,
  `infohead` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `infobody` text COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `labelimg` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`infoid`, `infohead`, `infobody`, `date`, `labelimg`) VALUES
(1, 'asd', '<p>asdsadsad</p>', 'Sat Nov 26 2016 14:25:31 GMT+0700 (SE Asia Standard Time)', 'sadsad');

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `producerid` int(11) NOT NULL,
  `producername` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `producergroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`producerid`, `producername`, `phone`, `address`, `producergroup`, `mail`) VALUES
(1, ' Samsung', ' 0123456798', 'Khu công nghệ cao, Q.9, TP.HCM', 'Nhóm NSX 1', 'samsung@samsung.com');

-- --------------------------------------------------------

--
-- Table structure for table `producergroup`
--

CREATE TABLE `producergroup` (
  `groupid` int(11) NOT NULL,
  `groupname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `groupnote` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `producergroup`
--

INSERT INTO `producergroup` (`groupid`, `groupname`, `groupnote`) VALUES
(1, 'Nhóm NSX 1', 'Nhóm đầu tiên');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` int(10) NOT NULL,
  `productname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `producer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `supiler` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `groupid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prductimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pricein` int(11) NOT NULL,
  `priceout` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `productname`, `unit`, `producer`, `supiler`, `groupid`, `prductimg`, `note`, `pricein`, `priceout`, `vat`, `detail`) VALUES
(1, 'Samsung Galaxy S7', 'Cái', 'Samsung', 'Samsung VN', 'Điện thoại', 'galaxys7.jpg', 'Siêu phẩm', 12000000, 15000000, 10, NULL),
(2, 'Samsung Galaxy Note 7', 'Cái', 'Samsung', 'Samsung VN', 'Điện thoại', 'note7.jpg', 'Allahu Akbar', 15000000, 17000000, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `productid` int(10) NOT NULL,
  `display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frontcam` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `backcam` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cpu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ram` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `storage` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sdcard` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `sim` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `battery` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`productid`, `display`, `os`, `frontcam`, `backcam`, `cpu`, `ram`, `storage`, `sdcard`, `sim`, `battery`, `image`, `special`) VALUES
(1, '5.5 Inch FullHD', 'Android 6.0', '20 MP', '20 MP', 'SnapDragon 830', '6GB', '16GB', '128GB', '1 Sim', '3400mAh', 'galaxys7.jpg', 'Amoled, cấu hình mạnh'),
(2, '6 Inch 4k', 'Android 7.0', '20MP', '40MP', 'SnapDragon 830', '6GB', '64GB', '200GB', '1 Sim', '3400mAh', 'note7.jpg', 'Cong, Amoled, Gây nổ');

-- --------------------------------------------------------

--
-- Table structure for table `productgroup`
--

CREATE TABLE `productgroup` (
  `pgroupid` int(11) NOT NULL,
  `pgroupname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pgroupnote` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productgroup`
--

INSERT INTO `productgroup` (`pgroupid`, `pgroupname`, `pgroupnote`) VALUES
(1, 'Điện thoại', 'Điện thoại'),
(3, 'dsf', 'sdfsdf'),
(4, 'dsf2', 'sdfsdf');

-- --------------------------------------------------------

--
-- Table structure for table `receiptandpayment`
--

CREATE TABLE `receiptandpayment` (
  `billid` int(11) NOT NULL,
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
(1, 'Thu', ' adsf', ' 142', 124, ' 412', ' 213', ''),
(3, 'Thu', 'Tai 1', ' das', 312321, ' dadsd', ' 3asdas', '2016-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `suplierid` int(10) NOT NULL,
  `supliername` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `supliergroup` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`suplierid`, `supliername`, `phone`, `address`, `supliergroup`, `mail`) VALUES
(0, 'Không khai báo', ' ', ' ', NULL, ' '),
(1, ' Samsung VN', ' 0123456789', ' Thái Nguyên, Việt Nam', NULL, ' samsung@samsung.com'),
(3, ' LG VN', ' 0123456789', ' Miền Bắc Việt Nam', NULL, 'lg@lg.com');

-- --------------------------------------------------------

--
-- Table structure for table `supliergroup`
--

CREATE TABLE `supliergroup` (
  `sgroupid` int(11) NOT NULL,
  `sgroupname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sgroupnote` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supliergroup`
--

INSERT INTO `supliergroup` (`sgroupid`, `sgroupname`, `sgroupnote`) VALUES
(1, 'Nhóm 1', 'Nhóm 1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'heocon91095', 'Password123', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `wid` int(11) NOT NULL,
  `supilerid` int(11) NOT NULL DEFAULT '0',
  `pay` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `day` date NOT NULL,
  `creator` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tax` int(11) NOT NULL,
  `excess` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`wid`, `supilerid`, `pay`, `total`, `day`, `creator`, `status`, `note`, `tax`, `excess`) VALUES
(1, 0, 1000000000, 98000000, '2016-11-26', 'admin', 'Đã thanh toán', '', 0, 919000000);

-- --------------------------------------------------------

--
-- Table structure for table `warehousedetail`
--

CREATE TABLE `warehousedetail` (
  `wid` int(11) NOT NULL,
  `productid` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `productname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `unitprice` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehousedetail`
--

INSERT INTO `warehousedetail` (`wid`, `productid`, `productname`, `number`, `unitprice`, `totalprice`) VALUES
(1, '1', 'Samsung', 2, 15000000, 30000000),
(1, '2', 'Samsung', 4, 17000000, 68000000);

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
-- Indexes for table `billtemplate`
--
ALTER TABLE `billtemplate`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`infoid`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`producerid`);

--
-- Indexes for table `producergroup`
--
ALTER TABLE `producergroup`
  ADD PRIMARY KEY (`groupid`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `warehousedetail`
--
ALTER TABLE `warehousedetail`
  ADD PRIMARY KEY (`wid`,`productid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `billtemplate`
--
ALTER TABLE `billtemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerid` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customergroup`
--
ALTER TABLE `customergroup`
  MODIFY `cgroupid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `infoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `producerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `producergroup`
--
ALTER TABLE `producergroup`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `productgroup`
--
ALTER TABLE `productgroup`
  MODIFY `pgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `receiptandpayment`
--
ALTER TABLE `receiptandpayment`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `suplier`
--
ALTER TABLE `suplier`
  MODIFY `suplierid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `supliergroup`
--
ALTER TABLE `supliergroup`
  MODIFY `sgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
