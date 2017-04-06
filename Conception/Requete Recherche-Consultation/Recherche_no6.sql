-- Monter le nombre d’ingrédients utilisés pour fabriquer une potion.

DELIMITER |
DROP PROCEDURE IF EXISTS Compter_Ingredients |
CREATE PROCEDURE Compter_Ingredients (IN Nom_Potion CHAR(32))
BEGIN
	SELECT potion.NomPotion, COUNT(ingredient.NomIngredient) AS 'NombreIngredients'
	FROM potion
	INNER JOIN potioningredient ON potion.IDpotion = potioningredient.IDpotion
	INNER JOIN ingredient ON potioningredient.IDingredient = ingredient.IDingredient
	WHERE potion.NomPotion = Nom_Potion
	GROUP BY potion.NomPotion;
	
	CREATE VIEW Compter_Ingredients_Vue
	AS SELECT potion.NomPotion, COUNT(ingredient.NomIngredient) AS 'NombreIngredients'
	FROM potion
	INNER JOIN potioningredient ON potion.IDpotion = potioningredient.IDpotion
	INNER JOIN ingredient ON potioningredient.IDingredient = ingredient.IDingredient
	-- WHERE potion.NomPotion = Nom_Potion
	GROUP BY potion.NomPotion;

	GRANT SELECT ON Compter_Ingredients_Vue TO 'Utilisateur'@'localhost';
END |

-- ...pour fabriquer un onguent.

DELIMITER |
DROP PROCEDURE IF EXISTS Compter_Ingredients |
CREATE PROCEDURE Compter_Ingredients (IN Nom_Onguent CHAR(32))
BEGIN
	SELECT potion.NomOnguent, COUNT(ingredient.NomIngredient) AS 'NombreIngredients'
	FROM onguent
	INNER JOIN onguentingredient ON onguent.IDonguent = potioningredient.IDonguent
	INNER JOIN ingredient ON ongentingredient.IDingredient = ingredient.IDingredient
	WHERE onguent.NomOnguent = Nom_Onguent
	GROUP BY onguent.NomOnguent;
	
	CREATE VIEW Compter_Ingredients_Vue
	AS SELECT potion.NomOnguent, COUNT(ingredient.NomIngredient) AS 'NombreIngredients'
	FROM onguent
	INNER JOIN onguentingredient ON onguent.IDonguent = potioningredient.IDonguent
	INNER JOIN ingredient ON ongentingredient.IDingredient = ingredient.IDingredient
	-- WHERE onguent.NomOnguent = Nom_Onguent
	GROUP BY onguent.NomOnguent;

	GRANT SELECT ON Compter_Ingredients_Vue TO 'Utilisateur'@'localhost';
END |
