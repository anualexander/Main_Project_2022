-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 06:54 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppe`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `billingAddress` varchar(255) DEFAULT NULL,
  `biilingCity` varchar(150) DEFAULT NULL,
  `billingState` varchar(100) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `billingCountry` varchar(100) DEFAULT NULL,
  `shippingAddress` varchar(300) DEFAULT NULL,
  `shippingCity` varchar(150) DEFAULT NULL,
  `shippingState` varchar(100) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `shippingCountry` varchar(100) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userId`, `billingAddress`, `biilingCity`, `billingState`, `billingPincode`, `billingCountry`, `shippingAddress`, `shippingCity`, `shippingState`, `shippingPincode`, `shippingCountry`, `postingDate`) VALUES
(1, 1, 'A 456 ABC Street', 'Noida', 'Uttar Pradesh', 201301, 'India', 'A 456 ABC Street', 'Noida', 'Uttar Pradesh', 201301, 'India', '2022-01-29 11:57:11'),
(2, 1, 'D 32 Bihari Puram Bye Pass Road', 'Aligarh', 'Uttar Pradesh', 202001, 'India', 'D 32 Bihari Puram Bye Pass Road', 'Aligarh', 'Uttar Pradesh', 202001, 'India', '2022-01-29 12:01:03'),
(3, 4, 'H 4556 XYZ Aparment', 'Ghaziabad', 'UP', 201017, 'India', 'H 4556 XYZ Aparment', 'Ghaziabad', 'UP', 201017, 'India', '2022-03-05 07:43:52'),
(4, 7, 'H 456 XYZ Apartment', 'Ghaziabad', 'UP', 201017, 'India', 'H 456 XYZ Apartment', 'Ghaziabad', 'UP', 201017, 'India', '2022-03-06 12:49:36'),
(5, 8, 'Mulackakunnel House Karukachal Post Office', 'Karukachal', 'Kerala', 686540, 'India', 'Mulackakunnel House Karukachal Post Office', 'Karukachal', 'Kerala', 686540, 'India', '2022-05-06 13:11:45'),
(6, 11, 'Mulackakunnel House Karukachal Post Office', 'Karukachal', 'Kerala', 686540, 'India', 'Mulackakunnel House Karukachal Post Office', 'Karukachal', 'Kerala', 686540, 'India', '2022-05-09 03:16:51'),
(7, 10, 'Mulackakunnel House Karukachal Post Office', 'Karukachal', 'Kerala', 686540, 'India', 'Mulackakunnel House Karukachal Post Office', 'Karukachal', 'Kerala', 686540, 'India', '2022-05-09 04:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productQty` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userID`, `productId`, `productQty`, `postingDate`) VALUES
(28, 10, 29, 1, '2022-05-19 01:36:38'),
(29, 10, 29, 1, '2022-05-19 01:36:51'),
(30, 10, 36, 5, '2022-05-20 01:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`, `createdBy`) VALUES
(13, 'Mens Category', 'Mens Category', '2022-05-06 13:58:29', NULL, 1),
(14, 'Womens Category', 'Womens Category', '2022-05-06 14:21:33', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `txnType` varchar(200) DEFAULT NULL,
  `txnNumber` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(120) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetails`
--

CREATE TABLE `ordersdetails` (
  `id` int(11) NOT NULL,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `actionBy` int(3) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `canceledBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productPriceBeforeDiscount` decimal(10,2) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` decimal(10,2) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `addedBy` int(11) DEFAULT NULL,
  `lastUpdatedBy` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `addedBy`, `lastUpdatedBy`) VALUES
(30, 13, 15, 'Men Regular Fit Striped Spread Collar Casual Shirt', 'Mast & Harbour ', '752.00', '1599.00', '- Pack of:1\r\n- Style Code: 11291624\r\n- Secondary Color: Blue\r\n- Fit: Regular\r\n- Fabric: Pure Cotton\r\n- Sleeve: Half Sleeve', 'e03a7dc426b10894379f9f25d789fe5cwebp', '3b5405953eadaf92fe6a516d36cc3481webp', '805c18e913dfb19a592fe5c5d9a6a001webp', '0.00', 'In Stock', '2022-05-19 03:25:31', NULL, 1, NULL),
(31, 13, 15, 'Men Slim Fit Checkered Casual Shirt', 'ASIAN & FITCH ', '407.00', '1287.00', '- Pack of 1\r\n- Style Code FTHCHKNEW0911\r\n- Fit Slim\r\n- Fabric Pure Cotton\r\n- Sleeve Full Sleeve\r\n- Pattern Checkered', 'fde1843a8bb3cc45a1a43ccae2da7b84webp', '6da68afe74658fb99c9933148bf5a0efwebp', '9818ba689e8370b7bd2391d314c243a2webp', '0.00', 'In Stock', '2022-05-19 03:29:01', NULL, 1, NULL),
(32, 13, 15, 'Men Regular Fit Solid Casual Shirt', 'Roadster ', '522.00', '1799.00', '- Pack of 1\r\n- Style Code 8499827\r\n- Fit Regular\r\n- Fabric Linen Blend\r\n- Sleeve Full Sleeve', '5d57bcc55cbd295840ddc74905250dabwebp', 'f651d3d9de9c11967be1e501816dd1d7webp', 'ce3afb649a3c39a1ccbecadeebfd6ba4webp', '0.00', 'In Stock', '2022-05-19 03:32:35', NULL, 1, NULL),
(33, 13, 15, 'Men Slim Fit Checkered Spread Collar Casual Shirt', 'Surhi ', '399.00', '1999.00', '- Pack of 1\r\n- Style Code PK19SH09G\r\n- Fit Slim\r\n- Fabric Pure Cotton\r\n- Sleeve Full Sleeve\r\n- Pattern Checkered', '6d9deefc19e2a573b4756fc7cc773020webp', 'e730b954027053c29b40be1e6b2cdc7dwebp', '27b6330080d16f6c4190acc8bb33c978webp', '0.00', 'In Stock', '2022-05-19 03:36:34', NULL, 1, NULL),
(34, 13, 17, 'Regular Fit Men Blue Pure Cotton Trousers', 'CLASSIO FASHION ', '425.00', '1299.00', '- Fit Regular Fit\r\n- Occasion Formal\r\n- Color Blue\r\n- Pack of 1\r\n- Type Formal Trouser\r\n- Suitable For Western Wear', '0612b10d7e9c4633207ffc8a5a412807webp', '38d287c2cc2aecac06828995f5f251cfwebp', '128d2a0eab1bbb7a6113a50100440bf7webp', '0.00', 'Out of Stock', '2022-05-19 03:46:30', NULL, 1, NULL),
(35, 13, 17, 'Slim Fit Men Blue Cotton Blend Trousers', 'Ruf and Tuf ', '999.00', '1999.00', '- Fit Slim Fit\r\n- Occasion Casual\r\n- Color Blue\r\n- Pack of 1\r\n- Type Chinos\r\n- Suitable For Western Wear', '4b2cf95d0ff814aacc3e19443ffd6d8awebp', '07f45d3e31632c3782e2bba0ea50ee5dwebp', '3cf307144afe1084631a9565ac2898dbwebp', '0.00', 'In Stock', '2022-05-19 03:55:15', NULL, 1, NULL),
(36, 13, 17, 'Slim Fit Men Brown Cotton Blend Trousers', 'Wrangler', '943.00', '2195.00', '- Fit Slim Fit\r\n- Occasion Casual\r\n- Color Brown\r\n- Pack of 1\r\n- Type Chinos\r\n- Suitable For Western Wear', 'bf27088c860b02d6ae18babb88d03d3cwebp', '3699bb6b834043a9dfac8136b7a97702webp', '4e52fd60e881d923d8f0a1c648ba2a32webp', '0.00', 'In Stock', '2022-05-19 04:06:45', NULL, 1, NULL),
(37, 13, 17, 'Slim Fit Men Cream Cotton Blend Trousers', 'FUBAR ', '664.00', '1648.00', '- Fit Slim Fit\r\n- Occasion Casual\r\n- Color Cream\r\n- Pack of 1\r\n- Type Casual Trousers\r\n- Suitable For Western Wear', '32d7163ef9f976e5cb609b63c4756197webp', '245b41e2a6a4d5c399f30a533a1b5c57webp', '21d887b47305dea5bf5a2fb20fc598fcwebp', '0.00', 'In Stock', '2022-05-19 04:10:03', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategoryName`, `creationDate`, `updationDate`, `createdBy`) VALUES
(2, 4, 'Led Television', '2017-01-26 16:24:52', '0000-00-00 00:00:00', 1),
(3, 4, 'Television', '2017-01-26 16:29:09', '0000-00-00 00:00:00', 1),
(4, 4, 'Mobiles', '2017-01-30 16:55:48', '0000-00-00 00:00:00', 1),
(5, 4, 'Mobile Accessories', '2017-02-04 04:12:40', '0000-00-00 00:00:00', 1),
(6, 4, 'Laptops', '2017-02-04 04:13:00', '0000-00-00 00:00:00', 1),
(7, 4, 'Computers', '2017-02-04 04:13:27', '0000-00-00 00:00:00', 1),
(8, 3, 'Comics', '2017-02-04 04:13:54', '0000-00-00 00:00:00', 1),
(9, 5, 'Beds', '2017-02-04 04:36:45', '0000-00-00 00:00:00', 1),
(10, 5, 'Sofas', '2017-02-04 04:37:02', '0000-00-00 00:00:00', 1),
(11, 5, 'Dining Tables', '2017-02-04 04:37:51', '0000-00-00 00:00:00', 1),
(12, 6, 'Men Footwears', '2017-03-10 20:12:59', '0000-00-00 00:00:00', 1),
(13, 4, 'Room Heaters', '2022-01-12 07:22:07', '2022-01-13 06:23:22', 1),
(15, 13, 'Shirts', '2022-05-06 14:07:04', '2022-05-06 16:19:39', 1),
(17, 13, 'Pants', '2022-05-06 16:23:17', NULL, 1),
(18, 14, 'Churidars', '2022-05-06 17:15:20', NULL, 1),
(19, 14, 'Sarees', '2022-05-19 03:37:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactNumber` bigint(12) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `username`, `password`, `contactNumber`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 9562691822, '2022-01-24 16:21:18', '2022-05-06 13:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `regDate`, `updationDate`) VALUES
(8, 'Anu Alexander', 'anu@gmail.com', 9562691822, 'e10adc3949ba59abbe56e057f20f883e', '2022-05-06 13:08:40', NULL),
(10, 'Anu Alexander', 'alexander@gmail.com', 9562691822, 'b64f1a77b1b317d347f5cb79332c86d2', '2022-05-07 07:28:42', NULL),
(11, 'Anu ', 'a@gmail.com', 9562691820, '6cf82ee1020caef069e753c67a97a70d', '2022-05-09 03:15:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 1, 14, '2022-01-29 10:11:38'),
(4, 1, 13, '2022-01-29 10:28:44'),
(10, 8, 26, '2022-05-06 17:06:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userrrid` (`userId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uiid` (`userID`),
  ADD KEY `piddd` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidddd` (`userId`),
  ADD KEY `addressid` (`addressId`),
  ADD KEY `orderNumber` (`orderNumber`);

--
-- Indexes for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderidd` (`orderNumber`),
  ADD KEY `useridd` (`userId`),
  ADD KEY `productiddd` (`productId`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderidddddd` (`orderId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catidddd` (`category`),
  ADD KEY `subCategory` (`subCategory`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catid` (`categoryid`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usseridddd` (`userId`),
  ADD KEY `ppiidd` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
