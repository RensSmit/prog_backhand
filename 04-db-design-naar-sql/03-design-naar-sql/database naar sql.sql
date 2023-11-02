-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer` (
  `naam` INT NOT NULL,
  `level` VARCHAR(45) NULL,
  `speelt-sinds` VARCHAR(45) NULL,
  `account-waarde` VARCHAR(45) NULL,
  PRIMARY KEY (`naam`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actievements` (
  `speler` INT NOT NULL,
  `game opgestart` VARCHAR(45) NULL,
  `level 2 gehaald` VARCHAR(45) NULL,
  `level 5 gehaald` VARCHAR(45) NULL,
  `level 10 gehaald` VARCHAR(45) NULL,
  `level 20 gehaald` VARCHAR(45) NULL,
  `level 50 gehaald` VARCHAR(45) NULL,
  `level 100 gehaald` VARCHAR(45) NOT NULL,
  `gamer_naam` INT NOT NULL,
  PRIMARY KEY (`speler`, `level 100 gehaald`),
  INDEX `fk_actievements_gamer1_idx` (`gamer_naam` ASC) VISIBLE,
  CONSTRAINT `fk_actievements_gamer1`
    FOREIGN KEY (`gamer_naam`)
    REFERENCES `mydb`.`gamer` (`naam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `speler` INT NOT NULL,
  `GTA` VARCHAR(45) NULL,
  `minecraft` VARCHAR(45) NULL,
  `Valorant` VARCHAR(45) NULL,
  `gamer_naam` INT NOT NULL,
  PRIMARY KEY (`speler`),
  INDEX `fk_games_gamer_idx` (`gamer_naam` ASC) VISIBLE,
  CONSTRAINT `fk_games_gamer`
    FOREIGN KEY (`gamer_naam`)
    REFERENCES `mydb`.`gamer` (`naam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`games_has_actievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games_has_actievements` (
  `games_speler` INT NOT NULL,
  `actievements_speler` INT NOT NULL,
  `actievements_level 100 gehaald` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`games_speler`, `actievements_speler`, `actievements_level 100 gehaald`),
  INDEX `fk_games_has_actievements_actievements1_idx` (`actievements_speler` ASC, `actievements_level 100 gehaald` ASC) VISIBLE,
  INDEX `fk_games_has_actievements_games1_idx` (`games_speler` ASC) VISIBLE,
  CONSTRAINT `fk_games_has_actievements_games1`
    FOREIGN KEY (`games_speler`)
    REFERENCES `mydb`.`games` (`speler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_actievements_actievements1`
    FOREIGN KEY (`actievements_speler` , `actievements_level 100 gehaald`)
    REFERENCES `mydb`.`actievements` (`speler` , `level 100 gehaald`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
