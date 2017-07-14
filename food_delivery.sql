DROP SCHEMA IF EXISTS `food_delivery`;
CREATE SCHEMA `food_delivery`;
USE `food_delivery` ;

CREATE TABLE IF NOT EXISTS `food_delivery`.`delivery_person` (
  `delivery_person_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `mobile_no` INT(11) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`delivery_person_id`));

CREATE TABLE IF NOT EXISTS `food_delivery`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(45) NULL,
  `mobile_no` INT(11) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`));

CREATE TABLE IF NOT EXISTS `food_delivery`.`order` (
  `order_id` INT NOT NULL,
  `time_of_delivery` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery_person_delivery_person_id` INT UNSIGNED NOT NULL,
  `customer_customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`, `delivery_person_delivery_person_id`),
  INDEX `fk_order_delivery_person_idx` (`delivery_person_delivery_person_id` ASC),
  INDEX `fk_order_customer1_idx` (`customer_customer_id` ASC),
  CONSTRAINT `fk_order_delivery_person`
    FOREIGN KEY (`delivery_person_delivery_person_id`)
    REFERENCES `food_delivery`.`delivery_person` (`delivery_person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `food_delivery`.`customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `food_delivery`.`restaurant` (
  `product_id` INT UNSIGNED NOT NULL,
  `name_of_restaurant` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_no` INT(11) NOT NULL,
  `order_order_id` INT NOT NULL,
  `order_delivery_person_delivery_person_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_restaurant_order1_idx` (`order_order_id` ASC, `order_delivery_person_delivery_person_id` ASC),
  CONSTRAINT `fk_restaurant_order1`
    FOREIGN KEY (`order_order_id` , `order_delivery_person_delivery_person_id`)
    REFERENCES `food_delivery`.`order` (`order_id` , `delivery_person_delivery_person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
