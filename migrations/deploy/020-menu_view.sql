-- Deploy obar:020-menu_view to pg

BEGIN;

CREATE VIEW menu AS
    SELECT drink.id,
           drink.name,
           drink.price,
           ARRAY_AGG(di.quantity || ' ' || ingredient.name) AS recipe
    FROM drink
    JOIN _m2m_drink_ingredient di
    ON drink.id = di.drink_id
    JOIN ingredient
    ON ingredient.id = di.ingredient_id
    GROUP BY drink.id, drink.name, drink.price;

COMMIT;
