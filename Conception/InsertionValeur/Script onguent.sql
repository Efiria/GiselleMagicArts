--
-- Contenu table Onguent
--
START TRANSACTION;
INSERT INTO `Onguent` (`NomOnguent`,`Ingredient1`,`Ingredient2`,`Ingredient3`,`Ingredient4`,`Ingredient5`,`PrixOnguent`,`Inventeur`) VALUES
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
COMMIT;