SELECT `title`
from `books`
where substring(`title`, 1, 3) = 'The'
ORDER BY `id`;

SELECT replace(`title`, 'The', '***') AS `title`
from `books`
where substring(`title`, 1, 3) = 'The'
ORDER BY `id`;

SELECT round(SUM(`cost`), 2)
from `books`;

SELECT  concat(`first_name`, ' ', `last_name`) AS 'Full Name', 
TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived' 
FROM `authors`;

SELECT `title`
from `books`
WHERE `title` LIKE 'Harry Potter%'
ORDER BY `id`;
