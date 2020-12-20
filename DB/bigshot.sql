-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 06:34 AM
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
(5, 'Test', 't@email.com', '$2y$10$Z95.H7Hlb8mNrCKEwWmn2O3dGZqMBSvJi917Nb5G4WQpyQwtxAWYq', '', 3, '1', '2020-12-14 04:07:58', '2020-12-14 04:07:58');

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
(1, 'Color', 'color', 'select', 'menu_order', 1, 1, '2020-12-13 13:30:44', '2020-12-14 11:01:42'),
(2, 'Size', 'size', 'select', 'menu_order', 1, 1, '2020-12-13 13:30:47', '2020-12-13 13:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, '_tax_class', '', '38', '2020-12-19', '0'),
(2, 1, '_qty', '2', '38', '2020-12-19', '0'),
(3, 1, '_product_id', '4', '38', '2020-12-19', '0'),
(4, 1, '_variation_id', '', '38', '2020-12-19', '0'),
(5, 1, '_line_subtotal', '6900', '38', '2020-12-19', '0'),
(6, 1, '_line_total', '6900', '38', '2020-12-19', '0'),
(7, 1, '_line_subtotal_tax', '', '38', '2020-12-19', '0'),
(8, 1, '_line_tax', '', '38', '2020-12-19', '0'),
(9, 1, '_line_tax_data', '2020-12-19 23:58:26', '38', '2020-12-19', '0'),
(10, 1, 'delivery_charge', '190', '38', '2020-12-19', '0'),
(11, 1, 'coupon_code', NULL, '38', '2020-12-19', '0'),
(12, 1, 'coupon_taka', '0', '38', '2020-12-19', '0'),
(13, 1, 'attribute_parent', '4', '38', '2020-12-19', '0'),
(14, 2, '_tax_class', '', '39', '2020-12-19', '0'),
(15, 2, '_qty', '4', '39', '2020-12-19', '0'),
(16, 2, '_product_id', '20', '39', '2020-12-19', '0'),
(17, 2, '_variation_id', '', '39', '2020-12-19', '0'),
(18, 2, '_line_subtotal', '12000', '39', '2020-12-19', '0'),
(19, 2, '_line_total', '12000', '39', '2020-12-19', '0'),
(20, 2, '_line_subtotal_tax', '', '39', '2020-12-19', '0'),
(21, 2, '_line_tax', '', '39', '2020-12-19', '0'),
(22, 2, '_line_tax_data', '2020-12-19 23:59:56', '39', '2020-12-19', '0'),
(23, 2, 'delivery_charge', '190', '39', '2020-12-19', '0'),
(24, 2, 'coupon_code', NULL, '39', '2020-12-19', '0'),
(25, 2, 'coupon_taka', '0', '39', '2020-12-19', '0'),
(26, 2, 'attribute_parent', '20', '39', '2020-12-19', '0'),
(27, 3, '_tax_class', '', '39', '2020-12-19', '0'),
(28, 3, '_qty', '2', '39', '2020-12-19', '0'),
(29, 3, '_product_id', '21', '39', '2020-12-19', '0'),
(30, 3, '_variation_id', '', '39', '2020-12-19', '0'),
(31, 3, '_line_subtotal', '6000', '39', '2020-12-19', '0'),
(32, 3, '_line_total', '6000', '39', '2020-12-19', '0'),
(33, 3, '_line_subtotal_tax', '', '39', '2020-12-19', '0'),
(34, 3, '_line_tax', '', '39', '2020-12-19', '0'),
(35, 3, '_line_tax_data', '2020-12-19 23:59:56', '39', '2020-12-19', '0'),
(36, 3, 'delivery_charge', '190', '39', '2020-12-19', '0'),
(37, 3, 'coupon_code', NULL, '39', '2020-12-19', '0'),
(38, 3, 'coupon_taka', '0', '39', '2020-12-19', '0'),
(39, 3, 'attribute_parent', '21', '39', '2020-12-19', '0'),
(40, 4, '_tax_class', '', '40', '2020-12-19', '0'),
(41, 4, '_qty', '1', '40', '2020-12-19', '0'),
(42, 4, '_product_id', '2', '40', '2020-12-19', '0'),
(43, 4, '_variation_id', '', '40', '2020-12-19', '0'),
(44, 4, '_line_subtotal', '3000', '40', '2020-12-19', '0'),
(45, 4, '_line_total', '3000', '40', '2020-12-19', '0'),
(46, 4, '_line_subtotal_tax', '', '40', '2020-12-19', '0'),
(47, 4, '_line_tax', '', '40', '2020-12-19', '0'),
(48, 4, '_line_tax_data', '2020-12-20 00:03:27', '40', '2020-12-19', '0'),
(49, 4, 'delivery_charge', '200', '40', '2020-12-19', '0'),
(50, 4, 'coupon_code', NULL, '40', '2020-12-19', '0'),
(51, 4, 'coupon_taka', '0', '40', '2020-12-19', '0'),
(52, 4, 'attribute_parent', '2', '40', '2020-12-19', '0'),
(53, 5, '_tax_class', '', '41', '2020-12-19', '2'),
(54, 5, '_qty', '5', '41', '2020-12-19', '2'),
(55, 5, '_product_id', '20', '41', '2020-12-19', '2'),
(56, 5, '_variation_id', '', '41', '2020-12-19', '2'),
(57, 5, '_line_subtotal', '15000', '41', '2020-12-19', '2'),
(58, 5, '_line_total', '15000', '41', '2020-12-19', '2'),
(59, 5, '_line_subtotal_tax', '', '41', '2020-12-19', '2'),
(60, 5, '_line_tax', '', '41', '2020-12-19', '2'),
(61, 5, '_line_tax_data', '2020-12-20 00:14:42', '41', '2020-12-19', '2'),
(62, 5, 'delivery_charge', '190', '41', '2020-12-19', '2'),
(63, 5, 'coupon_code', NULL, '41', '2020-12-19', '2'),
(64, 5, 'coupon_taka', '0', '41', '2020-12-19', '2'),
(65, 5, 'attribute_parent', '20', '41', '2020-12-19', '2'),
(66, 6, '_tax_class', '', '41', '2020-12-19', '2'),
(67, 6, '_qty', '7', '41', '2020-12-19', '2'),
(68, 6, '_product_id', '21', '41', '2020-12-19', '2'),
(69, 6, '_variation_id', '', '41', '2020-12-19', '2'),
(70, 6, '_line_subtotal', '21000', '41', '2020-12-19', '2'),
(71, 6, '_line_total', '21000', '41', '2020-12-19', '2'),
(72, 6, '_line_subtotal_tax', '', '41', '2020-12-19', '2'),
(73, 6, '_line_tax', '', '41', '2020-12-19', '2'),
(74, 6, '_line_tax_data', '2020-12-20 00:14:42', '41', '2020-12-19', '2'),
(75, 6, 'delivery_charge', '190', '41', '2020-12-19', '2'),
(76, 6, 'coupon_code', NULL, '41', '2020-12-19', '2'),
(77, 6, 'coupon_taka', '0', '41', '2020-12-19', '2'),
(78, 6, 'attribute_parent', '21', '41', '2020-12-19', '2'),
(79, 7, '_tax_class', '', '42', '2020-12-19', '0'),
(80, 7, '_qty', '5', '42', '2020-12-19', '0'),
(81, 7, '_product_id', '20', '42', '2020-12-19', '0'),
(82, 7, '_variation_id', '', '42', '2020-12-19', '0'),
(83, 7, '_line_subtotal', '15000', '42', '2020-12-19', '0'),
(84, 7, '_line_total', '15000', '42', '2020-12-19', '0'),
(85, 7, '_line_subtotal_tax', '', '42', '2020-12-19', '0'),
(86, 7, '_line_tax', '', '42', '2020-12-19', '0'),
(87, 7, '_line_tax_data', '2020-12-20 00:35:36', '42', '2020-12-19', '0'),
(88, 7, 'delivery_charge', '200', '42', '2020-12-19', '0'),
(89, 7, 'coupon_code', NULL, '42', '2020-12-19', '0'),
(90, 7, 'coupon_taka', '0', '42', '2020-12-19', '0'),
(91, 7, 'attribute_parent', '20', '42', '2020-12-19', '0'),
(92, 8, '_tax_class', '', '43', '2020-12-20', '0'),
(93, 8, '_qty', '1', '43', '2020-12-20', '0'),
(94, 8, '_product_id', '20', '43', '2020-12-20', '0'),
(95, 8, '_variation_id', '', '43', '2020-12-20', '0'),
(96, 8, '_line_subtotal', '3000', '43', '2020-12-20', '0'),
(97, 8, '_line_total', '3000', '43', '2020-12-20', '0'),
(98, 8, '_line_subtotal_tax', '', '43', '2020-12-20', '0'),
(99, 8, '_line_tax', '', '43', '2020-12-20', '0'),
(100, 8, '_line_tax_data', '2020-12-20 16:21:17', '43', '2020-12-20', '0'),
(101, 8, 'delivery_charge', '190', '43', '2020-12-20', '0'),
(102, 8, 'coupon_code', NULL, '43', '2020-12-20', '0'),
(103, 8, 'coupon_taka', '0', '43', '2020-12-20', '0'),
(104, 8, 'attribute_parent', '20', '43', '2020-12-20', '0'),
(105, 9, '_tax_class', '', '44', '2020-12-20', '0'),
(106, 9, '_qty', '1', '44', '2020-12-20', '0'),
(107, 9, '_product_id', '2', '44', '2020-12-20', '0'),
(108, 9, '_variation_id', '', '44', '2020-12-20', '0'),
(109, 9, '_line_subtotal', '3000', '44', '2020-12-20', '0'),
(110, 9, '_line_total', '3000', '44', '2020-12-20', '0'),
(111, 9, '_line_subtotal_tax', '', '44', '2020-12-20', '0'),
(112, 9, '_line_tax', '', '44', '2020-12-20', '0'),
(113, 9, '_line_tax_data', '2020-12-20 16:42:10', '44', '2020-12-20', '0'),
(114, 9, 'delivery_charge', '190', '44', '2020-12-20', '0'),
(115, 9, 'coupon_code', NULL, '44', '2020-12-20', '0'),
(116, 9, 'coupon_taka', '0', '44', '2020-12-20', '0'),
(117, 9, 'attribute_parent', '2', '44', '2020-12-20', '0'),
(118, 10, '_tax_class', '', '45', '2020-12-20', '0'),
(119, 10, '_qty', '1', '45', '2020-12-20', '0'),
(120, 10, '_product_id', '20', '45', '2020-12-20', '0'),
(121, 10, '_variation_id', '', '45', '2020-12-20', '0'),
(122, 10, '_line_subtotal', '3000', '45', '2020-12-20', '0'),
(123, 10, '_line_total', '3000', '45', '2020-12-20', '0'),
(124, 10, '_line_subtotal_tax', '', '45', '2020-12-20', '0'),
(125, 10, '_line_tax', '', '45', '2020-12-20', '0'),
(126, 10, '_line_tax_data', '2020-12-20 16:51:19', '45', '2020-12-20', '0'),
(127, 10, 'delivery_charge', '190', '45', '2020-12-20', '0'),
(128, 10, 'coupon_code', NULL, '45', '2020-12-20', '0'),
(129, 10, 'coupon_taka', '0', '45', '2020-12-20', '0'),
(130, 10, 'attribute_parent', '20', '45', '2020-12-20', '0'),
(131, 11, '_tax_class', '', '45', '2020-12-20', '0'),
(132, 11, '_qty', '1', '45', '2020-12-20', '0'),
(133, 11, '_product_id', '21', '45', '2020-12-20', '0'),
(134, 11, '_variation_id', '', '45', '2020-12-20', '0'),
(135, 11, '_line_subtotal', '3000', '45', '2020-12-20', '0'),
(136, 11, '_line_total', '3000', '45', '2020-12-20', '0'),
(137, 11, '_line_subtotal_tax', '', '45', '2020-12-20', '0'),
(138, 11, '_line_tax', '', '45', '2020-12-20', '0'),
(139, 11, '_line_tax_data', '2020-12-20 16:51:19', '45', '2020-12-20', '0'),
(140, 11, 'delivery_charge', '190', '45', '2020-12-20', '0'),
(141, 11, 'coupon_code', NULL, '45', '2020-12-20', '0'),
(142, 11, 'coupon_taka', '0', '45', '2020-12-20', '0'),
(143, 11, 'attribute_parent', '21', '45', '2020-12-20', '0'),
(144, 12, '_tax_class', '', '45', '2020-12-20', '0'),
(145, 12, '_qty', '1', '45', '2020-12-20', '0'),
(146, 12, '_product_id', '2', '45', '2020-12-20', '0'),
(147, 12, '_variation_id', '', '45', '2020-12-20', '0'),
(148, 12, '_line_subtotal', '3000', '45', '2020-12-20', '0'),
(149, 12, '_line_total', '3000', '45', '2020-12-20', '0'),
(150, 12, '_line_subtotal_tax', '', '45', '2020-12-20', '0'),
(151, 12, '_line_tax', '', '45', '2020-12-20', '0'),
(152, 12, '_line_tax_data', '2020-12-20 16:51:19', '45', '2020-12-20', '0'),
(153, 12, 'delivery_charge', '190', '45', '2020-12-20', '0'),
(154, 12, 'coupon_code', NULL, '45', '2020-12-20', '0'),
(155, 12, 'coupon_taka', '0', '45', '2020-12-20', '0'),
(156, 12, 'attribute_parent', '2', '45', '2020-12-20', '0');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `product_id`, `product_parent`, `order_id`) VALUES
(1, 'Demo Product', 'line-item', '4', '4', 38),
(2, 'Fresh Fruit', 'line-item', '20', '19', 39),
(3, 'Fresh Fruit', 'line-item', '21', '19', 39),
(4, 'Attribute Product', 'line-item', '2', '1', 40),
(5, 'Fresh Fruit', 'line-item', '20', '19', 41),
(6, 'Fresh Fruit', 'line-item', '21', '19', 41),
(7, 'Fresh Fruit', 'line-item', '20', '19', 42),
(8, 'Fresh Fruit', 'line-item', '20', '19', 43),
(9, 'Attribute Product', 'line-item', '2', '1', 44),
(10, 'Fresh Fruit', 'line-item', '20', '19', 45),
(11, 'Fresh Fruit', 'line-item', '21', '19', 45),
(12, 'Attribute Product', 'line-item', '2', '1', 45);

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
('parthokar90@gmail.com', '$2y$10$XoA4a2wqN/gSi2ucVBKsmO7aakCuCVpxBatDoaIIW2YyvzcbqvSly', '2020-12-09 04:11:26');

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
(2, 1, 'regular_price', '5000'),
(3, 1, 'sale_price', '3000'),
(4, 1, 'weight', NULL),
(5, 1, 'length', NULL),
(6, 1, 'width', NULL),
(7, 1, 'height', NULL),
(8, 1, 'product_stock', '1000'),
(9, 1, 'start_stock', '1000'),
(10, 1, 'alert_qty', '60'),
(11, 1, '_sku', '175'),
(12, 1, 'attached_file', '1607844740.jpg'),
(13, 1, 'gallery_file', '1.jpg'),
(14, 1, 'gallery_file', '2.jpg'),
(15, 2, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"R\",\"term_id\":\"4\"}]'),
(16, 1, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"R\",\"term_id\":\"4\"}]'),
(17, 2, 'attribute_stock', '28'),
(18, 2, 'attribute_low_stock', '60'),
(19, 3, 'attribute', '[{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"7\"}]'),
(20, 1, 'default_attribute', '[{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"7\"}]'),
(21, 3, 'attribute_stock', '10'),
(22, 3, 'attribute_low_stock', '60'),
(23, 4, 'stock_status', 'instock'),
(24, 4, 'regular_price', '50001'),
(25, 4, 'sale_price', '3450'),
(26, 4, 'weight', NULL),
(27, 4, 'length', NULL),
(28, 4, 'width', NULL),
(29, 4, 'height', NULL),
(30, 4, 'product_stock', '2000'),
(31, 4, 'start_stock', '2000'),
(32, 4, 'default_qty', '46'),
(33, 4, 'alert_qty', '20'),
(34, 4, '_sku', '116'),
(35, 4, 'attached_file', '1607844825.jpg'),
(36, 4, 'gallery_file', '002.jpg'),
(37, 4, 'gallery_file', '3.jpg'),
(38, 5, 'first_name', 'Guest'),
(39, 5, 'last_name', 'Guest'),
(40, 5, 'address_one', 'Uttara,Dhaka'),
(41, 5, 'address_two', NULL),
(42, 5, 'phone', '0000000001'),
(43, 5, 'email', 'guest@email.com'),
(44, 5, 'country', 'Bangladesh'),
(45, 5, 'state', 'Dhaka'),
(46, 5, 'city', 'Uttara'),
(47, 5, 'zip', '1900'),
(48, 5, '_customer_user', '0'),
(49, 5, '_billing_postcode', '1900'),
(50, 5, '_billing_company', NULL),
(51, 5, '_billing_last_name', NULL),
(52, 5, '_billing_first_name', NULL),
(53, 5, 'payment_method', 'CashOnDelivery'),
(54, 6, 'first_name', 'khan'),
(55, 6, 'last_name', 'Guest'),
(56, 6, 'address_one', 'Uttara,Dhaka'),
(57, 6, 'address_two', NULL),
(58, 6, 'phone', '126645'),
(59, 6, 'email', 'sohelahmeditebd@gmail.com'),
(60, 6, 'country', 'Bangladesh'),
(61, 6, 'state', 'Dhaka'),
(62, 6, 'city', 'Uttara'),
(63, 6, 'zip', '1900'),
(64, 6, '_customer_user', '22'),
(65, 6, '_billing_postcode', '1900'),
(66, 6, '_billing_company', NULL),
(67, 6, '_billing_last_name', NULL),
(68, 6, '_billing_first_name', NULL),
(69, 6, 'payment_method', 'CashOnDelivery'),
(70, 7, 'first_name', 'Guest'),
(71, 7, 'last_name', 'Guest'),
(72, 7, 'address_one', 'Uttara,Dhaka'),
(73, 7, 'address_two', NULL),
(74, 7, 'phone', '0000000001'),
(75, 7, 'email', 'guest@email.com'),
(76, 7, 'country', 'Bangladesh'),
(77, 7, 'state', 'Dhaka'),
(78, 7, 'city', 'Uttara'),
(79, 7, 'zip', '1900'),
(80, 7, '_customer_user', '0'),
(81, 7, '_billing_postcode', '1900'),
(82, 7, '_billing_company', NULL),
(83, 7, '_billing_last_name', NULL),
(84, 7, '_billing_first_name', NULL),
(85, 7, 'payment_method', 'CashOnDelivery'),
(86, 8, 'first_name', 'Guest'),
(87, 8, 'last_name', 'Guest'),
(88, 8, 'address_one', 'Uttara,Dhaka'),
(89, 8, 'address_two', NULL),
(90, 8, 'phone', '0000000001'),
(91, 8, 'email', 'guest@email.com'),
(92, 8, 'country', 'Bangladesh'),
(93, 8, 'state', 'Dhaka'),
(94, 8, 'city', 'Uttara'),
(95, 8, 'zip', '1900'),
(96, 8, '_customer_user', '0'),
(97, 8, '_billing_postcode', '1900'),
(98, 8, '_billing_company', NULL),
(99, 8, '_billing_last_name', NULL),
(100, 8, '_billing_first_name', NULL),
(101, 8, 'payment_method', 'CashOnDelivery'),
(102, 9, 'first_name', 'Guest'),
(103, 9, 'last_name', 'Guest'),
(104, 9, 'address_one', 'Uttara,Dhaka'),
(105, 9, 'address_two', NULL),
(106, 9, 'phone', '0000000001'),
(107, 9, 'email', 'guest@email.com'),
(108, 9, 'country', 'Bangladesh'),
(109, 9, 'state', 'Dhaka'),
(110, 9, 'city', 'Uttara'),
(111, 9, 'zip', '1900'),
(112, 9, '_customer_user', '0'),
(113, 9, '_billing_postcode', '1900'),
(114, 9, '_billing_company', NULL),
(115, 9, '_billing_last_name', NULL),
(116, 9, '_billing_first_name', NULL),
(117, 9, 'payment_method', 'CashOnDelivery'),
(118, 9, 'processing_date', '2020-12-13'),
(119, 10, 'first_name', 'Demo'),
(120, 10, 'last_name', 'Demo'),
(121, 10, 'address_one', 'Uttara'),
(122, 10, 'address_two', NULL),
(123, 10, 'phone', '6789'),
(124, 10, 'email', 'demo@email.com'),
(125, 10, 'country', 'Bangladesh'),
(126, 10, 'state', 'Dhaka'),
(127, 10, 'city', 'Uttara'),
(128, 10, 'zip', '1900'),
(129, 10, '_customer_user', '2'),
(130, 10, '_billing_postcode', '1900'),
(131, 10, '_billing_company', NULL),
(132, 10, '_billing_last_name', NULL),
(133, 10, '_billing_first_name', NULL),
(134, 10, 'payment_method', 'CashOnDelivery'),
(135, 10, 'processing_date', '2020-12-13'),
(136, 11, 'first_name', 'Demo'),
(137, 11, 'last_name', 'Demo'),
(138, 11, 'address_one', 'Uttara'),
(139, 11, 'address_two', NULL),
(140, 11, 'phone', '6789'),
(141, 11, 'email', 'demo@email.com'),
(142, 11, 'country', 'Bangladesh'),
(143, 11, 'state', 'Dhaka'),
(144, 11, 'city', 'Uttara'),
(145, 11, 'zip', '1900'),
(146, 11, '_customer_user', '2'),
(147, 11, '_billing_postcode', '1900'),
(148, 11, '_billing_company', NULL),
(149, 11, '_billing_last_name', NULL),
(150, 11, '_billing_first_name', NULL),
(151, 11, 'payment_method', 'CashOnDelivery'),
(152, 12, 'first_name', 'Demo'),
(153, 12, 'last_name', 'Demo'),
(154, 12, 'address_one', 'Uttara'),
(155, 12, 'address_two', NULL),
(156, 12, 'phone', '6789'),
(157, 12, 'email', 'demo@email.com'),
(158, 12, 'country', 'Bangladesh'),
(159, 12, 'state', 'Dhaka'),
(160, 12, 'city', 'Uttara'),
(161, 12, 'zip', '1900'),
(162, 12, '_customer_user', '2'),
(163, 12, '_billing_postcode', '1900'),
(164, 12, '_billing_company', NULL),
(165, 12, '_billing_last_name', NULL),
(166, 12, '_billing_first_name', NULL),
(167, 12, 'payment_method', 'CashOnDelivery'),
(168, 12, 'processing_date', '2020-12-13'),
(169, 13, 'first_name', 'Demo'),
(170, 13, 'last_name', 'Demo'),
(171, 13, 'address_one', 'Uttara'),
(172, 13, 'address_two', NULL),
(173, 13, 'phone', '6789'),
(174, 13, 'email', 'demo@email.com'),
(175, 13, 'country', 'Bangladesh'),
(176, 13, 'state', 'Dhaka'),
(177, 13, 'city', 'Uttara'),
(178, 13, 'zip', '1900'),
(179, 13, '_customer_user', '2'),
(180, 13, '_billing_postcode', '1900'),
(181, 13, '_billing_company', NULL),
(182, 13, '_billing_last_name', NULL),
(183, 13, '_billing_first_name', NULL),
(184, 13, 'payment_method', 'CashOnDelivery'),
(185, 13, 'processing_date', '2020-12-13'),
(186, 14, 'first_name', 'Demo'),
(187, 14, 'last_name', 'Demo'),
(188, 14, 'address_one', 'Uttara'),
(189, 14, 'address_two', NULL),
(190, 14, 'phone', '6789'),
(191, 14, 'email', 'demo@email.com'),
(192, 14, 'country', 'Bangladesh'),
(193, 14, 'state', 'Dhaka'),
(194, 14, 'city', 'Uttara'),
(195, 14, 'zip', '1900'),
(196, 14, '_customer_user', '2'),
(197, 14, '_billing_postcode', '1900'),
(198, 14, '_billing_company', NULL),
(199, 14, '_billing_last_name', NULL),
(200, 14, '_billing_first_name', NULL),
(201, 14, 'payment_method', 'CashOnDelivery'),
(202, 14, 'processing_date', '2020-12-13'),
(203, 15, 'first_name', 'Demo'),
(204, 15, 'last_name', 'Demo'),
(205, 15, 'address_one', 'Uttara'),
(206, 15, 'address_two', NULL),
(207, 15, 'phone', '6789'),
(208, 15, 'email', 'demo@email.com'),
(209, 15, 'country', 'Bangladesh'),
(210, 15, 'state', 'Dhaka'),
(211, 15, 'city', 'Uttara'),
(212, 15, 'zip', '1900'),
(213, 15, '_customer_user', '2'),
(214, 15, '_billing_postcode', '1900'),
(215, 15, '_billing_company', NULL),
(216, 15, '_billing_last_name', NULL),
(217, 15, '_billing_first_name', NULL),
(218, 15, 'payment_method', 'CashOnDelivery'),
(219, 16, 'first_name', 'Demo'),
(220, 16, 'last_name', 'Demo'),
(221, 16, 'address_one', 'Uttara'),
(222, 16, 'address_two', NULL),
(223, 16, 'phone', '6789'),
(224, 16, 'email', 'demo@email.com'),
(225, 16, 'country', 'Bangladesh'),
(226, 16, 'state', 'Dhaka'),
(227, 16, 'city', 'Uttara'),
(228, 16, 'zip', '1900'),
(229, 16, '_customer_user', '2'),
(230, 16, '_billing_postcode', '1900'),
(231, 16, '_billing_company', NULL),
(232, 16, '_billing_last_name', NULL),
(233, 16, '_billing_first_name', NULL),
(234, 16, 'payment_method', 'CashOnDelivery'),
(235, 17, 'first_name', 'Demo'),
(236, 17, 'last_name', 'Demo'),
(237, 17, 'address_one', 'Uttara'),
(238, 17, 'address_two', NULL),
(239, 17, 'phone', '6789'),
(240, 17, 'email', 'demo@email.com'),
(241, 17, 'country', 'Bangladesh'),
(242, 17, 'state', 'Dhaka'),
(243, 17, 'city', 'Uttara'),
(244, 17, 'zip', '1900'),
(245, 17, '_customer_user', '2'),
(246, 17, '_billing_postcode', '1900'),
(247, 17, '_billing_company', NULL),
(248, 17, '_billing_last_name', NULL),
(249, 17, '_billing_first_name', NULL),
(250, 17, 'payment_method', 'CashOnDelivery'),
(251, 17, 'processing_date', '2020-12-13'),
(252, 16, 'processing_date', '2020-12-13'),
(253, 15, 'processing_date', '2020-12-13'),
(254, 18, 'first_name', 'Demo'),
(255, 18, 'last_name', 'Demo'),
(256, 18, 'address_one', 'Uttara'),
(257, 18, 'address_two', NULL),
(258, 18, 'phone', '6789'),
(259, 18, 'email', 'demo@email.com'),
(260, 18, 'country', 'Bangladesh'),
(261, 18, 'state', 'Dhaka'),
(262, 18, 'city', 'Uttara'),
(263, 18, 'zip', '1900'),
(264, 18, '_customer_user', '2'),
(265, 18, '_billing_postcode', '1900'),
(266, 18, '_billing_company', NULL),
(267, 18, '_billing_last_name', NULL),
(268, 18, '_billing_first_name', NULL),
(269, 18, 'payment_method', 'CashOnDelivery'),
(270, 18, 'processing_date', '2020-12-13'),
(271, 19, 'stock_status', NULL),
(272, 19, 'regular_price', '5000'),
(273, 19, 'sale_price', '3000'),
(274, 19, 'weight', NULL),
(275, 19, 'length', NULL),
(276, 19, 'width', NULL),
(277, 19, 'height', NULL),
(278, 19, 'product_stock', '2000'),
(279, 19, 'start_stock', '2000'),
(280, 19, 'alert_qty', '50'),
(281, 19, '_sku', '460'),
(282, 19, 'attached_file', '1607922365.jpg'),
(283, 19, 'gallery_file', 'b2.jpg'),
(284, 19, 'gallery_file', 'Baby.jpeg'),
(285, 20, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"R\",\"term_id\":\"4\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"7\"}]'),
(286, 19, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"R\",\"term_id\":\"4\"},{\"taxonomy\":\"size\",\"term\":\"XL\",\"term_id\":\"7\"}]'),
(287, 20, 'attribute_stock', '31'),
(288, 20, 'attribute_low_stock', '50'),
(289, 21, 'attribute', '[{\"taxonomy\":\"color\",\"term\":\"B\",\"term_id\":\"5\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"8\"}]'),
(290, 19, 'default_attribute', '[{\"taxonomy\":\"color\",\"term\":\"B\",\"term_id\":\"5\"},{\"taxonomy\":\"size\",\"term\":\"M\",\"term_id\":\"8\"}]'),
(291, 21, 'attribute_stock', '38'),
(292, 21, 'attribute_low_stock', '50'),
(293, 22, 'first_name', 'Guest'),
(294, 22, 'last_name', 'Guest'),
(295, 22, 'address_one', 'Uttara,Dhaka'),
(296, 22, 'address_two', NULL),
(297, 22, 'phone', '0000000001'),
(298, 22, 'email', 'guest@email.com'),
(299, 22, 'country', 'Bangladesh'),
(300, 22, 'state', 'Dhaka'),
(301, 22, 'city', 'Uttara'),
(302, 22, 'zip', '1900'),
(303, 22, '_customer_user', '0'),
(304, 22, '_billing_postcode', '1900'),
(305, 22, '_billing_company', NULL),
(306, 22, '_billing_last_name', NULL),
(307, 22, '_billing_first_name', NULL),
(308, 22, 'payment_method', 'CashOnDelivery'),
(309, 22, 'processing_date', '2020-12-14'),
(310, 23, 'first_name', 'Guest'),
(311, 23, 'last_name', 'Guest'),
(312, 23, 'address_one', 'Uttara,Dhaka'),
(313, 23, 'address_two', NULL),
(314, 23, 'phone', '0000000001'),
(315, 23, 'email', 'guest@email.com'),
(316, 23, 'country', 'Bangladesh'),
(317, 23, 'state', 'Dhaka'),
(318, 23, 'city', 'Uttara'),
(319, 23, 'zip', '1900'),
(320, 23, '_customer_user', '0'),
(321, 23, '_billing_postcode', '1900'),
(322, 23, '_billing_company', NULL),
(323, 23, '_billing_last_name', NULL),
(324, 23, '_billing_first_name', NULL),
(325, 23, 'payment_method', 'CashOnDelivery'),
(326, 23, 'processing_date', '2020-12-14'),
(327, 24, 'first_name', 'khan'),
(328, 24, 'last_name', 'Guest'),
(329, 24, 'address_one', 'Uttara,Dhaka'),
(330, 24, 'address_two', NULL),
(331, 24, 'phone', '126645'),
(332, 24, 'email', 'sohelahmeditebd@gmail.com'),
(333, 24, 'country', 'Bangladesh'),
(334, 24, 'state', 'Dhaka'),
(335, 24, 'city', 'Uttara'),
(336, 24, 'zip', '1900'),
(337, 24, '_customer_user', '22'),
(338, 24, '_billing_postcode', '1900'),
(339, 24, '_billing_company', NULL),
(340, 24, '_billing_last_name', NULL),
(341, 24, '_billing_first_name', NULL),
(342, 24, 'payment_method', 'CashOnDelivery'),
(343, 24, 'processing_date', '2020-12-14'),
(344, 25, 'first_name', 'khan'),
(345, 25, 'last_name', 'Guest'),
(346, 25, 'address_one', 'JJJ'),
(347, 25, 'address_two', NULL),
(348, 25, 'phone', '126645'),
(349, 25, 'email', 'sohelahmeditebd@gmail.com'),
(350, 25, 'country', 'Bangladesh'),
(351, 25, 'state', 'Dhaka'),
(352, 25, 'city', 'Uttara'),
(353, 25, 'zip', '1900'),
(354, 25, '_customer_user', '22'),
(355, 25, '_billing_postcode', '1900'),
(356, 25, '_billing_company', NULL),
(357, 25, '_billing_last_name', NULL),
(358, 25, '_billing_first_name', NULL),
(359, 25, 'payment_method', 'DeliveryChargeOnly'),
(360, 26, 'first_name', 'khan'),
(361, 26, 'last_name', 'rana'),
(362, 26, 'address_one', 'dhaka'),
(363, 26, 'address_two', NULL),
(364, 26, 'phone', '126645'),
(365, 26, 'email', 'sohelahmeditebd@gmail.com'),
(366, 26, 'country', 'Bangladesh'),
(367, 26, 'state', 'Dhaka'),
(368, 26, 'city', 'Uttara'),
(369, 26, 'zip', '1900'),
(370, 26, '_customer_user', '22'),
(371, 26, '_billing_postcode', '1900'),
(372, 26, '_billing_company', NULL),
(373, 26, '_billing_last_name', NULL),
(374, 26, '_billing_first_name', NULL),
(375, 26, 'payment_method', 'CashOnDelivery'),
(376, 26, 'processing_date', '2020-12-14'),
(377, 27, 'first_name', 'khan'),
(378, 27, 'last_name', 'Guest'),
(379, 27, 'address_one', 'dhaka'),
(380, 27, 'address_two', NULL),
(381, 27, 'phone', '126645'),
(382, 27, 'email', 'sohelahmeditebd@gmail.com'),
(383, 27, 'country', 'Bangladesh'),
(384, 27, 'state', 'Comilla'),
(385, 27, 'city', 'Laksam'),
(386, 27, 'zip', '1340'),
(387, 27, '_customer_user', '22'),
(388, 27, '_billing_postcode', '1340'),
(389, 27, '_billing_company', NULL),
(390, 27, '_billing_last_name', NULL),
(391, 27, '_billing_first_name', NULL),
(392, 27, 'payment_method', 'CashOnDelivery'),
(393, 28, 'first_name', 'khan'),
(394, 28, 'last_name', 'Guest'),
(395, 28, 'address_one', 'dhaka'),
(396, 28, 'address_two', NULL),
(397, 28, 'phone', '126645'),
(398, 28, 'email', 'sohelahmeditebd@gmail.com'),
(399, 28, 'country', 'Bangladesh'),
(400, 28, 'state', 'Dhaka'),
(401, 28, 'city', 'Uttara'),
(402, 28, 'zip', '1900'),
(403, 28, '_customer_user', '22'),
(404, 28, '_billing_postcode', '1900'),
(405, 28, '_billing_company', NULL),
(406, 28, '_billing_last_name', NULL),
(407, 28, '_billing_first_name', NULL),
(408, 28, 'payment_method', 'CashOnDelivery'),
(409, 28, 'processing_date', '2020-12-14'),
(410, 27, 'processing_date', '2020-12-14'),
(411, 29, 'first_name', 'khan'),
(412, 29, 'last_name', 'Guest'),
(413, 29, 'address_one', 'dhaka'),
(414, 29, 'address_two', NULL),
(415, 29, 'phone', '126645'),
(416, 29, 'email', 'sohelahmeditebd@gmail.com'),
(417, 29, 'country', 'Bangladesh'),
(418, 29, 'state', 'Dhaka'),
(419, 29, 'city', 'Uttara'),
(420, 29, 'zip', '1900'),
(421, 29, '_customer_user', '22'),
(422, 29, '_billing_postcode', '1900'),
(423, 29, '_billing_company', NULL),
(424, 29, '_billing_last_name', NULL),
(425, 29, '_billing_first_name', NULL),
(426, 29, 'payment_method', 'CashOnDelivery'),
(444, 29, 'processing_date', '2020-12-14'),
(428, 30, 'first_name', 'khan'),
(429, 30, 'last_name', 'Guest'),
(430, 30, 'address_one', 'dhaka'),
(431, 30, 'address_two', NULL),
(432, 30, 'phone', '126645'),
(433, 30, 'email', 'sohelahmeditebd@gmail.com'),
(434, 30, 'country', 'Bangladesh'),
(435, 30, 'state', 'Dhaka'),
(436, 30, 'city', 'Uttara'),
(437, 30, 'zip', '1900'),
(438, 30, '_customer_user', '22'),
(439, 30, '_billing_postcode', '1900'),
(440, 30, '_billing_company', NULL),
(441, 30, '_billing_last_name', NULL),
(442, 30, '_billing_first_name', NULL),
(443, 30, 'payment_method', 'CashOnDelivery'),
(445, 31, 'first_name', 'khan'),
(446, 31, 'last_name', 'Guest'),
(447, 31, 'address_one', 'dhaka'),
(448, 31, 'address_two', NULL),
(449, 31, 'phone', '126645'),
(450, 31, 'email', 'sohelahmeditebd@gmail.com'),
(451, 31, 'country', 'Bangladesh'),
(452, 31, 'state', 'Dhaka'),
(453, 31, 'city', 'Uttara'),
(454, 31, 'zip', '1900'),
(455, 31, '_customer_user', '22'),
(456, 31, '_billing_postcode', '1900'),
(457, 31, '_billing_company', NULL),
(458, 31, '_billing_last_name', NULL),
(459, 31, '_billing_first_name', NULL),
(460, 31, 'payment_method', 'CashOnDelivery'),
(461, 31, 'processing_date', '2020-12-14'),
(462, 32, 'first_name', 'Guest'),
(463, 32, 'last_name', 'Guest'),
(464, 32, 'address_one', 'Uttara,Dhaka'),
(465, 32, 'address_two', NULL),
(466, 32, 'phone', '0000000001'),
(467, 32, 'email', 'guest@email.com'),
(468, 32, 'country', 'Bangladesh'),
(469, 32, 'state', 'Dhaka'),
(470, 32, 'city', 'Uttara'),
(471, 32, 'zip', '1900'),
(472, 32, '_customer_user', '0'),
(473, 32, '_billing_postcode', '1900'),
(474, 32, '_billing_company', NULL),
(475, 32, '_billing_last_name', NULL),
(476, 32, '_billing_first_name', NULL),
(477, 32, 'payment_method', 'CashOnDelivery'),
(478, 20, 'product_status', 'reject'),
(479, 20, 'reject_date', '2020-12-15'),
(480, 20, 'reject_date', '2020-12-15'),
(481, 20, 'reject_qty', '0'),
(482, 21, 'product_status', 'reject'),
(483, 21, 'reject_date', '2020-12-15'),
(484, 21, 'reject_date', '2020-12-15'),
(485, 21, 'reject_qty', '12'),
(486, 4, 'product_status', 'reject'),
(487, 4, 'reject_date', '2020-12-15'),
(488, 4, 'reject_qty', '1'),
(489, 2, 'product_status', 'reject'),
(490, 2, 'reject_date', '2020-12-15'),
(491, 2, 'reject_qty', '1'),
(492, 3, 'product_status', 'reject'),
(493, 3, 'reject_date', '2020-12-15'),
(494, 3, 'reject_qty', '2'),
(495, 2, 'product_status', 'reject'),
(496, 2, 'reject_date', '2020-12-15'),
(497, 2, 'reject_qty', '2'),
(498, 3, 'product_status', 'reject'),
(499, 3, 'reject_date', '2020-12-15'),
(500, 3, 'reject_qty', '5'),
(501, 33, 'first_name', 'Guest'),
(502, 33, 'last_name', 'Guest'),
(503, 33, 'address_one', 'Uttara,Dhaka'),
(504, 33, 'address_two', NULL),
(505, 33, 'phone', '0000000001'),
(506, 33, 'email', 'guest@email.com'),
(507, 33, 'country', 'Bangladesh'),
(508, 33, 'state', 'Dhaka'),
(509, 33, 'city', 'Uttara'),
(510, 33, 'zip', '1900'),
(511, 33, '_customer_user', '0'),
(512, 33, '_billing_postcode', '1900'),
(513, 33, '_billing_company', NULL),
(514, 33, '_billing_last_name', NULL),
(515, 33, '_billing_first_name', NULL),
(516, 33, 'payment_method', 'CashOnDelivery'),
(517, 34, 'first_name', 'Guest'),
(518, 34, 'last_name', 'Guest'),
(519, 34, 'address_one', 'Uttara,Dhaka'),
(520, 34, 'address_two', NULL),
(521, 34, 'phone', '0000000001'),
(522, 34, 'email', 'guest@email.com'),
(523, 34, 'country', 'Bangladesh'),
(524, 34, 'state', 'Dhaka'),
(525, 34, 'city', 'Uttara'),
(526, 34, 'zip', '1900'),
(527, 34, '_customer_user', '0'),
(528, 34, '_billing_postcode', '1900'),
(529, 34, '_billing_company', NULL),
(530, 34, '_billing_last_name', NULL),
(531, 34, '_billing_first_name', NULL),
(532, 34, 'payment_method', 'CashOnDelivery'),
(533, 35, 'first_name', 'Guest'),
(534, 35, 'last_name', 'Guest'),
(535, 35, 'address_one', 'Uttara,Dhaka'),
(536, 35, 'address_two', NULL),
(537, 35, 'phone', '0000000001'),
(538, 35, 'email', 'guest@email.com'),
(539, 35, 'country', 'Bangladesh'),
(540, 35, 'state', 'Dhaka'),
(541, 35, 'city', 'Uttara'),
(542, 35, 'zip', '1900'),
(543, 35, '_customer_user', '0'),
(544, 35, '_billing_postcode', '1900'),
(545, 35, '_billing_company', NULL),
(546, 35, '_billing_last_name', NULL),
(547, 35, '_billing_first_name', NULL),
(548, 35, 'payment_method', 'CashOnDelivery'),
(549, 36, 'first_name', 'Guest'),
(550, 36, 'last_name', 'Guest'),
(551, 36, 'address_one', 'Uttara,Dhaka'),
(552, 36, 'address_two', NULL),
(553, 36, 'phone', '0000000001'),
(554, 36, 'email', 'guest@email.com'),
(555, 36, 'country', 'Bangladesh'),
(556, 36, 'state', 'Dhaka'),
(557, 36, 'city', 'Uttara'),
(558, 36, 'zip', '1900'),
(559, 36, '_customer_user', '0'),
(560, 36, '_billing_postcode', '1900'),
(561, 36, '_billing_company', NULL),
(562, 36, '_billing_last_name', NULL),
(563, 36, '_billing_first_name', NULL),
(564, 36, 'payment_method', 'CashOnDelivery'),
(565, 36, 'processing_date', '2020-12-19'),
(566, 35, 'processing_date', '2020-12-19'),
(567, 37, 'first_name', 'Guest'),
(568, 37, 'last_name', 'Guest'),
(569, 37, 'address_one', 'Uttara,Dhaka'),
(570, 37, 'address_two', NULL),
(571, 37, 'phone', '0000000001'),
(572, 37, 'email', 'guest@email.com'),
(573, 37, 'country', 'Bangladesh'),
(574, 37, 'state', 'Dhaka'),
(575, 37, 'city', 'Uttara'),
(576, 37, 'zip', '1900'),
(577, 37, '_customer_user', '0'),
(578, 37, '_billing_postcode', '1900'),
(579, 37, '_billing_company', NULL),
(580, 37, '_billing_last_name', NULL),
(581, 37, '_billing_first_name', NULL),
(582, 37, 'payment_method', 'CashOnDelivery'),
(583, 38, 'first_name', 'Guest'),
(584, 38, 'last_name', 'Guest'),
(585, 38, 'address_one', 'Uttara,Dhaka'),
(586, 38, 'address_two', NULL),
(587, 38, 'phone', '0000000001'),
(588, 38, 'email', 'guest@email.com'),
(589, 38, 'country', 'Bangladesh'),
(590, 38, 'state', 'Dhaka'),
(591, 38, 'city', 'Uttara'),
(592, 38, 'zip', '1900'),
(593, 38, '_customer_user', '0'),
(594, 38, '_billing_postcode', '1900'),
(595, 38, '_billing_company', NULL),
(596, 38, '_billing_last_name', NULL),
(597, 38, '_billing_first_name', NULL),
(598, 38, 'payment_method', 'CashOnDelivery'),
(599, 39, 'first_name', 'Guest'),
(600, 39, 'last_name', 'Guest'),
(601, 39, 'address_one', 'Uttara,Dhaka'),
(602, 39, 'address_two', NULL),
(603, 39, 'phone', '0000000001'),
(604, 39, 'email', 'guest@email.com'),
(605, 39, 'country', 'Bangladesh'),
(606, 39, 'state', 'Dhaka'),
(607, 39, 'city', 'Uttara'),
(608, 39, 'zip', '1900'),
(609, 39, '_customer_user', '0'),
(610, 39, '_billing_postcode', '1900'),
(611, 39, '_billing_company', NULL),
(612, 39, '_billing_last_name', NULL),
(613, 39, '_billing_first_name', NULL),
(614, 39, 'payment_method', 'CashOnDelivery'),
(615, 40, 'first_name', 'Guest'),
(616, 40, 'last_name', 'Guest'),
(617, 40, 'address_one', 'Uttara,Dhaka'),
(618, 40, 'address_two', NULL),
(619, 40, 'phone', '0000000001'),
(620, 40, 'email', 'guest@email.com'),
(621, 40, 'country', 'Bangladesh'),
(622, 40, 'state', 'Comilla'),
(623, 40, 'city', 'Laksam'),
(624, 40, 'zip', '1340'),
(625, 40, '_customer_user', '0'),
(626, 40, '_billing_postcode', '1340'),
(627, 40, '_billing_company', NULL),
(628, 40, '_billing_last_name', NULL),
(629, 40, '_billing_first_name', NULL),
(630, 40, 'payment_method', 'CashOnDelivery'),
(631, 41, 'first_name', 'Demo'),
(632, 41, 'last_name', 'Demo'),
(633, 41, 'address_one', 'Uttara'),
(634, 41, 'address_two', NULL),
(635, 41, 'phone', '6789'),
(636, 41, 'email', 'demo@email.com'),
(637, 41, 'country', 'Bangladesh'),
(638, 41, 'state', 'Dhaka'),
(639, 41, 'city', 'Uttara'),
(640, 41, 'zip', '1900'),
(641, 41, '_customer_user', '2'),
(642, 41, '_billing_postcode', '1900'),
(643, 41, '_billing_company', NULL),
(644, 41, '_billing_last_name', NULL),
(645, 41, '_billing_first_name', NULL),
(646, 41, 'payment_method', 'CashOnDelivery'),
(647, 41, 'processing_date', '2020-12-19'),
(648, 42, 'first_name', 'Guest'),
(649, 42, 'last_name', 'Guest'),
(650, 42, 'address_one', 'Uttara,Dhaka'),
(651, 42, 'address_two', NULL),
(652, 42, 'phone', '0000000001'),
(653, 42, 'email', 'guest@email.com'),
(654, 42, 'country', 'Bangladesh'),
(655, 42, 'state', 'Comilla'),
(656, 42, 'city', 'Laksam'),
(657, 42, 'zip', '1340'),
(658, 42, '_customer_user', '0'),
(659, 42, '_billing_postcode', '1340'),
(660, 42, '_billing_company', NULL),
(661, 42, '_billing_last_name', NULL),
(662, 42, '_billing_first_name', NULL),
(663, 42, 'payment_method', 'CashOnDelivery'),
(666, 42, 'processing_date', '2020-12-19'),
(665, 39, 'processing_date', '2020-12-19'),
(667, 38, 'processing_date', '2020-12-19'),
(668, 40, 'processing_date', '2020-12-19'),
(669, 43, 'first_name', 'Guest'),
(670, 43, 'last_name', 'Guest'),
(671, 43, 'address_one', 'Uttara,Dhaka'),
(672, 43, 'address_two', NULL),
(673, 43, 'phone', '0000000001'),
(674, 43, 'email', 'guest@email.com'),
(675, 43, 'country', 'Bangladesh'),
(676, 43, 'state', 'Dhaka'),
(677, 43, 'city', 'Uttara'),
(678, 43, 'zip', '1900'),
(679, 43, '_customer_user', '0'),
(680, 43, '_billing_postcode', '1900'),
(681, 43, '_billing_company', NULL),
(682, 43, '_billing_last_name', NULL),
(683, 43, '_billing_first_name', NULL),
(684, 43, 'payment_method', 'CashOnDelivery'),
(685, 43, 'processing_date', '2020-12-20'),
(686, 44, 'first_name', 'Guest'),
(687, 44, 'last_name', 'Guest'),
(688, 44, 'address_one', 'Uttara,Dhaka'),
(689, 44, 'address_two', NULL),
(690, 44, 'phone', '0000000001'),
(691, 44, 'email', 'guest@email.com'),
(692, 44, 'country', 'Bangladesh'),
(693, 44, 'state', 'Dhaka'),
(694, 44, 'city', 'Uttara'),
(695, 44, 'zip', '1900'),
(696, 44, '_customer_user', '0'),
(697, 44, '_billing_postcode', '1900'),
(698, 44, '_billing_company', NULL),
(699, 44, '_billing_last_name', NULL),
(700, 44, '_billing_first_name', NULL),
(701, 44, 'payment_method', 'CashOnDelivery'),
(702, 44, 'processing_date', '2020-12-20'),
(703, 45, 'first_name', 'Guest'),
(704, 45, 'last_name', 'Guest'),
(705, 45, 'address_one', 'Uttara,Dhaka'),
(706, 45, 'address_two', NULL),
(707, 45, 'phone', '0000000001'),
(708, 45, 'email', 'guest@email.com'),
(709, 45, 'country', 'Bangladesh'),
(710, 45, 'state', 'Dhaka'),
(711, 45, 'city', 'Uttara'),
(712, 45, 'zip', '1900'),
(713, 45, '_customer_user', '0'),
(714, 45, '_billing_postcode', '1900'),
(715, 45, '_billing_company', NULL),
(716, 45, '_billing_last_name', NULL),
(717, 45, '_billing_first_name', NULL),
(718, 45, 'payment_method', 'CashOnDelivery'),
(719, 45, 'processing_date', '2020-12-20');

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
(1, 2, '2020-12-13 13:31:00', '2020-12-13 19:31:00', '<p>sdfdsf</p>', 'Attribute Product', '<p>dfsgdfgfd</p>', 'publish', 'open', 'open', '', 'Attribute Product', '', '', '2020-12-13 13:32:20', '2020-12-13 13:32:20', '', 0, '', 0, 'product', '', 0),
(2, 0, '2020-12-13 13:32:20', '2020-12-13 13:32:20', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-13 13:32:20', '2020-12-13 13:32:20', '', 1, '', 0, 'product_varient', '', 0),
(3, 0, '2020-12-13 13:32:20', '2020-12-13 13:32:20', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-13 13:32:20', '2020-12-13 13:32:20', '', 1, '', 0, 'product_varient', '', 0),
(4, 2, '2020-12-13 13:32:00', '2020-12-13 19:32:00', '<p>asdsadsa</p>', 'Demo Product', '<p>sadasdsad</p>', 'publish', 'open', 'open', '', 'Demo Product', '', '', '2020-12-13 13:33:45', '2020-12-13 13:33:45', '', 0, '', 0, 'product', '', 0),
(19, 2, '2020-12-14 11:04:00', '2020-12-14 17:04:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Fresh Fruit', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'publish', 'open', 'open', '', 'Fresh Fruit', '', '', '2020-12-14 11:06:05', '2020-12-14 11:06:05', '', 0, '', 0, 'product', '', 0),
(20, 0, '2020-12-14 11:06:05', '2020-12-14 11:06:05', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-14 11:06:05', '2020-12-14 11:06:05', '', 19, '', 0, 'product_varient', '', 0),
(21, 0, '2020-12-14 11:06:05', '2020-12-14 11:06:05', '', '', '', 'publish', 'open', 'open', '', '', '', '', '2020-12-14 11:06:05', '2020-12-14 11:06:05', '', 19, '', 0, 'product_varient', '', 0),
(45, 0, '2020-12-20 00:00:00', '2020-12-20 16:51:19', '', 'Order2020-12-20 10:51:19', '', 'processing', 'open', 'open', 'order_1247', 'order-Dec-20-2020-1012', '', '', '2020-12-20 10:51:30', '2020-12-20 10:51:19', '', 0, '', 0, 'shop_order', '', 0),
(41, 2, '2020-12-19 00:00:00', '2020-12-20 00:14:42', '', 'Order2020-12-19 18:14:42', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-19-2020-1812', '', '', '2020-12-19 18:32:34', '2020-12-19 18:14:42', '', 0, '', 0, 'shop_order', '', 0),
(42, 0, '2020-12-19 00:00:00', '2020-12-20 00:35:36', '', 'Order2020-12-19 18:35:36', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-19-2020-1812', '', '', '2020-12-19 18:38:57', '2020-12-19 18:35:36', '', 0, '', 0, 'shop_order', '', 0),
(44, 0, '2020-12-20 00:00:00', '2020-12-20 16:42:10', '', 'Order2020-12-20 10:42:10', '', 'processing', 'open', 'open', 'order_1247', 'order-Dec-20-2020-1012', '', '', '2020-12-20 10:42:21', '2020-12-20 10:42:10', '', 0, '', 0, 'shop_order', '', 0),
(43, 0, '2020-12-20 00:00:00', '2020-12-20 16:21:17', '', 'Order2020-12-20 10:21:17', '', 'delivered', 'open', 'open', 'order_1247', 'order-Dec-20-2020-1012', '', '', '2020-12-20 10:27:51', '2020-12-20 10:21:17', '', 0, '', 0, 'shop_order', '', 0),
(40, 0, '2020-12-19 00:00:00', '2020-12-20 00:03:27', '', 'Order2020-12-19 18:03:27', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-19-2020-1812', '', '', '2020-12-19 18:41:58', '2020-12-19 18:03:27', '', 0, '', 0, 'shop_order', '', 0),
(38, 0, '2020-12-19 00:00:00', '2020-12-19 23:58:26', '', 'Order2020-12-19 17:58:26', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-19-2020-1712', '', '', '2020-12-19 18:39:09', '2020-12-19 17:58:26', '', 0, '', 0, 'shop_order', '', 0),
(39, 0, '2020-12-19 00:00:00', '2020-12-19 23:59:56', '', 'Order2020-12-19 17:59:56', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Dec-19-2020-1712', '', '', '2020-12-19 18:38:52', '2020-12-19 17:59:56', '', 0, '', 0, 'shop_order', '', 0);

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
(3, 'Editor', '', '2020-10-29 04:21:40', '2020-11-15 04:01:50');

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
(3, 3);

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
(1, 'Jeans', 'jeans', 0, 0, '2020-12-13 13:30:27'),
(2, 'Women', 'women', 0, 1, '2020-12-13 13:30:38'),
(3, 'Men', 'men', 0, 1, '2020-12-13 13:30:40'),
(4, 'R', 'r', 0, 1, '2020-12-13 13:30:57'),
(5, 'B', 'b', 0, 1, '2020-12-13 13:31:03'),
(6, 'G', 'g', 0, 1, '2020-12-13 13:31:07'),
(7, 'XL', 'xl', 0, 1, '2020-12-13 13:31:20'),
(8, 'M', 'm', 0, 1, '2020-12-13 13:31:25'),
(9, 'S', 's', 0, 1, '2020-12-13 13:31:28'),
(10, 'Bata', 'bata', 0, 1, '2020-12-13 13:34:43'),
(11, 'Dhaka', 'dhaka', 0, 1, '2020-12-13 13:36:00'),
(12, 'Uttara', 'uttara', 0, 1, '2020-12-13 13:36:10'),
(13, 'Comilla', 'comilla', 0, 1, '2020-12-14 13:10:51'),
(14, 'Laksam', 'laksam', 0, 1, '2020-12-14 13:11:05'),
(15, 'Bags', 'bags', 0, 1, '2020-12-14 18:07:57'),
(16, 'test', 'test', 0, 0, '2020-12-14 18:33:07');

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
(1, 2, 0),
(1, 1, 0),
(4, 3, 0),
(4, 10, 0),
(19, 2, 0),
(19, 1, 0);

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
(1, 1, 'product_cat', '', 0, 0, '2020-12-13 13:30:27'),
(2, 2, 'product_tag', '', 0, 0, '2020-12-13 13:30:38'),
(3, 3, 'product_tag', '', 0, 0, '2020-12-13 13:30:40'),
(4, 4, 'color', '', 0, 0, '2020-12-13 13:30:57'),
(5, 5, 'color', '', 0, 0, '2020-12-13 13:31:03'),
(6, 6, 'color', '', 0, 0, '2020-12-13 13:31:07'),
(7, 7, 'size', '', 0, 0, '2020-12-13 13:31:20'),
(8, 8, 'size', '', 0, 0, '2020-12-13 13:31:25'),
(9, 9, 'size', '', 0, 0, '2020-12-13 13:31:28'),
(10, 10, 'product_cat', '', 0, 0, '2020-12-13 13:34:43'),
(11, 11, 'district', '190', 0, 0, '2020-12-13 13:36:00'),
(12, 12, 'city', NULL, 11, 0, '2020-12-13 13:36:10'),
(13, 12, 'postcode', '1900', 12, 0, '2020-12-13 13:36:10'),
(14, 13, 'district', '200', 0, 0, '2020-12-14 13:10:51'),
(15, 14, 'city', NULL, 13, 0, '2020-12-14 13:11:05'),
(16, 14, 'postcode', '1340', 14, 0, '2020-12-14 13:11:05'),
(17, 15, 'product_cat', '', 0, 0, '2020-12-14 18:07:57'),
(18, 16, 'product_cat', '', 0, 0, '2020-12-14 18:33:07');

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
(825, 2, 'user_image', '1607494226.jpg'),
(1128, 2, 'city', '12'),
(822, 2, 'state', NULL),
(821, 2, 'country', NULL),
(41, 3, 'phone', '4354354'),
(40, 3, 'address_two', 'retretret'),
(39, 3, 'address_one', 'retretre'),
(38, 3, 'last_name', 'user 2'),
(37, 3, 'first_name', 'user 2'),
(42, 3, 'country', 'BD'),
(43, 3, 'state', 'Bangladesh'),
(44, 3, 'city', 'Dhaka'),
(45, 3, 'zip', '342543543'),
(820, 2, 'phone', '6789'),
(817, 2, 'last_name', 'Demo'),
(279, 5, 'zip', '1230'),
(278, 5, 'city', '57'),
(1143, 0, 'district', '11'),
(1142, 0, 'address_one', 'Uttara,Dhaka'),
(267, 5, 'last_name', 'Rahman'),
(276, 5, 'address_one', 'Uttara,Dhaka'),
(269, 5, 'address_two', NULL),
(270, 5, 'phone', '3453453457'),
(266, 5, 'first_name', 'Saiful'),
(819, 2, 'address_two', NULL),
(1144, 0, 'city', '12'),
(1145, 0, 'zip', '1900'),
(360, 17, 'address_one', 'Road 4, House 15, Block A, Mirpur 10, Dhaka 1216'),
(361, 17, 'district', '55'),
(362, 17, 'city', '95'),
(363, 17, 'zip', 'kuril'),
(376, 19, 'address_one', 'Uttara,Dhaka'),
(377, 19, 'district', '56'),
(378, 19, 'city', '97'),
(379, 19, 'zip', '3330-337456'),
(452, 21, 'state', NULL),
(978, 21, 'city', '15'),
(451, 21, 'country', NULL),
(450, 21, 'phone', '345345'),
(449, 21, 'address_two', NULL),
(976, 21, 'address_one', 'Uttara,Dhaka'),
(447, 21, 'last_name', 'Kar'),
(446, 21, 'first_name', 'Partho'),
(979, 21, 'zip', '2300'),
(455, 21, 'user_image', '1605432060.jpg'),
(1126, 2, 'address_one', 'Uttara'),
(816, 2, 'first_name', 'Demo'),
(1127, 2, 'district', '11'),
(1129, 2, 'zip', '1900'),
(977, 21, 'district', '14'),
(1065, 22, 'user_image', '1607755455.jpg'),
(1089, 22, 'zip', '1900'),
(1088, 22, 'city', '12'),
(1062, 22, 'state', NULL),
(1061, 22, 'country', NULL),
(1060, 22, 'phone', '126645'),
(1059, 22, 'address_two', NULL),
(1086, 22, 'address_one', 'dhaka'),
(1057, 22, 'last_name', NULL),
(1056, 22, 'first_name', 'khan'),
(1087, 22, 'district', '11');

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
(22, 'khan', 'sohelahmeditebd@gmail.com', NULL, '$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2', NULL, NULL, NULL, 1, '2020-12-12 06:43:30', '2020-12-12 06:43:30');

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
(3, 2),
(5, 1),
(5, 2),
(5, 3);

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
(1, 22, 4, NULL, NULL),
(3, 21, 8, NULL, NULL),
(4, 2, 1, NULL, NULL),
(5, 2, 19, NULL, NULL),
(6, 2, 4, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_attribute_stock`
--
ALTER TABLE `temp_attribute_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `termmeta`
--
ALTER TABLE `termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1146;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_cart`
--
ALTER TABLE `user_cart`
  MODIFY `cart_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
