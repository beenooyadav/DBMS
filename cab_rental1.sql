DROP SCHEMA IF EXISTS `cab_rental`;
CREATE SCHEMA `cab_rental`;
USE `cab_rental` ;

CREATE TABLE IF NOT EXISTS `cab_rental`.`driver` (
  `driver_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `age` INT(11) NOT NULL,
  `mobile_no` VARCHAR(10) NULL DEFAULT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`driver_id`));

CREATE TABLE IF NOT EXISTS `cab_rental`.`cab` (
  `cab_id` INT(10) UNSIGNED NOT NULL,
  `driver_id` INT(10) UNSIGNED NOT NULL,
  `cab_name` VARCHAR(50) NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cab_id`, `driver_id`),
  UNIQUE INDEX `driver_id` (`driver_id` ASC),
  UNIQUE INDEX `driver_unique` (`driver_id` ASC),
  CONSTRAINT `fk_driver_id`
    FOREIGN KEY (`driver_id`)
    REFERENCES `cab_rental`.`driver` (`driver_id`)
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `cab_rental`.`customer` (
  `cust_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT(11) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `mobile_no` VARCHAR(10) NULL DEFAULT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cust_id`));

CREATE TABLE IF NOT EXISTS `cab_rental`.`bookings` (
  `booking_id` INT(10) UNSIGNED NOT NULL,
  `cab_id` INT(10) UNSIGNED NOT NULL,
  `cust_id` INT(10) UNSIGNED NOT NULL,
  `time_of_travel` TIME NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  UNIQUE INDEX `cust_id` (`cust_id` ASC),
  UNIQUE INDEX `cust_unique` (`cust_id` ASC),
  INDEX `fk_cab_id` (`cab_id` ASC),
  CONSTRAINT `fk_cab_id`
    FOREIGN KEY (`cab_id`)
    REFERENCES `cab_rental`.`cab` (`cab_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cust_id`
    FOREIGN KEY (`cust_id`)
    REFERENCES `cab_rental`.`customer` (`cust_id`)
    ON UPDATE CASCADE);

