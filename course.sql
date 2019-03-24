-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: course
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog_list`
--

DROP TABLE IF EXISTS `catalog_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `catalog_list` (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `catalog_course` int(11) DEFAULT NULL,
  `catalog_order` int(11) DEFAULT NULL,
  `catalog_type` int(11) DEFAULT '0',
  `catalog_name` varchar(200) DEFAULT NULL,
  `catalog_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`catalog_id`),
  KEY `catalog_course` (`catalog_course`),
  KEY `catalog_ibfk_1` (`parent_id`),
  CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `catalog` (`catalog_id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`catalog_course`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_list`
--

LOCK TABLES `catalog_list` WRITE;
/*!40000 ALTER TABLE `catalog_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_list`
--

DROP TABLE IF EXISTS `collection_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `collection_list` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_user` int(11) DEFAULT NULL,
  `collection_course` int(11) DEFAULT NULL,
  `collection_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_id`),
  KEY `collection_user` (`collection_user`),
  KEY `collection_course` (`collection_course`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`collection_user`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`collection_course`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_list`
--

LOCK TABLES `collection_list` WRITE;
/*!40000 ALTER TABLE `collection_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user` int(11) DEFAULT NULL,
  `comment_grade` int(11) DEFAULT '5',
  `comment_course` int(11) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `comment_user` (`comment_user`),
  KEY `comment_course` (`comment_course`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`comment_user`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`comment_course`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_teacher_id` int(11) DEFAULT '4',
  `course_price` int(11) DEFAULT '0',
  `course_type` int(11) DEFAULT NULL,
  `course_person_number` varchar(255) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `description` text,
  `pic_url` varchar(200) DEFAULT 'icon/6.jpg',
  `course_content_list` varchar(50) DEFAULT NULL,
  `course_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  KEY `course_teacher_id` (`course_teacher_id`),
  KEY `course_course_type_fk` (`course_type`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`course_teacher_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (106,7,0,NULL,NULL,'nice',NULL,'icon/6.jpg',NULL,'2019-03-17 07:27:00'),(107,7,100,NULL,'00001','nice2','nnn','icon/6.jpg','','2019-03-17 08:02:10'),(108,7,0,NULL,NULL,'dlkfjdlfjdlfdjf',NULL,'icon/6.jpg',NULL,'2019-03-24 13:27:15'),(110,7,0,NULL,NULL,'jjjjjjjjjjjj',NULL,'icon/6.jpg',NULL,'2019-03-24 13:50:57'),(111,NULL,0,NULL,NULL,'jjjjjjjjjjjj',NULL,'icon/6.jpg',NULL,'2019-03-24 13:51:26'),(112,NULL,0,NULL,NULL,'jjjjjjjjjjjj',NULL,'icon/6.jpg',NULL,'2019-03-24 13:51:49'),(115,4,0,NULL,NULL,NULL,'<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:14:41'),(116,4,0,NULL,NULL,NULL,'<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:20:05'),(117,4,0,NULL,NULL,NULL,'<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:21:51'),(118,4,0,NULL,NULL,NULL,'<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:22:37'),(119,4,0,NULL,NULL,NULL,'<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:23:24'),(120,4,0,NULL,NULL,'jjjjjjjjjjjj',NULL,'icon/6.jpg',NULL,'2019-03-24 14:27:10'),(121,4,0,NULL,NULL,'jjjjjjjjjjjj',NULL,'icon/6.jpg',NULL,'2019-03-24 14:29:26'),(122,4,0,NULL,NULL,'jjjjjdfdfdfjjjjjjj',NULL,'icon/6.jpg',NULL,'2019-03-24 14:38:09'),(123,4,0,68,NULL,'kdkdkdkdkdkdkdk','<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:41:28'),(124,4,0,68,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:42:13'),(125,4,0,68,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:43:05'),(126,4,0,71,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:43:16'),(127,4,0,139,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:43:31'),(128,4,0,134,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"timg.jpg\"/>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:43:44'),(129,4,0,68,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p style=\"text-align: center;\"><img src=\"/ueditor/jsp/upload/image/20190324/1553436635199001153.jpg\" title=\"1553436635199001153.jpg\" alt=\"1553436635199001153.jpg\" width=\"273\" height=\"113\"/></p><p><br/></p><p><img src=\"/ueditor/jsp/upload/image/20190324/1553438784068065869.png\" title=\"1553438784068065869.png\" width=\"481\" height=\"341\"/></p><p><img src=\"/ueditor/jsp/upload/image/20190324/1553438784068065869.png\" title=\"1553438784068065869.png\"/></p><p><img src=\"/ueditor/jsp/upload/image/20190324/1553438784068002248.png\" title=\"1553438784068002248.png\" width=\"516\" height=\"299\"/></p><p><img src=\"/ueditor/jsp/upload/image/20190324/1553438784068002248.png\" title=\"1553438784068002248.png\"/></p><p><br/></p><p>发<br/></p>','icon/6.jpg',NULL,'2019-03-24 14:50:02'),(130,4,0,156,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>辅导费<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/><img src=\"http://img.baidu.com/hi/face/i_f01.gif\"/></p>','/upload/image/2019-03/4c8735b4368f46d299745192df287e3620180707130600837 - 副本.png',NULL,'2019-03-24 14:52:44'),(131,4,0,156,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>辅导费<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/><img src=\"http://img.baidu.com/hi/face/i_f01.gif\"/>宅你的反馈</p>','/upload/image/2019-03/4c8735b4368f46d299745192df287e3620180707130600837 - 副本.png',NULL,'2019-03-24 14:53:05'),(132,4,0,156,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>辅导费<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/><img src=\"http://img.baidu.com/hi/face/i_f01.gif\"/>宅你的反馈<img src=\"http://img.baidu.com/hi/youa/y_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0084.gif\"/><img src=\"http://img.baidu.com/hi/bobo/B_0026.gif\"/><img src=\"http://img.baidu.com/hi/bobo/B_0006.gif\"/><img src=\"http://img.baidu.com/hi/face/i_f35.gif\"/><img src=\"http://img.baidu.com/hi/tsj/t_0013.gif\"/></p>','/upload/image/2019-03/4c8735b4368f46d299745192df287e3620180707130600837 - 副本.png',NULL,'2019-03-24 14:54:00'),(133,4,0,156,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>辅导费<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/><img src=\"http://img.baidu.com/hi/face/i_f01.gif\"/>宅你的反馈<img src=\"http://img.baidu.com/hi/youa/y_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0084.gif\"/><img src=\"http://img.baidu.com/hi/bobo/B_0026.gif\"/><img src=\"http://img.baidu.com/hi/bobo/B_0006.gif\"/><img src=\"http://img.baidu.com/hi/face/i_f35.gif\"/><img src=\"http://img.baidu.com/hi/tsj/t_0013.gif\"/></p>','/upload/image/2019-03/4c8735b4368f46d299745192df287e3620180707130600837 - 副本.png',NULL,'2019-03-24 14:54:01'),(134,4,0,156,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>辅导费<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\" width=\"263\" height=\"111\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/><img src=\"http://img.baidu.com/hi/face/i_f01.gif\"/>宅<img src=\"http://img.baidu.com/hi/bobo/B_0006.gif\"/>你的<img src=\"http://img.baidu.com/hi/jx2/j_0084.gif\"/>反馈<img src=\"http://img.baidu.com/hi/youa/y_0002.gif\"/><img src=\"http://img.baidu.com/hi/youa/y_0002.gif\"/><img src=\"http://img.baidu.com/hi/face/i_f35.gif\"/><img src=\"http://img.baidu.com/hi/tsj/t_0013.gif\"/></p>','/upload/image/2019-03/4c8735b4368f46d299745192df287e3620180707130600837 - 副本.png',NULL,'2019-03-24 14:55:08'),(135,4,0,156,NULL,'kdkdkdkdkdkdkdk东方大饭店','<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\" width=\"263\" height=\"111\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/></p>','/upload/image/2019-03/4c8735b4368f46d299745192df287e3620180707130600837 - 副本.png',NULL,'2019-03-24 14:56:31'),(136,4,0,125,NULL,'1','<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\" width=\"263\" height=\"111\"/><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\" width=\"255\" height=\"132\"/></p>','icon/6.jpg',NULL,'2019-03-24 15:17:55');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `parent_id_k1` (`parent_id`),
  CONSTRAINT `parent_id_k1` FOREIGN KEY (`parent_id`) REFERENCES `course_type` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES (40,NULL,'IT·互联网'),(41,NULL,'设计·创作'),(42,NULL,'职业·技能'),(43,NULL,'语言·学习'),(44,NULL,'语言·学习'),(45,NULL,'性趣·爱好'),(46,40,'编程语言'),(47,40,'云计算大数据'),(48,40,'移动开发'),(49,40,'网络运维'),(50,40,'游戏开发'),(51,41,'平面设计'),(52,41,'设计软件'),(53,41,'绘图创作'),(54,41,'UI设计'),(55,41,'游戏动画设计'),(56,42,'考研'),(57,42,'留学'),(58,42,'大学'),(59,43,'职业技能'),(60,43,'求职公考'),(61,43,'理财金融'),(62,43,'法律法规'),(63,44,'实用英语'),(64,44,'英语四六级'),(65,44,'日语'),(66,44,'韩语'),(67,44,'其他语言'),(68,46,'C++'),(69,46,'Java'),(70,46,'PHP'),(71,46,'C#/.Net'),(72,46,'Python'),(73,46,'Ruby'),(74,46,'SQL'),(75,46,'VB.NET'),(76,46,'Html/CSS'),(77,46,'其他'),(78,46,'C'),(79,47,'云计算'),(80,47,'大数据'),(81,47,'人工智能'),(82,47,'物联网'),(83,47,'区块链'),(84,47,'其他'),(85,48,'Android开发'),(86,48,'iOS开发'),(87,48,'微信开发'),(88,48,'跨平台APP开发'),(89,48,'其他'),(90,49,'Linux运维'),(91,49,'Python自动化运维'),(92,49,'DevOps '),(93,49,'其他'),(94,50,'Unity3d游戏开发'),(95,50,'Cocos2d-x游戏开发'),(96,50,'游戏服务器开发'),(97,50,'Html5游戏'),(98,50,'VR/AR'),(99,50,'其他'),(100,51,'电商美工'),(101,51,'平面设计'),(102,51,'摄影后期'),(103,51,'特效后期'),(104,51,'其他'),(105,52,'Photoshop'),(106,52,'Indesign'),(107,52,'Axure'),(108,52,'Dreamweaver'),(109,52,'Rhino3D'),(110,52,'Flash'),(111,52,'3DMAX'),(112,52,'MAYA'),(113,52,'其他'),(114,53,'漫画插画'),(115,53,'油画国画'),(116,53,'手绘素描'),(117,53,'水彩水粉画'),(118,54,'互交设计'),(119,54,'游戏UI设计'),(120,54,'Web UI设计'),(121,54,'APP UI设计'),(122,54,'其他'),(123,55,'游戏角色设计'),(124,55,'游戏模型设计'),(125,55,'游戏特效设计'),(126,55,'游戏美宣'),(127,55,'动漫设计'),(128,55,'场景设计'),(129,55,'其他'),(130,56,'考研指导'),(131,56,'考研英语'),(132,56,'考研数学'),(133,56,'其他'),(134,57,'研究生留学'),(135,57,'留学指导'),(136,57,'美国留学'),(137,57,'托福'),(138,57,'其他'),(139,58,'规划指导'),(140,58,'转生本'),(141,58,'专业课'),(142,59,'人力资源'),(143,59,'办公软件'),(144,59,'计算机等级考试'),(145,59,'技工技能'),(146,59,'创业教育'),(147,59,'其他'),(148,60,'公务员'),(149,60,'教师考试'),(150,60,'事业单位'),(151,60,'金融银行'),(152,60,'社会招聘'),(153,60,'其他'),(154,61,'国际证书'),(155,61,'会计职称'),(156,61,'注册会计师'),(157,61,'会计实务操作'),(158,61,'金融类从业'),(159,61,'其他'),(160,62,'法律职业资格'),(161,62,'法律硕士'),(162,62,'法律实务'),(163,62,'警发考试'),(164,62,'趣味学法'),(165,63,'英语口语'),(166,63,'学术英语'),(167,63,'词汇语法'),(168,63,'职场英语'),(169,63,'概念英语'),(170,64,'英语四级'),(171,64,'英语六级'),(172,65,'日语零基础'),(173,65,'日语初级'),(174,65,'日语高级'),(175,65,'日语考试'),(176,66,'韩语零基础'),(177,66,'韩语初级'),(178,66,'韩语高级'),(179,66,'旅游韩语'),(180,66,'韩流文化'),(181,67,'法语'),(182,67,'德语'),(183,67,'西班牙语'),(184,67,'葡萄牙语'),(185,67,'方言'),(186,67,'其他');
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_on` varchar(36) DEFAULT NULL,
  `order_status` int(11) DEFAULT '0',
  `order_user` int(11) DEFAULT NULL,
  `order_course` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_on` (`order_on`),
  KEY `order_user` (`order_user`),
  KEY `order_course` (`order_course`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_user`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_course`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_course` (
  `user_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_course_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_course_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `user_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `user_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) DEFAULT NULL,
  `user_on` varchar(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(36) DEFAULT '123456',
  `user_email` varchar(50) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  `user_icon` varchar(200) DEFAULT 'user-icon/nice.jpg',
  `user_introduce` varchar(1500) DEFAULT '这人很懒什么也没留下',
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uaerPhone_unique` (`user_on`),
  UNIQUE KEY `user_email_unique` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (4,1,'88888888','root','88888888','8888888@qq.com','88888888','88888888','icon/d24.jpg','88888888','2019-03-24 14:14:29'),(6,0,'2015351151','谢光科','1621392651','1621392651@qq.com','13657086729',NULL,'user-icon/nice.jpg','这人很懒什么也没留下','2019-03-16 16:35:08'),(7,1,'2015351199','nice','123456','123456','110',NULL,'user-icon/nice.jpg','这人很懒什么也没留下','2019-03-16 16:36:51'),(8,0,'0010','loc','123456','161','009',NULL,'icon/d24.jpg','这人很懒什么也没留下','2019-03-17 05:53:57'),(9,0,'464466','dfdf','1234456','',NULL,NULL,'icon/d24.jpg','这人很懒什么也没留下','2019-03-17 08:37:17'),(10,0,'56645615345','temp1','123456',NULL,NULL,NULL,'icon/d24.jpg','这人很懒什么也没留下','2019-03-17 08:37:17'),(11,0,'55355','temp2','123456',NULL,NULL,NULL,'icon/d24.jpg','这人很懒什么也没留下','2019-03-17 08:37:17');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-25  0:07:18
