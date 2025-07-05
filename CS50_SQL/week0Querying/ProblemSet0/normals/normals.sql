-- #1
SELECT "0m"
FROM "normals"
WHERE "latitude" = 42.5
    AND "longitude" = -69.5;

-- #2
SELECT "225m"
FROM "normals"
WHERE "latitude" = 42.5
    AND "longitude" = -69.5;

-- #3
SELECT "0m",
    "100m",
    "200m"
FROM "normals"
WHERE "latitude" = 43.5
    AND "longitude" = -68.5;

-- #4
SELECT MIN("0m")
FROM "normals";

-- #5
SELECT MAX("0m")
FROM "normals";

-- #6
SELECT "latitude",
    "longitude",
    "50m"
FROM "normals"
WHERE "latitude" BETWEEN 0 AND 20
    AND "longitude" BETWEEN 55 AND 75;

-- #7
SELECT ROUND(AVG("0m"), 2) AS "Average Equator Ocean Surface Temperature"
FROM "normals"
WHERE "latitude" BETWEEN -0.5 AND 0.5;

-- #8
SELECT "latitude",
    "longitude",
    "0m"
FROM "normals"
ORDER BY "0m" ASC,
    "latitude" ASC
LIMIT 10;

-- #9
SELECT "latitude",
    "longitude",
    "0m"
FROM "normals"
ORDER BY "0m" DESC,
    "latitude" ASC
LIMIT 10;

-- #10
SELECT COUNT(DISTINCT "latitude")
FROM "normals";