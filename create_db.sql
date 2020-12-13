
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `displayName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `customerLVL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `User id` INT NOT NULL,
  `idItems` INT NOT NULL,
  PRIMARY KEY (`idOrder`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Item` (
  `idItems` INT NOT NULL AUTO_INCREMENT,
  `itemName` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `discountPrice` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`idItems`))
ENGINE = InnoDB

GRANT SELECT, INSERT, DELETE, UPDATE
ON User.*
TO dbmanager@localhost
IDENTIFIED BY 'Pa55Word';

GRANT SELECT, INSERT, DELETE, UPDATE
ON Order.*
TO dbmanager@localhost
IDENTIFIED BY 'Pa55Word';

GRANT SELECT, INSERT, DELETE, UPDATE
ON Item.*
TO dbmanager@localhost
IDENTIFIED BY 'Pa55Word';