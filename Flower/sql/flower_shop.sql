/*
 Navicat Premium Data Transfer

 Source Server         : 花店商城数据库
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : flower_shop

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 08/11/2025 11:03:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image1` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image2` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `intro` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_type_id_idx`(`type_id`) USING BTREE,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (3, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 1);
INSERT INTO `goods` VALUES (4, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 1);
INSERT INTO `goods` VALUES (6, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 1);
INSERT INTO `goods` VALUES (8, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 1);
INSERT INTO `goods` VALUES (9, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 1);
INSERT INTO `goods` VALUES (10, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 1);
INSERT INTO `goods` VALUES (13, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 1);
INSERT INTO `goods` VALUES (14, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 1);
INSERT INTO `goods` VALUES (15, '满天星', '/picture/1-1.jpg', '/picture/1-2.jpg', '/picture/1-3.jpg', 88, '满天星的花语主要有守望爱情和甘愿做配角，只愿在你身边，也代表着思念、关心和爱护。它的花朵小而浓密，像是天上的星星一样，通常清雅的人比较喜欢。因为它不绚丽也不张扬，却有着浪漫，清纯的意思。不同颜色的满天星有着不同的花语。用满天星来表白很不错，是默默付出的爱。当然，也很适合送给自己的恋人和亲友。', 50, 2);
INSERT INTO `goods` VALUES (16, '白玫瑰', '/picture/2-1.jpg', '/picture/2-2.jpg', '/picture/2-3.jpg', 99, '骄傲玫瑰简直就是白玫瑰的天花板，和名字完美匹配，奶油白色系，有点白月光的感觉，真的“高冷”又“温柔”，是女神花没错了，确实值得骄傲。相较于坦尼克、白雪山，骄傲玫瑰花瓣更厚实一点，花型也是优雅的杯状，开放后花瓣张度更乖巧，腰形明显，底盘更圆滑，瓣色白更通透。骄傲玫瑰拥有比其他白玫瑰更加持久的花期，带有淡淡香气。', 50, 2);
INSERT INTO `goods` VALUES (17, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 2);
INSERT INTO `goods` VALUES (18, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 2);
INSERT INTO `goods` VALUES (19, '向日葵', '/picture/5-1.jpg', '/picture/5-2.jpg', '/picture/5-3.jpg', 89, '向日葵的花语是信念、光辉、高傲、忠诚、爱慕，向日葵的寓意是沉默的爱，向日葵代表着勇敢地去追求自己想要的幸福。', 50, 2);
INSERT INTO `goods` VALUES (20, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 2);
INSERT INTO `goods` VALUES (21, '绣球', '/picture/7-1.jpg', '/picture/7-2.jpg', '/picture/7-3.jpg', 88, '绣球花圆形的花朵、美丽的姿态象征着与亲人之间斩不断的联系，无论分开多久，都会重新相聚在一起，寓意热情、团聚、幸福、快乐。', 50, 2);
INSERT INTO `goods` VALUES (22, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 2);
INSERT INTO `goods` VALUES (23, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 2);
INSERT INTO `goods` VALUES (24, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 2);
INSERT INTO `goods` VALUES (25, '芍药', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 78, '情有所钟的爱、依依不舍、美丽动人。芍药花是一种爱情之花，在七夕节当天，心有所属的青年男女就会将芍药花在聚会分别的时候送给对方，所以芍药也有“将离草”的别名，象征着爱情和友谊。', 50, 2);
INSERT INTO `goods` VALUES (26, '生菜花', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 88, '赠与生菜，日日生财', 50, 2);
INSERT INTO `goods` VALUES (27, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 2);
INSERT INTO `goods` VALUES (28, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 2);
INSERT INTO `goods` VALUES (29, '满天星', '/picture/1-1.jpg', '/picture/1-2.jpg', '/picture/1-3.jpg', 88, '满天星的花语主要有守望爱情和甘愿做配角，只愿在你身边，也代表着思念、关心和爱护。它的花朵小而浓密，像是天上的星星一样，通常清雅的人比较喜欢。因为它不绚丽也不张扬，却有着浪漫，清纯的意思。不同颜色的满天星有着不同的花语。用满天星来表白很不错，是默默付出的爱。当然，也很适合送给自己的恋人和亲友。', 50, 3);
INSERT INTO `goods` VALUES (30, '白玫瑰', '/picture/2-1.jpg', '/picture/2-2.jpg', '/picture/2-3.jpg', 99, '骄傲玫瑰简直就是白玫瑰的天花板，和名字完美匹配，奶油白色系，有点白月光的感觉，真的“高冷”又“温柔”，是女神花没错了，确实值得骄傲。相较于坦尼克、白雪山，骄傲玫瑰花瓣更厚实一点，花型也是优雅的杯状，开放后花瓣张度更乖巧，腰形明显，底盘更圆滑，瓣色白更通透。骄傲玫瑰拥有比其他白玫瑰更加持久的花期，带有淡淡香气。', 50, 3);
INSERT INTO `goods` VALUES (31, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 3);
INSERT INTO `goods` VALUES (32, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 3);
INSERT INTO `goods` VALUES (33, '向日葵', '/picture/5-1.jpg', '/picture/5-2.jpg', '/picture/5-3.jpg', 89, '向日葵的花语是信念、光辉、高傲、忠诚、爱慕，向日葵的寓意是沉默的爱，向日葵代表着勇敢地去追求自己想要的幸福。', 50, 3);
INSERT INTO `goods` VALUES (34, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 3);
INSERT INTO `goods` VALUES (35, '绣球', '/picture/7-1.jpg', '/picture/7-2.jpg', '/picture/7-3.jpg', 88, '绣球花圆形的花朵、美丽的姿态象征着与亲人之间斩不断的联系，无论分开多久，都会重新相聚在一起，寓意热情、团聚、幸福、快乐。', 50, 3);
INSERT INTO `goods` VALUES (36, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 3);
INSERT INTO `goods` VALUES (37, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 3);
INSERT INTO `goods` VALUES (38, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 3);
INSERT INTO `goods` VALUES (39, '芍药', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 78, '情有所钟的爱、依依不舍、美丽动人。芍药花是一种爱情之花，在七夕节当天，心有所属的青年男女就会将芍药花在聚会分别的时候送给对方，所以芍药也有“将离草”的别名，象征着爱情和友谊。', 50, 3);
INSERT INTO `goods` VALUES (40, '生菜花', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 88, '赠与生菜，日日生财', 50, 3);
INSERT INTO `goods` VALUES (41, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 3);
INSERT INTO `goods` VALUES (42, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 3);
INSERT INTO `goods` VALUES (43, '满天星', '/picture/1-1.jpg', '/picture/1-2.jpg', '/picture/1-3.jpg', 88, '满天星的花语主要有守望爱情和甘愿做配角，只愿在你身边，也代表着思念、关心和爱护。它的花朵小而浓密，像是天上的星星一样，通常清雅的人比较喜欢。因为它不绚丽也不张扬，却有着浪漫，清纯的意思。不同颜色的满天星有着不同的花语。用满天星来表白很不错，是默默付出的爱。当然，也很适合送给自己的恋人和亲友。', 50, 4);
INSERT INTO `goods` VALUES (44, '白玫瑰', '/picture/2-1.jpg', '/picture/2-2.jpg', '/picture/2-3.jpg', 99, '骄傲玫瑰简直就是白玫瑰的天花板，和名字完美匹配，奶油白色系，有点白月光的感觉，真的“高冷”又“温柔”，是女神花没错了，确实值得骄傲。相较于坦尼克、白雪山，骄傲玫瑰花瓣更厚实一点，花型也是优雅的杯状，开放后花瓣张度更乖巧，腰形明显，底盘更圆滑，瓣色白更通透。骄傲玫瑰拥有比其他白玫瑰更加持久的花期，带有淡淡香气。', 50, 4);
INSERT INTO `goods` VALUES (45, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 4);
INSERT INTO `goods` VALUES (46, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 4);
INSERT INTO `goods` VALUES (47, '向日葵', '/picture/5-1.jpg', '/picture/5-2.jpg', '/picture/5-3.jpg', 89, '向日葵的花语是信念、光辉、高傲、忠诚、爱慕，向日葵的寓意是沉默的爱，向日葵代表着勇敢地去追求自己想要的幸福。', 50, 4);
INSERT INTO `goods` VALUES (48, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 4);
INSERT INTO `goods` VALUES (49, '绣球', '/picture/7-1.jpg', '/picture/7-2.jpg', '/picture/7-3.jpg', 88, '绣球花圆形的花朵、美丽的姿态象征着与亲人之间斩不断的联系，无论分开多久，都会重新相聚在一起，寓意热情、团聚、幸福、快乐。', 50, 4);
INSERT INTO `goods` VALUES (50, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 4);
INSERT INTO `goods` VALUES (51, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 4);
INSERT INTO `goods` VALUES (52, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 4);
INSERT INTO `goods` VALUES (53, '芍药', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 78, '情有所钟的爱、依依不舍、美丽动人。芍药花是一种爱情之花，在七夕节当天，心有所属的青年男女就会将芍药花在聚会分别的时候送给对方，所以芍药也有“将离草”的别名，象征着爱情和友谊。', 50, 4);
INSERT INTO `goods` VALUES (54, '生菜花', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 88, '赠与生菜，日日生财', 50, 4);
INSERT INTO `goods` VALUES (55, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 4);
INSERT INTO `goods` VALUES (56, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 4);
INSERT INTO `goods` VALUES (57, '满天星', '/picture/1-1.jpg', '/picture/1-2.jpg', '/picture/1-3.jpg', 88, '满天星的花语主要有守望爱情和甘愿做配角，只愿在你身边，也代表着思念、关心和爱护。它的花朵小而浓密，像是天上的星星一样，通常清雅的人比较喜欢。因为它不绚丽也不张扬，却有着浪漫，清纯的意思。不同颜色的满天星有着不同的花语。用满天星来表白很不错，是默默付出的爱。当然，也很适合送给自己的恋人和亲友。', 50, 5);
INSERT INTO `goods` VALUES (58, '白玫瑰', '/picture/2-1.jpg', '/picture/2-2.jpg', '/picture/2-3.jpg', 99, '骄傲玫瑰简直就是白玫瑰的天花板，和名字完美匹配，奶油白色系，有点白月光的感觉，真的“高冷”又“温柔”，是女神花没错了，确实值得骄傲。相较于坦尼克、白雪山，骄傲玫瑰花瓣更厚实一点，花型也是优雅的杯状，开放后花瓣张度更乖巧，腰形明显，底盘更圆滑，瓣色白更通透。骄傲玫瑰拥有比其他白玫瑰更加持久的花期，带有淡淡香气。', 50, 5);
INSERT INTO `goods` VALUES (59, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 5);
INSERT INTO `goods` VALUES (60, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 5);
INSERT INTO `goods` VALUES (61, '向日葵', '/picture/5-1.jpg', '/picture/5-2.jpg', '/picture/5-3.jpg', 89, '向日葵的花语是信念、光辉、高傲、忠诚、爱慕，向日葵的寓意是沉默的爱，向日葵代表着勇敢地去追求自己想要的幸福。', 50, 5);
INSERT INTO `goods` VALUES (62, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 5);
INSERT INTO `goods` VALUES (63, '绣球', '/picture/7-1.jpg', '/picture/7-2.jpg', '/picture/7-3.jpg', 88, '绣球花圆形的花朵、美丽的姿态象征着与亲人之间斩不断的联系，无论分开多久，都会重新相聚在一起，寓意热情、团聚、幸福、快乐。', 50, 5);
INSERT INTO `goods` VALUES (64, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 5);
INSERT INTO `goods` VALUES (65, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 5);
INSERT INTO `goods` VALUES (66, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 5);
INSERT INTO `goods` VALUES (67, '芍药', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 78, '情有所钟的爱、依依不舍、美丽动人。芍药花是一种爱情之花，在七夕节当天，心有所属的青年男女就会将芍药花在聚会分别的时候送给对方，所以芍药也有“将离草”的别名，象征着爱情和友谊。', 50, 5);
INSERT INTO `goods` VALUES (68, '生菜花', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 88, '赠与生菜，日日生财', 50, 5);
INSERT INTO `goods` VALUES (69, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 5);
INSERT INTO `goods` VALUES (70, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 5);
INSERT INTO `goods` VALUES (71, '满天星', '/picture/1-1.jpg', '/picture/1-2.jpg', '/picture/1-3.jpg', 88, '满天星的花语主要有守望爱情和甘愿做配角，只愿在你身边，也代表着思念、关心和爱护。它的花朵小而浓密，像是天上的星星一样，通常清雅的人比较喜欢。因为它不绚丽也不张扬，却有着浪漫，清纯的意思。不同颜色的满天星有着不同的花语。用满天星来表白很不错，是默默付出的爱。当然，也很适合送给自己的恋人和亲友。', 50, 6);
INSERT INTO `goods` VALUES (72, '白玫瑰', '/picture/2-1.jpg', '/picture/2-2.jpg', '/picture/2-3.jpg', 99, '骄傲玫瑰简直就是白玫瑰的天花板，和名字完美匹配，奶油白色系，有点白月光的感觉，真的“高冷”又“温柔”，是女神花没错了，确实值得骄傲。相较于坦尼克、白雪山，骄傲玫瑰花瓣更厚实一点，花型也是优雅的杯状，开放后花瓣张度更乖巧，腰形明显，底盘更圆滑，瓣色白更通透。骄傲玫瑰拥有比其他白玫瑰更加持久的花期，带有淡淡香气。', 50, 6);
INSERT INTO `goods` VALUES (73, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 6);
INSERT INTO `goods` VALUES (74, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 6);
INSERT INTO `goods` VALUES (75, '向日葵', '/picture/5-1.jpg', '/picture/5-2.jpg', '/picture/5-3.jpg', 89, '向日葵的花语是信念、光辉、高傲、忠诚、爱慕，向日葵的寓意是沉默的爱，向日葵代表着勇敢地去追求自己想要的幸福。', 50, 6);
INSERT INTO `goods` VALUES (76, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 6);
INSERT INTO `goods` VALUES (77, '绣球', '/picture/7-1.jpg', '/picture/7-2.jpg', '/picture/7-3.jpg', 88, '绣球花圆形的花朵、美丽的姿态象征着与亲人之间斩不断的联系，无论分开多久，都会重新相聚在一起，寓意热情、团聚、幸福、快乐。', 50, 6);
INSERT INTO `goods` VALUES (78, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 6);
INSERT INTO `goods` VALUES (79, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 6);
INSERT INTO `goods` VALUES (80, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 6);
INSERT INTO `goods` VALUES (81, '芍药', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 78, '情有所钟的爱、依依不舍、美丽动人。芍药花是一种爱情之花，在七夕节当天，心有所属的青年男女就会将芍药花在聚会分别的时候送给对方，所以芍药也有“将离草”的别名，象征着爱情和友谊。', 50, 6);
INSERT INTO `goods` VALUES (82, '生菜花', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 88, '赠与生菜，日日生财', 50, 6);
INSERT INTO `goods` VALUES (83, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 6);
INSERT INTO `goods` VALUES (84, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 6);
INSERT INTO `goods` VALUES (85, '满天星', '/picture/1-1.jpg', '/picture/1-2.jpg', '/picture/1-3.jpg', 88, '满天星的花语主要有守望爱情和甘愿做配角，只愿在你身边，也代表着思念、关心和爱护。它的花朵小而浓密，像是天上的星星一样，通常清雅的人比较喜欢。因为它不绚丽也不张扬，却有着浪漫，清纯的意思。不同颜色的满天星有着不同的花语。用满天星来表白很不错，是默默付出的爱。当然，也很适合送给自己的恋人和亲友。', 50, 7);
INSERT INTO `goods` VALUES (86, '白玫瑰', '/picture/2-1.jpg', '/picture/2-2.jpg', '/picture/2-3.jpg', 99, '骄傲玫瑰简直就是白玫瑰的天花板，和名字完美匹配，奶油白色系，有点白月光的感觉，真的“高冷”又“温柔”，是女神花没错了，确实值得骄傲。相较于坦尼克、白雪山，骄傲玫瑰花瓣更厚实一点，花型也是优雅的杯状，开放后花瓣张度更乖巧，腰形明显，底盘更圆滑，瓣色白更通透。骄傲玫瑰拥有比其他白玫瑰更加持久的花期，带有淡淡香气。', 50, 7);
INSERT INTO `goods` VALUES (87, '洋桔梗', '/picture/3-1.jpg', '/picture/3-2.jpg', '/picture/3-3.jpg', 98, '我喜欢你，你喜欢花，但是玫瑰有刺我怕伤了你的手，所以我带了洋桔梗，永恒不变的爱是我喜欢你的诚意，没有刺的玫瑰！', 50, 7);
INSERT INTO `goods` VALUES (88, '洋甘菊', '/picture/4-1.jpg', '/picture/4-2.jpg', '/picture/4-3.jpg', 68, '洋甘菊也被称为“月亮之花”传说它的诞生跟月亮女神狄安娜有关。罗马神话中，月亮女神狄安娜爱上了牧羊人恩德里奥，于是温柔含蓄的月亮女神便在晚上让漫山遍野开满了洋甘菊，使得牧羊人在温柔的香味中安然入睡，月亮女神来到他身边，与他在梦中共度良宵。', 50, 7);
INSERT INTO `goods` VALUES (89, '向日葵', '/picture/5-1.jpg', '/picture/5-2.jpg', '/picture/5-3.jpg', 89, '向日葵的花语是信念、光辉、高傲、忠诚、爱慕，向日葵的寓意是沉默的爱，向日葵代表着勇敢地去追求自己想要的幸福。', 50, 7);
INSERT INTO `goods` VALUES (90, '红玫瑰', '/picture/6-1.jpg', '/picture/6-2.jpg', '/picture/6-3.jpg', 88, '红玫瑰，那抹炽热的红，自古至今，一直是爱情、热情与浪漫的代名词。在西方文化的长河中，红玫瑰被赋予了爱情的象征，尤其是那令人心动的浪漫之爱。这一花语的渊源，可追溯至古希腊与罗马的神话，红玫瑰与爱神维纳斯和阿芙罗狄蒂的传说紧密相连。', 50, 7);
INSERT INTO `goods` VALUES (91, '绣球', '/picture/7-1.jpg', '/picture/7-2.jpg', '/picture/7-3.jpg', 88, '绣球花圆形的花朵、美丽的姿态象征着与亲人之间斩不断的联系，无论分开多久，都会重新相聚在一起，寓意热情、团聚、幸福、快乐。', 50, 7);
INSERT INTO `goods` VALUES (92, '茉莉花', '/picture/8-1.jpg', '/picture/8-2.jpg', '/picture/8-3.jpg', 99, '茉莉花最为常见的颜色是白色的，白色茉莉花语为亲切、喜爱、热爱。紫色的茉莉花花语为猜忌、成熟美、胆小，此种茉莉花并不适合送人。还有鸳鸯茉莉。它的花语寓意为爱我、见异思迁。因为鸳鸯茉莉是一个枝条上长出一朵白色和一朵紫色的茉莉花，所以得此花语寓意的。', 50, 7);
INSERT INTO `goods` VALUES (93, '康乃馨', '/picture/9-1.jpg', '/picture/9-2.jpg', '/picture/9-3.jpg', 98, '康乃馨是母亲之花，可用来表达不求回报的母爱，寓意是很美好的。可以送给尊敬爱戴的女性，代表自已的深深的祝福。', 50, 7);
INSERT INTO `goods` VALUES (94, '山茶花', '/picture/10-1.jpg', '/picture/10-2.jpg', '/picture/10-3.jpg', 68, '花朵在开放时，如同雪一样的洁白，能给人一种天真无邪的感觉。适合将白色山茶花赠予给相恋许久的爱人，寓意着对她的爱意真挚而又诚恳，也预示着在你心中她就像白色山茶花一样美丽大方。', 50, 7);
INSERT INTO `goods` VALUES (95, '芍药', '/picture/11-1.jpg', '/picture/11-2.jpg', '/picture/11-3.jpg', 78, '情有所钟的爱、依依不舍、美丽动人。芍药花是一种爱情之花，在七夕节当天，心有所属的青年男女就会将芍药花在聚会分别的时候送给对方，所以芍药也有“将离草”的别名，象征着爱情和友谊。', 50, 7);
INSERT INTO `goods` VALUES (96, '生菜花', '/picture/12-1.jpg', '/picture/12-2.jpg', '/picture/12-3.jpg', 88, '赠与生菜，日日生财', 50, 7);
INSERT INTO `goods` VALUES (97, '郁金香', '/picture/13-1.jpg', '/picture/13-2.jpg', '/picture/13-3.jpg', 98, '粉色郁金香也象征着祝福和希望，其柔和色彩和美丽的花形呈现出一种希望和新的开始的感觉，传达出对未来美好的祝福和期盼', 50, 7);
INSERT INTO `goods` VALUES (98, '蝴蝶兰', '/picture/14-1.jpg', '/picture/14-2.jpg', '/picture/14-3.jpg', 68, '蝴蝶兰的花语是“幸福已来临、爱情长久”。它象征着幸福、美满的爱情生活，寓意着两人携手共度美好时光。同时，蝴蝶兰还象征着高贵、优雅、纯洁，具有很高的观赏价值。', 50, 7);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float NULL DEFAULT NULL,
  `amount` int(6) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `paytype` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (2, 98, 1, 3, 1, 'angel', '12345678910', '中华人民共和国', '2025-05-15 13:21:41', 2);
INSERT INTO `order` VALUES (4, 98, 1, 3, 1, '拾春', '12345678910', '中华人民共和国', '2025-05-27 01:23:45', 1);
INSERT INTO `order` VALUES (6, 99, 1, 4, 1, '拾春', '12345678910', '广州市从化区', '2025-06-17 03:11:26', 40);
INSERT INTO `order` VALUES (17, 98, 1, 1, 1, 'angel', '17810853674', '中华人民共和国', '2025-06-25 02:04:14', 2);
INSERT INTO `order` VALUES (18, 98, 1, 1, 1, 'angel', '17810853674', '中华人民共和国', '2025-06-25 02:13:01', 2);
INSERT INTO `order` VALUES (19, 98, 1, 4, 1, '拾春', '12345678911', '中华人民共和国', '2025-06-25 06:36:32', 1);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_id_idx`(`order_id`) USING BTREE,
  INDEX `fk_orderitem_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (2, 98, 1, 13, 2);
INSERT INTO `orderitem` VALUES (4, 98, 1, 13, 4);
INSERT INTO `orderitem` VALUES (13, 98, 1, 13, 17);
INSERT INTO `orderitem` VALUES (14, 98, 1, 13, 18);
INSERT INTO `orderitem` VALUES (15, 98, 1, 13, 19);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_goods_id_idx`(`goods_id`) USING BTREE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (65, 1, 3);
INSERT INTO `recommend` VALUES (67, 3, 3);
INSERT INTO `recommend` VALUES (69, 1, 8);
INSERT INTO `recommend` VALUES (70, 2, 8);
INSERT INTO `recommend` VALUES (71, 3, 8);
INSERT INTO `recommend` VALUES (72, 1, 10);
INSERT INTO `recommend` VALUES (73, 2, 10);
INSERT INTO `recommend` VALUES (74, 3, 10);
INSERT INTO `recommend` VALUES (75, 1, 13);
INSERT INTO `recommend` VALUES (76, 2, 13);
INSERT INTO `recommend` VALUES (77, 3, 13);
INSERT INTO `recommend` VALUES (78, 3, 9);
INSERT INTO `recommend` VALUES (79, 2, 9);
INSERT INTO `recommend` VALUES (84, 2, 14);
INSERT INTO `recommend` VALUES (85, 3, 14);
INSERT INTO `recommend` VALUES (87, 3, 16);
INSERT INTO `recommend` VALUES (88, 2, 16);
INSERT INTO `recommend` VALUES (89, 3, 15);
INSERT INTO `recommend` VALUES (91, 3, 6);
INSERT INTO `recommend` VALUES (101, 1, 9);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '情定永恒');
INSERT INTO `type` VALUES (2, '生辰绮彩');
INSERT INTO `type` VALUES (3, '繁花映爱');
INSERT INTO `type` VALUES (4, '逐梦飞扬');
INSERT INTO `type` VALUES (5, '新居雅韵');
INSERT INTO `type` VALUES (6, '瑞启新程');
INSERT INTO `type` VALUES (7, '节日限定');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isadmin` bit(1) NULL DEFAULT NULL,
  `isvalidate` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  UNIQUE INDEX `email_UNIQUE`(`userphone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '11111111111', 'admin', '拾春', '12345678911', '中华人民共和国', b'1', b'0');
INSERT INTO `user` VALUES (2, 'angel', '11111111112', '123456', 'angel', '17810853674', '中华人民共和国', b'0', b'0');
INSERT INTO `user` VALUES (40, '123456', '12345678910', 'Aa123456', NULL, NULL, NULL, b'0', b'0');
INSERT INTO `user` VALUES (41, '456789', '12345678911', 'Aa123456', '', '', '', b'0', b'0');
INSERT INTO `user` VALUES (44, '123321', '12345665411', '123456', '蕉太狼', '12345678910', '广州市从化区', b'0', b'0');
INSERT INTO `user` VALUES (49, 'admin1', '13800138000', 'Aa123456', NULL, NULL, NULL, b'0', b'0');

SET FOREIGN_KEY_CHECKS = 1;
