DROP SCHEMA IF EXISTS `paytm`;
CREATE SCHEMA `paytm`;
USE `paytm` ;

CREATE TABLE IF NOT EXISTS `paytm`.`branch` (
  `branch_code` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `since` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_code`));

CREATE TABLE IF NOT EXISTS `paytm`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `contact_no` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`));

CREATE TABLE IF NOT EXISTS `paytm`.`account` (
  `account_no` INT NOT NULL,
  `balance` DECIMAL(10,2) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `date_of_opening` DATE NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_customer_id` INT NOT NULL,
  `branch_branch_code` INT NOT NULL,
  PRIMARY KEY (`account_no`, `branch_branch_code`, `customer_customer_id`),
  INDEX `fk_account_customer_idx` (`customer_customer_id` ASC),
  INDEX `fk_account_branch1_idx` (`branch_branch_code` ASC),
  UNIQUE INDEX `one_account_in_one_branch_per_user` (`customer_customer_id` ASC, `branch_branch_code` ASC)  COMMENT 'one customer can have only one account in one branch',
  CONSTRAINT `fk_account_customer`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `paytm`.`customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_account_branch1`
    FOREIGN KEY (`branch_branch_code`)
    REFERENCES `paytm`.`branch` (`branch_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);