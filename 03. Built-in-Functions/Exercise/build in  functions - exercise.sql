SELECT `first_name`, `last_name`
FROM `employees`
where `first_name` LIKE 'Sa%'
ORDER BY `employee_id`;

SELECT `first_name`, `last_name`
FROM `employees`
where `last_name` LIKE '%ei%'
ORDER BY `employee_id`;

SELECT `first_name`
FROM `employees`
where `department_id` IN(3, 10) AND YEAR(`hire_date`) >= 1995 AND
									YEAR(`hire_date`) <= 2005
ORDER BY `employee_id`;

SELECT `first_name`, `last_name`
FROM `employees`
where `job_title` NOT LIKE '%engineer%'
ORDER BY `employee_id`;

SELECT `name`
from `towns`
where char_length(`name`) IN (5,6)
ORDER BY `name`;

SELECT `town_id`, `name`
from `towns`
where `name` LIKE 'M%' or `name` like 'K%' or `name` like 'B%' or `name` like 'E%'
ORDER BY `name`;

CREATE VIEW `v_employees_hired_after_2000` as
SELECT `first_name`, `last_name`
from `employees`
where YEAR(`hire_date`) > 2000;

SELECT `first_name`, `last_name`
from `employees`
where char_length(`last_name`) = 5;

SELECT `peak_name`, `river_name`,
lower(concat(`peak_name`, SUBSTRING(`river_name`, 2))) as `mix`
from `peaks`, `rivers`
where right(`peak_name`, 1) = left(`river_name`, 1)
ORDER BY `mix`;

SELECT `name`, date_format(`start`, '%Y-%m-%d') AS 'start'
from `games`
where YEAR(`start`) IN (2011, 2012)
ORDER BY `start`, `name`
LIMIT 50;

SELECT `user_name`, SUBSTRING_INDEX(`email`, '@', - 1) AS 'Email Provider'
FROM `users`
ORDER BY `Email Provider` , `user_name`;

SELECT `user_name`, `ip_address`
FROM `users`
where `ip_address` like '___.1%.%.___'
ORDER BY `user_name`;

SELECT `name` AS 'game',
    CASE
        WHEN HOUR(`start`) >= 0 AND HOUR(`start`) < 12
        THEN 'Morning'
        WHEN HOUR(`start`) >= 12 AND HOUR(`start`) < 18
        THEN 'Afternoon'
        WHEN HOUR(`start`) >= 18 AND HOUR(`start`) < 24
        THEN 'Evening'
    END AS 'Part of the Day',
    CASE
        WHEN `duration` <= 3 THEN 'Extra Short'
        WHEN `duration` > 3 AND `duration` <= 6 THEN 'Short'
        WHEN `duration` > 6 AND `duration` <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM games;

SELECT
    product_name AS 'Product',
    order_date AS 'Date Ordered',
    DATE_ADD(order_date, INTERVAL 3 DAY) AS 'Pay Due',
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS 'Delivery Due'
FROM orders;