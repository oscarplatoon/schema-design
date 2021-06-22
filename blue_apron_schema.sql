DROP TABLE IF EXISTS blue_apron CASCADE;
CREATE TABLE blue_apron (
  user_id       INTEGER
  service_plans VARCHAR(255) NOT NULL,
  recipe        VARCHAR(255) NOT NULL,
  promotion     BOOLEAN,
  delivery      BOOLEAN,
);

ALTER TABLE blue_apron
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES users (id)