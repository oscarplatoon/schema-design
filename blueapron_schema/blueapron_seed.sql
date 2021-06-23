--promotions 1996 -12 -02
INSERT INTO promotions (id, promotion_start, promotion_end, promotion_price) 
VALUES (1, '2020-07-26', '2020-07-29', 5999.99);

INSERT INTO promotions (id, promotion_start, promotion_end, promotion_price) 
VALUES (2, '2020-07-26', '2020-07-29', 1099.99);

INSERT INTO promotions (id, promotion_start, promotion_end, promotion_price) 
VALUES (3, '2020-07-26', '2020-07-29', 3599.99);


--ingredients
INSERT INTO ingredients (id, name) 
VALUES (1, 'basil');

INSERT INTO ingredients (id, name) 
VALUES (2, 'pepper');

INSERT INTO ingredients (id, name) 
VALUES (3, 'tapatio');


--recipes
INSERT INTO recipes (id, name, description) 
VALUES (1, 'crepes', 'paper-thin pancakes');

INSERT INTO recipes (id, name, description) 
VALUES (2, 'shrimp pasta', 'spaghetti topped with sea food');

INSERT INTO recipes (id, name, description) 
VALUES (3, 'sushi', 'fish and rice');


--addresses
INSERT INTO addresses (id, line_1, line_2, city, state, zip_code, country) 
VALUES (1, '6500 S. Webster Ave.', 'Unit 5', 'Oakland', 'CA', '94605', 'USA');

INSERT INTO addresses (id, line_1, line_2, city, state, zip_code, country) 
VALUES (2, '9 Endrus Rd.', 'Unit 2', 'Wasaga Beach', 'ON', 'LOL2P0', 'CANADA');

INSERT INTO addresses (id, line_1, city, state, zip_code, country) 
VALUES (3, '45 S. Main St.', 'Houston', 'TX', '78453', 'USA');


--service_plans
INSERT INTO service_plans (id, service_plan_name, service_plan_price) 
VALUES (1, 'Great Service 123', 1999.99);

INSERT INTO service_plans (id, service_plan_name, service_plan_price) 
VALUES (2, 'Service4U', 1599.99);

INSERT INTO service_plans (id, service_plan_name, service_plan_price) 
VALUES (3, 'Good Stuff', 1799.99);



--users
INSERT INTO users (id, user_name, password, contact_phone, address_id, service_plan_id, e_mail) 
VALUES (1, 'happy_chef', 'letscook', '+1 (415) 769 - 3412', 1, 1, 'chefbro@brochef.com');

INSERT INTO users (id, user_name, password, contact_phone, address_id, service_plan_id, e_mail)  
VALUES (2, 'skillet_guy', 'oliveoil123', '+1 (310) 364 - 5714', 2, 2, 'skillet@skillet.com');

INSERT INTO users (id, user_name, password, contact_phone, address_id, service_plan_id, e_mail)  
VALUES (3, 'none_here', 'password', '+1 (312) 555 - 5785', 3, 3, 'none@mail.com');


--deliveries
INSERT INTO deliveries (id, recipe_id, user_id) 
VALUES (1, 1, 1);

INSERT INTO deliveries (id, recipe_id, user_id) 
VALUES (2, 2, 2);

INSERT INTO deliveries (id, recipe_id, user_id) 
VALUES (3, 3, 3);

--recipes_ingredients
INSERT INTO recipes_ingredients (id, recipe_id, ingredient_id, amount) 
VALUES (1, 1, 1, 1);

INSERT INTO recipes_ingredients (id, recipe_id, ingredient_id, amount) 
VALUES (2, 2, 2, 2);

INSERT INTO recipes_ingredients (id, recipe_id, ingredient_id, amount) 
VALUES (3, 3, 3, 3);


--users_promotions
INSERT INTO users_promotions (id, user_id, promotion_id) 
VALUES (1, 1, 1);

INSERT INTO users_promotions (id, user_id, promotion_id) 
VALUES (2, 2, 2);

INSERT INTO users_promotions (id, user_id, promotion_id) 
VALUES (3, 3, 3);

