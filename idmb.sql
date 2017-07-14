DROP SCHEMA IF EXISTS `idmb`;
CREATE SCHEMA `idmb`;
USE `idmb` ;

CREATE TABLE IF NOT EXISTS `idmb`.`actor` (
  `actor_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`));

CREATE TABLE IF NOT EXISTS `idmb`.`movie` (
  `movie_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `rating` VARCHAR(45) NULL,
  `cost` VARCHAR(45) NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actor_actor_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `actor_actor_id`),
  INDEX `fk_movie_actor1_idx` (`actor_actor_id` ASC),
  CONSTRAINT `fk_movie_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `idmb`.`actor` (`actor_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `idmb`.`tv_series` (
  `tv_series_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `rating` VARCHAR(45) NOT NULL,
  `no_of_shows` INT NOT NULL,
  `created_by` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` VARCHAR(45) NOT NULL,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actor_actor_id` INT NOT NULL,
  PRIMARY KEY (`tv_series_id`, `actor_actor_id`),
  INDEX `fk_tv_series_actor1_idx` (`actor_actor_id` ASC),
  CONSTRAINT `fk_tv_series_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `idmb`.`actor` (`actor_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
