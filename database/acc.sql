-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 06:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(30) NOT NULL,
  `a_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `a_name`, `a_password`) VALUES
(1, 'admin', 'adminlogin');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(30) NOT NULL,
  `b_password` varchar(30) NOT NULL,
  `b_email` varchar(50) NOT NULL,
  `b_dob` varchar(15) NOT NULL,
  `b_address` varchar(100) NOT NULL,
  `b_number` varchar(15) NOT NULL,
  `b_gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`b_id`, `b_name`, `b_password`, `b_email`, `b_dob`, `b_address`, `b_number`, `b_gender`) VALUES
(1, 'Saket Gupta', 'saketlogin', 'saket@gmail.com', '12-08-2001', 'Rohini Sector 20', '7845127845', 'Male'),
(2, 'Zaki Ahmed', 'zakilogin', 'zaki@gmail.com', '11-01-2002', 'Tamilnadu', '7894561237', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `f_date` varchar(15) NOT NULL,
  `f_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `s_id`, `b_id`, `f_date`, `f_text`) VALUES
(1, 1, 1, '29-05-2024', 'Good Art'),
(2, 2, 2, '24-05-2024', 'Awesome Art');

-- --------------------------------------------------------

--
-- Table structure for table `painting`
--

CREATE TABLE `painting` (
  `p_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `p_category` varchar(30) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `p_size` varchar(10) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `painting`
--

INSERT INTO `painting` (`p_id`, `s_id`, `p_category`, `p_name`, `p_size`, `p_price`, `p_image`) VALUES
(1, 1, 'Abstract Art', 'Mona Lisa', '8x10', 500, 'Mona Lisa.jpg'),
(2, 2, 'Landscape Art', 'The Last Supper', '10x16', 300, 'The Last Supper.jpg'),
(3, 1, 'Portrait Art', 'The Persistence of Memory', '6x8', 400, 'The Persistence of Memory.jpg'),
(10, 1, 'Still Life', 'Night Owl', '10x10', 700, 'Night Owl.jpg'),
(11, 1, 'Abstract Art', 'Beautiful Jungle', '67x14', 800, 'Beautiful Jungle.jpg'),
(12, 1, 'Modern Art', 'Girl with a Pearl Earring', '8x12', 700, 'Girl with a Pearl Earring.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pt_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `pt_amount` int(11) NOT NULL,
  `pt_mode` varchar(30) NOT NULL,
  `pt_date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pt_id`, `p_id`, `b_id`, `s_id`, `pt_amount`, `pt_mode`, `pt_date`) VALUES
(2, 1, 1, 1, 500, 'Debit Card', '30-05-2024');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(30) NOT NULL,
  `s_password` varchar(50) NOT NULL,
  `s_address` varchar(100) NOT NULL,
  `s_gender` varchar(10) NOT NULL,
  `s_number` varchar(15) NOT NULL,
  `s_email` varchar(50) NOT NULL,
  `s_dob` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`s_id`, `s_name`, `s_password`, `s_address`, `s_gender`, `s_number`, `s_email`, `s_dob`) VALUES
(1, 'Suhail Ahmad', 'suhaillogin', 'Burari', 'Male', '7845128956', 'suhail@gmail.com', '22-09-2001'),
(2, 'Pawan Pal', 'pawanlogin', 'Sant Nagar', 'Male', '7894561272', 'pawan@gmail.com', '05-01-2000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `painting`
--
ALTER TABLE `painting`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pt_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `painting`
--
ALTER TABLE `painting`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
