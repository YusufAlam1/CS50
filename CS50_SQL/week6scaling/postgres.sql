-- SHOW DATABSES
\l

CREATE DATABASE "mbta";

-- USE `mbta`
\c "mbta"

-- .tables
\dt

-- .schema
\d "cards"

-- quit
\q

-- Data Types
-- Integer = [ SMALLINT , INT , BIGINT ]
-- Serial  = [ SMALLSERIAL , SERIAL , BIGSERIAL ]
-- TIME    = [ TIMESTAMP, INTERVAL ]
-- REAL    = [ MONEY , NUMERIC(precision, scale) ]

CREATE TABLE "cards" (
    "id" SERIAL
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" SERIAL,
    "name" VARCHAR(32) NOT NULL,
    "line" VARCHAR(32) NOT NULL, 
    PRIMARY KEY("id")
);

CREATE TYPE "swipe_type"
AS ENUM ('enter', 'exit', 'deposit')

CREATE TABLE "swipes" (
    "id" SERIAL,
    "type" "swipe_type" NOT NULL,
    "datetime" TIMESTAMP NOT NULL DEFAULT now()
    "amount" NUMERIC(5,2) NOT NULL CHECK("amount" != 0)
);