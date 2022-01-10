-- Deploy obar:030-ingredient_purchase to pg

BEGIN;

CREATE FUNCTION ingredient_purchase(ingredient_id INT, quantity INT) RETURNS VOID AS
$$
    INSERT INTO stock(ingredient_id, quantity) VALUES (ingredient_id, quantity);
$$
LANGUAGE sql VOLATILE STRICT;

COMMIT;
