-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Customer
-- -
-- CustomerID PK int
-- Name string INDEX
-- Address1 string
-- Address2 NULL string
-- Address3 NULL string
-- Order
-- -
-- OrderID PK int
-- CustomerID int FK >- Customer.CustomerID
-- TotalAmount money
-- OrderStatusID int FK >- os.OrderStatusID
-- OrderLine as ol
-- ----
-- OrderLineID PK int
-- OrderID int FK >- Order.OrderID
-- ProductID int FK >- p.ProductID
-- Quantity int
-- Product as p
-- ------------
-- ProductID PK int
-- Name varchar(200) UNIQUE
-- Price money
-- OrderStatus as os
-- ----
-- OrderStatusID PK int
-- Name UNIQUE string

CREATE TABLE "users" (
    "id" int   NOT NULL,
    "customer_name" varchar(255)   NOT NULL,
    "contact_phone" int(10)   NOT NULL,
    -- users can have multiple addresses
    "address_id" int   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "orders" (
    "id" int   NOT NULL,
    "user_id" int   NOT NULL,
    "providing_restaurant_id" int   NOT NULL,
    "ordered_items" int   NOT NULL,
    "timestamp" timestamp   NOT NULL,
    "order_status" varchar(100)   NOT NULL,
    CONSTRAINT "pk_orders" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "addresses" (
    "id" int   NOT NULL,
    "street" varchar(255)   NOT NULL,
    "street2" varchar(255)   NULL,
    "city" varchar(255)   NOT NULL,
    "state" varchar(20)   NOT NULL,
    "zip_code" int(10)   NOT NULL,
    "country" varchar(255)   NOT NULL,
    CONSTRAINT "pk_addresses" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "restaurants" (
    "id" int   NOT NULL,
    "restaurant_name" varchar(255)   NOT NULL,
    "contact_phone" int(10)   NOT NULL,
    "address_id" int   NOT NULL,
    CONSTRAINT "pk_restaurants" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "menuitems" (
    "id" int   NOT NULL,
    "name" varchar(40)   NOT NULL,
    "description" varchar(255)   NOT NULL,
    "price" decimal(12,2)   NOT NULL,
    CONSTRAINT "pk_menuitems" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "users" ADD CONSTRAINT "fk_users_address_id" FOREIGN KEY("address_id")
REFERENCES "addresses" ("id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_providing_restaurant_id" FOREIGN KEY("providing_restaurant_id")
REFERENCES "restaurants" ("id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_ordered_items" FOREIGN KEY("ordered_items")
REFERENCES "menuitems" ("id");

ALTER TABLE "restaurants" ADD CONSTRAINT "fk_restaurants_address_id" FOREIGN KEY("address_id")
REFERENCES "addresses" ("id");

