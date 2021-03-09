SELECT COUNT(*) as 'count'
from `wizzard_deposits`;

SELECT MAX(`magic_wand_size`) as 'longest_magic_wand'
from `wizzard_deposits`;

SELECT `deposit_group`, MAX(`magic_wand_size`) as 'longest_magic_wand'
from `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;

SELECT `deposit_group`
from `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY AVG (`magic_wand_size`)
LIMIT 1;

SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `total_sum`;

SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;

SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

SELECT `deposit_group`, `magic_wand_creator`,
MIN(`deposit_charge`) AS 'min_deposit_charge'
from `wizzard_deposits`
GROUP BY `deposit_group`, `magic_wand_creator`
ORDER BY `magic_wand_creator`, `deposit_group`;

SELECT
	CASE 
		WHEN `age` <= 10 THEN '[0-10]'
		WHEN `age` <= 20 THEN '[11-20]'
		WHEN `age` <= 30 THEN '[21-30]'
		WHEN `age` <= 40 THEN '[31-40]'
		WHEN `age` <= 50 THEN '[41-50]'
		WHEN `age` <= 60 THEN '[51-60]'
        ELSE '[61+]'
    END AS 'age_group',
	count(`age`) AS 'wizard_count'
FROM `wizzard_deposits`
GROUP BY `age_group`
ORDER BY `age_group`;

SELECT left(`first_name`, 1) AS 'first_letter'
FROM `wizzard_deposits`
WHERE `deposit_group` = 'Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter`;

SELECT `deposit_group`, `is_deposit_expired`, AVG(`deposit_interest`) AS 'average_interest'
from `wizzard_deposits`
where `deposit_start_date` > '1985/01/01'
GROUP BY `is_deposit_expired`, `deposit_group`
ORDER BY `deposit_group` DESC, `is_deposit_expired`;

SELECT sum(diff.next) as 'sum_difference'
from (
		SELECT `deposit_amount` - 
			(SELECT `deposit_amount`
            from `wizzard_deposits`
            WHERE `id` = wd.id + 1) AS 'next'
		FROM `wizzard_deposits` AS wd) AS diff;
        
SELECT `department_id`, min(`salary`) AS 'minimum_salary'
from `employees`
where `department_id` in (2, 5, 7) AND DATE (`hire_date`) > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id`; 

SELECT `department_id`, 
	CASE
		WHEN `department_id` = 1 THEN AVG(`salary`) + 5000
        ELSE AVG(`salary`)
	END AS 'avg_salary'
from `employees`
where `salary` > 30000 and `manager_id` != 42
GROUP BY `department_id`
ORDER BY `department_id`;

SELECT `department_id`, MAX(`salary`) AS 'max_salary'
from `employees`
GROUP BY `department_id`
HAVING `max_salary` NOT BETWEEN 30000 and 70000
ORDER BY `department_id`;

SELECT `department_id`,
    (SELECT DISTINCT `e2`.`salary`
        FROM `employees` AS `e2`
        WHERE `e2`.`department_id` = `e1`.`department_id`
        ORDER BY `e2`.`salary` DESC
        LIMIT 2 , 1) AS `third_highest_salary`
FROM `employees` AS `e1`
GROUP BY `department_id`
HAVING `third_highest_salary` IS NOT NULL;

SELECT e1.first_name, e1.last_name, e1.department_id
FROM employees AS e1
	JOIN
    (SELECT e2.department_id, AVG(e2.salary) AS dep_avg_salary
    FROM employees AS e2
    GROUP BY e2.department_id) AS e3 ON e1.department_id = e3.department_id
WHERE e1.salary > e3.dep_avg_salary
ORDER BY department_id
LIMIT 10;

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

