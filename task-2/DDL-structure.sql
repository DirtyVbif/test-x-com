-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.24 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.3.0.6376
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица test.goods
CREATE TABLE IF NOT EXISTS `goods` (
  `gid` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'goods id уникальный идентификатор товара',
  `artid` char(12) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'article id',
  `label` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Название товара',
  `preview` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Ссылка на изображение товара на сервере',
  `description` text COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Текстовое описание товара',
  PRIMARY KEY (`gid`),
  UNIQUE KEY `artid` (`artid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица test.goods_types
CREATE TABLE IF NOT EXISTS `goods_types` (
  `gid` smallint unsigned NOT NULL COMMENT 'goods id уникальный идентификатор товара',
  `tid` smallint unsigned NOT NULL COMMENT 'type id уникальный идентификатор типа товара',
  UNIQUE KEY `gid_tid` (`gid`,`tid`),
  KEY `fk_goods_type_id` (`tid`),
  CONSTRAINT `fk_goods_id_of_type` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_type_id` FOREIGN KEY (`tid`) REFERENCES `types` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Сопоставление товаров и типов товаров';

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица test.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `sid` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'section id уникальный идентификатор раздела',
  `label` varchar(256) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'название раздела',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Основные разделы каталога товаров';

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица test.sections_types
CREATE TABLE IF NOT EXISTS `sections_types` (
  `sid` smallint unsigned NOT NULL,
  `tid` smallint unsigned NOT NULL,
  UNIQUE KEY `sid_tid` (`sid`,`tid`),
  KEY `fk_section_types` (`tid`),
  CONSTRAINT `fk_section_id` FOREIGN KEY (`sid`) REFERENCES `sections` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_section_types` FOREIGN KEY (`tid`) REFERENCES `types` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Сопоставление типов товаров с разделами каталога';

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица test.types
CREATE TABLE IF NOT EXISTS `types` (
  `tid` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'type id уникальный идентификатор типа товара',
  `label` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Название типа товара',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Типы товаров';

-- Экспортируемые данные не выделены.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
