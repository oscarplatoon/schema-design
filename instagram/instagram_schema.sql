DROP TABLE IF EXISTS users CASCADE;
create table users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    e_mail VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
drop table if exists images cascade;
create table images (
    id SERIAL PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    post_text VARCHAR(255),
    image_id INTEGER,
    --FK reference to image table 
    author_id INTEGER NOT NULL --FK reference to users table
);
DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_text VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,
    --FK reference to users table
    post_id INTEGER NOT NULL --FK reference to the post where the comment is attached.
);
DROP TABLE IF EXISTS likes CASCADE;
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INTEGER NULL,
    --FK reference to the liked post
    comment_id INTEGER NULL,
    --FK reference to the liked comment
    owner_id INTEGER NOT NULL --FK reference to owner user ID
);

ALTER TABLE posts
ADD CONSTRAINT fk_image_id FOREIGN KEY (image_id) REFERENCES images;
ALTER TABLE posts
ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES users;
ALTER TABLE comments
ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES users;
ALTER TABLE likes
ADD CONSTRAINT fk_post_id FOREIGN KEY (post_id) REFERENCES posts;
ALTER TABLE likes
ADD CONSTRAINT fk_comment_id FOREIGN KEY (comment_id) REFERENCES comments;
ALTER TABLE likes
ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES users;