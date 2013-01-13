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
(1, 'nykyisi� matemaattisia ongelmia.'),
(2, 'ennusteita tulevaisuuden matemaattisista haasteista.'),
(3, 'osallistumistason kohottamista.'),
(4, 'vastuunsatuntevaa asennetta yliopistossa opiskelevilta.'),
(5, 'alustavia laskelmia.'),
(6, 'virikkeellisi� laskuhommia.'),
(7, 'sellaista assistenttikoulutusta, joka vastaa nykyhetken tarpeita.'),
(8, 'asiaankuuluvia GPS-videoita.'),
(9, 'integrointimallia.'),
(10, 'erilaisia tenttiteht�vi�.'),
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
(1, 'velvoittaa meit� analysoimaan'),
(2, 'on t�rke� osa matematiikkaa, kun pohditaan'),
(3, 'vaatii integrointia sek�'),
(4, 'edellytt�� huolellista valmistautumista ja'),
(5, 'takaa sen, ett� huomattava osa on aktiivisesti mukana laskettaessa'),
(6, 't�ytt�� t�rke�n aukon todistuksessa, kun m��ritell��n vakioita sek� pohditaan'),
(7, 'antaa mahdollisuuden parantaa'),
(8, 'tekee vaikeaksi arvioida'),
(9, 'tekee mielenkiintoiseksi yrityksen eritell�'),
(10, 'antaa my�nteisen panoksen derivointiin ja edist��'),
(11, 'takaa ep�lineaarisen k�yr�n'),
(12, 'tuottaa vaikeita yht�l�it� sek� antaa');

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
(4, 'Ei kuitenkaan sovi unohtaa, ett�'),
(5, 'Niinp�'),
(6, 'Aikaisempien vuosien kokemukset osoittavat, ett�'),
(7, 'On tarpeen todistella n�iden ongelmien merkityst�, sill�'),
(8, 'Laaja ja monipuolinen sarjakehitelm� sek�'),
(9, 'Keskeiset insin��rimatematiikan periaatteet sek�'),
(10, 'Meid�n luennoitsijoiden tuntema huoli, mutta ennen kaikkea'),
(11, 'Kuitenkin'),
(12, 'Matemaatikot kertovat, ett�');

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
(3, 'todistamisemme m��r�n jatkuva kasvu'),
(4, 'nykyinen kurssirakenne'),
(5, 'luennoitsijoiden uusi toimintamalli'),
(6, 'erilaisten todistusmuotojen jatkuva kehitys'),
(7, 't�st� kaikesta pysyv�n� osoituksena oleva matemaattinen ylivertaisuutemme'),
(8, 'kompleksilukujen k�sittelytaitojen vahvistaminen ja kehitt�minen'),
(9, 'luovien n�kemysten huomiointi'),
(10, 'asennekasvatuksen yleinen k�ynnist�minen'),
(11, 't�m�nhetkinen kurssirakenne'),
(12, 'epsilon-delta -osaamisen parantaminen');
