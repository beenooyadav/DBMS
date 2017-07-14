DROP SCHEMA IF EXISTS `hotel_booking`;
CREATE SCHEMA `hotel_booking`;
USE `hotel_booking` ;

CREATE TABLE IF NOT EXISTS `hotel_booking`.`loyal_customer` (
  `registration_no` INT(11) NOT NULL,
  `membership_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`registration_no`));

CREATE TABLE IF NOT EXISTS `hotel_booking`.`customer` (
  `customer_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `mobile_no` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_by_copy1` VARCHAR(45) NOT NULL,
  `loyal_customer_registration_no` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_loyal_customer_idx` (`loyal_customer_registration_no` ASC),
  CONSTRAINT `fk_customer_loyal_customer`
    FOREIGN KEY (`loyal_customer_registration_no`)
    REFERENCES `hotel_booking`.`loyal_customer` (`registration_no`)
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `hotel_booking`.`hotel` (
  `hotel_code` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_by_copy1` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hotel_code`));

CREATE TABLE IF NOT EXISTS `hotel_booking`.`bookings` (
  `booking_id` INT(11) NOT NULL,
  `payment` INT(11) NOT NULL,
  `arrival_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `leaving_time` TIMESTAMP NULL DEFAULT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_by_copy1` VARCHAR(45) NOT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  `hotel_hotel_code` INT(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_bookings_customer1_idx` (`customer_customer_id` ASC),
  INDEX `fk_bookings_hotel1_idx` (`hotel_hotel_code` ASC),
  CONSTRAINT `fk_bookings_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `hotel_booking`.`customer` (`customer_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_hotel1`
    FOREIGN KEY (`hotel_hotel_code`)
    REFERENCES `hotel_booking`.`hotel` (`hotel_code`)
    ON UPDATE CASCADE);
