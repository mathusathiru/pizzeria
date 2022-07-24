-- creating pizzeria database

CREATE DATABASE pizzeria;
USE pizzeria;

-- creating tables 

CREATE TABLE products (
product_name VARCHAR(50) NOT NULL PRIMARY KEY, 
product_price FLOAT NOT NULL
);

CREATE TABLE stock (
stock_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
quantity INT,
    CONSTRAINT fk_product_name 
    FOREIGN KEY (product_name)
        REFERENCES products (product_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE staff (
staff_name VARCHAR(50) NOT NULL PRIMARY KEY, 
staff_email VARCHAR(50) NOT NULL, 
staff_phone BIGINT NOT NULL,
staff_day VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_first_name VARCHAR(50) NOT NULL,
customer_last_name VARCHAR(50) NOT NULL,  
customer_phone BIGINT NOT NULL,
customer_road VARCHAR(50) NOT NULL,
customer_town VARCHAR(50) NOT NULL, 
customer_postcode VARCHAR(10) NOT NULL
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT, 
staff_name VARCHAR(50),
order_price FLOAT NOT NULL,
order_date DATE NOT NULL,
order_status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_customer_id
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_staff_name
    FOREIGN KEY (staff_name)
        REFERENCES staff (staff_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE	
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    item_quantity INT NOT NULL,
    CONSTRAINT fk_order_id FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_product_name_items FOREIGN KEY (product_name)
        REFERENCES products (product_name)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_customer_id_items FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- inserting data into tables

INSERT INTO 
products
(product_name, product_price)
VALUES
("Cheese", 5.00),
("Mushroom", 6.00),
("Olive", 6.00),
("Onion", 6.00),
("Garlic", 6.00),
("Bell Pepper", 6.00),
("Margherita", 6.00),
("Pineapple", 6.00),
("Pepperoni", 6.00),
("Sausage", 6.00),
("Ham", 6.00),
("Anchovy", 6.00),
("Shrimp", 6.00),
("Chicken", 6.00),
("Green Dream", 7.00),
("Classic Meat", 7.00),
("Vegan", 7.00),
("Vegetarian", 8.00),
("Supreme", 8.00),
("Meat Lovers", 8.00);

INSERT INTO stock
(product_name, quantity)
VALUES
("Cheese", 20),
("Mushroom", 10),
("Olive", 10),
("Onion", 10),
("Garlic", 10),
("Bell Pepper", 10),
("Margherita", 10),
("Pineapple", 10),
("Pepperoni", 10),
("Sausage", 10),
("Ham", 10),
("Anchovy", 10),
("Shrimp", 10),
("Chicken", 10),
("Green Dream", 5),
("Classic Meat", 5),
("Vegan", 5),
("Vegetarian", 5),
("Supreme", 5),
("Meat Lovers", 5);

INSERT INTO staff ( staff_name, staff_email, staff_phone, staff_day )
VALUES
("Joel", "joel@gmail.com", 07700900482 , "Monday"),
("Tamera", "tamera@gmail.com", 01314960513, "Tuesday"),
("Jayme", "jayme@gmail.com", 01514960404, "Tuesday"),
("Krystine", "krystine@gmail.com", 07700900482, "Wednesday"),
("Daniela", "daniela@gmail.com", 01614960484, "Thursday"),
("Rudy", "rudy@gmail.com", 01164960360, "Friday"),
("Coby", "coby@gmail.com", 01614960174, "Friday"),
("Ralf", "ralf@gmail.com", 01214960103, "Saturday"),
("Mort", "mort@gmail.com", 01314960467, "Saturday"),
("Kourtney", "kourtney@gmail.com", 01614960124, "Sunday");

INSERT INTO customers ( customer_first_name, customer_last_name, customer_phone, customer_road, customer_town, customer_postcode )
VALUES
("Luanna", "Willard", 07710081304, "55 Westminster Drive", "Bletchley", "MK3 6NH"),
("Emmerson", "Nash", 07821833081, "12 The Galleries", "High Wycombe", "HP13 5HR"),
("Al", "Collingwood", 07822511769, "Apartment 72 The Chandlery", "Stretford", "M32 0NU"),
("Wanda", "Bell", 07058569240, "75 Penywern Road", "Neath", "SA10 7PA"),
("Adalynn", "Ray", 07072301193, "3 Scottes Lane", "Dagenham", "RM8 1TP"),
("Kellen", "Evanson", 07949875619, "4 Rowley Close", "Botley", "SO30 2FT"),
("Zac", "Hart", 07939707945, "Courtenay House 6 Church Hill", "Port Isaac", "PL29 3RQ"),
("Kieron", "Martinson", 07852433243, "26 High Street", "Littleborough", "OL15 8PQ"),
("Jasmin", "Payton", 07029444593, "61 Princess Street", "Woodlands", "DN6 7LT"),
("Roberta", "Jones", 07065075055, "368 London Road", "Benfleet", "SS7 1BG"),
("Celinda", "Deering", 07704069158, "St Swithuns Cottage, Clarence Road", "Southsea", "PO5 2LQ"),  
("Floretta", "Picking", 07923143991, "10 Hollyberry Lane", "London", "NW3 6QT"),
("Zeke", "Seabrooke", 07816015267, "22 Knightstone Close", "Axbridge", "BS26 2DJ"),
("Lennox", "Ellisson", 07759500720, "25 Dukes Wood Close", "Boreham", "CM3 3FT"),
("Kehlani", "Rhodes", 07705155929, "Oaktrees, Newton Road", "Tollerton", "YO61 1QX"),
("Jada", "Isaacson", 07842213603, "Lilac, London Road", "West Kingsdown", "TN15 6EL"),
("Nigel", "Berry", 07816683038, "51 Chestnut Close", "Hayes", "UB3 1JG"),
("Derby", "Addison", 07008882049, "7 East Street", "Aberkenfig", "CF32 9BH"),
("Sharleen", "Montague", 07003461379, "Flat D, Woodlands, The Poplars", "Leeds", "LS6 2AT"),
("Lillie", "Jarrett", 07849258407, "Maple View, Sawdon Lane", "Brompton By Sawdon", "YO13 9DT"),
("Pippa", "Spearing", 07073009231, "The Old Granary, Edgewell Farm", "Prudhoe", "NE42 5PD"),
("Earle", "Nye", 07018600367, "Roseland View, Harcourt Lane", "Feock", "TR3 6RW"),
("Bella", "Darnell", 07873242971, "98 Broad Oak Way", "Stevenage", "SG2 8RA"),
("Delano", "Swanson", 07845920959, "2 Mullion Close", "Torpoint", "PL11 2QS"),
("Elaine", "Ramsey", 07720963069, "27 Hammonds Lane", "Totton", "SO40 3LH");

INSERT INTO orders ( customer_id, staff_name, order_price, order_date, order_status)
VALUES
(1, "Mort", 5.00, "2022-05-14", "Preparing"),
(2, "Mort", 12.00, "2022-05-14", "Preparing"),
(3, "Mort", 6.00, "2022-05-14", "Preparing"),
(4, "Mort", 10.00, "2022-05-14", "Preparing"),
(5, "Mort", 21.00, "2022-05-14", "Baking"),
(6, "Ralf", 6.00, "2022-05-14", "Baking"),
(7, "Mort", 24.00, "2022-05-14", "Baking"),
(8, "Ralf", 10.00, "2022-05-14", "Baking"),
(9, "Mort", 8.00, "2022-05-14", "Baking"),
(10, "Ralf", 10.00, "2022-05-14", "Baking"),
(11, "Ralf", 30.00, "2022-05-14", "Complete"),
(12, "Ralf", 20.00, "2022-05-14", "Complete"),
(13, "Ralf", 8.00, "2022-05-14", "Complete"),
(14, "Coby", 7.00, "2022-05-13", "Complete"),
(15, "Coby", 20.00, "2022-05-13", "Complete"),
(16, "Coby", 14.00, "2022-05-13", "Complete"),
(17, "Rudy", 6.00, "2022-05-13", "Complete"),
(18, "Coby", 14.00, "2022-05-13", "Complete"),
(19, "Rudy", 25.00, "2022-05-13", "Complete"),
(20, "Coby", 5.00, "2022-05-13", "Complete"),
(21, "Rudy", 16.00, "2022-05-13", "Complete"),
(22, "Rudy", 14.00, "2022-05-13", "Complete"),
(23, "Daniela", 7.00, "2022-05-12", "Complete"),
(24, "Daniela", 18.00, "2022-05-12", "Complete"),
(25, "Daniela", 12.00, "2022-05-12", "Complete");

INSERT INTO order_items ( order_id, customer_id, product_name, item_quantity)
VALUES
 (1, 1, "Cheese", 1),
 (2, 2, "Ham", 2),
 (3, 3, "Pepperoni", 1),
 (4, 4, "Cheese", 2),
 (5, 5, "Cheese", 1),
 (6, 6, "Chicken", 1),
 (7, 7, "Supreme", 3),
 (8, 8, "Cheese", 2),
 (9, 9, "Vegetarian", 1),
 (10, 10, "Cheese", 2),
 (11, 11, "Pineapple", 5),
 (12, 12, "Cheese", 4),
 (13, 13, "Meat Lovers", 1),
 (14, 14, "Classic Meat", 1),
 (15, 15, "Cheese", 4),
 (16, 16, "Green Dream", 2),
 (17, 17, "Onion", 1),
 (18, 18, "Vegan", 2),
 (19, 19, "Cheese", 5),
 (20, 20, "Cheese", 1),
 (21, 21, "Supreme", 2),
 (22, 22, "Classic Meat", 2),
 (23, 23, "Green Dream", 1),
 (24, 24, "Margherita", 2),
 (25, 25, "Shrimp", 2);	
 
-- sample selection statments from tables 

SELECT product_name, product_price FROM products;
SELECT stock_id, product_name, quantity FROM stock;
SELECT staff_name, staff_email, staff_phone, staff_day FROM staff;
SELECT customer_id, customer_first_name, customer_last_name, customer_phone, customer_road, customer_town, customer_postcode FROM customers;
SELECT order_id, customer_id, staff_name, order_price, order_date, order_status FROM orders;
SELECT order_id, customer_id, product_name, item_quantity FROM order_items;
