-- Revert obar:070-cash_balance from pg

BEGIN;

DROP VIEW cash_balance;

COMMIT;
