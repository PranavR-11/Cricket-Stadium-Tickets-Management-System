-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 04:47 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricket_tbs`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Favourite_Team` (IN `Team` VARCHAR(10))   SELECT * FROM customer WHERE Fav_team = Team$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Venue` (`City` VARCHAR(20), `Stadium` VARCHAR(20)) RETURNS VARCHAR(40) CHARSET utf8mb4  RETURN CONCAT(City,",", Stadium)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cricket_match`
--

CREATE TABLE `cricket_match` (
  `match_no` int(2) NOT NULL,
  `match_date` date DEFAULT NULL,
  `match_time` time DEFAULT NULL,
  `T1vsT2` varchar(10) DEFAULT NULL,
  `c_id` int(4) DEFAULT NULL,
  `S_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cricket_match`
--

INSERT INTO `cricket_match` (`match_no`, `match_date`, `match_time`, `T1vsT2`, `c_id`, `S_name`) VALUES
(1, '2022-05-12', '17:30:00', 'KKRvsRCB', 1001, 'Eden Gardens'),
(2, '2022-05-14', '18:00:00', 'CSKvsKKR', 1005, 'Chepauk'),
(3, '2022-05-13', '17:30:00', 'MIvsCSK', 1002, 'Wankhede'),
(4, '2022-05-15', '18:00:00', 'RCBvsMI', 1003, 'Chinnaswammy');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(4) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Fav_team` varchar(10) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `t_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `Name`, `Fav_team`, `phone_no`, `t_id`) VALUES
(1001, 'Pranav', 'RCB', '9113202738', 10000001),
(1002, 'Nilesh', 'MI', '7488994332', 10000002),
(1003, 'Nihal', 'RCB', '9606888186', 10000003),
(1005, 'Ram', 'CSK', '7506685898', 10000004);

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `Stadium_name` varchar(20) NOT NULL,
  `Stadium_city` varchar(20) NOT NULL,
  `M_no` int(2) DEFAULT NULL,
  `Price` int(4) NOT NULL,
  `Total_seats` int(11) DEFAULT NULL,
  `Expected_Revenue` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`Stadium_name`, `Stadium_city`, `M_no`, `Price`, `Total_seats`, `Expected_Revenue`) VALUES
('Chepauk', 'Chennai', 2, 1800, 500, 900000),
('Chinnaswammy', 'Bangalore', 4, 2200, 400, 880000),
('Eden Gardens', 'Kolkata', 1, 2000, 800, 1600000),
('Wankhede', 'Mumbai', 3, 2400, 700, 1680000);

--
-- Triggers `stadium`
--
DELIMITER $$
CREATE TRIGGER `Revenue_calc` BEFORE UPDATE ON `stadium` FOR EACH ROW set NEW.Expected_Revenue = NEW.Price * NEW.Total_seats
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Ticket_id` int(8) NOT NULL,
  `t1vst2` varchar(10) NOT NULL,
  `Stadium_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`Date`, `Time`, `Ticket_id`, `t1vst2`, `Stadium_name`) VALUES
('2022-04-20', '22:33:27', 10000001, 'KKRvsRCB', 'Eden Gardens'),
('2022-04-22', '08:48:12', 10000002, 'RCBvsMI', 'Chinnaswammy'),
('2022-04-16', '07:35:02', 10000003, 'RCBvsMI', 'Chinnaswammy'),
('2022-04-30', '13:28:32', 10000004, 'CSKvsKKR', 'Chepauk'),
('2022-04-22', '08:50:33', 10000005, 'MIvsCSK', 'Wankhede');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cricket_match`
--
ALTER TABLE `cricket_match`
  ADD PRIMARY KEY (`match_no`),
  ADD KEY `S_name` (`S_name`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`Stadium_name`),
  ADD KEY `M_no` (`M_no`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_id`),
  ADD KEY `Stadium_name` (`Stadium_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cricket_match`
--
ALTER TABLE `cricket_match`
  ADD CONSTRAINT `cricket_match_ibfk_1` FOREIGN KEY (`S_name`) REFERENCES `stadium` (`Stadium_name`),
  ADD CONSTRAINT `cricket_match_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `ticket` (`Ticket_id`);

--
-- Constraints for table `stadium`
--
ALTER TABLE `stadium`
  ADD CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`M_no`) REFERENCES `cricket_match` (`match_no`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Stadium_name`) REFERENCES `stadium` (`Stadium_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
