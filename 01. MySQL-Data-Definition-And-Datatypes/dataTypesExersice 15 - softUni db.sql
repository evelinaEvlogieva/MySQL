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