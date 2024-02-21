-- MySQL Script generated by MySQL Workbench
-- Thu Nov 30 17:48:34 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema defaultdb
-- -----------------------------------------------------
-- main database
-- 
DROP SCHEMA IF EXISTS `defaultdb` ;

-- -----------------------------------------------------
-- Schema defaultdb
--
-- main database
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `defaultdb` ;
USE `defaultdb` ;

-- -----------------------------------------------------
-- Table `defaultdb`.`blood_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`blood_test` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`blood_test` (
  `blood_id` INT AUTO_INCREMENT PRIMARY KEY,
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
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `defaultdb`.`burn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`burn` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`burn` (
  `burn_id` INT NOT NULL AUTO_INCREMENT,
  `fk_burn_user_id` INT NULL,
  `burn_date` DATETIME NOT NULL,
  `burn_class_model` INT NULL,
  `burn_img` MEDIUMBLOB, -- Allow null values
  `dr_id` INT NULL,
  `burn_class_dr` INT NULL,
  `dr_reply` VARCHAR(500) NULL,
  `vomitting` INT NULL,
  `nausea` INT NULL,
  `rigors` INT NULL,
  `cold_extremities` INT NULL,
  `burn_type` VARCHAR(15) NULL,
  INDEX `id_idx` (`fk_burn_user_id` ASC) VISIBLE,
  PRIMARY KEY (`burn_id`),
  CONSTRAINT `id`
    FOREIGN KEY (`fk_burn_user_id`)
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `defaultdb`.`cardiac_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`cardiac_test` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`cardiac_test` (
  `cardiac_id` INT AUTO_INCREMENT PRIMARY KEY,
  `fk_cardiac_test_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `ecg` VARCHAR(200) NULL DEFAULT NULL,
  `stress_test` VARCHAR(200) NULL DEFAULT NULL,
  `echocardiogram` VARCHAR(200) NULL DEFAULT NULL,
  INDEX `cardiac_id` (`fk_cardiac_test_user_id` ASC) VISIBLE,
  CONSTRAINT `cardiac_id`
    FOREIGN KEY (`fk_cardiac_test_user_id`)
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `defaultdb`.`imaging_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`imaging_test` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`imaging_test` (
  `imaging_id` INT AUTO_INCREMENT PRIMARY KEY,
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
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `defaultdb`.`medical_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`medical_history` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`medical_history` (
  `history_id` INT AUTO_INCREMENT PRIMARY KEY,
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
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `defaultdb`.`medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`medication` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`medication` (
  `medication_id` INT AUTO_INCREMENT PRIMARY KEY,
  `fk_medication_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `medication_name` VARCHAR(45) NULL DEFAULT NULL,
  `medication_category` VARCHAR(45) NULL DEFAULT NULL,
  `dosage` INT NULL DEFAULT NULL,
  INDEX `medication_id` (`fk_medication_user_id` ASC) VISIBLE,
  CONSTRAINT `medication_id`
    FOREIGN KEY (`fk_medication_user_id`)
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `defaultdb`.`urine_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`urine_test` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`urine_test` (
  `urine_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `defaultdb`.`chat_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`chat_message` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`chat_message` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message VARCHAR(500) NOT NULL,
    image VARCHAR(500),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX sender_id_idx (sender_id),
    INDEX receiver_id_idx (receiver_id)
);

-- -----------------------------------------------------
-- Table `defaultdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`user` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `gender` CHAR(1) CHECK (gender IN ('M', 'F')),
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
-- Table `defaultdb`.`vaccination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defaultdb`.`vaccination` ;

CREATE TABLE IF NOT EXISTS `defaultdb`.`vaccination` (
  `vacc_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fk_vaccination_user_id` INT NOT NULL,
  `test_date` DATE NULL DEFAULT NULL,
  `vaccination_name` VARCHAR(50) NULL DEFAULT NULL,
  INDEX `vacc_id` (`fk_vaccination_user_id` ASC) VISIBLE,
  CONSTRAINT `vacc_id`
    FOREIGN KEY (`fk_vaccination_user_id`)
    REFERENCES `defaultdb`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `defaultdb`.`user` 
(`id`, `username`, `password`, `dob`, `gender`, `height`, `weight`, `phone`, `email`, `profession`)
VALUES
(123, 'admin_dr', 'pbkdf2:sha256:600000$pAsRDiBDmxSHfdEg$92636fe0bd7e56bc65a754affa38f709298a0c754cc7a29436b1caf999fbab71',
 '1990-01-01', 'M', 180, 70, '1234567890', 'admin_dr@example.com', 'doctor');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
