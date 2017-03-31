START TRANSACTION;
INSERT INTO `recipient` (`TypeRecipient`,`PrixRecipient`,`Volume`) VALUES
('Fiole','5','1'),
('Tube','22','2'),
('Pot','34','5'),
('Amphore','70','5'),
('Fût','126','10');
COMMIT;