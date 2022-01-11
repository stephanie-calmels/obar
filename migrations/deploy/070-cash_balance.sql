-- Deploy obar:070-cash_balance to pg

BEGIN;

CREATE VIEW cash_balance AS
    SELECT DATE_TRUNC('day', sell_date)::date AS "date",
           SUM(price) AS "balance"
    FROM history
    JOIN drink
    ON drink.id = history.drink_id
    GROUP BY "date";

COMMIT;
