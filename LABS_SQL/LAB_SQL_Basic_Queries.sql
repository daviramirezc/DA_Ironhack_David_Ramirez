USE sakila;

-- 1
SHOW TABLES;

-- 2
SELECT * FROM actor;

SELECT * FROM film;

SELECT * FROM customer;

-- 3.1
SELECT title FROM film;

-- 3.2
SELECT name AS language FROM language;

-- 3.3
SELECT first_name FROM staff;

-- 4
SELECT DISTINCT release_year FROM film;

-- 5.1
SELECT COUNT(*) AS store_count FROM store;

-- 5.2
SELECT COUNT(*) AS employee_count FROM staff;

-- 5.3
SELECT COUNT(DISTINCT film_id) AS films_available_for_rent FROM inventory;

SELECT COUNT(DISTINCT inventory_id) AS films_rented FROM rental;

-- 5.4 
SELECT COUNT(DISTINCT last_name) AS distinct_actor_last_names FROM actor;

-- 6
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

-- 7
SELECT *
FROM actor
WHERE first_name = 'SCARLETT';


