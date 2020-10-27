

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

INSERT INTO admins VALUES("1","Admin","admin@email.com","$2y$10$a3PoYLbMyHzt3UZmPm.HOemh4sS9wdVOnVuJJEniKMm3IDuScd08K","","1","1","2020-10-19 16:09:12","2020-10-24 14:15:13");
INSERT INTO admins VALUES("4","Test User1","test@email.com","$2y$10$aVwMLhFMS2nfuIZvTL.VwOLKP8maO3T0ZHBBoUr0yA.jGMHOPuYsO","","2","1","2020-10-24 13:19:02","2020-10-24 17:39:19");



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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attribute_taxonomies VALUES("1","color","color","select","menu_order","1","0","2020-07-19 12:27:40","2020-09-13 10:17:22");
INSERT INTO attribute_taxonomies VALUES("2","size","size","select","menu_order","1","0","2020-07-19 12:27:40","");
INSERT INTO attribute_taxonomies VALUES("3","weight","weight","select","menu_order","1","0","2020-07-19 12:27:40","");
INSERT INTO attribute_taxonomies VALUES("4","inch","inch","select","menu_order","0","0","2020-07-19 12:27:40","");
INSERT INTO attribute_taxonomies VALUES("5","liter","liter","select","menu_order","0","0","2020-07-19 12:27:40","");
INSERT INTO attribute_taxonomies VALUES("6","pixel","pixel","select","menu_order","0","0","2020-07-19 12:27:40","");
INSERT INTO attribute_taxonomies VALUES("7","material","material","select","menu_order","0","0","2020-07-19 12:27:40","");
INSERT INTO attribute_taxonomies VALUES("10","tyrty","tyrty","select","menu_order","1","1","2020-09-12 17:20:12","2020-09-12 17:20:12");



CREATE TABLE `commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO commentmeta VALUES("10","28","rating","5");
INSERT INTO commentmeta VALUES("11","28","verified","0");
INSERT INTO commentmeta VALUES("24","44","rating","5");
INSERT INTO commentmeta VALUES("25","44","verified","0");
INSERT INTO commentmeta VALUES("48","57","rating","4");
INSERT INTO commentmeta VALUES("49","57","verified","0");
INSERT INTO commentmeta VALUES("54","60","rating","1");
INSERT INTO commentmeta VALUES("55","60","verified","0");
INSERT INTO commentmeta VALUES("62","64","rating","1");
INSERT INTO commentmeta VALUES("63","64","verified","0");
INSERT INTO commentmeta VALUES("147","108","akismet_history","a:3:{s:4:"time";d:1562259116.8554670810699462890625;s:5:"event";s:11:"check-error";s:4:"meta";a:1:{s:8:"response";s:7:"invalid";}}");
INSERT INTO commentmeta VALUES("153","110","akismet_history","a:3:{s:4:"time";d:1591755584.7326789;s:5:"event";s:11:"check-error";s:4:"meta";a:1:{s:8:"response";s:7:"invalid";}}");
INSERT INTO commentmeta VALUES("78","72","rating","4");
INSERT INTO commentmeta VALUES("79","72","verified","0");
INSERT INTO commentmeta VALUES("82","74","rating","1");
INSERT INTO commentmeta VALUES("83","74","verified","0");
INSERT INTO commentmeta VALUES("100","83","rating","3");
INSERT INTO commentmeta VALUES("101","83","verified","0");
INSERT INTO commentmeta VALUES("106","86","rating","1");
INSERT INTO commentmeta VALUES("107","86","verified","0");
INSERT INTO commentmeta VALUES("114","90","rating","2");
INSERT INTO commentmeta VALUES("115","90","verified","0");
INSERT INTO commentmeta VALUES("151","108","verified","0");
INSERT INTO commentmeta VALUES("152","110","akismet_error","1591755584");
INSERT INTO commentmeta VALUES("149","108","rating","5");
INSERT INTO commentmeta VALUES("155","110","rating","3");
INSERT INTO commentmeta VALUES("156","110","akismet_delayed_moderation_email","1");
INSERT INTO commentmeta VALUES("157","110","verified","0");
INSERT INTO commentmeta VALUES("158","111","akismet_error","1592098654");
INSERT INTO commentmeta VALUES("159","111","akismet_history","a:3:{s:4:"time";d:1592098654.094192;s:5:"event";s:11:"check-error";s:4:"meta";a:1:{s:8:"response";s:7:"invalid";}}");
INSERT INTO commentmeta VALUES("161","111","rating","4");
INSERT INTO commentmeta VALUES("162","111","akismet_delayed_moderation_email","1");
INSERT INTO commentmeta VALUES("163","111","verified","0");
INSERT INTO commentmeta VALUES("164","112","akismet_error","1592247012");
INSERT INTO commentmeta VALUES("165","112","akismet_history","a:3:{s:4:"time";d:1592247012.7924149;s:5:"event";s:11:"check-error";s:4:"meta";a:1:{s:8:"response";s:7:"invalid";}}");
INSERT INTO commentmeta VALUES("170","113","akismet_error","1594481195");
INSERT INTO commentmeta VALUES("171","113","akismet_history","a:3:{s:4:"time";d:1594481195.259727;s:5:"event";s:11:"check-error";s:4:"meta";a:1:{s:8:"response";s:7:"invalid";}}");
INSERT INTO commentmeta VALUES("172","113","akismet_as_submitted","a:13:{s:14:"comment_author";s:6:"Mahadi";s:20:"comment_author_email";s:26:"Mahadihassan2894@gmail.com";s:18:"comment_author_url";s:0:"";s:15:"comment_content";s:81:"Good looking And wonderful designe...good Delivery Service.Thank you Abmworldmark";s:12:"comment_type";s:0:"";s:7:"user_ID";i:0;s:7:"user_id";i:0;s:7:"user_ip";s:13:"103.67.157.29";s:10:"user_agent";s:125:"Mozilla/5.0 (Linux; Android 4.4.4; SM-G360H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36";s:4:"blog";s:23:"http://abmworldmart.com";s:9:"blog_lang";s:5:"en_US";s:12:"blog_charset";s:5:"UTF-8";s:9:"permalink";s:106:"http://abmworldmart.com/index.php/product/embroidered-party-wear-lehenga-georgette-designer-salwar-suit-2/";}");
INSERT INTO commentmeta VALUES("173","113","rating","5");
INSERT INTO commentmeta VALUES("174","113","akismet_delayed_moderation_email","1");
INSERT INTO commentmeta VALUES("175","113","verified","0");
INSERT INTO commentmeta VALUES("176","113","akismet_history","a:3:{s:4:"time";d:1594554985.214933;s:5:"event";s:15:"status-approved";s:4:"user";s:15:"abmw1452shop120";}");
INSERT INTO commentmeta VALUES("167","112","rating","1");
INSERT INTO commentmeta VALUES("168","112","akismet_delayed_moderation_email","1");
INSERT INTO commentmeta VALUES("169","112","verified","0");



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
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO comments VALUES("1","1","Mr WordPress","","https://wordpress.org/","","2016-08-10 18:30:42","2016-08-10 18:30:42","Hi, this is a comment.
To delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.","0","1","","","0","0");
INSERT INTO comments VALUES("2","517","admin","thanhtd91@gmail.com","","117.6.204.186","2015-08-24 04:26:19","2015-08-24 04:26:19","Lorem ipsum dolor sit amet
"Consectetuer adipis. Mauris accumsan nulla vel diam. Sed in..."
Posted by Admin","0","1","","","0","1");
INSERT INTO comments VALUES("3","1195","Mr WordPress","","https://wordpress.org/","","2015-08-17 09:10:04","2015-08-17 09:10:04","Hi, this is a comment.
To delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.","0","1","","","0","0");
INSERT INTO comments VALUES("6","749","admin","thanhtd91@gmail.com","","117.6.204.186","2015-08-24 04:28:31","2015-08-24 04:28:31","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget tortor risus. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vivamus suscipit tortor eget felis porttitor volutpat.","0","1","","","0","1");
INSERT INTO comments VALUES("7","751","admin","ngocthang.ict@gmail.com","","117.6.204.186","2015-09-04 02:57:34","2015-09-04 02:57:34","Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur aliquet quam id dui posuere blandit. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt.","0","1","","","0","1");
INSERT INTO comments VALUES("8","759","admin","thanhtd91@gmail.com","","117.6.204.186","2015-08-24 04:27:16","2015-08-24 04:27:16","Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;","0","1","","","0","1");
INSERT INTO comments VALUES("15","1806","WooCommerce","woocommerce@kutethemes.net","","","2015-09-21 07:18:08","2015-09-21 07:18:08","Awaiting cheque payment Order status changed from Pending Payment to On Hold.","0","1","","order_note","0","0");
INSERT INTO comments VALUES("16","1195","Sable","1b1fr5rpdj@outlook.com","http://fwucqvmdxn.com","188.143.232.32","2016-11-26 09:45:44","2016-11-26 09:45:44","All of my questions settned-thalks!","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("17","749","Dany","ivpcq77p@yahoo.com","http://aotylpsxeb.com","188.143.234.155","2016-11-26 09:45:59","2016-11-26 09:45:59","Smart thkining - a clever way of looking at it.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("18","751","Kory","3ep6p9jh6o0@gmail.com","http://dzgzxeanc.com","188.143.232.32","2016-11-26 09:46:50","2016-11-26 09:46:50","It's great to read something that's both enjoyable and provides prdiamtgsac solutions.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","0","0");
INSERT INTO comments VALUES("19","751","Rayshelon","x4w4xa92hh@mail.com","http://rgardh.com","188.143.232.32","2016-11-26 09:48:33","2016-11-26 09:48:33","Pecerft shot! Thanks for your post!","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","7","0");
INSERT INTO comments VALUES("21","1","Jock","24rg80f70zi@mail.com","http://frwcsehbll.com","188.143.232.27","2016-11-26 09:52:52","2016-11-26 09:52:52","That's the thkining of a creative mind","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","1","0");
INSERT INTO comments VALUES("22","743","Buff","v111d3ezt@yahoo.com","http://otxvhyve.com","188.143.232.27","2016-11-26 09:54:53","2016-11-26 09:54:53","So excited I found this article as it made things much queickr!","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("23","747","Arry","p8gfg3r3zq@yahoo.com","http://pyxdzdipa.com","188.143.232.27","2016-11-26 10:00:41","2016-11-26 10:00:41","These pieces really set a standard in the inrsdtuy.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","0","0");
INSERT INTO comments VALUES("24","517","Indy","vft6qw9wo6@outlook.com","http://jufjadicq.com","188.143.232.32","2016-11-26 10:03:08","2016-11-26 10:03:08","Yup, that'll do it. You have my apoeacirtipn.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","2","0");
INSERT INTO comments VALUES("25","1","Geralynn","27eu3bo6pu@gmail.com","http://tsgnxdka.com","188.143.232.32","2016-11-26 10:03:50","2016-11-26 10:03:50","Call me wind because I am abultsleoy blown away.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("26","739","Starleigh","d63k30vks@hotmail.com","http://rbpfwtvc.com","188.143.232.27","2016-11-26 10:04:18","2016-11-26 10:04:18","Stay with this guys, you're helipng a lot of people.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("27","520","Biana","iw97pvh36@yahoo.com","http://jknomzdeszn.com","188.143.232.27","2016-11-26 10:04:33","2016-11-26 10:04:33","AKAIK yovu'e got the answer in one!","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","0","0");
INSERT INTO comments VALUES("28","1248","Dolley","9wykvaybxnb@outlook.com","","188.143.232.27","2016-11-26 10:08:56","2016-11-26 10:08:56","You get a lot of respect from me for writing these helpful arcselti.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","review","0","0");
INSERT INTO comments VALUES("29","510","Dorothy","50uiw9tcf@yahoo.com","http://kxgbyhtyoqz.com","188.143.232.27","2016-11-26 10:09:49","2016-11-26 10:09:49","Thanks for your thgtshuo. It's helped me a lot.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("30","745","Keyanna","yugw7znltq1@gmail.com","http://yiffmnazsdx.com","188.143.232.32","2016-11-26 10:11:01","2016-11-26 10:11:01","I was so confused about what to buy, but this makes it unaesrtdndable.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("31","757","Tayten","gxfxv9kn2@mail.com","http://qcwfgqtswk.com","188.143.232.27","2016-11-26 10:11:04","2016-11-26 10:11:04","Just the type of inhsgit we need to fire up the debate.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","0","0");
INSERT INTO comments VALUES("32","759","Charleigh","ewxgsm5n8sx@gmail.com","http://sealhd.com","188.143.232.32","2016-11-26 10:40:49","2016-11-26 10:40:49","Betsy:Ha!  I am so in adore with this.  My biological clock started up a few months ago and I&#8217;m&#8230;either preparing for future giglets or procrastinating from cleaning and sleeping.  I was unschooled for 6 years, and am so delighted to have found a secular homeschooler that isn&#8217;t yappy-sappy, overly politically or anti-religiously driven, and with a squeee-worthy sense of humor, plus this Secular Thursday biz to direct me to more fun n&#8217; games.  Suc;nribe&amp;#8230sdobe.Ha, sadly, even with very few friends in the real world, I totally wanted Pogs (off limits.)  But I did catch all 150 around the world, so&#8230;heh.  Hi.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","8","0");
INSERT INTO comments VALUES("33","759","Susannah","0ybxlesqy@yahoo.com","http://qvwgsidxtt.com","188.143.232.27","2016-11-26 10:45:32","2016-11-26 10:45:32","LP is right. I&#8217;m an independent and I don&#8217;t like where the republicans are going. Obama has made some mistakes but he was right on GM and they should just admit it. Maybe Ob1;8&amp;#a2a7ms jobs plan isn&#8217;t perfect, but theres room for compromise. If the republicans could ask the rich to pay a little more we could turn this economy around. Are we really going to fire teachers and policemen because the republicans are too stubborn? Obama is doing the best he can and the republicans just want to play politics and screw him.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0","","0","0");
INSERT INTO comments VALUES("34","514","Amelia","f0f8c2bd@hotmail.com","http://tghgnfjktw.com","188.143.232.27","2016-11-26 10:55:54","2016-11-26 10:55:54","These Valued inrncause Tips I read on Bing From your Blog, Is Most Helpful To Readers, thanks For the great Article, Looking Forward To Reading Some More On Your Next Topic","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","0","0");
INSERT INTO comments VALUES("35","755","Jaydee","7sbvk7eaa7@hotmail.com","http://pnmukljnje.com","188.143.234.155","2016-11-26 10:59:43","2016-11-26 10:59:43","I seldom drop remarks, but i did some searching and wound up here Embed Code | Intelicom. And I actually do have a couple of questions for you if you do#2n8&amp;17;t mind. Is it simply me or does it look like some of these responses come across like written by brain dead people?   And, if you are posting on other online sites, I would like to keep up with anything new you have to post. Could you list of every one of all your public sites like your Facebook page, twitter feed, or linkedin profile?","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","0","0");
INSERT INTO comments VALUES("36","1195","Artrell","yzyfzo3rp@hotmail.com","http://xwiwgdsa.com","188.143.232.27","2016-11-26 11:06:32","2016-11-26 11:06:32","Lena HC sk:HÃerriv¤rligt att du Ã¤r igÃ¥ng, och med vilken fin sida! Ã„ntligen kan jag fÃ¶lja dig. Ã–nskar dig allt gott!Kramar /Lena","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","3","0");
INSERT INTO comments VALUES("37","749","Carlye","zhu8b3yl@hotmail.com","http://njzcczd.com","188.143.232.32","2016-11-26 11:13:41","2016-11-26 11:13:41","This is clearly a case of penalizing the majority of the public instead of the offender! We were refused a patent related service by the Mumbai patent office on cheque payment - the Patent Office insisted on a DD. In these days of core banking there is no difference between outstation and local cheques, i.e. there are no collection deahls/cyarges.","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","","6","0");
INSERT INTO comments VALUES("44","1248","Jimbo","y9vs1p6wwh@gmail.com","","188.143.234.155","2016-11-26 12:34:22","2016-11-26 12:34:22","If only there were more clveer people like you!","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36","review","0","0");
INSERT INTO comments VALUES("54","1195","SailipDom","r8974jjil@gmail.com","http://undeclaiming.xyz","46.161.9.12","2017-05-16 20:26:09","2017-05-16 20:26:09","http://undeclaiming.xyz <a href="http://undeclaiming.xyz" rel="nofollow">norsk kasino</a> http://undeclaiming.xyz - norsk kasino","0","0","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0","","0","0");
INSERT INTO comments VALUES("57","1246","SEApotek","winslowssales67@gmail.com","","146.185.223.71","2017-08-28 16:07:20","2017-08-28 16:07:20","beställa billig, http://sverige-apotek.life/floxlevo.html , till salu i Sverige.","0","0","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36","review","0","0");
INSERT INTO comments VALUES("60","300","sverige-apotek.life","winslowssales67@gmail.com","","146.185.223.71","2017-08-28 16:50:52","2017-08-28 16:50:52","göteborg göteborg, http://sverige-apotek.life/cipflox.html , köpa billigt malmö.","0","0","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36","review","0","0");
INSERT INTO comments VALUES("64","1248","sverige-apotek","winslowssales67@gmail.com","","146.185.223.71","2017-08-28 18:03:11","2017-08-28 18:03:11","priser, http://sverige-apotek.life/klarigen.html , kapslar köpa.","0","0","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36","review","0","0");
INSERT INTO comments VALUES("72","290","sverige-apotek","winslowssales67@gmail.com","","146.185.223.71","2017-08-28 20:08:08","2017-08-28 20:08:08","on-line europe, http://sverige-apotek.life/enalaprilum.html , till salu tabletter.","0","0","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36","review","0","0");
INSERT INTO comments VALUES("74","284","sverige-apotek","winslowssales67@gmail.com","","146.185.223.71","2017-08-28 20:16:38","2017-08-28 20:16:38","sweden online shop, http://sverige-apotek.life/selvim.html , kapslar göteborg.","0","0","Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53 BingPreview/1.0b","review","0","0");
INSERT INTO comments VALUES("83","298","sverige-apotek life","winslowssales67@gmail.com","","146.185.223.71","2017-08-28 23:08:55","2017-08-28 23:08:55","bästa pris pris, http://sverige-apotek.life/burten.html , köp online apoteket.","0","0","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144","review","0","0");
INSERT INTO comments VALUES("86","277","sverige-apotek.life","winslowssales67@gmail.com","","146.185.223.71","2017-08-29 00:56:11","2017-08-29 00:56:11","shop göteborg, http://sverige-apotek.life/epleptin.html , pris pa göteborg.","0","0","Mozilla/5.0 (Windows NT 6.1; rv:53.0) Gecko/20100101 Firefox/53.0","review","0","0");
INSERT INTO comments VALUES("90","289","sverige-apotek","winslowssales67@gmail.com","","146.185.223.71","2017-08-29 02:19:58","2017-08-29 02:19:58","billiga pris, http://sverige-apotek.life/lipitin.html , generic europe USA.","0","0","Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0","review","0","0");
INSERT INTO comments VALUES("106","2137","WooCommerce","woocommerce@abmworldmart.com","","","2019-05-26 06:43:28","2019-05-26 06:43:28","Awaiting cheque payment Order status changed from Pending Payment to On Hold.","0","1","WooCommerce","order_note","0","0");
INSERT INTO comments VALUES("108","2111","Niklaus","Niklaus@gmail.com","","137.74.80.168","2019-07-04 16:51:56","2019-07-04 16:51:56","NbBQXgYOOdlmW6tE86mpEvf4vd8AubWEBJQ2Qy4SeGN5LfYVcu8j7oAl9L4nyXlwSJEAve2L1

Hi, very nice website, cheers!
------------------------------------------------------
Need cheap and reliable hosting? Our shared plans start at $10 for an year and VPS plans for $6/Mo.
------------------------------------------------------
Check here: https://www.reliable-webhosting.com/

NbBQXgYOOdlmW6tE86mpEvf4vd8AubWEBJQ2Qy4SeGN5LfYVcu8j7oAl9L4nyXlwSJEAve2L1","0","0","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0","","0","0");
INSERT INTO comments VALUES("109","2168","WooCommerce","woocommerce@abmworldmart.com","","","2020-05-05 15:47:04","2020-05-05 15:47:04","Awaiting cheque payment Order status changed from Pending Payment to On Hold.","0","1","WooCommerce","order_note","0","0");
INSERT INTO comments VALUES("110","2240","Eric Jones","eric@talkwithwebvisitor.com","","173.232.226.7","2020-06-10 02:19:44","2020-06-10 02:19:44","Hey there, I just found your site, quick question…

My name’s Eric, I found abmworldmart.com after doing a quick search – you showed up near the top of the rankings, so whatever you’re doing for SEO, looks like it’s working well.

So here’s my question – what happens AFTER someone lands on your site?  Anything?

Research tells us at least 70% of the people who find your site, after a quick once-over, they disappear… forever.

That means that all the work and effort you put into getting them to show up, goes down the tubes.

Why would you want all that good work – and the great site you’ve built – go to waste?

Because the odds are they’ll just skip over calling or even grabbing their phone, leaving you high and dry.

But here’s a thought… what if you could make it super-simple for someone to raise their hand, say, “okay, let’s talk” without requiring them to even pull their cell phone from their pocket?
  
You can – thanks to revolutionary new software that can literally make that first call happen NOW.

Talk With Web Visitor is a software widget that sits on your site, ready and waiting to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re still there at your site.
  
You know, strike when the iron’s hot!

CLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.

When targeting leads, you HAVE to act fast – the difference between contacting someone within 5 minutes versus 30 minutes later is huge – like 100 times better!

That’s why you should check out our new SMS Text With Lead feature as well… once you’ve captured the phone number of the website visitor, you can automatically kick off a text message (SMS) conversation with them. 
 
Imagine how powerful this could be – even if they don’t take you up on your offer immediately, you can stay in touch with them using text messages to make new offers, provide links to great content, and build your credibility.

Just this alone could be a game changer to make your website even more effective.

Strike when  the iron’s hot!

CLICK HERE http://www.talkwithwebvisitor.com to learn more about everything Talk With Web Visitor can do for your business – you’ll be amazed.

Thanks and keep up the great work!

Eric
PS: Talk With Web Visitor offers a FREE 14 days trial – you could be converting up to 100x more leads immediately!   
It even includes International Long Distance Calling. 
Stop wasting money chasing eyeballs that don’t turn into paying customers. 
CLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.

If you'd like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=abmworldmart.com","0","0","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36","","0","0");
INSERT INTO comments VALUES("111","2240","Eric Jones","eric@talkwithwebvisitor.com","","23.89.247.110","2020-06-14 01:37:34","2020-06-14 01:37:34","Cool website!

My name’s Eric, and I just found your site - abmworldmart.com - while surfing the net. You showed up at the top of the search results, so I checked you out. Looks like what you’re doing is pretty cool.
 
But if you don’t mind me asking – after someone like me stumbles across abmworldmart.com, what usually happens?

Is your site generating leads for your business? 
 
I’m guessing some, but I also bet you’d like more… studies show that 7 out 10 who land on a site wind up leaving without a trace.

Not good.

Here’s a thought – what if there was an easy way for every visitor to “raise their hand” to get a phone call from you INSTANTLY… the second they hit your site and said, “call me now.”

You can –
  
Talk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re literally looking over your site.

CLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.

Time is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!

That’s why we built out our new SMS Text With Lead feature… because once you’ve captured the visitor’s phone number, you can automatically start a text message (SMS) conversation.
  
Think about the possibilities – even if you don’t close a deal then and there, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.

Wouldn’t that be cool?

CLICK HERE http://www.talkwithwebvisitor.com to discover what Talk With Web Visitor can do for your business.

You could be converting up to 100X more leads today!
Eric

PS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. 
You have customers waiting to talk with you right now… don’t keep them waiting. 
CLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.

If you'd like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=abmworldmart.com","0","0","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36","","0","0");
INSERT INTO comments VALUES("112","2240","Eric Jones","eric@talkwithwebvisitor.com","","181.177.112.48","2020-06-15 18:50:12","2020-06-15 18:50:12","Hey, my name’s Eric and for just a second, imagine this…

- Someone does a search and winds up at abmworldmart.com.

- They hang out for a minute to check it out.  “I’m interested… but… maybe…”

- And then they hit the back button and check out the other search results instead. 

- Bottom line – you got an eyeball, but nothing else to show for it.

- There they go.

This isn’t really your fault – it happens a LOT – studies show 7 out of 10 visitors to any site disappear without leaving a trace.

But you CAN fix that.

Talk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know right then and there – enabling you to call that lead while they’re literally looking over your site.

CLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.

Time is money when it comes to connecting with leads – the difference between contacting someone within 5 minutes versus 30 minutes later can be huge – like 100 times better!

Plus, now that you have their phone number, with our new SMS Text With Lead feature you can automatically start a text (SMS) conversation… so even if you don’t close a deal then, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.

Strong stuff.

CLICK HERE http://www.talkwithwebvisitor.com to discover what Talk With Web Visitor can do for your business.

You could be converting up to 100X more leads today!

Eric
PS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. 
You have customers waiting to talk with you right now… don’t keep them waiting. 
CLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.

If you'd like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=abmworldmart.com","0","0","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36","","0","0");
INSERT INTO comments VALUES("113","2502","Mahadi","Mahadihassan2894@gmail.com","","103.67.157.29","2020-07-11 15:26:35","2020-07-11 15:26:35","Good looking And wonderful designe...good Delivery Service.Thank you Abmworldmark","0","1","Mozilla/5.0 (Linux; Android 4.4.4; SM-G360H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36","","0","0");



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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO ecommerce_termmeta VALUES("1","17","thumbnail_id","1");
INSERT INTO ecommerce_termmeta VALUES("2","18","thumbnail_id","2");
INSERT INTO ecommerce_termmeta VALUES("3","19","thumbnail_id","3");
INSERT INTO ecommerce_termmeta VALUES("4","20","thumbnail_id","4");
INSERT INTO ecommerce_termmeta VALUES("5","21","thumbnail_id","5");
INSERT INTO ecommerce_termmeta VALUES("6","22","thumbnail_id","6");
INSERT INTO ecommerce_termmeta VALUES("7","23","thumbnail_id","7");
INSERT INTO ecommerce_termmeta VALUES("8","24","thumbnail_id","8");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2019_08_19_000000_create_failed_jobs_table","1");
INSERT INTO migrations VALUES("3","2020_07_11_100407_create_admins_table","1");
INSERT INTO migrations VALUES("4","2014_10_12_100000_create_password_resets_table","2");
INSERT INTO migrations VALUES("5","2020_09_14_100203_create_wishlist","2");
INSERT INTO migrations VALUES("6","2020_10_17_172535_create_permission_tables","3");
INSERT INTO migrations VALUES("7","2020_10_19_153722_create_permission_tables","4");



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
) ENGINE=MyISAM AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_itemmeta VALUES("1","1","_tax_class","","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("2","1","_qty","1","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("3","1","_product_id","122","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("4","1","_variation_id","","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("5","1","_line_subtotal","3000","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("6","1","_line_total","3000","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("7","1","_line_subtotal_tax","","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("8","1","_line_tax","","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("9","1","_line_tax_data","2020-10-08 22:59:58","165","2020-10-08","2");
INSERT INTO order_itemmeta VALUES("10","2","_tax_class","","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("11","2","_qty","1","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("12","2","_product_id","121","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("13","2","_variation_id","","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("14","2","_line_subtotal","3000","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("15","2","_line_total","3000","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("16","2","_line_subtotal_tax","","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("17","2","_line_tax","","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("18","2","_line_tax_data","2020-10-10 16:08:12","166","2020-10-10","0");
INSERT INTO order_itemmeta VALUES("19","3","_tax_class","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("20","3","_qty","1","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("21","3","_product_id","74","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("22","3","_variation_id","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("23","3","_line_subtotal","30000","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("24","3","_line_total","30000","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("25","3","_line_subtotal_tax","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("26","3","_line_tax","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("27","3","_line_tax_data","2020-10-10 23:35:00","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("28","4","_tax_class","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("29","4","_qty","10","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("30","4","_product_id","119","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("31","4","_variation_id","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("32","4","_line_subtotal","30000","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("33","4","_line_total","30000","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("34","4","_line_subtotal_tax","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("35","4","_line_tax","","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("36","4","_line_tax_data","2020-10-10 23:35:00","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("37","5","_tax_class","","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("38","5","_qty","5","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("39","5","_product_id","116","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("40","5","_variation_id","","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("41","5","_line_subtotal","15000","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("42","5","_line_total","15000","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("43","5","_line_subtotal_tax","","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("44","5","_line_tax","","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("45","5","_line_tax_data","2020-10-10 23:36:31","170","2020-10-10","4");
INSERT INTO order_itemmeta VALUES("46","3","product_status","cancel","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("47","4","product_status","cancel","169","2020-10-10","2");
INSERT INTO order_itemmeta VALUES("48","6","_tax_class","","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("49","6","_qty","6","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("50","6","_product_id","114","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("51","6","_variation_id","","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("52","6","_line_subtotal","18000","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("53","6","_line_total","18000","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("54","6","_line_subtotal_tax","","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("55","6","_line_tax","","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("56","6","_line_tax_data","2020-10-12 20:52:19","171","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("57","7","_tax_class","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("58","7","_qty","13","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("59","7","_product_id","115","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("60","7","_variation_id","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("61","7","_line_subtotal","39000","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("62","7","_line_total","39000","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("63","7","_line_subtotal_tax","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("64","7","_line_tax","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("65","7","_line_tax_data","2020-10-12 21:20:17","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("66","8","_tax_class","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("67","8","_qty","9","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("68","8","_product_id","102","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("69","8","_variation_id","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("70","8","_line_subtotal","27000","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("71","8","_line_total","27000","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("72","8","_line_subtotal_tax","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("73","8","_line_tax","","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("74","8","_line_tax_data","2020-10-12 21:20:17","172","2020-10-12","5");
INSERT INTO order_itemmeta VALUES("75","9","_tax_class","","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("76","9","_qty","1","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("77","9","_product_id","174","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("78","9","_variation_id","","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("79","9","_line_subtotal","3000","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("80","9","_line_total","3000","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("81","9","_line_subtotal_tax","","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("82","9","_line_tax","","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("83","9","_line_tax_data","2020-10-15 19:33:01","175","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("84","10","_tax_class","","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("85","10","_qty","1","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("86","10","_product_id","122","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("87","10","_variation_id","","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("88","10","_line_subtotal","3000","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("89","10","_line_total","3000","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("90","10","_line_subtotal_tax","","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("91","10","_line_tax","","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("92","10","_line_tax_data","2020-10-15 23:09:14","176","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("93","11","_tax_class","","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("94","11","_qty","3","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("95","11","_product_id","174","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("96","11","_variation_id","","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("97","11","_line_subtotal","9000","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("98","11","_line_total","9000","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("99","11","_line_subtotal_tax","","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("100","11","_line_tax","","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("101","11","_line_tax_data","2020-10-15 23:19:21","177","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("102","12","_tax_class","","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("103","12","_qty","3","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("104","12","_product_id","114","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("105","12","_variation_id","","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("106","12","_line_subtotal","9000","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("107","12","_line_total","9000","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("108","12","_line_subtotal_tax","","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("109","12","_line_tax","","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("110","12","_line_tax_data","2020-10-15 23:20:43","178","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("111","13","_tax_class","","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("112","13","_qty","2","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("113","13","_product_id","108","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("114","13","_variation_id","","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("115","13","_line_subtotal","6000","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("116","13","_line_total","6000","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("117","13","_line_subtotal_tax","","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("118","13","_line_tax","","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("119","13","_line_tax_data","2020-10-15 23:21:28","179","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("120","14","_tax_class","","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("121","14","_qty","3","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("122","14","_product_id","118","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("123","14","_variation_id","","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("124","14","_line_subtotal","9000","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("125","14","_line_total","9000","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("126","14","_line_subtotal_tax","","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("127","14","_line_tax","","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("128","14","_line_tax_data","2020-10-15 23:23:54","180","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("129","15","_tax_class","","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("130","15","_qty","1","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("131","15","_product_id","121","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("132","15","_variation_id","","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("133","15","_line_subtotal","3000","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("134","15","_line_total","3000","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("135","15","_line_subtotal_tax","","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("136","15","_line_tax","","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("137","15","_line_tax_data","2020-10-15 23:24:39","181","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("138","16","_tax_class","","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("139","16","_qty","3","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("140","16","_product_id","117","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("141","16","_variation_id","","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("142","16","_line_subtotal","9000","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("143","16","_line_total","9000","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("144","16","_line_subtotal_tax","","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("145","16","_line_tax","","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("146","16","_line_tax_data","2020-10-15 23:25:55","182","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("147","17","_tax_class","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("148","17","_qty","1","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("149","17","_product_id","108","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("150","17","_variation_id","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("151","17","_line_subtotal","3000","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("152","17","_line_total","3000","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("153","17","_line_subtotal_tax","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("154","17","_line_tax","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("155","17","_line_tax_data","2020-10-16 00:06:45","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("156","18","_tax_class","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("157","18","_qty","1","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("158","18","_product_id","174","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("159","18","_variation_id","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("160","18","_line_subtotal","3000","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("161","18","_line_total","3000","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("162","18","_line_subtotal_tax","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("163","18","_line_tax","","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("164","18","_line_tax_data","2020-10-16 00:06:45","183","2020-10-15","5");
INSERT INTO order_itemmeta VALUES("165","19","_tax_class","","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("166","19","_qty","1","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("167","19","_product_id","174","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("168","19","_variation_id","","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("169","19","_line_subtotal","3000","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("170","19","_line_total","3000","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("171","19","_line_subtotal_tax","","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("172","19","_line_tax","","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("173","19","_line_tax_data","2020-10-17 18:59:03","184","2020-10-17","5");
INSERT INTO order_itemmeta VALUES("174","20","_tax_class","","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("175","20","_qty","1","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("176","20","_product_id","174","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("177","20","_variation_id","","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("178","20","_line_subtotal","3000","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("179","20","_line_total","3000","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("180","20","_line_subtotal_tax","","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("181","20","_line_tax","","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("182","20","_line_tax_data","2020-10-20 18:35:37","185","2020-10-20","0");
INSERT INTO order_itemmeta VALUES("183","21","_tax_class","","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("184","21","_qty","4","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("185","21","_product_id","174","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("186","21","_variation_id","","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("187","21","_line_subtotal","12000","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("188","21","_line_total","12000","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("189","21","_line_subtotal_tax","","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("190","21","_line_tax","","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("191","21","_line_tax_data","2020-10-21 18:22:20","187","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("192","22","_tax_class","","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("193","22","_qty","1","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("194","22","_product_id","120","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("195","22","_variation_id","","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("196","22","_line_subtotal","3000","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("197","22","_line_total","3000","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("198","22","_line_subtotal_tax","","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("199","22","_line_tax","","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("200","22","_line_tax_data","2020-10-21 18:24:23","188","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("201","23","_tax_class","","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("202","23","_qty","1","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("203","23","_product_id","119","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("204","23","_variation_id","","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("205","23","_line_subtotal","3000","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("206","23","_line_total","3000","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("207","23","_line_subtotal_tax","","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("208","23","_line_tax","","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("209","23","_line_tax_data","2020-10-21 18:59:59","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("210","23","delivery_charge","60","189","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("211","24","_tax_class","","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("212","24","_qty","3","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("213","24","_product_id","98","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("214","24","_variation_id","","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("215","24","_line_subtotal","9000","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("216","24","_line_total","9000","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("217","24","_line_subtotal_tax","","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("218","24","_line_tax","","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("219","24","_line_tax_data","2020-10-21 19:24:28","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("220","24","delivery_charge","60","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("221","24","customer_pay_delivery_charge","60","190","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("222","25","_tax_class","","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("223","25","_qty","2","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("224","25","_product_id","174","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("225","25","_variation_id","","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("226","25","_line_subtotal","6000","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("227","25","_line_total","6000","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("228","25","_line_subtotal_tax","","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("229","25","_line_tax","","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("230","25","_line_tax_data","2020-10-21 19:32:37","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("231","25","delivery_charge","0","191","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("232","26","_tax_class","","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("233","26","_qty","1","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("234","26","_product_id","123","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("235","26","_variation_id","","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("236","26","_line_subtotal","3000","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("237","26","_line_total","3000","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("238","26","_line_subtotal_tax","","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("239","26","_line_tax","","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("240","26","_line_tax_data","2020-10-21 19:33:06","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("241","26","delivery_charge","60","192","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("242","27","_tax_class","","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("243","27","_qty","5","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("244","27","_product_id","117","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("245","27","_variation_id","","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("246","27","_line_subtotal","15000","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("247","27","_line_total","15000","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("248","27","_line_subtotal_tax","","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("249","27","_line_tax","","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("250","27","_line_tax_data","2020-10-21 19:34:00","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("251","27","delivery_charge","60","193","2020-10-21","2");
INSERT INTO order_itemmeta VALUES("252","28","_tax_class","","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("253","28","_qty","1","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("254","28","_product_id","116","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("255","28","_variation_id","","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("256","28","_line_subtotal","3000","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("257","28","_line_total","3000","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("258","28","_line_subtotal_tax","","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("259","28","_line_tax","","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("260","28","_line_tax_data","2020-10-22 15:38:00","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("261","28","delivery_charge","0","194","2020-10-22","0");
INSERT INTO order_itemmeta VALUES("262","29","_tax_class","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("263","29","_qty","2","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("264","29","_product_id","122","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("265","29","_variation_id","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("266","29","_line_subtotal","6000","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("267","29","_line_total","6000","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("268","29","_line_subtotal_tax","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("269","29","_line_tax","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("270","29","_line_tax_data","2020-10-22 15:43:42","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("271","29","delivery_charge","0","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("272","30","_tax_class","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("273","30","_qty","1","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("274","30","_product_id","70","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("275","30","_variation_id","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("276","30","_line_subtotal","3000","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("277","30","_line_total","3000","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("278","30","_line_subtotal_tax","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("279","30","_line_tax","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("280","30","_line_tax_data","2020-10-22 15:43:42","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("281","30","delivery_charge","0","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("282","31","_tax_class","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("283","31","_qty","4","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("284","31","_product_id","76","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("285","31","_variation_id","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("286","31","_line_subtotal","12000","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("287","31","_line_total","12000","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("288","31","_line_subtotal_tax","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("289","31","_line_tax","","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("290","31","_line_tax_data","2020-10-22 15:43:42","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("291","31","delivery_charge","0","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("292","30","product_status","cancel","195","2020-10-22","2");
INSERT INTO order_itemmeta VALUES("293","32","_tax_class","","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("294","32","_qty","1","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("295","32","_product_id","121","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("296","32","_variation_id","","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("297","32","_line_subtotal","3000","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("298","32","_line_total","3000","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("299","32","_line_subtotal_tax","","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("300","32","_line_tax","","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("301","32","_line_tax_data","2020-10-24 15:43:54","196","2020-10-24","0");
INSERT INTO order_itemmeta VALUES("302","32","delivery_charge","0","196","2020-10-24","0");



CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_items VALUES("1","Tunic 5","line-item","122","165");
INSERT INTO order_items VALUES("2","Tunic 4-2","line-item","121","166");
INSERT INTO order_items VALUES("3","Crossbody bag 1","line-item","74","169");
INSERT INTO order_items VALUES("4","Tunic 3-2","line-item","119","169");
INSERT INTO order_items VALUES("5","Tunic 2","line-item","116","170");
INSERT INTO order_items VALUES("6","Tunic 1-2","line-item","114","171");
INSERT INTO order_items VALUES("7","Tshirt 2","line-item","115","172");
INSERT INTO order_items VALUES("8","Dresses 3","line-item","102","172");
INSERT INTO order_items VALUES("9","Tunic 5-3","line-item","174","175");
INSERT INTO order_items VALUES("10","Tunic 5","line-item","122","176");
INSERT INTO order_items VALUES("11","Tunic 5-3","line-item","174","177");
INSERT INTO order_items VALUES("12","Tunic 1-2","line-item","114","178");
INSERT INTO order_items VALUES("13","Tshirt 2","line-item","108","179");
INSERT INTO order_items VALUES("14","Tunic 3","line-item","118","180");
INSERT INTO order_items VALUES("15","Tunic 4-2","line-item","121","181");
INSERT INTO order_items VALUES("16","Tunic 2-2","line-item","117","182");
INSERT INTO order_items VALUES("17","Tshirt 2","line-item","108","183");
INSERT INTO order_items VALUES("18","Tunic 5-3","line-item","174","183");
INSERT INTO order_items VALUES("19","Tunic 5-3","line-item","174","184");
INSERT INTO order_items VALUES("20","Tunic 5-3","line-item","174","185");
INSERT INTO order_items VALUES("21","Tunic 5-3","line-item","174","187");
INSERT INTO order_items VALUES("22","Tunic 4","line-item","120","188");
INSERT INTO order_items VALUES("23","Tunic 3-2","line-item","119","189");
INSERT INTO order_items VALUES("24","Necklace 3","line-item","98","190");
INSERT INTO order_items VALUES("25","Tunic 5-3","line-item","174","191");
INSERT INTO order_items VALUES("26","Tunic 5-2","line-item","123","192");
INSERT INTO order_items VALUES("27","Tunic 2-2","line-item","117","193");
INSERT INTO order_items VALUES("28","Tunic 2","line-item","116","194");
INSERT INTO order_items VALUES("29","Tunic 5","line-item","122","195");
INSERT INTO order_items VALUES("30","Belt 1","line-item","70","195");
INSERT INTO order_items VALUES("31","Crossbody bag 2-2","line-item","76","195");
INSERT INTO order_items VALUES("32","Tunic 4-2","line-item","121","196");



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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




CREATE TABLE `postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2827 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO postmeta VALUES("1","1","attached_file","1601117227.png");
INSERT INTO postmeta VALUES("2","2","attached_file","1601118379.png");
INSERT INTO postmeta VALUES("3","3","attached_file","1601118986.jpg");
INSERT INTO postmeta VALUES("4","4","attached_file","1601119037.png");
INSERT INTO postmeta VALUES("5","5","attached_file","1601119077.png");
INSERT INTO postmeta VALUES("6","6","attached_file","1601119229.png");
INSERT INTO postmeta VALUES("7","7","attached_file","1601119275.png");
INSERT INTO postmeta VALUES("8","8","attached_file","1601119422.png");
INSERT INTO postmeta VALUES("885","75","regular_price","5000");
INSERT INTO postmeta VALUES("884","75","stock_status","instock");
INSERT INTO postmeta VALUES("883","75","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("882","74","gallery_file","Crossbody bag 1.jpg");
INSERT INTO postmeta VALUES("881","74","attached_file","1601879560.jpg");
INSERT INTO postmeta VALUES("880","74","_sku","100");
INSERT INTO postmeta VALUES("879","74","start_stock","1000");
INSERT INTO postmeta VALUES("878","74","product_stock","1000");
INSERT INTO postmeta VALUES("877","74","alert_qty","40");
INSERT INTO postmeta VALUES("876","74","qty","25");
INSERT INTO postmeta VALUES("875","74","height","");
INSERT INTO postmeta VALUES("874","74","width","");
INSERT INTO postmeta VALUES("873","74","length","");
INSERT INTO postmeta VALUES("872","74","weight","");
INSERT INTO postmeta VALUES("871","74","sale_price","30000");
INSERT INTO postmeta VALUES("870","74","regular_price","5000");
INSERT INTO postmeta VALUES("869","74","stock_status","instock");
INSERT INTO postmeta VALUES("868","74","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("867","73","gallery_file","Sunglases 1.jpg");
INSERT INTO postmeta VALUES("838","72","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("349","35","attached_file","1601121125.jpg");
INSERT INTO postmeta VALUES("348","35","alert_qty","29");
INSERT INTO postmeta VALUES("347","35","qty","26");
INSERT INTO postmeta VALUES("346","35","height","");
INSERT INTO postmeta VALUES("345","35","width","");
INSERT INTO postmeta VALUES("344","35","length","");
INSERT INTO postmeta VALUES("343","35","weight","");
INSERT INTO postmeta VALUES("342","35","sale_price","3500");
INSERT INTO postmeta VALUES("341","35","regular_price","4000");
INSERT INTO postmeta VALUES("340","35","stock_status","instock");
INSERT INTO postmeta VALUES("866","73","attached_file","1601879409.jpg");
INSERT INTO postmeta VALUES("865","73","_sku","100");
INSERT INTO postmeta VALUES("864","73","start_stock","1000");
INSERT INTO postmeta VALUES("863","73","product_stock","1000");
INSERT INTO postmeta VALUES("862","73","alert_qty","55");
INSERT INTO postmeta VALUES("861","73","qty","60");
INSERT INTO postmeta VALUES("860","73","height","");
INSERT INTO postmeta VALUES("859","73","width","");
INSERT INTO postmeta VALUES("857","73","weight","");
INSERT INTO postmeta VALUES("858","73","length","");
INSERT INTO postmeta VALUES("856","73","sale_price","30000");
INSERT INTO postmeta VALUES("855","73","regular_price","5000");
INSERT INTO postmeta VALUES("854","73","stock_status","instock");
INSERT INTO postmeta VALUES("302","31","_billing_postcode","4543");
INSERT INTO postmeta VALUES("301","31","_customer_user","2");
INSERT INTO postmeta VALUES("300","31","zip","4543");
INSERT INTO postmeta VALUES("299","31","city","Dhaka");
INSERT INTO postmeta VALUES("298","31","state","Bangladesh");
INSERT INTO postmeta VALUES("297","31","country","Bangladesh");
INSERT INTO postmeta VALUES("296","31","phone","4534534");
INSERT INTO postmeta VALUES("295","31","address_two","");
INSERT INTO postmeta VALUES("294","31","address_one","Uttara");
INSERT INTO postmeta VALUES("293","31","last_name","Demo");
INSERT INTO postmeta VALUES("292","31","first_name","Demo");
INSERT INTO postmeta VALUES("120","18","_billing_postcode","4543");
INSERT INTO postmeta VALUES("119","18","_customer_user","2");
INSERT INTO postmeta VALUES("118","18","zip","4543");
INSERT INTO postmeta VALUES("117","18","city","Dhaka");
INSERT INTO postmeta VALUES("116","18","state","Bangladesh");
INSERT INTO postmeta VALUES("115","18","country","Bangladesh");
INSERT INTO postmeta VALUES("114","18","phone","4534534");
INSERT INTO postmeta VALUES("113","18","address_two","Dhaka");
INSERT INTO postmeta VALUES("112","18","address_one","Uttara");
INSERT INTO postmeta VALUES("111","18","last_name","Demo");
INSERT INTO postmeta VALUES("110","18","first_name","Demo");
INSERT INTO postmeta VALUES("99","16","banner_image","1601192209.png");
INSERT INTO postmeta VALUES("100","17","stock_status","instock");
INSERT INTO postmeta VALUES("101","17","regular_price","5000");
INSERT INTO postmeta VALUES("102","17","sale_price","3000");
INSERT INTO postmeta VALUES("103","17","weight","");
INSERT INTO postmeta VALUES("104","17","length","");
INSERT INTO postmeta VALUES("105","17","width","");
INSERT INTO postmeta VALUES("106","17","height","");
INSERT INTO postmeta VALUES("107","17","qty","0");
INSERT INTO postmeta VALUES("108","17","alert_qty","0");
INSERT INTO postmeta VALUES("109","17","product_stock","1000");
INSERT INTO postmeta VALUES("121","18","_billing_company","");
INSERT INTO postmeta VALUES("122","18","_billing_last_name","");
INSERT INTO postmeta VALUES("123","18","_billing_first_name","");
INSERT INTO postmeta VALUES("124","19","first_name","Demo");
INSERT INTO postmeta VALUES("125","19","last_name","Demo");
INSERT INTO postmeta VALUES("126","19","address_one","Uttara");
INSERT INTO postmeta VALUES("127","19","address_two","Dhaka");
INSERT INTO postmeta VALUES("128","19","phone","4534534");
INSERT INTO postmeta VALUES("129","19","country","Bangladesh");
INSERT INTO postmeta VALUES("130","19","state","Bangladesh");
INSERT INTO postmeta VALUES("131","19","city","Dhaka");
INSERT INTO postmeta VALUES("132","19","zip","4543");
INSERT INTO postmeta VALUES("133","19","_customer_user","2");
INSERT INTO postmeta VALUES("134","19","_billing_postcode","4543");
INSERT INTO postmeta VALUES("135","19","_billing_company","");
INSERT INTO postmeta VALUES("136","19","_billing_last_name","");
INSERT INTO postmeta VALUES("137","19","_billing_first_name","");
INSERT INTO postmeta VALUES("138","20","first_name","Demo");
INSERT INTO postmeta VALUES("139","20","last_name","Demo");
INSERT INTO postmeta VALUES("140","20","address_one","Uttara");
INSERT INTO postmeta VALUES("141","20","address_two","Dhaka");
INSERT INTO postmeta VALUES("142","20","phone","4534534");
INSERT INTO postmeta VALUES("143","20","country","Bangladesh");
INSERT INTO postmeta VALUES("144","20","state","Bangladesh");
INSERT INTO postmeta VALUES("145","20","city","Dhaka");
INSERT INTO postmeta VALUES("146","20","zip","4543");
INSERT INTO postmeta VALUES("147","20","_customer_user","2");
INSERT INTO postmeta VALUES("148","20","_billing_postcode","4543");
INSERT INTO postmeta VALUES("149","20","_billing_company","");
INSERT INTO postmeta VALUES("150","20","_billing_last_name","");
INSERT INTO postmeta VALUES("151","20","_billing_first_name","");
INSERT INTO postmeta VALUES("152","21","first_name","Demo");
INSERT INTO postmeta VALUES("153","21","last_name","Demo");
INSERT INTO postmeta VALUES("154","21","address_one","Uttara");
INSERT INTO postmeta VALUES("155","21","address_two","Dhaka");
INSERT INTO postmeta VALUES("156","21","phone","4534534");
INSERT INTO postmeta VALUES("157","21","country","Bangladesh");
INSERT INTO postmeta VALUES("158","21","state","Bangladesh");
INSERT INTO postmeta VALUES("159","21","city","Dhaka");
INSERT INTO postmeta VALUES("160","21","zip","4543");
INSERT INTO postmeta VALUES("161","21","_customer_user","2");
INSERT INTO postmeta VALUES("162","21","_billing_postcode","4543");
INSERT INTO postmeta VALUES("163","21","_billing_company","");
INSERT INTO postmeta VALUES("164","21","_billing_last_name","");
INSERT INTO postmeta VALUES("165","21","_billing_first_name","");
INSERT INTO postmeta VALUES("166","22","first_name","Demo");
INSERT INTO postmeta VALUES("167","22","last_name","Demo");
INSERT INTO postmeta VALUES("168","22","address_one","Uttara");
INSERT INTO postmeta VALUES("169","22","address_two","Dhaka");
INSERT INTO postmeta VALUES("170","22","phone","4534534");
INSERT INTO postmeta VALUES("171","22","country","Bangladesh");
INSERT INTO postmeta VALUES("172","22","state","Bangladesh");
INSERT INTO postmeta VALUES("173","22","city","Dhaka");
INSERT INTO postmeta VALUES("174","22","zip","4543");
INSERT INTO postmeta VALUES("175","22","_customer_user","2");
INSERT INTO postmeta VALUES("176","22","_billing_postcode","4543");
INSERT INTO postmeta VALUES("177","22","_billing_company","");
INSERT INTO postmeta VALUES("178","22","_billing_last_name","");
INSERT INTO postmeta VALUES("179","22","_billing_first_name","");
INSERT INTO postmeta VALUES("180","23","first_name","Demo");
INSERT INTO postmeta VALUES("181","23","last_name","Demo");
INSERT INTO postmeta VALUES("182","23","address_one","Uttara");
INSERT INTO postmeta VALUES("183","23","address_two","Dhaka");
INSERT INTO postmeta VALUES("184","23","phone","4534534");
INSERT INTO postmeta VALUES("185","23","country","Bangladesh");
INSERT INTO postmeta VALUES("186","23","state","Bangladesh");
INSERT INTO postmeta VALUES("187","23","city","Dhaka");
INSERT INTO postmeta VALUES("188","23","zip","4543");
INSERT INTO postmeta VALUES("189","23","_customer_user","2");
INSERT INTO postmeta VALUES("190","23","_billing_postcode","4543");
INSERT INTO postmeta VALUES("191","23","_billing_company","");
INSERT INTO postmeta VALUES("192","23","_billing_last_name","");
INSERT INTO postmeta VALUES("193","23","_billing_first_name","");
INSERT INTO postmeta VALUES("194","24","first_name","Demo");
INSERT INTO postmeta VALUES("195","24","last_name","Demo");
INSERT INTO postmeta VALUES("196","24","address_one","Uttara");
INSERT INTO postmeta VALUES("197","24","address_two","Dhaka");
INSERT INTO postmeta VALUES("198","24","phone","4534534");
INSERT INTO postmeta VALUES("199","24","country","Bangladesh");
INSERT INTO postmeta VALUES("200","24","state","Bangladesh");
INSERT INTO postmeta VALUES("201","24","city","Dhaka");
INSERT INTO postmeta VALUES("202","24","zip","4543");
INSERT INTO postmeta VALUES("203","24","_customer_user","2");
INSERT INTO postmeta VALUES("204","24","_billing_postcode","4543");
INSERT INTO postmeta VALUES("205","24","_billing_company","");
INSERT INTO postmeta VALUES("206","24","_billing_last_name","");
INSERT INTO postmeta VALUES("207","24","_billing_first_name","");
INSERT INTO postmeta VALUES("208","25","first_name","Demo");
INSERT INTO postmeta VALUES("209","25","last_name","Demo");
INSERT INTO postmeta VALUES("210","25","address_one","Uttara");
INSERT INTO postmeta VALUES("211","25","address_two","Dhaka");
INSERT INTO postmeta VALUES("212","25","phone","4534534");
INSERT INTO postmeta VALUES("213","25","country","Bangladesh");
INSERT INTO postmeta VALUES("214","25","state","Bangladesh");
INSERT INTO postmeta VALUES("215","25","city","Dhaka");
INSERT INTO postmeta VALUES("216","25","zip","4543");
INSERT INTO postmeta VALUES("217","25","_customer_user","2");
INSERT INTO postmeta VALUES("218","25","_billing_postcode","4543");
INSERT INTO postmeta VALUES("219","25","_billing_company","");
INSERT INTO postmeta VALUES("220","25","_billing_last_name","");
INSERT INTO postmeta VALUES("221","25","_billing_first_name","");
INSERT INTO postmeta VALUES("222","26","first_name","Demo");
INSERT INTO postmeta VALUES("223","26","last_name","Demo");
INSERT INTO postmeta VALUES("224","26","address_one","Uttara");
INSERT INTO postmeta VALUES("225","26","address_two","Dhaka");
INSERT INTO postmeta VALUES("226","26","phone","4534534");
INSERT INTO postmeta VALUES("227","26","country","Bangladesh");
INSERT INTO postmeta VALUES("228","26","state","Bangladesh");
INSERT INTO postmeta VALUES("229","26","city","Dhaka");
INSERT INTO postmeta VALUES("230","26","zip","4543");
INSERT INTO postmeta VALUES("231","26","_customer_user","2");
INSERT INTO postmeta VALUES("232","26","_billing_postcode","4543");
INSERT INTO postmeta VALUES("233","26","_billing_company","");
INSERT INTO postmeta VALUES("234","26","_billing_last_name","");
INSERT INTO postmeta VALUES("235","26","_billing_first_name","");
INSERT INTO postmeta VALUES("236","27","first_name","Demo");
INSERT INTO postmeta VALUES("237","27","last_name","Demo");
INSERT INTO postmeta VALUES("238","27","address_one","Uttara");
INSERT INTO postmeta VALUES("239","27","address_two","");
INSERT INTO postmeta VALUES("240","27","phone","4534534");
INSERT INTO postmeta VALUES("241","27","country","Bangladesh");
INSERT INTO postmeta VALUES("242","27","state","Bangladesh");
INSERT INTO postmeta VALUES("243","27","city","Dhaka");
INSERT INTO postmeta VALUES("244","27","zip","4543");
INSERT INTO postmeta VALUES("245","27","_customer_user","2");
INSERT INTO postmeta VALUES("246","27","_billing_postcode","4543");
INSERT INTO postmeta VALUES("247","27","_billing_company","");
INSERT INTO postmeta VALUES("248","27","_billing_last_name","");
INSERT INTO postmeta VALUES("249","27","_billing_first_name","");
INSERT INTO postmeta VALUES("250","28","first_name","Demo");
INSERT INTO postmeta VALUES("251","28","last_name","Demo");
INSERT INTO postmeta VALUES("252","28","address_one","Uttara");
INSERT INTO postmeta VALUES("253","28","address_two","");
INSERT INTO postmeta VALUES("254","28","phone","4534534");
INSERT INTO postmeta VALUES("255","28","country","Bangladesh");
INSERT INTO postmeta VALUES("256","28","state","Bangladesh");
INSERT INTO postmeta VALUES("257","28","city","Dhaka");
INSERT INTO postmeta VALUES("258","28","zip","4543");
INSERT INTO postmeta VALUES("259","28","_customer_user","2");
INSERT INTO postmeta VALUES("260","28","_billing_postcode","4543");
INSERT INTO postmeta VALUES("261","28","_billing_company","");
INSERT INTO postmeta VALUES("262","28","_billing_last_name","");
INSERT INTO postmeta VALUES("263","28","_billing_first_name","");
INSERT INTO postmeta VALUES("264","29","first_name","Demo");
INSERT INTO postmeta VALUES("265","29","last_name","Demo");
INSERT INTO postmeta VALUES("266","29","address_one","Uttara");
INSERT INTO postmeta VALUES("267","29","address_two","");
INSERT INTO postmeta VALUES("268","29","phone","4534534");
INSERT INTO postmeta VALUES("269","29","country","Bangladesh");
INSERT INTO postmeta VALUES("270","29","state","Bangladesh");
INSERT INTO postmeta VALUES("271","29","city","Dhaka");
INSERT INTO postmeta VALUES("272","29","zip","4543");
INSERT INTO postmeta VALUES("273","29","_customer_user","2");
INSERT INTO postmeta VALUES("274","29","_billing_postcode","4543");
INSERT INTO postmeta VALUES("275","29","_billing_company","");
INSERT INTO postmeta VALUES("276","29","_billing_last_name","");
INSERT INTO postmeta VALUES("277","29","_billing_first_name","");
INSERT INTO postmeta VALUES("278","30","first_name","Demo");
INSERT INTO postmeta VALUES("279","30","last_name","Demo");
INSERT INTO postmeta VALUES("280","30","address_one","Uttara");
INSERT INTO postmeta VALUES("281","30","address_two","");
INSERT INTO postmeta VALUES("282","30","phone","4534534");
INSERT INTO postmeta VALUES("283","30","country","Bangladesh");
INSERT INTO postmeta VALUES("284","30","state","Bangladesh");
INSERT INTO postmeta VALUES("285","30","city","Dhaka");
INSERT INTO postmeta VALUES("286","30","zip","4543");
INSERT INTO postmeta VALUES("287","30","_customer_user","2");
INSERT INTO postmeta VALUES("288","30","_billing_postcode","4543");
INSERT INTO postmeta VALUES("289","30","_billing_company","");
INSERT INTO postmeta VALUES("290","30","_billing_last_name","");
INSERT INTO postmeta VALUES("291","30","_billing_first_name","");
INSERT INTO postmeta VALUES("303","31","_billing_company","");
INSERT INTO postmeta VALUES("304","31","_billing_last_name","");
INSERT INTO postmeta VALUES("305","31","_billing_first_name","");
INSERT INTO postmeta VALUES("833","71","product_stock","1000");
INSERT INTO postmeta VALUES("834","71","start_stock","1000");
INSERT INTO postmeta VALUES("835","71","_sku","100");
INSERT INTO postmeta VALUES("836","71","attached_file","1601879257.jpg");
INSERT INTO postmeta VALUES("837","71","gallery_file","Scarve 1.jpg");
INSERT INTO postmeta VALUES("853","73","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("852","72","gallery_file","Scarve 2.jpg");
INSERT INTO postmeta VALUES("851","72","attached_file","1601879329.jpg");
INSERT INTO postmeta VALUES("831","71","qty","50");
INSERT INTO postmeta VALUES("832","71","alert_qty","45");
INSERT INTO postmeta VALUES("825","71","regular_price","5000");
INSERT INTO postmeta VALUES("829","71","width","");
INSERT INTO postmeta VALUES("830","71","height","");
INSERT INTO postmeta VALUES("828","71","length","");
INSERT INTO postmeta VALUES("827","71","weight","");
INSERT INTO postmeta VALUES("373","38","first_name","Demo");
INSERT INTO postmeta VALUES("374","38","last_name","Demo");
INSERT INTO postmeta VALUES("375","38","address_one","Uttara");
INSERT INTO postmeta VALUES("376","38","address_two","");
INSERT INTO postmeta VALUES("377","38","phone","4534534");
INSERT INTO postmeta VALUES("378","38","country","Bangladesh");
INSERT INTO postmeta VALUES("379","38","state","Bangladesh");
INSERT INTO postmeta VALUES("380","38","city","Dhaka");
INSERT INTO postmeta VALUES("381","38","zip","4543");
INSERT INTO postmeta VALUES("382","38","_customer_user","2");
INSERT INTO postmeta VALUES("383","38","_billing_postcode","4543");
INSERT INTO postmeta VALUES("384","38","_billing_company","");
INSERT INTO postmeta VALUES("385","38","_billing_last_name","");
INSERT INTO postmeta VALUES("386","38","_billing_first_name","");
INSERT INTO postmeta VALUES("387","39","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Red"}]");
INSERT INTO postmeta VALUES("388","39","stock_status","instock");
INSERT INTO postmeta VALUES("389","39","regular_price","5000");
INSERT INTO postmeta VALUES("390","39","sale_price","3000");
INSERT INTO postmeta VALUES("391","39","weight","");
INSERT INTO postmeta VALUES("392","39","length","");
INSERT INTO postmeta VALUES("393","39","width","");
INSERT INTO postmeta VALUES("394","39","height","");
INSERT INTO postmeta VALUES("395","39","qty","79");
INSERT INTO postmeta VALUES("396","39","alert_qty","70");
INSERT INTO postmeta VALUES("397","39","product_stock","1000");
INSERT INTO postmeta VALUES("398","39","_sku","100");
INSERT INTO postmeta VALUES("399","39","attached_file","1601373113.png");
INSERT INTO postmeta VALUES("400","39","gallery_file","dell.png");
INSERT INTO postmeta VALUES("401","40","first_name","Demo");
INSERT INTO postmeta VALUES("402","40","last_name","Demo");
INSERT INTO postmeta VALUES("403","40","address_one","Uttara");
INSERT INTO postmeta VALUES("404","40","address_two","");
INSERT INTO postmeta VALUES("405","40","phone","6789");
INSERT INTO postmeta VALUES("406","40","country","ewrewr");
INSERT INTO postmeta VALUES("407","40","state","4325435");
INSERT INTO postmeta VALUES("408","40","city","34543");
INSERT INTO postmeta VALUES("409","40","zip","");
INSERT INTO postmeta VALUES("410","40","_customer_user","2");
INSERT INTO postmeta VALUES("411","40","_billing_postcode","");
INSERT INTO postmeta VALUES("412","40","_billing_company","");
INSERT INTO postmeta VALUES("413","40","_billing_last_name","");
INSERT INTO postmeta VALUES("414","40","_billing_first_name","");
INSERT INTO postmeta VALUES("415","41","first_name","Demo");
INSERT INTO postmeta VALUES("416","41","last_name","Demo");
INSERT INTO postmeta VALUES("417","41","address_one","retretre");
INSERT INTO postmeta VALUES("418","41","address_two","");
INSERT INTO postmeta VALUES("419","41","phone","6789");
INSERT INTO postmeta VALUES("420","41","country","Bangladesh");
INSERT INTO postmeta VALUES("421","41","state","BD");
INSERT INTO postmeta VALUES("422","41","city","Dhaka");
INSERT INTO postmeta VALUES("423","41","zip","342543543");
INSERT INTO postmeta VALUES("424","41","_customer_user","2");
INSERT INTO postmeta VALUES("425","41","_billing_postcode","342543543");
INSERT INTO postmeta VALUES("426","41","_billing_company","");
INSERT INTO postmeta VALUES("427","41","_billing_last_name","");
INSERT INTO postmeta VALUES("428","41","_billing_first_name","");
INSERT INTO postmeta VALUES("849","72","start_stock","2000");
INSERT INTO postmeta VALUES("850","72","_sku","100");
INSERT INTO postmeta VALUES("848","72","product_stock","2000");
INSERT INTO postmeta VALUES("847","72","alert_qty","20");
INSERT INTO postmeta VALUES("846","72","qty","30");
INSERT INTO postmeta VALUES("845","72","height","");
INSERT INTO postmeta VALUES("844","72","width","");
INSERT INTO postmeta VALUES("843","72","length","");
INSERT INTO postmeta VALUES("842","72","weight","");
INSERT INTO postmeta VALUES("841","72","sale_price","4000");
INSERT INTO postmeta VALUES("840","72","regular_price","5000");
INSERT INTO postmeta VALUES("839","72","stock_status","instock");
INSERT INTO postmeta VALUES("443","43","first_name","Demo");
INSERT INTO postmeta VALUES("444","43","last_name","Demo");
INSERT INTO postmeta VALUES("445","43","address_one","retretre");
INSERT INTO postmeta VALUES("446","43","address_two","");
INSERT INTO postmeta VALUES("447","43","phone","6789");
INSERT INTO postmeta VALUES("448","43","country","Bangladesh");
INSERT INTO postmeta VALUES("449","43","state","BD");
INSERT INTO postmeta VALUES("450","43","city","Dhaka");
INSERT INTO postmeta VALUES("451","43","zip","342543543");
INSERT INTO postmeta VALUES("452","43","_customer_user","2");
INSERT INTO postmeta VALUES("453","43","_billing_postcode","342543543");
INSERT INTO postmeta VALUES("454","43","_billing_company","");
INSERT INTO postmeta VALUES("455","43","_billing_last_name","");
INSERT INTO postmeta VALUES("456","43","_billing_first_name","");
INSERT INTO postmeta VALUES("457","44","first_name","Demo");
INSERT INTO postmeta VALUES("458","44","last_name","Demo");
INSERT INTO postmeta VALUES("459","44","address_one","retretre");
INSERT INTO postmeta VALUES("460","44","address_two","");
INSERT INTO postmeta VALUES("461","44","phone","6789");
INSERT INTO postmeta VALUES("462","44","country","Bangladesh");
INSERT INTO postmeta VALUES("463","44","state","BD");
INSERT INTO postmeta VALUES("464","44","city","Dhaka");
INSERT INTO postmeta VALUES("465","44","zip","342543543");
INSERT INTO postmeta VALUES("466","44","_customer_user","2");
INSERT INTO postmeta VALUES("467","44","_billing_postcode","342543543");
INSERT INTO postmeta VALUES("468","44","_billing_company","");
INSERT INTO postmeta VALUES("469","44","_billing_last_name","");
INSERT INTO postmeta VALUES("470","44","_billing_first_name","");
INSERT INTO postmeta VALUES("471","45","first_name","Demo");
INSERT INTO postmeta VALUES("472","45","last_name","Demo");
INSERT INTO postmeta VALUES("473","45","address_one","retretre");
INSERT INTO postmeta VALUES("474","45","address_two","");
INSERT INTO postmeta VALUES("475","45","phone","6789");
INSERT INTO postmeta VALUES("476","45","country","Bangladesh");
INSERT INTO postmeta VALUES("477","45","state","BD");
INSERT INTO postmeta VALUES("478","45","city","Dhaka");
INSERT INTO postmeta VALUES("479","45","zip","342543543");
INSERT INTO postmeta VALUES("480","45","_customer_user","2");
INSERT INTO postmeta VALUES("481","45","_billing_postcode","342543543");
INSERT INTO postmeta VALUES("482","45","_billing_company","");
INSERT INTO postmeta VALUES("483","45","_billing_last_name","");
INSERT INTO postmeta VALUES("484","45","_billing_first_name","");
INSERT INTO postmeta VALUES("485","46","first_name","Demo");
INSERT INTO postmeta VALUES("486","46","last_name","Demo");
INSERT INTO postmeta VALUES("487","46","address_one","retretre");
INSERT INTO postmeta VALUES("488","46","address_two","");
INSERT INTO postmeta VALUES("489","46","phone","6789");
INSERT INTO postmeta VALUES("490","46","country","Bangladesh");
INSERT INTO postmeta VALUES("491","46","state","BD");
INSERT INTO postmeta VALUES("492","46","city","Dhaka");
INSERT INTO postmeta VALUES("493","46","zip","342543543");
INSERT INTO postmeta VALUES("494","46","_customer_user","2");
INSERT INTO postmeta VALUES("495","46","_billing_postcode","342543543");
INSERT INTO postmeta VALUES("496","46","_billing_company","");
INSERT INTO postmeta VALUES("497","46","_billing_last_name","");
INSERT INTO postmeta VALUES("498","46","_billing_first_name","");
INSERT INTO postmeta VALUES("499","47","first_name","Demo");
INSERT INTO postmeta VALUES("500","47","last_name","Demo");
INSERT INTO postmeta VALUES("501","47","address_one","retretre");
INSERT INTO postmeta VALUES("502","47","address_two","");
INSERT INTO postmeta VALUES("503","47","phone","6789");
INSERT INTO postmeta VALUES("504","47","country","Bangladesh");
INSERT INTO postmeta VALUES("505","47","state","BD");
INSERT INTO postmeta VALUES("506","47","city","Dhaka");
INSERT INTO postmeta VALUES("507","47","zip","342543543");
INSERT INTO postmeta VALUES("508","47","_customer_user","2");
INSERT INTO postmeta VALUES("509","47","_billing_postcode","342543543");
INSERT INTO postmeta VALUES("510","47","_billing_company","");
INSERT INTO postmeta VALUES("511","47","_billing_last_name","");
INSERT INTO postmeta VALUES("512","47","_billing_first_name","");
INSERT INTO postmeta VALUES("513","48","first_name","fdgdfg");
INSERT INTO postmeta VALUES("514","48","last_name","dfgdfg");
INSERT INTO postmeta VALUES("515","48","address_one","dfgfdg");
INSERT INTO postmeta VALUES("516","48","address_two","");
INSERT INTO postmeta VALUES("517","48","phone","4534534");
INSERT INTO postmeta VALUES("518","48","country","34324");
INSERT INTO postmeta VALUES("519","48","state","Bangladesh");
INSERT INTO postmeta VALUES("520","48","city","sdgdfg");
INSERT INTO postmeta VALUES("521","48","zip","4543");
INSERT INTO postmeta VALUES("522","48","_customer_user","0");
INSERT INTO postmeta VALUES("523","48","_billing_postcode","4543");
INSERT INTO postmeta VALUES("524","48","_billing_company","");
INSERT INTO postmeta VALUES("525","48","_billing_last_name","");
INSERT INTO postmeta VALUES("526","48","_billing_first_name","");
INSERT INTO postmeta VALUES("527","48","processing_date","2020-09-30");
INSERT INTO postmeta VALUES("528","49","first_name","fdgdfg");
INSERT INTO postmeta VALUES("529","49","last_name","dfgdfg");
INSERT INTO postmeta VALUES("530","49","address_one","dfgfdg");
INSERT INTO postmeta VALUES("531","49","address_two","");
INSERT INTO postmeta VALUES("532","49","phone","4534534");
INSERT INTO postmeta VALUES("533","49","country","342543");
INSERT INTO postmeta VALUES("534","49","state","Bangladesh");
INSERT INTO postmeta VALUES("535","49","city","sdgdfg");
INSERT INTO postmeta VALUES("536","49","zip","4543");
INSERT INTO postmeta VALUES("537","49","_customer_user","0");
INSERT INTO postmeta VALUES("538","49","_billing_postcode","4543");
INSERT INTO postmeta VALUES("539","49","_billing_company","");
INSERT INTO postmeta VALUES("540","49","_billing_last_name","");
INSERT INTO postmeta VALUES("541","49","_billing_first_name","");
INSERT INTO postmeta VALUES("542","50","first_name","fdgdfg");
INSERT INTO postmeta VALUES("543","50","last_name","dfgdfg");
INSERT INTO postmeta VALUES("544","50","address_one","dfgfdg");
INSERT INTO postmeta VALUES("545","50","address_two","");
INSERT INTO postmeta VALUES("546","50","phone","4534534");
INSERT INTO postmeta VALUES("547","50","country","Bangladesh");
INSERT INTO postmeta VALUES("548","50","state","Bangladesh");
INSERT INTO postmeta VALUES("549","50","city","sdgdfg");
INSERT INTO postmeta VALUES("550","50","zip","4543");
INSERT INTO postmeta VALUES("551","50","_customer_user","0");
INSERT INTO postmeta VALUES("552","50","_billing_postcode","4543");
INSERT INTO postmeta VALUES("553","50","_billing_company","");
INSERT INTO postmeta VALUES("554","50","_billing_last_name","");
INSERT INTO postmeta VALUES("555","50","_billing_first_name","");
INSERT INTO postmeta VALUES("556","51","first_name","akbor Hossain1");
INSERT INTO postmeta VALUES("557","51","last_name","akbor Hossain1");
INSERT INTO postmeta VALUES("558","51","address_one","324324");
INSERT INTO postmeta VALUES("559","51","address_two","");
INSERT INTO postmeta VALUES("560","51","phone","435435");
INSERT INTO postmeta VALUES("561","51","country","345435");
INSERT INTO postmeta VALUES("562","51","state","345435");
INSERT INTO postmeta VALUES("563","51","city","345345");
INSERT INTO postmeta VALUES("564","51","zip","345435");
INSERT INTO postmeta VALUES("565","51","_customer_user","1");
INSERT INTO postmeta VALUES("566","51","_billing_postcode","345435");
INSERT INTO postmeta VALUES("567","51","_billing_company","");
INSERT INTO postmeta VALUES("568","51","_billing_last_name","");
INSERT INTO postmeta VALUES("569","51","_billing_first_name","");
INSERT INTO postmeta VALUES("570","52","first_name","fdgdfg");
INSERT INTO postmeta VALUES("571","52","last_name","dfgdfg");
INSERT INTO postmeta VALUES("572","52","address_one","dfgfdg");
INSERT INTO postmeta VALUES("573","52","address_two","");
INSERT INTO postmeta VALUES("574","52","phone","+8804534534");
INSERT INTO postmeta VALUES("575","52","country","Bangladesh");
INSERT INTO postmeta VALUES("576","52","state","Bangladesh");
INSERT INTO postmeta VALUES("577","52","city","sdgdfg");
INSERT INTO postmeta VALUES("578","52","zip","4543");
INSERT INTO postmeta VALUES("579","52","_customer_user","1");
INSERT INTO postmeta VALUES("580","52","_billing_postcode","4543");
INSERT INTO postmeta VALUES("581","52","_billing_company","");
INSERT INTO postmeta VALUES("582","52","_billing_last_name","");
INSERT INTO postmeta VALUES("583","52","_billing_first_name","");
INSERT INTO postmeta VALUES("584","53","first_name","fdgdfg");
INSERT INTO postmeta VALUES("585","53","last_name","dfgdfg");
INSERT INTO postmeta VALUES("586","53","address_one","dfgfdg");
INSERT INTO postmeta VALUES("587","53","address_two","");
INSERT INTO postmeta VALUES("588","53","phone","+8804534534");
INSERT INTO postmeta VALUES("589","53","country","Bangladesh");
INSERT INTO postmeta VALUES("590","53","state","Bangladesh");
INSERT INTO postmeta VALUES("591","53","city","sdgdfg");
INSERT INTO postmeta VALUES("592","53","zip","4543");
INSERT INTO postmeta VALUES("593","53","_customer_user","1");
INSERT INTO postmeta VALUES("594","53","_billing_postcode","4543");
INSERT INTO postmeta VALUES("595","53","_billing_company","");
INSERT INTO postmeta VALUES("596","53","_billing_last_name","");
INSERT INTO postmeta VALUES("597","53","_billing_first_name","");
INSERT INTO postmeta VALUES("598","54","first_name","fdgdfg");
INSERT INTO postmeta VALUES("599","54","last_name","dfgdfg");
INSERT INTO postmeta VALUES("600","54","address_one","dfgfdg");
INSERT INTO postmeta VALUES("601","54","address_two","");
INSERT INTO postmeta VALUES("602","54","phone","+8804534534");
INSERT INTO postmeta VALUES("603","54","country","Bangladesh");
INSERT INTO postmeta VALUES("604","54","state","Bangladesh");
INSERT INTO postmeta VALUES("605","54","city","sdgdfg");
INSERT INTO postmeta VALUES("606","54","zip","4543");
INSERT INTO postmeta VALUES("607","54","_customer_user","1");
INSERT INTO postmeta VALUES("608","54","_billing_postcode","4543");
INSERT INTO postmeta VALUES("609","54","_billing_company","");
INSERT INTO postmeta VALUES("610","54","_billing_last_name","");
INSERT INTO postmeta VALUES("611","54","_billing_first_name","");
INSERT INTO postmeta VALUES("612","55","first_name","fdgdfg");
INSERT INTO postmeta VALUES("613","55","last_name","dfgdfg");
INSERT INTO postmeta VALUES("614","55","address_one","dfgfdg");
INSERT INTO postmeta VALUES("615","55","address_two","");
INSERT INTO postmeta VALUES("616","55","phone","+8804534534");
INSERT INTO postmeta VALUES("617","55","country","Bangladesh");
INSERT INTO postmeta VALUES("618","55","state","Bangladesh");
INSERT INTO postmeta VALUES("619","55","city","sdgdfg");
INSERT INTO postmeta VALUES("620","55","zip","4543");
INSERT INTO postmeta VALUES("621","55","_customer_user","1");
INSERT INTO postmeta VALUES("622","55","_billing_postcode","4543");
INSERT INTO postmeta VALUES("623","55","_billing_company","");
INSERT INTO postmeta VALUES("624","55","_billing_last_name","");
INSERT INTO postmeta VALUES("625","55","_billing_first_name","");
INSERT INTO postmeta VALUES("2448","172","_billing_first_name","");
INSERT INTO postmeta VALUES("2447","172","_billing_last_name","");
INSERT INTO postmeta VALUES("2446","172","_billing_company","");
INSERT INTO postmeta VALUES("2445","172","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2444","172","_customer_user","5");
INSERT INTO postmeta VALUES("2443","172","zip","1230");
INSERT INTO postmeta VALUES("2442","172","city","Uttara");
INSERT INTO postmeta VALUES("2441","172","state","Dhaka");
INSERT INTO postmeta VALUES("2440","172","country","Bangladesh");
INSERT INTO postmeta VALUES("2439","172","email","saiful@itebd.com");
INSERT INTO postmeta VALUES("2438","172","phone","345345345");
INSERT INTO postmeta VALUES("2437","172","address_two","");
INSERT INTO postmeta VALUES("2436","172","address_one","Uttara");
INSERT INTO postmeta VALUES("2435","172","last_name","Saiful");
INSERT INTO postmeta VALUES("2434","172","first_name","Saiful");
INSERT INTO postmeta VALUES("2433","171","payment_method","cash");
INSERT INTO postmeta VALUES("2432","171","_billing_first_name","");
INSERT INTO postmeta VALUES("2431","171","_billing_last_name","");
INSERT INTO postmeta VALUES("2430","171","_billing_company","");
INSERT INTO postmeta VALUES("2429","171","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2428","171","_customer_user","5");
INSERT INTO postmeta VALUES("2427","171","zip","1230");
INSERT INTO postmeta VALUES("2426","171","city","Uttara");
INSERT INTO postmeta VALUES("2425","171","state","Dhaka");
INSERT INTO postmeta VALUES("2424","171","country","Bangladesh");
INSERT INTO postmeta VALUES("2423","171","email","saiful@itebd.com");
INSERT INTO postmeta VALUES("2421","171","address_two","");
INSERT INTO postmeta VALUES("2422","171","phone","345345345");
INSERT INTO postmeta VALUES("2419","171","last_name","Rahman");
INSERT INTO postmeta VALUES("2420","171","address_one","Uttara");
INSERT INTO postmeta VALUES("2625","184","first_name","Saiful");
INSERT INTO postmeta VALUES("2626","184","last_name","Rahman");
INSERT INTO postmeta VALUES("2627","184","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("2418","171","first_name","Rahman");
INSERT INTO postmeta VALUES("2393","169","processing_date","2020-10-11");
INSERT INTO postmeta VALUES("2392","170","processing_date","2020-10-11");
INSERT INTO postmeta VALUES("2391","170","payment_method","cash");
INSERT INTO postmeta VALUES("2390","170","_billing_first_name","");
INSERT INTO postmeta VALUES("2389","170","_billing_last_name","");
INSERT INTO postmeta VALUES("2388","170","_billing_company","");
INSERT INTO postmeta VALUES("2387","170","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2386","170","_customer_user","4");
INSERT INTO postmeta VALUES("2385","170","zip","1230");
INSERT INTO postmeta VALUES("2384","170","city","Uttara");
INSERT INTO postmeta VALUES("2383","170","state","Dhaka");
INSERT INTO postmeta VALUES("2382","170","country","Bangladesh");
INSERT INTO postmeta VALUES("2381","170","email","demo2@email.com");
INSERT INTO postmeta VALUES("2380","170","phone","4353453");
INSERT INTO postmeta VALUES("2379","170","address_two","");
INSERT INTO postmeta VALUES("2378","170","address_one","3434543");
INSERT INTO postmeta VALUES("2377","170","last_name","two");
INSERT INTO postmeta VALUES("2376","170","first_name","two");
INSERT INTO postmeta VALUES("2375","169","payment_method","cash");
INSERT INTO postmeta VALUES("2374","169","_billing_first_name","");
INSERT INTO postmeta VALUES("2373","169","_billing_last_name","");
INSERT INTO postmeta VALUES("2372","169","_billing_company","");
INSERT INTO postmeta VALUES("2371","169","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2370","169","_customer_user","2");
INSERT INTO postmeta VALUES("2369","169","zip","1230");
INSERT INTO postmeta VALUES("2368","169","city","Uttara");
INSERT INTO postmeta VALUES("2367","169","state","Dhaka");
INSERT INTO postmeta VALUES("2366","169","country","Bangladesh");
INSERT INTO postmeta VALUES("2365","169","email","demo@email.com");
INSERT INTO postmeta VALUES("2349","166","payment_method","cash");
INSERT INTO postmeta VALUES("826","71","sale_price","3000");
INSERT INTO postmeta VALUES("2348","166","_billing_first_name","");
INSERT INTO postmeta VALUES("2347","166","_billing_last_name","");
INSERT INTO postmeta VALUES("2346","166","_billing_company","");
INSERT INTO postmeta VALUES("2345","166","_billing_postcode","4543");
INSERT INTO postmeta VALUES("2344","166","_customer_user","0");
INSERT INTO postmeta VALUES("2343","166","zip","4543");
INSERT INTO postmeta VALUES("2342","166","city","Uttara");
INSERT INTO postmeta VALUES("2341","166","state","Dhaka");
INSERT INTO postmeta VALUES("2340","166","country","Bangladesh");
INSERT INTO postmeta VALUES("2339","166","email","saiful@itebd.com");
INSERT INTO postmeta VALUES("2338","166","phone","546546");
INSERT INTO postmeta VALUES("2337","166","address_two","");
INSERT INTO postmeta VALUES("2336","166","address_one","dfgfdg");
INSERT INTO postmeta VALUES("2335","166","last_name","dfgdfg");
INSERT INTO postmeta VALUES("2334","166","first_name","fdgdfg");
INSERT INTO postmeta VALUES("2333","165","payment_method","cash");
INSERT INTO postmeta VALUES("2332","165","_billing_first_name","");
INSERT INTO postmeta VALUES("2331","165","_billing_last_name","");
INSERT INTO postmeta VALUES("2330","165","_billing_company","");
INSERT INTO postmeta VALUES("2329","165","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2328","165","_customer_user","2");
INSERT INTO postmeta VALUES("2327","165","zip","1230");
INSERT INTO postmeta VALUES("2326","165","city","Uttara");
INSERT INTO postmeta VALUES("2325","165","state","Dhaka");
INSERT INTO postmeta VALUES("2324","165","country","Bangladesh");
INSERT INTO postmeta VALUES("2323","165","email","demo@email.com");
INSERT INTO postmeta VALUES("2322","165","phone","6789");
INSERT INTO postmeta VALUES("2321","165","address_two","");
INSERT INTO postmeta VALUES("2320","165","address_one","Uttara");
INSERT INTO postmeta VALUES("2319","165","last_name","Demo");
INSERT INTO postmeta VALUES("2318","165","first_name","Demo");
INSERT INTO postmeta VALUES("763","66","first_name","Demo");
INSERT INTO postmeta VALUES("764","66","last_name","Demo");
INSERT INTO postmeta VALUES("765","66","address_one","Uttara");
INSERT INTO postmeta VALUES("766","66","address_two","");
INSERT INTO postmeta VALUES("767","66","phone","6789");
INSERT INTO postmeta VALUES("768","66","email","demo@email.com");
INSERT INTO postmeta VALUES("769","66","country","4354");
INSERT INTO postmeta VALUES("770","66","state","45345");
INSERT INTO postmeta VALUES("771","66","city","3244324");
INSERT INTO postmeta VALUES("772","66","zip","234324");
INSERT INTO postmeta VALUES("773","66","_customer_user","2");
INSERT INTO postmeta VALUES("774","66","_billing_postcode","234324");
INSERT INTO postmeta VALUES("775","66","_billing_company","");
INSERT INTO postmeta VALUES("776","66","_billing_last_name","");
INSERT INTO postmeta VALUES("777","66","_billing_first_name","");
INSERT INTO postmeta VALUES("823","71","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("824","71","stock_status","instock");
INSERT INTO postmeta VALUES("822","70","gallery_file","Belt 1.jpg");
INSERT INTO postmeta VALUES("821","70","attached_file","1601879156.jpg");
INSERT INTO postmeta VALUES("820","70","_sku","5");
INSERT INTO postmeta VALUES("819","70","start_stock","1000");
INSERT INTO postmeta VALUES("818","70","product_stock","1000");
INSERT INTO postmeta VALUES("817","70","alert_qty","40");
INSERT INTO postmeta VALUES("816","70","qty","47");
INSERT INTO postmeta VALUES("815","70","height","");
INSERT INTO postmeta VALUES("808","70","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("809","70","stock_status","instock");
INSERT INTO postmeta VALUES("810","70","regular_price","5000");
INSERT INTO postmeta VALUES("811","70","sale_price","3000");
INSERT INTO postmeta VALUES("812","70","weight","");
INSERT INTO postmeta VALUES("813","70","length","");
INSERT INTO postmeta VALUES("814","70","width","");
INSERT INTO postmeta VALUES("892","75","alert_qty","40");
INSERT INTO postmeta VALUES("891","75","qty","50");
INSERT INTO postmeta VALUES("890","75","height","");
INSERT INTO postmeta VALUES("889","75","width","");
INSERT INTO postmeta VALUES("888","75","length","");
INSERT INTO postmeta VALUES("887","75","weight","");
INSERT INTO postmeta VALUES("886","75","sale_price","3000");
INSERT INTO postmeta VALUES("893","75","product_stock","2000");
INSERT INTO postmeta VALUES("894","75","start_stock","2000");
INSERT INTO postmeta VALUES("895","75","_sku","100");
INSERT INTO postmeta VALUES("896","75","attached_file","1601879657.jpg");
INSERT INTO postmeta VALUES("897","75","gallery_file","Crossbody bag 2.jpg");
INSERT INTO postmeta VALUES("898","76","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Red"}]");
INSERT INTO postmeta VALUES("899","76","stock_status","instock");
INSERT INTO postmeta VALUES("900","76","regular_price","5000");
INSERT INTO postmeta VALUES("901","76","sale_price","3000");
INSERT INTO postmeta VALUES("902","76","weight","");
INSERT INTO postmeta VALUES("903","76","length","");
INSERT INTO postmeta VALUES("904","76","width","");
INSERT INTO postmeta VALUES("905","76","height","");
INSERT INTO postmeta VALUES("906","76","qty","63");
INSERT INTO postmeta VALUES("907","76","alert_qty","55");
INSERT INTO postmeta VALUES("908","76","product_stock","1000");
INSERT INTO postmeta VALUES("909","76","start_stock","1000");
INSERT INTO postmeta VALUES("910","76","_sku","100");
INSERT INTO postmeta VALUES("911","76","attached_file","1601879768.jpg");
INSERT INTO postmeta VALUES("912","76","gallery_file","Crossbody bag 2-2.jpg");
INSERT INTO postmeta VALUES("913","77","stock_status","instock");
INSERT INTO postmeta VALUES("914","77","regular_price","20000");
INSERT INTO postmeta VALUES("915","77","sale_price","30000");
INSERT INTO postmeta VALUES("916","77","weight","");
INSERT INTO postmeta VALUES("917","77","length","");
INSERT INTO postmeta VALUES("918","77","width","");
INSERT INTO postmeta VALUES("919","77","height","");
INSERT INTO postmeta VALUES("920","77","qty","0");
INSERT INTO postmeta VALUES("921","77","alert_qty","0");
INSERT INTO postmeta VALUES("922","77","product_stock","2000");
INSERT INTO postmeta VALUES("923","77","start_stock","2000");
INSERT INTO postmeta VALUES("924","77","_sku","100");
INSERT INTO postmeta VALUES("925","77","attached_file","1601879823.jpg");
INSERT INTO postmeta VALUES("926","77","gallery_file","Purse 1.jpg");
INSERT INTO postmeta VALUES("927","78","stock_status","instock");
INSERT INTO postmeta VALUES("928","78","regular_price","20000");
INSERT INTO postmeta VALUES("929","78","sale_price","30000");
INSERT INTO postmeta VALUES("930","78","weight","");
INSERT INTO postmeta VALUES("931","78","length","");
INSERT INTO postmeta VALUES("932","78","width","");
INSERT INTO postmeta VALUES("933","78","height","");
INSERT INTO postmeta VALUES("934","78","qty","0");
INSERT INTO postmeta VALUES("935","78","alert_qty","0");
INSERT INTO postmeta VALUES("936","78","product_stock","5000");
INSERT INTO postmeta VALUES("937","78","start_stock","5000");
INSERT INTO postmeta VALUES("938","78","_sku","100");
INSERT INTO postmeta VALUES("939","78","attached_file","1601879879.jpg");
INSERT INTO postmeta VALUES("940","78","gallery_file","purse 2.jpg");
INSERT INTO postmeta VALUES("941","79","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Yellow"}]");
INSERT INTO postmeta VALUES("942","79","stock_status","instock");
INSERT INTO postmeta VALUES("943","79","regular_price","5000");
INSERT INTO postmeta VALUES("944","79","sale_price","4000");
INSERT INTO postmeta VALUES("945","79","weight","");
INSERT INTO postmeta VALUES("946","79","length","");
INSERT INTO postmeta VALUES("947","79","width","");
INSERT INTO postmeta VALUES("948","79","height","");
INSERT INTO postmeta VALUES("949","79","qty","50");
INSERT INTO postmeta VALUES("950","79","alert_qty","30");
INSERT INTO postmeta VALUES("951","79","product_stock","2000");
INSERT INTO postmeta VALUES("952","79","start_stock","2000");
INSERT INTO postmeta VALUES("953","79","_sku","1324324");
INSERT INTO postmeta VALUES("954","79","attached_file","1601879991.jpg");
INSERT INTO postmeta VALUES("955","79","gallery_file","Tote bag 2.jpg");
INSERT INTO postmeta VALUES("956","80","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("957","80","stock_status","instock");
INSERT INTO postmeta VALUES("958","80","regular_price","5000");
INSERT INTO postmeta VALUES("959","80","sale_price","30000");
INSERT INTO postmeta VALUES("960","80","weight","");
INSERT INTO postmeta VALUES("961","80","length","");
INSERT INTO postmeta VALUES("962","80","width","");
INSERT INTO postmeta VALUES("963","80","height","");
INSERT INTO postmeta VALUES("964","80","qty","60");
INSERT INTO postmeta VALUES("965","80","alert_qty","40");
INSERT INTO postmeta VALUES("966","80","product_stock","2000");
INSERT INTO postmeta VALUES("967","80","start_stock","2000");
INSERT INTO postmeta VALUES("968","80","_sku","456");
INSERT INTO postmeta VALUES("969","80","attached_file","1601880065.jpg");
INSERT INTO postmeta VALUES("970","80","gallery_file","Tote bag 3.jpg");
INSERT INTO postmeta VALUES("971","81","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("972","81","stock_status","instock");
INSERT INTO postmeta VALUES("973","81","regular_price","5000");
INSERT INTO postmeta VALUES("974","81","sale_price","3000");
INSERT INTO postmeta VALUES("975","81","weight","");
INSERT INTO postmeta VALUES("976","81","length","");
INSERT INTO postmeta VALUES("977","81","width","");
INSERT INTO postmeta VALUES("978","81","height","");
INSERT INTO postmeta VALUES("979","81","qty","100");
INSERT INTO postmeta VALUES("980","81","alert_qty","70");
INSERT INTO postmeta VALUES("981","81","product_stock","1000");
INSERT INTO postmeta VALUES("982","81","start_stock","1000");
INSERT INTO postmeta VALUES("983","81","_sku","100");
INSERT INTO postmeta VALUES("984","81","attached_file","1601880180.jpg");
INSERT INTO postmeta VALUES("985","81","gallery_file","Tote bag 4.jpg");
INSERT INTO postmeta VALUES("986","82","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("987","82","stock_status","instock");
INSERT INTO postmeta VALUES("988","82","regular_price","20000");
INSERT INTO postmeta VALUES("989","82","sale_price","30000");
INSERT INTO postmeta VALUES("990","82","weight","");
INSERT INTO postmeta VALUES("991","82","length","");
INSERT INTO postmeta VALUES("992","82","width","");
INSERT INTO postmeta VALUES("993","82","height","");
INSERT INTO postmeta VALUES("994","82","qty","400");
INSERT INTO postmeta VALUES("995","82","alert_qty","300");
INSERT INTO postmeta VALUES("996","82","product_stock","5000");
INSERT INTO postmeta VALUES("997","82","start_stock","5000");
INSERT INTO postmeta VALUES("998","82","_sku","100");
INSERT INTO postmeta VALUES("999","82","attached_file","1601880442.jpg");
INSERT INTO postmeta VALUES("1000","82","gallery_file","Jeans 1.jpg");
INSERT INTO postmeta VALUES("1001","83","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1002","83","stock_status","instock");
INSERT INTO postmeta VALUES("1003","83","regular_price","5000");
INSERT INTO postmeta VALUES("1004","83","sale_price","3000");
INSERT INTO postmeta VALUES("1005","83","weight","");
INSERT INTO postmeta VALUES("1006","83","length","");
INSERT INTO postmeta VALUES("1007","83","width","");
INSERT INTO postmeta VALUES("1008","83","height","");
INSERT INTO postmeta VALUES("1009","83","qty","50");
INSERT INTO postmeta VALUES("1010","83","alert_qty","45");
INSERT INTO postmeta VALUES("1011","83","product_stock","1000");
INSERT INTO postmeta VALUES("1012","83","start_stock","1000");
INSERT INTO postmeta VALUES("1013","83","_sku","100");
INSERT INTO postmeta VALUES("1014","83","attached_file","1601880721.jpg");
INSERT INTO postmeta VALUES("1015","83","gallery_file","Jeans 2.jpg");
INSERT INTO postmeta VALUES("1016","84","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1017","84","stock_status","instock");
INSERT INTO postmeta VALUES("1018","84","regular_price","5000");
INSERT INTO postmeta VALUES("1019","84","sale_price","3000");
INSERT INTO postmeta VALUES("1020","84","weight","");
INSERT INTO postmeta VALUES("1021","84","length","");
INSERT INTO postmeta VALUES("1022","84","width","");
INSERT INTO postmeta VALUES("1023","84","height","");
INSERT INTO postmeta VALUES("1024","84","qty","600");
INSERT INTO postmeta VALUES("1025","84","alert_qty","599");
INSERT INTO postmeta VALUES("1026","84","product_stock","1000");
INSERT INTO postmeta VALUES("1027","84","start_stock","1000");
INSERT INTO postmeta VALUES("1028","84","_sku","100");
INSERT INTO postmeta VALUES("1029","84","attached_file","1601880860.jpg");
INSERT INTO postmeta VALUES("1030","84","gallery_file","Jeans 2-2.jpg");
INSERT INTO postmeta VALUES("1031","85","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1032","85","stock_status","instock");
INSERT INTO postmeta VALUES("1033","85","regular_price","5000");
INSERT INTO postmeta VALUES("1034","85","sale_price","3000");
INSERT INTO postmeta VALUES("1035","85","weight","");
INSERT INTO postmeta VALUES("1036","85","length","");
INSERT INTO postmeta VALUES("1037","85","width","");
INSERT INTO postmeta VALUES("1038","85","height","");
INSERT INTO postmeta VALUES("1039","85","qty","50");
INSERT INTO postmeta VALUES("1040","85","alert_qty","40");
INSERT INTO postmeta VALUES("1041","85","product_stock","1000");
INSERT INTO postmeta VALUES("1042","85","start_stock","1000");
INSERT INTO postmeta VALUES("1043","85","_sku","100");
INSERT INTO postmeta VALUES("1044","85","attached_file","1601880950.jpg");
INSERT INTO postmeta VALUES("1045","85","gallery_file","leggings 1.jpg");
INSERT INTO postmeta VALUES("1046","86","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1047","86","stock_status","instock");
INSERT INTO postmeta VALUES("1048","86","regular_price","5000");
INSERT INTO postmeta VALUES("1049","86","sale_price","3000");
INSERT INTO postmeta VALUES("1050","86","weight","");
INSERT INTO postmeta VALUES("1051","86","length","");
INSERT INTO postmeta VALUES("1052","86","width","");
INSERT INTO postmeta VALUES("1053","86","height","");
INSERT INTO postmeta VALUES("1054","86","qty","60");
INSERT INTO postmeta VALUES("1055","86","alert_qty","50");
INSERT INTO postmeta VALUES("1056","86","product_stock","1000");
INSERT INTO postmeta VALUES("1057","86","start_stock","1000");
INSERT INTO postmeta VALUES("1058","86","_sku","100");
INSERT INTO postmeta VALUES("1059","86","attached_file","1601881049.jpg");
INSERT INTO postmeta VALUES("1060","86","gallery_file","leggings 1-2.jpg");
INSERT INTO postmeta VALUES("1061","87","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1062","87","stock_status","instock");
INSERT INTO postmeta VALUES("1063","87","regular_price","5000");
INSERT INTO postmeta VALUES("1064","87","sale_price","3000");
INSERT INTO postmeta VALUES("1065","87","weight","");
INSERT INTO postmeta VALUES("1066","87","length","");
INSERT INTO postmeta VALUES("1067","87","width","");
INSERT INTO postmeta VALUES("1068","87","height","");
INSERT INTO postmeta VALUES("1069","87","qty","50");
INSERT INTO postmeta VALUES("1070","87","alert_qty","40");
INSERT INTO postmeta VALUES("1071","87","product_stock","1000");
INSERT INTO postmeta VALUES("1072","87","start_stock","1000");
INSERT INTO postmeta VALUES("1073","87","_sku","100");
INSERT INTO postmeta VALUES("1074","87","attached_file","1601881130.jpg");
INSERT INTO postmeta VALUES("1075","87","gallery_file","skirt 1.jpg");
INSERT INTO postmeta VALUES("1076","88","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1077","88","stock_status","instock");
INSERT INTO postmeta VALUES("1078","88","regular_price","5000");
INSERT INTO postmeta VALUES("1079","88","sale_price","3000");
INSERT INTO postmeta VALUES("1080","88","weight","");
INSERT INTO postmeta VALUES("1081","88","length","");
INSERT INTO postmeta VALUES("1082","88","width","");
INSERT INTO postmeta VALUES("1083","88","height","");
INSERT INTO postmeta VALUES("1084","88","qty","50");
INSERT INTO postmeta VALUES("1085","88","alert_qty","30");
INSERT INTO postmeta VALUES("1086","88","product_stock","1000");
INSERT INTO postmeta VALUES("1087","88","start_stock","1000");
INSERT INTO postmeta VALUES("1088","88","_sku","100");
INSERT INTO postmeta VALUES("1089","88","attached_file","1601881266.jpg");
INSERT INTO postmeta VALUES("1090","88","gallery_file","skirt 1-2.jpg");
INSERT INTO postmeta VALUES("1091","89","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1092","89","stock_status","instock");
INSERT INTO postmeta VALUES("1093","89","regular_price","5000");
INSERT INTO postmeta VALUES("1094","89","sale_price","30000");
INSERT INTO postmeta VALUES("1095","89","weight","");
INSERT INTO postmeta VALUES("1096","89","length","");
INSERT INTO postmeta VALUES("1097","89","width","");
INSERT INTO postmeta VALUES("1098","89","height","");
INSERT INTO postmeta VALUES("1099","89","qty","50");
INSERT INTO postmeta VALUES("1100","89","alert_qty","40");
INSERT INTO postmeta VALUES("1101","89","product_stock","1000");
INSERT INTO postmeta VALUES("1102","89","start_stock","1000");
INSERT INTO postmeta VALUES("1103","89","_sku","100");
INSERT INTO postmeta VALUES("1104","89","attached_file","1601881353.jpg");
INSERT INTO postmeta VALUES("1105","89","gallery_file","skirt 1.jpg");
INSERT INTO postmeta VALUES("1106","89","gallery_file","skirt 1-2.jpg");
INSERT INTO postmeta VALUES("1107","89","gallery_file","skirt 1-3.jpg");
INSERT INTO postmeta VALUES("1108","90","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Red"}]");
INSERT INTO postmeta VALUES("1109","90","stock_status","instock");
INSERT INTO postmeta VALUES("1110","90","regular_price","5000");
INSERT INTO postmeta VALUES("1111","90","sale_price","3000");
INSERT INTO postmeta VALUES("1112","90","weight","");
INSERT INTO postmeta VALUES("1113","90","length","");
INSERT INTO postmeta VALUES("1114","90","width","");
INSERT INTO postmeta VALUES("1115","90","height","");
INSERT INTO postmeta VALUES("1116","90","qty","67");
INSERT INTO postmeta VALUES("1117","90","alert_qty","60");
INSERT INTO postmeta VALUES("1118","90","product_stock","1000");
INSERT INTO postmeta VALUES("1119","90","start_stock","1000");
INSERT INTO postmeta VALUES("1120","90","_sku","100");
INSERT INTO postmeta VALUES("1121","90","attached_file","1601881504.jpg");
INSERT INTO postmeta VALUES("1122","90","gallery_file","Bras 1.jpg");
INSERT INTO postmeta VALUES("1123","90","gallery_file","Bras and Panties set 1.jpg");
INSERT INTO postmeta VALUES("1124","90","gallery_file","Panties 1.jpg");
INSERT INTO postmeta VALUES("1125","90","gallery_file","Sleepwear 1.jpg");
INSERT INTO postmeta VALUES("1126","91","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Yellow"}]");
INSERT INTO postmeta VALUES("1127","91","stock_status","instock");
INSERT INTO postmeta VALUES("1128","91","regular_price","5000");
INSERT INTO postmeta VALUES("1129","91","sale_price","3000");
INSERT INTO postmeta VALUES("1130","91","weight","");
INSERT INTO postmeta VALUES("1131","91","length","");
INSERT INTO postmeta VALUES("1132","91","width","");
INSERT INTO postmeta VALUES("1133","91","height","");
INSERT INTO postmeta VALUES("1134","91","qty","69");
INSERT INTO postmeta VALUES("1135","91","alert_qty","55");
INSERT INTO postmeta VALUES("1136","91","product_stock","2000");
INSERT INTO postmeta VALUES("1137","91","start_stock","2000");
INSERT INTO postmeta VALUES("1138","91","_sku","100");
INSERT INTO postmeta VALUES("1139","91","attached_file","1601881616.jpg");
INSERT INTO postmeta VALUES("1140","91","gallery_file","Bras and Panties set 1.jpg");
INSERT INTO postmeta VALUES("1141","91","gallery_file","Panties 1.jpg");
INSERT INTO postmeta VALUES("1142","91","gallery_file","Sleepwear 1.jpg");
INSERT INTO postmeta VALUES("1143","92","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Red"}]");
INSERT INTO postmeta VALUES("1144","92","stock_status","instock");
INSERT INTO postmeta VALUES("1145","92","regular_price","5000");
INSERT INTO postmeta VALUES("1146","92","sale_price","3000");
INSERT INTO postmeta VALUES("1147","92","weight","");
INSERT INTO postmeta VALUES("1148","92","length","");
INSERT INTO postmeta VALUES("1149","92","width","");
INSERT INTO postmeta VALUES("1150","92","height","");
INSERT INTO postmeta VALUES("1151","92","qty","56");
INSERT INTO postmeta VALUES("1152","92","alert_qty","36");
INSERT INTO postmeta VALUES("1153","92","product_stock","1000");
INSERT INTO postmeta VALUES("1154","92","start_stock","1000");
INSERT INTO postmeta VALUES("1155","92","_sku","100");
INSERT INTO postmeta VALUES("1156","92","attached_file","1601881704.jpg");
INSERT INTO postmeta VALUES("1157","92","gallery_file","Bras 1.jpg");
INSERT INTO postmeta VALUES("1158","92","gallery_file","Bras and Panties set 1.jpg");
INSERT INTO postmeta VALUES("1159","92","gallery_file","Panties 1.jpg");
INSERT INTO postmeta VALUES("1160","93","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1161","93","stock_status","instock");
INSERT INTO postmeta VALUES("1162","93","regular_price","5000");
INSERT INTO postmeta VALUES("1163","93","sale_price","3000");
INSERT INTO postmeta VALUES("1164","93","weight","");
INSERT INTO postmeta VALUES("1165","93","length","");
INSERT INTO postmeta VALUES("1166","93","width","");
INSERT INTO postmeta VALUES("1167","93","height","");
INSERT INTO postmeta VALUES("1168","93","qty","60");
INSERT INTO postmeta VALUES("1169","93","alert_qty","50");
INSERT INTO postmeta VALUES("1170","93","product_stock","1000");
INSERT INTO postmeta VALUES("1171","93","start_stock","1000");
INSERT INTO postmeta VALUES("1172","93","_sku","100");
INSERT INTO postmeta VALUES("1173","93","attached_file","1601881851.jpg");
INSERT INTO postmeta VALUES("1174","93","gallery_file","Sleepwear 1.jpg");
INSERT INTO postmeta VALUES("1175","94","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Red"}]");
INSERT INTO postmeta VALUES("1176","94","stock_status","instock");
INSERT INTO postmeta VALUES("1177","94","regular_price","5000");
INSERT INTO postmeta VALUES("1178","94","sale_price","3000");
INSERT INTO postmeta VALUES("1179","94","weight","");
INSERT INTO postmeta VALUES("1180","94","length","");
INSERT INTO postmeta VALUES("1181","94","width","");
INSERT INTO postmeta VALUES("1182","94","height","");
INSERT INTO postmeta VALUES("1183","94","qty","70");
INSERT INTO postmeta VALUES("1184","94","alert_qty","66");
INSERT INTO postmeta VALUES("1185","94","product_stock","1000");
INSERT INTO postmeta VALUES("1186","94","start_stock","1000");
INSERT INTO postmeta VALUES("1187","94","_sku","1324324");
INSERT INTO postmeta VALUES("1188","94","attached_file","1601882026.jpg");
INSERT INTO postmeta VALUES("1189","94","gallery_file","Bracelet 1.jpg");
INSERT INTO postmeta VALUES("1190","94","gallery_file","Earring 1.jpg");
INSERT INTO postmeta VALUES("1191","94","gallery_file","Earring 2.jpg");
INSERT INTO postmeta VALUES("1192","95","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1193","95","stock_status","instock");
INSERT INTO postmeta VALUES("1194","95","regular_price","5000");
INSERT INTO postmeta VALUES("1195","95","sale_price","3000");
INSERT INTO postmeta VALUES("1196","95","weight","");
INSERT INTO postmeta VALUES("1197","95","length","");
INSERT INTO postmeta VALUES("1198","95","width","");
INSERT INTO postmeta VALUES("1199","95","height","");
INSERT INTO postmeta VALUES("1200","95","qty","50");
INSERT INTO postmeta VALUES("1201","95","alert_qty","10");
INSERT INTO postmeta VALUES("1202","95","product_stock","1000");
INSERT INTO postmeta VALUES("1203","95","start_stock","1000");
INSERT INTO postmeta VALUES("1204","95","_sku","100");
INSERT INTO postmeta VALUES("1205","95","attached_file","1601882106.jpg");
INSERT INTO postmeta VALUES("1206","95","gallery_file","Earring 2.jpg");
INSERT INTO postmeta VALUES("1207","95","gallery_file","Necklace 2.jpg");
INSERT INTO postmeta VALUES("1208","95","gallery_file","Necklace 3.jpg");
INSERT INTO postmeta VALUES("1209","96","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1210","96","stock_status","instock");
INSERT INTO postmeta VALUES("1211","96","regular_price","5000");
INSERT INTO postmeta VALUES("1212","96","sale_price","3000");
INSERT INTO postmeta VALUES("1213","96","weight","");
INSERT INTO postmeta VALUES("1214","96","length","");
INSERT INTO postmeta VALUES("1215","96","width","");
INSERT INTO postmeta VALUES("1216","96","height","");
INSERT INTO postmeta VALUES("1217","96","qty","500");
INSERT INTO postmeta VALUES("1218","96","alert_qty","400");
INSERT INTO postmeta VALUES("1219","96","product_stock","1000");
INSERT INTO postmeta VALUES("1220","96","start_stock","1000");
INSERT INTO postmeta VALUES("1221","96","_sku","100");
INSERT INTO postmeta VALUES("1222","96","attached_file","1601882258.jpg");
INSERT INTO postmeta VALUES("1223","96","gallery_file","Bracelet 1.jpg");
INSERT INTO postmeta VALUES("1224","96","gallery_file","Earring 1.jpg");
INSERT INTO postmeta VALUES("1225","96","gallery_file","Earring 2.jpg");
INSERT INTO postmeta VALUES("1226","97","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1227","97","stock_status","instock");
INSERT INTO postmeta VALUES("1228","97","regular_price","5000");
INSERT INTO postmeta VALUES("1229","97","sale_price","3000");
INSERT INTO postmeta VALUES("1230","97","weight","");
INSERT INTO postmeta VALUES("1231","97","length","");
INSERT INTO postmeta VALUES("1232","97","width","");
INSERT INTO postmeta VALUES("1233","97","height","");
INSERT INTO postmeta VALUES("1234","97","qty","60");
INSERT INTO postmeta VALUES("1235","97","alert_qty","50");
INSERT INTO postmeta VALUES("1236","97","product_stock","2000");
INSERT INTO postmeta VALUES("1237","97","start_stock","2000");
INSERT INTO postmeta VALUES("1238","97","_sku","100");
INSERT INTO postmeta VALUES("1239","97","attached_file","1601882347.jpg");
INSERT INTO postmeta VALUES("1240","97","gallery_file","Earring 2.jpg");
INSERT INTO postmeta VALUES("1241","97","gallery_file","Necklace 2.jpg");
INSERT INTO postmeta VALUES("1242","97","gallery_file","Necklace 3.jpg");
INSERT INTO postmeta VALUES("1243","98","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1244","98","stock_status","instock");
INSERT INTO postmeta VALUES("1245","98","regular_price","5000");
INSERT INTO postmeta VALUES("1246","98","sale_price","3000");
INSERT INTO postmeta VALUES("1247","98","weight","");
INSERT INTO postmeta VALUES("1248","98","length","");
INSERT INTO postmeta VALUES("1249","98","width","");
INSERT INTO postmeta VALUES("1250","98","height","");
INSERT INTO postmeta VALUES("1251","98","qty","497");
INSERT INTO postmeta VALUES("1252","98","alert_qty","400");
INSERT INTO postmeta VALUES("1253","98","product_stock","1000");
INSERT INTO postmeta VALUES("1254","98","start_stock","1000");
INSERT INTO postmeta VALUES("1255","98","_sku","100");
INSERT INTO postmeta VALUES("1256","98","attached_file","1601882491.jpg");
INSERT INTO postmeta VALUES("1257","98","gallery_file","Earring 1.jpg");
INSERT INTO postmeta VALUES("1258","98","gallery_file","Earring 2.jpg");
INSERT INTO postmeta VALUES("1259","98","gallery_file","Necklace 2.jpg");
INSERT INTO postmeta VALUES("1260","98","gallery_file","Necklace 3.jpg");
INSERT INTO postmeta VALUES("1261","99","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1262","99","stock_status","instock");
INSERT INTO postmeta VALUES("1263","99","regular_price","5000");
INSERT INTO postmeta VALUES("1264","99","sale_price","3000");
INSERT INTO postmeta VALUES("1265","99","weight","");
INSERT INTO postmeta VALUES("1266","99","length","");
INSERT INTO postmeta VALUES("1267","99","width","");
INSERT INTO postmeta VALUES("1268","99","height","");
INSERT INTO postmeta VALUES("1269","99","qty","60");
INSERT INTO postmeta VALUES("1270","99","alert_qty","20");
INSERT INTO postmeta VALUES("1271","99","product_stock","1000");
INSERT INTO postmeta VALUES("1272","99","start_stock","1000");
INSERT INTO postmeta VALUES("1273","99","_sku","100");
INSERT INTO postmeta VALUES("1274","99","attached_file","1601882638.jpg");
INSERT INTO postmeta VALUES("1275","99","gallery_file","Dresses 1.jpg");
INSERT INTO postmeta VALUES("1276","99","gallery_file","Dresses 2.jpg");
INSERT INTO postmeta VALUES("1277","99","gallery_file","Tshirt 1-2.jpg");
INSERT INTO postmeta VALUES("1278","99","gallery_file","Tunic 3-2.jpg");
INSERT INTO postmeta VALUES("1279","100","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1280","100","stock_status","instock");
INSERT INTO postmeta VALUES("1281","100","regular_price","5000");
INSERT INTO postmeta VALUES("1282","100","sale_price","3000");
INSERT INTO postmeta VALUES("1283","100","weight","");
INSERT INTO postmeta VALUES("1284","100","length","");
INSERT INTO postmeta VALUES("1285","100","width","");
INSERT INTO postmeta VALUES("1286","100","height","");
INSERT INTO postmeta VALUES("1287","100","qty","80");
INSERT INTO postmeta VALUES("1288","100","alert_qty","10");
INSERT INTO postmeta VALUES("1289","100","product_stock","1000");
INSERT INTO postmeta VALUES("1290","100","start_stock","1000");
INSERT INTO postmeta VALUES("1291","100","_sku","100");
INSERT INTO postmeta VALUES("1292","100","attached_file","1601882717.jpg");
INSERT INTO postmeta VALUES("1293","100","gallery_file","Dresses 2.jpg");
INSERT INTO postmeta VALUES("1294","100","gallery_file","Dresses 3.jpg");
INSERT INTO postmeta VALUES("1295","100","gallery_file","Dresses 3-2.jpg");
INSERT INTO postmeta VALUES("1296","101","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1297","101","stock_status","instock");
INSERT INTO postmeta VALUES("1298","101","regular_price","5000");
INSERT INTO postmeta VALUES("1299","101","sale_price","3000");
INSERT INTO postmeta VALUES("1300","101","weight","");
INSERT INTO postmeta VALUES("1301","101","length","");
INSERT INTO postmeta VALUES("1302","101","width","");
INSERT INTO postmeta VALUES("1303","101","height","");
INSERT INTO postmeta VALUES("1304","101","qty","60");
INSERT INTO postmeta VALUES("1305","101","alert_qty","12");
INSERT INTO postmeta VALUES("1306","101","product_stock","1000");
INSERT INTO postmeta VALUES("1307","101","start_stock","1000");
INSERT INTO postmeta VALUES("1308","101","_sku","100");
INSERT INTO postmeta VALUES("1309","101","attached_file","1601882890.jpg");
INSERT INTO postmeta VALUES("1310","101","gallery_file","Dresses 3.jpg");
INSERT INTO postmeta VALUES("1311","101","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1312","101","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1313","101","gallery_file","Tunic 2-2.jpg");
INSERT INTO postmeta VALUES("1314","101","gallery_file","Tunic 3.jpg");
INSERT INTO postmeta VALUES("1315","102","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1316","102","stock_status","instock");
INSERT INTO postmeta VALUES("1317","102","regular_price","5000");
INSERT INTO postmeta VALUES("1318","102","sale_price","3000");
INSERT INTO postmeta VALUES("1319","102","weight","");
INSERT INTO postmeta VALUES("1320","102","length","");
INSERT INTO postmeta VALUES("1321","102","width","");
INSERT INTO postmeta VALUES("1322","102","height","");
INSERT INTO postmeta VALUES("1323","102","qty","21");
INSERT INTO postmeta VALUES("1324","102","alert_qty","10");
INSERT INTO postmeta VALUES("1325","102","product_stock","500");
INSERT INTO postmeta VALUES("1326","102","start_stock","500");
INSERT INTO postmeta VALUES("1327","102","_sku","100");
INSERT INTO postmeta VALUES("1328","102","attached_file","1601882975.jpg");
INSERT INTO postmeta VALUES("1329","102","gallery_file","Dresses 3.jpg");
INSERT INTO postmeta VALUES("1330","102","gallery_file","Dresses 3-2.jpg");
INSERT INTO postmeta VALUES("1331","102","gallery_file","Dresses 4.jpg");
INSERT INTO postmeta VALUES("1332","102","gallery_file","Dresses 4-2.jpg");
INSERT INTO postmeta VALUES("1333","103","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1334","103","stock_status","instock");
INSERT INTO postmeta VALUES("1335","103","regular_price","5000");
INSERT INTO postmeta VALUES("1336","103","sale_price","3000");
INSERT INTO postmeta VALUES("1337","103","weight","");
INSERT INTO postmeta VALUES("1338","103","length","");
INSERT INTO postmeta VALUES("1339","103","width","");
INSERT INTO postmeta VALUES("1340","103","height","");
INSERT INTO postmeta VALUES("1341","103","qty","60");
INSERT INTO postmeta VALUES("1342","103","alert_qty","40");
INSERT INTO postmeta VALUES("1343","103","product_stock","1000");
INSERT INTO postmeta VALUES("1344","103","start_stock","1000");
INSERT INTO postmeta VALUES("1345","103","_sku","100");
INSERT INTO postmeta VALUES("1346","103","attached_file","1601883057.jpg");
INSERT INTO postmeta VALUES("1347","103","gallery_file","Tshirt 1-2.jpg");
INSERT INTO postmeta VALUES("1348","103","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1349","103","gallery_file","Tunic 2.jpg");
INSERT INTO postmeta VALUES("1350","103","gallery_file","Tunic 2-2.jpg");
INSERT INTO postmeta VALUES("1351","103","gallery_file","Tunic 3.jpg");
INSERT INTO postmeta VALUES("1352","103","gallery_file","Tunic 3-2.jpg");
INSERT INTO postmeta VALUES("1353","104","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1354","104","stock_status","instock");
INSERT INTO postmeta VALUES("1355","104","regular_price","5000");
INSERT INTO postmeta VALUES("1356","104","sale_price","3000");
INSERT INTO postmeta VALUES("1357","104","weight","");
INSERT INTO postmeta VALUES("1358","104","length","");
INSERT INTO postmeta VALUES("1359","104","width","");
INSERT INTO postmeta VALUES("1360","104","height","");
INSERT INTO postmeta VALUES("1361","104","qty","66");
INSERT INTO postmeta VALUES("1362","104","alert_qty","14");
INSERT INTO postmeta VALUES("1363","104","product_stock","1000");
INSERT INTO postmeta VALUES("1364","104","start_stock","1000");
INSERT INTO postmeta VALUES("1365","104","_sku","100");
INSERT INTO postmeta VALUES("1366","104","attached_file","1601883161.jpg");
INSERT INTO postmeta VALUES("1367","104","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1368","104","gallery_file","Tshirt 3.jpg");
INSERT INTO postmeta VALUES("1369","104","gallery_file","Tshirt 3-2.jpg");
INSERT INTO postmeta VALUES("1370","104","gallery_file","Tunic 1.jpg");
INSERT INTO postmeta VALUES("1371","105","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1372","105","stock_status","instock");
INSERT INTO postmeta VALUES("1373","105","regular_price","5000");
INSERT INTO postmeta VALUES("1374","105","sale_price","3000");
INSERT INTO postmeta VALUES("1375","105","weight","");
INSERT INTO postmeta VALUES("1376","105","length","");
INSERT INTO postmeta VALUES("1377","105","width","");
INSERT INTO postmeta VALUES("1378","105","height","");
INSERT INTO postmeta VALUES("1379","105","qty","50");
INSERT INTO postmeta VALUES("1380","105","alert_qty","45");
INSERT INTO postmeta VALUES("1381","105","product_stock","1000");
INSERT INTO postmeta VALUES("1382","105","start_stock","1000");
INSERT INTO postmeta VALUES("1383","105","_sku","100");
INSERT INTO postmeta VALUES("1384","105","attached_file","1601883275.jpg");
INSERT INTO postmeta VALUES("1385","105","gallery_file","Dresses 4.jpg");
INSERT INTO postmeta VALUES("1386","105","gallery_file","Dresses 4-2.jpg");
INSERT INTO postmeta VALUES("1387","105","gallery_file","Tshirt 3-2.jpg");
INSERT INTO postmeta VALUES("1388","105","gallery_file","Tunic 1.jpg");
INSERT INTO postmeta VALUES("1389","106","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1390","106","stock_status","instock");
INSERT INTO postmeta VALUES("1391","106","regular_price","5000");
INSERT INTO postmeta VALUES("1392","106","sale_price","3000");
INSERT INTO postmeta VALUES("1393","106","weight","");
INSERT INTO postmeta VALUES("1394","106","length","");
INSERT INTO postmeta VALUES("1395","106","width","");
INSERT INTO postmeta VALUES("1396","106","height","");
INSERT INTO postmeta VALUES("1397","106","qty","50");
INSERT INTO postmeta VALUES("1398","106","alert_qty","40");
INSERT INTO postmeta VALUES("1399","106","product_stock","1000");
INSERT INTO postmeta VALUES("1400","106","start_stock","1000");
INSERT INTO postmeta VALUES("1401","106","_sku","100");
INSERT INTO postmeta VALUES("1402","106","attached_file","1601883541.jpg");
INSERT INTO postmeta VALUES("1403","106","gallery_file","Tshirt 1.jpg");
INSERT INTO postmeta VALUES("1404","107","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1405","107","stock_status","instock");
INSERT INTO postmeta VALUES("1406","107","regular_price","5000");
INSERT INTO postmeta VALUES("1407","107","sale_price","3000");
INSERT INTO postmeta VALUES("1408","107","weight","");
INSERT INTO postmeta VALUES("1409","107","length","");
INSERT INTO postmeta VALUES("1410","107","width","");
INSERT INTO postmeta VALUES("1411","107","height","");
INSERT INTO postmeta VALUES("1412","107","qty","50");
INSERT INTO postmeta VALUES("1413","107","alert_qty","10");
INSERT INTO postmeta VALUES("1414","107","product_stock","1000");
INSERT INTO postmeta VALUES("1415","107","start_stock","1000");
INSERT INTO postmeta VALUES("1416","107","_sku","100");
INSERT INTO postmeta VALUES("1417","107","attached_file","1601883699.jpg");
INSERT INTO postmeta VALUES("1418","107","gallery_file","Tshirt 1-2.jpg");
INSERT INTO postmeta VALUES("1419","107","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1420","107","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1421","108","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Red"}]");
INSERT INTO postmeta VALUES("1422","108","stock_status","instock");
INSERT INTO postmeta VALUES("1423","108","regular_price","5000");
INSERT INTO postmeta VALUES("1424","108","sale_price","3000");
INSERT INTO postmeta VALUES("1425","108","weight","");
INSERT INTO postmeta VALUES("1426","108","length","");
INSERT INTO postmeta VALUES("1427","108","width","");
INSERT INTO postmeta VALUES("1428","108","height","");
INSERT INTO postmeta VALUES("1429","108","qty","57");
INSERT INTO postmeta VALUES("1430","108","alert_qty","10");
INSERT INTO postmeta VALUES("1431","108","product_stock","1000");
INSERT INTO postmeta VALUES("1432","108","start_stock","1000");
INSERT INTO postmeta VALUES("1433","108","_sku","100");
INSERT INTO postmeta VALUES("1434","108","attached_file","1601883776.jpg");
INSERT INTO postmeta VALUES("1435","108","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1436","110","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1437","110","stock_status","instock");
INSERT INTO postmeta VALUES("1438","110","regular_price","5000");
INSERT INTO postmeta VALUES("1439","110","sale_price","3000");
INSERT INTO postmeta VALUES("1440","110","weight","");
INSERT INTO postmeta VALUES("1441","110","length","");
INSERT INTO postmeta VALUES("1442","110","width","");
INSERT INTO postmeta VALUES("1443","110","height","");
INSERT INTO postmeta VALUES("1444","110","qty","50");
INSERT INTO postmeta VALUES("1445","110","alert_qty","4");
INSERT INTO postmeta VALUES("1446","110","product_stock","1000");
INSERT INTO postmeta VALUES("1447","110","start_stock","1000");
INSERT INTO postmeta VALUES("1448","110","_sku","100");
INSERT INTO postmeta VALUES("1449","110","attached_file","1601884025.jpg");
INSERT INTO postmeta VALUES("1450","110","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1451","110","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1452","110","gallery_file","Tshirt 3.jpg");
INSERT INTO postmeta VALUES("1453","111","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1454","111","stock_status","instock");
INSERT INTO postmeta VALUES("1455","111","regular_price","5000");
INSERT INTO postmeta VALUES("1456","111","sale_price","3000");
INSERT INTO postmeta VALUES("1457","111","weight","");
INSERT INTO postmeta VALUES("1458","111","length","");
INSERT INTO postmeta VALUES("1459","111","width","");
INSERT INTO postmeta VALUES("1460","111","height","");
INSERT INTO postmeta VALUES("1461","111","qty","60");
INSERT INTO postmeta VALUES("1462","111","alert_qty","50");
INSERT INTO postmeta VALUES("1463","111","product_stock","1000");
INSERT INTO postmeta VALUES("1464","111","start_stock","1000");
INSERT INTO postmeta VALUES("1465","111","_sku","100");
INSERT INTO postmeta VALUES("1466","111","attached_file","1601884089.jpg");
INSERT INTO postmeta VALUES("1467","111","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1468","111","gallery_file","Tshirt 3.jpg");
INSERT INTO postmeta VALUES("1469","111","gallery_file","Tshirt 3-2.jpg");
INSERT INTO postmeta VALUES("1470","112","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1471","112","stock_status","instock");
INSERT INTO postmeta VALUES("1472","112","regular_price","5000");
INSERT INTO postmeta VALUES("1473","112","sale_price","3000");
INSERT INTO postmeta VALUES("1474","112","weight","");
INSERT INTO postmeta VALUES("1475","112","length","");
INSERT INTO postmeta VALUES("1476","112","width","");
INSERT INTO postmeta VALUES("1477","112","height","");
INSERT INTO postmeta VALUES("1478","112","qty","60");
INSERT INTO postmeta VALUES("1479","112","alert_qty","50");
INSERT INTO postmeta VALUES("1480","112","product_stock","1000");
INSERT INTO postmeta VALUES("1481","112","start_stock","1000");
INSERT INTO postmeta VALUES("1482","112","_sku","100");
INSERT INTO postmeta VALUES("1483","112","attached_file","1601884148.jpg");
INSERT INTO postmeta VALUES("1484","112","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1485","112","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1486","112","gallery_file","Tshirt 3.jpg");
INSERT INTO postmeta VALUES("1487","112","gallery_file","Tshirt 3-2.jpg");
INSERT INTO postmeta VALUES("1488","113","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1489","113","stock_status","instock");
INSERT INTO postmeta VALUES("1490","113","regular_price","5000");
INSERT INTO postmeta VALUES("1491","113","sale_price","3000");
INSERT INTO postmeta VALUES("1492","113","weight","");
INSERT INTO postmeta VALUES("1493","113","length","");
INSERT INTO postmeta VALUES("1494","113","width","");
INSERT INTO postmeta VALUES("1495","113","height","");
INSERT INTO postmeta VALUES("1496","113","qty","99");
INSERT INTO postmeta VALUES("1497","113","alert_qty","3");
INSERT INTO postmeta VALUES("1498","113","product_stock","1000");
INSERT INTO postmeta VALUES("1499","113","start_stock","1000");
INSERT INTO postmeta VALUES("1500","113","_sku","100443543");
INSERT INTO postmeta VALUES("1501","113","attached_file","1601884277.jpg");
INSERT INTO postmeta VALUES("1502","113","gallery_file","Tunic 1.jpg");
INSERT INTO postmeta VALUES("1503","113","gallery_file","Tunic 1-2.jpg");
INSERT INTO postmeta VALUES("1504","113","gallery_file","Tunic 2.jpg");
INSERT INTO postmeta VALUES("1505","114","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1506","114","stock_status","instock");
INSERT INTO postmeta VALUES("1507","114","regular_price","5000");
INSERT INTO postmeta VALUES("1508","114","sale_price","3000");
INSERT INTO postmeta VALUES("1509","114","weight","");
INSERT INTO postmeta VALUES("1510","114","length","");
INSERT INTO postmeta VALUES("1511","114","width","");
INSERT INTO postmeta VALUES("1512","114","height","");
INSERT INTO postmeta VALUES("1513","114","qty","45");
INSERT INTO postmeta VALUES("1514","114","alert_qty","45");
INSERT INTO postmeta VALUES("1515","114","product_stock","455");
INSERT INTO postmeta VALUES("1516","114","start_stock","1000");
INSERT INTO postmeta VALUES("1517","114","_sku","10034326");
INSERT INTO postmeta VALUES("1518","114","attached_file","1601884360.jpg");
INSERT INTO postmeta VALUES("1519","114","gallery_file","Tunic 1.jpg");
INSERT INTO postmeta VALUES("1520","114","gallery_file","Tunic 1-2.jpg");
INSERT INTO postmeta VALUES("1521","114","gallery_file","Tunic 2.jpg");
INSERT INTO postmeta VALUES("1522","115","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1523","115","stock_status","instock");
INSERT INTO postmeta VALUES("1524","115","regular_price","5000");
INSERT INTO postmeta VALUES("1525","115","sale_price","3000");
INSERT INTO postmeta VALUES("1526","115","weight","");
INSERT INTO postmeta VALUES("1527","115","length","");
INSERT INTO postmeta VALUES("1528","115","width","");
INSERT INTO postmeta VALUES("1529","115","height","");
INSERT INTO postmeta VALUES("1530","115","qty","32");
INSERT INTO postmeta VALUES("1531","115","alert_qty","3");
INSERT INTO postmeta VALUES("1532","115","product_stock","1000");
INSERT INTO postmeta VALUES("1533","115","start_stock","1000");
INSERT INTO postmeta VALUES("1534","115","_sku","1004444");
INSERT INTO postmeta VALUES("1535","115","attached_file","1601884482.jpg");
INSERT INTO postmeta VALUES("1536","115","gallery_file","Tshirt 2.jpg");
INSERT INTO postmeta VALUES("1537","115","gallery_file","Tshirt 2-2.jpg");
INSERT INTO postmeta VALUES("1538","116","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1539","116","stock_status","instock");
INSERT INTO postmeta VALUES("1540","116","regular_price","5000");
INSERT INTO postmeta VALUES("1541","116","sale_price","3000");
INSERT INTO postmeta VALUES("1542","116","weight","");
INSERT INTO postmeta VALUES("1543","116","length","");
INSERT INTO postmeta VALUES("1544","116","width","");
INSERT INTO postmeta VALUES("1545","116","height","");
INSERT INTO postmeta VALUES("1546","116","qty","561");
INSERT INTO postmeta VALUES("1547","116","alert_qty","45");
INSERT INTO postmeta VALUES("1548","116","product_stock","2000");
INSERT INTO postmeta VALUES("1549","116","start_stock","2000");
INSERT INTO postmeta VALUES("1550","116","_sku","1005435");
INSERT INTO postmeta VALUES("1551","116","attached_file","1601884790.jpg");
INSERT INTO postmeta VALUES("1552","116","gallery_file","Tunic 2.jpg");
INSERT INTO postmeta VALUES("1553","116","gallery_file","Tunic 2-2.jpg");
INSERT INTO postmeta VALUES("1554","117","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1555","117","stock_status","instock");
INSERT INTO postmeta VALUES("1556","117","regular_price","5000");
INSERT INTO postmeta VALUES("1557","117","sale_price","3000");
INSERT INTO postmeta VALUES("1558","117","weight","");
INSERT INTO postmeta VALUES("1559","117","length","");
INSERT INTO postmeta VALUES("1560","117","width","");
INSERT INTO postmeta VALUES("1561","117","height","");
INSERT INTO postmeta VALUES("1562","117","qty","59");
INSERT INTO postmeta VALUES("1563","117","alert_qty","12");
INSERT INTO postmeta VALUES("1564","117","product_stock","1000");
INSERT INTO postmeta VALUES("1565","117","start_stock","1000");
INSERT INTO postmeta VALUES("1566","117","_sku","1004353");
INSERT INTO postmeta VALUES("1567","117","attached_file","1601884896.jpg");
INSERT INTO postmeta VALUES("1568","117","gallery_file","Tunic 2-2.jpg");
INSERT INTO postmeta VALUES("1569","117","gallery_file","Tunic 3.jpg");
INSERT INTO postmeta VALUES("1570","117","gallery_file","Tunic 3-2.jpg");
INSERT INTO postmeta VALUES("1571","118","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1572","118","stock_status","instock");
INSERT INTO postmeta VALUES("1573","118","regular_price","5000");
INSERT INTO postmeta VALUES("1574","118","sale_price","3000");
INSERT INTO postmeta VALUES("1575","118","weight","");
INSERT INTO postmeta VALUES("1576","118","length","");
INSERT INTO postmeta VALUES("1577","118","width","");
INSERT INTO postmeta VALUES("1578","118","height","");
INSERT INTO postmeta VALUES("1579","118","qty","561");
INSERT INTO postmeta VALUES("1580","118","alert_qty","45");
INSERT INTO postmeta VALUES("1581","118","product_stock","1000");
INSERT INTO postmeta VALUES("1582","118","start_stock","1000");
INSERT INTO postmeta VALUES("1583","118","_sku","10043543");
INSERT INTO postmeta VALUES("1584","118","attached_file","1601884957.jpg");
INSERT INTO postmeta VALUES("1585","118","gallery_file","Tunic 3.jpg");
INSERT INTO postmeta VALUES("1586","118","gallery_file","Tunic 3-2.jpg");
INSERT INTO postmeta VALUES("1587","118","gallery_file","Tunic 4.jpg");
INSERT INTO postmeta VALUES("1588","119","default_attribute","[{"taxonomy":"pa_color","term":"Blue"},{"taxonomy":"pa_color","term":"Yellow"}]");
INSERT INTO postmeta VALUES("1589","119","stock_status","instock");
INSERT INTO postmeta VALUES("1590","119","regular_price","5000");
INSERT INTO postmeta VALUES("1591","119","sale_price","3000");
INSERT INTO postmeta VALUES("1592","119","weight","");
INSERT INTO postmeta VALUES("1593","119","length","");
INSERT INTO postmeta VALUES("1594","119","width","");
INSERT INTO postmeta VALUES("1595","119","height","");
INSERT INTO postmeta VALUES("1596","119","qty","64");
INSERT INTO postmeta VALUES("1597","119","alert_qty","6");
INSERT INTO postmeta VALUES("1598","119","product_stock","1500");
INSERT INTO postmeta VALUES("1599","119","start_stock","1000");
INSERT INTO postmeta VALUES("1600","119","_sku","1006546");
INSERT INTO postmeta VALUES("1601","119","attached_file","1601885048.jpg");
INSERT INTO postmeta VALUES("1602","119","gallery_file","Tunic 3-2.jpg");
INSERT INTO postmeta VALUES("1603","119","gallery_file","Tunic 4.jpg");
INSERT INTO postmeta VALUES("1604","119","gallery_file","Tunic 4-2.jpg");
INSERT INTO postmeta VALUES("1605","120","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1606","120","stock_status","instock");
INSERT INTO postmeta VALUES("1607","120","regular_price","5000");
INSERT INTO postmeta VALUES("1608","120","sale_price","3000");
INSERT INTO postmeta VALUES("1609","120","weight","");
INSERT INTO postmeta VALUES("1610","120","length","");
INSERT INTO postmeta VALUES("1611","120","width","");
INSERT INTO postmeta VALUES("1612","120","height","");
INSERT INTO postmeta VALUES("1613","120","qty","566");
INSERT INTO postmeta VALUES("1614","120","alert_qty","34");
INSERT INTO postmeta VALUES("1615","120","product_stock","1000");
INSERT INTO postmeta VALUES("1616","120","start_stock","1000");
INSERT INTO postmeta VALUES("1617","120","_sku","454355345");
INSERT INTO postmeta VALUES("1618","120","attached_file","1601885150.jpg");
INSERT INTO postmeta VALUES("1619","120","gallery_file","Tunic 4.jpg");
INSERT INTO postmeta VALUES("1620","120","gallery_file","Tunic 4-2.jpg");
INSERT INTO postmeta VALUES("1621","121","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1622","121","stock_status","instock");
INSERT INTO postmeta VALUES("1623","121","regular_price","5000");
INSERT INTO postmeta VALUES("1624","121","sale_price","3000");
INSERT INTO postmeta VALUES("1625","121","weight","");
INSERT INTO postmeta VALUES("1626","121","length","");
INSERT INTO postmeta VALUES("1627","121","width","");
INSERT INTO postmeta VALUES("1628","121","height","");
INSERT INTO postmeta VALUES("1629","121","qty","453");
INSERT INTO postmeta VALUES("1630","121","alert_qty","34");
INSERT INTO postmeta VALUES("1631","121","product_stock","1000");
INSERT INTO postmeta VALUES("1632","121","start_stock","1000");
INSERT INTO postmeta VALUES("1633","121","_sku","100435345");
INSERT INTO postmeta VALUES("1634","121","attached_file","1601885239.jpg");
INSERT INTO postmeta VALUES("1635","121","gallery_file","Tunic 4.jpg");
INSERT INTO postmeta VALUES("1636","121","gallery_file","Tunic 4-2.jpg");
INSERT INTO postmeta VALUES("1637","122","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1638","122","stock_status","instock");
INSERT INTO postmeta VALUES("1639","122","regular_price","5000");
INSERT INTO postmeta VALUES("1640","122","sale_price","3000");
INSERT INTO postmeta VALUES("1641","122","weight","");
INSERT INTO postmeta VALUES("1642","122","length","");
INSERT INTO postmeta VALUES("1643","122","width","");
INSERT INTO postmeta VALUES("1644","122","height","");
INSERT INTO postmeta VALUES("1645","122","qty","449");
INSERT INTO postmeta VALUES("1646","122","alert_qty","123");
INSERT INTO postmeta VALUES("1647","122","product_stock","1000");
INSERT INTO postmeta VALUES("1648","122","start_stock","1000");
INSERT INTO postmeta VALUES("1649","122","_sku","100345345");
INSERT INTO postmeta VALUES("1650","122","attached_file","1601885305.jpg");
INSERT INTO postmeta VALUES("1651","122","gallery_file","Tunic 5.jpg");
INSERT INTO postmeta VALUES("1652","122","gallery_file","Tunic 5-2.jpg");
INSERT INTO postmeta VALUES("1653","122","gallery_file","Tunic 5-3.jpg");
INSERT INTO postmeta VALUES("1654","123","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("1655","123","stock_status","instock");
INSERT INTO postmeta VALUES("1656","123","regular_price","5000");
INSERT INTO postmeta VALUES("1657","123","sale_price","3000");
INSERT INTO postmeta VALUES("1658","123","weight","");
INSERT INTO postmeta VALUES("1659","123","length","");
INSERT INTO postmeta VALUES("1660","123","width","");
INSERT INTO postmeta VALUES("1661","123","height","");
INSERT INTO postmeta VALUES("1662","123","qty","433");
INSERT INTO postmeta VALUES("1663","123","alert_qty","56");
INSERT INTO postmeta VALUES("1664","123","product_stock","1000");
INSERT INTO postmeta VALUES("1665","123","start_stock","1000");
INSERT INTO postmeta VALUES("1666","123","_sku","100");
INSERT INTO postmeta VALUES("1667","123","attached_file","1601885379.jpg");
INSERT INTO postmeta VALUES("1668","123","gallery_file","Tunic 5.jpg");
INSERT INTO postmeta VALUES("1669","123","gallery_file","Tunic 5-2.jpg");
INSERT INTO postmeta VALUES("1670","123","gallery_file","Tunic 5-3.jpg");
INSERT INTO postmeta VALUES("2363","169","address_two","");
INSERT INTO postmeta VALUES("2364","169","phone","6789");
INSERT INTO postmeta VALUES("2362","169","address_one","Uttara");
INSERT INTO postmeta VALUES("2361","169","last_name","Demo");
INSERT INTO postmeta VALUES("2360","169","first_name","Demo");
INSERT INTO postmeta VALUES("2470","174","alert_qty","30");
INSERT INTO postmeta VALUES("2469","174","qty","27");
INSERT INTO postmeta VALUES("2468","174","height","");
INSERT INTO postmeta VALUES("2467","174","width","");
INSERT INTO postmeta VALUES("2466","174","length","");
INSERT INTO postmeta VALUES("2465","174","weight","");
INSERT INTO postmeta VALUES("2464","174","sale_price","3000");
INSERT INTO postmeta VALUES("2463","174","regular_price","5000");
INSERT INTO postmeta VALUES("2462","174","stock_status","instock");
INSERT INTO postmeta VALUES("1688","125","first_name","Demo");
INSERT INTO postmeta VALUES("1689","125","last_name","Demo");
INSERT INTO postmeta VALUES("1690","125","address_one","Uttara");
INSERT INTO postmeta VALUES("1691","125","address_two","");
INSERT INTO postmeta VALUES("1692","125","phone","0176452345645");
INSERT INTO postmeta VALUES("1693","125","email","demo@email.com");
INSERT INTO postmeta VALUES("1694","125","country","Bangladesh");
INSERT INTO postmeta VALUES("1695","125","state","Dhaka");
INSERT INTO postmeta VALUES("1696","125","city","Dhaka");
INSERT INTO postmeta VALUES("1697","125","zip","1205");
INSERT INTO postmeta VALUES("1698","125","_customer_user","2");
INSERT INTO postmeta VALUES("1699","125","_billing_postcode","1205");
INSERT INTO postmeta VALUES("1700","125","_billing_company","");
INSERT INTO postmeta VALUES("1701","125","_billing_last_name","");
INSERT INTO postmeta VALUES("1702","125","_billing_first_name","");
INSERT INTO postmeta VALUES("1703","126","first_name","Demo");
INSERT INTO postmeta VALUES("1704","126","last_name","Demo");
INSERT INTO postmeta VALUES("1705","126","address_one","Uttara");
INSERT INTO postmeta VALUES("1706","126","address_two","");
INSERT INTO postmeta VALUES("1707","126","phone","6789");
INSERT INTO postmeta VALUES("1708","126","email","demo@email.com");
INSERT INTO postmeta VALUES("1709","126","country","Bangladesh");
INSERT INTO postmeta VALUES("1710","126","state","Dhaka");
INSERT INTO postmeta VALUES("1711","126","city","Dhaka");
INSERT INTO postmeta VALUES("1712","126","zip","1205");
INSERT INTO postmeta VALUES("1713","126","_customer_user","2");
INSERT INTO postmeta VALUES("1714","126","_billing_postcode","1205");
INSERT INTO postmeta VALUES("1715","126","_billing_company","");
INSERT INTO postmeta VALUES("1716","126","_billing_last_name","");
INSERT INTO postmeta VALUES("1717","126","_billing_first_name","");
INSERT INTO postmeta VALUES("1718","126","processing_date","2020-10-05");
INSERT INTO postmeta VALUES("1719","127","first_name","Demo");
INSERT INTO postmeta VALUES("1720","127","last_name","Demo");
INSERT INTO postmeta VALUES("1721","127","address_one","Uttara");
INSERT INTO postmeta VALUES("1722","127","address_two","");
INSERT INTO postmeta VALUES("1723","127","phone","6789");
INSERT INTO postmeta VALUES("1724","127","email","demo@email.com");
INSERT INTO postmeta VALUES("1725","127","country","Bangladesh");
INSERT INTO postmeta VALUES("1726","127","state","Dhaka");
INSERT INTO postmeta VALUES("1727","127","city","Dhaka");
INSERT INTO postmeta VALUES("1728","127","zip","1205");
INSERT INTO postmeta VALUES("1729","127","_customer_user","2");
INSERT INTO postmeta VALUES("1730","127","_billing_postcode","1205");
INSERT INTO postmeta VALUES("1731","127","_billing_company","");
INSERT INTO postmeta VALUES("1732","127","_billing_last_name","");
INSERT INTO postmeta VALUES("1733","127","_billing_first_name","");
INSERT INTO postmeta VALUES("1759","129","_customer_user","2");
INSERT INTO postmeta VALUES("1760","129","_billing_postcode","1205");
INSERT INTO postmeta VALUES("1758","129","zip","1205");
INSERT INTO postmeta VALUES("1757","129","city","Dhaka");
INSERT INTO postmeta VALUES("1756","129","state","Dhaka");
INSERT INTO postmeta VALUES("1755","129","country","Bangladesh");
INSERT INTO postmeta VALUES("1754","129","email","demo@email.com");
INSERT INTO postmeta VALUES("1753","129","phone","6789");
INSERT INTO postmeta VALUES("1752","129","address_two","");
INSERT INTO postmeta VALUES("1751","129","address_one","Uttara");
INSERT INTO postmeta VALUES("1750","129","last_name","Demo");
INSERT INTO postmeta VALUES("1749","129","first_name","Demo");
INSERT INTO postmeta VALUES("1761","129","_billing_company","");
INSERT INTO postmeta VALUES("1762","129","_billing_last_name","");
INSERT INTO postmeta VALUES("1763","129","_billing_first_name","");
INSERT INTO postmeta VALUES("1791","132","email","demo@email.com");
INSERT INTO postmeta VALUES("1790","132","phone","6789");
INSERT INTO postmeta VALUES("1789","132","address_two","");
INSERT INTO postmeta VALUES("1788","132","address_one","Uttara");
INSERT INTO postmeta VALUES("1787","132","last_name","Demo");
INSERT INTO postmeta VALUES("1786","132","first_name","Demo");
INSERT INTO postmeta VALUES("1771","131","first_name","Demo");
INSERT INTO postmeta VALUES("1772","131","last_name","Demo");
INSERT INTO postmeta VALUES("1773","131","address_one","Uttara");
INSERT INTO postmeta VALUES("1774","131","address_two","");
INSERT INTO postmeta VALUES("1775","131","phone","6789");
INSERT INTO postmeta VALUES("1776","131","email","demo@email.com");
INSERT INTO postmeta VALUES("1777","131","country","Bangladesh");
INSERT INTO postmeta VALUES("1778","131","state","Dhaka");
INSERT INTO postmeta VALUES("1779","131","city","Uttara");
INSERT INTO postmeta VALUES("1780","131","zip","1230");
INSERT INTO postmeta VALUES("1781","131","_customer_user","2");
INSERT INTO postmeta VALUES("1782","131","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1783","131","_billing_company","");
INSERT INTO postmeta VALUES("1784","131","_billing_last_name","");
INSERT INTO postmeta VALUES("1785","131","_billing_first_name","");
INSERT INTO postmeta VALUES("1792","132","country","Bangladesh");
INSERT INTO postmeta VALUES("1793","132","state","Dhaka");
INSERT INTO postmeta VALUES("1794","132","city","Uttara");
INSERT INTO postmeta VALUES("1795","132","zip","1230");
INSERT INTO postmeta VALUES("1796","132","_customer_user","2");
INSERT INTO postmeta VALUES("1797","132","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1798","132","_billing_company","");
INSERT INTO postmeta VALUES("1799","132","_billing_last_name","");
INSERT INTO postmeta VALUES("1800","132","_billing_first_name","");
INSERT INTO postmeta VALUES("1801","132","payment_method","cash");
INSERT INTO postmeta VALUES("1802","133","first_name","Demo");
INSERT INTO postmeta VALUES("1803","133","last_name","Demo");
INSERT INTO postmeta VALUES("1804","133","address_one","Uttara");
INSERT INTO postmeta VALUES("1805","133","address_two","");
INSERT INTO postmeta VALUES("1806","133","phone","6789");
INSERT INTO postmeta VALUES("1807","133","email","demo@email.com");
INSERT INTO postmeta VALUES("1808","133","country","Bangladesh");
INSERT INTO postmeta VALUES("1809","133","state","Dhaka");
INSERT INTO postmeta VALUES("1810","133","city","Uttara");
INSERT INTO postmeta VALUES("1811","133","zip","1230");
INSERT INTO postmeta VALUES("1812","133","_customer_user","2");
INSERT INTO postmeta VALUES("1813","133","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1814","133","_billing_company","");
INSERT INTO postmeta VALUES("1815","133","_billing_last_name","");
INSERT INTO postmeta VALUES("1816","133","_billing_first_name","");
INSERT INTO postmeta VALUES("1817","133","payment_method","cash");
INSERT INTO postmeta VALUES("1818","134","first_name","Demo");
INSERT INTO postmeta VALUES("1819","134","last_name","Demo");
INSERT INTO postmeta VALUES("1820","134","address_one","Uttara");
INSERT INTO postmeta VALUES("1821","134","address_two","");
INSERT INTO postmeta VALUES("1822","134","phone","6789");
INSERT INTO postmeta VALUES("1823","134","email","demo@email.com");
INSERT INTO postmeta VALUES("1824","134","country","Bangladesh");
INSERT INTO postmeta VALUES("1825","134","state","Dhaka");
INSERT INTO postmeta VALUES("1826","134","city","Uttara");
INSERT INTO postmeta VALUES("1827","134","zip","1230");
INSERT INTO postmeta VALUES("1828","134","_customer_user","2");
INSERT INTO postmeta VALUES("1829","134","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1830","134","_billing_company","");
INSERT INTO postmeta VALUES("1831","134","_billing_last_name","");
INSERT INTO postmeta VALUES("1832","134","_billing_first_name","");
INSERT INTO postmeta VALUES("1833","134","payment_method","cash");
INSERT INTO postmeta VALUES("1834","135","first_name","Demo");
INSERT INTO postmeta VALUES("1835","135","last_name","Demo");
INSERT INTO postmeta VALUES("1836","135","address_one","Uttara");
INSERT INTO postmeta VALUES("1837","135","address_two","");
INSERT INTO postmeta VALUES("1838","135","phone","6789");
INSERT INTO postmeta VALUES("1839","135","email","demo@email.com");
INSERT INTO postmeta VALUES("1840","135","country","Bangladesh");
INSERT INTO postmeta VALUES("1841","135","state","Dhaka");
INSERT INTO postmeta VALUES("1842","135","city","Uttara");
INSERT INTO postmeta VALUES("1843","135","zip","1230");
INSERT INTO postmeta VALUES("1844","135","_customer_user","2");
INSERT INTO postmeta VALUES("1845","135","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1846","135","_billing_company","");
INSERT INTO postmeta VALUES("1847","135","_billing_last_name","");
INSERT INTO postmeta VALUES("1848","135","_billing_first_name","");
INSERT INTO postmeta VALUES("1849","135","payment_method","cash");
INSERT INTO postmeta VALUES("1850","136","first_name","Demo");
INSERT INTO postmeta VALUES("1851","136","last_name","Demo");
INSERT INTO postmeta VALUES("1852","136","address_one","Uttara");
INSERT INTO postmeta VALUES("1853","136","address_two","");
INSERT INTO postmeta VALUES("1854","136","phone","6789");
INSERT INTO postmeta VALUES("1855","136","email","demo@email.com");
INSERT INTO postmeta VALUES("1856","136","country","Bangladesh");
INSERT INTO postmeta VALUES("1857","136","state","Dhaka");
INSERT INTO postmeta VALUES("1858","136","city","Uttara");
INSERT INTO postmeta VALUES("1859","136","zip","1230");
INSERT INTO postmeta VALUES("1860","136","_customer_user","2");
INSERT INTO postmeta VALUES("1861","136","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1862","136","_billing_company","");
INSERT INTO postmeta VALUES("1863","136","_billing_last_name","");
INSERT INTO postmeta VALUES("1864","136","_billing_first_name","");
INSERT INTO postmeta VALUES("1865","136","payment_method","cash");
INSERT INTO postmeta VALUES("1866","137","first_name","Demo");
INSERT INTO postmeta VALUES("1867","137","last_name","Demo");
INSERT INTO postmeta VALUES("1868","137","address_one","Uttara");
INSERT INTO postmeta VALUES("1869","137","address_two","");
INSERT INTO postmeta VALUES("1870","137","phone","6789");
INSERT INTO postmeta VALUES("1871","137","email","demo@email.com");
INSERT INTO postmeta VALUES("1872","137","country","Bangladesh");
INSERT INTO postmeta VALUES("1873","137","state","Sylhet");
INSERT INTO postmeta VALUES("1874","137","city","Badda");
INSERT INTO postmeta VALUES("1875","137","zip","1212");
INSERT INTO postmeta VALUES("1876","137","_customer_user","2");
INSERT INTO postmeta VALUES("1877","137","_billing_postcode","1212");
INSERT INTO postmeta VALUES("1878","137","_billing_company","");
INSERT INTO postmeta VALUES("1879","137","_billing_last_name","");
INSERT INTO postmeta VALUES("1880","137","_billing_first_name","");
INSERT INTO postmeta VALUES("1881","137","payment_method","cash");
INSERT INTO postmeta VALUES("1882","138","first_name","Demo");
INSERT INTO postmeta VALUES("1883","138","last_name","Demo");
INSERT INTO postmeta VALUES("1884","138","address_one","Uttara");
INSERT INTO postmeta VALUES("1885","138","address_two","");
INSERT INTO postmeta VALUES("1886","138","phone","6789");
INSERT INTO postmeta VALUES("1887","138","email","demo@email.com");
INSERT INTO postmeta VALUES("1888","138","country","Bangladesh");
INSERT INTO postmeta VALUES("1889","138","state","Dhaka");
INSERT INTO postmeta VALUES("1890","138","city","Uttara");
INSERT INTO postmeta VALUES("1891","138","zip","1230");
INSERT INTO postmeta VALUES("1892","138","_customer_user","2");
INSERT INTO postmeta VALUES("1893","138","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1894","138","_billing_company","");
INSERT INTO postmeta VALUES("1895","138","_billing_last_name","");
INSERT INTO postmeta VALUES("1896","138","_billing_first_name","");
INSERT INTO postmeta VALUES("1897","138","payment_method","cash");
INSERT INTO postmeta VALUES("1898","139","first_name","Demo");
INSERT INTO postmeta VALUES("1899","139","last_name","Demo");
INSERT INTO postmeta VALUES("1900","139","address_one","Uttara");
INSERT INTO postmeta VALUES("1901","139","address_two","");
INSERT INTO postmeta VALUES("1902","139","phone","6789");
INSERT INTO postmeta VALUES("1903","139","email","demo@email.com");
INSERT INTO postmeta VALUES("1904","139","country","Bangladesh");
INSERT INTO postmeta VALUES("1905","139","state","Dhaka");
INSERT INTO postmeta VALUES("1906","139","city","Uttara");
INSERT INTO postmeta VALUES("1907","139","zip","1230");
INSERT INTO postmeta VALUES("1908","139","_customer_user","2");
INSERT INTO postmeta VALUES("1909","139","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1910","139","_billing_company","");
INSERT INTO postmeta VALUES("1911","139","_billing_last_name","");
INSERT INTO postmeta VALUES("1912","139","_billing_first_name","");
INSERT INTO postmeta VALUES("1913","139","payment_method","cash");
INSERT INTO postmeta VALUES("1914","140","first_name","Demo");
INSERT INTO postmeta VALUES("1915","140","last_name","Demo");
INSERT INTO postmeta VALUES("1916","140","address_one","Uttara");
INSERT INTO postmeta VALUES("1917","140","address_two","");
INSERT INTO postmeta VALUES("1918","140","phone","6789");
INSERT INTO postmeta VALUES("1919","140","email","demo@email.com");
INSERT INTO postmeta VALUES("1920","140","country","Bangladesh");
INSERT INTO postmeta VALUES("1921","140","state","Dhaka");
INSERT INTO postmeta VALUES("1922","140","city","Uttara");
INSERT INTO postmeta VALUES("1923","140","zip","1230");
INSERT INTO postmeta VALUES("1924","140","_customer_user","2");
INSERT INTO postmeta VALUES("1925","140","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1926","140","_billing_company","");
INSERT INTO postmeta VALUES("1927","140","_billing_last_name","");
INSERT INTO postmeta VALUES("1928","140","_billing_first_name","");
INSERT INTO postmeta VALUES("1929","140","payment_method","cash");
INSERT INTO postmeta VALUES("1930","141","first_name","Demo");
INSERT INTO postmeta VALUES("1931","141","last_name","Demo");
INSERT INTO postmeta VALUES("1932","141","address_one","Uttara");
INSERT INTO postmeta VALUES("1933","141","address_two","");
INSERT INTO postmeta VALUES("1934","141","phone","6789");
INSERT INTO postmeta VALUES("1935","141","email","demo@email.com");
INSERT INTO postmeta VALUES("1936","141","country","Bangladesh");
INSERT INTO postmeta VALUES("1937","141","state","Dhaka");
INSERT INTO postmeta VALUES("1938","141","city","Uttara");
INSERT INTO postmeta VALUES("1939","141","zip","1230");
INSERT INTO postmeta VALUES("1940","141","_customer_user","2");
INSERT INTO postmeta VALUES("1941","141","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1942","141","_billing_company","");
INSERT INTO postmeta VALUES("1943","141","_billing_last_name","");
INSERT INTO postmeta VALUES("1944","141","_billing_first_name","");
INSERT INTO postmeta VALUES("1945","141","payment_method","cash");
INSERT INTO postmeta VALUES("1946","142","first_name","Demo");
INSERT INTO postmeta VALUES("1947","142","last_name","Demo");
INSERT INTO postmeta VALUES("1948","142","address_one","Uttara");
INSERT INTO postmeta VALUES("1949","142","address_two","");
INSERT INTO postmeta VALUES("1950","142","phone","6789");
INSERT INTO postmeta VALUES("1951","142","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("1952","142","country","Bangladesh");
INSERT INTO postmeta VALUES("1953","142","state","Dhaka");
INSERT INTO postmeta VALUES("1954","142","city","Uttara");
INSERT INTO postmeta VALUES("1955","142","zip","1230");
INSERT INTO postmeta VALUES("1956","142","_customer_user","2");
INSERT INTO postmeta VALUES("1957","142","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1958","142","_billing_company","");
INSERT INTO postmeta VALUES("1959","142","_billing_last_name","");
INSERT INTO postmeta VALUES("1960","142","_billing_first_name","");
INSERT INTO postmeta VALUES("1961","142","payment_method","cash");
INSERT INTO postmeta VALUES("1962","143","first_name","Demo");
INSERT INTO postmeta VALUES("1963","143","last_name","Demo");
INSERT INTO postmeta VALUES("1964","143","address_one","Uttara");
INSERT INTO postmeta VALUES("1965","143","address_two","");
INSERT INTO postmeta VALUES("1966","143","phone","6789");
INSERT INTO postmeta VALUES("1967","143","email","parthokar@email.com");
INSERT INTO postmeta VALUES("1968","143","country","Bangladesh");
INSERT INTO postmeta VALUES("1969","143","state","Dhaka");
INSERT INTO postmeta VALUES("1970","143","city","Uttara");
INSERT INTO postmeta VALUES("1971","143","zip","1230");
INSERT INTO postmeta VALUES("1972","143","_customer_user","2");
INSERT INTO postmeta VALUES("1973","143","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1974","143","_billing_company","");
INSERT INTO postmeta VALUES("1975","143","_billing_last_name","");
INSERT INTO postmeta VALUES("1976","143","_billing_first_name","");
INSERT INTO postmeta VALUES("1977","143","payment_method","cash");
INSERT INTO postmeta VALUES("1978","144","first_name","Demo");
INSERT INTO postmeta VALUES("1979","144","last_name","Demo");
INSERT INTO postmeta VALUES("1980","144","address_one","Uttara");
INSERT INTO postmeta VALUES("1981","144","address_two","");
INSERT INTO postmeta VALUES("1982","144","phone","6789");
INSERT INTO postmeta VALUES("1983","144","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("1984","144","country","Bangladesh");
INSERT INTO postmeta VALUES("1985","144","state","Dhaka");
INSERT INTO postmeta VALUES("1986","144","city","Uttara");
INSERT INTO postmeta VALUES("1987","144","zip","1230");
INSERT INTO postmeta VALUES("1988","144","_customer_user","2");
INSERT INTO postmeta VALUES("1989","144","_billing_postcode","1230");
INSERT INTO postmeta VALUES("1990","144","_billing_company","");
INSERT INTO postmeta VALUES("1991","144","_billing_last_name","");
INSERT INTO postmeta VALUES("1992","144","_billing_first_name","");
INSERT INTO postmeta VALUES("1993","144","payment_method","cash");
INSERT INTO postmeta VALUES("1994","145","first_name","Demo");
INSERT INTO postmeta VALUES("1995","145","last_name","Demo");
INSERT INTO postmeta VALUES("1996","145","address_one","Uttara");
INSERT INTO postmeta VALUES("1997","145","address_two","");
INSERT INTO postmeta VALUES("1998","145","phone","6789");
INSERT INTO postmeta VALUES("1999","145","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2000","145","country","Bangladesh");
INSERT INTO postmeta VALUES("2001","145","state","Dhaka");
INSERT INTO postmeta VALUES("2002","145","city","Uttara");
INSERT INTO postmeta VALUES("2003","145","zip","1230");
INSERT INTO postmeta VALUES("2004","145","_customer_user","2");
INSERT INTO postmeta VALUES("2005","145","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2006","145","_billing_company","");
INSERT INTO postmeta VALUES("2007","145","_billing_last_name","");
INSERT INTO postmeta VALUES("2008","145","_billing_first_name","");
INSERT INTO postmeta VALUES("2009","145","payment_method","cash");
INSERT INTO postmeta VALUES("2010","146","first_name","Demo");
INSERT INTO postmeta VALUES("2011","146","last_name","Demo");
INSERT INTO postmeta VALUES("2012","146","address_one","Uttara");
INSERT INTO postmeta VALUES("2013","146","address_two","");
INSERT INTO postmeta VALUES("2014","146","phone","6789");
INSERT INTO postmeta VALUES("2015","146","email","demo@email.com");
INSERT INTO postmeta VALUES("2016","146","country","Bangladesh");
INSERT INTO postmeta VALUES("2017","146","state","Dhaka");
INSERT INTO postmeta VALUES("2018","146","city","Uttara");
INSERT INTO postmeta VALUES("2019","146","zip","1230");
INSERT INTO postmeta VALUES("2020","146","_customer_user","2");
INSERT INTO postmeta VALUES("2021","146","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2022","146","_billing_company","");
INSERT INTO postmeta VALUES("2023","146","_billing_last_name","");
INSERT INTO postmeta VALUES("2024","146","_billing_first_name","");
INSERT INTO postmeta VALUES("2025","146","payment_method","cash");
INSERT INTO postmeta VALUES("2026","147","first_name","Demo");
INSERT INTO postmeta VALUES("2027","147","last_name","Demo");
INSERT INTO postmeta VALUES("2028","147","address_one","Uttara");
INSERT INTO postmeta VALUES("2029","147","address_two","");
INSERT INTO postmeta VALUES("2030","147","phone","6789");
INSERT INTO postmeta VALUES("2031","147","email","demo@email.com");
INSERT INTO postmeta VALUES("2032","147","country","Bangladesh");
INSERT INTO postmeta VALUES("2033","147","state","Dhaka");
INSERT INTO postmeta VALUES("2034","147","city","Uttara");
INSERT INTO postmeta VALUES("2035","147","zip","1230");
INSERT INTO postmeta VALUES("2036","147","_customer_user","2");
INSERT INTO postmeta VALUES("2037","147","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2038","147","_billing_company","");
INSERT INTO postmeta VALUES("2039","147","_billing_last_name","");
INSERT INTO postmeta VALUES("2040","147","_billing_first_name","");
INSERT INTO postmeta VALUES("2041","147","payment_method","cash");
INSERT INTO postmeta VALUES("2042","148","first_name","Demo");
INSERT INTO postmeta VALUES("2043","148","last_name","Demo");
INSERT INTO postmeta VALUES("2044","148","address_one","Uttara");
INSERT INTO postmeta VALUES("2045","148","address_two","");
INSERT INTO postmeta VALUES("2046","148","phone","6789");
INSERT INTO postmeta VALUES("2047","148","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2048","148","country","Bangladesh");
INSERT INTO postmeta VALUES("2049","148","state","Dhaka");
INSERT INTO postmeta VALUES("2050","148","city","Uttara");
INSERT INTO postmeta VALUES("2051","148","zip","1230");
INSERT INTO postmeta VALUES("2052","148","_customer_user","2");
INSERT INTO postmeta VALUES("2053","148","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2054","148","_billing_company","");
INSERT INTO postmeta VALUES("2055","148","_billing_last_name","");
INSERT INTO postmeta VALUES("2056","148","_billing_first_name","");
INSERT INTO postmeta VALUES("2057","148","payment_method","cash");
INSERT INTO postmeta VALUES("2058","149","first_name","Demo");
INSERT INTO postmeta VALUES("2059","149","last_name","Demo");
INSERT INTO postmeta VALUES("2060","149","address_one","Uttara");
INSERT INTO postmeta VALUES("2061","149","address_two","");
INSERT INTO postmeta VALUES("2062","149","phone","6789");
INSERT INTO postmeta VALUES("2063","149","email","partho@itebd.com");
INSERT INTO postmeta VALUES("2064","149","country","Bangladesh");
INSERT INTO postmeta VALUES("2065","149","state","Dhaka");
INSERT INTO postmeta VALUES("2066","149","city","Uttara");
INSERT INTO postmeta VALUES("2067","149","zip","1230");
INSERT INTO postmeta VALUES("2068","149","_customer_user","2");
INSERT INTO postmeta VALUES("2069","149","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2070","149","_billing_company","");
INSERT INTO postmeta VALUES("2071","149","_billing_last_name","");
INSERT INTO postmeta VALUES("2072","149","_billing_first_name","");
INSERT INTO postmeta VALUES("2073","149","payment_method","cash");
INSERT INTO postmeta VALUES("2074","150","first_name","Test");
INSERT INTO postmeta VALUES("2075","150","last_name","dfgdfg");
INSERT INTO postmeta VALUES("2076","150","address_one","dfgfdg");
INSERT INTO postmeta VALUES("2077","150","address_two","");
INSERT INTO postmeta VALUES("2078","150","phone","435435435");
INSERT INTO postmeta VALUES("2079","150","email","partho@itebd.com");
INSERT INTO postmeta VALUES("2080","150","country","Bangladesh");
INSERT INTO postmeta VALUES("2081","150","state","Dhaka");
INSERT INTO postmeta VALUES("2082","150","city","Uttara");
INSERT INTO postmeta VALUES("2083","150","zip","1230");
INSERT INTO postmeta VALUES("2084","150","_customer_user","0");
INSERT INTO postmeta VALUES("2085","150","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2086","150","_billing_company","");
INSERT INTO postmeta VALUES("2087","150","_billing_last_name","");
INSERT INTO postmeta VALUES("2088","150","_billing_first_name","");
INSERT INTO postmeta VALUES("2089","150","payment_method","cash");
INSERT INTO postmeta VALUES("2090","151","first_name","Demo");
INSERT INTO postmeta VALUES("2091","151","last_name","Demo");
INSERT INTO postmeta VALUES("2092","151","address_one","Uttara");
INSERT INTO postmeta VALUES("2093","151","address_two","");
INSERT INTO postmeta VALUES("2094","151","phone","6789");
INSERT INTO postmeta VALUES("2095","151","email","partho@itebd.com");
INSERT INTO postmeta VALUES("2096","151","country","Bangladesh");
INSERT INTO postmeta VALUES("2097","151","state","Dhaka");
INSERT INTO postmeta VALUES("2098","151","city","Uttara");
INSERT INTO postmeta VALUES("2099","151","zip","1230");
INSERT INTO postmeta VALUES("2100","151","_customer_user","2");
INSERT INTO postmeta VALUES("2101","151","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2102","151","_billing_company","");
INSERT INTO postmeta VALUES("2103","151","_billing_last_name","");
INSERT INTO postmeta VALUES("2104","151","_billing_first_name","");
INSERT INTO postmeta VALUES("2105","151","payment_method","cash");
INSERT INTO postmeta VALUES("2106","152","first_name","Demo");
INSERT INTO postmeta VALUES("2107","152","last_name","Demo");
INSERT INTO postmeta VALUES("2108","152","address_one","Uttara");
INSERT INTO postmeta VALUES("2109","152","address_two","");
INSERT INTO postmeta VALUES("2110","152","phone","6789");
INSERT INTO postmeta VALUES("2111","152","email","demo@email.com");
INSERT INTO postmeta VALUES("2112","152","country","Bangladesh");
INSERT INTO postmeta VALUES("2113","152","state","Dhaka");
INSERT INTO postmeta VALUES("2114","152","city","Uttara");
INSERT INTO postmeta VALUES("2115","152","zip","1230");
INSERT INTO postmeta VALUES("2116","152","_customer_user","2");
INSERT INTO postmeta VALUES("2117","152","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2118","152","_billing_company","");
INSERT INTO postmeta VALUES("2119","152","_billing_last_name","");
INSERT INTO postmeta VALUES("2120","152","_billing_first_name","");
INSERT INTO postmeta VALUES("2121","152","payment_method","cash");
INSERT INTO postmeta VALUES("2122","153","first_name","Demo");
INSERT INTO postmeta VALUES("2123","153","last_name","Demo");
INSERT INTO postmeta VALUES("2124","153","address_one","Uttara");
INSERT INTO postmeta VALUES("2125","153","address_two","");
INSERT INTO postmeta VALUES("2126","153","phone","6789");
INSERT INTO postmeta VALUES("2127","153","email","demo@email.com");
INSERT INTO postmeta VALUES("2128","153","country","Bangladesh");
INSERT INTO postmeta VALUES("2129","153","state","Dhaka");
INSERT INTO postmeta VALUES("2130","153","city","Uttara");
INSERT INTO postmeta VALUES("2131","153","zip","1230");
INSERT INTO postmeta VALUES("2132","153","_customer_user","2");
INSERT INTO postmeta VALUES("2133","153","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2134","153","_billing_company","");
INSERT INTO postmeta VALUES("2135","153","_billing_last_name","");
INSERT INTO postmeta VALUES("2136","153","_billing_first_name","");
INSERT INTO postmeta VALUES("2137","153","payment_method","cash");
INSERT INTO postmeta VALUES("2138","154","first_name","Demo");
INSERT INTO postmeta VALUES("2139","154","last_name","Demo");
INSERT INTO postmeta VALUES("2140","154","address_one","Uttara");
INSERT INTO postmeta VALUES("2141","154","address_two","");
INSERT INTO postmeta VALUES("2142","154","phone","6789");
INSERT INTO postmeta VALUES("2143","154","email","demo@email.com");
INSERT INTO postmeta VALUES("2144","154","country","Bangladesh");
INSERT INTO postmeta VALUES("2145","154","state","Dhaka");
INSERT INTO postmeta VALUES("2146","154","city","Uttara");
INSERT INTO postmeta VALUES("2147","154","zip","1230");
INSERT INTO postmeta VALUES("2148","154","_customer_user","2");
INSERT INTO postmeta VALUES("2149","154","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2150","154","_billing_company","");
INSERT INTO postmeta VALUES("2151","154","_billing_last_name","");
INSERT INTO postmeta VALUES("2152","154","_billing_first_name","");
INSERT INTO postmeta VALUES("2153","154","payment_method","cash");
INSERT INTO postmeta VALUES("2154","155","first_name","Demo");
INSERT INTO postmeta VALUES("2155","155","last_name","Demo");
INSERT INTO postmeta VALUES("2156","155","address_one","Uttara");
INSERT INTO postmeta VALUES("2157","155","address_two","");
INSERT INTO postmeta VALUES("2158","155","phone","6789");
INSERT INTO postmeta VALUES("2159","155","email","demo@email.com");
INSERT INTO postmeta VALUES("2160","155","country","Bangladesh");
INSERT INTO postmeta VALUES("2161","155","state","Dhaka");
INSERT INTO postmeta VALUES("2162","155","city","Uttara");
INSERT INTO postmeta VALUES("2163","155","zip","1230");
INSERT INTO postmeta VALUES("2164","155","_customer_user","2");
INSERT INTO postmeta VALUES("2165","155","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2166","155","_billing_company","");
INSERT INTO postmeta VALUES("2167","155","_billing_last_name","");
INSERT INTO postmeta VALUES("2168","155","_billing_first_name","");
INSERT INTO postmeta VALUES("2169","155","payment_method","cash");
INSERT INTO postmeta VALUES("2170","156","first_name","Demo");
INSERT INTO postmeta VALUES("2171","156","last_name","Demo");
INSERT INTO postmeta VALUES("2172","156","address_one","Uttara");
INSERT INTO postmeta VALUES("2173","156","address_two","");
INSERT INTO postmeta VALUES("2174","156","phone","6789");
INSERT INTO postmeta VALUES("2175","156","email","demo@email.com");
INSERT INTO postmeta VALUES("2176","156","country","Bangladesh");
INSERT INTO postmeta VALUES("2177","156","state","Dhaka");
INSERT INTO postmeta VALUES("2178","156","city","Uttara");
INSERT INTO postmeta VALUES("2179","156","zip","1230");
INSERT INTO postmeta VALUES("2180","156","_customer_user","2");
INSERT INTO postmeta VALUES("2181","156","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2182","156","_billing_company","");
INSERT INTO postmeta VALUES("2183","156","_billing_last_name","");
INSERT INTO postmeta VALUES("2184","156","_billing_first_name","");
INSERT INTO postmeta VALUES("2185","156","payment_method","cash");
INSERT INTO postmeta VALUES("2186","0","product_cancel_comment","");
INSERT INTO postmeta VALUES("2188","0","product_cancel_comment","");
INSERT INTO postmeta VALUES("2189","0","product_cancel_comment","");
INSERT INTO postmeta VALUES("2190","157","first_name","Demo");
INSERT INTO postmeta VALUES("2191","157","last_name","Demo");
INSERT INTO postmeta VALUES("2192","157","address_one","Uttara");
INSERT INTO postmeta VALUES("2193","157","address_two","");
INSERT INTO postmeta VALUES("2194","157","phone","6789");
INSERT INTO postmeta VALUES("2195","157","email","demo@email.com");
INSERT INTO postmeta VALUES("2196","157","country","Bangladesh");
INSERT INTO postmeta VALUES("2197","157","state","Dhaka");
INSERT INTO postmeta VALUES("2198","157","city","Uttara");
INSERT INTO postmeta VALUES("2199","157","zip","1230");
INSERT INTO postmeta VALUES("2200","157","_customer_user","2");
INSERT INTO postmeta VALUES("2201","157","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2202","157","_billing_company","");
INSERT INTO postmeta VALUES("2203","157","_billing_last_name","");
INSERT INTO postmeta VALUES("2204","157","_billing_first_name","");
INSERT INTO postmeta VALUES("2205","157","payment_method","cash");
INSERT INTO postmeta VALUES("2206","158","first_name","Demo");
INSERT INTO postmeta VALUES("2207","158","last_name","Demo");
INSERT INTO postmeta VALUES("2208","158","address_one","Uttara");
INSERT INTO postmeta VALUES("2209","158","address_two","");
INSERT INTO postmeta VALUES("2210","158","phone","6789");
INSERT INTO postmeta VALUES("2211","158","email","demo@email.com");
INSERT INTO postmeta VALUES("2212","158","country","Bangladesh");
INSERT INTO postmeta VALUES("2213","158","state","Dhaka");
INSERT INTO postmeta VALUES("2214","158","city","Uttara");
INSERT INTO postmeta VALUES("2215","158","zip","1230");
INSERT INTO postmeta VALUES("2216","158","_customer_user","2");
INSERT INTO postmeta VALUES("2217","158","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2218","158","_billing_company","");
INSERT INTO postmeta VALUES("2219","158","_billing_last_name","");
INSERT INTO postmeta VALUES("2220","158","_billing_first_name","");
INSERT INTO postmeta VALUES("2221","158","payment_method","cash");
INSERT INTO postmeta VALUES("2222","159","first_name","Demo");
INSERT INTO postmeta VALUES("2223","159","last_name","Demo");
INSERT INTO postmeta VALUES("2224","159","address_one","Uttara");
INSERT INTO postmeta VALUES("2225","159","address_two","");
INSERT INTO postmeta VALUES("2226","159","phone","6789");
INSERT INTO postmeta VALUES("2227","159","email","demo@email.com");
INSERT INTO postmeta VALUES("2228","159","country","Bangladesh");
INSERT INTO postmeta VALUES("2229","159","state","Dhaka");
INSERT INTO postmeta VALUES("2230","159","city","Uttara");
INSERT INTO postmeta VALUES("2231","159","zip","1230");
INSERT INTO postmeta VALUES("2232","159","_customer_user","2");
INSERT INTO postmeta VALUES("2233","159","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2234","159","_billing_company","");
INSERT INTO postmeta VALUES("2235","159","_billing_last_name","");
INSERT INTO postmeta VALUES("2236","159","_billing_first_name","");
INSERT INTO postmeta VALUES("2237","159","payment_method","cash");
INSERT INTO postmeta VALUES("2238","160","first_name","Demo");
INSERT INTO postmeta VALUES("2239","160","last_name","Demo");
INSERT INTO postmeta VALUES("2240","160","address_one","Uttara");
INSERT INTO postmeta VALUES("2241","160","address_two","");
INSERT INTO postmeta VALUES("2242","160","phone","6789");
INSERT INTO postmeta VALUES("2243","160","email","demo@email.com");
INSERT INTO postmeta VALUES("2244","160","country","Bangladesh");
INSERT INTO postmeta VALUES("2245","160","state","Dhaka");
INSERT INTO postmeta VALUES("2246","160","city","Uttara");
INSERT INTO postmeta VALUES("2247","160","zip","1230");
INSERT INTO postmeta VALUES("2248","160","_customer_user","2");
INSERT INTO postmeta VALUES("2249","160","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2250","160","_billing_company","");
INSERT INTO postmeta VALUES("2251","160","_billing_last_name","");
INSERT INTO postmeta VALUES("2252","160","_billing_first_name","");
INSERT INTO postmeta VALUES("2253","160","payment_method","cash");
INSERT INTO postmeta VALUES("2254","161","first_name","Demo");
INSERT INTO postmeta VALUES("2255","161","last_name","Demo");
INSERT INTO postmeta VALUES("2256","161","address_one","Uttara");
INSERT INTO postmeta VALUES("2257","161","address_two","");
INSERT INTO postmeta VALUES("2258","161","phone","6789");
INSERT INTO postmeta VALUES("2259","161","email","demo@email.com");
INSERT INTO postmeta VALUES("2260","161","country","Bangladesh");
INSERT INTO postmeta VALUES("2261","161","state","Dhaka");
INSERT INTO postmeta VALUES("2262","161","city","Uttara");
INSERT INTO postmeta VALUES("2263","161","zip","1230");
INSERT INTO postmeta VALUES("2264","161","_customer_user","2");
INSERT INTO postmeta VALUES("2265","161","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2266","161","_billing_company","");
INSERT INTO postmeta VALUES("2267","161","_billing_last_name","");
INSERT INTO postmeta VALUES("2268","161","_billing_first_name","");
INSERT INTO postmeta VALUES("2269","161","payment_method","cash");
INSERT INTO postmeta VALUES("2270","162","first_name","Demo");
INSERT INTO postmeta VALUES("2271","162","last_name","Demo");
INSERT INTO postmeta VALUES("2272","162","address_one","Uttara");
INSERT INTO postmeta VALUES("2273","162","address_two","");
INSERT INTO postmeta VALUES("2274","162","phone","6789");
INSERT INTO postmeta VALUES("2275","162","email","demo@email.com");
INSERT INTO postmeta VALUES("2276","162","country","Bangladesh");
INSERT INTO postmeta VALUES("2277","162","state","Dhaka");
INSERT INTO postmeta VALUES("2278","162","city","Uttara");
INSERT INTO postmeta VALUES("2279","162","zip","1230");
INSERT INTO postmeta VALUES("2280","162","_customer_user","2");
INSERT INTO postmeta VALUES("2281","162","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2282","162","_billing_company","");
INSERT INTO postmeta VALUES("2283","162","_billing_last_name","");
INSERT INTO postmeta VALUES("2284","162","_billing_first_name","");
INSERT INTO postmeta VALUES("2285","162","payment_method","cash");
INSERT INTO postmeta VALUES("2286","163","first_name","Demo");
INSERT INTO postmeta VALUES("2287","163","last_name","Demo");
INSERT INTO postmeta VALUES("2288","163","address_one","Uttara");
INSERT INTO postmeta VALUES("2289","163","address_two","");
INSERT INTO postmeta VALUES("2290","163","phone","6789");
INSERT INTO postmeta VALUES("2291","163","email","demo@email.com");
INSERT INTO postmeta VALUES("2292","163","country","Bangladesh");
INSERT INTO postmeta VALUES("2293","163","state","Dhaka");
INSERT INTO postmeta VALUES("2294","163","city","Uttara");
INSERT INTO postmeta VALUES("2295","163","zip","1230");
INSERT INTO postmeta VALUES("2296","163","_customer_user","2");
INSERT INTO postmeta VALUES("2297","163","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2298","163","_billing_company","");
INSERT INTO postmeta VALUES("2299","163","_billing_last_name","");
INSERT INTO postmeta VALUES("2300","163","_billing_first_name","");
INSERT INTO postmeta VALUES("2301","163","payment_method","cash");
INSERT INTO postmeta VALUES("2302","164","first_name","Demo");
INSERT INTO postmeta VALUES("2303","164","last_name","Demo");
INSERT INTO postmeta VALUES("2304","164","address_one","Uttara");
INSERT INTO postmeta VALUES("2305","164","address_two","");
INSERT INTO postmeta VALUES("2306","164","phone","6789");
INSERT INTO postmeta VALUES("2307","164","email","demo@email.com");
INSERT INTO postmeta VALUES("2308","164","country","Bangladesh");
INSERT INTO postmeta VALUES("2309","164","state","Dhaka");
INSERT INTO postmeta VALUES("2310","164","city","Uttara");
INSERT INTO postmeta VALUES("2311","164","zip","1230");
INSERT INTO postmeta VALUES("2312","164","_customer_user","2");
INSERT INTO postmeta VALUES("2313","164","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2314","164","_billing_company","");
INSERT INTO postmeta VALUES("2315","164","_billing_last_name","");
INSERT INTO postmeta VALUES("2316","164","_billing_first_name","");
INSERT INTO postmeta VALUES("2317","164","payment_method","cash");
INSERT INTO postmeta VALUES("2449","172","payment_method","cash");
INSERT INTO postmeta VALUES("2461","174","default_attribute","[{"taxonomy":"pa_color","term":"Blue"}]");
INSERT INTO postmeta VALUES("2471","174","product_stock","2000");
INSERT INTO postmeta VALUES("2472","174","start_stock","2000");
INSERT INTO postmeta VALUES("2473","174","_sku","4521");
INSERT INTO postmeta VALUES("2474","174","attached_file","1602497289.jpg");
INSERT INTO postmeta VALUES("2475","174","gallery_file","Tunic 5.jpg");
INSERT INTO postmeta VALUES("2476","174","gallery_file","Tunic 5-2.jpg");
INSERT INTO postmeta VALUES("2477","174","gallery_file","Tunic 5-3.jpg");
INSERT INTO postmeta VALUES("2478","172","processing_date","2020-10-13");
INSERT INTO postmeta VALUES("2479","171","processing_date","2020-10-13");
INSERT INTO postmeta VALUES("2480","175","first_name","Saiful");
INSERT INTO postmeta VALUES("2481","175","last_name","Saiful");
INSERT INTO postmeta VALUES("2482","175","address_one","uttara");
INSERT INTO postmeta VALUES("2483","175","address_two","");
INSERT INTO postmeta VALUES("2484","175","phone","345345345");
INSERT INTO postmeta VALUES("2485","175","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2486","175","country","Bangladesh");
INSERT INTO postmeta VALUES("2487","175","state","Dhaka");
INSERT INTO postmeta VALUES("2488","175","city","Uttara");
INSERT INTO postmeta VALUES("2489","175","zip","1230");
INSERT INTO postmeta VALUES("2490","175","_customer_user","5");
INSERT INTO postmeta VALUES("2491","175","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2492","175","_billing_company","");
INSERT INTO postmeta VALUES("2493","175","_billing_last_name","");
INSERT INTO postmeta VALUES("2494","175","_billing_first_name","");
INSERT INTO postmeta VALUES("2495","175","payment_method","cash");
INSERT INTO postmeta VALUES("2496","175","processing_date","2020-10-15");
INSERT INTO postmeta VALUES("2497","176","first_name","Saiful");
INSERT INTO postmeta VALUES("2498","176","last_name","Saiful");
INSERT INTO postmeta VALUES("2499","176","address_one","Uttara");
INSERT INTO postmeta VALUES("2500","176","address_two","");
INSERT INTO postmeta VALUES("2501","176","phone","345345345");
INSERT INTO postmeta VALUES("2502","176","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2503","176","country","Bangladesh");
INSERT INTO postmeta VALUES("2504","176","state","Dhaka");
INSERT INTO postmeta VALUES("2505","176","city","Uttara");
INSERT INTO postmeta VALUES("2506","176","zip","1230");
INSERT INTO postmeta VALUES("2507","176","_customer_user","5");
INSERT INTO postmeta VALUES("2508","176","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2509","176","_billing_company","");
INSERT INTO postmeta VALUES("2510","176","_billing_last_name","");
INSERT INTO postmeta VALUES("2511","176","_billing_first_name","");
INSERT INTO postmeta VALUES("2512","176","payment_method","cash");
INSERT INTO postmeta VALUES("2513","177","first_name","Saiful");
INSERT INTO postmeta VALUES("2514","177","last_name","Saiful");
INSERT INTO postmeta VALUES("2515","177","address_one","Uttara");
INSERT INTO postmeta VALUES("2516","177","address_two","");
INSERT INTO postmeta VALUES("2517","177","phone","345345345");
INSERT INTO postmeta VALUES("2518","177","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2519","177","country","Bangladesh");
INSERT INTO postmeta VALUES("2520","177","state","Dhaka");
INSERT INTO postmeta VALUES("2521","177","city","Uttara");
INSERT INTO postmeta VALUES("2522","177","zip","1230");
INSERT INTO postmeta VALUES("2523","177","_customer_user","5");
INSERT INTO postmeta VALUES("2524","177","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2525","177","_billing_company","");
INSERT INTO postmeta VALUES("2526","177","_billing_last_name","");
INSERT INTO postmeta VALUES("2527","177","_billing_first_name","");
INSERT INTO postmeta VALUES("2528","177","payment_method","cash");
INSERT INTO postmeta VALUES("2529","178","first_name","Saiful");
INSERT INTO postmeta VALUES("2530","178","last_name","Saiful");
INSERT INTO postmeta VALUES("2531","178","address_one","Uttara");
INSERT INTO postmeta VALUES("2532","178","address_two","");
INSERT INTO postmeta VALUES("2533","178","phone","345345345");
INSERT INTO postmeta VALUES("2534","178","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2535","178","country","Bangladesh");
INSERT INTO postmeta VALUES("2536","178","state","Dhaka");
INSERT INTO postmeta VALUES("2537","178","city","Uttara");
INSERT INTO postmeta VALUES("2538","178","zip","1230");
INSERT INTO postmeta VALUES("2539","178","_customer_user","5");
INSERT INTO postmeta VALUES("2540","178","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2541","178","_billing_company","");
INSERT INTO postmeta VALUES("2542","178","_billing_last_name","");
INSERT INTO postmeta VALUES("2543","178","_billing_first_name","");
INSERT INTO postmeta VALUES("2544","178","payment_method","cash");
INSERT INTO postmeta VALUES("2545","179","first_name","Saiful");
INSERT INTO postmeta VALUES("2546","179","last_name","Saiful");
INSERT INTO postmeta VALUES("2547","179","address_one","Uttara");
INSERT INTO postmeta VALUES("2548","179","address_two","");
INSERT INTO postmeta VALUES("2549","179","phone","345345345");
INSERT INTO postmeta VALUES("2550","179","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2551","179","country","Bangladesh");
INSERT INTO postmeta VALUES("2552","179","state","Dhaka");
INSERT INTO postmeta VALUES("2553","179","city","Uttara");
INSERT INTO postmeta VALUES("2554","179","zip","1230");
INSERT INTO postmeta VALUES("2555","179","_customer_user","5");
INSERT INTO postmeta VALUES("2556","179","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2557","179","_billing_company","");
INSERT INTO postmeta VALUES("2558","179","_billing_last_name","");
INSERT INTO postmeta VALUES("2559","179","_billing_first_name","");
INSERT INTO postmeta VALUES("2560","179","payment_method","cash");
INSERT INTO postmeta VALUES("2561","180","first_name","Saiful");
INSERT INTO postmeta VALUES("2562","180","last_name","Saiful");
INSERT INTO postmeta VALUES("2563","180","address_one","Uttara");
INSERT INTO postmeta VALUES("2564","180","address_two","");
INSERT INTO postmeta VALUES("2565","180","phone","345345345");
INSERT INTO postmeta VALUES("2566","180","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2567","180","country","Bangladesh");
INSERT INTO postmeta VALUES("2568","180","state","Sylhet");
INSERT INTO postmeta VALUES("2569","180","city","Badda");
INSERT INTO postmeta VALUES("2570","180","zip","1212");
INSERT INTO postmeta VALUES("2571","180","_customer_user","5");
INSERT INTO postmeta VALUES("2572","180","_billing_postcode","1212");
INSERT INTO postmeta VALUES("2573","180","_billing_company","");
INSERT INTO postmeta VALUES("2574","180","_billing_last_name","");
INSERT INTO postmeta VALUES("2575","180","_billing_first_name","");
INSERT INTO postmeta VALUES("2576","180","payment_method","cash");
INSERT INTO postmeta VALUES("2577","181","first_name","Saiful");
INSERT INTO postmeta VALUES("2578","181","last_name","Saiful");
INSERT INTO postmeta VALUES("2579","181","address_one","Uttara");
INSERT INTO postmeta VALUES("2580","181","address_two","");
INSERT INTO postmeta VALUES("2581","181","phone","345345345");
INSERT INTO postmeta VALUES("2582","181","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2583","181","country","Bangladesh");
INSERT INTO postmeta VALUES("2584","181","state","Dhaka");
INSERT INTO postmeta VALUES("2585","181","city","Uttara");
INSERT INTO postmeta VALUES("2586","181","zip","1230");
INSERT INTO postmeta VALUES("2587","181","_customer_user","5");
INSERT INTO postmeta VALUES("2588","181","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2589","181","_billing_company","");
INSERT INTO postmeta VALUES("2590","181","_billing_last_name","");
INSERT INTO postmeta VALUES("2591","181","_billing_first_name","");
INSERT INTO postmeta VALUES("2592","181","payment_method","cash");
INSERT INTO postmeta VALUES("2593","182","first_name","Saiful");
INSERT INTO postmeta VALUES("2594","182","last_name","Saiful");
INSERT INTO postmeta VALUES("2595","182","address_one","Uttara");
INSERT INTO postmeta VALUES("2596","182","address_two","");
INSERT INTO postmeta VALUES("2597","182","phone","345345345000");
INSERT INTO postmeta VALUES("2598","182","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2599","182","country","Bangladesh");
INSERT INTO postmeta VALUES("2600","182","state","Sylhet");
INSERT INTO postmeta VALUES("2601","182","city","Badda");
INSERT INTO postmeta VALUES("2602","182","zip","1212");
INSERT INTO postmeta VALUES("2603","182","_customer_user","5");
INSERT INTO postmeta VALUES("2604","182","_billing_postcode","1212");
INSERT INTO postmeta VALUES("2605","182","_billing_company","");
INSERT INTO postmeta VALUES("2606","182","_billing_last_name","");
INSERT INTO postmeta VALUES("2607","182","_billing_first_name","");
INSERT INTO postmeta VALUES("2608","182","payment_method","cash");
INSERT INTO postmeta VALUES("2609","183","first_name","Saiful");
INSERT INTO postmeta VALUES("2610","183","last_name","Saiful");
INSERT INTO postmeta VALUES("2611","183","address_one","Uttara");
INSERT INTO postmeta VALUES("2612","183","address_two","");
INSERT INTO postmeta VALUES("2613","183","phone","345345345");
INSERT INTO postmeta VALUES("2614","183","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2615","183","country","Bangladesh");
INSERT INTO postmeta VALUES("2616","183","state","Dhaka");
INSERT INTO postmeta VALUES("2617","183","city","Uttara");
INSERT INTO postmeta VALUES("2618","183","zip","1230");
INSERT INTO postmeta VALUES("2619","183","_customer_user","5");
INSERT INTO postmeta VALUES("2620","183","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2621","183","_billing_company","");
INSERT INTO postmeta VALUES("2622","183","_billing_last_name","");
INSERT INTO postmeta VALUES("2623","183","_billing_first_name","");
INSERT INTO postmeta VALUES("2624","183","payment_method","cash");
INSERT INTO postmeta VALUES("2628","184","address_two","");
INSERT INTO postmeta VALUES("2629","184","phone","3453453457");
INSERT INTO postmeta VALUES("2630","184","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("2631","184","country","Bangladesh");
INSERT INTO postmeta VALUES("2632","184","state","Dhaka");
INSERT INTO postmeta VALUES("2633","184","city","Uttara");
INSERT INTO postmeta VALUES("2634","184","zip","1230");
INSERT INTO postmeta VALUES("2635","184","_customer_user","5");
INSERT INTO postmeta VALUES("2636","184","_billing_postcode","1230");
INSERT INTO postmeta VALUES("2637","184","_billing_company","");
INSERT INTO postmeta VALUES("2638","184","_billing_last_name","");
INSERT INTO postmeta VALUES("2639","184","_billing_first_name","");
INSERT INTO postmeta VALUES("2640","184","payment_method","cash");
INSERT INTO postmeta VALUES("2641","185","first_name","Guest");
INSERT INTO postmeta VALUES("2642","185","last_name","Guest");
INSERT INTO postmeta VALUES("2643","185","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("2644","185","address_two","");
INSERT INTO postmeta VALUES("2645","185","phone","0000000001");
INSERT INTO postmeta VALUES("2646","185","email","guest@email.com");
INSERT INTO postmeta VALUES("2647","185","country","Bangladesh");
INSERT INTO postmeta VALUES("2648","185","state","Dhaka");
INSERT INTO postmeta VALUES("2649","185","city","badda");
INSERT INTO postmeta VALUES("2650","185","zip","123");
INSERT INTO postmeta VALUES("2651","185","_customer_user","0");
INSERT INTO postmeta VALUES("2652","185","_billing_postcode","123");
INSERT INTO postmeta VALUES("2653","185","_billing_company","");
INSERT INTO postmeta VALUES("2654","185","_billing_last_name","");
INSERT INTO postmeta VALUES("2655","185","_billing_first_name","");
INSERT INTO postmeta VALUES("2656","185","payment_method","cash");
INSERT INTO postmeta VALUES("2657","186","first_name","Guest");
INSERT INTO postmeta VALUES("2658","186","last_name","Guest");
INSERT INTO postmeta VALUES("2659","186","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("2660","186","address_two","");
INSERT INTO postmeta VALUES("2661","186","phone","0000000001");
INSERT INTO postmeta VALUES("2662","186","email","guest@email.com");
INSERT INTO postmeta VALUES("2663","186","country","Bangladesh");
INSERT INTO postmeta VALUES("2664","187","first_name","Demo");
INSERT INTO postmeta VALUES("2665","187","last_name","Demo");
INSERT INTO postmeta VALUES("2666","187","address_one","Uttara");
INSERT INTO postmeta VALUES("2667","187","address_two","");
INSERT INTO postmeta VALUES("2668","187","phone","6789");
INSERT INTO postmeta VALUES("2669","187","email","demo@email.com");
INSERT INTO postmeta VALUES("2670","187","country","Bangladesh");
INSERT INTO postmeta VALUES("2671","187","state","Dhaka");
INSERT INTO postmeta VALUES("2672","187","city","badda");
INSERT INTO postmeta VALUES("2673","187","zip","123");
INSERT INTO postmeta VALUES("2674","187","_customer_user","2");
INSERT INTO postmeta VALUES("2675","187","_billing_postcode","123");
INSERT INTO postmeta VALUES("2676","187","_billing_company","");
INSERT INTO postmeta VALUES("2677","187","_billing_last_name","");
INSERT INTO postmeta VALUES("2678","187","_billing_first_name","");
INSERT INTO postmeta VALUES("2679","187","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("2680","188","first_name","Demo");
INSERT INTO postmeta VALUES("2681","188","last_name","Demo");
INSERT INTO postmeta VALUES("2682","188","address_one","Uttara");
INSERT INTO postmeta VALUES("2683","188","address_two","");
INSERT INTO postmeta VALUES("2684","188","phone","6789");
INSERT INTO postmeta VALUES("2685","188","email","demo@email.com");
INSERT INTO postmeta VALUES("2686","188","country","Bangladesh");
INSERT INTO postmeta VALUES("2687","188","state","Dhaka");
INSERT INTO postmeta VALUES("2688","188","city","kuril");
INSERT INTO postmeta VALUES("2689","188","zip","badda");
INSERT INTO postmeta VALUES("2690","188","_customer_user","2");
INSERT INTO postmeta VALUES("2691","188","_billing_postcode","badda");
INSERT INTO postmeta VALUES("2692","188","_billing_company","");
INSERT INTO postmeta VALUES("2693","188","_billing_last_name","");
INSERT INTO postmeta VALUES("2694","188","_billing_first_name","");
INSERT INTO postmeta VALUES("2695","188","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("2696","189","first_name","Demo");
INSERT INTO postmeta VALUES("2697","189","last_name","Demo");
INSERT INTO postmeta VALUES("2698","189","address_one","Uttara");
INSERT INTO postmeta VALUES("2699","189","address_two","");
INSERT INTO postmeta VALUES("2700","189","phone","6789");
INSERT INTO postmeta VALUES("2701","189","email","demo@email.com");
INSERT INTO postmeta VALUES("2702","189","country","Bangladesh");
INSERT INTO postmeta VALUES("2703","189","state","Dhaka");
INSERT INTO postmeta VALUES("2704","189","city","kuril");
INSERT INTO postmeta VALUES("2705","189","zip","kuril");
INSERT INTO postmeta VALUES("2706","189","_customer_user","2");
INSERT INTO postmeta VALUES("2707","189","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("2708","189","_billing_company","");
INSERT INTO postmeta VALUES("2709","189","_billing_last_name","");
INSERT INTO postmeta VALUES("2710","189","_billing_first_name","");
INSERT INTO postmeta VALUES("2711","189","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("2712","190","first_name","Demo");
INSERT INTO postmeta VALUES("2713","190","last_name","Demo");
INSERT INTO postmeta VALUES("2714","190","address_one","Uttara");
INSERT INTO postmeta VALUES("2715","190","address_two","");
INSERT INTO postmeta VALUES("2716","190","phone","6789");
INSERT INTO postmeta VALUES("2717","190","email","demo@email.com");
INSERT INTO postmeta VALUES("2718","190","country","Bangladesh");
INSERT INTO postmeta VALUES("2719","190","state","Dhaka");
INSERT INTO postmeta VALUES("2720","190","city","kuril");
INSERT INTO postmeta VALUES("2721","190","zip","kuril");
INSERT INTO postmeta VALUES("2722","190","_customer_user","2");
INSERT INTO postmeta VALUES("2723","190","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("2724","190","_billing_company","");
INSERT INTO postmeta VALUES("2725","190","_billing_last_name","");
INSERT INTO postmeta VALUES("2726","190","_billing_first_name","");
INSERT INTO postmeta VALUES("2727","190","payment_method","DeliveryChargeOnly");
INSERT INTO postmeta VALUES("2728","191","first_name","Demo");
INSERT INTO postmeta VALUES("2729","191","last_name","Demo");
INSERT INTO postmeta VALUES("2730","191","address_one","Uttara");
INSERT INTO postmeta VALUES("2731","191","address_two","");
INSERT INTO postmeta VALUES("2732","191","phone","6789");
INSERT INTO postmeta VALUES("2733","191","email","demo@email.com");
INSERT INTO postmeta VALUES("2734","191","country","Bangladesh");
INSERT INTO postmeta VALUES("2735","191","state","Dhaka");
INSERT INTO postmeta VALUES("2736","191","city","kuril");
INSERT INTO postmeta VALUES("2737","191","zip","kuril");
INSERT INTO postmeta VALUES("2738","191","_customer_user","2");
INSERT INTO postmeta VALUES("2739","191","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("2740","191","_billing_company","");
INSERT INTO postmeta VALUES("2741","191","_billing_last_name","");
INSERT INTO postmeta VALUES("2742","191","_billing_first_name","");
INSERT INTO postmeta VALUES("2743","191","payment_method","DeliveryChargeOnly");
INSERT INTO postmeta VALUES("2744","192","first_name","Demo");
INSERT INTO postmeta VALUES("2745","192","last_name","Demo");
INSERT INTO postmeta VALUES("2746","192","address_one","Uttara");
INSERT INTO postmeta VALUES("2747","192","address_two","");
INSERT INTO postmeta VALUES("2748","192","phone","6789");
INSERT INTO postmeta VALUES("2749","192","email","demo@email.com");
INSERT INTO postmeta VALUES("2750","192","country","Bangladesh");
INSERT INTO postmeta VALUES("2751","192","state","Dhaka");
INSERT INTO postmeta VALUES("2752","192","city","kuril");
INSERT INTO postmeta VALUES("2753","192","zip","kuril");
INSERT INTO postmeta VALUES("2754","192","_customer_user","2");
INSERT INTO postmeta VALUES("2755","192","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("2756","192","_billing_company","");
INSERT INTO postmeta VALUES("2757","192","_billing_last_name","");
INSERT INTO postmeta VALUES("2758","192","_billing_first_name","");
INSERT INTO postmeta VALUES("2759","192","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("2760","193","first_name","Demo");
INSERT INTO postmeta VALUES("2761","193","last_name","Demo");
INSERT INTO postmeta VALUES("2762","193","address_one","Uttara");
INSERT INTO postmeta VALUES("2763","193","address_two","");
INSERT INTO postmeta VALUES("2764","193","phone","6789");
INSERT INTO postmeta VALUES("2765","193","email","demo@email.com");
INSERT INTO postmeta VALUES("2766","193","country","Bangladesh");
INSERT INTO postmeta VALUES("2767","193","state","Dhaka");
INSERT INTO postmeta VALUES("2768","193","city","kuril");
INSERT INTO postmeta VALUES("2769","193","zip","kuril");
INSERT INTO postmeta VALUES("2770","193","_customer_user","2");
INSERT INTO postmeta VALUES("2771","193","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("2772","193","_billing_company","");
INSERT INTO postmeta VALUES("2773","193","_billing_last_name","");
INSERT INTO postmeta VALUES("2774","193","_billing_first_name","");
INSERT INTO postmeta VALUES("2775","193","payment_method","FullPayment");
INSERT INTO postmeta VALUES("2776","193","processing_date","2020-10-21");
INSERT INTO postmeta VALUES("2777","194","first_name","Guest");
INSERT INTO postmeta VALUES("2778","194","last_name","Guest");
INSERT INTO postmeta VALUES("2779","194","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("2780","194","address_two","");
INSERT INTO postmeta VALUES("2781","194","phone","0000000001");
INSERT INTO postmeta VALUES("2782","194","email","guest@email.com");
INSERT INTO postmeta VALUES("2783","194","country","Bangladesh");
INSERT INTO postmeta VALUES("2784","194","state","Sylhet");
INSERT INTO postmeta VALUES("2785","194","city","Habiganj1");
INSERT INTO postmeta VALUES("2786","194","zip","3330-337456");
INSERT INTO postmeta VALUES("2787","194","_customer_user","0");
INSERT INTO postmeta VALUES("2788","194","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("2789","194","_billing_company","");
INSERT INTO postmeta VALUES("2790","194","_billing_last_name","");
INSERT INTO postmeta VALUES("2791","194","_billing_first_name","");
INSERT INTO postmeta VALUES("2792","194","payment_method","DeliveryChargeOnly");
INSERT INTO postmeta VALUES("2793","195","first_name","Demo");
INSERT INTO postmeta VALUES("2794","195","last_name","Demo");
INSERT INTO postmeta VALUES("2795","195","address_one","Uttara");
INSERT INTO postmeta VALUES("2796","195","address_two","");
INSERT INTO postmeta VALUES("2797","195","phone","6789");
INSERT INTO postmeta VALUES("2798","195","email","demo@email.com");
INSERT INTO postmeta VALUES("2799","195","country","Bangladesh");
INSERT INTO postmeta VALUES("2800","195","state","Sylhet");
INSERT INTO postmeta VALUES("2801","195","city","Habiganj1");
INSERT INTO postmeta VALUES("2802","195","zip","3330-337456");
INSERT INTO postmeta VALUES("2803","195","_customer_user","2");
INSERT INTO postmeta VALUES("2804","195","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("2805","195","_billing_company","");
INSERT INTO postmeta VALUES("2806","195","_billing_last_name","");
INSERT INTO postmeta VALUES("2807","195","_billing_first_name","");
INSERT INTO postmeta VALUES("2808","195","payment_method","DeliveryChargeOnly");
INSERT INTO postmeta VALUES("2809","195","processing_date","2020-10-22");
INSERT INTO postmeta VALUES("2810","194","processing_date","2020-10-22");
INSERT INTO postmeta VALUES("2811","196","first_name","Guest");
INSERT INTO postmeta VALUES("2812","196","last_name","Guest");
INSERT INTO postmeta VALUES("2813","196","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("2814","196","address_two","");
INSERT INTO postmeta VALUES("2815","196","phone","0000000001");
INSERT INTO postmeta VALUES("2816","196","email","guest@email.com");
INSERT INTO postmeta VALUES("2817","196","country","Bangladesh");
INSERT INTO postmeta VALUES("2818","196","state","Sylhet");
INSERT INTO postmeta VALUES("2819","196","city","Habiganj1");
INSERT INTO postmeta VALUES("2820","196","zip","3330-337456");
INSERT INTO postmeta VALUES("2821","196","_customer_user","0");
INSERT INTO postmeta VALUES("2822","196","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("2823","196","_billing_company","");
INSERT INTO postmeta VALUES("2824","196","_billing_last_name","");
INSERT INTO postmeta VALUES("2825","196","_billing_first_name","");
INSERT INTO postmeta VALUES("2826","196","payment_method","DeliveryChargeOnly");



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
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES("1","0","2020-09-26 16:47:07","2020-09-26 22:47:07","","Samsung","","inherit","open","open","","Samsung","","","2020-09-26 00:00:00","2020-09-26 22:47:07","","0","","0","attachment","","0");
INSERT INTO posts VALUES("2","0","2020-09-26 17:06:19","2020-09-26 23:06:19","","Dell","","inherit","open","open","","Dell","","","2020-09-26 00:00:00","2020-09-26 23:06:19","","0","","0","attachment","","0");
INSERT INTO posts VALUES("3","0","2020-09-26 17:16:26","2020-09-26 23:16:26","","Apple","","inherit","open","open","","Apple","","","2020-09-26 00:00:00","2020-09-26 23:16:26","","0","","0","attachment","","0");
INSERT INTO posts VALUES("4","0","2020-09-26 17:17:17","2020-09-26 23:17:17","","Sony","","inherit","open","open","","Sony","","","2020-09-26 00:00:00","2020-09-26 23:17:17","","0","","0","attachment","","0");
INSERT INTO posts VALUES("5","0","2020-09-26 17:17:57","2020-09-26 23:17:57","","Lenovo","","inherit","open","open","","Lenovo","","","2020-09-26 00:00:00","2020-09-26 23:17:57","","0","","0","attachment","","0");
INSERT INTO posts VALUES("6","0","2020-09-26 17:20:29","2020-09-26 23:20:29","","HTC","","inherit","open","open","","HTC","","","2020-09-26 00:00:00","2020-09-26 23:20:29","","0","","0","attachment","","0");
INSERT INTO posts VALUES("7","0","2020-09-26 17:21:15","2020-09-26 23:21:15","","Xiaomi","","inherit","open","open","","Xiaomi","","","2020-09-26 00:00:00","2020-09-26 23:21:15","","0","","0","attachment","","0");
INSERT INTO posts VALUES("8","0","2020-09-26 17:23:42","2020-09-26 23:23:42","","OnePlus","","inherit","open","open","","OnePlus","","","2020-09-26 00:00:00","2020-09-26 23:23:42","","0","","0","attachment","","0");
INSERT INTO posts VALUES("72","1","2020-10-05 12:27:00","2020-10-05 18:27:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Scarve 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Scarve 2","","","2020-10-05 12:28:49","2020-10-05 12:28:49","","0","","0","product","","0");
INSERT INTO posts VALUES("73","1","2020-10-05 12:29:00","2020-10-05 18:29:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Sunglases 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Sunglases 1","","","2020-10-05 12:30:09","2020-10-05 12:30:09","","0","","0","product","","0");
INSERT INTO posts VALUES("74","1","2020-10-05 12:31:00","2020-10-05 18:31:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Crossbody bag 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Crossbody bag 1","","","2020-10-05 12:32:40","2020-10-05 12:32:40","","0","","0","product","","0");
INSERT INTO posts VALUES("35","1","2020-09-26 17:50:00","2020-09-26 23:50:00","<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","Burger","<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","deleted","open","open","","Burger","","","2020-09-29 00:00:00","2020-09-29 13:47:28","","0","","0","deleted","","0");
INSERT INTO posts VALUES("39","1","2020-09-29 15:51:00","2020-09-29 21:51:00","<p>dsfdsfsdf</p>","Saiful","<p>sdafdsfdsf</p>","deleted","open","open","","Saiful","","","2020-09-29 00:00:00","2020-09-29 15:51:53","","0","","0","deleted","","0");
INSERT INTO posts VALUES("71","1","2020-10-05 12:26:00","2020-10-05 18:26:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Scarve 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Scarve 1","","","2020-10-05 12:27:37","2020-10-05 12:27:37","","0","","0","product","","0");
INSERT INTO posts VALUES("16","1","2020-09-27 13:36:00","2020-09-27 19:36:00","Banner Image","Banner Image","Banner Image","publish","open","open","","Banner Image","","","2020-09-27 00:00:00","2020-09-27 13:36:49","","0","","0","banner","","0");
INSERT INTO posts VALUES("70","1","2020-10-05 12:23:00","2020-10-05 18:23:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Belt 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Belt 1","","","2020-10-05 12:25:56","2020-10-05 12:25:56","","0","","0","product","","0");
INSERT INTO posts VALUES("75","1","2020-10-05 12:32:00","2020-10-05 18:32:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Crossbody bag 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Crossbody bag 2","","","2020-10-05 12:34:17","2020-10-05 12:34:17","","0","","0","product","","0");
INSERT INTO posts VALUES("76","1","2020-10-05 12:34:00","2020-10-05 18:34:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Crossbody bag 2-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Crossbody bag 2-2","","","2020-10-05 12:36:08","2020-10-05 12:36:08","","0","","0","product","","0");
INSERT INTO posts VALUES("77","1","2020-10-05 12:36:00","2020-10-05 18:36:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Purse 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Purse 1","","","2020-10-05 12:37:03","2020-10-05 12:37:03","","0","","0","product","","0");
INSERT INTO posts VALUES("78","1","2020-10-05 12:37:00","2020-10-05 18:37:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","purse 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","purse 2","","","2020-10-05 12:37:59","2020-10-05 12:37:59","","0","","0","product","","0");
INSERT INTO posts VALUES("79","1","2020-10-05 12:38:00","2020-10-05 18:38:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tote bag 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tote bag 2","","","2020-10-05 12:39:51","2020-10-05 12:39:51","","0","","0","product","","0");
INSERT INTO posts VALUES("80","1","2020-10-05 12:40:00","2020-10-05 18:40:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tote bag 3","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tote bag 3","","","2020-10-05 12:41:05","2020-10-05 12:41:05","","0","","0","product","","0");
INSERT INTO posts VALUES("81","1","2020-10-05 12:41:00","2020-10-05 18:41:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tote bag 4","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tote bag 4","","","2020-10-05 12:43:00","2020-10-05 12:43:00","","0","","0","product","","0");
INSERT INTO posts VALUES("82","1","2020-10-05 12:46:00","2020-10-05 18:46:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Jeans 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Jeans 1","","","2020-10-05 12:47:22","2020-10-05 12:47:22","","0","","0","product","","0");
INSERT INTO posts VALUES("83","1","2020-10-05 12:50:00","2020-10-05 18:50:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Jeans 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Jeans 2","","","2020-10-05 12:52:01","2020-10-05 12:52:01","","0","","0","product","","0");
INSERT INTO posts VALUES("84","1","2020-10-05 12:52:00","2020-10-05 18:52:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Jeans 2-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Jeans 2-2","","","2020-10-05 12:54:20","2020-10-05 12:54:20","","0","","0","product","","0");
INSERT INTO posts VALUES("85","1","2020-10-05 12:54:00","2020-10-05 18:54:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","leggings 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","leggings 1","","","2020-10-05 12:55:50","2020-10-05 12:55:50","","0","","0","product","","0");
INSERT INTO posts VALUES("86","1","2020-10-05 12:56:00","2020-10-05 18:56:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","leggings 1-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","leggings 1-2","","","2020-10-05 12:57:29","2020-10-05 12:57:29","","0","","0","product","","0");
INSERT INTO posts VALUES("87","1","2020-10-05 12:57:00","2020-10-05 18:57:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","skirt 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","skirt 1","","","2020-10-05 12:58:50","2020-10-05 12:58:50","","0","","0","product","","0");
INSERT INTO posts VALUES("88","1","2020-10-05 12:59:00","2020-10-05 18:59:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","skirt 1-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","skirt 1-2","","","2020-10-05 13:01:06","2020-10-05 13:01:06","","0","","0","product","","0");
INSERT INTO posts VALUES("89","1","2020-10-05 13:01:00","2020-10-05 19:01:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","skirt 1-3","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","skirt 1-3","","","2020-10-05 13:02:33","2020-10-05 13:02:33","","0","","0","product","","0");
INSERT INTO posts VALUES("90","1","2020-10-05 13:03:00","2020-10-05 19:03:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Bras 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Bras 1","","","2020-10-05 13:05:04","2020-10-05 13:05:04","","0","","0","product","","0");
INSERT INTO posts VALUES("91","1","2020-10-05 13:05:00","2020-10-05 19:05:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Bras and Panties set 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Bras and Panties set 1","","","2020-10-05 13:06:56","2020-10-05 13:06:56","","0","","0","product","","0");
INSERT INTO posts VALUES("92","1","2020-10-05 13:07:00","2020-10-05 19:07:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Panties 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Panties 1","","","2020-10-05 13:08:24","2020-10-05 13:08:24","","0","","0","product","","0");
INSERT INTO posts VALUES("93","1","2020-10-05 13:09:00","2020-10-05 19:09:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Sleepwear 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Sleepwear 1","","","2020-10-05 13:10:51","2020-10-05 13:10:51","","0","","0","product","","0");
INSERT INTO posts VALUES("94","1","2020-10-05 13:12:00","2020-10-05 19:12:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Bracelet 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Bracelet 1","","","2020-10-05 13:13:46","2020-10-05 13:13:46","","0","","0","product","","0");
INSERT INTO posts VALUES("95","1","2020-10-05 13:13:00","2020-10-05 19:13:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Earring 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Earring 1","","","2020-10-05 13:15:06","2020-10-05 13:15:06","","0","","0","product","","0");
INSERT INTO posts VALUES("96","1","2020-10-05 13:15:00","2020-10-05 19:15:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Earring 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Earring 2","","","2020-10-05 13:17:38","2020-10-05 13:17:38","","0","","0","product","","0");
INSERT INTO posts VALUES("97","1","2020-10-05 13:17:00","2020-10-05 19:17:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Necklace 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Necklace 2","","","2020-10-05 13:19:07","2020-10-05 13:19:07","","0","","0","product","","0");
INSERT INTO posts VALUES("98","1","2020-10-05 13:19:00","2020-10-05 19:19:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Necklace 3","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Necklace 3","","","2020-10-05 13:21:31","2020-10-05 13:21:31","","0","","0","product","","0");
INSERT INTO posts VALUES("99","1","2020-10-05 13:22:00","2020-10-05 19:22:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 1","","","2020-10-05 13:23:58","2020-10-05 13:23:58","","0","","0","product","","0");
INSERT INTO posts VALUES("100","1","2020-10-05 13:24:00","2020-10-05 19:24:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 1-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 1-2","","","2020-10-05 13:25:17","2020-10-05 13:25:17","","0","","0","product","","0");
INSERT INTO posts VALUES("101","1","2020-10-05 13:26:00","2020-10-05 19:26:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 2","","","2020-10-05 13:28:10","2020-10-05 13:28:10","","0","","0","product","","0");
INSERT INTO posts VALUES("102","1","2020-10-05 13:28:00","2020-10-05 19:28:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 3","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 3","","","2020-10-05 13:29:35","2020-10-05 13:29:35","","0","","0","product","","0");
INSERT INTO posts VALUES("103","1","2020-10-05 13:29:00","2020-10-05 19:29:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 3-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 3-2","","","2020-10-05 13:30:57","2020-10-05 13:30:57","","0","","0","product","","0");
INSERT INTO posts VALUES("104","1","2020-10-05 13:31:00","2020-10-05 19:31:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 4","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 4","","","2020-10-05 13:32:41","2020-10-05 13:32:41","","0","","0","product","","0");
INSERT INTO posts VALUES("105","1","2020-10-05 13:33:00","2020-10-05 19:33:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Dresses 4-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Dresses 4-2","","","2020-10-05 13:34:35","2020-10-05 13:34:35","","0","","0","product","","0");
INSERT INTO posts VALUES("106","1","2020-10-05 13:34:00","2020-10-05 19:34:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 1","","","2020-10-05 13:39:01","2020-10-05 13:39:01","","0","","0","product","","0");
INSERT INTO posts VALUES("107","1","2020-10-05 13:39:00","2020-10-05 19:39:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 1-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 1-2","","","2020-10-05 13:41:39","2020-10-05 13:41:39","","0","","0","product","","0");
INSERT INTO posts VALUES("108","1","2020-10-05 13:41:00","2020-10-05 19:41:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 2","","","2020-10-05 13:42:55","2020-10-05 13:42:55","","0","","0","product","","0");
INSERT INTO posts VALUES("110","1","2020-10-05 13:44:00","2020-10-05 19:44:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 2-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 2-2","","","2020-10-05 13:47:05","2020-10-05 13:47:05","","0","","0","product","","0");
INSERT INTO posts VALUES("111","1","2020-10-05 13:47:00","2020-10-05 19:47:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 3","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 3","","","2020-10-05 13:48:09","2020-10-05 13:48:09","","0","","0","product","","0");
INSERT INTO posts VALUES("112","1","2020-10-05 13:48:00","2020-10-05 19:48:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 3-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 3-2","","","2020-10-05 13:49:08","2020-10-05 13:49:08","","0","","0","product","","0");
INSERT INTO posts VALUES("113","1","2020-10-05 13:49:00","2020-10-05 19:49:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 1","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 1","","","2020-10-05 13:51:17","2020-10-05 13:51:17","","0","","0","product","","0");
INSERT INTO posts VALUES("114","1","2020-10-05 13:51:00","2020-10-05 19:51:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 1-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 1-2","","","2020-10-05 13:52:40","2020-10-05 13:52:40","","0","","0","product","","0");
INSERT INTO posts VALUES("115","1","2020-10-05 13:53:00","2020-10-05 19:53:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tshirt 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tshirt 2","","","2020-10-05 13:54:42","2020-10-05 13:54:42","","0","","0","product","","0");
INSERT INTO posts VALUES("116","1","2020-10-05 13:58:00","2020-10-05 19:58:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 2","","","2020-10-05 13:59:50","2020-10-05 13:59:50","","0","","0","product","","0");
INSERT INTO posts VALUES("117","1","2020-10-05 13:59:00","2020-10-05 19:59:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 2-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 2-2","","","2020-10-05 14:01:36","2020-10-05 14:01:36","","0","","0","product","","0");
INSERT INTO posts VALUES("118","1","2020-10-05 14:01:00","2020-10-05 20:01:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 3","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 3","","","2020-10-05 14:02:37","2020-10-05 14:02:37","","0","","0","product","","0");
INSERT INTO posts VALUES("119","1","2020-10-05 14:02:00","2020-10-05 20:02:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 3-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 3-2","","","2020-10-05 14:04:08","2020-10-05 14:04:08","","0","","0","product","","0");
INSERT INTO posts VALUES("120","1","2020-10-05 14:04:00","2020-10-05 20:04:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 4","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 4","","","2020-10-05 14:05:50","2020-10-05 14:05:50","","0","","0","product","","0");
INSERT INTO posts VALUES("121","1","2020-10-05 14:06:00","2020-10-05 20:06:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 4-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 4-2","","","2020-10-05 14:07:19","2020-10-05 14:07:19","","0","","0","product","","0");
INSERT INTO posts VALUES("122","1","2020-10-05 14:07:00","2020-10-05 20:07:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 5","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 5","","","2020-10-05 14:08:25","2020-10-05 14:08:25","","0","","0","product","","0");
INSERT INTO posts VALUES("123","1","2020-10-05 14:08:00","2020-10-05 20:08:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","Tunic 5-2","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>","publish","open","open","","Tunic 5-2","","","2020-10-05 14:09:39","2020-10-05 14:09:39","","0","","0","product","","0");
INSERT INTO posts VALUES("174","1","2020-10-12 16:06:00","2020-10-12 22:06:00","<p>ccxzcxzc</p>","Tunic 5-3","<p>dfsfdsf</p>","publish","open","open","","Tunic 5-3","","","2020-10-12 16:08:09","2020-10-12 16:08:09","","0","","0","product","","0");
INSERT INTO posts VALUES("175","5","2020-10-15 00:00:00","2020-10-15 19:33:01","","Order2020-10-15 13:33:01","","delivered","open","open","order_1247","order-Oct-15-2020-1310","","","2020-10-22 17:17:49","2020-10-15 13:33:01","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("176","5","2020-10-15 00:00:00","2020-10-15 23:09:14","","Order2020-10-15 17:09:14","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:09:14","2020-10-15 17:09:14","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("177","5","2020-10-15 00:00:00","2020-10-15 23:19:21","","Order2020-10-15 17:19:21","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:19:21","2020-10-15 17:19:21","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("178","5","2020-10-15 00:00:00","2020-10-15 23:20:43","","Order2020-10-15 17:20:43","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:20:43","2020-10-15 17:20:43","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("179","5","2020-10-15 00:00:00","2020-10-15 23:21:28","","Order2020-10-15 17:21:28","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:21:28","2020-10-15 17:21:28","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("180","5","2020-10-15 00:00:00","2020-10-15 23:23:54","","Order2020-10-15 17:23:54","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:23:54","2020-10-15 17:23:54","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("181","5","2020-10-15 00:00:00","2020-10-15 23:24:39","","Order2020-10-15 17:24:39","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:24:39","2020-10-15 17:24:39","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("182","5","2020-10-15 00:00:00","2020-10-15 23:25:55","","Order2020-10-15 17:25:55","","on-hold","open","open","order_1247","order-Oct-15-2020-1710","","","2020-10-15 17:25:55","2020-10-15 17:25:55","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("169","2","2020-10-10 00:00:00","2020-10-10 23:35:00","some reason","Order2020-10-10 17:35:00","","delivered","open","open","order_1247","order-Oct-10-2020-1710","","","2020-10-17 10:59:17","2020-10-10 17:35:00","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("170","4","2020-10-10 00:00:00","2020-10-10 23:36:31","","Order2020-10-10 17:36:31","","cancelled","open","open","order_1247","order-Oct-10-2020-1710","","","2020-10-11 16:44:16","2020-10-10 17:36:31","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("171","5","2020-10-12 00:00:00","2020-10-12 20:52:19","","Order2020-10-12 14:52:19","","delivered","open","open","order_1247","order-Oct-12-2020-1410","","","2020-10-21 16:07:42","2020-10-12 14:52:19","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("172","5","2020-10-12 00:00:00","2020-10-12 21:20:17","","Order2020-10-12 15:20:17","","delivered","open","open","order_1247","order-Oct-12-2020-1510","","","2020-10-22 15:45:46","2020-10-12 15:20:17","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("183","5","2020-10-15 00:00:00","2020-10-16 00:06:45","","Order2020-10-15 18:06:45","","on-hold","open","open","order_1247","order-Oct-15-2020-1810","","","2020-10-15 18:06:45","2020-10-15 18:06:45","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("184","5","2020-10-17 00:00:00","2020-10-17 18:59:03","","Order2020-10-17 12:59:03","","on-hold","open","open","order_1247","order-Oct-17-2020-1210","","","2020-10-17 12:59:03","2020-10-17 12:59:03","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("185","0","2020-10-20 00:00:00","2020-10-20 18:35:37","","Order2020-10-20 12:35:37","","on-hold","open","open","order_1247","order-Oct-20-2020-1210","","","2020-10-20 12:35:37","2020-10-20 12:35:37","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("186","0","2020-10-21 00:00:00","2020-10-21 17:24:41","","Order2020-10-21 11:24:41","","on-hold","open","open","order_1247","order-Oct-21-2020-1110","","","2020-10-21 11:24:41","2020-10-21 11:24:41","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("187","2","2020-10-21 00:00:00","2020-10-21 18:22:20","","Order2020-10-21 12:22:20","","on-hold","open","open","order_1247","order-Oct-21-2020-1210","","","2020-10-21 12:22:20","2020-10-21 12:22:20","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("188","2","2020-10-21 00:00:00","2020-10-21 18:24:23","","Order2020-10-21 12:24:23","","on-hold","open","open","order_1247","order-Oct-21-2020-1210","","","2020-10-21 12:24:23","2020-10-21 12:24:23","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("165","2","2020-10-08 00:00:00","2020-10-08 22:59:58","","Order2020-10-08 16:59:58","","on-hold","open","open","order_1247","order-Oct-08-2020-1610","","","2020-10-08 16:59:58","2020-10-08 16:59:58","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("166","0","2020-10-10 00:00:00","2020-10-10 16:08:12","","Order2020-10-10 10:08:12","","on-hold","open","open","order_1247","order-Oct-10-2020-1010","","","2020-10-10 10:08:12","2020-10-10 10:08:12","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("189","2","2020-10-21 00:00:00","2020-10-21 18:59:59","","Order2020-10-21 12:59:59","","on-hold","open","open","order_1247","order-Oct-21-2020-1210","","","2020-10-21 12:59:59","2020-10-21 12:59:59","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("190","2","2020-10-21 00:00:00","2020-10-21 19:24:28","","Order2020-10-21 13:24:28","","on-hold","open","open","order_1247","order-Oct-21-2020-1310","","","2020-10-21 13:24:28","2020-10-21 13:24:28","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("191","2","2020-10-21 00:00:00","2020-10-21 19:32:37","","Order2020-10-21 13:32:37","","on-hold","open","open","order_1247","order-Oct-21-2020-1310","","","2020-10-21 13:32:37","2020-10-21 13:32:37","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("192","2","2020-10-21 00:00:00","2020-10-21 19:33:06","","Order2020-10-21 13:33:06","","on-hold","open","open","order_1247","order-Oct-21-2020-1310","","","2020-10-21 13:33:06","2020-10-21 13:33:06","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("193","2","2020-10-21 00:00:00","2020-10-21 19:34:00","","Order2020-10-21 13:34:00","","dispatch","open","open","order_1247","order-Oct-21-2020-1310","","","2020-10-21 16:07:21","2020-10-21 13:34:00","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("194","0","2020-10-22 00:00:00","2020-10-22 15:38:00","","Order2020-10-22 09:38:00","","dispatch","open","open","order_1247","order-Oct-22-2020-0910","","","2020-10-22 17:18:16","2020-10-22 09:38:00","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("195","2","2020-10-22 00:00:00","2020-10-22 15:43:42","","Order2020-10-22 09:43:42","","dispatch","open","open","order_1247","order-Oct-22-2020-0910","","","2020-10-22 15:45:37","2020-10-22 09:43:42","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("196","0","2020-10-24 00:00:00","2020-10-24 15:43:54","","Order2020-10-24 09:43:54","","on-hold","open","open","order_1247","order-Oct-24-2020-0910","","","2020-10-24 09:43:54","2020-10-24 09:43:54","","0","","0","shop_order","","0");



CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO roles VALUES("1","Admin","1","2020-10-24 15:40:40","2020-10-24 18:10:29");
INSERT INTO roles VALUES("2","Editor","1","2020-10-24 15:40:40","2020-10-27 11:40:23");



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




CREATE TABLE `term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_relationships VALUES("9","8","0");
INSERT INTO term_relationships VALUES("9","9","0");
INSERT INTO term_relationships VALUES("9","16","0");
INSERT INTO term_relationships VALUES("10","6","0");
INSERT INTO term_relationships VALUES("10","7","0");
INSERT INTO term_relationships VALUES("10","10","0");
INSERT INTO term_relationships VALUES("10","14","0");
INSERT INTO term_relationships VALUES("35","6","0");
INSERT INTO term_relationships VALUES("35","7","0");
INSERT INTO term_relationships VALUES("35","10","0");
INSERT INTO term_relationships VALUES("35","11","0");
INSERT INTO term_relationships VALUES("35","12","0");
INSERT INTO term_relationships VALUES("12","1","0");
INSERT INTO term_relationships VALUES("12","2","0");
INSERT INTO term_relationships VALUES("12","3","0");
INSERT INTO term_relationships VALUES("12","4","0");
INSERT INTO term_relationships VALUES("12","5","0");
INSERT INTO term_relationships VALUES("12","6","0");
INSERT INTO term_relationships VALUES("12","7","0");
INSERT INTO term_relationships VALUES("12","10","0");
INSERT INTO term_relationships VALUES("12","11","0");
INSERT INTO term_relationships VALUES("13","1","0");
INSERT INTO term_relationships VALUES("13","2","0");
INSERT INTO term_relationships VALUES("13","3","0");
INSERT INTO term_relationships VALUES("13","4","0");
INSERT INTO term_relationships VALUES("13","5","0");
INSERT INTO term_relationships VALUES("13","6","0");
INSERT INTO term_relationships VALUES("13","7","0");
INSERT INTO term_relationships VALUES("13","10","0");
INSERT INTO term_relationships VALUES("13","11","0");
INSERT INTO term_relationships VALUES("13","12","0");
INSERT INTO term_relationships VALUES("14","6","0");
INSERT INTO term_relationships VALUES("14","7","0");
INSERT INTO term_relationships VALUES("14","10","0");
INSERT INTO term_relationships VALUES("14","11","0");
INSERT INTO term_relationships VALUES("14","12","0");
INSERT INTO term_relationships VALUES("17","1","0");
INSERT INTO term_relationships VALUES("17","3","0");
INSERT INTO term_relationships VALUES("17","4","0");
INSERT INTO term_relationships VALUES("17","13","0");
INSERT INTO term_relationships VALUES("33","12","0");
INSERT INTO term_relationships VALUES("33","1","0");
INSERT INTO term_relationships VALUES("65","1","0");
INSERT INTO term_relationships VALUES("65","12","0");
INSERT INTO term_relationships VALUES("39","1","0");
INSERT INTO term_relationships VALUES("39","12","0");
INSERT INTO term_relationships VALUES("42","1","0");
INSERT INTO term_relationships VALUES("42","12","0");
INSERT INTO term_relationships VALUES("67","1","0");
INSERT INTO term_relationships VALUES("67","12","0");
INSERT INTO term_relationships VALUES("70","15","0");
INSERT INTO term_relationships VALUES("70","51","0");
INSERT INTO term_relationships VALUES("71","51","0");
INSERT INTO term_relationships VALUES("71","15","0");
INSERT INTO term_relationships VALUES("72","51","0");
INSERT INTO term_relationships VALUES("72","15","0");
INSERT INTO term_relationships VALUES("73","51","0");
INSERT INTO term_relationships VALUES("73","15","0");
INSERT INTO term_relationships VALUES("74","43","0");
INSERT INTO term_relationships VALUES("74","15","0");
INSERT INTO term_relationships VALUES("75","43","0");
INSERT INTO term_relationships VALUES("75","15","0");
INSERT INTO term_relationships VALUES("76","43","0");
INSERT INTO term_relationships VALUES("76","15","0");
INSERT INTO term_relationships VALUES("77","43","0");
INSERT INTO term_relationships VALUES("77","15","0");
INSERT INTO term_relationships VALUES("78","43","0");
INSERT INTO term_relationships VALUES("78","15","0");
INSERT INTO term_relationships VALUES("79","43","0");
INSERT INTO term_relationships VALUES("79","15","0");
INSERT INTO term_relationships VALUES("80","43","0");
INSERT INTO term_relationships VALUES("80","15","0");
INSERT INTO term_relationships VALUES("81","43","0");
INSERT INTO term_relationships VALUES("81","15","0");
INSERT INTO term_relationships VALUES("82","6","0");
INSERT INTO term_relationships VALUES("82","15","0");
INSERT INTO term_relationships VALUES("83","6","0");
INSERT INTO term_relationships VALUES("83","15","0");
INSERT INTO term_relationships VALUES("84","6","0");
INSERT INTO term_relationships VALUES("84","15","0");
INSERT INTO term_relationships VALUES("85","6","0");
INSERT INTO term_relationships VALUES("85","15","0");
INSERT INTO term_relationships VALUES("86","6","0");
INSERT INTO term_relationships VALUES("86","15","0");
INSERT INTO term_relationships VALUES("87","6","0");
INSERT INTO term_relationships VALUES("87","15","0");
INSERT INTO term_relationships VALUES("88","6","0");
INSERT INTO term_relationships VALUES("88","15","0");
INSERT INTO term_relationships VALUES("89","6","0");
INSERT INTO term_relationships VALUES("89","15","0");
INSERT INTO term_relationships VALUES("90","2","0");
INSERT INTO term_relationships VALUES("90","15","0");
INSERT INTO term_relationships VALUES("91","2","0");
INSERT INTO term_relationships VALUES("91","15","0");
INSERT INTO term_relationships VALUES("92","2","0");
INSERT INTO term_relationships VALUES("92","15","0");
INSERT INTO term_relationships VALUES("93","2","0");
INSERT INTO term_relationships VALUES("93","15","0");
INSERT INTO term_relationships VALUES("94","47","0");
INSERT INTO term_relationships VALUES("94","15","0");
INSERT INTO term_relationships VALUES("95","47","0");
INSERT INTO term_relationships VALUES("95","15","0");
INSERT INTO term_relationships VALUES("96","47","0");
INSERT INTO term_relationships VALUES("96","15","0");
INSERT INTO term_relationships VALUES("97","47","0");
INSERT INTO term_relationships VALUES("97","15","0");
INSERT INTO term_relationships VALUES("98","47","0");
INSERT INTO term_relationships VALUES("98","15","0");
INSERT INTO term_relationships VALUES("99","11","0");
INSERT INTO term_relationships VALUES("99","15","0");
INSERT INTO term_relationships VALUES("100","11","0");
INSERT INTO term_relationships VALUES("100","15","0");
INSERT INTO term_relationships VALUES("101","11","0");
INSERT INTO term_relationships VALUES("101","15","0");
INSERT INTO term_relationships VALUES("102","11","0");
INSERT INTO term_relationships VALUES("102","15","0");
INSERT INTO term_relationships VALUES("103","11","0");
INSERT INTO term_relationships VALUES("103","15","0");
INSERT INTO term_relationships VALUES("104","11","0");
INSERT INTO term_relationships VALUES("104","15","0");
INSERT INTO term_relationships VALUES("105","11","0");
INSERT INTO term_relationships VALUES("105","15","0");
INSERT INTO term_relationships VALUES("106","8","0");
INSERT INTO term_relationships VALUES("106","15","0");
INSERT INTO term_relationships VALUES("107","8","0");
INSERT INTO term_relationships VALUES("107","15","0");
INSERT INTO term_relationships VALUES("108","8","0");
INSERT INTO term_relationships VALUES("108","15","0");
INSERT INTO term_relationships VALUES("110","8","0");
INSERT INTO term_relationships VALUES("110","15","0");
INSERT INTO term_relationships VALUES("111","8","0");
INSERT INTO term_relationships VALUES("111","15","0");
INSERT INTO term_relationships VALUES("112","8","0");
INSERT INTO term_relationships VALUES("112","15","0");
INSERT INTO term_relationships VALUES("113","9","0");
INSERT INTO term_relationships VALUES("113","15","0");
INSERT INTO term_relationships VALUES("114","9","0");
INSERT INTO term_relationships VALUES("114","15","0");
INSERT INTO term_relationships VALUES("115","8","0");
INSERT INTO term_relationships VALUES("115","9","0");
INSERT INTO term_relationships VALUES("115","15","0");
INSERT INTO term_relationships VALUES("116","9","0");
INSERT INTO term_relationships VALUES("116","15","0");
INSERT INTO term_relationships VALUES("117","9","0");
INSERT INTO term_relationships VALUES("117","15","0");
INSERT INTO term_relationships VALUES("118","9","0");
INSERT INTO term_relationships VALUES("118","15","0");
INSERT INTO term_relationships VALUES("119","9","0");
INSERT INTO term_relationships VALUES("119","15","0");
INSERT INTO term_relationships VALUES("120","9","0");
INSERT INTO term_relationships VALUES("120","15","0");
INSERT INTO term_relationships VALUES("121","9","0");
INSERT INTO term_relationships VALUES("121","15","0");
INSERT INTO term_relationships VALUES("122","9","0");
INSERT INTO term_relationships VALUES("122","15","0");
INSERT INTO term_relationships VALUES("123","9","0");
INSERT INTO term_relationships VALUES("123","15","0");
INSERT INTO term_relationships VALUES("174","15","0");
INSERT INTO term_relationships VALUES("174","11","0");
INSERT INTO term_relationships VALUES("128","6","0");
INSERT INTO term_relationships VALUES("128","16","0");



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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO term_taxonomy VALUES("1","1","product_cat","","0","0","2020-09-26 16:40:42");
INSERT INTO term_taxonomy VALUES("2","2","product_cat","","0","0","2020-09-26 16:40:49");
INSERT INTO term_taxonomy VALUES("3","3","product_cat","","0","0","2020-09-26 16:40:54");
INSERT INTO term_taxonomy VALUES("4","4","product_cat","","0","0","2020-09-26 16:41:06");
INSERT INTO term_taxonomy VALUES("5","5","product_cat","","0","0","2020-09-26 16:41:12");
INSERT INTO term_taxonomy VALUES("6","6","product_cat","","0","0","2020-09-26 16:43:21");
INSERT INTO term_taxonomy VALUES("7","7","product_cat","","0","0","2020-09-26 16:43:25");
INSERT INTO term_taxonomy VALUES("8","8","product_cat","","0","0","2020-09-26 16:43:37");
INSERT INTO term_taxonomy VALUES("9","9","product_cat","","0","0","2020-09-26 16:43:45");
INSERT INTO term_taxonomy VALUES("10","10","product_cat","","0","0","2020-09-26 16:43:55");
INSERT INTO term_taxonomy VALUES("11","11","product_cat","","0","0","2020-09-26 16:44:31");
INSERT INTO term_taxonomy VALUES("12","12","product_tag","","0","0","2020-09-26 16:45:28");
INSERT INTO term_taxonomy VALUES("13","13","product_tag","","0","0","2020-09-26 16:45:34");
INSERT INTO term_taxonomy VALUES("14","14","product_tag","","0","0","2020-09-26 16:45:38");
INSERT INTO term_taxonomy VALUES("15","15","product_tag","","0","0","2020-09-26 16:45:43");
INSERT INTO term_taxonomy VALUES("16","16","product_tag","","0","0","2020-09-26 16:46:16");
INSERT INTO term_taxonomy VALUES("17","17","product_brand","","0","0","2020-09-26 16:47:07");
INSERT INTO term_taxonomy VALUES("18","18","product_brand","","0","0","2020-09-26 17:06:19");
INSERT INTO term_taxonomy VALUES("19","19","product_brand","","0","0","2020-09-26 17:16:26");
INSERT INTO term_taxonomy VALUES("20","20","product_brand","","0","0","2020-09-26 17:17:17");
INSERT INTO term_taxonomy VALUES("21","21","product_brand","","0","0","2020-09-26 17:17:57");
INSERT INTO term_taxonomy VALUES("22","22","product_brand","","0","0","2020-09-26 17:20:29");
INSERT INTO term_taxonomy VALUES("23","23","product_brand","","0","0","2020-09-26 17:21:15");
INSERT INTO term_taxonomy VALUES("24","24","product_brand","","0","0","2020-09-26 17:23:42");
INSERT INTO term_taxonomy VALUES("25","25","pa_color","","0","0","2020-09-27 13:23:09");
INSERT INTO term_taxonomy VALUES("26","26","pa_size","","0","0","2020-09-27 13:23:22");
INSERT INTO term_taxonomy VALUES("27","27","pa_inch","","0","0","2020-09-27 13:23:31");
INSERT INTO term_taxonomy VALUES("28","28","pa_color","","0","0","2020-09-27 13:24:41");
INSERT INTO term_taxonomy VALUES("29","29","pa_color","","0","0","2020-09-27 13:24:55");
INSERT INTO term_taxonomy VALUES("30","30","pa_size","","0","0","2020-09-27 13:25:08");
INSERT INTO term_taxonomy VALUES("31","31","pa_size","","0","0","2020-09-27 13:25:11");
INSERT INTO term_taxonomy VALUES("32","32","pa_size","","0","0","2020-09-27 13:25:15");
INSERT INTO term_taxonomy VALUES("33","33","pa_weight","","0","0","2020-09-27 13:25:27");
INSERT INTO term_taxonomy VALUES("34","34","pa_inch","","0","0","2020-09-27 13:25:37");
INSERT INTO term_taxonomy VALUES("35","35","pa_inch","","0","0","2020-09-27 13:25:40");
INSERT INTO term_taxonomy VALUES("36","36","pa_inch","","0","0","2020-09-27 13:25:42");
INSERT INTO term_taxonomy VALUES("37","37","pa_inch","","0","0","2020-09-27 13:25:45");
INSERT INTO term_taxonomy VALUES("38","38","pa_inch","","0","0","2020-09-27 13:25:47");
INSERT INTO term_taxonomy VALUES("40","40","product_cat","","0","0","2020-10-05 11:55:34");
INSERT INTO term_taxonomy VALUES("41","41","product_cat","","0","0","2020-10-05 11:55:41");
INSERT INTO term_taxonomy VALUES("42","42","product_cat","","0","0","2020-10-05 11:55:48");
INSERT INTO term_taxonomy VALUES("43","43","product_cat","","0","0","2020-10-05 11:55:59");
INSERT INTO term_taxonomy VALUES("44","44","product_cat","","0","0","2020-10-05 11:56:06");
INSERT INTO term_taxonomy VALUES("45","45","product_cat","","0","0","2020-10-05 11:56:13");
INSERT INTO term_taxonomy VALUES("46","46","product_cat","","0","0","2020-10-05 11:56:22");
INSERT INTO term_taxonomy VALUES("47","47","product_cat","","0","0","2020-10-05 11:56:33");
INSERT INTO term_taxonomy VALUES("48","48","product_cat","","0","0","2020-10-05 11:56:40");
INSERT INTO term_taxonomy VALUES("49","49","product_cat","","0","0","2020-10-05 11:56:47");
INSERT INTO term_taxonomy VALUES("50","50","product_cat","","0","0","2020-10-05 11:56:55");
INSERT INTO term_taxonomy VALUES("51","51","product_cat","","0","0","2020-10-05 11:57:05");
INSERT INTO term_taxonomy VALUES("52","52","product_cat","","0","0","2020-10-05 11:57:13");
INSERT INTO term_taxonomy VALUES("53","53","product_cat","","0","0","2020-10-05 11:57:20");
INSERT INTO term_taxonomy VALUES("54","54","product_cat","","0","0","2020-10-05 11:57:30");
INSERT INTO term_taxonomy VALUES("55","55","district","60","0","0","2020-10-06 15:29:47");
INSERT INTO term_taxonomy VALUES("56","56","district","120","0","0","2020-10-06 15:29:47");
INSERT INTO term_taxonomy VALUES("61","63","district","200","0","0","2020-10-18 13:40:04");
INSERT INTO term_taxonomy VALUES("102","98","postcode","9300","98","0","2020-10-19 11:15:04");
INSERT INTO term_taxonomy VALUES("101","98","city","","63","0","2020-10-19 11:15:04");
INSERT INTO term_taxonomy VALUES("99","97","city","","56","0","2020-10-19 11:13:49");
INSERT INTO term_taxonomy VALUES("100","97","postcode","3330-337456","97","0","2020-10-19 11:13:49");
INSERT INTO term_taxonomy VALUES("98","96","postcode","45671","96","0","2020-10-19 11:11:34");
INSERT INTO term_taxonomy VALUES("97","96","city","","56","0","2020-10-19 11:11:34");
INSERT INTO term_taxonomy VALUES("96","95","postcode","4567","95","0","2020-10-19 11:09:47");
INSERT INTO term_taxonomy VALUES("95","95","city","","55","0","2020-10-19 11:09:47");
INSERT INTO term_taxonomy VALUES("93","94","city","","55","0","2020-10-19 11:05:06");
INSERT INTO term_taxonomy VALUES("94","94","postcode","123","94","0","2020-10-19 11:05:06");



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
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO terms VALUES("1","Bras","bras","0","1","2020-09-26 16:40:42");
INSERT INTO terms VALUES("2","Bras & Sleepwear","bras-sleepwear","0","1","2020-09-26 16:40:49");
INSERT INTO terms VALUES("3","Legging & pyjamas","legging-pyjamas","0","1","2020-09-26 16:40:54");
INSERT INTO terms VALUES("4","Jeans","jeans","0","1","2020-09-26 16:41:06");
INSERT INTO terms VALUES("5","Skirts","skirts","0","1","2020-09-26 16:41:12");
INSERT INTO terms VALUES("6","Bottoms","bottoms","0","1","2020-09-26 16:43:21");
INSERT INTO terms VALUES("7","Tank Tops","tank-tops","0","1","2020-09-26 16:43:25");
INSERT INTO terms VALUES("8","T-Shirts","t-shirts","0","1","2020-09-26 16:43:37");
INSERT INTO terms VALUES("9","Tunic & shirts","tunic-shirts","0","1","2020-09-26 16:43:45");
INSERT INTO terms VALUES("10","Dresses","dresses","0","1","2020-09-26 16:43:55");
INSERT INTO terms VALUES("11","Tops","tops","0","1","2020-09-26 16:44:31");
INSERT INTO terms VALUES("15","Women","women","0","1","2020-09-26 16:45:43");
INSERT INTO terms VALUES("16","Men","men","0","1","2020-09-26 16:46:16");
INSERT INTO terms VALUES("17","Samsung","samsung","0","1","2020-09-26 16:47:07");
INSERT INTO terms VALUES("18","Dell","dell","0","1","2020-09-26 17:06:19");
INSERT INTO terms VALUES("19","Apple","apple","0","1","2020-09-26 17:16:26");
INSERT INTO terms VALUES("20","Sony","sony","0","1","2020-09-26 17:17:17");
INSERT INTO terms VALUES("21","Lenovo","lenovo","0","1","2020-09-26 17:17:57");
INSERT INTO terms VALUES("22","HTC","htc","0","1","2020-09-26 17:20:29");
INSERT INTO terms VALUES("23","Xiaomi","xiaomi","0","1","2020-09-26 17:21:15");
INSERT INTO terms VALUES("24","OnePlus","oneplus","0","1","2020-09-26 17:23:42");
INSERT INTO terms VALUES("25","Blue","blue","0","1","2020-09-27 13:23:09");
INSERT INTO terms VALUES("26","Xl","xl","0","1","2020-09-27 13:23:22");
INSERT INTO terms VALUES("27","5","5","0","1","2020-09-27 13:23:31");
INSERT INTO terms VALUES("28","Red","red","0","1","2020-09-27 13:24:41");
INSERT INTO terms VALUES("29","Yellow","yellow","0","1","2020-09-27 13:24:55");
INSERT INTO terms VALUES("30","M","m","0","1","2020-09-27 13:25:08");
INSERT INTO terms VALUES("31","S","s","0","1","2020-09-27 13:25:11");
INSERT INTO terms VALUES("32","L","l","0","1","2020-09-27 13:25:15");
INSERT INTO terms VALUES("33","Kg","kg","0","1","2020-09-27 13:25:27");
INSERT INTO terms VALUES("34","5","5","0","1","2020-09-27 13:25:37");
INSERT INTO terms VALUES("35","1","1","0","1","2020-09-27 13:25:40");
INSERT INTO terms VALUES("36","2","2","0","1","2020-09-27 13:25:42");
INSERT INTO terms VALUES("37","3","3","0","1","2020-09-27 13:25:45");
INSERT INTO terms VALUES("38","4","4","0","1","2020-09-27 13:25:47");
INSERT INTO terms VALUES("68","45456","","0","1","2020-10-18 14:16:29");
INSERT INTO terms VALUES("40","Panties","panties","0","1","2020-10-05 11:55:34");
INSERT INTO terms VALUES("41","Bra & Panties Sets","bra-panties-sets","0","1","2020-10-05 11:55:41");
INSERT INTO terms VALUES("42","Sleepwear","sleepwear","0","1","2020-10-05 11:55:48");
INSERT INTO terms VALUES("43","Bags","bags","0","1","2020-10-05 11:55:59");
INSERT INTO terms VALUES("44","Tote Bags","tote-bags","0","1","2020-10-05 11:56:06");
INSERT INTO terms VALUES("45","Crossbody Bags","crossbody-bags","0","1","2020-10-05 11:56:13");
INSERT INTO terms VALUES("46","Purses","purses","0","1","2020-10-05 11:56:22");
INSERT INTO terms VALUES("47","Jewellery","jewellery","0","1","2020-10-05 11:56:33");
INSERT INTO terms VALUES("48","Earrings","earrings","0","1","2020-10-05 11:56:40");
INSERT INTO terms VALUES("49","Necklaces","necklaces","0","1","2020-10-05 11:56:47");
INSERT INTO terms VALUES("50","Bracelets","bracelets","0","1","2020-10-05 11:56:55");
INSERT INTO terms VALUES("51","Accessories","accessories","0","1","2020-10-05 11:57:05");
INSERT INTO terms VALUES("52","Sunglasses","sunglasses","0","1","2020-10-05 11:57:13");
INSERT INTO terms VALUES("53","Scarves","scarves","0","1","2020-10-05 11:57:20");
INSERT INTO terms VALUES("54","Belts","belts","0","1","2020-10-05 11:57:30");
INSERT INTO terms VALUES("55","Dhaka","dhaka","0","1","2020-10-06 15:27:38");
INSERT INTO terms VALUES("56","Sylhet","sylhet","0","1","2020-10-06 15:27:38");
INSERT INTO terms VALUES("71","test","test","0","1","2020-10-18 15:02:59");
INSERT INTO terms VALUES("59","1230","1230","0","1","2020-10-06 16:45:36");
INSERT INTO terms VALUES("60","1212","1212","0","1","2020-10-06 16:45:36");
INSERT INTO terms VALUES("72","5678","","0","1","2020-10-18 15:04:36");
INSERT INTO terms VALUES("63","Bagerhat","bagerhat","0","1","2020-10-18 13:40:04");
INSERT INTO terms VALUES("73","test 2","test 2","0","1","2020-10-18 15:14:56");
INSERT INTO terms VALUES("65","4567","","0","1","2020-10-18 14:09:12");
INSERT INTO terms VALUES("69","34555","","0","1","2020-10-18 14:18:59");
INSERT INTO terms VALUES("70","5","","0","1","2020-10-18 14:33:41");
INSERT INTO terms VALUES("74","234324","","0","1","2020-10-18 15:16:05");
INSERT INTO terms VALUES("75","Uttara","uttara","0","1","2020-10-18 15:17:11");
INSERT INTO terms VALUES("76","1234","","0","1","2020-10-18 15:17:17");
INSERT INTO terms VALUES("77","khilkhet","khilkhet","0","1","2020-10-18 16:19:36");
INSERT INTO terms VALUES("78","Uttara5345","uttara","0","1","2020-10-18 16:33:27");
INSERT INTO terms VALUES("79","123457","","0","1","2020-10-18 16:33:27");
INSERT INTO terms VALUES("80","kk","kk","0","1","2020-10-18 16:36:56");
INSERT INTO terms VALUES("81","12","","0","1","2020-10-18 16:36:56");
INSERT INTO terms VALUES("82","456","","0","1","2020-10-18 16:44:16");
INSERT INTO terms VALUES("83","kadamtali","kadamtali","0","1","2020-10-18 16:44:43");
INSERT INTO terms VALUES("84","34","","0","1","2020-10-18 16:52:18");
INSERT INTO terms VALUES("85","34534543","","0","1","2020-10-18 16:52:36");
INSERT INTO terms VALUES("86","test4353","test4353","0","1","2020-10-19 10:39:59");
INSERT INTO terms VALUES("87","r","r","0","1","2020-10-19 10:42:46");
INSERT INTO terms VALUES("88","123","","0","1","2020-10-19 10:42:46");
INSERT INTO terms VALUES("89","kuril","kuril","0","1","2020-10-19 10:48:44");
INSERT INTO terms VALUES("90","0000","","0","1","2020-10-19 10:48:44");
INSERT INTO terms VALUES("91","b","b","0","1","2020-10-19 10:54:06");
INSERT INTO terms VALUES("92","123","","0","1","2020-10-19 10:54:06");
INSERT INTO terms VALUES("93","rteee","rteee","0","1","2020-10-19 10:57:33");
INSERT INTO terms VALUES("94","badda","badda","0","1","2020-10-19 11:05:06");
INSERT INTO terms VALUES("95","kuril","kuril","0","1","2020-10-19 11:09:47");
INSERT INTO terms VALUES("96","Kadamtali","kadamtali","0","1","2020-10-19 11:11:34");
INSERT INTO terms VALUES("97","Habiganj1","habiganj1","0","1","2020-10-19 11:13:49");
INSERT INTO terms VALUES("98","bagerhat police line","bagerhat police line","0","1","2020-10-19 11:15:04");



CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO usermeta VALUES("277","5","district","55");
INSERT INTO usermeta VALUES("275","5","user_image","");
INSERT INTO usermeta VALUES("206","2","user_image","1601189730.png");
INSERT INTO usermeta VALUES("323","2","zip","3330-337456");
INSERT INTO usermeta VALUES("322","2","city","97");
INSERT INTO usermeta VALUES("203","2","state","");
INSERT INTO usermeta VALUES("202","2","country","");
INSERT INTO usermeta VALUES("200","2","address_two","");
INSERT INTO usermeta VALUES("201","2","phone","6789");
INSERT INTO usermeta VALUES("41","3","phone","4354354");
INSERT INTO usermeta VALUES("40","3","address_two","retretret");
INSERT INTO usermeta VALUES("39","3","address_one","retretre");
INSERT INTO usermeta VALUES("38","3","last_name","user 2");
INSERT INTO usermeta VALUES("37","3","first_name","user 2");
INSERT INTO usermeta VALUES("42","3","country","BD");
INSERT INTO usermeta VALUES("43","3","state","Bangladesh");
INSERT INTO usermeta VALUES("44","3","city","Dhaka");
INSERT INTO usermeta VALUES("45","3","zip","342543543");
INSERT INTO usermeta VALUES("197","2","first_name","Demo");
INSERT INTO usermeta VALUES("198","2","last_name","Demo");
INSERT INTO usermeta VALUES("320","2","address_one","Uttara");
INSERT INTO usermeta VALUES("279","5","zip","1230");
INSERT INTO usermeta VALUES("278","5","city","57");
INSERT INTO usermeta VALUES("325","0","district","56");
INSERT INTO usermeta VALUES("324","0","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("267","5","last_name","Rahman");
INSERT INTO usermeta VALUES("276","5","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("269","5","address_two","");
INSERT INTO usermeta VALUES("270","5","phone","3453453457");
INSERT INTO usermeta VALUES("266","5","first_name","Saiful");
INSERT INTO usermeta VALUES("321","2","district","56");
INSERT INTO usermeta VALUES("326","0","city","97");
INSERT INTO usermeta VALUES("327","0","zip","3330-337456");



CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("2","Demo","demo@email.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","1","2020-09-13 11:06:20","2020-09-13 11:06:20");
INSERT INTO users VALUES("3","user 2","user2@email.com","","$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa","","1","2020-09-19 15:08:42","2020-09-19 15:08:42");
INSERT INTO users VALUES("4","two","demo2@email.com","","$2y$10$CPpwMvysSAFba5JXSUeFjukBbpm93AEF/YSQ2fqBTJmATeUFK1I8m","","1","2020-10-10 17:35:46","2020-10-10 17:35:46");
INSERT INTO users VALUES("5","Saiful","parthokar90@gmail.com","","$2y$10$Bn27rHbbtyo6KVbBWd97yuQ2PJJQVBbgW3YYcmNmd0YfGU2cC1tMa","","1","2020-10-12 14:50:40","2020-10-12 14:50:40");



CREATE TABLE `webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;




CREATE TABLE `wishlist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO wishlist VALUES("2","2","74","","");



CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


