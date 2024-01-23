-- Lab sql basic queries
USE Sakila;

-- Display all available tables in the Sakila database.
SHOW TABLES;

-- Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- Retrieve the following columns from their respective tables:
-- 1. Titles of all films from the film table
SELECT title FROM film;
-- 2. List of languages used in films, with the column aliased as language from the language table
SELECT name AS language FROM language;
-- 3. List of first names of all employees from the staff table
SELECT first_name FROM staff;

-- Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- Counting records for database insights:
-- 1. Determine the number of stores that the company has.
SELECT COUNT(*) AS store_count FROM store;
-- 2. Determine the number of employees that the company has.
SELECT COUNT(*) AS staff_count FROM staff;
-- 3. Determine how many films are available for rent and how many have been rented.
SELECT
  (SELECT COUNT(DISTINCT film_id) FROM inventory) AS available,
  (SELECT COUNT(DISTINCT inventory_id) FROM rental) AS rented;
-- 4. Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS actor_last_name_count FROM actor;

-- Retrieve the 10 longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

-- Use filtering techniques in order to:
-- 1. Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name FROM actor
WHERE first_name LIKE 'SCARLETT%';
-- 2. Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title, length FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;
-- 3. Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) AS behind_the_scenes_films FROM film
WHERE special_features LIKE '%Behind the Scenes%';