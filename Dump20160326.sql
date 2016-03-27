-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pos.ae
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pos_commentmeta`
--

DROP TABLE IF EXISTS `pos_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_commentmeta`
--

LOCK TABLES `pos_commentmeta` WRITE;
/*!40000 ALTER TABLE `pos_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_comments`
--

DROP TABLE IF EXISTS `pos_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_comments`
--

LOCK TABLES `pos_comments` WRITE;
/*!40000 ALTER TABLE `pos_comments` DISABLE KEYS */;
INSERT INTO `pos_comments` VALUES (1,1,'Mr WordPress','','https://wordpress.org/','','2016-02-25 04:54:03','2016-02-25 04:54:03','Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'1','','',0,0);
/*!40000 ALTER TABLE `pos_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_links`
--

DROP TABLE IF EXISTS `pos_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_links`
--

LOCK TABLES `pos_links` WRITE;
/*!40000 ALTER TABLE `pos_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_options`
--

DROP TABLE IF EXISTS `pos_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1589 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_options`
--

LOCK TABLES `pos_options` WRITE;
/*!40000 ALTER TABLE `pos_options` DISABLE KEYS */;
INSERT INTO `pos_options` VALUES (1,'siteurl','http://localhost/pos.ae','yes'),(2,'home','http://localhost/pos.ae','yes'),(3,'blogname','Kanto Freestyle','yes'),(4,'blogdescription','Just another WordPress site','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','mabugay.carl@gmail.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'hack_file','0','yes'),(30,'blog_charset','UTF-8','yes'),(31,'moderation_keys','','no'),(32,'active_plugins','a:3:{i:0;s:33:\"admin-menu-editor/menu-editor.php\";i:1;s:61:\"woocommerce-point-of-sale-pos-6/woocommerce-point-of-sale.php\";i:2;s:27:\"woocommerce/woocommerce.php\";}','yes'),(33,'category_base','','yes'),(34,'ping_sites','http://rpc.pingomatic.com/','yes'),(35,'comment_max_links','2','yes'),(36,'gmt_offset','0','yes'),(37,'default_email_category','1','yes'),(38,'recently_edited','a:3:{i:0;s:66:\"C:\\xampp\\htdocs\\pos.ae/wp-content/themes/twentysixteen/sidebar.php\";i:2;s:64:\"C:\\xampp\\htdocs\\pos.ae/wp-content/themes/twentysixteen/style.css\";i:3;s:0:\"\";}','no'),(39,'template','twentysixteen','yes'),(40,'stylesheet','twentysixteen','yes'),(41,'comment_whitelist','1','yes'),(42,'blacklist_keys','','no'),(43,'comment_registration','0','yes'),(44,'html_type','text/html','yes'),(45,'use_trackback','0','yes'),(46,'default_role','subscriber','yes'),(47,'db_version','35700','yes'),(48,'uploads_use_yearmonth_folders','1','yes'),(49,'upload_path','','yes'),(50,'blog_public','1','yes'),(51,'default_link_category','2','yes'),(52,'show_on_front','posts','yes'),(53,'tag_base','','yes'),(54,'show_avatars','1','yes'),(55,'avatar_rating','G','yes'),(56,'upload_url_path','','yes'),(57,'thumbnail_size_w','150','yes'),(58,'thumbnail_size_h','150','yes'),(59,'thumbnail_crop','1','yes'),(60,'medium_size_w','300','yes'),(61,'medium_size_h','300','yes'),(62,'avatar_default','mystery','yes'),(63,'large_size_w','1024','yes'),(64,'large_size_h','1024','yes'),(65,'image_default_link_type','none','yes'),(66,'image_default_size','','yes'),(67,'image_default_align','','yes'),(68,'close_comments_for_old_posts','0','yes'),(69,'close_comments_days_old','14','yes'),(70,'thread_comments','1','yes'),(71,'thread_comments_depth','5','yes'),(72,'page_comments','0','yes'),(73,'comments_per_page','50','yes'),(74,'default_comments_page','newest','yes'),(75,'comment_order','asc','yes'),(76,'sticky_posts','a:0:{}','yes'),(77,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(78,'widget_text','a:0:{}','yes'),(79,'widget_rss','a:0:{}','yes'),(80,'uninstall_plugins','a:0:{}','no'),(81,'timezone_string','','yes'),(82,'page_for_posts','0','yes'),(83,'page_on_front','0','yes'),(84,'default_post_format','0','yes'),(85,'link_manager_enabled','0','yes'),(86,'finished_splitting_shared_terms','1','yes'),(87,'site_icon','0','yes'),(88,'medium_large_size_w','768','yes'),(89,'medium_large_size_h','0','yes'),(90,'initial_db_version','35700','yes'),(91,'pos_user_roles','a:9:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:133:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:17:\"edit_shop_webhook\";b:1;s:17:\"read_shop_webhook\";b:1;s:19:\"delete_shop_webhook\";b:1;s:18:\"edit_shop_webhooks\";b:1;s:25:\"edit_others_shop_webhooks\";b:1;s:21:\"publish_shop_webhooks\";b:1;s:26:\"read_private_shop_webhooks\";b:1;s:20:\"delete_shop_webhooks\";b:1;s:28:\"delete_private_shop_webhooks\";b:1;s:30:\"delete_published_shop_webhooks\";b:1;s:27:\"delete_others_shop_webhooks\";b:1;s:26:\"edit_private_shop_webhooks\";b:1;s:28:\"edit_published_shop_webhooks\";b:1;s:25:\"manage_shop_webhook_terms\";b:1;s:23:\"edit_shop_webhook_terms\";b:1;s:25:\"delete_shop_webhook_terms\";b:1;s:25:\"assign_shop_webhook_terms\";b:1;s:13:\"view_register\";b:1;s:23:\"manage_wc_point_of_sale\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop Manager\";s:12:\"capabilities\";a:110:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:15:\"unfiltered_html\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:17:\"edit_shop_webhook\";b:1;s:17:\"read_shop_webhook\";b:1;s:19:\"delete_shop_webhook\";b:1;s:18:\"edit_shop_webhooks\";b:1;s:25:\"edit_others_shop_webhooks\";b:1;s:21:\"publish_shop_webhooks\";b:1;s:26:\"read_private_shop_webhooks\";b:1;s:20:\"delete_shop_webhooks\";b:1;s:28:\"delete_private_shop_webhooks\";b:1;s:30:\"delete_published_shop_webhooks\";b:1;s:27:\"delete_others_shop_webhooks\";b:1;s:26:\"edit_private_shop_webhooks\";b:1;s:28:\"edit_published_shop_webhooks\";b:1;s:25:\"manage_shop_webhook_terms\";b:1;s:23:\"edit_shop_webhook_terms\";b:1;s:25:\"delete_shop_webhook_terms\";b:1;s:25:\"assign_shop_webhook_terms\";b:1;}}s:7:\"cashier\";a:2:{s:4:\"name\";s:7:\"Cashier\";s:12:\"capabilities\";a:8:{s:4:\"read\";b:1;s:10:\"edit_posts\";b:0;s:12:\"delete_posts\";b:0;s:10:\"list_users\";b:1;s:13:\"view_register\";b:1;s:24:\"read_private_shop_orders\";b:1;s:21:\"read_private_products\";b:1;s:25:\"read_private_shop_coupons\";b:1;}}s:11:\"pos_manager\";a:2:{s:4:\"name\";s:11:\"POS Manager\";s:12:\"capabilities\";a:112:{s:4:\"read\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:12:\"delete_posts\";b:1;s:15:\"unfiltered_html\";b:1;s:12:\"upload_files\";b:1;s:10:\"list_users\";b:1;s:13:\"view_register\";b:1;s:24:\"read_private_shop_orders\";b:1;s:21:\"read_private_products\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:23:\"manage_wc_point_of_sale\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:18:\"manage_woocommerce\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:17:\"edit_shop_webhook\";b:1;s:17:\"read_shop_webhook\";b:1;s:19:\"delete_shop_webhook\";b:1;s:18:\"edit_shop_webhooks\";b:1;s:25:\"edit_others_shop_webhooks\";b:1;s:21:\"publish_shop_webhooks\";b:1;s:26:\"read_private_shop_webhooks\";b:1;s:20:\"delete_shop_webhooks\";b:1;s:28:\"delete_private_shop_webhooks\";b:1;s:30:\"delete_published_shop_webhooks\";b:1;s:27:\"delete_others_shop_webhooks\";b:1;s:26:\"edit_private_shop_webhooks\";b:1;s:28:\"edit_published_shop_webhooks\";b:1;s:25:\"manage_shop_webhook_terms\";b:1;s:23:\"edit_shop_webhook_terms\";b:1;s:25:\"delete_shop_webhook_terms\";b:1;s:25:\"assign_shop_webhook_terms\";b:1;}}}','yes'),(92,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(97,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(99,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'cron','a:9:{i:1459004170;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1459011244;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1459012286;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1459036800;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1459054715;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1459055486;a:1:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1459055643;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1459425600;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}','yes'),(108,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.4.2\";s:7:\"version\";s:5:\"4.4.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.4\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1459000571;s:15:\"version_checked\";s:5:\"4.4.2\";s:12:\"translations\";a:0:{}}','yes'),(113,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1459000574;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"1.4\";s:14:\"twentyfourteen\";s:3:\"1.6\";s:13:\"twentysixteen\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','yes'),(116,'can_compress_scripts','1','yes'),(129,'_transient_timeout_plugin_slugs','1459087150','no'),(130,'_transient_plugin_slugs','a:5:{i:0;s:33:\"admin-menu-editor/menu-editor.php\";i:1;s:19:\"akismet/akismet.php\";i:2;s:9:\"hello.php\";i:3;s:27:\"woocommerce/woocommerce.php\";i:4;s:61:\"woocommerce-point-of-sale-pos-6/woocommerce-point-of-sale.php\";}','no'),(138,'woocommerce_default_country','PH:00','yes'),(139,'woocommerce_allowed_countries','specific','yes'),(140,'woocommerce_specific_allowed_countries','a:1:{i:0;s:2:\"PH\";}','yes'),(141,'woocommerce_default_customer_address','','yes'),(142,'woocommerce_demo_store','no','yes'),(143,'woocommerce_demo_store_notice','This is a demo store for testing purposes &mdash; no orders shall be fulfilled.','no'),(144,'woocommerce_currency','PHP','yes'),(145,'woocommerce_currency_pos','left','yes'),(146,'woocommerce_price_thousand_sep',',','yes'),(147,'woocommerce_price_decimal_sep','.','yes'),(148,'woocommerce_price_num_decimals','2','yes'),(149,'woocommerce_weight_unit','lbs','yes'),(150,'woocommerce_dimension_unit','in','yes'),(151,'woocommerce_enable_review_rating','no','no'),(152,'woocommerce_review_rating_required','yes','no'),(153,'woocommerce_review_rating_verification_label','yes','no'),(154,'woocommerce_review_rating_verification_required','no','no'),(155,'woocommerce_shop_page_id','','yes'),(156,'woocommerce_shop_page_display','','yes'),(157,'woocommerce_category_archive_display','','yes'),(158,'woocommerce_default_catalog_orderby','menu_order','yes'),(159,'woocommerce_cart_redirect_after_add','no','yes'),(160,'woocommerce_enable_ajax_add_to_cart','yes','yes'),(161,'shop_catalog_image_size','a:3:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";s:4:\"crop\";i:1;}','yes'),(162,'shop_single_image_size','a:3:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"600\";s:4:\"crop\";i:1;}','yes'),(163,'shop_thumbnail_image_size','a:3:{s:5:\"width\";s:3:\"180\";s:6:\"height\";s:3:\"180\";s:4:\"crop\";i:1;}','yes'),(164,'woocommerce_enable_lightbox','yes','yes'),(165,'woocommerce_manage_stock','yes','yes'),(166,'woocommerce_hold_stock_minutes','60','no'),(167,'woocommerce_notify_low_stock','yes','no'),(168,'woocommerce_notify_no_stock','yes','no'),(169,'woocommerce_stock_email_recipient','mabugay.carl@gmail.com','no'),(170,'woocommerce_notify_low_stock_amount','2','no'),(171,'woocommerce_notify_no_stock_amount','0','no'),(172,'woocommerce_hide_out_of_stock_items','yes','yes'),(173,'woocommerce_stock_format','','yes'),(174,'woocommerce_file_download_method','force','no'),(175,'woocommerce_downloads_require_login','no','no'),(176,'woocommerce_downloads_grant_access_after_payment','yes','no'),(177,'woocommerce_calc_taxes','no','yes'),(178,'woocommerce_prices_include_tax','no','yes'),(179,'woocommerce_tax_based_on','shipping','yes'),(180,'woocommerce_shipping_tax_class','title','yes'),(181,'woocommerce_tax_round_at_subtotal','no','yes'),(182,'woocommerce_tax_classes','Reduced Rate\r\nZero Rate','yes'),(183,'woocommerce_tax_display_shop','excl','yes'),(184,'woocommerce_tax_display_cart','excl','no'),(185,'woocommerce_price_display_suffix','','yes'),(186,'woocommerce_tax_total_display','itemized','no'),(187,'woocommerce_enable_coupons','yes','no'),(188,'woocommerce_calc_discounts_sequentially','no','no'),(189,'woocommerce_enable_guest_checkout','yes','no'),(190,'woocommerce_force_ssl_checkout','no','yes'),(191,'woocommerce_unforce_ssl_checkout','no','yes'),(192,'woocommerce_cart_page_id','','yes'),(193,'woocommerce_checkout_page_id','','yes'),(194,'woocommerce_terms_page_id','','no'),(195,'woocommerce_checkout_pay_endpoint','order-pay','yes'),(196,'woocommerce_checkout_order_received_endpoint','order-received','yes'),(197,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','yes'),(198,'woocommerce_calc_shipping','no','yes'),(199,'woocommerce_enable_shipping_calc','yes','no'),(200,'woocommerce_shipping_cost_requires_address','no','no'),(201,'woocommerce_ship_to_destination','billing','no'),(202,'woocommerce_ship_to_countries','','yes'),(203,'woocommerce_specific_ship_to_countries','','yes'),(204,'woocommerce_myaccount_page_id','','yes'),(205,'woocommerce_myaccount_view_order_endpoint','view-order','yes'),(206,'woocommerce_myaccount_edit_account_endpoint','edit-account','yes'),(207,'woocommerce_myaccount_edit_address_endpoint','edit-address','yes'),(208,'woocommerce_myaccount_lost_password_endpoint','lost-password','yes'),(209,'woocommerce_logout_endpoint','customer-logout','yes'),(210,'woocommerce_enable_signup_and_login_from_checkout','yes','no'),(211,'woocommerce_enable_myaccount_registration','no','no'),(212,'woocommerce_enable_checkout_login_reminder','yes','no'),(213,'woocommerce_registration_generate_username','yes','no'),(214,'woocommerce_registration_generate_password','no','no'),(215,'woocommerce_email_from_name','Kanto Freestyle','no'),(216,'woocommerce_email_from_address','mabugay.carl@gmail.com','no'),(217,'woocommerce_email_header_image','','no'),(218,'woocommerce_email_footer_text','Kanto Freestyle - Powered by WooCommerce','no'),(219,'woocommerce_email_base_color','#557da1','no'),(220,'woocommerce_email_background_color','#f5f5f5','no'),(221,'woocommerce_email_body_background_color','#fdfdfd','no'),(222,'woocommerce_email_text_color','#505050','no'),(223,'woocommerce_api_enabled','yes','yes'),(225,'woocommerce_admin_notices','a:0:{}','yes'),(228,'woocommerce_db_version','2.5.2','yes'),(229,'woocommerce_version','2.5.2','yes'),(231,'recently_activated','a:0:{}','yes'),(233,'_transient_woocommerce_webhook_ids','a:0:{}','yes'),(234,'widget_woocommerce_widget_cart','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(235,'widget_woocommerce_layered_nav_filters','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(236,'widget_woocommerce_layered_nav','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(237,'widget_woocommerce_price_filter','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(238,'widget_woocommerce_product_categories','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(239,'widget_woocommerce_product_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(240,'widget_woocommerce_product_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(241,'widget_woocommerce_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(242,'widget_woocommerce_recent_reviews','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(243,'widget_woocommerce_recently_viewed_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(244,'widget_woocommerce_top_rated_products','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(245,'_transient_wc_attribute_taxonomies','a:0:{}','yes'),(247,'woocommerce_meta_box_errors','a:0:{}','yes'),(262,'wc_pos_custom_product_id','7','yes'),(263,'wc_pos_admin_notices','a:0:{}','yes'),(267,'wc_pos_db_version','3.0.5','yes'),(269,'_pos_default_receipt','1','yes'),(272,'wc_pos_default_country','PH:00','yes'),(273,'woocommerce_pos_register_discount_presets','a:4:{i:0;s:1:\"5\";i:1;s:2:\"10\";i:2;s:2:\"15\";i:3;s:2:\"20\";}','yes'),(274,'woocommerce_pos_register_instant_quantity','yes','yes'),(275,'woocommerce_pos_register_instant_quantity_keypad','yes','yes'),(276,'wc_pos_tile_layout','image_title_price','yes'),(277,'wc_pos_tile_variables','tiles','yes'),(278,'woocommerce_pos_end_of_sale_order_status','processing','yes'),(279,'wc_pos_save_order_status','wc-pending','yes'),(280,'wc_pos_load_order_status','a:1:{i:0;s:10:\"wc-pending\";}','yes'),(281,'wc_pos_load_web_order','no','yes'),(282,'woocommerce_pos_register_ready_to_scan','no','yes'),(283,'woocommerce_pos_register_cc_scanning','no','yes'),(286,'woocommerce_pos_calculate_tax_based_on','outlet','yes'),(287,'woocommerce_pos_tax_calculation','disabled','yes'),(288,'woocommerce_pos_tax_default_customer_address','outlet','yes'),(289,'wc_pos_email_notifications','no','yes'),(290,'wc_pos_automatic_emails','yes','yes'),(291,'pos_enabled_gateways','a:1:{i:0;s:12:\"pos_chip_pin\";}','yes'),(292,'pos_exist_gateways','a:5:{i:0;s:4:\"bacs\";i:1;s:6:\"cheque\";i:2;s:3:\"cod\";i:3;s:6:\"paypal\";i:4;s:12:\"pos_chip_pin\";}','yes'),(352,'_transient_product_query-transient-version','1456994349','yes'),(353,'_transient_product-transient-version','1456989190','yes'),(360,'_transient_orders-transient-version','1459000669','yes'),(494,'ws_menu_editor','a:18:{s:22:\"hide_advanced_settings\";b:1;s:16:\"show_extra_icons\";b:0;s:11:\"custom_menu\";a:3:{s:4:\"tree\";a:9:{s:9:\"index.php\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:0;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:10:\">index.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:2:{i:0;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:0;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:19:\"index.php>index.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:4:\"Home\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:9:\"index.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:0;s:6:\"parent\";s:9:\"index.php\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:19:\"index.php>index.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:9:\"index.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:1;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:1;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:25:\"index.php>update-core.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:111:\"Updates <span class=\'update-plugins count-1\' title=\'1 Plugin Update\'><span class=\'update-count\'>1</span></span>\";s:12:\"access_level\";s:11:\"update_core\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:15:\"update-core.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:1;s:6:\"parent\";s:9:\"index.php\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:25:\"index.php>update-core.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:15:\"update-core.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:9:\"Dashboard\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:9:\"index.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:0;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:43:\"menu-top menu-top-first menu-icon-dashboard\";s:8:\"hookname\";s:14:\"menu-dashboard\";s:8:\"icon_url\";s:19:\"dashicons-dashboard\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:10:\">index.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:9:\"index.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:11:\"separator_4\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:1;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:1;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:12:\">separator_4\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:0:\"\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"separator_4\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:1;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:17:\"wp-menu-separator\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:1;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:12:\">separator_4\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:0:\"\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:26:\"edit.php?post_type=product\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";s:9:\"Inventory\";s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:2;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:27:\">edit.php?post_type=product\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:6:{i:0;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:0;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:53:\"edit.php?post_type=product>edit.php?post_type=product\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:8:\"Products\";s:12:\"access_level\";s:13:\"edit_products\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:26:\"edit.php?post_type=product\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:0;s:6:\"parent\";s:26:\"edit.php?post_type=product\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:53:\"edit.php?post_type=product>edit.php?post_type=product\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:26:\"edit.php?post_type=product\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:1;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:1;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:57:\"edit.php?post_type=product>post-new.php?post_type=product\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:11:\"Add Product\";s:12:\"access_level\";s:13:\"edit_products\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:30:\"post-new.php?post_type=product\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:1;s:6:\"parent\";s:26:\"edit.php?post_type=product\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:57:\"edit.php?post_type=product>post-new.php?post_type=product\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:30:\"post-new.php?post_type=product\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:2;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:2;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:83:\"edit.php?post_type=product>edit-tags.php?taxonomy=product_cat&amp;post_type=product\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:10:\"Categories\";s:12:\"access_level\";s:20:\"manage_product_terms\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:56:\"edit-tags.php?taxonomy=product_cat&amp;post_type=product\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:2;s:6:\"parent\";s:26:\"edit.php?post_type=product\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:83:\"edit.php?post_type=product>edit-tags.php?taxonomy=product_cat&amp;post_type=product\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:52:\"edit-tags.php?taxonomy=product_cat&post_type=product\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:3;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:3;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:83:\"edit.php?post_type=product>edit-tags.php?taxonomy=product_tag&amp;post_type=product\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:4:\"Tags\";s:12:\"access_level\";s:20:\"manage_product_terms\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:56:\"edit-tags.php?taxonomy=product_tag&amp;post_type=product\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:3;s:6:\"parent\";s:26:\"edit.php?post_type=product\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:83:\"edit.php?post_type=product>edit-tags.php?taxonomy=product_tag&amp;post_type=product\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:52:\"edit-tags.php?taxonomy=product_tag&post_type=product\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:4;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:4;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:94:\"edit.php?post_type=product>edit-tags.php?taxonomy=product_shipping_class&amp;post_type=product\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:16:\"Shipping Classes\";s:12:\"access_level\";s:20:\"manage_product_terms\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:67:\"edit-tags.php?taxonomy=product_shipping_class&amp;post_type=product\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:4;s:6:\"parent\";s:26:\"edit.php?post_type=product\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:94:\"edit.php?post_type=product>edit-tags.php?taxonomy=product_shipping_class&amp;post_type=product\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:63:\"edit-tags.php?taxonomy=product_shipping_class&post_type=product\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:5;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:5;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:45:\"edit.php?post_type=product>product_attributes\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:10:\"Attributes\";s:10:\"menu_title\";s:10:\"Attributes\";s:12:\"access_level\";s:20:\"manage_product_terms\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:18:\"product_attributes\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:5;s:6:\"parent\";s:26:\"edit.php?post_type=product\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:45:\"edit.php?post_type=product>product_attributes\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:50:\"edit.php?post_type=product&page=product_attributes\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:8:\"Products\";s:12:\"access_level\";s:13:\"edit_products\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:26:\"edit.php?post_type=product\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:2;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:26:\"menu-top menu-icon-product\";s:8:\"hookname\";s:18:\"menu-posts-product\";s:8:\"icon_url\";s:20:\"dashicons-admin-post\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:27:\">edit.php?post_type=product\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:26:\"edit.php?post_type=product\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:11:\"woocommerce\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";s:5:\"Sales\";s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:3;s:6:\"parent\";N;s:9:\"css_class\";s:35:\"menu-top  toplevel_page_woocommerce\";s:8:\"hookname\";N;s:8:\"icon_url\";s:19:\"dashicons-chart-bar\";s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";b:0;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:12:\">woocommerce\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:6:{i:0;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:0;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:41:\"woocommerce>edit.php?post_type=shop_order\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:6:\"Orders\";s:10:\"menu_title\";s:6:\"Orders\";s:12:\"access_level\";s:16:\"edit_shop_orders\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:29:\"edit.php?post_type=shop_order\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:0;s:6:\"parent\";s:11:\"woocommerce\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:41:\"woocommerce>edit.php?post_type=shop_order\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:29:\"edit.php?post_type=shop_order\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:1;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:1;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:42:\"woocommerce>edit.php?post_type=shop_coupon\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:7:\"Coupons\";s:10:\"menu_title\";s:7:\"Coupons\";s:12:\"access_level\";s:17:\"edit_shop_coupons\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:30:\"edit.php?post_type=shop_coupon\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:1;s:6:\"parent\";s:11:\"woocommerce\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:42:\"woocommerce>edit.php?post_type=shop_coupon\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:30:\"edit.php?post_type=shop_coupon\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:2;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:2;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:22:\"woocommerce>wc-reports\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:7:\"Reports\";s:10:\"menu_title\";s:7:\"Reports\";s:12:\"access_level\";s:24:\"view_woocommerce_reports\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:10:\"wc-reports\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:2;s:6:\"parent\";s:11:\"woocommerce\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:22:\"woocommerce>wc-reports\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:25:\"admin.php?page=wc-reports\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:3;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:3;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:23:\"woocommerce>wc-settings\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:20:\"WooCommerce Settings\";s:10:\"menu_title\";s:8:\"Settings\";s:12:\"access_level\";s:18:\"manage_woocommerce\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"wc-settings\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:3;s:6:\"parent\";s:11:\"woocommerce\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:23:\"woocommerce>wc-settings\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:26:\"admin.php?page=wc-settings\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:4;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:4;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:21:\"woocommerce>wc-status\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:18:\"WooCommerce Status\";s:10:\"menu_title\";s:13:\"System Status\";s:12:\"access_level\";s:18:\"manage_woocommerce\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:9:\"wc-status\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:4;s:6:\"parent\";s:11:\"woocommerce\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:21:\"woocommerce>wc-status\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:24:\"admin.php?page=wc-status\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:5;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:5;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:21:\"woocommerce>wc-addons\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:30:\"WooCommerce Add-ons/Extensions\";s:10:\"menu_title\";s:7:\"Add-ons\";s:12:\"access_level\";s:18:\"manage_woocommerce\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:9:\"wc-addons\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:5;s:6:\"parent\";s:11:\"woocommerce\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:21:\"woocommerce>wc-addons\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:24:\"admin.php?page=wc-addons\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:11:\"WooCommerce\";s:10:\"menu_title\";s:11:\"WooCommerce\";s:12:\"access_level\";s:18:\"manage_woocommerce\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"woocommerce\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:3;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:52:\"menu-top menu-icon-generic toplevel_page_woocommerce\";s:8:\"hookname\";s:25:\"toplevel_page_woocommerce\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:12:\">woocommerce\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:11:\"woocommerce\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:16:\"wc_point_of_sale\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:4;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:17:\">wc_point_of_sale\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:9:{i:0;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:0;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:33:\"wc_point_of_sale>wc_point_of_sale\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:13:\"Point of Sale\";s:10:\"menu_title\";s:13:\"Point of Sale\";s:12:\"access_level\";s:13:\"view_register\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:16:\"wc_point_of_sale\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:0;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:33:\"wc_point_of_sale>wc_point_of_sale\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:31:\"admin.php?page=wc_point_of_sale\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:1;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:1;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:33:\"wc_point_of_sale>wc_pos_registers\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:9:\"Registers\";s:10:\"menu_title\";s:9:\"Registers\";s:12:\"access_level\";s:13:\"view_register\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:16:\"wc_pos_registers\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:1;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:33:\"wc_point_of_sale>wc_pos_registers\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:31:\"admin.php?page=wc_pos_registers\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:2;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:2;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:31:\"wc_point_of_sale>wc_pos_outlets\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:7:\"Outlets\";s:10:\"menu_title\";s:7:\"Outlets\";s:12:\"access_level\";s:23:\"manage_wc_point_of_sale\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:14:\"wc_pos_outlets\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:2;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:31:\"wc_point_of_sale>wc_pos_outlets\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:29:\"admin.php?page=wc_pos_outlets\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:3;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:3;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:29:\"wc_point_of_sale>wc_pos_grids\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:13:\"Product Grids\";s:10:\"menu_title\";s:44:\"<span id=\"wc_pos_grids\">Product Grids</span>\";s:12:\"access_level\";s:23:\"manage_wc_point_of_sale\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:12:\"wc_pos_grids\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:3;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:29:\"wc_point_of_sale>wc_pos_grids\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:27:\"admin.php?page=wc_pos_grids\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:4;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:4;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:32:\"wc_point_of_sale>wc_pos_receipts\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:8:\"Receipts\";s:10:\"menu_title\";s:8:\"Receipts\";s:12:\"access_level\";s:23:\"manage_wc_point_of_sale\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:15:\"wc_pos_receipts\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:4;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:32:\"wc_point_of_sale>wc_pos_receipts\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:30:\"admin.php?page=wc_pos_receipts\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:5;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:5;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:29:\"wc_point_of_sale>wc_pos_users\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:8:\"Cashiers\";s:10:\"menu_title\";s:8:\"Cashiers\";s:12:\"access_level\";s:13:\"view_register\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:12:\"wc_pos_users\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:5;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:29:\"wc_point_of_sale>wc_pos_users\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:27:\"admin.php?page=wc_pos_users\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:6;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:6;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:32:\"wc_point_of_sale>wc_pos_barcodes\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:7:\"Barcode\";s:10:\"menu_title\";s:7:\"Barcode\";s:12:\"access_level\";s:23:\"manage_wc_point_of_sale\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:15:\"wc_pos_barcodes\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:6;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:32:\"wc_point_of_sale>wc_pos_barcodes\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:30:\"admin.php?page=wc_pos_barcodes\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:7;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:7;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:40:\"wc_point_of_sale>wc_pos_stock_controller\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:1;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:5:\"Stock\";s:10:\"menu_title\";s:5:\"Stock\";s:12:\"access_level\";s:23:\"manage_wc_point_of_sale\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:23:\"wc_pos_stock_controller\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:7;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:40:\"wc_point_of_sale>wc_pos_stock_controller\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:38:\"admin.php?page=wc_pos_stock_controller\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:8;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:8;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:32:\"wc_point_of_sale>wc_pos_settings\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:8:\"Settings\";s:10:\"menu_title\";s:8:\"Settings\";s:12:\"access_level\";s:23:\"manage_wc_point_of_sale\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:15:\"wc_pos_settings\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:8;s:6:\"parent\";s:16:\"wc_point_of_sale\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:32:\"wc_point_of_sale>wc_pos_settings\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:30:\"admin.php?page=wc_pos_settings\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:13:\"Point of Sale\";s:10:\"menu_title\";s:13:\"Point of Sale\";s:12:\"access_level\";s:13:\"view_register\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:16:\"wc_point_of_sale\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:4;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:57:\"menu-top menu-icon-generic toplevel_page_wc_point_of_sale\";s:8:\"hookname\";s:30:\"toplevel_page_wc_point_of_sale\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:17:\">wc_point_of_sale\";s:14:\"is_plugin_page\";b:1;s:6:\"custom\";b:0;s:3:\"url\";s:31:\"admin.php?page=wc_point_of_sale\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:11:\"separator_5\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:5;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:1;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:12:\">separator_5\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:0:\"\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"separator_5\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:5;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:17:\"wp-menu-separator\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:1;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:12:\">separator_5\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:0:\"\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:9:\"users.php\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:6;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:10:\">users.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:3:{i:0;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:0;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:19:\"users.php>users.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:9:\"All Users\";s:12:\"access_level\";s:10:\"list_users\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:9:\"users.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:0;s:6:\"parent\";s:9:\"users.php\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:19:\"users.php>users.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:9:\"users.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:1;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:1;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:22:\"users.php>user-new.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:7:\"Add New\";s:12:\"access_level\";s:12:\"create_users\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:12:\"user-new.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:1;s:6:\"parent\";s:9:\"users.php\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:22:\"users.php>user-new.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:12:\"user-new.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}i:2;a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:2;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:0;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:21:\"users.php>profile.php\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:12:\"Your Profile\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"profile.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:2;s:6:\"parent\";s:9:\"users.php\";s:9:\"css_class\";s:0:\"\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:21:\"users.php>profile.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:11:\"profile.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:5:\"Users\";s:12:\"access_level\";s:10:\"list_users\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:9:\"users.php\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:6;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:24:\"menu-top menu-icon-users\";s:8:\"hookname\";s:10:\"menu-users\";s:8:\"icon_url\";s:21:\"dashicons-admin-users\";s:9:\"separator\";b:0;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:10:\">users.php\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:9:\"users.php\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:11:\"separator_6\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:7;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:1;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:12:\">separator_6\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:0:\"\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"separator_6\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:7;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:17:\"wp-menu-separator\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:1;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:12:\">separator_6\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:0:\"\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}s:11:\"separator_7\";a:31:{s:10:\"page_title\";N;s:10:\"menu_title\";N;s:12:\"access_level\";N;s:16:\"extra_capability\";N;s:4:\"file\";N;s:12:\"page_heading\";N;s:8:\"position\";i:8;s:6:\"parent\";N;s:9:\"css_class\";N;s:8:\"hookname\";N;s:8:\"icon_url\";N;s:9:\"separator\";b:1;s:6:\"colors\";N;s:14:\"is_always_open\";N;s:7:\"open_in\";N;s:13:\"iframe_height\";N;s:11:\"template_id\";s:12:\">separator_7\";s:14:\"is_plugin_page\";N;s:6:\"custom\";b:0;s:3:\"url\";N;s:16:\"embedded_page_id\";N;s:21:\"embedded_page_blog_id\";N;s:5:\"items\";a:0:{}s:12:\"grant_access\";a:0:{}s:7:\"missing\";b:0;s:6:\"unused\";b:0;s:6:\"hidden\";b:0;s:17:\"hidden_from_actor\";a:0:{}s:24:\"restrict_access_to_items\";b:0;s:24:\"had_access_before_hiding\";N;s:8:\"defaults\";a:22:{s:10:\"page_title\";s:0:\"\";s:10:\"menu_title\";s:0:\"\";s:12:\"access_level\";s:4:\"read\";s:16:\"extra_capability\";s:0:\"\";s:4:\"file\";s:11:\"separator_7\";s:12:\"page_heading\";s:0:\"\";s:8:\"position\";i:8;s:6:\"parent\";s:0:\"\";s:9:\"css_class\";s:29:\"wp-menu-separator woocommerce\";s:8:\"hookname\";s:0:\"\";s:8:\"icon_url\";s:23:\"dashicons-admin-generic\";s:9:\"separator\";b:1;s:6:\"colors\";b:0;s:14:\"is_always_open\";b:0;s:7:\"open_in\";s:11:\"same_window\";s:13:\"iframe_height\";i:0;s:11:\"template_id\";s:12:\">separator_7\";s:14:\"is_plugin_page\";b:0;s:6:\"custom\";b:0;s:3:\"url\";s:0:\"\";s:16:\"embedded_page_id\";i:0;s:21:\"embedded_page_blog_id\";i:1;}}}s:6:\"format\";a:3:{s:4:\"name\";s:22:\"Admin Menu Editor menu\";s:7:\"version\";s:3:\"6.3\";s:13:\"is_normalized\";b:1;}s:13:\"color_presets\";a:0:{}}s:18:\"first_install_time\";i:1456385044;s:21:\"display_survey_notice\";b:1;s:17:\"plugin_db_version\";i:140;s:24:\"security_logging_enabled\";b:0;s:17:\"menu_config_scope\";s:6:\"global\";s:13:\"plugin_access\";s:14:\"manage_options\";s:15:\"allowed_user_id\";N;s:28:\"plugins_page_allowed_user_id\";N;s:27:\"show_deprecated_hide_button\";b:1;s:37:\"dashboard_hiding_confirmation_enabled\";b:1;s:21:\"submenu_icons_enabled\";s:9:\"if_custom\";s:16:\"ui_colour_scheme\";s:7:\"classic\";s:13:\"visible_users\";a:0:{}s:23:\"show_plugin_menu_notice\";b:0;s:20:\"unused_item_position\";s:8:\"relative\";}','yes'),(553,'woocommerce_pos_company_logo','12','yes'),(554,'tax_pos_options','','yes'),(555,'woocommerce_pos_register_layout','two','yes'),(556,'woocommerce_pos_second_column_layout','product_grids','yes'),(557,'woocommerce_pos_register_layout_text','','yes'),(558,'woocommerce_pos_register_layout_admin_bar','yes','yes'),(559,'wc_pos_lock_screen','no','yes'),(560,'wc_pos_unlock_pass','','yes'),(581,'general_pos_options','','yes'),(582,'wc_pos_show_stock','yes','yes'),(583,'wc_pos_show_out_of_stock_products','yes','yes'),(584,'woocommerce_pos_order_filters','a:0:{}','yes'),(585,'woocommerce_pos_force_ssl_checkout','no','yes'),(586,'wc_pos_disable_sound_notifications','no','yes'),(587,'checkout_pos_options','','yes'),(588,'general_options','','yes'),(589,'tile_options','','yes'),(590,'wc_pos_display_image_size','thumbnail','yes'),(591,'wc_pos_default_tile_orderby','menu_order','yes'),(592,'status_options','','yes'),(593,'scanning_options','','yes'),(594,'account_options','','yes'),(595,'checkout_page_options','','yes'),(596,'woocommerce_pos_end_of_sale_username_add_customer','1','yes'),(597,'wc_pos_load_customer_after_selecting','no','yes'),(598,'email_options','','yes'),(680,'pricing_options','','yes'),(689,'product_measurement_options','','yes'),(690,'product_rating_options','','yes'),(696,'product_inventory_options','','yes'),(698,'_transient_woocommerce_cache_excluded_uris','a:0:{}','yes'),(914,'product_cat_children','a:0:{}','yes'),(934,'_transient_timeout_wc_related_7','1457081478','no'),(935,'_transient_wc_related_7','a:0:{}','no'),(938,'_transient_timeout_wc_related_15','1457080750','no'),(939,'_transient_wc_related_15','a:0:{}','no'),(940,'_transient_timeout_wc_related_9','1457071315','no'),(941,'_transient_wc_related_9','a:0:{}','no'),(1067,'_transient_timeout_wc_related_20','1457071315','no'),(1068,'_transient_wc_related_20','a:0:{}','no'),(1095,'_site_transient_timeout_browser_06d3d9617a2883877c8f5e774e52c741','1457590090','yes'),(1096,'_site_transient_browser_06d3d9617a2883877c8f5e774e52c741','a:9:{s:8:\"platform\";s:7:\"Windows\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"48.0.2564.116\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}','yes'),(1266,'_transient_shipping-transient-version','1456989190','yes'),(1298,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1459000573;s:7:\"checked\";a:5:{s:33:\"admin-menu-editor/menu-editor.php\";s:3:\"1.5\";s:19:\"akismet/akismet.php\";s:5:\"3.1.7\";s:9:\"hello.php\";s:3:\"1.6\";s:27:\"woocommerce/woocommerce.php\";s:5:\"2.5.2\";s:61:\"woocommerce-point-of-sale-pos-6/woocommerce-point-of-sale.php\";s:5:\"3.0.7\";}s:8:\"response\";a:1:{s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"25331\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"2.5.3\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.2.5.3.zip\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:33:\"admin-menu-editor/menu-editor.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"11743\";s:4:\"slug\";s:17:\"admin-menu-editor\";s:6:\"plugin\";s:33:\"admin-menu-editor/menu-editor.php\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/admin-menu-editor/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/admin-menu-editor.1.5.zip\";}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"15\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"3.1.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.3.1.7.zip\";}s:9:\"hello.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"3564\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";}}}','yes'),(1550,'_site_transient_timeout_theme_roots','1459002374','yes'),(1551,'_site_transient_theme_roots','a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:14:\"twentyfourteen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','yes'),(1553,'_site_transient_timeout_browser_1b39d7d1d62ac4d2b3dc7459ef7d1588','1459605431','yes'),(1554,'_site_transient_browser_1b39d7d1d62ac4d2b3dc7459ef7d1588','a:9:{s:8:\"platform\";s:7:\"Windows\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"49.0.2623.87\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}','yes'),(1555,'_transient_timeout_wc_low_stock_count','1461592632','no'),(1556,'_transient_wc_low_stock_count','0','no'),(1557,'_transient_timeout_wc_outofstock_count','1461592632','no'),(1558,'_transient_wc_outofstock_count','1','no'),(1580,'_transient_is_multi_author','0','yes'),(1583,'_transient_timeout_wc_upgrade_notice_2.5.2','1459087153','no'),(1584,'_transient_wc_upgrade_notice_2.5.2','','no'),(1588,'rewrite_rules','a:226:{s:33:\"^point-of-sale/([^/]+)/([^/]+)/?$\";s:78:\"index.php?page=wc_pos_registers&action=view&outlet=$matches[1]&reg=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:58:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:78:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:73:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:73:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:54:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:37:\"pos_temp_register_or/([^/]+)/embed/?$\";s:53:\"index.php?pos_temp_register_or=$matches[1]&embed=true\";s:41:\"pos_temp_register_or/([^/]+)/trackback/?$\";s:47:\"index.php?pos_temp_register_or=$matches[1]&tb=1\";s:49:\"pos_temp_register_or/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?pos_temp_register_or=$matches[1]&paged=$matches[2]\";s:56:\"pos_temp_register_or/([^/]+)/comment-page-([0-9]{1,})/?$\";s:60:\"index.php?pos_temp_register_or=$matches[1]&cpage=$matches[2]\";s:46:\"pos_temp_register_or/([^/]+)/wc-api(/(.*))?/?$\";s:61:\"index.php?pos_temp_register_or=$matches[1]&wc-api=$matches[3]\";s:52:\"pos_temp_register_or/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:63:\"pos_temp_register_or/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:45:\"pos_temp_register_or/([^/]+)(?:/([0-9]+))?/?$\";s:59:\"index.php?pos_temp_register_or=$matches[1]&page=$matches[2]\";s:37:\"pos_temp_register_or/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"pos_temp_register_or/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"pos_temp_register_or/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"pos_temp_register_or/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"pos_temp_register_or/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"pos_temp_register_or/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:46:\"pos_custom_product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:56:\"pos_custom_product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:76:\"pos_custom_product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:71:\"pos_custom_product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:71:\"pos_custom_product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:52:\"pos_custom_product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:35:\"pos_custom_product/([^/]+)/embed/?$\";s:51:\"index.php?pos_custom_product=$matches[1]&embed=true\";s:39:\"pos_custom_product/([^/]+)/trackback/?$\";s:45:\"index.php?pos_custom_product=$matches[1]&tb=1\";s:47:\"pos_custom_product/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?pos_custom_product=$matches[1]&paged=$matches[2]\";s:54:\"pos_custom_product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:58:\"index.php?pos_custom_product=$matches[1]&cpage=$matches[2]\";s:44:\"pos_custom_product/([^/]+)/wc-api(/(.*))?/?$\";s:59:\"index.php?pos_custom_product=$matches[1]&wc-api=$matches[3]\";s:50:\"pos_custom_product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:61:\"pos_custom_product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:43:\"pos_custom_product/([^/]+)(?:/([0-9]+))?/?$\";s:57:\"index.php?pos_custom_product=$matches[1]&page=$matches[2]\";s:35:\"pos_custom_product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"pos_custom_product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"pos_custom_product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"pos_custom_product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"pos_custom_product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"pos_custom_product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:45:\"product_variation/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:55:\"product_variation/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:75:\"product_variation/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"product_variation/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"product_variation/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"product_variation/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"product_variation/([^/]+)/embed/?$\";s:50:\"index.php?product_variation=$matches[1]&embed=true\";s:38:\"product_variation/([^/]+)/trackback/?$\";s:44:\"index.php?product_variation=$matches[1]&tb=1\";s:46:\"product_variation/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?product_variation=$matches[1]&paged=$matches[2]\";s:53:\"product_variation/([^/]+)/comment-page-([0-9]{1,})/?$\";s:57:\"index.php?product_variation=$matches[1]&cpage=$matches[2]\";s:43:\"product_variation/([^/]+)/wc-api(/(.*))?/?$\";s:58:\"index.php?product_variation=$matches[1]&wc-api=$matches[3]\";s:49:\"product_variation/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:60:\"product_variation/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"product_variation/([^/]+)(?:/([0-9]+))?/?$\";s:56:\"index.php?product_variation=$matches[1]&page=$matches[2]\";s:34:\"product_variation/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"product_variation/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"product_variation/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"product_variation/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"product_variation/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"product_variation/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:45:\"shop_order_refund/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:55:\"shop_order_refund/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:75:\"shop_order_refund/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"shop_order_refund/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"shop_order_refund/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"shop_order_refund/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"shop_order_refund/([^/]+)/embed/?$\";s:50:\"index.php?shop_order_refund=$matches[1]&embed=true\";s:38:\"shop_order_refund/([^/]+)/trackback/?$\";s:44:\"index.php?shop_order_refund=$matches[1]&tb=1\";s:46:\"shop_order_refund/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?shop_order_refund=$matches[1]&paged=$matches[2]\";s:53:\"shop_order_refund/([^/]+)/comment-page-([0-9]{1,})/?$\";s:57:\"index.php?shop_order_refund=$matches[1]&cpage=$matches[2]\";s:43:\"shop_order_refund/([^/]+)/wc-api(/(.*))?/?$\";s:58:\"index.php?shop_order_refund=$matches[1]&wc-api=$matches[3]\";s:49:\"shop_order_refund/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:60:\"shop_order_refund/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"shop_order_refund/([^/]+)(?:/([0-9]+))?/?$\";s:56:\"index.php?shop_order_refund=$matches[1]&page=$matches[2]\";s:34:\"shop_order_refund/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"shop_order_refund/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"shop_order_refund/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"shop_order_refund/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"shop_order_refund/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"shop_order_refund/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:20:\"order-pay(/(.*))?/?$\";s:32:\"index.php?&order-pay=$matches[2]\";s:25:\"order-received(/(.*))?/?$\";s:37:\"index.php?&order-received=$matches[2]\";s:21:\"view-order(/(.*))?/?$\";s:33:\"index.php?&view-order=$matches[2]\";s:23:\"edit-account(/(.*))?/?$\";s:35:\"index.php?&edit-account=$matches[2]\";s:23:\"edit-address(/(.*))?/?$\";s:35:\"index.php?&edit-address=$matches[2]\";s:24:\"lost-password(/(.*))?/?$\";s:36:\"index.php?&lost-password=$matches[2]\";s:26:\"customer-logout(/(.*))?/?$\";s:38:\"index.php?&customer-logout=$matches[2]\";s:29:\"add-payment-method(/(.*))?/?$\";s:41:\"index.php?&add-payment-method=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:62:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$\";s:99:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]\";s:62:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:73:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes');
/*!40000 ALTER TABLE `pos_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_postmeta`
--

DROP TABLE IF EXISTS `pos_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_postmeta`
--

LOCK TABLES `pos_postmeta` WRITE;
/*!40000 ALTER TABLE `pos_postmeta` DISABLE KEYS */;
INSERT INTO `pos_postmeta` VALUES (1,2,'_wp_page_template','default'),(6,7,'_regular_price','10'),(7,7,'_price','10'),(8,7,'_visibility','hidden'),(9,7,'_wc_rating_count','a:0:{}'),(10,7,'_wc_average_rating','0'),(11,9,'_edit_last','1'),(12,9,'_edit_lock','1456387562:1'),(13,10,'_wp_attached_file','2016/02/04-Kanto-Freestyle-Breakfast-Kapitolyo-1.jpg'),(14,10,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:600;s:6:\"height\";i:400;s:4:\"file\";s:52:\"2016/02/04-Kanto-Freestyle-Breakfast-Kapitolyo-1.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:52:\"04-Kanto-Freestyle-Breakfast-Kapitolyo-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:52:\"04-Kanto-Freestyle-Breakfast-Kapitolyo-1-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:52:\"04-Kanto-Freestyle-Breakfast-Kapitolyo-1-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:52:\"04-Kanto-Freestyle-Breakfast-Kapitolyo-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:52:\"04-Kanto-Freestyle-Breakfast-Kapitolyo-1-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(15,9,'_thumbnail_id','10'),(16,9,'_visibility','visible'),(17,9,'_stock_status','outofstock'),(18,9,'total_sales','2'),(19,9,'_downloadable','no'),(20,9,'_virtual','no'),(21,9,'_purchase_note',''),(22,9,'_featured','no'),(23,9,'_weight',''),(24,9,'_length',''),(25,9,'_width',''),(26,9,'_height',''),(27,9,'_sku',''),(28,9,'_product_attributes','a:0:{}'),(29,9,'_regular_price','95'),(30,9,'_sale_price',''),(31,9,'_sale_price_dates_from',''),(32,9,'_sale_price_dates_to',''),(33,9,'_price','95'),(34,9,'_sold_individually',''),(35,9,'_manage_stock','yes'),(36,9,'_backorders','no'),(37,9,'_stock','0'),(38,9,'_upsell_ids','a:0:{}'),(39,9,'_crosssell_ids','a:0:{}'),(40,9,'_product_version','2.5.2'),(41,9,'_product_image_gallery',''),(42,9,'_wc_rating_count','a:0:{}'),(43,9,'_wc_average_rating','0'),(86,12,'_wp_attached_file','2016/02/logo.png'),(87,12,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:720;s:6:\"height\";i:720;s:4:\"file\";s:16:\"2016/02/logo.png\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"logo-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:16:\"logo-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:16:\"logo-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(137,15,'_edit_lock','1459000600:1'),(138,15,'_edit_last','1'),(139,16,'_wp_attached_file','2016/02/thumb_600.jpg'),(140,16,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:590;s:6:\"height\";i:590;s:4:\"file\";s:21:\"2016/02/thumb_600.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"thumb_600-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"thumb_600-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:21:\"thumb_600-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:21:\"thumb_600-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(141,15,'_thumbnail_id','16'),(142,15,'_visibility','visible'),(143,15,'_stock_status','instock'),(144,15,'total_sales','5'),(145,15,'_downloadable','no'),(146,15,'_virtual','no'),(147,15,'_purchase_note',''),(148,15,'_featured','no'),(149,15,'_weight',''),(150,15,'_length',''),(151,15,'_width',''),(152,15,'_height',''),(153,15,'_sku',''),(154,15,'_product_attributes','a:0:{}'),(155,15,'_regular_price','95'),(156,15,'_sale_price',''),(157,15,'_sale_price_dates_from',''),(158,15,'_sale_price_dates_to',''),(159,15,'_price','95'),(160,15,'_sold_individually',''),(161,15,'_manage_stock','yes'),(162,15,'_backorders','no'),(163,15,'_stock','5'),(164,15,'_upsell_ids','a:0:{}'),(165,15,'_crosssell_ids','a:0:{}'),(166,15,'_product_version','2.5.2'),(167,15,'_product_image_gallery',''),(168,15,'_wc_rating_count','a:0:{}'),(169,15,'_wc_average_rating','0'),(213,20,'_edit_lock','1456984093:1'),(214,20,'_edit_last','1'),(215,20,'_visibility','hidden'),(216,20,'_stock_status','instock'),(217,20,'total_sales','0'),(218,20,'_downloadable','no'),(219,20,'_virtual','no'),(220,20,'_purchase_note',''),(221,20,'_featured','no'),(222,20,'_weight',''),(223,20,'_length',''),(224,20,'_width',''),(225,20,'_height',''),(226,20,'_sku',''),(227,20,'_product_attributes','a:0:{}'),(228,20,'_regular_price',''),(229,20,'_sale_price',''),(230,20,'_sale_price_dates_from',''),(231,20,'_sale_price_dates_to',''),(232,20,'_price',''),(233,20,'_sold_individually',''),(234,20,'_manage_stock','yes'),(235,20,'_backorders','no'),(236,20,'_stock','100.000000'),(237,20,'_upsell_ids','a:0:{}'),(238,20,'_crosssell_ids','a:0:{}'),(239,20,'_product_version','2.5.2'),(240,20,'_product_image_gallery',''),(241,20,'_wc_rating_count','a:0:{}'),(242,20,'_wc_average_rating','0');
/*!40000 ALTER TABLE `pos_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_posts`
--

DROP TABLE IF EXISTS `pos_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_posts`
--

LOCK TABLES `pos_posts` WRITE;
/*!40000 ALTER TABLE `pos_posts` DISABLE KEYS */;
INSERT INTO `pos_posts` VALUES (1,1,'2016-02-25 04:54:03','2016-02-25 04:54:03','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2016-02-25 04:54:03','2016-02-25 04:54:03','',0,'http://localhost/pos.ae/?p=1',0,'post','',1),(2,1,'2016-02-25 04:54:03','2016-02-25 04:54:03','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/pos.ae/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2016-02-25 04:54:03','2016-02-25 04:54:03','',0,'http://localhost/pos.ae/?page_id=2',0,'page','',0),(7,1,'2016-02-25 05:19:25','2016-02-25 05:19:25','','POS custom product','','publish','closed','closed','','pos-custom-product','','','2016-02-25 05:19:25','2016-02-25 05:19:25','',0,'http://localhost/pos.ae/2016/02/25/pos-custom-product/',0,'pos_custom_product','',0),(9,1,'2016-02-25 05:49:15','2016-02-25 05:49:15','','Vigan Longganisa','','publish','open','closed','','vigan-longganisa','','','2016-02-25 08:19:00','2016-02-25 08:19:00','',0,'http://localhost/pos.ae/?post_type=product&#038;p=9',0,'product','',0),(10,1,'2016-02-25 05:49:07','2016-02-25 05:49:07','','04-Kanto Freestyle Breakfast Kapitolyo (1)','','inherit','open','closed','','04-kanto-freestyle-breakfast-kapitolyo-1','','','2016-02-25 05:49:07','2016-02-25 05:49:07','',9,'http://localhost/pos.ae/wp-content/uploads/2016/02/04-Kanto-Freestyle-Breakfast-Kapitolyo-1.jpg',0,'attachment','image/jpeg',0),(12,1,'2016-02-25 08:01:51','2016-02-25 08:01:51','','logo','','inherit','open','closed','','logo','','','2016-02-25 08:01:51','2016-02-25 08:01:51','',0,'http://localhost/pos.ae/wp-content/uploads/2016/02/logo.png',0,'attachment','image/png',0),(13,1,'2016-02-25 08:19:00','2016-02-25 08:19:00','','POS Register #1','','publish','closed','closed','','pos-register-1','','','2016-02-25 08:19:00','2016-02-25 08:19:00','',0,'http://localhost/pos.ae/pos_temp_register_or/pos-register-1/',0,'pos_temp_register_or','',0),(14,1,'2016-02-25 08:39:58','2016-02-25 08:39:58','','POS Register #','','publish','closed','closed','','pos-register','','','2016-02-25 08:39:58','2016-02-25 08:39:58','',0,'http://localhost/pos.ae/pos_temp_register_or/pos-register/',0,'pos_temp_register_or','',0),(15,1,'2016-02-25 10:25:41','2016-02-25 10:25:41','','Chicken Longganisa','','publish','open','closed','','chicken-longganisa','','','2016-03-03 08:39:09','2016-03-03 08:39:09','',0,'http://localhost/pos.ae/?post_type=product&#038;p=15',0,'product','',0),(16,1,'2016-02-25 10:25:32','2016-02-25 10:25:32','','thumb_600','','inherit','open','closed','','thumb_600','','','2016-02-25 10:25:32','2016-02-25 10:25:32','',15,'http://localhost/pos.ae/wp-content/uploads/2016/02/thumb_600.jpg',0,'attachment','image/jpeg',0),(18,1,'2016-02-25 10:34:33','2016-02-25 10:34:33','','POS Register #2','','publish','closed','closed','','pos-register-2','','','2016-02-25 10:34:33','2016-02-25 10:34:33','',0,'http://localhost/pos.ae/pos_temp_register_or/pos-register-2/',0,'pos_temp_register_or','',0),(20,1,'2016-03-03 04:41:23','2016-03-03 04:41:23','','Onion','','publish','closed','closed','','onion','','','2016-03-03 05:50:34','2016-03-03 05:50:34','',0,'http://localhost/pos.ae/?post_type=product&#038;p=20',0,'product','',0),(25,1,'2016-03-03 08:39:09','2016-03-03 08:39:09','','POS Register #3','','publish','closed','closed','','pos-register-3','','','2016-03-03 08:39:09','2016-03-03 08:39:09','',0,'http://localhost/pos.ae/pos_temp_register_or/pos-register-3/',0,'pos_temp_register_or','',0),(26,1,'2016-03-26 13:57:12','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2016-03-26 13:57:12','0000-00-00 00:00:00','',0,'http://localhost/pos.ae/?p=26',0,'post','',0);
/*!40000 ALTER TABLE `pos_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_term_relationships`
--

DROP TABLE IF EXISTS `pos_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_term_relationships`
--

LOCK TABLES `pos_term_relationships` WRITE;
/*!40000 ALTER TABLE `pos_term_relationships` DISABLE KEYS */;
INSERT INTO `pos_term_relationships` VALUES (1,1,0),(7,2,0),(9,2,0),(15,2,0),(20,2,0),(20,6,0),(20,7,0);
/*!40000 ALTER TABLE `pos_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_term_taxonomy`
--

DROP TABLE IF EXISTS `pos_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_term_taxonomy`
--

LOCK TABLES `pos_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `pos_term_taxonomy` DISABLE KEYS */;
INSERT INTO `pos_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'product_type','',0,3),(3,3,'product_type','',0,0),(4,4,'product_type','',0,0),(5,5,'product_type','',0,0),(6,6,'product_cat','',0,1),(7,7,'product_tag','',0,1);
/*!40000 ALTER TABLE `pos_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_termmeta`
--

DROP TABLE IF EXISTS `pos_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_termmeta`
--

LOCK TABLES `pos_termmeta` WRITE;
/*!40000 ALTER TABLE `pos_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_terms`
--

DROP TABLE IF EXISTS `pos_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_terms`
--

LOCK TABLES `pos_terms` WRITE;
/*!40000 ALTER TABLE `pos_terms` DISABLE KEYS */;
INSERT INTO `pos_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'simple','simple',0),(3,'grouped','grouped',0),(4,'variable','variable',0),(5,'external','external',0),(6,'Ingredients','ingredients',0),(7,'Mandaluyong','mandaluyong',0);
/*!40000 ALTER TABLE `pos_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_usermeta`
--

DROP TABLE IF EXISTS `pos_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_usermeta`
--

LOCK TABLES `pos_usermeta` WRITE;
/*!40000 ALTER TABLE `pos_usermeta` DISABLE KEYS */;
INSERT INTO `pos_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','false'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','midnight'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'pos_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'pos_user_level','10'),(12,1,'dismissed_wp_pointers',''),(13,1,'show_welcome_panel','0'),(15,1,'pos_dashboard_quick_press_last_post_id','26'),(16,1,'manageedit-shop_ordercolumnshidden','a:1:{i:0;s:15:\"billing_address\";}'),(17,1,'outlet','2'),(18,1,'discount','enable'),(19,1,'billing_first_name',''),(20,1,'billing_last_name',''),(21,1,'billing_company',''),(22,1,'billing_address_1',''),(23,1,'billing_address_2',''),(24,1,'billing_city',''),(25,1,'billing_postcode',''),(26,1,'billing_country',''),(27,1,'billing_state',''),(28,1,'billing_phone',''),(29,1,'billing_email',''),(30,1,'shipping_first_name',''),(31,1,'shipping_last_name',''),(32,1,'shipping_company',''),(33,1,'shipping_address_1',''),(34,1,'shipping_address_2',''),(35,1,'shipping_city',''),(36,1,'shipping_postcode',''),(37,1,'shipping_country',''),(38,1,'shipping_state',''),(39,1,'_order_count','0'),(40,1,'_money_spent',NULL),(41,1,'pos_user-settings','libraryContent=browse&mfold=o'),(42,1,'pos_user-settings-time','1456385010'),(43,1,'wc_pos_count_orders','5'),(44,1,'closedpostboxes_dashboard','a:1:{i:0;s:18:\"dashboard_activity\";}'),(45,1,'metaboxhidden_dashboard','a:5:{i:0;s:19:\"dashboard_right_now\";i:1;s:36:\"woocommerce_dashboard_recent_reviews\";i:2;s:18:\"dashboard_activity\";i:3;s:21:\"dashboard_quick_press\";i:4;s:17:\"dashboard_primary\";}'),(46,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:104:\"dashboard_right_now,woocommerce_dashboard_recent_reviews,dashboard_activity,woocommerce_dashboard_status\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),(48,1,'last_login','2016-03-26 13:57:08'),(52,1,'ame_show_hints','a:3:{s:17:\"ws_sidebar_pro_ad\";b:0;s:16:\"ws_whats_new_120\";b:0;s:24:\"ws_hint_menu_permissions\";b:0;}'),(54,2,'nickname','mayette'),(55,2,'first_name','mayette'),(56,2,'last_name','mingoy'),(57,2,'description',''),(58,2,'rich_editing','true'),(59,2,'comment_shortcuts','false'),(60,2,'admin_color','fresh'),(61,2,'use_ssl','0'),(62,2,'show_admin_bar_front','true'),(63,2,'pos_capabilities','a:1:{s:7:\"cashier\";b:1;}'),(64,2,'pos_user_level','0'),(65,2,'dismissed_wp_pointers',''),(66,2,'outlet','2'),(67,2,'discount','enable'),(68,2,'billing_first_name',''),(69,2,'billing_last_name',''),(70,2,'billing_company',''),(71,2,'billing_address_1',''),(72,2,'billing_address_2',''),(73,2,'billing_city',''),(74,2,'billing_postcode',''),(75,2,'billing_country',''),(76,2,'billing_state',''),(77,2,'billing_phone',''),(78,2,'billing_email',''),(79,2,'shipping_first_name',''),(80,2,'shipping_last_name',''),(81,2,'shipping_company',''),(82,2,'shipping_address_1',''),(83,2,'shipping_address_2',''),(84,2,'shipping_city',''),(85,2,'shipping_postcode',''),(86,2,'shipping_country',''),(87,2,'shipping_state',''),(89,2,'last_login','2016-03-03 06:55:10'),(90,2,'manageedit-shop_ordercolumnshidden','a:1:{i:0;s:15:\"billing_address\";}'),(92,2,'_order_count','0'),(93,2,'_money_spent',NULL),(100,2,'wc_pos_count_orders','3');
/*!40000 ALTER TABLE `pos_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_users`
--

DROP TABLE IF EXISTS `pos_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_users`
--

LOCK TABLES `pos_users` WRITE;
/*!40000 ALTER TABLE `pos_users` DISABLE KEYS */;
INSERT INTO `pos_users` VALUES (1,'admin','$P$Bqzcvb00dlH6BNIVP/0Q9y0wXRNrpW/','admin','mabugay.carl@gmail.com','','2016-02-25 04:54:03','',0,'admin'),(2,'mayette','$P$BBJjVzKmoPMp80E29XZrTu8Yq..2lR.','mayette','mayette@gmail.com','','2016-02-25 10:20:40','',0,'mayette mingoy');
/*!40000 ALTER TABLE `pos_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_wc_poin_of_sale_grids`
--

DROP TABLE IF EXISTS `pos_wc_poin_of_sale_grids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_wc_poin_of_sale_grids` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'name',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_wc_poin_of_sale_grids`
--

LOCK TABLES `pos_wc_poin_of_sale_grids` WRITE;
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_grids` DISABLE KEYS */;
INSERT INTO `pos_wc_poin_of_sale_grids` VALUES (1,'Menu','menu','name');
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_grids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_wc_poin_of_sale_outlets`
--

DROP TABLE IF EXISTS `pos_wc_poin_of_sale_outlets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_wc_poin_of_sale_outlets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `social` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_wc_poin_of_sale_outlets`
--

LOCK TABLES `pos_wc_poin_of_sale_outlets` WRITE;
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_outlets` DISABLE KEYS */;
INSERT INTO `pos_wc_poin_of_sale_outlets` VALUES (1,'Mandaluyong Branch','{\"country\":\"PH\",\"address_1\":\"San Joaquin\",\"address_2\":\"\",\"city\":\"Mandaluyong\",\"state\":\"00\",\"postcode\":\"\"}','{\"email\":\"\",\"phone\":\"(02) 400 2268\",\"fax\":\"\",\"website\":\"\",\"twitter\":\"@\",\"facebook\":\"https:\\/\\/www.facebook.com\\/kantofreestylebreakfast\\/\"}'),(2,'Pasig Branch','{\"country\":\"PH\",\"address_1\":\"1st Street, Kapitolyo\",\"address_2\":\"\",\"city\":\"Pasig City\",\"state\":\"00\",\"postcode\":\"\"}','{\"email\":\"\",\"phone\":\"02 7755428\",\"fax\":\"\",\"website\":\"\",\"twitter\":\"@\",\"facebook\":\"\"}');
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_outlets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_wc_poin_of_sale_receipts`
--

DROP TABLE IF EXISTS `pos_wc_poin_of_sale_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_wc_poin_of_sale_receipts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_outlet_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_outlet_contact_details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telephone_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `website_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date_format` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_order_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_server` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `served_by_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_number_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_tax_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_number_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_order_notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_notes_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customer_name_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customer_email_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_customer_ship_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customer_ship_address_label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_size` enum('nomal','small','large') COLLATE utf8mb4_unicode_ci DEFAULT 'nomal',
  `title_position` enum('left','center','right') COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `logo_size` enum('nomal','small','large') COLLATE utf8mb4_unicode_ci DEFAULT 'nomal',
  `logo_position` enum('left','center','right') COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `contact_position` enum('left','center','right') COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `tax_number_position` enum('left','center','right') COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_wc_poin_of_sale_receipts`
--

LOCK TABLES `pos_wc_poin_of_sale_receipts` WRITE;
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_receipts` DISABLE KEYS */;
INSERT INTO `pos_wc_poin_of_sale_receipts` VALUES (1,'Default Receipt','yes','yes','Tel','Fax','Email','Website','Receipt','Order Number','Order Date','F j, Y','yes','yes','Served by','Tax','Total','Sales','yes','Number of Items','yes','no','Tax Number','yes','Note','yes','Customer Name','yes','Customer Email','yes','Shipping Address','','','','','','','','','');
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_wc_poin_of_sale_registers`
--

DROP TABLE IF EXISTS `pos_wc_poin_of_sale_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_wc_poin_of_sale_registers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `outlet` int(20) NOT NULL DEFAULT '0',
  `default_customer` int(20) NOT NULL DEFAULT '0',
  `order_id` int(20) NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_edit_last` int(20) NOT NULL DEFAULT '0',
  `opened` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_wc_poin_of_sale_registers`
--

LOCK TABLES `pos_wc_poin_of_sale_registers` WRITE;
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_registers` DISABLE KEYS */;
INSERT INTO `pos_wc_poin_of_sale_registers` VALUES (3,'KF - Pasig | Counter 1 ','kf-pasig-counter-1','{\"grid_template\":\"1\",\"receipt_template\":\"1\",\"prefix\":\"KFPSG\",\"suffix\":\"\",\"tax_number\":\"\",\"default_customer\":\"0\",\"default_shipping_method\":\"\"}',2,0,25,'{\"change_user\":\"1\",\"email_receipt\":\"0\",\"print_receipt\":\"1\",\"note_request\":\"0\"}',1,'2016-03-02 23:05:15','2016-03-03 00:52:13');
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_wc_poin_of_sale_tiles`
--

DROP TABLE IF EXISTS `pos_wc_poin_of_sale_tiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_wc_poin_of_sale_tiles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `grid_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `style` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `colour` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  `background` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ffffff',
  `default_selection` bigint(20) NOT NULL,
  `order_position` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_wc_poin_of_sale_tiles`
--

LOCK TABLES `pos_wc_poin_of_sale_tiles` WRITE;
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_tiles` DISABLE KEYS */;
INSERT INTO `pos_wc_poin_of_sale_tiles` VALUES (1,1,15,'image','ffffff','8E8E8E',0,1),(2,1,9,'image','ffffff','8E8E8E',0,2);
/*!40000 ALTER TABLE `pos_wc_poin_of_sale_tiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `pos_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_api_keys` (
  `key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_api_keys`
--

LOCK TABLES `pos_woocommerce_api_keys` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `pos_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_attribute_taxonomies`
--

LOCK TABLES `pos_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_attribute_taxonomies` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `pos_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`,`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_downloadable_product_permissions`
--

LOCK TABLES `pos_woocommerce_downloadable_product_permissions` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_downloadable_product_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_downloadable_product_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `pos_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_order_itemmeta`
--

LOCK TABLES `pos_woocommerce_order_itemmeta` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_order_itemmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_order_itemmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_order_items`
--

DROP TABLE IF EXISTS `pos_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_order_items`
--

LOCK TABLES `pos_woocommerce_order_items` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_sessions`
--

DROP TABLE IF EXISTS `pos_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_sessions`
--

LOCK TABLES `pos_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `pos_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_tax_rate_locations`
--

LOCK TABLES `pos_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_tax_rate_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `pos_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`),
  KEY `tax_rate_class` (`tax_rate_class`),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_tax_rates`
--

LOCK TABLES `pos_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_woocommerce_termmeta`
--

DROP TABLE IF EXISTS `pos_woocommerce_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `woocommerce_term_id` (`woocommerce_term_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_woocommerce_termmeta`
--

LOCK TABLES `pos_woocommerce_termmeta` WRITE;
/*!40000 ALTER TABLE `pos_woocommerce_termmeta` DISABLE KEYS */;
INSERT INTO `pos_woocommerce_termmeta` VALUES (1,6,'order','0'),(2,6,'display_type',''),(3,6,'thumbnail_id','0'),(4,6,'product_count_product_cat','0'),(5,7,'product_count_product_tag','0');
/*!40000 ALTER TABLE `pos_woocommerce_termmeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-26 22:02:29
