DROP TABLE IF EXISTS products_inventory;

CREATE TABLE IF NOT EXISTS public.products_inventory
(
    id serial NOT NULL PRIMARY KEY UNIQUE,
    product_name VARCHAR,
    quantity int,
    product_type VARCHAR, 
    price_without_VAT DECIMAL(5,2),
    price_with_VAT DECIMAL(5,2),
    is_in_stock BOOLEAN,
    warehouse VARCHAR
);

INSERT INTO public.products_inventory(
	product_name, quantity, product_type, price_without_vat, price_with_vat, is_in_stock, warehouse)
	VALUES
    ('Nike T-shirt', 100, 'Tshirt', 20.19, 24.50, true, 'Sofia'),
    ('Roadster', 12, 'Shirts', 28.54, 35.00, true, 'Varna'),
    ('KASSUALLY', 27, 'Trouser', 35.25, 41.25, false, 'Plovdiv'),
    ('Catwalk4', 80, 'Heels', 78.63, 88.99, true, 'Varna'),
    ('Catwalk3', 9, 'Heels', 78.63, 88.99, true, 'Plovdiv'),
    ('Catwalk2', 2, 'Heels', 78.63, 88.99, true, 'Sofia'),
    ('Catwalk22', 2, 'Heels', 78.63, 88.99, true, 'Sofia'),
    ('Catwalk1', 5, 'Heels', 78.63, 88.99, false, 'Sofia'),
    ('OOMPH', 2, 'Earrings', 550.25, 601.98, true, 'Varna'),
    ('HIGHLANDER', 11, 'Jacket', 150.88, 180.47, false, 'Sofia'),
    ('HIGHLANDER', 11, 'Jacket', 150.88, 180.47, true, 'Sofia'),
    ('Nautica', 3, 'Sweater', 80.82, 90.12, false, 'Plovdiv'),
    ('United Colors of Benetton', 58, 'Jeans', 850.19, 855.99, true, 'Sofia'),
    ('Allen Solly Junior', 250, 'Shorts', 10.19, 14.50, true, 'Varna'),
    ('Allen Solly Junior', 250, 'Shorts', 10.19, 14.50, false, 'Varna');
    
    SELECT * FROM products_inventory;
    
-- Get the count of all available products in stock
SELECT COUNT(product_name) AS all_available_products FROM products_inventory WHERE is_in_stock = 'true';

-- Get the average product price with VAT for all categories
SELECT ROUND(AVG(price_with_VAT), 2) FROM products_inventory;

-- Get the total amount of all available items in stock (use price with VAT and available qty.)
SELECT SUM(price_with_VAT) AS total_amount FROM products_inventory WHERE is_in_stock = 'true';

-- Find the most and least expensive item from the table
-- I'm using ORDER BY and LIMIT just to display the name of the product
SELECT product_name, MAX(price_with_vat) AS most_expensive FROM products_inventory
    GROUP BY product_name
    ORDER BY most_expensive DESC
    LIMIT 1;
    
SELECT product_name, MIN(price_with_vat) AS least_expensive FROM products_inventory
    GROUP BY product_name
    ORDER BY least_expensive
    LIMIT 1;   

-- Find the most expensive item in each warehouse
SELECT warehouse, MAX(price_with_vat) FROM products_inventory
    GROUP BY warehouse
    ORDER BY MAX DESC;

-- Get the count of all products for each category
SELECT product_type, COUNT(product_name) FROM products_inventory GROUP BY product_type;

-- Get the count of all products for each category in and out of stock
SELECT product_type, is_in_stock, COUNT(product_name) FROM products_inventory
     GROUP BY product_type, is_in_stock
     ORDER BY product_type;
     
-- Get the count of all products for each category where the products count is more than 3
SELECT product_type, COUNT(product_name) FROM products_inventory
    GROUP BY product_type
    HAVING COUNT(product_name) > 3;
    
-- Get the inventory amount for each warehouse
SELECT warehouse, COUNT(product_name) AS inventory_amount FROM products_inventory GROUP BY warehouse;

-- Get all product categories stored by each warehouse
SELECT warehouse, product_type FROM products_inventory GROUP BY warehouse , product_type ORDER BY warehouse, product_type;

-- Get the avarage product categories hold by the warehouses
SELECT ROUND(AVG(product_count), 2) AS avarage_product
    FROM (
        SELECT warehouse, COUNT(product_type) AS product_count
            FROM products_inventory
            GROUP BY warehouse
    )
      AS p;   
        
        