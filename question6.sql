-- TASK 6
-- Question 1
SELECT ROUND(AVG(rental_rate),2) FROM film;

-- Question 2
SELECT COUNT(*) FROM film
WHERE title LIKE 'C%';

-- Question 3
SELECT MAX(length) FROM film
WHERE rental_rate = '0.99';

-- Question 4
SELECT COUNT(DISTINCT replacement_cost) FROM film
WHERE length > 150;
