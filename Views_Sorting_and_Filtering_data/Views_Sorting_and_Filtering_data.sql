-- Table: public.customers_addresses
-- DROP TABLE IF EXISTS public.customers_addresses;
DROP VIEW IF EXISTS bulgarian_customers_addresses;
DROP TABLE IF EXISTS customers_addresses;

CREATE TABLE IF NOT EXISTS public.customers_addresses
(
    id serial NOT NULL PRIMARY KEY UNIQUE,
    address VARCHAR,
    city VARCHAR,
    province VARCHAR, 
    state_US VARCHAR,
    postal_code int,
    country  VARCHAR NOT NULL
);

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
	
SELECT * FROM customers_addresses;
       
--******************VIEW***************
-- Create new view
CREATE VIEW bulgarian_customers_addresses AS
SELECT * FROM customers_addresses
WHERE country = 'Bulgaria';

SELECT * FROM bulgarian_customers_addresses;

--******************Filtering***************
--get a list of countries ordered alphabetically
SELECT * FROM customers_addresses ORDER BY country;

--get a list of cities that start with a specific letter
SELECT * FROM customers_addresses WHERE city LIKE 'S%';

--get 3 different random cities located in Bulgaria
SELECT city FROM customers_addresses WHERE country = 'Bulgaria'
GROUP BY city
ORDER BY RANDOM()  LIMIT 3;

--get a list of all addresses in Bulgaria outside of Sofia, Plovdiv, Varna
SELECT address, city FROM customers_addresses WHERE city NOT IN('Sofia', 'Plovdiv', 'Varna');

--get last 10 added customer addresses with a province and address filled, but without a state value
SELECT * FROM customers_addresses
    WHERE province
    IS NOT null AND state_us IS NULL
    ORDER BY id
    DESC LIMIT 10;
    
-- get addresses that have 4-digit postal code that start with 3 and end with 7.
-- Order the result alpabetically by country and city
SELECT * FROM customers_addresses
    WHERE postal_code::text 
    LIKE '3__7'
    ORDER BY country, city DESC;
	