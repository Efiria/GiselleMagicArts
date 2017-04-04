--
-- Contenu table Onguent
--
START TRANSACTION;
INSERT INTO Onguent (NomOnguent,PrixOnguent,Inventeur)
VALUES ('Onguent de bouclier','263','Alucard'),
('Onguent de ténèbres','485','Saruman'),
('Huile de gourdin maudite','487','Gandalf'),
('Huile de pierre maudite','112','Alucard'),
('Onguent des ténèbres','345','Saruman');
COMMIT;