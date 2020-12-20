

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO admins VALUES("2","Admin","admin@email.com","$2y$10$kWxHZoXuhxBiFY/vdokU0u9REwpd7EWV7kekYFaS6Kd9ro6fLwK4S","65756756","1","1","2020-10-28 18:11:44","2020-10-29 11:18:53");
INSERT INTO admins VALUES("5","Test","t@email.com","$2y$10$Z95.H7Hlb8mNrCKEwWmn2O3dGZqMBSvJi917Nb5G4WQpyQwtxAWYq","","3","1","2020-12-14 10:07:58","2020-12-14 10:07:58");



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

INSERT INTO attribute_taxonomies VALUES("1","Color","color","select","menu_order","1","1","2020-12-13 13:30:44","2020-12-14 11:01:42");
INSERT INTO attribute_taxonomies VALUES("2","Size","size","select","menu_order","1","1","2020-12-13 13:30:47","2020-12-13 13:30:47");



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
) ENGINE=MyISAM AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_itemmeta VALUES("1","1","_tax_class","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("2","1","_qty","1","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("3","1","_product_id","4","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("4","1","_variation_id","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("5","1","_line_subtotal","3450","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("6","1","_line_total","3450","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("7","1","_line_subtotal_tax","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("8","1","_line_tax","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("9","1","_line_tax_data","2020-12-13 21:22:41","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("10","1","delivery_charge","190","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("11","1","coupon_code","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("12","1","coupon_taka","0","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("13","1","attribute_parent","4","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("14","2","_tax_class","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("15","2","_qty","1","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("16","2","_product_id","2","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("17","2","_variation_id","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("18","2","_line_subtotal","3000","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("19","2","_line_total","3000","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("20","2","_line_subtotal_tax","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("21","2","_line_tax","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("22","2","_line_tax_data","2020-12-13 21:22:41","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("23","2","delivery_charge","190","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("24","2","coupon_code","","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("25","2","coupon_taka","0","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("26","2","attribute_parent","2","14","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("27","3","_tax_class","","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("28","3","_qty","1","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("29","3","_product_id","4","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("30","3","_variation_id","","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("31","3","_line_subtotal","3450","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("32","3","_line_total","3450","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("33","3","_line_subtotal_tax","","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("34","3","_line_tax","","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("35","3","_line_tax_data","2020-12-13 21:57:18","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("36","3","delivery_charge","190","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("37","3","coupon_code","","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("38","3","coupon_taka","0","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("39","3","attribute_parent","4","15","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("40","4","_tax_class","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("41","4","_qty","1","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("42","4","_product_id","4","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("43","4","_variation_id","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("44","4","_line_subtotal","3450","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("45","4","_line_total","3450","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("46","4","_line_subtotal_tax","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("47","4","_line_tax","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("48","4","_line_tax_data","2020-12-13 22:04:30","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("49","4","delivery_charge","190","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("50","4","coupon_code","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("51","4","coupon_taka","0","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("52","4","attribute_parent","4","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("53","5","_tax_class","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("54","5","_qty","2","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("55","5","_product_id","3","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("56","5","_variation_id","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("57","5","_line_subtotal","6000","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("58","5","_line_total","6000","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("59","5","_line_subtotal_tax","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("60","5","_line_tax","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("61","5","_line_tax_data","2020-12-13 22:04:30","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("62","5","delivery_charge","190","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("63","5","coupon_code","","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("64","5","coupon_taka","0","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("65","5","attribute_parent","3","16","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("66","6","_tax_class","","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("67","6","_qty","1","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("68","6","_product_id","2","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("69","6","_variation_id","","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("70","6","_line_subtotal","3000","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("71","6","_line_total","3000","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("72","6","_line_subtotal_tax","","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("73","6","_line_tax","","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("74","6","_line_tax_data","2020-12-13 22:40:09","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("75","6","delivery_charge","190","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("76","6","coupon_code","","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("77","6","coupon_taka","0","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("78","6","attribute_parent","2","17","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("79","7","_tax_class","","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("80","7","_qty","1","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("81","7","_product_id","4","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("82","7","_variation_id","","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("83","7","_line_subtotal","3450","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("84","7","_line_total","3450","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("85","7","_line_subtotal_tax","","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("86","7","_line_tax","","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("87","7","_line_tax_data","2020-12-13 23:54:07","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("88","7","delivery_charge","190","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("89","7","coupon_code","","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("90","7","coupon_taka","0","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("91","7","attribute_parent","4","18","2020-12-13","2");
INSERT INTO order_itemmeta VALUES("92","8","_tax_class","","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("93","8","_qty","1","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("94","8","_product_id","20","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("95","8","_variation_id","","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("96","8","_line_subtotal","3000","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("97","8","_line_total","3000","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("98","8","_line_subtotal_tax","","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("99","8","_line_tax","","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("100","8","_line_tax_data","2020-12-14 18:26:24","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("101","8","delivery_charge","190","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("102","8","coupon_code","","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("103","8","coupon_taka","0","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("104","8","attribute_parent","20","22","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("105","9","_tax_class","","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("106","9","_qty","1","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("107","9","_product_id","4","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("108","9","_variation_id","","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("109","9","_line_subtotal","3450","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("110","9","_line_total","3450","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("111","9","_line_subtotal_tax","","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("112","9","_line_tax","","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("113","9","_line_tax_data","2020-12-14 18:43:18","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("114","9","delivery_charge","190","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("115","9","coupon_code","","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("116","9","coupon_taka","0","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("117","9","attribute_parent","4","23","2020-12-14","0");
INSERT INTO order_itemmeta VALUES("118","10","_tax_class","","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("119","10","_qty","2","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("120","10","_product_id","21","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("121","10","_variation_id","","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("122","10","_line_subtotal","6000","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("123","10","_line_total","6000","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("124","10","_line_subtotal_tax","","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("125","10","_line_tax","","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("126","10","_line_tax_data","2020-12-14 19:00:53","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("127","10","delivery_charge","190","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("128","10","coupon_code","","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("129","10","coupon_taka","0","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("130","10","attribute_parent","21","24","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("131","11","_tax_class","","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("132","11","_qty","1","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("133","11","_product_id","21","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("134","11","_variation_id","","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("135","11","_line_subtotal","3000","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("136","11","_line_total","3000","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("137","11","_line_subtotal_tax","","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("138","11","_line_tax","","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("139","11","_line_tax_data","2020-12-14 19:04:07","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("140","11","delivery_charge","0","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("141","11","coupon_code","","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("142","11","coupon_taka","0","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("143","11","attribute_parent","21","25","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("144","12","_tax_class","","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("145","12","_qty","1","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("146","12","_product_id","20","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("147","12","_variation_id","","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("148","12","_line_subtotal","3000","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("149","12","_line_total","3000","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("150","12","_line_subtotal_tax","","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("151","12","_line_tax","","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("152","12","_line_tax_data","2020-12-14 19:06:17","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("153","12","delivery_charge","190","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("154","12","coupon_code","","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("155","12","coupon_taka","0","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("156","12","attribute_parent","20","26","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("157","13","_tax_class","","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("158","13","_qty","1","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("159","13","_product_id","21","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("160","13","_variation_id","","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("161","13","_line_subtotal","3000","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("162","13","_line_total","3000","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("163","13","_line_subtotal_tax","","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("164","13","_line_tax","","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("165","13","_line_tax_data","2020-12-14 19:11:52","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("166","13","delivery_charge","200","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("167","13","coupon_code","","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("168","13","coupon_taka","0","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("169","13","attribute_parent","21","27","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("170","14","_tax_class","","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("171","14","_qty","6","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("172","14","_product_id","21","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("173","14","_variation_id","","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("174","14","_line_subtotal","18000","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("175","14","_line_total","18000","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("176","14","_line_subtotal_tax","","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("177","14","_line_tax","","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("178","14","_line_tax_data","2020-12-14 19:14:24","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("179","14","delivery_charge","190","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("180","14","coupon_code","","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("181","14","coupon_taka","0","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("182","14","attribute_parent","21","28","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("183","15","_tax_class","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("184","15","_qty","1","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("185","15","_product_id","20","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("186","15","_variation_id","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("187","15","_line_subtotal","3000","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("188","15","_line_total","3000","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("189","15","_line_subtotal_tax","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("190","15","_line_tax","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("191","15","_line_tax_data","2020-12-14 19:47:34","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("192","15","delivery_charge","190","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("193","15","coupon_code","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("194","15","coupon_taka","0","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("195","15","attribute_parent","20","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("196","16","_tax_class","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("197","16","_qty","1","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("198","16","_product_id","4","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("199","16","_variation_id","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("200","16","_line_subtotal","3450","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("201","16","_line_total","3450","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("202","16","_line_subtotal_tax","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("203","16","_line_tax","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("204","16","_line_tax_data","2020-12-14 19:47:34","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("205","16","delivery_charge","190","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("206","16","coupon_code","","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("207","16","coupon_taka","0","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("208","16","attribute_parent","4","29","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("209","17","_tax_class","","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("210","17","_qty","1","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("211","17","_product_id","2","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("212","17","_variation_id","","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("213","17","_line_subtotal","3000","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("214","17","_line_total","3000","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("215","17","_line_subtotal_tax","","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("216","17","_line_tax","","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("217","17","_line_tax_data","2020-12-14 20:16:17","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("218","17","delivery_charge","190","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("219","17","coupon_code","","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("220","17","coupon_taka","0","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("221","17","attribute_parent","2","30","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("222","18","_tax_class","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("223","18","_qty","1","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("224","18","_product_id","21","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("225","18","_variation_id","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("226","18","_line_subtotal","3000","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("227","18","_line_total","3000","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("228","18","_line_subtotal_tax","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("229","18","_line_tax","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("230","18","_line_tax_data","2020-12-14 22:27:58","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("231","18","delivery_charge","190","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("232","18","coupon_code","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("233","18","coupon_taka","0","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("234","18","attribute_parent","21","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("235","19","_tax_class","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("236","19","_qty","1","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("237","19","_product_id","2","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("238","19","_variation_id","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("239","19","_line_subtotal","3000","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("240","19","_line_total","3000","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("241","19","_line_subtotal_tax","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("242","19","_line_tax","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("243","19","_line_tax_data","2020-12-14 22:27:58","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("244","19","delivery_charge","190","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("245","19","coupon_code","","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("246","19","coupon_taka","0","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("247","19","attribute_parent","2","31","2020-12-14","22");
INSERT INTO order_itemmeta VALUES("248","20","_tax_class","","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("249","20","_qty","14","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("250","20","_product_id","2","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("251","20","_variation_id","","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("252","20","_line_subtotal","42000","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("253","20","_line_total","42000","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("254","20","_line_subtotal_tax","","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("255","20","_line_tax","","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("256","20","_line_tax_data","2020-12-15 17:01:02","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("257","20","delivery_charge","190","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("258","20","coupon_code","","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("259","20","coupon_taka","0","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("260","20","attribute_parent","2","32","2020-12-15","0");
INSERT INTO order_itemmeta VALUES("261","21","_tax_class","","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("262","21","_qty","1","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("263","21","_product_id","21","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("264","21","_variation_id","","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("265","21","_line_subtotal","3000","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("266","21","_line_total","3000","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("267","21","_line_subtotal_tax","","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("268","21","_line_tax","","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("269","21","_line_tax_data","2020-12-19 16:57:38","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("270","21","delivery_charge","190","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("271","21","coupon_code","","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("272","21","coupon_taka","0","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("273","21","attribute_parent","21","33","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("274","22","_tax_class","","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("275","22","_qty","1","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("276","22","_product_id","2","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("277","22","_variation_id","","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("278","22","_line_subtotal","3000","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("279","22","_line_total","3000","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("280","22","_line_subtotal_tax","","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("281","22","_line_tax","","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("282","22","_line_tax_data","2020-12-19 17:04:24","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("283","22","delivery_charge","190","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("284","22","coupon_code","","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("285","22","coupon_taka","0","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("286","22","attribute_parent","2","34","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("287","23","_tax_class","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("288","23","_qty","1","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("289","23","_product_id","2","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("290","23","_variation_id","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("291","23","_line_subtotal","3000","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("292","23","_line_total","3000","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("293","23","_line_subtotal_tax","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("294","23","_line_tax","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("295","23","_line_tax_data","2020-12-19 17:47:37","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("296","23","delivery_charge","190","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("297","23","coupon_code","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("298","23","coupon_taka","0","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("299","23","attribute_parent","2","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("300","24","_tax_class","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("301","24","_qty","1","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("302","24","_product_id","3","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("303","24","_variation_id","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("304","24","_line_subtotal","3000","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("305","24","_line_total","3000","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("306","24","_line_subtotal_tax","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("307","24","_line_tax","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("308","24","_line_tax_data","2020-12-19 17:47:37","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("309","24","delivery_charge","190","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("310","24","coupon_code","","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("311","24","coupon_taka","0","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("312","24","attribute_parent","3","35","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("313","25","_tax_class","","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("314","25","_qty","1","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("315","25","_product_id","4","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("316","25","_variation_id","","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("317","25","_line_subtotal","3450","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("318","25","_line_total","3450","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("319","25","_line_subtotal_tax","","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("320","25","_line_tax","","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("321","25","_line_tax_data","2020-12-19 18:00:03","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("322","25","delivery_charge","190","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("323","25","coupon_code","","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("324","25","coupon_taka","0","36","2020-12-19","0");
INSERT INTO order_itemmeta VALUES("325","25","attribute_parent","4","36","2020-12-19","0");



CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_items VALUES("1","Demo Product","line-item","4","4","14");
INSERT INTO order_items VALUES("2","Attribute Product","line-item","2","1","14");
INSERT INTO order_items VALUES("3","Demo Product","line-item","4","4","15");
INSERT INTO order_items VALUES("4","Demo Product","line-item","4","4","16");
INSERT INTO order_items VALUES("5","Attribute Product","line-item","3","1","16");
INSERT INTO order_items VALUES("6","Attribute Product","line-item","2","1","17");
INSERT INTO order_items VALUES("7","Demo Product","line-item","4","4","18");
INSERT INTO order_items VALUES("8","Fresh Fruit","line-item","20","19","22");
INSERT INTO order_items VALUES("9","Demo Product","line-item","4","4","23");
INSERT INTO order_items VALUES("10","Fresh Fruit","line-item","21","19","24");
INSERT INTO order_items VALUES("11","Fresh Fruit","line-item","21","19","25");
INSERT INTO order_items VALUES("12","Fresh Fruit","line-item","20","19","26");
INSERT INTO order_items VALUES("13","Fresh Fruit","line-item","21","19","27");
INSERT INTO order_items VALUES("14","Fresh Fruit","line-item","21","19","28");
INSERT INTO order_items VALUES("15","Fresh Fruit","line-item","20","19","29");
INSERT INTO order_items VALUES("16","Demo Product","line-item","4","4","29");
INSERT INTO order_items VALUES("17","Attribute Product","line-item","2","1","30");
INSERT INTO order_items VALUES("18","Fresh Fruit","line-item","21","19","31");
INSERT INTO order_items VALUES("19","Attribute Product","line-item","2","1","31");
INSERT INTO order_items VALUES("20","Attribute Product","line-item","2","1","32");
INSERT INTO order_items VALUES("21","Fresh Fruit","line-item","21","19","33");
INSERT INTO order_items VALUES("22","Attribute Product","line-item","2","1","34");
INSERT INTO order_items VALUES("23","Attribute Product","line-item","2","1","35");
INSERT INTO order_items VALUES("24","Attribute Product","line-item","3","1","35");
INSERT INTO order_items VALUES("25","Demo Product","line-item","4","4","36");



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
) ENGINE=MyISAM AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO postmeta VALUES("1","1","stock_status","instock");
INSERT INTO postmeta VALUES("2","1","regular_price","5000");
INSERT INTO postmeta VALUES("3","1","sale_price","3000");
INSERT INTO postmeta VALUES("4","1","weight","");
INSERT INTO postmeta VALUES("5","1","length","");
INSERT INTO postmeta VALUES("6","1","width","");
INSERT INTO postmeta VALUES("7","1","height","");
INSERT INTO postmeta VALUES("8","1","product_stock","1000");
INSERT INTO postmeta VALUES("9","1","start_stock","1000");
INSERT INTO postmeta VALUES("10","1","alert_qty","60");
INSERT INTO postmeta VALUES("11","1","_sku","175");
INSERT INTO postmeta VALUES("12","1","attached_file","1607844740.jpg");
INSERT INTO postmeta VALUES("13","1","gallery_file","1.jpg");
INSERT INTO postmeta VALUES("14","1","gallery_file","2.jpg");
INSERT INTO postmeta VALUES("15","2","attribute","[{"taxonomy":"color","term":"R","term_id":"4"}]");
INSERT INTO postmeta VALUES("16","1","default_attribute","[{"taxonomy":"color","term":"R","term_id":"4"}]");
INSERT INTO postmeta VALUES("17","2","attribute_stock","68");
INSERT INTO postmeta VALUES("18","2","attribute_low_stock","60");
INSERT INTO postmeta VALUES("19","3","attribute","[{"taxonomy":"size","term":"XL","term_id":"7"}]");
INSERT INTO postmeta VALUES("20","1","default_attribute","[{"taxonomy":"size","term":"XL","term_id":"7"}]");
INSERT INTO postmeta VALUES("21","3","attribute_stock","77");
INSERT INTO postmeta VALUES("22","3","attribute_low_stock","60");
INSERT INTO postmeta VALUES("23","4","stock_status","instock");
INSERT INTO postmeta VALUES("24","4","regular_price","50001");
INSERT INTO postmeta VALUES("25","4","sale_price","3450");
INSERT INTO postmeta VALUES("26","4","weight","");
INSERT INTO postmeta VALUES("27","4","length","");
INSERT INTO postmeta VALUES("28","4","width","");
INSERT INTO postmeta VALUES("29","4","height","");
INSERT INTO postmeta VALUES("30","4","product_stock","2000");
INSERT INTO postmeta VALUES("31","4","start_stock","2000");
INSERT INTO postmeta VALUES("32","4","default_qty","1");
INSERT INTO postmeta VALUES("33","4","alert_qty","20");
INSERT INTO postmeta VALUES("34","4","_sku","116");
INSERT INTO postmeta VALUES("35","4","attached_file","1607844825.jpg");
INSERT INTO postmeta VALUES("36","4","gallery_file","002.jpg");
INSERT INTO postmeta VALUES("37","4","gallery_file","3.jpg");
INSERT INTO postmeta VALUES("38","5","first_name","Guest");
INSERT INTO postmeta VALUES("39","5","last_name","Guest");
INSERT INTO postmeta VALUES("40","5","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("41","5","address_two","");
INSERT INTO postmeta VALUES("42","5","phone","0000000001");
INSERT INTO postmeta VALUES("43","5","email","guest@email.com");
INSERT INTO postmeta VALUES("44","5","country","Bangladesh");
INSERT INTO postmeta VALUES("45","5","state","Dhaka");
INSERT INTO postmeta VALUES("46","5","city","Uttara");
INSERT INTO postmeta VALUES("47","5","zip","1900");
INSERT INTO postmeta VALUES("48","5","_customer_user","0");
INSERT INTO postmeta VALUES("49","5","_billing_postcode","1900");
INSERT INTO postmeta VALUES("50","5","_billing_company","");
INSERT INTO postmeta VALUES("51","5","_billing_last_name","");
INSERT INTO postmeta VALUES("52","5","_billing_first_name","");
INSERT INTO postmeta VALUES("53","5","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("54","6","first_name","khan");
INSERT INTO postmeta VALUES("55","6","last_name","Guest");
INSERT INTO postmeta VALUES("56","6","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("57","6","address_two","");
INSERT INTO postmeta VALUES("58","6","phone","126645");
INSERT INTO postmeta VALUES("59","6","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("60","6","country","Bangladesh");
INSERT INTO postmeta VALUES("61","6","state","Dhaka");
INSERT INTO postmeta VALUES("62","6","city","Uttara");
INSERT INTO postmeta VALUES("63","6","zip","1900");
INSERT INTO postmeta VALUES("64","6","_customer_user","22");
INSERT INTO postmeta VALUES("65","6","_billing_postcode","1900");
INSERT INTO postmeta VALUES("66","6","_billing_company","");
INSERT INTO postmeta VALUES("67","6","_billing_last_name","");
INSERT INTO postmeta VALUES("68","6","_billing_first_name","");
INSERT INTO postmeta VALUES("69","6","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("70","7","first_name","Guest");
INSERT INTO postmeta VALUES("71","7","last_name","Guest");
INSERT INTO postmeta VALUES("72","7","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("73","7","address_two","");
INSERT INTO postmeta VALUES("74","7","phone","0000000001");
INSERT INTO postmeta VALUES("75","7","email","guest@email.com");
INSERT INTO postmeta VALUES("76","7","country","Bangladesh");
INSERT INTO postmeta VALUES("77","7","state","Dhaka");
INSERT INTO postmeta VALUES("78","7","city","Uttara");
INSERT INTO postmeta VALUES("79","7","zip","1900");
INSERT INTO postmeta VALUES("80","7","_customer_user","0");
INSERT INTO postmeta VALUES("81","7","_billing_postcode","1900");
INSERT INTO postmeta VALUES("82","7","_billing_company","");
INSERT INTO postmeta VALUES("83","7","_billing_last_name","");
INSERT INTO postmeta VALUES("84","7","_billing_first_name","");
INSERT INTO postmeta VALUES("85","7","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("86","8","first_name","Guest");
INSERT INTO postmeta VALUES("87","8","last_name","Guest");
INSERT INTO postmeta VALUES("88","8","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("89","8","address_two","");
INSERT INTO postmeta VALUES("90","8","phone","0000000001");
INSERT INTO postmeta VALUES("91","8","email","guest@email.com");
INSERT INTO postmeta VALUES("92","8","country","Bangladesh");
INSERT INTO postmeta VALUES("93","8","state","Dhaka");
INSERT INTO postmeta VALUES("94","8","city","Uttara");
INSERT INTO postmeta VALUES("95","8","zip","1900");
INSERT INTO postmeta VALUES("96","8","_customer_user","0");
INSERT INTO postmeta VALUES("97","8","_billing_postcode","1900");
INSERT INTO postmeta VALUES("98","8","_billing_company","");
INSERT INTO postmeta VALUES("99","8","_billing_last_name","");
INSERT INTO postmeta VALUES("100","8","_billing_first_name","");
INSERT INTO postmeta VALUES("101","8","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("102","9","first_name","Guest");
INSERT INTO postmeta VALUES("103","9","last_name","Guest");
INSERT INTO postmeta VALUES("104","9","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("105","9","address_two","");
INSERT INTO postmeta VALUES("106","9","phone","0000000001");
INSERT INTO postmeta VALUES("107","9","email","guest@email.com");
INSERT INTO postmeta VALUES("108","9","country","Bangladesh");
INSERT INTO postmeta VALUES("109","9","state","Dhaka");
INSERT INTO postmeta VALUES("110","9","city","Uttara");
INSERT INTO postmeta VALUES("111","9","zip","1900");
INSERT INTO postmeta VALUES("112","9","_customer_user","0");
INSERT INTO postmeta VALUES("113","9","_billing_postcode","1900");
INSERT INTO postmeta VALUES("114","9","_billing_company","");
INSERT INTO postmeta VALUES("115","9","_billing_last_name","");
INSERT INTO postmeta VALUES("116","9","_billing_first_name","");
INSERT INTO postmeta VALUES("117","9","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("118","9","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("119","10","first_name","Demo");
INSERT INTO postmeta VALUES("120","10","last_name","Demo");
INSERT INTO postmeta VALUES("121","10","address_one","Uttara");
INSERT INTO postmeta VALUES("122","10","address_two","");
INSERT INTO postmeta VALUES("123","10","phone","6789");
INSERT INTO postmeta VALUES("124","10","email","demo@email.com");
INSERT INTO postmeta VALUES("125","10","country","Bangladesh");
INSERT INTO postmeta VALUES("126","10","state","Dhaka");
INSERT INTO postmeta VALUES("127","10","city","Uttara");
INSERT INTO postmeta VALUES("128","10","zip","1900");
INSERT INTO postmeta VALUES("129","10","_customer_user","2");
INSERT INTO postmeta VALUES("130","10","_billing_postcode","1900");
INSERT INTO postmeta VALUES("131","10","_billing_company","");
INSERT INTO postmeta VALUES("132","10","_billing_last_name","");
INSERT INTO postmeta VALUES("133","10","_billing_first_name","");
INSERT INTO postmeta VALUES("134","10","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("135","10","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("136","11","first_name","Demo");
INSERT INTO postmeta VALUES("137","11","last_name","Demo");
INSERT INTO postmeta VALUES("138","11","address_one","Uttara");
INSERT INTO postmeta VALUES("139","11","address_two","");
INSERT INTO postmeta VALUES("140","11","phone","6789");
INSERT INTO postmeta VALUES("141","11","email","demo@email.com");
INSERT INTO postmeta VALUES("142","11","country","Bangladesh");
INSERT INTO postmeta VALUES("143","11","state","Dhaka");
INSERT INTO postmeta VALUES("144","11","city","Uttara");
INSERT INTO postmeta VALUES("145","11","zip","1900");
INSERT INTO postmeta VALUES("146","11","_customer_user","2");
INSERT INTO postmeta VALUES("147","11","_billing_postcode","1900");
INSERT INTO postmeta VALUES("148","11","_billing_company","");
INSERT INTO postmeta VALUES("149","11","_billing_last_name","");
INSERT INTO postmeta VALUES("150","11","_billing_first_name","");
INSERT INTO postmeta VALUES("151","11","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("152","12","first_name","Demo");
INSERT INTO postmeta VALUES("153","12","last_name","Demo");
INSERT INTO postmeta VALUES("154","12","address_one","Uttara");
INSERT INTO postmeta VALUES("155","12","address_two","");
INSERT INTO postmeta VALUES("156","12","phone","6789");
INSERT INTO postmeta VALUES("157","12","email","demo@email.com");
INSERT INTO postmeta VALUES("158","12","country","Bangladesh");
INSERT INTO postmeta VALUES("159","12","state","Dhaka");
INSERT INTO postmeta VALUES("160","12","city","Uttara");
INSERT INTO postmeta VALUES("161","12","zip","1900");
INSERT INTO postmeta VALUES("162","12","_customer_user","2");
INSERT INTO postmeta VALUES("163","12","_billing_postcode","1900");
INSERT INTO postmeta VALUES("164","12","_billing_company","");
INSERT INTO postmeta VALUES("165","12","_billing_last_name","");
INSERT INTO postmeta VALUES("166","12","_billing_first_name","");
INSERT INTO postmeta VALUES("167","12","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("168","12","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("169","13","first_name","Demo");
INSERT INTO postmeta VALUES("170","13","last_name","Demo");
INSERT INTO postmeta VALUES("171","13","address_one","Uttara");
INSERT INTO postmeta VALUES("172","13","address_two","");
INSERT INTO postmeta VALUES("173","13","phone","6789");
INSERT INTO postmeta VALUES("174","13","email","demo@email.com");
INSERT INTO postmeta VALUES("175","13","country","Bangladesh");
INSERT INTO postmeta VALUES("176","13","state","Dhaka");
INSERT INTO postmeta VALUES("177","13","city","Uttara");
INSERT INTO postmeta VALUES("178","13","zip","1900");
INSERT INTO postmeta VALUES("179","13","_customer_user","2");
INSERT INTO postmeta VALUES("180","13","_billing_postcode","1900");
INSERT INTO postmeta VALUES("181","13","_billing_company","");
INSERT INTO postmeta VALUES("182","13","_billing_last_name","");
INSERT INTO postmeta VALUES("183","13","_billing_first_name","");
INSERT INTO postmeta VALUES("184","13","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("185","13","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("186","14","first_name","Demo");
INSERT INTO postmeta VALUES("187","14","last_name","Demo");
INSERT INTO postmeta VALUES("188","14","address_one","Uttara");
INSERT INTO postmeta VALUES("189","14","address_two","");
INSERT INTO postmeta VALUES("190","14","phone","6789");
INSERT INTO postmeta VALUES("191","14","email","demo@email.com");
INSERT INTO postmeta VALUES("192","14","country","Bangladesh");
INSERT INTO postmeta VALUES("193","14","state","Dhaka");
INSERT INTO postmeta VALUES("194","14","city","Uttara");
INSERT INTO postmeta VALUES("195","14","zip","1900");
INSERT INTO postmeta VALUES("196","14","_customer_user","2");
INSERT INTO postmeta VALUES("197","14","_billing_postcode","1900");
INSERT INTO postmeta VALUES("198","14","_billing_company","");
INSERT INTO postmeta VALUES("199","14","_billing_last_name","");
INSERT INTO postmeta VALUES("200","14","_billing_first_name","");
INSERT INTO postmeta VALUES("201","14","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("202","14","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("203","15","first_name","Demo");
INSERT INTO postmeta VALUES("204","15","last_name","Demo");
INSERT INTO postmeta VALUES("205","15","address_one","Uttara");
INSERT INTO postmeta VALUES("206","15","address_two","");
INSERT INTO postmeta VALUES("207","15","phone","6789");
INSERT INTO postmeta VALUES("208","15","email","demo@email.com");
INSERT INTO postmeta VALUES("209","15","country","Bangladesh");
INSERT INTO postmeta VALUES("210","15","state","Dhaka");
INSERT INTO postmeta VALUES("211","15","city","Uttara");
INSERT INTO postmeta VALUES("212","15","zip","1900");
INSERT INTO postmeta VALUES("213","15","_customer_user","2");
INSERT INTO postmeta VALUES("214","15","_billing_postcode","1900");
INSERT INTO postmeta VALUES("215","15","_billing_company","");
INSERT INTO postmeta VALUES("216","15","_billing_last_name","");
INSERT INTO postmeta VALUES("217","15","_billing_first_name","");
INSERT INTO postmeta VALUES("218","15","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("219","16","first_name","Demo");
INSERT INTO postmeta VALUES("220","16","last_name","Demo");
INSERT INTO postmeta VALUES("221","16","address_one","Uttara");
INSERT INTO postmeta VALUES("222","16","address_two","");
INSERT INTO postmeta VALUES("223","16","phone","6789");
INSERT INTO postmeta VALUES("224","16","email","demo@email.com");
INSERT INTO postmeta VALUES("225","16","country","Bangladesh");
INSERT INTO postmeta VALUES("226","16","state","Dhaka");
INSERT INTO postmeta VALUES("227","16","city","Uttara");
INSERT INTO postmeta VALUES("228","16","zip","1900");
INSERT INTO postmeta VALUES("229","16","_customer_user","2");
INSERT INTO postmeta VALUES("230","16","_billing_postcode","1900");
INSERT INTO postmeta VALUES("231","16","_billing_company","");
INSERT INTO postmeta VALUES("232","16","_billing_last_name","");
INSERT INTO postmeta VALUES("233","16","_billing_first_name","");
INSERT INTO postmeta VALUES("234","16","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("235","17","first_name","Demo");
INSERT INTO postmeta VALUES("236","17","last_name","Demo");
INSERT INTO postmeta VALUES("237","17","address_one","Uttara");
INSERT INTO postmeta VALUES("238","17","address_two","");
INSERT INTO postmeta VALUES("239","17","phone","6789");
INSERT INTO postmeta VALUES("240","17","email","demo@email.com");
INSERT INTO postmeta VALUES("241","17","country","Bangladesh");
INSERT INTO postmeta VALUES("242","17","state","Dhaka");
INSERT INTO postmeta VALUES("243","17","city","Uttara");
INSERT INTO postmeta VALUES("244","17","zip","1900");
INSERT INTO postmeta VALUES("245","17","_customer_user","2");
INSERT INTO postmeta VALUES("246","17","_billing_postcode","1900");
INSERT INTO postmeta VALUES("247","17","_billing_company","");
INSERT INTO postmeta VALUES("248","17","_billing_last_name","");
INSERT INTO postmeta VALUES("249","17","_billing_first_name","");
INSERT INTO postmeta VALUES("250","17","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("251","17","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("252","16","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("253","15","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("254","18","first_name","Demo");
INSERT INTO postmeta VALUES("255","18","last_name","Demo");
INSERT INTO postmeta VALUES("256","18","address_one","Uttara");
INSERT INTO postmeta VALUES("257","18","address_two","");
INSERT INTO postmeta VALUES("258","18","phone","6789");
INSERT INTO postmeta VALUES("259","18","email","demo@email.com");
INSERT INTO postmeta VALUES("260","18","country","Bangladesh");
INSERT INTO postmeta VALUES("261","18","state","Dhaka");
INSERT INTO postmeta VALUES("262","18","city","Uttara");
INSERT INTO postmeta VALUES("263","18","zip","1900");
INSERT INTO postmeta VALUES("264","18","_customer_user","2");
INSERT INTO postmeta VALUES("265","18","_billing_postcode","1900");
INSERT INTO postmeta VALUES("266","18","_billing_company","");
INSERT INTO postmeta VALUES("267","18","_billing_last_name","");
INSERT INTO postmeta VALUES("268","18","_billing_first_name","");
INSERT INTO postmeta VALUES("269","18","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("270","18","processing_date","2020-12-13");
INSERT INTO postmeta VALUES("271","19","stock_status","");
INSERT INTO postmeta VALUES("272","19","regular_price","5000");
INSERT INTO postmeta VALUES("273","19","sale_price","3000");
INSERT INTO postmeta VALUES("274","19","weight","");
INSERT INTO postmeta VALUES("275","19","length","");
INSERT INTO postmeta VALUES("276","19","width","");
INSERT INTO postmeta VALUES("277","19","height","");
INSERT INTO postmeta VALUES("278","19","product_stock","2000");
INSERT INTO postmeta VALUES("279","19","start_stock","2000");
INSERT INTO postmeta VALUES("280","19","alert_qty","50");
INSERT INTO postmeta VALUES("281","19","_sku","460");
INSERT INTO postmeta VALUES("282","19","attached_file","1607922365.jpg");
INSERT INTO postmeta VALUES("283","19","gallery_file","b2.jpg");
INSERT INTO postmeta VALUES("284","19","gallery_file","Baby.jpeg");
INSERT INTO postmeta VALUES("285","20","attribute","[{"taxonomy":"color","term":"R","term_id":"4"},{"taxonomy":"size","term":"XL","term_id":"7"}]");
INSERT INTO postmeta VALUES("286","19","default_attribute","[{"taxonomy":"color","term":"R","term_id":"4"},{"taxonomy":"size","term":"XL","term_id":"7"}]");
INSERT INTO postmeta VALUES("287","20","attribute_stock","0");
INSERT INTO postmeta VALUES("288","20","attribute_low_stock","50");
INSERT INTO postmeta VALUES("289","21","attribute","[{"taxonomy":"color","term":"B","term_id":"5"},{"taxonomy":"size","term":"M","term_id":"8"}]");
INSERT INTO postmeta VALUES("290","19","default_attribute","[{"taxonomy":"color","term":"B","term_id":"5"},{"taxonomy":"size","term":"M","term_id":"8"}]");
INSERT INTO postmeta VALUES("291","21","attribute_stock","76");
INSERT INTO postmeta VALUES("292","21","attribute_low_stock","50");
INSERT INTO postmeta VALUES("293","22","first_name","Guest");
INSERT INTO postmeta VALUES("294","22","last_name","Guest");
INSERT INTO postmeta VALUES("295","22","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("296","22","address_two","");
INSERT INTO postmeta VALUES("297","22","phone","0000000001");
INSERT INTO postmeta VALUES("298","22","email","guest@email.com");
INSERT INTO postmeta VALUES("299","22","country","Bangladesh");
INSERT INTO postmeta VALUES("300","22","state","Dhaka");
INSERT INTO postmeta VALUES("301","22","city","Uttara");
INSERT INTO postmeta VALUES("302","22","zip","1900");
INSERT INTO postmeta VALUES("303","22","_customer_user","0");
INSERT INTO postmeta VALUES("304","22","_billing_postcode","1900");
INSERT INTO postmeta VALUES("305","22","_billing_company","");
INSERT INTO postmeta VALUES("306","22","_billing_last_name","");
INSERT INTO postmeta VALUES("307","22","_billing_first_name","");
INSERT INTO postmeta VALUES("308","22","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("309","22","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("310","23","first_name","Guest");
INSERT INTO postmeta VALUES("311","23","last_name","Guest");
INSERT INTO postmeta VALUES("312","23","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("313","23","address_two","");
INSERT INTO postmeta VALUES("314","23","phone","0000000001");
INSERT INTO postmeta VALUES("315","23","email","guest@email.com");
INSERT INTO postmeta VALUES("316","23","country","Bangladesh");
INSERT INTO postmeta VALUES("317","23","state","Dhaka");
INSERT INTO postmeta VALUES("318","23","city","Uttara");
INSERT INTO postmeta VALUES("319","23","zip","1900");
INSERT INTO postmeta VALUES("320","23","_customer_user","0");
INSERT INTO postmeta VALUES("321","23","_billing_postcode","1900");
INSERT INTO postmeta VALUES("322","23","_billing_company","");
INSERT INTO postmeta VALUES("323","23","_billing_last_name","");
INSERT INTO postmeta VALUES("324","23","_billing_first_name","");
INSERT INTO postmeta VALUES("325","23","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("326","23","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("327","24","first_name","khan");
INSERT INTO postmeta VALUES("328","24","last_name","Guest");
INSERT INTO postmeta VALUES("329","24","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("330","24","address_two","");
INSERT INTO postmeta VALUES("331","24","phone","126645");
INSERT INTO postmeta VALUES("332","24","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("333","24","country","Bangladesh");
INSERT INTO postmeta VALUES("334","24","state","Dhaka");
INSERT INTO postmeta VALUES("335","24","city","Uttara");
INSERT INTO postmeta VALUES("336","24","zip","1900");
INSERT INTO postmeta VALUES("337","24","_customer_user","22");
INSERT INTO postmeta VALUES("338","24","_billing_postcode","1900");
INSERT INTO postmeta VALUES("339","24","_billing_company","");
INSERT INTO postmeta VALUES("340","24","_billing_last_name","");
INSERT INTO postmeta VALUES("341","24","_billing_first_name","");
INSERT INTO postmeta VALUES("342","24","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("343","24","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("344","25","first_name","khan");
INSERT INTO postmeta VALUES("345","25","last_name","Guest");
INSERT INTO postmeta VALUES("346","25","address_one","JJJ");
INSERT INTO postmeta VALUES("347","25","address_two","");
INSERT INTO postmeta VALUES("348","25","phone","126645");
INSERT INTO postmeta VALUES("349","25","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("350","25","country","Bangladesh");
INSERT INTO postmeta VALUES("351","25","state","Dhaka");
INSERT INTO postmeta VALUES("352","25","city","Uttara");
INSERT INTO postmeta VALUES("353","25","zip","1900");
INSERT INTO postmeta VALUES("354","25","_customer_user","22");
INSERT INTO postmeta VALUES("355","25","_billing_postcode","1900");
INSERT INTO postmeta VALUES("356","25","_billing_company","");
INSERT INTO postmeta VALUES("357","25","_billing_last_name","");
INSERT INTO postmeta VALUES("358","25","_billing_first_name","");
INSERT INTO postmeta VALUES("359","25","payment_method","DeliveryChargeOnly");
INSERT INTO postmeta VALUES("360","26","first_name","khan");
INSERT INTO postmeta VALUES("361","26","last_name","rana");
INSERT INTO postmeta VALUES("362","26","address_one","dhaka");
INSERT INTO postmeta VALUES("363","26","address_two","");
INSERT INTO postmeta VALUES("364","26","phone","126645");
INSERT INTO postmeta VALUES("365","26","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("366","26","country","Bangladesh");
INSERT INTO postmeta VALUES("367","26","state","Dhaka");
INSERT INTO postmeta VALUES("368","26","city","Uttara");
INSERT INTO postmeta VALUES("369","26","zip","1900");
INSERT INTO postmeta VALUES("370","26","_customer_user","22");
INSERT INTO postmeta VALUES("371","26","_billing_postcode","1900");
INSERT INTO postmeta VALUES("372","26","_billing_company","");
INSERT INTO postmeta VALUES("373","26","_billing_last_name","");
INSERT INTO postmeta VALUES("374","26","_billing_first_name","");
INSERT INTO postmeta VALUES("375","26","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("376","26","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("377","27","first_name","khan");
INSERT INTO postmeta VALUES("378","27","last_name","Guest");
INSERT INTO postmeta VALUES("379","27","address_one","dhaka");
INSERT INTO postmeta VALUES("380","27","address_two","");
INSERT INTO postmeta VALUES("381","27","phone","126645");
INSERT INTO postmeta VALUES("382","27","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("383","27","country","Bangladesh");
INSERT INTO postmeta VALUES("384","27","state","Comilla");
INSERT INTO postmeta VALUES("385","27","city","Laksam");
INSERT INTO postmeta VALUES("386","27","zip","1340");
INSERT INTO postmeta VALUES("387","27","_customer_user","22");
INSERT INTO postmeta VALUES("388","27","_billing_postcode","1340");
INSERT INTO postmeta VALUES("389","27","_billing_company","");
INSERT INTO postmeta VALUES("390","27","_billing_last_name","");
INSERT INTO postmeta VALUES("391","27","_billing_first_name","");
INSERT INTO postmeta VALUES("392","27","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("393","28","first_name","khan");
INSERT INTO postmeta VALUES("394","28","last_name","Guest");
INSERT INTO postmeta VALUES("395","28","address_one","dhaka");
INSERT INTO postmeta VALUES("396","28","address_two","");
INSERT INTO postmeta VALUES("397","28","phone","126645");
INSERT INTO postmeta VALUES("398","28","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("399","28","country","Bangladesh");
INSERT INTO postmeta VALUES("400","28","state","Dhaka");
INSERT INTO postmeta VALUES("401","28","city","Uttara");
INSERT INTO postmeta VALUES("402","28","zip","1900");
INSERT INTO postmeta VALUES("403","28","_customer_user","22");
INSERT INTO postmeta VALUES("404","28","_billing_postcode","1900");
INSERT INTO postmeta VALUES("405","28","_billing_company","");
INSERT INTO postmeta VALUES("406","28","_billing_last_name","");
INSERT INTO postmeta VALUES("407","28","_billing_first_name","");
INSERT INTO postmeta VALUES("408","28","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("409","28","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("410","27","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("411","29","first_name","khan");
INSERT INTO postmeta VALUES("412","29","last_name","Guest");
INSERT INTO postmeta VALUES("413","29","address_one","dhaka");
INSERT INTO postmeta VALUES("414","29","address_two","");
INSERT INTO postmeta VALUES("415","29","phone","126645");
INSERT INTO postmeta VALUES("416","29","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("417","29","country","Bangladesh");
INSERT INTO postmeta VALUES("418","29","state","Dhaka");
INSERT INTO postmeta VALUES("419","29","city","Uttara");
INSERT INTO postmeta VALUES("420","29","zip","1900");
INSERT INTO postmeta VALUES("421","29","_customer_user","22");
INSERT INTO postmeta VALUES("422","29","_billing_postcode","1900");
INSERT INTO postmeta VALUES("423","29","_billing_company","");
INSERT INTO postmeta VALUES("424","29","_billing_last_name","");
INSERT INTO postmeta VALUES("425","29","_billing_first_name","");
INSERT INTO postmeta VALUES("426","29","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("444","29","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("428","30","first_name","khan");
INSERT INTO postmeta VALUES("429","30","last_name","Guest");
INSERT INTO postmeta VALUES("430","30","address_one","dhaka");
INSERT INTO postmeta VALUES("431","30","address_two","");
INSERT INTO postmeta VALUES("432","30","phone","126645");
INSERT INTO postmeta VALUES("433","30","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("434","30","country","Bangladesh");
INSERT INTO postmeta VALUES("435","30","state","Dhaka");
INSERT INTO postmeta VALUES("436","30","city","Uttara");
INSERT INTO postmeta VALUES("437","30","zip","1900");
INSERT INTO postmeta VALUES("438","30","_customer_user","22");
INSERT INTO postmeta VALUES("439","30","_billing_postcode","1900");
INSERT INTO postmeta VALUES("440","30","_billing_company","");
INSERT INTO postmeta VALUES("441","30","_billing_last_name","");
INSERT INTO postmeta VALUES("442","30","_billing_first_name","");
INSERT INTO postmeta VALUES("443","30","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("445","31","first_name","khan");
INSERT INTO postmeta VALUES("446","31","last_name","Guest");
INSERT INTO postmeta VALUES("447","31","address_one","dhaka");
INSERT INTO postmeta VALUES("448","31","address_two","");
INSERT INTO postmeta VALUES("449","31","phone","126645");
INSERT INTO postmeta VALUES("450","31","email","sohelahmeditebd@gmail.com");
INSERT INTO postmeta VALUES("451","31","country","Bangladesh");
INSERT INTO postmeta VALUES("452","31","state","Dhaka");
INSERT INTO postmeta VALUES("453","31","city","Uttara");
INSERT INTO postmeta VALUES("454","31","zip","1900");
INSERT INTO postmeta VALUES("455","31","_customer_user","22");
INSERT INTO postmeta VALUES("456","31","_billing_postcode","1900");
INSERT INTO postmeta VALUES("457","31","_billing_company","");
INSERT INTO postmeta VALUES("458","31","_billing_last_name","");
INSERT INTO postmeta VALUES("459","31","_billing_first_name","");
INSERT INTO postmeta VALUES("460","31","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("461","31","processing_date","2020-12-14");
INSERT INTO postmeta VALUES("462","32","first_name","Guest");
INSERT INTO postmeta VALUES("463","32","last_name","Guest");
INSERT INTO postmeta VALUES("464","32","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("465","32","address_two","");
INSERT INTO postmeta VALUES("466","32","phone","0000000001");
INSERT INTO postmeta VALUES("467","32","email","guest@email.com");
INSERT INTO postmeta VALUES("468","32","country","Bangladesh");
INSERT INTO postmeta VALUES("469","32","state","Dhaka");
INSERT INTO postmeta VALUES("470","32","city","Uttara");
INSERT INTO postmeta VALUES("471","32","zip","1900");
INSERT INTO postmeta VALUES("472","32","_customer_user","0");
INSERT INTO postmeta VALUES("473","32","_billing_postcode","1900");
INSERT INTO postmeta VALUES("474","32","_billing_company","");
INSERT INTO postmeta VALUES("475","32","_billing_last_name","");
INSERT INTO postmeta VALUES("476","32","_billing_first_name","");
INSERT INTO postmeta VALUES("477","32","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("478","20","product_status","reject");
INSERT INTO postmeta VALUES("479","20","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("480","20","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("481","20","reject_qty","0");
INSERT INTO postmeta VALUES("482","21","product_status","reject");
INSERT INTO postmeta VALUES("483","21","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("484","21","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("485","21","reject_qty","12");
INSERT INTO postmeta VALUES("486","4","product_status","reject");
INSERT INTO postmeta VALUES("487","4","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("488","4","reject_qty","1");
INSERT INTO postmeta VALUES("489","2","product_status","reject");
INSERT INTO postmeta VALUES("490","2","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("491","2","reject_qty","1");
INSERT INTO postmeta VALUES("492","3","product_status","reject");
INSERT INTO postmeta VALUES("493","3","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("494","3","reject_qty","2");
INSERT INTO postmeta VALUES("495","2","product_status","reject");
INSERT INTO postmeta VALUES("496","2","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("497","2","reject_qty","2");
INSERT INTO postmeta VALUES("498","3","product_status","reject");
INSERT INTO postmeta VALUES("499","3","reject_date","2020-12-15");
INSERT INTO postmeta VALUES("500","3","reject_qty","5");
INSERT INTO postmeta VALUES("501","33","first_name","Guest");
INSERT INTO postmeta VALUES("502","33","last_name","Guest");
INSERT INTO postmeta VALUES("503","33","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("504","33","address_two","");
INSERT INTO postmeta VALUES("505","33","phone","0000000001");
INSERT INTO postmeta VALUES("506","33","email","guest@email.com");
INSERT INTO postmeta VALUES("507","33","country","Bangladesh");
INSERT INTO postmeta VALUES("508","33","state","Dhaka");
INSERT INTO postmeta VALUES("509","33","city","Uttara");
INSERT INTO postmeta VALUES("510","33","zip","1900");
INSERT INTO postmeta VALUES("511","33","_customer_user","0");
INSERT INTO postmeta VALUES("512","33","_billing_postcode","1900");
INSERT INTO postmeta VALUES("513","33","_billing_company","");
INSERT INTO postmeta VALUES("514","33","_billing_last_name","");
INSERT INTO postmeta VALUES("515","33","_billing_first_name","");
INSERT INTO postmeta VALUES("516","33","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("517","34","first_name","Guest");
INSERT INTO postmeta VALUES("518","34","last_name","Guest");
INSERT INTO postmeta VALUES("519","34","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("520","34","address_two","");
INSERT INTO postmeta VALUES("521","34","phone","0000000001");
INSERT INTO postmeta VALUES("522","34","email","guest@email.com");
INSERT INTO postmeta VALUES("523","34","country","Bangladesh");
INSERT INTO postmeta VALUES("524","34","state","Dhaka");
INSERT INTO postmeta VALUES("525","34","city","Uttara");
INSERT INTO postmeta VALUES("526","34","zip","1900");
INSERT INTO postmeta VALUES("527","34","_customer_user","0");
INSERT INTO postmeta VALUES("528","34","_billing_postcode","1900");
INSERT INTO postmeta VALUES("529","34","_billing_company","");
INSERT INTO postmeta VALUES("530","34","_billing_last_name","");
INSERT INTO postmeta VALUES("531","34","_billing_first_name","");
INSERT INTO postmeta VALUES("532","34","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("533","35","first_name","Guest");
INSERT INTO postmeta VALUES("534","35","last_name","Guest");
INSERT INTO postmeta VALUES("535","35","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("536","35","address_two","");
INSERT INTO postmeta VALUES("537","35","phone","0000000001");
INSERT INTO postmeta VALUES("538","35","email","guest@email.com");
INSERT INTO postmeta VALUES("539","35","country","Bangladesh");
INSERT INTO postmeta VALUES("540","35","state","Dhaka");
INSERT INTO postmeta VALUES("541","35","city","Uttara");
INSERT INTO postmeta VALUES("542","35","zip","1900");
INSERT INTO postmeta VALUES("543","35","_customer_user","0");
INSERT INTO postmeta VALUES("544","35","_billing_postcode","1900");
INSERT INTO postmeta VALUES("545","35","_billing_company","");
INSERT INTO postmeta VALUES("546","35","_billing_last_name","");
INSERT INTO postmeta VALUES("547","35","_billing_first_name","");
INSERT INTO postmeta VALUES("548","35","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("549","36","first_name","Guest");
INSERT INTO postmeta VALUES("550","36","last_name","Guest");
INSERT INTO postmeta VALUES("551","36","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("552","36","address_two","");
INSERT INTO postmeta VALUES("553","36","phone","0000000001");
INSERT INTO postmeta VALUES("554","36","email","guest@email.com");
INSERT INTO postmeta VALUES("555","36","country","Bangladesh");
INSERT INTO postmeta VALUES("556","36","state","Dhaka");
INSERT INTO postmeta VALUES("557","36","city","Uttara");
INSERT INTO postmeta VALUES("558","36","zip","1900");
INSERT INTO postmeta VALUES("559","36","_customer_user","0");
INSERT INTO postmeta VALUES("560","36","_billing_postcode","1900");
INSERT INTO postmeta VALUES("561","36","_billing_company","");
INSERT INTO postmeta VALUES("562","36","_billing_last_name","");
INSERT INTO postmeta VALUES("563","36","_billing_first_name","");
INSERT INTO postmeta VALUES("564","36","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("565","36","processing_date","2020-12-19");
INSERT INTO postmeta VALUES("566","35","processing_date","2020-12-19");



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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES("1","2","2020-12-13 13:31:00","2020-12-13 19:31:00","<p>sdfdsf</p>","Attribute Product","<p>dfsgdfgfd</p>","publish","open","open","","Attribute Product","","","2020-12-13 13:32:20","2020-12-13 13:32:20","","0","","0","product","","0");
INSERT INTO posts VALUES("2","0","2020-12-13 13:32:20","2020-12-13 13:32:20","","","","publish","open","open","","","","","2020-12-13 13:32:20","2020-12-13 13:32:20","","1","","0","product_varient","","0");
INSERT INTO posts VALUES("3","0","2020-12-13 13:32:20","2020-12-13 13:32:20","","","","publish","open","open","","","","","2020-12-13 13:32:20","2020-12-13 13:32:20","","1","","0","product_varient","","0");
INSERT INTO posts VALUES("4","2","2020-12-13 13:32:00","2020-12-13 19:32:00","<p>asdsadsa</p>","Demo Product","<p>sadasdsad</p>","publish","open","open","","Demo Product","","","2020-12-13 13:33:45","2020-12-13 13:33:45","","0","","0","product","","0");
INSERT INTO posts VALUES("19","2","2020-12-14 11:04:00","2020-12-14 17:04:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","Fresh Fruit","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","publish","open","open","","Fresh Fruit","","","2020-12-14 11:06:05","2020-12-14 11:06:05","","0","","0","product","","0");
INSERT INTO posts VALUES("18","2","2020-12-13 00:00:00","2020-12-13 23:54:07","","Order2020-12-13 17:54:07","","cancelled","open","open","order_1247","order-Dec-13-2020-1712","","","2020-12-13 17:54:27","2020-12-13 17:54:07","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("17","2","2020-12-13 00:00:00","2020-12-13 22:40:09","","Order2020-12-13 16:40:09","","dispatch_complete","open","open","order_1247","order-Dec-13-2020-1612","","","2020-12-13 17:31:03","2020-12-13 16:40:09","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("16","2","2020-12-13 00:00:00","2020-12-13 22:04:30","","Order2020-12-13 16:04:30","","dispatch_complete","open","open","order_1247","order-Dec-13-2020-1612","","","2020-12-13 17:10:35","2020-12-13 16:04:30","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("15","2","2020-12-13 00:00:00","2020-12-13 21:57:18","","Order2020-12-13 15:57:18","","dispatch_complete","open","open","order_1247","order-Dec-13-2020-1512","","","2020-12-13 17:46:39","2020-12-13 15:57:18","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("14","2","2020-12-13 00:00:00","2020-12-13 21:22:41","","Order2020-12-13 15:22:41","","cancelled","open","open","order_1247","order-Dec-13-2020-1512","","","2020-12-13 15:35:14","2020-12-13 15:22:41","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("20","0","2020-12-14 11:06:05","2020-12-14 11:06:05","","","","publish","open","open","","","","","2020-12-14 11:06:05","2020-12-14 11:06:05","","19","","0","product_varient","","0");
INSERT INTO posts VALUES("21","0","2020-12-14 11:06:05","2020-12-14 11:06:05","","","","publish","open","open","","","","","2020-12-14 11:06:05","2020-12-14 11:06:05","","19","","0","product_varient","","0");
INSERT INTO posts VALUES("22","0","2020-12-14 00:00:00","2020-12-14 18:26:24","","Order2020-12-14 12:26:24","","cancelled","open","open","order_1247","order-Dec-14-2020-1212","","","2020-12-14 12:33:51","2020-12-14 12:26:24","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("23","0","2020-12-14 00:00:00","2020-12-14 18:43:18","","Order2020-12-14 12:43:18","","delivered","open","open","order_1247","order-Dec-14-2020-1212","","","2020-12-14 12:43:38","2020-12-14 12:43:18","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("24","22","2020-12-14 00:00:00","2020-12-14 19:00:53","","Order2020-12-14 13:00:53","","dispatch_complete","open","open","order_1247","order-Dec-14-2020-1312","","","2020-12-15 14:16:10","2020-12-14 13:00:53","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("25","22","2020-12-14 00:00:00","2020-12-14 19:04:07","","Order2020-12-14 13:04:07","","on-hold","open","open","order_1247","order-Dec-14-2020-1312","","","2020-12-14 13:04:07","2020-12-14 13:04:07","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("26","22","2020-12-14 00:00:00","2020-12-14 19:06:17","","Order2020-12-14 13:06:17","","processing","open","open","order_1247","order-Dec-14-2020-1312","","","2020-12-14 13:06:54","2020-12-14 13:06:17","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("27","22","2020-12-14 00:00:00","2020-12-14 19:11:52","","Order2020-12-14 13:11:52","","processing","open","open","order_1247","order-Dec-14-2020-1312","","","2020-12-14 13:25:52","2020-12-14 13:11:52","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("28","22","2020-12-14 00:00:00","2020-12-14 19:14:24","","Order2020-12-14 13:14:24","","processing","open","open","order_1247","order-Dec-14-2020-1312","","","2020-12-14 13:22:06","2020-12-14 13:14:24","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("29","22","2020-12-14 00:00:00","2020-12-14 19:47:34","","Order2020-12-14 13:47:34","","dispatch","open","open","order_1247","order-Dec-14-2020-1312","","","2020-12-14 16:23:34","2020-12-14 13:47:34","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("30","22","2020-12-14 00:00:00","2020-12-14 20:16:17","","Order2020-12-14 14:16:17","","on-hold","open","open","order_1247","order-Dec-14-2020-1412","","","2020-12-14 14:16:17","2020-12-14 14:16:17","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("31","22","2020-12-14 00:00:00","2020-12-14 22:27:58","","Order2020-12-14 16:27:58","","processing","open","open","order_1247","order-Dec-14-2020-1612","","","2020-12-14 16:28:20","2020-12-14 16:27:58","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("32","0","2020-12-15 00:00:00","2020-12-15 17:01:02","","Order2020-12-15 11:01:02","","on-hold","open","open","order_1247","order-Dec-15-2020-1112","","","2020-12-15 11:01:02","2020-12-15 11:01:02","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("33","0","2020-12-19 00:00:00","2020-12-19 16:57:38","","Order2020-12-19 10:57:38","","on-hold","open","open","order_1247","order-Dec-19-2020-1012","","","2020-12-19 10:57:38","2020-12-19 10:57:38","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("34","0","2020-12-19 00:00:00","2020-12-19 17:04:24","","Order2020-12-19 11:04:24","","on-hold","open","open","order_1247","order-Dec-19-2020-1112","","","2020-12-19 11:04:24","2020-12-19 11:04:24","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("35","0","2020-12-19 00:00:00","2020-12-19 17:47:37","","Order2020-12-19 11:47:37","","processing","open","open","order_1247","order-Dec-19-2020-1112","","","2020-12-19 12:36:15","2020-12-19 11:47:37","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("36","0","2020-12-19 00:00:00","2020-12-19 18:00:03","","Order2020-12-19 12:00:03","","processing","open","open","order_1247","order-Dec-19-2020-1212","","","2020-12-19 12:34:20","2020-12-19 12:00:03","","0","","0","shop_order","","0");



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




CREATE TABLE `temp_attribute_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_relationships VALUES("1","2","0");
INSERT INTO term_relationships VALUES("1","1","0");
INSERT INTO term_relationships VALUES("4","3","0");
INSERT INTO term_relationships VALUES("4","10","0");
INSERT INTO term_relationships VALUES("19","2","0");
INSERT INTO term_relationships VALUES("19","1","0");



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

INSERT INTO term_taxonomy VALUES("1","1","product_cat","","0","0","2020-12-13 13:30:27");
INSERT INTO term_taxonomy VALUES("2","2","product_tag","","0","0","2020-12-13 13:30:38");
INSERT INTO term_taxonomy VALUES("3","3","product_tag","","0","0","2020-12-13 13:30:40");
INSERT INTO term_taxonomy VALUES("4","4","color","","0","0","2020-12-13 13:30:57");
INSERT INTO term_taxonomy VALUES("5","5","color","","0","0","2020-12-13 13:31:03");
INSERT INTO term_taxonomy VALUES("6","6","color","","0","0","2020-12-13 13:31:07");
INSERT INTO term_taxonomy VALUES("7","7","size","","0","0","2020-12-13 13:31:20");
INSERT INTO term_taxonomy VALUES("8","8","size","","0","0","2020-12-13 13:31:25");
INSERT INTO term_taxonomy VALUES("9","9","size","","0","0","2020-12-13 13:31:28");
INSERT INTO term_taxonomy VALUES("10","10","product_cat","","0","0","2020-12-13 13:34:43");
INSERT INTO term_taxonomy VALUES("11","11","district","190","0","0","2020-12-13 13:36:00");
INSERT INTO term_taxonomy VALUES("12","12","city","","11","0","2020-12-13 13:36:10");
INSERT INTO term_taxonomy VALUES("13","12","postcode","1900","12","0","2020-12-13 13:36:10");
INSERT INTO term_taxonomy VALUES("14","13","district","200","0","0","2020-12-14 13:10:51");
INSERT INTO term_taxonomy VALUES("15","14","city","","13","0","2020-12-14 13:11:05");
INSERT INTO term_taxonomy VALUES("16","14","postcode","1340","14","0","2020-12-14 13:11:05");
INSERT INTO term_taxonomy VALUES("17","15","product_cat","","0","0","2020-12-14 18:07:57");
INSERT INTO term_taxonomy VALUES("18","16","product_cat","","0","0","2020-12-14 18:33:07");



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

INSERT INTO terms VALUES("1","Jeans","jeans","0","1","2020-12-13 13:30:27");
INSERT INTO terms VALUES("2","Women","women","0","1","2020-12-13 13:30:38");
INSERT INTO terms VALUES("3","Men","men","0","1","2020-12-13 13:30:40");
INSERT INTO terms VALUES("4","R","r","0","1","2020-12-13 13:30:57");
INSERT INTO terms VALUES("5","B","b","0","1","2020-12-13 13:31:03");
INSERT INTO terms VALUES("6","G","g","0","1","2020-12-13 13:31:07");
INSERT INTO terms VALUES("7","XL","xl","0","1","2020-12-13 13:31:20");
INSERT INTO terms VALUES("8","M","m","0","1","2020-12-13 13:31:25");
INSERT INTO terms VALUES("9","S","s","0","1","2020-12-13 13:31:28");
INSERT INTO terms VALUES("10","Bata","bata","0","1","2020-12-13 13:34:43");
INSERT INTO terms VALUES("11","Dhaka","dhaka","0","1","2020-12-13 13:36:00");
INSERT INTO terms VALUES("12","Uttara","uttara","0","1","2020-12-13 13:36:10");
INSERT INTO terms VALUES("13","Comilla","comilla","0","1","2020-12-14 13:10:51");
INSERT INTO terms VALUES("14","Laksam","laksam","0","1","2020-12-14 13:11:05");
INSERT INTO terms VALUES("15","Bags","bags","0","1","2020-12-14 18:07:57");
INSERT INTO terms VALUES("16","test","test","0","0","2020-12-14 18:33:07");



CREATE TABLE `user_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=1110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO usermeta VALUES("277","5","district","55");
INSERT INTO usermeta VALUES("275","5","user_image","");
INSERT INTO usermeta VALUES("825","2","user_image","1607494226.jpg");
INSERT INTO usermeta VALUES("1039","2","zip","1900");
INSERT INTO usermeta VALUES("1038","2","city","12");
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
INSERT INTO usermeta VALUES("1036","2","address_one","Uttara");
INSERT INTO usermeta VALUES("817","2","last_name","Demo");
INSERT INTO usermeta VALUES("279","5","zip","1230");
INSERT INTO usermeta VALUES("278","5","city","57");
INSERT INTO usermeta VALUES("1107","0","district","11");
INSERT INTO usermeta VALUES("1106","0","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("267","5","last_name","Rahman");
INSERT INTO usermeta VALUES("276","5","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("269","5","address_two","");
INSERT INTO usermeta VALUES("270","5","phone","3453453457");
INSERT INTO usermeta VALUES("266","5","first_name","Saiful");
INSERT INTO usermeta VALUES("819","2","address_two","");
INSERT INTO usermeta VALUES("1108","0","city","12");
INSERT INTO usermeta VALUES("1109","0","zip","1900");
INSERT INTO usermeta VALUES("360","17","address_one","Road 4, House 15, Block A, Mirpur 10, Dhaka 1216");
INSERT INTO usermeta VALUES("361","17","district","55");
INSERT INTO usermeta VALUES("362","17","city","95");
INSERT INTO usermeta VALUES("363","17","zip","kuril");
INSERT INTO usermeta VALUES("376","19","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("377","19","district","56");
INSERT INTO usermeta VALUES("378","19","city","97");
INSERT INTO usermeta VALUES("379","19","zip","3330-337456");
INSERT INTO usermeta VALUES("452","21","state","");
INSERT INTO usermeta VALUES("978","21","city","15");
INSERT INTO usermeta VALUES("451","21","country","");
INSERT INTO usermeta VALUES("450","21","phone","345345");
INSERT INTO usermeta VALUES("449","21","address_two","");
INSERT INTO usermeta VALUES("976","21","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("447","21","last_name","Kar");
INSERT INTO usermeta VALUES("446","21","first_name","Partho");
INSERT INTO usermeta VALUES("979","21","zip","2300");
INSERT INTO usermeta VALUES("455","21","user_image","1605432060.jpg");
INSERT INTO usermeta VALUES("816","2","first_name","Demo");
INSERT INTO usermeta VALUES("1037","2","district","11");
INSERT INTO usermeta VALUES("977","21","district","14");
INSERT INTO usermeta VALUES("1065","22","user_image","1607755455.jpg");
INSERT INTO usermeta VALUES("1089","22","zip","1900");
INSERT INTO usermeta VALUES("1088","22","city","12");
INSERT INTO usermeta VALUES("1062","22","state","");
INSERT INTO usermeta VALUES("1061","22","country","");
INSERT INTO usermeta VALUES("1060","22","phone","126645");
INSERT INTO usermeta VALUES("1059","22","address_two","");
INSERT INTO usermeta VALUES("1086","22","address_one","dhaka");
INSERT INTO usermeta VALUES("1057","22","last_name","");
INSERT INTO usermeta VALUES("1056","22","first_name","khan");
INSERT INTO usermeta VALUES("1087","22","district","11");



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
INSERT INTO users_permissions VALUES("5","1");
INSERT INTO users_permissions VALUES("5","2");
INSERT INTO users_permissions VALUES("5","3");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO wishlist VALUES("1","22","4","","");
INSERT INTO wishlist VALUES("3","21","8","","");
INSERT INTO wishlist VALUES("4","2","1","","");
INSERT INTO wishlist VALUES("5","2","19","","");
INSERT INTO wishlist VALUES("6","2","4","","");

