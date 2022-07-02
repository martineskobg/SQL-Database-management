-- Before run the below queries please use this file to create database and table
-- https://github.com/martineskobg/SQL-Database-management/tree/master/Database%20management%2C%20data%20types%20and%20constraints

--create customer with all fields, only with the mandatory fields
INSERT INTO customers (name, email, phone, age, GDPR, is_profile_active, profile_deactivated, deactivation_reason, notes)
VALUES ('Petyr Petrov','mbel@protonmail.edu','4-534-5367-8771', 70, true, true, null, null,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum');

-- Retrieving all customers
-- Query that retrieves only customer’s name and phone
SELECT name, email FROM customers;

-- Query that retrieves only internal information about the user
-- GDPR status, profile status, date created, date deactivated, reason for deactivation and the notes taken of the user
SELECT GDPR,
    is_profile_active,
    profile_created,
    profile_deactivated,
    deactivation_reason,
    notes
   FROM customers;
  
-- Retrieving all customer info by customer id  
SELECT * FROM customers WHERE id = 3;

-- Update customer by id
-- Change contact phone
-- Deactivate account
UPDATE customers
    set phone = '0888-444-858', is_profile_active = 'false',  profile_deactivated = NOW(), deactivation_reason= 'no reason'
    WHERE id = 3;
SELECT * FROM customers WHERE id = 3;

-- Activate account
UPDATE customers
    set is_profile_active = 'true', profile_deactivated = NULL, deactivation_reason = NULL
    WHERE id = 3;
SELECT * FROM customers WHERE id = 3;

-- Delete customer by id
DELETE FROM customers WHERE id = 3;
SELECT * FROM customers ORDER BY id;
