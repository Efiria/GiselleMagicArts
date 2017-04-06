-- Rechercher les potions ou les onguents réalisables avec un ingrédient précis.

DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Ingredients_Potion |
CREATE PROCEDURE Recherche_Ingredients_Potion (IN Nom_Ingredient CHAR(32))
BEGIN
	SELECT potion.NomPotion, ingredient.NomIngredient
	FROM potion
	NATURAL JOIN potioningredient
	NATURAL JOIN ingredient
	WHERE ingredient.NomIngredient = Nom_Ingredient;
	CREATE VIEW Recherche_Ingredients_Potion_Vue
	AS SELECT potion.NomPotion, ingredient.NomIngredient
	FROM potion, ingredient
	CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse'
	GRANT SELECT ON giselleart.Recherche_Ingredients_Potion_Vue TO 'Utilisateur'@'localhost';
END |


DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Ingredients_Onguent |
CREATE PROCEDURE Recherche_Ingredients_Onguent (IN Nom_Ingredient CHAR(32))
BEGIN
	SELECT onguent.NomOnguent, ingredient.NomIngredient
	FROM onguent
	NATURAL JOIN onguentingredient
	NATURAL JOIN ingredient
	WHERE ingredient.NomIngredient = Nom_Ingredient;
	CREATE VIEW Recherche_Ingredients_Onguent_Vue
	AS SELECT onguent.NomOnguent, ingredient.NomIngredient
	FROM onguent, ingredient
	CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse'
	GRANT SELECT ON giselleart.Recherche_Ingredients_Onguent_Vue TO 'Utilisateur'@'localhost';
END |
