-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 08:19 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toilet`
--
CREATE DATABASE IF NOT EXISTS `toilet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `toilet`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL,
  `comment` text NOT NULL,
  `placeId` varchar(100) NOT NULL,
  `status` enum('ACTIVE','DELETE','','') NOT NULL DEFAULT 'ACTIVE',
  `userId` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `imageId` int(11) NOT NULL,
  `imagePath` text NOT NULL,
  `imageDescription` text NOT NULL,
  `placeId` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `status` enum('UPLOADED','ACTIVE','DELETE','') NOT NULL DEFAULT 'UPLOADED',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `placeId` int(11) NOT NULL,
  `placeName` varchar(250) NOT NULL,
  `placeLat` float NOT NULL,
  `placeLng` float NOT NULL,
  `charge` int(11) NOT NULL,
  `isDisableCan` tinyint(1) NOT NULL,
  `openHours` varchar(10) NOT NULL,
  `placeType` varchar(250) NOT NULL,
  `gender` enum('MALE','FEMALE','BOTH','DUMP') NOT NULL,
  `isParking` tinyint(1) NOT NULL,
  `isHotWater` tinyint(1) NOT NULL,
  `isDrinkingWater` tinyint(1) NOT NULL,
  `isBabyChange` tinyint(1) NOT NULL,
  `isShower` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('ACTIVE','DEACTIVE','DELETE','NEW') NOT NULL DEFAULT 'NEW'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `placetype`
--

CREATE TABLE `placetype` (
  `placeTypeId` int(11) NOT NULL,
  `placeType` varchar(250) NOT NULL,
  `status` enum('ACTIVE','DELETE','','') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `ratingId` int(11) NOT NULL,
  `placeId` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `status` enum('ACTIVE','DELETE','','') NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` enum('ACTIVE','DEACTIVE','DELETE','') NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imageId`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`placeId`);

--
-- Indexes for table `placetype`
--
ALTER TABLE `placetype`
  ADD PRIMARY KEY (`placeTypeId`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `placetype`
--
ALTER TABLE `placetype`
  MODIFY `placeTypeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
