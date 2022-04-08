-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: localhost
-- Čas generovania: Pi 08.Apr 2022, 17:35
-- Verzia serveru: 10.4.21-MariaDB
-- Verzia PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `bigEvents`
--
CREATE DATABASE IF NOT EXISTS `bigEvents` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bigEvents`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `big_events`
--

CREATE TABLE `big_events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(9,7) NOT NULL,
  `lon` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `big_events`
--

INSERT INTO `big_events` (`id`, `name`, `date`, `description`, `picture`, `capacity`, `email`, `phone`, `adress`, `url`, `type`, `lat`, `lon`) VALUES
(1, 'WIENER COMEDIAN HARMONISTS', '2022-06-01 20:00:00', 'Special comedy programme in Gustav Mahler-Saal', 'pic1-6250243212ebe.jpg', 1000, 'wienstaatsoper@gmail.com', 69032342, 'Opernring 2 / Herbert-von-Karajan-Platz, 1010 Wien', 'https://www.wiener-staatsoper.at/en/season-tickets/detail/event/998309056-wiener-comedian-harmonists/', 'theater', '48.2029842', '16.367247'),
(5, 'ONEGIN', '2022-07-01 20:00:00', 'John Cranko’s ballet based on Alexander Pushkin’s novel', 'pic2.webp', 1000, 'narodnidivadlo@gmail.cz', 212323212, 'Národní 2, 110 00 Nové Město, Česko', 'https://www.narodni-divadlo.cz/en/ensembles/ballet', 'theater', '50.0810018', '14.411383'),
(6, 'THE BEAUTY AND THE BEAST', '2022-04-08 20:00:00', 'The story of a girl who falls in love with a monster', 'pic3.webp', 1000, 'narodni@divadlo.cz', 2323212, 'Národné divadlo, Národní 2, 110 00 Nové Město, Česko', 'https://www.narodni-divadlo.cz/en/show/the-beauty-and-the-beast-3266427?t=2022-04-08-19-00', 'theater', '50.0810018', '14.411383');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220408082831', '2022-04-08 08:28:45', 74);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `big_events`
--
ALTER TABLE `big_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexy pre tabuľku `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `big_events`
--
ALTER TABLE `big_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pre tabuľku `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
