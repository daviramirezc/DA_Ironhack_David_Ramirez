USE sakila

-- 1

SELECT COUNT(*) AS total_copies
FROM inventory
WHERE film_id IN (
    SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible'
);

SELECT *
FROM film
LIMIT 10;

-- 2
SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);

-- 3
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id = (
    SELECT film_id
    FROM film
    WHERE title = 'Alone Trip'
);

