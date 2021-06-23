-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- #Blue Apron

-- createdb blueapron
-- psql blueapron

CREATE TABLE "users" (
    "id"  SERIAL  NOT NULL,
    "Name" varchar(120)   NOT NULL,
    "Address1" varchar(250)   NOT NULL,
    "city" varchar(50)   NOT NULL,
    "state" varchar(50)   NOT NULL,
    "zipcode" int   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "serviceplans" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "name" varchar(60)   NOT NULL,
    "planrecipes" varchar  NOT NULL,
    "cost" decimal   NOT NULL,
    CONSTRAINT "pk_serviceplans" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "recipes" (
    "id"  SERIAL  NOT NULL,
    "name" varchar(80)   NOT NULL,
    "cost" decimal   NOT NULL,
    CONSTRAINT "pk_recipes" PRIMARY KEY (
        "id"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "promotions" (
    "id"  SERIAL  NOT NULL,
    "name" varchar(80)   NOT NULL,
    "user_id" int   NOT NULL,
    "value" varchar(8)   NOT NULL,
    CONSTRAINT "pk_promotions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "deliveries" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "timeordered" timestamp   NOT NULL,
    "shippingmethod" varchar(120)   NOT NULL,
    CONSTRAINT "pk_deliveries" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "serviceplans" ADD CONSTRAINT "fk_serviceplans_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "serviceplans" ADD CONSTRAINT "fk_serviceplans_planrecipes" FOREIGN KEY("planrecipes")
REFERENCES "recipes" ("name");

ALTER TABLE "promotions" ADD CONSTRAINT "fk_promotions_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "deliveries" ADD CONSTRAINT "fk_deliveries_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

