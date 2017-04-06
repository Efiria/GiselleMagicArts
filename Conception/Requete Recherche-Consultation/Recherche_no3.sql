-- Rechercher les potions réalisables avec un diluant précis.

DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Diluant |
CREATE PROCEDURE Recherche_Diluant (IN Nom_Diluant CHAR(32))
BEGIN
	SELECT potion.NomPotion, potion.Diluant
	FROM potion
	WHERE potion.Diluant = Nom_Diluant;
	CREATE VIEW Recherche_Diluant_Vue
	AS SELECT potion.NomPotion, potion.Diluant
	FROM potion
	CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse'
	GRANT SELECT ON giselleart.Recherche_Diluant_Vue TO 'Utilisateur'@'localhost';
END |
