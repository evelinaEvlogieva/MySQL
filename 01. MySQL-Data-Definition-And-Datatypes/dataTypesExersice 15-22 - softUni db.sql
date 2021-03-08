CREATE TABLE `towns`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255)
);
CREATE TABLE `addresses`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    address_text VARCHAR(255) NOT NULL,
    town_id INT REFERENCES towns(id)
);
CREATE TABLE `departments`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE `employees`(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    job_title VARCHAR(255),
    department_id INT REFERENCES departments(id),
    hire_date DATE,
    salary FLOAT(10,2),
    address_id INT REFERENCES addresses(id)
);
ALTER TABLE `addresses` 
    ADD CONSTRAINT fk_town_id
    FOREIGN KEY(town_id)
    REFERENCES towns(id);
    
ALTER TABLE `employees` 
    ADD CONSTRAINT fk_department_id
    FOREIGN KEY(department_id)
    REFERENCES departments(id);
    
ALTER TABLE `employees` 
    ADD CONSTRAINT fk_address_id
    FOREIGN KEY(address_id)
    REFERENCES addresses(id);
    
INSERT INTO `towns` VALUES
(1, "Sofia"),
(2, "Plovdiv"),
(3, "Varna"),
(4, "Burgas");
       
INSERT INTO `departments` (`name`)
VALUES ('Engineering'),
	   ('Sales'),
       ('Marketing'),
       ('Software Development'),
       ('Quality Assurance');
       
INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
	   ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
       ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
       ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
       ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

SELECT * FROM `towns`;

SELECT * FROM `towns`AS t ORDER BY t.name;
SELECT * FROM `departments` ORDER BY `name`;
SELECT * FROM `employees` ORDER BY `salary` DESC;

SELECT `name` FROM `towns` ORDER BY `name`;
SELECT `name` FROM `departments` ORDER BY `name`;
SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees` ORDER BY `salary` DESC;

USE `soft_uni`;
UPDATE `employees` SET `salary` = employees.salary * 1.1;
SELECT `salary`FROM `employees`;

USE `hotel`;
UPDATE `payments` SET  `tax_rate` = payments.tax_rate * 0.97;
SELECT `tax_rate` FROM `payments`;
