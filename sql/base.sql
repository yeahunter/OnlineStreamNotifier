CREATE TABLE `Channels` (
	`ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(75) NOT NULL COMMENT 'TwitchTV csatornanev' COLLATE 'utf8_unicode_ci',
	`Status` TINYINT(2) NOT NULL DEFAULT '0' COMMENT '0 - Offline, 1 - Online',
	`Inserted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ekkor kerult be a tablaba',
	`Updated` DATETIME NULL DEFAULT NULL COMMENT 'Ha a Status 1, akkor a stream kezdetet mutatja, ha a Status 0, akkor ert veget a stream',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `Name` (`Name`)
)
COMMENT='TwitchTV csatornai, akiket az OSN felhasznalok kovetnek.'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
;
