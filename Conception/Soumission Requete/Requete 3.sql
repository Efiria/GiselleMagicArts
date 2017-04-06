DELIMITER |
DROP PROCEDURE IF EXISTS Expiration_Ingredient |
CREATE PROCEDURE Expiration_Ingredient ()
BEGIN 
	UPDATE Stock INNER JOIN Fournisseur ON Stock.IDStock = Fournisseur.IDFournisseur SET stock.QuantiteIngredient = stock.QuantiteIngredient - fournisseur.QuantiteIngredient
	WHERE DATEDIFF(CURRENT_DATE,Fournisseur.DateEnvoi) > Fraicheur AND stock.NomIngredient = I;
END |
	


