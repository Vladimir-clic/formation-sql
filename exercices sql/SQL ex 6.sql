DROP DATABASE IF EXISTS Netflix;
CREATE DATABASE Netflix CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE Netflix;

DROP TABLE IF EXISTS film;
CREATE TABLE film(
id INT NOT NULL AUTO_INCREMENT,
titre VARCHAR(50) NOT NULL,
sortie DATE NOT NULL,
categorie_id INT,
CONSTRAINT pk_film PRIMARY KEY (id)
)ENGINE=INNODB;

DROP TABLE IF EXISTS categ;
CREATE TABLE categ(
id INT NOT NULL AUTO_INCREMENT,
categorie VARCHAR(50) NOT NULL,
CONSTRAINT pk_categ PRIMARY KEY (id)
)ENGINE=INNODB;

-- ajout de la contrainte de clef etrangere foreign key
ALTER TABLE film ADD CONSTRAINT pk_categ FOREIGN KEY (categorie_id) REFERENCES categ(id);

INSERT INTO categ(categorie)
values ('Science Fiction'), ('Thriller');

INSERT INTO film(titre, sortie, categorie_id)
VALUES 
  ('STAR WARS', '1977-05-25', 1), 
  ('THE MATRIX', '1999-06-23', 1), 
  ('PULP FICTION', '1994-10-26', 2);

# SELECT film.id, film.titre, film.sortie, categ.categorie FROM film INNER JOIN categ ON film.categorie_id = categ.id;
SELECT categorie, COUNT(id) FROM categ GROUP BY categorie;
SELECT categ.categorie, COUNT(film.id) AS nombre_films FROM categ LEFT JOIN film ON categ.id = film.categorie_id GROUP BY categ.categorie;

