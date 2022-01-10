-- Verify obar:060-ingredients_stock_view on pg

BEGIN;

SELECT * FROM ingredients_stock;

ROLLBACK;
