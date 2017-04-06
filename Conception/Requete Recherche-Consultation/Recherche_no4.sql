-- Rechercher la liste des potions classée par température de préparation.

DELIMITER |
DROP PROCEDURE IF EXISTS Lister_Potions |
CREATE PROCEDURE Lister_Potions ()
BEGIN
	SELECT potion.NomPotion, potion.Temperature
	FROM potion
	ORDER BY Temperature;
	CREATE VIEW Lister_Potions_Vue
	AS SELECT potion.NomPotion, potion.Temperature
	FROM potion
	CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse'
	GRANT SELECT ON Lister_Potions_Vue TO 'Utilisateur'@'localhost';
END |
