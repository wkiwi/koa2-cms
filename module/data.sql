/*     数据表sql      */

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` char(50) NOT NULL DEFAULT '' COMMENT '用户帐号',
  `pass_word` char(128) NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户类型 0:未审核用户;1:超级管理员;2:普通管理员;3:VIP用户;4:普通用户',
  `user_email` char(128) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `update_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `user_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户据库表';
INSERT INTO `user` (`id`, `user_name`, `pass_word`, `user_type`, `user_email`, `create_time`, `login_ip`, `update_time`, `user_pic`, `user_extend`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '10000@qq.com', '0000-00-00 00:00:00', '', '2018-12-02 20:25:03', '', NULL);
/* #可选的操作：插入用户：admin  密码：123456  */

DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `keywords` char(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '网站描述',
  `record` char(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `copyright` char(255) NOT NULL DEFAULT '' COMMENT '版权',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站信息';

DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` char(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  `classify` int(10) NOT NULL DEFAULT '0' COMMENT '所属分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导航栏信息';


DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '轮播图片地址',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图组';

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '链接LOGO',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

DROP TABLE IF EXISTS `adv`;
CREATE TABLE `adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '链接主图',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告链接';

DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` char(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `classify` int(10) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容分类';

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classify` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `author` char(100) NOT NULL DEFAULT '' COMMENT '作者',
  `copyright` char(100) NOT NULL DEFAULT '' COMMENT '版权',
  `keywords` char(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '文章描述',
  `thumbnail` char(255) NOT NULL DEFAULT '' COMMENT '缩略图(新增)',
  `recommend` char(100) NOT NULL DEFAULT '' COMMENT '推荐分类',
  `content` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `read_type` tinyint NOT NULL DEFAULT '0' COMMENT '阅读权限（参阅用户类型）',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发表时间',
  `update_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `article_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论量',
  `praise` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞量',
  PRIMARY KEY (`id`),
  KEY `classify` (`classify`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章数据库表';

DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐类型 1:精品;2:热品;3:新品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章推荐类型关联表';

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户ID',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论列表';


DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞用户ID',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '点赞时间',
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章点赞列表';

-- DROP TABLE IF EXISTS `upload`;
-- CREATE TABLE `upload` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
--   `file_name` char(100) NOT NULL DEFAULT '' COMMENT '文件名称',
--   `file_path` char(200) NOT NULL DEFAULT '' COMMENT '文件路径',
--   `mime_type` char(50) NOT NULL DEFAULT '' COMMENT '文件类型',
--   `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小KB',
--   `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
--   `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上传时间',
--   PRIMARY KEY (`id`),
--   KEY `user_id` (`user_id`) USING BTREE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传列表';

-- DROP TABLE IF EXISTS `media`;
-- CREATE TABLE `media` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
--   `media_name` char(100) NOT NULL DEFAULT '' COMMENT '图片名称',
--   `media_src` char(200) NOT NULL DEFAULT '' COMMENT '图片地址',
--   `type` char(10) NOT NULL DEFAULT '' COMMENT '分类类别（picture,video,audio）',
--   `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '宽度',
--   `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高度',
--   `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '大小MB',
--   `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
--   `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
--   PRIMARY KEY (`id`),
--   KEY `article_id` (`article_id`) USING BTREE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多媒体列表';

-- DROP TABLE IF EXISTS `comment`;
-- CREATE TABLE `comment` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
--   `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
--   `praise` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '赞赏数量',
--   `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户ID',
--   `to_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '@用户ID',
--   `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '评论时间',
--   PRIMARY KEY (`id`),
--   KEY `article_id` (`article_id`) USING BTREE,
--   KEY `user_id` (`user_id`) USING BTREE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论列表';


