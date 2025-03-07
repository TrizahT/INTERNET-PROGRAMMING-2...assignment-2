-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2025 at 07:59 PM
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
-- Database: `campaign_feedback`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `feedback` text NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `submission_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `feedback`, `rating`, `submission_date`) VALUES
(1, 'Trizah ', 'Trizahtaiwa@gmail.com', 'highly recommended', 5, '2025-03-06 12:17:16'),
(2, 'Trizah ', 'Trizahtaiwa@gmail.com', 'highly recommended', 5, '2025-03-06 12:20:09'),
(3, 'Trizah ', 'Trizahtaiwa@gmail.com', 'recommendable', 3, '2025-03-06 12:20:51'),
(4, 'yryyy', '9@gmail.com', 'not recommended', 1, '2025-03-06 12:35:11'),
(5, 'rudy pankow', 'rudy9@gmail.com', 'I really think he is a nice leader with \r\n  visible btter leadership skills..i highly recommend her!!', 3, '2025-03-06 12:39:53'),
(6, 'jayj', 'jayj277@gmail.com', 'i suppoort this campaign', 5, '2025-03-06 20:05:03'),
(7, 'mr hello', 'mrhello@gmail.com', 'string communication skills ', 4, '2025-03-06 20:13:45'),
(8, 'jonathan', 'jonathan@gmail.com', 'realistic goals', 5, '2025-03-06 20:19:09'),
(9, 'mark', 'marck@gmail.com', 'like him', 4, '2025-03-06 20:33:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
