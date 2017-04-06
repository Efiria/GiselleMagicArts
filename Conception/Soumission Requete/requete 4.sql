DELIMITER |
DROP PROCEDURE IF EXISTS Statut_Commande |
CREATE PROCEDURE Statut_Commande (IN New_Statut CHAR(32),IN ID_Commande INT)
BEGIN
UPDATE commande SET StatusCommande = New_Statut
WHERE IDCommande = ID_Commande; 
END |

CREATE TRIGGER suppression_stock AFTER UPDATE ON Commande FOR EACH ROW
UPDATE stock SET stock.QuantiteIngredient = stock.QuantiteIngredient - commande.QuantiteIngredient
WHERE stock.NomIngredient = commande.NomIngredient AND IDCommande = ID_Commande;
UPDATE stock SET stock.QuantitePotion = stock.QuantitePotion - commande.QuantitePotion
WHERE stock.NomPotion = commande.NomPotion AND IDCommande = ID_Commande;
UPDATE stock SET stock.QuantiteRecipient = stock.QuantiteRecipient - commande.QuantitePotion
WHERE stock.TypeRecipient = commande.Type.Recipient AND IDCommande = ID_Commande;
UPDATE stock SET stock.QuantiteOnguent = stock.QuantiteOnguent - commande.QuantiteOnguent
WHERE stock.NomOnguent = commande.NomOnguent AND IDCommande = ID_Commande;