-- Revert obar:030-ingredient_purchase from pg

BEGIN;

DROP FUNCTION ingredient_purchase;

COMMIT;
