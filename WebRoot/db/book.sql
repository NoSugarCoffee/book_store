/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.24 : Database - book_store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book_store` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `book_store`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `accountid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`accountid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`accountid`,`username`,`password`,`email`,`phone`,`address`,`balance`) values (6,'dlldll','123','1353025854@qq.com','123','弘景大道',1900),(7,'qqqqqq','123',NULL,'','',100),(8,'s','123','1','1','1',NULL),(9,'test','123',NULL,'','',NULL),(10,'z','123',NULL,'','',NULL),(11,'大','123',NULL,'','',NULL),(18,'戴亮亮啦啦啦','123',NULL,'','',NULL),(34,'helloWorld','123456',NULL,'11111','111',20),(35,'ssssss','123',NULL,NULL,'南京晓庄',60),(38,'helloworld1','helloworld1',NULL,'15365123053','浙江省绍兴市东圃镇鲁迅路口',350),(60,'hellomike','hellomike','1353025854@qq.com','18112766458','江苏省南京市南京晓庄学院',50),(91,'hello','hello','1353025854@qq.com','15365123053','的省的市的',0),(92,'3123123','d1111','3025854@qq.com','18112766458','浙江省绍兴市东浦镇鲁迅',0);

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`) values (1,'admin','admin');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `imgPath` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `publishing` varchar(50) DEFAULT NULL,
  `storeNumber` int(11) DEFAULT NULL,
  `salesAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`bookName`,`price`,`details`,`imgPath`,`type`,`dateTime`,`author`,`publishing`,`storeNumber`,`salesAmount`) values (1,'sql server',50,'11111','sql.jpg',1,'2017-03-01 12:37:33','dll','清华大学',93,27),(2,'系统分析与设计',50,'很这是一本描述spring的书','xtfx.jpg',1,'2017-03-01 12:37:39','（美）约翰W.萨茨辛格（John W. Satzinger）   ','机械工业出版社',45,56),(3,'django',50,'Django是一款基于Python语言及MVC设计模式实现的Web应用开发框架，作为一款可使Web开发工作愉快并且高效的Web开发框架，能够以*小的代价构建和维护高质量的Web应用。《Django开发宝典》的作者在搭建智慧农业服务平台时的应用服务程序采用Django框架实现，本书的主要内容也是由此而来。书中内容来源于实际项目，由浅入深地带领读者进行Django的开发，*终使读者掌握项目的开发流程，从而运用于自己的项目开发中。 ','django.jpg',1,'2017-03-06 12:37:43','王友钊、黄静','清华大学',99,22),(4,'幻术',50,'111','timg.jpg',1,'2017-03-06 12:37:46','dll','清华大学',120,37),(5,'C 语言',50,'c语言，语言基础','36420_565x215.jpg',1,'2017-03-06 12:37:48','戴亮亮','东南大学',0,53),(6,'java 课程设计',50,'这是一本描java的书','thumb3.gif',1,'2017-03-05 12:37:50','100','清华大学',120,25),(8,'python',50,'据说此语言一个可以顶10个java程序员','thumb3.gif',1,'2017-03-04 12:37:58',NULL,'清华大学',100,5),(9,'c++',50,'《清华大学计算机系列教材:数据结构(C 语言版)(第3版)》按照面向对象程序设计的思想，根据作者多年的教学积累，系统地介绍各类数据结构的功能、表示和实现，对比各类数据结构适用的应用环境；结合实际问题展示算法设计的一般性模式与方法、算法实现的主流技巧，以及算法效率的评判依据和分析方法；以高度概括的体例为线索贯穿全书，并通过对比和类比揭示数据结构与算法的内在联系，帮助读者形成整体性认识。 ','c++.jpg',1,'2017-03-04 12:38:01','邓俊辉','清华大学',99,51),(10,'儿童睡前故事',50,'儿童睡前必备','thumb2.gif',2,'2017-03-04 12:38:05',NULL,'清华大学',100,60),(11,'如何成为一个优秀的程序员',100,'讲述如何成为优秀的程序员','thumb2.gif',2,'2017-03-04 12:38:08',NULL,'清华大学',100,20),(12,'如何成为百万富翁',100,'百万','thumb2.gif',3,'2017-03-03 12:38:12',NULL,'清华大学',100,24),(13,'javascript',20,NULL,'thumb1.gif',3,'2017-03-03 12:38:15',NULL,'清华大学',1,25),(14,'ruby',30,NULL,'thumb1.gif',4,'2017-03-02 12:38:18',NULL,'清华大学',22,40),(17,'helloworld',40,NULL,'sql.jpg',4,'2017-03-08 18:50:50',NULL,'清华大学',0,33),(24,'22',22,'22','420998-420.jpg',5,'2017-04-23 15:05:35','22','22',21,23),(27,'testdll',110,'this is test book ******','tesla_motors-010.jpg',12,'2017-05-14 16:21:10','110','110',109,1),(28,'aa',12,'这是一本aa的书','psb.jpg',13,'2017-05-22 09:24:48','aa','aa',110,0);

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contact` */

insert  into `contact`(`name`,`email`,`phone`,`company`,`message`) values ('dll','1353025854@qq.com','111111','南京晓庄学院','我在某某某出点了之后系统出现故障，轻及时修复'),('1111','','','','');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemid` varchar(50) NOT NULL,
  `bookName` varchar(20) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  KEY `orderitem_ibfk_1` (`itemid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `orderlist` (`orderitemid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemid`,`bookName`,`bookId`,`quantity`,`price`) values ('1643ED3CAA2741E7AED7866B76545515','系统分析与设计',2,1,50),('1643ED3CAA2741E7AED7866B76545515','django',3,1,50),('7F7D401C63DB4A31A39800FF5D819AE7','sql server',1,1,50),('7F7D401C63DB4A31A39800FF5D819AE7','幻术',4,1,50),('D19600C645BF4C44AFE7D60CF1115B40','系统分析与设计',2,1,50),('C91A3AEB2CCA491C95DB95873061DD6C','helloworld',17,1,40),('E33B78A337A54B8A98E0C84B85B68610','系统分析与设计',2,1,50),('201C254FE4B04FF2A3FDA676184B2A2D','C 语言',5,1,50),('A536053BA1F14F948E4F842A6BAF7D5D','java 课程设计',6,1,50),('A76DD48A0FAD4CB9AC66AAF10F237046','java 课程设计',6,1,50),('AA357AFB96AB49FCB9990736173295EF','javascript',13,1,20),('D58428CA33F64A6895C6F8C165AC1976','helloworld',17,1,40),('12709C4610374C25BCAE29A830565595','helloworld',17,1,40),('7DA495558B1049B9929E881599A73353','helloworld',17,1,40),('8D6F75CE859D461E8D1A5D6DA7557D77','java 课程设计',6,1,50),('D71CAB272B284F558BAB10683FEAA320','C 语言',5,1,50),('618D20C3F2624AF9BBB2E5F225D57146','java 课程设计',6,1,50),('329F02D0F4D943FE90F0D1EF283B2DA2','java 课程设计',6,1,50),('AA4EEE80F71F4158A2D82FC38DC85EEB','C 语言',5,1,50),('AA4EEE80F71F4158A2D82FC38DC85EEB','java 课程设计',6,1,50),('05074968070647698A810870F9BE60B9','sql server',1,1,50),('05074968070647698A810870F9BE60B9','系统分析与设计',2,1,50),('05074968070647698A810870F9BE60B9','django',3,1,50),('59695C774A0247DD9A1933502EBEE1C0','java 课程设计',6,1,50),('8DB556A91DAB47AFBCA88836C8F798B9','系统分析与设计',2,1,50),('0E1B06001FC84413B4D508C7B6A510AF','C 语言',5,1,50),('186424D307D54A0989C128B1E6966C4B','幻术',4,1,50),('FBBA57A3B3404B9283A6EA96372E1D7A','幻术',4,1,50),('17CF00201D114CC19D0353D8DCBDDD26','testdll',27,1,110),('82879A1F27B14CD4AF32472050D45237','c++',9,1,50),('D12E5E96B99C49BAB4AF46206BB244D8','C 语言',5,1,50),('3F9D051CA62047788849D6DCB27B6644','django',3,1,50);

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `oid` varchar(50) NOT NULL,
  `ordertime` datetime NOT NULL,
  `orderitemid` varchar(50) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `orderitemid` (`orderitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderlist` */

insert  into `orderlist`(`oid`,`ordertime`,`orderitemid`,`owner`,`status`,`total`) values ('00F8855ABFAD4067997E860F0CB6347C','2017-05-14 10:58:56','12709C4610374C25BCAE29A830565595','helloworld',2,40),('0310C0B4844C4F1CA5B966DCDD9BD348','2017-05-14 09:35:38','C91A3AEB2CCA491C95DB95873061DD6C','helloworld1',1,40),('0555585C4832412B93CC52A13BDA59FB','2017-05-22 09:02:27','D12E5E96B99C49BAB4AF46206BB244D8','hello',2,50),('064334B67316494287DBAF8953F9E3DC','2017-05-14 10:44:27','D58428CA33F64A6895C6F8C165AC1976','helloworld',1,40),('06FD21F7C9714534AEA99F7885C8A5B0','2017-05-14 15:36:38','05074968070647698A810870F9BE60B9','hellomike',4,150),('0CD2B4E6D4EF4CE2AA18E1556789AE53','2017-05-14 11:14:13','7DA495558B1049B9929E881599A73353','ssssss',3,40),('122848C829654C65A3E78276C1F9C4EB','2017-05-14 10:09:24','A536053BA1F14F948E4F842A6BAF7D5D','helloworld1',1,50),('179F109EAE214B90A64F8171F2957EBF','2017-05-21 17:23:14','59695C774A0247DD9A1933502EBEE1C0','helloworld1',3,50),('1A4A909C038346229C798BC312A0090F','2017-05-14 09:29:17','7F7D401C63DB4A31A39800FF5D819AE7','dlldll',1,100),('1BF861688B404292BE947A65618C60CF','2017-05-22 09:51:21','3F9D051CA62047788849D6DCB27B6644','hellomike',2,50),('347490F9EED740C4AF65A0BAA8A3C5C3','2017-05-21 19:00:17','186424D307D54A0989C128B1E6966C4B','helloworld1',4,50),('3A3A49443DFA4FF6B22054C80CE05C77','2017-05-21 19:18:21','17CF00201D114CC19D0353D8DCBDDD26','helloworld1',4,110),('433A6B4EDCB74FB2A0946EF737D38192','2017-05-14 11:27:52','8D6F75CE859D461E8D1A5D6DA7557D77','helloworld',1,50),('435F7808A8094A4CABA9487A8F670201','2017-05-13 00:00:00','7222830C72914BFDA46B0E617908E190','helloworld1',1,100),('46F5BC874195475585BEBA560BD184A7','2017-05-14 09:44:36','E33B78A337A54B8A98E0C84B85B68610','helloworld1',1,50),('5FA7F84243BD43069ABFCA104CEF157A','2017-05-14 10:25:31','A76DD48A0FAD4CB9AC66AAF10F237046','helloworld1',2,50),('7109420AC5C14662AC491089CA792C00','2017-05-14 09:35:11','D19600C645BF4C44AFE7D60CF1115B40','helloworld1',1,50),('72DC50DD61364EF9B8AA72A88CB5FE82','2017-05-14 11:28:13','D71CAB272B284F558BAB10683FEAA320','helloworld',1,50),('7312FACAB6D746DAAC08441A30C4CF1B','2017-05-14 11:30:01','41857AF6649A4E30BD1E65DD0DE1D1E5','helloworld',1,0),('9287BCB235DF401EA304BFE696002410','2017-05-21 19:13:05','FBBA57A3B3404B9283A6EA96372E1D7A','helloworld1',3,50),('967AE728A9A842AA9E9AAB04614B9119','2017-05-21 18:52:05','0E1B06001FC84413B4D508C7B6A510AF','helloworld1',4,50),('9B443C26BA6D4196B661554CCFA1E1C7','2017-05-14 12:34:28','329F02D0F4D943FE90F0D1EF283B2DA2','ssssss',1,50),('A0FF500FE4EB4505807844D59AC3BA74','2017-05-14 12:21:34','618D20C3F2624AF9BBB2E5F225D57146','ssssss',1,50),('AF715E8B5E6C47D78115BA2BFBF55E55','2017-05-14 13:30:01','AA4EEE80F71F4158A2D82FC38DC85EEB','helloworld1',3,100),('BA92607B71FC4547A7E4FC33D8E0FE71','2017-05-14 10:28:16','AA357AFB96AB49FCB9990736173295EF','helloworld1',3,20),('C3BE9477212E41CA897631A8258D92D0','2017-05-14 09:46:56','201C254FE4B04FF2A3FDA676184B2A2D','helloworld1',1,50),('D37D56FA7DA24F779923D83BB54A8D3C','2017-05-21 18:45:20','8DB556A91DAB47AFBCA88836C8F798B9','helloworld1',4,50),('F731161229184D95BB82A609F1F461AA','2017-05-14 09:26:47','1643ED3CAA2741E7AED7866B76545515','dlldll',1,100),('FDA220F339C348E7B5007CA3530C40A4','2017-05-22 08:44:33','82879A1F27B14CD4AF32472050D45237','hello',4,50);

/*Table structure for table `recommend` */

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
  `bookid` int(11) DEFAULT NULL,
  `recommend` int(1) DEFAULT NULL,
  KEY `bookid` (`bookid`),
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `recommend` */

insert  into `recommend`(`bookid`,`recommend`) values (1,1),(2,1),(3,1);

/*Table structure for table `trade` */

DROP TABLE IF EXISTS `trade`;

CREATE TABLE `trade` (
  `tradeid` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `tradetime` datetime DEFAULT NULL,
  PRIMARY KEY (`tradeid`),
  KEY `tradeid` (`tradeid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `trade` */

insert  into `trade`(`tradeid`,`accountid`,`tradetime`) values (1,6,'2017-03-24 16:59:59'),(11,34,'2017-03-24 19:09:11'),(12,34,'2017-03-24 19:09:38'),(13,6,'2017-03-27 19:30:34'),(14,35,'2017-03-29 21:23:59'),(16,6,'2017-04-03 21:18:35'),(17,6,'2017-04-03 21:19:19'),(18,6,'2017-04-03 21:21:15'),(19,6,'2017-04-03 21:23:08'),(20,6,'2017-04-03 21:23:31'),(21,6,'2017-04-23 16:49:57'),(22,6,'2017-04-23 16:56:46'),(23,6,'2017-04-23 21:26:39'),(24,6,'2017-04-23 21:27:18'),(25,6,'2017-04-23 21:28:22'),(27,35,'2017-04-24 12:52:40'),(28,35,'2017-04-24 12:57:37'),(29,35,'2017-04-24 13:30:52'),(30,38,'2017-04-24 15:03:15'),(31,38,'2017-04-24 15:15:18'),(32,38,'2017-04-24 15:20:42'),(33,38,'2017-04-24 15:21:18'),(34,39,'2017-05-08 16:14:36'),(35,6,'2017-05-13 15:09:41'),(36,6,'2017-05-13 15:09:52'),(37,6,'2017-05-13 15:09:56'),(38,6,'2017-05-14 09:27:01'),(39,6,'2017-05-14 09:29:21'),(40,38,'2017-05-14 09:35:16'),(41,38,'2017-05-14 10:15:43'),(43,38,'2017-05-14 10:26:20'),(44,38,'2017-05-14 10:27:00'),(45,38,'2017-05-14 10:28:19'),(46,34,'2017-05-14 10:46:56'),(47,34,'2017-05-14 10:59:43'),(48,35,'2017-05-14 11:17:57'),(49,38,'2017-05-14 12:54:47'),(50,38,'2017-05-14 13:30:13'),(51,38,'2017-05-20 18:11:40'),(52,60,'2017-05-20 18:17:12'),(53,38,'2017-05-21 17:23:18');

/*Table structure for table `tradeitem` */

DROP TABLE IF EXISTS `tradeitem`;

CREATE TABLE `tradeitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tradeid` int(11) DEFAULT NULL,
  KEY `tradeid` (`tradeid`),
  KEY `bookid` (`bookid`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `tradeitem_ibfk_1` FOREIGN KEY (`tradeid`) REFERENCES `trade` (`tradeid`),
  CONSTRAINT `tradeitem_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `tradeitem` */

insert  into `tradeitem`(`itemid`,`bookid`,`quantity`,`tradeid`) values (1,1,2,1),(2,2,1,11),(3,3,3,12),(4,2,1,13),(5,1,1,14),(6,2,1,14),(7,3,1,14),(10,2,1,1),(11,3,1,1),(12,3,1,1),(13,2,2,1),(14,2,1,1),(15,4,1,1),(16,4,1,1),(17,3,1,1),(18,3,1,1),(19,4,1,1),(20,4,1,1),(21,1,1,1),(22,1,1,29),(23,2,1,30),(24,4,1,30),(25,2,1,31),(26,2,1,32),(27,2,1,33),(28,2,1,34),(29,24,1,34),(30,2,1,35),(31,2,1,36),(34,6,1,43),(35,6,1,44),(36,13,1,45),(37,17,1,46),(38,17,1,47),(39,17,1,48),(40,13,1,49),(41,5,1,50),(42,6,1,50),(43,6,1,51),(44,1,1,52),(45,2,1,52),(46,3,1,52),(47,6,1,53);

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `type` */

insert  into `type`(`id`,`typeName`) values (1,'计算机类'),(2,'文史类'),(3,'哲学类'),(4,'语言类'),(5,'心理学类'),(6,'教育类'),(7,'数学类'),(11,'音乐类'),(12,'test'),(13,'aa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
