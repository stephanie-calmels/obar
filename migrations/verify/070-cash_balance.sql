-- Verify obar:070-cash_balance on pg

BEGIN;

SELECT * FROM cash_balance;

ROLLBACK;
