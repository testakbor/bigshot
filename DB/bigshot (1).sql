-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2020 at 12:19 PM
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
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Akbor Hossain', 'admin@email.com', '$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa', '', '1', NULL, NULL);

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
(5, '2020_09_14_100203_create_wishlist', 2);

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
(1, 2, '_tax_class', '', '29', '2020-09-28', '2'),
(2, 2, '_qty', '1', '29', '2020-09-28', '2'),
(3, 2, '_product_id', '9', '29', '2020-09-28', '2'),
(4, 2, '_variation_id', '', '29', '2020-09-28', '2'),
(5, 2, '_line_subtotal', '10000', '29', '2020-09-28', '2'),
(6, 2, '_line_total', '10000', '29', '2020-09-28', '2'),
(7, 2, '_line_subtotal_tax', '', '29', '2020-09-28', '2'),
(8, 2, '_line_tax', '', '29', '2020-09-28', '2'),
(9, 2, '_line_tax_data', '2020-09-28 21:02:51', '29', '2020-09-28', '2'),
(10, 4, '_tax_class', '', '30', '2020-09-28', '2'),
(11, 4, '_qty', '2', '30', '2020-09-28', '2'),
(12, 4, '_product_id', '14', '30', '2020-09-28', '2'),
(13, 4, '_variation_id', '', '30', '2020-09-28', '2'),
(14, 4, '_line_subtotal', '8000', '30', '2020-09-28', '2'),
(15, 4, '_line_total', '8000', '30', '2020-09-28', '2'),
(16, 4, '_line_subtotal_tax', '', '30', '2020-09-28', '2'),
(17, 4, '_line_tax', '', '30', '2020-09-28', '2'),
(18, 4, '_line_tax_data', '2020-09-28 21:20:21', '30', '2020-09-28', '2'),
(19, 6, '_tax_class', '', '31', '2020-09-28', '2'),
(20, 6, '_qty', '2', '31', '2020-09-28', '2'),
(21, 6, '_product_id', '11', '31', '2020-09-28', '2'),
(22, 6, '_variation_id', '', '31', '2020-09-28', '2'),
(23, 6, '_line_subtotal', '7000', '31', '2020-09-28', '2'),
(24, 6, '_line_total', '7000', '31', '2020-09-28', '2'),
(25, 6, '_line_subtotal_tax', '', '31', '2020-09-28', '2'),
(26, 6, '_line_tax', '', '31', '2020-09-28', '2'),
(27, 6, '_line_tax_data', '2020-09-28 21:40:07', '31', '2020-09-28', '2');

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
(1, 'Office Equipment', 'line-item', NULL, 29),
(2, 'Office Equipment', 'line-item', '9', 29),
(3, 'Snaks', 'line-item', NULL, 30),
(4, 'Snaks', 'line-item', '14', 30),
(5, 'Burger', 'line-item', NULL, 31),
(6, 'Burger', 'line-item', '11', 31);

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
(1, 1, 'attached_file', '1601117227.png'),
(2, 2, 'attached_file', '1601118379.png'),
(3, 3, 'attached_file', '1601118986.jpg'),
(4, 4, 'attached_file', '1601119037.png'),
(5, 5, 'attached_file', '1601119077.png'),
(6, 6, 'attached_file', '1601119229.png'),
(7, 7, 'attached_file', '1601119275.png'),
(8, 8, 'attached_file', '1601119422.png'),
(9, 9, 'stock_status', 'instock'),
(10, 9, 'regular_price', '20000'),
(11, 9, 'sale_price', '10000'),
(12, 9, 'weight', NULL),
(13, 9, 'length', NULL),
(14, 9, 'width', NULL),
(15, 9, 'height', NULL),
(16, 9, 'qty', '7'),
(17, 9, 'alert_qty', '18'),
(18, 9, 'product_stock', '5000'),
(19, 9, 'attached_file', '1601119861.jpg'),
(20, 9, 'gallery_file', 'add.png'),
(21, 9, 'gallery_file', 'apple.jpg'),
(22, 9, 'gallery_file', 'dell.png'),
(23, 9, 'gallery_file', 'htc.png'),
(24, 9, 'gallery_file', 'lenovi.png'),
(25, 9, 'gallery_file', 'office.jpg'),
(26, 10, 'stock_status', 'instock'),
(27, 10, 'regular_price', '5000'),
(28, 10, 'sale_price', '4000'),
(29, 10, 'weight', NULL),
(30, 10, 'length', NULL),
(31, 10, 'width', NULL),
(32, 10, 'height', NULL),
(33, 10, 'qty', '6'),
(34, 10, 'alert_qty', '8'),
(35, 10, 'product_stock', '2000'),
(36, 10, 'attached_file', '1601120970.jpeg'),
(37, 10, 'gallery_file', 'lenovi.png'),
(38, 10, 'gallery_file', 'pizza.jpeg'),
(39, 10, 'gallery_file', 'plus.png'),
(40, 11, 'stock_status', 'instock'),
(41, 11, 'regular_price', '4000'),
(42, 11, 'sale_price', '3500'),
(43, 11, 'weight', NULL),
(44, 11, 'length', NULL),
(45, 11, 'width', NULL),
(46, 11, 'height', NULL),
(47, 11, 'qty', '28'),
(48, 11, 'alert_qty', '29'),
(49, 11, 'product_stock', '2000'),
(50, 11, 'attached_file', '1601121125.jpg'),
(51, 11, 'gallery_file', 'htc.png'),
(52, 11, 'gallery_file', 'lenovi.png'),
(53, 11, 'gallery_file', 'office.jpg'),
(54, 13, 'stock_status', 'instock'),
(55, 13, 'regular_price', '2000'),
(56, 13, 'sale_price', '1500'),
(57, 13, 'weight', NULL),
(58, 13, 'length', NULL),
(59, 13, 'width', NULL),
(60, 13, 'height', NULL),
(61, 13, 'qty', '18'),
(62, 13, 'alert_qty', '19'),
(63, 13, 'product_stock', '1000'),
(64, 13, 'attached_file', '1601121426.jpg'),
(65, 13, 'gallery_file', 'Good_Food_Display_-_NCI_Visuals_Online.jpg'),
(66, 13, 'gallery_file', 'htc.png'),
(67, 13, 'gallery_file', 'lenovi.png'),
(68, 13, 'gallery_file', 'office.jpg'),
(69, 13, 'gallery_file', 'pizza.jpeg'),
(302, 31, '_billing_postcode', '4543'),
(301, 31, '_customer_user', '2'),
(300, 31, 'zip', '4543'),
(299, 31, 'city', 'Dhaka'),
(298, 31, 'state', 'Bangladesh'),
(297, 31, 'country', 'Bangladesh'),
(296, 31, 'phone', '4534534'),
(295, 31, 'address_two', NULL),
(294, 31, 'address_one', 'Uttara'),
(293, 31, 'last_name', 'Demo'),
(292, 31, 'first_name', 'Demo'),
(120, 18, '_billing_postcode', '4543'),
(119, 18, '_customer_user', '2'),
(118, 18, 'zip', '4543'),
(117, 18, 'city', 'Dhaka'),
(116, 18, 'state', 'Bangladesh'),
(115, 18, 'country', 'Bangladesh'),
(114, 18, 'phone', '4534534'),
(113, 18, 'address_two', 'Dhaka'),
(112, 18, 'address_one', 'Uttara'),
(111, 18, 'last_name', 'Demo'),
(110, 18, 'first_name', 'Demo'),
(99, 16, 'banner_image', '1601192209.png'),
(100, 17, 'stock_status', 'instock'),
(101, 17, 'regular_price', '5000'),
(102, 17, 'sale_price', '3000'),
(103, 17, 'weight', NULL),
(104, 17, 'length', NULL),
(105, 17, 'width', NULL),
(106, 17, 'height', NULL),
(107, 17, 'qty', '0'),
(108, 17, 'alert_qty', '0'),
(109, 17, 'product_stock', '1000'),
(121, 18, '_billing_company', NULL),
(122, 18, '_billing_last_name', NULL),
(123, 18, '_billing_first_name', NULL),
(124, 19, 'first_name', 'Demo'),
(125, 19, 'last_name', 'Demo'),
(126, 19, 'address_one', 'Uttara'),
(127, 19, 'address_two', 'Dhaka'),
(128, 19, 'phone', '4534534'),
(129, 19, 'country', 'Bangladesh'),
(130, 19, 'state', 'Bangladesh'),
(131, 19, 'city', 'Dhaka'),
(132, 19, 'zip', '4543'),
(133, 19, '_customer_user', '2'),
(134, 19, '_billing_postcode', '4543'),
(135, 19, '_billing_company', NULL),
(136, 19, '_billing_last_name', NULL),
(137, 19, '_billing_first_name', NULL),
(138, 20, 'first_name', 'Demo'),
(139, 20, 'last_name', 'Demo'),
(140, 20, 'address_one', 'Uttara'),
(141, 20, 'address_two', 'Dhaka'),
(142, 20, 'phone', '4534534'),
(143, 20, 'country', 'Bangladesh'),
(144, 20, 'state', 'Bangladesh'),
(145, 20, 'city', 'Dhaka'),
(146, 20, 'zip', '4543'),
(147, 20, '_customer_user', '2'),
(148, 20, '_billing_postcode', '4543'),
(149, 20, '_billing_company', NULL),
(150, 20, '_billing_last_name', NULL),
(151, 20, '_billing_first_name', NULL),
(152, 21, 'first_name', 'Demo'),
(153, 21, 'last_name', 'Demo'),
(154, 21, 'address_one', 'Uttara'),
(155, 21, 'address_two', 'Dhaka'),
(156, 21, 'phone', '4534534'),
(157, 21, 'country', 'Bangladesh'),
(158, 21, 'state', 'Bangladesh'),
(159, 21, 'city', 'Dhaka'),
(160, 21, 'zip', '4543'),
(161, 21, '_customer_user', '2'),
(162, 21, '_billing_postcode', '4543'),
(163, 21, '_billing_company', NULL),
(164, 21, '_billing_last_name', NULL),
(165, 21, '_billing_first_name', NULL),
(166, 22, 'first_name', 'Demo'),
(167, 22, 'last_name', 'Demo'),
(168, 22, 'address_one', 'Uttara'),
(169, 22, 'address_two', 'Dhaka'),
(170, 22, 'phone', '4534534'),
(171, 22, 'country', 'Bangladesh'),
(172, 22, 'state', 'Bangladesh'),
(173, 22, 'city', 'Dhaka'),
(174, 22, 'zip', '4543'),
(175, 22, '_customer_user', '2'),
(176, 22, '_billing_postcode', '4543'),
(177, 22, '_billing_company', NULL),
(178, 22, '_billing_last_name', NULL),
(179, 22, '_billing_first_name', NULL),
(180, 23, 'first_name', 'Demo'),
(181, 23, 'last_name', 'Demo'),
(182, 23, 'address_one', 'Uttara'),
(183, 23, 'address_two', 'Dhaka'),
(184, 23, 'phone', '4534534'),
(185, 23, 'country', 'Bangladesh'),
(186, 23, 'state', 'Bangladesh'),
(187, 23, 'city', 'Dhaka'),
(188, 23, 'zip', '4543'),
(189, 23, '_customer_user', '2'),
(190, 23, '_billing_postcode', '4543'),
(191, 23, '_billing_company', NULL),
(192, 23, '_billing_last_name', NULL),
(193, 23, '_billing_first_name', NULL),
(194, 24, 'first_name', 'Demo'),
(195, 24, 'last_name', 'Demo'),
(196, 24, 'address_one', 'Uttara'),
(197, 24, 'address_two', 'Dhaka'),
(198, 24, 'phone', '4534534'),
(199, 24, 'country', 'Bangladesh'),
(200, 24, 'state', 'Bangladesh'),
(201, 24, 'city', 'Dhaka'),
(202, 24, 'zip', '4543'),
(203, 24, '_customer_user', '2'),
(204, 24, '_billing_postcode', '4543'),
(205, 24, '_billing_company', NULL),
(206, 24, '_billing_last_name', NULL),
(207, 24, '_billing_first_name', NULL),
(208, 25, 'first_name', 'Demo'),
(209, 25, 'last_name', 'Demo'),
(210, 25, 'address_one', 'Uttara'),
(211, 25, 'address_two', 'Dhaka'),
(212, 25, 'phone', '4534534'),
(213, 25, 'country', 'Bangladesh'),
(214, 25, 'state', 'Bangladesh'),
(215, 25, 'city', 'Dhaka'),
(216, 25, 'zip', '4543'),
(217, 25, '_customer_user', '2'),
(218, 25, '_billing_postcode', '4543'),
(219, 25, '_billing_company', NULL),
(220, 25, '_billing_last_name', NULL),
(221, 25, '_billing_first_name', NULL),
(222, 26, 'first_name', 'Demo'),
(223, 26, 'last_name', 'Demo'),
(224, 26, 'address_one', 'Uttara'),
(225, 26, 'address_two', 'Dhaka'),
(226, 26, 'phone', '4534534'),
(227, 26, 'country', 'Bangladesh'),
(228, 26, 'state', 'Bangladesh'),
(229, 26, 'city', 'Dhaka'),
(230, 26, 'zip', '4543'),
(231, 26, '_customer_user', '2'),
(232, 26, '_billing_postcode', '4543'),
(233, 26, '_billing_company', NULL),
(234, 26, '_billing_last_name', NULL),
(235, 26, '_billing_first_name', NULL),
(236, 27, 'first_name', 'Demo'),
(237, 27, 'last_name', 'Demo'),
(238, 27, 'address_one', 'Uttara'),
(239, 27, 'address_two', NULL),
(240, 27, 'phone', '4534534'),
(241, 27, 'country', 'Bangladesh'),
(242, 27, 'state', 'Bangladesh'),
(243, 27, 'city', 'Dhaka'),
(244, 27, 'zip', '4543'),
(245, 27, '_customer_user', '2'),
(246, 27, '_billing_postcode', '4543'),
(247, 27, '_billing_company', NULL),
(248, 27, '_billing_last_name', NULL),
(249, 27, '_billing_first_name', NULL),
(250, 28, 'first_name', 'Demo'),
(251, 28, 'last_name', 'Demo'),
(252, 28, 'address_one', 'Uttara'),
(253, 28, 'address_two', NULL),
(254, 28, 'phone', '4534534'),
(255, 28, 'country', 'Bangladesh'),
(256, 28, 'state', 'Bangladesh'),
(257, 28, 'city', 'Dhaka'),
(258, 28, 'zip', '4543'),
(259, 28, '_customer_user', '2'),
(260, 28, '_billing_postcode', '4543'),
(261, 28, '_billing_company', NULL),
(262, 28, '_billing_last_name', NULL),
(263, 28, '_billing_first_name', NULL),
(264, 29, 'first_name', 'Demo'),
(265, 29, 'last_name', 'Demo'),
(266, 29, 'address_one', 'Uttara'),
(267, 29, 'address_two', NULL),
(268, 29, 'phone', '4534534'),
(269, 29, 'country', 'Bangladesh'),
(270, 29, 'state', 'Bangladesh'),
(271, 29, 'city', 'Dhaka'),
(272, 29, 'zip', '4543'),
(273, 29, '_customer_user', '2'),
(274, 29, '_billing_postcode', '4543'),
(275, 29, '_billing_company', NULL),
(276, 29, '_billing_last_name', NULL),
(277, 29, '_billing_first_name', NULL),
(278, 30, 'first_name', 'Demo'),
(279, 30, 'last_name', 'Demo'),
(280, 30, 'address_one', 'Uttara'),
(281, 30, 'address_two', NULL),
(282, 30, 'phone', '4534534'),
(283, 30, 'country', 'Bangladesh'),
(284, 30, 'state', 'Bangladesh'),
(285, 30, 'city', 'Dhaka'),
(286, 30, 'zip', '4543'),
(287, 30, '_customer_user', '2'),
(288, 30, '_billing_postcode', '4543'),
(289, 30, '_billing_company', NULL),
(290, 30, '_billing_last_name', NULL),
(291, 30, '_billing_first_name', NULL),
(303, 31, '_billing_company', NULL),
(304, 31, '_billing_last_name', NULL),
(305, 31, '_billing_first_name', NULL),
(306, 32, 'stock_status', 'instock'),
(307, 32, 'regular_price', '5000'),
(308, 32, 'sale_price', '3000'),
(309, 32, 'weight', NULL),
(310, 32, 'length', NULL),
(311, 32, 'width', NULL),
(312, 32, 'height', NULL),
(313, 32, 'qty', '0'),
(314, 32, 'alert_qty', '0'),
(315, 32, 'product_stock', '1000'),
(316, 32, '_sku', '5'),
(317, 32, 'attached_file', '1601287522.png'),
(318, 32, 'gallery_file', 'dell.png'),
(319, 32, 'gallery_file', 'download.jpg');

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
  `post_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
(1, 0, '2020-09-26 16:47:07', '2020-09-26 22:47:07', '', 'Samsung', '', 'inherit', 'open', 'open', '', 'Samsung', '', '', '2020-09-26 16:47:07', '2020-09-26 22:47:07', '', 0, '', 0, 'attachment', '', 0),
(2, 0, '2020-09-26 17:06:19', '2020-09-26 23:06:19', '', 'Dell', '', 'inherit', 'open', 'open', '', 'Dell', '', '', '2020-09-26 17:06:19', '2020-09-26 23:06:19', '', 0, '', 0, 'attachment', '', 0),
(3, 0, '2020-09-26 17:16:26', '2020-09-26 23:16:26', '', 'Apple', '', 'inherit', 'open', 'open', '', 'Apple', '', '', '2020-09-26 17:16:26', '2020-09-26 23:16:26', '', 0, '', 0, 'attachment', '', 0),
(4, 0, '2020-09-26 17:17:17', '2020-09-26 23:17:17', '', 'Sony', '', 'inherit', 'open', 'open', '', 'Sony', '', '', '2020-09-26 17:17:17', '2020-09-26 23:17:17', '', 0, '', 0, 'attachment', '', 0),
(5, 0, '2020-09-26 17:17:57', '2020-09-26 23:17:57', '', 'Lenovo', '', 'inherit', 'open', 'open', '', 'Lenovo', '', '', '2020-09-26 17:17:57', '2020-09-26 23:17:57', '', 0, '', 0, 'attachment', '', 0),
(6, 0, '2020-09-26 17:20:29', '2020-09-26 23:20:29', '', 'HTC', '', 'inherit', 'open', 'open', '', 'HTC', '', '', '2020-09-26 17:20:29', '2020-09-26 23:20:29', '', 0, '', 0, 'attachment', '', 0),
(7, 0, '2020-09-26 17:21:15', '2020-09-26 23:21:15', '', 'Xiaomi', '', 'inherit', 'open', 'open', '', 'Xiaomi', '', '', '2020-09-26 17:21:15', '2020-09-26 23:21:15', '', 0, '', 0, 'attachment', '', 0),
(8, 0, '2020-09-26 17:23:42', '2020-09-26 23:23:42', '', 'OnePlus', '', 'inherit', 'open', 'open', '', 'OnePlus', '', '', '2020-09-26 17:23:42', '2020-09-26 23:23:42', '', 0, '', 0, 'attachment', '', 0),
(9, 1, '2020-09-26 17:27:00', '2020-09-26 23:27:00', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Office Equipment', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Office Equipment', '', '', '2020-09-26 17:31:01', '2020-09-26 17:31:01', '', 0, '', 0, 'product', '', 0),
(10, 1, '2020-09-26 17:47:00', '2020-09-26 23:47:00', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Pizza', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'publish', 'open', 'open', '', 'Pizza', '', '', '2020-09-26 17:49:30', '2020-09-26 17:49:30', '', 0, '', 0, 'product', '', 0),
(11, 1, '2020-09-26 17:50:00', '2020-09-26 23:50:00', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Burger', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'publish', 'open', 'open', '', 'Burger', '', '', '2020-09-26 17:52:05', '2020-09-26 17:52:05', '', 0, '', 0, 'product', '', 0),
(31, 2, '2020-09-28 00:00:00', '2020-09-28 21:40:07', '', 'Order2020-09-28 15:40:07', '', 'Delivered', 'open', 'open', 'order_1247', 'order-Sep-28-2020-1509', '', '', '2020-09-28 15:40:36', '2020-09-28 15:40:07', '', 0, '', 0, 'shop_order', '', 0),
(32, 1, '2020-09-28 16:04:00', '2020-09-28 22:04:00', '<p>erewrew</p>', 'trytry', '<p>sdfdsfdsf</p>', 'publish', 'open', 'open', '', 'trytry', '', '', '2020-09-28 16:05:22', '2020-09-28 16:05:22', '', 0, '', 0, 'product', '', 0),
(13, 1, '2020-09-26 17:54:00', '2020-09-26 23:54:00', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Fresh Fruit', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'publish', 'open', 'open', '', 'Fresh Fruit', '', '', '2020-09-26 17:57:06', '2020-09-26 17:57:06', '', 0, '', 0, 'product', '', 0),
(16, 1, '2020-09-27 13:36:00', '2020-09-27 19:36:00', 'Banner Image', 'Banner Image', 'Banner Image', 'publish', 'open', 'open', '', 'Banner Image', '', '', '2020-09-27 13:36:49', '2020-09-27 13:36:49', '', 0, '', 0, 'banner', '', 0),
(29, 2, '2020-09-28 00:00:00', '2020-09-28 21:02:51', '', 'Order2020-09-28 15:02:51', '', 'Completed', 'open', 'open', 'order_1247', 'order-Sep-28-2020-1509', '', '', '2020-09-28 15:03:04', '2020-09-28 15:02:51', '', 0, '', 0, 'shop_order', '', 0),
(30, 2, '2020-09-28 00:00:00', '2020-09-28 21:20:21', '', 'Order2020-09-28 15:20:21', '', 'Cancelled', 'open', 'open', 'order_1247', 'order-Sep-28-2020-1509', '', '', '2020-09-28 15:20:53', '2020-09-28 15:20:21', '', 0, '', 0, 'shop_order', '', 0);

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
(1, 'Apex', 'apex', 0, 1, '2020-09-26 16:40:42'),
(2, 'Bata', 'bata', 0, 1, '2020-09-26 16:40:49'),
(3, 'Dell', 'dell', 0, 1, '2020-09-26 16:40:54'),
(4, 'Samsung', 'samsung', 0, 1, '2020-09-26 16:41:06'),
(5, 'Apple', 'apple', 0, 1, '2020-09-26 16:41:12'),
(6, 'Cooking', 'cooking', 0, 1, '2020-09-26 16:43:21'),
(7, 'Bread', 'bread', 0, 1, '2020-09-26 16:43:25'),
(8, 'Home & Cleaning', 'home-cleaning', 0, 1, '2020-09-26 16:43:37'),
(9, 'Office Product', 'office-product', 0, 1, '2020-09-26 16:43:45'),
(10, 'Dairy', 'dairy', 0, 1, '2020-09-26 16:43:55'),
(11, 'Frozen & Canned', 'frozen-canned', 0, 1, '2020-09-26 16:44:31'),
(12, 'Samsung', 'samsung', 0, 1, '2020-09-26 16:45:28'),
(13, 'Bata', 'bata', 0, 1, '2020-09-26 16:45:34'),
(14, 'Apex', 'apex', 0, 1, '2020-09-26 16:45:38'),
(15, 'Dell', 'dell', 0, 1, '2020-09-26 16:45:43'),
(16, 'Home & Appliance', 'home-appliance', 0, 1, '2020-09-26 16:46:16'),
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
(38, '4', '4', 0, 1, '2020-09-27 13:25:47');

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
(11, 6, 0),
(11, 7, 0),
(11, 10, 0),
(11, 11, 0),
(11, 12, 0),
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
(32, 1, 0),
(32, 12, 0);

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
(38, 38, 'pa_inch', '', 0, 0, '2020-09-27 13:25:47');

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
(166, 2, 'user_image', '1601189730.png'),
(165, 2, 'zip', '4543'),
(164, 2, 'city', 'Dhaka'),
(163, 2, 'state', 'Bangladesh'),
(162, 2, 'country', 'Bangladesh'),
(161, 2, 'phone', '4534534'),
(160, 2, 'address_two', 'Dhaka'),
(159, 2, 'address_one', 'Uttara'),
(41, 3, 'phone', '4354354'),
(40, 3, 'address_two', 'retretret'),
(39, 3, 'address_one', 'retretre'),
(38, 3, 'last_name', 'user 2'),
(37, 3, 'first_name', 'user 2'),
(42, 3, 'country', 'BD'),
(43, 3, 'state', 'Bangladesh'),
(44, 3, 'city', 'Dhaka'),
(45, 3, 'zip', '342543543'),
(157, 2, 'first_name', 'Demo'),
(158, 2, 'last_name', 'Demo');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'akbor Hossain1', 'admin@email.com', NULL, '$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa', NULL, 1, '2020-07-12 05:39:38', '2020-07-12 05:39:38'),
(2, 'Demo', 'demo@email.com', NULL, '$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa', NULL, 1, '2020-09-13 05:06:20', '2020-09-13 05:06:20'),
(3, 'user 2', 'user2@email.com', NULL, '$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa', NULL, 1, '2020-09-19 09:08:42', '2020-09-19 09:08:42');

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

-- --------------------------------------------------------

--
-- Table structure for table `wp_yith_wcwl`
--

CREATE TABLE `wp_yith_wcwl` (
  `ID` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wishlist_id` int(11) DEFAULT NULL,
  `dateadded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_yith_wcwl_lists`
--

CREATE TABLE `wp_yith_wcwl_lists` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wishlist_slug` varchar(200) NOT NULL,
  `wishlist_name` text DEFAULT NULL,
  `wishlist_token` varchar(64) NOT NULL,
  `wishlist_privacy` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `dateadded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Indexes for table `wp_yith_wcwl`
--
ALTER TABLE `wp_yith_wcwl`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `prod_id_2` (`prod_id`),
  ADD KEY `prod_id_3` (`prod_id`);

--
-- Indexes for table `wp_yith_wcwl_lists`
--
ALTER TABLE `wp_yith_wcwl_lists`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `wishlist_token` (`wishlist_token`),
  ADD UNIQUE KEY `wishlist_token_2` (`wishlist_token`),
  ADD KEY `wishlist_slug` (`wishlist_slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_itemmeta`
--
ALTER TABLE `order_itemmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `postmeta`
--
ALTER TABLE `postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_yith_wcwl`
--
ALTER TABLE `wp_yith_wcwl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_yith_wcwl_lists`
--
ALTER TABLE `wp_yith_wcwl_lists`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
