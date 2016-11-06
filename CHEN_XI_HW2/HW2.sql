-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 26, 2016 at 11:35 AM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `HW2`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_09_19_190222_create_pokemons_table', 1),
('2016_09_19_190455_create_trainers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pokemons`
--

CREATE TABLE IF NOT EXISTS `pokemons` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pokemons`
--

INSERT INTO `pokemons` (`id`, `name`, `num`, `created_at`, `updated_at`) VALUES
(6, 'BULBASAUR', 0, NULL, NULL),
(7, 'CHARMANDER', 0, NULL, NULL),
(8, 'SQUIRTLE', 1, NULL, NULL),
(9, 'PIKACHU', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE IF NOT EXISTS `trainers` (
`id` int(10) unsigned NOT NULL,
  `pokemon_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hometown` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hometown` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `pokemon_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `hometown`, `isAdmin`, `pokemon_id`) VALUES
(8, 'Mike', 'mike@gmail.com', '$2y$10$v3nimbvUX7Q2Vn1Ua8xMGu66pxIbViKORE.GYgLJc0aHj/Pezpw2W', 'i7m7WLXAV8JeASnvwt2pKJLMoGFsGEpRRQQmG3uTUpJNeoZZ19fjEczmmW43', '2016-09-26 15:14:20', '2016-09-27 01:18:57', 'China', 1, 9),
(9, 'Betty', 'betty@gmail.com', '$2y$10$jPPbguIpjzmxbordLQcwq.ut8La20OnZz01s5v5eGLC/12BH1Yuce', 'UBLTDV536mIaKaaauUHuNXcVHVUJWTCzVNFEaW9xi94xkvfhgn5yM1sx0pVM', '2016-09-26 15:19:38', '2016-09-27 01:17:01', 'America', 0, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pokemons`
--
ALTER TABLE `pokemons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
 ADD PRIMARY KEY (`id`), ADD KEY `trainers_pokemon_id_foreign` (`pokemon_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`), ADD KEY `pokemon_id_index` (`pokemon_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pokemons`
--
ALTER TABLE `pokemons`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `trainers`
--
ALTER TABLE `trainers`
ADD CONSTRAINT `trainers_pokemon_id_foreign` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_pokemon_id_foreign` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemons` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
