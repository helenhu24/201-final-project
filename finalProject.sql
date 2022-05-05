-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Final_Project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Final_Project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Final_Project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Final_Project` ;

-- -----------------------------------------------------
-- Table `Final_Project`.`Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Final_Project`.`Company` ;

CREATE TABLE IF NOT EXISTS `Final_Project`.`Company` (
  `companyID` INT NOT NULL AUTO_INCREMENT,
  `companyName` VARCHAR(45) NOT NULL,
  `numApps` INT NULL DEFAULT NULL,
  PRIMARY KEY (`companyID`, `companyName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Final_Project`.`Login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Final_Project`.`Login` ;

CREATE TABLE IF NOT EXISTS `Final_Project`.`Login` (
  `loginID` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`loginID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Final_Project`.`bridge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Final_Project`.`bridge` ;

CREATE TABLE IF NOT EXISTS `Final_Project`.`bridge` (
  `loginID` VARCHAR(45) NOT NULL,
  `companyID` INT NULL DEFAULT NULL,
  `progress` INT NULL,
  INDEX `companyID_idx` (`companyID` ASC) VISIBLE,
  CONSTRAINT `companyID`
    FOREIGN KEY (`companyID`)
    REFERENCES `Final_Project`.`Company` (`companyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `loginID`
    FOREIGN KEY (`loginID`)
    REFERENCES `Final_Project`.`Login` (`loginID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Final_Project`.`stages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Final_Project`.`stages` ;

CREATE TABLE IF NOT EXISTS `Final_Project`.`stages` (
  `stageID` INT NOT NULL,
  `companyID` INT NOT NULL,
  `stepnum` INT NULL,
  `stage` VARCHAR(250) NULL,
  `people` INT NULL,
  PRIMARY KEY (`stageID`, `companyID`),
    FOREIGN KEY (`companyID`)
    REFERENCES `Final_Project`.`Company` (`companyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
