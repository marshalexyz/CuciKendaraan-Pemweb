-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 06:26 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cucikendaraan`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_name` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `vehicle_id` int(30) NOT NULL,
  `schedule` date NOT NULL,
  `total_amount` float(15,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 = Pending,\r\n1 = Confirmed,\r\n2 = Arrived,\r\n3 = On-process,\r\n4 = Done',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`id`, `code`, `client_name`, `contact`, `email`, `address`, `vehicle_id`, `schedule`, `total_amount`, `status`, `date_created`, `date_updated`) VALUES
(3, '20220400001', 'Mark Cooper', '09123456789', 'mcooper@sample.com', 'Sample Address Only', 1, '2022-04-13', 340.00, 2, '2022-04-13 13:43:22', '2022-04-13 14:45:47'),
(4, '20220400002', 'John Smith', '09789456321', 'jsmith@sample.com', 'Sample Address 2', 1, '2022-04-15', 300.00, 3, '2022-04-13 13:44:27', '2022-04-13 14:38:09'),
(6, '20230500001', 'tes', '081882982', 'muhamad@gmail.com', 'kelapa gading', 3, '0000-00-00', 185.00, 1, '2023-05-11 12:15:22', '2023-05-11 12:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `booking_services`
--

CREATE TABLE `booking_services` (
  `booking_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `price` float(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_services`
--

INSERT INTO `booking_services` (`booking_id`, `service_id`, `price`) VALUES
(1, 2, 40.00),
(1, 3, 50.00),
(1, 1, 150.00),
(1, 4, 100.00),
(2, 2, 40.00),
(2, 3, 50.00),
(2, 1, 150.00),
(2, 4, 100.00),
(3, 2, 40.00),
(3, 3, 50.00),
(3, 1, 150.00),
(3, 4, 100.00),
(4, 3, 50.00),
(4, 1, 150.00),
(4, 4, 100.00),
(5, 2, 100.00),
(5, 3, 100.00),
(5, 1, 200.00),
(5, 4, 200.00),
(6, 2, 30.00),
(6, 3, 20.00),
(6, 1, 75.00),
(6, 4, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `service_id` int(30) NOT NULL,
  `vehicle_id` int(30) NOT NULL,
  `price` float(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`service_id`, `vehicle_id`, `price`) VALUES
(1, 5, 300.00),
(1, 2, 50.00),
(1, 3, 75.00),
(1, 1, 150.00),
(1, 4, 200.00),
(2, 5, 150.00),
(2, 2, 20.00),
(2, 3, 30.00),
(2, 1, 40.00),
(2, 4, 100.00),
(4, 5, 300.00),
(4, 2, 50.00),
(4, 3, 60.00),
(4, 1, 100.00),
(4, 4, 200.00),
(3, 5, 150.00),
(3, 2, 20.00),
(3, 3, 20.00),
(3, 1, 50.00),
(3, 4, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Cuci kendaraan', 'Kami menyediakan layanan cuci kendaraan profesional yang berkualitas tinggi, dengan menggunakan produk pembersih terbaik dan ramah lingkungan. Kami memiliki tim ahli yang berpengalaman dalam bidang perawatan kendaraan, sehingga Anda dapat mempercayakan kendaraan kesayangan Anda kepada kami dengan tenang.', 1, 0, '2022-04-13 09:40:19', '2023-05-18 17:32:34'),
(2, 'Mengkilatkan Ban', 'Kami menyediakan layanan mengkilatkan ban yang dapat membuat kendaraan Anda terlihat lebih bersih dan berkilau. Ban adalah salah satu bagian penting dari kendaraan yang sering diabaikan dalam perawatan, namun memiliki dampak besar pada kinerja dan tampilan kendaraan Anda.', 1, 0, '2022-04-13 09:40:44', '2023-05-18 17:33:15'),
(3, 'Vacuum', 'Kami menyediakan layanan vacuum kendaraan yang dapat membantu menjaga kebersihan dan kenyamanan di dalam kendaraan Anda. Debu, kotoran, dan debu dapat menumpuk di dalam kendaraan Anda dan menyebabkan bau yang tidak sedap. Layanan vacuum kami dapat membantu menghilangkan kotoran dan debu pada bagian dalam kendaraan Anda, sehingga kendaraan Anda terlihat bersih dan wangi di dalam.', 1, 0, '2022-04-13 09:40:58', '2023-05-18 17:34:37'),
(4, 'Shampoing', 'Kami menyediakan layanan shampoing kendaraan yang dapat membantu menjaga tampilan kendaraan Anda tetap bersih dan terawat. Kendaraan sering terkena kotoran, debu, dan noda lainnya yang dapat membuat tampilannya kusam dan kotor. Layanan shampoing kami dapat membantu menghilangkan kotoran dan noda pada kendaraan Anda, sehingga tampilannya kembali bersih dan terawat.', 1, 0, '2022-04-13 09:41:15', '2023-05-18 17:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Aplikasi Sistem Cuci Mobil online'),
(6, 'short_name', 'Cuci Kendaraan'),
(11, 'logo', 'uploads/logo.png?v=1649834631'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Haikal', 'Alwan', 'alwan', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2023-05-17 17:05:13'),
(6, 'Agif', 'Ghifari', 'agif', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/avatars/6.png?v=1684315078', NULL, 1, '2023-05-17 16:17:58', '2023-05-17 17:06:07'),
(7, 'Bob', 'Byan', 'bobbyan', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/avatars/7.png?v=1684317936', NULL, 1, '2023-05-17 17:05:36', '2023-05-17 17:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_list`
--

CREATE TABLE `vehicle_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_list`
--

INSERT INTO `vehicle_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Mobil', 1, 0, '2022-04-13 09:22:20', '2023-05-11 13:05:15'),
(2, 'Sepeda Motor', 1, 0, '2022-04-13 09:22:53', '2023-05-11 13:05:05'),
(3, 'Bajaj', 1, 0, '2022-04-13 09:23:17', '2023-05-17 16:18:15'),
(4, 'Kendaraan Roda 6', 1, 0, '2022-04-13 09:23:25', '2023-05-17 16:18:48'),
(5, 'Kendaraan Roda 10', 1, 0, '2022-04-13 09:23:36', '2023-05-17 16:18:35'),
(6, 'Minivan', 1, 0, '2023-05-17 16:19:15', '2023-05-17 16:19:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `booking_services`
--
ALTER TABLE `booking_services`
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD KEY `service_id` (`service_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_list`
--
ALTER TABLE `vehicle_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vehicle_list`
--
ALTER TABLE `vehicle_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_vehicle_id_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `price_list`
--
ALTER TABLE `price_list`
  ADD CONSTRAINT `price_service_id_fk` FOREIGN KEY (`service_id`) REFERENCES `service_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `price_vehicle_id_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
