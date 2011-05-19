-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2011 at 12:12 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tietokanta`
--

-- --------------------------------------------------------

--
-- Table structure for table `kohde`
--

CREATE TABLE IF NOT EXISTS `kohde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `kohde`
--

INSERT INTO `kohde` (`id`, `text`) VALUES
(1, 'nykyisiä taloudellisia ja hallinnollisia oloja.'),
(2, 'ennusteita tulevaisuuden kehityssuunnista.'),
(3, 'osallistumistason kohottamista.'),
(4, 'vastuunsatuntevaa asennetta organisaatiossa toimivilta.'),
(5, 'alustavia ehdotuksia.'),
(6, 'virikkeellisiä kasvatustavoitteita.'),
(7, 'sellaista toimihenkilökoulutusta, joka vastaa nykyhetken tarpeita.'),
(8, 'asiaankuuluvia toimintaolosuhteita.'),
(9, 'kehitysmallia.'),
(10, 'erilaisia toimintamuotoja.'),
(11, 'kontekstia.'),
(12, 'asiaankuuluvia rakennemuutoksia.');

-- --------------------------------------------------------

--
-- Table structure for table `predikaatti`
--

CREATE TABLE IF NOT EXISTS `predikaatti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `predikaatti`
--

INSERT INTO `predikaatti` (`id`, `text`) VALUES
(1, 'velvoittaa meitä analysoimaan'),
(2, 'näyttelee keskeistä osaa pohdittaessa'),
(3, 'vaatii täsmällisyyttä ja päättäväisyyttä sekä'),
(4, 'edellyttää huolellista valmistautumista ja'),
(5, 'takaa sen, että huomattava osa on aktiivisesti mukana hahmoteltaessa'),
(6, 'täyttää tärkeän tehtävän, kun määritellään'),
(7, 'antaa mahdollisuuden parantaa'),
(8, 'tekee vaikeaksi arvioida'),
(9, 'tekee mielenkiintoiseksi yrityksen eritellä'),
(10, 'antaa myönteisen panoksen saneeramiseen ja uudenaikaistamiseen ja edistää'),
(11, 'takaa myönteisen kehityksen'),
(12, 'luo uusia mahdollisuuksia');

-- --------------------------------------------------------

--
-- Table structure for table `puhuttelu`
--

CREATE TABLE IF NOT EXISTS `puhuttelu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `puhuttelu`
--

INSERT INTO `puhuttelu` (`id`, `text`) VALUES
(1, 'Oletettavasti'),
(2, 'Toisaalta'),
(3, 'Samoin'),
(4, 'Ei kuitenkaan sovi unohtaa, että'),
(5, 'Niinpä'),
(6, 'Arkipäivän kokemukset osoittavat, että'),
(7, 'On tarpeen todistella näiden ongelmien merkitystä, sillä'),
(8, 'Laaja ja monipuolinen kokemus sekä'),
(9, 'Keskeiset ideologiset periaatteet samoin kuin'),
(10, 'Organisaation tuntema huoli, mutta ennen kaikkea'),
(11, 'Kuitenkin'),
(12, 'Tilastot kertovat, että');

-- --------------------------------------------------------

--
-- Table structure for table `subjekti`
--

CREATE TABLE IF NOT EXISTS `subjekti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `subjekti`
--

INSERT INTO `subjekti` (`id`, `text`) VALUES
(1, 'ohjelman vaatimusten toteuttaminen'),
(2, 'toimihenkilöiden osaksi tulevien opintojen vaikutustaso ja kohdentuminen'),
(3, 'toimintamme määrän ja alan jatkuva kasvu'),
(4, 'nykyinen organisaatiorakenne'),
(5, 'organisaation uusi toimintakaavio'),
(6, 'erilaisten toimintamuotojen jatkuva kehitys'),
(7, 'tästä kaikesta pysyvänä osoituksena oleva informaatio- ja tiedotustoimintamme'),
(8, 'rakenteellisten ehtojen vahvistaminen ja kehittäminen'),
(9, 'luovien näkemysten huomiointi'),
(10, 'asennekasvatuksen yleinen käynnistäminen'),
(11, 'tämänhetkinen yhtiörakenne'),
(12, 'virkamiesten osaamisen parantaminen');
