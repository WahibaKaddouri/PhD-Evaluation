-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2017 at 01:31 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praticien_patient`
--

-- --------------------------------------------------------

--
-- Table structure for table `acte`
--

DROP TABLE IF EXISTS `acte`;
CREATE TABLE IF NOT EXISTS `acte` (
  `IDActe` int(8) NOT NULL,
  `TypeActe` varchar(8) NOT NULL,
  `TypeMedicament` varchar(8) NOT NULL,
  `Quantite` float NOT NULL,
  `Date` datetime NOT NULL,
  `NSS` int(8) NOT NULL,
  `NumDossier` int(8) NOT NULL,
  PRIMARY KEY (`IDActe`),
  KEY `Date` (`Date`),
  KEY `NSS` (`NSS`),
  KEY `NumDossier` (`NumDossier`),
  KEY `TypeActe` (`TypeActe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acte`
--

INSERT INTO `acte` (`IDActe`, `TypeActe`, `TypeMedicament`, `Quantite`, `Date`, `NSS`, `NumDossier`) VALUES
(0, 'Injectio', 'SOLUMEDR', 20, '2016-05-17 00:00:00', 14752, 2),
(1, 'transfus', 'Sans A+', 1, '2016-05-13 09:00:00', 98456, 0),
(2, 'Transfus', 'Sang B+', 1500, '2016-06-10 16:15:10', 12654, 0),
(3, 'Transfus', 'Insuline', 1000, '2016-06-12 17:43:46', 12654, 0);

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
CREATE TABLE IF NOT EXISTS `alert` (
  `ajouteracte` tinyint(1) NOT NULL,
  `ajouterDose` tinyint(1) NOT NULL,
  `Intervalle` tinyint(1) NOT NULL,
  `assistant` tinyint(1) NOT NULL,
  `ajouterRDV` tinyint(1) NOT NULL,
  `ReporterRDV` tinyint(1) NOT NULL,
  `AnnulerRDV` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`ajouteracte`, `ajouterDose`, `Intervalle`, `assistant`, `ajouterRDV`, `ReporterRDV`, `AnnulerRDV`) VALUES
(0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `avoirassistant`
--

DROP TABLE IF EXISTS `avoirassistant`;
CREATE TABLE IF NOT EXISTS `avoirassistant` (
  `NumDossier` int(11) NOT NULL,
  `NSS` int(11) NOT NULL,
  PRIMARY KEY (`NumDossier`,`NSS`),
  KEY `NSS` (`NSS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avoirassistant`
--

INSERT INTO `avoirassistant` (`NumDossier`, `NSS`) VALUES
(0, 14785),
(0, 15986),
(0, 69875);

-- --------------------------------------------------------

--
-- Table structure for table `concerner`
--

DROP TABLE IF EXISTS `concerner`;
CREATE TABLE IF NOT EXISTS `concerner` (
  `IDTraitement` int(8) NOT NULL,
  `NomMedecin` varchar(8) NOT NULL,
  `Quantite` float NOT NULL,
  `NbrFois` int(8) NOT NULL,
  `Duree` int(8) NOT NULL,
  `DateDebut` date NOT NULL,
  PRIMARY KEY (`IDTraitement`,`NomMedecin`,`Quantite`),
  KEY `IDTraitement` (`IDTraitement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `concerner`
--

INSERT INTO `concerner` (`IDTraitement`, `NomMedecin`, `Quantite`, `NbrFois`, `Duree`, `DateDebut`) VALUES
(0, 'Fekih', 200, 3, 10, '2016-06-16'),
(0, 'Fekih', 500, 3, 25, '2016-06-12'),
(0, 'fekih', 800, 3, 25, '2016-06-14'),
(0, 'Fekih', 3000, 3, 5, '2016-06-19'),
(1, 'CHEKHABA', 1000, 3, 15, '2016-06-02'),
(2, 'Fekih', 3000, 3, 10, '2016-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `dossierpatient`
--

DROP TABLE IF EXISTS `dossierpatient`;
CREATE TABLE IF NOT EXISTS `dossierpatient` (
  `NumDossier` int(8) NOT NULL,
  `Login` varchar(8) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Nom` varchar(8) NOT NULL,
  `Prenom` varchar(8) NOT NULL,
  `Adresse` varchar(8) NOT NULL,
  `Tel` varchar(8) NOT NULL,
  PRIMARY KEY (`NumDossier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dossierpatient`
--

INSERT INTO `dossierpatient` (`NumDossier`, `Login`, `Password`, `Nom`, `Prenom`, `Adresse`, `Tel`) VALUES
(0, 'Houssem', '123456', 'Arbaoui', 'Houssem', 'cité Bou', '05574789'),
(1, 'Abd Alha', '654987', 'Fekhar', 'Abd Alha', 'Boussmai', '06587411'),
(2, 'Imene', 'imene', 'Ghassoul', 'Imene', '13 villa', '06665089');

-- --------------------------------------------------------

--
-- Table structure for table `etre`
--

DROP TABLE IF EXISTS `etre`;
CREATE TABLE IF NOT EXISTS `etre` (
  `IDTypePatient` int(8) NOT NULL,
  `NumDossier` int(8) NOT NULL,
  PRIMARY KEY (`IDTypePatient`,`NumDossier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etre`
--

INSERT INTO `etre` (`IDTypePatient`, `NumDossier`) VALUES
(0, 0),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hopital`
--

DROP TABLE IF EXISTS `hopital`;
CREATE TABLE IF NOT EXISTS `hopital` (
  `NomHopital` varchar(8) NOT NULL,
  `Adresse` varchar(8) NOT NULL,
  PRIMARY KEY (`NomHopital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hopital`
--

INSERT INTO `hopital` (`NomHopital`, `Adresse`) VALUES
('Mustapha', 'Alger ce');

-- --------------------------------------------------------

--
-- Table structure for table `intervenir`
--

DROP TABLE IF EXISTS `intervenir`;
CREATE TABLE IF NOT EXISTS `intervenir` (
  `IDTraitement` int(8) NOT NULL,
  `NSS` int(8) NOT NULL,
  PRIMARY KEY (`IDTraitement`),
  KEY `NSS` (`NSS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `intervenir`
--

INSERT INTO `intervenir` (`IDTraitement`, `NSS`) VALUES
(0, 12654),
(2, 12654),
(1, 14752);

-- --------------------------------------------------------

--
-- Table structure for table `partageinfo`
--

DROP TABLE IF EXISTS `partageinfo`;
CREATE TABLE IF NOT EXISTS `partageinfo` (
  `IDPartage` int(8) NOT NULL,
  `Date` date NOT NULL,
  `IDTypePartage` int(8) NOT NULL,
  `NumDossier` int(8) NOT NULL,
  PRIMARY KEY (`IDPartage`),
  KEY `IDTypePartage` (`IDTypePartage`),
  KEY `NumDossier` (`NumDossier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partageinfo`
--

INSERT INTO `partageinfo` (`IDPartage`, `Date`, `IDTypePartage`, `NumDossier`) VALUES
(0, '2016-06-13', 0, 0),
(1, '2016-06-14', 0, 2),
(2, '2016-06-13', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
CREATE TABLE IF NOT EXISTS `praticien` (
  `NSS` int(8) NOT NULL DEFAULT '0',
  `Nom` varchar(8) DEFAULT NULL,
  `Prenom` varchar(8) DEFAULT NULL,
  `Login` varchar(8) CHARACTER SET utf32 DEFAULT NULL,
  `Password` varchar(8) DEFAULT NULL,
  `Tel` varchar(8) DEFAULT NULL,
  `Adresse` varchar(8) DEFAULT NULL,
  `TypePratiien` varchar(8) DEFAULT NULL,
  `NomHopital` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`NSS`),
  KEY `TypePratiien` (`TypePratiien`),
  KEY `NomHopital` (`NomHopital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `praticien`
--

INSERT INTO `praticien` (`NSS`, `Nom`, `Prenom`, `Login`, `Password`, `Tel`, `Adresse`, `TypePratiien`, `NomHopital`) VALUES
(12654, 'Fekih', 'Anis ', 'anis', '987654', '06679485', 'Skikda ', 'Médecin', 'Mustapha'),
(14752, 'CHEKHABA', 'Chaima', 'chaima', '03121994', '06678071', 'cité you', 'Médecin', 'Mustapha'),
(14785, 'MAHAMMED', 'Ahmed', 'Ahmed', '147852', '06672547', 'Alger ce', 'Auxiliai', 'Mustapha'),
(15986, 'GHASSOUL', 'Imene', 'Imene', '114756', '06664872', 'Blida', 'Auxiliai', 'Mustapha'),
(69875, 'SARI', 'Sami', 'Sami', '758961m', '07775896', 'Setif', 'Auxiliai', 'Mustapha'),
(98456, 'Ait Ouar', 'Sofiane', 'sofiane', 'sofiane', '07703698', 'Bejai', 'Paramédi', 'Mustapha');

-- --------------------------------------------------------

--
-- Table structure for table `prelevement`
--

DROP TABLE IF EXISTS `prelevement`;
CREATE TABLE IF NOT EXISTS `prelevement` (
  `IDPre` int(8) NOT NULL,
  `Resultat` varchar(8) NOT NULL,
  `Date` datetime NOT NULL,
  `NumDossier` int(8) NOT NULL,
  `IDTypePre` int(8) NOT NULL,
  PRIMARY KEY (`IDPre`,`NumDossier`),
  KEY `IDTypePre` (`IDTypePre`),
  KEY `NumDossier` (`NumDossier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prelevement`
--

INSERT INTO `prelevement` (`IDPre`, `Resultat`, `Date`, `NumDossier`, `IDTypePre`) VALUES
(0, '1.4 g/L', '2016-06-04 07:00:00', 0, 0),
(1, '14/9', '2016-06-10 10:00:00', 2, 1),
(2, '100 kg', '2016-06-13 09:00:00', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
CREATE TABLE IF NOT EXISTS `rdv` (
  `IDRDV` int(8) NOT NULL,
  `Date` datetime NOT NULL,
  `NumDossier` int(8) NOT NULL,
  `NSS` int(8) NOT NULL,
  PRIMARY KEY (`IDRDV`),
  KEY `NSS` (`NSS`),
  KEY `NumDossier` (`NumDossier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rdv`
--

INSERT INTO `rdv` (`IDRDV`, `Date`, `NumDossier`, `NSS`) VALUES
(1, '2016-06-14 14:00:00', 2, 14752),
(2, '2016-06-14 14:00:00', 1, 12654),
(4, '2016-06-15 14:00:00', 0, 12654),
(7, '2016-06-12 08:00:00', 0, 12654),
(8, '2016-06-12 10:00:00', 0, 12654);

-- --------------------------------------------------------

--
-- Table structure for table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
CREATE TABLE IF NOT EXISTS `traitement` (
  `IDTraitement` int(8) NOT NULL,
  `NumDossier` int(8) NOT NULL,
  PRIMARY KEY (`IDTraitement`),
  KEY `NumDossier` (`NumDossier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `traitement`
--

INSERT INTO `traitement` (`IDTraitement`, `NumDossier`) VALUES
(0, 0),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `typepartage`
--

DROP TABLE IF EXISTS `typepartage`;
CREATE TABLE IF NOT EXISTS `typepartage` (
  `IDTypePartage` int(8) NOT NULL,
  `Designation` varchar(8) NOT NULL,
  PRIMARY KEY (`IDTypePartage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typepartage`
--

INSERT INTO `typepartage` (`IDTypePartage`, `Designation`) VALUES
(0, 'Bilan'),
(1, 'Radio'),
(2, 'IRM');

-- --------------------------------------------------------

--
-- Table structure for table `typepatient`
--

DROP TABLE IF EXISTS `typepatient`;
CREATE TABLE IF NOT EXISTS `typepatient` (
  `IDType` int(8) NOT NULL,
  `Designation` varchar(8) NOT NULL,
  PRIMARY KEY (`IDType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typepatient`
--

INSERT INTO `typepatient` (`IDType`, `Designation`) VALUES
(0, 'Diabétiq'),
(1, 'HyperTen'),
(2, 'Agé');

-- --------------------------------------------------------

--
-- Table structure for table `typepraticien`
--

DROP TABLE IF EXISTS `typepraticien`;
CREATE TABLE IF NOT EXISTS `typepraticien` (
  `Désignation` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Désignation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typepraticien`
--

INSERT INTO `typepraticien` (`Désignation`) VALUES
('Auxiliai'),
('Médecin'),
('Paramédi');

-- --------------------------------------------------------

--
-- Table structure for table `typeprelevement`
--

DROP TABLE IF EXISTS `typeprelevement`;
CREATE TABLE IF NOT EXISTS `typeprelevement` (
  `IDTypePre` int(8) NOT NULL,
  `Designation` varchar(8) NOT NULL,
  PRIMARY KEY (`IDTypePre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typeprelevement`
--

INSERT INTO `typeprelevement` (`IDTypePre`, `Designation`) VALUES
(0, 'Glycémie'),
(1, 'Tension'),
(2, 'Poids');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acte`
--
ALTER TABLE `acte`
  ADD CONSTRAINT `acte_ibfk_1` FOREIGN KEY (`NSS`) REFERENCES `praticien` (`NSS`),
  ADD CONSTRAINT `acte_ibfk_2` FOREIGN KEY (`NumDossier`) REFERENCES `dossierpatient` (`NumDossier`);

--
-- Constraints for table `avoirassistant`
--
ALTER TABLE `avoirassistant`
  ADD CONSTRAINT `avoirassistant_ibfk_1` FOREIGN KEY (`NumDossier`) REFERENCES `dossierpatient` (`NumDossier`),
  ADD CONSTRAINT `avoirassistant_ibfk_2` FOREIGN KEY (`NSS`) REFERENCES `praticien` (`NSS`);

--
-- Constraints for table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `concerner_ibfk_1` FOREIGN KEY (`IDTraitement`) REFERENCES `traitement` (`IDTraitement`);

--
-- Constraints for table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`IDTraitement`) REFERENCES `traitement` (`IDTraitement`),
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`NSS`) REFERENCES `praticien` (`NSS`);

--
-- Constraints for table `partageinfo`
--
ALTER TABLE `partageinfo`
  ADD CONSTRAINT `partageinfo_ibfk_1` FOREIGN KEY (`IDTypePartage`) REFERENCES `typepartage` (`IDTypePartage`),
  ADD CONSTRAINT `partageinfo_ibfk_2` FOREIGN KEY (`NumDossier`) REFERENCES `dossierpatient` (`NumDossier`);

--
-- Constraints for table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `praticien_ibfk_1` FOREIGN KEY (`NomHopital`) REFERENCES `hopital` (`NomHopital`),
  ADD CONSTRAINT `praticien_ibfk_2` FOREIGN KEY (`TypePratiien`) REFERENCES `typepraticien` (`Désignation`);

--
-- Constraints for table `prelevement`
--
ALTER TABLE `prelevement`
  ADD CONSTRAINT `prelevement_ibfk_1` FOREIGN KEY (`NumDossier`) REFERENCES `dossierpatient` (`NumDossier`),
  ADD CONSTRAINT `prelevement_ibfk_2` FOREIGN KEY (`IDTypePre`) REFERENCES `typeprelevement` (`IDTypePre`);

--
-- Constraints for table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `rdv_ibfk_1` FOREIGN KEY (`NumDossier`) REFERENCES `dossierpatient` (`NumDossier`),
  ADD CONSTRAINT `rdv_ibfk_2` FOREIGN KEY (`NSS`) REFERENCES `praticien` (`NSS`);

--
-- Constraints for table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `traitement_ibfk_1` FOREIGN KEY (`NumDossier`) REFERENCES `dossierpatient` (`NumDossier`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
