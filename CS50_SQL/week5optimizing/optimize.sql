-- Indexes
-- CREATE INDEX "title_index" ON "movies" ("title");
-- SELECT * FROM "movies" WHERE "title" = 'Cars';
-- DROP INDEX "title_index";

-- CREATE INDEX "person_index" ON "stars" ("person_id");
-- CREATE INDEX "name_index" ON "people" ("nam e");

-- Covering Index
-- CREATE INDEX "person_index" ON "stars" ("person_id", "movie_id");

-- Query Plan
-- EXPLAIN QUERY PLAN
-- SELECT * FROM "movies" WHERE "title" = 'Cars';

-- SELECT "title"
-- FROM "movies"
-- WHERE "id" IN (
--     SELECT "movie_id"
--     FROM "stars"
--     WHERE "person_id" = (
--         SELECT "id"
--         FROM "people"
--         WHERE "name" = 'Tom Hanks'
--     )
-- );

-- Partial Index
-- CREATE INDEX "recents" ON "movies" ("title")
-- WHERE "year" = 2023;

-- SELECT "title"
-- FROM "movies"
-- WHERE "year" = 2023;

-- Vaccuum / Optimize
-- du -b movies.db UNIX size command
-- (Get-Item .\movies.db).Length Powershell size command

-- DROP INDEX "person_index";
-- DROP INDEX "name_index";
-- DROP INDEX "recents";
-- VACUUM;
-- .schema
