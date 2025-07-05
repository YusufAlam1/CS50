-- -- #1
-- SELECT "birth_city",
--     "birth_state",
--     "birth_country"
-- FROM "players"
-- WHERE "first_name" = 'Jackie'
--     AND "last_name" = 'Robinson';

-- -- #2
-- SELECT "bats"
-- FROM "players"
-- WHERE "first_name" = 'Babe'
--     AND "last_name" = 'Ruth';

-- #3
-- SELECT "id"
-- FROM "players"
-- WHERE "debut" IS NULL;

-- #4
-- SELECT "first_name",
--     "last_name"
-- FROM "players"
-- WHERE "birth_country" != 'USA'
-- ORDER BY "first_name",
--     "last_name";

-- #5
-- SELECT "first_name",
--     "last_name"
-- FROM "players"
-- WHERE "bats" = 'R'
-- ORDER BY "first_name",
--     "last_name";

-- -- #6
SELECT "first_name",
    "last_name",
    "debut"
FROM "players"
WHERE "birth_city" = 'Pittsburgh'
    AND "birth_state" = 'PA'
ORDER BY "debut" DESC,
    "first_name",
    "last_name";

-- #7
-- SELECT COUNT("id")
-- FROM "players"
-- WHERE (
--         "bats" = 'L'
--         AND "throws" = 'R'
--     )
--     OR (
--         "bats" = 'R'
--         AND "throws" = 'L'
--     );

-- #8
-- SELECT ROUND(AVG("height"), 20) AS "Average Height",
--     ROUND(AVG("weight"), 20) AS "Average Weight"
-- FROM "players"
-- WHERE "debut" >= "2000-01-01";

-- #9
-- SELECT "first_name",
--     "last_name"
-- FROM "players"
-- WHERE "final_game" BETWEEN '2022-01-01' AND '2022-12-31'
-- ORDER BY "first_name",
--     "last_name";

-- -- #10
-- SELECT "first_name",
--     "last_name",
--     "weight" AS "CHUNKINESS",
--     "height" AS "TALLNESS"
-- FROM "players"
-- WHERE "birth_country" != 'USA'
-- ORDER BY "weight" DESC,
--     "height" DESC,
--     "first_name",
--     "last_name"
-- LIMIT 50;