-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para es_extended
CREATE DATABASE IF NOT EXISTS `es_extended` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `es_extended`;

-- Volcando estructura para tabla es_extended.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.addon_account: ~8 rows (aproximadamente)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Livret Bleu', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Banque', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Volcando estructura para tabla es_extended.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.addon_account_data: ~8 rows (aproximadamente)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'society_police', 50000000, NULL),
	(3, 'society_ambulance', 50000000, NULL),
	(4, 'society_mechanic', 50000000, NULL),
	(5, 'society_taxi', 0, NULL),
	(9, 'society_banker', 0, NULL),
	(10, 'caution', 0, 'char1:f0e176ec5a87adad3df08d798b614090645a655a'),
	(11, 'bank_savings', 0, 'char1:f0e176ec5a87adad3df08d798b614090645a655a'),
	(12, 'caution', 0, 'char1:c72291f2bfcefacb25a4c545f466189768a9b209'),
	(13, 'bank_savings', 0, 'char1:c72291f2bfcefacb25a4c545f466189768a9b209'),
	(14, 'caution', 0, 'char1:9460f7721e8516636a62801744f6daccdeb32db7'),
	(15, 'bank_savings', 0, 'char1:9460f7721e8516636a62801744f6daccdeb32db7');

-- Volcando estructura para tabla es_extended.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.addon_inventory: ~5 rows (aproximadamente)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Volcando estructura para tabla es_extended.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.addon_inventory_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.banking: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.billing: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.cardealer_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.characters_motels
CREATE TABLE IF NOT EXISTS `characters_motels` (
  `userIdentifier` varchar(50) NOT NULL,
  `motelData` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla es_extended.characters_motels: ~0 rows (aproximadamente)
INSERT INTO `characters_motels` (`userIdentifier`, `motelData`) VALUES
	('char1:f0e176ec5a87adad3df08d798b614090645a655a', '{"displayLabel":"Iker Testing","room":9,"owner":"char1:f0e176ec5a87adad3df08d798b614090645a655a","uniqueId":4654876}');

-- Volcando estructura para tabla es_extended.characters_storages
CREATE TABLE IF NOT EXISTS `characters_storages` (
  `storageId` varchar(255) NOT NULL,
  `storageData` longtext NOT NULL,
  PRIMARY KEY (`storageId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla es_extended.characters_storages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.datastore: ~9 rows (aproximadamente)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Volcando estructura para tabla es_extended.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.datastore_data: ~98 rows (aproximadamente)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(6, 'property', NULL, '{}'),
	(7, 'property', NULL, '{}'),
	(8, 'property', 'char1:f0e176ec5a87adad3df08d798b614090645a655a', '{}'),
	(9, 'user_helmet', 'char1:f0e176ec5a87adad3df08d798b614090645a655a', '{}'),
	(10, 'user_ears', 'char1:f0e176ec5a87adad3df08d798b614090645a655a', '{}'),
	(11, 'user_glasses', 'char1:f0e176ec5a87adad3df08d798b614090645a655a', '{}'),
	(12, 'user_mask', 'char1:f0e176ec5a87adad3df08d798b614090645a655a', '{}'),
	(13, 'property', NULL, '{}'),
	(14, 'property', NULL, '{}'),
	(15, 'property', NULL, '{}'),
	(16, 'property', NULL, '{}'),
	(17, 'property', NULL, '{}'),
	(18, 'property', NULL, '{}'),
	(19, 'property', NULL, '{}'),
	(20, 'property', NULL, '{}'),
	(21, 'property', NULL, '{}'),
	(22, 'property', NULL, '{}'),
	(23, 'property', NULL, '{}'),
	(24, 'property', NULL, '{}'),
	(25, 'property', NULL, '{}'),
	(26, 'property', NULL, '{}'),
	(27, 'property', NULL, '{}'),
	(28, 'property', NULL, '{}'),
	(29, 'property', NULL, '{}'),
	(30, 'property', NULL, '{}'),
	(31, 'property', NULL, '{}'),
	(32, 'property', NULL, '{}'),
	(33, 'property', NULL, '{}'),
	(34, 'property', NULL, '{}'),
	(35, 'property', NULL, '{}'),
	(36, 'property', NULL, '{}'),
	(37, 'property', NULL, '{}'),
	(38, 'property', NULL, '{}'),
	(39, 'property', NULL, '{}'),
	(40, 'property', NULL, '{}'),
	(41, 'property', NULL, '{}'),
	(42, 'property', NULL, '{}'),
	(43, 'property', NULL, '{}'),
	(44, 'property', NULL, '{}'),
	(45, 'property', NULL, '{}'),
	(46, 'property', NULL, '{}'),
	(47, 'property', NULL, '{}'),
	(48, 'property', NULL, '{}'),
	(49, 'property', NULL, '{}'),
	(50, 'property', NULL, '{}'),
	(51, 'property', NULL, '{}'),
	(52, 'property', NULL, '{}'),
	(53, 'property', NULL, '{}'),
	(54, 'property', NULL, '{}'),
	(55, 'property', NULL, '{}'),
	(56, 'property', NULL, '{}'),
	(57, 'property', NULL, '{}'),
	(58, 'property', NULL, '{}'),
	(59, 'property', NULL, '{}'),
	(60, 'property', NULL, '{}'),
	(61, 'property', NULL, '{}'),
	(62, 'property', NULL, '{}'),
	(63, 'property', NULL, '{}'),
	(64, 'property', NULL, '{}'),
	(65, 'property', NULL, '{}'),
	(66, 'property', NULL, '{}'),
	(67, 'property', NULL, '{}'),
	(68, 'property', NULL, '{}'),
	(69, 'property', NULL, '{}'),
	(70, 'property', NULL, '{}'),
	(71, 'property', NULL, '{}'),
	(72, 'property', NULL, '{}'),
	(73, 'property', NULL, '{}'),
	(74, 'property', NULL, '{}'),
	(75, 'property', NULL, '{}'),
	(76, 'property', NULL, '{}'),
	(77, 'property', NULL, '{}'),
	(78, 'property', NULL, '{}'),
	(79, 'property', NULL, '{}'),
	(80, 'property', NULL, '{}'),
	(81, 'property', NULL, '{}'),
	(82, 'property', NULL, '{}'),
	(83, 'property', NULL, '{}'),
	(84, 'property', NULL, '{}'),
	(85, 'property', NULL, '{}'),
	(86, 'property', 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', '{}'),
	(87, 'user_helmet', 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', '{}'),
	(88, 'user_ears', 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', '{}'),
	(89, 'user_glasses', 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', '{}'),
	(90, 'user_mask', 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', '{}'),
	(91, 'property', NULL, '{}'),
	(92, 'property', NULL, '{}'),
	(93, 'property', NULL, '{}'),
	(94, 'property', NULL, '{}'),
	(95, 'property', NULL, '{}'),
	(96, 'property', NULL, '{}'),
	(97, 'property', NULL, '{}'),
	(98, 'property', NULL, '{}'),
	(99, 'property', NULL, '{}'),
	(100, 'property', NULL, '{}'),
	(101, 'property', NULL, '{}'),
	(102, 'property', NULL, '{}'),
	(103, 'property', NULL, '{}'),
	(104, 'property', 'char1:9460f7721e8516636a62801744f6daccdeb32db7', '{}'),
	(105, 'user_glasses', 'char1:9460f7721e8516636a62801744f6daccdeb32db7', '{}'),
	(106, 'user_ears', 'char1:9460f7721e8516636a62801744f6daccdeb32db7', '{}'),
	(107, 'user_mask', 'char1:9460f7721e8516636a62801744f6daccdeb32db7', '{}'),
	(108, 'user_helmet', 'char1:9460f7721e8516636a62801744f6daccdeb32db7', '{}'),
	(109, 'property', NULL, '{}'),
	(110, 'property', NULL, '{}'),
	(111, 'property', NULL, '{}'),
	(112, 'property', NULL, '{}'),
	(113, 'property', NULL, '{}'),
	(114, 'property', NULL, '{}'),
	(115, 'property', NULL, '{}'),
	(116, 'property', NULL, '{}'),
	(117, 'property', NULL, '{}'),
	(118, 'property', NULL, '{}'),
	(119, 'property', NULL, '{}'),
	(120, 'property', NULL, '{}'),
	(121, 'property', NULL, '{}'),
	(122, 'property', NULL, '{}'),
	(123, 'property', NULL, '{}'),
	(124, 'property', NULL, '{}');

-- Volcando estructura para tabla es_extended.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.fine_types: ~52 rows (aproximadamente)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);

-- Volcando estructura para tabla es_extended.garagekeys
CREATE TABLE IF NOT EXISTS `garagekeys` (
  `identifier` varchar(46) NOT NULL,
  `keys` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.garagekeys: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.impound_garage
CREATE TABLE IF NOT EXISTS `impound_garage` (
  `garage` varchar(64) NOT NULL DEFAULT '',
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`garage`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.impound_garage: ~2 rows (aproximadamente)
INSERT INTO `impound_garage` (`garage`, `data`) VALUES
	('impound_davis', '[]'),
	('impound_mrpd', '[]'),
	('impound_vespucci', '[]');

-- Volcando estructura para tabla es_extended.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.items: ~42 rows (aproximadamente)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Pollo Vivo', 1, 0, 1),
	('anchovy', 'Anchovy', 20, 0, 1),
	('bandage', 'Vendaje', 2, 0, 1),
	('blowpipe', 'Blowtorch', 2, 0, 1),
	('bread', 'Pan Bimbo', 1, 0, 1),
	('cannabis', 'Canabis', 3, 0, 1),
	('carokit', 'BodyKit', 3, 0, 1),
	('carotool', 'Herramientas', 2, 0, 1),
	('clothe', 'Cloth', 1, 0, 1),
	('copper', 'Copper', 1, 0, 1),
	('cutted_wood', 'Madera Cortada', 1, 0, 1),
	('diamond', 'Diamante', 1, 0, 1),
	('emerald', 'Esmeralda', 20, 0, 1),
	('essence', 'Gas', 1, 0, 1),
	('fabric', 'Fabric', 1, 0, 1),
	('fish', 'Pescado', 1, 0, 1),
	('fishbait', 'Fish Bait', 20, 0, 1),
	('fishingrod', 'Fishing Rod', 20, 0, 1),
	('fixkit', 'Kit Reparación', 3, 0, 1),
	('fixtool', 'Kit Reparacion', 2, 0, 1),
	('gazbottle', 'Gas Bottle', 2, 0, 1),
	('gold', 'Oro', 1, 0, 1),
	('iron', 'Acero', 1, 0, 1),
	('marijuana', 'Marihuana', 2, 0, 1),
	('medikit', 'Desfibrilador', 2, 0, 1),
	('packaged_chicken', 'Pollo Fileteado', 1, 0, 1),
	('packaged_plank', 'Packaged wood', 1, 0, 1),
	('petrol', 'Aceite', 1, 0, 1),
	('petrol_raffin', 'Processed oil', 1, 0, 1),
	('phone', 'Telefono', 1, 0, 1),
	('pickaxe', 'Pico de Mineria', 2, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('salmon', 'Salmon', 20, 0, 1),
	('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
	('steel', 'Metal', 10, 0, 1),
	('stone', 'Piedra', 1, 0, 1),
	('trout', 'Trout', 20, 0, 1),
	('tuna', 'Tuna', 40, 0, 1),
	('washed_stone', 'Washed stone', 1, 0, 1),
	('water', 'Water', 1, 0, 1),
	('wood', 'Wood', 1, 0, 1),
	('wool', 'Wool', 1, 0, 1);

-- Volcando estructura para tabla es_extended.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.jobs: ~5 rows (aproximadamente)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Medico', 1),
	('mechanic', 'Mecanico', 1),
	('police', 'LSPD', 1),
	('taxi', 'Taxista', 0),
	('unemployed', 'Desemplado', 0);

-- Volcando estructura para tabla es_extended.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.job_grades: ~25 rows (aproximadamente)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'Desempleado', 'En Paro', 200, '{}', '{}'),
	(2, 'police', 0, 'Recluta', 'Recluta', 400, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":25,"torso_2":0,"hair_color_2":0,"pants_1":25,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":59,"helmet_1":46,"helmet_2":0,"arms":41,"face":19,"decals_1":0,"torso_1":55,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":1,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":48,"shoes":27,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":0,"tshirt_1":36,"pants_1":34,"helmet_1":45,"torso_2":0,"arms":44,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(3, 'police', 1, 'Oficial', 'Oficial', 600, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":25,"torso_2":0,"hair_color_2":0,"pants_1":25,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":59,"helmet_1":46,"helmet_2":0,"arms":41,"face":19,"decals_1":0,"torso_1":55,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":1,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":48,"shoes":27,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":0,"tshirt_1":36,"pants_1":34,"helmet_1":45,"torso_2":0,"arms":44,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(4, 'police', 2, 'Sargento', 'Sargento', 800, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":25,"torso_2":0,"hair_color_2":0,"pants_1":25,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":59,"helmet_1":46,"helmet_2":0,"arms":41,"face":19,"decals_1":0,"torso_1":55,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":1,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":48,"shoes":27,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":0,"tshirt_1":36,"pants_1":34,"helmet_1":45,"torso_2":0,"arms":44,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(5, 'police', 3, 'Inspector', 'Inspector', 1100, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":25,"torso_2":0,"hair_color_2":0,"pants_1":25,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":59,"helmet_1":46,"helmet_2":0,"arms":41,"face":19,"decals_1":0,"torso_1":55,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":1,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":48,"shoes":27,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":0,"tshirt_1":36,"pants_1":34,"helmet_1":45,"torso_2":0,"arms":44,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(6, 'police', 4, 'Jefe', 'Jefe', 1300, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":25,"torso_2":0,"hair_color_2":0,"pants_1":25,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":59,"helmet_1":46,"helmet_2":0,"arms":41,"face":19,"decals_1":0,"torso_1":55,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":1,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":48,"shoes":27,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":0,"tshirt_1":36,"pants_1":34,"helmet_1":45,"torso_2":0,"arms":44,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(22, 'ambulance', 0, 'ambulance', 'Enfermero', 300, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'Doctor', 500, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Cirujano', 800, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'Jefe', 1400, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'En Practicas', 300, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Contratado', 500, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Jefe de Taller', 800, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'SubJefe', 1200, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Jefe', 1500, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Taxista', 400, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabify', 600, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Uber', 800, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Subjefe', 1000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Jefe Departamento', 1300, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(41, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
	(42, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
	(43, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
	(44, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(45, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}');

-- Volcando estructura para tabla es_extended.ks_peds
CREATE TABLE IF NOT EXISTS `ks_peds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `ped` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  KEY `Índice 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla es_extended.ks_peds: ~2 rows (aproximadamente)
INSERT INTO `ks_peds` (`id`, `identifier`, `ped`, `type`, `name`, `label`) VALUES
	(32, 'char1:f0e176ec5a87adad3df08d798b614090645a655a', 'u_m_y_abner', 'ped', NULL, 'human'),
	(33, 'char1:f0e176ec5a87adad3df08d798b614090645a655a', 'a_c_boar', 'animal', NULL, 'pig');

-- Volcando estructura para tabla es_extended.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.licenses: ~5 rows (aproximadamente)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Licencia B'),
	('drive', 'Licencia Conducir'),
	('drive_bike', 'Licencia Motocicleta'),
	('drive_truck', 'Licencia Camión'),
	('weed_processing', 'Licencia CBD');

-- Volcando estructura para tabla es_extended.multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.multicharacter_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_calls: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_darkchat_channels
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.npwd_darkchat_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.npwd_darkchat_channel_members: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_darkchat_messages
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.npwd_darkchat_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_marketplace_listings: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_match_profiles: ~2 rows (aproximadamente)
INSERT INTO `npwd_match_profiles` (`id`, `identifier`, `name`, `image`, `bio`, `location`, `job`, `tags`, `voiceMessage`, `createdAt`, `updatedAt`) VALUES
	(1, 'f0e176ec5a87adad3df08d798b614090645a655a', '8375915586', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-11-22 09:24:06', '2022-11-22 09:24:06'),
	(2, 'char1:f0e176ec5a87adad3df08d798b614090645a655a', 'Iker Testing', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-11-22 09:30:21', '2022-11-22 09:30:21'),
	(3, 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', 'Mason Rogers', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-11-25 14:23:42', '2022-11-25 14:23:42'),
	(4, 'char1:9460f7721e8516636a62801744f6daccdeb32db7', 'Tocando Huevos', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-11-28 19:30:34', '2022-11-28 19:30:34');

-- Volcando estructura para tabla es_extended.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_match_views: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_messages_conversations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_messages_participants: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_notes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_phone_contacts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_phone_gallery: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_twitter_likes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_twitter_profiles: ~2 rows (aproximadamente)
INSERT INTO `npwd_twitter_profiles` (`id`, `profile_name`, `identifier`, `avatar_url`, `createdAt`, `updatedAt`) VALUES
	(1, '8375915586', 'f0e176ec5a87adad3df08d798b614090645a655a', 'https://i.file.glass/QrEvq.png', '2022-11-22 09:24:06', '2022-11-22 09:24:06'),
	(2, 'Iker_Testing', 'char1:f0e176ec5a87adad3df08d798b614090645a655a', 'https://i.file.glass/QrEvq.png', '2022-11-22 09:30:21', '2022-11-22 09:30:21'),
	(3, 'Mason_Rogers', 'char1:c72291f2bfcefacb25a4c545f466189768a9b209', 'https://i.file.glass/QrEvq.png', '2022-11-25 14:23:42', '2022-11-25 14:23:42'),
	(4, 'Tocando_Huevos', 'char1:9460f7721e8516636a62801744f6daccdeb32db7', 'https://i.file.glass/QrEvq.png', '2022-11-28 19:30:34', '2022-11-28 19:30:34');

-- Volcando estructura para tabla es_extended.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_twitter_reports: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(46) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.npwd_twitter_tweets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'car',
  `job` varchar(32) DEFAULT 'civ',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `garage_id` varchar(32) NOT NULL DEFAULT 'A',
  `impound` int(1) DEFAULT 0,
  `garage_type` varchar(50) DEFAULT 'car',
  `park_coord` longtext DEFAULT NULL,
  `isparked` int(1) DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.owned_vehicles: ~0 rows (aproximadamente)
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `glovebox`, `trunk`, `garage_id`, `impound`, `garage_type`, `park_coord`, `isparked`) VALUES
	('char1:f0e176ec5a87adad3df08d798b614090645a655a', 'DET 870', '{"modBackWheels":-1,"modAerials":-1,"modTrimB":-1,"modFender":-1,"vehicle_window":[1,1,false,false,false,false,1,false],"rgb":[41,44,46],"tyreSmokeColor":[255,255,255],"model":234062309,"modEngineBlock":-1,"modTrunk":-1,"modSpoilers":-1,"wheel_tires":[false,false,false,false,false,false,false],"modDashboard":-1,"modSpeakers":-1,"bodyHealth":970.5,"plateIndex":0,"modHorns":-1,"modExhaust":-1,"color2":3,"modEngine":-1,"extras":[],"modSideSkirt":-1,"modAirFilter":-1,"modFrame":-1,"deformation":"[]","pearlescentColor":5,"modSmokeEnabled":false,"modDoorSpeaker":-1,"tankHealth":996.7,"dirtLevel":7.0,"modVanityPlate":-1,"neonColor":[255,0,255],"modBrakes":-1,"modHydrolic":-1,"modPlateHolder":-1,"modAPlate":-1,"wheelColor":156,"neonEnabled":[false,false,false,false],"modSuspension":-1,"modShifterLeavers":-1,"rgb2":[41,44,46],"modTurbo":false,"modDial":-1,"modArmor":-1,"modXenon":false,"fuelLevel":65.0,"modGrille":-1,"modSteeringWheel":-1,"modWindows":-1,"modFrontBumper":-1,"vehicle_doors":[false,false,false,false,false,false],"color1":3,"modRearBumper":-1,"modRightFender":-1,"modTrimA":-1,"modArchCover":-1,"modSeats":-1,"modLivery":-1,"modTransmission":-1,"engineHealth":0.0,"modOrnaments":-1,"plate":"DET 870","xenonColor":255,"modTank":-1,"modRoof":-1,"modHood":-1,"wheels":7,"windowTint":-1,"modFrontWheels":-1,"modStruts":-1}', 'car', 'civ', 1, NULL, NULL, NULL, NULL, 'A', 0, 'car', '{"z":30.36737060546875,"x":214.0523223876953,"heading":67.85287475585938,"y":-803.84619140625}', 0),
	('char1:f0e176ec5a87adad3df08d798b614090645a655a', 'MME 747', '{"modAirFilter":-1,"color2":8,"modDoorR":-1,"plateIndex":0,"modFrame":-1,"windowTint":-1,"modHydrolic":-1,"plate":"MME 747","tankHealth":999.9,"modLightbar":-1,"modEngine":-1,"tyreSmokeColor":[255,255,255],"modEngineBlock":-1,"modTurbo":false,"modExhaust":-1,"dirtLevel":0.1,"model":-2120700196,"modRightFender":-1,"modDial":-1,"wheelColor":0,"modSmokeEnabled":false,"modSpeakers":-1,"modDoorSpeaker":-1,"modAerials":-1,"modFrontBumper":-1,"modShifterLeavers":-1,"customSecondaryColor":[51,51,51],"neonColor":[255,0,255],"color1":29,"customPrimaryColor":[107,0,0],"bodyHealth":998.8,"modBackWheels":-1,"modAPlate":-1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"4":false},"modTransmission":-1,"modHorns":-1,"modRearBumper":-1,"modBrakes":-1,"modHood":-1,"xenonColor":255,"modStruts":-1,"modSuspension":-1,"fuelLevel":65,"modGrille":-1,"modFrontWheels":-1,"pearlescentColor":5,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"modSeats":-1,"modTrimA":-1,"modOrnaments":-1,"wheels":7,"modVanityPlate":-1,"neonEnabled":[false,false,false,false],"modSpoilers":-1,"extras":[],"modDashboard":-1,"modLivery":-1,"windowsBroken":{"2":true,"3":true,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"modTrunk":-1,"modXenon":false,"modSteeringWheel":-1,"modTrimB":-1,"modFender":-1,"engineHealth":1000,"modSideSkirt":-1,"modPlateHolder":-1,"modArchCover":-1,"modArmor":-1,"modRoof":-1,"modTank":-1}', 'car', 'civ', 1, NULL, NULL, NULL, NULL, 'A', 0, 'car', NULL, 0);

-- Volcando estructura para tabla es_extended.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.ox_inventory: ~0 rows (aproximadamente)
INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
	('', '2483936279', '[{"name":"ammo-9","count":588,"slot":1}]', '2022-11-23 22:15:11');

-- Volcando estructura para tabla es_extended.parking_meter
CREATE TABLE IF NOT EXISTS `parking_meter` (
  `identifier` varchar(46) DEFAULT NULL,
  `plate` varchar(32) DEFAULT '',
  `vehicle` longtext DEFAULT NULL,
  `coord` longtext DEFAULT NULL,
  `park_coord` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.parking_meter: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.private_garage
CREATE TABLE IF NOT EXISTS `private_garage` (
  `identifier` varchar(46) DEFAULT NULL,
  `vehicles` longtext DEFAULT NULL,
  `garage` varchar(64) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.private_garage: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.rented_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.society_moneywash: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(64) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Volcando datos para la tabla es_extended.twitter_accounts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Volcando datos para la tabla es_extended.twitter_likes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.twitter_tweets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-517.14,"y":-211.37,"z":38.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `pincode` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `pincode`, `phone_number`) VALUES
	('char1:9460f7721e8516636a62801744f6daccdeb32db7', '{"bank":50800,"black_money":0,"money":0}', 'admin', '[]', 'unemployed', 0, '[]', '{"x":-2285.0,"y":-1437.3,"z":0.2,"heading":306.1}', 'Tocando', 'Huevos', '30/05/1989', 'm', 181, '{"nose_1":0,"eyebrows_4":0,"eye_color":0,"bodyb_3":-1,"beard_2":10,"bproof_2":0,"neck_thickness":0,"nose_3":5,"moles_2":0,"nose_2":0,"chin_13":0,"makeup_4":0,"cheeks_3":6,"cheeks_1":2,"torso_1":23,"eyebrows_6":0,"eye_squint":0,"lipstick_4":0,"eyebrows_5":0,"mask_2":0,"bracelets_2":0,"pants_2":3,"chin_3":0,"blush_3":0,"lipstick_2":0,"watches_2":0,"beard_1":11,"complexion_1":0,"decals_1":0,"blush_2":0,"tshirt_2":2,"bproof_1":0,"hair_2":0,"jaw_1":0,"lipstick_3":0,"jaw_2":0,"chest_1":0,"blemishes_1":0,"shoes_2":2,"mask_1":0,"eyebrows_1":0,"bracelets_1":-1,"arms":1,"beard_4":0,"helmet_1":-1,"chest_2":0,"bodyb_4":0,"blush_1":0,"bags_1":0,"tshirt_1":4,"torso_2":2,"shoes_1":70,"bodyb_1":-1,"makeup_3":0,"sun_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"nose_5":10,"makeup_2":0,"decals_2":0,"chin_4":0,"hair_1":76,"cheeks_2":-10,"hair_color_2":29,"blemishes_2":0,"ears_2":0,"complexion_2":0,"nose_6":0,"skin_md_weight":50,"face_md_weight":50,"eyebrows_3":0,"bodyb_2":0,"lipstick_1":0,"chain_1":22,"hair_color_1":61,"mom":21,"eyebrows_2":0,"age_1":0,"lip_thickness":-2,"chain_2":2,"age_2":0,"arms_2":0,"nose_4":8,"pants_1":28,"bags_2":0,"ears_1":-1,"beard_3":0,"makeup_1":0,"chin_1":0,"chest_3":0,"sun_1":0,"sex":0,"moles_1":0,"watches_1":-1,"chin_2":0,"dad":0}', '[{"val":0,"name":"drunk","percent":0.0},{"val":469300,"name":"hunger","percent":46.93},{"val":476975,"name":"thirst","percent":47.6975}]', 0, 6, 0, NULL, '2022-11-28 19:30:33', '2022-11-28 19:58:09', NULL, '610-847-1972'),
	('char1:c72291f2bfcefacb25a4c545f466189768a9b209', '{"black_money":0,"money":0,"bank":50300}', 'admin', '[]', 'police', 0, '[]', '{"y":554.3,"x":1970.0,"heading":119.1,"z":160.7}', 'Mason', 'Rogers', '19/01/1994', 'm', 180, '{"age_1":0,"pants_2":3,"nose_4":8,"blush_2":0,"chest_2":0,"beard_1":11,"bodyb_4":0,"sun_1":0,"blemishes_1":0,"blush_3":0,"complexion_2":0,"mask_1":0,"eyebrows_6":0,"beard_3":0,"tshirt_2":2,"mom":43,"decals_1":0,"cheeks_3":6,"glasses_2":0,"eyebrows_3":0,"makeup_1":0,"hair_1":76,"blemishes_2":0,"eyebrows_2":0,"beard_4":0,"bodyb_3":-1,"nose_5":10,"eyebrows_5":0,"bracelets_1":-1,"hair_color_1":61,"chain_2":2,"nose_1":-5,"dad":29,"ears_2":0,"jaw_2":0,"cheeks_1":2,"tshirt_1":4,"shoes_1":70,"eyebrows_4":0,"ears_1":-1,"neck_thickness":0,"eye_squint":0,"torso_2":2,"torso_1":23,"eyebrows_1":0,"skin_md_weight":27,"makeup_4":0,"sun_2":0,"face_md_weight":61,"nose_6":0,"makeup_3":0,"helmet_1":-1,"chin_3":0,"lipstick_4":0,"shoes_2":2,"jaw_1":0,"chin_13":0,"cheeks_2":-10,"decals_2":0,"bodyb_1":-1,"chain_1":22,"blush_1":0,"moles_1":0,"nose_3":5,"watches_1":-1,"arms":1,"helmet_2":0,"bproof_2":0,"beard_2":10,"lipstick_3":0,"lip_thickness":-2,"watches_2":0,"lipstick_2":0,"hair_2":0,"bracelets_2":0,"bodyb_2":0,"eye_color":0,"bproof_1":0,"lipstick_1":0,"pants_1":28,"chest_3":0,"moles_2":0,"glasses_1":0,"chin_4":0,"chin_2":0,"chin_1":0,"complexion_1":0,"mask_2":0,"bags_2":0,"age_2":0,"chest_1":0,"makeup_2":0,"bags_1":0,"hair_color_2":29,"arms_2":0,"sex":0,"nose_2":6}', '[{"val":0,"name":"drunk","percent":0.0},{"val":473400,"name":"hunger","percent":47.33999999999999},{"val":480050,"name":"thirst","percent":48.00499999999999}]', 0, 5, 0, NULL, '2022-11-25 14:23:41', '2022-11-25 15:09:21', NULL, '897-505-7686'),
	('char1:f0e176ec5a87adad3df08d798b614090645a655a', '{"money":999833778,"black_money":0,"bank":56320}', 'admin', '[{"count":1,"metadata":{"durability":100,"ammo":0,"registered":"Iker Legacy","components":[],"serial":"874594XHK597993"},"slot":1,"name":"WEAPON_PISTOL"},{"count":999833778,"slot":2,"name":"money"},{"count":1,"metadata":{"durability":100,"ammo":100,"components":[]},"slot":3,"name":"WEAPON_PETROLCAN"},{"count":1,"metadata":{"description":"MME 747 Vehicle Key","label":"Entity XXR Vehicle Key","image":"keys","plate":"MME 747"},"slot":9,"name":"keys"},{"count":1,"metadata":{"description":"DET 870 Vehicle Key","label":"Reaper Vehicle Key","image":"keys","plate":"DET 870"},"slot":10,"name":"keys"}]', 'police', 2, '[]', '{"heading":25.5,"x":252.6,"y":-1257.4,"z":29.1}', 'Iker', 'Legacy', '12/12/1988', 'm', 188, '{"beard_4":0,"lip_thickness":-2,"eyebrows_1":0,"watches_2":0,"decals_2":0,"cheeks_1":2,"complexion_1":0,"chest_3":0,"tshirt_1":21,"shoes_2":2,"bracelets_2":0,"chain_2":0,"nose_3":5,"bproof_2":0,"sun_1":0,"eye_squint":0,"nose_5":10,"chin_1":0,"face_md_weight":50,"blush_3":0,"lipstick_4":0,"makeup_3":0,"blemishes_1":0,"shoes_1":9,"lipstick_2":0,"bodyb_3":-1,"nose_6":0,"blush_1":0,"chest_2":0,"bodyb_2":0,"moles_2":0,"beard_2":0,"bags_1":0,"nose_4":8,"pants_2":0,"neck_thickness":0,"glasses_1":0,"tshirt_2":0,"blush_2":0,"moles_1":0,"ears_1":-1,"lipstick_3":0,"sun_2":0,"skin_md_weight":50,"eyebrows_5":0,"sex":0,"chain_1":0,"mask_2":0,"cheeks_2":-10,"ears_2":0,"jaw_1":0,"jaw_2":0,"chest_1":0,"bodyb_4":0,"helmet_2":0,"hair_color_1":61,"eyebrows_3":0,"arms":6,"pants_1":4,"arms_2":0,"hair_1":75,"chin_4":0,"makeup_4":0,"makeup_1":0,"watches_1":-1,"hair_color_2":29,"dad":0,"complexion_2":0,"bodyb_1":-1,"eyebrows_2":0,"eyebrows_4":0,"nose_1":0,"beard_3":0,"age_1":0,"mom":21,"age_2":0,"glasses_2":0,"makeup_2":0,"bags_2":0,"helmet_1":-1,"chin_2":0,"eye_color":0,"blemishes_2":0,"mask_1":0,"chin_13":0,"cheeks_3":6,"eyebrows_6":0,"chin_3":0,"decals_1":0,"hair_2":0,"bproof_1":0,"nose_2":6,"bracelets_1":-1,"torso_2":0,"lipstick_1":0,"torso_1":62,"beard_1":0}', '[{"name":"drunk","percent":0.0,"val":0},{"name":"hunger","percent":96.28999999999999,"val":962900},{"name":"thirst","percent":97.2175,"val":972175}]', 0, 4, 0, NULL, '2022-11-22 09:59:05', '2022-12-12 12:31:13', NULL, '988-788-5755');

-- Volcando estructura para tabla es_extended.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.user_contacts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.user_licenses: ~0 rows (aproximadamente)
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'weapon', 'char1:f0e176ec5a87adad3df08d798b614090645a655a');

-- Volcando estructura para tabla es_extended.vehiclekeys
CREATE TABLE IF NOT EXISTS `vehiclekeys` (
  `plate` varchar(64) NOT NULL DEFAULT '',
  `keys` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.vehiclekeys: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.vehicles: ~240 rows (aproximadamente)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Volcando estructura para tabla es_extended.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.vehicle_categories: ~11 rows (aproximadamente)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Volcando estructura para tabla es_extended.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.vehicle_sold: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla es_extended.whitelist: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
