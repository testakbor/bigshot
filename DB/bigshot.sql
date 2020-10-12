-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2020 at 02:05 PM
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
(1, 1, '_tax_class', '', '165', '2020-10-08', '2'),
(2, 1, '_qty', '1', '165', '2020-10-08', '2'),
(3, 1, '_product_id', '122', '165', '2020-10-08', '2'),
(4, 1, '_variation_id', '', '165', '2020-10-08', '2'),
(5, 1, '_line_subtotal', '3000', '165', '2020-10-08', '2'),
(6, 1, '_line_total', '3000', '165', '2020-10-08', '2'),
(7, 1, '_line_subtotal_tax', '', '165', '2020-10-08', '2'),
(8, 1, '_line_tax', '', '165', '2020-10-08', '2'),
(9, 1, '_line_tax_data', '2020-10-08 22:59:58', '165', '2020-10-08', '2'),
(10, 2, '_tax_class', '', '166', '2020-10-10', '0'),
(11, 2, '_qty', '1', '166', '2020-10-10', '0'),
(12, 2, '_product_id', '121', '166', '2020-10-10', '0'),
(13, 2, '_variation_id', '', '166', '2020-10-10', '0'),
(14, 2, '_line_subtotal', '3000', '166', '2020-10-10', '0'),
(15, 2, '_line_total', '3000', '166', '2020-10-10', '0'),
(16, 2, '_line_subtotal_tax', '', '166', '2020-10-10', '0'),
(17, 2, '_line_tax', '', '166', '2020-10-10', '0'),
(18, 2, '_line_tax_data', '2020-10-10 16:08:12', '166', '2020-10-10', '0'),
(19, 3, '_tax_class', '', '169', '2020-10-10', '2'),
(20, 3, '_qty', '1', '169', '2020-10-10', '2'),
(21, 3, '_product_id', '74', '169', '2020-10-10', '2'),
(22, 3, '_variation_id', '', '169', '2020-10-10', '2'),
(23, 3, '_line_subtotal', '30000', '169', '2020-10-10', '2'),
(24, 3, '_line_total', '30000', '169', '2020-10-10', '2'),
(25, 3, '_line_subtotal_tax', '', '169', '2020-10-10', '2'),
(26, 3, '_line_tax', '', '169', '2020-10-10', '2'),
(27, 3, '_line_tax_data', '2020-10-10 23:35:00', '169', '2020-10-10', '2'),
(28, 4, '_tax_class', '', '169', '2020-10-10', '2'),
(29, 4, '_qty', '10', '169', '2020-10-10', '2'),
(30, 4, '_product_id', '119', '169', '2020-10-10', '2'),
(31, 4, '_variation_id', '', '169', '2020-10-10', '2'),
(32, 4, '_line_subtotal', '30000', '169', '2020-10-10', '2'),
(33, 4, '_line_total', '30000', '169', '2020-10-10', '2'),
(34, 4, '_line_subtotal_tax', '', '169', '2020-10-10', '2'),
(35, 4, '_line_tax', '', '169', '2020-10-10', '2'),
(36, 4, '_line_tax_data', '2020-10-10 23:35:00', '169', '2020-10-10', '2'),
(37, 5, '_tax_class', '', '170', '2020-10-10', '4'),
(38, 5, '_qty', '5', '170', '2020-10-10', '4'),
(39, 5, '_product_id', '116', '170', '2020-10-10', '4'),
(40, 5, '_variation_id', '', '170', '2020-10-10', '4'),
(41, 5, '_line_subtotal', '15000', '170', '2020-10-10', '4'),
(42, 5, '_line_total', '15000', '170', '2020-10-10', '4'),
(43, 5, '_line_subtotal_tax', '', '170', '2020-10-10', '4'),
(44, 5, '_line_tax', '', '170', '2020-10-10', '4'),
(45, 5, '_line_tax_data', '2020-10-10 23:36:31', '170', '2020-10-10', '4'),
(46, 3, 'product_status', 'cancel', '169', '2020-10-10', '2'),
(47, 4, 'product_status', 'cancel', '169', '2020-10-10', '2'),
(48, 6, '_tax_class', '', '171', '2020-10-12', '5'),
(49, 6, '_qty', '6', '171', '2020-10-12', '5'),
(50, 6, '_product_id', '114', '171', '2020-10-12', '5'),
(51, 6, '_variation_id', '', '171', '2020-10-12', '5'),
(52, 6, '_line_subtotal', '18000', '171', '2020-10-12', '5'),
(53, 6, '_line_total', '18000', '171', '2020-10-12', '5'),
(54, 6, '_line_subtotal_tax', '', '171', '2020-10-12', '5'),
(55, 6, '_line_tax', '', '171', '2020-10-12', '5'),
(56, 6, '_line_tax_data', '2020-10-12 20:52:19', '171', '2020-10-12', '5'),
(57, 7, '_tax_class', '', '172', '2020-10-12', '5'),
(58, 7, '_qty', '13', '172', '2020-10-12', '5'),
(59, 7, '_product_id', '115', '172', '2020-10-12', '5'),
(60, 7, '_variation_id', '', '172', '2020-10-12', '5'),
(61, 7, '_line_subtotal', '39000', '172', '2020-10-12', '5'),
(62, 7, '_line_total', '39000', '172', '2020-10-12', '5'),
(63, 7, '_line_subtotal_tax', '', '172', '2020-10-12', '5'),
(64, 7, '_line_tax', '', '172', '2020-10-12', '5'),
(65, 7, '_line_tax_data', '2020-10-12 21:20:17', '172', '2020-10-12', '5'),
(66, 8, '_tax_class', '', '172', '2020-10-12', '5'),
(67, 8, '_qty', '9', '172', '2020-10-12', '5'),
(68, 8, '_product_id', '102', '172', '2020-10-12', '5'),
(69, 8, '_variation_id', '', '172', '2020-10-12', '5'),
(70, 8, '_line_subtotal', '27000', '172', '2020-10-12', '5'),
(71, 8, '_line_total', '27000', '172', '2020-10-12', '5'),
(72, 8, '_line_subtotal_tax', '', '172', '2020-10-12', '5'),
(73, 8, '_line_tax', '', '172', '2020-10-12', '5'),
(74, 8, '_line_tax_data', '2020-10-12 21:20:17', '172', '2020-10-12', '5');

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
(1, 'Tunic 5', 'line-item', '122', 165),
(2, 'Tunic 4-2', 'line-item', '121', 166),
(3, 'Crossbody bag 1', 'line-item', '74', 169),
(4, 'Tunic 3-2', 'line-item', '119', 169),
(5, 'Tunic 2', 'line-item', '116', 170),
(6, 'Tunic 1-2', 'line-item', '114', 171),
(7, 'Tshirt 2', 'line-item', '115', 172),
(8, 'Dresses 3', 'line-item', '102', 172);

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
(885, 75, 'regular_price', '5000'),
(884, 75, 'stock_status', 'instock'),
(883, 75, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(882, 74, 'gallery_file', 'Crossbody bag 1.jpg'),
(881, 74, 'attached_file', '1601879560.jpg'),
(880, 74, '_sku', '100'),
(879, 74, 'start_stock', '1000'),
(878, 74, 'product_stock', '1000'),
(877, 74, 'alert_qty', '40'),
(876, 74, 'qty', '22'),
(875, 74, 'height', NULL),
(874, 74, 'width', NULL),
(873, 74, 'length', NULL),
(872, 74, 'weight', NULL),
(871, 74, 'sale_price', '30000'),
(870, 74, 'regular_price', '5000'),
(869, 74, 'stock_status', 'instock'),
(868, 74, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(867, 73, 'gallery_file', 'Sunglases 1.jpg'),
(838, 72, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(349, 35, 'attached_file', '1601121125.jpg'),
(348, 35, 'alert_qty', '29'),
(347, 35, 'qty', '26'),
(346, 35, 'height', NULL),
(345, 35, 'width', NULL),
(344, 35, 'length', NULL),
(343, 35, 'weight', NULL),
(342, 35, 'sale_price', '3500'),
(341, 35, 'regular_price', '4000'),
(340, 35, 'stock_status', 'instock'),
(866, 73, 'attached_file', '1601879409.jpg'),
(865, 73, '_sku', '100'),
(864, 73, 'start_stock', '1000'),
(863, 73, 'product_stock', '1000'),
(862, 73, 'alert_qty', '55'),
(861, 73, 'qty', '60'),
(860, 73, 'height', NULL),
(859, 73, 'width', NULL),
(857, 73, 'weight', NULL),
(858, 73, 'length', NULL),
(856, 73, 'sale_price', '30000'),
(855, 73, 'regular_price', '5000'),
(854, 73, 'stock_status', 'instock'),
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
(833, 71, 'product_stock', '1000'),
(834, 71, 'start_stock', '1000'),
(835, 71, '_sku', '100'),
(836, 71, 'attached_file', '1601879257.jpg'),
(837, 71, 'gallery_file', 'Scarve 1.jpg'),
(853, 73, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(852, 72, 'gallery_file', 'Scarve 2.jpg'),
(851, 72, 'attached_file', '1601879329.jpg'),
(831, 71, 'qty', '50'),
(832, 71, 'alert_qty', '45'),
(825, 71, 'regular_price', '5000'),
(829, 71, 'width', NULL),
(830, 71, 'height', NULL),
(828, 71, 'length', NULL),
(827, 71, 'weight', NULL),
(373, 38, 'first_name', 'Demo'),
(374, 38, 'last_name', 'Demo'),
(375, 38, 'address_one', 'Uttara'),
(376, 38, 'address_two', NULL),
(377, 38, 'phone', '4534534'),
(378, 38, 'country', 'Bangladesh'),
(379, 38, 'state', 'Bangladesh'),
(380, 38, 'city', 'Dhaka'),
(381, 38, 'zip', '4543'),
(382, 38, '_customer_user', '2'),
(383, 38, '_billing_postcode', '4543'),
(384, 38, '_billing_company', NULL),
(385, 38, '_billing_last_name', NULL),
(386, 38, '_billing_first_name', NULL),
(387, 39, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Red\"}]'),
(388, 39, 'stock_status', 'instock'),
(389, 39, 'regular_price', '5000'),
(390, 39, 'sale_price', '3000'),
(391, 39, 'weight', NULL),
(392, 39, 'length', NULL),
(393, 39, 'width', NULL),
(394, 39, 'height', NULL),
(395, 39, 'qty', '79'),
(396, 39, 'alert_qty', '70'),
(397, 39, 'product_stock', '1000'),
(398, 39, '_sku', '100'),
(399, 39, 'attached_file', '1601373113.png'),
(400, 39, 'gallery_file', 'dell.png'),
(401, 40, 'first_name', 'Demo'),
(402, 40, 'last_name', 'Demo'),
(403, 40, 'address_one', 'Uttara'),
(404, 40, 'address_two', NULL),
(405, 40, 'phone', '6789'),
(406, 40, 'country', 'ewrewr'),
(407, 40, 'state', '4325435'),
(408, 40, 'city', '34543'),
(409, 40, 'zip', NULL),
(410, 40, '_customer_user', '2'),
(411, 40, '_billing_postcode', NULL),
(412, 40, '_billing_company', NULL),
(413, 40, '_billing_last_name', NULL),
(414, 40, '_billing_first_name', NULL),
(415, 41, 'first_name', 'Demo'),
(416, 41, 'last_name', 'Demo'),
(417, 41, 'address_one', 'retretre'),
(418, 41, 'address_two', NULL),
(419, 41, 'phone', '6789'),
(420, 41, 'country', 'Bangladesh'),
(421, 41, 'state', 'BD'),
(422, 41, 'city', 'Dhaka'),
(423, 41, 'zip', '342543543'),
(424, 41, '_customer_user', '2'),
(425, 41, '_billing_postcode', '342543543'),
(426, 41, '_billing_company', NULL),
(427, 41, '_billing_last_name', NULL),
(428, 41, '_billing_first_name', NULL),
(849, 72, 'start_stock', '2000'),
(850, 72, '_sku', '100'),
(848, 72, 'product_stock', '2000'),
(847, 72, 'alert_qty', '20'),
(846, 72, 'qty', '30'),
(845, 72, 'height', NULL),
(844, 72, 'width', NULL),
(843, 72, 'length', NULL),
(842, 72, 'weight', NULL),
(841, 72, 'sale_price', '4000'),
(840, 72, 'regular_price', '5000'),
(839, 72, 'stock_status', 'instock'),
(443, 43, 'first_name', 'Demo'),
(444, 43, 'last_name', 'Demo'),
(445, 43, 'address_one', 'retretre'),
(446, 43, 'address_two', NULL),
(447, 43, 'phone', '6789'),
(448, 43, 'country', 'Bangladesh'),
(449, 43, 'state', 'BD'),
(450, 43, 'city', 'Dhaka'),
(451, 43, 'zip', '342543543'),
(452, 43, '_customer_user', '2'),
(453, 43, '_billing_postcode', '342543543'),
(454, 43, '_billing_company', NULL),
(455, 43, '_billing_last_name', NULL),
(456, 43, '_billing_first_name', NULL),
(457, 44, 'first_name', 'Demo'),
(458, 44, 'last_name', 'Demo'),
(459, 44, 'address_one', 'retretre'),
(460, 44, 'address_two', NULL),
(461, 44, 'phone', '6789'),
(462, 44, 'country', 'Bangladesh'),
(463, 44, 'state', 'BD'),
(464, 44, 'city', 'Dhaka'),
(465, 44, 'zip', '342543543'),
(466, 44, '_customer_user', '2'),
(467, 44, '_billing_postcode', '342543543'),
(468, 44, '_billing_company', NULL),
(469, 44, '_billing_last_name', NULL),
(470, 44, '_billing_first_name', NULL),
(471, 45, 'first_name', 'Demo'),
(472, 45, 'last_name', 'Demo'),
(473, 45, 'address_one', 'retretre'),
(474, 45, 'address_two', NULL),
(475, 45, 'phone', '6789'),
(476, 45, 'country', 'Bangladesh'),
(477, 45, 'state', 'BD'),
(478, 45, 'city', 'Dhaka'),
(479, 45, 'zip', '342543543'),
(480, 45, '_customer_user', '2'),
(481, 45, '_billing_postcode', '342543543'),
(482, 45, '_billing_company', NULL),
(483, 45, '_billing_last_name', NULL),
(484, 45, '_billing_first_name', NULL),
(485, 46, 'first_name', 'Demo'),
(486, 46, 'last_name', 'Demo'),
(487, 46, 'address_one', 'retretre'),
(488, 46, 'address_two', NULL),
(489, 46, 'phone', '6789'),
(490, 46, 'country', 'Bangladesh'),
(491, 46, 'state', 'BD'),
(492, 46, 'city', 'Dhaka'),
(493, 46, 'zip', '342543543'),
(494, 46, '_customer_user', '2'),
(495, 46, '_billing_postcode', '342543543'),
(496, 46, '_billing_company', NULL),
(497, 46, '_billing_last_name', NULL),
(498, 46, '_billing_first_name', NULL),
(499, 47, 'first_name', 'Demo'),
(500, 47, 'last_name', 'Demo'),
(501, 47, 'address_one', 'retretre'),
(502, 47, 'address_two', NULL),
(503, 47, 'phone', '6789'),
(504, 47, 'country', 'Bangladesh'),
(505, 47, 'state', 'BD'),
(506, 47, 'city', 'Dhaka'),
(507, 47, 'zip', '342543543'),
(508, 47, '_customer_user', '2'),
(509, 47, '_billing_postcode', '342543543'),
(510, 47, '_billing_company', NULL),
(511, 47, '_billing_last_name', NULL),
(512, 47, '_billing_first_name', NULL),
(513, 48, 'first_name', 'fdgdfg'),
(514, 48, 'last_name', 'dfgdfg'),
(515, 48, 'address_one', 'dfgfdg'),
(516, 48, 'address_two', NULL),
(517, 48, 'phone', '4534534'),
(518, 48, 'country', '34324'),
(519, 48, 'state', 'Bangladesh'),
(520, 48, 'city', 'sdgdfg'),
(521, 48, 'zip', '4543'),
(522, 48, '_customer_user', '0'),
(523, 48, '_billing_postcode', '4543'),
(524, 48, '_billing_company', NULL),
(525, 48, '_billing_last_name', NULL),
(526, 48, '_billing_first_name', NULL),
(527, 48, 'processing_date', '2020-09-30'),
(528, 49, 'first_name', 'fdgdfg'),
(529, 49, 'last_name', 'dfgdfg'),
(530, 49, 'address_one', 'dfgfdg'),
(531, 49, 'address_two', NULL),
(532, 49, 'phone', '4534534'),
(533, 49, 'country', '342543'),
(534, 49, 'state', 'Bangladesh'),
(535, 49, 'city', 'sdgdfg'),
(536, 49, 'zip', '4543'),
(537, 49, '_customer_user', '0'),
(538, 49, '_billing_postcode', '4543'),
(539, 49, '_billing_company', NULL),
(540, 49, '_billing_last_name', NULL),
(541, 49, '_billing_first_name', NULL),
(542, 50, 'first_name', 'fdgdfg'),
(543, 50, 'last_name', 'dfgdfg'),
(544, 50, 'address_one', 'dfgfdg'),
(545, 50, 'address_two', NULL),
(546, 50, 'phone', '4534534'),
(547, 50, 'country', 'Bangladesh'),
(548, 50, 'state', 'Bangladesh'),
(549, 50, 'city', 'sdgdfg'),
(550, 50, 'zip', '4543'),
(551, 50, '_customer_user', '0'),
(552, 50, '_billing_postcode', '4543'),
(553, 50, '_billing_company', NULL),
(554, 50, '_billing_last_name', NULL),
(555, 50, '_billing_first_name', NULL),
(556, 51, 'first_name', 'akbor Hossain1'),
(557, 51, 'last_name', 'akbor Hossain1'),
(558, 51, 'address_one', '324324'),
(559, 51, 'address_two', NULL),
(560, 51, 'phone', '435435'),
(561, 51, 'country', '345435'),
(562, 51, 'state', '345435'),
(563, 51, 'city', '345345'),
(564, 51, 'zip', '345435'),
(565, 51, '_customer_user', '1'),
(566, 51, '_billing_postcode', '345435'),
(567, 51, '_billing_company', NULL),
(568, 51, '_billing_last_name', NULL),
(569, 51, '_billing_first_name', NULL),
(570, 52, 'first_name', 'fdgdfg'),
(571, 52, 'last_name', 'dfgdfg'),
(572, 52, 'address_one', 'dfgfdg'),
(573, 52, 'address_two', NULL),
(574, 52, 'phone', '+8804534534'),
(575, 52, 'country', 'Bangladesh'),
(576, 52, 'state', 'Bangladesh'),
(577, 52, 'city', 'sdgdfg'),
(578, 52, 'zip', '4543'),
(579, 52, '_customer_user', '1'),
(580, 52, '_billing_postcode', '4543'),
(581, 52, '_billing_company', NULL),
(582, 52, '_billing_last_name', NULL),
(583, 52, '_billing_first_name', NULL),
(584, 53, 'first_name', 'fdgdfg'),
(585, 53, 'last_name', 'dfgdfg'),
(586, 53, 'address_one', 'dfgfdg'),
(587, 53, 'address_two', NULL),
(588, 53, 'phone', '+8804534534'),
(589, 53, 'country', 'Bangladesh'),
(590, 53, 'state', 'Bangladesh'),
(591, 53, 'city', 'sdgdfg'),
(592, 53, 'zip', '4543'),
(593, 53, '_customer_user', '1'),
(594, 53, '_billing_postcode', '4543'),
(595, 53, '_billing_company', NULL),
(596, 53, '_billing_last_name', NULL),
(597, 53, '_billing_first_name', NULL),
(598, 54, 'first_name', 'fdgdfg'),
(599, 54, 'last_name', 'dfgdfg'),
(600, 54, 'address_one', 'dfgfdg'),
(601, 54, 'address_two', NULL),
(602, 54, 'phone', '+8804534534'),
(603, 54, 'country', 'Bangladesh'),
(604, 54, 'state', 'Bangladesh'),
(605, 54, 'city', 'sdgdfg'),
(606, 54, 'zip', '4543'),
(607, 54, '_customer_user', '1'),
(608, 54, '_billing_postcode', '4543'),
(609, 54, '_billing_company', NULL),
(610, 54, '_billing_last_name', NULL),
(611, 54, '_billing_first_name', NULL),
(612, 55, 'first_name', 'fdgdfg'),
(613, 55, 'last_name', 'dfgdfg'),
(614, 55, 'address_one', 'dfgfdg'),
(615, 55, 'address_two', NULL),
(616, 55, 'phone', '+8804534534'),
(617, 55, 'country', 'Bangladesh'),
(618, 55, 'state', 'Bangladesh'),
(619, 55, 'city', 'sdgdfg'),
(620, 55, 'zip', '4543'),
(621, 55, '_customer_user', '1'),
(622, 55, '_billing_postcode', '4543'),
(623, 55, '_billing_company', NULL),
(624, 55, '_billing_last_name', NULL),
(625, 55, '_billing_first_name', NULL),
(2448, 172, '_billing_first_name', NULL),
(2447, 172, '_billing_last_name', NULL),
(2446, 172, '_billing_company', NULL),
(2445, 172, '_billing_postcode', '1230'),
(2444, 172, '_customer_user', '5'),
(2443, 172, 'zip', '1230'),
(2442, 172, 'city', 'Uttara'),
(2441, 172, 'state', 'Dhaka'),
(2440, 172, 'country', 'Bangladesh'),
(2439, 172, 'email', 'saiful@itebd.com'),
(2438, 172, 'phone', '345345345'),
(2437, 172, 'address_two', NULL),
(2436, 172, 'address_one', 'Uttara'),
(2435, 172, 'last_name', 'Saiful'),
(2434, 172, 'first_name', 'Saiful'),
(2433, 171, 'payment_method', 'cash'),
(2432, 171, '_billing_first_name', NULL),
(2431, 171, '_billing_last_name', NULL),
(2430, 171, '_billing_company', NULL),
(2429, 171, '_billing_postcode', '1230'),
(2428, 171, '_customer_user', '5'),
(2427, 171, 'zip', '1230'),
(2426, 171, 'city', 'Uttara'),
(2425, 171, 'state', 'Dhaka'),
(2424, 171, 'country', 'Bangladesh'),
(2423, 171, 'email', 'saiful@itebd.com'),
(2421, 171, 'address_two', NULL),
(2422, 171, 'phone', '345345345'),
(2419, 171, 'last_name', 'Rahman'),
(2420, 171, 'address_one', 'Uttara'),
(2412, 74, 'reject_qty', '3'),
(2416, 74, 'product_status', 'reject'),
(2417, 74, 'reject_date', '2020-10-12'),
(2418, 171, 'first_name', 'Rahman'),
(2415, 74, 'reject_qty', '1'),
(2393, 169, 'processing_date', '2020-10-11'),
(2392, 170, 'processing_date', '2020-10-11'),
(2391, 170, 'payment_method', 'cash'),
(2390, 170, '_billing_first_name', NULL),
(2389, 170, '_billing_last_name', NULL),
(2388, 170, '_billing_company', NULL),
(2387, 170, '_billing_postcode', '1230'),
(2386, 170, '_customer_user', '4'),
(2385, 170, 'zip', '1230'),
(2384, 170, 'city', 'Uttara'),
(2383, 170, 'state', 'Dhaka'),
(2382, 170, 'country', 'Bangladesh'),
(2381, 170, 'email', 'demo2@email.com'),
(2380, 170, 'phone', '4353453'),
(2379, 170, 'address_two', NULL),
(2378, 170, 'address_one', '3434543'),
(2377, 170, 'last_name', 'two'),
(2376, 170, 'first_name', 'two'),
(2375, 169, 'payment_method', 'cash'),
(2374, 169, '_billing_first_name', NULL),
(2373, 169, '_billing_last_name', NULL),
(2372, 169, '_billing_company', NULL),
(2371, 169, '_billing_postcode', '1230'),
(2370, 169, '_customer_user', '2'),
(2369, 169, 'zip', '1230'),
(2368, 169, 'city', 'Uttara'),
(2367, 169, 'state', 'Dhaka'),
(2366, 169, 'country', 'Bangladesh'),
(2365, 169, 'email', 'demo@email.com'),
(2349, 166, 'payment_method', 'cash'),
(826, 71, 'sale_price', '3000'),
(2348, 166, '_billing_first_name', NULL),
(2347, 166, '_billing_last_name', NULL),
(2346, 166, '_billing_company', NULL),
(2345, 166, '_billing_postcode', '4543'),
(2344, 166, '_customer_user', '0'),
(2343, 166, 'zip', '4543'),
(2342, 166, 'city', 'Uttara'),
(2341, 166, 'state', 'Dhaka'),
(2340, 166, 'country', 'Bangladesh'),
(2339, 166, 'email', 'saiful@itebd.com'),
(2338, 166, 'phone', '546546'),
(2337, 166, 'address_two', NULL),
(2336, 166, 'address_one', 'dfgfdg'),
(2335, 166, 'last_name', 'dfgdfg'),
(2334, 166, 'first_name', 'fdgdfg'),
(2333, 165, 'payment_method', 'cash'),
(2332, 165, '_billing_first_name', NULL),
(2331, 165, '_billing_last_name', NULL),
(2330, 165, '_billing_company', NULL),
(2329, 165, '_billing_postcode', '1230'),
(2328, 165, '_customer_user', '2'),
(2327, 165, 'zip', '1230'),
(2326, 165, 'city', 'Uttara'),
(2325, 165, 'state', 'Dhaka'),
(2324, 165, 'country', 'Bangladesh'),
(2323, 165, 'email', 'demo@email.com'),
(2322, 165, 'phone', '6789'),
(2321, 165, 'address_two', NULL),
(2320, 165, 'address_one', 'Uttara'),
(2319, 165, 'last_name', 'Demo'),
(2318, 165, 'first_name', 'Demo'),
(763, 66, 'first_name', 'Demo'),
(764, 66, 'last_name', 'Demo'),
(765, 66, 'address_one', 'Uttara'),
(766, 66, 'address_two', NULL),
(767, 66, 'phone', '6789'),
(768, 66, 'email', 'demo@email.com'),
(769, 66, 'country', '4354'),
(770, 66, 'state', '45345'),
(771, 66, 'city', '3244324'),
(772, 66, 'zip', '234324'),
(773, 66, '_customer_user', '2'),
(774, 66, '_billing_postcode', '234324'),
(775, 66, '_billing_company', NULL),
(776, 66, '_billing_last_name', NULL),
(777, 66, '_billing_first_name', NULL),
(823, 71, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(824, 71, 'stock_status', 'instock'),
(822, 70, 'gallery_file', 'Belt 1.jpg'),
(821, 70, 'attached_file', '1601879156.jpg'),
(820, 70, '_sku', '5'),
(819, 70, 'start_stock', '1000'),
(818, 70, 'product_stock', '1000'),
(817, 70, 'alert_qty', '40'),
(816, 70, 'qty', '47'),
(815, 70, 'height', NULL),
(808, 70, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(809, 70, 'stock_status', 'instock'),
(810, 70, 'regular_price', '5000'),
(811, 70, 'sale_price', '3000'),
(812, 70, 'weight', NULL),
(813, 70, 'length', NULL),
(814, 70, 'width', NULL),
(892, 75, 'alert_qty', '40'),
(891, 75, 'qty', '50'),
(890, 75, 'height', NULL),
(889, 75, 'width', NULL),
(888, 75, 'length', NULL),
(887, 75, 'weight', NULL),
(886, 75, 'sale_price', '3000'),
(893, 75, 'product_stock', '2000'),
(894, 75, 'start_stock', '2000'),
(895, 75, '_sku', '100'),
(896, 75, 'attached_file', '1601879657.jpg'),
(897, 75, 'gallery_file', 'Crossbody bag 2.jpg'),
(898, 76, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Red\"}]'),
(899, 76, 'stock_status', 'instock'),
(900, 76, 'regular_price', '5000'),
(901, 76, 'sale_price', '3000'),
(902, 76, 'weight', NULL),
(903, 76, 'length', NULL),
(904, 76, 'width', NULL),
(905, 76, 'height', NULL),
(906, 76, 'qty', '67'),
(907, 76, 'alert_qty', '55'),
(908, 76, 'product_stock', '1000'),
(909, 76, 'start_stock', '1000'),
(910, 76, '_sku', '100'),
(911, 76, 'attached_file', '1601879768.jpg'),
(912, 76, 'gallery_file', 'Crossbody bag 2-2.jpg'),
(913, 77, 'stock_status', 'instock'),
(914, 77, 'regular_price', '20000'),
(915, 77, 'sale_price', '30000'),
(916, 77, 'weight', NULL),
(917, 77, 'length', NULL),
(918, 77, 'width', NULL),
(919, 77, 'height', NULL),
(920, 77, 'qty', '0'),
(921, 77, 'alert_qty', '0'),
(922, 77, 'product_stock', '2000'),
(923, 77, 'start_stock', '2000'),
(924, 77, '_sku', '100'),
(925, 77, 'attached_file', '1601879823.jpg'),
(926, 77, 'gallery_file', 'Purse 1.jpg'),
(927, 78, 'stock_status', 'instock'),
(928, 78, 'regular_price', '20000'),
(929, 78, 'sale_price', '30000'),
(930, 78, 'weight', NULL),
(931, 78, 'length', NULL),
(932, 78, 'width', NULL),
(933, 78, 'height', NULL),
(934, 78, 'qty', '0'),
(935, 78, 'alert_qty', '0'),
(936, 78, 'product_stock', '5000'),
(937, 78, 'start_stock', '5000'),
(938, 78, '_sku', '100'),
(939, 78, 'attached_file', '1601879879.jpg'),
(940, 78, 'gallery_file', 'purse 2.jpg'),
(941, 79, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Yellow\"}]'),
(942, 79, 'stock_status', 'instock'),
(943, 79, 'regular_price', '5000'),
(944, 79, 'sale_price', '4000'),
(945, 79, 'weight', NULL),
(946, 79, 'length', NULL),
(947, 79, 'width', NULL),
(948, 79, 'height', NULL),
(949, 79, 'qty', '50'),
(950, 79, 'alert_qty', '30'),
(951, 79, 'product_stock', '2000'),
(952, 79, 'start_stock', '2000'),
(953, 79, '_sku', '1324324'),
(954, 79, 'attached_file', '1601879991.jpg'),
(955, 79, 'gallery_file', 'Tote bag 2.jpg'),
(956, 80, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(957, 80, 'stock_status', 'instock'),
(958, 80, 'regular_price', '5000'),
(959, 80, 'sale_price', '30000'),
(960, 80, 'weight', NULL),
(961, 80, 'length', NULL),
(962, 80, 'width', NULL),
(963, 80, 'height', NULL),
(964, 80, 'qty', '60'),
(965, 80, 'alert_qty', '40'),
(966, 80, 'product_stock', '2000'),
(967, 80, 'start_stock', '2000'),
(968, 80, '_sku', '456'),
(969, 80, 'attached_file', '1601880065.jpg'),
(970, 80, 'gallery_file', 'Tote bag 3.jpg'),
(971, 81, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(972, 81, 'stock_status', 'instock'),
(973, 81, 'regular_price', '5000'),
(974, 81, 'sale_price', '3000'),
(975, 81, 'weight', NULL),
(976, 81, 'length', NULL),
(977, 81, 'width', NULL),
(978, 81, 'height', NULL),
(979, 81, 'qty', '100'),
(980, 81, 'alert_qty', '70'),
(981, 81, 'product_stock', '1000'),
(982, 81, 'start_stock', '1000'),
(983, 81, '_sku', '100'),
(984, 81, 'attached_file', '1601880180.jpg'),
(985, 81, 'gallery_file', 'Tote bag 4.jpg'),
(986, 82, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(987, 82, 'stock_status', 'instock'),
(988, 82, 'regular_price', '20000'),
(989, 82, 'sale_price', '30000'),
(990, 82, 'weight', NULL),
(991, 82, 'length', NULL),
(992, 82, 'width', NULL),
(993, 82, 'height', NULL),
(994, 82, 'qty', '400'),
(995, 82, 'alert_qty', '300'),
(996, 82, 'product_stock', '5000'),
(997, 82, 'start_stock', '5000'),
(998, 82, '_sku', '100'),
(999, 82, 'attached_file', '1601880442.jpg'),
(1000, 82, 'gallery_file', 'Jeans 1.jpg'),
(1001, 83, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1002, 83, 'stock_status', 'instock'),
(1003, 83, 'regular_price', '5000'),
(1004, 83, 'sale_price', '3000'),
(1005, 83, 'weight', NULL),
(1006, 83, 'length', NULL),
(1007, 83, 'width', NULL),
(1008, 83, 'height', NULL),
(1009, 83, 'qty', '50'),
(1010, 83, 'alert_qty', '45'),
(1011, 83, 'product_stock', '1000'),
(1012, 83, 'start_stock', '1000'),
(1013, 83, '_sku', '100'),
(1014, 83, 'attached_file', '1601880721.jpg'),
(1015, 83, 'gallery_file', 'Jeans 2.jpg'),
(1016, 84, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1017, 84, 'stock_status', 'instock'),
(1018, 84, 'regular_price', '5000'),
(1019, 84, 'sale_price', '3000'),
(1020, 84, 'weight', NULL),
(1021, 84, 'length', NULL),
(1022, 84, 'width', NULL),
(1023, 84, 'height', NULL),
(1024, 84, 'qty', '600'),
(1025, 84, 'alert_qty', '599'),
(1026, 84, 'product_stock', '1000'),
(1027, 84, 'start_stock', '1000'),
(1028, 84, '_sku', '100'),
(1029, 84, 'attached_file', '1601880860.jpg'),
(1030, 84, 'gallery_file', 'Jeans 2-2.jpg'),
(1031, 85, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1032, 85, 'stock_status', 'instock'),
(1033, 85, 'regular_price', '5000'),
(1034, 85, 'sale_price', '3000'),
(1035, 85, 'weight', NULL),
(1036, 85, 'length', NULL),
(1037, 85, 'width', NULL),
(1038, 85, 'height', NULL),
(1039, 85, 'qty', '50'),
(1040, 85, 'alert_qty', '40'),
(1041, 85, 'product_stock', '1000'),
(1042, 85, 'start_stock', '1000'),
(1043, 85, '_sku', '100'),
(1044, 85, 'attached_file', '1601880950.jpg'),
(1045, 85, 'gallery_file', 'leggings 1.jpg'),
(1046, 86, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1047, 86, 'stock_status', 'instock'),
(1048, 86, 'regular_price', '5000'),
(1049, 86, 'sale_price', '3000'),
(1050, 86, 'weight', NULL),
(1051, 86, 'length', NULL),
(1052, 86, 'width', NULL),
(1053, 86, 'height', NULL),
(1054, 86, 'qty', '60'),
(1055, 86, 'alert_qty', '50'),
(1056, 86, 'product_stock', '1000'),
(1057, 86, 'start_stock', '1000'),
(1058, 86, '_sku', '100'),
(1059, 86, 'attached_file', '1601881049.jpg'),
(1060, 86, 'gallery_file', 'leggings 1-2.jpg'),
(1061, 87, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1062, 87, 'stock_status', 'instock'),
(1063, 87, 'regular_price', '5000'),
(1064, 87, 'sale_price', '3000'),
(1065, 87, 'weight', NULL),
(1066, 87, 'length', NULL),
(1067, 87, 'width', NULL),
(1068, 87, 'height', NULL),
(1069, 87, 'qty', '50'),
(1070, 87, 'alert_qty', '40'),
(1071, 87, 'product_stock', '1000'),
(1072, 87, 'start_stock', '1000'),
(1073, 87, '_sku', '100'),
(1074, 87, 'attached_file', '1601881130.jpg'),
(1075, 87, 'gallery_file', 'skirt 1.jpg'),
(1076, 88, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1077, 88, 'stock_status', 'instock'),
(1078, 88, 'regular_price', '5000'),
(1079, 88, 'sale_price', '3000'),
(1080, 88, 'weight', NULL),
(1081, 88, 'length', NULL),
(1082, 88, 'width', NULL),
(1083, 88, 'height', NULL),
(1084, 88, 'qty', '50'),
(1085, 88, 'alert_qty', '30'),
(1086, 88, 'product_stock', '1000'),
(1087, 88, 'start_stock', '1000'),
(1088, 88, '_sku', '100'),
(1089, 88, 'attached_file', '1601881266.jpg'),
(1090, 88, 'gallery_file', 'skirt 1-2.jpg'),
(1091, 89, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1092, 89, 'stock_status', 'instock'),
(1093, 89, 'regular_price', '5000'),
(1094, 89, 'sale_price', '30000'),
(1095, 89, 'weight', NULL),
(1096, 89, 'length', NULL),
(1097, 89, 'width', NULL),
(1098, 89, 'height', NULL),
(1099, 89, 'qty', '50'),
(1100, 89, 'alert_qty', '40'),
(1101, 89, 'product_stock', '1000'),
(1102, 89, 'start_stock', '1000'),
(1103, 89, '_sku', '100'),
(1104, 89, 'attached_file', '1601881353.jpg'),
(1105, 89, 'gallery_file', 'skirt 1.jpg'),
(1106, 89, 'gallery_file', 'skirt 1-2.jpg'),
(1107, 89, 'gallery_file', 'skirt 1-3.jpg'),
(1108, 90, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Red\"}]'),
(1109, 90, 'stock_status', 'instock'),
(1110, 90, 'regular_price', '5000'),
(1111, 90, 'sale_price', '3000'),
(1112, 90, 'weight', NULL),
(1113, 90, 'length', NULL),
(1114, 90, 'width', NULL),
(1115, 90, 'height', NULL),
(1116, 90, 'qty', '67'),
(1117, 90, 'alert_qty', '60'),
(1118, 90, 'product_stock', '1000'),
(1119, 90, 'start_stock', '1000'),
(1120, 90, '_sku', '100'),
(1121, 90, 'attached_file', '1601881504.jpg'),
(1122, 90, 'gallery_file', 'Bras 1.jpg'),
(1123, 90, 'gallery_file', 'Bras and Panties set 1.jpg'),
(1124, 90, 'gallery_file', 'Panties 1.jpg'),
(1125, 90, 'gallery_file', 'Sleepwear 1.jpg'),
(1126, 91, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Yellow\"}]'),
(1127, 91, 'stock_status', 'instock'),
(1128, 91, 'regular_price', '5000'),
(1129, 91, 'sale_price', '3000'),
(1130, 91, 'weight', NULL),
(1131, 91, 'length', NULL),
(1132, 91, 'width', NULL),
(1133, 91, 'height', NULL),
(1134, 91, 'qty', '69'),
(1135, 91, 'alert_qty', '55'),
(1136, 91, 'product_stock', '2000'),
(1137, 91, 'start_stock', '2000'),
(1138, 91, '_sku', '100'),
(1139, 91, 'attached_file', '1601881616.jpg'),
(1140, 91, 'gallery_file', 'Bras and Panties set 1.jpg'),
(1141, 91, 'gallery_file', 'Panties 1.jpg'),
(1142, 91, 'gallery_file', 'Sleepwear 1.jpg'),
(1143, 92, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Red\"}]'),
(1144, 92, 'stock_status', 'instock'),
(1145, 92, 'regular_price', '5000'),
(1146, 92, 'sale_price', '3000'),
(1147, 92, 'weight', NULL),
(1148, 92, 'length', NULL),
(1149, 92, 'width', NULL),
(1150, 92, 'height', NULL),
(1151, 92, 'qty', '56'),
(1152, 92, 'alert_qty', '36'),
(1153, 92, 'product_stock', '1000'),
(1154, 92, 'start_stock', '1000'),
(1155, 92, '_sku', '100'),
(1156, 92, 'attached_file', '1601881704.jpg'),
(1157, 92, 'gallery_file', 'Bras 1.jpg'),
(1158, 92, 'gallery_file', 'Bras and Panties set 1.jpg'),
(1159, 92, 'gallery_file', 'Panties 1.jpg'),
(1160, 93, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1161, 93, 'stock_status', 'instock'),
(1162, 93, 'regular_price', '5000'),
(1163, 93, 'sale_price', '3000'),
(1164, 93, 'weight', NULL),
(1165, 93, 'length', NULL),
(1166, 93, 'width', NULL),
(1167, 93, 'height', NULL),
(1168, 93, 'qty', '60'),
(1169, 93, 'alert_qty', '50'),
(1170, 93, 'product_stock', '1000'),
(1171, 93, 'start_stock', '1000'),
(1172, 93, '_sku', '100'),
(1173, 93, 'attached_file', '1601881851.jpg'),
(1174, 93, 'gallery_file', 'Sleepwear 1.jpg'),
(1175, 94, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Red\"}]'),
(1176, 94, 'stock_status', 'instock'),
(1177, 94, 'regular_price', '5000'),
(1178, 94, 'sale_price', '3000'),
(1179, 94, 'weight', NULL),
(1180, 94, 'length', NULL),
(1181, 94, 'width', NULL),
(1182, 94, 'height', NULL),
(1183, 94, 'qty', '70'),
(1184, 94, 'alert_qty', '66'),
(1185, 94, 'product_stock', '1000'),
(1186, 94, 'start_stock', '1000'),
(1187, 94, '_sku', '1324324'),
(1188, 94, 'attached_file', '1601882026.jpg'),
(1189, 94, 'gallery_file', 'Bracelet 1.jpg'),
(1190, 94, 'gallery_file', 'Earring 1.jpg'),
(1191, 94, 'gallery_file', 'Earring 2.jpg'),
(1192, 95, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1193, 95, 'stock_status', 'instock'),
(1194, 95, 'regular_price', '5000'),
(1195, 95, 'sale_price', '3000'),
(1196, 95, 'weight', NULL),
(1197, 95, 'length', NULL),
(1198, 95, 'width', NULL),
(1199, 95, 'height', NULL),
(1200, 95, 'qty', '50'),
(1201, 95, 'alert_qty', '10'),
(1202, 95, 'product_stock', '1000'),
(1203, 95, 'start_stock', '1000'),
(1204, 95, '_sku', '100'),
(1205, 95, 'attached_file', '1601882106.jpg'),
(1206, 95, 'gallery_file', 'Earring 2.jpg'),
(1207, 95, 'gallery_file', 'Necklace 2.jpg'),
(1208, 95, 'gallery_file', 'Necklace 3.jpg'),
(1209, 96, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1210, 96, 'stock_status', 'instock'),
(1211, 96, 'regular_price', '5000'),
(1212, 96, 'sale_price', '3000'),
(1213, 96, 'weight', NULL),
(1214, 96, 'length', NULL),
(1215, 96, 'width', NULL),
(1216, 96, 'height', NULL),
(1217, 96, 'qty', '500'),
(1218, 96, 'alert_qty', '400'),
(1219, 96, 'product_stock', '1000'),
(1220, 96, 'start_stock', '1000'),
(1221, 96, '_sku', '100'),
(1222, 96, 'attached_file', '1601882258.jpg'),
(1223, 96, 'gallery_file', 'Bracelet 1.jpg'),
(1224, 96, 'gallery_file', 'Earring 1.jpg'),
(1225, 96, 'gallery_file', 'Earring 2.jpg'),
(1226, 97, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1227, 97, 'stock_status', 'instock'),
(1228, 97, 'regular_price', '5000'),
(1229, 97, 'sale_price', '3000'),
(1230, 97, 'weight', NULL),
(1231, 97, 'length', NULL),
(1232, 97, 'width', NULL),
(1233, 97, 'height', NULL),
(1234, 97, 'qty', '60'),
(1235, 97, 'alert_qty', '50'),
(1236, 97, 'product_stock', '2000'),
(1237, 97, 'start_stock', '2000'),
(1238, 97, '_sku', '100'),
(1239, 97, 'attached_file', '1601882347.jpg'),
(1240, 97, 'gallery_file', 'Earring 2.jpg'),
(1241, 97, 'gallery_file', 'Necklace 2.jpg'),
(1242, 97, 'gallery_file', 'Necklace 3.jpg'),
(1243, 98, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1244, 98, 'stock_status', 'instock'),
(1245, 98, 'regular_price', '5000'),
(1246, 98, 'sale_price', '3000'),
(1247, 98, 'weight', NULL),
(1248, 98, 'length', NULL),
(1249, 98, 'width', NULL),
(1250, 98, 'height', NULL),
(1251, 98, 'qty', '500'),
(1252, 98, 'alert_qty', '400'),
(1253, 98, 'product_stock', '1000'),
(1254, 98, 'start_stock', '1000'),
(1255, 98, '_sku', '100'),
(1256, 98, 'attached_file', '1601882491.jpg'),
(1257, 98, 'gallery_file', 'Earring 1.jpg'),
(1258, 98, 'gallery_file', 'Earring 2.jpg'),
(1259, 98, 'gallery_file', 'Necklace 2.jpg'),
(1260, 98, 'gallery_file', 'Necklace 3.jpg'),
(1261, 99, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1262, 99, 'stock_status', 'instock'),
(1263, 99, 'regular_price', '5000'),
(1264, 99, 'sale_price', '3000'),
(1265, 99, 'weight', NULL),
(1266, 99, 'length', NULL),
(1267, 99, 'width', NULL),
(1268, 99, 'height', NULL),
(1269, 99, 'qty', '60'),
(1270, 99, 'alert_qty', '20'),
(1271, 99, 'product_stock', '1000'),
(1272, 99, 'start_stock', '1000'),
(1273, 99, '_sku', '100'),
(1274, 99, 'attached_file', '1601882638.jpg'),
(1275, 99, 'gallery_file', 'Dresses 1.jpg'),
(1276, 99, 'gallery_file', 'Dresses 2.jpg'),
(1277, 99, 'gallery_file', 'Tshirt 1-2.jpg'),
(1278, 99, 'gallery_file', 'Tunic 3-2.jpg'),
(1279, 100, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1280, 100, 'stock_status', 'instock'),
(1281, 100, 'regular_price', '5000'),
(1282, 100, 'sale_price', '3000'),
(1283, 100, 'weight', NULL),
(1284, 100, 'length', NULL),
(1285, 100, 'width', NULL),
(1286, 100, 'height', NULL),
(1287, 100, 'qty', '80'),
(1288, 100, 'alert_qty', '10'),
(1289, 100, 'product_stock', '1000'),
(1290, 100, 'start_stock', '1000'),
(1291, 100, '_sku', '100'),
(1292, 100, 'attached_file', '1601882717.jpg'),
(1293, 100, 'gallery_file', 'Dresses 2.jpg'),
(1294, 100, 'gallery_file', 'Dresses 3.jpg'),
(1295, 100, 'gallery_file', 'Dresses 3-2.jpg'),
(1296, 101, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1297, 101, 'stock_status', 'instock'),
(1298, 101, 'regular_price', '5000'),
(1299, 101, 'sale_price', '3000'),
(1300, 101, 'weight', NULL),
(1301, 101, 'length', NULL),
(1302, 101, 'width', NULL),
(1303, 101, 'height', NULL),
(1304, 101, 'qty', '60'),
(1305, 101, 'alert_qty', '12'),
(1306, 101, 'product_stock', '1000'),
(1307, 101, 'start_stock', '1000'),
(1308, 101, '_sku', '100'),
(1309, 101, 'attached_file', '1601882890.jpg'),
(1310, 101, 'gallery_file', 'Dresses 3.jpg'),
(1311, 101, 'gallery_file', 'Tshirt 2.jpg'),
(1312, 101, 'gallery_file', 'Tshirt 2-2.jpg'),
(1313, 101, 'gallery_file', 'Tunic 2-2.jpg'),
(1314, 101, 'gallery_file', 'Tunic 3.jpg'),
(1315, 102, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1316, 102, 'stock_status', 'instock'),
(1317, 102, 'regular_price', '5000'),
(1318, 102, 'sale_price', '3000'),
(1319, 102, 'weight', NULL),
(1320, 102, 'length', NULL),
(1321, 102, 'width', NULL),
(1322, 102, 'height', NULL),
(1323, 102, 'qty', '21'),
(1324, 102, 'alert_qty', '10'),
(1325, 102, 'product_stock', '500'),
(1326, 102, 'start_stock', '500'),
(1327, 102, '_sku', '100'),
(1328, 102, 'attached_file', '1601882975.jpg'),
(1329, 102, 'gallery_file', 'Dresses 3.jpg'),
(1330, 102, 'gallery_file', 'Dresses 3-2.jpg'),
(1331, 102, 'gallery_file', 'Dresses 4.jpg'),
(1332, 102, 'gallery_file', 'Dresses 4-2.jpg'),
(1333, 103, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1334, 103, 'stock_status', 'instock'),
(1335, 103, 'regular_price', '5000'),
(1336, 103, 'sale_price', '3000'),
(1337, 103, 'weight', NULL),
(1338, 103, 'length', NULL),
(1339, 103, 'width', NULL),
(1340, 103, 'height', NULL),
(1341, 103, 'qty', '60'),
(1342, 103, 'alert_qty', '40'),
(1343, 103, 'product_stock', '1000'),
(1344, 103, 'start_stock', '1000'),
(1345, 103, '_sku', '100'),
(1346, 103, 'attached_file', '1601883057.jpg'),
(1347, 103, 'gallery_file', 'Tshirt 1-2.jpg'),
(1348, 103, 'gallery_file', 'Tshirt 2.jpg'),
(1349, 103, 'gallery_file', 'Tunic 2.jpg'),
(1350, 103, 'gallery_file', 'Tunic 2-2.jpg'),
(1351, 103, 'gallery_file', 'Tunic 3.jpg'),
(1352, 103, 'gallery_file', 'Tunic 3-2.jpg'),
(1353, 104, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1354, 104, 'stock_status', 'instock'),
(1355, 104, 'regular_price', '5000'),
(1356, 104, 'sale_price', '3000'),
(1357, 104, 'weight', NULL),
(1358, 104, 'length', NULL),
(1359, 104, 'width', NULL),
(1360, 104, 'height', NULL),
(1361, 104, 'qty', '66'),
(1362, 104, 'alert_qty', '14'),
(1363, 104, 'product_stock', '1000'),
(1364, 104, 'start_stock', '1000'),
(1365, 104, '_sku', '100'),
(1366, 104, 'attached_file', '1601883161.jpg'),
(1367, 104, 'gallery_file', 'Tshirt 2-2.jpg'),
(1368, 104, 'gallery_file', 'Tshirt 3.jpg'),
(1369, 104, 'gallery_file', 'Tshirt 3-2.jpg'),
(1370, 104, 'gallery_file', 'Tunic 1.jpg'),
(1371, 105, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1372, 105, 'stock_status', 'instock'),
(1373, 105, 'regular_price', '5000'),
(1374, 105, 'sale_price', '3000'),
(1375, 105, 'weight', NULL),
(1376, 105, 'length', NULL),
(1377, 105, 'width', NULL),
(1378, 105, 'height', NULL),
(1379, 105, 'qty', '50'),
(1380, 105, 'alert_qty', '45'),
(1381, 105, 'product_stock', '1000'),
(1382, 105, 'start_stock', '1000'),
(1383, 105, '_sku', '100'),
(1384, 105, 'attached_file', '1601883275.jpg'),
(1385, 105, 'gallery_file', 'Dresses 4.jpg'),
(1386, 105, 'gallery_file', 'Dresses 4-2.jpg'),
(1387, 105, 'gallery_file', 'Tshirt 3-2.jpg'),
(1388, 105, 'gallery_file', 'Tunic 1.jpg'),
(1389, 106, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1390, 106, 'stock_status', 'instock'),
(1391, 106, 'regular_price', '5000'),
(1392, 106, 'sale_price', '3000'),
(1393, 106, 'weight', NULL),
(1394, 106, 'length', NULL),
(1395, 106, 'width', NULL),
(1396, 106, 'height', NULL),
(1397, 106, 'qty', '50'),
(1398, 106, 'alert_qty', '40'),
(1399, 106, 'product_stock', '1000'),
(1400, 106, 'start_stock', '1000'),
(1401, 106, '_sku', '100'),
(1402, 106, 'attached_file', '1601883541.jpg'),
(1403, 106, 'gallery_file', 'Tshirt 1.jpg'),
(1404, 107, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1405, 107, 'stock_status', 'instock'),
(1406, 107, 'regular_price', '5000'),
(1407, 107, 'sale_price', '3000'),
(1408, 107, 'weight', NULL),
(1409, 107, 'length', NULL),
(1410, 107, 'width', NULL),
(1411, 107, 'height', NULL),
(1412, 107, 'qty', '50'),
(1413, 107, 'alert_qty', '10'),
(1414, 107, 'product_stock', '1000'),
(1415, 107, 'start_stock', '1000'),
(1416, 107, '_sku', '100'),
(1417, 107, 'attached_file', '1601883699.jpg'),
(1418, 107, 'gallery_file', 'Tshirt 1-2.jpg'),
(1419, 107, 'gallery_file', 'Tshirt 2.jpg'),
(1420, 107, 'gallery_file', 'Tshirt 2-2.jpg'),
(1421, 108, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Red\"}]'),
(1422, 108, 'stock_status', 'instock'),
(1423, 108, 'regular_price', '5000'),
(1424, 108, 'sale_price', '3000'),
(1425, 108, 'weight', NULL),
(1426, 108, 'length', NULL),
(1427, 108, 'width', NULL),
(1428, 108, 'height', NULL),
(1429, 108, 'qty', '60'),
(1430, 108, 'alert_qty', '10'),
(1431, 108, 'product_stock', '1000'),
(1432, 108, 'start_stock', '1000'),
(1433, 108, '_sku', '100'),
(1434, 108, 'attached_file', '1601883776.jpg'),
(1435, 108, 'gallery_file', 'Tshirt 2.jpg'),
(1436, 110, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1437, 110, 'stock_status', 'instock'),
(1438, 110, 'regular_price', '5000'),
(1439, 110, 'sale_price', '3000'),
(1440, 110, 'weight', NULL),
(1441, 110, 'length', NULL),
(1442, 110, 'width', NULL),
(1443, 110, 'height', NULL),
(1444, 110, 'qty', '50'),
(1445, 110, 'alert_qty', '4'),
(1446, 110, 'product_stock', '1000'),
(1447, 110, 'start_stock', '1000'),
(1448, 110, '_sku', '100'),
(1449, 110, 'attached_file', '1601884025.jpg'),
(1450, 110, 'gallery_file', 'Tshirt 2.jpg'),
(1451, 110, 'gallery_file', 'Tshirt 2-2.jpg'),
(1452, 110, 'gallery_file', 'Tshirt 3.jpg'),
(1453, 111, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1454, 111, 'stock_status', 'instock'),
(1455, 111, 'regular_price', '5000'),
(1456, 111, 'sale_price', '3000'),
(1457, 111, 'weight', NULL),
(1458, 111, 'length', NULL),
(1459, 111, 'width', NULL),
(1460, 111, 'height', NULL),
(1461, 111, 'qty', '60'),
(1462, 111, 'alert_qty', '50'),
(1463, 111, 'product_stock', '1000'),
(1464, 111, 'start_stock', '1000'),
(1465, 111, '_sku', '100'),
(1466, 111, 'attached_file', '1601884089.jpg'),
(1467, 111, 'gallery_file', 'Tshirt 2-2.jpg'),
(1468, 111, 'gallery_file', 'Tshirt 3.jpg'),
(1469, 111, 'gallery_file', 'Tshirt 3-2.jpg'),
(1470, 112, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1471, 112, 'stock_status', 'instock'),
(1472, 112, 'regular_price', '5000'),
(1473, 112, 'sale_price', '3000'),
(1474, 112, 'weight', NULL),
(1475, 112, 'length', NULL),
(1476, 112, 'width', NULL),
(1477, 112, 'height', NULL),
(1478, 112, 'qty', '60'),
(1479, 112, 'alert_qty', '50'),
(1480, 112, 'product_stock', '1000'),
(1481, 112, 'start_stock', '1000'),
(1482, 112, '_sku', '100'),
(1483, 112, 'attached_file', '1601884148.jpg'),
(1484, 112, 'gallery_file', 'Tshirt 2.jpg'),
(1485, 112, 'gallery_file', 'Tshirt 2-2.jpg'),
(1486, 112, 'gallery_file', 'Tshirt 3.jpg'),
(1487, 112, 'gallery_file', 'Tshirt 3-2.jpg'),
(1488, 113, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1489, 113, 'stock_status', 'instock'),
(1490, 113, 'regular_price', '5000'),
(1491, 113, 'sale_price', '3000'),
(1492, 113, 'weight', NULL),
(1493, 113, 'length', NULL),
(1494, 113, 'width', NULL),
(1495, 113, 'height', NULL),
(1496, 113, 'qty', '99'),
(1497, 113, 'alert_qty', '3'),
(1498, 113, 'product_stock', '1000'),
(1499, 113, 'start_stock', '1000'),
(1500, 113, '_sku', '100443543'),
(1501, 113, 'attached_file', '1601884277.jpg'),
(1502, 113, 'gallery_file', 'Tunic 1.jpg'),
(1503, 113, 'gallery_file', 'Tunic 1-2.jpg'),
(1504, 113, 'gallery_file', 'Tunic 2.jpg'),
(1505, 114, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1506, 114, 'stock_status', 'instock'),
(1507, 114, 'regular_price', '5000'),
(1508, 114, 'sale_price', '3000'),
(1509, 114, 'weight', NULL),
(1510, 114, 'length', NULL),
(1511, 114, 'width', NULL),
(1512, 114, 'height', NULL),
(1513, 114, 'qty', '48'),
(1514, 114, 'alert_qty', '45'),
(1515, 114, 'product_stock', '455'),
(1516, 114, 'start_stock', '1000'),
(1517, 114, '_sku', '10034326'),
(1518, 114, 'attached_file', '1601884360.jpg'),
(1519, 114, 'gallery_file', 'Tunic 1.jpg'),
(1520, 114, 'gallery_file', 'Tunic 1-2.jpg'),
(1521, 114, 'gallery_file', 'Tunic 2.jpg'),
(1522, 115, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1523, 115, 'stock_status', 'instock'),
(1524, 115, 'regular_price', '5000'),
(1525, 115, 'sale_price', '3000'),
(1526, 115, 'weight', NULL),
(1527, 115, 'length', NULL),
(1528, 115, 'width', NULL),
(1529, 115, 'height', NULL),
(1530, 115, 'qty', '32'),
(1531, 115, 'alert_qty', '3'),
(1532, 115, 'product_stock', '1000'),
(1533, 115, 'start_stock', '1000'),
(1534, 115, '_sku', '1004444'),
(1535, 115, 'attached_file', '1601884482.jpg'),
(1536, 115, 'gallery_file', 'Tshirt 2.jpg'),
(1537, 115, 'gallery_file', 'Tshirt 2-2.jpg'),
(1538, 116, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1539, 116, 'stock_status', 'instock'),
(1540, 116, 'regular_price', '5000'),
(1541, 116, 'sale_price', '3000'),
(1542, 116, 'weight', NULL),
(1543, 116, 'length', NULL),
(1544, 116, 'width', NULL),
(1545, 116, 'height', NULL),
(1546, 116, 'qty', '562'),
(1547, 116, 'alert_qty', '45'),
(1548, 116, 'product_stock', '2000'),
(1549, 116, 'start_stock', '2000'),
(1550, 116, '_sku', '1005435'),
(1551, 116, 'attached_file', '1601884790.jpg'),
(1552, 116, 'gallery_file', 'Tunic 2.jpg'),
(1553, 116, 'gallery_file', 'Tunic 2-2.jpg'),
(1554, 117, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1555, 117, 'stock_status', 'instock'),
(1556, 117, 'regular_price', '5000'),
(1557, 117, 'sale_price', '3000'),
(1558, 117, 'weight', NULL),
(1559, 117, 'length', NULL),
(1560, 117, 'width', NULL),
(1561, 117, 'height', NULL),
(1562, 117, 'qty', '67'),
(1563, 117, 'alert_qty', '12'),
(1564, 117, 'product_stock', '1000'),
(1565, 117, 'start_stock', '1000'),
(1566, 117, '_sku', '1004353'),
(1567, 117, 'attached_file', '1601884896.jpg'),
(1568, 117, 'gallery_file', 'Tunic 2-2.jpg'),
(1569, 117, 'gallery_file', 'Tunic 3.jpg'),
(1570, 117, 'gallery_file', 'Tunic 3-2.jpg'),
(1571, 118, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1572, 118, 'stock_status', 'instock'),
(1573, 118, 'regular_price', '5000'),
(1574, 118, 'sale_price', '3000'),
(1575, 118, 'weight', NULL),
(1576, 118, 'length', NULL),
(1577, 118, 'width', NULL),
(1578, 118, 'height', NULL),
(1579, 118, 'qty', '564'),
(1580, 118, 'alert_qty', '45'),
(1581, 118, 'product_stock', '1000'),
(1582, 118, 'start_stock', '1000'),
(1583, 118, '_sku', '10043543'),
(1584, 118, 'attached_file', '1601884957.jpg'),
(1585, 118, 'gallery_file', 'Tunic 3.jpg'),
(1586, 118, 'gallery_file', 'Tunic 3-2.jpg'),
(1587, 118, 'gallery_file', 'Tunic 4.jpg'),
(1588, 119, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"},{\"taxonomy\":\"pa_color\",\"term\":\"Yellow\"}]'),
(1589, 119, 'stock_status', 'instock'),
(1590, 119, 'regular_price', '5000'),
(1591, 119, 'sale_price', '3000'),
(1592, 119, 'weight', NULL),
(1593, 119, 'length', NULL),
(1594, 119, 'width', NULL),
(1595, 119, 'height', NULL),
(1596, 119, 'qty', '65'),
(1597, 119, 'alert_qty', '6'),
(1598, 119, 'product_stock', '1000'),
(1599, 119, 'start_stock', '1000'),
(1600, 119, '_sku', '1006546'),
(1601, 119, 'attached_file', '1601885048.jpg'),
(1602, 119, 'gallery_file', 'Tunic 3-2.jpg'),
(1603, 119, 'gallery_file', 'Tunic 4.jpg'),
(1604, 119, 'gallery_file', 'Tunic 4-2.jpg'),
(1605, 120, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1606, 120, 'stock_status', 'instock'),
(1607, 120, 'regular_price', '5000'),
(1608, 120, 'sale_price', '3000'),
(1609, 120, 'weight', NULL),
(1610, 120, 'length', NULL),
(1611, 120, 'width', NULL),
(1612, 120, 'height', NULL),
(1613, 120, 'qty', '567'),
(1614, 120, 'alert_qty', '34'),
(1615, 120, 'product_stock', '1000'),
(1616, 120, 'start_stock', '1000'),
(1617, 120, '_sku', '454355345'),
(1618, 120, 'attached_file', '1601885150.jpg'),
(1619, 120, 'gallery_file', 'Tunic 4.jpg'),
(1620, 120, 'gallery_file', 'Tunic 4-2.jpg'),
(1621, 121, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1622, 121, 'stock_status', 'instock'),
(1623, 121, 'regular_price', '5000'),
(1624, 121, 'sale_price', '3000'),
(1625, 121, 'weight', NULL),
(1626, 121, 'length', NULL),
(1627, 121, 'width', NULL),
(1628, 121, 'height', NULL),
(1629, 121, 'qty', '455'),
(1630, 121, 'alert_qty', '34'),
(1631, 121, 'product_stock', '1000'),
(1632, 121, 'start_stock', '1000'),
(1633, 121, '_sku', '100435345'),
(1634, 121, 'attached_file', '1601885239.jpg'),
(1635, 121, 'gallery_file', 'Tunic 4.jpg'),
(1636, 121, 'gallery_file', 'Tunic 4-2.jpg'),
(1637, 122, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1638, 122, 'stock_status', 'instock'),
(1639, 122, 'regular_price', '5000'),
(1640, 122, 'sale_price', '3000'),
(1641, 122, 'weight', NULL),
(1642, 122, 'length', NULL),
(1643, 122, 'width', NULL),
(1644, 122, 'height', NULL),
(1645, 122, 'qty', '452'),
(1646, 122, 'alert_qty', '123'),
(1647, 122, 'product_stock', '1000'),
(1648, 122, 'start_stock', '1000'),
(1649, 122, '_sku', '100345345'),
(1650, 122, 'attached_file', '1601885305.jpg'),
(1651, 122, 'gallery_file', 'Tunic 5.jpg'),
(1652, 122, 'gallery_file', 'Tunic 5-2.jpg'),
(1653, 122, 'gallery_file', 'Tunic 5-3.jpg'),
(1654, 123, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(1655, 123, 'stock_status', 'instock'),
(1656, 123, 'regular_price', '5000'),
(1657, 123, 'sale_price', '3000'),
(1658, 123, 'weight', NULL),
(1659, 123, 'length', NULL),
(1660, 123, 'width', NULL),
(1661, 123, 'height', NULL),
(1662, 123, 'qty', '434'),
(1663, 123, 'alert_qty', '56'),
(1664, 123, 'product_stock', '1000'),
(1665, 123, 'start_stock', '1000'),
(1666, 123, '_sku', '100');
INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1667, 123, 'attached_file', '1601885379.jpg'),
(1668, 123, 'gallery_file', 'Tunic 5.jpg'),
(1669, 123, 'gallery_file', 'Tunic 5-2.jpg'),
(1670, 123, 'gallery_file', 'Tunic 5-3.jpg'),
(2363, 169, 'address_two', NULL),
(2364, 169, 'phone', '6789'),
(2362, 169, 'address_one', 'Uttara'),
(2361, 169, 'last_name', 'Demo'),
(2360, 169, 'first_name', 'Demo'),
(2470, 174, 'alert_qty', '30'),
(2469, 174, 'qty', '40'),
(2468, 174, 'height', NULL),
(2467, 174, 'width', NULL),
(2466, 174, 'length', NULL),
(2465, 174, 'weight', NULL),
(2464, 174, 'sale_price', '3000'),
(2463, 174, 'regular_price', '5000'),
(2462, 174, 'stock_status', 'instock'),
(1688, 125, 'first_name', 'Demo'),
(1689, 125, 'last_name', 'Demo'),
(1690, 125, 'address_one', 'Uttara'),
(1691, 125, 'address_two', NULL),
(1692, 125, 'phone', '0176452345645'),
(1693, 125, 'email', 'demo@email.com'),
(1694, 125, 'country', 'Bangladesh'),
(1695, 125, 'state', 'Dhaka'),
(1696, 125, 'city', 'Dhaka'),
(1697, 125, 'zip', '1205'),
(1698, 125, '_customer_user', '2'),
(1699, 125, '_billing_postcode', '1205'),
(1700, 125, '_billing_company', NULL),
(1701, 125, '_billing_last_name', NULL),
(1702, 125, '_billing_first_name', NULL),
(1703, 126, 'first_name', 'Demo'),
(1704, 126, 'last_name', 'Demo'),
(1705, 126, 'address_one', 'Uttara'),
(1706, 126, 'address_two', NULL),
(1707, 126, 'phone', '6789'),
(1708, 126, 'email', 'demo@email.com'),
(1709, 126, 'country', 'Bangladesh'),
(1710, 126, 'state', 'Dhaka'),
(1711, 126, 'city', 'Dhaka'),
(1712, 126, 'zip', '1205'),
(1713, 126, '_customer_user', '2'),
(1714, 126, '_billing_postcode', '1205'),
(1715, 126, '_billing_company', NULL),
(1716, 126, '_billing_last_name', NULL),
(1717, 126, '_billing_first_name', NULL),
(1718, 126, 'processing_date', '2020-10-05'),
(1719, 127, 'first_name', 'Demo'),
(1720, 127, 'last_name', 'Demo'),
(1721, 127, 'address_one', 'Uttara'),
(1722, 127, 'address_two', NULL),
(1723, 127, 'phone', '6789'),
(1724, 127, 'email', 'demo@email.com'),
(1725, 127, 'country', 'Bangladesh'),
(1726, 127, 'state', 'Dhaka'),
(1727, 127, 'city', 'Dhaka'),
(1728, 127, 'zip', '1205'),
(1729, 127, '_customer_user', '2'),
(1730, 127, '_billing_postcode', '1205'),
(1731, 127, '_billing_company', NULL),
(1732, 127, '_billing_last_name', NULL),
(1733, 127, '_billing_first_name', NULL),
(1759, 129, '_customer_user', '2'),
(1760, 129, '_billing_postcode', '1205'),
(1758, 129, 'zip', '1205'),
(1757, 129, 'city', 'Dhaka'),
(1756, 129, 'state', 'Dhaka'),
(1755, 129, 'country', 'Bangladesh'),
(1754, 129, 'email', 'demo@email.com'),
(1753, 129, 'phone', '6789'),
(1752, 129, 'address_two', NULL),
(1751, 129, 'address_one', 'Uttara'),
(1750, 129, 'last_name', 'Demo'),
(1749, 129, 'first_name', 'Demo'),
(1761, 129, '_billing_company', NULL),
(1762, 129, '_billing_last_name', NULL),
(1763, 129, '_billing_first_name', NULL),
(1791, 132, 'email', 'demo@email.com'),
(1790, 132, 'phone', '6789'),
(1789, 132, 'address_two', NULL),
(1788, 132, 'address_one', 'Uttara'),
(1787, 132, 'last_name', 'Demo'),
(1786, 132, 'first_name', 'Demo'),
(1771, 131, 'first_name', 'Demo'),
(1772, 131, 'last_name', 'Demo'),
(1773, 131, 'address_one', 'Uttara'),
(1774, 131, 'address_two', NULL),
(1775, 131, 'phone', '6789'),
(1776, 131, 'email', 'demo@email.com'),
(1777, 131, 'country', 'Bangladesh'),
(1778, 131, 'state', 'Dhaka'),
(1779, 131, 'city', 'Uttara'),
(1780, 131, 'zip', '1230'),
(1781, 131, '_customer_user', '2'),
(1782, 131, '_billing_postcode', '1230'),
(1783, 131, '_billing_company', NULL),
(1784, 131, '_billing_last_name', NULL),
(1785, 131, '_billing_first_name', NULL),
(1792, 132, 'country', 'Bangladesh'),
(1793, 132, 'state', 'Dhaka'),
(1794, 132, 'city', 'Uttara'),
(1795, 132, 'zip', '1230'),
(1796, 132, '_customer_user', '2'),
(1797, 132, '_billing_postcode', '1230'),
(1798, 132, '_billing_company', NULL),
(1799, 132, '_billing_last_name', NULL),
(1800, 132, '_billing_first_name', NULL),
(1801, 132, 'payment_method', 'cash'),
(1802, 133, 'first_name', 'Demo'),
(1803, 133, 'last_name', 'Demo'),
(1804, 133, 'address_one', 'Uttara'),
(1805, 133, 'address_two', NULL),
(1806, 133, 'phone', '6789'),
(1807, 133, 'email', 'demo@email.com'),
(1808, 133, 'country', 'Bangladesh'),
(1809, 133, 'state', 'Dhaka'),
(1810, 133, 'city', 'Uttara'),
(1811, 133, 'zip', '1230'),
(1812, 133, '_customer_user', '2'),
(1813, 133, '_billing_postcode', '1230'),
(1814, 133, '_billing_company', NULL),
(1815, 133, '_billing_last_name', NULL),
(1816, 133, '_billing_first_name', NULL),
(1817, 133, 'payment_method', 'cash'),
(1818, 134, 'first_name', 'Demo'),
(1819, 134, 'last_name', 'Demo'),
(1820, 134, 'address_one', 'Uttara'),
(1821, 134, 'address_two', NULL),
(1822, 134, 'phone', '6789'),
(1823, 134, 'email', 'demo@email.com'),
(1824, 134, 'country', 'Bangladesh'),
(1825, 134, 'state', 'Dhaka'),
(1826, 134, 'city', 'Uttara'),
(1827, 134, 'zip', '1230'),
(1828, 134, '_customer_user', '2'),
(1829, 134, '_billing_postcode', '1230'),
(1830, 134, '_billing_company', NULL),
(1831, 134, '_billing_last_name', NULL),
(1832, 134, '_billing_first_name', NULL),
(1833, 134, 'payment_method', 'cash'),
(1834, 135, 'first_name', 'Demo'),
(1835, 135, 'last_name', 'Demo'),
(1836, 135, 'address_one', 'Uttara'),
(1837, 135, 'address_two', NULL),
(1838, 135, 'phone', '6789'),
(1839, 135, 'email', 'demo@email.com'),
(1840, 135, 'country', 'Bangladesh'),
(1841, 135, 'state', 'Dhaka'),
(1842, 135, 'city', 'Uttara'),
(1843, 135, 'zip', '1230'),
(1844, 135, '_customer_user', '2'),
(1845, 135, '_billing_postcode', '1230'),
(1846, 135, '_billing_company', NULL),
(1847, 135, '_billing_last_name', NULL),
(1848, 135, '_billing_first_name', NULL),
(1849, 135, 'payment_method', 'cash'),
(1850, 136, 'first_name', 'Demo'),
(1851, 136, 'last_name', 'Demo'),
(1852, 136, 'address_one', 'Uttara'),
(1853, 136, 'address_two', NULL),
(1854, 136, 'phone', '6789'),
(1855, 136, 'email', 'demo@email.com'),
(1856, 136, 'country', 'Bangladesh'),
(1857, 136, 'state', 'Dhaka'),
(1858, 136, 'city', 'Uttara'),
(1859, 136, 'zip', '1230'),
(1860, 136, '_customer_user', '2'),
(1861, 136, '_billing_postcode', '1230'),
(1862, 136, '_billing_company', NULL),
(1863, 136, '_billing_last_name', NULL),
(1864, 136, '_billing_first_name', NULL),
(1865, 136, 'payment_method', 'cash'),
(1866, 137, 'first_name', 'Demo'),
(1867, 137, 'last_name', 'Demo'),
(1868, 137, 'address_one', 'Uttara'),
(1869, 137, 'address_two', NULL),
(1870, 137, 'phone', '6789'),
(1871, 137, 'email', 'demo@email.com'),
(1872, 137, 'country', 'Bangladesh'),
(1873, 137, 'state', 'Sylhet'),
(1874, 137, 'city', 'Badda'),
(1875, 137, 'zip', '1212'),
(1876, 137, '_customer_user', '2'),
(1877, 137, '_billing_postcode', '1212'),
(1878, 137, '_billing_company', NULL),
(1879, 137, '_billing_last_name', NULL),
(1880, 137, '_billing_first_name', NULL),
(1881, 137, 'payment_method', 'cash'),
(1882, 138, 'first_name', 'Demo'),
(1883, 138, 'last_name', 'Demo'),
(1884, 138, 'address_one', 'Uttara'),
(1885, 138, 'address_two', NULL),
(1886, 138, 'phone', '6789'),
(1887, 138, 'email', 'demo@email.com'),
(1888, 138, 'country', 'Bangladesh'),
(1889, 138, 'state', 'Dhaka'),
(1890, 138, 'city', 'Uttara'),
(1891, 138, 'zip', '1230'),
(1892, 138, '_customer_user', '2'),
(1893, 138, '_billing_postcode', '1230'),
(1894, 138, '_billing_company', NULL),
(1895, 138, '_billing_last_name', NULL),
(1896, 138, '_billing_first_name', NULL),
(1897, 138, 'payment_method', 'cash'),
(1898, 139, 'first_name', 'Demo'),
(1899, 139, 'last_name', 'Demo'),
(1900, 139, 'address_one', 'Uttara'),
(1901, 139, 'address_two', NULL),
(1902, 139, 'phone', '6789'),
(1903, 139, 'email', 'demo@email.com'),
(1904, 139, 'country', 'Bangladesh'),
(1905, 139, 'state', 'Dhaka'),
(1906, 139, 'city', 'Uttara'),
(1907, 139, 'zip', '1230'),
(1908, 139, '_customer_user', '2'),
(1909, 139, '_billing_postcode', '1230'),
(1910, 139, '_billing_company', NULL),
(1911, 139, '_billing_last_name', NULL),
(1912, 139, '_billing_first_name', NULL),
(1913, 139, 'payment_method', 'cash'),
(1914, 140, 'first_name', 'Demo'),
(1915, 140, 'last_name', 'Demo'),
(1916, 140, 'address_one', 'Uttara'),
(1917, 140, 'address_two', NULL),
(1918, 140, 'phone', '6789'),
(1919, 140, 'email', 'demo@email.com'),
(1920, 140, 'country', 'Bangladesh'),
(1921, 140, 'state', 'Dhaka'),
(1922, 140, 'city', 'Uttara'),
(1923, 140, 'zip', '1230'),
(1924, 140, '_customer_user', '2'),
(1925, 140, '_billing_postcode', '1230'),
(1926, 140, '_billing_company', NULL),
(1927, 140, '_billing_last_name', NULL),
(1928, 140, '_billing_first_name', NULL),
(1929, 140, 'payment_method', 'cash'),
(1930, 141, 'first_name', 'Demo'),
(1931, 141, 'last_name', 'Demo'),
(1932, 141, 'address_one', 'Uttara'),
(1933, 141, 'address_two', NULL),
(1934, 141, 'phone', '6789'),
(1935, 141, 'email', 'demo@email.com'),
(1936, 141, 'country', 'Bangladesh'),
(1937, 141, 'state', 'Dhaka'),
(1938, 141, 'city', 'Uttara'),
(1939, 141, 'zip', '1230'),
(1940, 141, '_customer_user', '2'),
(1941, 141, '_billing_postcode', '1230'),
(1942, 141, '_billing_company', NULL),
(1943, 141, '_billing_last_name', NULL),
(1944, 141, '_billing_first_name', NULL),
(1945, 141, 'payment_method', 'cash'),
(1946, 142, 'first_name', 'Demo'),
(1947, 142, 'last_name', 'Demo'),
(1948, 142, 'address_one', 'Uttara'),
(1949, 142, 'address_two', NULL),
(1950, 142, 'phone', '6789'),
(1951, 142, 'email', 'parthokar90@gmail.com'),
(1952, 142, 'country', 'Bangladesh'),
(1953, 142, 'state', 'Dhaka'),
(1954, 142, 'city', 'Uttara'),
(1955, 142, 'zip', '1230'),
(1956, 142, '_customer_user', '2'),
(1957, 142, '_billing_postcode', '1230'),
(1958, 142, '_billing_company', NULL),
(1959, 142, '_billing_last_name', NULL),
(1960, 142, '_billing_first_name', NULL),
(1961, 142, 'payment_method', 'cash'),
(1962, 143, 'first_name', 'Demo'),
(1963, 143, 'last_name', 'Demo'),
(1964, 143, 'address_one', 'Uttara'),
(1965, 143, 'address_two', NULL),
(1966, 143, 'phone', '6789'),
(1967, 143, 'email', 'parthokar@email.com'),
(1968, 143, 'country', 'Bangladesh'),
(1969, 143, 'state', 'Dhaka'),
(1970, 143, 'city', 'Uttara'),
(1971, 143, 'zip', '1230'),
(1972, 143, '_customer_user', '2'),
(1973, 143, '_billing_postcode', '1230'),
(1974, 143, '_billing_company', NULL),
(1975, 143, '_billing_last_name', NULL),
(1976, 143, '_billing_first_name', NULL),
(1977, 143, 'payment_method', 'cash'),
(1978, 144, 'first_name', 'Demo'),
(1979, 144, 'last_name', 'Demo'),
(1980, 144, 'address_one', 'Uttara'),
(1981, 144, 'address_two', NULL),
(1982, 144, 'phone', '6789'),
(1983, 144, 'email', 'parthokar90@gmail.com'),
(1984, 144, 'country', 'Bangladesh'),
(1985, 144, 'state', 'Dhaka'),
(1986, 144, 'city', 'Uttara'),
(1987, 144, 'zip', '1230'),
(1988, 144, '_customer_user', '2'),
(1989, 144, '_billing_postcode', '1230'),
(1990, 144, '_billing_company', NULL),
(1991, 144, '_billing_last_name', NULL),
(1992, 144, '_billing_first_name', NULL),
(1993, 144, 'payment_method', 'cash'),
(1994, 145, 'first_name', 'Demo'),
(1995, 145, 'last_name', 'Demo'),
(1996, 145, 'address_one', 'Uttara'),
(1997, 145, 'address_two', NULL),
(1998, 145, 'phone', '6789'),
(1999, 145, 'email', 'parthokar90@gmail.com'),
(2000, 145, 'country', 'Bangladesh'),
(2001, 145, 'state', 'Dhaka'),
(2002, 145, 'city', 'Uttara'),
(2003, 145, 'zip', '1230'),
(2004, 145, '_customer_user', '2'),
(2005, 145, '_billing_postcode', '1230'),
(2006, 145, '_billing_company', NULL),
(2007, 145, '_billing_last_name', NULL),
(2008, 145, '_billing_first_name', NULL),
(2009, 145, 'payment_method', 'cash'),
(2010, 146, 'first_name', 'Demo'),
(2011, 146, 'last_name', 'Demo'),
(2012, 146, 'address_one', 'Uttara'),
(2013, 146, 'address_two', NULL),
(2014, 146, 'phone', '6789'),
(2015, 146, 'email', 'demo@email.com'),
(2016, 146, 'country', 'Bangladesh'),
(2017, 146, 'state', 'Dhaka'),
(2018, 146, 'city', 'Uttara'),
(2019, 146, 'zip', '1230'),
(2020, 146, '_customer_user', '2'),
(2021, 146, '_billing_postcode', '1230'),
(2022, 146, '_billing_company', NULL),
(2023, 146, '_billing_last_name', NULL),
(2024, 146, '_billing_first_name', NULL),
(2025, 146, 'payment_method', 'cash'),
(2026, 147, 'first_name', 'Demo'),
(2027, 147, 'last_name', 'Demo'),
(2028, 147, 'address_one', 'Uttara'),
(2029, 147, 'address_two', NULL),
(2030, 147, 'phone', '6789'),
(2031, 147, 'email', 'demo@email.com'),
(2032, 147, 'country', 'Bangladesh'),
(2033, 147, 'state', 'Dhaka'),
(2034, 147, 'city', 'Uttara'),
(2035, 147, 'zip', '1230'),
(2036, 147, '_customer_user', '2'),
(2037, 147, '_billing_postcode', '1230'),
(2038, 147, '_billing_company', NULL),
(2039, 147, '_billing_last_name', NULL),
(2040, 147, '_billing_first_name', NULL),
(2041, 147, 'payment_method', 'cash'),
(2042, 148, 'first_name', 'Demo'),
(2043, 148, 'last_name', 'Demo'),
(2044, 148, 'address_one', 'Uttara'),
(2045, 148, 'address_two', NULL),
(2046, 148, 'phone', '6789'),
(2047, 148, 'email', 'parthokar90@gmail.com'),
(2048, 148, 'country', 'Bangladesh'),
(2049, 148, 'state', 'Dhaka'),
(2050, 148, 'city', 'Uttara'),
(2051, 148, 'zip', '1230'),
(2052, 148, '_customer_user', '2'),
(2053, 148, '_billing_postcode', '1230'),
(2054, 148, '_billing_company', NULL),
(2055, 148, '_billing_last_name', NULL),
(2056, 148, '_billing_first_name', NULL),
(2057, 148, 'payment_method', 'cash'),
(2058, 149, 'first_name', 'Demo'),
(2059, 149, 'last_name', 'Demo'),
(2060, 149, 'address_one', 'Uttara'),
(2061, 149, 'address_two', NULL),
(2062, 149, 'phone', '6789'),
(2063, 149, 'email', 'partho@itebd.com'),
(2064, 149, 'country', 'Bangladesh'),
(2065, 149, 'state', 'Dhaka'),
(2066, 149, 'city', 'Uttara'),
(2067, 149, 'zip', '1230'),
(2068, 149, '_customer_user', '2'),
(2069, 149, '_billing_postcode', '1230'),
(2070, 149, '_billing_company', NULL),
(2071, 149, '_billing_last_name', NULL),
(2072, 149, '_billing_first_name', NULL),
(2073, 149, 'payment_method', 'cash'),
(2074, 150, 'first_name', 'Test'),
(2075, 150, 'last_name', 'dfgdfg'),
(2076, 150, 'address_one', 'dfgfdg'),
(2077, 150, 'address_two', NULL),
(2078, 150, 'phone', '435435435'),
(2079, 150, 'email', 'partho@itebd.com'),
(2080, 150, 'country', 'Bangladesh'),
(2081, 150, 'state', 'Dhaka'),
(2082, 150, 'city', 'Uttara'),
(2083, 150, 'zip', '1230'),
(2084, 150, '_customer_user', '0'),
(2085, 150, '_billing_postcode', '1230'),
(2086, 150, '_billing_company', NULL),
(2087, 150, '_billing_last_name', NULL),
(2088, 150, '_billing_first_name', NULL),
(2089, 150, 'payment_method', 'cash'),
(2090, 151, 'first_name', 'Demo'),
(2091, 151, 'last_name', 'Demo'),
(2092, 151, 'address_one', 'Uttara'),
(2093, 151, 'address_two', NULL),
(2094, 151, 'phone', '6789'),
(2095, 151, 'email', 'partho@itebd.com'),
(2096, 151, 'country', 'Bangladesh'),
(2097, 151, 'state', 'Dhaka'),
(2098, 151, 'city', 'Uttara'),
(2099, 151, 'zip', '1230'),
(2100, 151, '_customer_user', '2'),
(2101, 151, '_billing_postcode', '1230'),
(2102, 151, '_billing_company', NULL),
(2103, 151, '_billing_last_name', NULL),
(2104, 151, '_billing_first_name', NULL),
(2105, 151, 'payment_method', 'cash'),
(2106, 152, 'first_name', 'Demo'),
(2107, 152, 'last_name', 'Demo'),
(2108, 152, 'address_one', 'Uttara'),
(2109, 152, 'address_two', NULL),
(2110, 152, 'phone', '6789'),
(2111, 152, 'email', 'demo@email.com'),
(2112, 152, 'country', 'Bangladesh'),
(2113, 152, 'state', 'Dhaka'),
(2114, 152, 'city', 'Uttara'),
(2115, 152, 'zip', '1230'),
(2116, 152, '_customer_user', '2'),
(2117, 152, '_billing_postcode', '1230'),
(2118, 152, '_billing_company', NULL),
(2119, 152, '_billing_last_name', NULL),
(2120, 152, '_billing_first_name', NULL),
(2121, 152, 'payment_method', 'cash'),
(2122, 153, 'first_name', 'Demo'),
(2123, 153, 'last_name', 'Demo'),
(2124, 153, 'address_one', 'Uttara'),
(2125, 153, 'address_two', NULL),
(2126, 153, 'phone', '6789'),
(2127, 153, 'email', 'demo@email.com'),
(2128, 153, 'country', 'Bangladesh'),
(2129, 153, 'state', 'Dhaka'),
(2130, 153, 'city', 'Uttara'),
(2131, 153, 'zip', '1230'),
(2132, 153, '_customer_user', '2'),
(2133, 153, '_billing_postcode', '1230'),
(2134, 153, '_billing_company', NULL),
(2135, 153, '_billing_last_name', NULL),
(2136, 153, '_billing_first_name', NULL),
(2137, 153, 'payment_method', 'cash'),
(2138, 154, 'first_name', 'Demo'),
(2139, 154, 'last_name', 'Demo'),
(2140, 154, 'address_one', 'Uttara'),
(2141, 154, 'address_two', NULL),
(2142, 154, 'phone', '6789'),
(2143, 154, 'email', 'demo@email.com'),
(2144, 154, 'country', 'Bangladesh'),
(2145, 154, 'state', 'Dhaka'),
(2146, 154, 'city', 'Uttara'),
(2147, 154, 'zip', '1230'),
(2148, 154, '_customer_user', '2'),
(2149, 154, '_billing_postcode', '1230'),
(2150, 154, '_billing_company', NULL),
(2151, 154, '_billing_last_name', NULL),
(2152, 154, '_billing_first_name', NULL),
(2153, 154, 'payment_method', 'cash'),
(2154, 155, 'first_name', 'Demo'),
(2155, 155, 'last_name', 'Demo'),
(2156, 155, 'address_one', 'Uttara'),
(2157, 155, 'address_two', NULL),
(2158, 155, 'phone', '6789'),
(2159, 155, 'email', 'demo@email.com'),
(2160, 155, 'country', 'Bangladesh'),
(2161, 155, 'state', 'Dhaka'),
(2162, 155, 'city', 'Uttara'),
(2163, 155, 'zip', '1230'),
(2164, 155, '_customer_user', '2'),
(2165, 155, '_billing_postcode', '1230'),
(2166, 155, '_billing_company', NULL),
(2167, 155, '_billing_last_name', NULL),
(2168, 155, '_billing_first_name', NULL),
(2169, 155, 'payment_method', 'cash'),
(2170, 156, 'first_name', 'Demo'),
(2171, 156, 'last_name', 'Demo'),
(2172, 156, 'address_one', 'Uttara'),
(2173, 156, 'address_two', NULL),
(2174, 156, 'phone', '6789'),
(2175, 156, 'email', 'demo@email.com'),
(2176, 156, 'country', 'Bangladesh'),
(2177, 156, 'state', 'Dhaka'),
(2178, 156, 'city', 'Uttara'),
(2179, 156, 'zip', '1230'),
(2180, 156, '_customer_user', '2'),
(2181, 156, '_billing_postcode', '1230'),
(2182, 156, '_billing_company', NULL),
(2183, 156, '_billing_last_name', NULL),
(2184, 156, '_billing_first_name', NULL),
(2185, 156, 'payment_method', 'cash'),
(2186, 0, 'product_cancel_comment', NULL),
(2188, 0, 'product_cancel_comment', NULL),
(2189, 0, 'product_cancel_comment', NULL),
(2190, 157, 'first_name', 'Demo'),
(2191, 157, 'last_name', 'Demo'),
(2192, 157, 'address_one', 'Uttara'),
(2193, 157, 'address_two', NULL),
(2194, 157, 'phone', '6789'),
(2195, 157, 'email', 'demo@email.com'),
(2196, 157, 'country', 'Bangladesh'),
(2197, 157, 'state', 'Dhaka'),
(2198, 157, 'city', 'Uttara'),
(2199, 157, 'zip', '1230'),
(2200, 157, '_customer_user', '2'),
(2201, 157, '_billing_postcode', '1230'),
(2202, 157, '_billing_company', NULL),
(2203, 157, '_billing_last_name', NULL),
(2204, 157, '_billing_first_name', NULL),
(2205, 157, 'payment_method', 'cash'),
(2206, 158, 'first_name', 'Demo'),
(2207, 158, 'last_name', 'Demo'),
(2208, 158, 'address_one', 'Uttara'),
(2209, 158, 'address_two', NULL),
(2210, 158, 'phone', '6789'),
(2211, 158, 'email', 'demo@email.com'),
(2212, 158, 'country', 'Bangladesh'),
(2213, 158, 'state', 'Dhaka'),
(2214, 158, 'city', 'Uttara'),
(2215, 158, 'zip', '1230'),
(2216, 158, '_customer_user', '2'),
(2217, 158, '_billing_postcode', '1230'),
(2218, 158, '_billing_company', NULL),
(2219, 158, '_billing_last_name', NULL),
(2220, 158, '_billing_first_name', NULL),
(2221, 158, 'payment_method', 'cash'),
(2222, 159, 'first_name', 'Demo'),
(2223, 159, 'last_name', 'Demo'),
(2224, 159, 'address_one', 'Uttara'),
(2225, 159, 'address_two', NULL),
(2226, 159, 'phone', '6789'),
(2227, 159, 'email', 'demo@email.com'),
(2228, 159, 'country', 'Bangladesh'),
(2229, 159, 'state', 'Dhaka'),
(2230, 159, 'city', 'Uttara'),
(2231, 159, 'zip', '1230'),
(2232, 159, '_customer_user', '2'),
(2233, 159, '_billing_postcode', '1230'),
(2234, 159, '_billing_company', NULL),
(2235, 159, '_billing_last_name', NULL),
(2236, 159, '_billing_first_name', NULL),
(2237, 159, 'payment_method', 'cash'),
(2238, 160, 'first_name', 'Demo'),
(2239, 160, 'last_name', 'Demo'),
(2240, 160, 'address_one', 'Uttara'),
(2241, 160, 'address_two', NULL),
(2242, 160, 'phone', '6789'),
(2243, 160, 'email', 'demo@email.com'),
(2244, 160, 'country', 'Bangladesh'),
(2245, 160, 'state', 'Dhaka'),
(2246, 160, 'city', 'Uttara'),
(2247, 160, 'zip', '1230'),
(2248, 160, '_customer_user', '2'),
(2249, 160, '_billing_postcode', '1230'),
(2250, 160, '_billing_company', NULL),
(2251, 160, '_billing_last_name', NULL),
(2252, 160, '_billing_first_name', NULL),
(2253, 160, 'payment_method', 'cash'),
(2254, 161, 'first_name', 'Demo'),
(2255, 161, 'last_name', 'Demo'),
(2256, 161, 'address_one', 'Uttara'),
(2257, 161, 'address_two', NULL),
(2258, 161, 'phone', '6789'),
(2259, 161, 'email', 'demo@email.com'),
(2260, 161, 'country', 'Bangladesh'),
(2261, 161, 'state', 'Dhaka'),
(2262, 161, 'city', 'Uttara'),
(2263, 161, 'zip', '1230'),
(2264, 161, '_customer_user', '2'),
(2265, 161, '_billing_postcode', '1230'),
(2266, 161, '_billing_company', NULL),
(2267, 161, '_billing_last_name', NULL),
(2268, 161, '_billing_first_name', NULL),
(2269, 161, 'payment_method', 'cash'),
(2270, 162, 'first_name', 'Demo'),
(2271, 162, 'last_name', 'Demo'),
(2272, 162, 'address_one', 'Uttara'),
(2273, 162, 'address_two', NULL),
(2274, 162, 'phone', '6789'),
(2275, 162, 'email', 'demo@email.com'),
(2276, 162, 'country', 'Bangladesh'),
(2277, 162, 'state', 'Dhaka'),
(2278, 162, 'city', 'Uttara'),
(2279, 162, 'zip', '1230'),
(2280, 162, '_customer_user', '2'),
(2281, 162, '_billing_postcode', '1230'),
(2282, 162, '_billing_company', NULL),
(2283, 162, '_billing_last_name', NULL),
(2284, 162, '_billing_first_name', NULL),
(2285, 162, 'payment_method', 'cash'),
(2286, 163, 'first_name', 'Demo'),
(2287, 163, 'last_name', 'Demo'),
(2288, 163, 'address_one', 'Uttara'),
(2289, 163, 'address_two', NULL),
(2290, 163, 'phone', '6789'),
(2291, 163, 'email', 'demo@email.com'),
(2292, 163, 'country', 'Bangladesh'),
(2293, 163, 'state', 'Dhaka'),
(2294, 163, 'city', 'Uttara'),
(2295, 163, 'zip', '1230'),
(2296, 163, '_customer_user', '2'),
(2297, 163, '_billing_postcode', '1230'),
(2298, 163, '_billing_company', NULL),
(2299, 163, '_billing_last_name', NULL),
(2300, 163, '_billing_first_name', NULL),
(2301, 163, 'payment_method', 'cash'),
(2302, 164, 'first_name', 'Demo'),
(2303, 164, 'last_name', 'Demo'),
(2304, 164, 'address_one', 'Uttara'),
(2305, 164, 'address_two', NULL),
(2306, 164, 'phone', '6789'),
(2307, 164, 'email', 'demo@email.com'),
(2308, 164, 'country', 'Bangladesh'),
(2309, 164, 'state', 'Dhaka'),
(2310, 164, 'city', 'Uttara'),
(2311, 164, 'zip', '1230'),
(2312, 164, '_customer_user', '2'),
(2313, 164, '_billing_postcode', '1230'),
(2314, 164, '_billing_company', NULL),
(2315, 164, '_billing_last_name', NULL),
(2316, 164, '_billing_first_name', NULL),
(2317, 164, 'payment_method', 'cash'),
(2449, 172, 'payment_method', 'cash'),
(2461, 174, 'default_attribute', '[{\"taxonomy\":\"pa_color\",\"term\":\"Blue\"}]'),
(2471, 174, 'product_stock', '2000'),
(2472, 174, 'start_stock', '2000'),
(2473, 174, '_sku', '4521'),
(2474, 174, 'attached_file', '1602497289.jpg'),
(2475, 174, 'gallery_file', 'Tunic 5.jpg'),
(2476, 174, 'gallery_file', 'Tunic 5-2.jpg'),
(2477, 174, 'gallery_file', 'Tunic 5-3.jpg');

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
(72, 1, '2020-10-05 12:27:00', '2020-10-05 18:27:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Scarve 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Scarve 2', '', '', '2020-10-05 12:28:49', '2020-10-05 12:28:49', '', 0, '', 0, 'product', '', 0),
(73, 1, '2020-10-05 12:29:00', '2020-10-05 18:29:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Sunglases 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Sunglases 1', '', '', '2020-10-05 12:30:09', '2020-10-05 12:30:09', '', 0, '', 0, 'product', '', 0),
(74, 1, '2020-10-05 12:31:00', '2020-10-05 18:31:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Crossbody bag 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Crossbody bag 1', '', '', '2020-10-05 12:32:40', '2020-10-05 12:32:40', '', 0, '', 0, 'product', '', 0),
(35, 1, '2020-09-26 17:50:00', '2020-09-26 23:50:00', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Burger', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'deleted', 'open', 'open', '', 'Burger', '', '', '2020-09-29 00:00:00', '2020-09-29 13:47:28', '', 0, '', 0, 'deleted', '', 0),
(39, 1, '2020-09-29 15:51:00', '2020-09-29 21:51:00', '<p>dsfdsfsdf</p>', 'Saiful', '<p>sdafdsfdsf</p>', 'deleted', 'open', 'open', '', 'Saiful', '', '', '2020-09-29 00:00:00', '2020-09-29 15:51:53', '', 0, '', 0, 'deleted', '', 0),
(71, 1, '2020-10-05 12:26:00', '2020-10-05 18:26:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Scarve 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Scarve 1', '', '', '2020-10-05 12:27:37', '2020-10-05 12:27:37', '', 0, '', 0, 'product', '', 0),
(16, 1, '2020-09-27 13:36:00', '2020-09-27 19:36:00', 'Banner Image', 'Banner Image', 'Banner Image', 'publish', 'open', 'open', '', 'Banner Image', '', '', '2020-09-27 00:00:00', '2020-09-27 13:36:49', '', 0, '', 0, 'banner', '', 0),
(70, 1, '2020-10-05 12:23:00', '2020-10-05 18:23:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Belt 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Belt 1', '', '', '2020-10-05 12:25:56', '2020-10-05 12:25:56', '', 0, '', 0, 'product', '', 0),
(75, 1, '2020-10-05 12:32:00', '2020-10-05 18:32:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Crossbody bag 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Crossbody bag 2', '', '', '2020-10-05 12:34:17', '2020-10-05 12:34:17', '', 0, '', 0, 'product', '', 0),
(76, 1, '2020-10-05 12:34:00', '2020-10-05 18:34:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Crossbody bag 2-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Crossbody bag 2-2', '', '', '2020-10-05 12:36:08', '2020-10-05 12:36:08', '', 0, '', 0, 'product', '', 0),
(77, 1, '2020-10-05 12:36:00', '2020-10-05 18:36:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Purse 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Purse 1', '', '', '2020-10-05 12:37:03', '2020-10-05 12:37:03', '', 0, '', 0, 'product', '', 0),
(78, 1, '2020-10-05 12:37:00', '2020-10-05 18:37:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'purse 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'purse 2', '', '', '2020-10-05 12:37:59', '2020-10-05 12:37:59', '', 0, '', 0, 'product', '', 0),
(79, 1, '2020-10-05 12:38:00', '2020-10-05 18:38:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tote bag 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tote bag 2', '', '', '2020-10-05 12:39:51', '2020-10-05 12:39:51', '', 0, '', 0, 'product', '', 0),
(80, 1, '2020-10-05 12:40:00', '2020-10-05 18:40:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tote bag 3', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tote bag 3', '', '', '2020-10-05 12:41:05', '2020-10-05 12:41:05', '', 0, '', 0, 'product', '', 0),
(81, 1, '2020-10-05 12:41:00', '2020-10-05 18:41:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tote bag 4', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tote bag 4', '', '', '2020-10-05 12:43:00', '2020-10-05 12:43:00', '', 0, '', 0, 'product', '', 0),
(82, 1, '2020-10-05 12:46:00', '2020-10-05 18:46:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Jeans 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Jeans 1', '', '', '2020-10-05 12:47:22', '2020-10-05 12:47:22', '', 0, '', 0, 'product', '', 0),
(83, 1, '2020-10-05 12:50:00', '2020-10-05 18:50:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Jeans 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Jeans 2', '', '', '2020-10-05 12:52:01', '2020-10-05 12:52:01', '', 0, '', 0, 'product', '', 0),
(84, 1, '2020-10-05 12:52:00', '2020-10-05 18:52:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Jeans 2-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Jeans 2-2', '', '', '2020-10-05 12:54:20', '2020-10-05 12:54:20', '', 0, '', 0, 'product', '', 0),
(85, 1, '2020-10-05 12:54:00', '2020-10-05 18:54:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'leggings 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'leggings 1', '', '', '2020-10-05 12:55:50', '2020-10-05 12:55:50', '', 0, '', 0, 'product', '', 0),
(86, 1, '2020-10-05 12:56:00', '2020-10-05 18:56:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'leggings 1-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'leggings 1-2', '', '', '2020-10-05 12:57:29', '2020-10-05 12:57:29', '', 0, '', 0, 'product', '', 0),
(87, 1, '2020-10-05 12:57:00', '2020-10-05 18:57:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'skirt 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'skirt 1', '', '', '2020-10-05 12:58:50', '2020-10-05 12:58:50', '', 0, '', 0, 'product', '', 0),
(88, 1, '2020-10-05 12:59:00', '2020-10-05 18:59:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'skirt 1-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'skirt 1-2', '', '', '2020-10-05 13:01:06', '2020-10-05 13:01:06', '', 0, '', 0, 'product', '', 0),
(89, 1, '2020-10-05 13:01:00', '2020-10-05 19:01:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'skirt 1-3', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'skirt 1-3', '', '', '2020-10-05 13:02:33', '2020-10-05 13:02:33', '', 0, '', 0, 'product', '', 0),
(90, 1, '2020-10-05 13:03:00', '2020-10-05 19:03:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Bras 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Bras 1', '', '', '2020-10-05 13:05:04', '2020-10-05 13:05:04', '', 0, '', 0, 'product', '', 0),
(91, 1, '2020-10-05 13:05:00', '2020-10-05 19:05:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Bras and Panties set 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Bras and Panties set 1', '', '', '2020-10-05 13:06:56', '2020-10-05 13:06:56', '', 0, '', 0, 'product', '', 0),
(92, 1, '2020-10-05 13:07:00', '2020-10-05 19:07:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Panties 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Panties 1', '', '', '2020-10-05 13:08:24', '2020-10-05 13:08:24', '', 0, '', 0, 'product', '', 0),
(93, 1, '2020-10-05 13:09:00', '2020-10-05 19:09:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Sleepwear 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Sleepwear 1', '', '', '2020-10-05 13:10:51', '2020-10-05 13:10:51', '', 0, '', 0, 'product', '', 0),
(94, 1, '2020-10-05 13:12:00', '2020-10-05 19:12:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Bracelet 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Bracelet 1', '', '', '2020-10-05 13:13:46', '2020-10-05 13:13:46', '', 0, '', 0, 'product', '', 0),
(95, 1, '2020-10-05 13:13:00', '2020-10-05 19:13:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Earring 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Earring 1', '', '', '2020-10-05 13:15:06', '2020-10-05 13:15:06', '', 0, '', 0, 'product', '', 0),
(96, 1, '2020-10-05 13:15:00', '2020-10-05 19:15:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Earring 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Earring 2', '', '', '2020-10-05 13:17:38', '2020-10-05 13:17:38', '', 0, '', 0, 'product', '', 0),
(97, 1, '2020-10-05 13:17:00', '2020-10-05 19:17:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Necklace 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Necklace 2', '', '', '2020-10-05 13:19:07', '2020-10-05 13:19:07', '', 0, '', 0, 'product', '', 0),
(98, 1, '2020-10-05 13:19:00', '2020-10-05 19:19:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Necklace 3', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Necklace 3', '', '', '2020-10-05 13:21:31', '2020-10-05 13:21:31', '', 0, '', 0, 'product', '', 0),
(99, 1, '2020-10-05 13:22:00', '2020-10-05 19:22:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 1', '', '', '2020-10-05 13:23:58', '2020-10-05 13:23:58', '', 0, '', 0, 'product', '', 0),
(100, 1, '2020-10-05 13:24:00', '2020-10-05 19:24:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 1-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 1-2', '', '', '2020-10-05 13:25:17', '2020-10-05 13:25:17', '', 0, '', 0, 'product', '', 0),
(101, 1, '2020-10-05 13:26:00', '2020-10-05 19:26:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 2', '', '', '2020-10-05 13:28:10', '2020-10-05 13:28:10', '', 0, '', 0, 'product', '', 0);
INSERT INTO `posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(102, 1, '2020-10-05 13:28:00', '2020-10-05 19:28:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 3', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 3', '', '', '2020-10-05 13:29:35', '2020-10-05 13:29:35', '', 0, '', 0, 'product', '', 0),
(103, 1, '2020-10-05 13:29:00', '2020-10-05 19:29:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 3-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 3-2', '', '', '2020-10-05 13:30:57', '2020-10-05 13:30:57', '', 0, '', 0, 'product', '', 0),
(104, 1, '2020-10-05 13:31:00', '2020-10-05 19:31:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 4', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 4', '', '', '2020-10-05 13:32:41', '2020-10-05 13:32:41', '', 0, '', 0, 'product', '', 0),
(105, 1, '2020-10-05 13:33:00', '2020-10-05 19:33:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Dresses 4-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Dresses 4-2', '', '', '2020-10-05 13:34:35', '2020-10-05 13:34:35', '', 0, '', 0, 'product', '', 0),
(106, 1, '2020-10-05 13:34:00', '2020-10-05 19:34:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 1', '', '', '2020-10-05 13:39:01', '2020-10-05 13:39:01', '', 0, '', 0, 'product', '', 0),
(107, 1, '2020-10-05 13:39:00', '2020-10-05 19:39:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 1-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 1-2', '', '', '2020-10-05 13:41:39', '2020-10-05 13:41:39', '', 0, '', 0, 'product', '', 0),
(108, 1, '2020-10-05 13:41:00', '2020-10-05 19:41:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 2', '', '', '2020-10-05 13:42:55', '2020-10-05 13:42:55', '', 0, '', 0, 'product', '', 0),
(110, 1, '2020-10-05 13:44:00', '2020-10-05 19:44:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 2-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 2-2', '', '', '2020-10-05 13:47:05', '2020-10-05 13:47:05', '', 0, '', 0, 'product', '', 0),
(111, 1, '2020-10-05 13:47:00', '2020-10-05 19:47:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 3', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 3', '', '', '2020-10-05 13:48:09', '2020-10-05 13:48:09', '', 0, '', 0, 'product', '', 0),
(112, 1, '2020-10-05 13:48:00', '2020-10-05 19:48:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 3-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 3-2', '', '', '2020-10-05 13:49:08', '2020-10-05 13:49:08', '', 0, '', 0, 'product', '', 0),
(113, 1, '2020-10-05 13:49:00', '2020-10-05 19:49:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 1', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 1', '', '', '2020-10-05 13:51:17', '2020-10-05 13:51:17', '', 0, '', 0, 'product', '', 0),
(114, 1, '2020-10-05 13:51:00', '2020-10-05 19:51:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 1-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 1-2', '', '', '2020-10-05 13:52:40', '2020-10-05 13:52:40', '', 0, '', 0, 'product', '', 0),
(115, 1, '2020-10-05 13:53:00', '2020-10-05 19:53:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tshirt 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tshirt 2', '', '', '2020-10-05 13:54:42', '2020-10-05 13:54:42', '', 0, '', 0, 'product', '', 0),
(116, 1, '2020-10-05 13:58:00', '2020-10-05 19:58:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 2', '', '', '2020-10-05 13:59:50', '2020-10-05 13:59:50', '', 0, '', 0, 'product', '', 0),
(117, 1, '2020-10-05 13:59:00', '2020-10-05 19:59:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 2-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 2-2', '', '', '2020-10-05 14:01:36', '2020-10-05 14:01:36', '', 0, '', 0, 'product', '', 0),
(118, 1, '2020-10-05 14:01:00', '2020-10-05 20:01:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 3', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 3', '', '', '2020-10-05 14:02:37', '2020-10-05 14:02:37', '', 0, '', 0, 'product', '', 0),
(119, 1, '2020-10-05 14:02:00', '2020-10-05 20:02:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 3-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 3-2', '', '', '2020-10-05 14:04:08', '2020-10-05 14:04:08', '', 0, '', 0, 'product', '', 0),
(120, 1, '2020-10-05 14:04:00', '2020-10-05 20:04:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 4', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 4', '', '', '2020-10-05 14:05:50', '2020-10-05 14:05:50', '', 0, '', 0, 'product', '', 0),
(121, 1, '2020-10-05 14:06:00', '2020-10-05 20:06:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 4-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 4-2', '', '', '2020-10-05 14:07:19', '2020-10-05 14:07:19', '', 0, '', 0, 'product', '', 0),
(122, 1, '2020-10-05 14:07:00', '2020-10-05 20:07:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 5', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 5', '', '', '2020-10-05 14:08:25', '2020-10-05 14:08:25', '', 0, '', 0, 'product', '', 0),
(123, 1, '2020-10-05 14:08:00', '2020-10-05 20:08:00', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Tunic 5-2', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'publish', 'open', 'open', '', 'Tunic 5-2', '', '', '2020-10-05 14:09:39', '2020-10-05 14:09:39', '', 0, '', 0, 'product', '', 0),
(174, 1, '2020-10-12 16:06:00', '2020-10-12 22:06:00', '<p>ccxzcxzc</p>', 'Tunic 5-3', '<p>dfsfdsf</p>', 'publish', 'open', 'open', '', 'Tunic 5-3', '', '', '2020-10-12 16:08:09', '2020-10-12 16:08:09', '', 0, '', 0, 'product', '', 0),
(169, 2, '2020-10-10 00:00:00', '2020-10-10 23:35:00', 'some reason', 'Order2020-10-10 17:35:00', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Oct-10-2020-1710', '', '', '2020-10-11 16:37:57', '2020-10-10 17:35:00', '', 0, '', 0, 'shop_order', '', 0),
(170, 4, '2020-10-10 00:00:00', '2020-10-10 23:36:31', '', 'Order2020-10-10 17:36:31', '', 'delivered', 'open', 'open', 'order_1247', 'order-Oct-10-2020-1710', '', '', '2020-10-11 16:44:16', '2020-10-10 17:36:31', '', 0, '', 0, 'shop_order', '', 0),
(171, 5, '2020-10-12 00:00:00', '2020-10-12 20:52:19', '', 'Order2020-10-12 14:52:19', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Oct-12-2020-1410', '', '', '2020-10-12 14:52:19', '2020-10-12 14:52:19', '', 0, '', 0, 'shop_order', '', 0),
(172, 5, '2020-10-12 00:00:00', '2020-10-12 21:20:17', '', 'Order2020-10-12 15:20:17', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Oct-12-2020-1510', '', '', '2020-10-12 15:20:17', '2020-10-12 15:20:17', '', 0, '', 0, 'shop_order', '', 0),
(165, 2, '2020-10-08 00:00:00', '2020-10-08 22:59:58', '', 'Order2020-10-08 16:59:58', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Oct-08-2020-1610', '', '', '2020-10-08 16:59:58', '2020-10-08 16:59:58', '', 0, '', 0, 'shop_order', '', 0),
(166, 0, '2020-10-10 00:00:00', '2020-10-10 16:08:12', '', 'Order2020-10-10 10:08:12', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Oct-10-2020-1010', '', '', '2020-10-10 10:08:12', '2020-10-10 10:08:12', '', 0, '', 0, 'shop_order', '', 0);

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
(39, 'Dhaka', 'dhaka', 0, 1, '2020-09-27 13:25:47'),
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
(57, 'Uttara', 'uttara', 0, 1, '2020-10-06 15:42:42'),
(58, 'Badda', 'badda', 0, 1, '2020-10-06 15:42:42'),
(59, '1230', '1230', 0, 1, '2020-10-06 16:45:36'),
(60, '1212', '1212', 0, 1, '2020-10-06 16:45:36');

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
(174, 15, 0),
(174, 11, 0),
(128, 6, 0),
(128, 16, 0);

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
(39, 39, 'city', '', 0, 0, '2020-09-27 13:25:47'),
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
(55, 55, 'district', NULL, 0, 0, '2020-10-06 15:29:47'),
(56, 56, 'district', NULL, 0, 0, '2020-10-06 15:29:47'),
(57, 57, 'city', NULL, 55, 0, '2020-10-06 15:47:38'),
(58, 58, 'city', NULL, 56, 0, '2020-10-06 15:47:38'),
(59, 59, 'postcode', NULL, 57, 0, '2020-10-06 16:48:46'),
(60, 60, 'postcode', NULL, 58, 0, '2020-10-06 16:48:46');

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
(206, 2, 'user_image', '1601189730.png'),
(205, 2, 'zip', NULL),
(204, 2, 'city', NULL),
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
(199, 2, 'address_one', 'Uttara'),
(221, 5, 'country', NULL),
(220, 5, 'phone', '345345345'),
(219, 5, 'address_two', NULL),
(218, 5, 'address_one', NULL),
(217, 5, 'last_name', 'Rahman'),
(216, 5, 'first_name', 'Saiful'),
(222, 5, 'state', NULL),
(223, 5, 'city', NULL),
(224, 5, 'zip', NULL),
(225, 5, 'user_image', NULL);

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
(2, 'Demo', 'demo@email.com', NULL, '$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2', NULL, 1, '2020-09-13 05:06:20', '2020-09-13 05:06:20'),
(3, 'user 2', 'user2@email.com', NULL, '$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa', NULL, 1, '2020-09-19 09:08:42', '2020-09-19 09:08:42'),
(4, 'two', 'demo2@email.com', NULL, '$2y$10$CPpwMvysSAFba5JXSUeFjukBbpm93AEF/YSQ2fqBTJmATeUFK1I8m', NULL, 1, '2020-10-10 11:35:46', '2020-10-10 11:35:46'),
(5, 'Saiful', 'saiful@itebd.com', NULL, '', NULL, 1, '2020-10-12 08:50:40', '2020-10-12 08:50:40');

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
(2, 2, 74, NULL, NULL);

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
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2478;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

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
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
