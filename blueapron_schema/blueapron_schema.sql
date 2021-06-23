-- users -----
-- id PK int 
-- user_name varchar(255) 
-- password string 
-- contact_phone int(10) 
-- address_id FK - addresses.id 
-- service_plan FK - sp.id 

-- users_promotions
--  -
--  id pk int 
--  user_id fk - users.id 
--  promotion_id FK - promotions.id 

-- service_plans as sp
-- -----
-- id PK int 
-- service_plan_name varchar(255) 
-- service_plan_price decimal(4, 2) 
-- service_plan_promotions FK > - < promotions.id 

-- addresses 
-- -----
-- id PK int
--  street varchar(255)
--  street2 varchar(255) NULL
--   city varchar(255)
--    state varchar(20) 
--    zip_code int(10) 
--    country varchar(255) 

-- recipes as rcp 
-- -----
-- id PK int 
-- name varchar(40) 
-- description varchar(255) 

-- ingredients 
-- -
--  id PK int 
--  name string 
 
--  recipes_ingredients
--   - 
--   id PK int
--    recipe_id FK - recipes.id
--  ingredients_id FK - ingredients.id 
--  amount int 

-- promotions 
-- -----
-- id PK int 
-- promotion_start_date date NULL 
-- promotion_end_date date NULL
-- promotion_price decimal(4, 2) NOT NULL

-- deliveries as del 
-- -----
-- id PK int
--  delivery_recipe FK - < rcp.id 
--  delivery_recipient FK - users.id 
--  delivery_date date

--

--
DROP TABLE IF EXISTS promotions CASCADE;
CREATE TABLE promotions (
    id SERIAL PRIMARY KEY,
    promotion_start DATE NULL,
    promotion_end DATE NULL,
    promotion_price decimal(12, 2) NOT NULL
);

--
DROP TABLE IF EXISTS ingredients CASCADE;
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name varchar(255)
);

--
DROP TABLE IF EXISTS recipes CASCADE;
CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name varchar(40),
    description varchar(255)
);

--
DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    line_1 varchar(255) NOT NULL,
    line_2 varchar(255) NULL,
    city varchar(255) NOT NULL,
    state varchar(20) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    country varchar(30) NOT NULL
);

--
DROP TABLE IF EXISTS service_plans CASCADE;
CREATE TABLE service_plans (
    id SERIAL PRIMARY KEY,
    service_plan_name varchar(255) NOT NULL, 
    service_plan_price decimal(12, 2) NOT NULL 
);

--
DROP TABLE IF EXISTS deliveries CASCADE;
CREATE TABLE deliveries (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER NOT NULL, 
    user_id INTEGER NOT NULL 
);


DROP TABLE IF EXISTS users CASCADE;
create table users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL, 
    e_mail VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(30) NULL,
    address_id INTEGER, --fk
    service_plan_id INTEGER NULL --fk 
);

--
DROP TABLE IF EXISTS  recipes_ingredients;
CREATE TABLE recipes_ingredients(
    id Serial PRIMARY KEY,
    recipe_id INTEGER,
    ingredient_id INTEGER,
    amount INTEGER
);

--
DROP TABLE IF EXISTS users_promotions;
CREATE TABLE users_promotions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER, --fk to users.id
    promotion_id INTEGER --fk to promotions.id
);

-- User FK setup:
ALTER TABLE users
    ADD CONSTRAINT fk_address_id 
    FOREIGN KEY (address_id) 
    REFERENCES addresses;

ALTER TABLE users
    ADD CONSTRAINT fk_service_plan_id 
    FOREIGN KEY (service_plan_id) 
    REFERENCES service_plans;

-- Deliveries FK setup:
ALTER TABLE deliveries
    ADD CONSTRAINT fk_recipe_id 
    FOREIGN KEY (recipe_id) 
    REFERENCES recipes;

ALTER TABLE deliveries
    ADD CONSTRAINT fk_user_id 
    FOREIGN KEY (user_id) 
    REFERENCES users;

-- recipes_ingredients join table FK setup:
ALTER TABLE recipes_ingredients
    ADD CONSTRAINT fk_recipe_id 
    FOREIGN KEY (recipe_id) 
    REFERENCES recipes;

ALTER TABLE recipes_ingredients
    ADD CONSTRAINT fk_ingredient_id 
    FOREIGN KEY (ingredient_id) 
    REFERENCES ingredients;

-- users_promotions join table fk
ALTER TABLE users_promotions
    ADD CONSTRAINT fk_user_id 
    FOREIGN KEY (user_id) 
    REFERENCES users;

ALTER TABLE users_promotions
    ADD CONSTRAINT fk_promotion_id 
    FOREIGN KEY (promotion_id) 
    REFERENCES promotions;