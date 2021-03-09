/* 1 задача */
CREATE TABLE `passports`(
`passport_id` INT PRIMARY KEY,
 `passport_number` VARCHAR(8) UNIQUE
);

CREATE TABLE `persons` (
`person_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(30),
`salary` DECIMAL(10, 2),
`passport_id` INT UNIQUE,
CONSTRAINT fk_persons_passports
FOREIGN KEY (`passport_id`)
REFERENCES `passports`(`passport_id`)
);

INSERT INTO `passports` VALUES
('101','N34FG21B'),
('102','K65LO4R7'),
('103','ZE657QP2'); 

INSERT INTO `persons` (`first_name`, `salary`, `passport_id`)
VALUES 
('Roberto', '43300.00', '102'),
('Tom','56100.00','103'),
('Yana', '60200.00','101');

/* 2 задача */
CREATE TABLE manufacturers (
manufacturer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
established_on DATE
);

CREATE TABLE models (
model_id INT PRIMARY KEY NOT NULL, 
name VARCHAR(50) NOT NULL,
manufacturer_id INT NOT NULL,
CONSTRAINT fk_models_manufacturers
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO `manufacturers`(`name`, `established_on`) VALUES 
('BMW', "1916/03/01"),
('Tesla','2003/01/01'),
('Lada','1966/05/01');

INSERT INTO `models` VALUES 
('101', 'X1', '1'),
('102','i6', '1'),
('103','Model S', '2'),
('104','Model X', '2'),
('105','Model 3', '2'),
('106','Nova', '3');

/* 3 задача */
CREATE TABLE students (
student_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(50)
);

CREATE TABLE exams (
exam_id INT PRIMARY KEY NOT NULL,
name VARCHAR(50)
);

CREATE TABLE students_exams (
student_id INT, 
exam_id INT,
PRIMARY KEY (student_id, exam_id),
CONSTRAINT fk_se_students
FOREIGN KEY (student_id) REFERENCES students(student_id),
CONSTRAINT fk_se_exams
FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

INSERT INTO `students` VALUES
	(1, 'Mila'),
    (2, 'Toni'),
    (3, 'Ron');
    
INSERT INTO `exams` VALUES
	(101, 'Spring MVC'),
    (102, 'Neo4j'),
    (103, 'Oracle 11g');
    
INSERT INTO `students_exams` VALUES
	(1, 101),
    (1, 102),
    (2, 101),
    (3, 103),
    (2, 102),
    (2, 103);

/* 4 задача */
CREATE TABLE teachers(
teacher_id INT NOT NULL, 
name VARCHAR(50),
manager_id INT,
PRIMARY KEY (teacher_id)
);

INSERT INTO `teachers` VALUES 
	(101, 'John', NULL),
    (102, 'Maya', 106),
    (103, 'Silvia', 106),
    (104, 'Ted', 105),
    (105, 'Mark', 101),
    (106, 'Greta', 101);
    
ALTER TABLE teachers
ADD CONSTRAINT fk_manager_teacher
FOREIGN KEY (manager_id)
REFERENCES teachers(teacher_id);

/* 5 задача */

CREATE SCHEMA online_store;
Use online_store;

CREATE TABLE item_types(
item_type_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(50)
);

CREATE TABLE items(
item_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(50),
item_type_id INT(11),
CONSTRAINT fk_items_itemTypes
FOREIGN KEY (item_type_id) REFERENCES item_types(item_type_id)
);

CREATE TABLE cities (
city_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(50)
);

CREATE TABLE customers (
customer_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(50),
birthday DATE,
city_id INT(11),
CONSTRAINT fk_customers_cities
FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE orders (
order_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
customer_id INT(11),
CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_id INT(11),
item_id INT (11),
PRIMARY KEY (order_id, item_id),
CONSTRAINT fk_orderItems_items
FOREIGN KEY (item_id) REFERENCES items(item_id),
CONSTRAINT fk_orderItems_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

/* 6 задача */
CREATE SCHEMA university;
USE university;

CREATE TABLE subjects(
subject_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
subject_name VARCHAR(50)
);

CREATE TABLE majors(
major_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
name VARCHAR(50)
);

CREATE TABLE students (
student_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
student_number VARCHAR(12),
student_name VARCHAR(50),
major_id INT(11),
CONSTRAINT fk_students_major
FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

CREATE TABLE payments (
payment_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
payment_date DATE,
payment_amount DECIMAL(8,2),
student_id INT (11),
CONSTRAINT fk_payments_students
FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE agenda (
student_id INT(11),
subject_id INT(11),
PRIMARY KEY (student_id, subject_id),
CONSTRAINT fk_agenda_subjects
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
CONSTRAINT fk_agenda_students
FOREIGN KEY (student_id) REFERENCES students(student_id)
);
