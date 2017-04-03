DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Recette |
CREATE PROCEDURE Ajout_Recette(IN Nom_Potion CHAR(32), IN nb_Ingredient1 CHAR(32),IN nb_Fraicheur1 CHAR(32), IN nb_Ingredient2 CHAR(32),IN nb_Fraicheur2 CHAR(32),IN nb_Ingredient3 CHAR(32),IN nb_Fraicheur3 CHAR(32),IN nb_Ingredient4 CHAR(32),IN nb_Fraicheur4 CHAR(32), IN nb_Ingredient5 CHAR(32),IN nb_Fraicheur5 CHAR(32), IN nb_Diluant CHAR(32), IN nb_Inventeur CHAR(32))
BEGIN
	INSERT INTO potionattente(NomPotion, Ingredient1, Fraicheur1, Ingredient2, Fraicheur2, Ingredient3, Fraicheur3, Ingredient4, Fraicheur4, Ingredient5, Fraicheur5, Diluant, Inventeur)
	VALUES (Nom_Potion, nb_Ingredient1, nb_Fraicheur1, nb_Ingredient2, nb_Ingredient2, nb_Ingredient3, nb_Fraicheur3, nb_Ingredient4, nb_Fraicheur4, nb_Ingredient5, nb_Fraicheur5, nb_Diluant, nb_Inventeur);
END |

DELIMITER |
DROP PROCEDURE IF EXISTS Validation_Potion |
CREATE PROCEDURE Validation_Potion(IN Nom_Potion CHAR(32), IN Validation char (32))
BEGIN
	IF Validation = 'Valider'
		BEGIN 
			INSERT INTO potionattente(NomPotion, Ingredient1, Fraicheur1, Ingredient2, Fraicheur2, Ingredient3, Fraicheur3, Ingredient4, Fraicheur4, Ingredient5, Fraicheur5, Diluant, Inventeur)
			VALUES (Nom_Potion, nb_Ingredient1, nb_Fraicheur1, nb_Ingredient2, nb_Ingredient2, nb_Ingredient3, nb_Fraicheur3, nb_Ingredient4, nb_Fraicheur4, nb_Ingredient5, nb_Fraicheur5, nb_Diluant, nb_Inventeur);
			WHERE Nom_Potion = NomPotion;
		END |

	ELSE
		BEGIN
			
		END |
END |