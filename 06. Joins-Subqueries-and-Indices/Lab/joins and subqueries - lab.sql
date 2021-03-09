SELECT e.`employee_id`, 
concat(`first_name`, ' ', `last_name`) AS `full_name`,
d.`department_id`, 
d.`name`
FROM `employees` AS `e`
JOIN `departments` AS `d`
ON e.`employee_id` = d.`manager_id`
ORDER BY e.`employee_id`
LIMIT 5;

SELECT t.town_id, t.`name` AS `town_name`, 
a.address_text
FROM towns AS `t`
JOIN `addresses` as `a`
ON t.town_id = a.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY a.town_id, a.address_id;

SELECT employee_id, first_name, last_name, department_id, salary
from employees
where manager_id is Null;

SELECT COUNT(*) AS `count`
FROM employees
where salary > (SELECT AVG(salary)
				FROM employees);