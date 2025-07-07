-- SETS
-- [ UNION , INTERSECT , EXCEPT ]
SELECT "name" 
FROM "translators"
UNION
SELECT "name"
FROM "authors";

SELECT 'author' AS "profession",
    "name"
FROM "authors"
UNION
SELECT 'translator' AS "profession",
    "name"
FROM "translators";

SELECT "name"
FROM "authors"
INTERSECT
SELECT "name" FROM "translators";

SELECT "name"
FROM "authors"
EXCEPT
SELECT "name"
FROM "translators";

SELECT "title"
FROM "books"
WHERE "id" IN (
        SELECT "book_id"
        FROM "translated"
        WHERE "translator_id" = (
                SELECT "id"
                FROM "translators"
                WHERE "name" = 'Sophie Hughes'
            )
        INTERSECT
        SELECT "book_id"
        FROM "translated"
        WHERE "translator_id" = (
                SELECT "id"
                FROM "translators"
                WHERE "name" = 'Margaret Jull Costa'
            )
    );
