SELECT "title"
FROM "books"
WHERE "id" IN (
        SELECT "book_id"
        FROM "authored"
        WHERE "author_id" = (
                SELECT "id"
                FROM "authors"
                WHERE "name" LIKE 'Fernanda%'
            )
    );
SELECT "name",
    "title"
FROM "authors"
    JOIN "authored" ON "authors"."id" = "authored"."author_id"
    JOIN "books" ON "books"."id" = "authored"."book_id";

-- Simplifying 
CREATE VIEW "longlist" AS
SELECT "name",
    "title"
FROM "authors"
    JOIN "authored" ON "authors"."id" = "authored"."author_id"
    JOIN "books" ON "books"."id" = "authored"."book_id";

-- Aggregating 
CREATE VIEW "average_book_ratings" AS
SELECT "book_id",
    "title",
    "year",
    ROUND(AVG("rating"), 2) as "rating"
FROM "ratings"
    JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

-- Temporary 
CREATE TEMPORARY VIEW "average_ratings_by_year" AS
SELECT "year",
    ROUND(AVG("rating"), 2) AS "rating"
FROM "average_book_ratings"
GROUP BY "year";
-- * ONLY WORKS IN TERMINAL 

-- Common Table Expressions (CTE) 
WITH "average_book_ratings" AS (
SELECT "book_id",
    "title",
    "year",
    ROUND(AVG("rating"), 2) AS "rating"
FROM "ratings"
    JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id"
)
SELECT "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "average_book_ratings"
GROUP BY "year";

-- Partitioning
CREATE VIEW "2022" AS
SELECT "id",
    "title"
FROM "books"
WHERE "year" = 2022;

CREATE VIEW "2021" AS
SELECT "id", 
    "title"
FROM "books"
WHERE "year" = 2021;
SELECT * FROM "2021";