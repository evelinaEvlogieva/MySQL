CREATE TABLE `mountains` (
`id` int not null PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50)
);

CREATE TABLE `peaks`(
`id` int not null PRIMARY KEY AUTO_INCREMENT,
`name` varchar(50),
`mountain_id` int
);

ALTER TABLE `peaks`
ADD CONSTRAINT fk_peaks_montains
FOREIGN KEY (`mountain_id`)
REFERENCES `mountains`(`id`)
ON DELETE CASCADE;

SELECT `driver_id`, `vehicle_type`,
concat(`first_name`, ' ', `last_name`) as 'driver_name'
from `vehicles` AS v
JOIN `campers` AS c ON
v.driver_id = c.id;

DELETE FROM `mountains`
where id = 1;

SELECT `starting_point` AS 'route_starting_point',
		`end_point` AS `route_ending_point`,
        `leader_id`,
		concat(`first_name`, ' ', `last_name`) AS 'leader_name'
FROM `routes` AS r
JOIN `campers` AS c
ON r.leader_id = c.id;


