-- Transaction
-- A single unit of work in a database

-- ACID properties
-- Atomicity
-- Consistency
-- Isolation
-- Durability

-- One at a time
-- UPDATE "accounts"
-- SET "balance" = "balance" + 10
-- WHERE "id" = 2;
-- UPDATE "accounts"
-- SET "balance" = "balance" + 10
-- WHERE "id" = 1;

-- Multiple at once
-- BEGIN TRANSACTION;
-- UPDATE "accounts"
-- SET "balance" = "balance" + 10
-- WHERE "id" = 2;
-- UPDATE "accounts"
-- SET "balance" = "balance" - 10
-- WHERE "id" = 1;
-- COMMIT;

-- BEGIN TRANSACTION;
-- UPDATE "accounts"
-- SET "balance" = "balance" + 10
-- WHERE "id" = 2;
-- UPDATE "accounts"
-- SET "balance" = "balance" - 10
-- WHERE "id" = 1;
-- ROLLBACK;

-- Locks
-- BEGIN EXCLUSIVE TRANSACTION;


-- SELECT *
-- FROM "accounts";