USE `essentialmode`;
-- Fixed by Dmaskell92

ALTER TABLE `users` DROP COLUMN IF EXISTS phone_number;
ALTER TABLE `users` ADD COLUMN `phone_number` VARCHAR(10) NULL;
ALTER TABLE `users` DROP COLUMN IF EXISTS crypto;
ALTER TABLE `users` ADD COLUMN `crypto` VARCHAR(255) NOT NULL DEFAULT '{"bitcoin": 0, "ethereum": 0, "bitcoin-cash": 0, "bitcoin-sv": 0, "litecoin": 0, "binance-coin": 0, "monero": 0, "dash": 0, "zcash": 0, "maker": 0}';

DROP TABLE IF EXISTS `crew_phone_bank`;
CREATE TABLE IF NOT EXISTS `crew_phone_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `crew_phone_news`;
CREATE TABLE IF NOT EXISTS `crew_phone_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT '',
  `num` varchar(10) NOT NULL COMMENT '',
  `incoming` int(11) NOT NULL COMMENT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16291 DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45219 DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=992 DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `yellowpages_posts`;
DROP TABLE IF EXISTS `twitter_likes`;
DROP TABLE IF EXISTS `twitter_tweets`;
DROP TABLE IF EXISTS `twitter_accounts`;

CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1624 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10712 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `yellowpages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_yellowpages_posts_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_yellowpages_posts_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

DELETE FROM items WHERE name='blue_phone';
DELETE FROM items WHERE name='white_phone';
DELETE FROM items WHERE name='green_phone';
DELETE FROM items WHERE name = 'icetea';
DELETE FROM items WHERE name = 'chocolate';
DELETE FROM items WHERE name = 'kulahdondurma';
DELETE FROM items WHERE name = 'sprunk';
DELETE FROM items WHERE name = 'bandage';
DELETE FROM items WHERE name = 'cheeseburger';
DELETE FROM items WHERE name = 'doublecheeseburger';
DELETE FROM items WHERE name = 'hamburger';
DELETE FROM items WHERE name = 'megaburger';
DELETE FROM items WHERE name = 'megaxhamburger';
DELETE FROM items WHERE name = 'milkshake';
DELETE FROM items WHERE name = 'soda';
DELETE FROM items WHERE name = 'cola';
DELETE FROM items WHERE name = 'sosisli';
DELETE FROM items WHERE name = 'pizza';
DELETE FROM items WHERE name = 'tavuksoganhalkasi';
DELETE FROM items WHERE name = 'tavuknuggets';
DELETE FROM items WHERE name = 'raki';
DELETE FROM items WHERE name = 'whitewine';
DELETE FROM items WHERE name = 'kofte';
DELETE FROM items WHERE name = 'fixkit';
DELETE FROM items WHERE name = 'dopebag';
DELETE FROM items WHERE name = 'cupkek';
DELETE FROM items WHERE name = 'pankek';
DELETE FROM items WHERE name = 'beer';
DELETE FROM items WHERE name = 'umbrella';
  
  INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`) VALUES
  ('blue_phone', 'Blue Phone', 1, 10, 0, 1),
  ('green_phone', 'Green Phone', 1, 10, 0, 1),
  ('white_phone', 'White Phone', 1, 10, 0, 1),
  ('icetea', 'Iced Tea', 1, 10, 0, 1),
  ('chocolate', 'Chocolate', 1, 10, 0, 1),
  ('kulahdondurma', 'Drumstick', 1, 10, 0, 1),
  ('sprunk', 'Sprunk', 1, 10, 0, 1),
  ('bandage', 'Bandage', 1, 20, 0, 1),
  ('cheeseburger', 'Cheeseburger', 1, 10, 0, 1),
  ('doublecheeseburger', 'Double Cheeseburger', 2, 10, 0, 1),
  ('hamburger', 'Hamburger', 1, 10, 0, 1),
  ('megaburger', 'Double Hamburger', 2, 10, 0, 1),
  ('megaxhamburger', 'Bacon Cheeseburger', 1, 10, 0, 1),
  ('milkshake', 'Milkshake', 1, 10, 0, 1),
  ('soda', 'Seltzer', 1, 10, 0, 1),
  ('cola', 'Cola', 1, 10, 0, 1),
  ('sosisli', 'Hot Dog', 1, 10, 0, 1),
  ('pizza', 'Pizza', 2, 10, 0, 1),
  ('tavuksoganhalkasi', 'Onion Rings', 1, 10, 0, 1),
  ('tavuknuggets', 'Chicken Nuggets', 1, 10, 0, 1),
  ('raki', 'Vodka', 1, 10, 0, 1),
  ('whitewine', 'White Wine', 1, 10, 0, 1),
  ('kofte', 'Coffee', 1, 10, 0, 1),
  ('fixkit', 'Repair Kit', 5, 10, 0, 1),
  ('dopebag', 'Medical Marijuana', 1, 10, 0, 1),
  ('cupkek', 'Cupcake', 1, 10, 0, 1),
  ('pankek', 'Pancake', 1, 10, 0, 1),
  ('beer', 'Beer', 1, 10, 0, 1),
  ('umbrella', 'Umbrella', 1, 10, 0, 1);

DELETE FROM shops WHERE item = 'icetea';
DELETE FROM shops WHERE item = 'chocolate';
DELETE FROM shops WHERE item = 'kulahdondurma';
DELETE FROM shops WHERE item = 'sprunk';
DELETE FROM shops WHERE item = 'bandage';
DELETE FROM shops WHERE item = 'cheeseburger';
DELETE FROM shops WHERE item = 'doublecheeseburger';
DELETE FROM shops WHERE item = 'hamburger';
DELETE FROM shops WHERE item = 'megaburger';
DELETE FROM shops WHERE item = 'megaxhamburger';
DELETE FROM shops WHERE item = 'milkshake';
DELETE FROM shops WHERE item = 'soda';
DELETE FROM shops WHERE item = 'cola';
DELETE FROM shops WHERE item = 'sosisli';
DELETE FROM shops WHERE item = 'pizza';
DELETE FROM shops WHERE item = 'tavuksoganhalkasi';
DELETE FROM shops WHERE item = 'tavuknuggets';
DELETE FROM shops WHERE item = 'raki';
DELETE FROM shops WHERE item = 'whitewine';
DELETE FROM shops WHERE item = 'kofte';
DELETE FROM shops WHERE item = 'fixkit';
DELETE FROM shops WHERE item = 'dopebag';
DELETE FROM shops WHERE item = 'cupkek';
DELETE FROM shops WHERE item = 'pankek';
DELETE FROM shops WHERE item = 'beer';
DELETE FROM shops WHERE item = 'umbrella';
DELETE FROM shops WHERE item = 'blue_phone';
DELETE FROM shops WHERE item = 'white_phone';
DELETE FROM shops WHERE item = 'green_phone';

INSERT INTO `shops` (`store`, `item`, `price`) VALUES
  ('LTDgasoline', 'blue_phone', 200),
  ('RobsLiquor', 'blue_phone', 200),
  ('TwentyFourSeven', 'blue_phone', 200),
  ('LTDgasoline', 'white_phone', 200),
  ('RobsLiquor', 'white_phone', 200),
  ('TwentyFourSeven', 'white_phone', 200),
  ('LTDgasoline', 'green_phone', 200),
  ('RobsLiquor', 'green_phone', 200),
  ('TwentyFourSeven', 'green_phone', 200),
  ('LTDgasoline', 'icetea', 15),
  ('RobsLiquor', 'icetea', 15),
  ('TwentyFourSeven', 'icetea', 15),
  ('LTDgasoline', 'chocolate', 10),
  ('RobsLiquor', 'chocolate', 10),
  ('TwentyFourSeven', 'chocolate', 10),
  ('LTDgasoline', 'kulahdondurma', 10),
  ('RobsLiquor', 'kulahdondurma', 10),
  ('TwentyFourSeven', 'kulahdondurma', 10),
  ('LTDgasoline', 'sprunk', 15),
  ('RobsLiquor', 'sprunk', 15),
  ('TwentyFourSeven', 'sprunk', 15),
  ('LTDgasoline', 'bandage', 1000),
  ('RobsLiquor', 'bandage', 1000),
  ('TwentyFourSeven', 'bandage', 1000),
  ('LTDgasoline', 'cheeseburger', 10),
  ('RobsLiquor', 'cheeseburger', 10),
  ('TwentyFourSeven', 'cheeseburger', 10),
  ('LTDgasoline', 'doublecheeseburger', 15),
  ('RobsLiquor', 'doublecheeseburger', 15),
  ('TwentyFourSeven', 'doublecheeseburger', 15),
  ('LTDgasoline', 'hamburger', 10),
  ('RobsLiquor', 'hamburger', 10),
  ('TwentyFourSeven', 'hamburger', 10),
  ('LTDgasoline', 'megaburger', 15),
  ('RobsLiquor', 'megaburger', 15),
  ('TwentyFourSeven', 'megaburger', 15),
  ('LTDgasoline', 'milkshake', 20),
  ('RobsLiquor', 'milkshake', 20),
  ('TwentyFourSeven', 'milkshake', 20),
  ('LTDgasoline', 'soda', 15),
  ('RobsLiquor', 'soda', 15),
  ('TwentyFourSeven', 'soda', 15),
  ('LTDgasoline', 'cola', 15),
  ('RobsLiquor', 'cola', 15),
  ('TwentyFourSeven', 'cola', 15),
  ('LTDgasoline', 'sosisli', 10),
  ('RobsLiquor', 'sosisli', 10),
  ('TwentyFourSeven', 'sosisli', 10),
  ('LTDgasoline', 'pizza', 15),
  ('RobsLiquor', 'pizza', 15),
  ('TwentyFourSeven', 'pizza', 15),
  ('LTDgasoline', 'tavuksoganhalkasi', 15),
  ('RobsLiquor', 'tavuksoganhalkasi', 15),
  ('TwentyFourSeven', 'tavuksoganhalkasi', 15),
  ('LTDgasoline', 'tavuknuggets', 15),
  ('RobsLiquor', 'tavuknuggets', 15),
  ('TwentyFourSeven', 'tavuknuggets', 15),
  ('LTDgasoline', 'raki', 100),
  ('RobsLiquor', 'raki', 100),
  ('TwentyFourSeven', 'raki', 100),
  ('LTDgasoline', 'whitewine', 150),
  ('RobsLiquor', 'whitewine', 150),
  ('TwentyFourSeven', 'whitewine', 150),
  ('LTDgasoline', 'kofte', 15),
  ('RobsLiquor', 'kofte', 15),
  ('TwentyFourSeven', 'kofte', 15),
  ('LTDgasoline', 'fixkit', 1000),
  ('RobsLiquor', 'fixkit', 1000),
  ('TwentyFourSeven', 'fixkit', 1000),
  ('LTDgasoline', 'dopebag', 10),
  ('RobsLiquor', 'dopebag', 10),
  ('TwentyFourSeven', 'dopebag', 10),
  ('LTDgasoline', 'cupkek', 5),
  ('RobsLiquor', 'cupkek', 5),
  ('TwentyFourSeven', 'cupkek', 5),
  ('LTDgasoline', 'pankek', 10),
  ('RobsLiquor', 'pankek', 10),
  ('TwentyFourSeven', 'pankek', 10),
  ('LTDgasoline', 'beer', 50),
  ('RobsLiquor', 'beer', 50),
  ('TwentyFourSeven', 'beer', 50),
  ('LTDgasoline', 'umbrella', 500),
  ('RobsLiquor', 'umbrella', 500),
  ('TwentyFourSeven', 'umbrella', 500),
  ('LTDgasoline', 'megaxhamburger', 10),
  ('RobsLiquor', 'megaxhamburger', 10),
  ('TwentyFourSeven', 'megaxhamburger', 10);
  
  DELETE FROM jobs WHERE name = 'reporter';
  DELETE FROM job_grades WHERE job_name = 'reporter';
  
  INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
  ('reporter', 'Reportero', 0);
  
  INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
  ('reporter', 0, 'employee', 'Empleado', 1000, '{}', '{}'),
  ('reporter', 1, 'boss', 'Jefe', 1500, '{}', '{}');