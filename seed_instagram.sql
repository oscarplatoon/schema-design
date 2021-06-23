INSERT INTO users (id, user_name, e_mail, password) VALUES (1, 'henry_rollins', 'rollins@blackflag.com', '54654');
INSERT INTO users (id, user_name, e_mail, password) VALUES (2, 'van_halen', 'eddie@vanhalen.com', 'not666');
INSERT INTO users (id, user_name, e_mail, password) VALUES (3, 'dark_helmet', 'helmet@spaceball1.com', '12345');

INSERT INTO images (id, image_url) VALUES (1, 'www.google.com/logo.jpg');
INSERT INTO images (id, image_url) VALUES (2, 'www.yahoo.com/logo.jpg');
INSERT INTO images (id, image_url) VALUES (3, 'www.duckduckgo.com/logo.jpg');

INSERT INTO posts (id, post_text, image_id, author_id) VALUES (1, 'First post ever', 1, 1);
INSERT INTO posts (id, post_text, image_id, author_id) VALUES (2, 'Random post', 2, 2);
INSERT INTO posts (id, post_text, image_id, author_id) VALUES (3, 'Can you see this?', 3, 3);

INSERT INTO comments (id, post_text, author_id, post_id) VALUES (1, 'I see your first post', 1, 1);
INSERT INTO comments (id, post_text, author_id, post_id) VALUES (2, 'hey, you.', 2, 2);
INSERT INTO comments (id, post_text, author_id, post_id) VALUES (3, 'I cannot see it.', 3, 3);

INSERT INTO likes (id, comment_id, owner_id) VALUES (1, 1, 1);
INSERT INTO likes (id, comment_id, owner_id) VALUES (2, 2, 2);
INSERT INTO likes (id, post_id, owner_id) VALUES (3, 3, 3);


SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('images_id_seq', (SELECT MAX(id) FROM images));
SELECT setval('posts_id_seq', (SELECT MAX(id) FROM posts));
SELECT setval('comments_id_seq', (SELECT MAX(id) FROM comments));
SELECT setval('likes_id_seq', (SELECT MAX(id) FROM likes))