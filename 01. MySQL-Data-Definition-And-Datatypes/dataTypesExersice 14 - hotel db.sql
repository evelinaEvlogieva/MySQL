CREATE DATABASE Hotel;
CREATE TABLE `employees` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
title VARCHAR(255),
notes TEXT
);
INSERT INTO `employees` VALUES
(1, "pesho", "peshov", "worker", "note"),
(2, "pesho", "peshov", "worker", "note"),
(3, "pesho", "peshov", "worker", "note");

CREATE TABLE `customers` (
account_number INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
phone_number VARCHAR(255),
emergency_name  VARCHAR(255),
emergency_number VARCHAR(255),
notes TEXT
);
INSERT INTO `customers` VALUES
(1, "pesho", "peshov", "12345", "mimi", "34456", "note"),
(2, "pesho", "peshov", "12345", "mimi", "34456", "note"),
(3, "pesho", "peshov", "12345", "mimi", "34456", "note");

CREATE TABLE `room_status`(
room_status INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
notes TEXT
);
INSERT INTO `room_status` VALUES
(1, "note"),
(2, "note"),
(3, "note");

CREATE TABLE `room_types` (
room_type INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
notes TEXT
);
INSERT INTO `room_types` VALUES
(1, "note"),
(2, "note"),
(3, "note");

CREATE TABLE `bed_types` (
bed_type INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
notes TEXT
);
INSERT INTO `bed_types` VALUES
(1, "note"),
(2, "note"),
(3, "note");

CREATE TABLE `rooms` (
room_number INT PRIMARY KEY NOT NULL,
room_type VARCHAR(255) REFERENCES room_types(room_type),
bed_type VARCHAR(255) REFERENCES bed_types(bed_type),
rate INT,
room_status VARCHAR(255) REFERENCES room_status(room_status),
notes TEXT
);
INSERT INTO `rooms` VALUES
(12, "sng", "sng", 6, "free", "note"),
(42, "sng", "sng", 6, "free", "note"),
(41, "sng", "sng", 6, "free", "note");

CREATE TABLE `payments` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employee_id INT REFERENCES employees(id),
payment_date DATE NOT NULL,
account_number INT, 
first_date_occupied DATE,
last_date_occupied DATE,
total_days INT,
amount_charged INT,
tax_rate INT, 
tax_amount INT, 
payment_total INT,
notes TEXT
);
INSERT INTO `payments` VALUES
(1, 2, '2020-10-10', 12, '2020-10-11', '2020-10-12', 2, 50, 1, 1, 50, "note"), 
(2, 2, '2020-10-10', 12, '2020-10-11', '2020-10-12', 2, 50, 1, 1, 50, "note"), 
(3, 2, '2020-10-10', 12, '2020-10-11', '2020-10-12', 2, 50, 1, 1, 50, "note");

CREATE TABLE `occupancies` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employee_id INT REFERENCES employees(id),
date_occupied DATE NOT NULL,
account_number INT, 
room_number INT, 
rate_applied INT, 
phone_charge INT, 
notes TEXT
);
INSERT INTO `occupancies`  VALUES
(1, 2, '2020-10-20', 12, 12, 23, 12, "note"),
(2, 2, '2020-10-20', 12, 12, 23, 12, "note"),
(3, 2, '2020-10-20', 12, 12, 23, 12, "note");