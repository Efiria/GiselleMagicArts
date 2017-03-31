  START TRANSACTION;
INSERT INTO potion (NomPotion, Ingredient1, Ingredient2, Ingredient3, Ingredient4, PrixPotion)
VALUES ('Huile d arme magique', 'Sardonyx', 'Branches de sauge maléfiques', 'Epée longue de maître', '', '121'),
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