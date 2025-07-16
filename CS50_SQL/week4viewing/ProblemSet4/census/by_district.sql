CREATE VIEW "by_district" AS
SELECT "district", 
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "men",
    SUM("female") AS "women"
FROM "census"
GROUP BY "district";
-- SELECT * FROM "by_district";