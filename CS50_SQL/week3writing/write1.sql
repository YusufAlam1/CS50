-- UPDATING

-- UPDATE "votes" SET "title" = trim("title");
-- UPDATE "votes" SET "title" = upper("title");
-- UPDATE "votes" SET "title" = 'Farmers working at Dawn'
-- WHERE "title" = 'FARMERS WORKING';
-- UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
-- WHERE "title" LIKE 'FA%';
-- UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE'
-- WHERE "title" LIKE 'Imaginative %';
-- UPDATE "votes" SET "title" = 'PROFUSION OF FLOWERS'
-- WHERE "title" LIKE 'PROFU%';


SELECT "title", COUNT("title")
FROM "votes" 
GROUP BY "title";