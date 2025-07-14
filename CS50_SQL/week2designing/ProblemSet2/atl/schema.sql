-- Corrected Table Definitions
DROP TABLE IF EXISTS "checkins";
DROP TABLE IF EXISTS "flights";
DROP TABLE IF EXISTS "airlines";
DROP TABLE IF EXISTS "passengers";
CREATE TABLE "passengers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);
CREATE TABLE "airlines" (
    "id" INTEGER PRIMARY KEY,
    "airline" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK (
        "concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')
    )
);
CREATE TABLE "flights" (
    "id" INTEGER PRIMARY KEY,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "depart_airport_code" TEXT NOT NULL CHECK(LENGTH("depart_airport_code") = 3),
    "arrive_airport_code" TEXT CHECK(LENGTH("arrive_airport_code") = 3),
    "depart_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrive_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
CREATE TABLE "checkins" (
    "id" INTEGER PRIMARY KEY,
    "passenger_id" INTEGER,
    "checkin_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight" INTEGER NOT NULL,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight") REFERENCES "flights"("id")
);
-- Sample Data
INSERT INTO "passengers" ("id", "first_name", "last_name", "age")
VALUES (1, 'Alice', 'Smith', 30),
    (2, 'Bob', 'Johnson', 45),
    (3, 'Charlie', 'Lee', 28);
INSERT INTO "airlines" ("id", "airline", "concourse")
VALUES (1, 'Delta', 'A'),
    (2, 'United', 'B'),
    (3, 'Southwest', 'C');
INSERT INTO "flights" (
        "id",
        "flight_number",
        "airline_id",
        "depart_airport_code",
        "arrive_airport_code",
        "depart_date",
        "arrive_date"
    )
VALUES (
        1,
        1001,
        1,
        'ATL',
        'JFK',
        '2024-06-01 08:00:00',
        '2024-06-01 10:30:00'
    ),
    (
        2,
        2002,
        2,
        'ATL',
        'ORD',
        '2024-06-01 09:00:00',
        '2024-06-01 11:00:00'
    ),
    (
        3,
        3003,
        3,
        'ATL',
        'LAX',
        '2024-06-01 10:00:00',
        '2024-06-01 13:00:00'
    );
INSERT INTO "checkins" ("id", "passenger_id", "checkin_date", "flight")
VALUES (1, 1, '2024-06-01 07:00:00', 1),
    (2, 2, '2024-06-01 08:15:00', 2),
    (3, 3, '2024-06-01 09:30:00', 3);