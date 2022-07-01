# SQL: Database management, data types and constraints

### Description

Practical task Database management, data types and constraints

#### Theory:

* **Databases and tables:**
  * Create DB, Drop DB, Rename DB
  * Create Table, Drop Table, Alter Table, Rename table and Truncate table
* Indexes

* **Data Types:**
  * String and Numeric data types 
  * Boolean
  * Date and Time data types
  * Null Values

* **Constraints:**
  * Primary key
  * Not Null, Unique, Check, Default, Index, Auto Increment
* **Comments**

#### Practical tasks:
**Description:** Create a customers table in orders_management db. Table should hold the following information about customers:
1. [ ] Name - mandatory
2. [ ] Email - mandatory and should be unique
3. [ ] Phone - mandatory and should be unique
4. [ ] Age -  if not set, default value should be 99.
5. [ ] GDPR consent status - has the customer given GDPR consent or not. Mandatory field.
6. [ ] Customer profile status - is the profile still active. Mandatory field.
7. [ ] Date and time profile created - set by default when creating a new record. Mandatory field
8. [ ] Date and time profile deactivated
9. [ ] Reason for deactivation of profile
10. [ ] Notes - can hold very long notes on the customer.
11. [ ] Customers table should be optimized for querying by name, email or phone.

Instruction
You can execute all queries in Practical_tasks.sql, one by one or all in one.

