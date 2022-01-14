-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2022 at 06:31 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `love`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicationform`
--

CREATE TABLE `applicationform` (
  `id` int(11) NOT NULL,
  `paddress` varchar(100) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `civilstat` varchar(50) NOT NULL,
  `licenseclass` varchar(50) NOT NULL,
  `drivingskillaquired` varchar(10) NOT NULL,
  `highesteducational` varchar(50) NOT NULL,
  `bloodtype` varchar(50) NOT NULL,
  `organdonor` varchar(50) NOT NULL,
  `eyecolor` varchar(50) NOT NULL,
  `typeofapplication` varchar(50) NOT NULL,
  `fathername` varchar(50) NOT NULL,
  `mothername` varchar(50) NOT NULL,
  `spousename` varchar(50) NOT NULL,
  `emercontact` varchar(50) NOT NULL,
  `vehiclecat` varchar(50) NOT NULL,
  `conditions` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `mname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applicationform`
--

INSERT INTO `applicationform` (`id`, `paddress`, `nationality`, `sex`, `birthdate`, `height`, `weight`, `civilstat`, `licenseclass`, `drivingskillaquired`, `highesteducational`, `bloodtype`, `organdonor`, `eyecolor`, `typeofapplication`, `fathername`, `mothername`, `spousename`, `emercontact`, `vehiclecat`, `conditions`, `userid`, `status`, `mname`) VALUES
(14, 'asd', 'asd', 'asd', '2022-01-13', '12', '123', 'ads', 'option1', 'asd', 'postgraduate', 'asd', 'asdasd', 'asd', 'asd', 'asd', 'asd', 'asd', 'as', 'asd', 'WEAR CORRECTIVE LENSES', 1, 'approve', 'asd'),
(15, 'asd', 'asd', 'asd', '2022-01-12', '123', '123', 'asd', 'option2', 'asd', 'college', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'sda', 'asd', 'asd', 'DAYLIGHT DRIVING ONLY', 18, 'approve', 'asd'),
(16, 'asdasd', 'asdasd', 'asdasd', '2022-01-20', '129', '213', 'sd', 'option1', '123', 'elementary', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'DRIVE ONLY W/ SPECIAL EQUIPMENT FOR UPPER LIMBS/LO', 19, 'approve', 'asdasd'),
(17, 'asd', 'asd', 'asd', '2022-01-27', '123', '23', 'sd', 'option1', 'sd', 'postgraduate', 'asd', 'asd', 'asd', 'ad', 'asd', 'asd', 'asd', 'asd', 'asd', 'DRIVE ONLY W/ SPECIAL EQUIPMENT FOR UPPER LIMBS/LO', 21, 'decline', 'asd'),
(18, 'Norway', 'Swedish', 'M', '2007-06-13', '170', '67', 'Married', 'option3', 'None', 'college', 'AB', 'No', 'Blue', 'None', 'Ragnar', 'Lothbrok', 'Lagartha', '09261549119', 'Motor L1', 'WEAR CORRECTIVE LENSES', 22, 'pending', 'L.'),
(19, 'Panabo City', 'Filipino', 'female', '2000-04-08', '167', '67', 'Single', 'option1', 'None', 'college', 'AB', 'None', 'black', 'none', 'Joseph Cedeno', 'Jocelyn Cedeno', 'NA', '09123457679', 'Motor L1', 'WEAR CORRECTIVE LENSES', 24, 'approve', 'L.'),
(20, 'asdasd', 'asdasd', 'asdasd', '2022-01-26', '123', '123', 'asdc', 'option1', 'asdas', 'postgraduate', 'asdasd', 'asdasd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asdasda', 'WEAR CORRECTIVE LENSES', 25, 'approve', 'asdad');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `contactno` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fname`, `lname`, `contactno`, `email`, `role`) VALUES
(1, 'admin', 'admin1', 'Joseph', 'Cedeno', 2147483647, 'jcc@ss.cc', 'guest'),
(3, 'Joseph1', 'Joseph1', 'Joseph1', 'Joseph1', 92615, 'sdsd@ss.cc', 'guest'),
(4, 'asd', 'asdasd', 'undefined', 'undefined', 0, 'undefined', 'guest'),
(5, 'admin1', 'admin1', 'asd', 'asd', 123123, 'aasd@ssc.cc', 'admin'),
(6, 'Roy', '00000000', 'roy', 'roy', 9123456, 'ss@cc.sc', 'guest'),
(7, 'rOY1', 'rOY1', 'rOY1', 'rOY1', 123, 'ASD@SSC.CC', 'guest'),
(8, 'asd', 'asd', 'asda', 'asdasd', 23, 'asd@sc.cc', 'guest'),
(9, 'asd', 'asd', 'asda', 'asdasd', 23, 'asd@sc.cc', 'guest'),
(10, 'asd', 'asd', 'asd', 'asd', 123, 'asd@ss.cc', 'guest'),
(11, 'asdasd', 'asdasd', 'rows1', 'rows1', 123, 'sd@c.scc', 'guest'),
(12, 'asda', 'asd', 'asd', 'asd', 213, 'ss@ss.cc', 'guest'),
(13, 'asdasd', 'asdasd', 'asdasd', 'asdasd', 13, 'asd@ss.c', 'guest'),
(14, 'asdaa', 'asdaa', 'asdaa', 'asdaa', 123, 'asd@ss.c', 'guest'),
(15, 'asdasd', 'asdasd', 'asdasd', 'asdasd', 123, 'asd@ss.cc', 'guest'),
(16, 'asd', 'asd', 'asd', 'asd', 123, 'asd@ss.cc', 'guest'),
(17, 'asdasd', 'asdasd', 'asdasd', 'asdasd', 123, 'asdasd@ss.cc', 'guest'),
(18, 'Arya Stark', 'Arya Stark', 'Arya', 'Stark', 123123, 'pppp@ss.cc', 'guest'),
(19, 'Sansa Stark', 'Sansa Stark', 'Sansa', 'Stark', 2131, 'asd@ss.cc', 'guest'),
(20, 'Whilliam', '00000000', 'Whilliam', 'Gilbert', 2147483647, 'josephgcedeno@gmail.com', 'guest'),
(21, 'Jon Snow', 'Jon Snow', 'Jon', 'Snow', 2147483647, 'sdsd@ss.cc', 'guest'),
(22, 'Ragnar Lothbrok', 'Ragnar Lothbrok', 'Ragnar', 'Lothbrok', 2147483647, 'ragnar@gmail.com', 'guest'),
(23, 'Bjorn Lothbrok', 'Bjorn Lothbrok', 'Bjorn', 'Lothbrok', 2147483647, 'Bjorn@uic.edu.ph', 'guest'),
(24, 'Mika244', '00000000', 'Mika', 'Meka', 2147483647, 'mika@gmail.com', 'guest'),
(25, 'Andrew Manteza', 'Andrew', 'Andrew', 'Andrew', 2147483647, 'asdasd@ss.cc', 'guest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicationform`
--
ALTER TABLE `applicationform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicationform`
--
ALTER TABLE `applicationform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
