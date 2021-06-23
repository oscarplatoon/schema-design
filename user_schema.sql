DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL
);

DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses (
id            serial PRIMARY KEY, 
user_id       INTEGER,
street        varchar(255) NOT NULL,
street2       varchar(255) NOT NULL,
city          varchar(255) NOT NULL,
state         varchar(255) NOT NULL,
zipcode       INTEGER,
country       varchar(255) NOT NULL
);

ALTER TABLE addresses
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES users (id)