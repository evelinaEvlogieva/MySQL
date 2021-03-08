CREATE DATABASE Movies;
USE Movies;
CREATE TABLE IF NOT EXISTS `directors`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    director_name VARCHAR(255) NOT NULL,
    notes TEXT
);
CREATE TABLE IF NOT EXISTS `genres`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    genre_name VARCHAR(255) NOT NULL,
    notes TEXT
);	
CREATE TABLE IF NOT EXISTS `categories`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    category_name VARCHAR(255) NOT NULL,
    notes TEXT
);
CREATE TABLE IF NOT EXISTS `movies`(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    director_id INT REFERENCES directors(id),
    copyright_year YEAR,
    length INT,
    genre_id INT REFERENCES genres(id),
    category_id INT REFERENCES categories(id),
    rating INT,
    notes TEXT
);
INSERT INTO `directors` VALUES
	(1,"Gosho","note"),
    (2,"Gosho","note"),
    (3,"Gosho","note"),
    (4,"Gosho","note"),
    (5,"Gosho","note");
INSERT INTO `genres` VALUES
	(1,"drama","note"),
    (2,"drama","note"),
    (3,"drama","note"),
    (4,"drama","note"),
    (5,"drama","note");
INSERT INTO `categories` VALUES
	(1,"cat1","note"),
    (2,"cat1","note"),
    (3,"cat1","note"),
    (4,"cat1","note"),
    (5,"cat1","note");
INSERT INTO `movies` VALUES
	(1,"mr bean",2,'2008',2,2,1,6,"note1"),
    (2,"mr bean",2,'2005',2,2,1,6,"note2"),
    (3,"mr bean",2,'2008',2,2,3,6,"note3"),
    (4,"mr bean",2,'2003',2,1,2,6,"note4"),
    (5,"mr bean",2,'2006',2,2,2,6,"note5");