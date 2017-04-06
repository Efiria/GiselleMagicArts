
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
	INSERT INTO potioningredientattente(IDpotion, IDingredient)
	SELECT potionattente.IDpotion,ingredientattente.IDingredient
	FROM potionattente
	INNER JOIN ingredientattente ON potionattente.NomPotion = ingredientattente.NomPotion
	WHERE potionattente.NomPotion = Nom_Potion AND ingredientattente.NomPotion = Nom_Ingredient;
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
	SELECT IDpotion into @IDpotion from potion WHERE potion.NomPotion = Nom_Potion;

	-- Mise a jour du prix --
	UPDATE potion SET PrixPotion = val_Prix
	WHERE NomPotion = Nom_Potion;


	-- Condition si l'ingredient existe deja --

	IF EXISTS (select * from ingredient,ingredientattente where  ingredient.NomIngredient = ingredientattente.NomIngredient)
	THEN
		SELECT IDclient from client;
		
	ELSE
		-- Non on ajoute l'ingredient dans la table ingredient --
		INSERT INTO ingredient (NomIngredient,Fraicheur,PrixIngredient) 
		VALUES (NomIngredient, Fraicheur, PrixIngredient);

	END IF;

	-- Oui, on lie les ingredients a la potion dans la table potioningredient--
	INSERT INTO potioningredient(IDpotion, IDingredient)
	SELECT potion.IDpotion,ingredient.IDingredient
	FROM ingredient, potion
	INNER JOIN ingredientattente ON ingredientattente.NomIngredient = ingredient.NomIngredient
	WHERE potion.IDpotion = @IDpotion;

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

	/* 
		RIGHT JOIN 
		table source ingredientattente

		Genere requete (insert into)
		resultat du select = ingredient a ajouter (ce qui existe pas )

		Insert la liste d'ingredient 
		
	*/ 


DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Client |
CREATE PROCEDURE Ajout_Client(in n_NomClient char(50), in n_PrenomClient char(50), in n_adresse char(50))
BEGIN
	INSERT INTO Client (NomClient, PrenomClient, AdresseClient)
	VALUES (n_NomClient,n_PrenomClient,n_adresse);
END |

DELIMITER |
DROP PROCEDURE IF EXISTS Ajout_Commande |
CREATE PROCEDURE Ajout_Commande(in num_Client int, in n_Potion char(50), in n_Recipient char(50), in n_QuantitePot char(50), in n_Onguent char(50), in n_QuantiteOngc char(50), in n_Ingredient char(50), in n_Fraicheur char(50), in n_Quantiteing char(50))
BEGIN
	INSERT INTO Commande (IDClient,NomPotion, TypeRecipient, QuantitePotion, NomOnguent, QuantiteOnguent, NomIngredient, FraicheurIngredient, QuantiteIngredient)
	VALUES (num_Client,n_Potion,n_Recipient,n_QuantitePot,n_Onguent,n_QuantiteOngc,n_Ingredient,n_Fraicheur,n_Quantiteing);
	
	SET @Commande_id  = LAST_INSERT_ID();

	UPDATE Commande SET  StatutCommande = "En Attente" WHERE @Commande_id = IDcommande ;

	-- Ajoute les noms en fonction le l'ID user
	UPDATE Commande SET NomClient = client.NomClient WHERE IDclient = num_Client;
	UPDATE Commande SET PrenomClient = client.PrenomClient WHERE IDclient = num_Client;
	UPDATE Commande SET AdresseClient = client.AdresseClient WHERE IDclient = num_Client;

	-- Prix --
	
END |

call ajout_Commande(1,"Potion","Fiole",3,"",0,"","",0)