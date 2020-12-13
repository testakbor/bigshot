

CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT 1,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO admins VALUES("2","Admin","admin@email.com","$2y$10$kWxHZoXuhxBiFY/vdokU0u9REwpd7EWV7kekYFaS6Kd9ro6fLwK4S","65756756","1","1","2020-10-28 18:11:44","2020-10-29 11:18:53");



CREATE TABLE `api_keys` (
  `key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attribute_taxonomies VALUES("1","color","color","select","menu_order","1","1","2020-12-12 16:08:23","2020-12-12 16:08:23");
INSERT INTO attribute_taxonomies VALUES("2","Size","size","select","menu_order","1","1","2020-12-12 16:09:01","2020-12-12 16:09:01");



CREATE TABLE `commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
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
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `ecommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ecommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `meta_key` (`meta_key`(250)),
  KEY `woocommerce_term_id` (`ecommerce_term_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;




CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2019_08_19_000000_create_failed_jobs_table","1");
INSERT INTO migrations VALUES("3","2020_07_11_100407_create_admins_table","1");
INSERT INTO migrations VALUES("4","2014_10_12_100000_create_password_resets_table","2");
INSERT INTO migrations VALUES("5","2020_09_14_100203_create_wishlist","2");
INSERT INTO migrations VALUES("10","2020_10_28_105612_create_roles_table","3");
INSERT INTO migrations VALUES("11","2020_10_28_105713_create_permissions_table","3");
INSERT INTO migrations VALUES("12","2020_10_28_152329_create_permissions_table","4");
INSERT INTO migrations VALUES("13","2020_10_28_152345_create_roles_table","4");



CREATE TABLE `options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_itemmeta VALUES("1","1","_tax_class","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("2","1","_qty","1","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("3","1","_product_id","2","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("4","1","_variation_id","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("5","1","_line_subtotal","3000","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("6","1","_line_total","3000","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("7","1","_line_subtotal_tax","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("8","1","_line_tax","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("9","1","_line_tax_data","2020-12-12 22:23:00","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("10","1","delivery_charge","300","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("11","1","coupon_code","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("12","1","coupon_taka","0","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("13","1","attribute_parent","2","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("14","2","_tax_class","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("15","2","_qty","1","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("16","2","_product_id","5","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("17","2","_variation_id","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("18","2","_line_subtotal","3200","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("19","2","_line_total","3200","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("20","2","_line_subtotal_tax","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("21","2","_line_tax","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("22","2","_line_tax_data","2020-12-12 22:23:00","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("23","2","delivery_charge","300","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("24","2","coupon_code","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("25","2","coupon_taka","0","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("26","2","attribute_parent","5","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("27","3","_tax_class","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("28","3","_qty","1","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("29","3","_product_id","6","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("30","3","_variation_id","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("31","3","_line_subtotal","2500","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("32","3","_line_total","2500","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("33","3","_line_subtotal_tax","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("34","3","_line_tax","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("35","3","_line_tax_data","2020-12-12 22:23:00","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("36","3","delivery_charge","300","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("37","3","coupon_code","","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("38","3","coupon_taka","0","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("39","3","attribute_parent","6","7","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("40","4","_tax_class","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("41","4","_qty","5","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("42","4","_product_id","11","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("43","4","_variation_id","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("44","4","_line_subtotal","15000","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("45","4","_line_total","15000","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("46","4","_line_subtotal_tax","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("47","4","_line_tax","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("48","4","_line_tax_data","2020-12-12 22:37:48","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("49","4","delivery_charge","300","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("50","4","coupon_code","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("51","4","coupon_taka","0","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("52","4","attribute_parent","11","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("53","5","_tax_class","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("54","5","_qty","3","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("55","5","_product_id","10","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("56","5","_variation_id","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("57","5","_line_subtotal","9000","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("58","5","_line_total","9000","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("59","5","_line_subtotal_tax","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("60","5","_line_tax","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("61","5","_line_tax_data","2020-12-12 22:37:48","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("62","5","delivery_charge","300","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("63","5","coupon_code","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("64","5","coupon_taka","0","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("65","5","attribute_parent","10","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("66","6","_tax_class","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("67","6","_qty","4","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("68","6","_product_id","9","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("69","6","_variation_id","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("70","6","_line_subtotal","12000","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("71","6","_line_total","12000","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("72","6","_line_subtotal_tax","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("73","6","_line_tax","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("74","6","_line_tax_data","2020-12-12 22:37:48","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("75","6","delivery_charge","300","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("76","6","coupon_code","","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("77","6","coupon_taka","0","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("78","6","attribute_parent","9","12","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("79","7","_tax_class","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("80","7","_qty","1","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("81","7","_product_id","9","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("82","7","_variation_id","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("83","7","_line_subtotal","3000","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("84","7","_line_total","3000","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("85","7","_line_subtotal_tax","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("86","7","_line_tax","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("87","7","_line_tax_data","2020-12-12 22:56:10","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("88","7","delivery_charge","300","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("89","7","coupon_code","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("90","7","coupon_taka","0","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("91","7","attribute_parent","9","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("92","8","_tax_class","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("93","8","_qty","1","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("94","8","_product_id","2","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("95","8","_variation_id","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("96","8","_line_subtotal","3000","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("97","8","_line_total","3000","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("98","8","_line_subtotal_tax","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("99","8","_line_tax","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("100","8","_line_tax_data","2020-12-12 22:56:10","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("101","8","delivery_charge","300","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("102","8","coupon_code","","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("103","8","coupon_taka","0","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("104","8","attribute_parent","2","14","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("105","9","_tax_class","","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("106","9","_qty","1","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("107","9","_product_id","11","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("108","9","_variation_id","","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("109","9","_line_subtotal","3000","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("110","9","_line_total","3000","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("111","9","_line_subtotal_tax","","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("112","9","_line_tax","","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("113","9","_line_tax_data","2020-12-12 22:56:53","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("114","9","delivery_charge","300","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("115","9","coupon_code","","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("116","9","coupon_taka","0","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("117","9","attribute_parent","11","15","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("118","10","_tax_class","","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("119","10","_qty","1","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("120","10","_product_id","11","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("121","10","_variation_id","","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("122","10","_line_subtotal","3000","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("123","10","_line_total","3000","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("124","10","_line_subtotal_tax","","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("125","10","_line_tax","","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("126","10","_line_tax_data","2020-12-12 22:58:43","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("127","10","delivery_charge","300","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("128","10","coupon_code","","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("129","10","coupon_taka","0","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("130","10","attribute_parent","11","16","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("131","11","_tax_class","","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("132","11","_qty","1","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("133","11","_product_id","6","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("134","11","_variation_id","","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("135","11","_line_subtotal","2500","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("136","11","_line_total","2500","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("137","11","_line_subtotal_tax","","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("138","11","_line_tax","","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("139","11","_line_tax_data","2020-12-12 22:59:57","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("140","11","delivery_charge","300","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("141","11","coupon_code","","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("142","11","coupon_taka","0","17","2020-12-12","22");
INSERT INTO order_itemmeta VALUES("143","11","attribute_parent","6","17","2020-12-12","22");



CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_items VALUES("1","silk saree","line-item","2","7");
INSERT INTO order_items VALUES("2","Men's Panjabi","line-item","5","7");
INSERT INTO order_items VALUES("3","man jacket","line-item","6","7");
INSERT INTO order_items VALUES("4","Dashiki fashion","line-item","11","12");
INSERT INTO order_items VALUES("5","Dashiki fashion","line-item","10","12");
INSERT INTO order_items VALUES("6","Dashiki fashion","line-item","9","12");
INSERT INTO order_items VALUES("7","Dashiki fashion","line-item","9","14");
INSERT INTO order_items VALUES("8","silk saree","line-item","2","14");
INSERT INTO order_items VALUES("9","Dashiki fashion","line-item","11","15");
INSERT INTO order_items VALUES("10","Dashiki fashion","line-item","11","16");
INSERT INTO order_items VALUES("11","man jacket","line-item","6","17");



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES("parthokar90@gmail.com","$2y$10$XoA4a2wqN/gSi2ucVBKsmO7aakCuCVpxBatDoaIIW2YyvzcbqvSly","2020-12-09 10:11:26");



CREATE TABLE `payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("1","Dashboard","manage-dashboard","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("2","Category","create-category","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("3","Tag","manage-tag","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("4","Attribute","manage-attribute","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("5","Product","manage-product","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("6","Quick Report","quick-report","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("7","Order History","order-history","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("8","Send Parcel","send-parcel","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("9","Reject","manage-reject","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("10","Manage Stock","manage-stock","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("11","Customer List","manage-customer","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("13","Settings","manage-settings","2020-10-28 16:48:52","2020-10-28 16:48:52");
INSERT INTO permissions VALUES("14","Report","manage-report","2020-10-28 16:48:52","2020-10-28 16:48:52");



CREATE TABLE `postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO postmeta VALUES("1","1","stock_status","");
INSERT INTO postmeta VALUES("2","1","regular_price","4500");
INSERT INTO postmeta VALUES("3","1","sale_price","3000");
INSERT INTO postmeta VALUES("4","1","weight","");
INSERT INTO postmeta VALUES("5","1","length","");
INSERT INTO postmeta VALUES("6","1","width","");
INSERT INTO postmeta VALUES("7","1","height","");
INSERT INTO postmeta VALUES("8","1","product_stock","1500");
INSERT INTO postmeta VALUES("9","1","start_stock","1500");
INSERT INTO postmeta VALUES("10","1","alert_qty","10");
INSERT INTO postmeta VALUES("11","1","_sku","597");
INSERT INTO postmeta VALUES("12","1","attached_file","1607767862.jpg");
INSERT INTO postmeta VALUES("13","1","gallery_file","images (14).jpg");
INSERT INTO postmeta VALUES("14","1","gallery_file","71Gt8yOMV9L._UY550_.jpg");
INSERT INTO postmeta VALUES("15","1","gallery_file","41TJolbjFTL.jpg");
INSERT INTO postmeta VALUES("16","2","attribute","[{"taxonomy":"color","term":"red","term_id":"3"}]");
INSERT INTO postmeta VALUES("17","1","default_attribute","[{"taxonomy":"color","term":"red","term_id":"3"}]");
INSERT INTO postmeta VALUES("18","2","attribute_stock","17");
INSERT INTO postmeta VALUES("19","2","attribute_low_stock","10");
INSERT INTO postmeta VALUES("20","3","attribute","[{"taxonomy":"color","term":"Yellow","term_id":"4"}]");
INSERT INTO postmeta VALUES("21","1","default_attribute","[{"taxonomy":"color","term":"Yellow","term_id":"4"}]");
INSERT INTO postmeta VALUES("22","3","attribute_stock","20");
INSERT INTO postmeta VALUES("23","3","attribute_low_stock","10");
INSERT INTO postmeta VALUES("24","4","stock_status","");
INSERT INTO postmeta VALUES("25","4","regular_price","4500");
INSERT INTO postmeta VALUES("26","4","sale_price","3200");
INSERT INTO postmeta VALUES("27","4","weight","");
INSERT INTO postmeta VALUES("28","4","length","");
INSERT INTO postmeta VALUES("29","4","width","");
INSERT INTO postmeta VALUES("30","4","height","");
INSERT INTO postmeta VALUES("31","4","product_stock","2000");
INSERT INTO postmeta VALUES("32","4","start_stock","2000");
INSERT INTO postmeta VALUES("33","4","alert_qty","2");
INSERT INTO postmeta VALUES("34","4","_sku","871");
INSERT INTO postmeta VALUES("35","4","attached_file","1607768164.jpg");
INSERT INTO postmeta VALUES("36","4","gallery_file","download (10).jpg");
INSERT INTO postmeta VALUES("37","4","gallery_file","IMG_2025_compact.jpg");
INSERT INTO postmeta VALUES("38","4","gallery_file","IMG_2000_compact.jpg");
INSERT INTO postmeta VALUES("39","5","attribute","[{"taxonomy":"color","term":"red","term_id":"3"}]");
INSERT INTO postmeta VALUES("40","4","default_attribute","[{"taxonomy":"color","term":"red","term_id":"3"}]");
INSERT INTO postmeta VALUES("41","5","attribute_stock","20");
INSERT INTO postmeta VALUES("42","5","attribute_low_stock","2");
INSERT INTO postmeta VALUES("43","6","stock_status","instock");
INSERT INTO postmeta VALUES("44","6","regular_price","6000");
INSERT INTO postmeta VALUES("45","6","sale_price","2500");
INSERT INTO postmeta VALUES("46","6","weight","");
INSERT INTO postmeta VALUES("47","6","length","");
INSERT INTO postmeta VALUES("48","6","width","");
INSERT INTO postmeta VALUES("49","6","height","");
INSERT INTO postmeta VALUES("50","6","product_stock","1200");
INSERT INTO postmeta VALUES("51","6","start_stock","1200");
INSERT INTO postmeta VALUES("52","6","default_qty","17");
INSERT INTO postmeta VALUES("53","6","alert_qty","5");
INSERT INTO postmeta VALUES("54","6","_sku","726");
INSERT INTO postmeta VALUES("55","6","attached_file","1607768314.jpg");
INSERT INTO postmeta VALUES("56","6","gallery_file","images (12).jpg");
INSERT INTO postmeta VALUES("57","6","gallery_file","images (11).jpg");
INSERT INTO postmeta VALUES("58","6","gallery_file","images (10).jpg");
INSERT INTO postmeta VALUES("59","7","first_name","khan");
INSERT INTO postmeta VALUES("60","7","last_name","Guest");
INSERT INTO postmeta VALUES("61","7","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("62","7","address_two","");
INSERT INTO postmeta VALUES("63","7","phone","126645");
INSERT INTO postmeta VALUES("64","7","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("65","7","country","Bangladesh");
INSERT INTO postmeta VALUES("66","7","state","comilla");
INSERT INTO postmeta VALUES("67","7","city","laksam");
INSERT INTO postmeta VALUES("68","7","zip","2300");
INSERT INTO postmeta VALUES("69","7","_customer_user","22");
INSERT INTO postmeta VALUES("70","7","_billing_postcode","2300");
INSERT INTO postmeta VALUES("71","7","_billing_company","");
INSERT INTO postmeta VALUES("72","7","_billing_last_name","");
INSERT INTO postmeta VALUES("73","7","_billing_first_name","");
INSERT INTO postmeta VALUES("74","7","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("75","7","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("76","8","stock_status","");
INSERT INTO postmeta VALUES("77","8","regular_price","6000");
INSERT INTO postmeta VALUES("78","8","sale_price","3000");
INSERT INTO postmeta VALUES("79","8","weight","");
INSERT INTO postmeta VALUES("80","8","length","");
INSERT INTO postmeta VALUES("81","8","width","");
INSERT INTO postmeta VALUES("82","8","height","");
INSERT INTO postmeta VALUES("83","8","product_stock","1200");
INSERT INTO postmeta VALUES("84","8","start_stock","1200");
INSERT INTO postmeta VALUES("85","8","alert_qty","5");
INSERT INTO postmeta VALUES("86","8","_sku","697");
INSERT INTO postmeta VALUES("87","8","attached_file","1607769188.jpg");
INSERT INTO postmeta VALUES("88","8","gallery_file","best-aliexpress-women-clothing.png");
INSERT INTO postmeta VALUES("89","8","gallery_file","download (14).jpg");
INSERT INTO postmeta VALUES("90","8","gallery_file","download (13).jpg");
INSERT INTO postmeta VALUES("91","9","attribute","[{"taxonomy":"color","term":"red","term_id":"3"}]");
INSERT INTO postmeta VALUES("92","8","default_attribute","[{"taxonomy":"color","term":"red","term_id":"3"}]");
INSERT INTO postmeta VALUES("93","9","attribute_stock","12");
INSERT INTO postmeta VALUES("94","9","attribute_low_stock","5");
INSERT INTO postmeta VALUES("95","10","attribute","[{"taxonomy":"color","term":"Yellow","term_id":"4"}]");
INSERT INTO postmeta VALUES("96","8","default_attribute","[{"taxonomy":"color","term":"Yellow","term_id":"4"}]");
INSERT INTO postmeta VALUES("97","10","attribute_stock","15");
INSERT INTO postmeta VALUES("98","10","attribute_low_stock","5");
INSERT INTO postmeta VALUES("99","11","attribute","[{"taxonomy":"color","term":"Blue","term_id":"5"}]");
INSERT INTO postmeta VALUES("100","8","default_attribute","[{"taxonomy":"color","term":"Blue","term_id":"5"}]");
INSERT INTO postmeta VALUES("101","11","attribute_stock","9");
INSERT INTO postmeta VALUES("102","11","attribute_low_stock","5");
INSERT INTO postmeta VALUES("103","12","first_name","khan");
INSERT INTO postmeta VALUES("104","12","last_name","Guest");
INSERT INTO postmeta VALUES("105","12","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("106","12","address_two","");
INSERT INTO postmeta VALUES("107","12","phone","126645");
INSERT INTO postmeta VALUES("108","12","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("109","12","country","Bangladesh");
INSERT INTO postmeta VALUES("110","12","state","comilla");
INSERT INTO postmeta VALUES("111","12","city","bramonbaria");
INSERT INTO postmeta VALUES("112","12","zip","2100");
INSERT INTO postmeta VALUES("113","12","_customer_user","22");
INSERT INTO postmeta VALUES("114","12","_billing_postcode","2100");
INSERT INTO postmeta VALUES("115","12","_billing_company","");
INSERT INTO postmeta VALUES("116","12","_billing_last_name","");
INSERT INTO postmeta VALUES("117","12","_billing_first_name","");
INSERT INTO postmeta VALUES("118","12","payment_method","FullPayment");
INSERT INTO postmeta VALUES("119","13","banner_image","1607769565.png");
INSERT INTO postmeta VALUES("120","12","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("121","14","first_name","khan");
INSERT INTO postmeta VALUES("122","14","last_name","Guest");
INSERT INTO postmeta VALUES("123","14","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("124","14","address_two","");
INSERT INTO postmeta VALUES("125","14","phone","126645");
INSERT INTO postmeta VALUES("126","14","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("127","14","country","Bangladesh");
INSERT INTO postmeta VALUES("128","14","state","comilla");
INSERT INTO postmeta VALUES("129","14","city","laksam");
INSERT INTO postmeta VALUES("130","14","zip","2300");
INSERT INTO postmeta VALUES("131","14","_customer_user","22");
INSERT INTO postmeta VALUES("132","14","_billing_postcode","2300");
INSERT INTO postmeta VALUES("133","14","_billing_company","");
INSERT INTO postmeta VALUES("134","14","_billing_last_name","");
INSERT INTO postmeta VALUES("135","14","_billing_first_name","");
INSERT INTO postmeta VALUES("136","14","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("137","15","first_name","khan");
INSERT INTO postmeta VALUES("138","15","last_name","Guest");
INSERT INTO postmeta VALUES("139","15","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("140","15","address_two","");
INSERT INTO postmeta VALUES("141","15","phone","126645");
INSERT INTO postmeta VALUES("142","15","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("143","15","country","Bangladesh");
INSERT INTO postmeta VALUES("144","15","state","comilla");
INSERT INTO postmeta VALUES("145","15","city","bramonbaria");
INSERT INTO postmeta VALUES("146","15","zip","2100");
INSERT INTO postmeta VALUES("147","15","_customer_user","22");
INSERT INTO postmeta VALUES("148","15","_billing_postcode","2100");
INSERT INTO postmeta VALUES("149","15","_billing_company","");
INSERT INTO postmeta VALUES("150","15","_billing_last_name","");
INSERT INTO postmeta VALUES("151","15","_billing_first_name","");
INSERT INTO postmeta VALUES("152","15","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("153","16","first_name","khan");
INSERT INTO postmeta VALUES("154","16","last_name","Guest");
INSERT INTO postmeta VALUES("155","16","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("156","16","address_two","");
INSERT INTO postmeta VALUES("157","16","phone","126645");
INSERT INTO postmeta VALUES("158","16","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("159","16","country","Bangladesh");
INSERT INTO postmeta VALUES("160","16","state","comilla");
INSERT INTO postmeta VALUES("161","16","city","laksam");
INSERT INTO postmeta VALUES("162","16","zip","2300");
INSERT INTO postmeta VALUES("163","16","_customer_user","22");
INSERT INTO postmeta VALUES("164","16","_billing_postcode","2300");
INSERT INTO postmeta VALUES("165","16","_billing_company","");
INSERT INTO postmeta VALUES("166","16","_billing_last_name","");
INSERT INTO postmeta VALUES("167","16","_billing_first_name","");
INSERT INTO postmeta VALUES("168","16","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("169","17","first_name","khan");
INSERT INTO postmeta VALUES("170","17","last_name","Guest");
INSERT INTO postmeta VALUES("171","17","address_one","mirpur,dhaka");
INSERT INTO postmeta VALUES("172","17","address_two","");
INSERT INTO postmeta VALUES("173","17","phone","126645");
INSERT INTO postmeta VALUES("174","17","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("175","17","country","Bangladesh");
INSERT INTO postmeta VALUES("176","17","state","comilla");
INSERT INTO postmeta VALUES("177","17","city","laksam");
INSERT INTO postmeta VALUES("178","17","zip","2300");
INSERT INTO postmeta VALUES("179","17","_customer_user","22");
INSERT INTO postmeta VALUES("180","17","_billing_postcode","2300");
INSERT INTO postmeta VALUES("181","17","_billing_company","");
INSERT INTO postmeta VALUES("182","17","_billing_last_name","");
INSERT INTO postmeta VALUES("183","17","_billing_first_name","");
INSERT INTO postmeta VALUES("184","17","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("185","17","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("186","18","attribute","[{"taxonomy":"size","term":"xl","term_id":"6"}]");
INSERT INTO postmeta VALUES("187","18","attribute_stock","");
INSERT INTO postmeta VALUES("188","19","attribute","[{"taxonomy":"size","term":"m","term_id":"9"}]");
INSERT INTO postmeta VALUES("189","19","attribute_stock","");
INSERT INTO postmeta VALUES("190","9","product_status","reject");
INSERT INTO postmeta VALUES("191","9","reject_date","2020-12-12");
INSERT INTO postmeta VALUES("192","9","reject_date","2020-12-12");
INSERT INTO postmeta VALUES("193","9","reject_qty","49");
INSERT INTO postmeta VALUES("194","10","product_status","reject");
INSERT INTO postmeta VALUES("195","10","reject_date","2020-12-12");
INSERT INTO postmeta VALUES("196","10","reject_date","2020-12-12");
INSERT INTO postmeta VALUES("197","10","reject_qty","60");
INSERT INTO postmeta VALUES("198","11","product_status","reject");
INSERT INTO postmeta VALUES("199","11","reject_date","2020-12-12");
INSERT INTO postmeta VALUES("200","11","reject_date","2020-12-12");
INSERT INTO postmeta VALUES("201","11","reject_qty","58");



CREATE TABLE `posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
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
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES("1","2","2020-12-12 16:09:00","2020-12-12 22:09:00","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>","silk saree","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>","publish","open","open","","silk saree","","","2020-12-12 16:11:02","2020-12-12 16:11:02","","0","","0","product","","0");
INSERT INTO posts VALUES("2","0","2020-12-12 16:11:02","2020-12-12 16:11:02","","","","publish","open","open","","","","","2020-12-12 16:11:02","2020-12-12 16:11:02","","1","","0","product_varient","","0");
INSERT INTO posts VALUES("3","0","2020-12-12 16:11:02","2020-12-12 16:11:02","","","","publish","open","open","","","","","2020-12-12 16:11:02","2020-12-12 16:11:02","","1","","0","product_varient","","0");
INSERT INTO posts VALUES("4","2","2020-12-12 16:14:00","2020-12-12 22:14:00","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>","Men's Panjabi","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>","publish","open","open","","Men's Panjabi","","","2020-12-12 16:16:04","2020-12-12 16:16:04","","0","","0","product","","0");
INSERT INTO posts VALUES("5","0","2020-12-12 16:16:04","2020-12-12 16:16:04","","","","publish","open","open","","","","","2020-12-12 16:16:04","2020-12-12 16:16:04","","4","","0","product_varient","","0");
INSERT INTO posts VALUES("6","2","2020-12-12 16:18:00","2020-12-12 22:18:00","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>","men jacket","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>","publish","open","open","","men jacket","","","2020-12-12 16:18:34","2020-12-12 16:18:34","","0","","0","product","","0");
INSERT INTO posts VALUES("7","22","2020-12-12 00:00:00","2020-12-12 22:23:00","","Order2020-12-12 16:23:00","","cancelled","open","open","order_1247","order-Dec-12-2020-1612","","","2020-12-12 16:45:55","2020-12-12 16:23:00","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("8","2","2020-12-12 16:30:00","2020-12-12 22:30:00","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>","Dashiki fashion","<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>","publish","open","open","","Dashiki fashion","","","2020-12-12 16:33:08","2020-12-12 16:33:08","","0","","0","product","","0");
INSERT INTO posts VALUES("9","0","2020-12-12 16:33:08","2020-12-12 16:33:08","","","","publish","open","open","","","","","2020-12-12 16:33:08","2020-12-12 16:33:08","","8","","0","product_varient","","0");
INSERT INTO posts VALUES("10","0","2020-12-12 16:33:08","2020-12-12 16:33:08","","","","publish","open","open","","","","","2020-12-12 16:33:08","2020-12-12 16:33:08","","8","","0","product_varient","","0");
INSERT INTO posts VALUES("11","0","2020-12-12 16:33:08","2020-12-12 16:33:08","","","","publish","open","open","","","","","2020-12-12 16:33:08","2020-12-12 16:33:08","","8","","0","product_varient","","0");
INSERT INTO posts VALUES("12","22","2020-12-12 00:00:00","2020-12-12 22:37:47","","Order2020-12-12 16:37:47","","dispatch_complete","open","open","order_1247","order-Dec-12-2020-1612","","","2020-12-12 16:41:42","2020-12-12 16:37:47","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("13","2","2020-12-12 16:39:00","2020-12-12 22:39:00","Banner Image","Banner Image","Banner Image","publish","open","open","","Banner Image","","","2020-12-12 16:39:25","2020-12-12 16:39:25","","0","","0","banner","","0");
INSERT INTO posts VALUES("14","22","2020-12-12 00:00:00","2020-12-12 22:56:10","","Order2020-12-12 16:56:10","","on-hold","open","open","order_1247","order-Dec-12-2020-1612","","","2020-12-12 16:56:10","2020-12-12 16:56:10","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("15","22","2020-12-12 00:00:00","2020-12-12 22:56:53","","Order2020-12-12 16:56:53","","on-hold","open","open","order_1247","order-Dec-12-2020-1612","","","2020-12-12 16:56:53","2020-12-12 16:56:53","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("16","22","2020-12-12 00:00:00","2020-12-12 22:58:43","","Order2020-12-12 16:58:43","","on-hold","open","open","order_1247","order-Dec-12-2020-1612","","","2020-12-12 16:58:43","2020-12-12 16:58:43","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("17","22","2020-12-12 00:00:00","2020-12-12 22:59:57","","Order2020-12-12 16:59:57","","delivered","open","open","order_1247","order-Dec-12-2020-1612","","","2020-12-12 17:16:38","2020-12-12 16:59:57","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("18","0","2020-12-12 17:13:54","2020-12-12 17:13:54","","","","publish","open","open","","","","","2020-12-12 17:13:54","2020-12-12 17:13:54","","1","","0","product_varient","","0");
INSERT INTO posts VALUES("19","0","2020-12-12 17:13:54","2020-12-12 17:13:54","","","","publish","open","open","","","","","2020-12-12 17:13:54","2020-12-12 17:13:54","","1","","0","product_varient","","0");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","admin","2020-10-28 16:48:52","2020-11-15 10:01:36");
INSERT INTO roles VALUES("3","Editor","","2020-10-29 10:21:40","2020-11-15 10:01:50");



CREATE TABLE `roles_permissions` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles_permissions VALUES("1","1");
INSERT INTO roles_permissions VALUES("1","2");
INSERT INTO roles_permissions VALUES("1","3");
INSERT INTO roles_permissions VALUES("1","4");
INSERT INTO roles_permissions VALUES("1","5");
INSERT INTO roles_permissions VALUES("1","6");
INSERT INTO roles_permissions VALUES("1","7");
INSERT INTO roles_permissions VALUES("1","8");
INSERT INTO roles_permissions VALUES("1","9");
INSERT INTO roles_permissions VALUES("1","10");
INSERT INTO roles_permissions VALUES("1","11");
INSERT INTO roles_permissions VALUES("1","13");
INSERT INTO roles_permissions VALUES("1","14");
INSERT INTO roles_permissions VALUES("3","1");
INSERT INTO roles_permissions VALUES("3","2");
INSERT INTO roles_permissions VALUES("3","3");



CREATE TABLE `sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`instance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(191)),
  KEY `tax_rate_class` (`tax_rate_class`(191)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `temp_attribute_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_relationships VALUES("1","2","0");
INSERT INTO term_relationships VALUES("1","1","0");
INSERT INTO term_relationships VALUES("4","10","0");
INSERT INTO term_relationships VALUES("4","11","0");
INSERT INTO term_relationships VALUES("6","12","0");
INSERT INTO term_relationships VALUES("6","11","0");
INSERT INTO term_relationships VALUES("8","1","0");
INSERT INTO term_relationships VALUES("8","2","0");



CREATE TABLE `term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_taxonomy VALUES("1","1","product_cat","","0","0","2020-12-12 16:06:47");
INSERT INTO term_taxonomy VALUES("2","2","product_tag","","0","0","2020-12-12 16:07:15");
INSERT INTO term_taxonomy VALUES("3","3","color","","0","0","2020-12-12 16:08:33");
INSERT INTO term_taxonomy VALUES("4","4","color","","0","0","2020-12-12 16:08:43");
INSERT INTO term_taxonomy VALUES("5","5","color","","0","0","2020-12-12 16:08:48");
INSERT INTO term_taxonomy VALUES("6","6","size","","0","0","2020-12-12 16:09:09");
INSERT INTO term_taxonomy VALUES("7","7","size","","0","0","2020-12-12 16:09:13");
INSERT INTO term_taxonomy VALUES("8","8","size","","0","0","2020-12-12 16:09:16");
INSERT INTO term_taxonomy VALUES("9","9","size","","0","0","2020-12-12 16:09:19");
INSERT INTO term_taxonomy VALUES("10","10","product_cat","","0","0","2020-12-12 16:14:34");
INSERT INTO term_taxonomy VALUES("11","11","product_tag","","0","0","2020-12-12 16:14:41");
INSERT INTO term_taxonomy VALUES("12","12","product_cat","","0","0","2020-12-12 16:17:26");
INSERT INTO term_taxonomy VALUES("13","13","product_tag","","0","0","2020-12-12 16:19:44");
INSERT INTO term_taxonomy VALUES("14","14","district","300","0","0","2020-12-12 16:21:34");
INSERT INTO term_taxonomy VALUES("15","15","city","","14","0","2020-12-12 16:21:55");
INSERT INTO term_taxonomy VALUES("16","15","postcode","2300","15","0","2020-12-12 16:21:55");
INSERT INTO term_taxonomy VALUES("17","16","city","","14","0","2020-12-12 16:22:17");
INSERT INTO term_taxonomy VALUES("18","16","postcode","2100","16","0","2020-12-12 16:22:17");



CREATE TABLE `termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO terms VALUES("1","saree","saree","0","1","2020-12-12 16:06:47");
INSERT INTO terms VALUES("2","women","women","0","1","2020-12-12 16:07:15");
INSERT INTO terms VALUES("3","red","red","0","1","2020-12-12 16:08:33");
INSERT INTO terms VALUES("4","Yellow","yellow","0","1","2020-12-12 16:08:43");
INSERT INTO terms VALUES("5","Blue","blue","0","1","2020-12-12 16:08:48");
INSERT INTO terms VALUES("6","xl","xl","0","1","2020-12-12 16:09:09");
INSERT INTO terms VALUES("7","l","l","0","1","2020-12-12 16:09:13");
INSERT INTO terms VALUES("8","s","s","0","1","2020-12-12 16:09:16");
INSERT INTO terms VALUES("9","m","m","0","1","2020-12-12 16:09:19");
INSERT INTO terms VALUES("10","Panjabi","panjabi","0","1","2020-12-12 16:14:34");
INSERT INTO terms VALUES("11","men","men","0","1","2020-12-12 16:14:41");
INSERT INTO terms VALUES("12","Jacket","jacket","0","1","2020-12-12 16:17:26");
INSERT INTO terms VALUES("13","Panjabi","panjabi","0","0","2020-12-12 16:19:44");
INSERT INTO terms VALUES("14","comilla","comilla","0","1","2020-12-12 16:21:34");
INSERT INTO terms VALUES("15","laksam","laksam","0","1","2020-12-12 16:21:55");
INSERT INTO terms VALUES("16","bramonbaria","bramonbaria","0","1","2020-12-12 16:22:17");



CREATE TABLE `user_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO user_cart VALUES("12","22","11","Dashiki fashion","6000","3000","2");
INSERT INTO user_cart VALUES("13","21","9","Dashiki fashion","3000","3000","1");



CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=972 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO usermeta VALUES("277","5","district","55");
INSERT INTO usermeta VALUES("275","5","user_image","");
INSERT INTO usermeta VALUES("825","2","user_image","1607494226.jpg");
INSERT INTO usermeta VALUES("852","2","city","16");
INSERT INTO usermeta VALUES("822","2","state","");
INSERT INTO usermeta VALUES("821","2","country","");
INSERT INTO usermeta VALUES("41","3","phone","4354354");
INSERT INTO usermeta VALUES("40","3","address_two","retretret");
INSERT INTO usermeta VALUES("39","3","address_one","retretre");
INSERT INTO usermeta VALUES("38","3","last_name","user 2");
INSERT INTO usermeta VALUES("37","3","first_name","user 2");
INSERT INTO usermeta VALUES("42","3","country","BD");
INSERT INTO usermeta VALUES("43","3","state","Bangladesh");
INSERT INTO usermeta VALUES("44","3","city","Dhaka");
INSERT INTO usermeta VALUES("45","3","zip","342543543");
INSERT INTO usermeta VALUES("820","2","phone","6789");
INSERT INTO usermeta VALUES("817","2","last_name","Demo");
INSERT INTO usermeta VALUES("279","5","zip","1230");
INSERT INTO usermeta VALUES("278","5","city","57");
INSERT INTO usermeta VALUES("895","0","district","15");
INSERT INTO usermeta VALUES("894","0","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("267","5","last_name","Rahman");
INSERT INTO usermeta VALUES("276","5","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("269","5","address_two","");
INSERT INTO usermeta VALUES("270","5","phone","3453453457");
INSERT INTO usermeta VALUES("266","5","first_name","Saiful");
INSERT INTO usermeta VALUES("819","2","address_two","");
INSERT INTO usermeta VALUES("896","0","city","16");
INSERT INTO usermeta VALUES("897","0","zip","1230");
INSERT INTO usermeta VALUES("360","17","address_one","Road 4, House 15, Block A, Mirpur 10, Dhaka 1216");
INSERT INTO usermeta VALUES("361","17","district","55");
INSERT INTO usermeta VALUES("362","17","city","95");
INSERT INTO usermeta VALUES("363","17","zip","kuril");
INSERT INTO usermeta VALUES("376","19","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("377","19","district","56");
INSERT INTO usermeta VALUES("378","19","city","97");
INSERT INTO usermeta VALUES("379","19","zip","3330-337456");
INSERT INTO usermeta VALUES("452","21","state","");
INSERT INTO usermeta VALUES("453","21","city","");
INSERT INTO usermeta VALUES("451","21","country","");
INSERT INTO usermeta VALUES("450","21","phone","345345");
INSERT INTO usermeta VALUES("449","21","address_two","");
INSERT INTO usermeta VALUES("448","21","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("447","21","last_name","Kar");
INSERT INTO usermeta VALUES("446","21","first_name","Partho");
INSERT INTO usermeta VALUES("454","21","zip","");
INSERT INTO usermeta VALUES("455","21","user_image","1605432060.jpg");
INSERT INTO usermeta VALUES("850","2","address_one","Uttara");
INSERT INTO usermeta VALUES("816","2","first_name","Demo");
INSERT INTO usermeta VALUES("851","2","district","15");
INSERT INTO usermeta VALUES("853","2","zip","1230");
INSERT INTO usermeta VALUES("971","22","user_image","1607755455.jpg");
INSERT INTO usermeta VALUES("970","22","zip","");
INSERT INTO usermeta VALUES("969","22","city","");
INSERT INTO usermeta VALUES("968","22","state","");
INSERT INTO usermeta VALUES("967","22","country","");
INSERT INTO usermeta VALUES("966","22","phone","126645");
INSERT INTO usermeta VALUES("965","22","address_two","");
INSERT INTO usermeta VALUES("964","22","address_one","");
INSERT INTO usermeta VALUES("963","22","last_name","");
INSERT INTO usermeta VALUES("962","22","first_name","khan");



CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("2","Demo","demo@email.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-09-13 11:06:20","2020-09-13 11:06:20");
INSERT INTO users VALUES("17","Howlader","bigshotstyle20@gmail.com","","$2y$10$eQfmmmLqtCKD5ckLt9gL8OGk0p7eKy3crlLryvEQnsx4LJdLE8n9C","","","","1","2020-11-03 15:47:02","2020-11-03 15:47:02");
INSERT INTO users VALUES("18","Customer","customer@email.com","","$2y$10$DifceXB8dt/mCivp4PIW/ujU0hq/OFHNL9NAHjZOrOgCEVMbVwf0i","","","","1","2020-11-07 08:11:03","2020-11-07 08:11:03");
INSERT INTO users VALUES("19","customer","partho@itebd.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-11-07 08:12:45","2020-11-07 08:12:45");
INSERT INTO users VALUES("20","Rahman","niloy@email.com","","$2y$10$o8jlnQihj1jZvH7KoOl1eOmXj8xzYGgiaXu4DdXANdJ9EiTxBbqLG","","","","1","2020-11-15 04:03:42","2020-11-15 04:03:42");
INSERT INTO users VALUES("21","Partho","parthokar90@gmail.com","","$2y$10$nuxhiB9nzPYjKSwo9gpxKODxclWhEm3TXzJzpICWrRXkbvpRkgQO2","","","","1","2020-11-15 11:12:37","2020-11-15 11:12:37");
INSERT INTO users VALUES("22","khan","sohelahmeditebd@gmail.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-12-12 12:43:30","2020-12-12 12:43:30");



CREATE TABLE `users_permissions` (
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users_permissions VALUES("2","1");
INSERT INTO users_permissions VALUES("2","2");
INSERT INTO users_permissions VALUES("2","3");
INSERT INTO users_permissions VALUES("2","4");
INSERT INTO users_permissions VALUES("2","5");
INSERT INTO users_permissions VALUES("2","6");
INSERT INTO users_permissions VALUES("2","7");
INSERT INTO users_permissions VALUES("2","8");
INSERT INTO users_permissions VALUES("2","9");
INSERT INTO users_permissions VALUES("2","10");
INSERT INTO users_permissions VALUES("2","11");
INSERT INTO users_permissions VALUES("2","13");
INSERT INTO users_permissions VALUES("2","14");
INSERT INTO users_permissions VALUES("3","1");
INSERT INTO users_permissions VALUES("3","2");



CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users_roles VALUES("2","1");



CREATE TABLE `wishlist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO wishlist VALUES("1","22","4","","");
INSERT INTO wishlist VALUES("2","22","6","","");
INSERT INTO wishlist VALUES("3","21","8","","");

