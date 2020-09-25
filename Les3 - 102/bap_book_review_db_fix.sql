-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 25 sep 2020 om 22:50
-- Serverversie: 10.4.8-MariaDB
-- PHP-versie: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bap_book_review_db`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `boeken`
--

CREATE TABLE `boeken` (
  `boek_id` int(8) NOT NULL,
  `titel` text NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `genre` text NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `boeken`
--

INSERT INTO `boeken` (`boek_id`, `titel`, `auteur`, `genre`, `datum`) VALUES
(1, 'Pinkeltje en de ijsheks', 'Dick Laan', 'kinder boeken', '2008-11-20');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `boek_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_foreign` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `images`
--

INSERT INTO `images` (`image_id`, `boek_id`, `image`, `image_foreign`) VALUES
(1, 1, 'https://images.gr-assets.com/books/1322306999l/13111169.jpg', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `rating` int(5) NOT NULL,
  `rating_foreign` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `ratings`
--

INSERT INTO `ratings` (`rating_id`, `rating`, `rating_foreign`) VALUES
(1, 10, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `review`
--

CREATE TABLE `review` (
  `boek_id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `rating_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `review_foreign` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `review`
--

INSERT INTO `review` (`boek_id`, `review_text`, `rating_id`, `reviewer_id`, `review_foreign`) VALUES
(1, 'Een heel leuk boek uit mijn kindertijd', 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reviewer`
--

CREATE TABLE `reviewer` (
  `reviewer_id` int(11) NOT NULL,
  `voornaam` text NOT NULL,
  `achternaam` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `leeftijd` int(11) NOT NULL,
  `reviewer_foreign` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `reviewer`
--

INSERT INTO `reviewer` (`reviewer_id`, `voornaam`, `achternaam`, `email`, `leeftijd`, `reviewer_foreign`) VALUES
(1, 'Fabian', 'Hendriks', 'example@mymail.com', 21, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `boeken`
--
ALTER TABLE `boeken`
  ADD PRIMARY KEY (`boek_id`);

--
-- Indexen voor tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `image_foreign` (`image_foreign`);

--
-- Indexen voor tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `rating_foreign` (`rating_foreign`);

--
-- Indexen voor tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`boek_id`),
  ADD KEY `review_foreign` (`review_foreign`);

--
-- Indexen voor tabel `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`reviewer_id`),
  ADD KEY `reviewer_foreign` (`reviewer_foreign`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `boeken`
--
ALTER TABLE `boeken`
  MODIFY `boek_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `reviewer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`image_foreign`) REFERENCES `boeken` (`boek_id`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`rating_foreign`) REFERENCES `review` (`boek_id`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`review_foreign`) REFERENCES `boeken` (`boek_id`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `reviewer`
--
ALTER TABLE `reviewer`
  ADD CONSTRAINT `reviewer_ibfk_1` FOREIGN KEY (`reviewer_foreign`) REFERENCES `boeken` (`boek_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
