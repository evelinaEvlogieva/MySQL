SELECT `peak_name`
FROM `peaks`
ORDER BY `peak_name`;

SELECT `country_name`, `population`
FROM `countries`
where `continent_code` = 'EU'
ORDER BY `population` DESC, `country_name`
LIMIT 30;

SELECT `country_name`, `country_code`,
IF (`currency_code` = 'EUR', 'Euro', 'Not Euro') AS `currency`
from `countries`
ORDER BY `country_name`;