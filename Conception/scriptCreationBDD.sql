#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------
DROP TABLE IF EXISTS Potion;
CREATE TABLE Potion(
        IDpotion     int (11) Auto_increment  NOT NULL ,
        NomPotion    Char (50) ,
        Ingredient1  Char (50) ,
        Fraicheur1   Char (50) ,
        Ingredient2  Char (50) ,
        Fraicheur2   Char (50) ,
        Ingredient3  Char (50) ,
        Fraicheur3   Char (50) ,
        Ingredient4  Char (50) ,
        Fraicheur4   Char (50) ,
        Ingredient5  Char (50) ,
        Fraicheur5   Char (50) ,
        Diluant      Char (50) ,
        Temperature  Numeric ,
        PrixPotion   Numeric ,
        Inventeur    Char (50) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;

DROP TABLE IF EXISTS PotionAttente;
CREATE TABLE PotionAttente(
        IDpotion     int (11) Auto_increment  NOT NULL ,
        NomPotion    Char (50) ,
        Ingredient1  Char (50) ,
        Fraicheur1   Char (50) ,
        Ingredient2  Char (50) ,
        Fraicheur2   Char (50) ,
        Ingredient3  Char (50) ,
        Fraicheur3   Char (50) ,
        Ingredient4  Char (50) ,
        Fraicheur4   Char (50) ,
        Ingredient5  Char (50) ,
        Fraicheur5   Char (50) ,
        Diluant      Char (50) ,
        Temperature  Numeric ,
        Inventeur    Char (50) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

DROP TABLE IF EXISTS Onguent;
CREATE TABLE Onguent(
        IDonguent    int (11) Auto_increment  NOT NULL ,
        NomOnguent   Char (50) ,
        Ingredient1  Char (50) ,
        Ingredient2  Char (50) ,
        Ingredient3  Char (50) ,
        Ingredient4  Char (50) ,
        Ingredient5  Char (50) ,
        PrixOnguent  Numeric ,
        Inventeur    Char (50) ,
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
        PRIMARY KEY (IDStock )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
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
        PrixTotal           Numeric ,
		Status Char (50) ,
        PRIMARY KEY (IDcommande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

DROP TABLE IF EXISTS Recipient;
CREATE TABLE Recipient(
        IDrecipient   int (11) Auto_increment  NOT NULL ,
        TypeRecipient Char (50) ,
        PrixRecipient Numeric ,
        Volume       Float ,
        PRIMARY KEY (IDrecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

DROP TABLE IF EXISTS Fournisseur;
CREATE TABLE Fournisseur(
        IDfournisseur  int (11) Auto_increment  NOT NULL ,
        NomFournisseur Char (50) ,
        IngredientEnvoyer Char (50) ,
        DateEnvoi      Date ,
        PRIMARY KEY (IDfournisseur )
)ENGINE=InnoDB;

ALTER TABLE Client ADD CONSTRAINT FK_Client_IDcommande FOREIGN KEY (IDcommande) REFERENCES Commande(IDcommande);
