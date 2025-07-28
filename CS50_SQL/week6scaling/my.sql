-- ls
SHOW DATABASES;

-- code mbta.db
-- sqlite3 mbta.db
CREATE DATABASE `mbta`;

-- sqlite3 mbta.db
USE `mbta`

-- .tables
SHOW TABLES;

-- .schema
DESCRIBE `cards`;

-- Data Types
-- Integer = [ TINYINT , SMALLINT , MEDIUMINT , INT , BIGINT ]
-- Real    = [ FLOAT , DOUBLE PRECISION , DECMIAL(digits, precision) ] 
-- String  = [ CHAR(fixed) , VARCHAR(max) ] , [ TINYTEXT , TEXT , MEDIUMTEXT , LONGTEXT ]
-- Boolean = [ BLOB ]
-- List    = [ ENUM , SET ]
-- Time    = [ DATE , TIME(fsp) , DATETIME(fsp) , TIMESTAMP(fsp) , YEAR ] 

-- CREATE
CREATE TABLE `cards` (
    `id` INT AUTO_INCREMENT,
    PRIMARY KEY(`id`)
);

CREATE TABLE `stations` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `line` ENUM('blue', 'green', 'orange', 'red') NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `swipes` (
    `id` INT AUTO_INCREMENT,
    `card_id` INT,
    `station_id` INT,
    `type` ENUM('enter', 'exit', 'deposit') NOT NULL,
    `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(5,2) NOT NULL CHECK(`amount` != 0),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`card_id`) REFERENCES `cards`(`id`),
    FOREIGN KEY(`station_id`) REFERENCES `stations`(`id`)
);

CREATE TABLE `transactions` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(64) NOT NULL,
    `action` ENUM('bought', 'sold') NOT NULL,
    PRIMARY KEY(`id`)
);

-- UPDATE
ALTER TABLE `stations`
MODIFY `line` ENUM('blue', 'green', 'orange', 'red', 'silver') NOT NULL;

ALTER TABLE `collections`
ADD COLUMN `deleted` TINYINT DEFAULT 0;

-- Stored Procedures
-- Views and Triggers
delimiter //
CREATE PROCEDURE `current_collections`()
BEGIN
    SELECT `title`, `accession_number`, `acquired`
    FROM `collections`
    WHERE `deleted` = 0;
END //
delimiter ;

CALL `current_collections`();

UPDATE `collections`
SET `deleted` = 1
WHERE `title` = 'Farmers working at dawn';

delimiter // 
CREATE PROCEDURE `sell`(IN `sold_id` INT) BEGIN
UPDATE `collections`
SET `deleted` = 1
WHERE `id` = `sold_id`;
INSERT INTO `transactions` (`title`, `action`)
VALUES (
        (
            SELECT `title`
            FROM `collections`
            WHERE `id` = `sold_id`
        ),
        'sold'
    );
END //

CALL `sell`(2);