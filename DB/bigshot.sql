-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2020 at 07:00 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bigshot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT 1,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin@email.com', '$2y$10$kWxHZoXuhxBiFY/vdokU0u9REwpd7EWV7kekYFaS6Kd9ro6fLwK4S', '65756756', 1, '1', '2020-10-28 12:11:44', '2020-10-29 05:18:53'),
(4, 'sahin', 'asdsad', 'sadasd', 'asdsadas', 4, 'asdsadsa', NULL, '2020-12-22 05:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `key_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_taxonomies`
--

CREATE TABLE `attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_taxonomies`
--

INSERT INTO `attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `status`, `attribute_public`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'select', 'menu_order', 1, 1, '2020-12-22 17:18:29', '2020-12-22 19:18:38'),
(2, 'Size', 'size', 'select', 'menu_order', 1, 1, '2020-12-22 17:18:42', '2020-12-22 17:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `expire_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_amount`, `coupon_type`, `expire_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '65', '1000', '1', '2020-12-23', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_termmeta`
--

CREATE TABLE `ecommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL,
  `ecommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_07_11_100407_create_admins_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 2),
(5, '2020_09_14_100203_create_wishlist', 2),
(10, '2020_10_28_105612_create_roles_table', 3),
(11, '2020_10_28_105713_create_permissions_table', 3),
(12, '2020_10_28_152329_create_permissions_table', 4),
(13, '2020_10_28_152345_create_roles_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_itemmeta`
--

CREATE TABLE `order_itemmeta` (
  `meta_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_itemmeta`
--

INSERT INTO `order_itemmeta` (`meta_id`, `order_item_id`, `meta_key`, `meta_value`, `order_id`, `order_date`, `customer_id`) VALUES
(1, 1, '_tax_class', '', '13', '2020-12-22', '23'),
(2, 1, '_qty', '2', '13', '2020-12-22', '23'),
(3, 1, '_product_id', '12', '13', '2020-12-22', '23'),
(4, 1, '_variation_id', '', '13', '2020-12-22', '23'),
(5, 1, '_line_subtotal', '5000', '13', '2020-12-22', '23'),
(6, 1, '_line_total', '5000', '13', '2020-12-22', '23'),
(7, 1, '_line_subtotal_tax', '', '13', '2020-12-22', '23'),
(8, 1, '_line_tax', '', '13', '2020-12-22', '23'),
(9, 1, '_line_tax_data', '2020-12-22 23:31:09', '13', '2020-12-22', '23'),
(10, 1, 'delivery_charge', '100', '13', '2020-12-22', '23'),
(11, 1, 'coupon_code', NULL, '13', '2020-12-22', '23'),
(12, 1, 'coupon_taka', '0', '13', '2020-12-22', '23'),
(13, 1, 'attribute_parent', '12', '13', '2020-12-22', '23'),
(14, 2, '_tax_class', '', '14', '2020-12-22', '23'),
(15, 2, '_qty', '1', '14', '2020-12-22', '23'),
(16, 2, '_product_id', '8', '14', '2020-12-22', '23'),
(17, 2, '_variation_id', '', '14', '2020-12-22', '23'),
(18, 2, '_line_subtotal', '3000', '14', '2020-12-22', '23'),
(19, 2, '_line_total', '3000', '14', '2020-12-22', '23'),
(20, 2, '_line_subtotal_tax', '', '14', '2020-12-22', '23'),
(21, 2, '_line_tax', '', '14', '2020-12-22', '23'),
(22, 2, '_line_tax_data', '2020-12-22 23:32:22', '14', '2020-12-22', '23'),
(23, 2, 'delivery_charge', '100', '14', '2020-12-22', '23'),
(24, 2, 'coupon_code', NULL, '14', '2020-12-22', '23'),
(25, 2, 'coupon_taka', '0', '14', '2020-12-22', '23'),
(26, 2, 'attribute_parent', '8', '14', '2020-12-22', '23'),
(27, 3, '_tax_class', '', '15', '2020-12-22', '23'),
(28, 3, '_qty', '2', '15', '2020-12-22', '23'),
(29, 3, '_product_id', '12', '15', '2020-12-22', '23'),
(30, 3, '_variation_id', '', '15', '2020-12-22', '23'),
(31, 3, '_line_subtotal', '5000', '15', '2020-12-22', '23'),
(32, 3, '_line_total', '5000', '15', '2020-12-22', '23'),
(33, 3, '_line_subtotal_tax', '', '15', '2020-12-22', '23'),
(34, 3, '_line_tax', '', '15', '2020-12-22', '23'),
(35, 3, '_line_tax_data', '2020-12-22 23:33:53', '15', '2020-12-22', '23'),
(36, 3, 'delivery_charge', '250', '15', '2020-12-22', '23'),
(37, 3, 'coupon_code', NULL, '15', '2020-12-22', '23'),
(38, 3, 'coupon_taka', '0', '15', '2020-12-22', '23'),
(39, 3, 'attribute_parent', '12', '15', '2020-12-22', '23'),
(40, 4, '_tax_class', '', '16', '2020-12-22', '23'),
(41, 4, '_qty', '0', '16', '2020-12-22', '23'),
(42, 4, '_product_id', '6', '16', '2020-12-22', '23'),
(43, 4, '_variation_id', '', '16', '2020-12-22', '23'),
(44, 4, '_line_subtotal', '40000', '16', '2020-12-22', '23'),
(45, 4, '_line_total', '40000', '16', '2020-12-22', '23'),
(46, 4, '_line_subtotal_tax', '', '16', '2020-12-22', '23'),
(47, 4, '_line_tax', '', '16', '2020-12-22', '23'),
(48, 4, '_line_tax_data', '2020-12-22 23:43:58', '16', '2020-12-22', '23'),
(49, 4, 'delivery_charge', '100', '16', '2020-12-22', '23'),
(50, 4, 'coupon_code', NULL, '16', '2020-12-22', '23'),
(51, 4, 'coupon_taka', '0', '16', '2020-12-22', '23'),
(52, 4, 'attribute_parent', '6', '16', '2020-12-22', '23'),
(53, 4, 'cancel_quantity', '10', '16', '2020-12-22', '23'),
(54, 5, '_tax_class', '', '17', '2020-12-22', '23'),
(55, 5, '_qty', '1', '17', '2020-12-22', '23'),
(56, 5, '_product_id', '6', '17', '2020-12-22', '23'),
(57, 5, '_variation_id', '', '17', '2020-12-22', '23'),
(58, 5, '_line_subtotal', '4000', '17', '2020-12-22', '23'),
(59, 5, '_line_total', '4000', '17', '2020-12-22', '23'),
(60, 5, '_line_subtotal_tax', '', '17', '2020-12-22', '23'),
(61, 5, '_line_tax', '', '17', '2020-12-22', '23'),
(62, 5, '_line_tax_data', '2020-12-22 23:44:56', '17', '2020-12-22', '23'),
(63, 5, 'delivery_charge', '250', '17', '2020-12-22', '23'),
(64, 5, 'coupon_code', NULL, '17', '2020-12-22', '23'),
(65, 5, 'coupon_taka', '0', '17', '2020-12-22', '23'),
(66, 5, 'attribute_parent', '6', '17', '2020-12-22', '23'),
(67, 6, '_tax_class', '', '18', '2020-12-22', '23'),
(68, 6, '_qty', '1', '18', '2020-12-22', '23'),
(69, 6, '_product_id', '12', '18', '2020-12-22', '23'),
(70, 6, '_variation_id', '', '18', '2020-12-22', '23'),
(71, 6, '_line_subtotal', '2500', '18', '2020-12-22', '23'),
(72, 6, '_line_total', '2500', '18', '2020-12-22', '23'),
(73, 6, '_line_subtotal_tax', '', '18', '2020-12-22', '23'),
(74, 6, '_line_tax', '', '18', '2020-12-22', '23'),
(75, 6, '_line_tax_data', '2020-12-22 23:45:17', '18', '2020-12-22', '23'),
(76, 6, 'delivery_charge', '100', '18', '2020-12-22', '23'),
(77, 6, 'coupon_code', NULL, '18', '2020-12-22', '23'),
(78, 6, 'coupon_taka', '0', '18', '2020-12-22', '23'),
(79, 6, 'attribute_parent', '12', '18', '2020-12-22', '23'),
(80, 7, '_tax_class', '', '19', '2020-12-22', '23'),
(81, 7, '_qty', '6', '19', '2020-12-22', '23'),
(82, 7, '_product_id', '8', '19', '2020-12-22', '23'),
(83, 7, '_variation_id', '', '19', '2020-12-22', '23'),
(84, 7, '_line_subtotal', '18000', '19', '2020-12-22', '23'),
(85, 7, '_line_total', '18000', '19', '2020-12-22', '23'),
(86, 7, '_line_subtotal_tax', '', '19', '2020-12-22', '23'),
(87, 7, '_line_tax', '', '19', '2020-12-22', '23'),
(88, 7, '_line_tax_data', '2020-12-22 23:46:08', '19', '2020-12-22', '23'),
(89, 7, 'delivery_charge', '100', '19', '2020-12-22', '23'),
(90, 7, 'coupon_code', NULL, '19', '2020-12-22', '23'),
(91, 7, 'coupon_taka', '0', '19', '2020-12-22', '23'),
(92, 7, 'attribute_parent', '8', '19', '2020-12-22', '23'),
(93, 8, '_tax_class', '', '20', '2020-12-22', '23'),
(94, 8, '_qty', '0', '20', '2020-12-22', '23'),
(95, 8, '_product_id', '4', '20', '2020-12-22', '23'),
(96, 8, '_variation_id', '', '20', '2020-12-22', '23'),
(97, 8, '_line_subtotal', '3000', '20', '2020-12-22', '23'),
(98, 8, '_line_total', '3000', '20', '2020-12-22', '23'),
(99, 8, '_line_subtotal_tax', '', '20', '2020-12-22', '23'),
(100, 8, '_line_tax', '', '20', '2020-12-22', '23'),
(101, 8, '_line_tax_data', '2020-12-22 23:47:04', '20', '2020-12-22', '23'),
(102, 8, 'delivery_charge', '250', '20', '2020-12-22', '23'),
(103, 8, 'coupon_code', NULL, '20', '2020-12-22', '23'),
(104, 8, 'coupon_taka', '0', '20', '2020-12-22', '23'),
(105, 8, 'attribute_parent', '4', '20', '2020-12-22', '23'),
(106, 8, 'cancel_quantity', '1', '20', '2020-12-22', '23'),
(107, 9, '_tax_class', '', '21', '2020-12-22', '23'),
(108, 9, '_qty', '1', '21', '2020-12-22', '23'),
(109, 9, '_product_id', '6', '21', '2020-12-22', '23'),
(110, 9, '_variation_id', '', '21', '2020-12-22', '23'),
(111, 9, '_line_subtotal', '4000', '21', '2020-12-22', '23'),
(112, 9, '_line_total', '4000', '21', '2020-12-22', '23'),
(113, 9, '_line_subtotal_tax', '', '21', '2020-12-22', '23'),
(114, 9, '_line_tax', '', '21', '2020-12-22', '23'),
(115, 9, '_line_tax_data', '2020-12-22 23:51:52', '21', '2020-12-22', '23'),
(116, 9, 'delivery_charge', '100', '21', '2020-12-22', '23'),
(117, 9, 'coupon_code', NULL, '21', '2020-12-22', '23'),
(118, 9, 'coupon_taka', '0', '21', '2020-12-22', '23'),
(119, 9, 'attribute_parent', '6', '21', '2020-12-22', '23'),
(120, 10, '_tax_class', '', '32', '2020-12-23', '23'),
(121, 10, '_qty', '1', '32', '2020-12-23', '23'),
(122, 10, '_product_id', '30', '32', '2020-12-23', '23'),
(123, 10, '_variation_id', '', '32', '2020-12-23', '23'),
(124, 10, '_line_subtotal', '6000', '32', '2020-12-23', '23'),
(125, 10, '_line_total', '6000', '32', '2020-12-23', '23'),
(126, 10, '_line_subtotal_tax', '', '32', '2020-12-23', '23'),
(127, 10, '_line_tax', '', '32', '2020-12-23', '23'),
(128, 10, '_line_tax_data', '2020-12-23 16:26:07', '32', '2020-12-23', '23'),
(129, 10, 'delivery_charge', '100', '32', '2020-12-23', '23'),
(130, 10, 'coupon_code', NULL, '32', '2020-12-23', '23'),
(131, 10, 'coupon_taka', '0', '32', '2020-12-23', '23'),
(132, 10, 'attribute_parent', '30', '32', '2020-12-23', '23'),
(133, 11, '_tax_class', '', '33', '2020-12-23', '23'),
(134, 11, '_qty', '3', '33', '2020-12-23', '23'),
(135, 11, '_product_id', '31', '33', '2020-12-23', '23'),
(136, 11, '_variation_id', '', '33', '2020-12-23', '23'),
(137, 11, '_line_subtotal', '12000', '33', '2020-12-23', '23'),
(138, 11, '_line_total', '12000', '33', '2020-12-23', '23'),
(139, 11, '_line_subtotal_tax', '', '33', '2020-12-23', '23'),
(140, 11, '_line_tax', '', '33', '2020-12-23', '23'),
(141, 11, '_line_tax_data', '2020-12-23 16:27:27', '33', '2020-12-23', '23'),
(142, 11, 'delivery_charge', '100', '33', '2020-12-23', '23'),
(143, 11, 'coupon_code', NULL, '33', '2020-12-23', '23'),
(144, 11, 'coupon_taka', '0', '33', '2020-12-23', '23'),
(145, 11, 'attribute_parent', '31', '33', '2020-12-23', '23'),
(146, 12, '_tax_class', '', '34', '2020-12-23', '23'),
(147, 12, '_qty', '3', '34', '2020-12-23', '23'),
(148, 12, '_product_id', '30', '34', '2020-12-23', '23'),
(149, 12, '_variation_id', '', '34', '2020-12-23', '23'),
(150, 12, '_line_subtotal', '12000', '34', '2020-12-23', '23'),
(151, 12, '_line_total', '12000', '34', '2020-12-23', '23'),
(152, 12, '_line_subtotal_tax', '', '34', '2020-12-23', '23'),
(153, 12, '_line_tax', '', '34', '2020-12-23', '23'),
(154, 12, '_line_tax_data', '2020-12-23 16:30:17', '34', '2020-12-23', '23'),
(155, 12, 'delivery_charge', '100', '34', '2020-12-23', '23'),
(156, 12, 'coupon_code', NULL, '34', '2020-12-23', '23'),
(157, 12, 'coupon_taka', '0', '34', '2020-12-23', '23'),
(158, 12, 'attribute_parent', '30', '34', '2020-12-23', '23'),
(159, 13, '_tax_class', '', '35', '2020-12-23', '0'),
(160, 13, '_qty', '1', '35', '2020-12-23', '0'),
(161, 13, '_product_id', '30', '35', '2020-12-23', '0'),
(162, 13, '_variation_id', '', '35', '2020-12-23', '0'),
(163, 13, '_line_subtotal', '6000', '35', '2020-12-23', '0'),
(164, 13, '_line_total', '6000', '35', '2020-12-23', '0'),
(165, 13, '_line_subtotal_tax', '', '35', '2020-12-23', '0'),
(166, 13, '_line_tax', '', '35', '2020-12-23', '0'),
(167, 13, '_line_tax_data', '2020-12-23 17:17:27', '35', '2020-12-23', '0'),
(168, 13, 'delivery_charge', '100', '35', '2020-12-23', '0'),
(169, 13, 'coupon_code', '65', '35', '2020-12-23', '0'),
(170, 13, 'coupon_taka', '1000', '35', '2020-12-23', '0'),
(171, 13, 'attribute_parent', '30', '35', '2020-12-23', '0'),
(172, 14, '_tax_class', '', '36', '2020-12-23', '23'),
(173, 14, '_qty', '1', '36', '2020-12-23', '23'),
(174, 14, '_product_id', '31', '36', '2020-12-23', '23'),
(175, 14, '_variation_id', '', '36', '2020-12-23', '23'),
(176, 14, '_line_subtotal', '4000', '36', '2020-12-23', '23'),
(177, 14, '_line_total', '4000', '36', '2020-12-23', '23'),
(178, 14, '_line_subtotal_tax', '', '36', '2020-12-23', '23'),
(179, 14, '_line_tax', '', '36', '2020-12-23', '23'),
(180, 14, '_line_tax_data', '2020-12-23 17:18:53', '36', '2020-12-23', '23'),
(181, 14, 'delivery_charge', '250', '36', '2020-12-23', '23'),
(182, 14, 'coupon_code', '65', '36', '2020-12-23', '23'),
(183, 14, 'coupon_taka', '1000', '36', '2020-12-23', '23'),
(184, 14, 'attribute_parent', '31', '36', '2020-12-23', '23'),
(185, 15, '_tax_class', '', '37', '2020-12-23', '23'),
(186, 15, '_qty', '1', '37', '2020-12-23', '23'),
(187, 15, '_product_id', '30', '37', '2020-12-23', '23'),
(188, 15, '_variation_id', '', '37', '2020-12-23', '23'),
(189, 15, '_line_subtotal', '4000', '37', '2020-12-23', '23'),
(190, 15, '_line_total', '4000', '37', '2020-12-23', '23'),
(191, 15, '_line_subtotal_tax', '', '37', '2020-12-23', '23'),
(192, 15, '_line_tax', '', '37', '2020-12-23', '23'),
(193, 15, '_line_tax_data', '2020-12-23 17:19:45', '37', '2020-12-23', '23'),
(194, 15, 'delivery_charge', '100', '37', '2020-12-23', '23'),
(195, 15, 'coupon_code', '65', '37', '2020-12-23', '23'),
(196, 15, 'coupon_taka', '1000', '37', '2020-12-23', '23'),
(197, 15, 'attribute_parent', '30', '37', '2020-12-23', '23'),
(198, 16, '_tax_class', '', '38', '2020-12-23', '23'),
(199, 16, '_qty', '1', '38', '2020-12-23', '23'),
(200, 16, '_product_id', '30', '38', '2020-12-23', '23'),
(201, 16, '_variation_id', '', '38', '2020-12-23', '23'),
(202, 16, '_line_subtotal', '3000', '38', '2020-12-23', '23'),
(203, 16, '_line_total', '3000', '38', '2020-12-23', '23'),
(204, 16, '_line_subtotal_tax', '', '38', '2020-12-23', '23'),
(205, 16, '_line_tax', '', '38', '2020-12-23', '23'),
(206, 16, '_line_tax_data', '2020-12-23 17:20:31', '38', '2020-12-23', '23'),
(207, 16, 'delivery_charge', '100', '38', '2020-12-23', '23'),
(208, 16, 'coupon_code', '65', '38', '2020-12-23', '23'),
(209, 16, 'coupon_taka', '1000', '38', '2020-12-23', '23'),
(210, 16, 'attribute_parent', '30', '38', '2020-12-23', '23'),
(211, 17, '_tax_class', '', '39', '2020-12-23', '23'),
(212, 17, '_qty', '1', '39', '2020-12-23', '23'),
(213, 17, '_product_id', '6', '39', '2020-12-23', '23'),
(214, 17, '_variation_id', '', '39', '2020-12-23', '23'),
(215, 17, '_line_subtotal', '4000', '39', '2020-12-23', '23'),
(216, 17, '_line_total', '4000', '39', '2020-12-23', '23'),
(217, 17, '_line_subtotal_tax', '', '39', '2020-12-23', '23'),
(218, 17, '_line_tax', '', '39', '2020-12-23', '23'),
(219, 17, '_line_tax_data', '2020-12-23 17:21:53', '39', '2020-12-23', '23'),
(220, 17, 'delivery_charge', '100', '39', '2020-12-23', '23'),
(221, 17, 'coupon_code', '65', '39', '2020-12-23', '23'),
(222, 17, 'coupon_taka', '1000', '39', '2020-12-23', '23'),
(223, 17, 'attribute_parent', '6', '39', '2020-12-23', '23'),
(224, 18, '_tax_class', '', '40', '2020-12-23', '2'),
(225, 18, '_qty', '0', '40', '2020-12-23', '2'),
(226, 18, '_product_id', '6', '40', '2020-12-23', '2'),
(227, 18, '_variation_id', '', '40', '2020-12-23', '2'),
(228, 18, '_line_subtotal', '4000', '40', '2020-12-23', '2'),
(229, 18, '_line_total', '4000', '40', '2020-12-23', '2'),
(230, 18, '_line_subtotal_tax', '', '40', '2020-12-23', '2'),
(231, 18, '_line_tax', '', '40', '2020-12-23', '2'),
(232, 18, '_line_tax_data', '2020-12-23 18:11:56', '40', '2020-12-23', '2'),
(233, 18, 'delivery_charge', '100', '40', '2020-12-23', '2'),
(234, 18, 'coupon_code', NULL, '40', '2020-12-23', '2'),
(235, 18, 'coupon_taka', '0', '40', '2020-12-23', '2'),
(236, 18, 'attribute_parent', '6', '40', '2020-12-23', '2'),
(237, 19, '_tax_class', '', '40', '2020-12-23', '2'),
(238, 19, '_qty', '0', '40', '2020-12-23', '2'),
(239, 19, '_product_id', '2', '40', '2020-12-23', '2'),
(240, 19, '_variation_id', '', '40', '2020-12-23', '2'),
(241, 19, '_line_subtotal', '3000', '40', '2020-12-23', '2'),
(242, 19, '_line_total', '3000', '40', '2020-12-23', '2'),
(243, 19, '_line_subtotal_tax', '', '40', '2020-12-23', '2'),
(244, 19, '_line_tax', '', '40', '2020-12-23', '2'),
(245, 19, '_line_tax_data', '2020-12-23 18:11:56', '40', '2020-12-23', '2'),
(246, 19, 'delivery_charge', '100', '40', '2020-12-23', '2'),
(247, 19, 'coupon_code', NULL, '40', '2020-12-23', '2'),
(248, 19, 'coupon_taka', '0', '40', '2020-12-23', '2'),
(249, 19, 'attribute_parent', '2', '40', '2020-12-23', '2'),
(250, 20, '_tax_class', '', '40', '2020-12-23', '2'),
(251, 20, '_qty', '0', '40', '2020-12-23', '2'),
(252, 20, '_product_id', '26', '40', '2020-12-23', '2'),
(253, 20, '_variation_id', '', '40', '2020-12-23', '2'),
(254, 20, '_line_subtotal', '4000', '40', '2020-12-23', '2'),
(255, 20, '_line_total', '4000', '40', '2020-12-23', '2'),
(256, 20, '_line_subtotal_tax', '', '40', '2020-12-23', '2'),
(257, 20, '_line_tax', '', '40', '2020-12-23', '2'),
(258, 20, '_line_tax_data', '2020-12-23 18:11:56', '40', '2020-12-23', '2'),
(259, 20, 'delivery_charge', '100', '40', '2020-12-23', '2'),
(260, 20, 'coupon_code', NULL, '40', '2020-12-23', '2'),
(261, 20, 'coupon_taka', '0', '40', '2020-12-23', '2'),
(262, 20, 'attribute_parent', '26', '40', '2020-12-23', '2'),
(263, 18, 'cancel_quantity', '1', '40', '2020-12-23', '2'),
(264, 19, 'cancel_quantity', '1', '40', '2020-12-23', '2'),
(265, 20, 'cancel_quantity', '1', '40', '2020-12-23', '2'),
(266, 21, '_tax_class', '', '41', '2020-12-23', '2'),
(267, 21, '_qty', '0', '41', '2020-12-23', '2'),
(268, 21, '_product_id', '27', '41', '2020-12-23', '2'),
(269, 21, '_variation_id', '', '41', '2020-12-23', '2'),
(270, 21, '_line_subtotal', '4000', '41', '2020-12-23', '2'),
(271, 21, '_line_total', '4000', '41', '2020-12-23', '2'),
(272, 21, '_line_subtotal_tax', '', '41', '2020-12-23', '2'),
(273, 21, '_line_tax', '', '41', '2020-12-23', '2'),
(274, 21, '_line_tax_data', '2020-12-23 18:42:16', '41', '2020-12-23', '2'),
(275, 21, 'delivery_charge', '250', '41', '2020-12-23', '2'),
(276, 21, 'coupon_code', NULL, '41', '2020-12-23', '2'),
(277, 21, 'coupon_taka', '0', '41', '2020-12-23', '2'),
(278, 21, 'attribute_parent', '27', '41', '2020-12-23', '2'),
(279, 22, '_tax_class', '', '42', '2020-12-23', '2'),
(280, 22, '_qty', '0', '42', '2020-12-23', '2'),
(281, 22, '_product_id', '28', '42', '2020-12-23', '2'),
(282, 22, '_variation_id', '', '42', '2020-12-23', '2'),
(283, 22, '_line_subtotal', '12000', '42', '2020-12-23', '2'),
(284, 22, '_line_total', '12000', '42', '2020-12-23', '2'),
(285, 22, '_line_subtotal_tax', '', '42', '2020-12-23', '2'),
(286, 22, '_line_tax', '', '42', '2020-12-23', '2'),
(287, 22, '_line_tax_data', '2020-12-23 18:48:55', '42', '2020-12-23', '2'),
(288, 22, 'delivery_charge', '100', '42', '2020-12-23', '2'),
(289, 22, 'coupon_code', NULL, '42', '2020-12-23', '2'),
(290, 22, 'coupon_taka', '0', '42', '2020-12-23', '2'),
(291, 22, 'attribute_parent', '28', '42', '2020-12-23', '2'),
(292, 22, 'cancel_quantity', '1', '42', '2020-12-23', '2'),
(293, 22, 'cancel_quantity', '1', '42', '2020-12-23', '2'),
(294, 22, 'cancel_quantity', '1', '42', '2020-12-23', '2'),
(295, 21, 'cancel_quantity', '1', '41', '2020-12-23', '2'),
(296, 23, '_tax_class', '', '43', '2020-12-23', '2'),
(297, 23, '_qty', '0', '43', '2020-12-23', '2'),
(298, 23, '_product_id', '26', '43', '2020-12-23', '2'),
(299, 23, '_variation_id', '', '43', '2020-12-23', '2'),
(300, 23, '_line_subtotal', '12000', '43', '2020-12-23', '2'),
(301, 23, '_line_total', '12000', '43', '2020-12-23', '2'),
(302, 23, '_line_subtotal_tax', '', '43', '2020-12-23', '2'),
(303, 23, '_line_tax', '', '43', '2020-12-23', '2'),
(304, 23, '_line_tax_data', '2020-12-23 19:55:58', '43', '2020-12-23', '2'),
(305, 23, 'delivery_charge', '100', '43', '2020-12-23', '2'),
(306, 23, 'coupon_code', NULL, '43', '2020-12-23', '2'),
(307, 23, 'coupon_taka', '0', '43', '2020-12-23', '2'),
(308, 23, 'attribute_parent', '26', '43', '2020-12-23', '2'),
(309, 23, 'cancel_quantity', '2', '43', '2020-12-23', '2'),
(310, 23, 'cancel_quantity', '2', '43', '2020-12-23', '2'),
(311, 23, 'cancel_quantity', '1', '43', '2020-12-23', '2'),
(312, 24, '_tax_class', '', '44', '2020-12-23', '2'),
(313, 24, '_qty', '0', '44', '2020-12-23', '2'),
(314, 24, '_product_id', '26', '44', '2020-12-23', '2'),
(315, 24, '_variation_id', '', '44', '2020-12-23', '2'),
(316, 24, '_line_subtotal', '12000', '44', '2020-12-23', '2'),
(317, 24, '_line_total', '12000', '44', '2020-12-23', '2'),
(318, 24, '_line_subtotal_tax', '', '44', '2020-12-23', '2'),
(319, 24, '_line_tax', '', '44', '2020-12-23', '2'),
(320, 24, '_line_tax_data', '2020-12-23 20:04:17', '44', '2020-12-23', '2'),
(321, 24, 'delivery_charge', '100', '44', '2020-12-23', '2'),
(322, 24, 'coupon_code', NULL, '44', '2020-12-23', '2'),
(323, 24, 'coupon_taka', '0', '44', '2020-12-23', '2'),
(324, 24, 'attribute_parent', '26', '44', '2020-12-23', '2'),
(325, 24, 'cancel_quantity', '2', '44', '2020-12-23', '2'),
(326, 24, 'cancel_quantity', '1', '44', '2020-12-23', '2'),
(327, 25, '_tax_class', '', '45', '2020-12-23', '2'),
(328, 25, '_qty', '1', '45', '2020-12-23', '2'),
(329, 25, '_product_id', '25', '45', '2020-12-23', '2'),
(330, 25, '_variation_id', '', '45', '2020-12-23', '2'),
(331, 25, '_line_subtotal', '4000', '45', '2020-12-23', '2'),
(332, 25, '_line_total', '4000', '45', '2020-12-23', '2'),
(333, 25, '_line_subtotal_tax', '', '45', '2020-12-23', '2'),
(334, 25, '_line_tax', '', '45', '2020-12-23', '2'),
(335, 25, '_line_tax_data', '2020-12-23 20:10:24', '45', '2020-12-23', '2'),
(336, 25, 'delivery_charge', '250', '45', '2020-12-23', '2'),
(337, 25, 'coupon_code', NULL, '45', '2020-12-23', '2'),
(338, 25, 'coupon_taka', '0', '45', '2020-12-23', '2'),
(339, 25, 'attribute_parent', '25', '45', '2020-12-23', '2');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `product_id`, `order_id`, `product_parent`) VALUES
(1, 'Men jacket', 'line-item', '12', 13, '7'),
(2, 'silk saree', 'line-item', '8', 14, '7'),
(3, 'Men jacket', 'line-item', '12', 15, '7'),
(4, 'Men\'s Panjabi', 'line-item', '6', 16, '6'),
(5, 'Men\'s Panjabi', 'line-item', '6', 17, '6'),
(6, 'Men jacket', 'line-item', '12', 18, '7'),
(7, 'silk saree', 'line-item', '8', 19, '7'),
(8, 'silk saree', 'line-item', '4', 20, '1'),
(9, 'Men\'s Panjabi', 'line-item', '6', 21, '6'),
(10, 'women shoes', 'line-item', '30', 32, '29'),
(11, 'Men shoes', 'line-item', '31', 33, '29'),
(12, 'Men shoes', 'line-item', '30', 34, '29'),
(13, 'women shoes', 'line-item', '30', 35, '29'),
(14, 'Men shoes', 'line-item', '31', 36, '29'),
(15, 'Men shoes', 'line-item', '30', 37, '29'),
(16, 'silk saree', 'line-item', '30', 38, '29'),
(17, 'Men\'s Panjabi', 'line-item', '6', 39, '6'),
(18, 'Men\'s Panjabi', 'line-item', '6', 40, '6'),
(19, 'silk saree', 'line-item', '2', 40, '1'),
(20, 'Men shoes', 'line-item', '26', 40, '24'),
(21, 'Men shoes', 'line-item', '27', 41, '24'),
(22, 'Men shoes', 'line-item', '28', 42, '24'),
(23, 'Men shoes', 'line-item', '26', 43, '24'),
(24, 'Men shoes', 'line-item', '26', 44, '24'),
(25, 'Men shoes', 'line-item', '25', 45, '24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('parthokar90@gmail.com', '$2y$10$UUrtTc333wwAHCTL5v0D1Ov4uGY9uze3gyQ7bJlOkiQgi.gjEcUT.', '2020-12-09 02:11:45'),
('hm.sohelrana95@gmail.com', '$2y$10$4pE.WW/O7mKL2UXr6babbeApI0AKDKFo7g4QxTKaAQ.aijFH7c90m', '2020-12-09 02:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tokenmeta`
--

CREATE TABLE `payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_tokens`
--

CREATE TABLE `payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'manage-dashboard', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(2, 'Category', 'create-category', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(3, 'Tag', 'manage-tag', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(4, 'Attribute', 'manage-attribute', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(5, 'Product', 'manage-product', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(6, 'Quick Report', 'quick-report', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(7, 'Order History', 'order-history', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(8, 'Send Parcel', 'send-parcel', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(9, 'Reject', 'manage-reject', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(10, 'Manage Stock', 'manage-stock', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(11, 'Customer List', 'manage-customer', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(13, 'Settings', 'manage-settings', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(14, 'Report', 'manage-report', '2020-10-28 10:48:52', '2020-10-28 10:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `postmeta`
--

CREATE TABLE `postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postmeta`
--

INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'stock_status', NULL),
(2, 1, 'regular_price', '4500'),
(3, 1, 'sale_price', '3000'),
(4, 1, 'weight', NULL),
(5, 1, 'length', NULL),
(6, 1, 'width', NULL),
(7, 1, 'height', NULL),
(8, 1, 'product_stock', '2000'),
(9, 1, 'start_stock', '2000'),
(10, 1, 'alert_qty', '100'),
(11, 1, '_sku', '300'),
(12, 1, 'attached_file', '1608636203.jpg'),
(13, 1, 'gallery_file', 'images (14).jpg'),
(14, 1, 'gallery_file', '71Gt8yOMV9L._UY550_.jpg'),
(15, 1, 'gallery_file', '41TJolbjFTL.jpg'),
(16, 1, 'gallery_file', 'SB1928_2.jpg'),
(17, 2, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"}]'),
(18, 1, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"}]'),
(19, 2, 'attribute_stock', '0'),
(20, 2, 'attribute_low_stock', '10'),
(21, 2, 'att_status', '1'),
(22, 3, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(23, 1, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(24, 3, 'attribute_stock', '100'),
(25, 3, 'attribute_low_stock', '10'),
(26, 3, 'att_status', '1'),
(27, 4, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"L\",\"term_id\":\"13\"}]'),
(28, 1, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"L\",\"term_id\":\"13\"}]'),
(29, 4, 'attribute_stock', '100'),
(30, 4, 'attribute_low_stock', '10'),
(31, 4, 'att_status', '1'),
(32, 5, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(33, 1, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(34, 5, 'attribute_stock', '0'),
(35, 5, 'attribute_low_stock', '10'),
(36, 5, 'att_status', '1'),
(37, 6, 'stock_status', 'instock'),
(38, 6, 'regular_price', '6000'),
(39, 6, 'sale_price', '4000'),
(40, 6, 'weight', NULL),
(41, 6, 'length', NULL),
(42, 6, 'width', NULL),
(43, 6, 'height', NULL),
(44, 6, 'product_stock', '2000'),
(45, 6, 'start_stock', '2000'),
(46, 6, 'default_qty', '40'),
(47, 6, 'alert_qty', '10'),
(48, 6, '_sku', '872'),
(49, 6, 'attached_file', '1608636334.jpg'),
(50, 6, 'gallery_file', 'sp715.jpg'),
(51, 6, 'gallery_file', '0009486_maroon-cotton-panjabi.jpeg'),
(52, 6, 'gallery_file', 'download (10).jpg'),
(53, 7, 'stock_status', 'instock'),
(54, 7, 'regular_price', '4500'),
(55, 7, 'sale_price', '2500'),
(56, 7, 'weight', NULL),
(57, 7, 'length', NULL),
(58, 7, 'width', NULL),
(59, 7, 'height', NULL),
(60, 7, 'product_stock', '1200'),
(61, 7, 'start_stock', '1200'),
(62, 7, 'alert_qty', '10'),
(63, 7, '_sku', '819'),
(64, 7, 'attached_file', '1608636519.jpg'),
(65, 7, 'gallery_file', '100-real-leather-new-men-black-classic-biker-leather-napa-fashions-jacket-bike-rock-p10554-54327_thumb.jpg'),
(66, 7, 'gallery_file', '100-real-leather-new-men-grey-soft-napa-classic-long-leather-jacket-with-four-buttons-p10535-54308_thumb.jpg'),
(67, 7, 'gallery_file', '100-real-leather-new-men-tan-soft-napa-classic-long-leather-jacket-with-four-buttons-p10534-54307_thumb.jpg'),
(68, 8, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"}]'),
(69, 7, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"}]'),
(70, 8, 'attribute_stock', '93'),
(71, 8, 'attribute_low_stock', '10'),
(72, 8, 'att_status', '1'),
(73, 9, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(74, 7, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(75, 9, 'attribute_stock', '100'),
(76, 9, 'attribute_low_stock', '10'),
(77, 9, 'att_status', '1'),
(78, 10, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"14\"}]'),
(79, 7, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Black\",\"term_id\":\"9\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"14\"}]'),
(80, 10, 'attribute_stock', '100'),
(81, 10, 'attribute_low_stock', '10'),
(82, 10, 'att_status', '1'),
(83, 11, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Green\",\"term_id\":\"7\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(84, 7, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Green\",\"term_id\":\"7\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(85, 11, 'attribute_stock', '100'),
(86, 11, 'attribute_low_stock', '10'),
(87, 11, 'att_status', '1'),
(88, 12, 'attribute', '[{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(89, 7, 'default_attribute', '[{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(90, 12, 'attribute_stock', '95'),
(91, 12, 'attribute_low_stock', '10'),
(92, 12, 'att_status', '1'),
(93, 13, 'first_name', 'Shah rukh'),
(94, 13, 'last_name', 'rana'),
(95, 13, 'address_one', 'dhaka'),
(96, 13, 'address_two', NULL),
(97, 13, 'phone', '123654987'),
(98, 13, 'email', 'sohelahmeditebd@gmail.com'),
(99, 13, 'country', 'Bangladesh'),
(100, 13, 'state', 'dhaka'),
(101, 13, 'city', 'uttara'),
(102, 13, 'zip', '1200'),
(103, 13, '_customer_user', '23'),
(104, 13, '_billing_postcode', '1200'),
(105, 13, '_billing_company', NULL),
(106, 13, '_billing_last_name', NULL),
(107, 13, '_billing_first_name', NULL),
(108, 13, 'payment_method', 'CashOnDelivery'),
(109, 14, 'first_name', 'Shah rukh'),
(110, 14, 'last_name', 'rana'),
(111, 14, 'address_one', 'dhaka'),
(112, 14, 'address_two', NULL),
(113, 14, 'phone', '123654987'),
(114, 14, 'email', 'sohelahmeditebd@gmail.com'),
(115, 14, 'country', 'Bangladesh'),
(116, 14, 'state', 'dhaka'),
(117, 14, 'city', 'uttara'),
(118, 14, 'zip', '1200'),
(119, 14, '_customer_user', '23'),
(120, 14, '_billing_postcode', '1200'),
(121, 14, '_billing_company', NULL),
(122, 14, '_billing_last_name', NULL),
(123, 14, '_billing_first_name', NULL),
(124, 14, 'payment_method', 'CashOnDelivery'),
(125, 15, 'first_name', 'Shah rukh'),
(126, 15, 'last_name', 'rana'),
(127, 15, 'address_one', 'dhaka'),
(128, 15, 'address_two', NULL),
(129, 15, 'phone', '123654987'),
(130, 15, 'email', 'sohelahmeditebd@gmail.com'),
(131, 15, 'country', 'Bangladesh'),
(132, 15, 'state', 'comilla'),
(133, 15, 'city', 'laksam'),
(134, 15, 'zip', '1300'),
(135, 15, '_customer_user', '23'),
(136, 15, '_billing_postcode', '1300'),
(137, 15, '_billing_company', NULL),
(138, 15, '_billing_last_name', NULL),
(139, 15, '_billing_first_name', NULL),
(140, 15, 'payment_method', 'CashOnDelivery'),
(141, 15, 'processing_date', '2020-12-22'),
(142, 13, 'processing_date', '2020-12-22'),
(143, 16, 'first_name', 'Shah rukh'),
(144, 16, 'last_name', 'rana'),
(145, 16, 'address_one', 'dhaka'),
(146, 16, 'address_two', NULL),
(147, 16, 'phone', '123654987'),
(148, 16, 'email', 'sohelahmeditebd@gmail.com'),
(149, 16, 'country', 'Bangladesh'),
(150, 16, 'state', 'dhaka'),
(151, 16, 'city', 'uttara'),
(152, 16, 'zip', '1200'),
(153, 16, '_customer_user', '23'),
(154, 16, '_billing_postcode', '1200'),
(155, 16, '_billing_company', NULL),
(156, 16, '_billing_last_name', NULL),
(157, 16, '_billing_first_name', NULL),
(158, 16, 'payment_method', 'CashOnDelivery'),
(159, 17, 'first_name', 'Shah rukh'),
(160, 17, 'last_name', 'rana'),
(161, 17, 'address_one', 'dhaka'),
(162, 17, 'address_two', NULL),
(163, 17, 'phone', '123654987'),
(164, 17, 'email', 'sohelahmeditebd@gmail.com'),
(165, 17, 'country', 'Bangladesh'),
(166, 17, 'state', 'comilla'),
(167, 17, 'city', 'laksam'),
(168, 17, 'zip', '1300'),
(169, 17, '_customer_user', '23'),
(170, 17, '_billing_postcode', '1300'),
(171, 17, '_billing_company', NULL),
(172, 17, '_billing_last_name', NULL),
(173, 17, '_billing_first_name', NULL),
(174, 17, 'payment_method', 'CashOnDelivery'),
(175, 18, 'first_name', 'Shah rukh'),
(176, 18, 'last_name', 'rana'),
(177, 18, 'address_one', 'dhaka'),
(178, 18, 'address_two', NULL),
(179, 18, 'phone', '123654987'),
(180, 18, 'email', 'sohelahmeditebd@gmail.com'),
(181, 18, 'country', 'Bangladesh'),
(182, 18, 'state', 'dhaka'),
(183, 18, 'city', 'uttara'),
(184, 18, 'zip', '1200'),
(185, 18, '_customer_user', '23'),
(186, 18, '_billing_postcode', '1200'),
(187, 18, '_billing_company', NULL),
(188, 18, '_billing_last_name', NULL),
(189, 18, '_billing_first_name', NULL),
(190, 18, 'payment_method', 'CashOnDelivery'),
(191, 19, 'first_name', 'Shah rukh'),
(192, 19, 'last_name', 'rana'),
(193, 19, 'address_one', 'dhaka'),
(194, 19, 'address_two', NULL),
(195, 19, 'phone', '123654987'),
(196, 19, 'email', 'sohelahmeditebd@gmail.com'),
(197, 19, 'country', 'Bangladesh'),
(198, 19, 'state', 'dhaka'),
(199, 19, 'city', 'uttara'),
(200, 19, 'zip', '1200'),
(201, 19, '_customer_user', '23'),
(202, 19, '_billing_postcode', '1200'),
(203, 19, '_billing_company', NULL),
(204, 19, '_billing_last_name', NULL),
(205, 19, '_billing_first_name', NULL),
(206, 19, 'payment_method', 'CashOnDelivery'),
(207, 20, 'first_name', 'Shah rukh'),
(208, 20, 'last_name', 'rana'),
(209, 20, 'address_one', 'dhaka'),
(210, 20, 'address_two', NULL),
(211, 20, 'phone', '123654987'),
(212, 20, 'email', 'sohelahmeditebd@gmail.com'),
(213, 20, 'country', 'Bangladesh'),
(214, 20, 'state', 'comilla'),
(215, 20, 'city', 'laksam'),
(216, 20, 'zip', '1300'),
(217, 20, '_customer_user', '23'),
(218, 20, '_billing_postcode', '1300'),
(219, 20, '_billing_company', NULL),
(220, 20, '_billing_last_name', NULL),
(221, 20, '_billing_first_name', NULL),
(222, 20, 'payment_method', 'CashOnDelivery'),
(223, 20, 'processing_date', '2020-12-22'),
(224, 19, 'processing_date', '2020-12-22'),
(225, 17, 'processing_date', '2020-12-22'),
(226, 21, 'first_name', 'Shah rukh'),
(227, 21, 'last_name', 'rana'),
(228, 21, 'address_one', 'dhaka'),
(229, 21, 'address_two', NULL),
(230, 21, 'phone', '123654987'),
(231, 21, 'email', 'sohelahmeditebd@gmail.com'),
(232, 21, 'country', 'Bangladesh'),
(233, 21, 'state', 'dhaka'),
(234, 21, 'city', 'uttara'),
(235, 21, 'zip', '1200'),
(236, 21, '_customer_user', '23'),
(237, 21, '_billing_postcode', '1200'),
(238, 21, '_billing_company', NULL),
(239, 21, '_billing_last_name', NULL),
(240, 21, '_billing_first_name', NULL),
(241, 21, 'payment_method', 'CashOnDelivery'),
(242, 22, 'banner_image', '1608638361.png'),
(243, 24, 'stock_status', 'instock'),
(244, 24, 'regular_price', '6000'),
(245, 24, 'sale_price', '4000'),
(246, 24, 'weight', NULL),
(247, 24, 'length', NULL),
(248, 24, 'width', NULL),
(249, 24, 'height', NULL),
(250, 24, 'product_stock', '3000'),
(251, 24, 'start_stock', '3000'),
(252, 24, 'alert_qty', '10'),
(253, 24, '_sku', '115'),
(254, 24, 'attached_file', '1608697159.jpg'),
(255, 24, 'gallery_file', 'hey-dude-slip-on-men-shoes-farty-chalet-funk-grey-textile-scotchgard-ö-leather-p10390-53593_thumb.png'),
(256, 24, 'gallery_file', 'hey-dude-slip-on-men-shoes-farty-chalet-ocean-blue-textile-scotchgard-ö-leather-p10389-53592_thumb.jpg'),
(257, 24, 'gallery_file', 'demonia-assault-101-black-ladies-ankle-boots-p2917-55655_thumb.jpg'),
(258, 24, 'gallery_file', 'pleaser-adore-1021-ladies-black-clear-platform-ankle-hell-boots-p2896-11583_thumb.jpg'),
(259, 25, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"}]'),
(260, 24, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"}]'),
(261, 25, 'attribute_stock', '99'),
(262, 25, 'attribute_low_stock', '10'),
(263, 25, 'att_status', '1'),
(264, 26, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Green\",\"term_id\":\"7\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"14\"}]'),
(265, 24, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Green\",\"term_id\":\"7\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"14\"}]'),
(266, 26, 'attribute_stock', '102'),
(267, 26, 'attribute_low_stock', '10'),
(268, 26, 'att_status', '1'),
(269, 27, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(270, 24, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(271, 27, 'attribute_stock', '100'),
(272, 27, 'attribute_low_stock', '10'),
(273, 27, 'att_status', '1'),
(274, 28, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Green\",\"term_id\":\"7\"},{\"taxonomy\":\"size\",\"term\":\"L\",\"term_id\":\"13\"}]'),
(275, 24, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Green\",\"term_id\":\"7\"},{\"taxonomy\":\"size\",\"term\":\"L\",\"term_id\":\"13\"}]'),
(276, 28, 'attribute_stock', '100'),
(277, 28, 'attribute_low_stock', '10'),
(278, 28, 'att_status', '1'),
(279, 29, 'stock_status', NULL),
(280, 29, 'regular_price', '8000'),
(281, 29, 'sale_price', '6000'),
(282, 29, 'weight', NULL),
(283, 29, 'length', NULL),
(284, 29, 'width', NULL),
(285, 29, 'height', NULL),
(286, 29, 'product_stock', '3000'),
(287, 29, 'start_stock', '3000'),
(288, 29, 'alert_qty', '20'),
(289, 29, '_sku', '550'),
(290, 29, 'attached_file', '1608697407.jpg'),
(291, 29, 'gallery_file', 'pleaser-adore-1020-ladies-black-mat-ankle-hell-boots-p2895-11582_thumb.jpg'),
(292, 29, 'gallery_file', 'pleaser-sky-301-ladies-black-glitter-7-heel-shoes-p3347-12868_related.jpg'),
(293, 29, 'gallery_file', 'pleaser-sky-301-ladies-black-transparent-2-band-7-heel-shoes-p3349-12870_related.jpg'),
(294, 30, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"},{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(295, 29, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"11\"},{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"X\",\"term_id\":\"12\"}]'),
(296, 30, 'attribute_stock', '0'),
(297, 30, 'attribute_low_stock', '20'),
(298, 30, 'att_status', '0'),
(299, 31, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"14\"}]'),
(300, 29, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"Red\",\"term_id\":\"6\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"14\"}]'),
(301, 31, 'attribute_stock', '13'),
(302, 31, 'attribute_low_stock', '20'),
(303, 31, 'att_status', '0'),
(304, 32, 'first_name', 'Shah rukh'),
(305, 32, 'last_name', 'rana'),
(306, 32, 'address_one', 'dhaka'),
(307, 32, 'address_two', NULL),
(308, 32, 'phone', '123654987'),
(309, 32, 'email', 'sohelahmeditebd@gmail.com'),
(310, 32, 'country', 'Bangladesh'),
(311, 32, 'state', 'dhaka'),
(312, 32, 'city', 'uttara'),
(313, 32, 'zip', '1200'),
(314, 32, '_customer_user', '23'),
(315, 32, '_billing_postcode', '1200'),
(316, 32, '_billing_company', NULL),
(317, 32, '_billing_last_name', NULL),
(318, 32, '_billing_first_name', NULL),
(319, 32, 'payment_method', 'CashOnDelivery'),
(320, 33, 'first_name', 'Shah rukh'),
(321, 33, 'last_name', 'rana'),
(322, 33, 'address_one', 'dhaka'),
(323, 33, 'address_two', NULL),
(324, 33, 'phone', '123654987'),
(325, 33, 'email', 'sohelahmeditebd@gmail.com'),
(326, 33, 'country', 'Bangladesh'),
(327, 33, 'state', 'dhaka'),
(328, 33, 'city', 'uttara'),
(329, 33, 'zip', '1200'),
(330, 33, '_customer_user', '23'),
(331, 33, '_billing_postcode', '1200'),
(332, 33, '_billing_company', NULL),
(333, 33, '_billing_last_name', NULL),
(334, 33, '_billing_first_name', NULL),
(335, 33, 'payment_method', 'FullPayment'),
(336, 33, 'processing_date', '2020-12-23'),
(337, 32, 'processing_date', '2020-12-23'),
(338, 34, 'first_name', 'Shah rukh'),
(339, 34, 'last_name', 'rana'),
(340, 34, 'address_one', 'dhaka'),
(341, 34, 'address_two', NULL),
(342, 34, 'phone', '123654987'),
(343, 34, 'email', 'sohelahmeditebd@gmail.com'),
(344, 34, 'country', 'Bangladesh'),
(345, 34, 'state', 'dhaka'),
(346, 34, 'city', 'uttara'),
(347, 34, 'zip', '1200'),
(348, 34, '_customer_user', '23'),
(349, 34, '_billing_postcode', '1200'),
(350, 34, '_billing_company', NULL),
(351, 34, '_billing_last_name', NULL),
(352, 34, '_billing_first_name', NULL),
(353, 34, 'payment_method', 'CashOnDelivery'),
(354, 34, 'processing_date', '2020-12-23'),
(355, 35, 'first_name', 'Guest'),
(356, 35, 'last_name', 'Guest'),
(357, 35, 'address_one', 'Uttara,Dhaka'),
(358, 35, 'address_two', NULL),
(359, 35, 'phone', '0000000001'),
(360, 35, 'email', 'guest@email.com'),
(361, 35, 'country', 'Bangladesh'),
(362, 35, 'state', 'dhaka'),
(363, 35, 'city', 'uttara'),
(364, 35, 'zip', '1200'),
(365, 35, '_customer_user', '0'),
(366, 35, '_billing_postcode', '1200'),
(367, 35, '_billing_company', NULL),
(368, 35, '_billing_last_name', NULL),
(369, 35, '_billing_first_name', NULL),
(370, 35, 'payment_method', 'CashOnDelivery'),
(371, 36, 'first_name', 'Shah rukh'),
(372, 36, 'last_name', 'rana'),
(373, 36, 'address_one', 'dhaka'),
(374, 36, 'address_two', NULL),
(375, 36, 'phone', '123654987'),
(376, 36, 'email', 'sohelahmeditebd@gmail.com'),
(377, 36, 'country', 'Bangladesh'),
(378, 36, 'state', 'comilla'),
(379, 36, 'city', 'laksam'),
(380, 36, 'zip', '1300'),
(381, 36, '_customer_user', '23'),
(382, 36, '_billing_postcode', '1300'),
(383, 36, '_billing_company', NULL),
(384, 36, '_billing_last_name', NULL),
(385, 36, '_billing_first_name', NULL),
(386, 36, 'payment_method', 'CashOnDelivery'),
(387, 37, 'first_name', 'Shah rukh'),
(388, 37, 'last_name', 'rana'),
(389, 37, 'address_one', 'dhaka'),
(390, 37, 'address_two', NULL),
(391, 37, 'phone', '123654987'),
(392, 37, 'email', 'sohelahmeditebd@gmail.com'),
(393, 37, 'country', 'Bangladesh'),
(394, 37, 'state', 'dhaka'),
(395, 37, 'city', 'uttara'),
(396, 37, 'zip', '1200'),
(397, 37, '_customer_user', '23'),
(398, 37, '_billing_postcode', '1200'),
(399, 37, '_billing_company', NULL),
(400, 37, '_billing_last_name', NULL),
(401, 37, '_billing_first_name', NULL),
(402, 37, 'payment_method', 'CashOnDelivery'),
(403, 38, 'first_name', 'Shah rukh'),
(404, 38, 'last_name', 'rana'),
(405, 38, 'address_one', 'dhaka'),
(406, 38, 'address_two', NULL),
(407, 38, 'phone', '123654987'),
(408, 38, 'email', 'sohelahmeditebd@gmail.com'),
(409, 38, 'country', 'Bangladesh'),
(410, 38, 'state', 'dhaka'),
(411, 38, 'city', 'uttara'),
(412, 38, 'zip', '1200'),
(413, 38, '_customer_user', '23'),
(414, 38, '_billing_postcode', '1200'),
(415, 38, '_billing_company', NULL),
(416, 38, '_billing_last_name', NULL),
(417, 38, '_billing_first_name', NULL),
(418, 38, 'payment_method', 'CashOnDelivery'),
(419, 39, 'first_name', 'Shah rukh'),
(420, 39, 'last_name', 'rana'),
(421, 39, 'address_one', 'dhaka'),
(422, 39, 'address_two', NULL),
(423, 39, 'phone', '123654987'),
(424, 39, 'email', 'sohelahmeditebd@gmail.com'),
(425, 39, 'country', 'Bangladesh'),
(426, 39, 'state', 'dhaka'),
(427, 39, 'city', 'uttara'),
(428, 39, 'zip', '1200'),
(429, 39, '_customer_user', '23'),
(430, 39, '_billing_postcode', '1200'),
(431, 39, '_billing_company', NULL),
(432, 39, '_billing_last_name', NULL),
(433, 39, '_billing_first_name', NULL),
(434, 39, 'payment_method', 'CashOnDelivery'),
(435, 40, 'first_name', 'Demo'),
(436, 40, 'last_name', 'Demo'),
(437, 40, 'address_one', 'Uttara'),
(438, 40, 'address_two', NULL),
(439, 40, 'phone', '6789'),
(440, 40, 'email', 'demo@email.com'),
(441, 40, 'country', 'Bangladesh'),
(442, 40, 'state', 'dhaka'),
(443, 40, 'city', 'uttara'),
(444, 40, 'zip', '1200'),
(445, 40, '_customer_user', '2'),
(446, 40, '_billing_postcode', '1200'),
(447, 40, '_billing_company', NULL),
(448, 40, '_billing_last_name', NULL),
(449, 40, '_billing_first_name', NULL),
(450, 40, 'payment_method', 'CashOnDelivery'),
(451, 41, 'first_name', 'Demo'),
(452, 41, 'last_name', 'Demo'),
(453, 41, 'address_one', 'Uttara'),
(454, 41, 'address_two', NULL),
(455, 41, 'phone', '6789'),
(456, 41, 'email', 'demo@email.com'),
(457, 41, 'country', 'Bangladesh'),
(458, 41, 'state', 'comilla'),
(459, 41, 'city', 'laksam'),
(460, 41, 'zip', '1300'),
(461, 41, '_customer_user', '2'),
(462, 41, '_billing_postcode', '1300'),
(463, 41, '_billing_company', NULL),
(464, 41, '_billing_last_name', NULL),
(465, 41, '_billing_first_name', NULL),
(466, 41, 'payment_method', 'CashOnDelivery'),
(467, 42, 'first_name', 'Demo'),
(468, 42, 'last_name', 'Demo'),
(469, 42, 'address_one', 'Uttara'),
(470, 42, 'address_two', NULL),
(471, 42, 'phone', '6789'),
(472, 42, 'email', 'demo@email.com'),
(473, 42, 'country', 'Bangladesh'),
(474, 42, 'state', 'dhaka'),
(475, 42, 'city', 'uttara'),
(476, 42, 'zip', '1200'),
(477, 42, '_customer_user', '2'),
(478, 42, '_billing_postcode', '1200'),
(479, 42, '_billing_company', NULL),
(480, 42, '_billing_last_name', NULL),
(481, 42, '_billing_first_name', NULL),
(482, 42, 'payment_method', 'CashOnDelivery'),
(483, 43, 'first_name', 'Demo'),
(484, 43, 'last_name', 'Demo'),
(485, 43, 'address_one', 'Uttara'),
(486, 43, 'address_two', NULL),
(487, 43, 'phone', '6789'),
(488, 43, 'email', 'demo@email.com'),
(489, 43, 'country', 'Bangladesh'),
(490, 43, 'state', 'dhaka'),
(491, 43, 'city', 'uttara'),
(492, 43, 'zip', '1200'),
(493, 43, '_customer_user', '2'),
(494, 43, '_billing_postcode', '1200'),
(495, 43, '_billing_company', NULL),
(496, 43, '_billing_last_name', NULL),
(497, 43, '_billing_first_name', NULL),
(498, 43, 'payment_method', 'CashOnDelivery'),
(499, 44, 'first_name', 'Demo'),
(500, 44, 'last_name', 'Demo'),
(501, 44, 'address_one', 'Uttara'),
(502, 44, 'address_two', NULL),
(503, 44, 'phone', '6789'),
(504, 44, 'email', 'demo@email.com'),
(505, 44, 'country', 'Bangladesh'),
(506, 44, 'state', 'dhaka'),
(507, 44, 'city', 'uttara'),
(508, 44, 'zip', '1200'),
(509, 44, '_customer_user', '2'),
(510, 44, '_billing_postcode', '1200'),
(511, 44, '_billing_company', NULL),
(512, 44, '_billing_last_name', NULL),
(513, 44, '_billing_first_name', NULL),
(514, 44, 'payment_method', 'CashOnDelivery'),
(515, 45, 'first_name', 'Demo'),
(516, 45, 'last_name', 'Demo'),
(517, 45, 'address_one', 'Uttara'),
(518, 45, 'address_two', NULL),
(519, 45, 'phone', '6789'),
(520, 45, 'email', 'demo@email.com'),
(521, 45, 'country', 'Bangladesh'),
(522, 45, 'state', 'comilla'),
(523, 45, 'city', 'laksam'),
(524, 45, 'zip', '1300'),
(525, 45, '_customer_user', '2'),
(526, 45, '_billing_postcode', '1300'),
(527, 45, '_billing_company', NULL),
(528, 45, '_billing_last_name', NULL),
(529, 45, '_billing_first_name', NULL),
(530, 45, 'payment_method', 'CashOnDelivery');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime DEFAULT current_timestamp(),
  `post_date_gmt` datetime DEFAULT current_timestamp(),
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime DEFAULT current_timestamp(),
  `post_modified_gmt` datetime NOT NULL DEFAULT current_timestamp(),
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 2, '2020-12-22 17:20:00', '2020-12-22 23:20:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', 'silk saree', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', 'publish', 'open', 'open', '', 'silk saree', '', '', '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', 0, '', 0, 'product', '', 0),
(2, 0, '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', 1, '', 0, 'product_varient', '', 0),
(3, 0, '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', 1, '', 0, 'product_varient', '', 0),
(4, 0, '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', 1, '', 0, 'product_varient', '', 0),
(5, 0, '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:23:23', '2020-12-22 19:23:23', '', 1, '', 0, 'product_varient', '', 0),
(6, 2, '2020-12-22 17:23:00', '2020-12-22 23:23:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', 'Men\'s Panjabi', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', 'publish', 'open', 'open', '', 'Men\'s Panjabi', '', '', '2020-12-22 19:25:34', '2020-12-22 19:25:34', '', 0, '', 0, 'product', '', 0),
(7, 2, '2020-12-22 17:25:00', '2020-12-22 23:25:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', 'Men jacket', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', 'publish', 'open', 'open', '', 'Men jacket', '', '', '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', 0, '', 0, 'product', '', 0),
(8, 0, '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', 7, '', 0, 'product_varient', '', 0),
(9, 0, '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', 7, '', 0, 'product_varient', '', 0),
(10, 0, '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', 7, '', 0, 'product_varient', '', 0),
(11, 0, '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', 7, '', 0, 'product_varient', '', 0),
(12, 0, '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:28:39', '2020-12-22 19:28:39', '', 7, '', 0, 'product_varient', '', 0),
(13, 23, '2020-12-22 00:00:00', '2020-12-22 23:31:09', '', 'Order2020-12-22 17:31:09', '', 'processing', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 17:40:17', '2020-12-22 19:31:09', '', 0, '', 0, 'shop_order', '', 0),
(14, 23, '2020-12-22 00:00:00', '2020-12-22 23:32:22', '', 'Order2020-12-22 17:32:22', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 19:32:22', '2020-12-22 19:32:22', '', 0, '', 0, 'shop_order', '', 0),
(15, 23, '2020-12-22 00:00:00', '2020-12-22 23:33:53', '', 'Order2020-12-22 17:33:53', '', 'dispatch_complete', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 17:42:25', '2020-12-22 19:33:53', '', 0, '', 0, 'shop_order', '', 0),
(16, 23, '2020-12-22 00:00:00', '2020-12-22 23:43:58', '', 'Order2020-12-22 17:43:58', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 19:43:58', '2020-12-22 19:43:58', '', 0, '', 0, 'shop_order', '', 0),
(17, 23, '2020-12-22 00:00:00', '2020-12-22 23:44:56', '', 'Order2020-12-22 17:44:56', '', 'processing', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 17:47:31', '2020-12-22 19:44:56', '', 0, '', 0, 'shop_order', '', 0),
(18, 23, '2020-12-22 00:00:00', '2020-12-22 23:45:17', '', 'Order2020-12-22 17:45:17', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 19:45:17', '2020-12-22 19:45:17', '', 0, '', 0, 'shop_order', '', 0),
(19, 23, '2020-12-22 00:00:00', '2020-12-22 23:46:08', '', 'Order2020-12-22 17:46:08', '', 'delivered', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 17:47:49', '2020-12-22 19:46:08', '', 0, '', 0, 'shop_order', '', 0),
(20, 23, '2020-12-22 00:00:00', '2020-12-22 23:47:04', '', 'Order2020-12-22 17:47:04', '', 'dispatch_complete', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 17:47:36', '2020-12-22 19:47:04', '', 0, '', 0, 'shop_order', '', 0),
(21, 23, '2020-12-22 00:00:00', '2020-12-22 23:51:52', '', 'Order2020-12-22 17:51:52', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-22-2020-1712', '', '', '2020-12-22 19:51:52', '2020-12-22 19:51:52', '', 0, '', 0, 'shop_order', '', 0),
(22, 2, '2020-12-22 17:59:00', '2020-12-22 23:59:00', 'Banner Image', 'Banner Image', 'Banner Image', 'publish', 'open', 'open', '', 'Banner Image', '', '', '2020-12-22 19:59:21', '2020-12-22 19:59:21', '', 0, '', 0, 'banner', '', 0),
(23, 23, '2020-12-22 19:59:47', '2020-12-22 19:59:47', 'klfsdj;oidsfa', 'vzhxbhj', 'hkjh', 'publish', 'open', 'open', '', '', '', '', '2020-12-22 19:59:47', '2020-12-22 19:59:47', '', 0, '', 0, 'genarel_quiry', '', 0),
(24, 2, '2020-12-23 10:15:00', '2020-12-23 16:15:00', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>', 'Men shoes', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>', 'publish', 'open', 'open', '', 'Men shoes', '', '', '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', 0, '', 0, 'product', '', 0),
(25, 0, '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', 24, '', 0, 'product_varient', '', 0),
(26, 0, '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', 24, '', 0, 'product_varient', '', 0),
(27, 0, '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', 24, '', 0, 'product_varient', '', 0),
(28, 0, '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-23 12:19:19', '2020-12-23 12:19:19', '', 24, '', 0, 'product_varient', '', 0),
(29, 2, '2020-12-23 10:20:00', '2020-12-23 16:20:00', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>', 'women shoes', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>', 'publish', 'open', 'open', '', 'women shoes', '', '', '2020-12-23 12:23:27', '2020-12-23 12:23:27', '', 0, '', 0, 'product', '', 0),
(30, 0, '2020-12-23 12:23:27', '2020-12-23 12:23:27', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-23 12:23:27', '2020-12-23 12:23:27', '', 29, '', 0, 'product_varient', '', 0),
(31, 0, '2020-12-23 12:23:27', '2020-12-23 12:23:27', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-23 12:23:27', '2020-12-23 12:23:27', '', 29, '', 0, 'product_varient', '', 0),
(32, 23, '2020-12-23 00:00:00', '2020-12-23 16:26:07', '', 'Order2020-12-23 10:26:07', '', 'dispatch_complete', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1012', '', '', '2020-12-23 10:28:22', '2020-12-23 12:26:07', '', 0, '', 0, 'shop_order', '', 0),
(33, 23, '2020-12-23 00:00:00', '2020-12-23 16:27:27', '', 'Order2020-12-23 10:27:27', '', 'delivered', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1012', '', '', '2020-12-23 10:28:33', '2020-12-23 12:27:27', '', 0, '', 0, 'shop_order', '', 0),
(34, 23, '2020-12-23 00:00:00', '2020-12-23 16:30:17', '', 'Order2020-12-23 10:30:17', '', 'dispatch_complete', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1012', '', '', '2020-12-23 17:58:42', '2020-12-23 12:30:17', '', 0, '', 0, 'shop_order', '', 0),
(35, 0, '2020-12-23 00:00:00', '2020-12-23 17:17:27', '', 'Order2020-12-23 11:17:27', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1112', '', '', '2020-12-23 13:17:27', '2020-12-23 13:17:27', '', 0, '', 0, 'shop_order', '', 0),
(36, 23, '2020-12-23 00:00:00', '2020-12-23 17:18:53', '', 'Order2020-12-23 11:18:53', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1112', '', '', '2020-12-23 13:18:53', '2020-12-23 13:18:53', '', 0, '', 0, 'shop_order', '', 0),
(37, 23, '2020-12-23 00:00:00', '2020-12-23 17:19:45', '', 'Order2020-12-23 11:19:45', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1112', '', '', '2020-12-23 13:19:45', '2020-12-23 13:19:45', '', 0, '', 0, 'shop_order', '', 0),
(38, 23, '2020-12-23 00:00:00', '2020-12-23 17:20:31', '', 'Order2020-12-23 11:20:31', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1112', '', '', '2020-12-23 13:20:31', '2020-12-23 13:20:31', '', 0, '', 0, 'shop_order', '', 0),
(39, 23, '2020-12-23 00:00:00', '2020-12-23 17:21:53', '', 'Order2020-12-23 11:21:53', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1112', '', '', '2020-12-23 13:21:53', '2020-12-23 13:21:53', '', 0, '', 0, 'shop_order', '', 0),
(40, 2, '2020-12-23 00:00:00', '2020-12-23 18:11:56', '', 'Order2020-12-23 12:11:56', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1212', '', '', '2020-12-23 12:11:56', '2020-12-23 12:11:56', '', 0, '', 0, 'shop_order', '', 0),
(41, 2, '2020-12-23 00:00:00', '2020-12-23 18:42:16', '', 'Order2020-12-23 12:42:16', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1212', '', '', '2020-12-23 12:42:16', '2020-12-23 12:42:16', '', 0, '', 0, 'shop_order', '', 0),
(42, 2, '2020-12-23 00:00:00', '2020-12-23 18:48:55', '', 'Order2020-12-23 12:48:55', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1212', '', '', '2020-12-23 12:48:55', '2020-12-23 12:48:55', '', 0, '', 0, 'shop_order', '', 0),
(43, 2, '2020-12-23 00:00:00', '2020-12-23 19:55:58', '', 'Order2020-12-23 13:55:58', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1312', '', '', '2020-12-23 14:03:00', '2020-12-23 13:55:58', '', 0, '', 0, 'shop_order', '', 0),
(44, 2, '2020-12-23 00:00:00', '2020-12-23 20:04:17', '', 'Order2020-12-23 14:04:17', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1412', '', '', '2020-12-23 14:04:00', '2020-12-23 14:04:17', '', 0, '', 0, 'shop_order', '', 0),
(45, 2, '2020-12-23 00:00:00', '2020-12-23 20:10:24', '', 'Order2020-12-23 14:10:24', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Dec-23-2020-1412', '', '', '2020-12-23 14:10:24', '2020-12-23 14:10:24', '', 0, '', 0, 'shop_order', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_attibutes`
--

CREATE TABLE `product_attibutes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxonomy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_attibutes`
--

INSERT INTO `product_attibutes` (`id`, `post_id`, `product_parent`, `taxonomy`, `term`, `term_id`, `parent_id`, `status`) VALUES
(1, 1, '2', 'color', 'Red', 6, 0, 1),
(2, 1, '2', 'size', 'XL', 11, 1, 1),
(3, 1, '3', 'color', 'Red', 6, 0, 1),
(4, 1, '3', 'size', 'X', 12, 3, 1),
(5, 1, '4', 'color', 'Black', 9, 0, 1),
(6, 1, '4', 'size', 'L', 13, 5, 1),
(7, 1, '5', 'color', 'Black', 9, 0, 1),
(8, 1, '5', 'size', 'X', 12, 7, 1),
(9, 7, '8', 'color', 'Black', 9, 0, 1),
(10, 7, '8', 'size', 'XL', 11, 9, 1),
(11, 7, '9', 'color', 'Black', 9, 0, 1),
(12, 7, '9', 'size', 'X', 12, 11, 1),
(13, 7, '10', 'color', 'Black', 9, 0, 1),
(14, 7, '10', 'size', 'M', 14, 13, 1),
(15, 7, '11', 'color', 'Green', 7, 0, 1),
(16, 7, '11', 'size', 'X', 12, 15, 1),
(17, 7, '12', 'size', 'X', 12, 0, 1),
(18, 24, '25', 'color', 'Red', 6, 0, 1),
(19, 24, '25', 'size', 'XL', 11, 18, 1),
(20, 24, '26', 'color', 'Green', 7, 0, 1),
(21, 24, '26', 'size', 'M', 14, 20, 1),
(22, 24, '27', 'color', 'Red', 6, 0, 1),
(23, 24, '27', 'size', 'X', 12, 22, 1),
(24, 24, '28', 'color', 'Green', 7, 0, 1),
(25, 24, '28', 'size', 'L', 13, 24, 1),
(26, 29, '30', 'color', 'Red', 6, 0, 0),
(27, 29, '30', 'size', 'XL', 11, 26, 0),
(28, 29, '30', 'color', 'Red', 6, 27, 0),
(29, 29, '30', 'size', 'X', 12, 28, 0),
(30, 29, '31', 'color', 'Red', 6, 0, 0),
(31, 29, '31', 'size', 'M', 14, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2020-10-28 10:48:52', '2020-11-15 04:01:36'),
(3, 'Editor', '', '2020-10-29 04:21:40', '2020-12-22 05:44:53'),
(4, 'partho', 'partho', '2020-12-22 05:45:07', '2020-12-22 05:45:07'),
(5, 'partho', 'partho', '2020-12-22 05:45:22', '2020-12-22 05:45:22'),
(6, 'partho', 'partho', '2020-12-22 05:46:01', '2020-12-22 05:46:01'),
(7, 'afd', 'afd', '2020-12-22 07:57:25', '2020-12-22 07:57:25'),
(8, 'fsfgs', 'fsfgs', '2020-12-22 08:43:45', '2020-12-22 08:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(1, 14),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` bigint(20) NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zones`
--

CREATE TABLE `shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zone_locations`
--

CREATE TABLE `shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zone_methods`
--

CREATE TABLE `shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_locations`
--

CREATE TABLE `tax_rate_locations` (
  `location_id` bigint(20) NOT NULL,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_attribute_stock`
--

CREATE TABLE `temp_attribute_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termmeta`
--

CREATE TABLE `termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `name`, `slug`, `term_group`, `status`, `createdDate`) VALUES
(1, 'Jacket', 'jacket', 0, 1, '2020-12-22 19:17:40'),
(2, 'saree', 'saree', 0, 1, '2020-12-22 19:17:45'),
(3, 'Panjabi', 'panjabi', 0, 1, '2020-12-22 19:17:53'),
(4, 'Women', 'women', 0, 1, '2020-12-22 19:17:59'),
(5, 'Men', 'men', 0, 1, '2020-12-22 19:18:03'),
(6, 'Red', 'red', 0, 1, '2020-12-22 17:18:50'),
(7, 'Green', 'green', 0, 1, '2020-12-22 17:19:00'),
(8, 'Blue', 'blue', 0, 1, '2020-12-22 17:19:06'),
(9, 'Black', 'black', 0, 1, '2020-12-22 17:19:19'),
(10, 'Black', 'black', 0, 1, '2020-12-22 17:19:53'),
(11, 'XL', 'xl', 0, 1, '2020-12-22 17:20:14'),
(12, 'X', 'x', 0, 1, '2020-12-22 17:20:21'),
(13, 'L', 'l', 0, 1, '2020-12-22 17:20:28'),
(14, 'M', 'm', 0, 1, '2020-12-22 17:20:31'),
(15, 'dhaka', 'dhaka', 0, 1, '2020-12-22 19:30:00'),
(16, 'uttara', 'uttara', 0, 1, '2020-12-22 19:30:16'),
(17, 'comilla', 'comilla', 0, 1, '2020-12-22 19:30:28'),
(18, 'laksam', 'laksam', 0, 1, '2020-12-22 19:30:41'),
(19, 'Shoes', 'shoes', 0, 1, '2020-12-23 12:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `term_relationships`
--

CREATE TABLE `term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_relationships`
--

INSERT INTO `term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 4, 0),
(1, 2, 0),
(6, 5, 0),
(6, 3, 0),
(7, 1, 0),
(7, 5, 0),
(24, 19, 0),
(24, 5, 0),
(29, 19, 0),
(29, 4, 0),
(46, 1, 0),
(46, 4, 0),
(47, 1, 0),
(47, 4, 0),
(48, 1, 0),
(48, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `term_taxonomy`
--

CREATE TABLE `term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_taxonomy`
--

INSERT INTO `term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`, `createdDate`) VALUES
(1, 1, 'product_cat', '', 0, 0, '2020-12-22 19:17:40'),
(2, 2, 'product_cat', '', 0, 0, '2020-12-22 19:17:45'),
(3, 3, 'product_cat', '', 0, 0, '2020-12-22 19:17:53'),
(4, 4, 'product_tag', '', 0, 0, '2020-12-22 19:17:59'),
(5, 5, 'product_tag', '', 0, 0, '2020-12-22 19:18:03'),
(6, 6, 'color', '', 0, 0, '2020-12-22 17:18:50'),
(7, 7, 'color', '', 0, 0, '2020-12-22 17:19:00'),
(8, 8, 'color', '', 0, 0, '2020-12-22 17:19:06'),
(9, 9, 'color', '', 0, 0, '2020-12-22 17:19:19'),
(10, 10, 'color', '', 0, 0, '2020-12-22 17:19:53'),
(11, 11, 'size', '', 0, 0, '2020-12-22 17:20:14'),
(12, 12, 'size', '', 0, 0, '2020-12-22 17:20:21'),
(13, 13, 'size', '', 0, 0, '2020-12-22 17:20:28'),
(14, 14, 'size', '', 0, 0, '2020-12-22 17:20:31'),
(15, 15, 'district', '100', 0, 0, '2020-12-22 19:30:00'),
(16, 16, 'city', NULL, 15, 0, '2020-12-22 19:30:16'),
(17, 16, 'postcode', '1200', 16, 0, '2020-12-22 19:30:16'),
(18, 17, 'district', '250', 0, 0, '2020-12-22 19:30:28'),
(19, 18, 'city', NULL, 17, 0, '2020-12-22 19:30:41'),
(20, 18, 'postcode', '1300', 18, 0, '2020-12-22 19:30:41'),
(21, 19, 'product_cat', '', 0, 0, '2020-12-23 12:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `usermeta`
--

CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usermeta`
--

INSERT INTO `usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(277, 5, 'district', '55'),
(275, 5, 'user_image', NULL),
(206, 2, 'user_image', '1601189730.png'),
(1661, 2, 'zip', '1300'),
(1660, 2, 'city', '18'),
(203, 2, 'state', NULL),
(202, 2, 'country', NULL),
(200, 2, 'address_two', NULL),
(201, 2, 'phone', '6789'),
(41, 3, 'phone', '4354354'),
(40, 3, 'address_two', 'retretret'),
(39, 3, 'address_one', 'retretre'),
(38, 3, 'last_name', 'user 2'),
(37, 3, 'first_name', 'user 2'),
(42, 3, 'country', 'BD'),
(43, 3, 'state', 'Bangladesh'),
(44, 3, 'city', 'Dhaka'),
(45, 3, 'zip', '342543543'),
(197, 2, 'first_name', 'Demo'),
(198, 2, 'last_name', 'Demo'),
(1658, 2, 'address_one', 'Uttara'),
(279, 5, 'zip', '1230'),
(278, 5, 'city', '57'),
(1619, 0, 'district', '15'),
(1618, 0, 'address_one', 'Uttara,Dhaka'),
(267, 5, 'last_name', 'Rahman'),
(276, 5, 'address_one', 'Uttara,Dhaka'),
(269, 5, 'address_two', NULL),
(270, 5, 'phone', '3453453457'),
(266, 5, 'first_name', 'Saiful'),
(1659, 2, 'district', '17'),
(1620, 0, 'city', '16'),
(1621, 0, 'zip', '1200'),
(360, 17, 'address_one', 'Road 4, House 15, Block A, Mirpur 10, Dhaka 1216'),
(361, 17, 'district', '55'),
(362, 17, 'city', '95'),
(363, 17, 'zip', 'kuril'),
(376, 19, 'address_one', 'Uttara,Dhaka'),
(377, 19, 'district', '56'),
(378, 19, 'city', '97'),
(379, 19, 'zip', '3330-337456'),
(452, 21, 'state', NULL),
(451, 21, 'country', NULL),
(450, 21, 'phone', '345345'),
(449, 21, 'address_two', NULL),
(1406, 21, 'address_one', 'Uttara,Dhaka'),
(447, 21, 'last_name', 'Kar'),
(446, 21, 'first_name', 'Partho'),
(455, 21, 'user_image', '1605432060.jpg'),
(1635, 23, 'district', '15'),
(1189, 23, 'user_image', '1607509827.jpeg'),
(1209, 22, 'user_image', '1607510060.jpeg'),
(1565, 22, 'zip', '1200'),
(1564, 22, 'city', '17'),
(1206, 22, 'state', NULL),
(1205, 22, 'country', NULL),
(1204, 22, 'phone', '56665345'),
(1562, 22, 'address_one', 'Uttara,Dhaka'),
(1203, 22, 'address_two', NULL),
(1201, 22, 'last_name', 'khan'),
(1200, 22, 'first_name', 'salman'),
(1637, 23, 'zip', '1200'),
(1636, 23, 'city', '16'),
(1186, 23, 'state', NULL),
(1185, 23, 'country', NULL),
(1184, 23, 'phone', '123654987'),
(1183, 23, 'address_two', NULL),
(1634, 23, 'address_one', 'dhaka'),
(1181, 23, 'last_name', 'rana'),
(1180, 23, 'first_name', 'Shah rukh'),
(1407, 21, 'district', '11'),
(1408, 21, 'city', '13'),
(1409, 21, 'zip', '1300'),
(1563, 22, 'district', '16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Demo', 'demo@email.com', NULL, '$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2', NULL, NULL, NULL, 1, '2020-09-13 05:06:20', '2020-09-13 05:06:20'),
(17, 'Howlader', 'bigshotstyle20@gmail.com', NULL, '$2y$10$eQfmmmLqtCKD5ckLt9gL8OGk0p7eKy3crlLryvEQnsx4LJdLE8n9C', NULL, NULL, NULL, 1, '2020-11-03 09:47:02', '2020-11-03 09:47:02'),
(18, 'Customer', 'customer@email.com', NULL, '$2y$10$DifceXB8dt/mCivp4PIW/ujU0hq/OFHNL9NAHjZOrOgCEVMbVwf0i', NULL, NULL, NULL, 1, '2020-11-07 02:11:03', '2020-11-07 02:11:03'),
(19, 'customer', 'partho@itebd.com', NULL, '$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2', NULL, NULL, NULL, 1, '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(20, 'Rahman', 'niloy@email.com', NULL, '$2y$10$o8jlnQihj1jZvH7KoOl1eOmXj8xzYGgiaXu4DdXANdJ9EiTxBbqLG', NULL, NULL, NULL, 1, '2020-11-14 22:03:42', '2020-11-14 22:03:42'),
(21, 'Partho', 'parthokar90@gmail.com', NULL, '$2y$10$nuxhiB9nzPYjKSwo9gpxKODxclWhEm3TXzJzpICWrRXkbvpRkgQO2', NULL, NULL, NULL, 1, '2020-11-15 05:12:37', '2020-11-15 05:12:37'),
(22, 'salman', 'hm.sohelrana95@gmail.com', NULL, '$2y$10$wSowMFDg./xovunmDAPOwuqzPqI/dmctD2pUrPrJqyk6Yx6DQIeu2', NULL, NULL, NULL, 1, '2020-12-05 02:49:10', '2020-12-05 02:49:10'),
(23, 'Shah rukh', 'sohelahmeditebd@gmail.com', NULL, '$2y$10$2SWpsW6CKadDbHZDLqKAT.3OccDNdhwMGzZnhvyuBTFQUVko5k09y', NULL, NULL, '9BguqziOkFWDyVklUnrfpWkLrTJopURBCgUumwwrLBuyu1YVuqA5o6pCrWvT', 1, '2020-12-09 05:09:31', '2020-12-12 04:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_permissions`
--

INSERT INTO `users_permissions` (`user_id`, `permission_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 13),
(2, 14),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_cart`
--

CREATE TABLE `user_cart` (
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cart`
--

INSERT INTO `user_cart` (`cart_id`, `user_id`, `id`, `name`, `price`, `actual_price`, `quantity`) VALUES
(123, '23', '28', 'silk saree', '3000', '3000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 7, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `attribute_taxonomies`
--
ALTER TABLE `attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(191));

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecommerce_termmeta`
--
ALTER TABLE `ecommerce_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `meta_key` (`meta_key`(250)),
  ADD KEY `woocommerce_term_id` (`ecommerce_term_id`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `order_itemmeta`
--
ALTER TABLE `order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_tokenmeta`
--
ALTER TABLE `payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `payment_tokens`
--
ALTER TABLE `payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postmeta`
--
ALTER TABLE `postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `product_attibutes`
--
ALTER TABLE `product_attibutes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `post_id` (`post_id`) USING BTREE,
  ADD KEY `meta_key` (`taxonomy`(191)) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `shipping_zone_locations`
--
ALTER TABLE `shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- Indexes for table `shipping_zone_methods`
--
ALTER TABLE `shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(191)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(191)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `tax_rate_locations`
--
ALTER TABLE `tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- Indexes for table `temp_attribute_stock`
--
ALTER TABLE `temp_attribute_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `termmeta`
--
ALTER TABLE `termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `term_relationships`
--
ALTER TABLE `term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `usermeta`
--
ALTER TABLE `usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_cart`
--
ALTER TABLE `user_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_taxonomies`
--
ALTER TABLE `attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecommerce_termmeta`
--
ALTER TABLE `ecommerce_termmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_itemmeta`
--
ALTER TABLE `order_itemmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `payment_tokenmeta`
--
ALTER TABLE `payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_tokens`
--
ALTER TABLE `payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `postmeta`
--
ALTER TABLE `postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_attibutes`
--
ALTER TABLE `product_attibutes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zone_locations`
--
ALTER TABLE `shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zone_methods`
--
ALTER TABLE `shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rate_locations`
--
ALTER TABLE `tax_rate_locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_attribute_stock`
--
ALTER TABLE `temp_attribute_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `termmeta`
--
ALTER TABLE `termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1662;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_cart`
--
ALTER TABLE `user_cart`
  MODIFY `cart_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
