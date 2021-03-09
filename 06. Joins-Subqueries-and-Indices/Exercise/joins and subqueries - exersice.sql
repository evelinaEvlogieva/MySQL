SELECT e.employee_id, e.job_title, a.address_id, 
a.address_text
FROM employees AS e
JOIN addresses AS a
ON e.address_id = a.address_id
ORDER BY e.address_id
LIMIT 5;

SELECT e.first_name, e.last_name, t.name, 
a.address_text
FROM addresses AS a
JOIN employees AS e
ON e.address_id = a.address_id
JOIN towns AS t
ON t.town_id = a.town_id
ORDER BY first_name, last_name
LIMIT 5;

SELECT e.employee_id, e.first_name, e.last_name,
d.name  AS 'department_name'
FROM employees AS e
JOIN departments AS d
ON d.department_id = e.department_id
WHERE d.name = "Sales"
ORDER BY e.employee_id DESC;

SELECT e.employee_id, e.first_name, e.salary, d.name AS 'department_name'
FROM employees AS e
JOIN departments AS d
ON d.department_id = e.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

SELECT e.employee_id, e.first_name
FROM employees AS e
LEFT JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

SELECT e.first_name, e.last_name, e.hire_date,
d.name  AS 'dept_name'
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE DATE(e.hire_date) > '1999-01-01' AND d.name IN ("Sales", "Finance")
ORDER BY e.hire_date;

SELECT e.employee_id, e.first_name, p.name AS 'project_name'
FROM employees_projects AS ep
JOIN employees AS e
ON ep.employee_id = e.employee_id
JOIN projects AS p
ON ep.project_id = p.project_id
WHERE ep.project_id IS NOT NUll AND DATE(p.start_date) > '2002-08-13' 
					AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5;

SELECT e.employee_id, e.first_name,
IF (YEAR(p.start_date) >= '2005-01-01', NULL, p.name) AS 'project_name'
FROM employees AS e
JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
JOIN projects AS p
ON p.project_id = ep.project_id
WHERE e.employee_id = 24 
ORDER BY p.name;

SELECT e1.employee_id, e1.first_name, e1.manager_id,
e2.first_name AS 'manager_name'
FROM employees AS e1
JOIN employees AS e2
ON e2.employee_id = e1.manager_id
WHERE e1.manager_id IN (3, 7)
ORDER BY e1.first_name;

SELECT e.employee_id, 
CONCAT(e.first_name, ' ', e.last_name) AS 'employee_name',
CONCAT(m.first_name, ' ', m.last_name) AS 'manager_name',
d.name AS 'department_name'
FROM employees AS e
JOIN employees AS m
ON m.employee_id = e.manager_id
JOIN departments AS d
ON e.department_id = d.department_id
WHERE m.employee_id is NOT NULL
ORDER BY e.employee_id
LIMIT 5;

SELECT MIN(s.average_salary) AS 'min_average_salary'
FROM (SELECT AVG(salary) AS 'average_salary'
		FROM employees
        GROUP BY department_id) AS s;


SELECT mc.country_code, m.mountain_range, p.peak_name, p.elevation
FROM mountains AS m
JOIN mountains_countries as mc
ON m.id = mc.mountain_id
JOIN peaks AS p
ON m.id = p.mountain_id
WHERE mc.country_code = "BG" AND p.elevation > 2835
ORDER BY p.elevation DESC;

SELECT mc.country_code, COUNT(m.mountain_range) AS 'mountain_range'
FROM mountains AS m
JOIN mountains_countries AS mc
ON m.id = mc.mountain_id
WHERE mc.country_code IN ('BG', 'RU', 'US')
GROUP BY mc.country_code
ORDER BY mountain_range DESC;

SELECT c.country_name, r.river_name
FROM countries AS c
LEFT JOIN countries_rivers AS cr
ON c.country_code = cr.country_code
LEFT JOIN rivers AS r
ON cr.river_id = r.id
WHERE c.continent_code = "AF"
ORDER BY c.country_name
LIMIT 5;

SELECT (COUNT(*) - COUNT(mc.mountain_id)) AS country_count  
FROM countries AS c
LEFT JOIN mountains_countries As mc
ON c.country_code = mc.country_code;

SELECT c.country_name, MAX(p.elevation) AS highest_peak_elevation,
MAX(r.length) AS longest_river_length
FROM countries AS c
LEFT JOIN mountains_countries as mc 
ON c.country_code = mc.country_code 
LEFT JOIN peaks AS p 
ON mc.mountain_id = p.mountain_id
LEFT JOIN countries_rivers AS cr 
ON cr.country_code = c.country_code
LEFT JOIN rivers as r 
ON r.id = cr.river_id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name
LIMIT 5;
