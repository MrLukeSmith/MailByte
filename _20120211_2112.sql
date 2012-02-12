-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema rsvp_development
--

CREATE DATABASE IF NOT EXISTS rsvp_development;
USE rsvp_development;

--
-- Definition of table `rsvp_development`.`campaigns`
--

DROP TABLE IF EXISTS `rsvp_development`.`campaigns`;
CREATE TABLE  `rsvp_development`.`campaigns` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `api_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsvp_development`.`campaigns`
--

/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
LOCK TABLES `campaigns` WRITE;
INSERT INTO `rsvp_development`.`campaigns` VALUES  (1,1,'Main Newsletter','2012-01-27 19:27:59','066216d05897bd0da6952cc0b6f545850fc6fff8'),
 (2,1,'Bob\'s your uncle','2012-01-28 18:58:46','7532daf2772a8dd176cec4273360979f1e5b1a8e');
UNLOCK TABLES;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;


--
-- Definition of table `rsvp_development`.`inputdomains`
--

DROP TABLE IF EXISTS `rsvp_development`.`inputdomains`;
CREATE TABLE  `rsvp_development`.`inputdomains` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(20) NOT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsvp_development`.`inputdomains`
--

/*!40000 ALTER TABLE `inputdomains` DISABLE KEYS */;
LOCK TABLES `inputdomains` WRITE;
INSERT INTO `rsvp_development`.`inputdomains` VALUES  (3,2,'http://unclebob.com'),
 (2,1,'http://google.co.uk'),
 (4,1,'http://mynameisluke.co.uk'),
 (5,1,'http://unclebob.com');
UNLOCK TABLES;
/*!40000 ALTER TABLE `inputdomains` ENABLE KEYS */;


--
-- Definition of table `rsvp_development`.`subscribers`
--

DROP TABLE IF EXISTS `rsvp_development`.`subscribers`;
CREATE TABLE  `rsvp_development`.`subscribers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(255) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `forename` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsvp_development`.`subscribers`
--

/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
LOCK TABLES `subscribers` WRITE;
INSERT INTO `rsvp_development`.`subscribers` VALUES  (1,'1','Mr','Elliot','Smith','smithmr3@hotmail.co.uk'),
 (2,'1','Mr','Luke','Smith','smithmr8@hotmail.co.uk');
UNLOCK TABLES;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;


--
-- Definition of table `rsvp_development`.`templates`
--

DROP TABLE IF EXISTS `rsvp_development`.`templates`;
CREATE TABLE  `rsvp_development`.`templates` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(20) NOT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `last_changed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsvp_development`.`templates`
--

/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
LOCK TABLES `templates` WRITE;
INSERT INTO `rsvp_development`.`templates` VALUES  (1,1,'2012-02-12 14:43:28','Backup Newsletter','2012-02-12 14:43:28');
UNLOCK TABLES;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;


--
-- Definition of table `rsvp_development`.`users`
--

DROP TABLE IF EXISTS `rsvp_development`.`users`;
CREATE TABLE  `rsvp_development`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` double(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rsvp_development`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `rsvp_development`.`users` VALUES  (1,'Luke','smithmr8@hotmail.co.uk','password',0.00);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
