DROP DATABASE IF EXISTS spa;
CREATE DATABASE spa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE spa;

DROP TABLE IF EXISTS chat;
CREATE TABLE chat(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(20) NOT NULL,
age INT NOT NULL,
couleur_id INT null,
CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;


DROP TABLE IF EXISTS couleur;
CREATE TABLE couleur (
id INT NOT NULL auto_increment,
yeux VARCHAR(20) NOT NULL,
CONSTRAINT pk_couleur PRIMARY KEY (id)
)ENGINE=INNODB;

-- ajout de la contrainte de clef etrangere foreign key
ALTER TABLE chat ADD CONSTRAINT fk_couleur FOREIGN KEY chat(couleur_id) REFERENCES couleur(id);

INSERT INTO couleur (yeux) VALUES ('marron');
INSERT INTO couleur (yeux) VALUES ('bleu');
INSERT INTO couleur (yeux) VALUES ('vert');

INSERT INTO chat (nom, age, couleur_id) VALUES ('maine coon', '20', '1');
INSERT INTO chat (nom, age, couleur_id) VALUES ('siamois', '15', '2');
INSERT INTO chat (nom, age, couleur_id) VALUES ('bengal', '18', '1');
INSERT INTO chat (nom, age, couleur_id) VALUES ('scottish fold', '10', '1');
INSERT INTO chat (nom, age) VALUES ('domestique', '21');

# SELECT nom, age, yeux FROM chat INNER JOIN couleur ON chat.couleur_id = couleur.id
# SELECT nom, age, yeux FROM chat LEFT JOIN couleur ON chat.couleur_id = couleur.id
# SELECT * FROM chat Where couleur_id is NULL
#SELECT c.yeux AS couleur_yeux, COUNT(ch.id) AS nombre_chats FROM couleur c LEFT JOIN chat ch ON c.id = ch.couleur_id GROUP BY c.yeux;
SELECT avg(info.nb_chat) as moyenne_couleur_yeux 
FROM(
SELECT
	couleur.nom AS couleur,
	COUNT(chat.id) AS nb_chat
	FROM couleur
	LEFT JOIN chat 
	ON couleur.id = chat.couleur_id
	GROUP BY(couleur.id)) as info ;
