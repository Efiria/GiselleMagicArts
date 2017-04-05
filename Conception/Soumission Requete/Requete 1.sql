DELIMITER |
DROP PROCEDURE IF EXISTS Stock_Ingredient |
CREATE PROCEDURE Stock_Ingredient (IN Nom CHAR(32), IN nb INT)
BEGIN
  IF EXISTS (select * from stock where NomIngredient = Nom)
  THEN  
	UPDATE stock SET QuantiteIngredient = QuantiteIngredient + nb 
	WHERE stock.NomIngredient = Nom;
  ELSE
    INSERT INTO stock (NomIngredient,QuantiteIngredient) VALUES (Nom, Nb);
  END IF;
END |
CREATE VIEW Inventaire_Ingredient 
AS SELECT NomIngredient, QuantiteIngredient
FROM stock;