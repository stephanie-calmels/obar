BEGIN;

TRUNCATE TABLE stock, _m2m_drink_ingredient, ingredient, history, drink RESTART IDENTITY;

INSERT INTO drink(name, price) VALUES
('Gimlet', 10),
('Cosmopolitan', 10),
('Mojito', 12),
('Gin Fizz', 8),
('Sweety', 15),
('Bougie d''anniversaire', 9);

INSERT INTO ingredient(name) VALUES
('Gin'),
('Citron Vert'),
('Vodka'),
('Jus de Cranberry'),
('Cointreau'),
('Champagne'),
('Soho'),
('Sirop de fraise'),
('Curaçao'),
('Menthe'), 
('Rhum'),
('Sucre'),
('Eau gazeuse');

INSERT INTO _m2m_drink_ingredient(drink_id, ingredient_id, quantity) VALUES
(1, 1, 6),
(1, 2, 1),
(2, 2, 4),
(2, 3, 2),
(2, 5, 2),
(2, 4, 2),
(3, 2, 3),
(3, 10, 7),
(3, 11, 6),
(3, 12, 2),
(3, 13, 12),
(4, 2, 4),
(4, 12, 2),
(4, 1, 6),
(4, 13, 5),
(5, 6, 6),
(5, 7, 1),
(6, 5, 5),
(6, 8, 2),
(6, 9, 5);

INSERT INTO stock(ingredient_id, quantity) VALUES
(1, 20),
(2, 70),
(3, 70),
(4, 100),
(5, 35),
(6, 200),
(7, 80),
(8, 50),
(9, 70),
(10, 35),
(11, 70),
(12, 50),
(13, 200);

INSERT INTO history(drink_id) VALUES
(3),(2),(2),(5),(6),(1);

COMMIT;
