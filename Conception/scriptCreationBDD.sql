#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------
DROP TABLE IF EXISTS Potion;
CREATE TABLE Potion(
        IDpotion     int (11) Auto_increment  NOT NULL ,
        NomPotion    Char (40) ,
        Ingredient1  Char (40) ,
        Fraicheur1   Char (40) ,
        Ingredient2  Char (40) ,
        Fraicheur2   Char (40) ,
        Ingredient3  Char (40) ,
        Fraicheur3   Char (40) ,
        Ingredient4  Char (40) ,
        Fraicheur4   Char (40) ,
        Ingredient5  Char (40) ,
        Fraicheur5   Char (40) ,
        Diluant      Char (40) ,
        PrixPotion   Numeric ,
        Inventeur    Char (40) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;

DROP TABLE IF EXISTS PotionAttente;
CREATE TABLE PotionAttente(
        IDpotion     int (11) Auto_increment  NOT NULL ,
        NomPotion    Char (40) ,
        Ingredient1  Char (40) ,
        Fraicheur1   Char (40) ,
        Ingredient2  Char (40) ,
        Fraicheur2   Char (40) ,
        Ingredient3  Char (40) ,
        Fraicheur3   Char (40) ,
        Ingredient4  Char (40) ,
        Fraicheur4   Char (40) ,
        Ingredient5  Char (40) ,
        Fraicheur5   Char (40) ,
        Diluant      Char (40) ,
        Inventeur    Char (40) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

DROP TABLE IF EXISTS Onguent;
CREATE TABLE Onguent(
        IDonguent    int (11) Auto_increment  NOT NULL ,
        NomOnguent   Char (40) ,
        Ingredient1  Char (40) ,
        Ingredient2  Char (40) ,
        Ingredient3  Char (40) ,
        Ingredient4  Char (40) ,
        Ingredient5  Char (40) ,
        PrixOnguent  Numeric ,
        Inventeur    Char (40) ,
        PRIMARY KEY (IDonguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

DROP TABLE IF EXISTS Ingredient;
CREATE TABLE Ingredient(
        IDingredient   int (11) Auto_increment  NOT NULL ,
        NomIngredient  Char (40) ,
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
        NomIngredient      Char (40) ,
        Fraicheur          Numeric ,
        QuantiteIngredient Numeric ,
        TypeRecipient      Char (40) ,
        QuantiteRecipient   Numeric ,
        NomPotion          Char (40) ,
        QuantitePotion     Numeric ,
        NomOnguent         Char (40) ,
        QuantiteOnguent    Numeric ,
        PRIMARY KEY (IDStock )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

DROP TABLE IF EXISTS Client;
CREATE TABLE Client(
        IDclient      int (11) Auto_increment  NOT NULL ,
        NomClient     Char (40) ,
        PrenomClient  Char (40) ,
        AdresseClient Char (40) ,
        IDcommande    Int ,
        PRIMARY KEY (IDclient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

DROP TABLE IF EXISTS Commande;
CREATE TABLE Commande(
        IDcommande          int (11) Auto_increment  NOT NULL ,
        NomClient           Char (40) ,
        PrenomClient        Char (40) ,
        AdresseClient       Char (40) ,
        NomPotion           Char (40) ,
        TypeRecipient        Char (40) ,
        QuantitePotion      Numeric ,
        NomOnguent          Char (40) ,
        QuantiteOnguent     Numeric ,
        NomIngredient       Char (40) ,
        FraicheurIngredient Char (40) ,
        QuantiteIngredient  Numeric ,
        PrixTotal           Numeric ,
		Status Char (40) ,
        PRIMARY KEY (IDcommande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

DROP TABLE IF EXISTS Recipient;
CREATE TABLE Recipient(
        IDrecipient   int (11) Auto_increment  NOT NULL ,
        TypeRecipient Char (40) ,
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
        NomFournisseur Char (40) ,
        IngredientEnvoyer Char (40) ,
        DateEnvoi      Date ,
        PRIMARY KEY (IDfournisseur )
)ENGINE=InnoDB;

ALTER TABLE Client ADD CONSTRAINT FK_Client_IDcommande FOREIGN KEY (IDcommande) REFERENCES Commande(IDcommande);
