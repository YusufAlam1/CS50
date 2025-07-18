CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", 
    "property_type",
    "host_name",
    COUNT("availabilities"."available") AS "days_vacant"
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "availabilities"."date" BETWEEN '2023-06-01' AND '2023-06-30'
  AND "availabilities"."available" = 'TRUE'
GROUP BY "listings"."id", "property_type", "host_name";

-- SELECT * FROM "june_vacancies";
-- SELECT SUM("days_vacant") FROM "june_vacancies";