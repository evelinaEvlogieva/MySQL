CREATE DATABASE `minions`;

CREATE TABLE `minions` (
`id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `age` INT NULL,
  PRIMARY KEY (`id`)
  );
  CREATE TABLE `towns` (
`id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`)
  );
  
  ALTER TABLE `minions`
  ADD COLUMN `town_id` INT NOT NULL;
  
  ALTER TABLE `minions`
  ADD CONSTRAINT fk_minions_towns
  FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);
  
  INSERT INTO `towns` (id, name) VALUES (1, "Sofia");
  INSERT INTO `towns` (id, name) VALUES (2, "Plovdiv");
  INSERT INTO `towns` (id, name) VALUES (3, "Varna");
  
  INSERT INTO `minions` (id, name, age, town_id) VALUES (1, "Kevin", 22, 1);
  INSERT INTO `minions` (id, name, age, town_id) VALUES (2, "Bob", 15, 3);
  INSERT INTO `minions` (id, name, age, town_id) VALUES (3, "Steward", NULL, 2);
  
  TRUNCATE TABLE `minions`;
  
  DROP TABLE `minions`;
  DROP TABLE `towns`;
  