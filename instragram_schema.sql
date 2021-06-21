# #### Instagram
# * user
# * post
# * comment
# * like
# * follow


users
-----
user_id PK int
user_name varchar(255)
contact_phone int(10)


posts
-----
post_id PK int
post_image_src varchar(255)
post_image_thumbnail_src varchar(255)
post_author int FK - users.user_id
post_likes int FK -< likes.like_id


comments
-----
comment_id PK int
comment_author int FK >- users.user_id
comment_likes int FK >-< likes.like_id

likes
-----
like_id PK int
like_timestamp datetime
liked_post int FK - posts.post_id
like_owner int FK - users.user_id


follows
-----
follow_id PK int
followed_user int FK -< users.user_id
following_user int FK -< users.user_id


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- * user
-- * post
-- * comment
-- * like
-- * follow

CREATE TABLE "users" (
    "user_id" int   NOT NULL,
    "user_name" varchar(255)   NOT NULL,
    "contact_phone" int(10)   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "user_id"
     )
);

CREATE TABLE "posts" (
    "post_id" int   NOT NULL,
    "post_image_src" varchar(255)   NOT NULL,
    "post_image_thumbnail_src" varchar(255)   NOT NULL,
    "post_author" int   NOT NULL,
    "post_likes" int   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "post_id"
     )
);

CREATE TABLE "comments" (
    "comment_id" int   NOT NULL,
    "comment_author" int   NOT NULL,
    "comment_likes" int   NOT NULL,
    CONSTRAINT "pk_comments" PRIMARY KEY (
        "comment_id"
     )
);

CREATE TABLE "likes" (
    "like_id" int   NOT NULL,
    "like_timestamp" datetime   NOT NULL,
    "liked_post" int   NOT NULL,
    "like_owner" int   NOT NULL,
    CONSTRAINT "pk_likes" PRIMARY KEY (
        "like_id"
     )
);

CREATE TABLE "follows" (
    "follow_id" int   NOT NULL,
    "followed_user" int   NOT NULL,
    "following_user" int   NOT NULL,
    CONSTRAINT "pk_follows" PRIMARY KEY (
        "follow_id"
     )
);

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_post_author" FOREIGN KEY("post_author")
REFERENCES "users" ("user_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_post_likes" FOREIGN KEY("post_likes")
REFERENCES "likes" ("like_id");

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_comment_author" FOREIGN KEY("comment_author")
REFERENCES "users" ("user_id");

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_comment_likes" FOREIGN KEY("comment_likes")
REFERENCES "likes" ("like_id");

ALTER TABLE "likes" ADD CONSTRAINT "fk_likes_liked_post" FOREIGN KEY("liked_post")
REFERENCES "posts" ("post_id");

ALTER TABLE "likes" ADD CONSTRAINT "fk_likes_like_owner" FOREIGN KEY("like_owner")
REFERENCES "users" ("user_id");

ALTER TABLE "follows" ADD CONSTRAINT "fk_follows_followed_user" FOREIGN KEY("followed_user")
REFERENCES "users" ("user_id");

ALTER TABLE "follows" ADD CONSTRAINT "fk_follows_following_user" FOREIGN KEY("following_user")
REFERENCES "users" ("user_id");

