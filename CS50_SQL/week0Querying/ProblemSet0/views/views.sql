-- #1
SELECT "japanese_title",
    "english_title"
FROM "views";

-- #2
SELECT "average_color"
FROM "views"
WHERE "artist" = 'Hokusai'
    AND "english_title" LIKE "%river%";

-- #3
SELECT COUNT("print_number")
FROM "views"
WHERE "artist" = 'Hokusai'
    AND "english_title" LIKE "%fuji%";

-- #4
SELECT COUNT("english_title")
FROM "views"
WHERE "artist" = 'Hiroshige'
    AND "english_title" LIKE '%Eastern Capital%';

-- #5
SELECT MAX("contrast") AS "Maximum Contrast"
FROM "views"
WHERE "artist" = 'Hokusai';

-- #6
SELECT ROUND(AVG("entropy"), 2) AS "Hiroshe Average Entropy"
FROM "views"
WHERE "artist" = 'Hiroshige';

-- #7
SELECT "english_title"
FROM "views"
WHERE "artist" = 'Hiroshige'
ORDER BY "brightness" DESC
LIMIT 5;

-- #8
SELECT "english_title"
FROM "views"
WHERE "artist" = 'Hokusai'
ORDER BY "contrast" ASC
LIMIT 5;

-- #9
SELECT "english_title",
    "artist"
FROM "views"
ORDER BY "brightness" DESC
LIMIT 1;

-- #10
SELECT "artist",
    AVG("entropy") AS "Randomness"
FROM "views"
WHERE "artist" IN ('Hokusai', 'Hiroshige')
GROUP BY "artist"
ORDER BY "Randomness" DESC;