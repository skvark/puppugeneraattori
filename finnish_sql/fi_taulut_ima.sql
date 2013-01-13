-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 13, 2013 at 11:36 PM
-- Server version: 5.1.66
-- PHP Version: 5.3.2-1ubuntu4.18

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `database`
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
(1, 'nykyisiä matemaattisia ongelmia.'),
(2, 'ennusteita tulevaisuuden matemaattisista haasteista.'),
(3, 'osallistumistason kohottamista.'),
(4, 'vastuunsatuntevaa asennetta yliopistossa opiskelevilta.'),
(5, 'alustavia laskelmia.'),
(6, 'virikkeellisiä laskuhommia.'),
(7, 'sellaista assistenttikoulutusta, joka vastaa nykyhetken tarpeita.'),
(8, 'asiaankuuluvia GPS-videoita.'),
(9, 'integrointimallia.'),
(10, 'erilaisia tenttitehtäviä.'),
(11, 'epsilon deltaa.'),
(12, 'asiaankuuluvia todistuksia.');

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
(2, 'on tärkeä osa matematiikkaa, kun pohditaan'),
(3, 'vaatii integrointia sekä'),
(4, 'edellyttää huolellista valmistautumista ja'),
(5, 'takaa sen, että huomattava osa on aktiivisesti mukana laskettaessa'),
(6, 'täyttää tärkeän aukon todistuksessa, kun määritellään vakioita sekä pohditaan'),
(7, 'antaa mahdollisuuden parantaa'),
(8, 'tekee vaikeaksi arvioida'),
(9, 'tekee mielenkiintoiseksi yrityksen eritellä'),
(10, 'antaa myönteisen panoksen derivointiin ja edistää'),
(11, 'takaa epälineaarisen käyrän'),
(12, 'tuottaa vaikeita yhtälöitä sekä antaa');

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
(6, 'Aikaisempien vuosien kokemukset osoittavat, että'),
(7, 'On tarpeen todistella näiden ongelmien merkitystä, sillä'),
(8, 'Laaja ja monipuolinen sarjakehitelmä sekä'),
(9, 'Keskeiset insinöörimatematiikan periaatteet sekä'),
(10, 'Meidän luennoitsijoiden tuntema huoli, mutta ennen kaikkea'),
(11, 'Kuitenkin'),
(12, 'Matemaatikot kertovat, että');

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
(1, 'kurssin vaatimusten toteuttaminen'),
(2, 'assistenttien osaksi tulevien opintojen vaikutustaso ja kohdentuminen'),
(3, 'todistamisemme määrän jatkuva kasvu'),
(4, 'nykyinen kurssirakenne'),
(5, 'luennoitsijoiden uusi toimintamalli'),
(6, 'erilaisten todistusmuotojen jatkuva kehitys'),
(7, 'tästä kaikesta pysyvänä osoituksena oleva matemaattinen ylivertaisuutemme'),
(8, 'kompleksilukujen käsittelytaitojen vahvistaminen ja kehittäminen'),
(9, 'luovien näkemysten huomiointi'),
(10, 'asennekasvatuksen yleinen käynnistäminen'),
(11, 'tämänhetkinen kurssirakenne'),
(12, 'epsilon-delta -osaamisen parantaminen');
