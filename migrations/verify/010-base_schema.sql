-- Verify obar:001-base_schema on pg

BEGIN;

INSERT INTO drink(name, price) VALUES ('Gimlet', 10);

INSERT INTO ingredient(name) VALUES ('Gin');

INSERT INTO _m2m_drink_ingredient(drink_id, ingredient_id, quantity) VALUES (1, 1, 6);

INSERT INTO stock(ingredient_id, quantity) VALUES (1, 20);

INSERT INTO history(drink_id) VALUES (1);

ROLLBACK;
