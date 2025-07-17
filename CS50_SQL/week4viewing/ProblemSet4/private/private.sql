-- CREATE TABLE "triplets" (
--     "sentence_id" INTEGER,
--     "char_num" INTEGER NOT NULL,
--     "count" INTEGER NOT NULL,
--     FOREIGN KEY("sentence_id") REFERENCES "sentences"("id")
-- );

-- INSERT INTO "triplets" VALUES (14, 98, 4);
-- INSERT INTO "triplets" VALUES (114, 3, 5);
-- INSERT INTO "triplets" VALUES (618, 72, 9);
-- INSERT INTO "triplets" VALUES (630, 7, 3);
-- INSERT INTO "triplets" VALUES (932, 12, 5);
-- INSERT INTO "triplets" VALUES (2230, 50, 7);
-- INSERT INTO "triplets" VALUES (2346, 44, 10);
-- INSERT INTO "triplets" VALUES (3041, 14, 5);

-- CREATE VIEW "message" AS
-- SELECT substr("sentence", "char_num", "count") AS "phrase"
-- FROM "triplets"
-- JOIN "sentences" ON "triplets"."sentence_id" = "sentences"."id";

-- SELECT * FROM "message";
-- DROP VIEW "message";