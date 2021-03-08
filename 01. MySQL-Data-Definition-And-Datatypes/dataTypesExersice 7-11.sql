CREATE TABLE `people` (
`id` INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
`name` VARCHAR(200) UNICODE NOT NULL,
`picture`BLOB,
`height` FLOAT(2),
`weight` FLOAT(2),
`gender` CHAR NOT NULL CHECK (`gender` = 'm' OR `gender` = 'f'),
`birthdate` DATETIME NOT NULL,
`biography` NVARCHAR(8000)
);
INSERT INTO `people` (id, name, picture, height, weight,
 gender, birthdate, biography)
VALUES
(1, "Pesho", NULL, 1.80, 90, "m", "1990-9-9", NULL),
(2, "Gosho", NULL, 1.90, 94, "m", "1985-8-10", NULL),
(3, "Martin", NULL, 1.70, 80, "m", "1986-12-15", NULL),
(4, "Stoyan", NULL, 1.88, 102, "m", "1993-3-25", NULL),
(5, "Stamat", NULL, 1.95, 75, "m", "1979-8-30", NULL);
 
 CREATE TABLE `users`(
 `id` INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
 `username` VARCHAR(30) UNIQUE NOT NULL,
 `password` VARCHAR(26) NOT NULL,
 `profile_picture` BLOB,
 `last_login_time` TIMESTAMP,
 `is_deleted` BOOLEAN
 );
 INSERT INTO `users` (id, username, password, profile_picture,
 last_login_time, is_deleted)
 VALUES
 (1, "Pesho", "hahaha", NULL, '0000-00-00 00:00:00', TRUE),
 (2, "Gosho", "fgafga", NULL, '0000-00-00 00:00:00', FALSE),
 (3, "Martin", "ada", NULL, '0000-00-00 00:00:00', FALSE),
 (4, "Stoyan", "jtfhr5r", NULL, '0000-00-00 00:00:00', TRUE),
 (5, "Stamat", "he4erdfvc", NULL, '0000-00-00 00:00:00', TRUE);
 
ALTER TABLE `users` MODIFY `id` INT NOT NULL;
ALTER TABLE `users` DROP PRIMARY KEY;
ALTER TABLE `users` ADD `pk_users` VARCHAR(50);
ALTER TABLE `users`
ADD CONSTRAINT `pk_users` PRIMARY KEY (`id`, `username`);

ALTER TABLE `users` 
MODIFY COLUMN `last_login_time` TIMESTAMP NOT NULL DEFAULT
 CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
 
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_id
PRIMARY KEY(id),
ADD CONSTRAINT uq_username
UNIQUE(username);


