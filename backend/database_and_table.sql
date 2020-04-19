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

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `url` varchar(64) DEFAULT NULL,
                        `path` varchar(64) DEFAULT NULL,
                        `component` varchar(64) DEFAULT NULL,
                        `name` varchar(64) DEFAULT NULL,
                        `iconCls` varchar(64) DEFAULT NULL,
                        `keepAlive` tinyint(1) DEFAULT NULL,
                        `requireAuth` tinyint(1) DEFAULT NULL,
                        `parentId` int(11) DEFAULT NULL,
                        `enabled` tinyint(1) DEFAULT '1',
                        PRIMARY KEY (`id`),
                        KEY `parentId` (`parentId`),
                        CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`url`,`path`,`component`,`name`,`iconCls`,`keepAlive`,`requireAuth`,`parentId`,`enabled`)
values (1,'/',NULL,NULL,'所有',NULL,NULL,NULL,NULL,1),
       (2,'/','/home','Home','员工资料','fa fa-user-circle-o',NULL,1,1,1),
       (3,'/','/home','Home','人事管理','fa fa-address-card-o',NULL,1,1,1),
       (4,'/','/home','Home','薪资管理','fa fa-money',NULL,1,1,1),
       (5,'/','/home','Home','统计管理','fa fa-bar-chart',NULL,1,1,1),
       (6,'/','/home','Home','系统管理','fa fa-windows',NULL,1,1,1),
       (7,'/employee/basic/**','/emp/basic','EmpBasic','基本资料',NULL,NULL,1,2,1),
       (8,'/employee/advanced/**','/emp/adv','EmpAdv','高级资料',NULL,NULL,1,2,1),
       (9,'/personnel/emp/**','/per/emp','PerEmp','员工资料',NULL,NULL,1,3,1),
       (10,'/personnel/ec/**','/per/ec','PerEc','员工奖惩',NULL,NULL,1,3,1),
       (11,'/personnel/train/**','/per/train','PerTrain','员工培训',NULL,NULL,1,3,1),
       (12,'/personnel/salary/**','/per/salary','PerSalary','员工调薪',NULL,NULL,1,3,1),
       (13,'/personnel/remove/**','/per/mv','PerMv','员工调动',NULL,NULL,1,3,1),
       (14,'/salary/sob/**','/sal/sob','SalSob','工资账套管理',NULL,NULL,1,4,1),
       (15,'/salary/sobcfg/**','/sal/sobcfg','SalSobCfg','员工账套设置',NULL,NULL,1,4,1),
       (16,'/salary/table/**','/sal/table','SalTable','工资表管理',NULL,NULL,1,4,1),
       (17,'/salary/month/**','/sal/month','SalMonth','月末处理',NULL,NULL,1,4,1),
       (18,'/salary/search/**','/sal/search','SalSearch','工资表查询',NULL,NULL,1,4,1),
       (19,'/statistics/all/**','/sta/all','StaAll','综合信息统计',NULL,NULL,1,5,1),
       (20,'/statistics/score/**','/sta/score','StaScore','员工积分统计',NULL,NULL,1,5,1),
       (21,'/statistics/personnel/**','/sta/pers','StaPers','人事信息统计',NULL,NULL,1,5,1),
       (22,'/statistics/recored/**','/sta/record','StaRecord','人事记录统计',NULL,NULL,1,5,1),
       (23,'/system/basic/**','/sys/basic','SysBasic','基础信息设置',NULL,NULL,1,6,1),
       (24,'/system/cfg/**','/sys/cfg','SysCfg','系统管理',NULL,NULL,1,6,1),
       (25,'/system/log/**','/sys/log','SysLog','操作日志管理',NULL,NULL,1,6,1),
       (26,'/system/hr/**','/sys/hr','SysHr','操作员管理',NULL,NULL,1,6,1),
       (27,'/system/data/**','/sys/data','SysData','备份恢复数据库',NULL,NULL,1,6,1),
       (28,'/system/init/**','/sys/init','SysInit','初始化数据库',NULL,NULL,1,6,1);


/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` varchar(64) DEFAULT NULL,
                        `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`nameZh`) values (1,'ROLE_manager','部门经理'),
                                                 (2,'ROLE_tech_leader','技术负责人'),
                                                 (3,'ROLE_admin','系统管理员'),
                                                 (4,'ROLE_engineer','工程师');



/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `uid` int(11) DEFAULT NULL,
                           `rid` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `rid` (`rid`),
                           KEY `user_role_ibfk_1` (`uid`),
                           CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
                           CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`uid`,`rid`) values (1,1,1),
                                                  (2,1,2),
                                                  (3,1,3),
                                                  (4,1,4),
                                                  (5,2,2),
                                                  (6,2,3),
                                                  (7,2,4),
                                                  (8,3,3),
                                                  (9,3,4),
                                                  (10,4,4);


/*Table structure for table `menu_role` */

DROP TABLE IF EXISTS `menu_role`;

CREATE TABLE `menu_role` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `mid` int(11) DEFAULT NULL,
                             `rid` int(11) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `mid` (`mid`),
                             KEY `rid` (`rid`),
                             CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
                             CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `menu_role` */

insert  into `menu_role`(`id`,`mid`,`rid`) values (1,1,1),
                                                  (2,2,1),
                                                  (3,3,1),
                                                  (4,4,1),
                                                  (5,5,1),
                                                  (6,6,1),
                                                  (7,2,2),
                                                  (8,3,2),
                                                  (9,4,2),
                                                  (10,3,3),
                                                  (11,4,4);
