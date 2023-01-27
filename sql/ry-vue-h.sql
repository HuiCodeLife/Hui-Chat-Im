/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50729 (5.7.29-log)
 Source Host           : localhost:3306
 Source Schema         : ry-vue-h

 Target Server Type    : MySQL
 Target Server Version : 50729 (5.7.29-log)
 File Encoding         : 65001

 Date: 27/01/2023 09:46:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_friends_request
-- ----------------------------
DROP TABLE IF EXISTS `chat_friends_request`;
CREATE TABLE `chat_friends_request`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `send_user_id` bigint(20) NOT NULL COMMENT '请求者id',
  `accept_user_id` bigint(20) NOT NULL COMMENT '接收方id',
  `request_date_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除状态',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 [0未处理  1同意 2拒绝 3忽略]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_friends_request
-- ----------------------------
INSERT INTO `chat_friends_request` VALUES (1, 1, 3, '2023-01-22 13:26:39', '0', '1');
INSERT INTO `chat_friends_request` VALUES (2, 1, 2, '2023-01-22 13:32:56', '0', '1');
INSERT INTO `chat_friends_request` VALUES (3, 1, 2, '2023-01-22 13:38:08', '0', '1');
INSERT INTO `chat_friends_request` VALUES (4, 1, 2, '2023-01-22 13:40:30', '0', '1');
INSERT INTO `chat_friends_request` VALUES (5, 1, 2, '2023-01-22 13:41:28', '0', '1');
INSERT INTO `chat_friends_request` VALUES (6, 3, 1, '2023-01-25 12:36:14', '0', '1');

-- ----------------------------
-- Table structure for chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `chat_msg`;
CREATE TABLE `chat_msg`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `send_user_id` bigint(20) NOT NULL COMMENT '发送者id',
  `accept_user_id` bigint(20) NOT NULL COMMENT '接收者id',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_msg
-- ----------------------------
INSERT INTO `chat_msg` VALUES (10, 1, 2, '1', '2023-01-22 10:16:26');
INSERT INTO `chat_msg` VALUES (11, 1, 2, '11', '2023-01-22 10:31:05');
INSERT INTO `chat_msg` VALUES (12, 1, 2, '1', '2023-01-22 10:33:27');
INSERT INTO `chat_msg` VALUES (13, 1, 2, '1', '2023-01-22 10:34:37');
INSERT INTO `chat_msg` VALUES (14, 1, 2, '111', '2023-01-22 10:37:18');
INSERT INTO `chat_msg` VALUES (15, 1, 2, '1', '2023-01-22 10:59:05');
INSERT INTO `chat_msg` VALUES (16, 1, 2, '2', '2023-01-22 10:59:08');
INSERT INTO `chat_msg` VALUES (17, 1, 2, '1', '2023-01-22 12:41:18');
INSERT INTO `chat_msg` VALUES (18, 1, 2, '3', '2023-01-22 12:41:21');
INSERT INTO `chat_msg` VALUES (19, 1, 2, '1', '2023-01-22 12:43:37');
INSERT INTO `chat_msg` VALUES (20, 1, 2, '1', '2023-01-22 12:43:51');
INSERT INTO `chat_msg` VALUES (21, 1, 2, '1', '2023-01-22 12:44:29');
INSERT INTO `chat_msg` VALUES (22, 1, 2, 'w', '2023-01-22 12:44:42');
INSERT INTO `chat_msg` VALUES (23, 2, 1, 'e', '2023-01-22 12:44:44');
INSERT INTO `chat_msg` VALUES (24, 1, 2, '666', '2023-01-22 12:45:00');
INSERT INTO `chat_msg` VALUES (25, 2, 1, 'ff', '2023-01-22 12:45:03');
INSERT INTO `chat_msg` VALUES (26, 2, 1, '1', '2023-01-22 13:04:51');
INSERT INTO `chat_msg` VALUES (27, 1, 2, '11', '2023-01-22 13:06:52');
INSERT INTO `chat_msg` VALUES (28, 2, 1, '55', '2023-01-22 13:06:58');
INSERT INTO `chat_msg` VALUES (29, 3, 1, '1', '2023-01-22 13:27:25');
INSERT INTO `chat_msg` VALUES (30, 3, 1, '?', '2023-01-22 13:27:38');
INSERT INTO `chat_msg` VALUES (31, 1, 2, '1', '2023-01-22 13:28:17');
INSERT INTO `chat_msg` VALUES (32, 1, 2, '2', '2023-01-22 13:28:18');
INSERT INTO `chat_msg` VALUES (33, 1, 2, '3', '2023-01-22 13:28:18');
INSERT INTO `chat_msg` VALUES (34, 1, 2, '4', '2023-01-22 13:28:18');
INSERT INTO `chat_msg` VALUES (35, 1, 2, '5', '2023-01-22 13:28:19');
INSERT INTO `chat_msg` VALUES (36, 1, 2, '6', '2023-01-22 15:10:28');
INSERT INTO `chat_msg` VALUES (37, 1, 2, '1', '2023-01-22 15:32:46');
INSERT INTO `chat_msg` VALUES (38, 2, 1, '666', '2023-01-22 15:32:53');
INSERT INTO `chat_msg` VALUES (39, 3, 1, '1', '2023-01-25 12:41:07');
INSERT INTO `chat_msg` VALUES (40, 1, 3, '2', '2023-01-25 12:41:08');
INSERT INTO `chat_msg` VALUES (41, 1, 3, '3', '2023-01-25 12:41:10');
INSERT INTO `chat_msg` VALUES (42, 3, 1, '4', '2023-01-25 12:41:11');
INSERT INTO `chat_msg` VALUES (43, 1, 3, '[吓]', '2023-01-25 12:43:28');
INSERT INTO `chat_msg` VALUES (44, 3, 1, '1', '2023-01-25 13:03:06');
INSERT INTO `chat_msg` VALUES (45, 3, 1, '1', '2023-01-25 22:30:36');
INSERT INTO `chat_msg` VALUES (46, 1, 3, '2e', '2023-01-25 22:30:41');
INSERT INTO `chat_msg` VALUES (47, 3, 1, '2', '2023-01-25 22:30:43');
INSERT INTO `chat_msg` VALUES (48, 3, 1, '[闲]', '2023-01-25 22:30:46');
INSERT INTO `chat_msg` VALUES (49, 1, 3, 'd', '2023-01-25 22:30:49');
INSERT INTO `chat_msg` VALUES (50, 1, 3, '<img src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126085647A002.jpg\"> ', '2023-01-26 08:56:47');
INSERT INTO `chat_msg` VALUES (51, 1, 3, '<img width=\"60\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126085724A003.jpg\"> ', '2023-01-26 08:57:24');
INSERT INTO `chat_msg` VALUES (52, 1, 3, '  <el-image\n    style=\"width: 100px; height: 100px\"\n    :src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126090121A004.jpg\" >\n  </el-image>', '2023-01-26 09:01:22');
INSERT INTO `chat_msg` VALUES (53, 1, 3, '  <el-image\n    style=\"width: 100px; height: 100px\"\n    src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126090134A005.jpg\" >\n  </el-image>', '2023-01-26 09:01:34');
INSERT INTO `chat_msg` VALUES (54, 1, 3, '<el-image style=\"width: 100px; height: 100px\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126090222A006.jpg\" > </el-image>', '2023-01-26 09:02:22');
INSERT INTO `chat_msg` VALUES (55, 1, 2, '<img style=\"width: 100px; height: 100px\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126140723A004.jpg\"> ', '2023-01-26 14:07:24');
INSERT INTO `chat_msg` VALUES (56, 1, 2, '<image-preview :src=\"response.url\" :width=\"50\" :height=\"50\"/>', '2023-01-26 14:12:59');
INSERT INTO `chat_msg` VALUES (57, 1, 2, '<image-preview :src=\"response.url\" :width=\"50\" :height=\"50\"/>', '2023-01-26 14:16:47');
INSERT INTO `chat_msg` VALUES (58, 1, 2, '<image-preview src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126142018A007.jpg\"/>', '2023-01-26 14:20:19');
INSERT INTO `chat_msg` VALUES (59, 1, 2, '<ImagePreview src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126142134A008.jpg\"/>', '2023-01-26 14:21:34');
INSERT INTO `chat_msg` VALUES (60, 1, 2, '[努力]', '2023-01-26 14:23:37');
INSERT INTO `chat_msg` VALUES (61, 1, 2, '[快乐]', '2023-01-26 14:23:44');
INSERT INTO `chat_msg` VALUES (62, 1, 2, '<ImagePreview src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-47-36_20230126142502A009.jpg\"/>', '2023-01-26 14:25:02');
INSERT INTO `chat_msg` VALUES (63, 1, 2, 'f', '2023-01-26 14:30:57');
INSERT INTO `chat_msg` VALUES (64, 1, 2, '[骂]', '2023-01-26 14:31:47');
INSERT INTO `chat_msg` VALUES (65, 1, 2, '<ImagePreview src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126143222A010.jpg\"/>', '2023-01-26 14:32:23');
INSERT INTO `chat_msg` VALUES (66, 1, 2, '[秘密]', '2023-01-26 14:36:46');
INSERT INTO `chat_msg` VALUES (67, 1, 2, '                    <image-preview src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126142134A008.jpg\"></image-preview>\n', '2023-01-26 14:44:04');
INSERT INTO `chat_msg` VALUES (68, 1, 2, '<img src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126142134A008.jpg\"></img>\n', '2023-01-26 14:47:42');
INSERT INTO `chat_msg` VALUES (69, 1, 2, '[努力]', '2023-01-26 14:50:48');
INSERT INTO `chat_msg` VALUES (70, 1, 2, '<img src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126142134A008.jpg\"></img>\n', '2023-01-26 14:50:58');
INSERT INTO `chat_msg` VALUES (71, 1, 2, '<ImagePreview src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126142134A008.jpg\"></ImagePreview>\n', '2023-01-26 14:51:38');
INSERT INTO `chat_msg` VALUES (72, 1, 2, '<img src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126145244A015.jpg\"/>', '2023-01-26 14:52:45');
INSERT INTO `chat_msg` VALUES (73, 1, 2, '<img src=\"http://localhost:8080/profile/upload/2023/01/26/pure-design-master_20230126145251A016.zip\"/>', '2023-01-26 14:52:52');
INSERT INTO `chat_msg` VALUES (74, 1, 2, '<img width=\"50px\" height=\"50px\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126145313A017.jpg\"/>', '2023-01-26 14:53:13');
INSERT INTO `chat_msg` VALUES (75, 1, 2, '<img width=\"120px\" height=\"120px\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126145333A018.jpg\"/>', '2023-01-26 14:53:33');
INSERT INTO `chat_msg` VALUES (76, 1, 2, '<img width=\"200px\" height=\"200px\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126145353A019.jpg\"/>', '2023-01-26 14:53:54');
INSERT INTO `chat_msg` VALUES (77, 1, 2, '<img class=\"img img-object \"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126145640A020.jpg\"/>', '2023-01-26 14:56:41');
INSERT INTO `chat_msg` VALUES (78, 1, 2, '<img object-fit=\"cover\" width=\"200px\" height=\"200px\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126145802A021.jpg\"/>', '2023-01-26 14:58:03');
INSERT INTO `chat_msg` VALUES (79, 1, 2, '<img object-fit=\"cover\" src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126145817A022.jpg\"/>', '2023-01-26 14:58:17');
INSERT INTO `chat_msg` VALUES (80, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126145907A023.jpg\"/>', '2023-01-26 14:59:08');
INSERT INTO `chat_msg` VALUES (81, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126145912A024.jpg\"/>', '2023-01-26 14:59:12');
INSERT INTO `chat_msg` VALUES (82, 1, 2, '[笑]', '2023-01-26 15:00:50');
INSERT INTO `chat_msg` VALUES (83, 1, 2, '6', '2023-01-26 15:00:52');
INSERT INTO `chat_msg` VALUES (84, 1, 2, '666', '2023-01-26 15:00:53');
INSERT INTO `chat_msg` VALUES (85, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126150717A025.jpg\"/>', '2023-01-26 15:07:18');
INSERT INTO `chat_msg` VALUES (86, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126150735A026.jpg\"/>', '2023-01-26 15:07:36');
INSERT INTO `chat_msg` VALUES (87, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-47-36_20230126150741A027.jpg\"/>', '2023-01-26 15:07:41');
INSERT INTO `chat_msg` VALUES (88, 1, 2, 'f', '2023-01-26 15:07:43');
INSERT INTO `chat_msg` VALUES (89, 1, 2, 'ff', '2023-01-26 15:07:44');
INSERT INTO `chat_msg` VALUES (90, 1, 2, 'ff', '2023-01-26 15:07:46');
INSERT INTO `chat_msg` VALUES (91, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-47-36_20230126150751A028.jpg\"/>', '2023-01-26 15:07:52');
INSERT INTO `chat_msg` VALUES (92, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126150847A029.jpg\"/>', '2023-01-26 15:08:48');
INSERT INTO `chat_msg` VALUES (93, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-47-36_20230126150858A030.jpg\"/>', '2023-01-26 15:08:58');
INSERT INTO `chat_msg` VALUES (94, 1, 2, '[努力]', '2023-01-26 15:09:57');
INSERT INTO `chat_msg` VALUES (95, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2022-12-23_16-10-57_20230126151000A031.jpg\"/>', '2023-01-26 15:10:01');
INSERT INTO `chat_msg` VALUES (96, 1, 2, '<img   width=\"200px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126151006A032.jpg\"/>', '2023-01-26 15:10:06');
INSERT INTO `chat_msg` VALUES (97, 1, 2, '<img   width=\"300px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126151021A033.jpg\"/>', '2023-01-26 15:10:21');
INSERT INTO `chat_msg` VALUES (98, 1, 2, '<img   width=\"350px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-47-36_20230126151035A034.jpg\"/>', '2023-01-26 15:10:36');
INSERT INTO `chat_msg` VALUES (99, 1, 2, '<img   width=\"300px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-47-36_20230126151046A035.jpg\"/>', '2023-01-26 15:10:47');
INSERT INTO `chat_msg` VALUES (100, 1, 2, '<img   width=\"300px\"  src=\"http://localhost:8080/profile/upload/2023/01/26/Snipaste_2023-01-10_20-44-33_20230126164127A001.jpg\"/>', '2023-01-26 16:41:28');
INSERT INTO `chat_msg` VALUES (101, 1, 2, '2', '2023-01-26 16:41:30');
INSERT INTO `chat_msg` VALUES (102, 1, 2, '333', '2023-01-26 16:41:31');
INSERT INTO `chat_msg` VALUES (103, 1, 2, '666', '2023-01-26 16:41:31');
INSERT INTO `chat_msg` VALUES (104, 1, 2, '[骂]', '2023-01-26 16:41:34');
INSERT INTO `chat_msg` VALUES (105, 1, 2, '[快乐]', '2023-01-26 16:41:38');
INSERT INTO `chat_msg` VALUES (106, 1, 2, '1', '2023-01-26 16:42:14');
INSERT INTO `chat_msg` VALUES (107, 2, 1, '1', '2023-01-26 16:42:16');
INSERT INTO `chat_msg` VALUES (108, 1, 2, '[打击]', '2023-01-26 16:42:34');
INSERT INTO `chat_msg` VALUES (109, 1, 3, '1', '2023-01-26 16:49:02');
INSERT INTO `chat_msg` VALUES (110, 1, 3, '1', '2023-01-26 16:49:31');
INSERT INTO `chat_msg` VALUES (111, 1, 3, '1', '2023-01-26 16:53:45');
INSERT INTO `chat_msg` VALUES (112, 1, 2, '1', '2023-01-26 17:04:17');
INSERT INTO `chat_msg` VALUES (113, 1, 2, '2', '2023-01-26 17:06:11');

-- ----------------------------
-- Table structure for chat_user_friends
-- ----------------------------
DROP TABLE IF EXISTS `chat_user_friends`;
CREATE TABLE `chat_user_friends`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '我的id',
  `friend_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '我的好友的id',
  PRIMARY KEY (`user_id`, `friend_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_user_friends
-- ----------------------------
INSERT INTO `chat_user_friends` VALUES ('1', '2');
INSERT INTO `chat_user_friends` VALUES ('1', '3');
INSERT INTO `chat_user_friends` VALUES ('2', '1');
INSERT INTO `chat_user_friends` VALUES ('3', '1');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'chat_user', '用户信息表', NULL, NULL, 'ChatUser', 'crud', 'com.h.chat', 'chat', 'chatUser', '用户信息', 'h', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14', NULL);
INSERT INTO `gen_table` VALUES (2, 'chat_friends_request', '好友请求', NULL, NULL, 'ChatFriendsRequest', 'crud', 'com.h.chat', 'chat', 'request', '好友请求', 'h', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00', NULL);
INSERT INTO `gen_table` VALUES (3, 'chat_msg', '聊天记录', NULL, NULL, 'ChatMsg', 'crud', 'com.h.chat', 'chat', 'msg', '聊天记录', 'h', '0', '/', '{\"parentMenuId\":2008}', 'admin', '2023-01-22 20:42:18', '', '2023-01-22 20:45:07', NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.h.system', 'system', 'user', '用户信息', 'ruoyi', '0', '/', NULL, 'admin', '2023-01-22 21:22:31', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'user_id', '用户ID', 'varchar(64)', 'Long', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14');
INSERT INTO `gen_table_column` VALUES (2, '1', 'username', '用户账号', 'varchar(30)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14');
INSERT INTO `gen_table_column` VALUES (3, '1', 'nickname', '用户昵称', 'varchar(30)', 'String', 'nickname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14');
INSERT INTO `gen_table_column` VALUES (4, '1', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14');
INSERT INTO `gen_table_column` VALUES (5, '1', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14');
INSERT INTO `gen_table_column` VALUES (6, '1', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:14');
INSERT INTO `gen_table_column` VALUES (7, '1', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (8, '1', 'area', '用户地址', 'varchar(100)', 'String', 'area', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_user_sex', 8, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (9, '1', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (10, '1', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (11, '1', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 11, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (12, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (13, '1', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (14, '1', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (15, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (16, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (17, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (18, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (19, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2023-01-21 17:04:45', '', '2023-01-21 17:26:15');
INSERT INTO `gen_table_column` VALUES (20, '2', 'id', 'id', 'varchar(64)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00');
INSERT INTO `gen_table_column` VALUES (21, '2', 'send_user_id', '请求者id', 'varchar(64)', 'Long', 'sendUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00');
INSERT INTO `gen_table_column` VALUES (22, '2', 'accept_user_id', '接收方id', 'varchar(64)', 'Long', 'acceptUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00');
INSERT INTO `gen_table_column` VALUES (23, '2', 'request_date_time', '发送时间', 'datetime', 'Date', 'requestDateTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00');
INSERT INTO `gen_table_column` VALUES (24, '2', 'del_flag', '删除状态', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00');
INSERT INTO `gen_table_column` VALUES (25, '2', 'status', '状态 [0未处理  1同意 2拒绝 3忽略]', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'friend_request_status', 6, 'admin', '2023-01-21 19:13:29', '', '2023-01-21 19:18:00');
INSERT INTO `gen_table_column` VALUES (26, '3', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-22 20:42:18', '', '2023-01-22 20:45:07');
INSERT INTO `gen_table_column` VALUES (27, '3', 'send_user_id', '发送者id', 'bigint(20)', 'Long', 'sendUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-22 20:42:18', '', '2023-01-22 20:45:07');
INSERT INTO `gen_table_column` VALUES (28, '3', 'accept_user_id', '接收者id', 'bigint(20)', 'Long', 'acceptUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-22 20:42:18', '', '2023-01-22 20:45:07');
INSERT INTO `gen_table_column` VALUES (29, '3', 'content', '消息内容', 'varchar(255)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2023-01-22 20:42:18', '', '2023-01-22 20:45:07');
INSERT INTO `gen_table_column` VALUES (30, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-01-22 20:42:18', '', '2023-01-22 20:45:07');
INSERT INTO `gen_table_column` VALUES (31, '4', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '4', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '4', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '4', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '4', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '4', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '4', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '4', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '4', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '4', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '4', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '4', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '4', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-01-22 21:22:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2023-01-22 21:22:31', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-21 17:01:26', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-21 17:01:26', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-21 17:01:26', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-01-21 17:01:26', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-01-21 17:01:26', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未处理', '0', 'friend_request_status', NULL, 'info', 'N', '0', 'admin', '2023-01-21 19:15:56', 'admin', '2023-01-21 19:16:55', '未处理');
INSERT INTO `sys_dict_data` VALUES (101, 0, '同意', '1', 'friend_request_status', NULL, 'success', 'N', '0', 'admin', '2023-01-21 19:16:09', 'admin', '2023-01-21 19:16:14', '同意');
INSERT INTO `sys_dict_data` VALUES (102, 0, '拒绝', '2', 'friend_request_status', NULL, 'danger', 'N', '0', 'admin', '2023-01-21 19:16:30', '', NULL, '拒绝');
INSERT INTO `sys_dict_data` VALUES (103, 0, '忽略', '3', 'friend_request_status', NULL, 'warning', 'N', '0', 'admin', '2023-01-21 19:16:41', 'admin', '2023-01-21 19:17:00', '忽略');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '好友请求状态', 'friend_request_status', '0', 'admin', '2023-01-21 19:15:24', '', NULL, '好友请求状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-01-21 17:01:27', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-01-21 17:01:27', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-01-21 17:01:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 17:04:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:21:45');
INSERT INTO `sys_logininfor` VALUES (102, 'lin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：lin 不存在', '2023-01-21 18:32:30');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:32:48');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:32:52');
INSERT INTO `sys_logininfor` VALUES (105, 'lin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：lin 不存在', '2023-01-21 18:35:56');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:36:06');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:39:03');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:40:06');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:40:29');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:41:05');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:44:25');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:46:37');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:48:04');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:49:22');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:49:53');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-21 18:55:42');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-21 18:55:47');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:55:49');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 18:59:39');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 19:11:50');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 19:13:18');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 09:38:59');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 09:42:07');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 09:43:13');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 09:43:16');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 09:43:18');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 09:43:23');
INSERT INTO `sys_logininfor` VALUES (128, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 10:34:31');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 12:40:41');
INSERT INTO `sys_logininfor` VALUES (130, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 12:41:10');
INSERT INTO `sys_logininfor` VALUES (131, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 13:08:36');
INSERT INTO `sys_logininfor` VALUES (132, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 13:08:40');
INSERT INTO `sys_logininfor` VALUES (133, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 13:11:36');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 13:11:42');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 13:11:48');
INSERT INTO `sys_logininfor` VALUES (136, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 13:11:55');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 13:14:18');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 13:14:24');
INSERT INTO `sys_logininfor` VALUES (139, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 13:28:11');
INSERT INTO `sys_logininfor` VALUES (140, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 13:28:52');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:10:20');
INSERT INTO `sys_logininfor` VALUES (142, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:10:38');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 15:12:45');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:12:49');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:37:35');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:43:08');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:43:11');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:54:30');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 15:54:35');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 15:55:10');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-22 15:55:23');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 20:42:00');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-22 21:14:00');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-23 09:49:45');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-23 10:55:06');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-23 11:01:34');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-23 11:02:41');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-23 11:02:59');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-23 11:07:22');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-23 11:07:23');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-23 11:07:36');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-23 11:09:45');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-23 11:09:48');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-23 11:12:31');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-23 11:12:49');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 09:15:07');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 09:15:36');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 11:18:27');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 12:02:46');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-25 12:27:34');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 12:27:41');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-25 12:31:40');
INSERT INTO `sys_logininfor` VALUES (173, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 12:31:53');
INSERT INTO `sys_logininfor` VALUES (174, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 12:32:51');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 12:36:30');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 21:41:55');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 22:16:56');
INSERT INTO `sys_logininfor` VALUES (178, 'dev', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 22:30:31');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-26 08:50:47');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-26 14:03:59');
INSERT INTO `sys_logininfor` VALUES (181, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-26 15:12:19');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-26 16:40:58');
INSERT INTO `sys_logininfor` VALUES (183, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-26 16:42:03');
INSERT INTO `sys_logininfor` VALUES (184, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-26 17:04:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-21 17:01:26', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-01-21 17:01:26', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-01-21 17:01:26', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-01-21 17:01:26', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-01-21 17:01:26', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-01-21 17:01:26', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-01-21 17:01:26', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-01-21 17:01:26', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-01-21 17:01:26', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-01-21 17:01:26', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-01-21 17:01:26', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-01-21 17:01:26', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-01-21 17:01:26', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-01-21 17:01:26', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-01-21 17:01:26', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-01-21 17:01:26', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-01-21 17:01:26', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-01-21 17:01:26', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-01-21 17:01:26', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-01-21 17:01:26', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-01-21 17:01:26', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-01-21 17:01:26', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-01-21 17:01:26', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-01-21 17:01:26', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '聊天管理', 0, 0, 'chat', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'date-range', 'admin', '2023-01-21 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '好友请求', 2000, 1, 'request', 'chat/request/index', NULL, 1, 0, 'C', '0', '0', 'chat:request:list', 'cascader', 'admin', '2023-01-21 19:20:18', 'admin', '2023-01-22 21:16:39', '好友请求菜单');
INSERT INTO `sys_menu` VALUES (2003, '好友请求查询', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:request:query', '#', 'admin', '2023-01-21 19:20:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '好友请求新增', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:request:add', '#', 'admin', '2023-01-21 19:20:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '好友请求修改', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:request:edit', '#', 'admin', '2023-01-21 19:20:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '好友请求删除', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:request:remove', '#', 'admin', '2023-01-21 19:20:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '好友请求导出', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:request:export', '#', 'admin', '2023-01-21 19:20:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '聊天记录', 2000, 1, 'msg', 'chat/msg/index', NULL, 1, 0, 'C', '0', '0', 'chat/msg/list', 'documentation', 'admin', '2023-01-22 20:43:59', 'admin', '2023-01-22 21:15:11', '');
INSERT INTO `sys_menu` VALUES (2009, '聊天记录', 2008, 1, 'msg', 'chat/msg/index', NULL, 1, 0, 'C', '0', '0', 'chat:msg:list', '#', 'admin', '2023-01-22 21:13:54', '', NULL, '聊天记录菜单');
INSERT INTO `sys_menu` VALUES (2010, '聊天记录查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:msg:query', '#', 'admin', '2023-01-22 21:13:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '聊天记录新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:msg:add', '#', 'admin', '2023-01-22 21:13:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '聊天记录修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:msg:edit', '#', 'admin', '2023-01-22 21:13:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '聊天记录删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:msg:remove', '#', 'admin', '2023-01-22 21:13:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '聊天记录导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chat:msg:export', '#', 'admin', '2023-01-22 21:13:54', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-01-21 17:01:27', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-01-21 17:01:27', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.h.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"chat_user\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 17:04:45');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.h.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chatUser\",\"className\":\"ChatUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户账号\",\"columnId\":2,\"columnName\":\"username\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"用户昵称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserType\",\"columnComment\":\"用户类型（00系统用户）\",\"columnId\":4,\"columnName\":\"user_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"us', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 17:05:55');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.h.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chat_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 17:23:11');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.h.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"聊天管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"chat\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 17:24:20');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.h.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/chatUser/index\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户列表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"chat-user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 17:25:47');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.h.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chatUser\",\"className\":\"ChatUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-01-21 17:23:11\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户账号\",\"columnId\":2,\"columnName\":\"username\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-01-21 17:23:11\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"用户昵称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-01-21 17:23:11\",\"usableColumn\":false},{\"capJavaField\":\"UserType\",\"columnComment\":\"用户类型（00系统用户）\",\"columnId\":4,\"columnName\":\"user_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:04:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 17:26:15');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.h.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chat_user\"}', NULL, 0, NULL, '2023-01-21 17:26:18');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 3, 'com.h.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 18:59:46');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.h.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"chat_friends_request\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:13:29');
INSERT INTO `sys_oper_log` VALUES (109, '字典类型', 1, 'com.h.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"好友请求状态\",\"dictType\":\"friend_request_status\",\"params\":{},\"remark\":\"好友请求状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:15:24');
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.h.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"cssClass\":\"\",\"default\":false,\"dictLabel\":\"未处理\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"未处理\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:15:56');
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.h.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"同意\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"同意\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:16:09');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 2, 'com.h.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:16:09\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"同意\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"remark\":\"同意\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:16:14');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.h.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"拒绝\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"拒绝\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:16:30');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.h.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"忽略\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"remark\":\"忽略\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:16:41');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 2, 'com.h.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:15:56\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"未处理\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"remark\":\"未处理\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:16:55');
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 2, 'com.h.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:16:41\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"忽略\",\"dictSort\":0,\"dictType\":\"friend_request_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"忽略\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:17:00');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.h.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chat_friends_request', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:17:10');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.h.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"request\",\"className\":\"ChatFriendsRequest\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:13:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-01-21 19:17:10\",\"usableColumn\":false},{\"capJavaField\":\"SendUserId\",\"columnComment\":\"请求者id\",\"columnId\":21,\"columnName\":\"send_user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sendUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-01-21 19:17:10\",\"usableColumn\":false},{\"capJavaField\":\"AcceptUserId\",\"columnComment\":\"接收方id\",\"columnId\":22,\"columnName\":\"accept_user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"acceptUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-01-21 19:17:10\",\"usableColumn\":false},{\"capJavaField\":\"RequestDateTime\",\"columnComment\":\"发送时间\",\"columnId\":23,\"columnName\":\"request_date_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-01-21 19:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-21 19:18:00');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.h.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chat_friends_request\"}', NULL, 0, NULL, '2023-01-21 19:18:03');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 6, 'com.h.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"chat_msg\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 20:42:18');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.h.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/chatmsg/index\",\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"聊天记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"chatmsg\",\"perms\":\"chat/chatmsg/list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 20:43:59');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.h.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"msg\",\"className\":\"ChatMsg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":26,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-22 20:42:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SendUserId\",\"columnComment\":\"发送者id\",\"columnId\":27,\"columnName\":\"send_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-22 20:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sendUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AcceptUserId\",\"columnComment\":\"接收者id\",\"columnId\":28,\"columnName\":\"accept_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-22 20:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"acceptUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"消息内容\",\"columnId\":29,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-22 20:42:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"c', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 20:45:07');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.h.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chat_msg\"}', NULL, 0, NULL, '2023-01-22 20:45:09');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.h.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/msg/index\",\"createTime\":\"2023-01-22 20:43:59\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"聊天记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"msg\",\"perms\":\"chat/msg/list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 21:15:11');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.h.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/request/index\",\"createTime\":\"2023-01-21 19:20:18\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"好友请求\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"request\",\"perms\":\"chat:request:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 21:16:39');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 6, 'com.h.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"sys_user\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 21:22:31');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.h.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/user/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"user\",\"perms\":\"chat:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-22 21:29:00');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.h.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2015', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-23 10:04:01');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.h.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/user/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"聊天用户\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"user\",\"perms\":\"chat:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-23 10:08:47');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.h.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chat/user/index\",\"createTime\":\"2023-01-23 10:08:47\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"聊天用户\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"user\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-23 10:15:27');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.h.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2016', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-23 10:18:15');
INSERT INTO `sys_oper_log` VALUES (132, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/01/24/blob_20230124091555A001.png\",\"code\":200}', 0, NULL, '2023-01-24 09:15:55');
INSERT INTO `sys_oper_log` VALUES (133, '个人信息', 2, 'com.h.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-01-21 17:01:26\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"loginDate\":\"2023-01-23 11:12:32\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-24 09:16:21');
INSERT INTO `sys_oper_log` VALUES (134, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/01/24/blob_20230124091659A002.png\",\"code\":200}', 0, NULL, '2023-01-24 09:17:00');
INSERT INTO `sys_oper_log` VALUES (135, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/01/25/blob_20230125091620A001.png\",\"code\":200}', 0, NULL, '2023-01-25 09:16:21');
INSERT INTO `sys_oper_log` VALUES (136, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile//2023/01/25/blob_20230125120835A001.png\",\"code\":200}', 0, NULL, '2023-01-25 12:08:35');
INSERT INTO `sys_oper_log` VALUES (137, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'Non-XML response from server. Response code: 400, Content-Type: text/xml; charset=utf-8, body: <?xml version=\"1.0\" encoding=\"UTF-8\"?><Error><Code>InvalidArgument</Code><Message>S3 API Requests must be made to API port.</Message><RequestId>0</RequestId></Error>', '2023-01-25 12:10:26');
INSERT INTO `sys_oper_log` VALUES (138, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://192.168.200.131:9001/chat/2023/01/25/blob_20230125121204A001.png\",\"code\":200}', 0, NULL, '2023-01-25 12:12:05');
INSERT INTO `sys_oper_log` VALUES (139, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://192.168.200.131:9001/chat/2023/01/25/blob_20230125123041A002.png\",\"code\":200}', 0, NULL, '2023-01-25 12:30:41');
INSERT INTO `sys_oper_log` VALUES (140, '用户头像', 2, 'com.h.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'dev', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://192.168.200.131:9001/chat/2023/01/25/blob_20230125123213A003.png\",\"code\":200}', 0, NULL, '2023-01-25 12:32:13');
INSERT INTO `sys_oper_log` VALUES (141, '个人信息', 2, 'com.h.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'dev', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"dev@q.com\",\"loginDate\":\"2023-01-22 13:11:55\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"开发\",\"params\":{},\"phonenumber\":\"15202202020\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":3,\"userName\":\"dev\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-25 12:32:15');
INSERT INTO `sys_oper_log` VALUES (142, '个人信息', 2, 'com.h.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'dev', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"\",\"delFlag\":\"0\",\"email\":\"dev@q.com\",\"loginDate\":\"2023-01-22 13:11:55\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"hui\",\"params\":{},\"phonenumber\":\"15202202020\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":3,\"userName\":\"dev\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-25 12:32:24');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-01-21 17:01:26', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-01-21 17:01:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-01-21 17:01:26', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', 'http://192.168.200.131:9001/chat/2023/01/25/blob_20230125123041A002.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-26 16:40:59', 'admin', '2023-01-21 17:01:26', '', '2023-01-26 16:40:58', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', 'http://192.168.200.131:9001/chat/2023/01/25/blob_20230125123041A002.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-26 17:04:45', 'admin', '2023-01-21 17:01:26', '', '2023-01-26 17:04:45', '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'robot', '机器人', '11', 'dev@q.com', '15202202020', '0', 'http://192.168.200.131:9001/chat/2023/01/25/blob_20230125123213A003.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-25 22:30:31', '', NULL, '', '2023-01-25 22:30:31', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
