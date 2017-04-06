-- Rechercher les couples (potions, onguents) utilisant la même liste d’ingrédients.

DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Egalite |
CREATE PROCEDURE Recherche_Egalite ()
BEGIN
	SELECT DISTINCT potion.NomPotion, onguent.NomOnguent ,ingredient.NomIngredient
	FROM potion, onguent, ingredient, potioningredient
	NATURAL JOIN onguentingredient
	WHERE potioningredient.IDingredient = onguentingredient.IDingredient;
	CREATE VIEW Recherche_Egalite_Vue
	AS SELECT potion.NomPotion, onguent.NomOnguent ,ingredient.NomIngredient
	FROM potion, onguent, ingredient
	CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse'
	GRANT SELECT ON giselleart.Recherche_Egalite_Vue TO 'Utilisateur'@'localhost';
END |
