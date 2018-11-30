ALTER TABLE `account` 
ADD COLUMN `gaddvent` INT(2) UNSIGNED NOT NULL DEFAULT '0' AFTER `total_connections`;
