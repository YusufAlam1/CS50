INSERT INTO "user_logs" (
        "type",
        "old_username",
        "new_username",
        "old_password",
        "new_password"
    )
VALUES (
        'update',
        'admin',
        'admin',
        (
            SELECT "new_password"
            FROM "user_logs"
            WHERE "new_username" = 'admin'
                AND "old_password" IS NULL
        ),
        (
            SELECT "new_password"
            FROM "user_logs"
            WHERE "new_username" LIKE "emily33"
                AND "old_password" IS NULL
        )
    );
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';
DELETE FROM "user_logs"
WHERE "new_password" = '982c0381c279d139fd221fce974916e7';

-- -- SELECT * FROM "users";
-- SELECT * FROM "user_logs"
-- WHERE "id" = 51 OR "id" = 1;
-- SELECT * FROM "user_logs"
-- WHERE "new_username" LIKE 'emily33';
-- -- .schema
