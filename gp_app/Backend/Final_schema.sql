-- MySQL Script generated by MySQL Workbench
-- Thu Nov 30 17:48:34 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ehr
-- -----------------------------------------------------
-- main database
-- 
DROP SCHEMA IF EXISTS `ehr` ;

-- -----------------------------------------------------
-- Schema ehr
--
-- main database
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ehr` ;
USE `ehr` ;

-- -----------------------------------------------------
-- Table `ehr`.`blood_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`blood_test` ;

CREATE TABLE IF NOT EXISTS `ehr`.`blood_test` (
  `fk_blood_test_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `hemoglobin` INT NULL DEFAULT NULL,
  `wbc` INT NULL DEFAULT NULL,
  `platelet_count` INT NULL DEFAULT NULL,
  `glucose` INT NULL DEFAULT NULL,
  `sodium` INT NULL DEFAULT NULL,
  `potassium` INT NULL DEFAULT NULL,
  `chloride` INT NULL DEFAULT NULL,
  `bicarbonate_levels` INT NULL DEFAULT NULL,
  `bun` INT NULL DEFAULT NULL,
  `creatinine` INT NULL DEFAULT NULL,
  `alt` INT NULL DEFAULT NULL,
  `ast` INT NULL DEFAULT NULL,
  `bilirubin` INT NULL DEFAULT NULL,
  `alkaline_phosphatase` INT NULL DEFAULT NULL,
  `total_protein` INT NULL DEFAULT NULL,
  `albumin` INT NULL DEFAULT NULL,
  `ldl` INT NULL DEFAULT NULL,
  `hdl` INT NULL DEFAULT NULL,
  `triglycerides` INT NULL DEFAULT NULL,
  `calcium` INT NULL DEFAULT NULL,
  `pt` INT NULL DEFAULT NULL,
  `inr` INT NULL DEFAULT NULL,
  `ptt` INT NULL DEFAULT NULL,
  `tsh` INT NULL DEFAULT NULL,
  `t4` INT NULL DEFAULT NULL,
  `t3` INT NULL DEFAULT NULL,
  `vitamin_d` INT NULL DEFAULT NULL,
  `vitamin_b12` INT NULL DEFAULT NULL,
  `folate` INT NULL DEFAULT NULL,
  `iron` INT NULL DEFAULT NULL,
  `crp` INT NULL DEFAULT NULL,
  `esr` INT NULL DEFAULT NULL,
  `cardiac_enzymes` INT NULL DEFAULT NULL,
  `testosterone` INT NULL DEFAULT NULL,
  `estrogen` INT NULL DEFAULT NULL,
  `progesterone` INT NULL DEFAULT NULL,
  INDEX `blood_id` (`fk_blood_test_user_id` ASC) VISIBLE,
  CONSTRAINT `blood_id`
    FOREIGN KEY (`fk_blood_test_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`burn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`burn` ;

CREATE TABLE IF NOT EXISTS `ehr`.`burn` (
  `fk_burn_user_id` INT NOT NULL,
  `burn_date` DATETIME NOT NULL,
  `burn_class_model` INT NULL,
  `burn_img` MEDIUMBLOB NOT NULL,
  `dr_id` INT NULL,
  `burn_class_dr` INT NULL,
  `dr_reply` VARCHAR(500) NULL,
  UNIQUE INDEX `burn_img_UNIQUE` (`burn_img`(255) ASC) VISIBLE,
  INDEX `id_idx` (`fk_burn_user_id` ASC) VISIBLE,
  CONSTRAINT `id`
    FOREIGN KEY (`fk_burn_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ehr`.`cardiac_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`cardiac_test` ;

CREATE TABLE IF NOT EXISTS `ehr`.`cardiac_test` (
  `fk_cardiac_test_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `ecg` VARCHAR(200) NULL DEFAULT NULL,
  `stress_test` VARCHAR(200) NULL DEFAULT NULL,
  `echocardiogram` VARCHAR(200) NULL DEFAULT NULL,
  INDEX `cardiac_id` (`fk_cardiac_test_user_id` ASC) VISIBLE,
  CONSTRAINT `cardiac_id`
    FOREIGN KEY (`fk_cardiac_test_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`imaging_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`imaging_test` ;

CREATE TABLE IF NOT EXISTS `ehr`.`imaging_test` (
  `fk_imaging_test_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `x_rays` VARCHAR(200) NULL DEFAULT NULL,
  `ultrasound` VARCHAR(200) NULL DEFAULT NULL,
  `ct` VARCHAR(200) NULL DEFAULT NULL,
  `mri` VARCHAR(200) NULL DEFAULT NULL,
  `mammogram` VARCHAR(200) NULL DEFAULT NULL,
  `dexa_scan` VARCHAR(200) NULL DEFAULT NULL,
  INDEX `imaging_id` (`fk_imaging_test_user_id` ASC) VISIBLE,
  CONSTRAINT `imaging_id`
    FOREIGN KEY (`fk_imaging_test_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`medical_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`medical_history` ;

CREATE TABLE IF NOT EXISTS `ehr`.`medical_history` (
  `fk_medical_history_user_id` INT NOT NULL,
  `allergies` VARCHAR(45) NULL DEFAULT NULL,
  `conditions` VARCHAR(45) NULL DEFAULT NULL,
  `smoker` INT NULL DEFAULT NULL,
  `alcoholic` INT NULL DEFAULT NULL,
  `surgical_history` VARCHAR(45) NULL DEFAULT NULL,
  `family_medical_history` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `history_id` (`fk_medical_history_user_id` ASC) VISIBLE,
  CONSTRAINT `history_id`
    FOREIGN KEY (`fk_medical_history_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`medication` ;

CREATE TABLE IF NOT EXISTS `ehr`.`medication` (
  `fk_medication_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `medication_name` VARCHAR(45) NULL DEFAULT NULL,
  `medication_category` VARCHAR(45) NULL DEFAULT NULL,
  `dosage` INT NULL DEFAULT NULL,
  INDEX `medication_id` (`fk_medication_user_id` ASC) VISIBLE,
  CONSTRAINT `medication_id`
    FOREIGN KEY (`fk_medication_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`urine_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`urine_test` ;

CREATE TABLE IF NOT EXISTS `ehr`.`urine_test` (
  `fk_urine_test_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `appearance` VARCHAR(45) NULL DEFAULT NULL,
  `ph_level` INT NULL DEFAULT NULL,
  `specific_gravity` INT NULL DEFAULT NULL,
  `glucose` INT NULL DEFAULT NULL,
  `protein` INT NULL DEFAULT NULL,
  `ketones` INT NULL DEFAULT NULL,
  `bilirubin` INT NULL DEFAULT NULL,
  `rbcs` INT NULL DEFAULT NULL,
  `wbcs` INT NULL DEFAULT NULL,
  `casts` INT NULL DEFAULT NULL,
  `crystals` INT NULL DEFAULT NULL,
  INDEX `urine_id` (`fk_urine_test_user_id` ASC) VISIBLE,
  CONSTRAINT `urine_id`
    FOREIGN KEY (`fk_urine_test_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`user` ;

CREATE TABLE IF NOT EXISTS `ehr`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `gender` CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
  `height` INT NULL DEFAULT NULL CHECK(height>0 & height<300),
  `weight` INT NULL DEFAULT NULL,
  `phone` INT NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `profession` VARCHAR(20) NOT NULL DEFAULT 'patient',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ehr`.`vaccination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ehr`.`vaccination` ;

CREATE TABLE IF NOT EXISTS `ehr`.`vaccination` (
  `fk_vaccination_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `vaccination_name` VARCHAR(50) NULL DEFAULT NULL,
  INDEX `vacc_id` (`fk_vaccination_user_id` ASC) VISIBLE,
  CONSTRAINT `vacc_id`
    FOREIGN KEY (`fk_vaccination_user_id`)
    REFERENCES `ehr`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
