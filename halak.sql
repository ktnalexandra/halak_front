-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 17. 07:50
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `halak`
--
CREATE DATABASE IF NOT EXISTS `halak` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `halak`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fogasok`
--

CREATE TABLE `fogasok` (
  `id` int(11) NOT NULL,
  `hal_id` int(11) DEFAULT NULL,
  `horgasz_id` int(11) DEFAULT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `halak`
--

CREATE TABLE `halak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `faj` varchar(100) NOT NULL,
  `meret_cm` decimal(5,2) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `kep` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `horgaszok`
--

CREATE TABLE `horgaszok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `eletkor` int(11) DEFAULT NULL CHECK (`eletkor` >= 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tavak`
--

CREATE TABLE `tavak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `helyszin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `fogasok`
--
ALTER TABLE `fogasok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hal_id` (`hal_id`),
  ADD KEY `horgasz_id` (`horgasz_id`);

--
-- A tábla indexei `halak`
--
ALTER TABLE `halak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_id` (`to_id`);

--
-- A tábla indexei `horgaszok`
--
ALTER TABLE `horgaszok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tavak`
--
ALTER TABLE `tavak`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `fogasok`
--
ALTER TABLE `fogasok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `halak`
--
ALTER TABLE `halak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `horgaszok`
--
ALTER TABLE `horgaszok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tavak`
--
ALTER TABLE `tavak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `fogasok`
--
ALTER TABLE `fogasok`
  ADD CONSTRAINT `fogasok_ibfk_1` FOREIGN KEY (`hal_id`) REFERENCES `halak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fogasok_ibfk_2` FOREIGN KEY (`horgasz_id`) REFERENCES `horgaszok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `halak`
--
ALTER TABLE `halak`
  ADD CONSTRAINT `halak_ibfk_1` FOREIGN KEY (`to_id`) REFERENCES `tavak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
