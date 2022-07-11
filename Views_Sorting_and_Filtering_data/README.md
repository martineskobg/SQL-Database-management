# SQL: Views, Sorting and Filtering data

### Description
Practical tasks for Views, Sorting and Filtering data

#### Theory:
* Views
* Sorting data with ORDER BY clause (sort the data by one or more columns in the ascending and/or descending order)
* Filtering Data
  * SELECT DISTINCT
  * LIMIT
  * WHERE clause
  * Comparison and logical operators
  * AND, OR, NOT and IS NULL operators
  * BETWEEN, IN, LIKE
  * Wildcards
 
#### Practical tasks:
**Description:**
Create table customers_addresses with primary key (auto increment) and:

**Fields:**
1. Address
2. City - mandatory field
3. Province
4. State - for US addresses
5. Postal code - a positive number, mandatory field
6. Country - mandatory field

**Create a view from customers_addresses:**
Create a view bulgarian_customers_addresses which contains only addresses in Bulgaria;t the user - GDPR status, profile status, date created, date deactivated, reason for deactivation and the notes taken of the user
1. get a list of countries ordered alphabetically
2. get a list of cities that start with a specific letter (for example cities that start with letter S will return Sofia, Sozopol etc)
4. get 3 different random cities located in Bulgaria
6. get a list of all addresses in Bulgaria outside of Sofia, Plovdiv, Varna
8. get last 10 added customer addresses with a province and address filled, but without a state value
10. get addresses that have 4-digit postal code that start with 3 and end with 7. Order the result alphabetically by country and city

### Instruction
The first few queries in Views_Sorting_and_Filtering_data.sql are for creating table, inserting test data and for creating a single view.
Тhe rest of the requests fulfill all the above requirements.