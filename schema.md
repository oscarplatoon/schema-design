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
Order
-------------------
order_id
user_id
cost

Restaurant
-------------------
restaurant_id
product

Item
-------------------
item_id
item

User
-------------------
user_id
name
email
phone


## Blue Apron
User
-------------------
user_id
service_id    NULL
first_name
last_name
address
email
phone

Service_plans
-------------------
service_id
recipe_id
subscription_type
qauntity
cost


Recipe
-------------------
recipe_id
item
calories
weight


Promotion
-------------------


Delivery
-------------------
user_id
service_id
status?

## Instagram
User
-------------------
id
first_name
last_name