
/*
call ("NomPotion, ingredients (Si existe pas les ajouter) ")

Potion(nom Diluant prix Inventeur)
POtion -> vue 
	Potion valider,

Table principale, recette
Secondaire recette ajouter/utilisateur qui va contenir les recettes en attente (historique), -> Status (valider, en attente, refuser)
	vue qui prend juste les en attente. 

	les ingredients qui existe pas dans la ingrédient
	le nom de la potion dans la table potion
	potioningredient, lien entre ingredient et potion en fonction de leur ID

	*/

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
	WHERE potionattente.NomPotion = Nom_Potion AND ingredientattente.NomIngredient = Nom_Ingredient;
END |


INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;


        IDingredient   int (11) Auto_increment  NOT NULL ,
        NomPotion      Char (50) ,
        NomIngredient  Char (50) ,
        Fraicheur      Numeric ,
        PrixIngredient Numeric ,
        PRIMARY KEY (IDingredient )
)ENGINE=InnoDB;



DELIMITER |
DROP PROCEDURE IF EXISTS Validation_Potion |
CREATE PROCEDURE Validation_Potion(IN Nom_Potion CHAR(32), IN val_Prix INT)
BEGIN
	-- Ajoute la potion dans la table finale--
	INSERT INTO potion (NomPotion, Diluant, Temperature, PrixPotion, Inventeur)
	SELECT (potionattente.NomPotion, potionattente.Diluant, potionattente.Temperature, val_Prix, potionattente.Inventeur)
	WHERE potionattente.NomPotion = Nom_Potion;

	-- Condition si l'ingredient existe deja --
	IF EXISTS (select * from ingredient where ingredientattente.NomIngredient = ingredient.NomIngredient)
	THEN
		-- Oui, on le lie dans la table potioningredient--
		INSERT INTO PotionIngredient(IDpotion, IDingredient)
		SELECT IDpotion,IDingredient
		FROM potionattente,ingredient
		WHERE potionattente.NomPotion = Nom_Potion AND ingredient.NomIngredient = Nom_Ingredient;

	ELSE
		-- Non on ajoute l'ingredient dans la table ingredient --
		INSERT INTO ingredient (NomIngredient,Fraicheur,PrixIngredient) 
		VALUES (ingredientattente.NomIngredient, ingredientattente.Fraicheur, ingredientattente.PrixIngredient);
		
		INSERT INTO PotionIngredientAttente(IDpotion, IDingredient)
		SELECT IDpotion,IDingredient
		FROM potionattente,ingredientattente
		WHERE potionattente.NomPotion = Nom_Potion AND ingredientattente.NomIngredient = Nom_Ingredient;
	END IF;

END|

CREATE TABLE PotionAttente(
        IDpotion   int (11) Auto_increment  NOT NULL ,
        NomPotion  Char (50) ,
        Diluant    Char (50) ,
        Temperature int(100) ,
        Inventeur  Char (50) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;


DELIMITER |
DROP PROCEDURE IF EXISTS Stock_Ingredient |
CREATE PROCEDURE Stock_Ingredient (IN Nom CHAR(32), IN nb INT)
BEGIN
  IF EXISTS (select * from stock where NomIngredient = Nom)
  THEN  
                UPDATE stock SET QuantiteIngredient = QuantiteIngredient + nb WHERE stock.NomIngredient = Nom;
  ELSE
    INSERT INTO stock (NomIngredient,QuantiteIngredient) VALUES (Nom, Nb);
  END IF;
END |