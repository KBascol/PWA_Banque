-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 22 Janvier 2015 à 12:21
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `banksimulation`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`name`) VALUES
('Films'),
('Livres'),
('Musiques'),
('Series');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`name`, `category`) VALUES
('Bouquet Comedie', 'Series'),
('Bouquet Drame', 'Series'),
('Bouquet Jeunesse', 'Series'),
('Bouquet Policier', 'Series'),
('Bouquet SF', 'Series'),
('Compilation Country', 'Musiques'),
('Compilation Metal', 'Musiques'),
('Compilation Pop', 'Musiques'),
('Compilation Rap', 'Musiques'),
('Compilation Rock N Roll', 'Musiques'),
('Recueil aventure', 'Livres'),
('Recueil Fantastique', 'Livres'),
('Recueil Poésie', 'Livres'),
('Recueil Romance', 'Livres'),
('Recueil SF', 'Livres'),
('Selection Fantastique', 'Films'),
('Selection Horreur', 'Films'),
('Selection Romance', 'Films'),
('Selection SF', 'Films'),
('Selection Western', 'Films');

-- --------------------------------------------------------

--
-- Structure de la table `product_subs`
--

CREATE TABLE IF NOT EXISTS `product_subs` (
  `product_name` varchar(255) NOT NULL,
  `subs_name` varchar(255) NOT NULL,
  UNIQUE KEY `UK_chn8sjaw6o72ixd62uv5ovdkf` (`subs_name`),
  KEY `FK_r9g6rq2c6pueekvh071ik6f8x` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `product_subs`
--

INSERT INTO `product_subs` (`product_name`, `subs_name`) VALUES
('Bouquet Comedie', 'Annuel BC'),
('Bouquet Comedie', 'Mensuel BC'),
('Bouquet Drame', 'Annuel BD'),
('Bouquet Drame', 'Mensuel BD'),
('Bouquet Jeunesse', 'Annuel BJ'),
('Bouquet Jeunesse', 'Mensuel BJ'),
('Bouquet Policier', 'Annuel BP'),
('Bouquet Policier', 'Mensuel BP'),
('Bouquet SF', 'Annuel BS'),
('Bouquet SF', 'Mensuel BS'),
('Compilation Country', 'Annuel CC'),
('Compilation Country', 'Mensuel CC'),
('Compilation Metal', 'Annuel M'),
('Compilation Metal', 'Mensuel M'),
('Compilation Pop', 'Annuel CP'),
('Compilation Pop', 'Mensuel CP'),
('Compilation Rap', 'Annuel CR'),
('Compilation Rap', 'Mensuel CR'),
('Compilation Rock N Roll', 'Annuel CRN'),
('Compilation Rock N Roll', 'Mensuel CRN'),
('Recueil aventure', 'Annuel RA'),
('Recueil aventure', 'Mensuel RA'),
('Recueil Fantastique', 'Annuel RF'),
('Recueil Fantastique', 'Mensuel RF'),
('Recueil Poésie', 'Annuel RP'),
('Recueil Poésie', 'Mensuel RP'),
('Recueil Romance', 'Annuel RR'),
('Recueil Romance', 'Mensuel RR'),
('Recueil SF', 'Annuel RS'),
('Recueil SF', 'Mensuel RS'),
('Selection Fantastique', 'Annuel SF'),
('Selection Fantastique', 'Mensuel SF'),
('Selection Horreur', 'Annuel SH'),
('Selection Horreur', 'Mensuel SH'),
('Selection Romance', 'Annuel SR'),
('Selection Romance', 'Mensuel SR'),
('Selection SF', 'Annuel SS'),
('Selection SF', 'Mensuel SS'),
('Selection Western', 'Annuel SW'),
('Selection Western', 'Mensuel SW');

-- --------------------------------------------------------

--
-- Structure de la table `prod_order`
--

CREATE TABLE IF NOT EXISTS `prod_order` (
  `order_num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `prod` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `prod_order`
--

INSERT INTO `prod_order` (`order_num`, `email`, `first_name`, `iban`, `last_name`, `prod`, `sub`) VALUES
(1, 'bascol.kevin@hotmail.fr', 'Kevin', 'KB001', 'Bascol', 'Bouquet Comedie', 'Mensuel BC'),
(2, 'nicow.r42@gmail.com', 'Nicolas', 'NR001', 'Reynaud', 'Recueil Poésie', 'Annuel RP'),
(3, 'laoussing.k@gmail.com', 'Kévin', 'KL001', 'Laoussing', 'Selection Romance', 'Annuel SR');

-- --------------------------------------------------------

--
-- Structure de la table `subscription`
--

CREATE TABLE IF NOT EXISTS `subscription` (
  `name` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `subscription`
--

INSERT INTO `subscription` (`name`, `duration`, `price`) VALUES
('Annuel BC', 12, 20),
('Annuel BD', 12, 20),
('Annuel BJ', 12, 20),
('Annuel BP', 12, 20),
('Annuel BS', 12, 20),
('Annuel CC', 12, 15),
('Annuel CP', 12, 15),
('Annuel CR', 12, 15),
('Annuel CRN', 12, 15),
('Annuel M', 12, 15),
('Annuel RA', 12, 18),
('Annuel RF', 12, 18),
('Annuel RP', 12, 18),
('Annuel RR', 12, 18),
('Annuel RS', 12, 18),
('Annuel SF', 12, 22),
('Annuel SH', 12, 22),
('Annuel SR', 12, 22),
('Annuel SS', 12, 22),
('Annuel SW', 12, 22),
('Mensuel BC', 1, 3),
('Mensuel BD', 1, 3),
('Mensuel BJ', 1, 3),
('Mensuel BP', 1, 3),
('Mensuel BS', 1, 3),
('Mensuel CC', 1, 2),
('Mensuel CP', 1, 2),
('Mensuel CR', 1, 2),
('Mensuel CRN', 1, 2),
('Mensuel M', 1, 2),
('Mensuel RA', 1, 3),
('Mensuel RF', 1, 3),
('Mensuel RP', 1, 3),
('Mensuel RR', 1, 3),
('Mensuel RS', 1, 3),
('Mensuel SF', 1, 4),
('Mensuel SH', 1, 4),
('Mensuel SR', 1, 4),
('Mensuel SS', 1, 4),
('Mensuel SW', 1, 4);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `product_subs`
--
ALTER TABLE `product_subs`
  ADD CONSTRAINT `FK_r9g6rq2c6pueekvh071ik6f8x` FOREIGN KEY (`product_name`) REFERENCES `product` (`name`),
  ADD CONSTRAINT `FK_chn8sjaw6o72ixd62uv5ovdkf` FOREIGN KEY (`subs_name`) REFERENCES `subscription` (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
