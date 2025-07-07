-- JOIN

--INNER JOIN
-- Returns only rows that have matching values in both tables
SELECT *
FROM "sea_lions"
    JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- OUTER JOIN
-- [ LEFT JOIN | RIGHT JOIN | FULL JOIN ]
-- Returns all rows from both tables, with NULLs where there is no match

-- LEFT JOIN
-- Prioritizes rows from the left table
SELECT * 
FROM "sea_lions"
LEFT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- RIGHT JOIN
-- Prioritizes rows from the right table
SELECT * 
FROM "sea_lions"
    RIGHT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- FULL JOIN
-- Returns all rows from both tables, with NULLs where there is no match
SELECT *
FROM "sea_lions"
    FULL JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- NATURAL JOIN
-- Automatically joins tables based on columns with the same name
SELECT *
FROM "sea_lions"
    NATURAL JOIN "migrations";