-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2022 at 06:28 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orderapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Totalprice` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `User_id`, `Totalprice`, `Status`, `CreatedAt`) VALUES
(23, 1, 100000, 0, '2022-08-30 16:03:24'),
(24, 2, 55555, 0, '2022-08-30 16:04:08'),
(25, 2, 666666666, 1, '2022-08-30 16:26:21'),
(26, 2, 666666666, 0, '2022-08-30 17:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Createdat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `Product_id`, `Quantity`, `Createdat`) VALUES
(31, 23, 1, 10, '2022-08-30 16:03:24'),
(32, 23, 2, 15, '2022-08-30 16:03:24'),
(33, 24, 3, 20, '2022-08-30 16:04:08'),
(34, 24, 4, 1000, '2022-08-30 16:04:08'),
(35, 25, 1, 15, '2022-08-30 16:26:21'),
(36, 25, 4, 551, '2022-08-30 16:26:21'),
(37, 26, 1, 15, '2022-08-30 17:43:02'),
(38, 26, 4, 551, '2022-08-30 17:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `Price`, `quantity`) VALUES
(1, 'labtop hp ', 5000, 100),
(2, 'labtop dell ', 8000, 200),
(3, 'mobile samsung ', 4500, 400),
(4, 'Iphone', 13000, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Firstname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Middlename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Lastname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(255) CHARACTER SET utf32 NOT NULL,
  `Phonenumber` int(11) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `Token` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Firstname`, `Middlename`, `Lastname`, `Email`, `Password`, `Phonenumber`, `CreatedAt`, `Token`) VALUES
(1, 'kirols', 'eid', 'shohdy', 'kirolseid5555@gmail.com', '$2b$07$x9T0nQdBclMrB2/L5SNUH.OPdgIX.lipX2J3zRP5F5OOm2Eekd5MS', 1279448849, '2022-08-30 14:36:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imtpcm9sc2VpZDU1NTVAZ21haWwuY29tIiwiaWF0IjoxNjYxODYzMDA1fQ.2zOKVosgy_vwxAkaZ9El1B5AkQ34GBrdQH1HHt4Kzhw'),
(2, 'kirols', 'eid', 'shohdy', 'kirolseid@gmail.com', '$2b$07$lyUv.lOZctKXuc.b20/VKupa36etaLB5ahi/Q9sUY2lhUczo6i1mO', 1279448849, '2022-08-30 14:36:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imtpcm9sc2VpZEBnbWFpbC5jb20iLCJpYXQiOjE2NjE4NjMwMTN9.AdfFwx3EqvVeienYW1ZYrgKzia9ft8fXpdQKsDkify0');

-- --------------------------------------------------------

--
-- Table structure for table `userorders`
--

CREATE TABLE `userorders` (
  `id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Createdat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userorders`
--

INSERT INTO `userorders` (`id`, `Order_id`, `User_id`, `Createdat`) VALUES
(21, 23, 1, '2022-08-30 16:03:24'),
(22, 24, 2, '2022-08-30 16:04:08'),
(23, 25, 2, '2022-08-30 16:26:21'),
(24, 26, 2, '2022-08-30 17:43:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`User_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_Id` (`Product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userorders`
--
ALTER TABLE `userorders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_id` (`Order_id`),
  ADD KEY `User_id` (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userorders`
--
ALTER TABLE `userorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `product_Id` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userorders`
--
ALTER TABLE `userorders`
  ADD CONSTRAINT `userorders_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userorders_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
