-- Deploy obar:050-drink_sale to pg

BEGIN;

CREATE FUNCTION drink_sale(drink_id INT) RETURNS VOID AS
$$
    INSERT INTO history(drink_id) VALUES (drink_id);
$$
LANGUAGE sql VOLATILE STRICT;

COMMIT;
