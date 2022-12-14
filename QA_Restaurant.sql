CREATE DATABASE qa_restaurant;
USE qa_restaurant;

CREATE TABLE customers (
cust_id INT UNIQUE NOT NULL AUTO_INCREMENT,
cust_name VARCHAR(100) NOT NULL,
phone_number CHAR(11) NOT NULL,
PRIMARY KEY(cust_id));

SHOW TABLES;
DESCRIBE customers;

INSERT INTO customers (cust_name, phone_number) 
VALUES ("Peep", "07711818189");
INSERT INTO customers (cust_name, phone_number)
VALUES ("Dan B", "07938477389");

CREATE TABLE menu_items (
item_id INT UNIQUE NOT NULL AUTO_INCREMENT,
meal_name VARCHAR(100) NOT NULL,
meal_description VARCHAR(100) NOT NULL,
allergens VARCHAR(100) DEFAULT "n/a",
price DECIMAL (6,2),
PRIMARY KEY(item_id));

SHOW tables;
DESCRIBE customers;

ALTER TABLE customers
ADD age INT NOT NULL;
ALTER TABLE customers
ADD uk_area_code BOOLEAN DEFAULT "1";

ALTER TABLE customers
ADD first_line_address VARCHAR(100) NOT NULL;

DROP TABLE customers;

CREATE TABLE customers (
cust_id INT UNIQUE NOT NULL AUTO_INCREMENT,
cust_name VARCHAR(100) NOT NULL,
phone_number CHAR(11) NOT NULL,
uk_area_code BOOLEAN DEFAULT "1",
first_line_address VARCHAR(100) NOT NULL,
postcode VARCHAR(100) NOT NULL,
dietary_requirements BOOLEAN DEFAULT "0",
PRIMARY KEY(cust_id));

SHOW tables;
DESCRIBE menu_items;

SELECT * FROM menu_items;


INSERT INTO customers (cust_name, phone_number, uk_area_code, first_line_address, postcode, dietary_requirements)
VALUES ("Peep", "07711818189", 1, "14 Greenway", "s40 2jp", 1);
INSERT INTO customers (cust_name, phone_number, uk_area_code, first_line_address, postcode, dietary_requirements)
VALUES ("Dan B", "07744581810", 1, "101 Langer Lane", "s42 6nw", 1);
INSERT INTO customers (cust_name, phone_number, uk_area_code, first_line_address, postcode, dietary_requirements)
VALUES ("Meg S", "07755560920", 1, "23 Bland Close", "m40 4rm", 1);
INSERT INTO customers (cust_name, phone_number, uk_area_code, first_line_address, postcode, dietary_requirements)
VALUES ("James H", "07755456921", 1, "269 Cotton Field Wharf", "m4 47j", 1);
INSERT INTO customers (cust_name, phone_number, uk_area_code, first_line_address, postcode, dietary_requirements)
VALUES ("Rosie N", "07579560920", 1, "100 Victoria Mill", "m35 9ud", 1);

INSERT INTO menu_items (meal_name, meal_description, allergens, price)
VALUES ("pesto gnocchi", "basil pesto", 1, 11.99);
INSERT INTO menu_items (meal_name, meal_description, allergens, price)
VALUES ("bean burger", "sweet potato and black bean", 1, 13.00);
INSERT INTO menu_items (meal_name, meal_description, allergens, price)
VALUES ("vegetable spaghetti", "tomato and sweetcorn", 1, 12.50);
INSERT INTO menu_items (meal_name, meal_description, allergens, price)
VALUES ("banana blossom fish goujon", "vegan fish", 1, 15.99);
INSERT INTO menu_items (meal_name, meal_description, allergens, price)
VALUES ("garlic bread", "garlic flatbread", 1, 3.79);

SELECT * FROM customers;

UPDATE customers SET postcode="S42 6EH", dietary_requirements=0 WHERE cust_id=4;
UPDATE customers SET first_line_address="4 North Wingfield" WHERE cust_id=3;

SELECT * FROM menu_items;

UPDATE menu_items SET meal_description="chilli oil" WHERE item_id=5;
UPDATE menu_items SET meal_description="red pepper pesto" WHERE item_id=1;

DELETE FROM menu_items WHERE item_id=2;
DELETE FROM customers WHERE cust_id=4;


INSERT INTO customers (cust_name, phone_number, uk_area_code, first_line_address, postcode, dietary_requirements)
VALUES ("Emma B", "07893456891", 1, "13 Sunnydale Drive", "S32 7np", 0);

INSERT INTO menu_items (meal_name, meal_description, allergens, price)
VALUES ("pad thai", "peanut noodles", 1, 13.49);

SELECT cust_name, postcode FROM customers;

CREATE TABLE orders(
order_id INT UNIQUE NOT NULL AUTO_INCREMENT,
c_id INT NOT NULL,
order_date DATE,
total_price DECIMAL (2,2),
PRIMARY KEY(order_id),
FOREIGN KEY(c_id) REFERENCES customers(cust_id) ON DELETE CASCADE);

INSERT INTO orders (c_id) VALUES (1), (2), (3);
INSERT INTO orders (c_id) VALUES (5), (6);
UPDATE orders SET order_date="2022-09-10" WHERE order_id=1;
UPDATE orders SET order_date="2022-09-05" WHERE order_id=2;
UPDATE orders SET order_date="2022-09-21" WHERE order_id=3;
UPDATE orders SET order_date="2022-09-16" WHERE order_id=14;
UPDATE orders SET order_date="2022-09-04" WHERE order_id=16;
DELETE FROM orders WHERE order_id=15;



SHOW TABLES;
SELECT * FROM order_items;




CREATE TABLE order_items(
oi_id INT UNIQUE NOT NULL AUTO_INCREMENT,
ord_id INT NOT NULL,
itm_id INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY(oi_id),
FOREIGN KEY (ord_id) REFERENCES orders (order_id) ON DELETE CASCADE,
FOREIGN KEY (itm_id) REFERENCES menu_items (item_id) ON DELETE CASCADE);

INSERT INTO order_items (ord_id, itm_id, quantity) VALUES (1, 1, 2), (2, 4, 1), (3, 5, 2);
INSERT INTO order_items (ord_id, itm_id, quantity) VALUES (14, 6, 3);
INSERT INTO order_items (ord_id, itm_id, quantity) VALUES (16, 3, 5);


SELECT * FROM menu_items;
SELECT * FROM menu_items WHERE meal_name LIKE "%i";

SELECT COUNT(price) FROM menu_items;

SELECT c_id FROM orders WHERE order_id=3;

SELECT * FROM customers WHERE cust_id=(SELECT c_ID FROM orders WHERE order_id=5);
SELECT meal_name FROM menu_items WHERE item_id=(SELECT itm_id FROM order_items WHERE ord_id=(SELECT order_id FROM orders WHERE c_id=(SELECT cust_id FROM customers WHERE cust_name="Dan B")));

SELECT * FROM customers c JOIN orders o ON c.cust_id=o.c_id;

SELECT * FROM customers c LEFT OUTER JOIN orders o ON c.cust_id=o.c_id;
SELECT * FROM customers c RIGHT OUTER JOIN orders o ON c.cust_id=o.c_id;



SHOW TABLES;
SELECT * FROM customers;

SELECT oi_id, ord_id, itm_id, quantity FROM order_items oi LEFT JOIN menu_items mi ON oi.oi_id=mi.item_id;
;
















