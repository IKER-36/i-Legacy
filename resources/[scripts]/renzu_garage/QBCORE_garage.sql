ALTER TABLE player_vehicles
ADD impound int(1) NOT NULL DEFAULT 0;

ALTER TABLE player_vehicles
ADD `type` varchar(32) NOT NULL DEFAULT 'car';

ALTER TABLE player_vehicles
ADD `job` varchar(32) NOT NULL DEFAULT 'civ';

ALTER TABLE player_vehicles
ADD park_coord LONGTEXT NULL;

ALTER TABLE player_vehicles
ADD isparked int(1) NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS `impound_garage` (
	`garage` VARCHAR(64) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
    	`data` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`garage`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `private_garage` (
	`identifier` VARCHAR(64) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `vehicles` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	`garage` VARCHAR(64) NULL COLLATE 'utf8mb4_general_ci',
	`inventory` LONGTEXT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `parking_meter` (
	`identifier` VARCHAR(64) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`plate` VARCHAR(32) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `vehicle` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	`coord` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	`park_coord` LONGTEXT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `garagekeys` (
	`identifier` VARCHAR(64) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`keys` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `vehiclekeys` (
	`plate` VARCHAR(64) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`keys` LONGTEXT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`plate`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;