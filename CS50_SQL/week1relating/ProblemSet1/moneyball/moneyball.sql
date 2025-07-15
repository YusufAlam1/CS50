-- 1
SELECT "year",
    ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;
-- 2
SELECT "year",
    "salary"
FROM "salaries"
WHERE "player_id" = (
        SELECT "id"
        FROM "players"
        WHERE "first_name" LIKE "Cal"
            AND "last_name" LIKE "Ripken"
    )
ORDER BY "year" DESC;
-- 3
SELECT "year",
    "HR"
FROM "performances"
WHERE "player_id" = (
        SELECT "id"
        FROM "players"
        WHERE "first_name" LIKE "Ken"
            AND "last_name" LIKE "Griffey"
            AND "birth_year" = 1969
    )
ORDER BY "year" DESC;
-- 4
SELECT "players"."first_name", "players"."last_name", "salaries"."salary"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001
ORDER BY "salaries"."salary" ASC,
            "players"."first_name" ASC,
            "players"."last_name" ASC,
            "players"."id" ASC
LIMIT 50;
-- 5
SELECT DISTINCT("name")
FROM performances
    JOIN teams ON performances.team_id = teams.id
    JOIN players ON performances.player_id = players.id
WHERE players.first_name LIKE 'satchel'
    AND players.last_name LIKE 'paige';
-- 6
SELECT "teams"."name", SUM("H") AS "total hits"
FROM "performances"
INNER JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE performances."year" = 2001
GROUP BY "teams"."name"
ORDER BY "total hits" DESC
LIMIT 5;
-- 7
SELECT "first_name",
    "last_name"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
ORDER BY "salaries"."salary" DESC
LIMIT 1;
-- 8
SELECT "salary"
FROM "salaries"
JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
WHERE "performances"."year" = 2001 AND "salaries"."year" = 2001 
ORDER BY "HR" DESC
LIMIT 1;
--  9
SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary"
FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "average salary" ASC
LIMIT 5;
-- 10
SELECT "players"."first_name",
    "players"."last_name",
    "salaries"."salary",
    "performances"."HR",
    "salaries"."year"
FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC,
    "salaries"."year" DESC,
    "performances"."HR" DESC,
    "salaries"."salary" DESC;
-- 11
SELECT "players"."first_name",
    "players"."last_name",
    "salaries"."salary" / "performances"."H" AS "dollars per hit"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
                 AND "salaries"."year" = "performances"."year"
WHERE "performances"."H" != 0 AND 
    "salaries"."year" = 2001
ORDER BY "dollars per hit" ASC,
    "players"."first_name" ASC,
    "players"."last_name" ASC
LIMIT 10;
-- 12
SELECT players.first_name,
    players.last_name
FROM players
WHERE players.id IN (
        SELECT player_id
        FROM (
                SELECT salaries.player_id
                FROM salaries
                    JOIN performances ON salaries.player_id = performances.player_id
                    AND salaries.year = performances.year
                WHERE salaries.year = 2001
                    AND performances.H != 0
                ORDER BY salaries.salary * 1.0 / performances.H ASC
                LIMIT 10
            )
        INTERSECT
        SELECT player_id
        FROM (
                SELECT salaries.player_id
                FROM salaries
                    JOIN performances ON salaries.player_id = performances.player_id
                    AND salaries.year = performances.year
                WHERE salaries.year = 2001
                    AND performances.RBI != 0
                ORDER BY salaries.salary * 1.0 / performances.RBI ASC
                LIMIT 10
            )
    )
ORDER BY players.id ASC;