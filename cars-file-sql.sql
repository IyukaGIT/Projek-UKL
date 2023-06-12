-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 04:09 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `uname`, `pass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_name` varchar(255) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `hire_cost` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_type`, `image`, `hire_cost`, `capacity`, `status`) VALUES
(11, 'Kapal Rawai', 'Hung Jie Wei', 'touch_long_liner_fishing_boat-300gt.webp', 1500000, 100, 'Available'),
(13, 'Kapal Pukat Cincin', 'Mentawai', '20140313-kapal-cincin (1).jpg', 2000000, 100, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_no` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `car_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `mpesa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `fname`, `email`, `id_no`, `phone`, `location`, `gender`, `car_id`, `status`, `mpesa`) VALUES
(2, 'felix kiamba', 'kiambafelix@yahoo.com', 30073147, 705053484, 'nairobi', 'Male', 1, 'Approved', 'GTD45H7H6'),
(3, 'concepter', 'concybogita@gmail.com', 27695131, 707403614, 'kisii', 'Female', 2, 'Approved', 'DJFL870FDK9'),
(4, 'enock bosire', 'enock@gmail.com', 1234567, 717056766, 'narok', 'Male', 2, 'Approved', 'HJHK678X'),
(5, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Male', 0, 'Available', ''),
(6, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Male', 9, 'Approved', ''),
(7, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Male', 9, 'Pending', ''),
(8, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Male', 9, 'Pending', ''),
(9, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Male', 11, 'Pending', ''),
(10, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Select Gender', 11, 'Pending', ''),
(11, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Select Gender', 11, 'Pending', ''),
(12, 'Ihsan Ryu', 'ihsanryu15@gmail.com', 20, 2147483647, 'Surabaya', 'Male', 11, 'Approved', ''),
(13, 'Ihsan Ryu', 'bukaniyuka@gmail.com', 15, 2147483647, 'Sidoarjo', 'Male', 0, 'Available', ''),
(14, 'Ihsan Ryu', 'bukaniyuka@gmail.com', 15, 2147483647, 'Sidoarjo', 'Male', 11, 'Approved', ''),
(15, 'Ihsan Ryu Alkautsar', 'ihsanryu15@gmail.com', 111111, 2147483647, 'Sidoarjo', 'Male', 11, 'Pending', '111111'),
(16, 'Ihsan Ryu A', 'bukaniyuka@gmail.com', 21, 2147483647, 'Sidoarjo', 'Male', 0, 'Available', ''),
(17, 'Ihsan Ryu A', 'bukaniyuka@gmail.com', 21, 2147483647, 'Sidoarjo', 'Male', 11, 'Approved', '');

-- --------------------------------------------------------

--
-- Table structure for table `hire`
--

CREATE TABLE `hire` (
  `hire_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `hire_cost` (`hire_cost`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `hire`
--
ALTER TABLE `hire`
  ADD PRIMARY KEY (`hire_id`),
  ADD UNIQUE KEY `client_id` (`client_id`,`car_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msg_id`),
  ADD UNIQUE KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `hire`
--
ALTER TABLE `hire`
  MODIFY `hire_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hire`
--
ALTER TABLE `hire`
  ADD CONSTRAINT `hire_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `hire_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `hire_ibfk_3` FOREIGN KEY (`hire_id`) REFERENCES `cars` (`hire_cost`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
