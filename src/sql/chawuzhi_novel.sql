/*
SQLyog v10.2 
MySQL - 5.5.40 : Database - novel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`novel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `novel`;

/*Table structure for table `history_store` */

DROP TABLE IF EXISTS `history_store`;

CREATE TABLE `history_store` (
  `timemark` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `table_name` tinytext NOT NULL,
  `pk_date_src` text NOT NULL,
  `pk_date_dest` text NOT NULL,
  `record_state` int(11) NOT NULL,
  PRIMARY KEY (`table_name`(100),`pk_date_dest`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `history_store` */

insert  into `history_store`(`timemark`,`table_name`,`pk_date_src`,`pk_date_dest`,`record_state`) values ('2017-10-13 10:07:23','t_user','<userno>1</userno>','<userno>1</userno>',2);

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `articleno` int(32) NOT NULL,
  `articlename` char(100) DEFAULT NULL,
  `pinyin` longtext,
  `pinyinheadchar` char(32) DEFAULT NULL,
  `initial` char(1) DEFAULT NULL,
  `keywords` longtext,
  `authorid` int(32) DEFAULT NULL,
  `author` char(50) DEFAULT NULL,
  `category` int(32) DEFAULT NULL,
  `subcategory` int(32) DEFAULT NULL,
  `intro` char(255) DEFAULT NULL,
  `lastchapterno` int(32) DEFAULT NULL,
  `lastchapter` char(50) DEFAULT NULL,
  `chapters` int(32) DEFAULT NULL,
  `size` int(32) DEFAULT NULL,
  `fullflag` tinyint(1) DEFAULT NULL,
  `imgflag` smallint(16) DEFAULT NULL,
  `agent` char(50) DEFAULT NULL,
  `firstflag` tinyint(1) DEFAULT NULL,
  `permission` int(32) DEFAULT NULL,
  `authorflag` tinyint(1) DEFAULT NULL,
  `postdate` timestamp NULL DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT NULL,
  `dayvisit` int(32) DEFAULT NULL,
  `weekvisit` int(32) DEFAULT NULL,
  `monthvisit` int(32) DEFAULT NULL,
  `allvisit` int(32) DEFAULT NULL,
  `dayvote` int(32) DEFAULT NULL,
  `weekvote` int(32) DEFAULT NULL,
  `monthvote` int(32) DEFAULT NULL,
  `allvote` int(32) DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT NULL,
  `publicflag` int(32) DEFAULT NULL,
  `createuserno` int(32) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  `usecustomizeinfotitle` tinyint(1) DEFAULT NULL,
  `infotitle` char(150) DEFAULT NULL,
  `infokeywords` char(150) DEFAULT NULL,
  `infodescription` char(200) DEFAULT NULL,
  `usecustomizelisttitle` tinyint(1) DEFAULT NULL,
  `listtitle` char(150) DEFAULT NULL,
  `listkeywords` char(150) DEFAULT NULL,
  `listdescription` char(200) DEFAULT NULL,
  PRIMARY KEY (`articleno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_article` */

/*Table structure for table `t_bookcase` */

DROP TABLE IF EXISTS `t_bookcase`;

CREATE TABLE `t_bookcase` (
  `bookcaseno` int(32) NOT NULL,
  `articleno` int(32) DEFAULT NULL,
  `articlename` char(100) DEFAULT NULL,
  `category` int(32) DEFAULT NULL,
  `userno` int(32) DEFAULT NULL,
  `username` char(50) DEFAULT NULL,
  `chapterno` int(32) DEFAULT NULL,
  `chaptername` char(100) DEFAULT NULL,
  `lastvisit` timestamp NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT NULL,
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bookcaseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_bookcase` */

/*Table structure for table `t_chapter` */

DROP TABLE IF EXISTS `t_chapter`;

CREATE TABLE `t_chapter` (
  `chapterno` int(32) NOT NULL,
  `articleno` int(32) DEFAULT NULL,
  `articlename` char(100) DEFAULT NULL,
  `chaptertype` smallint(16) DEFAULT NULL,
  `chaptername` char(100) DEFAULT NULL,
  `size` int(32) DEFAULT NULL,
  `isvip` tinyint(1) DEFAULT NULL,
  `postdate` timestamp NULL DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT NULL,
  `publishtime` timestamp NULL DEFAULT NULL,
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chapterno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_chapter` */

/*Table structure for table `t_credit_history` */

DROP TABLE IF EXISTS `t_credit_history`;

CREATE TABLE `t_credit_history` (
  `credithistoryno` int(32) NOT NULL AUTO_INCREMENT,
  `userno` int(32) DEFAULT NULL,
  `loginid` char(32) DEFAULT NULL,
  `articleno` int(32) DEFAULT NULL,
  `articlename` char(100) DEFAULT NULL,
  `chapterno` int(32) DEFAULT NULL,
  `chaptername` char(100) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `creditpoint` int(32) DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT '0',
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`credithistoryno`),
  KEY `t_credithistory_userno_index` (`userno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_credit_history` */

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `messageno` int(32) NOT NULL,
  `userno` int(32) DEFAULT NULL,
  `loginid` char(32) DEFAULT NULL,
  `touserno` int(32) DEFAULT NULL,
  `tologinid` char(32) DEFAULT NULL,
  `title` char(32) DEFAULT NULL,
  `content` char(255) DEFAULT NULL,
  `category` smallint(16) DEFAULT NULL,
  `isread` tinyint(1) DEFAULT NULL,
  `postdate` timestamp NULL DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT NULL,
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`messageno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

/*Table structure for table `t_review` */

DROP TABLE IF EXISTS `t_review`;

CREATE TABLE `t_review` (
  `reviewno` int(32) NOT NULL,
  `userno` int(32) DEFAULT NULL,
  `loginid` char(50) DEFAULT NULL,
  `articleno` int(32) DEFAULT NULL,
  `articlename` char(100) DEFAULT NULL,
  `chapterno` int(32) DEFAULT NULL,
  `chaptername` char(100) DEFAULT NULL,
  `title` char(30) DEFAULT NULL,
  `review` longtext,
  `email` char(60) DEFAULT NULL,
  `postdate` timestamp NULL DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT NULL,
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reviewno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_review` */

/*Table structure for table `t_subscribe` */

DROP TABLE IF EXISTS `t_subscribe`;

CREATE TABLE `t_subscribe` (
  `subscribeno` int(32) NOT NULL,
  `userno` int(32) DEFAULT NULL,
  `articleno` int(32) DEFAULT NULL,
  PRIMARY KEY (`subscribeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_subscribe` */

/*Table structure for table `t_system_block` */

DROP TABLE IF EXISTS `t_system_block`;

CREATE TABLE `t_system_block` (
  `blockno` int(32) NOT NULL AUTO_INCREMENT,
  `blockid` char(32) DEFAULT NULL,
  `blockname` char(32) DEFAULT NULL,
  `type` smallint(16) DEFAULT NULL,
  `category` int(32) DEFAULT NULL,
  `sortcol` char(32) DEFAULT NULL,
  `isasc` tinyint(1) DEFAULT NULL,
  `isfinish` tinyint(1) DEFAULT NULL,
  `limitnum` int(32) DEFAULT NULL,
  `content` text,
  `target` smallint(16) DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT '0',
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`blockno`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `t_system_block` */

insert  into `t_system_block`(`blockno`,`blockid`,`blockname`,`type`,`category`,`sortcol`,`isasc`,`isfinish`,`limitnum`,`content`,`target`,`deleteflag`,`modifyuserno`,`modifytime`) values (1,'last_update_list','最新更新列表',10,NULL,'lastupdate',0,NULL,15,'1,2,3,4',6,0,NULL,NULL),(2,'last_insert_list','最新入库',10,NULL,'postdate',0,NULL,15,'1,2,3,4',6,0,NULL,NULL),(3,'friend_link','友情链接',30,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://www.51yd.org\" target=\"_blank\">易读小说系统</a>',6,0,NULL,NULL),(4,'index_yanqing_tuijian','首页言情推荐',20,NULL,NULL,NULL,NULL,NULL,'1,2,3,4',6,0,NULL,NULL),(5,'index_xuanhuan_tuijian','首页玄幻推荐',20,NULL,NULL,NULL,NULL,NULL,'1,2,3,4',6,0,NULL,NULL),(6,'index_junshi_tuijian','首页军事推荐',20,NULL,NULL,NULL,NULL,NULL,'1,2,3,4',6,0,NULL,NULL),(7,'index_kongbu_tuijian','首页恐怖灵异推荐',20,NULL,NULL,NULL,NULL,NULL,'1,2,3,4',6,0,NULL,NULL),(8,'index_wuxia_tuijian','首页武侠修真推荐',20,NULL,NULL,NULL,NULL,NULL,'1,2,3,4',6,0,NULL,NULL),(9,'last_update_list_mobile','手机页面更新列表',10,NULL,'lastupdate',0,NULL,6,'1,2,3,4',6,0,NULL,NULL),(10,'index_hot_list_mobile','手机页热点',20,NULL,NULL,0,NULL,NULL,'58755,58754,58753',6,0,NULL,NULL),(11,'info_random_recommand_list','简介页随机推荐列表',40,NULL,NULL,NULL,NULL,6,'1,2,3,4',2,0,NULL,NULL),(12,'chapterList_randomrecommand_list','章节列表页随机推荐列表',40,NULL,NULL,NULL,NULL,6,'1,2,3,4',3,0,NULL,NULL),(13,'reader_random_recommand_list','阅读页随机推荐列表',40,NULL,NULL,NULL,NULL,6,'1,2,3,4',4,0,NULL,NULL),(14,'reader_recommand_list','阅读页推荐列表',50,NULL,NULL,NULL,NULL,6,'1,2,3,4',4,0,NULL,NULL),(15,'info_recommand_list','简介页推荐列表',50,NULL,NULL,NULL,NULL,6,'1,2,3,4',2,0,NULL,NULL),(16,'chapterList_recommand_list','章节列表页推荐列表',50,NULL,NULL,NULL,NULL,6,NULL,3,0,NULL,NULL);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userno` int(32) NOT NULL,
  `loginid` char(32) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `username` char(50) DEFAULT NULL,
  `email` char(60) DEFAULT NULL,
  `regdate` timestamp NULL DEFAULT NULL,
  `sex` smallint(16) DEFAULT NULL,
  `qq` char(15) DEFAULT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL,
  `lineno` char(32) DEFAULT NULL,
  `type` smallint(16) DEFAULT NULL,
  `votecount` int(32) DEFAULT NULL,
  `deleteflag` tinyint(1) DEFAULT NULL,
  `realname` char(10) DEFAULT NULL,
  `id` char(18) DEFAULT NULL,
  `mobileno` char(11) DEFAULT NULL,
  `branch` char(50) DEFAULT NULL,
  `bankno` char(20) DEFAULT NULL,
  `alipayacount` char(50) DEFAULT NULL,
  `category` int(32) DEFAULT NULL,
  `subcategory` int(32) DEFAULT NULL,
  `modifyuserno` int(32) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL,
  `openid` char(50) DEFAULT NULL,
  `activedflag` tinyint(1) DEFAULT NULL,
  `mailtoken` char(32) DEFAULT NULL,
  PRIMARY KEY (`userno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`userno`,`loginid`,`password`,`username`,`email`,`regdate`,`sex`,`qq`,`lastlogin`,`lineno`,`type`,`votecount`,`deleteflag`,`realname`,`id`,`mobileno`,`branch`,`bankno`,`alipayacount`,`category`,`subcategory`,`modifyuserno`,`modifytime`,`openid`,`activedflag`,`mailtoken`) values (1,'{0}','{1}',NULL,NULL,NULL,NULL,'775850004',NULL,NULL,30,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);

/* Trigger structure for table `t_article` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_article` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_article` AFTER INSERT ON `t_article` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_article'; 						SET @pk_d = CONCAT('<articleno>',NEW.`articleno`,'</articleno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_article` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_article` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_article` AFTER UPDATE ON `t_article` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_article';						SET @pk_d_old = CONCAT('<articleno>',OLD.`articleno`,'</articleno>');						SET @pk_d = CONCAT('<articleno>',NEW.`articleno`,'</articleno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_article` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_article` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_article` AFTER DELETE ON `t_article` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_article';						SET @pk_d = CONCAT('<articleno>',OLD.`articleno`,'</articleno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_bookcase` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_bookcase` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_bookcase` AFTER INSERT ON `t_bookcase` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_bookcase'; 						SET @pk_d = CONCAT('<bookcaseno>',NEW.`bookcaseno`,'</bookcaseno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_bookcase` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_bookcase` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_bookcase` AFTER UPDATE ON `t_bookcase` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_bookcase';						SET @pk_d_old = CONCAT('<bookcaseno>',OLD.`bookcaseno`,'</bookcaseno>');						SET @pk_d = CONCAT('<bookcaseno>',NEW.`bookcaseno`,'</bookcaseno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_bookcase` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_bookcase` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_bookcase` AFTER DELETE ON `t_bookcase` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_bookcase';						SET @pk_d = CONCAT('<bookcaseno>',OLD.`bookcaseno`,'</bookcaseno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_chapter` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_chapter` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_chapter` AFTER INSERT ON `t_chapter` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_chapter'; 						SET @pk_d = CONCAT('<chapterno>',NEW.`chapterno`,'</chapterno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_chapter` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_chapter` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_chapter` AFTER UPDATE ON `t_chapter` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_chapter';						SET @pk_d_old = CONCAT('<chapterno>',OLD.`chapterno`,'</chapterno>');						SET @pk_d = CONCAT('<chapterno>',NEW.`chapterno`,'</chapterno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_chapter` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_chapter` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_chapter` AFTER DELETE ON `t_chapter` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_chapter';						SET @pk_d = CONCAT('<chapterno>',OLD.`chapterno`,'</chapterno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_credit_history` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_credit_history` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_credit_history` AFTER INSERT ON `t_credit_history` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_credit_history'; 						SET @pk_d = CONCAT('<credithistoryno>',NEW.`credithistoryno`,'</credithistoryno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_credit_history` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_credit_history` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_credit_history` AFTER UPDATE ON `t_credit_history` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_credit_history';						SET @pk_d_old = CONCAT('<credithistoryno>',OLD.`credithistoryno`,'</credithistoryno>');						SET @pk_d = CONCAT('<credithistoryno>',NEW.`credithistoryno`,'</credithistoryno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_credit_history` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_credit_history` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_credit_history` AFTER DELETE ON `t_credit_history` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_credit_history';						SET @pk_d = CONCAT('<credithistoryno>',OLD.`credithistoryno`,'</credithistoryno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_message` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_message` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_message` AFTER INSERT ON `t_message` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_message'; 						SET @pk_d = CONCAT('<messageno>',NEW.`messageno`,'</messageno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_message` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_message` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_message` AFTER UPDATE ON `t_message` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_message';						SET @pk_d_old = CONCAT('<messageno>',OLD.`messageno`,'</messageno>');						SET @pk_d = CONCAT('<messageno>',NEW.`messageno`,'</messageno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_message` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_message` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_message` AFTER DELETE ON `t_message` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_message';						SET @pk_d = CONCAT('<messageno>',OLD.`messageno`,'</messageno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_review` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_review` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_review` AFTER INSERT ON `t_review` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_review'; 						SET @pk_d = CONCAT('<reviewno>',NEW.`reviewno`,'</reviewno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_review` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_review` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_review` AFTER UPDATE ON `t_review` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_review';						SET @pk_d_old = CONCAT('<reviewno>',OLD.`reviewno`,'</reviewno>');						SET @pk_d = CONCAT('<reviewno>',NEW.`reviewno`,'</reviewno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_review` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_review` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_review` AFTER DELETE ON `t_review` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_review';						SET @pk_d = CONCAT('<reviewno>',OLD.`reviewno`,'</reviewno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_subscribe` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_subscribe` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_subscribe` AFTER INSERT ON `t_subscribe` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_subscribe'; 						SET @pk_d = CONCAT('<subscribeno>',NEW.`subscribeno`,'</subscribeno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_subscribe` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_subscribe` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_subscribe` AFTER UPDATE ON `t_subscribe` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_subscribe';						SET @pk_d_old = CONCAT('<subscribeno>',OLD.`subscribeno`,'</subscribeno>');						SET @pk_d = CONCAT('<subscribeno>',NEW.`subscribeno`,'</subscribeno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_subscribe` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_subscribe` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_subscribe` AFTER DELETE ON `t_subscribe` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_subscribe';						SET @pk_d = CONCAT('<subscribeno>',OLD.`subscribeno`,'</subscribeno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_system_block` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_system_block` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_system_block` AFTER INSERT ON `t_system_block` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_system_block'; 						SET @pk_d = CONCAT('<blockno>',NEW.`blockno`,'</blockno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_system_block` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_system_block` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_system_block` AFTER UPDATE ON `t_system_block` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_system_block';						SET @pk_d_old = CONCAT('<blockno>',OLD.`blockno`,'</blockno>');						SET @pk_d = CONCAT('<blockno>',NEW.`blockno`,'</blockno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_system_block` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_system_block` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_system_block` AFTER DELETE ON `t_system_block` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_system_block';						SET @pk_d = CONCAT('<blockno>',OLD.`blockno`,'</blockno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_i_t_user` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_i_t_user` AFTER INSERT ON `t_user` FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_user'; 						SET @pk_d = CONCAT('<userno>',NEW.`userno`,'</userno>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */$$


DELIMITER ;

/* Trigger structure for table `t_user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_u_t_user` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_u_t_user` AFTER UPDATE ON `t_user` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_user';						SET @pk_d_old = CONCAT('<userno>',OLD.`userno`,'</userno>');						SET @pk_d = CONCAT('<userno>',NEW.`userno`,'</userno>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */$$


DELIMITER ;

/* Trigger structure for table `t_user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `a_d_t_user` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `a_d_t_user` AFTER DELETE ON `t_user` FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 't_user';						SET @pk_d = CONCAT('<userno>',OLD.`userno`,'</userno>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
