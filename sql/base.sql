CREATE TABLE `Channels` (
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(75) NOT NULL COMMENT 'TwitchTV csatornanev',
	`Inserted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ekkor kerult be a tablaba',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `Name` (`Name`)
)
COMMENT='TwitchTV csatornai, akiket az OSN felhasznalok kovetnek.'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;