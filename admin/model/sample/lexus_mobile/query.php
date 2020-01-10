<?php 
$query['pavsliderlayer'][]  = "DROP TABLE IF EXISTS `".DB_PREFIX ."pavoslidergroups`; ";
$query['pavsliderlayer'][]  = "DROP TABLE IF EXISTS `".DB_PREFIX ."pavosliderlayers`; ";
$query['pavsliderlayer'][] = "
CREATE TABLE `".DB_PREFIX ."pavoslidergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
"; 

$query['pavsliderlayer'][] = "
CREATE TABLE `".DB_PREFIX ."pavosliderlayers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `params` text NOT NULL,
  `layersparams` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
"; 


$query['pavsliderlayer'][] ="
INSERT INTO `".DB_PREFIX ."pavoslidergroups` (`id`, `title`, `params`) VALUES
(1, 'Slideshow', 'a:28:{s:5:\"title\";s:9:\"Slideshow\";s:5:\"delay\";s:4:\"9000\";s:9:\"fullwidth\";s:0:\"\";s:5:\"width\";s:3:\"774\";s:6:\"height\";s:3:\"517\";s:12:\"touch_mobile\";s:1:\"1\";s:13:\"stop_on_hover\";s:1:\"1\";s:12:\"shuffle_mode\";s:1:\"0\";s:14:\"image_cropping\";s:1:\"0\";s:11:\"shadow_type\";s:1:\"0\";s:14:\"show_time_line\";s:1:\"0\";s:18:\"time_line_position\";s:6:\"bottom\";s:16:\"background_color\";s:7:\"#d9d9d9\";s:6:\"margin\";s:11:\"0px 0px 0px\";s:7:\"padding\";s:7:\"0px 0px\";s:16:\"background_image\";s:1:\"1\";s:14:\"background_url\";s:0:\"\";s:14:\"navigator_type\";s:6:\"bullet\";s:16:\"navigator_arrows\";s:16:\"verticalcentered\";s:16:\"navigation_style\";s:5:\"round\";s:17:\"offset_horizontal\";s:1:\"0\";s:15:\"offset_vertical\";s:1:\"0\";s:14:\"show_navigator\";s:1:\"0\";s:20:\"hide_navigator_after\";s:3:\"200\";s:15:\"thumbnail_width\";s:3:\"100\";s:16:\"thumbnail_height\";s:2:\"50\";s:16:\"thumbnail_amount\";s:1:\"5\";s:17:\"hide_screen_width\";s:0:\"\";}');
"; 	

$query['pavsliderlayer'][] = "
INSERT INTO `".DB_PREFIX ."pavosliderlayers` (`id`, `title`, `parent_id`, `group_id`, `params`, `layersparams`, `image`, `status`, `position`) VALUES
(1, 'image slideshow1', 0, 1, 'a:16:{s:2:\"id\";s:1:\"1\";s:15:\"slider_group_id\";s:1:\"1\";s:12:\"slider_title\";s:16:\"image slideshow1\";s:13:\"slider_status\";s:1:\"1\";s:17:\"slider_transition\";s:6:\"random\";s:11:\"slider_slot\";s:1:\"7\";s:15:\"slider_rotation\";s:1:\"0\";s:15:\"slider_duration\";s:3:\"700\";s:12:\"slider_delay\";s:1:\"0\";s:11:\"slider_link\";s:0:\"\";s:16:\"slider_thumbnail\";s:0:\"\";s:15:\"slider_usevideo\";s:1:\"0\";s:14:\"slider_videoid\";s:0:\"\";s:16:\"slider_videoplay\";s:1:\"1\";s:9:\"slider_id\";s:1:\"1\";s:12:\"slider_image\";s:27:\"data/slider/img-slider1.jpg\";}', 'O:8:\"stdClass\":1:{s:6:\"layers\";a:4:{i:0;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:1;s:13:\"layer_content\";s:22:\"data/slider/image1.png\";s:10:\"layer_type\";s:5:\"image\";s:11:\"layer_class\";s:0:\"\";s:13:\"layer_caption\";s:17:\"Your Image Here 2\";s:15:\"layer_animation\";s:3:\"sfl\";s:12:\"layer_easing\";s:11:\"easeOutQuad\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"195\";s:10:\"layer_left\";s:2:\"75\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:3:\"681\";}i:1;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:2;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:16:\"large_black_text\";s:13:\"layer_caption\";s:11:\"sony xperia\";s:15:\"layer_animation\";s:3:\"lft\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:2:\"68\";s:10:\"layer_left\";s:3:\"433\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1324\";}i:2;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:3;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:10:\"small_text\";s:13:\"layer_caption\";s:178:\"Lorem ipsum dolor consectetur adipiscing elit enean &lt;/br&gt;sapien massa posuquis quam non dui rutrum ornare sed sodales &lt;/br&gt; ectus et ornare vivamus non pulvinar lacus\";s:15:\"layer_animation\";s:3:\"lfl\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"122\";s:10:\"layer_left\";s:3:\"326\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"2035\";}i:3;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:4;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:11:\"medium_grey\";s:13:\"layer_caption\";s:94:\"&lt;a href=&quot;index.php?route=product/product_ASM_product_id=58&quot;&gt;Show now&lt;/a&gt;\";s:15:\"layer_animation\";s:3:\"lfr\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"202\";s:10:\"layer_left\";s:3:\"546\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"2813\";}}}', 'data/slider/img-slider1.jpg', 1, 1),
(3, 'Image Slideshow3', 0, 1, 'a:16:{s:2:\"id\";s:1:\"3\";s:15:\"slider_group_id\";s:1:\"1\";s:12:\"slider_title\";s:16:\"Image Slideshow3\";s:13:\"slider_status\";s:1:\"1\";s:17:\"slider_transition\";s:6:\"random\";s:11:\"slider_slot\";s:1:\"7\";s:15:\"slider_rotation\";s:1:\"0\";s:15:\"slider_duration\";s:3:\"300\";s:12:\"slider_delay\";s:1:\"0\";s:11:\"slider_link\";s:0:\"\";s:16:\"slider_thumbnail\";s:0:\"\";s:15:\"slider_usevideo\";s:1:\"0\";s:14:\"slider_videoid\";s:0:\"\";s:16:\"slider_videoplay\";s:1:\"0\";s:9:\"slider_id\";s:1:\"3\";s:12:\"slider_image\";s:27:\"data/slider/img-slider1.jpg\";}', 'O:8:\"stdClass\":1:{s:6:\"layers\";a:4:{i:0;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:1;s:13:\"layer_content\";s:22:\"data/slider/image3.png\";s:10:\"layer_type\";s:5:\"image\";s:11:\"layer_class\";s:0:\"\";s:13:\"layer_caption\";s:17:\"Your Image Here 1\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"158\";s:10:\"layer_left\";s:1:\"1\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:3:\"400\";}i:1;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:2;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:16:\"large_black_text\";s:13:\"layer_caption\";s:11:\"sony xperia\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:2:\"52\";s:10:\"layer_left\";s:3:\"446\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1200\";}i:2;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:3;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:10:\"small_text\";s:13:\"layer_caption\";s:177:\"Lorem ipsum dolor consectetur adipiscing elit enean&lt;/br&gt; sapien massa posuquis quam non dui rutrum ornare sed sodales&lt;/br&gt; ectus et ornare vivamus non pulvinar lacus\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"104\";s:10:\"layer_left\";s:3:\"341\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1600\";}i:3;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:4;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:11:\"medium_grey\";s:13:\"layer_caption\";s:94:\"&lt;a href=&quot;index.php?route=product/product_ASM_product_id=58&quot;&gt;Show now&lt;/a&gt;\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"183\";s:10:\"layer_left\";s:3:\"584\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"2000\";}}}', 'data/slider/img-slider1.jpg', 1, 3),
(4, 'image Slideshow4', 0, 1, 'a:16:{s:2:\"id\";s:1:\"4\";s:15:\"slider_group_id\";s:1:\"1\";s:12:\"slider_title\";s:16:\"image Slideshow4\";s:13:\"slider_status\";s:1:\"1\";s:17:\"slider_transition\";s:6:\"random\";s:11:\"slider_slot\";s:1:\"7\";s:15:\"slider_rotation\";s:1:\"0\";s:15:\"slider_duration\";s:3:\"300\";s:12:\"slider_delay\";s:1:\"0\";s:11:\"slider_link\";s:0:\"\";s:16:\"slider_thumbnail\";s:0:\"\";s:15:\"slider_usevideo\";s:1:\"0\";s:14:\"slider_videoid\";s:0:\"\";s:16:\"slider_videoplay\";s:1:\"0\";s:9:\"slider_id\";s:1:\"4\";s:12:\"slider_image\";s:27:\"data/slider/img-slider2.jpg\";}', 'O:8:\"stdClass\":1:{s:6:\"layers\";a:5:{i:0;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:1;s:13:\"layer_content\";s:22:\"data/slider/image4.png\";s:10:\"layer_type\";s:5:\"image\";s:11:\"layer_class\";s:0:\"\";s:13:\"layer_caption\";s:17:\"Your Image Here 1\";s:15:\"layer_animation\";s:12:\"randomrotate\";s:12:\"layer_easing\";s:13:\"easeInOutSine\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"151\";s:10:\"layer_left\";s:2:\"60\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:3:\"400\";}i:1;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:2;s:13:\"layer_content\";s:22:\"data/slider/image4.png\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:16:\"large_black_text\";s:13:\"layer_caption\";s:11:\"sony xperia\";s:15:\"layer_animation\";s:12:\"randomrotate\";s:12:\"layer_easing\";s:13:\"easeInOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:2:\"43\";s:10:\"layer_left\";s:3:\"447\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:3:\"800\";}i:2;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:3;s:13:\"layer_content\";s:22:\"data/slider/image4.png\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:10:\"small_text\";s:13:\"layer_caption\";s:177:\"Lorem ipsum dolor consectetur adipiscing elit enean sapien&lt;/br&gt; massa posuquis quam non dui rutrum ornare sed sodales&lt;/br&gt; ectus et ornare vivamus non pulvinar lacus\";s:15:\"layer_animation\";s:12:\"randomrotate\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:2:\"98\";s:10:\"layer_left\";s:3:\"371\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1200\";}i:3;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:4;s:13:\"layer_content\";s:22:\"data/slider/image4.png\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:11:\"medium_grey\";s:13:\"layer_caption\";s:60:\"&lt;a href=&quot;index.php?route=product/product_ASM_path=18\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"180\";s:10:\"layer_left\";s:3:\"555\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1600\";}i:4;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:5;s:13:\"layer_content\";s:22:\"data/slider/image4.png\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:11:\"medium_grey\";s:13:\"layer_caption\";s:94:\"&lt;a href=&quot;index.php?route=product/product_ASM_product_id=58&quot;&gt;Show now&lt;/a&gt;\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"178\";s:10:\"layer_left\";s:3:\"569\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"2000\";}}}', 'data/slider/img-slider2.jpg', 1, 4),
(5, 'image slideshow2', 0, 1, 'a:16:{s:2:\"id\";s:1:\"5\";s:15:\"slider_group_id\";s:1:\"1\";s:12:\"slider_title\";s:16:\"image slideshow2\";s:13:\"slider_status\";s:1:\"1\";s:17:\"slider_transition\";s:6:\"random\";s:11:\"slider_slot\";s:1:\"7\";s:15:\"slider_rotation\";s:1:\"0\";s:15:\"slider_duration\";s:3:\"300\";s:12:\"slider_delay\";s:1:\"0\";s:11:\"slider_link\";s:0:\"\";s:16:\"slider_thumbnail\";s:0:\"\";s:15:\"slider_usevideo\";s:1:\"0\";s:14:\"slider_videoid\";s:0:\"\";s:16:\"slider_videoplay\";s:1:\"0\";s:9:\"slider_id\";s:1:\"5\";s:12:\"slider_image\";s:27:\"data/slider/img-slider2.jpg\";}', 'O:8:\"stdClass\":1:{s:6:\"layers\";a:4:{i:0;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:1;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:16:\"large_black_text\";s:13:\"layer_caption\";s:11:\"Macbook Pro\";s:15:\"layer_animation\";s:12:\"randomrotate\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:2:\"37\";s:10:\"layer_left\";s:3:\"254\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:3:\"452\";}i:1;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:2;s:13:\"layer_content\";s:22:\"data/slider/image2.png\";s:10:\"layer_type\";s:5:\"image\";s:11:\"layer_class\";s:0:\"\";s:13:\"layer_caption\";s:17:\"Your Image Here 2\";s:15:\"layer_animation\";s:12:\"randomrotate\";s:12:\"layer_easing\";s:13:\"easeInOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"183\";s:10:\"layer_left\";s:3:\"137\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1122\";}i:2;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:3;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:11:\"medium_text\";s:13:\"layer_caption\";s:102:\"sapien massa posuquis quam non dui rutrum ornare sed sodales&lt;/br&gt; ectus et ornare pulvinar lacus\";s:15:\"layer_animation\";s:3:\"sfl\";s:12:\"layer_easing\";s:10:\"easeInSine\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:2:\"84\";s:10:\"layer_left\";s:3:\"211\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"1709\";}i:3;a:20:{s:16:\"layer_video_type\";s:7:\"youtube\";s:14:\"layer_video_id\";s:0:\"\";s:18:\"layer_video_height\";s:3:\"200\";s:17:\"layer_video_width\";s:3:\"300\";s:17:\"layer_video_thumb\";s:0:\"\";s:8:\"layer_id\";i:4;s:13:\"layer_content\";s:0:\"\";s:10:\"layer_type\";s:4:\"text\";s:11:\"layer_class\";s:11:\"medium_grey\";s:13:\"layer_caption\";s:94:\"&lt;a href=&quot;index.php?route=product/product_ASM_product_id=58&quot;&gt;Show now&lt;/a&gt;\";s:15:\"layer_animation\";s:4:\"fade\";s:12:\"layer_easing\";s:11:\"easeOutExpo\";s:11:\"layer_speed\";s:3:\"350\";s:9:\"layer_top\";s:3:\"135\";s:10:\"layer_left\";s:3:\"360\";s:13:\"layer_endtime\";s:1:\"0\";s:14:\"layer_endspeed\";s:3:\"300\";s:18:\"layer_endanimation\";s:4:\"auto\";s:15:\"layer_endeasing\";s:7:\"nothing\";s:10:\"time_start\";s:4:\"2377\";}}}', 'data/slider/img-slider2.jpg', 1, 2);
"; 


$query['pavmegamenu'][]  = "DROP TABLE IF EXISTS `".DB_PREFIX ."megamenu`; ";
$query['pavmegamenu'][]  = "DROP TABLE IF EXISTS `".DB_PREFIX ."megamenu_description`; "; 
$query['pavmegamenu'][]  = "DROP TABLE IF EXISTS `".DB_PREFIX ."megamenu_widgets`; "; 
$query['pavmegamenu'][]  = "	
CREATE TABLE `".DB_PREFIX ."megamenu` (
   `megamenu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `type_submenu` varchar(10) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `content_text` text,
  `submenu_content` text,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `widget_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`megamenu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
				
";

$query['pavmegamenu'][]  = "	
	CREATE TABLE `".DB_PREFIX ."megamenu_description` (
  `megamenu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`megamenu_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
";

$query['pavmegamenu'][]  = "	
CREATE TABLE `".DB_PREFIX ."megamenu_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
";
	
$query['pavmegamenu'][] = "	
	INSERT INTO `".DB_PREFIX ."megamenu` (`megamenu_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `type_submenu`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `description`, `content_text`, `submenu_content`, `level`, `left`, `right`, `widget_id`) VALUES
(1, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, -5, 34, 47, 0),
(2, '', 1, 0, NULL, NULL, NULL, 'col1=3, col2=3, col3=6', '20', '3', 'category', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(3, '', 1, 0, NULL, NULL, NULL, '', '18', '1', 'category', 0, 1, 'menu', 0, 1, 0, 4, 0, '', NULL, 0, 'top', 'pav-parrent', NULL, '', '', 0, 0, 0, 1),
(4, '', 3, 0, NULL, NULL, NULL, '', '25', '1', 'category', 0, 1, 'menu', 0, 1, 0, 1, 0, '', NULL, 0, 'top', 'pav-parrent', NULL, '', '', 0, 0, 0, 0),
(5, '', 1, 0, NULL, NULL, NULL, '', '17', '', 'category', 0, 1, 'menu', 0, 1, 0, 3, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(7, '', 1, 0, NULL, NULL, NULL, '', '33', '1', 'category', 0, 1, 'menu', 0, 1, 0, 5, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(8, '', 2, 1, NULL, NULL, NULL, '', '27', '1', 'category', 0, 1, 'menu', 0, 1, 0, 1, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '&lt;p&gt;test&lt;/p&gt;\r\n', 0, 0, 0, 0),
(9, '', 2, 1, NULL, NULL, NULL, '', '26', '1', 'category', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(10, '', 8, 0, NULL, NULL, NULL, '', '59', '1', 'category', 0, 1, 'menu', 0, 1, 0, 1, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(11, '', 8, 0, NULL, NULL, NULL, '', '60', '1', 'category', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(12, '', 8, 0, NULL, NULL, NULL, '', '61', '1', 'category', 0, 1, 'menu', 0, 1, 0, 3, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(13, '', 8, 0, NULL, NULL, NULL, '', '62', '1', 'category', 0, 1, 'menu', 0, 1, 0, 4, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(14, '', 8, 0, NULL, NULL, NULL, '', '63', '1', 'category', 0, 1, 'menu', 0, 1, 0, 5, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(15, '', 8, 0, NULL, NULL, NULL, '', '64', '1', 'category', 0, 1, 'menu', 0, 1, 0, 6, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(16, '', 8, 0, NULL, NULL, NULL, '', '65', '1', 'category', 0, 1, 'menu', 0, 1, 0, 7, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(17, '', 9, 0, NULL, NULL, NULL, '', '66', '1', 'category', 0, 1, 'menu', 0, 1, 0, 1, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(18, '', 9, 0, NULL, NULL, NULL, '', '67', '1', 'category', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(19, '', 9, 0, NULL, NULL, NULL, '', '68', '1', 'category', 0, 1, 'menu', 0, 1, 0, 3, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(20, '', 9, 0, NULL, NULL, NULL, '', '71', '1', 'category', 0, 1, 'menu', 0, 1, 0, 4, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(21, '', 9, 0, NULL, NULL, NULL, '', '72', '1', 'category', 0, 1, 'menu', 0, 1, 0, 5, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(22, '', 9, 0, NULL, NULL, NULL, '', '69', '1', 'category', 0, 1, 'menu', 0, 1, 0, 6, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(23, '', 9, 0, NULL, NULL, NULL, '', '70', '1', 'category', 0, 1, 'menu', 0, 1, 0, 7, 0, '', NULL, 0, 'top', 'pav-menu-child', NULL, '', '', 0, 0, 0, 0),
(25, '', 3, 0, NULL, NULL, NULL, '', '79', '1', 'category', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(26, '', 3, 0, NULL, NULL, NULL, '', '74', '1', 'category', 0, 1, 'menu', 0, 1, 0, 3, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(27, '', 3, 0, NULL, NULL, NULL, '', '73', '1', 'category', 0, 1, 'menu', 0, 1, 0, 4, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(28, '', 3, 0, NULL, NULL, NULL, '', '80', '1', 'category', 0, 1, 'menu', 0, 1, 0, 5, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(29, '', 3, 0, NULL, NULL, NULL, '', '', '1', 'category', 0, 1, 'menu', 0, 1, 0, 6, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(30, '', 3, 0, NULL, NULL, NULL, '', '46', '1', 'category', 0, 1, 'menu', 0, 1, 0, 7, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 0),
(37, '', 1, 0, NULL, NULL, NULL, '', '25', '1', 'category', 0, 1, 'menu', 0, 1, 0, 6, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(40, 'data/icon-home.png', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 1, 0, '?route=common/home', NULL, 0, 'top', 'home', NULL, '', '', 0, 0, 0, 1),
(41, '', 2, 0, NULL, NULL, NULL, '', '', '1', 'html', 0, 0, 'menu', 0, 1, 0, 99, 0, '', NULL, 0, 'top', '', NULL, '&lt;div class=&quot;pav-menu-video&quot;&gt;&lt;iframe allowfullscreen=&quot;&quot; frameborder=&quot;0&quot; height=&quot;200&quot; src=&quot;//www.youtube.com/embed/WJk81hApW9A&quot; width=&quot;330&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;In eget lacus feugiat, sodales sem at tempor dui.Suspendisse potenti consectetur&lt;/p&gt;\r\n', '', 0, 0, 0, 1);

	";
$query['pavmegamenu'][] = "	
INSERT INTO `".DB_PREFIX ."megamenu_description` (`megamenu_id`, `language_id`, `title`, `description`) VALUES
(2, 2, 'Desktops', ''),
(4, 2, 'Watches', ''),
(2, 1, 'Desktops ', ''),
(4, 1, 'Watches', ''),
(5, 1, 'Laptops &amp; Notebooks', ''),
(37, 1, 'Phones &amp; PDAs ', ''),
(7, 1, ' Software ', ''),
(8, 1, 'Computers', ''),
(9, 1, 'Printer', ''),
(8, 2, 'Computers', ''),
(10, 2, 'Duis tempor', ''),
(10, 1, 'Duis tempor', ''),
(11, 2, 'Pellentesque eget', ''),
(11, 1, 'Pellentesque eget ', ''),
(12, 2, 'Nam nunc ante', ''),
(12, 1, 'Nam nunc ante', ''),
(13, 2, 'Condimentum eu', ''),
(13, 1, 'Condimentum eu', ''),
(14, 2, 'Lehicula lorem', ''),
(14, 1, 'Lehicula lorem', ''),
(15, 2, 'Integer semper', ''),
(15, 1, 'Integer semper', ''),
(16, 2, 'Sollicitudin lacus', ''),
(16, 1, 'Sollicitudin lacus', ''),
(9, 2, 'Mobiles', ''),
(17, 2, 'Nam ipsum ', ''),
(17, 1, 'Nam ipsum ', ''),
(18, 2, 'Curabitur turpis ', ''),
(18, 1, 'Curabitur turpis ', ''),
(19, 1, 'Molestie eu mattis ', ''),
(19, 2, 'Molestie eu mattis ', ''),
(20, 1, 'Suspendisse eu ', ''),
(20, 2, 'Suspendisse eu ', ''),
(21, 1, 'Nunc imperdiet ', ''),
(21, 2, 'Nunc imperdiet ', ''),
(22, 1, 'Mauris mattis', ''),
(22, 2, 'Mauris mattis', ''),
(23, 1, 'Lacus sed iaculis ', ''),
(23, 2, 'Lacus sed iaculis ', ''),
(5, 2, 'Laptops &amp; Notebooks', ''),
(25, 1, 'Aliquam', ''),
(25, 2, 'Aliquam', ''),
(26, 1, 'Claritas', ''),
(26, 2, 'Claritas', ''),
(27, 2, 'Consectetuer', ''),
(27, 1, 'Consectetuer', ''),
(28, 1, 'Hendrerit', ''),
(28, 2, 'Hendrerit', ''),
(29, 1, 'Litterarum', ''),
(29, 2, 'Litterarum', ''),
(30, 1, 'Macs', ''),
(30, 2, 'Macs', ''),
(3, 1, 'Tablets', ''),
(3, 2, 'Tablets', ''),
(40, 2, 'Home', ''),
(7, 2, ' Software ', ''),
(37, 2, 'Phones &amp; PDAs ', ''),
(41, 2, 'Curabitur semper', ''),
(41, 1, 'Curabitur semper', ''),
(40, 1, 'Home', '');
	";
 

$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."megamenu_widgets` (`id`, `name`, `type`, `params`, `store_id`) VALUES
(1, 'Video Opencart Installation', 'video_code', 'a:1:{s:10:\"video_code\";s:168:\"&lt;iframe width=&quot;300&quot; height=&quot;315&quot; src=&quot;//www.youtube.com/embed/cUhPA5qIxDQ&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;\";}', 0),
(2, 'Demo HTML ', 'html', 'a:1:{s:4:\"html\";a:2:{i:1;s:159:\"&lt;p&gt;&lt;img src=&quot;image/data/img-menu.jpg&quot; /&gt;&lt;/p&gt;\r\nFusce a congue purus, sit amet sollicitudin libero. In hac habitasse platea dictumst.\";i:2;s:159:\"&lt;p&gt;&lt;img src=&quot;image/data/img-menu.jpg&quot; /&gt;&lt;/p&gt;\r\nFusce a congue purus, sit amet sollicitudin libero. In hac habitasse platea dictumst.\";}}', 0),
(3, 'Products Special', 'product_list', 'a:4:{s:9:\"list_type\";s:7:\"special\";s:5:\"limit\";s:1:\"3\";s:11:\"image_width\";s:2:\"60\";s:12:\"image_height\";s:2:\"65\";}', 0),
(4, 'Products In Cat 20', 'product_category', 'a:4:{s:11:\"category_id\";s:2:\"20\";s:5:\"limit\";s:1:\"6\";s:11:\"image_width\";s:3:\"120\";s:12:\"image_height\";s:3:\"120\";}', 0),
(5, 'Manufactures', 'banner', 'a:4:{s:8:\"group_id\";s:1:\"8\";s:11:\"image_width\";s:2:\"80\";s:12:\"image_height\";s:2:\"80\";s:5:\"limit\";s:2:\"12\";}', 0),
(6, 'PavoThemes Feed', 'feed', 'a:1:{s:8:\"feed_url\";s:55:\"http://www.pavothemes.com/opencart-themes.feed?type=rss\";}', 0),
(8, 'Category', 'html', 'a:1:{s:4:\"html\";a:2:{i:1;s:939:\"&lt;ul class=&quot;list&quot;&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=20&quot;&gt;Tablet&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=18&quot;&gt;Laptops&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=25&quot;&gt;Mobile Phone&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=33&quot;&gt;Cameras&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;amp;path=24&quot;&gt;Cake &lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;amp;path=34&quot;&gt;Burgers&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n	  &lt;a href=&quot;index.php?route=product/category&amp;amp;path=20_26&quot;&gt; PC&lt;/a&gt;\r\n  &lt;/li&gt;\r\n&lt;/ul&gt;\";i:2;s:939:\"&lt;ul class=&quot;list&quot;&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=20&quot;&gt;Tablet&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=18&quot;&gt;Laptops&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=25&quot;&gt;Mobile Phone&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;path=33&quot;&gt;Cameras&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;amp;path=24&quot;&gt;Cake &lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n      &lt;a href=&quot;index.php?route=product/category&amp;amp;path=34&quot;&gt;Burgers&lt;/a&gt;\r\n    &lt;/li&gt;\r\n  &lt;li&gt;\r\n	  &lt;a href=&quot;index.php?route=product/category&amp;amp;path=20_26&quot;&gt; PC&lt;/a&gt;\r\n  &lt;/li&gt;\r\n&lt;/ul&gt;\";}}', 0);
   ";
   
$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `group`='pavmegamenu' and `key` = 'pavmegamenu_module'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu', 'pavmegamenu_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:5:\"99999\";s:8:\"position\";s:8:\"mainmenu\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";i:1;}}', 1);";

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `group`='pavmegamenu_params' and `key` = 'params'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu_params', 'params', '[{\"submenu\":1,\"subwidth\":700,\"id\":2,\"cols\":3,\"group\":0,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":3},{\"type\":\"menu\",\"colwidth\":3},{\"type\":\"menu\",\"colwidth\":6}]}]},{\"submenu\":1,\"cols\":1,\"group\":1,\"id\":8,\"rows\":[]},{\"submenu\":1,\"cols\":1,\"group\":1,\"id\":9,\"rows\":[]},{\"submenu\":1,\"subwidth\":900,\"id\":5,\"cols\":\"\",\"group\":0,\"rows\":[{\"cols\":[{\"widgets\":\"wid-8\",\"colwidth\":3},{\"widgets\":\"wid-2\",\"colwidth\":5},{\"widgets\":\"wid-3\",\"colwidth\":4}]}]},{\"submenu\":1,\"cols\":1,\"group\":0,\"id\":3,\"rows\":[{\"cols\":[{\"colwidth\":12,\"type\":\"menu\"}]}]}]', 0);
";  


?>