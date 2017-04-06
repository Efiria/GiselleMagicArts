
DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Potion |
CREATE PROCEDURE Ajout_Potion(in Nom_Potion Char(50), in Nom_Diluant char(50), in Nom_Temperature int, in Nom_Inventeur char(50))
BEGIN
	INSERT INTO potionattente(NomPotion, Diluant, Temperature, Inventeur)
	VALUES (Nom_Potion,Nom_Diluant,Nom_Temperature,Nom_Inventeur);
END |


DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Ingredient |
CREATE PROCEDURE Ajout_Ingredient(IN Nom_Potion char(50),IN Nom_Ingredient char(50),IN val_Fraicheur int, IN val_Prix int)
BEGIN
	-- Ajoute l'ingredient --
	INSERT INTO ingredientattente (NomPotion, NomIngredient, Fraicheur, PrixIngredient)
	VALUES (Nom_Potion,Nom_Ingredient,val_Fraicheur,val_Prix);

	-- On relie l'ingredient a la potion en fonction du nom que l'on a choisi --
	INSERT INTO PotionIngredientAttente(IDpotion, IDingredient)
	SELECT IDpotion,IDingredient
	FROM potionattente,ingredientattente
	WHERE potionattente.NomPotion = Nom_Potion AND ingredientattente.NomPot = Nom_Ingredient;
END |


DELIMITER |
DROP PROCEDURE IF EXISTS Validation_Potion |
CREATE PROCEDURE Validation_Potion(IN Nom_Potion CHAR(50), IN val_Prix INT)
BEGIN
	-- Ajoute la potion dans la table finale--
	INSERT INTO potion (NomPotion, Diluant, Temperature, Inventeur)
	SELECT potionattente.NomPotion, potionattente.Diluant, potionattente.Temperature, potionattente.Inventeur
	FROM potionattente
	WHERE potionattente.NomPotion = Nom_Potion;

	-- On recup l'ID de la potion --
	SELECT IDpotion into @IDpotion from potionattente WHERE potionattente.NomPotion = Nom_Potion;

	-- Mise a jour du prix --
	UPDATE potion SET PrixPotion = val_Prix
	WHERE NomPotion = Nom_Potion;

	-- Condition si l'ingredient existe deja --
	IF EXISTS (select * from ingredient,ingredientattente where  ingredient.NomIngredient = ingredientattente.NomIngredient)
	THEN
		-- Oui, on lie les ingredients a la potion dans la table potioningredient--
		INSERT INTO potioningredient(IDpotion, IDingredient)
		SELECT potion.IDpotion,ingredient.IDingredient
		FROM potion,ingredient,ingredientattente
		WHERE potion.NomPotion = Nom_Potion AND ingredientattente.NomPotion = potion.NomPotion;

	ELSE
		-- Non on ajoute l'ingredient dans la table ingredient --
		INSERT INTO ingredient (NomIngredient,Fraicheur,PrixIngredient) 
		SELECT NomIngredient, Fraicheur, PrixIngredient
		FROM ingredientattente
		WHERE ingredientattente.NomPotion = Nom_Potion;
		
		-- On fais la liaison --
		INSERT INTO potioningredient(IDpotion, IDingredient)
		SELECT potion.IDpotion,ingredient.IDingredient
		FROM ingredient,potion,ingredientattente
		WHERE potion.NomPotion = Nom_Potion AND ingredientattente.NomPotion = potion.NomPotion;
	END IF;

	-- On supprime les champs utiliser dans la partie attente --
	DELETE FROM potioningredientattente
	WHERE IDpotion = @IDpotion;

	DELETE FROM potionattente
	WHERE NomPotion = Nom_Potion;

	DELETE FROM ingredientattente
	WHERE NomPotion = Nom_Potion;
END|

DELIMITER |
DROP PROCEDURE IF EXISTS Refuser_Potion |
CREATE PROCEDURE Refuser_Potion(in Nom_Potion char(50))
BEGIN
	
	-- On recup l'ID de la potion --
	SELECT IDpotion into @IDpotion from potionattente WHERE potionattente.NomPotion = Nom_Potion;

	DELETE FROM potioningredientattente
	WHERE IDpotion = @IDpotion;

	DELETE FROM potionattente
	WHERE NomPotion = Nom_Potion;

	DELETE FROM ingredientattente
	WHERE NomPotion = Nom_Potion;
END |


/*
	Creer une requete de commande qui va etre lier a un client
	Creer le client puis requete commande
		-> vue en fonction du client

	Commande : Detail de ce que le client veut + statut

	Vue qui va dire nom prenom adresse n° commande et statut

*/


DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Client |
CREATE PROCEDURE Ajout_Client(in n_NomClient char(50), in n_PrenomClient char(50), in n_adresse char(50))
BEGIN
	INSERT INTO Client (NomClient, PrenomClient, AdresseClient)
	VALUES (n_NomClient,n_PrenomClient,n_adresse);
END |

ELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Commande |
CREATE PROCEDURE Ajout_Commande(in num_Client int, in n_Potion char(50), in n_Recipient char(50), in n_QuantitePot char(50), in n_Onguent char(50), in n_QuantiteOngc char(50), in n_Ingredient char(50), in n_Fraicheur char(50), in n_Quantiteing char(50))
BEGIN
	INSERT INTO Client (IDClient,NomPotion, TypeRecipient, QuantitePotion, NomOnguent, QuantiteOnguent, NomIngredient, FraicheurIngredient, QuantiteIngredient)
	VALUES (num_Client,n_Potion,n_Recipient,n_QuantitePot,n_Onguent,n_QuantiteOngc,n_Ingredient,n_Fraicheur,n_Quantiteing);
	
	SET @Commande_id  = LAST_INSERT_ID();

-- Add a tag 
INSERT INTO tags (tag_name) VALUES ('tag1');
SET @tag_id = LAST_INSERT_ID();
-- Now add a tag to the project
INSERT INTO tags_posts (tag_id, project_id) VALUES (@tag_id, @project_id);
COMMIT;

	UPDATE Ajout_Commande SET  StatutCommande = "En Attente" WHERE @Commande_id = IDcommande ;
	UPDATE Ajout_Commande SET PrixTotal = (potion.PrixPotion * (n_QuantitePot + 
END |


DROP TABLE IF EXISTS Client;
CREATE TABLE Client(
        IDclient      int (11) Auto_increment  NOT NULL ,
        NomClient     Char (50) ,
        PrenomClient  Char (50) ,
        AdresseClient Char (50) ,
        IDcommande    Int ,
        PRIMARY KEY (IDclient )
)ENGINE=InnoDB;


DROP TABLE IF EXISTS Commande;
CREATE TABLE Commande(
        IDcommande          int (11) Auto_increment  NOT NULL ,
        NomClient           Char (50) ,
        PrenomClient        Char (50) ,
        AdresseClient       Char (50) ,
        NomPotion           Char (50) ,
        TypeRecipient        Char (50) ,
        QuantitePotion      Numeric ,
        NomOnguent          Char (50) ,
        QuantiteOnguent     Numeric ,
        NomIngredient       Char (50) ,
        FraicheurIngredient Char (50) ,
        QuantiteIngredient  Numeric ,
        StatutCommande      Char (50) ,
        PrixTotal           Numeric ,
        IDClient             Int ,
        PRIMARY KEY (IDcommande )
)ENGINE=InnoDB;
