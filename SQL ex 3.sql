USE zoo;
-- vider la table
TRUNCATE chat;
-- INSERTION DES DONNES
INSERT INTO chat (nom,yeux,age)
VALUES
('maine coon','marron',20),
('siamois','bleu',15),
('bengal','marron',18),
('scottish Fold','marron',10);

SELECT 
    id, nom, yeux, age 
FROM chat 
WHERE id=2;

SELECT
    id,nom,yeux,age
FROM chat
ORDER BY nom,age;

SELECT 
    nom, age 
FROM chat 
WHERE age >=11
AND age <=19;

SELECT 
    nom, age 
FROM chat  
WHERE nom LIKE 'sia%';

SELECT 
    nom, age 
FROM chat  
WHERE nom LIKE '%a%';

SELECT 
    AVG(age) AS age_moyen
FROM chat; 

SELECT 
    COUNT(id) AS nb_chat
FROM chat; 

SELECT
    yeux AS couleur,
    COUNT(id) AS nb_chat
FROM chat
WHERE yeux ='marron'
GROUP BY (yeux);

SELECT
id,
nom,
yeux,
age
FROM chat
ORDER BY AGE ASC
LIMIT 1;

SELECT
id,
nom,
yeux,
age
FROM chat
ORDER BY AGE DESC
LIMIT 1;

SELECT
    yeux AS couleur,
    COUNT(id) AS nb_chat
FROM chat
GROUP BY (yeux);



