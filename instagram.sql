-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).


-- # Instagram
-- createdb instagram
-- psql instagram

CREATE TABLE "users" (
    "id"  SERIAL  NOT NULL,
    "Name" varchar(120)   NOT NULL,
    "Address1" varchar(250)   NOT NULL,
    "city" varchar(50)   NOT NULL,
    "state" varchar(50)  NOT NULL,
    "zipcode" int   NOT NULL,
    "phonenumber" int   NOT NULL,
    "photos" png,
    "videos" mp4,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "message" varchar(250)   NOT NULL,
    "object" varchar,png,mp4,
    "time" timestamp   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "multimedias" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "objectstype" varchar,png,mp4   NOT NULL,
    "time" timestamp   NOT NULL,
    CONSTRAINT "pk_multimedias" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "comments" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "message" varchar(100)   NOT NULL,
    "object" varchar,png,mp4,
    "time" timestamp   NULL,
    CONSTRAINT "pk_comments" PRIMARY KEY (
        "id"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "likes" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "object" varchar,png,mp4,
    "time" timestamp   NOT NULL,
    CONSTRAINT "pk_likes" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "follows" (
    "id"  SERIAL  NOT NULL,
    "user_id" int   NOT NULL,
    "personfollowed" int   NOT NULL,
    "time" timestamp  NOT NULL,
    CONSTRAINT "pk_follows" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "users" ADD CONSTRAINT "fk_users_photos" FOREIGN KEY("photos")
REFERENCES "multimedias" ("id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_videos" FOREIGN KEY("videos")
REFERENCES "multimedias" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_object" FOREIGN KEY("object")
REFERENCES "multimedias" ("id");

ALTER TABLE "multimedias" ADD CONSTRAINT "fk_multimedias_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_object" FOREIGN KEY("object")
REFERENCES "multimedias" ("id");

ALTER TABLE "likes" ADD CONSTRAINT "fk_likes_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "likes" ADD CONSTRAINT "fk_likes_object" FOREIGN KEY("object")
REFERENCES "multimedias" ("id");

ALTER TABLE "follows" ADD CONSTRAINT "fk_follows_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "follows" ADD CONSTRAINT "fk_follows_personfollowed" FOREIGN KEY("personfollowed")
REFERENCES "users" ("id");

