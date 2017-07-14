DROP SCHEMA IF EXISTS `employee_project`;
CREATE SCHEMA `employee_project`;
USE `employee_project` ;

CREATE TABLE IF NOT EXISTS `employee_project`.`employee` (
  `emply_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `age` INT(11) NOT NULL,
  `mobile_no` VARCHAR(10) NULL DEFAULT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`emply_id`) );

CREATE TABLE IF NOT EXISTS `employee_project`.`project` (
  `project_id` INT(10) UNSIGNED NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`) );

CREATE TABLE IF NOT EXISTS `employee_project`.`report_to` (
  `manager_id` INT(10) UNSIGNED NOT NULL,
  `emply_id` INT(10) UNSIGNED NOT NULL,
  `reporting_time` TIME NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`emply_id`),
  UNIQUE INDEX `manager_id` (`manager_id` ASC, `emply_id` ASC),
  CONSTRAINT `fk_emply_id1`
    FOREIGN KEY (`emply_id`)
    REFERENCES `employee_project`.`employee` (`emply_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_manager_id`
    FOREIGN KEY (`manager_id`)
    REFERENCES `employee_project`.`employee` (`emply_id`)
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `employee_project`.`works_on` (
  `project_id` INT(10) UNSIGNED NOT NULL,
  `emply_id` INT(10) UNSIGNED NOT NULL,
  `joining_date` DATE NOT NULL,
  `created_by` VARCHAR(55) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(55) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`, `emply_id`),
  INDEX `fk_emply_id` (`emply_id` ASC),
  CONSTRAINT `fk_emply_id`
    FOREIGN KEY (`emply_id`)
    REFERENCES `employee_project`.`employee` (`emply_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `employee_project`.`project` (`project_id`)
    ON UPDATE CASCADE);