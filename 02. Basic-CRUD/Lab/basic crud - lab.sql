SELECT `id`, `first_name`, `last_name`, `job_title`
FROM `employees` ORDER BY `id`;

SELECT `id`, concat(`first_name`, ' ', `last_name`) as `full_name`,
`job_title`, `salary`
from `employees`
where `salary` > 1000.00;

UPDATE `employees` SET `salary` = `salary` * 1.1
where `job_title` = 'Therapist';
SELECT `salary` FROM `employees`
ORDER BY `salary` ASC;

SELECT * FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;

SELECT * FROM `employees`
WHERE `department_id` = 4 AND `salary` >= 1600
ORDER BY `id`;

DELETE FROM `employees`
WHERE `department_id` <= 2;
SELECT * FROM `employees`
ORDER BY `id`;