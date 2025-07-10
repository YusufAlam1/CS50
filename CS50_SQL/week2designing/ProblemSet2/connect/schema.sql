CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "password" NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "connections" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "company_id" INTEGER,
    "school_start" INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "school_end" INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "degree" TEXT NOT NULL,
    "company_start" INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "company_end" INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("company_id") REFERENCES "company"("id")
);

-- DROP TABLE "users";
-- DROP TABLE "schools";
-- DROP TABLE "companies";
-- DROP TABLE "connections";
