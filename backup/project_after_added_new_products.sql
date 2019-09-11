-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2019 at 07:47 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '01749517422', 'abhikbhattacharjee66@gmail.com', 'admin', '$2y$10$1Ya3F/WNLpVE0Zq6iI644.nppsP3BiDZ77LxxCswksyj1TCx1lORO', 'TcZnuTDkZn9yCyDJJYVnCp01v5iy96kAdnPVque8EU4D5xBfGvIuXNfO5Xku', NULL, '2019-06-07 03:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `current_price` decimal(11,2) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Computer & Laptop', 1, '2019-07-02 21:13:03', '2019-07-02 21:13:03'),
(2, 'Electronics', 1, '2019-07-02 21:19:22', '2019-07-02 21:19:22'),
(3, 'Men\'s Fashion', 1, '2019-07-03 01:04:22', '2019-07-03 01:04:22'),
(4, 'Women\'s Fashion', 1, '2019-07-03 01:04:36', '2019-07-03 01:04:36'),
(5, 'Mobile', 1, '2019-07-03 03:07:21', '2019-07-03 03:07:21'),
(6, 'Home Appliances', 1, '2019-09-08 10:19:35', '2019-09-08 10:19:35'),
(7, 'Health & Beauty', 1, '2019-09-08 10:21:06', '2019-09-08 10:21:06'),
(8, 'Home & Living', 1, '2019-09-08 10:24:40', '2019-09-08 10:24:40'),
(9, 'Stationary', 1, '2019-09-08 10:25:21', '2019-09-08 10:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_type` varchar(30) DEFAULT NULL,
  `coupon_amount` decimal(11,2) DEFAULT NULL,
  `coupon_min_amount` decimal(11,2) DEFAULT NULL,
  `valid_till` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_type`, `coupon_amount`, `coupon_min_amount`, `valid_till`, `created_at`, `updated_at`) VALUES
(2, 'BOISHAKH123', 'fixed', '200.00', '5000.00', '09/30/2019', '2019-08-30 05:29:58', '2019-08-30 05:29:58'),
(3, 'EMARKET123', 'fixed', '500.00', '5000.00', '10/31/2019', '2019-09-01 06:03:13', '2019-09-01 06:03:13'),
(4, 'NEW123', 'fixed', '700.00', '12000.00', '09/30/2019', '2019-09-01 07:00:25', '2019-09-01 07:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `favorits`
--

CREATE TABLE `favorits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorits`
--

INSERT INTO `favorits` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 9, 10, '2019-07-15 06:00:28', '2019-07-15 06:00:28'),
(3, 9, 5, '2019-07-16 19:13:17', '2019-07-16 19:13:17'),
(4, 9, 4, '2019-07-16 19:13:42', '2019-07-16 19:13:42'),
(6, 9, 8, '2019-07-17 02:54:57', '2019-07-17 02:54:57'),
(7, 9, 7, '2019-07-24 02:52:49', '2019-07-24 02:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `base_color_code` varchar(20) DEFAULT NULL,
  `base_curr_text` varchar(20) DEFAULT NULL,
  `base_curr_symbol` blob,
  `dec_pt` int(11) DEFAULT NULL,
  `registration` int(11) DEFAULT NULL,
  `email_verification` int(11) DEFAULT NULL,
  `email_notification` int(11) DEFAULT NULL,
  `email_sent_from` varchar(255) DEFAULT NULL,
  `email_template` blob,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tax` double NOT NULL,
  `shipping_charge` double NOT NULL,
  `footer` text,
  `home_style` varchar(255) DEFAULT NULL,
  `in_max` int(11) DEFAULT NULL,
  `con_phone` varchar(255) DEFAULT NULL,
  `con_email` varchar(255) DEFAULT NULL,
  `con_address` varchar(255) DEFAULT NULL,
  `user_login_text` blob,
  `user_register_text` blob,
  `vendor_login_text` blob,
  `vendor_register_text` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `website_title`, `base_color_code`, `base_curr_text`, `base_curr_symbol`, `dec_pt`, `registration`, `email_verification`, `email_notification`, `email_sent_from`, `email_template`, `phone`, `email`, `tax`, `shipping_charge`, `footer`, `home_style`, `in_max`, `con_phone`, `con_email`, `con_address`, `user_login_text`, `user_register_text`, `vendor_login_text`, `vendor_register_text`) VALUES
(1, 'eMarketPlace', '813772', 'TK', 0xe0a7b3, 2, 1, 0, 1, 'radnin2@gmail.com', 0x4869207b7b6e616d657d7d2c0d0a3c62723e3c62723e0d0a7b7b6d6573736167657d7d0d0a3c62723e3c62723e0d0a090d0a3c62723e, '+8801689583182', 'abhikbhattacharjee66@gmail.com', 5, 60, 'Copyright by@Abhik,Papan,Prova - 2019', 'home2', 3, '+ (123) 1800-567-8990', 'info@examplte.com', 'Polashi, BUET 1200', 0x3c64697620636c6173733d22746f702d636f6e74656e7422207374796c653d226d617267696e2d626f74746f6d3a20333770783b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a20726762283132352c203132342c20313433293b206c696e652d6865696768743a20323470783b223e3c666f6e742073697a653d2234223e546f207669657720796f75722070726f647563747320616e64206163636f756e742064657461696c732c20706c65617365206c6f67696e20746f20796f7572206163636f756e742e3c2f666f6e743e3c2f703e3c2f6469763e3c64697620636c6173733d22626f74746f6d2d636f6e74656e7422207374796c653d22646973706c61793a20696e6c696e652d626c6f636b3b20706f736974696f6e3a2072656c61746976653b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b4c6f67696e206173206120757365723c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b43686f6f73652070726f64756374733c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b42757920796f757220646573697265642070726f64756374733c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b5669657720616e64206d616e61676520796f7572206f72646572733c2f703e3c2f6469763e, 0x3c64697620636c6173733d22746f702d636f6e74656e7422207374796c653d226d617267696e2d626f74746f6d3a20333770783b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a20726762283132352c203132342c20313433293b206c696e652d6865696768743a20323470783b223e3c666f6e742073697a653d2234223e546f207669657720796f7572206f726465727320616e64206163636f756e742064657461696c732c20706c65617365206c6f67696e20746f20796f7572206163636f756e742e3c2f666f6e743e3c2f703e3c2f6469763e3c64697620636c6173733d22626f74746f6d2d636f6e74656e7422207374796c653d22646973706c61793a20696e6c696e652d626c6f636b3b20706f736974696f6e3a2072656c61746976653b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b5369676e7570206173206120757365723c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b43686f6f73652070726f64756374733c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b42757920796f757220646573697265642070726f64756374733c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b5669657720616e64206d616e61676520796f7572206f72646572733c2f703e3c2f6469763e, 0x3c64697620636c6173733d22746f702d636f6e74656e7422207374796c653d226d617267696e2d626f74746f6d3a20333770783b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a20726762283132352c203132342c20313433293b206c696e652d6865696768743a20323470783b223e3c666f6e742073697a653d2234223e546f207669657720796f75722070726f647563747320616e64206163636f756e742064657461696c732c20706c65617365206c6f67696e20746f20796f7572206163636f756e742e3c2f666f6e743e3c2f703e3c2f6469763e3c64697620636c6173733d22626f74746f6d2d636f6e74656e7422207374796c653d22646973706c61793a20696e6c696e652d626c6f636b3b20706f736974696f6e3a2072656c61746976653b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b4c6f67696e20617320612076656e646f723c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b537461727420706f7374696e6720796f75722070726f64756374733c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b5669657720616e64206d616e61676520796f75722070726f64756374732f6f72646572733c62723e3c2f703e3c2f6469763e, 0x3c64697620636c6173733d22746f702d636f6e74656e7422207374796c653d226d617267696e2d626f74746f6d3a20333770783b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a20726762283132352c203132342c20313433293b206c696e652d6865696768743a20323470783b223e3c666f6e742073697a653d2234223e546f207669657720796f75722070726f647563747320616e64206163636f756e742064657461696c732c20706c65617365206c6f67696e20746f20796f7572206163636f756e742e3c2f666f6e743e3c2f703e3c2f6469763e3c64697620636c6173733d22626f74746f6d2d636f6e74656e7422207374796c653d22646973706c61793a20696e6c696e652d626c6f636b3b20706f736974696f6e3a2072656c61746976653b20636f6c6f723a20726762283133312c203133392c20313531293b20666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c2073616e732d73657269663b223e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b5369676e757020617320612076656e646f723c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b537461727420706f7374696e6720796f75722070726f64756374733c2f703e3c70207374796c653d22636f6c6f723a207267622833352c2034332c203535293b206c696e652d6865696768743a20312e3632353b223e3c7370616e20636c6173733d2266612066612d636865636b2d636972636c6520626173652d74787422207374796c653d22636f6c6f723a207267622834362c203230342c20313133292021696d706f7274616e743b223e3c2f7370616e3e266e6273703b5669657720616e64206d616e61676520796f75722070726f64756374732f6f72646572733c62723e3c2f703e3c2f6469763e);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `product_attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `product_attribute_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'M', 1, '2019-07-04 14:05:29', '2019-07-04 14:05:29'),
(2, 1, 'XL', 1, '2019-07-04 14:05:37', '2019-07-04 14:05:37'),
(3, 1, 'XXL', 1, '2019-07-04 14:05:45', '2019-07-04 14:05:45'),
(4, 4, 'S', 1, '2019-09-08 10:15:30', '2019-09-08 10:15:30'),
(5, 4, 'M', 1, '2019-09-08 10:15:36', '2019-09-08 10:15:36'),
(6, 4, 'L', 1, '2019-09-08 10:15:42', '2019-09-08 10:15:42'),
(7, 4, 'XL', 1, '2019-09-08 10:15:51', '2019-09-08 10:15:51'),
(8, 3, '36', 1, '2019-09-08 10:18:26', '2019-09-08 10:18:26'),
(9, 3, '37', 1, '2019-09-08 10:18:34', '2019-09-08 10:18:34'),
(10, 3, '38', 1, '2019-09-08 10:18:44', '2019-09-08 10:18:44'),
(11, 3, '40', 1, '2019-09-08 10:18:52', '2019-09-08 10:18:52'),
(12, 2, '32', 1, '2019-09-08 10:23:27', '2019-09-08 10:23:27'),
(13, 2, '34', 1, '2019-09-08 10:23:34', '2019-09-08 10:23:34'),
(14, 2, '36', 1, '2019-09-08 10:23:41', '2019-09-08 10:23:41'),
(15, 2, '38', 1, '2019-09-08 10:23:47', '2019-09-08 10:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `orderedproducts`
--

CREATE TABLE `orderedproducts` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `offered_product_price` varchar(255) DEFAULT NULL,
  `product_price` decimal(11,2) DEFAULT NULL,
  `coupon_amount` decimal(11,2) DEFAULT NULL COMMENT 'total coupon discount for this product',
  `quantity` int(11) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `product_total` decimal(11,2) DEFAULT NULL COMMENT 'it will be added to vendor balance',
  `shipping_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 - pending, 1- in-process, 2- shipped',
  `shipping_date` timestamp NULL DEFAULT NULL,
  `approve` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending, -1- reject',
  `refunded` int(11) NOT NULL DEFAULT '0',
  `comment_type` varchar(30) DEFAULT NULL,
  `comment` text,
  `comment_status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderedproducts`
--

INSERT INTO `orderedproducts` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `product_name`, `offered_product_price`, `product_price`, `coupon_amount`, `quantity`, `attributes`, `product_total`, `shipping_status`, `shipping_date`, `approve`, `refunded`, `comment_type`, `comment`, `comment_status`, `created_at`, `updated_at`) VALUES
(3, 3, 9, 17, 7, 'Asus Rog G551VW', NULL, '120000.00', '0.00', 1, '[]', '120000.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-16 19:26:35', '2019-07-16 19:26:35'),
(4, 3, 9, 17, 5, 'Asus Zenbook B345', NULL, '40000.00', '0.00', 1, '[]', '40000.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-16 19:26:35', '2019-07-16 19:26:35'),
(5, 4, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"M\"]}', '1100.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-17 02:15:12', '2019-07-17 02:15:12'),
(6, 4, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XL\"]}', '1100.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-17 02:15:12', '2019-07-17 02:15:12'),
(7, 4, 9, 17, 7, 'Asus Rog G551VW', NULL, '120000.00', '0.00', 2, '[]', '240000.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-17 02:15:12', '2019-07-17 02:15:12'),
(8, 5, 9, 17, 4, 'Dell Inspiron I3', '43500.00', '45000.00', '0.00', 2, '[]', '87000.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-17 02:22:07', '2019-07-17 02:22:07'),
(9, 6, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"M\"]}', '1100.00', 2, '2019-07-26 23:30:29', 1, 0, NULL, NULL, 0, '2019-07-17 03:00:41', '2019-07-26 23:30:29'),
(10, 6, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XL\"]}', '1100.00', 2, '2019-07-26 23:30:29', 1, 0, NULL, NULL, 0, '2019-07-17 03:00:41', '2019-07-26 23:30:29'),
(11, 7, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XL\"]}', '1100.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-17 14:22:28', '2019-07-17 14:22:28'),
(12, 8, 9, 17, 8, 'Xiaomi A2', '10800.00', '12000.00', '0.00', 1, '[]', '10800.00', 2, '2019-07-26 23:25:07', 1, 0, 'Suggestion', 'Faster delivery please', -1, '2019-07-24 02:52:20', '2019-09-01 18:05:45'),
(13, 8, 9, 17, 7, 'Asus Rog G551VW', NULL, '120000.00', '0.00', 3, '[]', '360000.00', 2, '2019-07-26 23:25:07', 1, 0, NULL, NULL, 0, '2019-07-24 02:52:20', '2019-07-26 23:25:07'),
(14, 9, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XL\"]}', '1100.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-27 02:42:03', '2019-07-27 02:42:03'),
(15, 10, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 3, '{\"shirt_size\":[\"XL\"]}', '3300.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-27 22:24:45', '2019-07-27 22:24:45'),
(16, 10, 9, 17, 2, 'Asus Zenbook A534Ni', '78000.00', '80000.00', '0.00', 1, '[]', '78000.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-07-27 22:24:45', '2019-07-27 22:24:45'),
(17, 11, 9, 17, 4, 'Dell Inspiron I3', '43500.00', '45000.00', '0.00', 1, '[]', '43500.00', 2, '2019-08-28 00:52:14', 1, 0, 'Suggestion', 'Update packaging.', -1, '2019-08-28 00:49:27', '2019-09-01 18:07:00'),
(18, 12, 9, 17, 7, 'Asus Rog G551VW', NULL, '120000.00', '0.00', 1, '[]', '120000.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-08-28 00:58:29', '2019-08-28 00:58:29'),
(19, 12, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XL\"]}', '1100.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-08-28 00:58:29', '2019-08-28 00:58:29'),
(20, 13, 9, 17, 5, 'Asus Zenbook B345', NULL, '40000.00', '0.00', 1, '[]', '40000.00', 2, '2019-08-28 02:51:24', 1, 0, 'Complain', 'ljsdfasdf', 1, '2019-08-28 02:48:01', '2019-09-01 08:05:18'),
(21, 13, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XXL\"]}', '1100.00', 2, '2019-08-28 02:51:24', 1, 0, NULL, NULL, 0, '2019-08-28 02:48:02', '2019-08-28 02:51:24'),
(22, 13, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '0.00', 1, '{\"shirt_size\":[\"XXL\"]}', '1100.00', 2, '2019-08-28 02:51:24', 1, 0, NULL, NULL, 0, '2019-08-28 02:48:02', '2019-08-28 02:51:24'),
(23, 18, 9, 17, 7, 'Asus Rog G551VW', NULL, '120000.00', '491.00', 1, '[]', '119509.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-09-01 06:16:13', '2019-09-01 06:16:13'),
(24, 18, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '4.50', 1, '{\"shirt_size\":[\"XL\"]}', '1095.50', 0, NULL, 0, 0, NULL, NULL, 0, '2019-09-01 06:16:13', '2019-09-01 06:16:13'),
(25, 18, 9, 3, 10, 'Blue Shirt', '1100.00', '1200.00', '4.50', 1, '{\"shirt_size\":[\"M\"]}', '1095.50', 0, NULL, 0, 0, NULL, NULL, 0, '2019-09-01 06:16:13', '2019-09-01 06:16:13'),
(26, 19, 9, 17, 8, 'Xiaomi A2', '10800.00', '12000.00', '200.00', 1, '[]', '10600.00', 0, NULL, 0, 0, NULL, NULL, 0, '2019-09-01 06:24:41', '2019-09-01 06:24:41'),
(27, 20, 9, 17, 2, 'Asus Zenbook A534Ni', '78000.00', '80000.00', '700.00', 1, '[]', '77300.00', 0, NULL, 1, 0, NULL, NULL, 0, '2019-09-01 07:12:48', '2019-09-01 08:10:56'),
(28, 21, 10, 17, 4, 'Dell Inspiron I3', '43500.00', '45000.00', '0.00', 1, '[]', '43500.00', 2, '2019-09-04 03:27:43', 1, 0, NULL, NULL, 0, '2019-09-04 03:23:56', '2019-09-04 03:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` int(255) NOT NULL,
  `order_notes` text,
  `subtotal` decimal(11,2) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `shipping_charge` decimal(11,2) DEFAULT NULL,
  `payment_method` int(3) DEFAULT NULL,
  `shipping_status` int(11) DEFAULT '0' COMMENT '0 - pending, 1- in-process, 2- shipped',
  `approve` int(11) DEFAULT '0' COMMENT '0-pending, 1-approve, -1- reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `unique_id`, `phone`, `address`, `city`, `zip_code`, `order_notes`, `subtotal`, `total`, `shipping_charge`, `payment_method`, `shipping_status`, `approve`, `created_at`, `updated_at`) VALUES
(3, 9, '100003', '01949517422', 'Polashi, BUET', 'Dhaka', 1000, 'Sample Note', '160000.00', '168060.00', NULL, NULL, 0, -1, '2019-07-16 19:26:35', '2019-07-26 23:32:13'),
(4, 9, '100004', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'Sample Note', '242200.00', '254370.00', NULL, NULL, 0, -1, '2019-07-17 02:15:11', '2019-07-26 23:34:27'),
(5, 9, '100005', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '87000.00', '91410.00', NULL, NULL, 0, -1, '2019-07-17 02:22:06', '2019-07-26 05:12:03'),
(6, 9, '100006', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'Sample Notes', '2200.00', '2370.00', NULL, NULL, 2, 1, '2019-07-17 03:00:41', '2019-07-26 23:30:29'),
(7, 9, '100007', '01949517422', 'Polashi, BUET', 'Dhaka', 1000, NULL, '1100.00', '1215.00', NULL, NULL, 0, -1, '2019-07-17 14:22:28', '2019-07-26 05:06:39'),
(8, 9, '100008', '01949517422', 'Polashi, BUET', 'Dhaka', 1000, 'afdafdadfasdf', '370800.00', '389400.00', NULL, NULL, 2, 1, '2019-07-24 02:52:18', '2019-07-26 23:25:07'),
(9, 9, '100009', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'asdfafadf', '1100.00', '1215.00', NULL, NULL, 0, -1, '2019-07-27 02:42:03', '2019-07-27 02:43:03'),
(10, 9, '100010', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'jldajflajlfjalf', '81300.00', '85425.00', NULL, NULL, 0, -1, '2019-07-27 22:24:45', '2019-08-28 02:42:52'),
(11, 9, '100011', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'New Order', '43500.00', '45735.00', NULL, NULL, 2, 1, '2019-08-28 00:49:27', '2019-08-28 00:52:14'),
(12, 9, '100012', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'Another Order', '121100.00', '127215.00', NULL, NULL, 0, -1, '2019-08-28 00:58:28', '2019-08-28 02:42:25'),
(13, 9, '100013', '01949517422', '12 Elephant Road', 'Dhaka', 1000, 'New ORder', '42200.00', '44370.00', NULL, NULL, 2, 1, '2019-08-28 02:48:01', '2019-08-28 02:51:24'),
(14, 9, '100014', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '121700.00', '127845.00', NULL, NULL, 0, 0, '2019-09-01 06:11:11', '2019-09-01 06:11:12'),
(15, 9, '100015', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '121700.00', '127845.00', NULL, NULL, 0, 0, '2019-09-01 06:12:21', '2019-09-01 06:12:21'),
(16, 9, '100016', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '121700.00', '127845.00', NULL, NULL, 0, 0, '2019-09-01 06:12:45', '2019-09-01 06:12:45'),
(17, 9, '100017', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '121700.00', '127845.00', NULL, NULL, 0, 0, '2019-09-01 06:15:31', '2019-09-01 06:15:31'),
(18, 9, '100018', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '121700.00', '127845.00', NULL, NULL, 0, 0, '2019-09-01 06:16:13', '2019-09-01 06:16:13'),
(19, 9, '100019', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '10600.00', '11190.00', NULL, NULL, 0, 0, '2019-09-01 06:24:41', '2019-09-01 06:24:41'),
(20, 9, '100020', '01949517422', '12 Elephant Road', 'Dhaka', 1000, NULL, '77300.00', '81225.00', NULL, NULL, 0, 1, '2019-09-01 07:12:48', '2019-09-01 08:10:56'),
(21, 10, '100021', '01949517422', '12 Elephant Road', 'Dhaka', 1200, 'Send fast', '43500.00', '45735.00', NULL, NULL, 2, 1, '2019-09-04 03:23:56', '2019-09-04 03:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bbasakpapan@gmail.com', 'fWPehkZ9lUMmjd88I0QcBPQHDpPNcE', 1, '2019-06-23 05:34:55', '2019-06-23 05:35:18'),
(2, 'bbasakpapan@gmail.com', '0s7DnKK7uGIze4LY3zOW8DKtsSKodw', 1, '2019-07-07 03:37:50', '2019-07-07 03:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `preview_images`
--

CREATE TABLE `preview_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `big_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preview_images`
--

INSERT INTO `preview_images` (`id`, `product_id`, `image`, `big_image`, `created_at`, `updated_at`) VALUES
(3, 2, '5d1c21d65c670.jpg', '5d1c21d65c675.jpg', '2019-07-02 21:32:38', '2019-07-02 21:32:38'),
(4, 3, '5d1c24daaea02.jpg', '5d1c24daaea04.jpg', '2019-07-02 21:45:31', '2019-07-02 21:45:31'),
(5, 4, '5d1c283123ae6.jpg', '5d1c283123ae8.jpg', '2019-07-02 21:59:45', '2019-07-02 21:59:45'),
(6, 5, '5d1c286a7141e.jpg', '5d1c286a71420.jpg', '2019-07-02 22:00:42', '2019-07-02 22:00:42'),
(7, 6, '5d1c51d203880.jpg', '5d1c51d203881.jpg', '2019-07-03 00:57:22', '2019-07-03 00:57:22'),
(8, 6, '5d1c51d249d01.jpg', '5d1c51d249d03.jpg', '2019-07-03 00:57:22', '2019-07-03 00:57:22'),
(9, 6, '5d1c51d2959a4.jpg', '5d1c51d2959a6.jpg', '2019-07-03 00:57:22', '2019-07-03 00:57:22'),
(10, 7, '5d1c5729ec66d.jpg', '5d1c5729ec66f.jpg', '2019-07-03 01:20:10', '2019-07-03 01:20:10'),
(11, 8, '5d1c70fa07888.jpg', '5d1c70fa0788a.jpg', '2019-07-03 03:10:18', '2019-07-03 03:10:18'),
(12, 8, '5d1c70fa5b3c1.jpg', '5d1c70fa5b3c3.jpg', '2019-07-03 03:10:18', '2019-07-03 03:10:18'),
(13, 9, '5d1e6dc9be2de.jpg', '5d1e6dc9be2df.jpg', '2019-07-04 15:21:14', '2019-07-04 15:21:14'),
(14, 10, '5d205e8390299.jpg', '5d205e839029f.jpg', '2019-07-06 02:40:36', '2019-07-06 02:40:36'),
(18, 11, '5d752e8492029.jpg', '5d752e849202c.jpg', '2019-09-08 10:38:29', '2019-09-08 10:38:29'),
(19, 11, '5d752e85eec22.jpg', '5d752e85eec24.jpg', '2019-09-08 10:38:30', '2019-09-08 10:38:30'),
(20, 12, '5d752fd3567e3.jpg', '5d752fd3567e5.jpg', '2019-09-08 10:44:03', '2019-09-08 10:44:03'),
(21, 13, '5d753057cb8c7.jpg', '5d753057cb8ca.jpg', '2019-09-08 10:46:16', '2019-09-08 10:46:16'),
(22, 14, '5d7532745f9d4.jpg', '5d7532745f9d9.jpg', '2019-09-08 10:55:17', '2019-09-08 10:55:17'),
(23, 15, '5d7532b426c55.jpg', '5d7532b426c57.jpg', '2019-09-08 10:56:20', '2019-09-08 10:56:20'),
(24, 16, '5d7532f3be256.jpg', '5d7532f3be25c.jpg', '2019-09-08 10:57:24', '2019-09-08 10:57:24'),
(25, 17, '5d7534503839d.jpg', '5d753450383a2.jpg', '2019-09-08 11:03:13', '2019-09-08 11:03:13'),
(26, 18, '5d75348e58f29.jpg', '5d75348e58f2c.jpg', '2019-09-08 11:04:15', '2019-09-08 11:04:15'),
(27, 19, '5d75366b660f2.jpg', '5d75366b660f4.jpg', '2019-09-08 11:12:11', '2019-09-08 11:12:11'),
(28, 20, '5d7536ace086e.jpg', '5d7536ace0871.jpg', '2019-09-08 11:13:17', '2019-09-08 11:13:17'),
(29, 21, '5d75370badd64.jpg', '5d75370badd68.jpg', '2019-09-08 11:14:52', '2019-09-08 11:14:52'),
(30, 22, '5d753855890cc.jpg', '5d753855890cf.jpg', '2019-09-08 11:20:22', '2019-09-08 11:20:22'),
(31, 23, '5d75389e414a4.jpg', '5d75389e414a6.jpg', '2019-09-08 11:21:35', '2019-09-08 11:21:35'),
(32, 24, '5d7538e3d9192.jpg', '5d7538e3d9194.jpg', '2019-09-08 11:22:44', '2019-09-08 11:22:44'),
(33, 25, '5d753c4cd77a2.jpg', '5d753c4cd77a5.jpg', '2019-09-08 11:37:17', '2019-09-08 11:37:17'),
(34, 25, '5d753c4e044aa.jpg', '5d753c4e044ac.jpg', '2019-09-08 11:37:19', '2019-09-08 11:37:19'),
(35, 26, '5d753ca0cf95f.jpg', '5d753ca0cf963.jpg', '2019-09-08 11:38:41', '2019-09-08 11:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `attributes` text,
  `description` blob,
  `type` varchar(30) DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `valid_till` varchar(255) DEFAULT NULL,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_amount` varchar(255) DEFAULT NULL,
  `current_price` decimal(11,2) DEFAULT NULL,
  `search_price` decimal(11,2) DEFAULT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `avg_rating` decimal(11,2) NOT NULL DEFAULT '0.00',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `category_id`, `subcategory_id`, `title`, `slug`, `price`, `quantity`, `product_code`, `attributes`, `description`, `type`, `amount`, `valid_till`, `offer_type`, `offer_amount`, `current_price`, `search_price`, `sales`, `avg_rating`, `deleted`, `created_at`, `updated_at`) VALUES
(2, 17, 1, 1, 'Asus Zenbook A534Ni', 'asus-zenbook-a534ni', '80000.00', 17, 'hwjfeqb2', NULL, 0x3c6469763e3c6f6c3e3c6c693e31352e3620696e6368206c6170746f703c2f6c693e3c6c693e536c65656b2064657369676e3c62723e3c2f6c693e3c2f6f6c3e3c2f6469763e, NULL, NULL, NULL, 'fixed', '2000', '78000.00', '78000.00', 0, '0.00', 0, '2019-09-01 12:30:02', '2019-09-01 06:30:02'),
(3, 17, 1, 1, 'Asus Rog GL552VW', 'asus-rog-gl552vw', '50000.00', 30, '8v5jo6v0', NULL, 0x3c6f6c3e3c6c693e31342e3520696e6368204c6170746f703c62723e3c2f6c693e3c2f6f6c3e, NULL, NULL, NULL, 'fixed', '3000', '47000.00', '47000.00', 0, '0.00', 0, '2019-07-02 21:45:30', '2019-07-02 21:45:30'),
(4, 17, 1, 2, 'Dell Inspiron I3', 'dell-inspiron-i3', '45000.00', 11, 'fb01huh4', NULL, 0x3c6f6c3e3c6c693e31352e3620496e6368206c6170746f703c62723e3c2f6c693e3c2f6f6c3e, NULL, NULL, NULL, 'fixed', '1500', '43500.00', '43500.00', 2, '4.30', 0, '2019-09-04 09:28:34', '2019-09-04 03:28:34'),
(5, 17, 1, 1, 'Asus Zenbook B345', 'asus-zenbook-b345', '40000.00', 47, '3qae0ivs', NULL, 0x476f6f64206c6170746f703c62723e, NULL, NULL, NULL, NULL, NULL, NULL, '40000.00', 1, '4.30', 0, '2019-08-28 08:51:45', '2019-08-28 02:51:45'),
(6, 17, 1, 1, 'Dell Inspiron I4', 'dell-inspiron-i4', '60000.00', 20, '3y5ce9ma', NULL, 0x3c6f6c3e3c6c693e31352e3620696e6368206c6170746f703c62723e3c2f6c693e3c2f6f6c3e, NULL, NULL, NULL, 'fixed', '4000', '56000.00', '56000.00', 0, '0.00', 1, '2019-07-03 07:17:03', '2019-07-03 01:17:03'),
(7, 17, 1, 1, 'Asus Rog G551VW', 'asus-rog-g551vw', '120000.00', 11, 'nxwn4hsh', NULL, 0x3c6f6c3e3c6c693e21352e3620696e6368206c6170746f703c2f6c693e3c6c693e313647422052414d3c2f6c693e3c6c693e32205442204844443c62723e3c2f6c693e3c2f6f6c3e, NULL, NULL, NULL, NULL, NULL, NULL, '120000.00', 3, '3.60', 0, '2019-09-01 12:23:17', '2019-09-01 06:23:17'),
(8, 17, 5, 5, 'Xiaomi A2', 'xiaomi-a2', '12000.00', 22, '9j4gjg2o', NULL, 0x666166616466, NULL, NULL, NULL, 'percent', '10', '10800.00', '10800.00', 1, '0.00', 0, '2019-09-01 12:24:04', '2019-09-01 06:24:04'),
(9, 17, 3, 6, 'Richmond Shirt', 'richmond-shirt', '1500.00', 30, 'cm3fri3l', '{\"shirt_size\":[\"M\",\"XL\",\"XXL\"]}', 0x526963686d6f6e642053686972743c62723e, NULL, NULL, NULL, NULL, NULL, NULL, '1500.00', 0, '0.00', 1, '2019-07-06 12:14:47', '2019-07-06 06:14:47'),
(10, 3, 3, 6, 'Blue Shirt', 'blue-shirt', '1200.00', 15, 'ckzb3hqd', '{\"shirt_size\":[\"M\",\"XL\",\"XXL\"]}', 0x426c75652066756c6c2d736c656576652073686972742c2073696d706c652064657369676e2e203c62723e, NULL, NULL, NULL, 'fixed', '100', '1100.00', '1100.00', 4, '0.00', 0, '2019-09-01 12:23:16', '2019-09-01 06:23:16'),
(11, 21, 6, 19, 'Sharp SJ-EK341E - Top Mount Refrigerator - 272 Liters - Silver', 'sharp-sj-ek341e-top-mount-refrigerator-272-liters-silver', '58900.00', 12, 't1tpgkg6', '[]', 0x3c666f6e7420636f6c6f723d22233231323132312220666163653d22526f626f746f2c202d6170706c652d73797374656d2c20426c696e6b4d616353797374656d466f6e742c2048656c766574696361204e6575652c2048656c7665746963612c2073616e732d7365726966223e3c7370616e207374796c653d22666f6e742d73697a653a20323270783b223e4272616e64202d2053686172703c2f7370616e3e3c2f666f6e743e3c6469763e3c666f6e7420636f6c6f723d22233231323132312220666163653d22526f626f746f2c202d6170706c652d73797374656d2c20426c696e6b4d616353797374656d466f6e742c2048656c766574696361204e6575652c2048656c7665746963612c2073616e732d7365726966223e3c7370616e207374796c653d22666f6e742d73697a653a20323270783b223e436f6c6f72202d2053696c7665723c2f7370616e3e3c2f666f6e743e3c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '58900.00', 0, '0.00', 0, '2019-09-08 10:38:28', '2019-09-08 10:38:28'),
(12, 21, 6, 20, 'Singer washing-machine-beko-7-kg-top-loading', 'singer-washing-machine-beko-7-kg-top-loading', '25900.00', 15, 'pf1i41xy', '[]', 0x4272616e642d2053696e6765723c6469763e436f6c6f722d2053496c7665723c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '25900.00', 0, '0.00', 0, '2019-09-08 10:44:03', '2019-09-08 10:44:03'),
(13, 21, 6, 21, 'Panasonic Microwave Oven NN-GT35HM (23 Liters)', 'panasonic-microwave-oven-nn-gt35hm-23-liters', '17900.00', 5, 'ps5v0r0l', '[]', 0x4272616e642d2050616e61736f6e69633c6469763e436f6c6f72202d2053696c7665723c2f6469763e3c6469763e3c62723e3c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '17900.00', 0, '0.00', 0, '2019-09-08 10:46:15', '2019-09-08 10:46:15'),
(14, 21, 4, 15, 'Women\'s Ethnic Top PALE  Aqua', 'womens-ethnic-top-pale-aqua', '2195.00', 12, '6pmq8dc8', '{\"womens_dress_size\":[\"S\",\"M\",\"L\",\"XL\"]}', 0x436f6c6f72202d2050616c6520417175613c6469763e3c62723e3c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '2195.00', 0, '0.00', 0, '2019-09-08 16:57:48', '2019-09-08 10:57:48'),
(15, 21, 4, 18, 'Women\'s  Bag MANGO ORANGE', 'womens-bag-mango-orange', '3995.00', 15, '9cc3c1hj', '[]', 0x436f6c6f72202d204d616e676f204f72616e6765, NULL, NULL, NULL, NULL, NULL, NULL, '3995.00', 0, '0.00', 0, '2019-09-08 10:56:20', '2019-09-08 10:56:20'),
(16, 21, 4, 17, 'Women\'s Show LIGHT BLUE', 'womens-show-light-blue', '3550.00', 30, 'sbq3i5bj', '{\"shoe_size\":[\"36\",\"38\",\"40\"]}', 0x436f6c6f72202d2050616c6520426c7565, NULL, NULL, NULL, NULL, NULL, NULL, '3550.00', 0, '0.00', 0, '2019-09-08 10:57:23', '2019-09-08 10:57:23'),
(17, 21, 3, 25, 'Men Maroon & Navy Striped Round Neck T-shirt', 'men-maroon-navy-striped-round-neck-t-shirt', '895.00', 12, 'qfdf8t58', '{\"shirt_size\":[\"M\",\"XL\",\"XXL\"]}', 0x436f6c6f722d204d61726f6f6e, NULL, NULL, NULL, NULL, NULL, NULL, '895.00', 0, '0.00', 0, '2019-09-08 11:03:12', '2019-09-08 11:03:12'),
(18, 21, 3, 26, 'Men Navy Solid Sneakers', 'men-navy-solid-sneakers', '3995.00', 20, 'l9fz8q35', '{\"shoe_size\":[\"38\",\"40\"]}', 0x436f6c6f72202d204e61767920426c7565, NULL, NULL, NULL, NULL, NULL, NULL, '3995.00', 0, '0.00', 0, '2019-09-08 11:04:14', '2019-09-08 11:04:14'),
(19, 21, 7, 23, 'Pantene Pro-V Repair and Protect Shampoo, 400 ml', 'pantene-pro-v-repair-and-protect-shampoo-400-ml', '399.00', 12, '3x8oc8kb', '[]', 0x53696c6b7920616e6420736d6f6f746820686169723c6469763e3c62723e3c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '399.00', 0, '0.00', 0, '2019-09-08 11:12:11', '2019-09-08 11:12:11'),
(20, 21, 7, 22, 'PLUM Green Tea Renewed Clarity Night Gel 50 ml', 'plum-green-tea-renewed-clarity-night-gel-50-ml', '595.00', 12, '9fpnx3mn', '[]', 0x4e696768742047656c, NULL, NULL, NULL, NULL, NULL, NULL, '595.00', 0, '0.00', 0, '2019-09-08 11:13:16', '2019-09-08 11:13:16'),
(21, 21, 7, 24, 'Dove Deep Moisture Shower Foam Body Wash, 13.5 oz', 'dove-deep-moisture-shower-foam-body-wash-135-oz', '899.00', 12, '3s3lo2do', '[]', 0x426f647920536f6170, NULL, NULL, NULL, NULL, NULL, NULL, '899.00', 0, '0.00', 0, '2019-09-08 11:14:51', '2019-09-08 11:14:51'),
(22, 21, 9, 30, 'Harry Potter Themed Diary NAVY BLUE', 'harry-potter-themed-diary-navy-blue', '495.00', 12, 'pnkt4amh', '[]', 0x436f6c6f72202d204e61767920426c7565, NULL, NULL, NULL, NULL, NULL, NULL, '495.00', 0, '0.00', 0, '2019-09-08 11:20:21', '2019-09-08 11:20:21'),
(23, 21, 8, 28, 'Multicoloured Printed Square MDF Wall Mirror', 'multicoloured-printed-square-mdf-wall-mirror', '2250.00', 15, '11mzsttx', '[]', 0x436f6c6f72202d204d756c74693c6469763e5371756172652053686170653c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '2250.00', 0, '0.00', 0, '2019-09-08 11:21:34', '2019-09-08 11:21:34'),
(24, 21, 8, 29, 'Gold & White Wall Lamp', 'gold-white-wall-lamp', '1395.00', 12, 'kjkes8vg', '[]', 0x436f6c6f72202d20476f6c64656e20616e64205768697465, NULL, NULL, NULL, NULL, NULL, NULL, '1395.00', 0, '0.00', 0, '2019-09-08 11:22:43', '2019-09-08 11:22:43'),
(25, 21, 1, 13, 'HP ENVY x360 - 13-ag0035au', 'hp-envy-x360-13-ag0035au', '99000.00', 12, '9m5z2a7d', '[]', 0x3c7370616e207374796c653d22636f6c6f723a207267622839382c2039382c203938293b20666f6e742d66616d696c793a202671756f743b48502053696d706c6966696564204c696768742671756f743b3b20666f6e742d73697a653a20313570783b20666f6e742d7765696768743a203730303b223e4d656d6f72792d3820474220444452342d3234303020534452414d20286f6e626f617264293c2f7370616e3e3c6469763e3c666f6e7420636f6c6f723d22233632363236322220666163653d2248502053696d706c6966696564204c69676874223e3c7370616e207374796c653d22666f6e742d73697a653a20313570783b223e3c623e47726170686963732d266e6273703b3c2f623e3c2f7370616e3e3c2f666f6e743e3c7370616e207374796c653d22636f6c6f723a207267622839382c2039382c203938293b20666f6e742d66616d696c793a202671756f743b48502053696d706c6966696564204c696768742671756f743b3b20666f6e742d73697a653a20313570783b20666f6e742d7765696768743a203730303b223e414d4420526164656f6ee284a2205665676120382047726170686963733c2f7370616e3e3c666f6e7420636f6c6f723d22233632363236322220666163653d2248502053696d706c6966696564204c69676874223e3c7370616e207374796c653d22666f6e742d73697a653a20313570783b223e3c623e3c62723e3c2f623e3c2f7370616e3e3c2f666f6e743e3c6469763e3c7370616e207374796c653d22636f6c6f723a207267622839382c2039382c203938293b20666f6e742d66616d696c793a202671756f743b48502053696d706c6966696564204c696768742671756f743b3b20666f6e742d73697a653a20313570783b20666f6e742d7765696768743a203730303b223e3c62723e3c2f7370616e3e3c2f6469763e3c2f6469763e, NULL, NULL, NULL, NULL, NULL, NULL, '99000.00', 0, '0.00', 0, '2019-09-08 11:37:16', '2019-09-08 11:37:16'),
(26, 21, 1, 14, 'Acer Swift SF314-52 8th Gen Core i7 14\" FULL HD Ultrabook', 'acer-swift-sf314-52-8th-gen-core-i7-14-full-hd-ultrabook', '85000.00', 12, 'h3rir74b', '[]', 0x3c756c207374796c653d22666f6e742d73697a653a20313370783b206d617267696e2d746f703a20313070783b20636f6c6f723a207267622835312c2035312c203531293b20666f6e742d66616d696c793a202671756f743b48656c766574696361204e6575652671756f743b2c2048656c7665746963612c20417269616c2c2073616e732d73657269663b223e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e496e74656c20436f72652069372d38353530552050726f636573736f722028384d2043616368652c312e38302047487a20757020746f20342e30302047487a293c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e496e74656cc2ae204844204772617068696373203632303c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e34204742204444523420534452414d3c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e353132205353442053746f726167653c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e31342e30e2809d2046756c6c2048442028313932302078203130383029204163657220436f6d667956696577204c4344204261636b6c69676874204c454420446973706c61793c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e4261636b6c6974204b6579626f6172643c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e4c696e7578204f533c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e46696e6765727072696e74205265616465723c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e496e74656772617465642031302f3130302f31303030204d62707320476967616269742045746865726e65743c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e5374616e646172642073697a65204241434b4c4954204b6579626f61726420616e64204d756c74692d746f756368204765737475726520546f7563687061643c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e48444d492d5965732c2055534220322e3020506f7274732d312c2055534220332e3020506f7274732d322c203120524a2d34352c20312048444d492c20312043617264205265616465722c203120537065616b65722026616d703b204d6963726f70686f6e652c203120414320706f7274733c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e476967616269742045746865726e65742c57692d46692c20426c7565746f6f74682c2043617264205265616465722c2048442057656263616d3c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e332d63656c6c204c692d696f6e2033353030206d416820426174746572793c6272207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b223e3c2f623e3c2f6c693e3c6c69207374796c653d22746578742d616c69676e3a206c6566743b206d617267696e3a203070783b2070616464696e673a203070783b206c6973742d7374796c653a206469736320696e736964653b206c696e652d6865696768743a20323070783b223e3c623e436f6c6f72202d20535041524b4c592053494c5645523c2f623e3c2f6c693e3c2f756c3e, NULL, NULL, NULL, NULL, NULL, NULL, '85000.00', 0, '0.00', 0, '2019-09-08 11:38:40', '2019-09-08 11:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attrname` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `attrname`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shirt Size', 'shirt_size', 1, '2019-07-04 13:43:20', '2019-07-04 13:43:20'),
(2, 'Waist Size', 'waist_size', 1, '2019-07-04 13:45:27', '2019-07-04 13:45:27'),
(3, 'Shoe Size', 'shoe_size', 1, '2019-07-04 13:47:12', '2019-07-04 13:47:12'),
(4, 'Womens\'  Dress Size', 'womens_dress_size', 1, '2019-09-08 10:14:51', '2019-09-08 10:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` double(11,2) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 9, 7, 3.60, 'Average...some random comment', '2019-08-26 06:23:38', '2019-08-26 06:23:38'),
(2, 9, 4, 3.80, 'Average Product', '2019-08-28 00:53:09', '2019-08-28 00:53:09'),
(3, 9, 5, 4.30, 'Average product', '2019-08-28 02:51:45', '2019-08-28 02:51:45'),
(4, 10, 4, 4.80, 'Very good product. Some random issues.', '2019-09-04 03:28:34', '2019-09-04 03:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `servicebookings`
--

CREATE TABLE `servicebookings` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `serviceprovider_id` int(11) DEFAULT NULL,
  `service_charge` decimal(11,2) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending, -1- reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `serviceproviders`
--

CREATE TABLE `serviceproviders` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `subservice_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `service_code` varchar(255) DEFAULT NULL,
  `experience` double(11,2) DEFAULT NULL,
  `fee` double(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0-pending, 1-approve, -1- reject',
  `attributes` text,
  `description` blob,
  `type` varchar(30) DEFAULT NULL,
  `valid_till` varchar(255) DEFAULT NULL,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_amount` varchar(255) DEFAULT NULL,
  `current_price` decimal(11,2) DEFAULT NULL,
  `search_price` decimal(11,2) DEFAULT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `avg_rating` decimal(11,2) NOT NULL DEFAULT '0.00',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicereview`
--

CREATE TABLE `servicereview` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `serviceprovider_id` int(11) DEFAULT NULL,
  `rating` double(11,2) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bold_text` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `small_text`, `bold_text`, `title`, `url`, `created_at`, `updated_at`) VALUES
(1, '1567951041.jpg', 'Get exclusive offers on new product arrivals', 'New Product Arrivals', 'September-2019', NULL, '2019-09-08 07:57:22', '2019-09-08 07:57:22'),
(2, '1567951080.jpg', 'Get exclusive offers on new product arrivals', 'New Product Arrivals', 'September-2019', NULL, '2019-09-08 07:58:00', '2019-09-08 07:58:00'),
(5, '1567952374.jpg', 'Get exclusive offers on new product arrivals', 'New Product Arrivals', 'September-2019', NULL, '2019-09-08 08:19:34', '2019-09-08 08:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `attributes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `status`, `attributes`, `created_at`, `updated_at`) VALUES
(1, 1, 'ASUS', 1, '[]', '2019-07-02 21:13:18', '2019-07-02 21:13:18'),
(2, 1, 'DELL', 1, '[]', '2019-07-02 21:13:26', '2019-07-02 21:13:26'),
(3, 2, 'Printers', 1, '[]', '2019-07-02 21:23:23', '2019-07-02 21:23:23'),
(4, 2, 'Wearables', 1, '[]', '2019-07-02 21:23:33', '2019-07-02 21:23:33'),
(5, 5, 'Xiaomi', 1, '[]', '2019-07-03 03:07:32', '2019-07-03 03:08:00'),
(6, 3, 'Shirt', 1, '{\"attributes\":[\"1\"]}', '2019-07-04 14:10:42', '2019-07-04 14:10:42'),
(7, 5, 'Samsung', 1, '[]', '2019-07-04 14:11:06', '2019-07-04 14:11:06'),
(10, 2, 'Smart Television', 1, '{\"attributes\":[\"4\",\"5\",\"6\"]}', '2019-07-06 12:08:49', '2019-07-06 12:08:49'),
(11, 5, 'Mi', 1, '[]', '2019-09-08 10:11:19', '2019-09-08 10:11:19'),
(12, 2, 'Cameras', 1, '[]', '2019-09-08 10:12:50', '2019-09-08 10:12:50'),
(13, 1, 'HP', 1, '[]', '2019-09-08 10:13:08', '2019-09-08 10:13:29'),
(14, 1, 'Acer', 1, '[]', '2019-09-08 10:13:18', '2019-09-08 10:13:18'),
(15, 4, 'Tops', 1, '{\"attributes\":[\"4\"]}', '2019-09-08 10:16:17', '2019-09-08 10:16:17'),
(16, 4, 'Salwar Kameez', 1, '{\"attributes\":[\"4\"]}', '2019-09-08 10:17:19', '2019-09-08 10:17:19'),
(17, 4, 'Footwear', 1, '{\"attributes\":[\"3\"]}', '2019-09-08 10:17:56', '2019-09-08 10:17:56'),
(18, 4, 'Bags', 1, '[]', '2019-09-08 10:18:10', '2019-09-08 10:18:10'),
(19, 6, 'Refrigerator', 1, '[]', '2019-09-08 10:20:02', '2019-09-08 10:20:02'),
(20, 6, 'Washing Machine', 1, '[]', '2019-09-08 10:20:15', '2019-09-08 10:20:15'),
(21, 6, 'Oven', 1, '[]', '2019-09-08 10:20:25', '2019-09-08 10:20:25'),
(22, 7, 'Skin Care', 1, '[]', '2019-09-08 10:21:27', '2019-09-08 10:21:27'),
(23, 7, 'Hair Care', 1, '[]', '2019-09-08 10:21:36', '2019-09-08 10:21:36'),
(24, 7, 'Bath & Body', 1, '[]', '2019-09-08 10:22:14', '2019-09-08 10:22:14'),
(25, 3, 'T-Shirt', 1, '{\"attributes\":[\"1\"]}', '2019-09-08 10:22:49', '2019-09-08 10:22:49'),
(26, 3, 'Footwear', 1, '{\"attributes\":[\"3\"]}', '2019-09-08 10:22:58', '2019-09-08 10:22:58'),
(27, 3, 'Pant', 1, '{\"attributes\":[\"2\"]}', '2019-09-08 10:23:12', '2019-09-08 10:23:12'),
(28, 8, 'Home Decor', 1, '[]', '2019-09-08 10:24:54', '2019-09-08 10:24:54'),
(29, 8, 'Home lighting', 1, '[]', '2019-09-08 10:25:05', '2019-09-08 10:25:05'),
(30, 9, 'Diary', 1, '[]', '2019-09-08 10:25:39', '2019-09-08 10:25:39'),
(31, 9, 'Gift Items', 1, '[]', '2019-09-08 10:25:57', '2019-09-08 10:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `subservices`
--

CREATE TABLE `subservices` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `used_coupons`
--

CREATE TABLE `used_coupons` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `used_coupons`
--

INSERT INTO `used_coupons` (`id`, `coupon_code`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'EMARKET123', 9, '2019-09-01 06:16:13', '2019-09-01 06:16:13'),
(2, 'BOISHAKH123', 9, '2019-09-01 06:24:41', '2019-09-01 06:24:41'),
(3, 'NEW123', 9, '2019-09-01 07:12:48', '2019-09-01 07:12:48');

-- --------------------------------------------------------

--
-- Table structure for table `userbookings`
--

CREATE TABLE `userbookings` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userorders`
--

CREATE TABLE `userorders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `email_verified` int(3) DEFAULT NULL,
  `vsent` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(255) DEFAULT NULL,
  `email_ver_code` int(11) DEFAULT NULL,
  `email_sent` int(3) NOT NULL DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `address`, `city`, `zip_code`, `status`, `email_verified`, `vsent`, `remember_token`, `email_ver_code`, `email_sent`, `password`, `created_at`, `updated_at`) VALUES
(3, 'Papan', 'Bishal', 'Basak', 'Male', '1998-10-16', 'bbasakpapan@gmail.com', '01819808027', 'BUET, Dhaka', 'Dhaka', '1205', 'active', 1, 1561289342, 'WBTDNhb7jQa8nxYZZ1mKadQPHMdkgYod5pSdxh9bMkGgVnCkwAh9VTxNDrpz', 5877, 0, '$2y$10$wkGQ8HIvsmooCTF5R5szOOcIVqdY10ZB0tDlRPGfJWhwpi3PNAkDy', '2019-06-23 05:29:02', '2019-07-07 03:38:31'),
(4, 'bbp', NULL, NULL, NULL, NULL, '1505043.bbp@gmail.com', '1223344', NULL, NULL, NULL, 'active', 0, 1561293463, 'kKQQmQMkWOzTHAh802tnPtiH7fe5CZWNVZMHr1w0DYm79sLaHPj56VwlchHK', 7930, 1, '$2y$10$H63X5rV7rL4yVQFeDIOX5.Rfj4Hfwejlf1ZB7wYZ.m2lHVzOQpoPe', '2019-06-23 06:37:43', '2019-06-23 06:37:43'),
(5, 'Bishal', NULL, NULL, NULL, NULL, '1505043.bbp@ugrad.cse.buet.ac.bd', '122334456', NULL, NULL, NULL, 'active', 1, 1561293556, 'lP2FOesm6q2bkpMg5TIvP3hxcSfVkJHfeVhyooWs4fIQOLuM52G3SnBJn03D', 9827, 0, '$2y$10$HTPqslQEwMgcc5kSmzqWUuMgFIgWxhhbsV1Ym0Q9jPYHIbEZBNfY6', '2019-06-23 06:39:16', '2019-06-23 06:39:33'),
(6, 'Altman', NULL, NULL, NULL, NULL, 'altman.an@outlook.com', '0112112112', NULL, NULL, NULL, 'active', 0, 1561298375, 'yHaKIoRxOLVVNbGdbhjfBMNgD1isamPSTwbbtrJLHG0amVrdk3tEwJiQGDtD', 5047, 1, '$2y$10$yG8gh5.UOwzjMi1zh2/kGe753IaR6ChMtUnWaQoXK9kz2h2gOft7i', '2019-06-23 07:59:35', '2019-06-23 07:59:35'),
(9, 'Abhik', 'Abhik', 'Bhattacharjee', 'Male', '1998-07-30', 'abhikbhattacharjee66@gmail.com', '01949517422', '12 Elephant Road', 'Dhaka', '1000', 'active', 1, 1562945441, 'WXAtpb8UDGdfcaA5mkS7ShgdGqSMEmN8yrnXzsk4kEJdWsEbZnghZOzezZyq', 7436, 0, '$2y$10$Jhtv42XP7EM6Qj1qGGhqjeFahsn.x8O/l.SgvnnW1oUwx.2t1cMWe', '2019-07-12 09:30:41', '2019-07-17 02:15:11'),
(10, 'Prova', 'Rudaiba', 'Adnin', NULL, NULL, 'rudaibaadnin@gmail.com', '01949517422', '12 Elephant Road', 'Dhaka', '1200', 'active', 1, 1567588727, NULL, 1529, 0, '$2y$10$jGsvkp3/bROIcpM76amd9u23YxQ70cmwS/UygiM/wpZuUur8lQzc6', '2019-09-04 03:18:47', '2019-09-04 03:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `products` int(11) DEFAULT '0' COMMENT 'No of products',
  `logo` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `email_verified` int(3) DEFAULT NULL,
  `vsent` int(11) NOT NULL DEFAULT '0',
  `email_ver_code` int(11) DEFAULT NULL,
  `email_sent` int(3) NOT NULL DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  `approved` int(3) NOT NULL DEFAULT '0' COMMENT '0-pending, 1-approve, -1- reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `shop_name`, `email`, `phone`, `address`, `zip_code`, `remember_token`, `products`, `logo`, `status`, `email_verified`, `vsent`, `email_ver_code`, `email_sent`, `password`, `approved`, `created_at`, `updated_at`) VALUES
(3, '1to99', 'papan961016@gmail.com', '01774964765', 'Polashi, Dhaka', NULL, '9z0ZDrPRGFTjMo7UjEYtqgEvjd77zjX5P1937tJoFTsZLxN15NpCu32Nq4VC', 0, '1561290407.jpg', 'active', NULL, 0, NULL, 0, '$2y$10$42rXGCZJZS9stjP4aCXfB.D3bSdG0PF4myOrKi8/2yWUX2FqqAg6e', 1, '2019-06-23 05:43:43', '2019-06-23 05:57:30'),
(4, 'megaX', '123.abc@gmail.com', '01345678911', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$Uu4WNrskMJ2VdtE24oLeLOhCqBwGek3lGZrcxpzE7IvDotZoLKqzW', -1, '2019-06-23 06:48:28', '2019-06-23 07:42:10'),
(5, 'We Accessories', 'papan@gmail.com', '11222333344', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$ojOawrEWxNDxXuuPCK3jMel2zs4tWFSKlxSOGwO.x05MYyJc0ouOW', -1, '2019-06-23 06:53:29', '2019-06-23 07:41:59'),
(6, 'Smart Varieties', 'smartvarieties@gmail.com', '01229922991', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$qjlQYPwhdAZ2n2OQM9HiIeu5iG18cgjWlw4AkQ9p0KcpBe9j2WBRu', 1, '2019-06-23 06:57:46', '2019-06-23 07:41:42'),
(7, 'Good Foods', 'goodfoodsbd@mail.com', '01111222939', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$bM90EL57OdsbaGu2Cl.zP.w0QSu6JRXHAVCjgw8MLlWrVhpdCPT1m', 1, '2019-06-23 07:00:16', '2019-06-23 07:41:31'),
(8, 'All-in-One Megashop', 'allinonemega.1@yahoo.com', '02122234211', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$2YTjNUYu6Fi9xfctT3uePugKHxYXq4yaeVYmZ.F.xHlSEfFWbSRaa', -1, '2019-06-23 07:02:05', '2019-06-23 07:40:59'),
(9, 'Royal Sports', 'royalsports@outlook.com', '15566112222', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$fAxMWjT2yM6CIwdla8MUzu9YI0r4vFFl3ZackEjhGl5sSWNQt3Gcu', 1, '2019-06-23 07:05:23', '2019-06-23 07:40:28'),
(10, 'Fancy Dress', 'fancydressbd@gmail.com', '1223344433', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$Cw54AUJ1wViBAzZENTKP7OHFNuDARfnRHX2jqTkz7WhEXKR6kT45K', -1, '2019-06-23 07:13:52', '2019-06-23 07:38:02'),
(11, 'Easy-go Telecom', 'easygotel@outlook.com', '01445678922', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$sbp2PaHGkv0o2R6xfBENXekPnunzZ5htO7UN.Vr6KFfcq6Gx35kmK', -1, '2019-06-23 07:26:43', '2019-07-17 02:52:55'),
(12, 'Robo Electronics', 'roboelectronics@gmail.com', '01227715992', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$RpAcw3olQc7TnC1PV71QKuL/qZ16Xdtb5tr2KGQADQl6lQOF9awcW', 1, '2019-06-23 07:28:46', '2019-07-12 11:11:29'),
(13, 'Spring Clothes', 'springclothing@yahoo.com', '08809802727', NULL, NULL, 'JvBcl8MASy2a8v12nRi4yK8Kes0Xir8bfI0U4MLg3EX3tLYifCcyIe2yO8Ag', 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$ojF5Ncx6aoFUCrTl2bisyOrLGjHAeXOsgVKDr4WAJqVkVpAT0c8iK', 1, '2019-06-23 07:31:37', '2019-06-23 07:47:01'),
(14, 'Swift Bakeries', 'swiftbakeriesbd@yahoo.com', '22233334477', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$pnMaXb0ngvg5fuOveTfax.UTP32DmsMMKr3KHxWhsxWkd5NsEAP7m', 1, '2019-06-23 07:33:07', '2019-07-12 10:52:48'),
(15, 'Kabir & Kabir Backpacks', 'kabirkabir@emark.ac.bd', '12233441122', NULL, NULL, 'MuqkeBFjoxl8EZzhmQM8VD0QNP5PI0k2JJlGCho1bCTKtmYsSFW90nNt2YFS', 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$NOH.ZQ9hn6wz8GMGT7piSu5bh/hEdECmqnSw3WMInLm4tlW7avl6G', 1, '2019-06-23 07:37:37', '2019-06-23 07:39:31'),
(16, 'megaX BD', 'abc.123@outlook.com', '12233441212', NULL, NULL, 'DCjBHX6mVo2yVFJ0uKjrqofObEcwOT2IboDc1KcWaS9z57BVrjIEGmPno0ep', 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$mW.CHMwU5WQ3jJePez3Ow.5vBRZ9WjJQee4OMH6JPC/lDCWUDCMlO', 1, '2019-06-23 07:48:49', '2019-06-23 07:48:59'),
(17, 'StarTech', 'abhikbhattacharjee66@gmail.com', '01949517422', '12, Elephant Road', NULL, '9vCWAHgyb9min7tzhvtTVwfhmTOXh2qJAyiIAOwwSXoZv5Q1T9b3YqKVOyWM', 0, '1562138100.jpg', 'active', NULL, 0, NULL, 0, '$2y$10$C7avMb9EPZLUwMfc8WGsb.WZy2GgZFXw8v5sv7IBlT658.N9.rdA.', 1, '2019-07-02 21:14:19', '2019-07-03 01:15:00'),
(18, 'Anik Electronics', 'bbasakpapan@gmail.com', '01819808027', 'Farmgate, Dhaka', NULL, '01EVSP1DG3zzj4heKw7wQmRqThSLAUY0Bi9rb4u2PUTXED8Qwl2Y8O8Jl2AX', 0, '1562438170.jpg', 'active', NULL, 0, NULL, 0, '$2y$10$XLGadhlXYXOct5L.Al1EpeVLzbfqgwVR8dVz/ped0g1VLVfOXQyXq', 1, '2019-07-06 10:35:22', '2019-07-06 12:45:05'),
(19, 'CracPlatoon', 'abhikbhattacharjee12@gmail.com', '01949517422', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$sXZh5PUdGigpo18gXIQ21.eZXc8fP2C69LgfdobiB0wN/hO5wTF5G', 1, '2019-07-21 08:57:11', '2019-07-21 08:57:51'),
(20, 'SampleShop', 'sample@gmail.com', '01949517422', NULL, NULL, NULL, 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$m.wdyltXAyuriS7utEy8x.Kqw8XcHMEOVMdEr/0fhe0E6wruy4EZi', -1, '2019-07-21 09:02:44', '2019-07-26 23:01:43'),
(21, 'ProvaShop', 'rudaibaadnin@yahoo.com', '01745847424', NULL, NULL, 'pGXzbXvv3tfmYGSpTvVK9CyT5xH6cHmMvog71arCwpnv4MGUrzrZmTQcBzOa', 0, NULL, 'active', NULL, 0, NULL, 0, '$2y$10$b.ORfshxu/CIMPnafrFSKOvCXxBhQA7l18FzJKODFu6AdtJUau/Om', 1, '2019-09-08 10:31:20', '2019-09-08 10:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_password_resets`
--

CREATE TABLE `vendor_password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_password_resets`
--

INSERT INTO `vendor_password_resets` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'papan961016@gmail.com', 'sxLtGPUa0TkdpXlN4ou2AyV2yVKiKm', 1, '2019-06-23 05:57:08', '2019-06-23 05:57:30'),
(2, 'bbasakpapan@gmail.com', 'nr5TAi7kMB0pLE9RIStfVfgpEByDHm', 1, '2019-07-06 00:39:28', '2019-07-06 12:45:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorits`
--
ALTER TABLE `favorits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderedproducts`
--
ALTER TABLE `orderedproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preview_images`
--
ALTER TABLE `preview_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `servicebookings`
--
ALTER TABLE `servicebookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceprovider_id` (`serviceprovider_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `serviceproviders`
--
ALTER TABLE `serviceproviders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subservice_id` (`subservice_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `servicereview`
--
ALTER TABLE `servicereview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceprovider_id` (`serviceprovider_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `subservices`
--
ALTER TABLE `subservices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `used_coupons`
--
ALTER TABLE `used_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userbookings`
--
ALTER TABLE `userbookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `userorders`
--
ALTER TABLE `userorders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_password_resets`
--
ALTER TABLE `vendor_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderedproducts`
--
ALTER TABLE `orderedproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `preview_images`
--
ALTER TABLE `preview_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `servicebookings`
--
ALTER TABLE `servicebookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceproviders`
--
ALTER TABLE `serviceproviders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicereview`
--
ALTER TABLE `servicereview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `subservices`
--
ALTER TABLE `subservices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `used_coupons`
--
ALTER TABLE `used_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userbookings`
--
ALTER TABLE `userbookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userorders`
--
ALTER TABLE `userorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vendor_password_resets`
--
ALTER TABLE `vendor_password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `favorits`
--
ALTER TABLE `favorits`
  ADD CONSTRAINT `favorits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorits_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `servicebookings`
--
ALTER TABLE `servicebookings`
  ADD CONSTRAINT `servicebookings_ibfk_1` FOREIGN KEY (`serviceprovider_id`) REFERENCES `serviceproviders` (`id`),
  ADD CONSTRAINT `servicebookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `servicebookings_ibfk_3` FOREIGN KEY (`serviceprovider_id`) REFERENCES `serviceproviders` (`id`),
  ADD CONSTRAINT `servicebookings_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `serviceproviders`
--
ALTER TABLE `serviceproviders`
  ADD CONSTRAINT `serviceproviders_ibfk_1` FOREIGN KEY (`subservice_id`) REFERENCES `subservices` (`id`),
  ADD CONSTRAINT `serviceproviders_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `servicereview`
--
ALTER TABLE `servicereview`
  ADD CONSTRAINT `servicereview_ibfk_1` FOREIGN KEY (`serviceprovider_id`) REFERENCES `serviceproviders` (`id`),
  ADD CONSTRAINT `servicereview_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `subservices`
--
ALTER TABLE `subservices`
  ADD CONSTRAINT `subservices_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `subservices` (`id`);

--
-- Constraints for table `userbookings`
--
ALTER TABLE `userbookings`
  ADD CONSTRAINT `userbookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userbookings_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `servicebookings` (`id`);

--
-- Constraints for table `userorders`
--
ALTER TABLE `userorders`
  ADD CONSTRAINT `userorders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userorders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
