SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT first_name, last_name
    FROM employees
    WHERE salary >'35000'
    ORDER BY first_name, last_name, employee_id;
END $$

CALL usp_get_employees_salary_above_35000()$$

CREATE PROCEDURE usp_get_employees_salary_above(`number` DECIMAL(10, 4))
BEGIN
	SELECT first_name, last_name
    FROM employees
    WHERE salary >= `number`
    ORDER BY first_name, last_name, employee_id;
END $$

CALL usp_get_employees_salary_above(48100)$$

CREATE PROCEDURE usp_get_towns_starting_with(`string` VARCHAR(50))
BEGIN
	SELECT `name` AS `town_name`
    FROM towns
    WHERE `name` LIKE concat(`string`, '%')
    ORDER BY `name`;
END $$

CALL usp_get_towns_starting_with('b')$$

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN
	SELECT first_name, last_name
    FROM employees AS e
    JOIN addresses AS a
    ON e.address_id = a.address_id
    JOIN towns AS t
    ON a.town_id = t.town_id
    WHERE t.name = town_name
    ORDER BY first_name, last_name, employee_id;
END$$

CALL usp_get_employees_from_town('Sofia')$$

CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(10, 4))
RETURNS VARCHAR(10)
BEGIN
	DECLARE result VARCHAR(10);
	IF salary < 30000 THEN SET result := 'low';
    ELSEIF salary BETWEEN 30000 AND 50000 THEN SET result := 'average';
    ELSEIF salary > 50000 THEN SET result := 'high';
	END IF;
    RETURN result;
END$$

SELECT ufn_get_salary_level(135000)$$

CREATE PROCEDURE usp_get_employees_by_salary_level(level_of_salary VARCHAR(10))
BEGIN
	SELECT first_name, last_name
    FROM employees 
    WHERE ufn_get_salary_level(salary) = level_of_salary
    ORDER BY first_name DESC, last_name DESC;
END$$

CALL usp_get_employees_by_salary_level('high')$$

CREATE FUNCTION ufn_is_word_comprised(letters varchar(50), word varchar(50))
RETURNS INT
BEGIN 
	DECLARE indx INT;
    DECLARE symbol VARCHAR(1);
    SET indx := 1;
    
    WHILE indx <= char_length(word) DO
    SET symbol = substring(word, indx, 1);
    IF locate(symbol, letters) = 0 THEN RETURN 0;
    END IF;
    SET indx := indx + 1;
    END WHILE;
    RETURN 1;
END $$

SELECT ufn_is_word_comprised('oistmiahf', 'Sofia') AS `result`$$

CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT concat(first_name, ' ', last_name) AS `full_name`
    FROM account_holders
    ORDER BY full_name;
END $$

CALL usp_get_holders_full_name()$$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(`number` DECIMAL(10, 4))
BEGIN
	SELECT ac.first_name, ac.last_name
    FROM account_holders  AS ac
    JOIN 	(SELECT id, account_holder_id, SUM(balance) AS `total_balance`
			FROM accounts AS a
			GROUP BY a.account_holder_id
			HAVING total_balance > `number`
            ORDER BY id) AS a
	ON ac.id = a.account_holder_id
    ORDER BY ac.first_name, ac.last_name, ac.id;
END $$

CALL usp_get_holders_with_balance_higher_than('7000')$$

CREATE FUNCTION ufn_calculate_future_value(init_sum DOUBLE, rate DOUBLE, num_of_years INT)
RETURNS DOUBLE
BEGIN 
		DECLARE future_value DOUBLE;
        SET future_value := init_sum * POW(1 + rate, num_of_years);
        RETURN future_value;
END $$

SELECT ufn_calculate_future_value(1000, 0.1, 5)$$

CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT, rate DOUBLE)
BEGIN
	SELECT a.id, ac.first_name, ac.last_name, a.balance, 
			round(ufn_calculate_future_value(a.balance, rate, 5), 4) AS `balance_in_5_years`
	FROM accounts AS a
	JOIN account_holders AS ac
	ON a.account_holder_id = ac.id
	WHERE ac.id = account_id
    LIMIT 1;
END $$

CALL usp_calculate_future_value_for_account('1', '0.1')$$

CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(10,4))
BEGIN
	START TRANSACTION;
    IF money_amount < 0 THEN ROLLBACK;
    ELSE 
		UPDATE accounts
        SET balance = balance + money_amount
        WHERE id = account_id;
	END IF;
END $$

CALL usp_deposit_money('1', '10')$$

CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
    IF money_amount < 0 THEN ROLLBACK;
    ELSEIF 
		((SELECT balance 
			FROM accounts 
            WHERE id = account_id) - money_amount) < 0 THEN ROLLBACK;
    ELSE 
		UPDATE accounts
        SET balance = balance - money_amount
        WHERE id = account_id;
	END IF;
END $$

CALL usp_withdraw_money('1', '100000')$$
