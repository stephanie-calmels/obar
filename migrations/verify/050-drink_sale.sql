-- Verify obar:050-drink_sale on pg

BEGIN;

SELECT drink_sale(6);

ROLLBACK;
