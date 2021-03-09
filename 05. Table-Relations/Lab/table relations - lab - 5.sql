CREATE table `clients`(
`id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`client_name` VARCHAR (100),
`project_id` INT (11)
);

Create table `projects`(
`id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`client_id` INT(11),
`project_lead_id` INT(11)
);

CREATE table `employees`(
`id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR (30),
`last_name` VARCHAR (30),
`project_id` INT (11)
);

ALTER TABLE employees 
	ADD CONSTRAINT fk_projects_employees
    FOREIGN KEY (project_id)
    REFERENCES projects(id);
    
ALTER TABLE clients 
	ADD CONSTRAINT fk_projects_clients
    FOREIGN KEY (project_id)
    REFERENCES projects(id);
    
ALTER TABLE projects 
	ADD CONSTRAINT fk_clients_projects
    FOREIGN KEY (client_id)
    REFERENCES clients(id),
    ADD CONSTRAINT fk_emoloyees_projects
    FOREIGN KEY (project_lead_id)
    REFERENCES employees(id);