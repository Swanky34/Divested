-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema invest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema invest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `invest` DEFAULT CHARACTER SET utf8 ;
USE `invest` ;

-- -----------------------------------------------------
-- Table `invest`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invest`.`User` (
  `userid` INT NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `userFirstName` VARCHAR(45) NULL,
  `userLastName` VARCHAR(45) NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invest`.`Expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invest`.`Expenses` (
  `idExpenses` INT NOT NULL,
  `User_userid` INT NOT NULL,
  `User_Credentials_idCredentials` INT NOT NULL,
  PRIMARY KEY (`idExpenses`),
  INDEX `fk_Expenses_User1_idx` (`User_userid` ASC, `User_Credentials_idCredentials` ASC),
  CONSTRAINT `fk_Expenses_User1`
    FOREIGN KEY (`User_userid`)
    REFERENCES `invest`.`User` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invest`.`Assets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invest`.`Assets` (
  `idAssets` INT NOT NULL,
  `User_userid` INT NOT NULL,
  `User_Credentials_idCredentials` INT NOT NULL,
  PRIMARY KEY (`idAssets`),
  INDEX `fk_Assets_User1_idx` (`User_userid` ASC, `User_Credentials_idCredentials` ASC),
  CONSTRAINT `fk_Assets_User1`
    FOREIGN KEY (`User_userid`)
    REFERENCES `invest`.`User` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
