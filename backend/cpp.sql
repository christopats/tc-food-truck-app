-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2025 at 01:16 PM
-- Server version: 11.6.2-MariaDB
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpp`
--

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `lon` text NOT NULL,
  `lat` text NOT NULL,
  `is_open` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`_id`, `vendor_id`, `address`, `lon`, `lat`, `is_open`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pendennis Point', '-5.04375', '50.14413', NULL, '2025-02-01 20:18:51', '2025-02-01 22:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `category` text NOT NULL,
  `item_name` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`_id`, `vendor_id`, `category`, `item_name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Coffee', 'Latte', 'Milky', 3, '2025-01-26 00:00:00', '2025-01-26 00:00:00'),
(3, 12, 'Crisps', 'Marmite flavour', 'Yummy', 0.5, '2025-02-01 15:07:50', NULL),
(5, 1, 'Crisps', 'Plain', 'Well Tasty', 0.5, '2025-02-02 12:23:14', '2025-02-02 12:26:08'),
(6, 1, 'Drinks', 'Vodka', 'Well Good', 2.5, '2025-02-02 12:30:07', NULL),
(7, 1, 'Drinks', 'Whisky', 'So Well Good', 2.5, '2025-02-02 12:47:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `opening_times`
--

CREATE TABLE `opening_times` (
  `_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `day` text NOT NULL,
  `open_at` time NOT NULL,
  `closed_at` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `image_url` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `phone` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`_id`, `name`, `email`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Fred Bibble', 'fred@bibble.com', 'bibble', '07678654432', '2025-01-31 13:50:50', NULL),
(3, 'Jim Bibble', 'jim@bibble.com', 'bibble', '07678654432', '2025-01-31 13:57:57', NULL),
(5, 'John Bibble', 'john@bibble.com', 'bibble', '07678654432', '2025-01-31 14:02:05', NULL),
(6, 'Don Bebble', 'don@bebble.com', 'bebble', '07678894432', '2025-01-31 16:42:19', '2025-01-31 17:06:53'),
(7, 'Dan Bibble', 'bebble', 'dan@bibble.com', '07678894432', '2025-01-31 17:08:49', NULL),
(8, 'Ichabod Bibble', 'ichabod@babble.com', 'bobble', '07678894432', '2025-01-31 17:09:55', '2025-01-31 17:19:11'),
(9, 'Dan Bibble', 'bebble', 'dan@bibble.com', '07678894432', '2025-01-31 17:11:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `description` text NOT NULL,
  `image_url` text DEFAULT NULL,
  `cover_image_url` text DEFAULT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`_id`, `name`, `password`, `description`, `image_url`, `cover_image_url`, `email`, `phone`, `rating`, `is_active`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'Kernow Koffee', 'bibble', 'Coffee & snacks', '', '', 'kk@kk.com', '07864567351', 2, 0, '', '2025-01-26 00:00:00', NULL),
(12, 'Bobs Snacks', 'bibble', 'Yet Yet Yet More Snacks', '', '', 'bob@donsnacks.com', '07734393674', NULL, NULL, '', '2025-01-28 22:31:45', NULL),
(13, 'Bibble\'s Snacks', 'bibble', 'Yet Yet Yet Yet More Snacks', NULL, NULL, 'bibble@donsnacks.com', '07734393674', NULL, NULL, '', '2025-01-28 22:34:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `favourites_ibfk_1` (`vendor_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `locations_ibfk_1` (`vendor_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `menu_ibfk_1` (`vendor_id`);

--
-- Indexes for table `opening_times`
--
ALTER TABLE `opening_times`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `opening_times_ibfk_1` (`vendor_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `reviews_ibfk_1` (`vendor_id`),
  ADD KEY `reviews_ibfk_2` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `opening_times`
--
ALTER TABLE `opening_times`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`_id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`_id`);

--
-- Constraints for table `opening_times`
--
ALTER TABLE `opening_times`
  ADD CONSTRAINT `opening_times_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
