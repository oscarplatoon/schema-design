-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).


-- # GrubHub Online Ordering

-- createdb grubhub
-- psql grubhub

CREATE TABLE "users" (
    "id"  SERIAL  NOT NULL,
    "Name" varchar(120)   NOT NULL,
    "Address1" varchar(250)   NOT NULL,
    "city" varchar(50)  NOT NULL,
    "state" varchar(50)   NOT NULL,
    "zipcode" int   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Orders" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "cost" decimal   NOT NULL,
    "item" varchar   NOT NULL,
    CONSTRAINT "pk_Orders" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "menu" (
    "id"  SERIAL  NOT NULL,
    "item" varchar(80)   NOT NULL,
    "cost" int   NOT NULL,
    CONSTRAINT "pk_menu" PRIMARY KEY (
        "id"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "restaurant" (
    "id"  SERIAL  NOT NULL,
    "item" varchar(80)   NOT NULL,
    "quantity" int   NOT NULL,
    CONSTRAINT "pk_restaurant" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Orders" ADD CONSTRAINT "fk_Orders_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "Orders" ADD CONSTRAINT "fk_Orders_cost_item" FOREIGN KEY("cost", "item")
REFERENCES "menu" ("cost", "item");

ALTER TABLE "menu" ADD CONSTRAINT "fk_menu_item" FOREIGN KEY("item")
REFERENCES "restaurant" ("item");

