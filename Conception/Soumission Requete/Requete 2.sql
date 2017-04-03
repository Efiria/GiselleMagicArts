DELIMITER |
DROP PROCEDURE IF EXISTS commande_client |
CREATE PROCEDURE commande_client (IN Nom_Client CHAR(50), IN Prenom_Client CHAR(50))
BEGIN
SELECT *
FROM commande
WHERE NomClient = Nom_Client AND PrenomClient = Prenom_Client;
END |