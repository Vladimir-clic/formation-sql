# CREATE DATABASE invitation;
USE invitation;
DROP TABLE IF EXISTS personne;
CREATE TABLE personne(
id INT NOT NULL auto_increment primary key,
prenom VARCHAR(100) NOT NULL,
nom VARCHAR(100) NOT NULL,
age INT NOT NULL,
inscription DATE NOT NULL,
etat INT NOT NULL,
statut ENUM('membre', 'non membre') NOT NULL,
cv VARCHAR(100) NOT NULL,
salaire INT NOT NULL
)ENGINE=INNODB;

INSERT INTO personne (prenom, nom, age, inscription, etat, statut, cv, salaire) VALUES
('Brad', 'PITT', 60, '1970-01-01', 1, 'non membre', 'lorem ipsum', 2000000),
('George', 'CLONEY', 62, '1999-01-01', 1, 'membre', 'juste beau', 4000000),
('Jean', 'DUJARDIN', 51, '1994-01-01', 0, 'membre', 'brice de nice', 1000000);

# SELECT MAX(salaire) FROM personne;
# SELECT MIN(salaire) FROM personne;
# SELECT nom, salaire FROM personne ORDER BY salaire DESC LIMIT 1;
# SELECT AVG(salaire) FROM personne
# SELECT COUNT(salaire) FROM personne
# SELECT * FROM personne WHERE salaire BETWEEN '1000000' AND '4000000';
# SELECT id, upper(prenom) AS prenom_upper, LOWER(nom) AS nom_upper FROM personne
# SELECT * FROM personne WHERE prenom LIKE '%bra%'
# SELECT * FROM personne ORDER BY age DESC
# SELECT * FROM personne WHERE statut = 'membre'
# SELECT COUNT(statut = 'membre') FROM personne
SELECT statut, COUNT(id) FROM personne GROUP BY statut
