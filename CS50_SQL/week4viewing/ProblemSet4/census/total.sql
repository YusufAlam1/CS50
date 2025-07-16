CREATE VIEW "total" AS
SELECT SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "men",
    SUM("female") AS "women"
FROM "census";
-- SELECT * FROM "total";