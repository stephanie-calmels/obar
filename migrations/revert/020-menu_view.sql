-- Revert obar:020-menu_view from pg

BEGIN;

DROP VIEW menu;

COMMIT;
