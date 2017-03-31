START TRANSACTION;
INSERT INTO `recipient` (`TypeRecipient`,`PrixRecipient`,`Volume`) VALUES
('Fiole','5','0.25'),
('Tube','22','0.5'),
('Pot','34','1'),
('Fût','126','10'),
('Amphore','70','25');
COMMIT;