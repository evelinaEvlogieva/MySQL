CREATE DATABASE car_rental;
USE car_rental;
CREATE TABLE `categories`(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category VARCHAR(255) NOT NULL,
daily_rate INT,
weekly_rate INT,
monthly_rate INT,
weekend_rate INT
);

CREATE TABLE `cars`(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
plate_number VARCHAR(50) NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
car_year YEAR,
category_id INT REFERENCES categories(id),
doors INT,
picture BLOB,
car_condition VARCHAR(50),
available BOOLEAN
);

CREATE TABLE `employees` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
title VARCHAR(50) NOT NULL,
notes TEXT
);

CREATE TABLE `customers` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
driver_licence_number INT NOT NULL,
full_name VARCHAR(100) NOT NULL,
address VARCHAR(50),
city VARCHAR(50),
zip_code INT,
notes TEXT
);

CREATE TABLE `rental_orders` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employee_id INT REFERENCES employees(id),
customer_id INT REFERENCES customers(id),
car_id INT REFERENCES cars(id),
car_condition VARCHAR(50),
tank_level INT,
kilometrage_start INT,
kilometrage_end INT,
total_kilometrage INT,
start_date DATE,
end_date DATE,
total_days INT,
rate_applied INT,
tax_rate INT,
order_status VARCHAR(50),
notes TEXT
);

INSERT INTO `categories` VALUES
(1, "h", 6, 6, 6, 6),
(2, "h", 6, 6, 6, 6),
(3, "h", 6, 6, 6, 6);

INSERT INTO `cars` VALUES
(1, "123456", "bg", "bmw", '2018', 2, 4, NULL, "new", TRUE),
(2, "123456", "bg", "bmw", '2018', 2, 4, NULL, "new", TRUE),
(3, "123456", "bg", "bmw", '2018', 2, 4, NULL, "new", TRUE);

INSERT INTO `employees` VALUES
(1, "pesho", "peshov", "manager", "note"),
(2, "pesho", "peshov", "manager", "note"),
(3, "pesho", "peshov", "manager", "note");

INSERT INTO `customers` VALUES
(1, 12344, "pesho peshev", "bg", "varna", 9000, "note"), 
(2, 12344, "pesho peshev", "bg", "varna", 9000, "note"), 
(3, 12344, "pesho peshev", "bg", "varna", 9000, "note");

INSERT INTO `rental_orders` VALUES
(1, 2, 2, 1, "new", 40, 100, 200, 100, '2019-10-10', '2019-10-15', 5, 6, 5, "new", "note"),
(2, 2, 2, 1, "new", 40, 100, 200, 100, '2019-10-10', '2019-10-15', 5, 6, 5, "new", "note"),
(3, 2, 2, 1, "new", 40, 100, 200, 100, '2019-10-10', '2019-10-15', 5, 6, 5, "new", "note");


