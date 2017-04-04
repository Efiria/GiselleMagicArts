DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Recette |
CREATE PROCEDURE Ajout_Recette(IN Nom_Potion CHAR(32), IN nb_Ingredient1 CHAR(32),IN nb_Fraicheur1 CHAR(32), IN nb_Ingredient2 CHAR(32),IN nb_Fraicheur2 CHAR(32),IN nb_Ingredient3 CHAR(32),IN nb_Fraicheur3 CHAR(32),IN nb_Ingredient4 CHAR(32),IN nb_Fraicheur4 CHAR(32), IN nb_Ingredient5 CHAR(32),IN nb_Fraicheur5 CHAR(32), IN nb_Diluant CHAR(32), IN nb_Inventeur CHAR(32))
BEGIN
	INSERT INTO potionattente(NomPotion, Ingredient1, Fraicheur1, Ingredient2, Fraicheur2, Ingredient3, Fraicheur3, Ingredient4, Fraicheur4, Ingredient5, Fraicheur5, Diluant, Inventeur,Status)
	VALUES (Nom_Potion, nb_Ingredient1, nb_Fraicheur1, nb_Ingredient2, nb_Fraicheur2, nb_Ingredient3, nb_Fraicheur3, nb_Ingredient4, nb_Fraicheur4, nb_Ingredient5, nb_Fraicheur5, nb_Diluant, nb_Inventeur,"A valider");
END |

DELIMITER |
DROP PROCEDURE IF EXISTS Validation_Potion |
CREATE PROCEDURE Validation_Potion(IN Nom_Potion CHAR(32), IN val_Prix INT)
BEGIN
	INSERT INTO potion (NomPotion, Ingredient1, Fraicheur1, Ingredient2, Fraicheur2, Ingredient3, Fraicheur3, Ingredient4, Fraicheur4, Ingredient5, Fraicheur5, Diluant, Inventeur) 
	SELECT NomPotion, Ingredient1, Fraicheur1, Ingredient2, Fraicheur2, Ingredient3, Fraicheur3, Ingredient4, Fraicheur4, Ingredient5, Fraicheur5, Diluant, Inventeur
	FROM potionattente
	WHERE Nom_Potion = NomPotion ;
	UPDATE potionattente SET Status = "Valider"
	WHERE Nom_Potion = NomPotion ;
	UPDATE potion SET PrixPotion = val_Prix
	WHERE Nom_Potion = NomPotion;
END |


DELIMITER |
DROP PROCEDURE IF EXISTS Supprimer_Recette |
CREATE PROCEDURE Supprimer_Recette(IN Nom_Potion CHAR(32))
BEGIN
	UPDATE potionattente SET Status = "Refuser"
	WHERE Nom_Potion = NomPotion;
END |


CREATE VIEW PotionEnAttente SELECT * FROM potionattente
WHERE Status = "A valider";