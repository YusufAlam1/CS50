CREATE TABLE "passangers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "checkin_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight" NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
);
CREATE TABLE "airlines" (
    "id" INTEGER,
    "airline" NOT NULL,
    "concourse" TEXT NOT NULL CHECK (
        "concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')
    ),
    PRIMARY KEY("id")
);
CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "depart_airport_code" INT NOT NULL CHECK(LENGTH("depart_airport_code") = 3),
    "arrive_airport_code" INT CHECK(LENGTH("depart_airport_code") = 3),
    "depart_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrive_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airline"("id")
);

.schema