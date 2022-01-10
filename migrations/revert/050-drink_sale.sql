-- Revert obar:050-drink_sale from pg

BEGIN;

DROP FUNCTION drink_sale;

COMMIT;
