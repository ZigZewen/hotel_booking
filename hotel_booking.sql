-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 04:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `address`, `phone_number`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Updated Hotel Name', '123 Updated Street, Updated City', '987-654-3210', 'An updated description of the hotel', 32, 'https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg', '2023-11-03 15:43:37', '2023-11-03 17:48:53'),
(2, 'Sample Hotel 2', '456 Ocean View Drive, Seaside Bay', '555-123-4567', 'Relax by the beach and enjoy the stunning views', 26, 'https://thehoughtonhotel.com/wp-content/uploads/2023/02/Houghton-Hotel-3-20-scaled.jpg', '2023-11-03 15:43:37', '2023-11-03 17:49:23'),
(4, 'Hotel A', 'Address A', '123-456-7890', 'Description A', 100, 'https://www.ahstatic.com/photos/c096_ho_00_p_1024x768.jpg', '2023-11-03 22:15:23', '2023-11-03 22:15:23'),
(5, 'Hotel B', 'Address B', '987-654-3210', 'Description B', 120, 'https://www.ohotelsindia.com/pune/images/13c6386862540c41822c39464b130b65.jpg', '2023-11-03 22:15:23', '2023-11-03 22:15:23'),
(6, 'Hotel C', 'Address C', '555-555-5555', 'Description C', 80, 'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=', '2023-11-03 22:15:23', '2023-11-03 22:15:23'),
(7, 'Hotel D', 'Address D', '111-222-3333', 'Description D', 150, 'https://economictimes.indiatimes.com/thumb/msid-73023854,width-1200,height-900,resizemode-4,imgsize-235513/hotel-agencies.jpg?from=mdrhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1w70-bSiiCCdYVEJA4MtEjPgsbNLCl-sLeQ&usqp=CAU', '2023-11-03 22:15:23', '2023-11-03 22:15:23'),
(8, 'Hotel E', 'Address E', '999-888-7777', 'Description E', 90, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTiklZbSXnMd1GzJS5QDs8sOQA42OBzX10Nw&usqp=CAU', '2023-11-03 22:15:23', '2023-11-03 22:15:23'),
(9, 'Hotel F', 'Address F', '777-777-7777', 'Description F', 110, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo-nn3_x_34CSP3nQ17wT4DLed49aGR2giTQ&usqp=CAU', '2023-11-03 22:15:23', '2023-11-03 22:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_admins`
--

CREATE TABLE `hotel_admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_admins`
--

INSERT INTO `hotel_admins` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'new_admin_username', 'new_admin_password', '2023-11-03 15:43:45'),
(2, 'admin2', 'adminpassword2', '2023-11-03 15:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_bookings`
--

CREATE TABLE `hotel_bookings` (
  `booking_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_bookings`
--

INSERT INTO `hotel_bookings` (`booking_id`, `hotel_id`, `guest_name`, `phone_number`, `check_in_date`, `check_out_date`, `created_at`) VALUES
(15, 1, '11', '08698765', '0000-00-00', '2023-11-15', '2023-11-03 20:44:55'),
(18, 1, 'opp', '09', '2023-11-04', '2023-11-17', '2023-11-03 22:16:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_admins`
--
ALTER TABLE `hotel_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hotel_admins`
--
ALTER TABLE `hotel_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  ADD CONSTRAINT `hotel_bookings_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
