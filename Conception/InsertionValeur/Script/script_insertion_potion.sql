START TRANSACTION;
INSERT INTO potion (NomPotion,Diluant,PrixPotion,Inventeur)
VALUES ('Potion de bouclier','Vin','474','Marko'),
('Huile de bénédiction d arme','Jus de Fruit','799','Merlin'),
('Huile de gourdin magique','Eau','481','Nobru'),
('Huile de pierre magique','Vin','345','Lexandre'),
('Potion des ténèbres','Vin','658','MagicLord');
COMMIT;