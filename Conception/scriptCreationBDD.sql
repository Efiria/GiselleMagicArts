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
        IDingredient Int ,
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
        IDingredient Int ,
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
        QuantiteRecipent   Numeric ,
        NomPotion          Char (25) ,
        QuantitePotion     Numeric ,
        NomOnguent         Char (25) ,
        QuantiteOnguent    Numeric ,
        IDrecipent         Int ,
        IDpotion           Int ,
        IDingredient       Int ,
        IDonguent          Int ,
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
        TypeRecipent        Char (25) ,
        QuantitePotion      Numeric ,
        NomOnguent          Char (25) ,
        QuantiteOnguent     Numeric ,
        NomIngredient       Char (25) ,
        FraicheurIngredient Char (25) ,
        QuantiteIngredient  Numeric ,
        PrixTotal           Numeric ,
        IDStock             Int ,
        PRIMARY KEY (IDcommande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipent
#------------------------------------------------------------

CREATE TABLE Recipent(
        IDrecipent   int (11) Auto_increment  NOT NULL ,
        TypeRecipent Char (25) ,
        PrixRecipent Numeric ,
        Volume       Numeric ,
        PRIMARY KEY (IDrecipent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cilent
#------------------------------------------------------------

CREATE TABLE Cilent(
        IDclient      int (11) Auto_increment  NOT NULL ,
        NomClient     Char (25) ,
        PrenomClient  Char (25) ,
        AdresseClient Char (25) ,
        IDcommande    Int ,
        PRIMARY KEY (IDclient )
)ENGINE=InnoDB;

ALTER TABLE Potion ADD CONSTRAINT FK_Potion_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE Onguent ADD CONSTRAINT FK_Onguent_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDrecipent FOREIGN KEY (IDrecipent) REFERENCES Recipent(IDrecipent);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDpotion FOREIGN KEY (IDpotion) REFERENCES Potion(IDpotion);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDonguent FOREIGN KEY (IDonguent) REFERENCES Onguent(IDonguent);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_IDStock FOREIGN KEY (IDStock) REFERENCES Stock(IDStock);
ALTER TABLE Cilent ADD CONSTRAINT FK_Cilent_IDcommande FOREIGN KEY (IDcommande) REFERENCES Commande(IDcommande);
