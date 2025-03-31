DROP DATABASE IF EXISTS my_crm;
CREATE DATABASE my_crm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE my_crm;


CREATE TABLE client (
 id INT NOT NULL AUTO_INCREMENT,
 nom VARCHAR(255) NOT NULL,
 CONSTRAINT pk_client PRIMARY KEY (id)
)ENGINE=INNODB;

CREATE TABLE projet(
 id INT NOT NULL AUTO_INCREMENT,
 client_id INT NOT NULL,
 nom VARCHAR(255) NOT NULL,
 CONSTRAINT pk_projet PRIMARY KEY (id)
)ENGINE=INNODB;

CREATE TABLE devis(
 id INT NOT NULL AUTO_INCREMENT,
 version INT NOT NULL,
 reference VARCHAR(10) NOT NULL,
 prix FLOAT NOT NULL,
 projet_id INT NOT NULL,
 CONSTRAINT pk_devis PRIMARY KEY (id)
)ENGINE=INNODB;

CREATE TABLE facture(
 id INT NOT NULL AUTO_INCREMENT,
 reference VARCHAR(10) NOT NULL,
 info VARCHAR(255) NOT NULL,
 total FLOAT NOT NULL,
 date_crea DATE NOT NULL,
 date_paiement DATE NULL,
 devis_id INT NOT NULL,
 CONSTRAINT pk_facture PRIMARY KEY (id)
)ENGINE=INNODB;

-- fk_client dans table projet
ALTER TABLE projet 
ADD CONSTRAINT fk_client 
FOREIGN KEY projet(client_id) 
REFERENCES client(id);

-- fk_projet dans table devis
ALTER TABLE devis 
ADD CONSTRAINT fk_projets 
FOREIGN KEY devis(projet_id) 
REFERENCES projet(id);

-- fk_devis dans table facture
ALTER TABLE facture 
ADD CONSTRAINT fk_devis 
FOREIGN KEY facture(devis_id) 
REFERENCES devis(id);

###############################
# Ajouter les données  
###############################

INSERT INTO client (nom) VALUES 
	('Mairie de Rennes'),
	('Neo Soft'),
	('Sopra'),
	('Accenture'),
	('Amazon');
INSERT INTO projet (nom, client_id) VALUES
	('Création de site internet', 1),
	('Logiciel CRM', 2),
	('Logiciel de devis', 3),
	('Site internet e-commerce', 4),
	('Logiciel ERP', 2),
	('Logiciel gestion de stock',5);

INSERT INTO devis (version,reference, prix, projet_id) VALUES
	('1','DEV2100A', 3000, 1),
	('2','DEV2100B', 5000, 1),
	('1','DEV2100C', 5000, 2),
	('1','DEV2100D', 3000, 3),
	('1','DEV2100E', 5000, 4),
	('1','DEV2100F', 2000, 5),
	('1','DEV2100G', 1000, 6);

INSERT INTO facture (reference,info,total,devis_id,date_crea,date_paiement)	
    VALUES
	('FA001', 'site internet partie 1', 1500, 1, '2023-09-01','2023-10-01'),
	('FA002', 'site internet partie 2', 1500, 1, '2023-09-20',null),
	('FA003', 'logiciel CRM', 5000, 3, '2024-02-01',null),
	('FA004', 'logiciel devis', 3000, 4, '2024-03-03','2024-04-03'),
	('FA005', 'site ecommerce', 5000, 5, '2023-03-01',null),
	('FA006', 'logiciel ERP', 2000, 6, '2023-03-01',null);
    
# SELECT f.reference AS ref, c.nom AS client, f.info, f.total, f.date_crea AS date, f.date_paiement AS paiement FROM facture f INNER JOIN devis d ON f.devis_id = d.id INNER JOIN projet p ON d.projet_id = p.id INNER JOIN client c ON p.client_id = c.id;
# SELECT c.nom AS client, COUNT(f.reference) AS nb_facture FROM  client c INNER JOIN projet p ON c.id = p.client_id INNER JOIN devis d ON p.id = d.projet_id INNER JOIN facture f ON d.id = f.devis_id GROUP BY  c.nom;
# SELECT  c.nom AS client, f.total AS ca_par_client FROM client c LEFT JOIN projet p ON c.id = p.client_id LEFT JOIN devis d ON p.id = d.projet_id LEFT JOIN facture f ON d.id = f.devis_id GROUP BY  c.nom;
# SELECT SUM(total) FROM facture
# SELECT  SUM(f.total) AS somme_factures_en_attente FROM facture f WHERE  f.date_paiement IS NULL;
# SELECT reference AS factures, DATEDIFF(NOW(),date_crea) FROM facture WHERE date_paiement IS NULL;
# SELECT c.nom AS clients, f.reference AS factures, DATEDIFF(NOW(),date_crea) AS nb_jour, CONCAT(DATEDIFF(NOW(),date_crea)*2 ,' euros') AS penalite  FROM facture f INNER JOIN devis d ON f.devis_id = d.id INNER JOIN projet p ON d.projet_id = p.id INNER JOIN client c ON p.client_id = c.id WHERE date_paiement IS NULL
# select sum(facture.total)/count(DISTINCT client.nom) as moyenne_ca_client from client INNER JOIN projet on client.id = projet.client_id INNER JOIN devis on projet.id = devis.projet_id INNER JOIN facture on devis.id = facture.devis_id





