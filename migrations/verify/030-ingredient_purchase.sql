-- Verify obar:030-ingredient_purchase on pg

BEGIN;

SELECT ingredient_purchase(1, 10);

ROLLBACK;
