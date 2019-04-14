/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : sys_rbac

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-04-14 11:19:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '资源名称',
  `type` varchar(40) NOT NULL COMMENT '资源类型：menu,button,permission',
  `url` varchar(300) DEFAULT NULL COMMENT '访问url地址',
  `icon` varchar(300) DEFAULT NULL,
  `percode` varchar(300) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` varchar(40) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_id` varchar(40) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `available` int(1) NOT NULL DEFAULT '1' COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '权限管理', 'root', '', 'glyphicon glyphicon-cog', null, '0', ' ', '0', null, '2019-04-13 21:04:14', '1');
INSERT INTO `sys_permission` VALUES ('11', '用户管理', 'menu', '', 'glyphicon glyphicon-menu-hamburger', 'item:query', '1', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('12', '用户新增菜单/按钮', 'menu', '/user/add', 'glyphicon glyphicon-menu-hamburger', 'item:add', '11', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('13', '用户修改资源', 'permission', '/user/update', 'glyphicon glyphicon-tag', 'item:update', '11', ' ', '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('14', '用户删除资源', 'permission', '/user/delete', 'glyphicon glyphicon-tag', 'item:delete', '11', ' ', '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('15', '用户查询菜单', 'menu', '/user/index', 'glyphicon glyphicon-menu-hamburger', null, '11', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('1555158477705', '用户修改按钮', 'button', '/user/edit', 'glyphicon glyphicon-pawn', null, '11', null, '0', null, '2019-04-13 21:02:04', '1');
INSERT INTO `sys_permission` VALUES ('1555158639864', '用户分页查询', 'permission', '/user/pageQuery', 'glyphicon glyphicon-tag', null, '11', null, '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('1555158849073', '角色分页查询资源', 'permission', '/role/pageQuery', 'glyphicon glyphicon-tag', null, '16', null, '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('1555159032546', '角色添加资源', 'permission', '/role/insert', 'glyphicon glyphicon-tag', null, '16', null, '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('1555159078284', '角色修改按钮', 'button', '/role/edit', 'glyphicon glyphicon-pawn', null, '16', null, '0', null, '2019-04-13 21:02:04', '1');
INSERT INTO `sys_permission` VALUES ('1555159251222', '授权查询资源', 'permission', '/permission/loadData', 'glyphicon glyphicon-tag', null, '21', null, '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('1555159710298', '授权添加资源', 'permission', '/permission/insert', 'glyphicon glyphicon-tag', null, '21', null, '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('1555159766402', '授权修改按钮', 'button', '', 'glyphicon glyphicon-pawn', null, '21', null, '0', null, '2019-04-13 21:02:04', '1');
INSERT INTO `sys_permission` VALUES ('16', '角色管理', 'menu', '', 'glyphicon glyphicon-menu-hamburger', null, '1', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('17', '角色查询菜单', 'menu', '/role/index', 'glyphicon glyphicon-menu-hamburger', null, '16', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('18', '角色添加菜单/按钮', 'menu', '/role/add', 'glyphicon glyphicon-menu-hamburger', null, '16', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('19', '角色删除资源', 'permission', '/role/delete', 'glyphicon glyphicon-tag', null, '16', ' ', '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('20', '角色修改资源', 'permission', '/role/update', 'glyphicon glyphicon-tag', null, '16', ' ', '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('21', '授权管理', 'menu', '/permission', 'glyphicon glyphicon-menu-hamburger', null, '1', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('22', '授权查询菜单', 'menu', '/permission/index', 'glyphicon glyphicon-menu-hamburger', null, '21', ' ', '0', null, '2019-04-13 20:55:35', '1');
INSERT INTO `sys_permission` VALUES ('23', '授权添加按钮', 'button', '/permission/add', 'glyphicon glyphicon-pawn', null, '21', ' ', '0', null, '2019-04-14 11:11:41', '1');
INSERT INTO `sys_permission` VALUES ('24', '授权删除资源', 'permission', '/permission/delete', 'glyphicon glyphicon-tag', null, '21', ' ', '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('25', '授权修改资源', 'permission', '/permission/update', 'glyphicon glyphicon-tag', null, '21', ' ', '0', null, '2019-04-13 21:03:31', '1');
INSERT INTO `sys_permission` VALUES ('26', '用户新增资源', 'permission', '/user/insert', 'glyphicon glyphicon-tag', 'item:add', '11', '', '0', '', '2019-04-13 21:03:31', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `descr` varchar(200) DEFAULT NULL COMMENT '说明',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `available` int(1) NOT NULL DEFAULT '1' COMMENT '是否可用,1：可用，0不可用',
  `create_id` varchar(40) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1555155483497', '用户管理', '管理用户信息', '2019-04-13 19:38:03', '1', null);
INSERT INTO `sys_role` VALUES ('1555155515780', '角色管理', '管理角色', '2019-04-13 19:38:35', '1', null);
INSERT INTO `sys_role` VALUES ('1555155606655', '菜单管理', '管理sys_premission表中type=menu的数据', '2019-04-13 19:40:06', '1', null);
INSERT INTO `sys_role` VALUES ('1555155659884', '授权管理', '', '2019-04-13 21:06:11', '1', null);
INSERT INTO `sys_role` VALUES ('1555159809321', '超级管理员', '管理所有信息', '2019-04-13 20:50:09', '1', null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(40) NOT NULL,
  `sys_role_id` varchar(40) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(40) NOT NULL COMMENT '权限id',
  `create_id` varchar(40) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('00daa7cefb2e48fda8a8c2c303a5275c', '1555155515780', '1', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('0584e43c58b34512be1ee33229ff16f3', '1555155606655', '18', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('0607cb97714f4acdb9aa541f569ec045', '1555155483497', '1', null, '2019-04-13 19:43:10');
INSERT INTO `sys_role_permission` VALUES ('07c8bc2895d04da09cddaac3c8b645d8', '1555159809321', '1555158477705', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('0f4fca556e2742b9bd61db2e285c4b0e', '1555155606655', '1', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('12c7ef7913ba4abba5a823d4ac6b9f39', '1555159809321', '26', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('153a0eb48f3c4484b9190662cf9b7d03', '1555155515780', '1555158849073', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('17c81a7adc8942d5a7f72691cb011447', '1555155606655', '11', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('18ab732a94644335b53ca4517f8641d9', '1555155606655', '16', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('1c9215c9be9b4afeb9c8e8970793fac6', '1555159809321', '21', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('1cebe5fd32344e379c17a1a163407b20', '1555155606655', '23', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('206564eddda24a06b6c95e2d95e55956', '1555155483497', '13', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('224611486439443195f388e82a316549', '1555155606655', '12', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('28a600631f1843b89e7dfdf3eca51c64', '1555155515780', '1', null, '2019-04-13 19:43:18');
INSERT INTO `sys_role_permission` VALUES ('28f618dfe2c7474a9571bc065fa89520', '1555155483497', '13', null, '2019-04-13 19:43:10');
INSERT INTO `sys_role_permission` VALUES ('2cc786614e0e4d5bb922e43f1aeed7a3', '1555155659884', '1555159710298', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('333f7f04e5154cb0944af8f5125dc06d', '1555155606655', '18', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('3740de417258492c980e666ef3a6b42c', '1555159809321', '13', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('3e57ba272bcb4b078f7cb43e2ba3bbe8', '1555159809321', '11', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('40ffb62588ef43208e335077ccb61b63', '1555155483497', '11', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('495603dc52ed4e8eac4d5a7d8c3b7ea4', '1555155606655', '12', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('4988891d03e14010b026742946249f6c', '1555155659884', '21', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('4abcf056db6743f7949dbac24ac05128', '1555155515780', '18', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('4c0214fb3c1944fb99ccf0acf05bea22', '1555155659884', '1', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('4ca35882d0414498900262c6d74a9892', '1555159809321', '17', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('5437f4d7608545a6b4968dae923c36e5', '1555155483497', '15', null, '2019-04-13 19:43:10');
INSERT INTO `sys_role_permission` VALUES ('57f4a6fc152c41878777ba3fd36ed098', '1555159809321', '22', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('5c1714d1a96541a0bb35cd9bba363e9a', '1555159809321', '1555159032546', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('5c60989e36d740069063284748e189c4', '1555155483497', '14', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('5cde690112ca4945961b97b0c3401acb', '1555159809321', '1555159251222', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('5f3af89c1fc44eeba025c52ad307b9cf', '1555159809321', '23', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('68d2932164ae4f709c336d69570e21fd', '1555155515780', '17', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('6953b96fdbed4f9fbc283aaabeef2a0a', '1555155659884', '24', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('6b231cc68f49425f87f04e588dae86e5', '1555159809321', '18', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('6bf0261c346240fb8e2bf2ab65168e2b', '1555155606655', '22', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('6d110bf9b51b4b6a972901964f18697e', '1555155659884', '1555159766402', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('6d9e0b843f0c499a8e1bc6ac464f6da4', '1555155659884', '23', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('70581e62a1684e7ab9130132afe33f93', '1555155483497', '1555158477705', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('71aa548a8b6a4e0c929badb873fa8687', '1555155515780', '19', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('74e09f2fa9f343198a26b009dfb88eb9', '1555155483497', '11', null, '2019-04-13 19:43:10');
INSERT INTO `sys_role_permission` VALUES ('77a022f2a88045e192477410d9490900', '1555159809321', '20', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('79b502344d5148acb03d7149f382e6e6', '1555155483497', '1', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('79db3dffef6642f8b329dc82482ce065', '1555159809321', '16', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('810c6de52fbf473c95799d49fbc439e6', '1555155606655', '15', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('8336967aab004e24869e5b683643b9d9', '1555159809321', '15', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('840cae8682bc4760907b054c34a96e96', '1555155659884', '22', null, '2019-04-13 19:43:44');
INSERT INTO `sys_role_permission` VALUES ('85d5620d839f4a73946a91c656d07865', '1555155483497', '14', null, '2019-04-13 19:43:10');
INSERT INTO `sys_role_permission` VALUES ('87b6270811f3419cab2ebb311cdd9042', '1555155659884', '1', null, '2019-04-13 19:43:44');
INSERT INTO `sys_role_permission` VALUES ('8a5a1bcf648c48d38a324070cf878902', '1555155606655', '11', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('8a6cf0daee60433fb54d772d803b9811', '1555155606655', '17', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('92bcf44950bc487bb41d0ecda58a37a4', '1555159809321', '24', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('9389d75972ce4a1f933fef4c9113cd6e', '1555159809321', '14', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('971d38b98f454b55bbbf301c4b1f23b3', '1555155483497', '15', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('9a2b3cb775b8466aa9e8bea94bec3a7c', '1555159809321', '1', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('9c4a578e2e054374abcc9ec4a6634cdf', '1555155606655', '21', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('a82685a57a19497983c31eaf9ff3f0d9', '1555155606655', '15', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('a98d9375ec5e4dbe87958be38b2678e6', '1555155515780', '1555159032546', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('aa8cf06be824432bbbdc9139cbc3398e', '1555155515780', '1555159078284', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('b15e9ff72042465a96d434504402aae9', '1555155515780', '19', null, '2019-04-13 19:43:18');
INSERT INTO `sys_role_permission` VALUES ('b5867941bccc4d41a378e0c5f53704ff', '1555155606655', '16', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('b6a25a282fa741039791b548d3b26449', '1555155659884', '1555159251222', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('b8e9ce29a53e4ceabb852f9e259cf679', '1555159809321', '25', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('bdec177a71aa401c83ef1944b6daa657', '1555155483497', '12', null, '2019-04-13 19:43:10');
INSERT INTO `sys_role_permission` VALUES ('c5146b46b56d4cd0a6252d6895a35442', '1555155483497', '1555158639864', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('ce7e91981fff453c8087aa4e4daa6727', '1555155515780', '16', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('cf0353120a034f9daf939df29997251d', '1555155606655', '23', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('d447e1bd68c74b7cbc7ed2102cebf6d7', '1555155515780', '17', null, '2019-04-13 19:43:18');
INSERT INTO `sys_role_permission` VALUES ('d53a243a9bb4435182014b2af9fdce16', '1555155515780', '20', null, '2019-04-13 21:05:20');
INSERT INTO `sys_role_permission` VALUES ('d621bf4335d8499194430ed57c2c6b6e', '1555159809321', '1555159078284', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('d82f3c94675a483fbdcbe490682e19f7', '1555155659884', '23', null, '2019-04-13 19:43:44');
INSERT INTO `sys_role_permission` VALUES ('d85519e196c24ae98e98497f611d2124', '1555155483497', '26', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('d91af96bd3034682b833a99987e1dea7', '1555155659884', '22', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('dda22db7a57c491eb8efdf8d762fd88c', '1555155606655', '22', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('de890eda785549a8904e54a507d4f0e5', '1555155483497', '12', null, '2019-04-13 21:05:11');
INSERT INTO `sys_role_permission` VALUES ('e1352da6c47742e8bf004210a00c88b2', '1555155606655', '17', null, '2019-04-13 21:05:47');
INSERT INTO `sys_role_permission` VALUES ('e19c72d8f4644af4bcd4878ce8fa13b1', '1555155659884', '25', null, '2019-04-13 21:05:59');
INSERT INTO `sys_role_permission` VALUES ('e2fb2816d3d64966b52d654807921aff', '1555155515780', '20', null, '2019-04-13 19:43:18');
INSERT INTO `sys_role_permission` VALUES ('e41dacb7222f4847ac4da17eb66faab1', '1555155515780', '18', null, '2019-04-13 19:43:18');
INSERT INTO `sys_role_permission` VALUES ('e7e2faf249e54874aee7b2de34df2d35', '1555155515780', '16', null, '2019-04-13 19:43:18');
INSERT INTO `sys_role_permission` VALUES ('e849d6bb23114eabae008a94afeb91f7', '1555159809321', '1555158849073', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('e91a8255bc3f4808b76b7498ff657e1f', '1555155659884', '24', null, '2019-04-13 19:43:44');
INSERT INTO `sys_role_permission` VALUES ('e9328fc8978e4704ae78b01a3acea53a', '1555159809321', '1555159766402', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('e984c696d5894c189c899684ad97397f', '1555155659884', '25', null, '2019-04-13 19:43:44');
INSERT INTO `sys_role_permission` VALUES ('f224c936977849bf836931f71863b4cf', '1555159809321', '12', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('f6f5775354d14354a57636393eef7f0b', '1555159809321', '1555158639864', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('f78223fac91549adb7e4ad3d733de192', '1555159809321', '19', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('f7d51878c6064f9585c82bdc55f094e7', '1555159809321', '1555159710298', null, '2019-04-13 20:50:20');
INSERT INTO `sys_role_permission` VALUES ('fa786d7aaa9841bfa1b78e5b128f5e44', '1555155659884', '21', null, '2019-04-13 19:43:44');
INSERT INTO `sys_role_permission` VALUES ('fa99449e0e294021bb5b052022ce1751', '1555155606655', '1', null, '2019-04-13 19:43:37');
INSERT INTO `sys_role_permission` VALUES ('fc939d0b2cce4911ac0c713f82f8a11f', '1555155606655', '21', null, '2019-04-13 19:43:37');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '姓名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT '盐',
  `create_id` varchar(40) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `locked` int(1) NOT NULL DEFAULT '0' COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1555134675321', 'admin', '1212', '22', null, '2019-04-13 16:14:30', '1');
INSERT INTO `sys_user` VALUES ('1555155288522', 'root', 'root', '1212', null, '2019-04-13 20:52:52', '1');
INSERT INTO `sys_user` VALUES ('1555157127961', 'test', 'test', 'test', null, '2019-04-13 20:05:27', '1');
INSERT INTO `sys_user` VALUES ('345345', '张三', 'cb571f7bd7a6f73ab004a70322b963d5', 'eteokues', null, '2019-04-16 18:49:16', '0');
INSERT INTO `sys_user` VALUES ('4564', '李四', 'bf07fd8bbc73b6f70b8319f2ebb87483', 'uiwueylm', null, '2019-04-11 18:49:20', '0');
INSERT INTO `sys_user` VALUES ('53523', 'ttts', 'ttt', null, null, '2019-04-16 18:49:23', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(40) NOT NULL,
  `sys_user_id` varchar(40) NOT NULL,
  `sys_role_id` varchar(40) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_id` varchar(40) DEFAULT NULL COMMENT '创建者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('868686976977', '1555155288522', '1555159809321', '2019-04-13 20:52:31', null);
INSERT INTO `sys_user_role` VALUES ('f3df6191edaf4fd9860ef1340dc6160c', '1555134675321', '1555155606655', '2019-04-13 19:44:11', null);
INSERT INTO `sys_user_role` VALUES ('fc0422cde9a94a61815aaff75403575d', '1555157127961', '1555155606655', '2019-04-13 20:05:36', null);
