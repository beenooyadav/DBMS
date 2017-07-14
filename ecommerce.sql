DROP SCHEMA IF EXISTS `ecommerce`;
CREATE SCHEMA `ecommerce`;
USE `ecommerce` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`supplier` (
  `supplier_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`));

CREATE TABLE IF NOT EXISTS `ecommerce`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`));

CREATE TABLE IF NOT EXISTS `ecommerce`.`order` (
  `orderid` INT NOT NULL,
  `address_of_delivery` VARCHAR(45) NOT NULL,
  `date_of_delivery` DATE NOT NULL,
  `list_of_items` BLOB NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`orderid`, `customer_customer_id`),
  INDEX `fk_order_customer1_idx` (`customer_customer_id` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `ecommerce`.`customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `ecommerce`.`item` (
  `item_id` INT NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(4,2) NULL,
  `date_of_manufacture` DATE NOT NULL,
  `validity` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `supplier_supplier_id` INT NOT NULL,
  `order_orderid` INT NOT NULL,
  PRIMARY KEY (`item_id`, `supplier_supplier_id`),
  INDEX `fk_item_supplier_idx` (`supplier_supplier_id` ASC),
  INDEX `fk_item_order1_idx` (`order_orderid` ASC),
  CONSTRAINT `fk_item_supplier`
    FOREIGN KEY (`supplier_supplier_id`)
    REFERENCES `ecommerce`.`supplier` (`supplier_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_item_order1`
    FOREIGN KEY (`order_orderid`)
    REFERENCES `ecommerce`.`order` (`orderid`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
