-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 28, 2019 at 11:17 PM
-- Server version: 8.0.14
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MeterSplosh`
--

-- --------------------------------------------------------

--
-- Table structure for table `BodyCorporates`
--

CREATE TABLE `BodyCorporates` (
  `BuildingID` int(11) NOT NULL,
  `MunicipalityID` int(11) NOT NULL,
  `BankAccountInfo` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Buildings`
--

CREATE TABLE `Buildings` (
  `BuildingID` int(11) NOT NULL,
  `BodyCorporateID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `BuildingCommonPerc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Meters`
--

CREATE TABLE `Meters` (
  `MeterID` varchar(20) NOT NULL,
  `BuildingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Municipalities`
--

CREATE TABLE `Municipalities` (
  `MunicipalityID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `DomesticTarrif` int(11) NOT NULL,
  `CommercialTarrif` int(11) NOT NULL,
  `AgricTarrif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PaymentSystems`
--

CREATE TABLE `PaymentSystems` (
  `PaymentSystemID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tariffs`
--

CREATE TABLE `Tariffs` (
  `TariffID` int(11) NOT NULL,
  `PaymentSystemID` int(11) NOT NULL,
  `MuniciaplityBaseRate` int(11) NOT NULL,
  `PaymentSystemPerc` int(11) NOT NULL,
  `VendingFeePerc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tenants`
--

CREATE TABLE `Tenants` (
  `TenantID` int(11) NOT NULL,
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(100) NOT NULL,
  `MeterID` varchar(30) NOT NULL,
  `Phone` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BodyCorporates`
--
ALTER TABLE `BodyCorporates`
  ADD PRIMARY KEY (`BuildingID`);

--
-- Indexes for table `Buildings`
--
ALTER TABLE `Buildings`
  ADD PRIMARY KEY (`BuildingID`);

--
-- Indexes for table `Meters`
--
ALTER TABLE `Meters`
  ADD PRIMARY KEY (`MeterID`);

--
-- Indexes for table `Municipalities`
--
ALTER TABLE `Municipalities`
  ADD PRIMARY KEY (`MunicipalityID`);

--
-- Indexes for table `PaymentSystems`
--
ALTER TABLE `PaymentSystems`
  ADD PRIMARY KEY (`PaymentSystemID`);

--
-- Indexes for table `Tariffs`
--
ALTER TABLE `Tariffs`
  ADD PRIMARY KEY (`TariffID`);

--
-- Indexes for table `Tenants`
--
ALTER TABLE `Tenants`
  ADD PRIMARY KEY (`TenantID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BodyCorporates`
--
ALTER TABLE `BodyCorporates`
  MODIFY `BuildingID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Buildings`
--
ALTER TABLE `Buildings`
  MODIFY `BuildingID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Municipalities`
--
ALTER TABLE `Municipalities`
  MODIFY `MunicipalityID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PaymentSystems`
--
ALTER TABLE `PaymentSystems`
  MODIFY `PaymentSystemID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Tariffs`
--
ALTER TABLE `Tariffs`
  MODIFY `TariffID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Tenants`
--
ALTER TABLE `Tenants`
  MODIFY `TenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
