#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------

CREATE TABLE Potion(
        IDpotion     int (11) Auto_increment  NOT NULL ,
        NomPotion    Char (25) ,
        Ingredient1  Char (25) ,
        Fraicheur1   Char (25) ,
        Ingredient2  Char (25) ,
        Fraicheur2   Char (25) ,
        Ingredient3  Char (25) ,
        Fraicheur3   Char (25) ,
        Ingredient4  Char (25) ,
        Fraicheur4   Char (25) ,
        Ingredient5  Char (25) ,
        Fraicheur5   Char (25) ,
        Diluant      Char (25) ,
        PrixPotion   Numeric ,
        Inventeur    Char (25) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

CREATE TABLE Onguent(
        IDonguent    int (11) Auto_increment  NOT NULL ,
        NomOnguent   Char (25) ,
        Ingredient1  Char (25) ,
        Ingredient2  Char (25) ,
        Ingredient3  Char (25) ,
        Ingredient4  Char (25) ,
        Ingredient5  Char (25) ,
        PrixOnguent  Numeric ,
        Inventeur    Char (25) ,
        PRIMARY KEY (IDonguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

CREATE TABLE Ingredient(
        IDingredient   int (11) Auto_increment  NOT NULL ,
        NomIngredient  Char (25) ,
        Fraicheur      Numeric ,
        PrixIngredient Numeric ,
        PRIMARY KEY (IDingredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Stock
#------------------------------------------------------------

CREATE TABLE Stock(
        IDStock            int (11) Auto_increment  NOT NULL ,
        NomIngredient      Char (25) ,
        Fraicheur          Numeric ,
        QuantiteIngredient Numeric ,
        TypeRecipient      Char (25) ,
        QuantiteRecipient   Numeric ,
        NomPotion          Char (25) ,
        QuantitePotion     Numeric ,
        NomOnguent         Char (25) ,
        QuantiteOnguent    Numeric ,
        PRIMARY KEY (IDStock )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        IDcommande          int (11) Auto_increment  NOT NULL ,
        NomClient           Char (25) ,
        PrenomClient        Char (25) ,
        AdresseClient       Char (25) ,
        NomPotion           Char (25) ,
        TypeRecipient        Char (25) ,
        QuantitePotion      Numeric ,
        NomOnguent          Char (25) ,
        QuantiteOnguent     Numeric ,
        NomIngredient       Char (25) ,
        FraicheurIngredient Char (25) ,
        QuantiteIngredient  Numeric ,
        PrixTotal           Numeric ,
        PRIMARY KEY (IDcommande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

CREATE TABLE Recipient(
        IDrecipient   int (11) Auto_increment  NOT NULL ,
        TypeRecipient Char (25) ,
        PrixRecipient Numeric ,
        Volume       Numeric ,
        PRIMARY KEY (IDrecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        IDclient      int (11) Auto_increment  NOT NULL ,
        NomClient     Char (25) ,
        PrenomClient  Char (25) ,
        AdresseClient Char (25) ,
        IDcommande    Int ,
        PRIMARY KEY (IDclient )
)ENGINE=InnoDB;

ALTER TABLE Client ADD CONSTRAINT FK_Client_IDcommande FOREIGN KEY (IDcommande) REFERENCES Commande(IDcommande);
