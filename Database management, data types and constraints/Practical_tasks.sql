-- Start Database orders_management
-- Before creating orders_management it will check if already exists if YES it will DROP it.
DROP DATABASE IF EXISTS orders_management;

-- Create orders_management database
CREATE DATABASE orders_management
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
-- *****************************************
-- Before creating customers it will check if already exists if YES it will DROP it.
DROP TABLE IF EXISTS customers;

-- Create customers table
CREATE TABLE customers(
    id serial NOT NULL PRIMARY KEY UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    phone VARCHAR UNIQUE NOT NULL, 
    age int DEFAULT 99,
    GDPR boolean NOT NULL,
    is_profile_active boolean NOT NULL,
    profile_created timestamp DEFAULT(NOW()) NOT NULL,
    profile_deactivated timestamp,
    deactivation_reason VARCHAR,
    notes text
);
-- Ceating unique inexes for c_name, c_email, c_phone 
CREATE UNIQUE INDEX index_for_name_email_phone
ON customers (name, email, phone);

-- INSERT test data into customers table
INSERT INTO customers (name, email, phone, age, GDPR, is_profile_active,)
VALUES
  ('Maisie Flores','nulla.magna@protonmail.edu','1-538-567-8771', 20, true, true),
  ('Martin Bachev','martin.magna@test.edu','1-5238-567-8771', 36, true, true);

-- SELECT all data in customers table
SELECT * FROM customers;

-- Truncate customers table
TRUNCATE TABLE customers;



