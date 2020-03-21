/*Table structure for table `hr` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `hr` */

insert into `user`(
    `id`,`name`,`enabled`,`username`,`password`
) values 
    (1,'系统管理员','1','admin','$2a$10$CY7KOUrcKoCTSPbN6o11oufWOuinaVMamP8jtV82ZPQfLqd8Mxwja'),
    (2,'大良','1','daliang','$2a$10$CY7KOUrcKoCTSPbN6o11oufWOuinaVMamP8jtV82ZPQfLqd8Mxwja'),
    (3,'二霞','1','wesia','$2a$10$CY7KOUrcKoCTSPbN6o11oufWOuinaVMamP8jtV82ZPQfLqd8Mxwja'),
    (4,'优优','1','youyou','$2a$10$CY7KOUrcKoCTSPbN6o11oufWOuinaVMamP8jtV82ZPQfLqd8Mxwja')

