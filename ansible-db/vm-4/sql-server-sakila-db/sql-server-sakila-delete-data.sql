/*

Sakila for Microsoft SQL Server is a port of the Sakila example database available for MySQL, which was originally developed by Mike Hillyer of the MySQL AB documentation team. 
This project is designed to help database administrators to decide which database to use for development of new products
The user can run the same SQL against different kind of databases and compare the performance

License: BSD
Copyright DB Software Laboratory
http://www.etl-tools.com

*/


-- Delete data
ALTER TABLE staff DROP CONSTRAINT fk_staff_address;
ALTER TABLE staff DROP CONSTRAINT fk_staff_store;
DELETE FROM payment;
DELETE FROM rental;
DELETE FROM customer;
DELETE FROM film_category;
DELETE FROM film_text;
DELETE FROM film_actor;
DELETE FROM inventory;
DELETE FROM film;
DELETE FROM category;
DELETE FROM store;
DELETE FROM staff;
DELETE FROM actor;
DELETE FROM address;
DELETE FROM city;
DELETE FROM country;
DELETE FROM language;

-- Drop foreign key constraint
ALTER TABLE store DROP CONSTRAINT fk_store_staff;

-- Drop index
DROP INDEX idx_fk_address_id ON store;

-- Alter column
ALTER TABLE store ALTER COLUMN manager_staff_id TINYINT NULL;

-- Update column data
UPDATE store SET manager_staff_id = NULL;

-- Recreate foreign key constraint
ALTER TABLE store ADD CONSTRAINT fk_store_staff FOREIGN KEY (manager_staff_id) REFERENCES staff (staff_id);

-- Recreate index
CREATE UNIQUE NONCLUSTERED INDEX idx_fk_address_id ON store(manager_staff_id);

-- Recreate foreign key constraints on staff table
ALTER TABLE staff ADD CONSTRAINT fk_staff_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON UPDATE CASCADE;
ALTER TABLE staff ADD CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON UPDATE CASCADE;
