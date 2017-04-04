START TRANSACTION;
INSERT INTO ingredient (NomIngredient, Fraicheur, PrixIngredient) 
VALUES ('Sardonyx','56','20'),
('Branche de sauge maléfique','464','20'),
('Epée longue de maître','63','15'),
('Epée courte','74','14'),
('Chemise de maille','12','15'),
('Epée bâtarde','66','12'),
('Carreaux','64','13'),
('Bottes de sept lieues','984','12'),
('Arbalète légère de maître','44','16'),
('Quartz bleu','56','18'),
('Ongle de lutin','56','18'),
('Harnois','56','18'),
('Perle noire','748','12');

INSERT INTO Onguent (NomOnguent,PrixOnguent,Inventeur)
VALUES ('Onguent de bouclier','263','Alucard'),
('Onguent de ténèbres','485','Saruman'),
('Huile de gourdin maudite','487','Gandalf'),
('Huile de pierre maudite','112','Alucard'),
('Onguent des ténèbres','345','Saruman');


INSERT INTO `recipient` (`TypeRecipient`,`PrixRecipient`,`Volume`) 
VALUES
('Fiole','5','1'),
('Tube','22','2'),
('Pot','34','5'),
('Amphore','70','5'),
('Fût','126','10');

INSERT INTO potion (NomPotion,Diluant,PrixPotion,Inventeur)
VALUES ('Potion de bouclier','Vin','474','Marko'),
('Huile de bénédiction d arme','Jus de Fruit','799','Merlin'),
('Huile de gourdin magique','Eau','481','Nobru'),
('Huile de pierre magique','Vin','345','Lexandre'),
('Potion des ténèbres','Vin','658','MagicLord');
COMMIT;

START TRANSACTION;
INSERT INTO onguentingredient (IDingredient,IDonguent)
VALUES ('1','1'),
('3','1'),
('6','1'),
('1','2'),
('6','2'),
('4','2'),
('13','3'),
('9','3'),
('5','3'),
('6','3'),
('1','4'),
('11','4'),
('10','4'),
('9','5'),
('2','5'),
('7','5');
COMMIT;
