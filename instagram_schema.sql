DROP TABLE IF EXISTS instagram CASCADE;
CREATE TABLE instagram (
  user_id       INTEGER,
  post          VARCHAR(255) NOT NULL,
  comment       VARCHAR(255) NOT NULL,
  does_like     BOOLEAN,
  follow        BOOLEAN
);

ALTER TABLE instagram
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES users (id)