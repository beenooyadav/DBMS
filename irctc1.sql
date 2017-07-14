DROP SCHEMA IF EXISTS `irctc`;
CREATE SCHEMA `irctc` ;
USE `irctc` ;

CREATE TABLE IF NOT EXISTS `irctc`.`customer` (
  `cust_id` INT(10) UNSIGNED NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `age` INT(11) NOT NULL,
  `mobile_no` VARCHAR(10) NULL DEFAULT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cust_id`));

CREATE TABLE IF NOT EXISTS `irctc`.`train` (
  `train_no` INT(10) UNSIGNED NOT NULL,
  `source` VARCHAR(45) NOT NULL,
  `destination` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`train_no`));

CREATE TABLE IF NOT EXISTS `irctc`.`ticket` (
  `ticket_no` INT(10) UNSIGNED NOT NULL,
  `source` VARCHAR(45) NOT NULL,
  `destination` VARCHAR(45) NOT NULL,
  `date_of_journey` DATE NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_cust_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ticket_no`),
  INDEX `fk_ticket_customer1_idx` (`customer_cust_id` ASC),
  CONSTRAINT `fk_ticket_customer1`
    FOREIGN KEY (`customer_cust_id`)
    REFERENCES `irctc`.`customer` (`cust_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `irctc`.`reserved_ticket` (
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `train_train_no` INT(10) UNSIGNED NOT NULL,
  `ticket_ticket_no` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`train_train_no`, `ticket_ticket_no`),
  INDEX `fk_reserved_ticket_train1_idx` (`train_train_no` ASC),
  INDEX `fk_reserved_ticket_ticket1_idx` (`ticket_ticket_no` ASC),
  CONSTRAINT `fk_reserved_ticket_train1`
    FOREIGN KEY (`train_train_no`)
    REFERENCES `irctc`.`train` (`train_no`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reserved_ticket_ticket1`
    FOREIGN KEY (`ticket_ticket_no`)
    REFERENCES `irctc`.`ticket` (`ticket_no`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


CREATE TABLE IF NOT EXISTS `irctc`.`unreserved_ticket` (
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unreserved_ticketcol` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`unreserved_ticketcol`),
  INDEX `fk_unreserved_ticket_ticket1_idx` (`unreserved_ticketcol` ASC),
  CONSTRAINT `fk_unreserved_ticket_ticket1`
    FOREIGN KEY (`unreserved_ticketcol`)
    REFERENCES `irctc`.`ticket` (`ticket_no`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
