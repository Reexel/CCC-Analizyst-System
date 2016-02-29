-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 29 2015 г., 23:23
-- Версия сервера: 5.5.46-0ubuntu0.14.04.2
-- Версия PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `c2`
--

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `idrole` int(11) NOT NULL,
  `namerole` varchar(255) NOT NULL,
  `descrole` varchar(1024) NOT NULL,
  `places` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `meets` int(11) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `role` int(11) NOT NULL,
  FOREIGN KEY (role) REFERENCES roles (idrole),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `infousers`
--

CREATE TABLE IF NOT EXISTS `infousers` (
  `idinfouser` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `bday` date NOT NULL,
  `avatar` varchar(256) NOT NULL,
  `socnetwork` varchar(256) NOT NULL,
  `regdate` date NOT NULL,
  FOREIGN KEY (iduser) REFERENCES users (id),
  PRIMARY KEY (`idinfouser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `intents`
--

CREATE TABLE IF NOT EXISTS `intents` (
  `idintent` int(11) NOT NULL,
  `nameintent` varchar(256) NOT NULL,
  `descintent` varchar(1024) NOT NULL,
  PRIMARY KEY (`idintent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `interes`
--

CREATE TABLE IF NOT EXISTS `interes` (
  `idinteres` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `interesname` varchar(256) NOT NULL,
  `interesdesc` varchar(512) NOT NULL,
  FOREIGN KEY (iduser) REFERENCES users (id),
  PRIMARY KEY (`idinteres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `idplace` int(11) NOT NULL,
  `nameplace` varchar(255) NOT NULL,
  `countryplace` int(11) NOT NULL,
  `cityplace` int(11) NOT NULL,
  `streetplace` int(11) NOT NULL,
  `houseplace` int(11) NOT NULL,
  `infoplace` varchar(1024) NOT NULL,
  `descplace` varchar(1024) NOT NULL,
  `xgoogleplace` varchar(1024) NOT NULL,
  `ygoogleplace` varchar(1024) NOT NULL,
  `idowner` int(11) NOT NULL,
  PRIMARY KEY (`idplace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meets`
--

CREATE TABLE IF NOT EXISTS `meets` (
  `idmeet` int(11) NOT NULL,
  `datatimemeet` datetime NOT NULL,
  `idplace` int(11) NOT NULL,
  `descmeet` int(11) NOT NULL,
  `intentmeet` int(11) NOT NULL,
  `statusmeet` int(11) NOT NULL,
  FOREIGN KEY (intentmeet) REFERENCES intents (idintent),
  FOREIGN KEY (idplace) REFERENCES places (idplace),
  PRIMARY KEY (`idmeet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;