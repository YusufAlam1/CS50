-- INSERTING

-- collections
-- INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
-- VALUES 
--     (1, 'Farmers working at dawn', '11.6152', '1911-08-03'),
--     (2, 'Imaginative landscape', '56.496', NULL),
--     (3, 'Profusion of flowers', '56.257', '1956-04-12'),
--     (4, 'Spring Outing', '14.76', '1914-01-08'),
--     (5, 'Peonies and Butterfly', '06.1899', '1906-01-01');

-- artists
-- INSERT INTO "artists" ("id", "name")
-- VALUES 
--     (1, 'Li Yin'),
--     (2, 'Qian Weicheng'),
--     (3, 'Unidentified artist'),
--     (4, 'Zhou Chen');

-- created
-- INSERT INTO "created" ("artist_id", "collection_id")
-- VALUES 
--     (1, 2),
--     (2, 3),
--     (3, 1),
--     (4, 4);


-- IMPORTING 
-- .import --csv --skip 1 mfa.csv collections
-- .import --csv mfa.csv temp
-- INSERT INTO "collections" ("title", "accession_number", "acquired")
-- SELECT "title",
--     "accesion_number",
--     "acquired"
-- FROM "temp";
-- DROP TABLE "temp";


-- DELETING
-- DELETING
-- DELETE FROM "collections" WHERE "title" = 'Spring Outing';
-- DELETE FROM "collections" WHERE "acquired" IS NULL; 
-- DELETE FROM "collections" WHERE "acquired" < '1909-01-01';


-- KEY CONSTRAINTS
-- DELETE FROM "created" 
-- WHERE "artist_id" = (
--     SELECT "id"
--     FROM "artists"
--     WHERE "name" = 'Unidentified artist'
-- );

-- DELETE FROM "artists"
-- WHERE "name" = 'Unidentified artist'


-- UPDATING
-- UPDATE "created" SET "artist_id" = (
--     SELECT "id"
--     FROM "artists"
--     WHERE "name" = 'Li Yin'
-- )
-- WHERE "collection_id" = (
--     SELECT "id" FROM "collections"
--     WHERE "title" LIKE'Farmers working at dawn'
-- );


-- TRIGGERS & soft DELETIONS
-- CREATE TRIGGER "sell"
-- BEFORE DELETE ON "collections"
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO "transactions" ("title", "action")
--     VALUES (OLD."title", 'sold');
-- END;
-- DELETE FROM "collections" WHERE "title" = 'Profusion of flowers'; 

-- CREATE TRIGGER "buy"
-- AFTER INSERT ON "collections"
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO "transactions" ("title", "action")
--     VALUES (NEW."title", 'bought');
-- END;
-- INSERT INTO "collections" ("title", "accession_number", "acquired")
--     VALUES ('Profusion of flower', '56.247', '1956-04-12');

-- ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- UPDATE "collections" 
-- SET "deleted" = 1 
-- WHERE "title" = 'Farmers working at dawn';

-- SELECT *
-- FROM "collections"
-- WHERE "deleted" = 1;

-- .schema
-- SELECT * FROM "collections";
-- SELECT * FROM "artists";
-- SELECT * FROM "created";
-- SELECT * FROM "transactions";

-- DROP TRIGGER IF EXISTS "buy";
