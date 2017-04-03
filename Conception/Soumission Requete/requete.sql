DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Recette |
CREATE PROCEDURE Ajout_Recette(IN Nom_Potion CHAR(32), IN nb_Ingredient1 CHAR(32),IN Fraicheur1 CHAR(32), IN nb_Ingredient2 CHAR(32),IN Fraicheur2 CHAR(32),IN nb_Ingredient3 CHAR(32),IN Fraicheur3 CHAR(32),IN nb_Ingredient4 CHAR(32),IN Fraicheur4 CHAR(32), IN nb_Ingredient5 CHAR(32),IN Fraicheur5 CHAR(32), IN Diluant CHAR(32))
BEGIN
	UPDATE RecetteAttente SET NombreFilm = NombreFilm + nb_Film
	WHERE realisateur.NomRealisateur = Nom_Realisateur;
END |