-- Deploy obar:060-ingredients_stock_view to pg

BEGIN;

CREATE VIEW supply AS
    SELECT ingredient_id,
        SUM(quantity)
        FROM stock
        GROUP BY ingredient_id;

CREATE VIEW consumption AS
    SELECT di.ingredient_id,
        SUM(di.quantity)
        FROM _m2m_drink_ingredient di
        JOIN history
        ON history.drink_id = di.drink_id
        GROUP BY di.ingredient_id;

CREATE VIEW ingredients_stock AS
    SELECT supply.ingredient_id,
           ingredient.name,
           supply.sum - consumption.sum AS solde
    FROM supply
    JOIN consumption
    ON consumption.ingredient_id = supply.ingredient_id
    JOIN ingredient
    ON ingredient.id = supply.ingredient_id;


COMMIT;
