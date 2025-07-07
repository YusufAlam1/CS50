-- *** The Lost Letter ***
SELECT "type", "address"
FROM "addresses"
WHERE "id" IN (
        SELECT "address_id"
        FROM "scans"
        WHERE "package_id" = (
                SELECT "id"
                FROM "packages"
                WHERE "from_address_id" = (
                        SELECT "id"
                        FROM "addresses"
                        WHERE "address" = '900 Somerville Avenue'
                    )
                    AND "to_address_id" = (
                        SELECT "id"
                        FROM "addresses"
                        WHERE "address" = '2 Finnigan Street'
                    )
            )
        ORDER BY "timestamp" DESC
        LIMIT 1
    );
-- *** The Devious Delivery ***
SELECT "type",
    "address"
FROM "addresses"
WHERE "id" IN (
        SELECT "address_id"
        FROM "scans"
        WHERE "package_id" = (
                SELECT "id"
                FROM "packages"
                WHERE "from_address_id" IS NULL
            )
        ORDER BY "timestamp" DESC
        LIMIT 1
    );
-- *** The Forgotten Gift ***
-- Find contents of package
SELECT "contents"
FROM "packages"
WHERE "id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
                SELECT "id"
                FROM "addresses"
                WHERE "address" LIKE '109 tileston street'
            )
            AND "to_address_id" = (
                SELECT "id"
                FROM "addresses"
                WHERE "address" LIKE '728 maple place'
            )
    );

-- Find who has the package
SELECT "name"
FROM "drivers"
WHERE "id" = (
        SELECT "driver_id"
        FROM "scans"
        WHERE "package_id" IN (
                SELECT "id"
                FROM "packages"
                WHERE "from_address_id" = (
                        SELECT "id"
                        FROM "addresses"
                        WHERE "address" LIKE '109 tileston street'
                    )
                    AND "to_address_id" = (
                        SELECT "id"
                        FROM "addresses"
                        WHERE "address" LIKE '728 maple place'
                    )
            )
        ORDER BY "timestamp" DESC
        LIMIT 1
    );