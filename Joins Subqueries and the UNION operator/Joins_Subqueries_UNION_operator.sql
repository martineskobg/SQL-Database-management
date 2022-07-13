DROP VIEW IF EXISTS customers_active_orders;
DROP VIEW IF EXISTS customers_contact_info;
DROP VIEW IF EXISTS customer_ordered_items;
DROP TABLE IF EXISTS orders_products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS customers_addresses;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS suppliers_addresses;
DROP TABLE IF EXISTS products_inventory;


-- Create customers_addresses table
CREATE TABLE IF NOT EXISTS public.customers_addresses
(
    address_id serial NOT NULL PRIMARY KEY UNIQUE,
    address VARCHAR,
    city VARCHAR,
    province VARCHAR, 
    state_US VARCHAR,
    postal_code int,
    country  VARCHAR NOT NULL
);

-- Create customers table
-- 1:1 relationship between customers and customers_addresses tables
CREATE TABLE IF NOT EXISTS customers
(
    customer_id serial NOT NULL PRIMARY KEY UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    phone VARCHAR, 
    age int DEFAULT 99,
	address_id int UNIQUE NOT NULL,
    GDPR boolean NOT NULL,
    is_profile_active boolean NOT NULL,
    profile_created timestamp DEFAULT(NOW()) NOT NULL,
    profile_deactivated timestamp,
    deactivation_reason VARCHAR,
    notes text,
	FOREIGN KEY (address_id) REFERENCES customers_addresses (address_id)  
);

-- Create suppliers_addresses table
CREATE TABLE IF NOT EXISTS public.suppliers_addresses
(
    address_id serial NOT NULL PRIMARY KEY UNIQUE,
    address VARCHAR,
    city VARCHAR,
    province VARCHAR, 
    state_US VARCHAR,
    postal_code int,
    country  VARCHAR NOT NULL
);

-- Create suppliers table
-- 1:1 relationship between suppliers and suppliers_addresses tables
CREATE TABLE IF NOT EXISTS suppliers
(
    supplier_id serial NOT NULL PRIMARY KEY UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    phone VARCHAR UNIQUE NOT NULL, 
    age int DEFAULT 99,
    address_id int UNIQUE NOT NULL,
    GDPR boolean NOT NULL,
    is_profile_active boolean NOT NULL,
    profile_created timestamp DEFAULT(NOW()) NOT NULL,
    profile_deactivated timestamp,
    deactivation_reason VARCHAR,
    notes text,
    FOREIGN KEY (address_id) REFERENCES suppliers_addresses (address_id)
);

-- Create orders table
-- 1: many  relationship between customers and orders
CREATE TABLE IF NOT EXISTS public.orders
(
    order_id serial NOT NULL PRIMARY KEY UNIQUE,
    customer_id int NOT NULL,
    is_order_completed BOOLEAN NOT NULL,
    is_order_payed BOOLEAN NOT NULL,
    date_of_order DATE NOT NULL, 
    date_order_completed DATE,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
-- Create products_inventory table
-- 1: many relationship between suppliers and products_inventory
CREATE TABLE IF NOT EXISTS public.products_inventory
(
    product_id serial NOT NULL PRIMARY KEY UNIQUE,
    product_name VARCHAR,
    quantity int,
    product_type VARCHAR, 
    price_without_VAT DECIMAL(5,2),
    price_with_VAT DECIMAL(5,2),
    is_in_stock BOOLEAN,
    warehouse VARCHAR,
    supplier_id int NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);

--many:many relationship between orders and products_inventory table with the ordered quantity
CREATE TABLE IF NOT EXISTS public.orders_products
(
    id serial NOT NULL PRIMARY KEY UNIQUE,
    order_id int,
    product_id int,
    quantity int  NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products_inventory (product_id)
);

-- INSERT test data into customers_addresses table
INSERT INTO customers_addresses(address, city, province, state_US, postal_code, country)
VALUES ('Drujba bl. 4 ent. 1 ap. 3', 'Sofia', NULL, NULL, 3157, 'Bulgaria'),
       ('121 Dorman St Harrington', 'Valrico', NULL, 'Florida', 3117, 'USA'),
       ('211 Dewey St Dowagiac', 'Warsaw', NULL, 'Indiana', 46580, 'USA'),
       ('Mladost, bl. 144, ent. 11, ap. 34', 'Plovdiv', NULL, NULL, 2241, 'Bulgaria'),
       ('Republika, bl. 2, ent. 44, ap. 222', 'Ruse', 'Nikolos', NULL, 3777, 'Bulgaria'),
       ('Svoboda, bl. 42, ent. 4, ap. 7', 'Varna', NULL, NULL, 7885, 'Bulgaria'),
       ('Nadejda, bl. 785, ent. 7, ap. 25', 'Sozopol', NULL, NULL, 3877, 'Bulgaria'),
       ('Bahrein, bl. 7825, ent. 73, ap. 251', 'Silikon', 'Pompei', NULL, 5222, 'Zimbabve'),
       ('Borovo, bl. 785, ent. 7, ap. 25', 'Dimitovo', 'Gadino', NULL, 3257, 'Turkey');

-- INSERT test data into customers table
INSERT INTO customers (name, email, phone, age, address_id, GDPR, is_profile_active)
VALUES
  ('Maisie Flores','fwew.magna@ewew.bg','1-0538-567-8771', 15, 1, true, false),
  ('Chavdar','qwq.magwwna@protqwonmail.bg','1-5038-567-8771', 80, 9, true, true),
  ('Petko','dww.magna@protonmail.com','1-0538-567-8771', 33, 2, true, true),
  ('Kircho','dqwgg.magna@protonmail.edu','18-538-567-8771', 37, 3, true, true),
  ('Boiko','nulgeela.magna@protonmail.edu','1-0538-567-8771', 56, 4, true, true),
  ('Jivko','nukllllla.magna@protonmail.edu','1-5538-567-8771', 67, 5, true, true),
  ('Krasi','tt.magna@protonmail.edu','1-538-567-87271', 4, 6, true, true),
  ('Martin','martyyytin.magna@test.edu','1-0538-567-8771', 18, 7, true, true);
  select * from customers
  
INSERT INTO customers (name, email, phone, age, address_id, GDPR, is_profile_active, profile_deactivated, deactivation_reason, notes)
VALUES ('Petyr Petrov','mbel@protonmail.edu','4-534-5367-870071', 70, 8, true, true, null, null,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum');

-- INSERT test data into suppliers_addresses table
INSERT INTO suppliers_addresses(address, city, province, state_US, postal_code, country)
VALUES ('Drujba bl. 4 ent. 1 ap. 3', 'Sofia', NULL, NULL, 3157, 'Bulgaria'),
       ('121 Dorman St Harrington', 'Valrico', NULL, 'Florida', 3117, 'USA'),
       ('211 Dewey St Dowagiac', 'Warsaw', NULL, 'Indiana', 46580, 'USA'),
       ('Mladost, bl. 144, ent. 11, ap. 34', 'Plovdiv', NULL, NULL, 2241, 'Bulgaria'),
       ('Republika, bl. 2, ent. 44, ap. 222', 'Ruse', 'Nikolos', NULL, 3777, 'Bulgaria'),
       ('Svoboda, bl. 42, ent. 4, ap. 7', 'Varna', NULL, NULL, 7885, 'Bulgaria'),
       ('Nadejda, bl. 785, ent. 7, ap. 25', 'Sozopol', NULL, NULL, 3877, 'Bulgaria'),
       ('Bahrein, bl. 7825, ent. 73, ap. 251', 'Silikon', 'Pompei', NULL, 5222, 'Zimbabve'),
       ('Borovo, bl. 785, ent. 7, ap. 25', 'Dimitovo', 'Gadino', NULL, 3257, 'Turkey');
       
 -- INSERT test data into suppliers table
INSERT INTO suppliers (name, email, phone, age, address_id, GDPR, is_profile_active)
VALUES
  ('DHL','dhl@ewew.com','1-0538-567-28771', 15, 1, true, true),
  ('Econt','econt@protqwonmail.bg','1-5038-5672-8771', 80, 2, true, true),
  ('Speedy','speedy@protonmail.com','1-538-52697-8771', 33, 3, true, true); 

-- INSERT test data into orders table
INSERT INTO orders (customer_id, is_order_completed, is_order_payed, date_of_order, date_order_completed)
VALUES
  (1, true, true, '2022-05-01', '2022-05-04'),
  (3, false, false, '2022-05-02', null),
  (5, true, true, '2022-07-01', '2022-07-10'),
  (5, true, false, '2021-01-01', '2021-01-04'),
  (5, true, false, '2022-06-18', '2022-06-22'),
  (1, false, false, '2022-03-03', '2022-03-03'),
  (1, true, false, '2022-03-24', '2022-03-24'),
  (3, true, true, '2022-03-04', '2022-03-04'),
  (3, true, false, '2022-03-14', '2022-03-14');
 
 
-- INSERT test data into products_inventory table
INSERT INTO public.products_inventory(product_name, quantity, product_type, price_without_vat,
                                      price_with_vat, is_in_stock, warehouse, supplier_id)
	VALUES
        ('Nike T-shirt', 100, 'Tshirt', 20.19, 24.50, true, 'Sofia', 1),
        ('Roadster', 12, 'Shirts', 28.54, 35.00, true, 'Varna', 1),
        ('KASSUALLY', 27, 'Trouser', 35.25, 41.25, false, 'Plovdiv', 1),
        ('Catwalk4', 80, 'Heels', 78.63, 88.99, true, 'Varna', 3),
        ('Catwalk3', 9, 'Heels', 78.63, 88.99, true, 'Plovdiv', 2),
        ('Catwalk2', 2, 'Heels', 78.63, 88.99, true, 'Sofia', 2),
        ('Catwalk22', 2, 'Heels', 78.63, 88.99, true, 'Sofia', 1),
        ('Catwalk1', 5, 'Heels', 78.63, 88.99, false, 'Sofia', 3),
        ('OOMPH', 2, 'Earrings', 550.25, 601.98, true, 'Varna', 3),
        ('HIGHLANDER', 11, 'Jacket', 150.88, 180.47, false, 'Sofia', 2),
        ('HIGHLANDER', 11, 'Jacket', 150.88, 180.47, true, 'Sofia', 3),
        ('Nautica', 3, 'Sweater', 80.82, 90.12, false, 'Plovdiv', 1),
        ('United Colors of Benetton', 58, 'Jeans', 850.19, 855.99, true, 'Sofia', 2),
        ('Allen Solly Junior', 250, 'Shorts', 10.19, 14.50, true, 'Varna', 1),
        ('Allen Solly Junior', 250, 'Shorts', 10.19, 14.50, false, 'Varna', 1);

-- INSERT test data into orders_products table  
INSERT INTO public.orders_products(order_id, product_id, quantity)
	VALUES
        (1, 1, 41),
        (3, 2, 11),
        (5, 1, 31),
        (5, 4, 5),
        (5, 3, 10),
        (1, 2, 4),
        (1, 5, 5),
        (3, 7, 10),
        (3, 6, 1),
        (2, 3, 13),
        (6, 6, 7),
        (4, 8, 25),
        (9, 9, 2),
        (7, 1, 1);
        
-- Create views and save as scripts:

-- customers_contact_info: all customers contact information - phone, address and etc.
CREATE VIEW customers_contact_info AS
SELECT customers.name, customers.email, customers.phone, customers_addresses.address
    FROM customers
    JOIN customers_addresses
        ON customers.customer_id = customers_addresses.address_id;
        

-- customers_active_orders: customer id, name and phone with order id, status and date of ordering
CREATE VIEW customers_active_orders AS
SELECT customers.customer_id, customers.name, customers.phone, orders.order_id, orders.is_order_completed, orders.date_of_order 
    FROM orders
    JOIN customers
        ON  orders.order_id = customers.customer_id;
        
-- customers_pending_payments: customer id and name with list of pending orders that are not payed,
-- order date and total sum expected to be payed.   
CREATE VIEW customers_pending_payments AS
SELECT  name,
        customer_id,
        ARRAY_AGG (subquery.order_id) as orders,
        is_order_payed,
        date_of_order,
        sum(income) as income      
FROM
(
    SELECT
        c.name,
        c.customer_id,
        o.order_id,
        o.is_order_payed,
        o.date_of_order,        
        op.quantity * pi.price_with_vat as income
     FROM customers as c
        INNER JOIN orders as o
          on c.customer_id = o.customer_id
        LEFT JOIN orders_products as op
          on o.order_id = op.order_id
        LEFT JOIN products_inventory as pi
          on op.product_id = pi.product_id   
     WHERE o.is_order_payed = false )  as subquery  
   GROUP BY  name, customer_id, is_order_payed, date_of_order;
  
-- supplier_inventory: supplier id, name and phone with available products (qty > 0),
-- quantity, price with and without VAT and the warehouse the item is located
CREATE VIEW supplier_inventory AS
    SELECT suppliers.supplier_id, name, phone, pi.quantity, pi.price_with_vat, pi.price_without_vat, warehouse
    FROM suppliers
        JOIN products_inventory as pi
            ON pi.supplier_id = suppliers.supplier_id
    WHERE quantity > 0
    ORDER by name;
    
-- customer_ordered_items: customer id and name with ordered product and product type    
CREATE VIEW customer_ordered_items AS
    SELECT c.customer_id, c.name, pi.product_name, pi.product_type FROM customers as c
    LEFT JOIN orders as o
        ON o.customer_id = c.customer_id 
    LEFT JOIN orders_products as op
        ON op.order_id = o.order_id
    JOIN products_inventory as pi
        on pi.product_id = op.product_id
    ORDER BY c.name;

-- phones: a union of all suppliers and customers ids, names and phone numbers
CREATE VIEW phones AS
    SELECT supplier_id, name, phone
    FROM suppliers
    
    UNION SELECT customer_id, name, phone
	FROM customers;
    
-- Create scripts returning:
-- list of customers whos phone number is listed as phone number of another customer
SELECT ARRAY_AGG(customer_id) as list_ids, ARRAY_AGG(name) as list_phones, COUNT(phone)
FROM customers  
GROUP BY phone
HAVING count(phone) > 1;

-- using left and right joins, find customers without orders and orders without active customers
-- customers without orders
SELECT c.customer_id, c.name, o.order_id FROM customers as c
LEFT JOIN orders as o
    on c.customer_id = o.customer_id    
    WHERE o.order_id is null;
    
-- Orders without active customers
SELECT c.customer_id, c.name, o.order_id FROM customers as c
RIGHT JOIN orders as o
    on c.customer_id = o.customer_id    
    WHERE c.is_profile_active = false;
    
-- using full join, find customers without orders and orders without active customers
SELECT c.customer_id, c.name, o.order_id FROM customers as c
FULL JOIN orders as o
    on c.customer_id = o.customer_id
    WHERE c.is_profile_active = false OR o.order_id is null;
   