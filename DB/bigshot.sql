-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2020 at 11:12 AM
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
(2, 'Admin', 'admin@email.com', '$2y$10$kWxHZoXuhxBiFY/vdokU0u9REwpd7EWV7kekYFaS6Kd9ro6fLwK4S', '65756756', 1, '1', '2020-10-28 12:11:44', '2020-11-11 11:51:38'),
(4, 'Sohel Mia', 's@email.com', '$2y$10$XVZhNo8As133cCSEK6pNF.wHx2Ipy9D1SNmxtvs.rqxQAL1gDCeXq', '', 3, '1', '2020-11-03 09:34:08', '2020-11-11 11:51:50');

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
(1, 'color', 'color', 'select', 'menu_order', 1, 0, '2020-07-19 12:27:40', '2020-09-13 10:17:22'),
(2, 'size', 'size', 'select', 'menu_order', 1, 0, '2020-07-19 12:27:40', NULL),
(3, 'weight', 'weight', 'select', 'menu_order', 1, 0, '2020-07-19 12:27:40', NULL),
(4, 'inch', 'inch', 'select', 'menu_order', 0, 0, '2020-07-19 12:27:40', NULL),
(5, 'liter', 'liter', 'select', 'menu_order', 0, 0, '2020-07-19 12:27:40', NULL),
(6, 'pixel', 'pixel', 'select', 'menu_order', 0, 0, '2020-07-19 12:27:40', NULL),
(7, 'material', 'material', 'select', 'menu_order', 0, 0, '2020-07-19 12:27:40', NULL),
(10, 'tyrty', 'tyrty', 'select', 'menu_order', 1, 1, '2020-09-12 17:20:12', '2020-09-12 17:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `commentmeta`
--

CREATE TABLE `commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commentmeta`
--

INSERT INTO `commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(10, 28, 'rating', '5'),
(11, 28, 'verified', '0'),
(24, 44, 'rating', '5'),
(25, 44, 'verified', '0'),
(48, 57, 'rating', '4'),
(49, 57, 'verified', '0'),
(54, 60, 'rating', '1'),
(55, 60, 'verified', '0'),
(62, 64, 'rating', '1'),
(63, 64, 'verified', '0'),
(147, 108, 'akismet_history', 'a:3:{s:4:\"time\";d:1562259116.8554670810699462890625;s:5:\"event\";s:11:\"check-error\";s:4:\"meta\";a:1:{s:8:\"response\";s:7:\"invalid\";}}'),
(153, 110, 'akismet_history', 'a:3:{s:4:\"time\";d:1591755584.7326789;s:5:\"event\";s:11:\"check-error\";s:4:\"meta\";a:1:{s:8:\"response\";s:7:\"invalid\";}}'),
(78, 72, 'rating', '4'),
(79, 72, 'verified', '0'),
(82, 74, 'rating', '1'),
(83, 74, 'verified', '0'),
(100, 83, 'rating', '3'),
(101, 83, 'verified', '0'),
(106, 86, 'rating', '1'),
(107, 86, 'verified', '0'),
(114, 90, 'rating', '2'),
(115, 90, 'verified', '0'),
(151, 108, 'verified', '0'),
(152, 110, 'akismet_error', '1591755584'),
(149, 108, 'rating', '5'),
(155, 110, 'rating', '3'),
(156, 110, 'akismet_delayed_moderation_email', '1'),
(157, 110, 'verified', '0'),
(158, 111, 'akismet_error', '1592098654'),
(159, 111, 'akismet_history', 'a:3:{s:4:\"time\";d:1592098654.094192;s:5:\"event\";s:11:\"check-error\";s:4:\"meta\";a:1:{s:8:\"response\";s:7:\"invalid\";}}'),
(161, 111, 'rating', '4'),
(162, 111, 'akismet_delayed_moderation_email', '1'),
(163, 111, 'verified', '0'),
(164, 112, 'akismet_error', '1592247012'),
(165, 112, 'akismet_history', 'a:3:{s:4:\"time\";d:1592247012.7924149;s:5:\"event\";s:11:\"check-error\";s:4:\"meta\";a:1:{s:8:\"response\";s:7:\"invalid\";}}'),
(170, 113, 'akismet_error', '1594481195'),
(171, 113, 'akismet_history', 'a:3:{s:4:\"time\";d:1594481195.259727;s:5:\"event\";s:11:\"check-error\";s:4:\"meta\";a:1:{s:8:\"response\";s:7:\"invalid\";}}'),
(172, 113, 'akismet_as_submitted', 'a:13:{s:14:\"comment_author\";s:6:\"Mahadi\";s:20:\"comment_author_email\";s:26:\"Mahadihassan2894@gmail.com\";s:18:\"comment_author_url\";s:0:\"\";s:15:\"comment_content\";s:81:\"Good looking And wonderful designe...good Delivery Service.Thank you Abmworldmark\";s:12:\"comment_type\";s:0:\"\";s:7:\"user_ID\";i:0;s:7:\"user_id\";i:0;s:7:\"user_ip\";s:13:\"103.67.157.29\";s:10:\"user_agent\";s:125:\"Mozilla/5.0 (Linux; Android 4.4.4; SM-G360H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36\";s:4:\"blog\";s:23:\"http://abmworldmart.com\";s:9:\"blog_lang\";s:5:\"en_US\";s:12:\"blog_charset\";s:5:\"UTF-8\";s:9:\"permalink\";s:106:\"http://abmworldmart.com/index.php/product/embroidered-party-wear-lehenga-georgette-designer-salwar-suit-2/\";}'),
(173, 113, 'rating', '5'),
(174, 113, 'akismet_delayed_moderation_email', '1'),
(175, 113, 'verified', '0'),
(176, 113, 'akismet_history', 'a:3:{s:4:\"time\";d:1594554985.214933;s:5:\"event\";s:15:\"status-approved\";s:4:\"user\";s:15:\"abmw1452shop120\";}'),
(167, 112, 'rating', '1'),
(168, 112, 'akismet_delayed_moderation_email', '1'),
(169, 112, 'verified', '0');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2016-08-10 18:30:42', '2016-08-10 18:30:42', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0),
(2, 517, 'admin', 'thanhtd91@gmail.com', '', '117.6.204.186', '2015-08-24 04:26:19', '2015-08-24 04:26:19', 'Lorem ipsum dolor sit amet\n\"Consectetuer adipis. Mauris accumsan nulla vel diam. Sed in...\"\nPosted by Admin', 0, '1', '', '', 0, 1),
(3, 1195, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-08-17 09:10:04', '2015-08-17 09:10:04', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0),
(6, 749, 'admin', 'thanhtd91@gmail.com', '', '117.6.204.186', '2015-08-24 04:28:31', '2015-08-24 04:28:31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget tortor risus. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vivamus suscipit tortor eget felis porttitor volutpat.', 0, '1', '', '', 0, 1),
(7, 751, 'admin', 'ngocthang.ict@gmail.com', '', '117.6.204.186', '2015-09-04 02:57:34', '2015-09-04 02:57:34', 'Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur aliquet quam id dui posuere blandit. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt.', 0, '1', '', '', 0, 1),
(8, 759, 'admin', 'thanhtd91@gmail.com', '', '117.6.204.186', '2015-08-24 04:27:16', '2015-08-24 04:27:16', 'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;', 0, '1', '', '', 0, 1),
(15, 1806, 'WooCommerce', 'woocommerce@kutethemes.net', '', '', '2015-09-21 07:18:08', '2015-09-21 07:18:08', 'Awaiting cheque payment Order status changed from Pending Payment to On Hold.', 0, '1', '', 'order_note', 0, 0),
(16, 1195, 'Sable', '1b1fr5rpdj@outlook.com', 'http://fwucqvmdxn.com', '188.143.232.32', '2016-11-26 09:45:44', '2016-11-26 09:45:44', 'All of my questions settned-thalks!', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(17, 749, 'Dany', 'ivpcq77p@yahoo.com', 'http://aotylpsxeb.com', '188.143.234.155', '2016-11-26 09:45:59', '2016-11-26 09:45:59', 'Smart thkining - a clever way of looking at it.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(18, 751, 'Kory', '3ep6p9jh6o0@gmail.com', 'http://dzgzxeanc.com', '188.143.232.32', '2016-11-26 09:46:50', '2016-11-26 09:46:50', 'It\'s great to read something that\'s both enjoyable and provides prdiamtgsac solutions.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 0, 0),
(19, 751, 'Rayshelon', 'x4w4xa92hh@mail.com', 'http://rgardh.com', '188.143.232.32', '2016-11-26 09:48:33', '2016-11-26 09:48:33', 'Pecerft shot! Thanks for your post!', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 7, 0),
(21, 1, 'Jock', '24rg80f70zi@mail.com', 'http://frwcsehbll.com', '188.143.232.27', '2016-11-26 09:52:52', '2016-11-26 09:52:52', 'That\'s the thkining of a creative mind', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 1, 0),
(22, 743, 'Buff', 'v111d3ezt@yahoo.com', 'http://otxvhyve.com', '188.143.232.27', '2016-11-26 09:54:53', '2016-11-26 09:54:53', 'So excited I found this article as it made things much queickr!', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(23, 747, 'Arry', 'p8gfg3r3zq@yahoo.com', 'http://pyxdzdipa.com', '188.143.232.27', '2016-11-26 10:00:41', '2016-11-26 10:00:41', 'These pieces really set a standard in the inrsdtuy.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 0, 0),
(24, 517, 'Indy', 'vft6qw9wo6@outlook.com', 'http://jufjadicq.com', '188.143.232.32', '2016-11-26 10:03:08', '2016-11-26 10:03:08', 'Yup, that\'ll do it. You have my apoeacirtipn.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 2, 0),
(25, 1, 'Geralynn', '27eu3bo6pu@gmail.com', 'http://tsgnxdka.com', '188.143.232.32', '2016-11-26 10:03:50', '2016-11-26 10:03:50', 'Call me wind because I am abultsleoy blown away.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(26, 739, 'Starleigh', 'd63k30vks@hotmail.com', 'http://rbpfwtvc.com', '188.143.232.27', '2016-11-26 10:04:18', '2016-11-26 10:04:18', 'Stay with this guys, you\'re helipng a lot of people.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(27, 520, 'Biana', 'iw97pvh36@yahoo.com', 'http://jknomzdeszn.com', '188.143.232.27', '2016-11-26 10:04:33', '2016-11-26 10:04:33', 'AKAIK yovu\'e got the answer in one!', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 0, 0),
(28, 1248, 'Dolley', '9wykvaybxnb@outlook.com', '', '188.143.232.27', '2016-11-26 10:08:56', '2016-11-26 10:08:56', 'You get a lot of respect from me for writing these helpful arcselti.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', 'review', 0, 0),
(29, 510, 'Dorothy', '50uiw9tcf@yahoo.com', 'http://kxgbyhtyoqz.com', '188.143.232.27', '2016-11-26 10:09:49', '2016-11-26 10:09:49', 'Thanks for your thgtshuo. It\'s helped me a lot.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(30, 745, 'Keyanna', 'yugw7znltq1@gmail.com', 'http://yiffmnazsdx.com', '188.143.232.32', '2016-11-26 10:11:01', '2016-11-26 10:11:01', 'I was so confused about what to buy, but this makes it unaesrtdndable.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(31, 757, 'Tayten', 'gxfxv9kn2@mail.com', 'http://qcwfgqtswk.com', '188.143.232.27', '2016-11-26 10:11:04', '2016-11-26 10:11:04', 'Just the type of inhsgit we need to fire up the debate.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 0, 0),
(32, 759, 'Charleigh', 'ewxgsm5n8sx@gmail.com', 'http://sealhd.com', '188.143.232.32', '2016-11-26 10:40:49', '2016-11-26 10:40:49', 'Betsy:Ha!  I am so in adore with this.  My biological clock started up a few months ago and I&#8217;m&#8230;either preparing for future giglets or procrastinating from cleaning and sleeping.  I was unschooled for 6 years, and am so delighted to have found a secular homeschooler that isn&#8217;t yappy-sappy, overly politically or anti-religiously driven, and with a squeee-worthy sense of humor, plus this Secular Thursday biz to direct me to more fun n&#8217; games.  Suc;nribe&amp;#8230sdobe.Ha, sadly, even with very few friends in the real world, I totally wanted Pogs (off limits.)  But I did catch all 150 around the world, so&#8230;heh.  Hi.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 8, 0),
(33, 759, 'Susannah', '0ybxlesqy@yahoo.com', 'http://qvwgsidxtt.com', '188.143.232.27', '2016-11-26 10:45:32', '2016-11-26 10:45:32', 'LP is right. I&#8217;m an independent and I don&#8217;t like where the republicans are going. Obama has made some mistakes but he was right on GM and they should just admit it. Maybe Ob1;8&amp;#a2a7ms jobs plan isn&#8217;t perfect, but theres room for compromise. If the republicans could ask the rich to pay a little more we could turn this economy around. Are we really going to fire teachers and policemen because the republicans are too stubborn? Obama is doing the best he can and the republicans just want to play politics and screw him.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0', '', 0, 0),
(34, 514, 'Amelia', 'f0f8c2bd@hotmail.com', 'http://tghgnfjktw.com', '188.143.232.27', '2016-11-26 10:55:54', '2016-11-26 10:55:54', 'These Valued inrncause Tips I read on Bing From your Blog, Is Most Helpful To Readers, thanks For the great Article, Looking Forward To Reading Some More On Your Next Topic', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 0, 0),
(35, 755, 'Jaydee', '7sbvk7eaa7@hotmail.com', 'http://pnmukljnje.com', '188.143.234.155', '2016-11-26 10:59:43', '2016-11-26 10:59:43', 'I seldom drop remarks, but i did some searching and wound up here Embed Code | Intelicom. And I actually do have a couple of questions for you if you do#2n8&amp;17;t mind. Is it simply me or does it look like some of these responses come across like written by brain dead people?   And, if you are posting on other online sites, I would like to keep up with anything new you have to post. Could you list of every one of all your public sites like your Facebook page, twitter feed, or linkedin profile?', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 0, 0),
(36, 1195, 'Artrell', 'yzyfzo3rp@hotmail.com', 'http://xwiwgdsa.com', '188.143.232.27', '2016-11-26 11:06:32', '2016-11-26 11:06:32', 'Lena HC sk:HÃerriv¤rligt att du Ã¤r igÃ¥ng, och med vilken fin sida! Ã„ntligen kan jag fÃ¶lja dig. Ã–nskar dig allt gott!Kramar /Lena', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 3, 0),
(37, 749, 'Carlye', 'zhu8b3yl@hotmail.com', 'http://njzcczd.com', '188.143.232.32', '2016-11-26 11:13:41', '2016-11-26 11:13:41', 'This is clearly a case of penalizing the majority of the public instead of the offender! We were refused a patent related service by the Mumbai patent office on cheque payment - the Patent Office insisted on a DD. In these days of core banking there is no difference between outstation and local cheques, i.e. there are no collection deahls/cyarges.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '', 6, 0),
(44, 1248, 'Jimbo', 'y9vs1p6wwh@gmail.com', '', '188.143.234.155', '2016-11-26 12:34:22', '2016-11-26 12:34:22', 'If only there were more clveer people like you!', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', 'review', 0, 0),
(54, 1195, 'SailipDom', 'r8974jjil@gmail.com', 'http://undeclaiming.xyz', '46.161.9.12', '2017-05-16 20:26:09', '2017-05-16 20:26:09', 'http://undeclaiming.xyz <a href=\"http://undeclaiming.xyz\" rel=\"nofollow\">norsk kasino</a> http://undeclaiming.xyz - norsk kasino', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0', '', 0, 0),
(57, 1246, 'SEApotek', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-28 16:07:20', '2017-08-28 16:07:20', 'beställa billig, http://sverige-apotek.life/floxlevo.html , till salu i Sverige.', 0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'review', 0, 0),
(60, 300, 'sverige-apotek.life', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-28 16:50:52', '2017-08-28 16:50:52', 'göteborg göteborg, http://sverige-apotek.life/cipflox.html , köpa billigt malmö.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', 'review', 0, 0),
(64, 1248, 'sverige-apotek', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-28 18:03:11', '2017-08-28 18:03:11', 'priser, http://sverige-apotek.life/klarigen.html , kapslar köpa.', 0, '0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'review', 0, 0),
(72, 290, 'sverige-apotek', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-28 20:08:08', '2017-08-28 20:08:08', 'on-line europe, http://sverige-apotek.life/enalaprilum.html , till salu tabletter.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'review', 0, 0),
(74, 284, 'sverige-apotek', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-28 20:16:38', '2017-08-28 20:16:38', 'sweden online shop, http://sverige-apotek.life/selvim.html , kapslar göteborg.', 0, '0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53 BingPreview/1.0b', 'review', 0, 0),
(83, 298, 'sverige-apotek life', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-28 23:08:55', '2017-08-28 23:08:55', 'bästa pris pris, http://sverige-apotek.life/burten.html , köp online apoteket.', 0, '0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144', 'review', 0, 0),
(86, 277, 'sverige-apotek.life', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-29 00:56:11', '2017-08-29 00:56:11', 'shop göteborg, http://sverige-apotek.life/epleptin.html , pris pa göteborg.', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; rv:53.0) Gecko/20100101 Firefox/53.0', 'review', 0, 0),
(90, 289, 'sverige-apotek', 'winslowssales67@gmail.com', '', '146.185.223.71', '2017-08-29 02:19:58', '2017-08-29 02:19:58', 'billiga pris, http://sverige-apotek.life/lipitin.html , generic europe USA.', 0, '0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'review', 0, 0),
(106, 2137, 'WooCommerce', 'woocommerce@abmworldmart.com', '', '', '2019-05-26 06:43:28', '2019-05-26 06:43:28', 'Awaiting cheque payment Order status changed from Pending Payment to On Hold.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(108, 2111, 'Niklaus', 'Niklaus@gmail.com', '', '137.74.80.168', '2019-07-04 16:51:56', '2019-07-04 16:51:56', 'NbBQXgYOOdlmW6tE86mpEvf4vd8AubWEBJQ2Qy4SeGN5LfYVcu8j7oAl9L4nyXlwSJEAve2L1\r\n\r\nHi, very nice website, cheers!\r\n------------------------------------------------------\r\nNeed cheap and reliable hosting? Our shared plans start at $10 for an year and VPS plans for $6/Mo.\r\n------------------------------------------------------\r\nCheck here: https://www.reliable-webhosting.com/\r\n\r\nNbBQXgYOOdlmW6tE86mpEvf4vd8AubWEBJQ2Qy4SeGN5LfYVcu8j7oAl9L4nyXlwSJEAve2L1', 0, '0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', '', 0, 0),
(109, 2168, 'WooCommerce', 'woocommerce@abmworldmart.com', '', '', '2020-05-05 15:47:04', '2020-05-05 15:47:04', 'Awaiting cheque payment Order status changed from Pending Payment to On Hold.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(110, 2240, 'Eric Jones', 'eric@talkwithwebvisitor.com', '', '173.232.226.7', '2020-06-10 02:19:44', '2020-06-10 02:19:44', 'Hey there, I just found your site, quick question…\r\n\r\nMy name’s Eric, I found abmworldmart.com after doing a quick search – you showed up near the top of the rankings, so whatever you’re doing for SEO, looks like it’s working well.\r\n\r\nSo here’s my question – what happens AFTER someone lands on your site?  Anything?\r\n\r\nResearch tells us at least 70% of the people who find your site, after a quick once-over, they disappear… forever.\r\n\r\nThat means that all the work and effort you put into getting them to show up, goes down the tubes.\r\n\r\nWhy would you want all that good work – and the great site you’ve built – go to waste?\r\n\r\nBecause the odds are they’ll just skip over calling or even grabbing their phone, leaving you high and dry.\r\n\r\nBut here’s a thought… what if you could make it super-simple for someone to raise their hand, say, “okay, let’s talk” without requiring them to even pull their cell phone from their pocket?\r\n  \r\nYou can – thanks to revolutionary new software that can literally make that first call happen NOW.\r\n\r\nTalk With Web Visitor is a software widget that sits on your site, ready and waiting to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re still there at your site.\r\n  \r\nYou know, strike when the iron’s hot!\r\n\r\nCLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nWhen targeting leads, you HAVE to act fast – the difference between contacting someone within 5 minutes versus 30 minutes later is huge – like 100 times better!\r\n\r\nThat’s why you should check out our new SMS Text With Lead feature as well… once you’ve captured the phone number of the website visitor, you can automatically kick off a text message (SMS) conversation with them. \r\n \r\nImagine how powerful this could be – even if they don’t take you up on your offer immediately, you can stay in touch with them using text messages to make new offers, provide links to great content, and build your credibility.\r\n\r\nJust this alone could be a game changer to make your website even more effective.\r\n\r\nStrike when  the iron’s hot!\r\n\r\nCLICK HERE http://www.talkwithwebvisitor.com to learn more about everything Talk With Web Visitor can do for your business – you’ll be amazed.\r\n\r\nThanks and keep up the great work!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – you could be converting up to 100x more leads immediately!   \r\nIt even includes International Long Distance Calling. \r\nStop wasting money chasing eyeballs that don’t turn into paying customers. \r\nCLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=abmworldmart.com', 0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36', '', 0, 0),
(111, 2240, 'Eric Jones', 'eric@talkwithwebvisitor.com', '', '23.89.247.110', '2020-06-14 01:37:34', '2020-06-14 01:37:34', 'Cool website!\r\n\r\nMy name’s Eric, and I just found your site - abmworldmart.com - while surfing the net. You showed up at the top of the search results, so I checked you out. Looks like what you’re doing is pretty cool.\r\n \r\nBut if you don’t mind me asking – after someone like me stumbles across abmworldmart.com, what usually happens?\r\n\r\nIs your site generating leads for your business? \r\n \r\nI’m guessing some, but I also bet you’d like more… studies show that 7 out 10 who land on a site wind up leaving without a trace.\r\n\r\nNot good.\r\n\r\nHere’s a thought – what if there was an easy way for every visitor to “raise their hand” to get a phone call from you INSTANTLY… the second they hit your site and said, “call me now.”\r\n\r\nYou can –\r\n  \r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nCLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nTime is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!\r\n\r\nThat’s why we built out our new SMS Text With Lead feature… because once you’ve captured the visitor’s phone number, you can automatically start a text message (SMS) conversation.\r\n  \r\nThink about the possibilities – even if you don’t close a deal then and there, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nWouldn’t that be cool?\r\n\r\nCLICK HERE http://www.talkwithwebvisitor.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\nEric\r\n\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=abmworldmart.com', 0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36', '', 0, 0),
(112, 2240, 'Eric Jones', 'eric@talkwithwebvisitor.com', '', '181.177.112.48', '2020-06-15 18:50:12', '2020-06-15 18:50:12', 'Hey, my name’s Eric and for just a second, imagine this…\r\n\r\n- Someone does a search and winds up at abmworldmart.com.\r\n\r\n- They hang out for a minute to check it out.  “I’m interested… but… maybe…”\r\n\r\n- And then they hit the back button and check out the other search results instead. \r\n\r\n- Bottom line – you got an eyeball, but nothing else to show for it.\r\n\r\n- There they go.\r\n\r\nThis isn’t really your fault – it happens a LOT – studies show 7 out of 10 visitors to any site disappear without leaving a trace.\r\n\r\nBut you CAN fix that.\r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know right then and there – enabling you to call that lead while they’re literally looking over your site.\r\n\r\nCLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nTime is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!\r\n\r\nPlus, now that you have their phone number, with our new SMS Text With Lead feature you can automatically start a text (SMS) conversation… so even if you don’t close a deal then, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nStrong stuff.\r\n\r\nCLICK HERE http://www.talkwithwebvisitor.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=abmworldmart.com', 0, '0', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36', '', 0, 0),
(113, 2502, 'Mahadi', 'Mahadihassan2894@gmail.com', '', '103.67.157.29', '2020-07-11 15:26:35', '2020-07-11 15:26:35', 'Good looking And wonderful designe...good Delivery Service.Thank you Abmworldmark', 0, '1', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-G360H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '', 0, 0);

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

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_amount`, `expire_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '4567', '500', '2020-11-09', 1, '2020-11-07 09:17:28', '2020-11-07 09:17:28'),
(2, '12', '300', '2020-11-14', 1, '2020-11-08 04:58:38', '2020-11-08 04:58:41');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_product_permissions`
--

CREATE TABLE `downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `ecommerce_termmeta`
--

INSERT INTO `ecommerce_termmeta` (`meta_id`, `ecommerce_term_id`, `meta_key`, `meta_value`) VALUES
(1, 17, 'thumbnail_id', '1'),
(2, 18, 'thumbnail_id', '2'),
(3, 19, 'thumbnail_id', '3'),
(4, 20, 'thumbnail_id', '4'),
(5, 21, 'thumbnail_id', '5'),
(6, 22, 'thumbnail_id', '6'),
(7, 23, 'thumbnail_id', '7'),
(8, 24, 'thumbnail_id', '8');

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
(1, 1, '_tax_class', '', '264', '2020-11-14', '2'),
(2, 1, '_qty', '3', '264', '2020-11-14', '2'),
(3, 1, '_product_id', '262', '264', '2020-11-14', '2'),
(4, 1, '_variation_id', '', '264', '2020-11-14', '2'),
(5, 1, '_line_subtotal', '9000', '264', '2020-11-14', '2'),
(6, 1, '_line_total', '9000', '264', '2020-11-14', '2'),
(7, 1, '_line_subtotal_tax', '', '264', '2020-11-14', '2'),
(8, 1, '_line_tax', '', '264', '2020-11-14', '2'),
(9, 1, '_line_tax_data', '2020-11-14 22:04:50', '264', '2020-11-14', '2'),
(10, 1, 'delivery_charge', '600', '264', '2020-11-14', '2'),
(11, 1, 'coupon_code', NULL, '264', '2020-11-14', '2'),
(12, 1, 'coupon_taka', '0', '264', '2020-11-14', '2'),
(13, 2, '_tax_class', '', '264', '2020-11-14', '2'),
(14, 2, '_qty', '2', '264', '2020-11-14', '2'),
(15, 2, '_product_id', '263', '264', '2020-11-14', '2'),
(16, 2, '_variation_id', '', '264', '2020-11-14', '2'),
(17, 2, '_line_subtotal', '6000', '264', '2020-11-14', '2'),
(18, 2, '_line_total', '6000', '264', '2020-11-14', '2'),
(19, 2, '_line_subtotal_tax', '', '264', '2020-11-14', '2'),
(20, 2, '_line_tax', '', '264', '2020-11-14', '2'),
(21, 2, '_line_tax_data', '2020-11-14 22:04:50', '264', '2020-11-14', '2'),
(22, 2, 'delivery_charge', '600', '264', '2020-11-14', '2'),
(23, 2, 'coupon_code', NULL, '264', '2020-11-14', '2'),
(24, 2, 'coupon_taka', '0', '264', '2020-11-14', '2');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `product_id`, `order_id`) VALUES
(1, 'Demo', 'line-item', '262', 264),
(2, 'Test', 'line-item', '263', 264);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(640, 262, 'alert_qty', '34'),
(641, 262, 'product_stock', '2000'),
(639, 262, 'qty', '61'),
(638, 262, 'height', NULL),
(637, 262, 'width', NULL),
(636, 262, 'length', NULL),
(635, 262, 'weight', NULL),
(634, 262, 'sale_price', '3000'),
(633, 262, 'regular_price', '5000'),
(632, 262, 'stock_status', 'instock'),
(631, 262, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\",\"term_id\":25}]'),
(16, 223, 'first_name', 'Guest'),
(17, 223, 'last_name', 'Guest'),
(18, 223, 'address_one', 'Uttara,Dhaka'),
(19, 223, 'address_two', NULL),
(20, 223, 'phone', '0000000001'),
(21, 223, 'email', 'guest@email.com'),
(22, 223, 'country', 'Bangladesh'),
(23, 223, 'state', 'Dhaka'),
(24, 223, 'city', 'kuril'),
(25, 223, 'zip', '4567'),
(26, 223, '_customer_user', '0'),
(27, 223, '_billing_postcode', '4567'),
(28, 223, '_billing_company', NULL),
(29, 223, '_billing_last_name', NULL),
(30, 223, '_billing_first_name', NULL),
(31, 223, 'payment_method', 'CashOnDelivery'),
(32, 224, 'first_name', 'Demo'),
(33, 224, 'last_name', 'Demo'),
(34, 224, 'address_one', 'Uttara'),
(35, 224, 'address_two', NULL),
(36, 224, 'phone', '6789'),
(37, 224, 'email', 'demo@email.com'),
(38, 224, 'country', 'Bangladesh'),
(39, 224, 'state', 'Dhaka'),
(40, 224, 'city', 'kuril'),
(41, 224, 'zip', 'kuril'),
(42, 224, '_customer_user', '2'),
(43, 224, '_billing_postcode', 'kuril'),
(44, 224, '_billing_company', NULL),
(45, 224, '_billing_last_name', NULL),
(46, 224, '_billing_first_name', NULL),
(47, 224, 'payment_method', 'CashOnDelivery'),
(48, 224, 'processing_date', '2020-11-04'),
(49, 225, 'first_name', 'Demo'),
(50, 225, 'last_name', 'Demo'),
(51, 225, 'address_one', 'Uttara'),
(52, 225, 'address_two', NULL),
(53, 225, 'phone', '6789'),
(54, 225, 'email', 'demo@email.com'),
(55, 225, 'country', 'Bangladesh'),
(56, 225, 'state', 'Dhaka'),
(57, 225, 'city', 'kuril'),
(58, 225, 'zip', 'kuril'),
(59, 225, '_customer_user', '2'),
(60, 225, '_billing_postcode', 'kuril'),
(61, 225, '_billing_company', NULL),
(62, 225, '_billing_last_name', NULL),
(63, 225, '_billing_first_name', NULL),
(64, 225, 'payment_method', 'CashOnDelivery'),
(65, 225, 'processing_date', '2020-11-05'),
(66, 223, 'processing_date', '2020-11-05'),
(657, 263, '_sku', '22612802419111604551889'),
(656, 263, 'start_stock', '2000'),
(655, 263, 'product_stock', '2000'),
(654, 263, 'alert_qty', '40'),
(653, 263, 'qty', '6'),
(652, 263, 'height', NULL),
(651, 263, 'width', NULL),
(650, 263, 'length', NULL),
(648, 263, 'sale_price', '3000'),
(649, 263, 'weight', NULL),
(646, 263, 'stock_status', 'instock'),
(647, 263, 'regular_price', '5000'),
(82, 227, 'banner_image', '1604562118.png'),
(83, 228, 'first_name', 'Partho'),
(84, 228, 'last_name', 'Guest'),
(85, 228, 'address_one', 'Uttara,Dhaka'),
(86, 228, 'address_two', NULL),
(87, 228, 'phone', '0000000001'),
(88, 228, 'email', 'parthokar90@gmail.com'),
(89, 228, 'country', 'Bangladesh'),
(90, 228, 'state', 'Dhaka'),
(91, 228, 'city', 'kuril'),
(92, 228, 'zip', '4567'),
(93, 228, '_customer_user', '23'),
(94, 228, '_billing_postcode', '4567'),
(95, 228, '_billing_company', NULL),
(96, 228, '_billing_last_name', NULL),
(97, 228, '_billing_first_name', NULL),
(98, 228, 'payment_method', 'CashOnDelivery'),
(99, 229, 'first_name', 'Partho'),
(100, 229, 'last_name', 'Guest'),
(101, 229, 'address_one', 'Uttara,Dhaka'),
(102, 229, 'address_two', NULL),
(103, 229, 'phone', '0000000001'),
(104, 229, 'email', 'parthokar90@gmail.com'),
(105, 229, 'country', 'Bangladesh'),
(106, 229, 'state', 'Dhaka'),
(107, 229, 'city', 'kuril'),
(108, 229, 'zip', '4567'),
(109, 229, '_customer_user', '23'),
(110, 229, '_billing_postcode', '4567'),
(111, 229, '_billing_company', NULL),
(112, 229, '_billing_last_name', NULL),
(113, 229, '_billing_first_name', NULL),
(114, 229, 'payment_method', 'CashOnDelivery'),
(115, 229, 'processing_date', '2020-11-07'),
(116, 228, 'processing_date', '2020-11-07'),
(117, 230, 'first_name', 'Partho'),
(118, 230, 'last_name', 'Guest'),
(119, 230, 'address_one', 'Uttara,Dhaka'),
(120, 230, 'address_two', NULL),
(121, 230, 'phone', '0000000001'),
(122, 230, 'email', 'parthokar90@gmail.com'),
(123, 230, 'country', 'Bangladesh'),
(124, 230, 'state', 'Bagerhat'),
(125, 230, 'city', 'bagerhat police line'),
(126, 230, 'zip', '9300'),
(127, 230, '_customer_user', '23'),
(128, 230, '_billing_postcode', '9300'),
(129, 230, '_billing_company', NULL),
(130, 230, '_billing_last_name', NULL),
(131, 230, '_billing_first_name', NULL),
(132, 230, 'payment_method', 'CashOnDelivery'),
(133, 230, 'processing_date', '2020-11-07'),
(645, 263, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\",\"term_id\":25},{\"taxonomy\":\"pa_size\",\"term\":\"Xl\",\"term_id\":26}]'),
(148, 232, 'first_name', 'Guest'),
(149, 232, 'last_name', 'Guest'),
(150, 232, 'address_one', 'Uttara,Dhaka'),
(151, 232, 'address_two', NULL),
(152, 232, 'phone', '0000000001'),
(153, 232, 'email', 'guest@email.com'),
(154, 232, 'country', 'Bangladesh'),
(155, 232, 'state', 'Dhaka'),
(156, 232, 'city', 'kuril'),
(157, 232, 'zip', '4567'),
(158, 232, '_customer_user', '0'),
(159, 232, '_billing_postcode', '4567'),
(160, 232, '_billing_company', NULL),
(161, 232, '_billing_last_name', NULL),
(162, 232, '_billing_first_name', NULL),
(163, 232, 'payment_method', 'CashOnDelivery'),
(164, 233, 'first_name', 'Guest'),
(165, 233, 'last_name', 'Guest'),
(166, 233, 'address_one', 'Uttara,Dhaka'),
(167, 233, 'address_two', NULL),
(168, 233, 'phone', '0000000001'),
(169, 233, 'email', 'guest@email.com'),
(170, 233, 'country', 'Bangladesh'),
(171, 233, 'state', 'Dhaka'),
(172, 233, 'city', 'kuril'),
(173, 233, 'zip', '4567'),
(174, 233, '_customer_user', '0'),
(175, 233, '_billing_postcode', '4567'),
(176, 233, '_billing_company', NULL),
(177, 233, '_billing_last_name', NULL),
(178, 233, '_billing_first_name', NULL),
(179, 233, 'payment_method', 'CashOnDelivery'),
(180, 234, 'first_name', 'Guest'),
(181, 234, 'last_name', 'Guest'),
(182, 234, 'address_one', 'Uttara,Dhaka'),
(183, 234, 'address_two', NULL),
(184, 234, 'phone', '0000000001'),
(185, 234, 'email', 'guest@email.com'),
(186, 234, 'country', 'Bangladesh'),
(187, 234, 'state', 'Dhaka'),
(188, 234, 'city', 'kuril'),
(189, 234, 'zip', '4567'),
(190, 234, '_customer_user', '0'),
(191, 234, '_billing_postcode', '4567'),
(192, 234, '_billing_company', NULL),
(193, 234, '_billing_last_name', NULL),
(194, 234, '_billing_first_name', NULL),
(195, 234, 'payment_method', 'CashOnDelivery'),
(196, 235, 'first_name', 'Demo'),
(197, 235, 'last_name', 'Demo'),
(198, 235, 'address_one', 'Uttara'),
(199, 235, 'address_two', NULL),
(200, 235, 'phone', '6789'),
(201, 235, 'email', 'demo@email.com'),
(202, 235, 'country', 'Bangladesh'),
(203, 235, 'state', 'Dhaka'),
(204, 235, 'city', 'kuril'),
(205, 235, 'zip', '4567'),
(206, 235, '_customer_user', '2'),
(207, 235, '_billing_postcode', '4567'),
(208, 235, '_billing_company', NULL),
(209, 235, '_billing_last_name', NULL),
(210, 235, '_billing_first_name', NULL),
(211, 235, 'payment_method', 'DeliveryChargeOnly'),
(212, 236, 'first_name', 'Demo'),
(213, 236, 'last_name', 'Demo'),
(214, 236, 'address_one', 'Uttara'),
(215, 236, 'address_two', NULL),
(216, 236, 'phone', '6789'),
(217, 236, 'email', 'demo@email.com'),
(218, 236, 'country', 'Bangladesh'),
(219, 236, 'state', 'Sylhet'),
(220, 236, 'city', 'Habiganj1'),
(221, 236, 'zip', '3330-337456'),
(222, 236, '_customer_user', '2'),
(223, 236, '_billing_postcode', '3330-337456'),
(224, 236, '_billing_company', NULL),
(225, 236, '_billing_last_name', NULL),
(226, 236, '_billing_first_name', NULL),
(227, 236, 'payment_method', 'FullPayment'),
(228, 237, 'first_name', 'Demo'),
(229, 237, 'last_name', 'Demo'),
(230, 237, 'address_one', 'Uttara'),
(231, 237, 'address_two', NULL),
(232, 237, 'phone', '6789'),
(233, 237, 'email', 'demo@email.com'),
(234, 237, 'country', 'Bangladesh'),
(235, 237, 'state', 'Dhaka'),
(236, 237, 'city', 'kuril'),
(237, 237, 'zip', '4567'),
(238, 237, '_customer_user', '2'),
(291, 240, 'payment_method', 'CashOnDelivery'),
(290, 240, '_billing_first_name', NULL),
(289, 240, '_billing_last_name', NULL),
(288, 240, '_billing_company', NULL),
(287, 240, '_billing_postcode', '4567'),
(286, 240, '_customer_user', '2'),
(285, 240, 'zip', '4567'),
(284, 240, 'city', 'kuril'),
(283, 240, 'state', 'Dhaka'),
(282, 240, 'country', 'Bangladesh'),
(281, 240, 'email', 'demo@email.com'),
(280, 240, 'phone', '6789'),
(279, 240, 'address_two', NULL),
(278, 240, 'address_one', 'Uttara'),
(277, 240, 'last_name', 'Demo'),
(276, 240, 'first_name', 'Demo'),
(292, 241, 'first_name', 'Demo'),
(293, 241, 'last_name', 'Demo'),
(294, 241, 'address_one', 'Uttara'),
(295, 241, 'address_two', NULL),
(296, 241, 'phone', '6789'),
(297, 241, 'email', 'demo@email.com'),
(298, 241, 'country', 'Bangladesh'),
(299, 241, 'state', 'Dhaka'),
(300, 241, 'city', 'kuril'),
(301, 241, 'zip', '4567'),
(302, 241, '_customer_user', '2'),
(303, 241, '_billing_postcode', '4567'),
(304, 241, '_billing_company', NULL),
(305, 241, '_billing_last_name', NULL),
(306, 241, '_billing_first_name', NULL),
(307, 241, 'payment_method', 'CashOnDelivery'),
(308, 242, 'first_name', 'Demo'),
(309, 242, 'last_name', 'Demo'),
(310, 242, 'address_one', 'Uttara'),
(311, 242, 'address_two', NULL),
(312, 242, 'phone', '6789'),
(313, 242, 'email', 'demo@email.com'),
(314, 242, 'country', 'Bangladesh'),
(315, 242, 'state', 'Dhaka'),
(316, 242, 'city', 'kuril'),
(317, 242, 'zip', '4567'),
(318, 242, '_customer_user', '2'),
(319, 242, '_billing_postcode', '4567'),
(320, 242, '_billing_company', NULL),
(321, 242, '_billing_last_name', NULL),
(322, 242, '_billing_first_name', NULL),
(323, 242, 'payment_method', 'CashOnDelivery'),
(324, 243, 'first_name', 'Demo'),
(325, 243, 'last_name', 'Demo'),
(326, 243, 'address_one', 'Uttara'),
(327, 243, 'address_two', NULL),
(328, 243, 'phone', '6789'),
(329, 243, 'email', 'demo@email.com'),
(330, 243, 'country', 'Bangladesh'),
(331, 243, 'state', 'Dhaka'),
(332, 243, 'city', 'kuril'),
(333, 243, 'zip', '4567'),
(334, 243, '_customer_user', '2'),
(335, 243, '_billing_postcode', '4567'),
(336, 243, '_billing_company', NULL),
(337, 243, '_billing_last_name', NULL),
(338, 243, '_billing_first_name', NULL),
(339, 243, 'payment_method', 'CashOnDelivery'),
(340, 244, 'first_name', 'Demo'),
(341, 244, 'last_name', 'Demo'),
(342, 244, 'address_one', 'Uttara'),
(343, 244, 'address_two', NULL),
(344, 244, 'phone', '6789'),
(345, 244, 'email', 'demo@email.com'),
(346, 244, 'country', 'Bangladesh'),
(347, 244, 'state', 'Sylhet'),
(348, 244, 'city', 'Habiganj1'),
(349, 244, 'zip', '3330-337456'),
(350, 244, '_customer_user', '2'),
(351, 244, '_billing_postcode', '3330-337456'),
(352, 244, '_billing_company', NULL),
(353, 244, '_billing_last_name', NULL),
(354, 244, '_billing_first_name', NULL),
(355, 244, 'payment_method', 'CashOnDelivery'),
(356, 245, 'first_name', 'Demo'),
(357, 245, 'last_name', 'Demo'),
(358, 245, 'address_one', 'Uttara'),
(359, 245, 'address_two', NULL),
(360, 245, 'phone', '6789'),
(361, 245, 'email', 'demo@email.com'),
(362, 245, 'country', 'Bangladesh'),
(363, 245, 'state', 'Dhaka'),
(364, 245, 'city', 'badda'),
(365, 245, 'zip', '123'),
(366, 245, '_customer_user', '2'),
(367, 245, '_billing_postcode', '123'),
(368, 245, '_billing_company', NULL),
(369, 245, '_billing_last_name', NULL),
(370, 245, '_billing_first_name', NULL),
(371, 245, 'payment_method', 'CashOnDelivery'),
(372, 246, 'first_name', 'Demo'),
(373, 246, 'last_name', 'Demo'),
(374, 246, 'address_one', 'Uttara'),
(375, 246, 'address_two', NULL),
(376, 246, 'phone', '6789'),
(377, 246, 'email', 'demo@email.com'),
(378, 246, 'country', 'Bangladesh'),
(379, 246, 'state', 'Dhaka'),
(380, 246, 'city', 'kuril'),
(381, 246, 'zip', '4567'),
(382, 246, '_customer_user', '2'),
(383, 246, '_billing_postcode', '4567'),
(384, 246, '_billing_company', NULL),
(385, 246, '_billing_last_name', NULL),
(386, 246, '_billing_first_name', NULL),
(387, 246, 'payment_method', 'CashOnDelivery'),
(388, 247, 'first_name', 'Demo'),
(389, 247, 'last_name', 'Demo'),
(390, 247, 'address_one', 'Uttara'),
(391, 247, 'address_two', NULL),
(392, 247, 'phone', '6789'),
(393, 247, 'email', 'demo@email.com'),
(394, 247, 'country', 'Bangladesh'),
(395, 247, 'state', 'Dhaka'),
(396, 247, 'city', 'badda'),
(397, 247, 'zip', '123'),
(398, 247, '_customer_user', '2'),
(399, 247, '_billing_postcode', '123'),
(400, 247, '_billing_company', NULL),
(401, 247, '_billing_last_name', NULL),
(402, 247, '_billing_first_name', NULL),
(403, 247, 'payment_method', 'CashOnDelivery'),
(404, 248, 'first_name', 'Demo'),
(405, 248, 'last_name', 'Demo'),
(406, 248, 'address_one', 'Uttara'),
(407, 248, 'address_two', NULL),
(408, 248, 'phone', '6789'),
(409, 248, 'email', 'demo@email.com'),
(410, 248, 'country', 'Bangladesh'),
(411, 248, 'state', 'Dhaka'),
(412, 248, 'city', 'kuril'),
(413, 248, 'zip', '4567'),
(414, 248, '_customer_user', '2'),
(415, 248, '_billing_postcode', '4567'),
(416, 248, '_billing_company', NULL),
(417, 248, '_billing_last_name', NULL),
(418, 248, '_billing_first_name', NULL),
(419, 248, 'payment_method', 'CashOnDelivery'),
(420, 249, 'first_name', 'Demo'),
(421, 249, 'last_name', 'Demo'),
(422, 249, 'address_one', 'Uttara'),
(423, 249, 'address_two', NULL),
(424, 249, 'phone', '6789'),
(425, 249, 'email', 'demo@email.com'),
(426, 249, 'country', 'Bangladesh'),
(427, 249, 'state', 'Dhaka'),
(428, 249, 'city', 'kuril'),
(429, 249, 'zip', '4567'),
(430, 249, '_customer_user', '2'),
(431, 249, '_billing_postcode', '4567'),
(432, 249, '_billing_company', NULL),
(433, 249, '_billing_last_name', NULL),
(434, 249, '_billing_first_name', NULL),
(435, 249, 'payment_method', 'CashOnDelivery'),
(436, 250, 'first_name', 'Demo'),
(437, 250, 'last_name', 'Demo'),
(438, 250, 'address_one', 'Uttara'),
(439, 250, 'address_two', NULL),
(440, 250, 'phone', '6789'),
(441, 250, 'email', 'demo@email.com'),
(442, 250, 'country', 'Bangladesh'),
(443, 250, 'state', 'Dhaka'),
(444, 250, 'city', 'kuril'),
(445, 250, 'zip', '4567'),
(446, 250, '_customer_user', '2'),
(447, 250, '_billing_postcode', '4567'),
(448, 250, '_billing_company', NULL),
(449, 250, '_billing_last_name', NULL),
(450, 250, '_billing_first_name', NULL),
(451, 250, 'payment_method', 'CashOnDelivery'),
(452, 251, 'first_name', 'Guest'),
(453, 251, 'last_name', 'Guest'),
(454, 251, 'address_one', 'Uttara,Dhaka'),
(455, 251, 'address_two', NULL),
(456, 251, 'phone', '0000000001'),
(457, 251, 'email', 'guest@email.com'),
(458, 251, 'country', 'Bangladesh'),
(459, 251, 'state', 'Dhaka'),
(460, 251, 'city', 'kuril'),
(461, 251, 'zip', '4567'),
(462, 251, '_customer_user', '0'),
(463, 251, '_billing_postcode', '4567'),
(464, 251, '_billing_company', NULL),
(465, 251, '_billing_last_name', NULL),
(466, 251, '_billing_first_name', NULL),
(467, 251, 'payment_method', 'CashOnDelivery'),
(468, 252, 'first_name', 'Partho'),
(469, 252, 'last_name', 'Guest'),
(470, 252, 'address_one', 'Uttara,Dhaka'),
(471, 252, 'address_two', NULL),
(472, 252, 'phone', '0000000001'),
(473, 252, 'email', 'parthokar90@gmail.com'),
(474, 252, 'country', 'Bangladesh'),
(475, 252, 'state', 'Dhaka'),
(476, 252, 'city', 'kuril'),
(477, 252, 'zip', '4567'),
(478, 252, '_customer_user', '23'),
(479, 252, '_billing_postcode', '4567'),
(480, 252, '_billing_company', NULL),
(481, 252, '_billing_last_name', NULL),
(482, 252, '_billing_first_name', NULL),
(483, 252, 'payment_method', 'CashOnDelivery'),
(484, 253, 'first_name', 'Partho'),
(485, 253, 'last_name', 'Guest'),
(486, 253, 'address_one', 'Uttara,Dhaka'),
(487, 253, 'address_two', NULL),
(488, 253, 'phone', '0000000001'),
(489, 253, 'email', 'parthokar90@gmail.com'),
(490, 253, 'country', 'Bangladesh'),
(491, 253, 'state', 'Dhaka'),
(492, 253, 'city', 'kuril'),
(493, 253, 'zip', '4567'),
(494, 253, '_customer_user', '23'),
(495, 253, '_billing_postcode', '4567'),
(496, 253, '_billing_company', NULL),
(497, 253, '_billing_last_name', NULL),
(498, 253, '_billing_first_name', NULL),
(499, 253, 'payment_method', 'CashOnDelivery'),
(500, 254, 'first_name', 'Partho'),
(501, 254, 'last_name', 'Guest'),
(502, 254, 'address_one', 'Uttara,Dhaka'),
(503, 254, 'address_two', NULL),
(504, 254, 'phone', '0000000001'),
(505, 254, 'email', 'parthokar90@gmail.com'),
(506, 254, 'country', 'Bangladesh'),
(507, 254, 'state', 'Dhaka'),
(508, 254, 'city', 'kuril'),
(509, 254, 'zip', '4567'),
(510, 254, '_customer_user', '23'),
(511, 254, '_billing_postcode', '4567'),
(512, 254, '_billing_company', NULL),
(513, 254, '_billing_last_name', NULL),
(514, 254, '_billing_first_name', NULL),
(515, 254, 'payment_method', 'CashOnDelivery'),
(516, 255, 'first_name', 'Partho'),
(517, 255, 'last_name', 'Guest'),
(518, 255, 'address_one', 'Uttara,Dhaka'),
(519, 255, 'address_two', NULL),
(520, 255, 'phone', '0000000001'),
(521, 255, 'email', 'parthokar90@gmail.com'),
(522, 255, 'country', 'Bangladesh'),
(523, 255, 'state', 'Dhaka'),
(524, 255, 'city', 'kuril'),
(525, 255, 'zip', '4567'),
(526, 255, '_customer_user', '23'),
(527, 255, '_billing_postcode', '4567'),
(528, 255, '_billing_company', NULL),
(529, 255, '_billing_last_name', NULL),
(530, 255, '_billing_first_name', NULL),
(531, 255, 'payment_method', 'CashOnDelivery'),
(532, 256, 'first_name', 'Partho'),
(533, 256, 'last_name', 'Guest'),
(534, 256, 'address_one', 'Uttara,Dhaka'),
(535, 256, 'address_two', NULL),
(536, 256, 'phone', '0000000001'),
(537, 256, 'email', 'parthokar90@gmail.com'),
(538, 256, 'country', 'Bangladesh'),
(539, 256, 'state', 'Dhaka'),
(540, 256, 'city', 'badda'),
(541, 256, 'zip', '123'),
(542, 256, '_customer_user', '23'),
(543, 256, '_billing_postcode', '123'),
(544, 256, '_billing_company', NULL),
(545, 256, '_billing_last_name', NULL),
(546, 256, '_billing_first_name', NULL),
(547, 256, 'payment_method', 'CashOnDelivery'),
(548, 257, 'first_name', 'Partho'),
(549, 257, 'last_name', 'Guest'),
(550, 257, 'address_one', 'Uttara,Dhaka'),
(551, 257, 'address_two', NULL),
(552, 257, 'phone', '0000000001'),
(553, 257, 'email', 'parthokar90@gmail.com'),
(554, 257, 'country', 'Bangladesh'),
(555, 257, 'state', 'Dhaka'),
(556, 257, 'city', 'kuril'),
(557, 257, 'zip', '4567'),
(558, 257, '_customer_user', '23'),
(559, 257, '_billing_postcode', '4567'),
(560, 257, '_billing_company', NULL),
(561, 257, '_billing_last_name', NULL),
(562, 257, '_billing_first_name', NULL),
(563, 257, 'payment_method', 'CashOnDelivery'),
(564, 257, 'processing_date', '2020-11-10'),
(566, 256, 'processing_date', '2020-11-10'),
(567, 258, 'first_name', 'Demo'),
(568, 258, 'last_name', 'Demo'),
(569, 258, 'address_one', 'Uttara'),
(570, 258, 'address_two', NULL),
(571, 258, 'phone', '6789'),
(572, 258, 'email', 'demo@email.com'),
(573, 258, 'country', 'Bangladesh'),
(574, 258, 'state', 'Sylhet'),
(575, 258, 'city', 'Habiganj1'),
(576, 258, 'zip', '3330-337456'),
(577, 258, '_customer_user', '2'),
(578, 258, '_billing_postcode', '3330-337456'),
(579, 258, '_billing_company', NULL),
(580, 258, '_billing_last_name', NULL),
(581, 258, '_billing_first_name', NULL),
(582, 258, 'payment_method', 'CashOnDelivery'),
(583, 259, 'first_name', 'Demo'),
(584, 259, 'last_name', 'Demo'),
(585, 259, 'address_one', 'Uttara'),
(586, 259, 'address_two', NULL),
(587, 259, 'phone', '6789'),
(588, 259, 'email', 'demo@email.com'),
(589, 259, 'country', 'Bangladesh'),
(590, 259, 'state', 'Dhaka'),
(591, 259, 'city', 'kuril'),
(592, 259, 'zip', '4567'),
(593, 259, '_customer_user', '2'),
(594, 259, '_billing_postcode', '4567'),
(595, 259, '_billing_company', NULL),
(596, 259, '_billing_last_name', NULL),
(597, 259, '_billing_first_name', NULL),
(598, 259, 'payment_method', 'CashOnDelivery'),
(599, 260, 'first_name', 'Demo'),
(600, 260, 'last_name', 'Demo'),
(601, 260, 'address_one', 'Uttara'),
(602, 260, 'address_two', NULL),
(603, 260, 'phone', '6789'),
(604, 260, 'email', 'demo@email.com'),
(605, 260, 'country', 'Bangladesh'),
(606, 260, 'state', 'Dhaka'),
(607, 260, 'city', 'kuril'),
(608, 260, 'zip', '4567'),
(609, 260, '_customer_user', '2'),
(610, 260, '_billing_postcode', '4567'),
(611, 260, '_billing_company', NULL),
(612, 260, '_billing_last_name', NULL),
(613, 260, '_billing_first_name', NULL),
(614, 260, 'payment_method', 'CashOnDelivery'),
(615, 261, 'first_name', 'Demo'),
(616, 261, 'last_name', 'Demo'),
(617, 261, 'address_one', 'Uttara'),
(618, 261, 'address_two', NULL),
(619, 261, 'phone', '6789'),
(620, 261, 'email', 'demo@email.com'),
(621, 261, 'country', 'Bangladesh'),
(622, 261, 'state', 'Sylhet'),
(623, 261, 'city', 'Habiganj1'),
(624, 261, 'zip', '3330-337456'),
(625, 261, '_customer_user', '2'),
(626, 261, '_billing_postcode', '3330-337456'),
(627, 261, '_billing_company', NULL),
(628, 261, '_billing_last_name', NULL),
(629, 261, '_billing_first_name', NULL),
(630, 261, 'payment_method', 'CashOnDelivery'),
(642, 262, 'start_stock', '2000'),
(643, 262, '_sku', '100'),
(644, 262, 'attached_file', '1604466775.jpg'),
(658, 263, 'attached_file', '1604551889.jpg'),
(659, 264, 'first_name', 'Demo'),
(660, 264, 'last_name', 'Demo'),
(661, 264, 'address_one', 'Uttara'),
(662, 264, 'address_two', NULL),
(663, 264, 'phone', '6789'),
(664, 264, 'email', 'demo@email.com'),
(665, 264, 'country', 'Bangladesh'),
(666, 264, 'state', 'Dhaka'),
(667, 264, 'city', 'kuril'),
(668, 264, 'zip', '4567'),
(669, 264, '_customer_user', '2'),
(670, 264, '_billing_postcode', '4567'),
(671, 264, '_billing_company', NULL),
(672, 264, '_billing_last_name', NULL),
(673, 264, '_billing_first_name', NULL),
(674, 264, 'payment_method', 'CashOnDelivery'),
(675, 264, 'processing_date', '2020-11-14');

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
(1, 0, '2020-09-26 16:47:07', '2020-09-26 22:47:07', '', 'Samsung', '', 'inherit', 'open', 'open', '', 'Samsung', '', '', '2020-09-26 00:00:00', '2020-09-26 22:47:07', '', 0, '', 0, 'attachment', '', 0),
(2, 0, '2020-09-26 17:06:19', '2020-09-26 23:06:19', '', 'Dell', '', 'inherit', 'open', 'open', '', 'Dell', '', '', '2020-09-26 00:00:00', '2020-09-26 23:06:19', '', 0, '', 0, 'attachment', '', 0),
(3, 0, '2020-09-26 17:16:26', '2020-09-26 23:16:26', '', 'Apple', '', 'inherit', 'open', 'open', '', 'Apple', '', '', '2020-09-26 00:00:00', '2020-09-26 23:16:26', '', 0, '', 0, 'attachment', '', 0),
(4, 0, '2020-09-26 17:17:17', '2020-09-26 23:17:17', '', 'Sony', '', 'inherit', 'open', 'open', '', 'Sony', '', '', '2020-09-26 00:00:00', '2020-09-26 23:17:17', '', 0, '', 0, 'attachment', '', 0),
(5, 0, '2020-09-26 17:17:57', '2020-09-26 23:17:57', '', 'Lenovo', '', 'inherit', 'open', 'open', '', 'Lenovo', '', '', '2020-09-26 00:00:00', '2020-09-26 23:17:57', '', 0, '', 0, 'attachment', '', 0),
(6, 0, '2020-09-26 17:20:29', '2020-09-26 23:20:29', '', 'HTC', '', 'inherit', 'open', 'open', '', 'HTC', '', '', '2020-09-26 00:00:00', '2020-09-26 23:20:29', '', 0, '', 0, 'attachment', '', 0),
(7, 0, '2020-09-26 17:21:15', '2020-09-26 23:21:15', '', 'Xiaomi', '', 'inherit', 'open', 'open', '', 'Xiaomi', '', '', '2020-09-26 00:00:00', '2020-09-26 23:21:15', '', 0, '', 0, 'attachment', '', 0),
(8, 0, '2020-09-26 17:23:42', '2020-09-26 23:23:42', '', 'OnePlus', '', 'inherit', 'open', 'open', '', 'OnePlus', '', '', '2020-09-26 00:00:00', '2020-09-26 23:23:42', '', 0, '', 0, 'attachment', '', 0),
(35, 1, '2020-09-26 17:50:00', '2020-09-26 23:50:00', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Burger', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'deleted', 'open', 'open', '', 'Burger', '', '', '2020-09-29 00:00:00', '2020-09-29 13:47:28', '', 0, '', 0, 'deleted', '', 0),
(39, 1, '2020-09-29 15:51:00', '2020-09-29 21:51:00', '<p>dsfdsfsdf</p>', 'Saiful', '<p>sdafdsfdsf</p>', 'deleted', 'open', 'open', '', 'Saiful', '', '', '2020-09-29 00:00:00', '2020-09-29 15:51:53', '', 0, '', 0, 'deleted', '', 0),
(227, 2, '2020-11-05 13:41:00', '2020-11-05 19:41:00', 'Banner Image', 'Banner Image', 'Banner Image', 'publish', 'open', 'open', '', 'Banner Image', '', '', '2020-11-05 13:41:58', '2020-11-05 13:41:58', '', 0, '', 0, 'banner', '', 0),
(264, 2, '2020-11-14 00:00:00', '2020-11-14 22:04:50', '', 'Order2020-11-14 16:04:50', '', 'dispatch', 'open', 'open', 'order_1247', 'order-Nov-14-2020-1611', '', '', '2020-11-14 16:05:59', '2020-11-14 16:04:50', '', 0, '', 0, 'shop_order', '', 0),
(262, 2, '2020-11-04 11:11:00', '2020-11-04 17:11:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,&nbsp;</p>', 'Demo', '<p>Information</p>', 'publish', 'open', 'open', '', 'Demo', '', '', '2020-11-14 16:01:01', '2020-11-14 16:01:01', '', 0, '', 0, 'product', '', 0),
(263, 2, '2020-11-05 10:50:00', '2020-11-05 16:50:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,&nbsp;</p>', 'Test', '<p>sdfdsfdsf</p>', 'publish', 'open', 'open', '', 'Test', '', '', '2020-11-14 16:01:13', '2020-11-14 16:01:13', '', 0, '', 0, 'product', '', 0);

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
(1, 'Admin', 'admin', '2020-10-28 10:48:52', '2020-11-11 10:33:57'),
(3, 'Editor', 'editor', '2020-10-29 04:21:40', '2020-11-11 11:27:51');

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
(3, 8),
(3, 9);

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
(1, 'Bras', 'bras', 0, 1, '2020-09-26 16:40:42'),
(2, 'Bras & Sleepwear', 'bras-sleepwear', 0, 1, '2020-09-26 16:40:49'),
(3, 'Legging & pyjamas', 'legging-pyjamas', 0, 1, '2020-09-26 16:40:54'),
(4, 'Jeans', 'jeans', 0, 1, '2020-09-26 16:41:06'),
(5, 'Skirts', 'skirts', 0, 1, '2020-09-26 16:41:12'),
(6, 'Bottoms', 'bottoms', 0, 1, '2020-09-26 16:43:21'),
(7, 'Tank Tops', 'tank-tops', 0, 1, '2020-09-26 16:43:25'),
(8, 'T-Shirts', 't-shirts', 0, 1, '2020-09-26 16:43:37'),
(9, 'Tunic & shirts', 'tunic-shirts', 0, 1, '2020-09-26 16:43:45'),
(10, 'Dresses', 'dresses', 0, 1, '2020-09-26 16:43:55'),
(11, 'Tops', 'tops', 0, 1, '2020-09-26 16:44:31'),
(15, 'Women', 'women', 0, 1, '2020-09-26 16:45:43'),
(16, 'Men', 'men', 0, 1, '2020-09-26 16:46:16'),
(17, 'Samsung', 'samsung', 0, 1, '2020-09-26 16:47:07'),
(18, 'Dell', 'dell', 0, 1, '2020-09-26 17:06:19'),
(19, 'Apple', 'apple', 0, 1, '2020-09-26 17:16:26'),
(20, 'Sony', 'sony', 0, 1, '2020-09-26 17:17:17'),
(21, 'Lenovo', 'lenovo', 0, 1, '2020-09-26 17:17:57'),
(22, 'HTC', 'htc', 0, 1, '2020-09-26 17:20:29'),
(23, 'Xiaomi', 'xiaomi', 0, 1, '2020-09-26 17:21:15'),
(24, 'OnePlus', 'oneplus', 0, 1, '2020-09-26 17:23:42'),
(25, 'Blue', 'blue', 0, 1, '2020-09-27 13:23:09'),
(26, 'Xl', 'xl', 0, 1, '2020-09-27 13:23:22'),
(27, '5', '5', 0, 1, '2020-09-27 13:23:31'),
(28, 'Red', 'red', 0, 1, '2020-09-27 13:24:41'),
(29, 'Yellow', 'yellow', 0, 1, '2020-09-27 13:24:55'),
(30, 'M', 'm', 0, 1, '2020-09-27 13:25:08'),
(31, 'S', 's', 0, 1, '2020-09-27 13:25:11'),
(32, 'L', 'l', 0, 1, '2020-09-27 13:25:15'),
(33, 'Kg', 'kg', 0, 1, '2020-09-27 13:25:27'),
(34, '5', '5', 0, 1, '2020-09-27 13:25:37'),
(35, '1', '1', 0, 1, '2020-09-27 13:25:40'),
(36, '2', '2', 0, 1, '2020-09-27 13:25:42'),
(37, '3', '3', 0, 1, '2020-09-27 13:25:45'),
(38, '4', '4', 0, 1, '2020-09-27 13:25:47'),
(68, '45456', '', 0, 1, '2020-10-18 14:16:29'),
(40, 'Panties', 'panties', 0, 1, '2020-10-05 11:55:34'),
(41, 'Bra & Panties Sets', 'bra-panties-sets', 0, 1, '2020-10-05 11:55:41'),
(42, 'Sleepwear', 'sleepwear', 0, 1, '2020-10-05 11:55:48'),
(43, 'Bags', 'bags', 0, 1, '2020-10-05 11:55:59'),
(44, 'Tote Bags', 'tote-bags', 0, 1, '2020-10-05 11:56:06'),
(45, 'Crossbody Bags', 'crossbody-bags', 0, 1, '2020-10-05 11:56:13'),
(46, 'Purses', 'purses', 0, 1, '2020-10-05 11:56:22'),
(47, 'Jewellery', 'jewellery', 0, 1, '2020-10-05 11:56:33'),
(48, 'Earrings', 'earrings', 0, 1, '2020-10-05 11:56:40'),
(49, 'Necklaces', 'necklaces', 0, 1, '2020-10-05 11:56:47'),
(50, 'Bracelets', 'bracelets', 0, 1, '2020-10-05 11:56:55'),
(51, 'Accessories', 'accessories', 0, 1, '2020-10-05 11:57:05'),
(52, 'Sunglasses', 'sunglasses', 0, 1, '2020-10-05 11:57:13'),
(53, 'Scarves', 'scarves', 0, 1, '2020-10-05 11:57:20'),
(54, 'Belts', 'belts', 0, 1, '2020-10-05 11:57:30'),
(55, 'Dhaka', 'dhaka', 0, 1, '2020-10-06 15:27:38'),
(56, 'Sylhet', 'sylhet', 0, 1, '2020-10-06 15:27:38'),
(71, 'test', 'test', 0, 1, '2020-10-18 15:02:59'),
(59, '1230', '1230', 0, 1, '2020-10-06 16:45:36'),
(60, '1212', '1212', 0, 1, '2020-10-06 16:45:36'),
(72, '5678', '', 0, 1, '2020-10-18 15:04:36'),
(63, 'Bagerhat', 'bagerhat', 0, 1, '2020-10-18 13:40:04'),
(73, 'test 2', 'test 2', 0, 1, '2020-10-18 15:14:56'),
(65, '4567', '', 0, 1, '2020-10-18 14:09:12'),
(69, '34555', '', 0, 1, '2020-10-18 14:18:59'),
(70, '5', '', 0, 1, '2020-10-18 14:33:41'),
(74, '234324', '', 0, 1, '2020-10-18 15:16:05'),
(75, 'Uttara', 'uttara', 0, 1, '2020-10-18 15:17:11'),
(76, '1234', '', 0, 1, '2020-10-18 15:17:17'),
(77, 'khilkhet', 'khilkhet', 0, 1, '2020-10-18 16:19:36'),
(78, 'Uttara5345', 'uttara', 0, 1, '2020-10-18 16:33:27'),
(79, '123457', '', 0, 1, '2020-10-18 16:33:27'),
(80, 'kk', 'kk', 0, 1, '2020-10-18 16:36:56'),
(81, '12', '', 0, 1, '2020-10-18 16:36:56'),
(82, '456', '', 0, 1, '2020-10-18 16:44:16'),
(83, 'kadamtali', 'kadamtali', 0, 1, '2020-10-18 16:44:43'),
(84, '34', '', 0, 1, '2020-10-18 16:52:18'),
(85, '34534543', '', 0, 1, '2020-10-18 16:52:36'),
(86, 'test4353', 'test4353', 0, 1, '2020-10-19 10:39:59'),
(87, 'r', 'r', 0, 1, '2020-10-19 10:42:46'),
(88, '123', '', 0, 1, '2020-10-19 10:42:46'),
(89, 'kuril', 'kuril', 0, 1, '2020-10-19 10:48:44'),
(90, '0000', '', 0, 1, '2020-10-19 10:48:44'),
(91, 'b', 'b', 0, 1, '2020-10-19 10:54:06'),
(92, '123', '', 0, 1, '2020-10-19 10:54:06'),
(93, 'rteee', 'rteee', 0, 1, '2020-10-19 10:57:33'),
(94, 'badda', 'badda', 0, 1, '2020-10-19 11:05:06'),
(95, 'kuril', 'kuril', 0, 1, '2020-10-19 11:09:47'),
(96, 'Kadamtali', 'kadamtali', 0, 1, '2020-10-19 11:11:34'),
(97, 'Habiganj1', 'habiganj1', 0, 1, '2020-10-19 11:13:49'),
(98, 'bagerhat police line', 'bagerhat police line', 0, 1, '2020-10-19 11:15:04'),
(99, 'gazipur', 'gazipur', 0, 1, '2020-11-02 16:04:17');

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
(9, 8, 0),
(9, 9, 0),
(9, 16, 0),
(10, 6, 0),
(10, 7, 0),
(10, 10, 0),
(10, 14, 0),
(35, 6, 0),
(35, 7, 0),
(35, 10, 0),
(35, 11, 0),
(35, 12, 0),
(12, 1, 0),
(12, 2, 0),
(12, 3, 0),
(12, 4, 0),
(12, 5, 0),
(12, 6, 0),
(12, 7, 0),
(12, 10, 0),
(12, 11, 0),
(13, 1, 0),
(13, 2, 0),
(13, 3, 0),
(13, 4, 0),
(13, 5, 0),
(13, 6, 0),
(13, 7, 0),
(13, 10, 0),
(13, 11, 0),
(13, 12, 0),
(14, 6, 0),
(14, 7, 0),
(14, 10, 0),
(14, 11, 0),
(14, 12, 0),
(17, 1, 0),
(17, 3, 0),
(17, 4, 0),
(17, 13, 0),
(33, 12, 0),
(33, 1, 0),
(65, 1, 0),
(65, 12, 0),
(39, 1, 0),
(39, 12, 0),
(42, 1, 0),
(42, 12, 0),
(67, 1, 0),
(67, 12, 0),
(70, 15, 0),
(70, 51, 0),
(71, 51, 0),
(71, 15, 0),
(72, 51, 0),
(72, 15, 0),
(73, 51, 0),
(73, 15, 0),
(74, 43, 0),
(74, 15, 0),
(75, 43, 0),
(75, 15, 0),
(76, 43, 0),
(76, 15, 0),
(77, 43, 0),
(77, 15, 0),
(78, 43, 0),
(78, 15, 0),
(79, 43, 0),
(79, 15, 0),
(80, 43, 0),
(80, 15, 0),
(81, 43, 0),
(81, 15, 0),
(82, 6, 0),
(82, 15, 0),
(83, 6, 0),
(83, 15, 0),
(84, 6, 0),
(84, 15, 0),
(85, 6, 0),
(85, 15, 0),
(86, 6, 0),
(86, 15, 0),
(87, 6, 0),
(87, 15, 0),
(88, 6, 0),
(88, 15, 0),
(89, 6, 0),
(89, 15, 0),
(90, 2, 0),
(90, 15, 0),
(91, 2, 0),
(91, 15, 0),
(92, 2, 0),
(92, 15, 0),
(93, 2, 0),
(93, 15, 0),
(94, 47, 0),
(94, 15, 0),
(95, 47, 0),
(95, 15, 0),
(96, 47, 0),
(96, 15, 0),
(97, 47, 0),
(97, 15, 0),
(98, 47, 0),
(98, 15, 0),
(99, 11, 0),
(99, 15, 0),
(100, 11, 0),
(100, 15, 0),
(101, 11, 0),
(101, 15, 0),
(102, 11, 0),
(102, 15, 0),
(103, 11, 0),
(103, 15, 0),
(104, 11, 0),
(104, 15, 0),
(105, 11, 0),
(105, 15, 0),
(106, 8, 0),
(106, 15, 0),
(107, 8, 0),
(107, 15, 0),
(108, 8, 0),
(108, 15, 0),
(110, 8, 0),
(110, 15, 0),
(111, 8, 0),
(111, 15, 0),
(112, 8, 0),
(112, 15, 0),
(113, 9, 0),
(113, 15, 0),
(114, 9, 0),
(114, 15, 0),
(115, 8, 0),
(115, 9, 0),
(115, 15, 0),
(116, 9, 0),
(116, 15, 0),
(117, 9, 0),
(117, 15, 0),
(118, 9, 0),
(118, 15, 0),
(119, 9, 0),
(119, 15, 0),
(120, 9, 0),
(120, 15, 0),
(121, 9, 0),
(121, 15, 0),
(122, 9, 0),
(122, 15, 0),
(123, 9, 0),
(123, 15, 0),
(203, 54, 0),
(203, 15, 0),
(128, 6, 0),
(128, 16, 0),
(215, 15, 0),
(215, 3, 0),
(216, 4, 0),
(216, 15, 0),
(218, 15, 0),
(218, 8, 0),
(220, 15, 0),
(220, 7, 0),
(221, 8, 0),
(221, 15, 0),
(262, 15, 0),
(262, 8, 0),
(263, 8, 0),
(263, 15, 0);

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
(1, 1, 'product_cat', '', 0, 0, '2020-09-26 16:40:42'),
(2, 2, 'product_cat', '', 0, 0, '2020-09-26 16:40:49'),
(3, 3, 'product_cat', '', 0, 0, '2020-09-26 16:40:54'),
(4, 4, 'product_cat', '', 0, 0, '2020-09-26 16:41:06'),
(5, 5, 'product_cat', '', 0, 0, '2020-09-26 16:41:12'),
(6, 6, 'product_cat', '', 0, 0, '2020-09-26 16:43:21'),
(7, 7, 'product_cat', '', 0, 0, '2020-09-26 16:43:25'),
(8, 8, 'product_cat', '', 0, 0, '2020-09-26 16:43:37'),
(9, 9, 'product_cat', '', 0, 0, '2020-09-26 16:43:45'),
(10, 10, 'product_cat', '', 0, 0, '2020-09-26 16:43:55'),
(11, 11, 'product_cat', '', 0, 0, '2020-09-26 16:44:31'),
(12, 12, 'product_tag', '', 0, 0, '2020-09-26 16:45:28'),
(13, 13, 'product_tag', '', 0, 0, '2020-09-26 16:45:34'),
(14, 14, 'product_tag', '', 0, 0, '2020-09-26 16:45:38'),
(15, 15, 'product_tag', '', 0, 0, '2020-09-26 16:45:43'),
(16, 16, 'product_tag', '', 0, 0, '2020-09-26 16:46:16'),
(17, 17, 'product_brand', '', 0, 0, '2020-09-26 16:47:07'),
(18, 18, 'product_brand', '', 0, 0, '2020-09-26 17:06:19'),
(19, 19, 'product_brand', '', 0, 0, '2020-09-26 17:16:26'),
(20, 20, 'product_brand', '', 0, 0, '2020-09-26 17:17:17'),
(21, 21, 'product_brand', '', 0, 0, '2020-09-26 17:17:57'),
(22, 22, 'product_brand', '', 0, 0, '2020-09-26 17:20:29'),
(23, 23, 'product_brand', '', 0, 0, '2020-09-26 17:21:15'),
(24, 24, 'product_brand', '', 0, 0, '2020-09-26 17:23:42'),
(25, 25, 'pa_color', '', 0, 0, '2020-09-27 13:23:09'),
(26, 26, 'pa_size', '', 0, 0, '2020-09-27 13:23:22'),
(27, 27, 'pa_inch', '', 0, 0, '2020-09-27 13:23:31'),
(28, 28, 'pa_color', '', 0, 0, '2020-09-27 13:24:41'),
(29, 29, 'pa_color', '', 0, 0, '2020-09-27 13:24:55'),
(30, 30, 'pa_size', '', 0, 0, '2020-09-27 13:25:08'),
(31, 31, 'pa_size', '', 0, 0, '2020-09-27 13:25:11'),
(32, 32, 'pa_size', '', 0, 0, '2020-09-27 13:25:15'),
(33, 33, 'pa_weight', '', 0, 0, '2020-09-27 13:25:27'),
(34, 34, 'pa_inch', '', 0, 0, '2020-09-27 13:25:37'),
(35, 35, 'pa_inch', '', 0, 0, '2020-09-27 13:25:40'),
(36, 36, 'pa_inch', '', 0, 0, '2020-09-27 13:25:42'),
(37, 37, 'pa_inch', '', 0, 0, '2020-09-27 13:25:45'),
(38, 38, 'pa_inch', '', 0, 0, '2020-09-27 13:25:47'),
(40, 40, 'product_cat', '', 0, 0, '2020-10-05 11:55:34'),
(41, 41, 'product_cat', '', 0, 0, '2020-10-05 11:55:41'),
(42, 42, 'product_cat', '', 0, 0, '2020-10-05 11:55:48'),
(43, 43, 'product_cat', '', 0, 0, '2020-10-05 11:55:59'),
(44, 44, 'product_cat', '', 0, 0, '2020-10-05 11:56:06'),
(45, 45, 'product_cat', '', 0, 0, '2020-10-05 11:56:13'),
(46, 46, 'product_cat', '', 0, 0, '2020-10-05 11:56:22'),
(47, 47, 'product_cat', '', 0, 0, '2020-10-05 11:56:33'),
(48, 48, 'product_cat', '', 0, 0, '2020-10-05 11:56:40'),
(49, 49, 'product_cat', '', 0, 0, '2020-10-05 11:56:47'),
(50, 50, 'product_cat', '', 0, 0, '2020-10-05 11:56:55'),
(51, 51, 'product_cat', '', 0, 0, '2020-10-05 11:57:05'),
(52, 52, 'product_cat', '', 0, 0, '2020-10-05 11:57:13'),
(53, 53, 'product_cat', '', 0, 0, '2020-10-05 11:57:20'),
(54, 54, 'product_cat', '', 0, 0, '2020-10-05 11:57:30'),
(55, 55, 'district', '600', 0, 0, '2020-10-06 15:29:47'),
(56, 56, 'district', '120', 0, 0, '2020-10-06 15:29:47'),
(103, 99, 'district', '120', 0, 0, '2020-11-02 16:04:17'),
(61, 63, 'district', '200', 0, 0, '2020-10-18 13:40:04'),
(102, 98, 'postcode', '9300', 98, 0, '2020-10-19 11:15:04'),
(101, 98, 'city', NULL, 63, 0, '2020-10-19 11:15:04'),
(99, 97, 'city', NULL, 56, 0, '2020-10-19 11:13:49'),
(100, 97, 'postcode', '3330-337456', 97, 0, '2020-10-19 11:13:49'),
(98, 96, 'postcode', '45671', 96, 0, '2020-10-19 11:11:34'),
(97, 96, 'city', NULL, 56, 0, '2020-10-19 11:11:34'),
(96, 95, 'postcode', '4567', 95, 0, '2020-10-19 11:09:47'),
(95, 95, 'city', NULL, 55, 0, '2020-10-19 11:09:47'),
(93, 94, 'city', NULL, 55, 0, '2020-10-19 11:05:06'),
(94, 94, 'postcode', '123', 94, 0, '2020-10-19 11:05:06');

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
(443, 2, 'user_image', '1601189730.png'),
(503, 2, 'zip', '4567'),
(502, 2, 'city', '95'),
(440, 2, 'state', NULL),
(439, 2, 'country', NULL),
(438, 2, 'phone', '6789'),
(437, 2, 'address_two', NULL),
(41, 3, 'phone', '4354354'),
(40, 3, 'address_two', 'retretret'),
(39, 3, 'address_one', 'retretre'),
(38, 3, 'last_name', 'user 2'),
(37, 3, 'first_name', 'user 2'),
(42, 3, 'country', 'BD'),
(43, 3, 'state', 'Bangladesh'),
(44, 3, 'city', 'Dhaka'),
(45, 3, 'zip', '342543543'),
(500, 2, 'address_one', 'Uttara'),
(434, 2, 'first_name', 'Demo'),
(279, 5, 'zip', '1230'),
(278, 5, 'city', '57'),
(457, 0, 'district', '55'),
(456, 0, 'address_one', 'Uttara,Dhaka'),
(267, 5, 'last_name', 'Rahman'),
(276, 5, 'address_one', 'Uttara,Dhaka'),
(269, 5, 'address_two', NULL),
(270, 5, 'phone', '3453453457'),
(266, 5, 'first_name', 'Saiful'),
(459, 0, 'zip', '4567'),
(435, 2, 'last_name', 'Demo'),
(458, 0, 'city', '95'),
(480, 23, 'address_one', 'Uttara,Dhaka'),
(481, 23, 'district', '55'),
(482, 23, 'city', '95'),
(483, 23, 'zip', '4567'),
(501, 2, 'district', '55');

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
(22, 'Demo dfgdfg', 'bigshotstyle20@gmail.com', NULL, '$2y$10$zx7B2dYyVhEzBcjDhlXmI.kjkWMl2bHQl./tZyVE6qy2HsYzO0x9a', NULL, NULL, NULL, 1, '2020-11-07 04:40:08', '2020-11-07 04:40:08'),
(23, 'Partho', 'parthokar90@gmail.com', NULL, '$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2', NULL, NULL, NULL, 1, '2020-11-07 04:46:58', '2020-11-07 04:46:58');

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
(4, 1),
(4, 2),
(4, 8),
(4, 9);

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
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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
(5, 2, 263, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `commentmeta`
--
ALTER TABLE `commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloadable_product_permissions`
--
ALTER TABLE `downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`);

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
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

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
  MODIFY `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `commentmeta`
--
ALTER TABLE `commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `downloadable_product_permissions`
--
ALTER TABLE `downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_termmeta`
--
ALTER TABLE `ecommerce_termmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=676;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `termmeta`
--
ALTER TABLE `termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
