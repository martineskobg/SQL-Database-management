# SQL: Views, Sorting and Filtering data

### Description
Practical tasks for Aggregate Functions and Grouping data

#### Theory:
* Aggregate Functions: COUNT, AVG, SUM, MAX, MIN
* Grouping data: GROUP BY, HAVING, GROUPING SETS
 
#### Practical tasks:
**Description:**
Create products_inventory table with PK which is autoincremented and the following structure (all fields are mandatory):

**Fields:**
1. Product name
2. Available quantity
3. Product type
4. Price without VAT
5. Price with VAT
6. Is product in stock
7. Warehouse (can be an id, name of city, etc - it doesnt matter)

**Create scripts using aggregation functions and functions for grouping data:**

1. Get the count of all available products in stock
2. Get the average product price with VAT for all categories
3. Get the total amount of all available items in stock (use price with VAT and available qty.)
4. Find the most and least expensive item from the table
5. Find the most expensive item in each warehouse
6. Get the count of all products for each category
7. Get the count of all products for each category in and out of stock
8. Get the count of all products for each category where the products count is more than 3
9. Get the inventory amount for each warehouse
10. Get all product categories stored by each warehouse
11. Get the average product categories hold by the warehouses

### Instruction
The first few queries in Aggregate_Functions_Grouping.sql are for creating table, inserting test data.
Тhe rest of the requests fulfill all the above requirements.
