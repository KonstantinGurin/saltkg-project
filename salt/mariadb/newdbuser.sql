CREATE DATABASE kgtestdb;
GRANT ALL ON kgtestdb.* TO kgtestdb@localhost IDENTIFIED BY 'liefi7doh3phaa9uReirei4eteixie';
USE kgtestdb;
CREATE TABLE kgtestdb (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(1024));
INSERT INTO kgtestdb(name) VALUES ("Pizza");
INSERT INTO kgtestdb(name) VALUES ("Kala");
INSERT INTO kgtestdb(name) VALUES ("Olut");
INSERT INTO kgtestdb(name) VALUES ("Makkara");
INSERT INTO kgtestdb(name) VALUES ("Salaatti");
