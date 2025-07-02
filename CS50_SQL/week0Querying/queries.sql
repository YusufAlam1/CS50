-- SELECT ALL [ * ]
-- SELECT * FROM "longlist";

-- FILTERING
-- [ LIMIT , WHERE ]
-- SELECT "title" FROM "longlist" LIMIT 10;
-- SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;


-- NEGATE
-- [ != , <> , NOT ] 
-- SELECT "title", "format" FROM "longlist" WHERE NOT "format" = 'hardcover';


-- COMPOUND CONDITIONS
-- [ AND , OR , ()]
-- SELECT "title", "author" FROM "longlist" WHERE "year" = 2022 OR "year" = 2023;
-- SELECT "title", "format" FROM "longlist" WHERE ("year" = 2022 OR "year" = 2023) AND "format" != 'hardcover';


-- MISSING VALUES
-- [ IS NULL , IS NOT NULL ]
-- SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NULL;


-- MATCHING
-- [ LIKE , %  , _ ]
-- SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';
-- SELECT "title" FROM "longlist" WHERE "title" LIKE 'the %';
-- SELECT "title" FROM "longlist" WHERE "title" LIKE 'P_re';


-- RANGES
-- [ > , < , >= , <= , BETWEEN ... AND ...]
-- SELECT "title", "year" FROM "longlist" WHERE "year" = 2019 OR "year" = 2020 OR "year" = 2021 OR "year" = 2022;
-- SELECT "title", "year" FROM "longlist" WHERE "year" >= 2019 AND "year" <= 2022;
-- SELECT "title", "year" FROM "longlist" WHERE "year" BETWEEN 2019 AND 2022;
-- SELECT "title", "rating" FROM "longlist" WHERE "rating" >= 4.0;
-- SELECT "title", "rating", "votes" FROM "longlist" WHERE "rating" > 4.0 AND "votes" > 10000;
-- SELECT "title", "pages" FROM "longlist" WHERE "pages" < 300;


-- ORDERING
-- [ ORDER BY ]
-- SELECT "title" , "rating" FROM "longlist" ORDER BY "rating" LIMIT 10;
-- SELECT "title" , "rating" FROM "longlist" ORDER BY "rating" DESC LIMIT 10;
-- SELECT "title", "rating", "votes" FROM "longlist" ORDER BY "rating" DESC, "votes" DESC LIMIT 10;
-- SELECT "title" FROM "longlist" ORDER BY "title" DESC;


-- AGGREGATE FUNCTIONS
-- [ COUNT , AVG , MIN , MAX , SUM , DISTINCT]
-- PRETTIFY
-- [ ROUND , AS ]
-- SELECT ROUND(AVG("rating"), 2) FROM "longlist";
-- SELECT ROUND(AVG("rating"), 2) AS "average rating" FROM "longlist";
-- SELECT MAX("rating") FROM "longlist";
-- SELECT MIN("rating") FROM "longlist";
-- SELECT SUM("votes") FROM "longlist";
-- SELECT COUNT(*) FROM "longlist";
-- SELECT COUNT("translator") FROM "longlist";
-- SELECT MAX("title"), MIN("title") FROM "longlist";
-- SELECT COUNT(DISTINCT("publisher")) FROM "longlist";