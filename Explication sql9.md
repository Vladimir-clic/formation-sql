# Explication SQL 9

##### Création de la database site e-commerce
```sql
DROP DATABASE IF EXISTS site_e_commerce;
CREATE DATABASE site_e_commerce CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE site_e_commerce;
```

##### Table article
```sql
DROP TABLE IF EXISTS article;
CREATE TABLE article (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prix FLOAT NOT NULL
) ENGINE=INNODB;
```
##### Table client
```sql
DROP TABLE IF EXISTS client;
CREATE TABLE client (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL
) ENGINE=INNODB;
```

##### Table commande
```sql
DROP TABLE IF EXISTS commande;
CREATE TABLE commande (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date_achat DATE NOT NULL,
  client_id INT NOT NULL,
  article_id INT NOT NULL,
  nombre INT NOT NULL,
  total INT NOT NULL,
  CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES client(id),
  CONSTRAINT fk_article FOREIGN KEY (article_id) REFERENCES article(id)
) ENGINE=INNODB;
```
##### Table article
|nom|prix|
|---|---|
|PlayStation5| 400.00|
|Xbox|350.00|
|Machine à café| 300.00|
|PlayStation3| 100.00|

```sql
INSERT INTO article (nom, prix) VALUES
('PlayStation5', 400.00),
('Xbox', 350.00),
('Machine à café', 300.00),
('PlayStation3', 100.00);
```
##### Table client
|Prénom|Nom|
|---|---|
|Brad|PITT|
|George|CLONEY|
|Jean|DUJARDIN|

```SQL
INSERT INTO client (prenom, nom) VALUES
('Brad', 'PITT'),
('George', 'CLONEY'),
('Jean', 'DUJARDIN');
```
##### Table commande
|date d'achat|id client|id article|nombre|total|
|---|---|---|---|---|
|2024/09/08|1|2|1|350.00|
|2024/09/08|2|3|1|300.00|
|2024/09/08|3|4|1|200.00|

```sql
INSERT INTO commande (date_achat, client_id, article_id, nombre, total) VALUES
('2024-09-08', 1, 2, 1, 350.00),
('2024-09-08', 2, 3, 1, 300.00),
('2024-09-08', 3, 4, 1, 200.00);
```

```sql
SELECT 
    cl.prenom, 
    cl.nom, 
    co.date_achat, 
    ar.nom, 
    ar.prix, 
    COUNT(co.nombre), 
    co.total
FROM 
    commande co
INNER JOIN 
    client cl ON co.client_id = cl.id
INNER JOIN 
    article ar ON co.article_id = ar.id
GROUP BY ar.nom
```