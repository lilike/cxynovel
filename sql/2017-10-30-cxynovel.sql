-- 2017-10-30数据库修订

CREATE TABLE `sys_dict` (
  `dict_code` varchar(32) NOT NULL,
  `dict_name` varchar(32) DEFAULT NULL,
  `dict_category` varchar(32) DEFAULT NULL,
  `dict_value` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creater_no` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifier_no` int(11) DEFAULT NULL,
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` int(11) DEFAULT NULL,
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_dict` VALUES ('dushinovel', '都市言情', 'novel.category', 3, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('kehuannovel', '科幻小说', 'novel.category', 7, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('kongbunovel', '恐怖灵异', 'novel.category', 8, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('lishinovel', '历史军事', 'novel.category', 4, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('othernovel', '其他类型', 'novel.category', 10, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('sanwennovel', '散文诗歌', 'novel.category', 9, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('wangyounovel', '网游动漫', 'novel.category', 6, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('wuxainovel', '武侠修真', 'novel.category', 2, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);
INSERT INTO `sys_dict` VALUES ('xuanhuan', '玄幻魔法', 'novel.category', 1, 1, 0, '2017-10-30 19:35:09', NULL, '2017-10-30 19:35:09', NULL);
INSERT INTO `sys_dict` VALUES ('zhentannovel', '侦探推理', 'novel.category', 5, 1, 0, '2017-10-30 19:39:53', NULL, '2017-10-30 19:39:53', NULL);

INSERT INTO `t_book` VALUES (1, '天龙八部', NULL, NULL, '金庸', '2', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:12', '1', '2017-10-30 09:38:05', 1, '11', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (2, '武林群侠', NULL, NULL, '河洛', '2', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:15', NULL, '2017-10-19 09:38:10', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (3, '金庸大侠', NULL, NULL, '和若', '2', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:15', NULL, '2017-10-20 09:38:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (4, '大侠', NULL, NULL, '毛哥', '2', '销售', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:16', NULL, '2017-10-21 09:38:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (5, '还珠格格', NULL, NULL, '刘可', '2', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:16', NULL, '2017-10-30 14:40:05', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (6, '情深深雨蒙蒙', NULL, NULL, '理可', '2', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:17', NULL, '2017-10-30 15:04:16', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (7, '爱情三十六计', NULL, NULL, '斜杠', '2', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 19:42:18', NULL, '2017-10-30 15:04:54', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_book` VALUES (8, '三生三世十里桃花', NULL, NULL, '刚伟', 'yanqin', '小说', NULL, '1', 1, 1, '1', '1', '2017-10-30 15:06:59', NULL, '2017-10-30 15:07:03', 1, '1', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `t_system_block` VALUES (1, 'last_update_list', '最新更新列表', 0, 0, '1,2,3,4', '1', 0, 0, 0, 1, 0, '1', '2017-10-30 09:45:53', NULL, '2017-10-26 19:10:20');
INSERT INTO `t_system_block` VALUES (2, 'last_insert_list', '最新入库', 0, 0, '1,2,3,4', '2', 0, 0, 0, 1, 0, '1', '2017-10-30 09:45:54', NULL, '2017-10-26 19:13:42');
INSERT INTO `t_system_block` VALUES (3, 'friend_link', '友情链接', 0, 0, '<a href=\"www.baidu.com\">百度</a>', '3', 0, 0, 0, 1, 0, '1', '2017-10-30 10:59:18', NULL, '2017-10-26 19:13:42');
INSERT INTO `t_system_block` VALUES (4, 'index_yanqing_tuijian', '首页言情推荐', 0, 0, '5,6,7,8', '4', 0, 0, 0, 1, 0, '1', '2017-10-30 15:07:34', NULL, '2017-10-26 19:13:42');
INSERT INTO `t_system_block` VALUES (5, 'index_xuanhuan_tuijian', '首页玄幻推荐', 0, 0, '1,2,3,4', '5', 0, 0, 0, 1, 0, '1', '2017-10-30 09:45:56', NULL, '2017-10-26 19:13:42');
INSERT INTO `t_system_block` VALUES (6, 'index_junshi_tuijian', '首页军事推荐', 0, 0, '1,2,3,4', '6', 0, 0, 0, 1, 0, '1', '2017-10-30 09:45:56', NULL, '2017-10-26 19:13:42');
INSERT INTO `t_system_block` VALUES (7, 'index_kongbu_tuijian', '首页恐怖灵异推荐', 0, 0, '1,2,3,4', '7', 0, 0, 0, 1, 0, '1', '2017-10-30 09:45:57', NULL, '2017-10-26 19:13:42');
INSERT INTO `t_system_block` VALUES (8, 'index_wuxia_tuijian', '首页武侠修真推荐', 0, 0, '1,2,3,4', '8', 0, 0, 0, 1, 0, '1', '2017-10-30 09:45:58', NULL, '2017-10-26 19:13:42');

