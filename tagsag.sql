-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 12. 08:34
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tagsag`
--
--												nekem nincs is ilyen :(  :  (beállítás: create, drop, if not exist mellett pipa legyen)!
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `felhAzon` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `jogosultsag` tinyint(1) DEFAULT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhAzon`, `nev`, `jogosultsag`, `email`) VALUES
(1, 'Balazs', 1, 'balazs@gmail.com'),
(2, 'Kende', 1, 'kende@gmail.com'),
(3, 'Istvan', 1, 'istvan@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `klub`
--

CREATE TABLE `klub` (
  `klubAzon` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `datum` date NOT NULL,
  `hely` varchar(50) NOT NULL,
  `maxMeret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `klub`
--

INSERT INTO `klub` (`klubAzon`, `nev`, `datum`, `hely`, `maxMeret`) VALUES
(1001, 'GamerKlub', '2024-04-01', 'Budapest Fagyi utca 5', 50),
(1002, 'AlkoholistaKlub', '2024-04-10', 'Budapest Kocsma utca 7', 30),
(1003, 'BoxKlub', '2024-04-12', 'Budapest Fogsor utca 2', 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

CREATE TABLE `tag` (
  `klubAzon` int(11) NOT NULL,
  `felhAzon` int(11) NOT NULL,
  `pozicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--

INSERT INTO `tag` (`klubAzon`, `felhAzon`, `pozicio`) VALUES
(1001, 3, 102),
(1002, 1, 100),
(1003, 2, 101);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`felhAzon`);

--
-- A tábla indexei `klub`
--
ALTER TABLE `klub`
  ADD PRIMARY KEY (`klubAzon`);

--
-- A tábla indexei `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`klubAzon`,`felhAzon`),
  ADD KEY `felhAzon` (`felhAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `felhAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`felhAzon`) REFERENCES `felhasznalo` (`felhAzon`),
  ADD CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`klubAzon`) REFERENCES `klub` (`klubAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
