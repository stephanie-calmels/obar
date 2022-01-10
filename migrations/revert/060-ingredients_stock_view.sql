-- Revert obar:060-ingredients_stock_view from pg

BEGIN;

DROP VIEW supply;
DROP VIEW consumption;
DROP VIEW ingredients_stock;

COMMIT;
