SELECT * FROM `departments`
ORDER BY `department_id`;

SELECT `name` FROM `departments`
ORDER BY `department_id`;

SELECT `first_name`, `last_name`, `salary`
FROM `employees`
ORDER BY `employee_id`;

SELECT `first_name`, `middle_name`, `last_name`
FROM `employees`
ORDER BY `employee_id`;

SELECT concat(`first_name`, '.', `last_name`, '@softuni.bg') AS `full_ email_address`
FROM `employees`;

SELECT DISTINCT `salary`
FROM `employees`;

SELECT * FROM `employees`
WHERE `job_title` = "Sales Representative";

SELECT `first_name`, `last_name`, `job_title`
FROM `employees`
WHERE `salary`  BETWEEN 20000 and 30000
ORDER BY `employee_id`;

SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`) as `Full Name`
FROM `employees`
WHERE `salary` in (25000, 14000, 12500, 23600);

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `manager_id` is NULL;

SELECT `first_name`, `last_name`, `salary`
FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

SELECT `first_name`, `last_name`
FROM `employees`
ORDER BY `salary` DESC
LIMIT 5;

SELECT * FROM `employees`
ORDER BY `salary` DESC, `first_name`, `last_name` DESC, `middle_name`;

CREATE VIEW `v_employees_salaries` AS
SELECT `first_name`, `last_name`, `salary` from `employees`;

CREATE VIEW `v_employees_job_titles` AS
SELECT concat_ws(' ', `first_name`, IF(`middle_name` IS NULL, '', `middle_name`),
 `last_name`) AS `full_name`, `job_title`
 FROM `employees`;
 
 SELECT DISTINCT `job_title`
 from `employees`
 ORDER BY `job_title`;
 
 SELECT * FROM `projects`
 ORDER BY `start_date`, `name`, `project_id`
 LIMIT 10;
 
 UPDATE `employees`
 SET `salary` = `salary` * 1.12
 WHERE `department_id` in (1, 2, 4, 11);
 SELECT `salary` from `employees`;


