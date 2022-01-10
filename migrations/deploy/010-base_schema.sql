-- Deploy obar:001-base_schema to pg

BEGIN;

CREATE TABLE drink (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    price NUMERIC(5, 2) NOT NULL CHECK(price > 0)
);

CREATE TABLE history (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sell_date TIMESTAMPTZ DEFAULT NOW(),
    drink_id INT NOT NULL REFERENCES drink (id)
);

CREATE TABLE ingredient (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE _m2m_drink_ingredient (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    drink_id INT NOT NULL REFERENCES drink (id),
    ingredient_id INT NOT NULL REFERENCES ingredient (id),
    quantity INT NOT NULL CHECK(quantity > 0)

);

CREATE TABLE stock (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    buy_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ingredient_id INT NOT NULL REFERENCES ingredient (id),
    quantity INT NOT NULL CHECK(quantity > 0)
);

COMMIT;
