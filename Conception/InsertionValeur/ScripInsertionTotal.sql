START TRANSACTION;
INSERT INTO ingredient (NomIngredient, Fraicheur, PrixIngredient) 
VALUES 
('Aigue-marine','56','20'),
('Alexandrite','464','20'),
('Azurite','63','15'),
('Chrysobéryl','74','14'),
('Grenat rouge','12','15'),
('Grenat violet','66','12'),
('Irtios','64','13'),
('Ivoire','984','12'),
('Lapis-Lazuli','44','16'),
('Néphrite','498','13'),
('Orprase','49','12'),
('Péridot','16','15'),
('Perle dorée','56','18'),
('Perle noire','748','12');
INSERT INTO Onguent (NomOnguent, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, PrixOnguent, Inventeur) 
VALUES
('Onguent d arme magique','Sardonyx','Branche de sauge maléfique','Epée longue maudite','','','313','Alucard'),
('Onguent de bénédiction d arme','Perle argentée','Epée courte','Chemise de maille','','','131','Dr Strange'),
('Onguent de gourdin magique','Perle argentée','Epée bâtarde','Carreaux','','','381','Saruman'),
('Onguent de pierre magique','Sardonyx','Botte de sept lieues','Arbalète légère maudite','','','335','Alucard'),
('Onguent de ténèbres','Quartz rouge','Ongles de lutin','Harnais','','','658','Severus Rogue'),
('Onguent d agrandissement','Perle noire','Potion de sagesse de hibou','Harnais','','','1115','Alucard'),
('Onguent d aide','Irtios','Amulette d armure naturelle','Chemise de maille','','','1132',''),
('Onguent d alignement indétectable','Grenat rouge','Epée courte','Arbalète légère maudite','','','316','Severus Rogue'),
('Onguent d armure de mage','Grenat violet','Urgrosh nain','Hache de guerre naine maudite','','','123','Dumbledore'),
('Onguent de bouclier de la foi','Lapis-lazuli','Epée courte','Armure de cuir cloutée maudite','','','336','Dumbledore'),
('Onguent de protection contre le bien','Grenat rouge','Ecu en titane','menottes de qualité supérieure','Elixir secret','','212','Saruman'),
('Onguent de protection contree les projectiles','Pierre solaire','Branche de sauge maléfique','Pierre(s) à tonnerre','Poudre secrète','','162','Dumbledore'),
('Onguent de pattes d araignée','Chrysabéryl','Cheveux de sorcières','Hache de guerre naine maudite','','','313','Eliar Kelliuic h'),
('Onguent de délivrance de la paralysie','Spadumène','Onguent d intemporalité','Harnais','','','1163','Severus Rogue'),
('Onguent de détection faussée','Grenat violet','Parchemin divin','Pic de guerre léger maudite','','','525','Saruman');
INSERT INTO `recipient` (`TypeRecipient`,`PrixRecipient`,`Volume`) 
VALUES
('Fiole','5','1'),
('Tube','22','2'),
('Pot','34','5'),
('Amphore','70','5'),
('Fût','126','10');
INSERT INTO potion (NomPotion, Ingredient1, Ingredient2, Ingredient3, Ingredient4, PrixPotion)
VALUES 
('Huile d arme magique', 'Sardonyx', 'Branches de sauge maléfiques', 'Epée longue de maître', '', '121'),
('Huile de bénédiction d arme', 'Perle dorée', 'Épée courte', 'Chemise de maille', '', '154'),
('Huile de gourdin magique', 'Perle dorée', 'Épée bâtarde', 'Carreaux', '', '134'),
('Huile de ténèbres', 'Quartz bleu', 'Ongles de lutin', 'Harnois', '', '123'),
('Potion de bouclier de la foi', 'Lapis-Lazuli', 'Épée courte', 'Armure de cuir cloutée de maître', '', '245'),
('Potion de flou', 'Néphrite', 'Écu en acier', 'Cadenas simple', '', '124'),
('Potion de protection contre le bien', 'Grenat rouge', 'Écu en acier', 'Menottes de qualité suppérieure', 'Elixir secret', '25'),
('Potion d agrandissement', 'Perle noire', 'Potion de sagesse du hibou', 'Harnois', '', '758'),
('Potion d invisibilité', 'Perle noire', 'Potion de sagesse du hibou', 'Epée longue de maître', '', '456'),
('Potion d endurance de l ours', 'Alexandrite', 'Élixir de nage', 'Ecu en ébénite', '', '281'),
('Potion d endurance aux énergies destructives', 'Spodumène', 'Élixir de nage', 'Grande hache de maître', '', '445'),
('Potion de protection contre les projectiles', 'Pierre de lune', 'Branches de sauge maléfiques', 'Pierre(s) à tonnerre', 'Poudre secrète', '678'),
('Potion de ruse du renard', 'Sardonyx', 'Anneau du bélier', 'Chemise de maille', '', '98'),
('Potion de saut', 'Spodumène', 'Baguette de sagesse du hibou', 'Antidote', '', '36'),
('Potion de protection contre le chaos', 'Ivoire', 'Baguette de sagesse du hibou', 'Ecu en ébénite', '', '531');
COMMIT;