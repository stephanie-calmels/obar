-- Verify obar:040-drink_soft_delete on pg

BEGIN;

SELECT delete_drink(1);

ROLLBACK;
