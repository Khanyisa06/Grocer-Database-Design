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
-- Table `mydb`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Items` (
  `Item_Num` INT NOT NULL,
  `Description` VARCHAR(50) NULL,
  `Item_Type` VARCHAR(15) NULL,
  `Location` VARCHAR(5) NULL,
  `Unit` VARCHAR(20) NULL,
  PRIMARY KEY (`Item_Num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendors` (
  `Vendor_ID` VARCHAR(5) NOT NULL,
  `Vendor_Name` VARCHAR(30) NULL,
  `Address` VARCHAR(60) NULL,
  PRIMARY KEY (`Vendor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `Customer_ID` INT NOT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sales` (
  `Sales_ID` INT NOT NULL AUTO_INCREMENT,
  `Items_Item_Num` INT NOT NULL,
  `Customers_Customer_ID` INT NOT NULL,
  `Quantity_on_Hand` INT NULL,
  `Price` DOUBLE NULL,
  `Date_Sold` DATE NULL,
  `Quantity_Sold` INT NULL,
  PRIMARY KEY (`Sales_ID`, `Items_Item_Num`, `Customers_Customer_ID`),
  INDEX `fk_table1_Items_idx` (`Items_Item_Num` ASC) VISIBLE,
  INDEX `fk_table1_Customers1_idx` (`Customers_Customer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_table1_Items`
    FOREIGN KEY (`Items_Item_Num`)
    REFERENCES `mydb`.`Items` (`Item_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_Customers1`
    FOREIGN KEY (`Customers_Customer_ID`)
    REFERENCES `mydb`.`Customers` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Purchases` (
  `Purchases_ID` INT NOT NULL AUTO_INCREMENT,
  `Vendors_Vendor_ID` VARCHAR(10) NOT NULL,
  `Items_Item_Num` INT NOT NULL,
  `Quantity_on_Hand` INT NULL,
  `Cost` DOUBLE NULL,
  `Purchase_Date` DATE NULL,
  `Quantity_Bought` INT NULL,
  PRIMARY KEY (`Purchases_ID`, `Vendors_Vendor_ID`, `Items_Item_Num`),
  INDEX `fk_Purchases_Vendors1_idx` (`Vendors_Vendor_ID` ASC) VISIBLE,
  INDEX `fk_Purchases_Items1_idx` (`Items_Item_Num` ASC) VISIBLE,
  CONSTRAINT `fk_Purchases_Vendors1`
    FOREIGN KEY (`Vendors_Vendor_ID`)
    REFERENCES `mydb`.`Vendors` (`Vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchases_Items1`
    FOREIGN KEY (`Items_Item_Num`)
    REFERENCES `mydb`.`Items` (`Item_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
