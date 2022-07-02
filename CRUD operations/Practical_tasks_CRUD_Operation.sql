--create customer with all fields, only with the mandatory fields
INSERT INTO customers (name, email, phone, age, GDPR, is_profile_active, profile_deactivated, deactivation_reason, notes)
VALUES ('Monika Beluchi','mbel@protonmail.edu','4-534-5367-8771', 70, true, false, '2022-07-01 12:10:27.128922', 'no reason',
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
SELECT * FROM customers WHERE id = 7;

-- Update customer by id
-- Change contact phone
-- Deactivate account
UPDATE customers
    set phone = '0888-444-858', is_profile_active = 'false',  profile_deactivated = '2022-06-25 11:05:27.1111224'
    WHERE id = 7;
SELECT * FROM customers WHERE id = 7;

-- Activate account
UPDATE customers
    set is_profile_active = 'true'
    WHERE id = 7;
SELECT * FROM customers WHERE id = 7;

-- Delete customer by id
DELETE FROM customers WHERE id = 7;
SELECT * FROM customers ORDER BY id;
