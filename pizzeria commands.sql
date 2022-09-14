USE pizzeria;

-- display all tables

SELECT * FROM products;
SELECT * FROM stock;
SELECT * FROM staff;
SELECT * FROM customers;
SELECT * FROM orders;

 -- creating joins
 
 -- this first join shows the product, price and the current quantity in stock 
 
SELECT
p.product_name AS "Product" , p.product_price AS "Price",
s.quantity AS "Quantity"
FROM products p
LEFT JOIN
stock s
ON
p.product_name =
s.product_name; 

-- this second join shows the product a customer has ordered, its price, the date the order was placed and its current status  

SELECT
c.customer_first_name AS "Customer", 
i.product_name AS "Product", i.item_quantity AS "Amount",
o.order_price AS "Price", o.order_date AS "Date", o.order_status AS "Status"
FROM customers c
LEFT JOIN
orders o
ON
c.customer_id =
o.customer_id
LEFT JOIN 
order_items i 
ON 
c.customer_id =
i.customer_id

-- function that gives £5 off an order when the customer spends over £20 

DELIMITER $$
CREATE FUNCTION order_discount (
order_price FLOAT)
RETURNS INT
DETERMINISTIC 
BEGIN
DECLARE order_discount FLOAT;
IF order_price > 20 THEN 
SET order_discount = order_price - 5;
END IF;
RETURN order_discount;
END$$
DELIMITER ; 

SELECT order_id AS "Order ID", order_price AS "Price", order_discount(order_price) AS "Discounted Price"
FROM orders
WHERE order_discount(order_price) IS NOT NULL
ORDER BY 
order_id;

UPDATE orders
SET order_price = order_discount(order_price)
WHERE 
order_discount(order_price) IS NOT NULL;

-- nested query to find the staff member responsible for a customer's order

SELECT 
    staff_name AS "Staff Member"
FROM
    orders
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            customers
        WHERE
            customer_first_name = 'Al');
            
-- query showing the number of orders fulfilled by each employee 

SELECT 
    COUNT(order_id) AS 'Number of Orders',
    staff_name AS 'Staff Member'
FROM
    orders
GROUP BY staff_name
ORDER BY COUNT(order_id) ASC;

-- view showing the total number of orders made and revenue 

CREATE VIEW order_information
AS SELECT COUNT(*) AS "Total Orders", SUM(order_price) AS "Revenue"
FROM orders;

SELECT * FROM order_information;

-- view showing the total number of items sold over the days recorded on the database

CREATE VIEW stocks
AS SELECT SUM(item_quantity) AS "Sold Pizzas"
FROM order_items;

SELECT * FROM stocks;
