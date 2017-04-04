#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


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
# Table: Potion
#------------------------------------------------------------

CREATE TABLE Potion(
        IDpotion   int (11) Auto_increment  NOT NULL ,
        NomPotion  Char (25) ,
        Diluant    Char (25) ,
        PrixPotion Numeric ,
        Inventeur  Char (25) ,
        PRIMARY KEY (IDpotion )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

CREATE TABLE Onguent(
        IDonguent   int (11) Auto_increment  NOT NULL ,
        NomOnguent  Char (25) ,
        PrixOnguent Numeric ,
        Inventeur   Char (25) ,
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
        Volume       Float ,
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


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        IDfournisseur     int (11) Auto_increment  NOT NULL ,
        NomFournisseur    Char (25) ,
        IngredientEnvoyer Char (25) ,
        DateEnvoi         Date ,
        PRIMARY KEY (IDfournisseur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: OnguentIngredient
#------------------------------------------------------------

CREATE TABLE OnguentIngredient(
        IDingredient Int NOT NULL ,
        IDonguent    Int NOT NULL ,
        PRIMARY KEY (IDingredient ,IDonguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PotionIngredient
#------------------------------------------------------------

CREATE TABLE PotionIngredient(
        IDpotion     Int NOT NULL ,
        IDingredient Int NOT NULL ,
        PRIMARY KEY (IDpotion ,IDingredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Réaprovisionne
#------------------------------------------------------------

CREATE TABLE Reaprovisionne(
        IDfournisseur Int NOT NULL ,
        IDStock       Int NOT NULL ,
        PRIMARY KEY (IDfournisseur ,IDStock )
)ENGINE=InnoDB;

ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDrecipent FOREIGN KEY (IDrecipent) REFERENCES Recipent(IDrecipent);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDpotion FOREIGN KEY (IDpotion) REFERENCES Potion(IDpotion);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDonguent FOREIGN KEY (IDonguent) REFERENCES Onguent(IDonguent);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_IDStock FOREIGN KEY (IDStock) REFERENCES Stock(IDStock);
ALTER TABLE Cilent ADD CONSTRAINT FK_Cilent_IDcommande FOREIGN KEY (IDcommande) REFERENCES Commande(IDcommande);
ALTER TABLE OnguentIngredient ADD CONSTRAINT FK_OnguentIngredient_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE OnguentIngredient ADD CONSTRAINT FK_OnguentIngredient_IDonguent FOREIGN KEY (IDonguent) REFERENCES Onguent(IDonguent);
ALTER TABLE PotionIngredient ADD CONSTRAINT FK_PotionIngredient_IDpotion FOREIGN KEY (IDpotion) REFERENCES Potion(IDpotion);
ALTER TABLE PotionIngredient ADD CONSTRAINT FK_PotionIngredient_IDingredient FOREIGN KEY (IDingredient) REFERENCES Ingredient(IDingredient);
ALTER TABLE Reaprovisionne ADD CONSTRAINT FK_Reaprovisionne_IDfournisseur FOREIGN KEY (IDfournisseur) REFERENCES Fournisseur(IDfournisseur);
ALTER TABLE Reaprovisionne ADD CONSTRAINT FK_Reaprovisionne_IDStock FOREIGN KEY (IDStock) REFERENCES Stock(IDStock);