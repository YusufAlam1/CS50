CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id",
    "listings"."property_type",
    "listings"."host_name",
    COUNT("reviews") AS "reviews"
FROM "listings"
    JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listings"."id",
    "listings"."property_type",
    "listings"."host_name"
ORDER BY "reviews" DESC
LIMIT 100;

-- SELECT * FROM "frequently_reviewed";