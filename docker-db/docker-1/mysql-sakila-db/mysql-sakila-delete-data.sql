-- Delete data
SET foreign_key_checks = 0;
SET sql_mode = '';

ALTER TABLE staff DROP FOREIGN KEY fk_staff_store;
ALTER TABLE staff DROP FOREIGN KEY fk_staff_address;
DELETE FROM payment ;
DELETE FROM rental ;
DELETE FROM customer ;
DELETE FROM film_category ;
DELETE FROM film_text ;
DELETE FROM film_actor ;
DELETE FROM inventory ;
DELETE FROM film ;
DELETE FROM category ;
DELETE FROM staff ;
DELETE FROM store ;
DELETE FROM actor ;
DELETE FROM address ;
DELETE FROM city ;
DELETE FROM country ;
DELETE FROM language ;
