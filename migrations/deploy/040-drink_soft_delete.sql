-- Deploy obar:040-drink_soft_delete to pg

BEGIN;

ALTER TABLE drink
    ADD deleted BOOLEAN DEFAULT FALSE;

CREATE OR REPLACE VIEW menu AS
    SELECT drink.id,
           drink.name,
           drink.price,
           ARRAY_AGG(di.quantity || ' ' || ingredient.name) AS recipe
    FROM drink
    JOIN _m2m_drink_ingredient di
    ON drink.id = di.drink_id
    JOIN ingredient
    ON ingredient.id = di.ingredient_id
    WHERE drink.deleted = FALSE
    GROUP BY drink.id, drink.name, drink.price;   

CREATE FUNCTION delete_drink(drink_id INT) RETURNS VOID AS
$$
    UPDATE drink SET deleted=TRUE WHERE id=drink_id;
$$
LANGUAGE sql VOLATILE STRICT; 

COMMIT;
