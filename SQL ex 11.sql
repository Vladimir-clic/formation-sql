
USE location_ski;

DROP TABLE IF EXISTS clients;
CREATE TABLE clients(
noCli INT NOT NULL,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
adresse VARCHAR(50) NOT NULL,
cpo INT NOT NULL,
ville VARCHAR(50) NOT NULL,
CONSTRAINT pk_clients PRIMARY KEY (noCli)
)ENGINE = INNODB;

DROP TABLE IF EXISTS fiches;
CREATE TABLE fiches(
noFic INT NOT NULL,
noCli INT NOT NULL,
dateCrea DATE NOT NULL,
datePaiement DATE,
etat VARCHAR(50) NOT NULL,
CONSTRAINT pk_fiches PRIMARY KEY (noFic)
)ENGINE = INNODB;

DROP TABLE IF EXISTS lignesFic;
CREATE TABLE lignesFic(
noLig INT NOT NULL,
noFic INT NOT NULL,
refart CHAR(8) NOT NULL,
depart DATE NOT NULL,
retour DATE,
CONSTRAINT pk_lignesFic PRIMARY KEY (noLig, noFic)
)ENGINE = INNODB;

DROP TABLE IF EXISTS articles;
CREATE TABLE articles(
refart CHAR(8) NOT NULL,
designation VARCHAR(80) NOT NULL,
codeGam CHAR(5),
codeCate CHAR(5),
CONSTRAINT pk_articles PRIMARY KEY (refart, designation)
)ENGINE = INNODB;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
codeCate CHAR(5) NOT NULL,
libelle VARCHAR(30) NOT NULL,
CONSTRAINT pk_categories PRIMARY KEY (codeCate)
)ENGINE = INNODB;

DROP TABLE IF EXISTS gammes;
CREATE TABLE gammes(
codeGam CHAR(5) NOT NULL,
libelle VARCHAR(45) NOT NULL,
CONSTRAINT pk_gammes PRIMARY KEY (codeGam)
)ENGINE = INNODB;

DROP TABLE IF EXISTS grilleTarifs;
CREATE TABLE grilleTarifs(
codeGam CHAR(5) NOT NULL,
codeCate CHAR(5) NOT NULL,
codeTarif CHAR(5),
CONSTRAINT pk_grilleTarifs PRIMARY KEY (codeGam, codeCate)
)ENGINE = INNODB;

DROP TABLE IF EXISTS tarifs;
CREATE TABLE tarifs(
codeTarif CHAR(5) NOT NULL,
libelle CHAR(30) NOT NULL,
prixjour DECIMAL(5.0) NOT NULL,
CONSTRAINT pk_tarifs PRIMARY KEY (codeTarif)
)ENGINE = INNODB;


INSERT INTO clients (noCli, nom, prenom, adresse, cpo, ville) VALUES 
    (1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens'),
    (2, 'Bernard', 'Barnabé', 'Rue du bar', '1000', 'Bourg en Bresse'),
    (3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes'),
    (4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon'),
     (5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne'),
    (6, 'Ferdinand', 'François', 'Rue de la convention', '44100', 'Nantes'),
    (9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris'),
    (14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');


INSERT INTO fiches (noFic, noCli, dateCrea, datePaiement, etat) VALUES 
    (1001, 14,  DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY),'SO' ),
    (1002, 4,  DATE_SUB(NOW(),INTERVAL  13 DAY), NULL, 'EC'),
    (1003, 1,  DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY),'SO'),
    (1004, 6,  DATE_SUB(NOW(),INTERVAL  11 DAY), NULL, 'EC'),
    (1005, 3,  DATE_SUB(NOW(),INTERVAL  10 DAY), NULL, 'EC'),
    (1006, 9,  DATE_SUB(NOW(),INTERVAL  10 DAY),NULL ,'RE'),
    (1007, 1,  DATE_SUB(NOW(),INTERVAL  3 DAY), NULL, 'EC'),
    (1008, 2,  DATE_SUB(NOW(),INTERVAL  0 DAY), NULL, 'EC');

INSERT INTO tarifs (codeTarif, libelle, prixJour) VALUES
    ('T1', 'Base', 10),
    ('T2', 'Chocolat', 15),
    ('T3', 'Bronze', 20),
    ('T4', 'Argent', 30),
    ('T5', 'Or', 50),
    ('T6', 'Platine', 90);

INSERT INTO gammes (codeGam, libelle) VALUES
    ('PR', 'Matériel Professionnel'),
    ('HG', 'Haut de gamme'),
    ('MG', 'Moyenne gamme'),
    ('EG', 'Entrée de gamme');

INSERT INTO categories (codeCate, libelle) VALUES
    ('MONO', 'Monoski'),
    ('SURF', 'Surf'),
    ('PA', 'Patinette'),
    ('FOA', 'Ski de fond alternatif'),
    ('FOP', 'Ski de fond patineur'),
    ('SA', 'Ski alpin');

INSERT INTO grilleTarifs (codeGam, codeCate, codeTarif) VALUES
    ('EG', 'MONO', 'T1'),
    ('MG', 'MONO', 'T2'),
    ('EG', 'SURF', 'T1'),
    ('MG', 'SURF', 'T2'),
    ('HG', 'SURF', 'T3'),
    ('PR', 'SURF', 'T5'),
    ('EG', 'PA', 'T1'),
    ('MG', 'PA', 'T2'),
    ('EG', 'FOA', 'T1'),
    ('MG', 'FOA', 'T2'),
    ('HG', 'FOA', 'T4'),
    ('PR', 'FOA', 'T6'),
    ('EG', 'FOP', 'T2'),
    ('MG', 'FOP', 'T3'),
    ('HG', 'FOP', 'T4'),
    ('PR', 'FOP', 'T6'),
    ('EG', 'SA', 'T1'),
    ('MG', 'SA', 'T2'),
    ('HG', 'SA', 'T4'),
    ('PR', 'SA', 'T6');

INSERT INTO articles (refart, designation, codeGam, codeCate) VALUES 
    ('F01', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F02', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F03', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F04', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F05', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
    ('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP'),
    ('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
    ('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('S01', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S02', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S03', 'Décathlon Apparition', 'EG', 'SURF'),
    ('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

INSERT INTO lignesFic (noFic, noLig,  refart, depart, retour) VALUES 
    (1001, 1, 'F05', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1001, 2, 'F50', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  14 DAY)),
    (1001, 3, 'F60', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1002, 1, 'A03', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1002, 2, 'A04', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  7 DAY)),
    (1002, 3, 'S03', DATE_SUB(NOW(),INTERVAL  8 DAY), NULL),
    (1003, 1, 'F50', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1003, 2, 'F05', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1004, 1, 'P01', DATE_SUB(NOW(),INTERVAL  6 DAY), NULL),
    (1005, 1, 'F05', DATE_SUB(NOW(),INTERVAL  9 DAY), DATE_SUB(NOW(),INTERVAL  5 DAY)),
    (1005, 2, 'F10', DATE_SUB(NOW(),INTERVAL  4 DAY), NULL),
    (1006, 1, 'S01', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 2, 'S02', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 3, 'S03', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1007, 1, 'F50', DATE_SUB(NOW(),INTERVAL  3 DAY), DATE_SUB(NOW(),INTERVAL  2 DAY)),
    (1007, 3, 'F60', DATE_SUB(NOW(),INTERVAL  1 DAY), NULL),
    (1007, 2, 'F05', DATE_SUB(NOW(),INTERVAL  3 DAY), NULL),
    (1007, 4, 'S02', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL),
    (1008, 1, 'S01', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL);

# 1 )Liste des clients dont le nom commence par un d
# SELECT * FROM clients WHERE nom LIKE 'd%';

# 2) Nom et prénoms de tous les clients
# SELECT prenom, nom FROM clients;

# 3) Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44)
# SELECT f.noFic, f.etat, c.nom, c.prenom FROM clients c LEFT JOIN fiches f ON c.noCli = f.noCli WHERE c.cpo LIKE '44%';

# 4)  Détail de la fiche n°1002
# SELECT DISTINCT f.noFic, cl.nom, cl.prenom, l.refart, a.designation, l.depart, COALESCE(l.retour, CURDATE()), t.prixjour, (DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart)*t.prixjour) AS Montant FROM fiches f LEFT JOIN clients cl on cl.noCli = f.noCli LEFT JOIN lignesfic l on l.noFic = f.noFic LEFT JOIN articles a on a.refart = l.refart LEFT JOIN categories ca on ca.codeCate = a.codeCate LEFT JOIN gammes ga on ga.codeGam = a.codeGam LEFT JOIN grilletarifs gr on gr.codeGam = ga.codeGam LEFT JOIN tarifs t on t.codeTarif = gr.codeTarif WHERE f.noFic = '1002' l.refart

# 5) Prix journalier moyen de location par gamme
# SELECT ga.libelle AS Gamme, AVG(t.prixjour) AS tarif_journalier_moyen FROM tarifs t INNER JOIN grilleTarifs gr ON t.codeTarif = gr.codeTarif INNER JOIN gammes ga ON gr.codeGam = ga.codeGam GROUP BY ga.libelle;

# 6) Détail de la fiche n°1002 avec le total
# SELECT DISTINCT f.noFic, cl.nom, cl.prenom, l.refart, a.designation, l.depart, COALESCE(l.retour, CURDATE()) AS retour, t.prixjour, (DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart)*t.prixjour) AS Montant, SUM((DATEDIFF(COALESCE(l.retour, CURDATE()), l.depart)*t.prixjour)) OVER (PARTITION BY l.refart) AS Total FROM fiches f LEFT JOIN clients cl ON cl.noCli = f.noCli LEFT JOIN lignesfic l ON l.noFic = f.noFic LEFT JOIN articles a ON a.refart = l.refart LEFT JOIN categories ca ON ca.codeCate = a.codeCate LEFT JOIN gammes ga ON ga.codeGam = a.codeGam LEFT JOIN grilletarifs gr ON gr.codeGam = ga.codeGam LEFT JOIN tarifs t ON t.codeTarif = gr.codeTarif WHERE f.noFic = '1002' GROUP BY l.refart ORDER BY l.refart;

# 7) Grille des tarifs
# SELECT ca.libelle AS libelle, ga.libelle AS libelle, t.libelle AS libelle, t.prixjour FROM fiches f LEFT JOIN clients cl ON cl.noCli = f.noCli LEFT JOIN lignesfic l ON l.noFic = f.noFic LEFT JOIN articles a ON a.refart = l.refart LEFT JOIN categories ca ON ca.codeCate = a.codeCate LEFT JOIN gammes ga ON ga.codeGam = a.codeGam LEFT JOIN grilletarifs gr ON gr.codeGam = ga.codeGam LEFT JOIN tarifs t ON t.codeTarif = gr.codeTarif ORDER BY ga.libelle, ca.libelle;