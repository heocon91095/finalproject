-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2016 at 03:10 PM
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
  `customerid` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'KH000',
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
(19, 'KH000', 1596, 0, 20000, 18404, 'Ahi hi', 'Đã giao hàng', '2016-11-05'),
(20, 'KH000', 1284, 0, 0, 0, '', 'Đã giao hàng', '2016-11-05'),
(21, 'KH000', 1284, 0, 100000, 98652, '', 'Đã giao hàng', '2016-11-05'),
(22, 'KH000', 74040, 0, 123, -1473, '123456', 'Đã giao hàng', '2016-11-05'),
(23, '7', 1398, 0, 0, -1398, '', 'Chờ xử lý', '2016-11-14'),
(24, '8', 1398, 0, 0, -1398, '', 'Chờ xử lý', '2016-11-14');

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
(18, 'asdf', 'asfd', 2, 321, 321),
(19, 'asd45', 'dsa', 1, 321, 321),
(19, 'asd789', 'as', 1, 312, 312),
(19, 'asdf', 'asfd', 3, 321, 963),
(22, 'asd56', 'das', 1, 321, 321),
(22, 'asd789', 'as', 1, 312, 312),
(22, 'asdf', 'asfd', 4, 321, 1284),
(22, 'sad', 'sadasd', 1, 123, 123),
(22, 'SP001', 'S?n', 1, 12000, 12000),
(22, 'SP002', 'LG', 1, 60000, 60000),
(23, 'asd789', 'as', 1, 312, 312),
(23, 'asdf', 'asfd', 1, 321, 321),
(23, 'sda321', 'asdasd', 1, 321, 321),
(24, 'asd45', 'dsa', 1, 321, 321),
(24, 'asd56', 'das', 2, 321, 642),
(24, 'asd789', 'as', 1, 312, 312),
(24, 'SP005', 'sad', 1, 123, 123);

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
(1, ' KH hom nay', ' 01234567', ' khong co', 'KhÃ¡ch hÃ ng 1', ' khongco@gmail.com'),
(2, 'Khách vãng lai', '', '', NULL, NULL),
(3, 'Tran Phuc Tai 2', '0123456789', '27c Tran QUang Khai, P.Tan Dinh, Q.1, TP. Ho Chi minh', 'Khách hàng 1', 'Don''t have yet'),
(4, 'Khach hang 1', '0123456789', '280 An Duong Vuong', 'Khách hàng 2', 'khongco@ahihi'),
(5, 'Ahihi admin ne', '01248596587', '280 An Duong Vuong Q.5 TP.Ho Chi Minh', 'Khách hàng 1', 'KHongcodau@ahii.com'),
(6, 'asd', 'asd', 'asd', NULL, 'sad'),
(7, 'asd', 'dsa', 'dsa', 'Khách thường', 'asd'),
(8, 'qweq', 'qwe', 'qwe', 'Ã¡das', 'wqe'),
(9, 'Trần Phúc Tài', '0123456789 ', ' 27c Trâng Quang Khải, P.Tân Định, Q.1', 'Khách hàng 1', NULL),
(10, ' Tài Trần', ' 0123456789', ' ko có', 'Khách hàng 2', ' heocon91095@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customergroup`
--

CREATE TABLE `customergroup` (
  `cgroupid` int(11) NOT NULL,
  `cgroupname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cgroupnote` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeid` int(11) NOT NULL,
  `employeename` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeid`, `employeename`, `phone`, `address`, `mail`, `username`) VALUES
(1, 'Trần Phúc Tài', '012466755972', '280 An Dương Vương, Q.5, TP.HCM', 'tai.phuc.tran@gmail.com', 'admin');

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
(2, 'Mẹo dùng nút Home ảo: chỉ cần ấn 1 lần là về Home, ấn 1 lực ', '<p><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Nhiều người Việt Nam c&oacute; th&oacute;i quen bật&nbsp;</span><a class="Tinhte_XenTag_TagLink" style="color: #176093; text-decoration: none; border-radius: 0px; padding: 0px 3px; margin: 0px -3px; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" title="" href="https://tinhte.vn/tags/assistive-touch/">Assistive Touch</a><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">&nbsp;(</span><a class="Tinhte_XenTag_TagLink" style="color: #176093; text-decoration: none; border-radius: 0px; padding: 0px 3px; margin: 0px -3px; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" title="" href="https://tinhte.vn/tags/nut-home-ao/">n&uacute;t home ảo</a><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">) tr&ecirc;n&nbsp;</span><a class="Tinhte_XenTag_TagLink" style="color: #176093; text-decoration: none; border-radius: 0px; padding: 0px 3px; margin: 0px -3px; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" title="" href="https://tinhte.vn/tags/iphone/">iPhone</a><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">, trong đ&oacute; c&oacute; m&igrave;nh, v&igrave; lo ngại vấn đề n&uacute;t Home vật l&yacute; bị hao m&ograve;n theo thời gian. Tuy nhi&ecirc;n việc sử dụng n&uacute;t home ảo lại c&oacute; 1 vấn đề nho nhỏ đ&oacute; l&agrave; phải tốn th&ecirc;m 1 lần ấn cho việc bật menu trợ năng để lựa chọn tắt hoặc kho&aacute; m&agrave;n h&igrave;nh, v&ocirc; h&igrave;nh trung g&acirc;y bất tiện khi sử dụng. V&igrave; vậy h&ocirc;m nay m&igrave;nh xin chia sẻ với c&aacute;c bạn thủ thuật nhỏ để d&ugrave;ng n&uacute;t home ảo 1 c&aacute;ch tiện hơn, v&agrave; "lợi dụng"&nbsp;</span><a class="Tinhte_XenTag_TagLink" style="color: #176093; text-decoration: none; border-radius: 0px; padding: 0px 3px; margin: 0px -3px; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" title="" href="https://tinhte.vn/tags/3d-touch/">3D touch</a><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">&nbsp;để kho&aacute; m&aacute;y rất tiện.</span><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Với mục đ&iacute;ch l&agrave; l&agrave;m chức năng của n&uacute;t Home ảo sẽ giống hệt n&uacute;t Home vật l&yacute;, nghĩa l&agrave; chỉ cần ấn 1 lần l&agrave; c&oacute; thể về m&agrave;n h&igrave;nh home, ấn 2 lần l&agrave; c&oacute; thể mở recent apps. Kh&ocirc;ng cần phải lựa chọn th&ecirc;m bất kỳ tuỳ chọn g&igrave;. Mời c&aacute;c bạn thực hiện theo c&aacute;c bước sau:</span></p>\n<ul style="margin: 1em 0px 1em 3em; padding: 0px; color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">\n<li style="margin: 0px; padding: 0px; list-style: disc outside;"><strong>Bước 1:</strong>&nbsp;Bật&nbsp;<strong><em>Assistive Touch</em></strong>&nbsp;bằng c&aacute;ch v&agrave;o&nbsp;<strong><em>Settings -&gt; General -&gt; Accessibility -&gt; AssistiveTouch</em></strong>, gạt qua On</li>\n<li style="margin: 0px; padding: 0px; list-style: disc outside;"><strong>Bước 2:</strong>&nbsp;v&agrave;o&nbsp;<strong><em>Customize Top Level Menu</em></strong>... Bấm v&agrave;o dấu trừ v&agrave; xo&aacute; hết tất cả trừ Home, m&igrave;nh tin rằng chắc cũng &iacute;t ai sử dụng mấy c&aacute;i c&ograve;n lại&nbsp;<img class="mceSmilieSprite mceSmilie8" style="border: 0px; vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; width: 18px; height: 18px; background: url(''styles/default/xenforo/xenforo-smilies-sprite.png'') -20px 0px no-repeat;" title="Big Grin :D" src="https://tinhte.vn/styles/default/xenforo/clear.png" alt=":D" /></li>\n</ul>\n<p><img class="bbCodeImage LbImage" style="border: 0px; max-width: 100%; color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" src="https://tinhte.vn/store/2016/11/3913126_3912840_IMG_1647.jpg" alt="3912840_IMG_1647.jpg" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Vậy l&agrave; b&acirc;y giờ bạn kh&ocirc;ng cần phải bấm 1 lần v&agrave;o Home ảo để hiện Menu l&ecirc;n v&agrave; th&ecirc;m 1 lần nữa để bấm N&uacute;t Home, vậy c&ograve;n muốn kho&aacute; nhanh m&agrave;n h&igrave;nh bằng 3D Touch th&igrave; sao? Mời thực hiện tiếp bước 3.</span></p>\n<ul style="margin: 1em 0px 1em 3em; padding: 0px; color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">\n<li style="margin: 0px; padding: 0px; list-style: disc outside;"><strong>Bước 3:&nbsp;</strong>v&agrave;o tuỳ chọn&nbsp;<strong><em>3D TOUCH ACTION</em></strong>&nbsp;-&gt; chọn&nbsp;<strong><em>Lock Screen. Xong!</em></strong></li>\n</ul>\n<p><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Từ giờ bạn đ&atilde; c&oacute; thể ấn 1 lực l&ecirc;n n&uacute;t Home ảo để kho&aacute; m&agrave;n h&igrave;nh, qu&aacute; nhanh, qu&aacute; đ&atilde; lu&ocirc;n phải h&ocirc;ng?</span><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /></p>\n<div style="margin: 0px; padding: 0px; color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px; text-align: center;"><img class="bbCodeImage LbImage" style="border: 0px; max-width: 100%;" src="https://tinhte.vn/store/2016/11/3913127_3912849_IMG_1648.jpg" alt="3912849_IMG_1648.jpg" />​</div>\n<p><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Thật ra mẹo n&agrave;y cũng kh&ocirc;ng c&oacute; g&igrave; cao si&ecirc;u hay phức tạp, chẳng qua ch&uacute;ng ta kh&ocirc;ng để &yacute; m&agrave; th&ocirc;i. Hi vọng với mẹo nhỏ n&agrave;y c&aacute;c bạn sẽ cảm thấy tiện dụng v&agrave; thoải m&aacute;i hơn khi x&agrave;i n&uacute;t home ảo, cũng như giảm lo lắng về việc hao m&ograve;n n&uacute;t home theo thời gian.</span><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">V&agrave; c&oacute; một v&agrave;i người bạn n&oacute;i với m&igrave;nh 3D touch phế qu&aacute; kh&ocirc;ng gi&uacute;p &iacute;ch g&igrave; được nhiều th&igrave; m&igrave;nh nghĩ hẵn đ&oacute; l&agrave; một &yacute; kiến hơi chủ quan v&igrave; 3D touch thay đổi ho&agrave;n to&agrave;n c&aacute;i c&aacute;ch m&igrave;nh sử dụng điện thoại!</span><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">V&agrave; đ&acirc;y l&agrave; clip sau khi ho&agrave;n th&agrave;nh xong c&aacute;c bước</span><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><iframe style="max-width: 100%; color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" src="https://www.youtube.com/embed/rfZYYtYM1Sk?wmode=opaque" width="800" height="450" frameborder="0" allowfullscreen=""></iframe><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Mong rằng t&iacute; kinh nghiệm n&agrave;y c&oacute; thể gi&uacute;p &iacute;ch cho c&aacute;c bạn đặc biệt l&agrave; c&aacute;c bạn sử dụng iPhone 6s về sau&nbsp;</span><img class="mceSmilieSprite mceSmilie1" style="border: 0px; vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; width: 18px; height: 18px; background-image: url(''styles/default/xenforo/xenforo-smilies-sprite.png''); background-position: 0px 0px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" title="Smile :)" src="https://tinhte.vn/styles/default/xenforo/clear.png" alt=":)" /><br style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;" /><span style="color: #141414; font-family: Helvetica, Arial, sans-serif; font-size: 14.6667px;">Xin c&aacute;m ơn!</span></p>', 'Thu Nov 17 2016 20:10:25 GMT+0700 (SE Asia Standard Time)', 'https://tinhte.vn/store/2016/11/3913126_3912840_IMG_1647.jpg');

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
(1, 'Samsung', '0123456789', 'Khu công nghệ cao TPHCM', 'Nhóm 1', 'samsung@samsung.com');

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
(1, 'Nhóm 1', ''),
(2, 'Nhóm 2', 'Ahii');

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
(1, 'dsa', 'sad', 'sad', 'dsa', 'Nhom 1', NULL, 'sad', 123, 321, 132, NULL),
(2, 'das', 'sad', 'asd', 'asd', 'Nhom 1', NULL, 'ads', 123, 321, 123, NULL),
(3, 'as', 'sadsa', 'sADAS', 'A', 'Nhom 1', NULL, 'sadsa', 123, 312, 312, NULL),
(4, 'asfd 123', 'sdfa', 'sdfa', 'fdsa', 'Group 1', NULL, 'sdfa', 132, 321, 312, NULL),
(5, 'qew', 'qwe', 'qew', 'qwe', 'Group 1', NULL, 'eqw', 312, 312, 132, NULL),
(6, 'sadasd', 'asd', 'sad', 'sadd', 'Nhom 1', NULL, 'sadsad', 321, 123, 123, NULL),
(7, 'Sản phẩm 1', 'Cái', 'Samsung', 'SamsungVN', 'Group 1', NULL, '', 10000, 12000, 10, NULL),
(8, 'LG G2', 'Cai', 'LG', 'LG VN', 'Nhom 1', NULL, 'LG G2', 50000, 60000, 10, NULL),
(9, 'iphone', '123', 'Apple', 'Khong co', 'Nhom 1', NULL, 'ahihihiasd', 123, 123, 123, NULL),
(10, 'adssad', 'sadsad', 'sad', 'sad', 'Nhom 1', NULL, 'asdsad', 123, 123, 123, NULL),
(11, 'sad', 'asd', 'sad', 'asd', 'Nhom 1', NULL, 'sdasad', 123, 123, 123, NULL),
(14, 'LG G5', 'Cái', 'LG', 'Suplier 1', 'Group 1', NULL, 'Đây là ghi chú', 1500000, 200000, 10, NULL);

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
(1, '1235Inch Full HD', 'áda', 'ád', 'ádas', 'ádsad', 'adsads', 'ádsad', 'ádasd', 'ádads', 'ádad', '', 'adqw13212'),
(2, 'asd', 'sadads', 'sad', 'sad', 'sda', 'sadads', 'sad', 'sad', 'sad', 'ads', '', 'sad'),
(3, 'dsasa', 'sad', 'das', 'ads', 'das', 'ads', 'sadsad', 'sad', 'sad', 'ads', '', 'asddas'),
(4, 'sda', 'das', 'asd', 'sad', 'sad', 'dsa', 'asd', 'sadsad', 'ads', 'asd', 'iphone.jpg', 'asd'),
(5, 'asd', 'das', 'dsa', 'das', 'sad', 'sadsad', 'das', 'sda', 'sad', 'sad', 'user1.png', 'asdsadsadsad'),
(6, 'fd123', 'fsaddf', 'dfsa', 'asdf', 'asfdsa', 'fd', 'fsadfsad', 'fasd', 'sadf', 'fsad', 'galaxynote7.jpg', 'fasd'),
(7, 'das', 'das', 'dsa', 'sda', 'asd', 'sad', 'sad', 'sda', 'dsa', 'sda', 'galaxynote7.jpg', 'sadsda'),
(8, 'ads', 'asdsad', 'adsd', 'sad', 'dasd', 'das', 'ads', 'dsa', 'sad', 'dsa', 'user1.png', 'sad'),
(9, 'sda', 'das', 'asd', 'asd', 'sad', 'sad', 'sad', 'dsa', 'asd', 'sda', 'iphone.jpg', 'ads'),
(10, 'ads', 'asd', 'sad', 'sad', 'das', 'das', 'sad', 'dsa', 'asd', 'dsa', 'iphone.jpg', 'sad'),
(11, 'dsad', 'asdsad', 'sad', 'sad', 'das', 'sad', 'sad', 'ads', 'sad', 'ads', '', 'ads');

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
(1, 'Nhom 1', 'Ahihi'),
(2, 'Group 1', 'This is group1'),
(3, 'Nhóm 2', 'Tiếng việt');

-- --------------------------------------------------------

--
-- Table structure for table `receiptandpayment`
--

CREATE TABLE `receiptandpayment` (
  `billid` int(10) NOT NULL,
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
(1, 'Thu', ' 1234', ' asd', 12321, ' asdas', ' dasd', '2016-11-03'),
(2, 'Thu', 'Tài 2', ' sadsadsa', 132123, ' dsadsadsad', ' adsasdsad', '2016-09-28');

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
(1, 'Nhà cung cấp X', ' 0123456789', ' 123456789', 'Nhóm 2', ' ko co dau'),
(2, 'Công ty 1', '0123456789', 'Bên hông chợ lớn', 'Nhom1', 'heocon91095@gmail.com'),
(3, 'Công ty 2 ', ' 0123456789', 'Ahihi', 'Nhom1', ' mail@mail.com.vn'),
(6, ' Samsung ', '123213', ' sadsa', NULL, ' 123213213'),
(7, ' LG', ' 0123456789', ' Không biết không biết, không không không biết', NULL, 'heocon@conheo.com'),
(8, ' Samsung ', '123213', ' sadsa', 'Nhóm 2', ' 123213213');

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
(1, 'Nhom1', 'Ahihi'),
(2, 'Nhóm 2', 'Ai mà biết');

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
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `wid` int(11) NOT NULL,
  `supilerid` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
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
(5, '2', 30000, 14880, '2016-11-08', 'admin', 'Đã thanh toán', 'adasda', 0, 15762),
(6, '3', 10000, 13134, '2016-11-09', 'admin', 'Đã thanh toán', '123456879', 0, 0);

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
(3, 'asd56', 'das', 1, 321, 321),
(3, 'asd789', 'as', 1, 312, 312),
(3, 'asdf', 'asfd', 5, 321, 1605),
(3, 'SP002', 'LG', 1, 60000, 60000),
(5, 'asd45', 'dsa', 7, 321, 2247),
(5, 'asd56', 'das', 1, 321, 321),
(5, 'asd789', 'as', 1, 312, 312),
(5, 'SP001', 'S?n', 1, 12000, 12000),
(6, 'asd56', 'das', 1, 321, 321),
(6, 'asdf', 'asfd', 1, 321, 321),
(6, 'sad', 'sadasd', 4, 123, 492),
(6, 'SP001', 'S?n', 1, 12000, 12000);

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
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customergroup`
--
ALTER TABLE `customergroup`
  MODIFY `cgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `infoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `producerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `producergroup`
--
ALTER TABLE `producergroup`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `productgroup`
--
ALTER TABLE `productgroup`
  MODIFY `pgroupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `receiptandpayment`
--
ALTER TABLE `receiptandpayment`
  MODIFY `billid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `suplier`
--
ALTER TABLE `suplier`
  MODIFY `suplierid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
