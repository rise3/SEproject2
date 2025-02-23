-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.21 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 hospital 的数据库结构
CREATE DATABASE IF NOT EXISTS `hospital`;
USE `hospital`;

-- 导出  表 hospital.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '取药编号',
  `username` char(20) NOT NULL COMMENT '管理员用户名',
  `password` char(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
)   COMMENT='管理员信息表';

-- 正在导出表  hospital.admin 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `username`, `password`) VALUES
	(1, 'admin1', '123123'),
	(2, 'admin2', '000000');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 导出  表 hospital.department 结构
CREATE TABLE IF NOT EXISTS `department` (
  `Department_id` int NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `Department_name` char(100) NOT NULL COMMENT '科室名称',
  `Department_Phone` char(20) DEFAULT NULL COMMENT '科室电话',
  PRIMARY KEY (`Department_id`)
)  COMMENT='科室信息表';

-- 正在导出表  hospital.department 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`Department_id`, `Department_name`, `Department_Phone`) VALUES
	(1, '内科', '13663894233'),
	(2, '外科', '15288347293'),
	(3, '妇产科', '13964768919'),
	(4, '耳鼻喉科', '13698472397'),
	(5, '眼科', '18978497347'),
	(6, '儿科', '15934984328'),
	(10, '皮肤科', '13691131099');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- 导出  表 hospital.doctor 结构
CREATE TABLE IF NOT EXISTS `doctor` (
  `Doctor_id` int NOT NULL AUTO_INCREMENT COMMENT '医生编号',
  `Doctor_name` char(20) NOT NULL COMMENT '医生姓名',
  `Doctor_age` int NOT NULL COMMENT '医生年龄',
  `Doctor_sex` char(20) NOT NULL COMMENT '医生性别',
  `Doctor_title` char(20) DEFAULT NULL COMMENT '医生职称',
  `Doctor_speciality` char(100) DEFAULT NULL COMMENT '医生专长',
  `Department_id` int NOT NULL COMMENT '科室编号',
  `username` char(20) DEFAULT NULL COMMENT '医生用户名',
  `password` char(20) DEFAULT NULL COMMENT '医生密码',
  PRIMARY KEY (`Doctor_id`),
  KEY `Department_id` (`Department_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Department_id`) REFERENCES `department` (`Department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctor_chk_1` CHECK (((`Doctor_age` > 0) and (`Doctor_age` < 70)))
)  COMMENT='医生信息表';

-- 正在导出表  hospital.doctor 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`Doctor_id`, `Doctor_name`, `Doctor_age`, `Doctor_sex`, `Doctor_title`, `Doctor_speciality`, `Department_id`, `username`, `password`) VALUES
	(1, '徐宝双', 48, '男', '主任医师', '内科疾病', 1, 'baoshuang', '123123'),
	(2, '张成', 45, '男', '副主任医师', '外科及骨科疾病', 2, 'chengcheng', '123123'),
	(3, '刘丽娟', 50, '女', '主任医师', '妇产科疾病及妇女保健', 3, 'lijuan', '123123'),
	(4, '闫玉红', 50, '女', '主任医师', '鼻炎、咽炎、中耳炎等耳鼻喉疾病', 4, 'yuhong', '123123'),
	(5, '孙海霞', 46, '女', '副主任医师', '眼科疾病', 5, 'haixia', '123123'),
	(6, '赵晨', 39, '男', '医师', '儿科疾病与儿童护理', 6, 'chenge', '123123');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;

-- 导出  表 hospital.doctor_state 结构
CREATE TABLE IF NOT EXISTS `doctor_state` (
  `Doctor_state_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Doctor_id` int NOT NULL COMMENT '医生编号',
  `Date` date NOT NULL COMMENT '日期',
  `Fee` float NOT NULL COMMENT '挂号费用',
  `Num` int NOT NULL DEFAULT '20' COMMENT '剩余号码数量',
  PRIMARY KEY (`Doctor_state_id`),
  KEY `Doctor_id` (`Doctor_id`),
  CONSTRAINT `doctor_state_ibfk_1` FOREIGN KEY (`Doctor_id`) REFERENCES `doctor` (`Doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE
)  COMMENT='医生挂号日期状态表';

-- 正在导出表  hospital.doctor_state 的数据：~31 rows (大约)
/*!40000 ALTER TABLE `doctor_state` DISABLE KEYS */;
INSERT INTO `doctor_state` (`Doctor_state_id`, `Doctor_id`, `Date`, `Fee`, `Num`) VALUES
	(2, 3, '2024-06-30', 40, 7),
	(3, 3, '2024-06-30', 40, 7),
	(4, 3, '2024-06-30 14:00', 40, 7),
	(5, 3, '2024-06-30 17:00', 40, 7),

	(6, 4, '2024-06-08', 40, 20),
	(7, 4, '2024-06-08', 40, 20),
	(8, 4, '2024-06-08 14:00', 40, 20),
	(9, 4, '2024-06-08 17:00', 40, 20),

	(10, 5, '2024-06-08', 20, 20),
	(11, 5, '2024-06-08', 20, 20),
	(12, 5, '2024-06-08 14:00', 20, 20),
	(13, 5, '2024-06-08', 20, 20),

	(14, 6, '2024-06-08', 10, 20),
	(15, 6, '2024-06-08', 10, 20),
	(16, 6, '2024-06-08 14:00', 10, 20),
	(17, 6, '2024-06-08 17:00', 10, 20),
	
  (18, 1, '2024-06-08', 40, 5),
	(19, 1, '2024-06-08', 40, 5),
	(20, 1, '2024-06-08 14:00', 40, 5),
	(21, 1, '2024-06-08 17:00', 40, 5),
	
  (22, 2, '2024-06-08', 20, 19),
	(23, 2, '2024-06-08', 20, 19),
	(24, 2, '2024-06-08 14:00', 20, 19),
	(25, 2, '2024-06-08 17:00', 20, 19),
	
  (26, 1, '2024-06-09', 40, 20),
  (27, 1, '2024-06-09', 40, 20),
  (28, 1, '2024-06-09 14:00', 40, 20),
  (29, 1, '2024-06-09 17:00', 40, 20),

	(30, 2, '2024-06-09', 20, 20),
	(31, 2, '2024-06-09 11:00', 20, 20),
	(32, 2, '2024-06-09 14:00', 20, 20),
	(33, 2, '2024-06-09 17:00', 20, 20),

	(34, 3, '2024-06-09', 40, 20),
	(35, 3, '2024-06-09 11:00', 40, 20),
	(36, 3, '2024-06-09 14:00', 40, 20),
	(37, 3, '2024-06-09 17:00', 40, 20),

	(38, 4, '2024-06-09', 40, 20),
	(39, 4, '2024-06-09 11:00', 40, 20),
	(40, 4, '2024-06-09 14:00', 40, 20),
	(41, 4, '2024-06-09 17:00', 40, 20),
  
	(42, 5, '2024-06-09', 20, 20),
	(43, 5, '2024-06-09 11:00', 20, 20),
	(44, 5, '2024-06-09 14:00', 20, 20),
	(45, 5, '2024-06-09 17:00', 20, 20),

	(46, 6, '2024-06-09', 10, 20),
	(47, 6, '2024-06-09 11:00', 10, 20),
	(48, 6, '2024-06-09 14:00', 10, 20),
	(49, 6, '2024-06-09 17:00', 10, 20),

	(50, 1, '2024-06-10', 40, 30),
	(51, 1, '2024-06-10 11:00', 40, 30),
	(52, 1, '2024-06-10 14:00', 40, 30),
	(53, 1, '2024-06-10 17:00', 40, 30),

	(54, 2, '2024-06-10', 20, 19),
	(55, 2, '2024-06-10', 20, 19),
	(56, 2, '2024-06-10 14:00', 20, 19),
	(57, 2, '2024-06-10 17:00', 20, 19),

	(58, 3, '2024-06-10', 40, 20),
	(59, 3, '2024-06-10', 40, 20),
	(60, 3, '2024-06-10 14:00', 40, 20),
	(61, 3, '2024-06-10 17:00', 40, 20),

	(62, 4, '2024-06-10', 40, 20),
	(63, 4, '2024-06-10', 40, 20),
	(64, 4, '2024-06-10 14:00', 40, 20),
	(65, 4, '2024-06-10 17:00', 40, 20),

	(66, 5, '2024-06-10', 20, 20),
	(67, 5, '2024-06-10', 20, 20),
	(68, 5, '2024-06-10 14:00', 20, 20),
	(69, 5, '2024-06-10 17:00', 20, 20),

	(70, 6, '2024-06-10', 10, 20),
	(71, 6, '2024-06-10', 10, 20),
	(72, 6, '2024-06-10 14:00', 10, 20),
	(73, 6, '2024-06-10 17:00', 10, 20);
/*!40000 ALTER TABLE `doctor_state` ENABLE KEYS */;

-- 导出  表 hospital.drug 结构
CREATE TABLE IF NOT EXISTS `drug` (
  `Drug_id` int NOT NULL AUTO_INCREMENT COMMENT '药品编号',
  `Drug_name` char(100) NOT NULL COMMENT '药品名称',
  `Drug_lotnumber` char(20) NOT NULL COMMENT '药品批号',
  `Drug_indication` char(200) NOT NULL COMMENT '药品主治',
  `Drug_price` float NOT NULL COMMENT '药品单价',
  PRIMARY KEY (`Drug_id`),
  KEY `Drug_price` (`Drug_price`),
  CONSTRAINT `drug_chk_1` CHECK (((`Drug_price` > 0) and (`Drug_price` <= 5000)))
)  COMMENT='药品信息表';

-- 正在导出表  hospital.drug 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` (`Drug_id`, `Drug_name`, `Drug_lotnumber`, `Drug_indication`, `Drug_price`) VALUES
	(1, '999感冒灵颗粒', '2', '解热镇痛，用于感冒引起的头痛，发热等', 9.9),
	(2, '康恩贝肠炎宁片', '2', '清热利湿，行气；用于大肠湿热所致的腹泻，急慢性肠炎', 16.9),
	(3, '辅舒良 丙酸氟替卡松鼻喷雾剂', '1', '预防和治疗季节性过敏性鼻炎', 81),
	(4, '珍视明 四味珍层冰硼滴眼液', '1', '清热解痉，去翳明目。用于肝阴不足，肝气偏盛所致的不能久视、青少年视力下降。', 18.8),
	(5, '班赛 过氧苯甲酰凝胶', '3', '适用于治疗寻常痤疮的外用治疗', 29.8),
	(6, '斯利安 叶酸片', '1', '预防胎儿先天性神经管畸形，妊娠期、哺乳期妇女预防用药', 69),
	(8, '维尔固 盐酸氨基葡萄糖胶囊', '2', '治疗和预防全身所有部位的骨关节炎，可缓解和消除骨关节炎的疼痛、肿胀等症状，改善关节活动功能。', 52),
	(9, '罗每乐 盐酸阿莫罗芬搽剂', '3', '用于治疗敏感真菌引起的指(趾)甲感染', 252);
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;

-- 导出  表 hospital.patient 结构
CREATE TABLE IF NOT EXISTS `patient` (
  `Patient_id` int NOT NULL AUTO_INCREMENT COMMENT '患者编号',
  `Patient_name` char(20) NOT NULL COMMENT '患者姓名',
  `Patient_age` int NOT NULL COMMENT '患者年龄',
  `Patient_sex` char(20) NOT NULL COMMENT '患者性别',
  `Patient_Address` char(100) DEFAULT NULL COMMENT '患者地址',
  `Patient_Phone` char(20) DEFAULT NULL COMMENT '患者电话',
  `username` char(20) DEFAULT NULL COMMENT '患者用户名',
  `password` char(20) DEFAULT NULL COMMENT '患者密码',
  PRIMARY KEY (`Patient_id`),
  CONSTRAINT `patient_chk_1` CHECK (((`Patient_age` > 0) and (`Patient_age` < 100)))
)  COMMENT='患者信息表';

-- 正在导出表  hospital.patient 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` (`Patient_id`, `Patient_name`, `Patient_age`, `Patient_sex`, `Patient_Address`, `Patient_Phone`, `username`, `password`) VALUES
	(1, '张三', 28, '男', '北京市海淀区清华东路17号', '13883292814', 'zhangsan', '123123'),
	(5, 'Yiwen Wang', 21, '男', '北京市海淀区清华东路17号', '13691131099', 'wyw', '123123'),
	(6, 'cau', 29, '女', '北京市海淀区清华东路17号', '15153643878', 'CAU', 'cau123'),
	(13, '李浩然', 23, '男', '北京市海淀区清华东路17号', '17899283913', 'haoran', '123123'),
	(14, '小红', 32, '女', '北京市海淀区清华东路17号', '13691131099', 'xiaohong', '123123'),
	(15, '赵明', 24, '男', '北京市海淀区清华东路17号', '13573686425', 'zxc123', '123123'),
	(16, '123', 21, '男', '北京市海淀区清华东路17号', '13691131099', 'syt', '123123');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;

-- 导出  表 hospital.register 结构
CREATE TABLE IF NOT EXISTS `register` (
  `Register_id` int NOT NULL AUTO_INCREMENT COMMENT '挂号编号',
  `Patient_id` int NOT NULL COMMENT '患者编号',
  `Doctor_id` int NOT NULL COMMENT '医生编号',
  `Register_time` date NOT NULL COMMENT '挂号时间',
  `Register_fee` double NOT NULL COMMENT '挂号费用',
  `Register_state` int NOT NULL COMMENT '挂号状态',
  PRIMARY KEY (`Register_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Doctor_id` (`Doctor_id`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`Doctor_id`) REFERENCES `doctor` (`Doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE
)  COMMENT='挂号信息表';

-- 正在导出表  hospital.register 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`Register_id`, `Patient_id`, `Doctor_id`, `Register_time`, `Register_fee`, `Register_state`) VALUES
	(19, 13, 1, '2021-06-11', 40, 0);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;




-- 导出  表 hospital.treat 结构
CREATE TABLE IF NOT EXISTS `treat` (
  `Treat_id` int NOT NULL AUTO_INCREMENT COMMENT '病例编号',
  `Patient_id` int NOT NULL COMMENT '患者编号',
  `Doctor_id` int NOT NULL COMMENT '医生编号',
  `Treat_dateTime` datetime NOT NULL COMMENT '看病时间',
  `symptom` char(200) NOT NULL COMMENT '患者症状',
  `Diagnose_info` char(200) NOT NULL COMMENT '诊断信息',
  PRIMARY KEY (`Treat_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Doctor_id` (`Doctor_id`),
  CONSTRAINT `treat_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `treat_ibfk_2` FOREIGN KEY (`Doctor_id`) REFERENCES `doctor` (`Doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='看病信息表';

-- 正在导出表  hospital.treat 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `treat` DISABLE KEYS */;
INSERT INTO `treat` (`Treat_id`, `Patient_id`, `Doctor_id`, `Treat_dateTime`, `symptom`, `Diagnose_info`) VALUES
	(16, 1, 3, '2021-07-01 15:56:01', '咳嗽，流鼻涕', '流行性感冒'),
	(17, 1, 3, '2021-07-01 16:02:20', '', ''),
	(19, 1, 3, '2021-07-01 16:21:23', 'test2', 'test2'),
	(20, 1, 3, '2021-07-01 22:28:14', '咳嗽', '感冒'),
	(21, 1, 1, '2021-07-02 21:17:26', '咳嗽，乏力，流清鼻涕', '风寒感冒'),
	(22, 15, 1, '2021-07-02 21:21:03', '', '');
/*!40000 ALTER TABLE `treat` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



-- 导出  表 hospital.getdrug 结构
CREATE TABLE IF NOT EXISTS `getdrug` (
  `Get_id` int NOT NULL AUTO_INCREMENT COMMENT '取药编号',
  `Drug_id` int NOT NULL COMMENT '药品编号',
  `Drug_num` int NOT NULL COMMENT '药品数量',
  `Get_time` datetime NOT NULL COMMENT '取药时间',
  `Treat_id` int NOT NULL COMMENT '看病编号',
  PRIMARY KEY (`Get_id`),
  KEY `Drug_id` (`Drug_id`),
  KEY `Treat_id` (`Treat_id`),
  CONSTRAINT `getdrug_ibfk_1` FOREIGN KEY (`Drug_id`) REFERENCES `drug` (`Drug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `getdrug_ibfk_2` FOREIGN KEY (`Treat_id`) REFERENCES `treat` (`Treat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='取药信息表';

-- 正在导出表  hospital.getdrug 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `getdrug` DISABLE KEYS */;
INSERT INTO `getdrug` (`Get_id`, `Drug_id`, `Drug_num`, `Get_time`, `Treat_id`) VALUES
	(39, 1, 3, '2021-07-01 15:56:01', 16),
	(40, 1, 3, '2021-07-01 15:56:01', 16),
	(41, 2, 4, '2021-07-01 16:02:20', 17),
	(42, 4, 1, '2021-07-01 16:02:20', 17),
	(50, 2, 2, '2021-07-01 16:21:23', 19),
	(51, 1, 1, '2021-07-01 16:21:23', 19),
	(52, 9, 1, '2021-07-01 16:21:23', 19),
	(53, 5, 1, '2021-07-01 16:21:23', 19),
	(54, 1, 2, '2021-07-01 22:28:14', 20),
	(55, 1, 2, '2021-07-02 21:17:26', 21);
/*!40000 ALTER TABLE `getdrug` ENABLE KEYS */;



