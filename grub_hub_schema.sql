DROP TABLE IF EXISTS grubhub CASCADE;
CREATE TABLE grubhub (
  order        VARCHAR(255) NOT NULL,
  retaurant    VARCHAR(255) NOT NULL,
  menu_item    VARCHAR(255) NOT NULL,
  user_id      INTEGER
);

ALTER TABLE grubhub
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES users (id)