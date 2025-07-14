-- .import --csv meteorites.csv temp
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);
INSERT INTO "meteorites" (
        "name",
        "class",
        "mass",
        "discovery",
        "year",
        "lat",
        "long"
    )
SELECT "name",
    "class",
    ROUND(NULLIF("mass", ''), 2),
    "discovery",
    NULLIF(year, ''),
    ROUND(NULLIF("lat", ''), 2),
    ROUND(NULLIF("long", ''), 2)
FROM "temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC,
    "name" ASC;
DROP TABLE "temp";