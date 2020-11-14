

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

INSERT INTO admins VALUES("2","Admin","admin@email.com","$2y$10$kWxHZoXuhxBiFY/vdokU0u9REwpd7EWV7kekYFaS6Kd9ro6fLwK4S","65756756","1","1","2020-10-28 18:11:44","2020-11-11 17:51:38");
INSERT INTO admins VALUES("4","Sohel Mia","s@email.com","$2y$10$XVZhNo8As133cCSEK6pNF.wHx2Ipy9D1SNmxtvs.rqxQAL1gDCeXq","","3","1","2020-11-03 15:34:08","2020-11-11 17:51:50");



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



CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","4567","500","2020-11-09","1","2020-11-07 15:17:28","2020-11-07 15:17:28");
INSERT INTO coupons VALUES("2","12","300","2020-11-14","1","2020-11-08 10:58:38","2020-11-08 10:58:41");



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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_itemmeta VALUES("1","1","_tax_class","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("2","1","_qty","3","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("3","1","_product_id","262","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("4","1","_variation_id","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("5","1","_line_subtotal","9000","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("6","1","_line_total","9000","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("7","1","_line_subtotal_tax","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("8","1","_line_tax","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("9","1","_line_tax_data","2020-11-14 22:04:50","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("10","1","delivery_charge","600","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("11","1","coupon_code","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("12","1","coupon_taka","0","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("13","2","_tax_class","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("14","2","_qty","2","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("15","2","_product_id","263","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("16","2","_variation_id","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("17","2","_line_subtotal","6000","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("18","2","_line_total","6000","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("19","2","_line_subtotal_tax","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("20","2","_line_tax","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("21","2","_line_tax_data","2020-11-14 22:04:50","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("22","2","delivery_charge","600","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("23","2","coupon_code","","264","2020-11-14","2");
INSERT INTO order_itemmeta VALUES("24","2","coupon_taka","0","264","2020-11-14","2");



CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO order_items VALUES("1","Demo","line-item","262","264");
INSERT INTO order_items VALUES("2","Test","line-item","263","264");



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
) ENGINE=MyISAM AUTO_INCREMENT=676 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO postmeta VALUES("640","262","alert_qty","34");
INSERT INTO postmeta VALUES("641","262","product_stock","2000");
INSERT INTO postmeta VALUES("639","262","qty","61");
INSERT INTO postmeta VALUES("638","262","height","");
INSERT INTO postmeta VALUES("637","262","width","");
INSERT INTO postmeta VALUES("636","262","length","");
INSERT INTO postmeta VALUES("635","262","weight","");
INSERT INTO postmeta VALUES("634","262","sale_price","3000");
INSERT INTO postmeta VALUES("633","262","regular_price","5000");
INSERT INTO postmeta VALUES("632","262","stock_status","instock");
INSERT INTO postmeta VALUES("631","262","default_attribute","[{"taxonomy":"pa_color","term":"Blue","term_id":25}]");
INSERT INTO postmeta VALUES("16","223","first_name","Guest");
INSERT INTO postmeta VALUES("17","223","last_name","Guest");
INSERT INTO postmeta VALUES("18","223","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("19","223","address_two","");
INSERT INTO postmeta VALUES("20","223","phone","0000000001");
INSERT INTO postmeta VALUES("21","223","email","guest@email.com");
INSERT INTO postmeta VALUES("22","223","country","Bangladesh");
INSERT INTO postmeta VALUES("23","223","state","Dhaka");
INSERT INTO postmeta VALUES("24","223","city","kuril");
INSERT INTO postmeta VALUES("25","223","zip","4567");
INSERT INTO postmeta VALUES("26","223","_customer_user","0");
INSERT INTO postmeta VALUES("27","223","_billing_postcode","4567");
INSERT INTO postmeta VALUES("28","223","_billing_company","");
INSERT INTO postmeta VALUES("29","223","_billing_last_name","");
INSERT INTO postmeta VALUES("30","223","_billing_first_name","");
INSERT INTO postmeta VALUES("31","223","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("32","224","first_name","Demo");
INSERT INTO postmeta VALUES("33","224","last_name","Demo");
INSERT INTO postmeta VALUES("34","224","address_one","Uttara");
INSERT INTO postmeta VALUES("35","224","address_two","");
INSERT INTO postmeta VALUES("36","224","phone","6789");
INSERT INTO postmeta VALUES("37","224","email","demo@email.com");
INSERT INTO postmeta VALUES("38","224","country","Bangladesh");
INSERT INTO postmeta VALUES("39","224","state","Dhaka");
INSERT INTO postmeta VALUES("40","224","city","kuril");
INSERT INTO postmeta VALUES("41","224","zip","kuril");
INSERT INTO postmeta VALUES("42","224","_customer_user","2");
INSERT INTO postmeta VALUES("43","224","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("44","224","_billing_company","");
INSERT INTO postmeta VALUES("45","224","_billing_last_name","");
INSERT INTO postmeta VALUES("46","224","_billing_first_name","");
INSERT INTO postmeta VALUES("47","224","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("48","224","processing_date","2020-11-04");
INSERT INTO postmeta VALUES("49","225","first_name","Demo");
INSERT INTO postmeta VALUES("50","225","last_name","Demo");
INSERT INTO postmeta VALUES("51","225","address_one","Uttara");
INSERT INTO postmeta VALUES("52","225","address_two","");
INSERT INTO postmeta VALUES("53","225","phone","6789");
INSERT INTO postmeta VALUES("54","225","email","demo@email.com");
INSERT INTO postmeta VALUES("55","225","country","Bangladesh");
INSERT INTO postmeta VALUES("56","225","state","Dhaka");
INSERT INTO postmeta VALUES("57","225","city","kuril");
INSERT INTO postmeta VALUES("58","225","zip","kuril");
INSERT INTO postmeta VALUES("59","225","_customer_user","2");
INSERT INTO postmeta VALUES("60","225","_billing_postcode","kuril");
INSERT INTO postmeta VALUES("61","225","_billing_company","");
INSERT INTO postmeta VALUES("62","225","_billing_last_name","");
INSERT INTO postmeta VALUES("63","225","_billing_first_name","");
INSERT INTO postmeta VALUES("64","225","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("65","225","processing_date","2020-11-05");
INSERT INTO postmeta VALUES("66","223","processing_date","2020-11-05");
INSERT INTO postmeta VALUES("657","263","_sku","22612802419111604551889");
INSERT INTO postmeta VALUES("656","263","start_stock","2000");
INSERT INTO postmeta VALUES("655","263","product_stock","2000");
INSERT INTO postmeta VALUES("654","263","alert_qty","40");
INSERT INTO postmeta VALUES("653","263","qty","6");
INSERT INTO postmeta VALUES("652","263","height","");
INSERT INTO postmeta VALUES("651","263","width","");
INSERT INTO postmeta VALUES("650","263","length","");
INSERT INTO postmeta VALUES("648","263","sale_price","3000");
INSERT INTO postmeta VALUES("649","263","weight","");
INSERT INTO postmeta VALUES("646","263","stock_status","instock");
INSERT INTO postmeta VALUES("647","263","regular_price","5000");
INSERT INTO postmeta VALUES("82","227","banner_image","1604562118.png");
INSERT INTO postmeta VALUES("83","228","first_name","Partho");
INSERT INTO postmeta VALUES("84","228","last_name","Guest");
INSERT INTO postmeta VALUES("85","228","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("86","228","address_two","");
INSERT INTO postmeta VALUES("87","228","phone","0000000001");
INSERT INTO postmeta VALUES("88","228","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("89","228","country","Bangladesh");
INSERT INTO postmeta VALUES("90","228","state","Dhaka");
INSERT INTO postmeta VALUES("91","228","city","kuril");
INSERT INTO postmeta VALUES("92","228","zip","4567");
INSERT INTO postmeta VALUES("93","228","_customer_user","23");
INSERT INTO postmeta VALUES("94","228","_billing_postcode","4567");
INSERT INTO postmeta VALUES("95","228","_billing_company","");
INSERT INTO postmeta VALUES("96","228","_billing_last_name","");
INSERT INTO postmeta VALUES("97","228","_billing_first_name","");
INSERT INTO postmeta VALUES("98","228","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("99","229","first_name","Partho");
INSERT INTO postmeta VALUES("100","229","last_name","Guest");
INSERT INTO postmeta VALUES("101","229","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("102","229","address_two","");
INSERT INTO postmeta VALUES("103","229","phone","0000000001");
INSERT INTO postmeta VALUES("104","229","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("105","229","country","Bangladesh");
INSERT INTO postmeta VALUES("106","229","state","Dhaka");
INSERT INTO postmeta VALUES("107","229","city","kuril");
INSERT INTO postmeta VALUES("108","229","zip","4567");
INSERT INTO postmeta VALUES("109","229","_customer_user","23");
INSERT INTO postmeta VALUES("110","229","_billing_postcode","4567");
INSERT INTO postmeta VALUES("111","229","_billing_company","");
INSERT INTO postmeta VALUES("112","229","_billing_last_name","");
INSERT INTO postmeta VALUES("113","229","_billing_first_name","");
INSERT INTO postmeta VALUES("114","229","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("115","229","processing_date","2020-11-07");
INSERT INTO postmeta VALUES("116","228","processing_date","2020-11-07");
INSERT INTO postmeta VALUES("117","230","first_name","Partho");
INSERT INTO postmeta VALUES("118","230","last_name","Guest");
INSERT INTO postmeta VALUES("119","230","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("120","230","address_two","");
INSERT INTO postmeta VALUES("121","230","phone","0000000001");
INSERT INTO postmeta VALUES("122","230","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("123","230","country","Bangladesh");
INSERT INTO postmeta VALUES("124","230","state","Bagerhat");
INSERT INTO postmeta VALUES("125","230","city","bagerhat police line");
INSERT INTO postmeta VALUES("126","230","zip","9300");
INSERT INTO postmeta VALUES("127","230","_customer_user","23");
INSERT INTO postmeta VALUES("128","230","_billing_postcode","9300");
INSERT INTO postmeta VALUES("129","230","_billing_company","");
INSERT INTO postmeta VALUES("130","230","_billing_last_name","");
INSERT INTO postmeta VALUES("131","230","_billing_first_name","");
INSERT INTO postmeta VALUES("132","230","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("133","230","processing_date","2020-11-07");
INSERT INTO postmeta VALUES("645","263","default_attribute","[{"taxonomy":"pa_color","term":"Blue","term_id":25},{"taxonomy":"pa_size","term":"Xl","term_id":26}]");
INSERT INTO postmeta VALUES("148","232","first_name","Guest");
INSERT INTO postmeta VALUES("149","232","last_name","Guest");
INSERT INTO postmeta VALUES("150","232","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("151","232","address_two","");
INSERT INTO postmeta VALUES("152","232","phone","0000000001");
INSERT INTO postmeta VALUES("153","232","email","guest@email.com");
INSERT INTO postmeta VALUES("154","232","country","Bangladesh");
INSERT INTO postmeta VALUES("155","232","state","Dhaka");
INSERT INTO postmeta VALUES("156","232","city","kuril");
INSERT INTO postmeta VALUES("157","232","zip","4567");
INSERT INTO postmeta VALUES("158","232","_customer_user","0");
INSERT INTO postmeta VALUES("159","232","_billing_postcode","4567");
INSERT INTO postmeta VALUES("160","232","_billing_company","");
INSERT INTO postmeta VALUES("161","232","_billing_last_name","");
INSERT INTO postmeta VALUES("162","232","_billing_first_name","");
INSERT INTO postmeta VALUES("163","232","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("164","233","first_name","Guest");
INSERT INTO postmeta VALUES("165","233","last_name","Guest");
INSERT INTO postmeta VALUES("166","233","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("167","233","address_two","");
INSERT INTO postmeta VALUES("168","233","phone","0000000001");
INSERT INTO postmeta VALUES("169","233","email","guest@email.com");
INSERT INTO postmeta VALUES("170","233","country","Bangladesh");
INSERT INTO postmeta VALUES("171","233","state","Dhaka");
INSERT INTO postmeta VALUES("172","233","city","kuril");
INSERT INTO postmeta VALUES("173","233","zip","4567");
INSERT INTO postmeta VALUES("174","233","_customer_user","0");
INSERT INTO postmeta VALUES("175","233","_billing_postcode","4567");
INSERT INTO postmeta VALUES("176","233","_billing_company","");
INSERT INTO postmeta VALUES("177","233","_billing_last_name","");
INSERT INTO postmeta VALUES("178","233","_billing_first_name","");
INSERT INTO postmeta VALUES("179","233","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("180","234","first_name","Guest");
INSERT INTO postmeta VALUES("181","234","last_name","Guest");
INSERT INTO postmeta VALUES("182","234","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("183","234","address_two","");
INSERT INTO postmeta VALUES("184","234","phone","0000000001");
INSERT INTO postmeta VALUES("185","234","email","guest@email.com");
INSERT INTO postmeta VALUES("186","234","country","Bangladesh");
INSERT INTO postmeta VALUES("187","234","state","Dhaka");
INSERT INTO postmeta VALUES("188","234","city","kuril");
INSERT INTO postmeta VALUES("189","234","zip","4567");
INSERT INTO postmeta VALUES("190","234","_customer_user","0");
INSERT INTO postmeta VALUES("191","234","_billing_postcode","4567");
INSERT INTO postmeta VALUES("192","234","_billing_company","");
INSERT INTO postmeta VALUES("193","234","_billing_last_name","");
INSERT INTO postmeta VALUES("194","234","_billing_first_name","");
INSERT INTO postmeta VALUES("195","234","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("196","235","first_name","Demo");
INSERT INTO postmeta VALUES("197","235","last_name","Demo");
INSERT INTO postmeta VALUES("198","235","address_one","Uttara");
INSERT INTO postmeta VALUES("199","235","address_two","");
INSERT INTO postmeta VALUES("200","235","phone","6789");
INSERT INTO postmeta VALUES("201","235","email","demo@email.com");
INSERT INTO postmeta VALUES("202","235","country","Bangladesh");
INSERT INTO postmeta VALUES("203","235","state","Dhaka");
INSERT INTO postmeta VALUES("204","235","city","kuril");
INSERT INTO postmeta VALUES("205","235","zip","4567");
INSERT INTO postmeta VALUES("206","235","_customer_user","2");
INSERT INTO postmeta VALUES("207","235","_billing_postcode","4567");
INSERT INTO postmeta VALUES("208","235","_billing_company","");
INSERT INTO postmeta VALUES("209","235","_billing_last_name","");
INSERT INTO postmeta VALUES("210","235","_billing_first_name","");
INSERT INTO postmeta VALUES("211","235","payment_method","DeliveryChargeOnly");
INSERT INTO postmeta VALUES("212","236","first_name","Demo");
INSERT INTO postmeta VALUES("213","236","last_name","Demo");
INSERT INTO postmeta VALUES("214","236","address_one","Uttara");
INSERT INTO postmeta VALUES("215","236","address_two","");
INSERT INTO postmeta VALUES("216","236","phone","6789");
INSERT INTO postmeta VALUES("217","236","email","demo@email.com");
INSERT INTO postmeta VALUES("218","236","country","Bangladesh");
INSERT INTO postmeta VALUES("219","236","state","Sylhet");
INSERT INTO postmeta VALUES("220","236","city","Habiganj1");
INSERT INTO postmeta VALUES("221","236","zip","3330-337456");
INSERT INTO postmeta VALUES("222","236","_customer_user","2");
INSERT INTO postmeta VALUES("223","236","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("224","236","_billing_company","");
INSERT INTO postmeta VALUES("225","236","_billing_last_name","");
INSERT INTO postmeta VALUES("226","236","_billing_first_name","");
INSERT INTO postmeta VALUES("227","236","payment_method","FullPayment");
INSERT INTO postmeta VALUES("228","237","first_name","Demo");
INSERT INTO postmeta VALUES("229","237","last_name","Demo");
INSERT INTO postmeta VALUES("230","237","address_one","Uttara");
INSERT INTO postmeta VALUES("231","237","address_two","");
INSERT INTO postmeta VALUES("232","237","phone","6789");
INSERT INTO postmeta VALUES("233","237","email","demo@email.com");
INSERT INTO postmeta VALUES("234","237","country","Bangladesh");
INSERT INTO postmeta VALUES("235","237","state","Dhaka");
INSERT INTO postmeta VALUES("236","237","city","kuril");
INSERT INTO postmeta VALUES("237","237","zip","4567");
INSERT INTO postmeta VALUES("238","237","_customer_user","2");
INSERT INTO postmeta VALUES("291","240","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("290","240","_billing_first_name","");
INSERT INTO postmeta VALUES("289","240","_billing_last_name","");
INSERT INTO postmeta VALUES("288","240","_billing_company","");
INSERT INTO postmeta VALUES("287","240","_billing_postcode","4567");
INSERT INTO postmeta VALUES("286","240","_customer_user","2");
INSERT INTO postmeta VALUES("285","240","zip","4567");
INSERT INTO postmeta VALUES("284","240","city","kuril");
INSERT INTO postmeta VALUES("283","240","state","Dhaka");
INSERT INTO postmeta VALUES("282","240","country","Bangladesh");
INSERT INTO postmeta VALUES("281","240","email","demo@email.com");
INSERT INTO postmeta VALUES("280","240","phone","6789");
INSERT INTO postmeta VALUES("279","240","address_two","");
INSERT INTO postmeta VALUES("278","240","address_one","Uttara");
INSERT INTO postmeta VALUES("277","240","last_name","Demo");
INSERT INTO postmeta VALUES("276","240","first_name","Demo");
INSERT INTO postmeta VALUES("292","241","first_name","Demo");
INSERT INTO postmeta VALUES("293","241","last_name","Demo");
INSERT INTO postmeta VALUES("294","241","address_one","Uttara");
INSERT INTO postmeta VALUES("295","241","address_two","");
INSERT INTO postmeta VALUES("296","241","phone","6789");
INSERT INTO postmeta VALUES("297","241","email","demo@email.com");
INSERT INTO postmeta VALUES("298","241","country","Bangladesh");
INSERT INTO postmeta VALUES("299","241","state","Dhaka");
INSERT INTO postmeta VALUES("300","241","city","kuril");
INSERT INTO postmeta VALUES("301","241","zip","4567");
INSERT INTO postmeta VALUES("302","241","_customer_user","2");
INSERT INTO postmeta VALUES("303","241","_billing_postcode","4567");
INSERT INTO postmeta VALUES("304","241","_billing_company","");
INSERT INTO postmeta VALUES("305","241","_billing_last_name","");
INSERT INTO postmeta VALUES("306","241","_billing_first_name","");
INSERT INTO postmeta VALUES("307","241","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("308","242","first_name","Demo");
INSERT INTO postmeta VALUES("309","242","last_name","Demo");
INSERT INTO postmeta VALUES("310","242","address_one","Uttara");
INSERT INTO postmeta VALUES("311","242","address_two","");
INSERT INTO postmeta VALUES("312","242","phone","6789");
INSERT INTO postmeta VALUES("313","242","email","demo@email.com");
INSERT INTO postmeta VALUES("314","242","country","Bangladesh");
INSERT INTO postmeta VALUES("315","242","state","Dhaka");
INSERT INTO postmeta VALUES("316","242","city","kuril");
INSERT INTO postmeta VALUES("317","242","zip","4567");
INSERT INTO postmeta VALUES("318","242","_customer_user","2");
INSERT INTO postmeta VALUES("319","242","_billing_postcode","4567");
INSERT INTO postmeta VALUES("320","242","_billing_company","");
INSERT INTO postmeta VALUES("321","242","_billing_last_name","");
INSERT INTO postmeta VALUES("322","242","_billing_first_name","");
INSERT INTO postmeta VALUES("323","242","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("324","243","first_name","Demo");
INSERT INTO postmeta VALUES("325","243","last_name","Demo");
INSERT INTO postmeta VALUES("326","243","address_one","Uttara");
INSERT INTO postmeta VALUES("327","243","address_two","");
INSERT INTO postmeta VALUES("328","243","phone","6789");
INSERT INTO postmeta VALUES("329","243","email","demo@email.com");
INSERT INTO postmeta VALUES("330","243","country","Bangladesh");
INSERT INTO postmeta VALUES("331","243","state","Dhaka");
INSERT INTO postmeta VALUES("332","243","city","kuril");
INSERT INTO postmeta VALUES("333","243","zip","4567");
INSERT INTO postmeta VALUES("334","243","_customer_user","2");
INSERT INTO postmeta VALUES("335","243","_billing_postcode","4567");
INSERT INTO postmeta VALUES("336","243","_billing_company","");
INSERT INTO postmeta VALUES("337","243","_billing_last_name","");
INSERT INTO postmeta VALUES("338","243","_billing_first_name","");
INSERT INTO postmeta VALUES("339","243","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("340","244","first_name","Demo");
INSERT INTO postmeta VALUES("341","244","last_name","Demo");
INSERT INTO postmeta VALUES("342","244","address_one","Uttara");
INSERT INTO postmeta VALUES("343","244","address_two","");
INSERT INTO postmeta VALUES("344","244","phone","6789");
INSERT INTO postmeta VALUES("345","244","email","demo@email.com");
INSERT INTO postmeta VALUES("346","244","country","Bangladesh");
INSERT INTO postmeta VALUES("347","244","state","Sylhet");
INSERT INTO postmeta VALUES("348","244","city","Habiganj1");
INSERT INTO postmeta VALUES("349","244","zip","3330-337456");
INSERT INTO postmeta VALUES("350","244","_customer_user","2");
INSERT INTO postmeta VALUES("351","244","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("352","244","_billing_company","");
INSERT INTO postmeta VALUES("353","244","_billing_last_name","");
INSERT INTO postmeta VALUES("354","244","_billing_first_name","");
INSERT INTO postmeta VALUES("355","244","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("356","245","first_name","Demo");
INSERT INTO postmeta VALUES("357","245","last_name","Demo");
INSERT INTO postmeta VALUES("358","245","address_one","Uttara");
INSERT INTO postmeta VALUES("359","245","address_two","");
INSERT INTO postmeta VALUES("360","245","phone","6789");
INSERT INTO postmeta VALUES("361","245","email","demo@email.com");
INSERT INTO postmeta VALUES("362","245","country","Bangladesh");
INSERT INTO postmeta VALUES("363","245","state","Dhaka");
INSERT INTO postmeta VALUES("364","245","city","badda");
INSERT INTO postmeta VALUES("365","245","zip","123");
INSERT INTO postmeta VALUES("366","245","_customer_user","2");
INSERT INTO postmeta VALUES("367","245","_billing_postcode","123");
INSERT INTO postmeta VALUES("368","245","_billing_company","");
INSERT INTO postmeta VALUES("369","245","_billing_last_name","");
INSERT INTO postmeta VALUES("370","245","_billing_first_name","");
INSERT INTO postmeta VALUES("371","245","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("372","246","first_name","Demo");
INSERT INTO postmeta VALUES("373","246","last_name","Demo");
INSERT INTO postmeta VALUES("374","246","address_one","Uttara");
INSERT INTO postmeta VALUES("375","246","address_two","");
INSERT INTO postmeta VALUES("376","246","phone","6789");
INSERT INTO postmeta VALUES("377","246","email","demo@email.com");
INSERT INTO postmeta VALUES("378","246","country","Bangladesh");
INSERT INTO postmeta VALUES("379","246","state","Dhaka");
INSERT INTO postmeta VALUES("380","246","city","kuril");
INSERT INTO postmeta VALUES("381","246","zip","4567");
INSERT INTO postmeta VALUES("382","246","_customer_user","2");
INSERT INTO postmeta VALUES("383","246","_billing_postcode","4567");
INSERT INTO postmeta VALUES("384","246","_billing_company","");
INSERT INTO postmeta VALUES("385","246","_billing_last_name","");
INSERT INTO postmeta VALUES("386","246","_billing_first_name","");
INSERT INTO postmeta VALUES("387","246","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("388","247","first_name","Demo");
INSERT INTO postmeta VALUES("389","247","last_name","Demo");
INSERT INTO postmeta VALUES("390","247","address_one","Uttara");
INSERT INTO postmeta VALUES("391","247","address_two","");
INSERT INTO postmeta VALUES("392","247","phone","6789");
INSERT INTO postmeta VALUES("393","247","email","demo@email.com");
INSERT INTO postmeta VALUES("394","247","country","Bangladesh");
INSERT INTO postmeta VALUES("395","247","state","Dhaka");
INSERT INTO postmeta VALUES("396","247","city","badda");
INSERT INTO postmeta VALUES("397","247","zip","123");
INSERT INTO postmeta VALUES("398","247","_customer_user","2");
INSERT INTO postmeta VALUES("399","247","_billing_postcode","123");
INSERT INTO postmeta VALUES("400","247","_billing_company","");
INSERT INTO postmeta VALUES("401","247","_billing_last_name","");
INSERT INTO postmeta VALUES("402","247","_billing_first_name","");
INSERT INTO postmeta VALUES("403","247","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("404","248","first_name","Demo");
INSERT INTO postmeta VALUES("405","248","last_name","Demo");
INSERT INTO postmeta VALUES("406","248","address_one","Uttara");
INSERT INTO postmeta VALUES("407","248","address_two","");
INSERT INTO postmeta VALUES("408","248","phone","6789");
INSERT INTO postmeta VALUES("409","248","email","demo@email.com");
INSERT INTO postmeta VALUES("410","248","country","Bangladesh");
INSERT INTO postmeta VALUES("411","248","state","Dhaka");
INSERT INTO postmeta VALUES("412","248","city","kuril");
INSERT INTO postmeta VALUES("413","248","zip","4567");
INSERT INTO postmeta VALUES("414","248","_customer_user","2");
INSERT INTO postmeta VALUES("415","248","_billing_postcode","4567");
INSERT INTO postmeta VALUES("416","248","_billing_company","");
INSERT INTO postmeta VALUES("417","248","_billing_last_name","");
INSERT INTO postmeta VALUES("418","248","_billing_first_name","");
INSERT INTO postmeta VALUES("419","248","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("420","249","first_name","Demo");
INSERT INTO postmeta VALUES("421","249","last_name","Demo");
INSERT INTO postmeta VALUES("422","249","address_one","Uttara");
INSERT INTO postmeta VALUES("423","249","address_two","");
INSERT INTO postmeta VALUES("424","249","phone","6789");
INSERT INTO postmeta VALUES("425","249","email","demo@email.com");
INSERT INTO postmeta VALUES("426","249","country","Bangladesh");
INSERT INTO postmeta VALUES("427","249","state","Dhaka");
INSERT INTO postmeta VALUES("428","249","city","kuril");
INSERT INTO postmeta VALUES("429","249","zip","4567");
INSERT INTO postmeta VALUES("430","249","_customer_user","2");
INSERT INTO postmeta VALUES("431","249","_billing_postcode","4567");
INSERT INTO postmeta VALUES("432","249","_billing_company","");
INSERT INTO postmeta VALUES("433","249","_billing_last_name","");
INSERT INTO postmeta VALUES("434","249","_billing_first_name","");
INSERT INTO postmeta VALUES("435","249","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("436","250","first_name","Demo");
INSERT INTO postmeta VALUES("437","250","last_name","Demo");
INSERT INTO postmeta VALUES("438","250","address_one","Uttara");
INSERT INTO postmeta VALUES("439","250","address_two","");
INSERT INTO postmeta VALUES("440","250","phone","6789");
INSERT INTO postmeta VALUES("441","250","email","demo@email.com");
INSERT INTO postmeta VALUES("442","250","country","Bangladesh");
INSERT INTO postmeta VALUES("443","250","state","Dhaka");
INSERT INTO postmeta VALUES("444","250","city","kuril");
INSERT INTO postmeta VALUES("445","250","zip","4567");
INSERT INTO postmeta VALUES("446","250","_customer_user","2");
INSERT INTO postmeta VALUES("447","250","_billing_postcode","4567");
INSERT INTO postmeta VALUES("448","250","_billing_company","");
INSERT INTO postmeta VALUES("449","250","_billing_last_name","");
INSERT INTO postmeta VALUES("450","250","_billing_first_name","");
INSERT INTO postmeta VALUES("451","250","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("452","251","first_name","Guest");
INSERT INTO postmeta VALUES("453","251","last_name","Guest");
INSERT INTO postmeta VALUES("454","251","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("455","251","address_two","");
INSERT INTO postmeta VALUES("456","251","phone","0000000001");
INSERT INTO postmeta VALUES("457","251","email","guest@email.com");
INSERT INTO postmeta VALUES("458","251","country","Bangladesh");
INSERT INTO postmeta VALUES("459","251","state","Dhaka");
INSERT INTO postmeta VALUES("460","251","city","kuril");
INSERT INTO postmeta VALUES("461","251","zip","4567");
INSERT INTO postmeta VALUES("462","251","_customer_user","0");
INSERT INTO postmeta VALUES("463","251","_billing_postcode","4567");
INSERT INTO postmeta VALUES("464","251","_billing_company","");
INSERT INTO postmeta VALUES("465","251","_billing_last_name","");
INSERT INTO postmeta VALUES("466","251","_billing_first_name","");
INSERT INTO postmeta VALUES("467","251","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("468","252","first_name","Partho");
INSERT INTO postmeta VALUES("469","252","last_name","Guest");
INSERT INTO postmeta VALUES("470","252","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("471","252","address_two","");
INSERT INTO postmeta VALUES("472","252","phone","0000000001");
INSERT INTO postmeta VALUES("473","252","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("474","252","country","Bangladesh");
INSERT INTO postmeta VALUES("475","252","state","Dhaka");
INSERT INTO postmeta VALUES("476","252","city","kuril");
INSERT INTO postmeta VALUES("477","252","zip","4567");
INSERT INTO postmeta VALUES("478","252","_customer_user","23");
INSERT INTO postmeta VALUES("479","252","_billing_postcode","4567");
INSERT INTO postmeta VALUES("480","252","_billing_company","");
INSERT INTO postmeta VALUES("481","252","_billing_last_name","");
INSERT INTO postmeta VALUES("482","252","_billing_first_name","");
INSERT INTO postmeta VALUES("483","252","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("484","253","first_name","Partho");
INSERT INTO postmeta VALUES("485","253","last_name","Guest");
INSERT INTO postmeta VALUES("486","253","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("487","253","address_two","");
INSERT INTO postmeta VALUES("488","253","phone","0000000001");
INSERT INTO postmeta VALUES("489","253","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("490","253","country","Bangladesh");
INSERT INTO postmeta VALUES("491","253","state","Dhaka");
INSERT INTO postmeta VALUES("492","253","city","kuril");
INSERT INTO postmeta VALUES("493","253","zip","4567");
INSERT INTO postmeta VALUES("494","253","_customer_user","23");
INSERT INTO postmeta VALUES("495","253","_billing_postcode","4567");
INSERT INTO postmeta VALUES("496","253","_billing_company","");
INSERT INTO postmeta VALUES("497","253","_billing_last_name","");
INSERT INTO postmeta VALUES("498","253","_billing_first_name","");
INSERT INTO postmeta VALUES("499","253","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("500","254","first_name","Partho");
INSERT INTO postmeta VALUES("501","254","last_name","Guest");
INSERT INTO postmeta VALUES("502","254","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("503","254","address_two","");
INSERT INTO postmeta VALUES("504","254","phone","0000000001");
INSERT INTO postmeta VALUES("505","254","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("506","254","country","Bangladesh");
INSERT INTO postmeta VALUES("507","254","state","Dhaka");
INSERT INTO postmeta VALUES("508","254","city","kuril");
INSERT INTO postmeta VALUES("509","254","zip","4567");
INSERT INTO postmeta VALUES("510","254","_customer_user","23");
INSERT INTO postmeta VALUES("511","254","_billing_postcode","4567");
INSERT INTO postmeta VALUES("512","254","_billing_company","");
INSERT INTO postmeta VALUES("513","254","_billing_last_name","");
INSERT INTO postmeta VALUES("514","254","_billing_first_name","");
INSERT INTO postmeta VALUES("515","254","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("516","255","first_name","Partho");
INSERT INTO postmeta VALUES("517","255","last_name","Guest");
INSERT INTO postmeta VALUES("518","255","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("519","255","address_two","");
INSERT INTO postmeta VALUES("520","255","phone","0000000001");
INSERT INTO postmeta VALUES("521","255","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("522","255","country","Bangladesh");
INSERT INTO postmeta VALUES("523","255","state","Dhaka");
INSERT INTO postmeta VALUES("524","255","city","kuril");
INSERT INTO postmeta VALUES("525","255","zip","4567");
INSERT INTO postmeta VALUES("526","255","_customer_user","23");
INSERT INTO postmeta VALUES("527","255","_billing_postcode","4567");
INSERT INTO postmeta VALUES("528","255","_billing_company","");
INSERT INTO postmeta VALUES("529","255","_billing_last_name","");
INSERT INTO postmeta VALUES("530","255","_billing_first_name","");
INSERT INTO postmeta VALUES("531","255","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("532","256","first_name","Partho");
INSERT INTO postmeta VALUES("533","256","last_name","Guest");
INSERT INTO postmeta VALUES("534","256","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("535","256","address_two","");
INSERT INTO postmeta VALUES("536","256","phone","0000000001");
INSERT INTO postmeta VALUES("537","256","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("538","256","country","Bangladesh");
INSERT INTO postmeta VALUES("539","256","state","Dhaka");
INSERT INTO postmeta VALUES("540","256","city","badda");
INSERT INTO postmeta VALUES("541","256","zip","123");
INSERT INTO postmeta VALUES("542","256","_customer_user","23");
INSERT INTO postmeta VALUES("543","256","_billing_postcode","123");
INSERT INTO postmeta VALUES("544","256","_billing_company","");
INSERT INTO postmeta VALUES("545","256","_billing_last_name","");
INSERT INTO postmeta VALUES("546","256","_billing_first_name","");
INSERT INTO postmeta VALUES("547","256","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("548","257","first_name","Partho");
INSERT INTO postmeta VALUES("549","257","last_name","Guest");
INSERT INTO postmeta VALUES("550","257","address_one","Uttara,Dhaka");
INSERT INTO postmeta VALUES("551","257","address_two","");
INSERT INTO postmeta VALUES("552","257","phone","0000000001");
INSERT INTO postmeta VALUES("553","257","email","parthokar90@gmail.com");
INSERT INTO postmeta VALUES("554","257","country","Bangladesh");
INSERT INTO postmeta VALUES("555","257","state","Dhaka");
INSERT INTO postmeta VALUES("556","257","city","kuril");
INSERT INTO postmeta VALUES("557","257","zip","4567");
INSERT INTO postmeta VALUES("558","257","_customer_user","23");
INSERT INTO postmeta VALUES("559","257","_billing_postcode","4567");
INSERT INTO postmeta VALUES("560","257","_billing_company","");
INSERT INTO postmeta VALUES("561","257","_billing_last_name","");
INSERT INTO postmeta VALUES("562","257","_billing_first_name","");
INSERT INTO postmeta VALUES("563","257","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("564","257","processing_date","2020-11-10");
INSERT INTO postmeta VALUES("566","256","processing_date","2020-11-10");
INSERT INTO postmeta VALUES("567","258","first_name","Demo");
INSERT INTO postmeta VALUES("568","258","last_name","Demo");
INSERT INTO postmeta VALUES("569","258","address_one","Uttara");
INSERT INTO postmeta VALUES("570","258","address_two","");
INSERT INTO postmeta VALUES("571","258","phone","6789");
INSERT INTO postmeta VALUES("572","258","email","demo@email.com");
INSERT INTO postmeta VALUES("573","258","country","Bangladesh");
INSERT INTO postmeta VALUES("574","258","state","Sylhet");
INSERT INTO postmeta VALUES("575","258","city","Habiganj1");
INSERT INTO postmeta VALUES("576","258","zip","3330-337456");
INSERT INTO postmeta VALUES("577","258","_customer_user","2");
INSERT INTO postmeta VALUES("578","258","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("579","258","_billing_company","");
INSERT INTO postmeta VALUES("580","258","_billing_last_name","");
INSERT INTO postmeta VALUES("581","258","_billing_first_name","");
INSERT INTO postmeta VALUES("582","258","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("583","259","first_name","Demo");
INSERT INTO postmeta VALUES("584","259","last_name","Demo");
INSERT INTO postmeta VALUES("585","259","address_one","Uttara");
INSERT INTO postmeta VALUES("586","259","address_two","");
INSERT INTO postmeta VALUES("587","259","phone","6789");
INSERT INTO postmeta VALUES("588","259","email","demo@email.com");
INSERT INTO postmeta VALUES("589","259","country","Bangladesh");
INSERT INTO postmeta VALUES("590","259","state","Dhaka");
INSERT INTO postmeta VALUES("591","259","city","kuril");
INSERT INTO postmeta VALUES("592","259","zip","4567");
INSERT INTO postmeta VALUES("593","259","_customer_user","2");
INSERT INTO postmeta VALUES("594","259","_billing_postcode","4567");
INSERT INTO postmeta VALUES("595","259","_billing_company","");
INSERT INTO postmeta VALUES("596","259","_billing_last_name","");
INSERT INTO postmeta VALUES("597","259","_billing_first_name","");
INSERT INTO postmeta VALUES("598","259","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("599","260","first_name","Demo");
INSERT INTO postmeta VALUES("600","260","last_name","Demo");
INSERT INTO postmeta VALUES("601","260","address_one","Uttara");
INSERT INTO postmeta VALUES("602","260","address_two","");
INSERT INTO postmeta VALUES("603","260","phone","6789");
INSERT INTO postmeta VALUES("604","260","email","demo@email.com");
INSERT INTO postmeta VALUES("605","260","country","Bangladesh");
INSERT INTO postmeta VALUES("606","260","state","Dhaka");
INSERT INTO postmeta VALUES("607","260","city","kuril");
INSERT INTO postmeta VALUES("608","260","zip","4567");
INSERT INTO postmeta VALUES("609","260","_customer_user","2");
INSERT INTO postmeta VALUES("610","260","_billing_postcode","4567");
INSERT INTO postmeta VALUES("611","260","_billing_company","");
INSERT INTO postmeta VALUES("612","260","_billing_last_name","");
INSERT INTO postmeta VALUES("613","260","_billing_first_name","");
INSERT INTO postmeta VALUES("614","260","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("615","261","first_name","Demo");
INSERT INTO postmeta VALUES("616","261","last_name","Demo");
INSERT INTO postmeta VALUES("617","261","address_one","Uttara");
INSERT INTO postmeta VALUES("618","261","address_two","");
INSERT INTO postmeta VALUES("619","261","phone","6789");
INSERT INTO postmeta VALUES("620","261","email","demo@email.com");
INSERT INTO postmeta VALUES("621","261","country","Bangladesh");
INSERT INTO postmeta VALUES("622","261","state","Sylhet");
INSERT INTO postmeta VALUES("623","261","city","Habiganj1");
INSERT INTO postmeta VALUES("624","261","zip","3330-337456");
INSERT INTO postmeta VALUES("625","261","_customer_user","2");
INSERT INTO postmeta VALUES("626","261","_billing_postcode","3330-337456");
INSERT INTO postmeta VALUES("627","261","_billing_company","");
INSERT INTO postmeta VALUES("628","261","_billing_last_name","");
INSERT INTO postmeta VALUES("629","261","_billing_first_name","");
INSERT INTO postmeta VALUES("630","261","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("642","262","start_stock","2000");
INSERT INTO postmeta VALUES("643","262","_sku","100");
INSERT INTO postmeta VALUES("644","262","attached_file","1604466775.jpg");
INSERT INTO postmeta VALUES("658","263","attached_file","1604551889.jpg");
INSERT INTO postmeta VALUES("659","264","first_name","Demo");
INSERT INTO postmeta VALUES("660","264","last_name","Demo");
INSERT INTO postmeta VALUES("661","264","address_one","Uttara");
INSERT INTO postmeta VALUES("662","264","address_two","");
INSERT INTO postmeta VALUES("663","264","phone","6789");
INSERT INTO postmeta VALUES("664","264","email","demo@email.com");
INSERT INTO postmeta VALUES("665","264","country","Bangladesh");
INSERT INTO postmeta VALUES("666","264","state","Dhaka");
INSERT INTO postmeta VALUES("667","264","city","kuril");
INSERT INTO postmeta VALUES("668","264","zip","4567");
INSERT INTO postmeta VALUES("669","264","_customer_user","2");
INSERT INTO postmeta VALUES("670","264","_billing_postcode","4567");
INSERT INTO postmeta VALUES("671","264","_billing_company","");
INSERT INTO postmeta VALUES("672","264","_billing_last_name","");
INSERT INTO postmeta VALUES("673","264","_billing_first_name","");
INSERT INTO postmeta VALUES("674","264","payment_method","CashOnDelivery");
INSERT INTO postmeta VALUES("675","264","processing_date","2020-11-14");



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
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES("1","0","2020-09-26 16:47:07","2020-09-26 22:47:07","","Samsung","","inherit","open","open","","Samsung","","","2020-09-26 00:00:00","2020-09-26 22:47:07","","0","","0","attachment","","0");
INSERT INTO posts VALUES("2","0","2020-09-26 17:06:19","2020-09-26 23:06:19","","Dell","","inherit","open","open","","Dell","","","2020-09-26 00:00:00","2020-09-26 23:06:19","","0","","0","attachment","","0");
INSERT INTO posts VALUES("3","0","2020-09-26 17:16:26","2020-09-26 23:16:26","","Apple","","inherit","open","open","","Apple","","","2020-09-26 00:00:00","2020-09-26 23:16:26","","0","","0","attachment","","0");
INSERT INTO posts VALUES("4","0","2020-09-26 17:17:17","2020-09-26 23:17:17","","Sony","","inherit","open","open","","Sony","","","2020-09-26 00:00:00","2020-09-26 23:17:17","","0","","0","attachment","","0");
INSERT INTO posts VALUES("5","0","2020-09-26 17:17:57","2020-09-26 23:17:57","","Lenovo","","inherit","open","open","","Lenovo","","","2020-09-26 00:00:00","2020-09-26 23:17:57","","0","","0","attachment","","0");
INSERT INTO posts VALUES("6","0","2020-09-26 17:20:29","2020-09-26 23:20:29","","HTC","","inherit","open","open","","HTC","","","2020-09-26 00:00:00","2020-09-26 23:20:29","","0","","0","attachment","","0");
INSERT INTO posts VALUES("7","0","2020-09-26 17:21:15","2020-09-26 23:21:15","","Xiaomi","","inherit","open","open","","Xiaomi","","","2020-09-26 00:00:00","2020-09-26 23:21:15","","0","","0","attachment","","0");
INSERT INTO posts VALUES("8","0","2020-09-26 17:23:42","2020-09-26 23:23:42","","OnePlus","","inherit","open","open","","OnePlus","","","2020-09-26 00:00:00","2020-09-26 23:23:42","","0","","0","attachment","","0");
INSERT INTO posts VALUES("35","1","2020-09-26 17:50:00","2020-09-26 23:50:00","<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","Burger","<h2>What is Lorem Ipsum?</h2>
<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","deleted","open","open","","Burger","","","2020-09-29 00:00:00","2020-09-29 13:47:28","","0","","0","deleted","","0");
INSERT INTO posts VALUES("39","1","2020-09-29 15:51:00","2020-09-29 21:51:00","<p>dsfdsfsdf</p>","Saiful","<p>sdafdsfdsf</p>","deleted","open","open","","Saiful","","","2020-09-29 00:00:00","2020-09-29 15:51:53","","0","","0","deleted","","0");
INSERT INTO posts VALUES("227","2","2020-11-05 13:41:00","2020-11-05 19:41:00","Banner Image","Banner Image","Banner Image","publish","open","open","","Banner Image","","","2020-11-05 13:41:58","2020-11-05 13:41:58","","0","","0","banner","","0");
INSERT INTO posts VALUES("264","2","2020-11-14 00:00:00","2020-11-14 22:04:50","","Order2020-11-14 16:04:50","","dispatch","open","open","order_1247","order-Nov-14-2020-1611","","","2020-11-14 16:05:59","2020-11-14 16:04:50","","0","","0","shop_order","","0");
INSERT INTO posts VALUES("262","2","2020-11-04 11:11:00","2020-11-04 17:11:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,&nbsp;</p>","Demo","<p>Information</p>","publish","open","open","","Demo","","","2020-11-14 16:01:01","2020-11-14 16:01:01","","0","","0","product","","0");
INSERT INTO posts VALUES("263","2","2020-11-05 10:50:00","2020-11-05 16:50:00","<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,&nbsp;</p>","Test","<p>sdfdsfdsf</p>","publish","open","open","","Test","","","2020-11-14 16:01:13","2020-11-14 16:01:13","","0","","0","product","","0");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","admin","2020-10-28 16:48:52","2020-11-11 16:33:57");
INSERT INTO roles VALUES("3","Editor","editor","2020-10-29 10:21:40","2020-11-11 17:27:51");



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
INSERT INTO roles_permissions VALUES("3","8");
INSERT INTO roles_permissions VALUES("3","9");



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
INSERT INTO term_relationships VALUES("203","54","0");
INSERT INTO term_relationships VALUES("203","15","0");
INSERT INTO term_relationships VALUES("128","6","0");
INSERT INTO term_relationships VALUES("128","16","0");
INSERT INTO term_relationships VALUES("215","15","0");
INSERT INTO term_relationships VALUES("215","3","0");
INSERT INTO term_relationships VALUES("216","4","0");
INSERT INTO term_relationships VALUES("216","15","0");
INSERT INTO term_relationships VALUES("218","15","0");
INSERT INTO term_relationships VALUES("218","8","0");
INSERT INTO term_relationships VALUES("220","15","0");
INSERT INTO term_relationships VALUES("220","7","0");
INSERT INTO term_relationships VALUES("221","8","0");
INSERT INTO term_relationships VALUES("221","15","0");
INSERT INTO term_relationships VALUES("262","15","0");
INSERT INTO term_relationships VALUES("262","8","0");
INSERT INTO term_relationships VALUES("263","8","0");
INSERT INTO term_relationships VALUES("263","15","0");



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
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO term_taxonomy VALUES("55","55","district","600","0","0","2020-10-06 15:29:47");
INSERT INTO term_taxonomy VALUES("56","56","district","120","0","0","2020-10-06 15:29:47");
INSERT INTO term_taxonomy VALUES("103","99","district","120","0","0","2020-11-02 16:04:17");
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
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO terms VALUES("99","gazipur","gazipur","0","1","2020-11-02 16:04:17");



CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO usermeta VALUES("277","5","district","55");
INSERT INTO usermeta VALUES("275","5","user_image","");
INSERT INTO usermeta VALUES("443","2","user_image","1601189730.png");
INSERT INTO usermeta VALUES("503","2","zip","4567");
INSERT INTO usermeta VALUES("502","2","city","95");
INSERT INTO usermeta VALUES("440","2","state","");
INSERT INTO usermeta VALUES("439","2","country","");
INSERT INTO usermeta VALUES("438","2","phone","6789");
INSERT INTO usermeta VALUES("437","2","address_two","");
INSERT INTO usermeta VALUES("41","3","phone","4354354");
INSERT INTO usermeta VALUES("40","3","address_two","retretret");
INSERT INTO usermeta VALUES("39","3","address_one","retretre");
INSERT INTO usermeta VALUES("38","3","last_name","user 2");
INSERT INTO usermeta VALUES("37","3","first_name","user 2");
INSERT INTO usermeta VALUES("42","3","country","BD");
INSERT INTO usermeta VALUES("43","3","state","Bangladesh");
INSERT INTO usermeta VALUES("44","3","city","Dhaka");
INSERT INTO usermeta VALUES("45","3","zip","342543543");
INSERT INTO usermeta VALUES("500","2","address_one","Uttara");
INSERT INTO usermeta VALUES("434","2","first_name","Demo");
INSERT INTO usermeta VALUES("279","5","zip","1230");
INSERT INTO usermeta VALUES("278","5","city","57");
INSERT INTO usermeta VALUES("457","0","district","55");
INSERT INTO usermeta VALUES("456","0","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("267","5","last_name","Rahman");
INSERT INTO usermeta VALUES("276","5","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("269","5","address_two","");
INSERT INTO usermeta VALUES("270","5","phone","3453453457");
INSERT INTO usermeta VALUES("266","5","first_name","Saiful");
INSERT INTO usermeta VALUES("459","0","zip","4567");
INSERT INTO usermeta VALUES("435","2","last_name","Demo");
INSERT INTO usermeta VALUES("458","0","city","95");
INSERT INTO usermeta VALUES("480","23","address_one","Uttara,Dhaka");
INSERT INTO usermeta VALUES("481","23","district","55");
INSERT INTO usermeta VALUES("482","23","city","95");
INSERT INTO usermeta VALUES("483","23","zip","4567");
INSERT INTO usermeta VALUES("501","2","district","55");



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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("2","Demo","demo@email.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-09-13 11:06:20","2020-09-13 11:06:20");
INSERT INTO users VALUES("22","Demo dfgdfg","bigshotstyle20@gmail.com","","$2y$10$zx7B2dYyVhEzBcjDhlXmI.kjkWMl2bHQl./tZyVE6qy2HsYzO0x9a","","","","1","2020-11-07 10:40:08","2020-11-07 10:40:08");
INSERT INTO users VALUES("23","Partho","parthokar90@gmail.com","","$2y$10$fZ8unFRUB6uqzsXMs6Pt6Oi149M6ba2KDk358eeY.1JpMTmVZwIP2","","","","1","2020-11-07 10:46:58","2020-11-07 10:46:58");



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
INSERT INTO users_permissions VALUES("4","1");
INSERT INTO users_permissions VALUES("4","2");
INSERT INTO users_permissions VALUES("4","8");
INSERT INTO users_permissions VALUES("4","9");



CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users_roles VALUES("2","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO wishlist VALUES("5","2","263","","");



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


