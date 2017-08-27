-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.25-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- dbproject 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `dbproject` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbproject`;

-- 테이블 dbproject.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 dbproject.migrations:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(10, '2014_10_12_100000_create_password_resets_table', 1),
	(11, '2017_08_24_230454_create_roles_table', 1),
	(12, '2017_08_24_231647_create_user_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 dbproject.password_resets 구조 내보내기
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 dbproject.password_resets:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- 테이블 dbproject.roles 구조 내보내기
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 dbproject.roles:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'This is Admin', NULL, NULL),
	(2, 'Virector', 'This is Virector', NULL, NULL),
	(3, 'Manager', 'This is Manager', NULL, NULL),
	(4, 'CEO', 'This is CEO', NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 테이블 dbproject.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 dbproject.users:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Prof. Marc Johns DDS', 'denesik.kathryn@example.org', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'Ot3NUuu2YM', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(2, 1, 'Waldo Raynor I', 'georgiana27@example.net', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', '72USlewKXr', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(3, 1, 'Dr. Milford Friesen', 'harmon.windler@example.org', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'i2lmXUxn6Z', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(4, 1, 'Reynold Koss', 'cummerata.oma@example.com', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'c7fIxgRLP6', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(5, 1, 'Elisabeth Williamson', 'crist.kaitlin@example.com', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'F2Ysmo3kIu', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(6, 1, 'Jarret Lockman', 'francisca05@example.org', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'ebjjOdTcUj', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(7, 1, 'Ms. Corine Nicolas DVM', 'qrobel@example.org', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'h4ydV1hNnk', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(8, 1, 'Jasper Murphy', 'madisen.wilkinson@example.com', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'j24uZOo6TO', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(9, 1, 'Santina Padberg DDS', 'shanna17@example.net', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'DXAp4oYlDi', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(10, 1, 'Luis Trantow', 'betty82@example.net', '$2y$10$EZ2rHLF.OLti0YEuuxDWB.cyDC7kxxqLdCjxRGPFDe4OkQkCcHZCG', 'fbI1jToPLs', '2017-08-25 16:40:38', '2017-08-25 16:40:38'),
	(11, 2, 'choi d r', '5ROBuGaxq8', '$2y$10$GFavNJ2WhSQIVrvoL/Hf8.o0MjFWFB0w2qc/YObe2B55mv6nvn.ri', 'PEJGPjKZms', '2017-08-25 16:52:57', '2017-08-25 16:52:57'),
	(12, 2, 'choi d r', 'kildong@naver.com', '$2y$10$GczpTdbTwqe4LVu/AUrvoetfW9szbvscl1JM8RrW5OKloM8iEGaVO', 'rEsalHZe4r', '2017-08-25 17:14:52', '2017-08-25 17:14:52'),
	(13, 3, 'hongkildong', 'JTlpc0xLWc@naver.com', '$2y$10$XZiD6WnP9gjJTB/cOXudhe0i0IVszo9vXsPZm/aqGat3PFn0fX8pC', 'PsAZkyydty', '2017-08-25 17:23:02', '2017-08-25 17:23:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- myapp 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `myapp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `myapp`;

-- 테이블 myapp.articles 구조 내보내기
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `view_count` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_user_id_index` (`user_id`),
  FULLTEXT KEY `search` (`title`,`content`),
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.articles:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`, `notification`, `view_count`, `deleted_at`) VALUES
	(1, 7, 'Tempora ipsa reiciendis vero assumenda et nam reprehenderit.', 'Minus sint libero quo sit molestiae. Perspiciatis dolorem officiis id est iure dolorem aut. Et ipsa dolor rerum reprehenderit suscipit. Ad eos explicabo placeat voluptas.', '2017-07-30 08:33:38', '2017-07-30 08:33:38', 1, 127, NULL),
	(2, 7, 'Repellat voluptatum inventore accusantium deserunt.', 'Et est et ut voluptatibus eum repellendus iusto. Nisi dolor aut dolores libero rerum voluptatem voluptate. Et iusto delectus ratione quia aut.', '2017-07-18 09:40:30', '2017-07-18 09:40:30', 1, 76, NULL),
	(3, 1, 'Omnis eveniet doloremque nesciunt.', 'Similique voluptas totam accusantium. At sunt mollitia molestiae quisquam. In molestiae ut maiores et minus enim nam eligendi. Aut ducimus laboriosam delectus soluta dignissimos doloremque. Omnis soluta omnis asperiores ipsa quod commodi.', '2017-07-07 08:18:25', '2017-07-07 08:18:25', 1, 92, NULL),
	(4, 4, 'Maiores ut non et molestias rerum.', 'Debitis molestiae perspiciatis explicabo illo asperiores et id. Distinctio eligendi quas velit nihil optio quis. Sint placeat expedita et reprehenderit qui voluptates in. Et omnis quis veritatis est nihil.', '2017-07-27 09:44:31', '2017-07-27 09:44:31', 1, 3, NULL),
	(5, 6, 'Nam et aliquid et voluptate sit.', 'Aperiam suscipit doloribus eligendi pariatur facere debitis non. Officia et voluptatum dolorum impedit aperiam atque dolor. Aut repellendus est est odio quisquam. Ea et voluptas repellat placeat esse eaque cumque.', '2017-08-01 13:45:50', '2017-08-05 03:29:44', 1, 44, NULL),
	(6, 1, 'Tempora sit quibusdam et et aut earum.', 'Quod molestiae doloremque tempora iure quis. Eaque aut enim reiciendis voluptatem id. Praesentium perferendis ea iste animi vel. Velit consequatur tempora necessitatibus vitae explicabo culpa libero.', '2017-07-09 07:31:42', '2017-07-09 07:31:42', 1, 66, NULL),
	(7, 3, 'Sint totam qui enim minus.', 'Laudantium illo culpa atque iusto accusamus. Vel sint consequuntur voluptas expedita quis maiores. Aut adipisci rerum sed.', '2017-07-09 15:39:07', '2017-07-09 15:39:07', 1, 5, NULL),
	(8, 7, 'Sapiente nulla atque sint corrupti totam provident nemo iusto.', 'Aut sequi eos exercitationem est. Non dolores praesentium quaerat id architecto doloremque. Quia praesentium nemo temporibus. Error aperiam officiis ipsam quae eveniet eveniet voluptas.', '2017-07-19 18:10:25', '2017-08-06 08:35:07', 1, 5, NULL),
	(9, 2, 'Velit et sapiente et quo adipisci sed.', 'Maxime vitae eum animi in. Veritatis mollitia et quod recusandae.', '2017-07-28 10:54:34', '2017-07-28 10:54:34', 1, 15, NULL),
	(10, 3, 'Sint nulla nostrum ullam animi et rerum tempora.', 'Nesciunt qui nihil reiciendis sint. Officiis est repudiandae non ratione animi. Eligendi aut velit est itaque exercitationem qui ipsum. Tempora facilis veniam neque.', '2017-07-23 15:53:29', '2017-08-06 10:11:26', 1, 8, NULL),
	(11, 8, 'AAAAAAAAAAA', 'AAAAAAAAAAAAAAAAAAAAAAAA', '2017-08-06 04:57:12', '2017-08-06 09:31:49', 1, 4, NULL),
	(12, 8, 'BBBBBBBBBBBBBBBBBBB', 'BBBBBBBBBBBBBBBBBBBBBBBBBB', '2017-08-06 04:57:30', '2017-08-06 04:57:31', 1, 1, NULL),
	(13, 8, 'CCCCCCCCCCCCCCCCC', 'CCCCCCCCCCCCCCCCCCC', '2017-08-06 04:57:57', '2017-08-06 04:57:58', 1, 1, NULL),
	(14, 8, 'DDDDDDDDDDDDDDDDDDDD', 'DDDDDDDDDDDDDDDDDDDDDDD', '2017-08-06 04:58:38', '2017-08-06 04:58:39', 1, 1, NULL),
	(15, 8, 'EEEEEEEEEEEEEEEEEEEEE', 'EEEEEEEEEEEEEEEEEEEE', '2017-08-06 04:59:02', '2017-08-06 06:59:18', 1, 3, NULL),
	(16, 8, '대한민국 경상남도', '대한민국 경상남도 장천동', '2017-08-06 05:08:21', '2017-08-06 09:50:46', 1, 22, NULL),
	(17, 8, 'AAAAAAAAAAAAAAAA', '![](http://localhost:8000/files/3tIXAf1ogzISHlG6myapp_erd.png)\r\n', '2017-08-06 10:12:45', '2017-08-07 04:45:51', 1, 7, NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- 테이블 myapp.article_tag 구조 내보내기
CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_tag_article_id_foreign` (`article_id`),
  KEY `article_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `article_tag_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.article_tag:~25 rows (대략적) 내보내기
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` (`id`, `article_id`, `tag_id`) VALUES
	(1, 1, 4),
	(2, 1, 5),
	(3, 2, 4),
	(4, 3, 4),
	(5, 3, 5),
	(6, 4, 5),
	(7, 5, 3),
	(8, 6, 5),
	(9, 6, 3),
	(10, 6, 4),
	(11, 7, 3),
	(12, 7, 2),
	(13, 8, 1),
	(14, 9, 4),
	(15, 9, 3),
	(16, 9, 5),
	(17, 10, 2),
	(18, 11, 1),
	(19, 11, 3),
	(20, 12, 1),
	(21, 13, 1),
	(22, 14, 1),
	(23, 15, 1),
	(24, 16, 1),
	(25, 17, 1);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;

-- 테이블 myapp.attachments 구조 내보내기
CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bytes` int(10) unsigned DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_article_id_index` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.attachments:~20 rows (대략적) 내보내기
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` (`id`, `article_id`, `filename`, `bytes`, `mime`, `created_at`, `updated_at`) VALUES
	(1, 1, '04b00d1a2a080821e2000f570e7ce26a.jpg', 63056, 'image/jpeg', '2017-08-05 03:28:52', '2017-08-05 03:28:52'),
	(2, 2, '2f7a10a24cacb1b8ecd88e7580849ffd.jpg', 32695, 'image/jpeg', '2017-08-05 03:28:53', '2017-08-05 03:28:53'),
	(3, 3, '62837aec31112d4e1e2dabdd1cf4450e.jpg', 33946, 'image/jpeg', '2017-08-05 03:28:54', '2017-08-05 03:28:54'),
	(4, 4, '38bcd693fae6913d9f4c69aa0685848d.jpg', 38502, 'image/jpeg', '2017-08-05 03:28:55', '2017-08-05 03:28:55'),
	(5, 5, '536a8cb10d446459aab744a8c3d89182.jpg', 28263, 'image/jpeg', '2017-08-05 03:28:56', '2017-08-05 03:28:56'),
	(6, 6, '0952aee2a446c52d39b3c00aab7625e3.jpg', 37810, 'image/jpeg', '2017-08-05 03:28:57', '2017-08-05 03:28:57'),
	(7, 7, '90f1c4a59d4c47e9781095c9e6cac3d5.jpg', 31926, 'image/jpeg', '2017-08-05 03:28:58', '2017-08-05 03:28:58'),
	(8, 8, '24a3e8ab9c83831a0931bbb3cf1c28f8.jpg', 29386, 'image/jpeg', '2017-08-05 03:28:59', '2017-08-05 03:28:59'),
	(9, 9, '96fc870cef0dcdfb8d76caff06408923.jpg', 62856, 'image/jpeg', '2017-08-05 03:29:00', '2017-08-05 03:29:00'),
	(10, 10, '3e562f92a1131f77dcf1d48b28d3763b.jpg', 36748, 'image/jpeg', '2017-08-05 03:29:01', '2017-08-05 03:29:01'),
	(11, NULL, '7c9f991fca53c170e3c8957c39f1a8b2.jpg', 46487, 'image/jpeg', '2017-07-23 14:33:47', '2017-08-05 03:29:02'),
	(12, NULL, '6cde526c1c0b5ade17e630ad10e3bb9a.jpg', 57160, 'image/jpeg', '2017-07-07 08:29:43', '2017-08-05 03:29:04'),
	(13, NULL, '08fc9cd3ca88c97b8e7f1fb6519e331e.jpg', 50985, 'image/jpeg', '2017-07-14 06:54:38', '2017-08-05 03:29:05'),
	(14, NULL, 'de113873ee76cfa387f0db1fd6d2375e.jpg', 28556, 'image/jpeg', '2017-08-01 21:58:52', '2017-08-05 03:29:06'),
	(15, NULL, '26f1c15a6ed4b6b5f420428a2977d466.jpg', 42387, 'image/jpeg', '2017-07-13 10:19:30', '2017-08-05 03:29:07'),
	(16, NULL, '229583b01ec9d94e136865cacc854dd8.jpg', 45598, 'image/jpeg', '2017-07-19 23:30:00', '2017-08-05 03:29:08'),
	(17, NULL, '4408be0d79ff7ecf95774c6bd185df47.jpg', 42340, 'image/jpeg', '2017-08-03 20:29:28', '2017-08-05 03:29:09'),
	(18, NULL, '7048d9d11b2d91a45ce101d2cb64bc04.jpg', 60961, 'image/jpeg', '2017-07-18 19:47:31', '2017-08-05 03:29:10'),
	(19, NULL, '738c978b44cd37e88a07be255fdab63c.jpg', 43811, 'image/jpeg', '2017-07-28 06:02:24', '2017-08-05 03:29:11'),
	(20, NULL, '7a09a5f40861f61f8bdcb85b0076c77d.jpg', 38734, 'image/jpeg', '2017-07-11 10:16:51', '2017-08-05 03:29:12'),
	(21, 17, '3tIXAf1ogzISHlG6myapp_erd.png', 81506, 'image/png', '2017-08-06 10:12:42', '2017-08-06 10:12:45');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;

-- 테이블 myapp.comments 구조 내보내기
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commentable_id` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  KEY `comments_user_id_index` (`user_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.comments:~70 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `user_id`, `parent_id`, `commentable_type`, `commentable_id`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 6, NULL, 'App\\Article', 1, 'Tempore veritatis et omnis perferendis officia est tempore. Provident voluptate quae voluptatem voluptatum assumenda natus excepturi.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', NULL),
	(2, 7, NULL, 'App\\Article', 1, 'Necessitatibus sed magni quidem aperiam quos. Impedit maiores sint cumque et. Perspiciatis debitis possimus sunt. Commodi quaerat voluptatem voluptas neque molestias.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', '2017-08-05 03:29:12'),
	(3, 2, NULL, 'App\\Article', 2, 'Est eos ratione temporibus excepturi. Dolor aliquam mollitia qui aspernatur non laudantium. Quo laborum ut eos. Odit maiores officiis est.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', NULL),
	(4, 7, NULL, 'App\\Article', 2, 'Accusantium voluptatem aut quis dolore nihil. Natus ipsa quia minus dicta. Ipsum magni delectus necessitatibus saepe iusto.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', '2017-08-05 03:29:12'),
	(5, 5, NULL, 'App\\Article', 3, 'Et architecto sint quo nesciunt numquam earum qui. Recusandae tenetur explicabo autem et ducimus sapiente dolor distinctio. Nulla id nam facere quibusdam eum assumenda. Minus voluptas adipisci molestias voluptatum dolorem quod. Rem ipsam placeat officiis voluptate enim omnis iusto.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', NULL),
	(6, 3, NULL, 'App\\Article', 3, 'Esse ipsam et possimus. Magnam maxime ducimus ipsum incidunt a. Consequatur non vel voluptas.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', '2017-08-05 03:29:12'),
	(7, 1, NULL, 'App\\Article', 4, 'Hic voluptatibus et nisi quibusdam iure perspiciatis. Molestias ratione velit cum quas est odit dolor. Reiciendis facilis sit quisquam expedita aliquam sit. Rem quia nisi voluptatum.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', NULL),
	(8, 4, NULL, 'App\\Article', 4, 'Eum omnis aut accusamus odit. Culpa esse magnam nihil repudiandae assumenda sit. Maiores ipsum expedita aut fuga enim sequi adipisci. Voluptatem hic modi sunt veniam culpa.', '2017-08-05 03:29:12', '2017-08-05 03:29:12', '2017-08-05 03:29:12'),
	(9, 2, NULL, 'App\\Article', 5, 'Ea dicta sed consequuntur dolor ab libero. Neque qui optio eos voluptates maxime ut. Provident quod voluptas ipsum fugiat qui corporis quasi.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(10, 6, NULL, 'App\\Article', 5, 'Quis ut distinctio nam quisquam amet sequi. Veritatis error perferendis non quisquam. Consequuntur atque earum qui natus molestiae perspiciatis. Eos aut ad aliquid incidunt qui.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(11, 1, NULL, 'App\\Article', 6, 'Autem esse omnis ad. Asperiores quos perspiciatis quia molestiae. Corporis accusantium voluptas maxime commodi. Quis numquam est eveniet maiores a nulla.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(12, 2, NULL, 'App\\Article', 6, 'Qui ipsam aliquam repellendus ipsum voluptas deserunt voluptatem. Aspernatur non fugit eaque aut. Ut tempora id aut sequi. Qui qui adipisci aut.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(13, 6, NULL, 'App\\Article', 7, 'Velit cupiditate tenetur atque ex qui. Quia sunt quisquam ab dolorum. Ex debitis dolores rerum et. Est nisi ipsam culpa similique nulla veniam molestiae. Et et voluptatum amet dolores tenetur.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(14, 3, NULL, 'App\\Article', 7, 'Ullam tenetur dolore sapiente sit corrupti. Distinctio fugit totam in quae modi voluptatibus. In enim amet harum nihil. Aut officiis qui fugit ut et voluptatem maiores.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(15, 1, NULL, 'App\\Article', 8, 'Qui amet iste accusantium est. Nulla sed et voluptatum id eum. Eos accusantium iste incidunt dolorum. Sed omnis rerum quaerat qui rerum.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(16, 6, NULL, 'App\\Article', 8, 'Optio debitis ipsam corporis eos repellat. Neque dolorem sapiente cum doloremque labore.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(17, 1, NULL, 'App\\Article', 9, 'Quia asperiores cumque maiores exercitationem deleniti reprehenderit harum. Tempora quos tempore quibusdam voluptas totam. In dolorem molestiae ex voluptas qui fuga.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(18, 5, NULL, 'App\\Article', 9, 'Placeat fuga adipisci possimus maxime dolorem dolor quia. Odit magnam sint sed unde non id labore. Aut maiores inventore ut assumenda voluptatem et esse. Recusandae ipsam dicta excepturi impedit temporibus error quis. Libero blanditiis cum cupiditate saepe.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(19, 5, NULL, 'App\\Article', 10, 'Impedit nulla est velit est. Nulla voluptates saepe modi temporibus qui dolorem.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(20, 3, NULL, 'App\\Article', 10, 'Rerum eum aut porro esse dolores voluptas in. Consequatur voluptas aut vel qui. Minus autem omnis qui tenetur. Laudantium distinctio et unde ut voluptate sit ut veniam.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(21, 6, 17, 'App\\Article', 1, 'Placeat inventore et aut odit. Eaque nobis voluptate eos. Fugit aut dolores quasi ullam. Explicabo deserunt blanditiis aut est sed earum ab.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(22, 3, 17, 'App\\Article', 1, 'Placeat nam quod tenetur. Quasi quia eius eos facere ratione nobis dignissimos. Adipisci aut officia ipsa animi. Deleniti eligendi cum magnam saepe.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(23, 1, 17, 'App\\Article', 1, 'Reiciendis excepturi beatae et autem. Rem veniam aliquam fugit ullam. Et ut dolore ipsam molestias eaque esse totam. Quod consequatur fuga et quas ut.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(24, 4, 5, 'App\\Article', 1, 'Laudantium illo similique minima perferendis atque eos occaecati expedita. Eaque est enim molestiae voluptatem quaerat laboriosam. Assumenda fugit incidunt ratione.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(25, 6, 9, 'App\\Article', 1, 'Quam nemo sunt reiciendis nobis laborum suscipit modi cupiditate. Laborum et quia cumque et eos voluptas. Asperiores ut nihil ipsam molestiae qui consectetur.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(26, 3, 23, 'App\\Article', 2, 'Assumenda aut placeat voluptas numquam pariatur illum amet. Quis iusto hic doloribus voluptatibus voluptas vel. Neque ducimus aut aperiam recusandae dignissimos. Eligendi cumque maiores distinctio dolor est.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(27, 1, 23, 'App\\Article', 2, 'Magnam dicta modi est et eligendi aliquam. Non consequuntur aut necessitatibus facilis. Quasi est tempora ab asperiores.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(28, 4, 1, 'App\\Article', 2, 'Optio molestiae enim suscipit velit ad magnam odio. Est minus et nihil iure sunt. Ipsam nisi sit sit explicabo. Voluptatem consequatur molestiae voluptas et.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(29, 1, 21, 'App\\Article', 2, 'Quibusdam et dolores non pariatur voluptas. Atque impedit maxime ipsam autem quia et. Molestiae amet aut voluptas. Repellendus mollitia nemo sed.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(30, 6, 3, 'App\\Article', 2, 'Quos placeat quas eius voluptate aut quam inventore vero. Cum et eos eum alias et. Consectetur corrupti eos amet sunt accusamus fugiat explicabo. Fugit numquam voluptatem error eveniet ad.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(31, 1, 17, 'App\\Article', 3, 'Repudiandae eligendi ullam ut fugiat. Aut aliquid qui facere ratione voluptas aut. Alias natus est magnam debitis. Quod autem sint dolore est ipsum possimus nihil.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(32, 3, 27, 'App\\Article', 3, 'Et aut reiciendis eum facere est quam. Magni laborum et possimus sed et. Voluptatem dolorum assumenda officiis blanditiis vel est. At molestias quia cupiditate harum fugit.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(33, 7, 5, 'App\\Article', 3, 'Vero qui ut quis aliquid et id. Cum autem id eum nulla. Earum laudantium sit labore molestias. Nemo quo aut reprehenderit velit.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(34, 3, 15, 'App\\Article', 3, 'Quia esse eligendi ut voluptatem tempora sint. Et odit id delectus placeat. Illo eos dicta qui saepe fugit et enim.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(35, 3, 23, 'App\\Article', 3, 'Fuga explicabo atque facere nesciunt. At consequatur sed nulla. Blanditiis laborum dolores aut. Sequi ipsa perferendis esse soluta at qui aspernatur cum.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(36, 1, 1, 'App\\Article', 4, 'Voluptas quis vero architecto qui laborum. Amet illum ut iusto officia. Aut assumenda aspernatur et aut ipsum.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(37, 1, 34, 'App\\Article', 4, 'Ratione quo necessitatibus asperiores delectus esse natus natus rerum. Id consequatur velit quam.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(38, 5, 9, 'App\\Article', 4, 'Odio sed id laudantium veniam molestiae qui laborum. Illo nihil quo in aut. Provident omnis aperiam et dicta non. Illo itaque voluptates nesciunt cupiditate aut dolore. Corporis ad qui deleniti nobis cumque temporibus excepturi.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(39, 6, 3, 'App\\Article', 4, 'Dolores dolorum est eius odit. Qui non suscipit sit recusandae omnis est eum. Animi mollitia aut consequatur soluta id.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(40, 2, 17, 'App\\Article', 4, 'Aut nisi nobis rerum voluptatum ipsa laboriosam repellat provident. Et repellendus harum odit. Quod in et rerum ut a.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(41, 5, 1, 'App\\Article', 5, 'Voluptatibus odio aut doloremque culpa. Eum labore odio et est quos alias quidem autem. Perspiciatis facilis voluptatibus ut et delectus ut sit vel.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(42, 6, 22, 'App\\Article', 5, 'Sequi quo autem error ut magni quisquam. Repellendus aut alias distinctio sit earum aut quia. Repellendus quia repellendus impedit expedita cum et enim repudiandae. Inventore assumenda magni animi non dolores.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(43, 1, 39, 'App\\Article', 5, 'Dolores a non quibusdam perferendis. Error pariatur molestias at consequatur qui. Dolorem id veniam ab aut mollitia ut distinctio ducimus.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(44, 4, 9, 'App\\Article', 5, 'Quas et sed animi ut incidunt. Qui tenetur velit quos quisquam optio et. Eaque quis molestias quaerat nisi aut molestiae explicabo.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(45, 1, 15, 'App\\Article', 5, 'Adipisci atque recusandae qui optio. Sapiente voluptatem vel et nam. Architecto nostrum enim ab voluptatem qui.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(46, 6, 44, 'App\\Article', 6, 'Provident dolor et et quo minus molestiae nam. Architecto illo quia mollitia molestiae. Ut consequatur quod eligendi maiores autem dolore.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(47, 2, 26, 'App\\Article', 6, 'Voluptatibus ullam numquam laboriosam quaerat quia. Sint autem vel et et. Accusamus eius ea nihil.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(48, 6, 34, 'App\\Article', 6, 'Tempora eveniet et eos distinctio modi mollitia esse et. Ut sed quia sunt molestiae non.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(49, 7, 23, 'App\\Article', 6, 'Non provident sunt dignissimos eveniet sed eveniet. Animi ut voluptas voluptatibus velit. Debitis eum mollitia quas id hic id id. Minima itaque autem veritatis fugiat.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(50, 6, 26, 'App\\Article', 6, 'Autem animi perferendis beatae esse quia. Eveniet sint beatae quos perferendis dolor. Ut eveniet sequi laboriosam vel ea. Omnis ad odio est nemo.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(51, 4, 21, 'App\\Article', 7, 'Voluptatem cumque suscipit non omnis at ut quasi. Ducimus hic est laborum maxime. Animi cupiditate deleniti eveniet neque quidem earum id. Ullam sint enim excepturi possimus est.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(52, 4, 35, 'App\\Article', 7, 'Dolor qui nisi aperiam possimus est id. Et quibusdam sint rerum ipsum placeat et rerum. Officiis et eos impedit repudiandae animi neque aliquam. Nesciunt excepturi et eveniet.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(53, 1, 23, 'App\\Article', 7, 'Quibusdam excepturi praesentium laboriosam voluptas. Porro consequuntur et omnis natus earum culpa fugit soluta.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(54, 1, 45, 'App\\Article', 7, 'Sint dolores asperiores laboriosam dolores. Nesciunt occaecati nihil rem natus. Voluptates iusto omnis ut dolorum rerum omnis suscipit. Eos in aliquid dicta eius est sunt.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(55, 4, 41, 'App\\Article', 7, 'Ducimus minima dolorem et odit saepe. Dolore aut corporis praesentium sint. Officia et ratione dolore ea ratione voluptatem. Maxime sed voluptatem aliquid dolore repellendus consequatur et.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(56, 4, 36, 'App\\Article', 8, 'Dicta quod libero sunt iure consequuntur perferendis aliquid doloribus. Quas qui qui et id. Fugiat accusamus quisquam sint omnis sed est. Quibusdam architecto facere qui dolorem ullam sunt quis.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(57, 7, 21, 'App\\Article', 8, 'Voluptatem temporibus et consequatur sapiente quas. Voluptatem veniam est nihil quia in. Reiciendis et quis quis velit. Laborum odit ut deleniti odit quod.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(58, 7, 39, 'App\\Article', 8, 'Doloremque vel autem beatae in maxime. Dolorem odio repudiandae aut veritatis esse cumque quas quos. Nulla laboriosam nisi hic consequuntur.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(59, 2, 50, 'App\\Article', 8, 'Vero minima ipsam exercitationem similique voluptatem odit. Minima natus ratione eaque eos. Culpa sit perferendis odit fugit in aut molestiae. Explicabo maiores qui iste molestiae. Labore ea eum incidunt.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(60, 3, 34, 'App\\Article', 8, 'Beatae a accusamus quia aut qui ad impedit eum. Libero voluptas aut fuga quisquam quaerat qui nesciunt. Nostrum magnam tempore dicta dolore est quis animi et. Doloribus atque ipsum dignissimos aut odit sunt quod.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(61, 5, 55, 'App\\Article', 9, 'Placeat maiores voluptatum qui est deleniti aut. Molestias sunt dolor vel facere ullam possimus. Laudantium vel sit consequuntur sit. Sunt suscipit repellendus sit vitae.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(62, 2, 5, 'App\\Article', 9, 'Ab ut labore ea. Dolor tenetur aut aut aut quam.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(63, 1, 9, 'App\\Article', 9, 'Cupiditate velit velit tenetur illo. Consequatur magni et porro eius tempore sed quae. Nihil minus dicta aut eos. Et hic explicabo aperiam voluptas eligendi amet minus.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(64, 2, 13, 'App\\Article', 9, 'Nesciunt optio fugiat id. Dolorem sint nostrum molestiae nam qui eaque. Vero est veritatis vel consequatur et.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(65, 6, 22, 'App\\Article', 9, 'Libero reiciendis ut possimus aperiam. Et ut exercitationem nulla cumque et eos veniam. Quas fugit veritatis molestias in facere aperiam.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(66, 1, 39, 'App\\Article', 10, 'Est dolorem ab quas repellendus dignissimos vel illum. Facilis sit autem sequi sit.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(67, 3, 26, 'App\\Article', 10, 'Quasi soluta temporibus et illo voluptas. Voluptas et nam ea beatae. Voluptatem sed dolorem culpa labore. Id debitis architecto non voluptatum quasi dolor et.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(68, 6, 37, 'App\\Article', 10, 'Eum earum consectetur voluptatem. Ducimus quasi corporis praesentium perspiciatis quaerat et. Quod eos esse ut saepe eaque maxime consectetur. Tempore sunt pariatur porro quis repellendus nostrum pariatur.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL),
	(69, 7, 40, 'App\\Article', 10, 'Quis eos ut quo natus. Ut numquam suscipit facilis distinctio cupiditate. Atque aut enim excepturi quidem quisquam dolor iusto.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', '2017-08-05 03:29:13'),
	(70, 1, 52, 'App\\Article', 10, 'Aut reiciendis mollitia placeat vel repudiandae eum. Non eum ea aut enim debitis. Et provident totam possimus cum modi amet esse officiis. Rerum veritatis alias voluptates perferendis libero. Consequatur nam provident temporibus ea aliquid et odio error.', '2017-08-05 03:29:13', '2017-08-05 03:29:13', NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- 테이블 myapp.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.migrations:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2016_09_04_093824_create_articles_table', 1),
	('2016_09_10_011647_create_tags_table', 1),
	('2016_09_10_011654_create_article_tag_table', 1),
	('2016_09_10_040857_add_last_login_column_on_users_table', 1),
	('2016_09_11_224837_add_confirm_code_column_on_users_table', 1),
	('2016_09_14_210419_add_nullable_to_password_column_on_users_table', 1),
	('2016_09_15_043449_create_attachments_table', 1),
	('2016_09_15_095657_create_comments_table', 1),
	('2016_09_15_235854_create_votes_table', 1),
	('2016_09_16_033759_add_columns_on_articles_table', 1),
	('2016_09_16_050319_add_softdelete_on_comments_table', 1),
	('2016_09_16_134105_add_softdelete_on_articles_table', 1),
	('2016_09_16_231034_add_multilingual_columns_on_tags_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 myapp.password_resets 구조 내보내기
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.password_resets:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- 테이블 myapp.tags 구조 내보내기
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ko` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.tags:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`, `ko`, `en`) VALUES
	(1, '라라벨', 'laravel', '2017-08-05 03:28:49', '2017-08-05 03:28:49', '라라벨', 'Laravel'),
	(2, '루멘', 'lumen', '2017-08-05 03:28:49', '2017-08-05 03:28:49', '루멘', 'Lumen'),
	(3, '자유의견', 'general', '2017-08-05 03:28:49', '2017-08-05 03:28:49', '자유의견', 'General'),
	(4, '서버', 'server', '2017-08-05 03:28:49', '2017-08-05 03:28:49', '서버', 'Server'),
	(5, '팁', 'tip', '2017-08-05 03:28:49', '2017-08-05 03:28:49', '팁', 'Tip');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- 테이블 myapp.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `confirm_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.users:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `last_login`, `confirm_code`, `activated`) VALUES
	(1, 'John Doe', 'john@example.com', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', 'mgIokEJDTd', '2017-08-05 03:28:49', '2017-08-05 03:28:49', NULL, 'TKgYTgkDUzl8j2ZGRlrTN4WSgIawVCXdD8LpV9LJoBlINOMbzy91xaOHxIT8', 1),
	(2, 'Foo', 'foo@example.com', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', '9uiTGqk43D', '2017-08-05 03:28:50', '2017-08-05 03:28:50', NULL, NULL, 1),
	(3, 'Pamela Gorczany', 'quigley.ona@example.org', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', 'XlmzZtAyfk', '2017-08-05 03:28:50', '2017-08-05 03:28:50', NULL, NULL, 1),
	(4, 'Arjun Ziemann DVM', 'mbogisich@example.net', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', 'D4QMP11JdR', '2017-08-05 03:28:50', '2017-08-05 03:28:50', NULL, 'zwPTIoPEkratGRNFs9L523qbFaJpqgIdNsxbX5djPVjfe6SihReA4CGTCjQD', 0),
	(5, 'Valerie Jerde', 'tatyana33@example.org', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', '0NmfWrFugV', '2017-08-05 03:28:50', '2017-08-05 03:28:50', NULL, NULL, 1),
	(6, 'Andres Effertz', 'gutmann.jaylan@example.com', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', 'btjrgay2D5', '2017-08-05 03:28:50', '2017-08-05 03:28:50', NULL, '4F9Tu5JHcVOwutLMPFYUq1PrlpqkwvKYJEVvoyYn6730NgMVUcr6JNfFVKoh', 0),
	(7, 'Chauncey Kulas II', 'dejon.bechtelar@example.org', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', 'PhIcQUPm5d', '2017-08-05 03:28:50', '2017-08-05 03:28:50', NULL, NULL, 1),
	(8, '최동린', 'drchoi2k@naver.com', '$2y$10$M3t8ShSIWS8a1vEsdY1qSu9T9DUwoKBa9lwahtvWH9DGITSHkq9/a', 'SQSOj79RFtX1XuDK57zUrjcvQFi1G3krMfBHKrji0EmfUKfikUDy6hZzJ4f8', '2017-08-05 03:31:13', '2017-08-07 04:47:28', '2017-08-07 02:03:17', 'ziQDH3E4DWhiSpuWlgYhF1NRgYnQXxSBE4ipG5JNiGg8dYZbD47SWr6yKOXO', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 테이블 myapp.votes 구조 내보내기
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `up` tinyint(1) DEFAULT NULL,
  `down` tinyint(1) DEFAULT NULL,
  `voted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `votes_user_id_foreign` (`user_id`),
  KEY `votes_comment_id_foreign` (`comment_id`),
  CONSTRAINT `votes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 myapp.votes:~144 rows (대략적) 내보내기
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` (`id`, `user_id`, `comment_id`, `up`, `down`, `voted_at`) VALUES
	(1, 2, 1, NULL, 1, '2017-08-05 12:29:13'),
	(2, 1, 1, NULL, 1, '2017-08-05 12:29:13'),
	(3, 6, 1, NULL, 1, '2017-08-05 12:29:13'),
	(4, 2, 3, NULL, 1, '2017-08-05 12:29:13'),
	(5, 6, 3, NULL, 1, '2017-08-05 12:29:13'),
	(6, 7, 3, 1, NULL, '2017-08-05 12:29:13'),
	(7, 2, 5, 1, NULL, '2017-08-05 12:29:13'),
	(8, 6, 5, 1, NULL, '2017-08-05 12:29:13'),
	(9, 7, 5, 1, NULL, '2017-08-05 12:29:13'),
	(10, 5, 7, NULL, 1, '2017-08-05 12:29:13'),
	(11, 1, 7, 1, NULL, '2017-08-05 12:29:13'),
	(12, 7, 7, NULL, 1, '2017-08-05 12:29:13'),
	(13, 4, 9, NULL, 1, '2017-08-05 12:29:13'),
	(14, 5, 9, 1, NULL, '2017-08-05 12:29:13'),
	(15, 1, 9, 1, NULL, '2017-08-05 12:29:13'),
	(16, 4, 11, 1, NULL, '2017-08-05 12:29:13'),
	(17, 7, 11, 1, NULL, '2017-08-05 12:29:13'),
	(18, 6, 11, NULL, 1, '2017-08-05 12:29:13'),
	(19, 2, 13, 1, NULL, '2017-08-05 12:29:13'),
	(20, 7, 13, NULL, 1, '2017-08-05 12:29:13'),
	(21, 6, 13, 1, NULL, '2017-08-05 12:29:13'),
	(22, 5, 15, 1, NULL, '2017-08-05 12:29:13'),
	(23, 5, 15, NULL, 1, '2017-08-05 12:29:13'),
	(24, 7, 15, NULL, 1, '2017-08-05 12:29:13'),
	(25, 7, 17, 1, NULL, '2017-08-05 12:29:13'),
	(26, 2, 17, NULL, 1, '2017-08-05 12:29:13'),
	(27, 1, 17, NULL, 1, '2017-08-05 12:29:13'),
	(28, 2, 19, NULL, 1, '2017-08-05 12:29:13'),
	(29, 5, 19, NULL, 1, '2017-08-05 12:29:13'),
	(30, 2, 19, 1, NULL, '2017-08-05 12:29:13'),
	(31, 5, 21, NULL, 1, '2017-08-05 12:29:13'),
	(32, 7, 21, 1, NULL, '2017-08-05 12:29:13'),
	(33, 2, 21, 1, NULL, '2017-08-05 12:29:13'),
	(34, 5, 22, 1, NULL, '2017-08-05 12:29:13'),
	(35, 3, 22, NULL, 1, '2017-08-05 12:29:13'),
	(36, 2, 22, NULL, 1, '2017-08-05 12:29:13'),
	(37, 2, 23, NULL, 1, '2017-08-05 12:29:13'),
	(38, 1, 23, 1, NULL, '2017-08-05 12:29:13'),
	(39, 6, 23, 1, NULL, '2017-08-05 12:29:13'),
	(40, 1, 24, 1, NULL, '2017-08-05 12:29:13'),
	(41, 7, 24, NULL, 1, '2017-08-05 12:29:13'),
	(42, 1, 24, 1, NULL, '2017-08-05 12:29:13'),
	(43, 5, 25, NULL, 1, '2017-08-05 12:29:13'),
	(44, 6, 25, NULL, 1, '2017-08-05 12:29:13'),
	(45, 1, 25, 1, NULL, '2017-08-05 12:29:13'),
	(46, 2, 26, 1, NULL, '2017-08-05 12:29:13'),
	(47, 2, 26, 1, NULL, '2017-08-05 12:29:13'),
	(48, 2, 26, NULL, 1, '2017-08-05 12:29:13'),
	(49, 2, 27, 1, NULL, '2017-08-05 12:29:13'),
	(50, 6, 27, 1, NULL, '2017-08-05 12:29:13'),
	(51, 7, 27, NULL, 1, '2017-08-05 12:29:13'),
	(52, 1, 29, 1, NULL, '2017-08-05 12:29:13'),
	(53, 5, 29, 1, NULL, '2017-08-05 12:29:13'),
	(54, 1, 29, 1, NULL, '2017-08-05 12:29:13'),
	(55, 6, 31, 1, NULL, '2017-08-05 12:29:13'),
	(56, 3, 31, 1, NULL, '2017-08-05 12:29:13'),
	(57, 4, 31, 1, NULL, '2017-08-05 12:29:13'),
	(58, 1, 34, NULL, 1, '2017-08-05 12:29:13'),
	(59, 3, 34, 1, NULL, '2017-08-05 12:29:13'),
	(60, 2, 34, 1, NULL, '2017-08-05 12:29:13'),
	(61, 7, 35, NULL, 1, '2017-08-05 12:29:13'),
	(62, 3, 35, 1, NULL, '2017-08-05 12:29:13'),
	(63, 4, 35, NULL, 1, '2017-08-05 12:29:13'),
	(64, 3, 36, NULL, 1, '2017-08-05 12:29:13'),
	(65, 4, 36, NULL, 1, '2017-08-05 12:29:13'),
	(66, 6, 36, NULL, 1, '2017-08-05 12:29:13'),
	(67, 4, 37, 1, NULL, '2017-08-05 12:29:13'),
	(68, 2, 37, NULL, 1, '2017-08-05 12:29:13'),
	(69, 4, 37, 1, NULL, '2017-08-05 12:29:13'),
	(70, 5, 39, 1, NULL, '2017-08-05 12:29:13'),
	(71, 5, 39, NULL, 1, '2017-08-05 12:29:13'),
	(72, 2, 39, 1, NULL, '2017-08-05 12:29:13'),
	(73, 3, 40, NULL, 1, '2017-08-05 12:29:13'),
	(74, 5, 40, NULL, 1, '2017-08-05 12:29:13'),
	(75, 4, 40, NULL, 1, '2017-08-05 12:29:13'),
	(76, 2, 41, NULL, 1, '2017-08-05 12:29:13'),
	(77, 4, 41, NULL, 1, '2017-08-05 12:29:13'),
	(78, 6, 41, NULL, 1, '2017-08-05 12:29:13'),
	(79, 6, 42, 1, NULL, '2017-08-05 12:29:13'),
	(80, 7, 42, NULL, 1, '2017-08-05 12:29:13'),
	(81, 3, 42, NULL, 1, '2017-08-05 12:29:13'),
	(82, 4, 43, 1, NULL, '2017-08-05 12:29:13'),
	(83, 3, 43, NULL, 1, '2017-08-05 12:29:13'),
	(84, 1, 43, 1, NULL, '2017-08-05 12:29:13'),
	(85, 6, 44, NULL, 1, '2017-08-05 12:29:13'),
	(86, 2, 44, 1, NULL, '2017-08-05 12:29:13'),
	(87, 7, 44, NULL, 1, '2017-08-05 12:29:13'),
	(88, 1, 45, NULL, 1, '2017-08-05 12:29:13'),
	(89, 4, 45, NULL, 1, '2017-08-05 12:29:13'),
	(90, 1, 45, NULL, 1, '2017-08-05 12:29:13'),
	(91, 6, 48, NULL, 1, '2017-08-05 12:29:13'),
	(92, 7, 48, 1, NULL, '2017-08-05 12:29:13'),
	(93, 7, 48, NULL, 1, '2017-08-05 12:29:13'),
	(94, 3, 49, NULL, 1, '2017-08-05 12:29:13'),
	(95, 6, 49, NULL, 1, '2017-08-05 12:29:13'),
	(96, 6, 49, NULL, 1, '2017-08-05 12:29:13'),
	(97, 6, 50, 1, NULL, '2017-08-05 12:29:13'),
	(98, 4, 50, 1, NULL, '2017-08-05 12:29:13'),
	(99, 3, 50, NULL, 1, '2017-08-05 12:29:13'),
	(100, 2, 52, NULL, 1, '2017-08-05 12:29:13'),
	(101, 7, 52, 1, NULL, '2017-08-05 12:29:14'),
	(102, 3, 52, 1, NULL, '2017-08-05 12:29:14'),
	(103, 4, 54, 1, NULL, '2017-08-05 12:29:14'),
	(104, 5, 54, NULL, 1, '2017-08-05 12:29:14'),
	(105, 1, 54, 1, NULL, '2017-08-05 12:29:14'),
	(106, 7, 55, 1, NULL, '2017-08-05 12:29:14'),
	(107, 2, 55, 1, NULL, '2017-08-05 12:29:14'),
	(108, 1, 55, NULL, 1, '2017-08-05 12:29:14'),
	(109, 4, 57, NULL, 1, '2017-08-05 12:29:14'),
	(110, 2, 57, NULL, 1, '2017-08-05 12:29:14'),
	(111, 5, 57, NULL, 1, '2017-08-05 12:29:14'),
	(112, 1, 58, NULL, 1, '2017-08-05 12:29:14'),
	(113, 4, 58, 1, NULL, '2017-08-05 12:29:14'),
	(114, 1, 58, 1, NULL, '2017-08-05 12:29:14'),
	(115, 1, 59, 1, NULL, '2017-08-05 12:29:14'),
	(116, 1, 59, 1, NULL, '2017-08-05 12:29:14'),
	(117, 2, 59, 1, NULL, '2017-08-05 12:29:14'),
	(118, 2, 61, NULL, 1, '2017-08-05 12:29:14'),
	(119, 5, 61, 1, NULL, '2017-08-05 12:29:14'),
	(120, 1, 61, NULL, 1, '2017-08-05 12:29:14'),
	(121, 6, 62, 1, NULL, '2017-08-05 12:29:14'),
	(122, 7, 62, 1, NULL, '2017-08-05 12:29:14'),
	(123, 3, 62, 1, NULL, '2017-08-05 12:29:14'),
	(124, 6, 63, NULL, 1, '2017-08-05 12:29:14'),
	(125, 1, 63, 1, NULL, '2017-08-05 12:29:14'),
	(126, 3, 63, 1, NULL, '2017-08-05 12:29:14'),
	(127, 2, 64, NULL, 1, '2017-08-05 12:29:14'),
	(128, 3, 64, 1, NULL, '2017-08-05 12:29:14'),
	(129, 3, 64, NULL, 1, '2017-08-05 12:29:14'),
	(130, 6, 65, NULL, 1, '2017-08-05 12:29:14'),
	(131, 6, 65, 1, NULL, '2017-08-05 12:29:14'),
	(132, 3, 65, 1, NULL, '2017-08-05 12:29:14'),
	(133, 5, 66, NULL, 1, '2017-08-05 12:29:14'),
	(134, 2, 66, NULL, 1, '2017-08-05 12:29:14'),
	(135, 1, 66, 1, NULL, '2017-08-05 12:29:14'),
	(136, 5, 67, 1, NULL, '2017-08-05 12:29:14'),
	(137, 3, 67, NULL, 1, '2017-08-05 12:29:14'),
	(138, 4, 67, 1, NULL, '2017-08-05 12:29:14'),
	(139, 3, 68, NULL, 1, '2017-08-05 12:29:14'),
	(140, 6, 68, NULL, 1, '2017-08-05 12:29:14'),
	(141, 6, 68, 1, NULL, '2017-08-05 12:29:14'),
	(142, 1, 70, 1, NULL, '2017-08-05 12:29:14'),
	(143, 2, 70, NULL, 1, '2017-08-05 12:29:14'),
	(144, 7, 70, 1, NULL, '2017-08-05 12:29:14');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
