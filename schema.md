#Visualize your schema

Open this file in your text editor and visualize your schema. At the top is your table name. Listed below are all the columns in that table. 

User
-------------------
id
first_name
last_name

Address
-------------------
id
user_id
street 
street2 
city
state
zip_code
country

In the example above, each Address can belong to a User. This is achieved by adding a column called `user_id`, which can match only ONE of the values in the `id` column of the User table. Remember, `id`s are unique; no table can have two `id` values that are the same.

Using the above format, jot down the database for your apps below!

## GrubHub Online Ordering

## Blue Apron
# Modify this code to update the DB schema diagram.
# To reset the sample schema, replace everything with
# two dots ('..' - without quotes).

users
-
id PK int
first_name varchar(32)
last_name varchar(32)
address_id int fk >- addresses.id
service_plan_id int fk >- service_plans.id
promotions_id int fk >- promotions.id

service_plans
-
id PK int
plan_name varchar(32)
monthly_cost decimal
renewal_date datetime
num_deliveries_month int

addresses
-
id pk int
street varchar(32)
city varchar(32)
state varchar(32)
zipcode varchar(32)

promotions
-
id pk int
promotion_name varchar(32)
discount_amount decimal
start_date datetime
end_date datetime

deliveries
-
id pk int
user_id int fk >- users.id
periodicity datetime
recipe_id int fk >- recipes.id

recipes
-
id pk int
title varchar(32)
ingredient_id int fk >- ingredients.id
instructions varchar(255)

ingredients
-
id pk int
name varchar(32)
calories int

## Instagram
users
-
id int pk
name varchar(64)
email varchar(64)

posts
-
id int pk
content varchar(255)
image_url varchar(64)
user_id int fk >- users.id

comments
-
id int pk
content varchar(255)
post_id int fk >- posts.id
user_id int fk >- users.id

likes
-
id int pk
post_id int fk >- posts.id
like_status bool

follow
-
id int pk
user_followed int fk >- users.id
user_following int fk >- users.id
follow_status bool
