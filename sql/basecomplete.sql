-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 26 avr. 2019 à 04:22
-- Version du serveur :  5.7.21-log
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `equidag2`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `idRole` int(11) NOT NULL,
  `idPermission` int(11) NOT NULL,
  PRIMARY KEY (`idRole`,`idPermission`),
  KEY `idPermission` (`idPermission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

DROP TABLE IF EXISTS `categvente`;
CREATE TABLE IF NOT EXISTS `categvente` (
  `code` varchar(5) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categvente`
--

INSERT INTO `categvente` (`code`, `libelle`) VALUES
('AUT', 'Vente d\'automne'),
('ELVG', 'Vente d\'élevage'),
('ETE', 'Vente d\'été'),
('XFEV', 'Vente mixte de février');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

DROP TABLE IF EXISTS `cheval`;
CREATE TABLE IF NOT EXISTS `cheval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `sexe` tinyint(1) DEFAULT NULL,
  `sire` varchar(100) DEFAULT NULL,
  `typeCheval` int(11) DEFAULT NULL,
  `archiver` tinyint(1) DEFAULT '0',
  `mere` int(11) DEFAULT NULL,
  `pere` int(11) DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CHEVAL_TYPECHEVAL` (`typeCheval`),
  KEY `mere` (`mere`),
  KEY `pere` (`pere`),
  KEY `client` (`client`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `sire`, `typeCheval`, `archiver`, `mere`, `pere`, `client`) VALUES
(1, 'Phoenix', 0, '0346797643', 1, 0, NULL, NULL, 1),
(2, 'Orlando', 1, '1679879463', 3, 1, NULL, NULL, NULL),
(3, 'Kanelle', 0, '0346798543', 3, 0, NULL, NULL, NULL),
(4, 'Colorado', 1, '1346798524', 2, 0, NULL, NULL, NULL),
(5, 'Coquelicot', 1, '1243768956', 2, 0, NULL, NULL, NULL),
(6, NULL, 0, NULL, 1, 0, NULL, NULL, 1),
(7, NULL, 0, NULL, 1, 0, NULL, NULL, 1),
(8, 'Max', 1, '18714950149584FR', 2, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`) VALUES
(1),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50);

-- --------------------------------------------------------

--
-- Structure de la table `clientcategvente`
--

DROP TABLE IF EXISTS `clientcategvente`;
CREATE TABLE IF NOT EXISTS `clientcategvente` (
  `codeClient` int(11) NOT NULL,
  `codeCategVente` varchar(5) NOT NULL,
  PRIMARY KEY (`codeClient`,`codeCategVente`),
  KEY `FK_cliCat_Categ` (`codeCategVente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clientcategvente`
--

INSERT INTO `clientcategvente` (`codeClient`, `codeCategVente`) VALUES
(6, 'AUT'),
(49, 'AUT'),
(1, 'ELVG'),
(1, 'ETE'),
(3, 'ETE'),
(6, 'ETE'),
(7, 'ETE'),
(16, 'ETE'),
(49, 'ETE'),
(50, 'ETE'),
(6, 'XFEV');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` char(32) DEFAULT NULL,
  `mdp` char(64) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `login`, `mdp`, `role`) VALUES
(1, 'cdeltour', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NULL),
(2, 'nfime', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

DROP TABLE IF EXISTS `courriel`;
CREATE TABLE IF NOT EXISTS `courriel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `objet` varchar(50) NOT NULL,
  `corps` text NOT NULL,
  `vente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_COUR_VENTE` (`vente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `courriel`
--

INSERT INTO `courriel` (`id`, `date`, `objet`, `corps`, `vente`) VALUES
(1, '2018-09-25', 'Vente Raspberry Sailling', 'Bonjour,\r\n\r\nVous trouverez ci joint les différents éléments de la vente.\r\n\r\nCordialement.', 3),
(2, '2018-09-04', 'Vente Djezair Star', 'Bonjour,\r\n\r\nVous trouverez ci joint les différents éléments de la vente Djezair Star.\r\n\r\nCordialement.', 5),
(3, '2018-09-13', 'Vente chevaux Djezair Star complément', 'Bonjour,\r\n\r\nVous trouverez ci joint des élément supplémentaire concernant la vente.\r\n\r\nCordialement.', 5),
(4, '2018-09-12', 'Vente de Jelly Bay', 'Bonjour,\r\n\r\nVous trouverez ci joint des élément concernant la vente à Jelly Bay.\r\n\r\nCordialement.', 4);

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nom` char(32) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ville` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`id`, `nom`, `date`, `ville`) VALUES
(1, 'AAaa', '2018-11-21', 'Caen');

-- --------------------------------------------------------

--
-- Structure de la table `directeurgeneral`
--

DROP TABLE IF EXISTS `directeurgeneral`;
CREATE TABLE IF NOT EXISTS `directeurgeneral` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `directeurgeneral`
--

INSERT INTO `directeurgeneral` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

DROP TABLE IF EXISTS `enchere`;
CREATE TABLE IF NOT EXISTS `enchere` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `montant` decimal(8,2) DEFAULT NULL,
  `lot` int(11) DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lot` (`lot`),
  KEY `client` (`client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joint`
--

DROP TABLE IF EXISTS `joint`;
CREATE TABLE IF NOT EXISTS `joint` (
  `courriel` int(11) NOT NULL,
  `pieceJointe` int(11) NOT NULL,
  PRIMARY KEY (`courriel`,`pieceJointe`),
  KEY `FK_JOINT_PIECE` (`pieceJointe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `joint`
--

INSERT INTO `joint` (`courriel`, `pieceJointe`) VALUES
(2, 1),
(2, 2),
(3, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(50) NOT NULL,
  `nbBoxes` int(11) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaire`) VALUES
(1, 'Caen', 5, 'Hippodrome de caen'),
(2, 'Vire', 10, 'Hippodrome de vire');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCheval` int(11) NOT NULL,
  `idVente` int(11) NOT NULL,
  `prixDepart` decimal(8,2) NOT NULL,
  `validation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LOT_CHEVAL` (`idCheval`),
  KEY `FK_LOT_VENTE` (`idVente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `idCheval`, `idVente`, `prixDepart`, `validation`) VALUES
(2, 2, 5, '30.00', '2018-11-20 16:47:09'),
(5, 3, 4, '60.00', '2018-11-20 15:32:58'),
(7, 4, 5, '80.00', '2018-11-20 15:08:18'),
(9, 5, 3, '100.00', '2018-11-20 15:32:50');

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE IF NOT EXISTS `participer` (
  `idCheval` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `classement` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCheval`,`idCourse`),
  KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `code` varchar(3) NOT NULL,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`code`, `nom`) VALUES
('ENG', 'Angleterre'),
('FRA', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `piecejointe`
--

DROP TABLE IF EXISTS `piecejointe`;
CREATE TABLE IF NOT EXISTS `piecejointe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chemin` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `piecejointe`
--

INSERT INTO `piecejointe` (`id`, `chemin`, `description`) VALUES
(1, 'http://www.animauxdico.com/img/charte_graphique/cheval.jpg', 'Cheval n°1 en vente'),
(2, 'http://ecoles.ac-rouen.fr/butot_venesville/cheval2.jpg', 'Cheval n°2 en vente'),
(3, 'http://photoemescontesetlegendes.fond-ecran-image.com/blog-photo/files/2009/03/cheval-bai-criniere-noire58.jpg', 'Cheval n°1 en vente'),
(4, 'http://pascalinette971.p.a.pic.centerblog.net/ylmm815i.jpg', 'Cheval n°1 en vente');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

DROP TABLE IF EXISTS `typecheval`;
CREATE TABLE IF NOT EXISTS `typecheval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typecheval`
--

INSERT INTO `typecheval` (`id`, `libelle`, `description`) VALUES
(1, 'Arabo-frison', 'L’Arabo-frison est une race chevaline récente, sélectionnée sur plusieurs générations depuis les années 1960 pour obtenir la morphologie du Frison moderne associée aux qualités d\'endurance du Pur-sang arabe.'),
(2, 'Lombok', 'Le Lombok (indonésien : Kuda lombok), est la race de poneys présente sur l\'île de Lombok, en Indonésie.'),
(3, 'Halla ', 'Le Halla est une race de chevaux de course originaire de Corée du Sud,');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `rue` varchar(60) NOT NULL,
  `copos` varchar(5) NOT NULL,
  `ville` varchar(40) NOT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `codePays` varchar(3) DEFAULT NULL,
  `archiver` tinyint(1) DEFAULT '0',
  `compte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cli_pays` (`codePays`),
  KEY `compte` (`compte`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `rue`, `copos`, `ville`, `mail`, `codePays`, `archiver`, `compte`) VALUES
(1, 'Deltour', 'Charles', '4 rue du Pont', '14680', 'Bretteville Sur Laize', 'cdeltour@hotmail.com', 'FRA', 0, 1),
(2, 'Fime', 'Nadia', '5 rue du Montparnasse', '14220', 'Boulon', '', 'ENG', 0, 2),
(3, 'Ertau', 'Frank', '4 Avenue du président Wilson', '14190', 'Urville', 'frank.ertau@laposte.net', 'FRA', 0, NULL),
(4, 'Maneur', 'David', '6 rue Charles Péguy', '14220', 'Mutrécy', '', 'FRA', 0, NULL),
(5, 'Berezovski', 'Sylvie', '18 rue du Château', '14680', 'Barbery', '', 'FRA', 0, NULL),
(6, 'Finley', 'Pascale', '25 rue de Tolbiac', '14680', 'Caillouet', 'pascfinley@yahoo.fr', 'FRA', 0, NULL),
(7, 'Vofur', 'Hector', '18 rue Deparcieux', '14190', 'Cauvicourt', 'hvofur@free.fr', 'ENG', 0, NULL),
(8, 'Derzou', 'Fred', '230 avenue de la libert', '14220', 'Espins', 'ouzala@aol.com', 'FRA', 0, NULL),
(9, 'Serty', 'Julie', '23 rue du Calvaire', '14220', 'Fresney le Vieux', '', 'FRA', 0, NULL),
(10, 'Vofur', 'Victor', '18 rue Deparcieux', '14680', 'Bretteville Sur Laize', 'victor.vofur@laposte.net', 'FRA', 0, NULL),
(11, 'Calende', 'Hugo', '22 rue des jardins', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(12, 'Jemba', 'Hubert', '10 rue du 8 mai 1945', '14680', 'Bretteville Sur Laize', 'jaimeba@yahoo.fr', 'FRA', 0, NULL),
(13, 'Morin', 'S?verine', '4 rue du bac', '93000', 'Paris', 'morinsev@hotmail.com', 'FRA', 0, NULL),
(14, 'Benrech', 'Tarek', '79 rue de Caen', '14320', 'May Sur Orne', '', 'FRA', 0, NULL),
(15, 'Nguyen', 'Marc', '53 impasse Tourneur', '14320', 'Fontenay Le Marmion', 'nguyen774@wanadoo.fr', 'FRA', 0, NULL),
(16, 'Louali', 'Karima', '89 avenue Poincar', '14320', 'Saint Martin de Fontenay', 'kloua@caramail.fr', 'FRA', 0, NULL),
(17, 'Paolo', 'Marco', '14 rue du Caire', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(18, 'Map', 'Joanna', '120 boulevard Voltaire', '75012', 'Paris', '', 'FRA', 0, NULL),
(19, 'Kound', 'Fatoumata', '4 Place Carr', '14190', 'Urville', '', 'FRA', 0, NULL),
(20, 'Derissam', 'Bachir', '1 rue des Indes', '14190', 'Urville', '', 'FRA', 0, NULL),
(21, 'Villechalane', 'Louis', '8 rue des Charmes', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(22, 'Andre', 'David', '1 rue Petit', '14220', 'Boulon', '', 'FRA', 0, NULL),
(23, 'Bedos', 'Christian', '1 rue Peranud', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(24, 'Tusseau', 'Louis', '22 rue des Ternes', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(25, 'Bentot', 'Pascal', '11 allée des Cerises', '14220', 'Boulon', '', 'FRA', 0, NULL),
(26, 'Bioret', 'Luc', '1 Avenue gambetta', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(27, 'Bunisset', 'Francis', '10 rue des Perles', '14220', 'Espins', '', 'FRA', 0, NULL),
(28, 'Bunisset', 'Denise', '23 rue Manin', '14320', 'Saint Martin de Fontenay', '', 'FRA', 0, NULL),
(29, 'Cacheux', 'Bernard', '114 rue Blanche', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(30, 'Cadic', 'Eric', '123 avenue de la République', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(31, 'Charoze', 'Catherine', '100 rue Petit', '14220', 'Boulon', '', 'FRA', 0, NULL),
(32, 'Clepkens', 'Christophe', '12 allée des Anges', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(33, 'Cottin', 'Vincenne', '36 rue Des Roches', '14220', 'Boulon', '', 'FRA', 0, NULL),
(34, 'Daburon', 'François', '13 rue de Chanzy', '14220', 'Mutrécy', '', 'FRA', 0, NULL),
(35, 'De', 'Philippe', '13 rue Barthes', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(36, 'Debelle', 'Michel', '181 avenue Barbusse', '14220', 'Espins', '', 'FRA', 0, NULL),
(37, 'Debelle', 'Jeanne', '134 allée des Joncs', '14320', 'Saint Martin de Fontenay', '', 'FRA', 0, NULL),
(38, 'Debroise', 'Michel', '2 Bld Jourdain', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(39, 'Desmarquest', 'Nathalie', '14 Place d Arc', '14220', 'Boulon', '', 'FRA', 0, NULL),
(40, 'Desnost', 'Pierre', '16 avenue des Cèdres', '14220', 'Mutrécy', '', 'FRA', 0, NULL),
(41, 'Dudouit', 'Frédéric', '18 rue de l église', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(42, 'Duncombe', 'Claude', '19 rue de la tour', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(43, 'Enault-Pascreau', 'Céline', '25 place de la gare', '14680', 'Bretteville Sur Laize', '', 'FRA', 0, NULL),
(44, 'Eynde', 'Valérie', '3 Grand Place', '14220', 'Mutrécy', '', 'FRA', 0, NULL),
(45, 'Finck', 'Jacques', '10 avenue du Prado', '14320', 'Fontenay Le Marmion', '', 'FRA', 0, NULL),
(46, 'Frémont', 'Fernande', '4 route de la mer', '14220', 'Espins', '', 'FRA', 0, NULL),
(47, 'Gest', 'Alain', '30 avenue des terres', '14320', 'Saint Martin de Fontenay', '', 'FRA', 0, NULL),
(48, 'Testemale', 'tarek', 'du trek', '14000', 'Tarascon', NULL, 'FRA', 0, NULL),
(49, 'Trieste', 'Thierry', 'du tertre', '14000', 'Tologne', NULL, 'FRA', 0, NULL),
(50, 'test04sept', 'luc', 'de ahjk', '121', 'jkjklj', NULL, 'FRA', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `dateDebut` datetime NOT NULL,
  `codeCategVente` varchar(5) NOT NULL,
  `lieu` int(11) DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `dateVente` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codeCategVente` (`codeCategVente`),
  KEY `FK_VENTE_LIEU` (`lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebut`, `codeCategVente`, `lieu`, `dateFin`, `dateVente`) VALUES
(1, 'Garibaldi Princess', '2017-03-09 00:00:00', 'ELVG', 1, NULL, NULL),
(2, 'Mixing brain', '2017-09-02 00:00:00', 'XFEV', 1, NULL, NULL),
(3, 'Rapsberry Sailing', '2017-07-17 00:00:00', 'ETE', 2, NULL, NULL),
(4, 'Jelly Bay', '2017-08-17 00:00:00', 'ETE', 2, NULL, NULL),
(5, 'Djezair Star', '2017-02-25 00:00:00', 'XFEV', 1, NULL, NULL),
(6, 'Vente de test', '2018-11-20 00:00:00', 'ELVG', 2, '2018-11-23 00:00:00', '2018-11-21 00:00:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `avoir_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `avoir_ibfk_2` FOREIGN KEY (`idPermission`) REFERENCES `permission` (`id`);

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `FK_CHEVAL_TYPECHEVAL` FOREIGN KEY (`typeCheval`) REFERENCES `typecheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_1` FOREIGN KEY (`mere`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_2` FOREIGN KEY (`pere`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_3` FOREIGN KEY (`client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
  ADD CONSTRAINT `FK_cliCat_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`),
  ADD CONSTRAINT `FK_cliCat_client` FOREIGN KEY (`codeClient`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `courriel`
--
ALTER TABLE `courriel`
  ADD CONSTRAINT `FK_COUR_VENTE` FOREIGN KEY (`vente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `directeurgeneral`
--
ALTER TABLE `directeurgeneral`
  ADD CONSTRAINT `directeurgeneral_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD CONSTRAINT `enchere_ibfk_1` FOREIGN KEY (`lot`) REFERENCES `lot` (`id`),
  ADD CONSTRAINT `enchere_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `joint`
--
ALTER TABLE `joint`
  ADD CONSTRAINT `FK_JOINT_COURRIEL` FOREIGN KEY (`courriel`) REFERENCES `courriel` (`id`),
  ADD CONSTRAINT `FK_JOINT_PIECE` FOREIGN KEY (`pieceJointe`) REFERENCES `piecejointe` (`id`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `FK_LOT_CHEVAL` FOREIGN KEY (`idCheval`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `FK_LOT_VENTE` FOREIGN KEY (`idVente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`idCheval`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `course` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_cli_pays` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`),
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`compte`) REFERENCES `compte` (`id`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_VENTE_LIEU` FOREIGN KEY (`lieu`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `FK_Ven_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
