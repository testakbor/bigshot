

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
INSERT INTO admins VALUES("4","wdssad","asdsad","sadasd","asdsadas","1","asdsadsa","","");



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

INSERT INTO attribute_taxonomies VALUES("1","Color","color","select","menu_order","1","1","2020-12-01 16:36:25","2020-12-01 16:36:25");
INSERT INTO attribute_taxonomies VALUES("2","Size","size","select","menu_order","1","1","2020-12-01 16:36:33","2020-12-01 16:36:33");



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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","12","500","2020-12-09","1","","");



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
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_itemmeta VALUES("1","1","_tax_class","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("2","1","_qty","2","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("3","1","_product_id","67","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("4","1","_variation_id","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("5","1","_line_subtotal","60000","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("6","1","_line_total","60000","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("7","1","_line_subtotal_tax","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("8","1","_line_tax","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("9","1","_line_tax_data","2020-12-09 23:30:11","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("10","1","delivery_charge","120","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("11","1","coupon_code","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("12","1","coupon_taka","0","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("13","1","attribute_parent","67","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("14","2","_tax_class","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("15","2","_qty","3","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("16","2","_product_id","68","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("17","2","_variation_id","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("18","2","_line_subtotal","90000","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("19","2","_line_total","90000","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("20","2","_line_subtotal_tax","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("21","2","_line_tax","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("22","2","_line_tax_data","2020-12-09 23:30:11","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("23","2","delivery_charge","120","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("24","2","coupon_code","","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("25","2","coupon_taka","0","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("26","2","attribute_parent","68","71","2020-12-09","2");
INSERT INTO order_itemmeta VALUES("27","3","_tax_class","","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("28","3","_qty","1","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("29","3","_product_id","67","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("30","3","_variation_id","","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("31","3","_line_subtotal","30000","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("32","3","_line_total","30000","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("33","3","_line_subtotal_tax","","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("34","3","_line_tax","","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("35","3","_line_tax_data","2020-12-09 23:31:49","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("36","3","delivery_charge","120","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("37","3","coupon_code","","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("38","3","coupon_taka","0","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("39","3","attribute_parent","67","72","2020-12-09","0");
INSERT INTO order_itemmeta VALUES("40","4","_tax_class","","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("41","4","_qty","2","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("42","4","_product_id","65","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("43","4","_variation_id","","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("44","4","_line_subtotal","6000","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("45","4","_line_total","6000","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("46","4","_line_subtotal_tax","","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("47","4","_line_tax","","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("48","4","_line_tax_data","2020-12-10 19:37:53","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("49","4","delivery_charge","120","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("50","4","coupon_code","","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("51","4","coupon_taka","0","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("52","4","attribute_parent","65","74","2020-12-10","2");
INSERT INTO order_itemmeta VALUES("53","5","_tax_class","","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("54","5","_qty","3","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("55","5","_product_id","65","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("56","5","_variation_id","","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("57","5","_line_subtotal","9000","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("58","5","_line_total","9000","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("59","5","_line_subtotal_tax","","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("60","5","_line_tax","","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("61","5","_line_tax_data","2020-12-12 16:52:47","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("62","5","delivery_charge","120","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("63","5","coupon_code","","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("64","5","coupon_taka","0","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("65","5","attribute_parent","65","75","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("66","6","_tax_class","","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("67","6","_qty","20","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("68","6","_product_id","68","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("69","6","_variation_id","","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("70","6","_line_subtotal","600000","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("71","6","_line_total","600000","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("72","6","_line_subtotal_tax","","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("73","6","_line_tax","","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("74","6","_line_tax_data","2020-12-12 17:17:07","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("75","6","delivery_charge","120","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("76","6","coupon_code","","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("77","6","coupon_taka","0","76","2020-12-12","2");
INSERT INTO order_itemmeta VALUES("78","6","attribute_parent","68","76","2020-12-12","2");



CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_items VALUES("1","Belt 1","line-item","67","71");
INSERT INTO order_items VALUES("2","Belt 1","line-item","68","71");
INSERT INTO order_items VALUES("3","Belt 1","line-item","67","72");
INSERT INTO order_items VALUES("4","Demo Product","line-item","65","74");
INSERT INTO order_items VALUES("5","Demo Product","line-item","65","75");
INSERT INTO order_items VALUES("6","Belt 1","line-item","68","76");



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
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO postmeta VALUES("1","64","stock_status","instock");
INSERT INTO postmeta VALUES("2","64","regular_price","5000");
INSERT INTO postmeta VALUES("3","64","sale_price","3000");
INSERT INTO postmeta VALUES("4","64","weight","");
INSERT INTO postmeta VALUES("5","64","length","");
INSERT INTO postmeta VALUES("6","64","width","");
INSERT INTO postmeta VALUES("7","64","height","");
INSERT INTO postmeta VALUES("8","64","product_stock","1000");
INSERT INTO postmeta VALUES("9","64","start_stock","1000");
INSERT INTO postmeta VALUES("10","64","alert_qty","6");
INSERT INTO postmeta VALUES("11","64","_sku","981");
INSERT INTO postmeta VALUES("12","64","attached_file","1607429596.jpg");
INSERT INTO postmeta VALUES("13","64","gallery_file","bag.jpg");
INSERT INTO postmeta VALUES("14","64","gallery_file","balt.jpg");
INSERT INTO postmeta VALUES("15","65","attribute","[{"taxonomy":"color","term":"Red","term_id":"8"},{"taxonomy":"size","term":"Xl","term_id":"11"}]");
INSERT INTO postmeta VALUES("16","64","default_attribute","[{"taxonomy":"color","term":"Red","term_id":"8"},{"taxonomy":"size","term":"Xl","term_id":"11"}]");
INSERT INTO postmeta VALUES("17","65","attribute_stock","4");
INSERT INTO postmeta VALUES("18","65","attribute_low_stock","6");
INSERT INTO postmeta VALUES("19","66","stock_status","instock");
INSERT INTO postmeta VALUES("20","66","regular_price","5000");
INSERT INTO postmeta VALUES("21","66","sale_price","30000");
INSERT INTO postmeta VALUES("22","66","weight","");
INSERT INTO postmeta VALUES("23","66","length","");
INSERT INTO postmeta VALUES("24","66","width","");
INSERT INTO postmeta VALUES("25","66","height","");
INSERT INTO postmeta VALUES("26","66","product_stock","1000");
INSERT INTO postmeta VALUES("27","66","start_stock","1000");
INSERT INTO postmeta VALUES("28","66","alert_qty","20");
INSERT INTO postmeta VALUES("29","66","_sku","780");
INSERT INTO postmeta VALUES("30","66","attached_file","1607429661.jpg");
INSERT INTO postmeta VALUES("31","66","gallery_file","bag.jpg");
INSERT INTO postmeta VALUES("32","66","gallery_file","balt.jpg");
INSERT INTO postmeta VALUES("33","67","attribute","[{"taxonomy":"color","term":"Red","term_id":"8"}]");
INSERT INTO postmeta VALUES("34","66","default_attribute","[{"taxonomy":"color","term":"Red","term_id":"8"}]");
INSERT INTO postmeta VALUES("35","67","attribute_stock","26");
INSERT INTO postmeta VALUES("36","67","attribute_low_stock","20");
INSERT INTO postmeta VALUES("37","68","attribute","[{"taxonomy":"color","term":"Green","term_id":"9"}]");
INSERT INTO postmeta VALUES("38","66","default_attribute","[{"taxonomy":"color","term":"Green","term_id":"9"}]");
INSERT INTO postmeta VALUES("39","68","attribute_stock","5");
INSERT INTO postmeta VALUES("40","68","attribute_low_stock","20");
INSERT INTO postmeta VALUES("41","69","first_name","Demo");
INSERT INTO postmeta VALUES("42","69","last_name","Demo");
INSERT INTO postmeta VALUES("43","69","address_one","Uttara");
INSERT INTO postmeta VALUES("44","69","address_two","");
INSERT INTO postmeta VALUES("45","69","phone","6789");
INSERT INTO postmeta VALUES("46","69","email","demo@email.com");
INSERT INTO postmeta VALUES("47","69","country","Bangladesh");
INSERT INTO postmeta VALUES("48","69","state","Dhaka");
INSERT INTO postmeta VALUES("49","69","city","Uttara");
INSERT INTO postmeta VALUES("50","69","zip","1230");
INSERT INTO postmeta VALUES("51","69","_customer_user","2");
INSERT INTO postmeta VALUES("52","69","_billing_postcode","1230");
INSERT INTO postmeta VALUES("53","69","_billing_company","");
INSERT INTO postmeta VALUES("54","69","_billing_last_name","");
INSERT INTO postmeta VALUES("55","69","_billing_first_name","");
INSERT INTO postmeta VALUES("56","69","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("57","70","first_name","Demo");
INSERT INTO postmeta VALUES("58","70","last_name","Demo");
INSERT INTO postmeta VALUES("59","70","address_one","Uttara");
INSERT INTO postmeta VALUES("60","70","address_two","");
INSERT INTO postmeta VALUES("61","70","phone","6789");
INSERT INTO postmeta VALUES("62","70","email","demo@email.com");
INSERT INTO postmeta VALUES("63","70","country","Bangladesh");
INSERT INTO postmeta VALUES("64","70","state","Dhaka");
INSERT INTO postmeta VALUES("65","70","city","Uttara");
INSERT INTO postmeta VALUES("66","70","zip","1230");
INSERT INTO postmeta VALUES("67","70","_customer_user","2");
INSERT INTO postmeta VALUES("68","70","_billing_postcode","1230");
INSERT INTO postmeta VALUES("69","70","_billing_company","");
INSERT INTO postmeta VALUES("70","70","_billing_last_name","");
INSERT INTO postmeta VALUES("71","70","_billing_first_name","");
INSERT INTO postmeta VALUES("72","70","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("73","71","first_name","Demo");
INSERT INTO postmeta VALUES("74","71","last_name","Demo");
INSERT INTO postmeta VALUES("75","71","address_one","Uttara");
INSERT INTO postmeta VALUES("76","71","address_two","");
INSERT INTO postmeta VALUES("77","71","phone","6789");
INSERT INTO postmeta VALUES("78","71","email","demo@email.com");
INSERT INTO postmeta VALUES("79","71","country","Bangladesh");
INSERT INTO postmeta VALUES("80","71","state","Dhaka");
INSERT INTO postmeta VALUES("81","71","city","Uttara");
INSERT INTO postmeta VALUES("82","71","zip","1230");
INSERT INTO postmeta VALUES("83","71","_customer_user","2");
INSERT INTO postmeta VALUES("84","71","_billing_postcode","1230");
INSERT INTO postmeta VALUES("85","71","_billing_company","");
INSERT INTO postmeta VALUES("86","71","_billing_last_name","");
INSERT INTO postmeta VALUES("87","71","_billing_first_name","");
INSERT INTO postmeta VALUES("88","71","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("89","72","first_name","Guest");
INSERT INTO postmeta VALUES("90","72","last_name","Guest");
INSERT INTO postmeta VALUES("91","72","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("92","72","address_two","");
INSERT INTO postmeta VALUES("93","72","phone","0000000001");
INSERT INTO postmeta VALUES("94","72","email","guest@email.com");
INSERT INTO postmeta VALUES("95","72","country","Bangladesh");
INSERT INTO postmeta VALUES("96","72","state","Dhaka");
INSERT INTO postmeta VALUES("97","72","city","Uttara");
INSERT INTO postmeta VALUES("98","72","zip","1230");
INSERT INTO postmeta VALUES("99","72","_customer_user","0");
INSERT INTO postmeta VALUES("100","72","_billing_postcode","1230");
INSERT INTO postmeta VALUES("101","72","_billing_company","");
INSERT INTO postmeta VALUES("102","72","_billing_last_name","");
INSERT INTO postmeta VALUES("103","72","_billing_first_name","");
INSERT INTO postmeta VALUES("104","72","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("105","73","banner_image","1607572871.png");
INSERT INTO postmeta VALUES("106","74","first_name","Demo");
INSERT INTO postmeta VALUES("107","74","last_name","Demo");
INSERT INTO postmeta VALUES("108","74","address_one","Uttara");
INSERT INTO postmeta VALUES("109","74","address_two","");
INSERT INTO postmeta VALUES("110","74","phone","6789");
INSERT INTO postmeta VALUES("111","74","email","demo@email.com");
INSERT INTO postmeta VALUES("112","74","country","Bangladesh");
INSERT INTO postmeta VALUES("113","74","state","Dhaka");
INSERT INTO postmeta VALUES("114","74","city","Uttara");
INSERT INTO postmeta VALUES("115","74","zip","1230");
INSERT INTO postmeta VALUES("116","74","_customer_user","2");
INSERT INTO postmeta VALUES("117","74","_billing_postcode","1230");
INSERT INTO postmeta VALUES("118","74","_billing_company","");
INSERT INTO postmeta VALUES("119","74","_billing_last_name","");
INSERT INTO postmeta VALUES("120","74","_billing_first_name","");
INSERT INTO postmeta VALUES("121","74","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("122","74","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("123","72","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("124","71","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("125","75","first_name","Demo");
INSERT INTO postmeta VALUES("126","75","last_name","Demo");
INSERT INTO postmeta VALUES("127","75","address_one","Uttara");
INSERT INTO postmeta VALUES("128","75","address_two","");
INSERT INTO postmeta VALUES("129","75","phone","6789");
INSERT INTO postmeta VALUES("130","75","email","demo@email.com");
INSERT INTO postmeta VALUES("131","75","country","Bangladesh");
INSERT INTO postmeta VALUES("132","75","state","Dhaka");
INSERT INTO postmeta VALUES("133","75","city","Uttara");
INSERT INTO postmeta VALUES("134","75","zip","1230");
INSERT INTO postmeta VALUES("135","75","_customer_user","2");
INSERT INTO postmeta VALUES("136","75","_billing_postcode","1230");
INSERT INTO postmeta VALUES("137","75","_billing_company","");
INSERT INTO postmeta VALUES("138","75","_billing_last_name","");
INSERT INTO postmeta VALUES("139","75","_billing_first_name","");
INSERT INTO postmeta VALUES("140","75","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("141","75","processing_date","2020-12-12");
INSERT INTO postmeta VALUES("142","76","first_name","Demo");
INSERT INTO postmeta VALUES("143","76","last_name","Demo");
INSERT INTO postmeta VALUES("144","76","address_one","Uttara");
INSERT INTO postmeta VALUES("145","76","address_two","");
INSERT INTO postmeta VALUES("146","76","phone","6789");
INSERT INTO postmeta VALUES("147","76","email","demo@email.com");
INSERT INTO postmeta VALUES("148","76","country","Bangladesh");
INSERT INTO postmeta VALUES("149","76","state","Dhaka");
INSERT INTO postmeta VALUES("150","76","city","Uttara");
INSERT INTO postmeta VALUES("151","76","zip","1230");
INSERT INTO postmeta VALUES("152","76","_customer_user","2");
INSERT INTO postmeta VALUES("153","76","_billing_postcode","1230");
INSERT INTO postmeta VALUES("154","76","_billing_company","");
INSERT INTO postmeta VALUES("155","76","_billing_last_name","");
INSERT INTO postmeta VALUES("156","76","_billing_first_name","");
INSERT INTO postmeta VALUES("157","76","payment_method","CashOnDelivery");



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
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES("74","2","2020-12-10 00:00:00","2020-12-10 19:37:53","","Order2020-12-10 13:37:53","","dispatch_complete","open","open","order_1247","order-Dec-10-2020-1312","","","2020-12-12 10:43:07","2020-12-10 13:37:53","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("75","2","2020-12-12 00:00:00","2020-12-12 16:52:47","","Order2020-12-12 10:52:47","","cancelled","open","open","order_1247","order-Dec-12-2020-1012","","","2020-12-12 10:54:40","2020-12-12 10:52:47","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("76","2","2020-12-12 00:00:00","2020-12-12 17:17:07","","Order2020-12-12 11:17:07","","on-hold","open","open","order_1247","order-Dec-12-2020-1112","","","2020-12-12 11:17:07","2020-12-12 11:17:07","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("65","0","2020-12-08 18:13:16","2020-12-08 18:13:16","","","","publish","open","open","","","","","2020-12-08 18:13:16","2020-12-08 18:13:16","","64","","0","product_varient","","0");
INSERT INTO posts VALUES("66","2","2020-12-08 18:13:00","2020-12-09 00:13:00","<p>sadsadsa</p>","Belt 1","<p>asdasdasd</p>","publish","open","open","","Belt 1","","","2020-12-08 18:14:21","2020-12-08 18:14:21","","0","","0","product","","0");
INSERT INTO posts VALUES("67","0","2020-12-08 18:14:21","2020-12-08 18:14:21","","","","publish","open","open","","","","","2020-12-08 18:14:21","2020-12-08 18:14:21","","66","","0","product_varient","","0");
INSERT INTO posts VALUES("68","0","2020-12-08 18:14:21","2020-12-08 18:14:21","","","","publish","open","open","","","","","2020-12-08 18:14:21","2020-12-08 18:14:21","","66","","0","product_varient","","0");
INSERT INTO posts VALUES("69","2","2020-12-09 00:00:00","2020-12-09 22:33:57","","Order2020-12-09 16:33:57","","on-hold","open","open","order_1247","order-Dec-09-2020-1612","","","2020-12-09 16:33:57","2020-12-09 16:33:57","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("70","2","2020-12-09 00:00:00","2020-12-09 23:27:19","","Order2020-12-09 17:27:19","","on-hold","open","open","order_1247","order-Dec-09-2020-1712","","","2020-12-09 17:27:19","2020-12-09 17:27:19","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("71","2","2020-12-09 00:00:00","2020-12-09 23:30:11","","Order2020-12-09 17:30:11","","cancelled","open","open","order_1247","order-Dec-09-2020-1712","","","2020-12-12 10:44:21","2020-12-09 17:30:11","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("72","0","2020-12-09 00:00:00","2020-12-09 23:31:49","","Order2020-12-09 17:31:49","","dispatch_complete","open","open","order_1247","order-Dec-09-2020-1712","","","2020-12-12 10:42:26","2020-12-09 17:31:49","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("64","2","2020-12-08 18:12:00","2020-12-09 00:12:00","<p>ewrwer</p>","Demo Product","<p>qweqwewq</p>","publish","open","open","","Demo Product","","","2020-12-08 18:13:16","2020-12-08 18:13:16","","0","","0","product","","0");
INSERT INTO posts VALUES("73","2","2020-12-10 09:58:00","2020-12-10 15:58:00","Banner Image","Banner Image","Banner Image","publish","open","open","","Banner Image","","","2020-12-10 09:58:58","2020-12-10 09:58:58","","0","","0","banner","","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_relationships VALUES("35","14","0");
INSERT INTO term_relationships VALUES("35","6","0");
INSERT INTO term_relationships VALUES("37","6","0");
INSERT INTO term_relationships VALUES("37","1","0");
INSERT INTO term_relationships VALUES("40","6","0");
INSERT INTO term_relationships VALUES("40","2","0");
INSERT INTO term_relationships VALUES("44","14","0");
INSERT INTO term_relationships VALUES("44","6","0");
INSERT INTO term_relationships VALUES("49","14","0");
INSERT INTO term_relationships VALUES("49","6","0");
INSERT INTO term_relationships VALUES("64","1","0");
INSERT INTO term_relationships VALUES("64","6","0");
INSERT INTO term_relationships VALUES("66","1","0");
INSERT INTO term_relationships VALUES("66","6","0");



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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_taxonomy VALUES("1","1","product_cat","","0","0","2020-12-01 16:35:06");
INSERT INTO term_taxonomy VALUES("2","2","product_cat","","0","0","2020-12-01 16:35:16");
INSERT INTO term_taxonomy VALUES("3","3","product_cat","","0","0","2020-12-01 16:35:24");
INSERT INTO term_taxonomy VALUES("4","4","product_cat","","0","0","2020-12-01 16:35:28");
INSERT INTO term_taxonomy VALUES("5","5","product_cat","","0","0","2020-12-01 16:35:43");
INSERT INTO term_taxonomy VALUES("6","6","product_tag","","0","0","2020-12-01 16:35:52");
INSERT INTO term_taxonomy VALUES("7","7","product_tag","","0","0","2020-12-01 16:36:02");
INSERT INTO term_taxonomy VALUES("8","8","color","","0","0","2020-12-01 16:36:46");
INSERT INTO term_taxonomy VALUES("9","9","color","","0","0","2020-12-01 16:36:51");
INSERT INTO term_taxonomy VALUES("10","10","color","","0","0","2020-12-01 16:36:55");
INSERT INTO term_taxonomy VALUES("11","11","size","","0","0","2020-12-01 16:37:06");
INSERT INTO term_taxonomy VALUES("12","12","size","","0","0","2020-12-01 16:37:10");
INSERT INTO term_taxonomy VALUES("13","13","size","","0","0","2020-12-01 16:37:13");
INSERT INTO term_taxonomy VALUES("14","14","product_cat","","0","0","2020-12-01 16:40:57");
INSERT INTO term_taxonomy VALUES("15","15","district","120","0","0","2020-12-01 17:08:33");
INSERT INTO term_taxonomy VALUES("16","16","city","","15","0","2020-12-01 17:08:47");
INSERT INTO term_taxonomy VALUES("17","16","postcode","1230","16","0","2020-12-01 17:08:47");
INSERT INTO term_taxonomy VALUES("18","17","district","100","0","0","2020-12-03 11:40:06");
INSERT INTO term_taxonomy VALUES("19","18","city","","17","0","2020-12-03 11:40:21");
INSERT INTO term_taxonomy VALUES("20","18","postcode","1205","18","0","2020-12-03 11:40:21");



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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO terms VALUES("1","Accessories","accessories","0","1","2020-12-01 16:35:06");
INSERT INTO terms VALUES("2","Bags","bags","0","1","2020-12-01 16:35:16");
INSERT INTO terms VALUES("3","Bottoms","bottoms","0","1","2020-12-01 16:35:24");
INSERT INTO terms VALUES("4","Jewellery","jewellery","0","1","2020-12-01 16:35:28");
INSERT INTO terms VALUES("5","Bras and Sleepwear","bras-and-sleepwear","0","1","2020-12-01 16:35:43");
INSERT INTO terms VALUES("6","Women","women","0","1","2020-12-01 16:35:52");
INSERT INTO terms VALUES("7","Men","men","0","1","2020-12-01 16:36:02");
INSERT INTO terms VALUES("8","Red","red","0","1","2020-12-01 16:36:46");
INSERT INTO terms VALUES("9","Green","green","0","1","2020-12-01 16:36:51");
INSERT INTO terms VALUES("10","Blue","blue","0","1","2020-12-01 16:36:55");
INSERT INTO terms VALUES("11","Xl","xl","0","1","2020-12-01 16:37:06");
INSERT INTO terms VALUES("12","M","m","0","1","2020-12-01 16:37:10");
INSERT INTO terms VALUES("13","S","s","0","1","2020-12-01 16:37:13");
INSERT INTO terms VALUES("14","Tops","tops","0","1","2020-12-01 16:40:57");
INSERT INTO terms VALUES("15","Dhaka","dhaka","0","1","2020-12-01 17:08:33");
INSERT INTO terms VALUES("16","Uttara","uttara","0","1","2020-12-01 17:08:47");
INSERT INTO terms VALUES("17","Sylhet","sylhet","0","1","2020-12-03 11:40:06");
INSERT INTO terms VALUES("18","Habiganj","habiganj","0","1","2020-12-03 11:40:21");



CREATE TABLE `user_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=854 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO usermeta VALUES("839","0","district","15");
INSERT INTO usermeta VALUES("838","0","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("267","5","last_name","Rahman");
INSERT INTO usermeta VALUES("276","5","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("269","5","address_two","");
INSERT INTO usermeta VALUES("270","5","phone","3453453457");
INSERT INTO usermeta VALUES("266","5","first_name","Saiful");
INSERT INTO usermeta VALUES("819","2","address_two","");
INSERT INTO usermeta VALUES("840","0","city","16");
INSERT INTO usermeta VALUES("841","0","zip","1230");
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("2","Demo","demo@email.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-09-13 11:06:20","2020-09-13 11:06:20");
INSERT INTO users VALUES("17","Howlader","bigshotstyle20@gmail.com","","$2y$10$eQfmmmLqtCKD5ckLt9gL8OGk0p7eKy3crlLryvEQnsx4LJdLE8n9C","","","","1","2020-11-03 15:47:02","2020-11-03 15:47:02");
INSERT INTO users VALUES("18","Customer","customer@email.com","","$2y$10$DifceXB8dt/mCivp4PIW/ujU0hq/OFHNL9NAHjZOrOgCEVMbVwf0i","","","","1","2020-11-07 08:11:03","2020-11-07 08:11:03");
INSERT INTO users VALUES("19","customer","partho@itebd.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-11-07 08:12:45","2020-11-07 08:12:45");
INSERT INTO users VALUES("20","Rahman","niloy@email.com","","$2y$10$o8jlnQihj1jZvH7KoOl1eOmXj8xzYGgiaXu4DdXANdJ9EiTxBbqLG","","","","1","2020-11-15 04:03:42","2020-11-15 04:03:42");
INSERT INTO users VALUES("21","Partho","parthokar90@gmail.com","","$2y$10$nuxhiB9nzPYjKSwo9gpxKODxclWhEm3TXzJzpICWrRXkbvpRkgQO2","","","","1","2020-11-15 11:12:37","2020-11-15 11:12:37");



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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


