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
        IDStock             Int ,
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
