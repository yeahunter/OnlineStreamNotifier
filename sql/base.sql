CREATE TABLE `Channels` (
	`ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(75) NOT NULL COMMENT 'TwitchTV csatornanev' COLLATE 'utf8_unicode_ci',
	`Online` TINYINT(2) NOT NULL DEFAULT '0' COMMENT 'Status: 0 - Offline, 1 - Online',
	`Inserted` DATETIME NOT NULL COMMENT 'Ekkor kerult be a tablaba',
	`Updated` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Ekkor frissult a tablaban, ha Online',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `Name` (`Name`)
)
COMMENT='TwitchTV csatornai, akiket az OSN felhasznalok kovetnek.'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
;

