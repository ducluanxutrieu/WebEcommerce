-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2019 at 04:37 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `car_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`car_id`, `cat_name`) VALUES
(1, 'cat 1'),
(2, 'cat 2'),
(3, 'cat 3'),
(4, 'cat 4');

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `link_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `link_name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`link_id`, `product_name`, `link_name`) VALUES
(1, 'iphone x 64gb', 'https://www.thegioididong.com/dtdd/iphone-x-64gb'),
(2, 'iphone x 64gb', 'https://fptshop.com.vn/dien-thoai/iphone-x');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_in`
--

CREATE TABLE `inventory_in` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `import_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_in`
--

INSERT INTO `inventory_in` (`inventory_id`, `product_id`, `import_date`, `quantity`) VALUES
(1, 1, '2019-10-03 00:00:00', 2),
(2, 2, '2019-10-03 00:00:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_management`
--

CREATE TABLE `inventory_management` (
  `im_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `in_stock` int(11) NOT NULL,
  `sold_amount` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_management`
--

INSERT INTO `inventory_management` (`im_id`, `inventory_id`, `in_stock`, `sold_amount`, `update_date`, `update_type`) VALUES
(1, 1, 2, 0, '2019-10-03 00:00:00', 'IN'),
(2, 2, 8, 0, '2019-10-03 00:00:00', 'IN'),
(3, 1, 1, 1, '2019-10-04 00:00:00', 'OUT'),
(4, 2, 7, 1, '2019-10-04 00:00:00', 'OUT'),
(5, 2, 6, 2, '2019-10-04 00:00:00', 'OUT'),
(6, 2, 5, 3, '2019-10-04 00:00:00', 'OUT'),
(7, 2, 4, 4, '2019-10-04 00:00:00', 'OUT'),
(8, 2, 3, 5, '2019-10-04 00:00:00', 'OUT');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_out`
--

CREATE TABLE `inventory_out` (
  `io_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `export_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_out`
--

INSERT INTO `inventory_out` (`io_id`, `inventory_id`, `export_date`, `quantity`) VALUES
(1, 1, '2019-10-04 00:00:00', 1),
(2, 2, '2019-10-04 00:00:00', 1),
(3, 2, '2019-10-04 00:00:00', 1),
(4, 2, '2019-10-04 00:00:00', 1),
(5, 2, '2019-10-04 00:00:00', 1),
(6, 2, '2019-10-04 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_perfomance`
--

CREATE TABLE `inventory_perfomance` (
  `ip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `performance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_perfomance`
--

INSERT INTO `inventory_perfomance` (`ip_id`, `product_id`, `from_date`, `to_date`, `performance`) VALUES
(1, 1, '2019-10-03 00:00:00', '2019-10-05 00:00:00', 0.533434),
(30, 1, '2019-10-02 00:00:00', '2019-10-10 00:00:00', 0.500083),
(31, 2, '2019-10-02 00:00:00', '2019-10-10 00:00:00', 0.125036),
(32, 1, '2019-10-02 00:00:00', '2019-10-10 00:00:00', 0.500083),
(33, 2, '2019-10-02 00:00:00', '2019-10-10 00:00:00', 0.125036),
(34, 1, '2019-10-02 00:00:00', '2019-10-10 00:00:00', 0.500083),
(35, 2, '2019-10-02 00:00:00', '2019-10-10 00:00:00', 0.555637),
(37, 2, '2019-10-01 00:00:00', '2019-10-10 00:00:00', 0.625077),
(38, 2, '2019-10-01 00:00:00', '2019-10-10 00:00:00', 0.625077);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `cat_id`) VALUES
(1, 'Product 1', 5.55, 4),
(2, 'Product 2.1', 11, 1),
(3, 'Product 2.2', 11.55, 2),
(4, 'Product 3.1', 9, 4),
(5, 'Product 3.2', 11.1, 4),
(6, 'Product 3.3', 15.11, 4),
(7, 'Product 3.0', 15.11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_analysis`
--

CREATE TABLE `product_analysis` (
  `table_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `visited_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_analysis`
--

INSERT INTO `product_analysis` (`table_id`, `product_id`, `visited_date`) VALUES
(1, 1, '2019-12-22 05:06:12'),
(2, 1, '2019-12-25 01:25:25'),
(3, 2, '2019-12-25 01:25:25'),
(4, 2, '2019-12-25 01:26:25'),
(5, 2, '2019-12-25 01:26:26'),
(6, 2, '2019-12-25 01:27:50'),
(7, 4, '2019-12-25 01:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `rule_id` int(11) NOT NULL,
  `class_or_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `matching_ratio` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`rule_id`, `class_or_id`, `name`, `matching_ratio`) VALUES
(1, 'class', 'area_price', 0),
(2, 'class', 'fs-dtprice', 0),
(3, 'id', '_price_new43', 0),
(4, 'class', 'area_price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rule_dataset`
--

CREATE TABLE `rule_dataset` (
  `table_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `is_visited` int(11) NOT NULL,
  `is_identified_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `inventory_in`
--
ALTER TABLE `inventory_in`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD PRIMARY KEY (`im_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `inventory_out`
--
ALTER TABLE `inventory_out`
  ADD PRIMARY KEY (`io_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `inventory_perfomance`
--
ALTER TABLE `inventory_perfomance`
  ADD PRIMARY KEY (`ip_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `product_analysis`
--
ALTER TABLE `product_analysis`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Indexes for table `rule_dataset`
--
ALTER TABLE `rule_dataset`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `rule_dataset_ibfk_1` (`rule_id`),
  ADD KEY `link_id` (`link_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory_in`
--
ALTER TABLE `inventory_in`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory_management`
--
ALTER TABLE `inventory_management`
  MODIFY `im_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventory_out`
--
ALTER TABLE `inventory_out`
  MODIFY `io_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory_perfomance`
--
ALTER TABLE `inventory_perfomance`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_analysis`
--
ALTER TABLE `product_analysis`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rule_dataset`
--
ALTER TABLE `rule_dataset`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_in`
--
ALTER TABLE `inventory_in`
  ADD CONSTRAINT `inventory_in_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD CONSTRAINT `inventory_management_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_in` (`inventory_id`);

--
-- Constraints for table `inventory_out`
--
ALTER TABLE `inventory_out`
  ADD CONSTRAINT `inventory_out_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_in` (`inventory_id`);

--
-- Constraints for table `inventory_perfomance`
--
ALTER TABLE `inventory_perfomance`
  ADD CONSTRAINT `inventory_perfomance_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`car_id`);

--
-- Constraints for table `product_analysis`
--
ALTER TABLE `product_analysis`
  ADD CONSTRAINT `product_analysis_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `rule_dataset`
--
ALTER TABLE `rule_dataset`
  ADD CONSTRAINT `rule_dataset_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `rules` (`rule_id`),
  ADD CONSTRAINT `rule_dataset_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `dataset` (`link_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
