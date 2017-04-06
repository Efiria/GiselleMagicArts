-- Comparer le prix de vente d’une potion et le total du prix des ingrédients nécessaires à sa réalisation.

DELIMITER |
DROP PROCEDURE IF EXISTS Comparer_Potions |
CREATE PROCEDURE Comparer_Potions (IN Nom_Potion CHAR(32))
BEGIN
	SELECT potion.NomPotion, potion.PrixPotion, SUM(ingredient.PrixIngredient) AS 'PrixTotal'
	FROM potion
	INNER JOIN potioningredient ON potion.IDpotion = potioningredient.IDpotion
	INNER JOIN ingredient ON potioningredient.IDingredient = ingredient.IDingredient
	WHERE potion.NomPotion = Nom_Potion
	GROUP BY potion.NomPotion, potion.PrixPotion;
	CREATE VIEW Comparer_Potions_Vue
	AS SELECT potion.NomPotion, potion.PrixPotion, ingredient.PrixTotal
	FROM potion, ingredient
	CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse'
	GRANT SELECT ON Comparer_Potions_Vue TO 'Utilisateur'@'localhost';
END |
