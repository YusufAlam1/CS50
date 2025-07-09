-- CREATE TABLE
CREATE TABLE "riders" (
    "id",
    "name"
);
CREATE TABLE "stations" (
    "id",
    "name",
    "line"
);
CREATE TABLE "visits" (
    "rider_id"
    "station_id"
);

-- DROP TABLE
DROP TABLE "riders";
DROP TABLE"stations";
DROP TABLE "visits";
DROP TABLE "swipes";

-- ALTER TABLE
ALTER TABLE "visits" RENAME TO  "swipes";
ALTER TABLE "swipes" ADD COLUMN "ttpe" TEXT;
ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";
ALTER TABLE "swipes" DROP COLUMN "type";

-- Data Types
-- [ 0-byte - 4-byte , 6-byte , 8-byte integer ]

-- Storage Classes
-- Associated with inidvidual values
-- [ NULL , INTEGER , REAL , TEXT , BLOB ]

-- Type Affinities
-- Associated with individual columns
-- [ TEXT , NUMERIC , INTEGER , REAL , BLOB ]

-- Table Constraints
-- [ PRIMARY KEY , FOREIGN KEY , REFERENCES ]

-- Column Constains
-- [ CHECK , DEFAULT , NOT NULL , UNIQUE ]