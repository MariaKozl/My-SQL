-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'necessitatibus',1),(2,'atque',2),(3,'quidem',3),(4,'dolore',4),(5,'quo',5),(6,'quidem',6),(7,'odit',7),(8,'quas',8),(9,'aliquid',9),(10,'omnis',10),(11,'natus',11),(12,'doloribus',12),(13,'et',13),(14,'incidunt',14),(15,'excepturi',15);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'declined','1986-09-03 14:56:43','2003-02-20 12:27:47'),(2,2,'requested','2014-05-21 21:15:31','1988-10-14 15:15:24'),(3,3,'unfriended','2002-03-25 15:31:18','2010-10-22 14:08:34'),(4,4,'approved','1981-10-23 00:27:48','1977-12-17 13:26:26'),(5,5,'declined','1983-11-26 11:21:13','1985-07-23 05:40:58'),(6,6,'requested','1983-05-10 00:06:39','2009-08-04 10:47:25'),(7,7,'unfriended','2018-12-12 21:22:39','2019-06-10 09:23:25'),(8,8,'approved','1991-10-09 05:50:14','2014-09-28 16:25:20'),(9,9,'unfriended','1988-07-18 23:13:48','1971-12-25 16:00:31'),(10,10,'requested','1984-10-02 22:28:24','2013-07-15 16:20:08'),(11,11,'approved','2016-12-23 20:27:09','1981-09-12 14:53:05'),(12,12,'unfriended','2012-01-28 09:39:31','1970-08-20 08:45:06'),(13,13,'declined','1995-09-15 07:23:57','2016-05-03 00:59:47'),(14,14,'requested','1997-05-18 14:13:00','1995-06-01 10:53:15'),(15,15,'requested','1984-04-08 12:31:37','2021-01-08 23:04:12'),(16,16,'declined','2007-11-07 17:33:10','2003-09-25 01:38:58'),(17,17,'declined','2019-10-16 01:19:24','2016-07-26 03:18:13'),(18,18,'declined','1994-04-18 23:24:28','1972-02-14 11:59:14'),(19,19,'requested','1988-06-06 18:16:11','1996-12-20 20:29:14'),(20,20,'unfriended','1990-06-07 22:55:53','1970-04-28 14:10:51');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1997-04-05 22:07:48'),(2,2,2,'2004-01-15 05:10:55'),(3,3,3,'2017-03-20 17:13:44'),(4,4,4,'1985-11-18 13:06:37'),(5,5,5,'1970-02-05 23:12:55'),(6,6,6,'1976-07-24 08:11:34'),(7,7,7,'1990-09-22 03:12:31'),(8,8,8,'2013-10-01 23:54:55'),(9,9,9,'2005-02-13 11:35:19'),(10,10,10,'2011-01-14 03:59:54'),(11,11,11,'2007-05-25 18:33:34'),(12,12,12,'1985-07-14 02:00:58'),(13,13,13,'2004-08-01 17:18:32'),(14,14,14,'1982-10-10 03:34:50'),(15,15,15,'1990-10-19 15:30:24'),(16,16,1,'2016-08-03 03:39:23'),(17,17,2,'1996-06-04 14:13:16'),(18,18,3,'1998-03-05 06:00:19'),(19,19,4,'2015-09-10 01:19:12'),(20,20,5,'2011-07-27 13:09:10');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Modi vel molestiae rerum non voluptatum non officia. Dolores perferendis aliquid ipsam earum excepturi commodi. Voluptas et earum rem consequatur libero. Quae praesentium quam reprehenderit rerum fuga iure.','expedita',97779,NULL,'2015-03-11 19:16:36','2015-04-28 01:43:25'),(2,2,2,'Qui sit hic eos sed. Sed asperiores placeat eum. Est molestiae ipsa ad ipsa distinctio. Quas aspernatur quisquam id maiores qui qui et sed.','beatae',66979938,NULL,'1980-07-02 09:32:21','2001-07-23 04:56:54'),(3,3,3,'Sapiente ut voluptas quia possimus quis. Laudantium qui sit illum corporis sit. Deserunt voluptatibus ipsam et velit. Est quisquam quo qui quia. Fugiat magni dolor beatae fugiat eaque possimus.','sit',705,NULL,'1984-06-12 04:53:46','1982-07-03 19:07:34'),(4,4,4,'Iure eum necessitatibus ut eaque id. Occaecati libero est adipisci voluptatum reprehenderit rem. Corrupti aperiam reprehenderit est et.','et',583905925,NULL,'2018-03-19 12:35:07','2015-07-27 11:04:50'),(5,1,5,'Voluptatem ad quae explicabo vero quo unde ut consequuntur. Nihil sit sunt et quod quod reprehenderit nobis blanditiis. Hic quo dolores expedita voluptatem autem velit. Quae illum aut adipisci ipsam optio.','suscipit',7378,NULL,'2018-03-19 07:04:26','1988-04-17 00:10:34'),(6,2,6,'Nesciunt non enim sit rerum. Cupiditate cum vel est nostrum doloribus delectus. Et maiores aspernatur eveniet. Aut recusandae facere aspernatur asperiores.','illum',32,NULL,'1997-02-11 16:30:06','1974-05-03 06:06:39'),(7,3,7,'Ut quidem est voluptatibus dicta autem modi suscipit tempora. Sint totam quod non cupiditate. Libero corporis dolores perferendis eius aut.','nostrum',0,NULL,'2015-08-23 01:20:15','2008-03-29 09:52:46'),(8,4,8,'Rem voluptatem enim qui sed. Repellat harum qui blanditiis eligendi et ut nihil. Sed nostrum minus omnis repellat qui reprehenderit asperiores voluptatem.','assumenda',587409033,NULL,'2014-11-25 03:44:24','2018-10-25 02:09:43'),(9,1,9,'Exercitationem aut suscipit unde tempore quaerat aperiam. Est perferendis praesentium ab quam non. Delectus et consequatur labore blanditiis. Qui laboriosam quia tempora voluptatum ipsam.','quia',31769,NULL,'2020-05-18 15:47:49','1971-02-10 20:02:43'),(10,2,10,'Non ex ipsum sequi veritatis. Non aut unde mollitia non. Voluptatum omnis qui tempore natus nostrum harum non. Nam illo molestiae ut ipsa tempora ut eum.','aspernatur',500,NULL,'2013-01-18 05:50:37','1973-07-09 05:28:56'),(11,3,11,'Animi dolore quis eos dolores. Corrupti nam corrupti necessitatibus placeat est magnam. Fugit a commodi exercitationem.','corporis',6986590,NULL,'2012-09-05 22:02:51','1987-03-06 03:00:29'),(12,4,12,'Dicta pariatur aut cumque in. Dolorem nihil dolores sunt iusto. Aliquam quidem tenetur dignissimos ut repudiandae.','reprehenderit',940839,NULL,'1994-03-31 13:17:23','1982-10-01 20:06:29'),(13,1,13,'Est recusandae ut id ut. Et ipsum dolor eius enim voluptas. Voluptatem qui eveniet debitis. Omnis occaecati dolores est aliquam accusamus voluptates.','debitis',9,NULL,'2011-10-18 06:32:28','2002-10-16 20:08:14'),(14,2,14,'Nihil mollitia minima perspiciatis. Alias voluptas similique sed ducimus vitae veniam. Aut in ut iusto optio distinctio deserunt aut. Tenetur ad eum omnis qui quia animi et. Sit nesciunt temporibus eaque.','totam',17,NULL,'2013-03-22 05:30:56','2000-07-27 06:11:03'),(15,3,15,'Libero ipsum eveniet omnis voluptas magni asperiores eum. Distinctio quam quos adipisci voluptates quis. Sint necessitatibus aspernatur quia sunt excepturi. Eligendi optio omnis at possimus.','eius',818054,NULL,'1995-03-19 01:30:03','1980-03-03 03:56:33');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'id','1996-11-06 14:03:22','1993-12-17 00:02:01'),(2,'deleniti','2019-09-03 23:09:24','1983-11-21 14:21:56'),(3,'nemo','2010-07-31 09:00:13','1994-02-17 09:18:54'),(4,'voluptates','2002-03-01 07:19:16','1975-05-23 23:25:48');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Porro quam et in molestiae. Et aut et delectus ea debitis qui. Voluptatem eum facilis et veniam ea qui beatae natus.','1990-04-02 11:21:49'),(2,2,2,'Aut architecto earum sint est dolore. Magnam nesciunt autem excepturi alias doloremque veniam excepturi. Rerum voluptas assumenda omnis veniam inventore. Ad est id sed impedit et non incidunt. Facilis eaque totam nam rerum nesciunt voluptatum in.','1972-05-31 00:59:45'),(3,3,3,'Aut sunt harum dignissimos autem quasi necessitatibus. Labore aliquam totam non sed eius consequatur voluptas ipsam. Architecto tempore voluptatibus ipsam qui culpa.','2012-07-28 19:23:23'),(4,4,4,'Facilis vel iste ex at doloremque aperiam. Aliquid error quam illum adipisci. Quis minima ab est earum. Aut nemo fuga enim eveniet quia quis.','1976-10-24 06:32:56'),(5,5,5,'Excepturi velit est perferendis et sapiente. Nobis ipsam dicta architecto consequatur labore dolorem. Impedit asperiores labore porro omnis officiis quisquam aut non. Omnis nemo in odit dolore alias nobis modi sed.','1984-11-17 11:39:29'),(6,6,6,'Nihil quisquam quia vel quis incidunt eos et. Eveniet nemo adipisci sapiente vero.','2017-05-11 18:32:19'),(7,7,7,'Nisi non corporis quo accusamus. Qui enim consequatur voluptatem quod. Aut dolorem veniam voluptates non aut fugiat necessitatibus.','2012-11-07 03:31:37'),(8,8,8,'Magnam iure sit exercitationem inventore dolor est corporis. Non illo vel facilis iure deserunt dolores dolorem. Commodi enim repudiandae rerum hic. Repellat quam est beatae.','2011-07-20 08:10:11'),(9,9,9,'Ratione velit facere corporis aut quia vel. Est porro molestiae culpa repellendus sed eum ut id. Eaque inventore eos aut ab omnis voluptatibus. Qui nesciunt architecto doloremque fuga.','1989-06-08 10:05:39'),(10,10,10,'Veritatis iure sint consequatur. Quaerat quia incidunt ducimus ut. At voluptas totam eius dolorum. Ea assumenda velit iure ipsa.','1996-04-14 06:52:54'),(11,11,11,'Voluptate vero fugit fugiat possimus omnis perferendis est. Molestias veniam odio fugit officiis minima quia esse. Quo voluptatem deleniti mollitia quasi esse ut. Deleniti autem voluptate consectetur optio earum nesciunt.','1970-06-13 21:21:52'),(12,12,12,'Sed cum qui ut perspiciatis iusto soluta id. Modi fugit architecto error tenetur similique quidem. Reprehenderit est fugit nostrum voluptas aut voluptatem omnis.','2002-08-15 06:14:09'),(13,13,13,'Autem quod veritatis id nostrum non fuga omnis nulla. Hic pariatur quidem omnis omnis et eaque. Magnam sit et animi aut.','1999-12-12 13:25:06'),(14,14,14,'Eaque possimus rerum officia sint inventore ut. Consequatur voluptas quos excepturi corporis. Sed tempora et ex quos vel. Explicabo laborum atque amet.','1979-01-23 12:59:49'),(15,15,15,'Nam vel et enim ut labore dolore. Qui voluptatibus necessitatibus nobis possimus. Dignissimos qui tempore consequatur dolorem quo non molestias. Rem voluptatum pariatur deserunt omnis.','2005-02-10 06:49:14'),(16,16,16,'Magni veritatis sit laudantium deserunt. Sint quisquam quod nemo in. Harum aut hic quae delectus tempore velit.','2020-05-24 03:45:56'),(17,17,17,'Quia ea non illo aut et ut qui. Iure nobis quam fugiat illo ut. Quis maxime blanditiis corrupti dolorem corrupti dolores.','2007-06-11 11:53:41'),(18,18,18,'Eos impedit tempore quod corporis. Nostrum eos repellat totam nostrum ut numquam rem. Qui enim dolores velit aut id quis earum. Et aut officiis est voluptates.','1971-12-03 16:42:31'),(19,19,19,'Voluptatum eos aut commodi dicta ut. Ratione quae qui voluptatem quia temporibus. Consequatur animi sed eum aliquam ut rerum. Vitae nihil veniam in sed soluta.','1995-03-04 22:16:14'),(20,20,20,'Laboriosam eos voluptatem est similique. Fugit impedit cum et ea totam eum et sunt. Aut veritatis aut reprehenderit consequuntur. Ut voluptatum possimus qui non molestiae facere est.','2015-03-04 16:10:18');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'recusandae',1),(2,'omnis',2),(3,'quaerat',3),(4,'non',4),(5,'deserunt',5),(6,'corporis',6),(7,'aliquid',7),(8,'possimus',8),(9,'exercitationem',9),(10,'asperiores',10);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1990-03-05',1,'1995-12-23 03:05:00',NULL),(2,'m','2017-02-03',2,'2010-04-08 03:55:55',NULL),(3,'m','1974-02-17',3,'1984-10-25 06:24:43',NULL),(4,'m','2021-07-29',4,'2010-03-19 15:23:53',NULL),(5,'m','1998-12-11',5,'1987-10-26 14:42:14',NULL),(6,'m','2003-10-07',6,'1970-04-08 00:15:25',NULL),(7,'f','2005-03-16',7,'2012-11-27 10:03:18',NULL),(8,'m','1984-04-22',8,'1973-02-05 03:22:53',NULL),(9,'f','1999-09-06',9,'1990-08-24 01:58:03',NULL),(10,'m','1999-01-13',10,'2010-10-31 15:57:10',NULL),(11,'m','1988-08-11',11,'2018-01-10 14:50:15',NULL),(12,'f','1979-07-22',12,'1974-11-09 19:46:44',NULL),(13,'f','1979-08-30',13,'2018-08-22 13:40:35',NULL),(14,'m','2004-08-21',14,'1971-02-05 11:07:57',NULL),(15,'f','2005-07-21',15,'1985-07-02 22:31:34',NULL),(16,'f','1991-10-19',1,'2008-07-10 15:47:37',NULL),(17,'f','2007-08-30',2,'2019-06-19 23:21:08',NULL),(18,'f','1974-07-19',3,'2019-10-17 22:10:02',NULL),(19,'f','1980-07-16',4,'1986-12-16 11:21:51',NULL),(20,'f','1984-12-22',5,'1993-11-16 02:14:53',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Camylle','Jerde','kfritsch@example.com','2869c869d36d3a71093ff3430a15d585f713aaf5',8925283071),(2,'Frederick','Funk','laila27@example.org','b6f8277ceee05f7ca5951a7fabe70eaa9b2f3da2',8927562706),(3,'Mackenzie','Reilly','dmorar@example.org','4597298d82b96634a566fc72af0ec671ac2a2e31',8930720299),(4,'Rosanna','Gulgowski','pschimmel@example.com','7b1b8bc028a94afde1374128b58433f8d7c5ecfb',8995992803),(5,'Cedrick','Smith','alia.macejkovic@example.org','e8fb0bfd50903cd2ea630f9f98b30d31b9a99075',8984943437),(6,'Valentina','Stoltenberg','bernadette74@example.org','e8f3f90cf922e07a60c5298e182d65e333e346a0',8948389689),(7,'Friedrich','Mohr','herminia92@example.net','9eb74f33c05988a07dbaaf08139c129f814b81d8',8946567797),(8,'Merl','McCullough','christop.hermiston@example.com','9b99a11ea5dc5bfd56f5ae3ee069062ec0ff2514',8944910616),(9,'Keely','Beatty','ike01@example.net','bf1dbf77aa8afa4a3530e2fcc850004d78a529e7',8976444966),(10,'Nia','Parisian','jmurphy@example.net','266efaa86061ed7a2a2cd349f6dac7ff93e01722',8909823696),(11,'Gilda','Satterfield','schowalter.samir@example.com','482a0630c42cc3c14fc721a5f3a3c59a31d3e356',8902486443),(12,'Alexanne','Eichmann','reynolds.melyssa@example.org','5fa402b74ec29f40f292aa2d827c7e95bb55a070',8969405984),(13,'Sonia','Kutch','ydickens@example.org','5a1cbd8ec52d14bacc80774374d78d436314c80c',8963862833),(14,'Glenna','Prosacco','winfield93@example.com','df8d3f16bd94519bc845f811ad0d1440a0f63959',8928974962),(15,'Jose','Dietrich','okuneva.angelica@example.com','916f5953f6a3ecb8018de891d7f99cab6f64337e',8955035772),(16,'Angel','Brekke','stroman.alyson@example.net','d315529afe31f22d039591a82f7ec29ef378742b',8978284856),(17,'Ismael','Conroy','maxwell.dach@example.net','029e757bea7f177dcc92ec50adfe9c0e79e8db70',8973397367),(18,'Keyon','Reinger','kendra.greenfelder@example.com','677d7120ae9f16fde28c53e60fbc4dd0587bb2ae',8972563094),(19,'Rosella','Jakubowski','joana78@example.com','14134a32fe717d6135bcc7982082e0f825dea0aa',8900753771),(20,'Sandrine','Johnson','raul.bartell@example.com','00bbfb6bdaeba4e9f266ce6eac8443625ec61cb7',8915538621);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-26 12:15:40
