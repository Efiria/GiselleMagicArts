#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------
DROP TABLE IF EXISTS Potion;
CREATE TABLE Potion(
        IDpotion   int (11) Auto_increment  NOT NULL ,
        NomPotion  Char (50) ,
        Diluant    Char (50) ,
        Temperature int(100) ,
        PrixPotion Numeric ,
        Inventeur  Char (50) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;

DROP TABLE IF EXISTS PotionAttente;
CREATE TABLE PotionAttente(
        IDpotion   int (11) Auto_increment  NOT NULL ,
        NomPotion  Char (50) ,
        Diluant    Char (50) ,
        Temperature int(100) ,
        Inventeur  Char (50) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------
DROP TABLE IF EXISTS Onguent;
CREATE TABLE Onguent(
        IDonguent   int (11) Auto_increment  NOT NULL ,
        NomOnguent  Char (50) ,
        PrixOnguent Numeric ,
        Inventeur   Char (50) ,
        PRIMARY KEY (IDonguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------
DROP TABLE IF EXISTS Ingredient;
CREATE TABLE Ingredient(
        IDingredient   int (11) Auto_increment  NOT NULL ,
        NomIngredient  Char (50) ,
        Fraicheur      Numeric ,
        PrixIngredient Numeric ,
        PRIMARY KEY (IDingredient )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: IngredientAttente
#------------------------------------------------------------
DROP TABLE IF EXISTS IngredientAttente;
CREATE TABLE IngredientAttente(
        IDingredient   int (11) Auto_increment  NOT NULL ,
        NomPotion      Char (50) ,
        NomIngredient  Char (50) ,
        Fraicheur      Numeric ,
        PrixIngredient Numeric ,
        PRIMARY KEY (IDingredient )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Stock
#------------------------------------------------------------
DROP TABLE IF EXISTS Stock;
CREATE TABLE Stock(
        IDStock            int (11) Auto_increment  NOT NULL ,
        NomIngredient      Char (50) ,
        Fraicheur          Numeric ,
        QuantiteIngredient Numeric ,
        TypeRecipient      Char (50) ,
        QuantiteRecipient   Numeric ,
        NomPotion          Char (50) ,
        QuantitePotion     Numeric ,
        NomOnguent         Char (50) ,
        QuantiteOnguent    Numeric ,
        IDRecipient         Int ,
        IDpotion           Int ,
        IDingredient       Int ,
        IDonguent          Int ,
        PRIMARY KEY (IDStock )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------
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
        IDClient            Int ,
        PRIMARY KEY (IDcommande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------
DROP TABLE IF EXISTS Recipient;
CREATE TABLE Recipient(
        IDRecipient   int (11) Auto_increment  NOT NULL ,
        TypeRecipient Char (50) ,
        PrixRecipient Numeric ,
        Volume       Float ,
        PRIMARY KEY (IDRecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: client
#------------------------------------------------------------
DROP TABLE IF EXISTS Client;
CREATE TABLE Client(
        IDclient      int (11) Auto_increment  NOT NULL ,
        NomClient     Char (50) ,
        PrenomClient  Char (50) ,
        AdresseClient Char (50) ,
        IDcommande    Int ,
        PRIMARY KEY (IDclient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------
DROP TABLE IF EXISTS Fournisseur;
CREATE TABLE Fournisseur(
        IDfournisseur     int (11) Auto_increment  NOT NULL ,
        NomFournisseur    Char (50) ,
        IngredientEnvoyer Char (50) ,
        QuantiteIngredient int (11) ,
        DateEnvoi         Date ,
        PRIMARY KEY (IDfournisseur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: OnguentIngredient
#------------------------------------------------------------
DROP TABLE IF EXISTS OnguentIngredient;
CREATE TABLE OnguentIngredient(
        IDingredient Int NOT NULL ,
        IDonguent    Int NOT NULL ,
        PRIMARY KEY (IDingredient ,IDonguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PotionIngredient
#------------------------------------------------------------
DROP TABLE IF EXISTS PotionIngredient;
CREATE TABLE PotionIngredient(
        IDpotion     Int NOT NULL ,
        IDingredient Int NOT NULL ,
        PRIMARY KEY (IDpotion ,IDingredient )
)ENGINE=InnoDB;
ALTER TABLE PotionIngredient ADD CONSTRAINT FK_PotionIngredient_IDpotion FOREIGN KEY (IDpotion) REFERENCES Potion(IDpotion);
ALTER TABLE PotionIngredient ADD CONSTRAINT FK_PotionIngredient_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);

DROP TABLE IF EXISTS PotionIngredientAttente;
CREATE TABLE PotionIngredientAttente(
        IDpotion     Int NOT NULL ,
        IDingredient Int NOT NULL ,
        PRIMARY KEY (IDpotion ,IDingredient )
)ENGINE=InnoDB;
ALTER TABLE PotionIngredientAttente ADD CONSTRAINT FK_PotionIngredientAttente_IDpotion FOREIGN KEY (IDpotion) REFERENCES PotionAttente(IDpotion);
ALTER TABLE PotionIngredientAttente ADD CONSTRAINT FK_PotionIngredientAttente_IDingredient FOREIGN KEY (IDingredient) REFERENCES IngredientAttente(IDingredient);

#------------------------------------------------------------
# Table: Réaprovisionne
#------------------------------------------------------------
DROP TABLE IF EXISTS Reaprovisionne;
CREATE TABLE Reaprovisionne(
        IDfournisseur Int NOT NULL ,
        IDStock       Int NOT NULL ,
        PRIMARY KEY (IDfournisseur ,IDStock )
)ENGINE=InnoDB;

ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDRecipient FOREIGN KEY (IDRecipient) REFERENCES Recipient(IDRecipient);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDpotion FOREIGN KEY (IDpotion) REFERENCES Potion(IDpotion);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDonguent FOREIGN KEY (IDonguent) REFERENCES Onguent(IDonguent);

ALTER TABLE Commande ADD CONSTRAINT FK_Commande_IDClient FOREIGN KEY (IDClient) REFERENCES Client(IDClient);

ALTER TABLE client ADD CONSTRAINT FK_client_IDcommande FOREIGN KEY (IDcommande) REFERENCES Commande(IDcommande);

ALTER TABLE OnguentIngredient ADD CONSTRAINT FK_OnguentIngredient_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE OnguentIngredient ADD CONSTRAINT FK_OnguentIngredient_IDonguent FOREIGN KEY (IDonguent) REFERENCES Onguent(IDonguent);

ALTER TABLE Reaprovisionne ADD CONSTRAINT FK_Reaprovisionne_IDfournisseur FOREIGN KEY (IDfournisseur) REFERENCES Fournisseur(IDfournisseur);
ALTER TABLE Reaprovisionne ADD CONSTRAINT FK_Reaprovisionne_IDStock FOREIGN KEY (IDStock) REFERENCES Stock(IDStock);

START TRANSACTION;
-- Créer l'utilisateur.

CREATE USER 'Utilisateur'@'localhost' IDENTIFIED BY 'motdepasse';

INSERT INTO ingredient (NomIngredient, Fraicheur, PrixIngredient) 
VALUES ('Sardonyx','56','20'),
('Branche de sauge maléfique','464','20'),
('Epée longue de maître','63','15'),
('Epée courte','74','14'),
('Chemise de maille','12','15'),
('Epée bâtarde','66','12'),
('Carreaux','64','13'),
('Bottes de sept lieues','984','12'),
('Arbalète légère de maître','44','16'),
('Quartz bleu','56','18'),
('Ongle de lutin','56','18'),
('Harnois','56','18'),
('Perle noire','748','12');

INSERT INTO Onguent (NomOnguent,PrixOnguent,Inventeur)
VALUES ('Onguent de bouclier','263','Alucard'),
('Onguent de ténèbres','485','Saruman'),
('Huile de gourdin maudite','487','Gandalf'),
('Huile de pierre maudite','112','Alucard'),
('Onguent des ténèbres','345','Saruman');


INSERT INTO `recipient` (`TypeRecipient`,`PrixRecipient`,`Volume`) 
VALUES
('Fiole','5','1'),
('Tube','22','2'),
('Pot','34','5'),
('Amphore','70','5'),
('Fût','126','10');

INSERT INTO potion (NomPotion,Diluant,PrixPotion,Temperature,Inventeur)
VALUES ('Potion de bouclier','Vin','474','158','Marko'),
('Huile de bénédiction d arme','Jus de Fruit','799','485','Merlin'),
('Huile de gourdin magique','Eau','481','956','Nobru'),
('Huile de pierre magique','Vin','345','231','Lexandre'),
('Potion des ténèbres','Vin','658','489','MagicLord');
COMMIT;


START TRANSACTION;
INSERT INTO onguentingredient (IDingredient,IDonguent)
VALUES ('1','1'),
('3','1'),
('6','1'),
('1','2'),
('6','2'),
('4','2'),
('13','3'),
('9','3'),
('5','3'),
('6','3'),
('1','4'),
('11','4'),
('10','4'),
('9','5'),
('2','5'),
('7','5');
COMMIT;


START TRANSACTION;
INSERT INTO potioningredient (IDingredient,IDpotion)
VALUES ('9','1'),
('3','1'),
('6','1'),
('1','2'),
('7','2'),
('4','2'),
('13','3'),
('9','3'),
('5','3'),
('6','3'),
('1','4'),
('11','4'),
('10','4'),
('9','5'),
('2','5'),
('7','5'),
('1','5');
COMMIT;

START TRANSACTION;

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

DELIMITER |
DROP PROCEDURE IF EXISTS commande_client |
CREATE PROCEDURE commande_client (IN Nom_Client CHAR(50), IN Prenom_Client CHAR(50))
BEGIN
SELECT *
FROM commande
WHERE NomClient = Nom_Client AND PrenomClient = Prenom_Client;
END |

DELIMITER |
DROP PROCEDURE IF EXISTS Statut_Commande |
CREATE PROCEDURE Statut_Commande (IN ID_Commande INT)
BEGIN
        UPDATE commande SET StatutCommande = "Refuser"
        WHERE IDCommande = ID_Commande; 
END |

DELIMITER |
DROP PROCEDURE IF EXISTS Valider_Commande |
CREATE PROCEDURE Valider_Commande (IN ID_Commande INT)
BEGIN
        UPDATE commande SET StatutCommande = "Valider"
        WHERE IDCommande = ID_Commande; 

        UPDATE stock SET stock.QuantiteIngredient = stock.QuantiteIngredient - commande.QuantiteIngredient
        WHERE stock.NomIngredient = commande.NomIngredient AND stock.IDCommande = ID_Commande;

        UPDATE stock SET stock.QuantitePotion = stock.QuantitePotion - commande.QuantitePotion
        WHERE stock.NomPotion = commande.NomPotion AND stock.IDCommande = ID_Commande;

        UPDATE stock SET stock.QuantiteRecipient = stock.QuantiteRecipient - commande.QuantitePotion
        WHERE stock.TypeRecipient = commande.TypeRecipient AND IDCommande = ID_Commande;

        UPDATE stock SET stock.QuantiteOnguent = stock.QuantiteOnguent - commande.QuantiteOnguent
        WHERE stock.NomOnguent = commande.NomOnguent AND stock.IDCommande = ID_Commande;
END |




-- Rechercher les potions ou les onguents réalisables avec un ingrédient précis.

DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Ingredients_Potion |
CREATE PROCEDURE Recherche_Ingredients_Potion (IN Nom_Ingredient CHAR(32))
BEGIN
        SELECT potion.NomPotion, ingredient.NomIngredient
        FROM potion
        NATURAL JOIN potioningredient
        NATURAL JOIN ingredient
        WHERE ingredient.NomIngredient = Nom_Ingredient;
        
        CREATE VIEW Recherche_Ingredients_Potion_Vue
        AS SELECT potion.NomPotion, ingredient.NomIngredient
        FROM potion, ingredient;
        -- WHERE ingredient.NomIngredient = Nom_Ingredient;

        GRANT SELECT ON giselleart.Recherche_Ingredients_Potion_Vue TO 'Utilisateur'@'localhost';
END |

-- ... Onguents.

DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Ingredients_Onguent |
CREATE PROCEDURE Recherche_Ingredients_Onguent (IN Nom_Ingredient CHAR(32))
BEGIN
        SELECT onguent.NomOnguent, ingredient.NomIngredient
        FROM onguent
        NATURAL JOIN onguentingredient
        NATURAL JOIN ingredient
        WHERE ingredient.NomIngredient = Nom_Ingredient;
        
        CREATE VIEW Recherche_Ingredients_Onguent_Vue
        AS SELECT onguent.NomOnguent, ingredient.NomIngredient
        FROM onguent, ingredient;
        -- WHERE ingredient.NomIngredient = Nom_Ingredient;

        GRANT SELECT ON giselleart.Recherche_Ingredients_Onguent_Vue TO 'Utilisateur'@'localhost';
END |
-- Rechercher les couples (potions, onguents) utilisant la même liste d’ingrédients.

DELIMITER |
DROP PROCEDURE IF EXISTS Recherche_Egalite |
CREATE PROCEDURE Recherche_Egalite ()
BEGIN
        SELECT DISTINCT potion.NomPotion, onguent.NomOnguent
        FROM potion, onguent, potioningredient
        NATURAL JOIN onguentingredient
        WHERE potioningredient.IDingredient = onguentingredient.IDingredient;
        
        CREATE VIEW Recherche_Egalite_Vue
        AS SELECT DISTINCT potion.NomPotion, onguent.NomOnguent
        FROM potion, onguent, potioningredient
        NATURAL JOIN onguentingredient
        WHERE potioningredient.IDingredient = onguentingredient.IDingredient;
        
        GRANT SELECT ON giselleart.Recherche_Egalite_Vue TO 'Utilisateur'@'localhost';
END |

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
        FROM potion;
        -- WHERE potion.Diluant = Nom_Diluant;
        
        GRANT SELECT ON giselleart.Recherche_Diluant_Vue TO 'Utilisateur'@'localhost';
END |

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
        ORDER BY Temperature;

        GRANT SELECT ON Lister_Potions_Vue TO 'Utilisateur'@'localhost';
END |

-- Comparer le prix de vente d’une potion et le total du prix des ingrédients nécessaires à sa réalisation.

DELIMITER |
DROP PROCEDURE IF EXISTS Comparer_Potions |
CREATE PROCEDURE Comparer_Potions (IN Nom_Potion CHAR(32))
BEGIN
        SELECT potion.NomPotion, potion.PrixPotion, SUM(ingredient.PrixIngredient)
        FROM potion
        INNER JOIN potioningredient ON potion.IDpotion = potioningredient.IDpotion
        INNER JOIN ingredient ON potioningredient.IDingredient = ingredient.IDingredient
        WHERE potion.NomPotion = Nom_Potion
        GROUP BY potion.NomPotion, potion.PrixPotion;
        
        CREATE VIEW Comparer_Potions_Vue
        AS SELECT potion.NomPotion, potion.PrixPotion, SUM(ingredient.PrixIngredient)
        FROM potion
        INNER JOIN potioningredient ON potion.IDpotion = potioningredient.IDpotion
        INNER JOIN ingredient ON potioningredient.IDingredient = ingredient.IDingredient
        -- WHERE potion.NomPotion = Nom_Potion
        GROUP BY potion.NomPotion, potion.PrixPotion;

        GRANT SELECT ON Comparer_Potions_Vue TO 'Utilisateur'@'localhost';
END |

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

COMMIT;