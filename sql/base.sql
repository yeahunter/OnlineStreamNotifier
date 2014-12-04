CREATE TABLE `Channels` (
	`ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(75) NOT NULL COMMENT 'TwitchTV csatornanev' COLLATE 'utf8_unicode_ci',
	`Status` TINYINT(2) NOT NULL DEFAULT '0' COMMENT '0 - Offline, 1 - Online',
	`Inserted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ekkor kerult be a tablaba',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `Name` (`Name`)
)
COMMENT='TwitchTV csatornai, akiket az OSN felhasznalok kovetnek.'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

CREATE TRIGGER `Channels_update` AFTER UPDATE ON `Channels` FOR EACH ROW BEGIN
	-- Ha modosul a Status, akkor egy uj sor kerul be a LogStatus tablaba
	IF OLD.`Status` <> NEW.`Status` THEN
		INSERT INTO `LogStatus` (`ChannelID`, `Updated`, `Status`) VALUES (NEW.`ID`, NOW(), NEW.`Status`);
	END IF;
END;

CREATE TABLE `LogStatus` (
	`ChannelID` INT UNSIGNED NOT NULL COMMENT 'Channels tabla ID property-je',
	`Updated` DATETIME NOT NULL COMMENT 'Ha a Status 1, akkor a stream kezdetet mutatja, ha a Status 0, akkor ert veget a stream',
	`Status` TINYINT(2) NOT NULL COMMENT '0 - Offline, 1 - Online',
	PRIMARY KEY (`ChannelID`, `Updated`),
	CONSTRAINT `Channels-LogStatus` FOREIGN KEY (`ChannelID`) REFERENCES `Channels` (`ID`) ON UPDATE CASCADE ON DELETE CASCADE
)
COMMENT='Ha a Channels tablaban valakinek a Status property-je modosul, akkor bekerul egy sor ebbe a tablaba.'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
