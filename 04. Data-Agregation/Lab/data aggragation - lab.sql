SELECT `department_id`, 
SUM(`salary`) as `Total salary`
from `employees`
GROUP BY `department_id`
ORDER BY `department_id`;

SELECT `department_id`, COUNT(`id`) AS `Number of employees`
from `employees`
GROUP BY `department_id`
ORDER BY `department_id`;

SELECT `department_id`, round(avg(`salary`), 2) as `Average Salary`
from `employees`
GROUP BY `department_id`
ORDER BY `department_id`;

SELECT `department_id`, round(min(`salary`), 2) as `Min Salary`
from `employees`
GROUP BY `department_id`
HAVING `Min Salary` > 800;

SELECT count(*) 
from `products`
where `category_id` = 2  and price > 8;

SELECT `category_id`,
	round(avg(`price`), 2) as `Average Price`,
	round(min(`price`), 2) as `Cheapest Product`,
	round(max(`price`), 2) as `Most Expensive Product`
    from `products`
    GROUP BY `category_id`;