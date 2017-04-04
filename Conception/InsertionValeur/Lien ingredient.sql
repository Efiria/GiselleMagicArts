
START TRANSACTION;
INSERT INTO onguentingredient (IDingredient,IDonguent)
VALUES ('1','1'),
('3','1'),
('6','1'),
('1','2'),
('6','2'),
('4','2'),
('13','3'),
('9','3'),
('5','3'),
('6','3'),
('1','4'),
('11','4'),
('10','4'),
('9','5'),
('2','5'),
('7','5');
COMMIT;


START TRANSACTION;
INSERT INTO potioningredient (IDingredient,IDpotion)
VALUES ('9','1'),
('3','1'),
('6','1'),
('1','2'),
('7','2'),
('4','2'),
('13','3'),
('9','3'),
('5','3'),
('6','3'),
('1','4'),
('11','4'),
('10','4'),
('9','5'),
('2','5'),
('7','5'),
('1','5');
COMMIT;
