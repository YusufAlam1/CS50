-- 1
SELECT "name",
    "city"
FROM "schools"
WHERE "state" = 'MA'
    AND "type" LIKE 'Public School';

-- 2
SELECT "name"
FROM "districts"
WHERE "name" LIKE "%(non-op)";

-- 3
SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
FROM "expenditures";

-- 4
SELECT "city",
    COUNT("id") AS "Number of Public Schools"
FROM "schools"
WHERE "type" LIKE 'Public School'
GROUP BY "city"
ORDER BY "Number of Public Schools" DESC,
    "city"
LIMIT 10;

-- 5
SELECT "city",
    COUNT("id") AS "Number of Public Schools"
FROM "schools"
WHERE "type" LIKE 'Public School'
GROUP BY "city"
HAVING "Number of Public Schools" <= 3
ORDER BY "Number of Public Schools" DESC,
    "city";

-- 6
SELECT "name"
FROM "schools"
WHERE "id" IN (
        SELECT "school_id"
        FROM "graduation_rates"
        WHERE "graduated" = 100
    );

-- 7
SELECT "name"
FROM "schools"
WHERE "district_id" IN (
        SELECT "id"
        FROM "districts"
        WHERE "name" LIKE 'Cambridge'
    );

-- 8
SELECT "districts"."name",
    "expenditures"."pupils"
FROM "expenditures"
    INNER JOIN "districts" ON "expenditures"."district_id" = "districts"."id";

-- 9
SELECT "name"
FROM "districts"
    INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "expenditures"."pupils" = (
        SELECT MIN("pupils")
        FROM "expenditures"
    );

-- 10
SELECT "districts"."name",
    "expenditures"."per_pupil_expenditure"
FROM "expenditures"
    INNER JOIN "districts" ON "expenditures"."district_id" = "districts"."id"
WHERE "districts"."type" LIKE 'Public School District'
ORDER BY "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;

-- 11
SELECT "schools"."name",
    "expenditures"."per_pupil_expenditure",
    "graduation_rates"."graduated"
FROM "districts"
    INNER JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
    INNER JOIN "schools" ON "districts"."id" = "schools"."district_id"
    INNER JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC,
    "schools"."name";

-- 12
SELECT "districts"."name",
    "expenditures"."per_pupil_expenditure",
    "staff_evaluations"."exemplary"
FROM "districts"
    INNER JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
    INNER JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE (
        "expenditures"."per_pupil_expenditure" > (
            SELECT AVG("per_pupil_expenditure")
            FROM "expenditures"
        )
    )
    AND (
        "staff_evaluations"."exemplary" > (
            SELECT AVG("exemplary")
            FROM "staff_evaluations"
        )
    )
    AND (type LIKE 'Public School District')
ORDER BY "staff_evaluations"."exemplary" DESC,
    "per_pupil_expenditure" DESC;

-- 13
SELECT "city",
    "graduation_rates"."dropped",
    "staff_evaluations"."unsatisfactory",
    "staff_evaluations"."needs_improvement"
FROM "schools"
    JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
    JOIN "staff_evaluations" ON "schools"."district_id" = "staff_evaluations"."district_id"
ORDER BY "graduation_rates"."dropped" DESC,
    "staff_evaluations"."unsatisfactory" DESC,
    "staff_evaluations"."needs_improvement" DESC;