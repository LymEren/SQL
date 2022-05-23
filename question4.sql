-- TASK 4 
-- Question 1
SELECT DISTINCT replacement_cost FROM film;

-- Question 2
SELECT COUNT( DISTINCT replacement_cost) FROM film;

-- Question 3
SELECT COUNT(*) FROM film 
WHERE title LIKE 'T%' AND rating = 'G';

-- Question 4
SELECT COUNT (*) FROM country 
WHERE country LIKE '_____'

-- Question 5
SELECT  COUNT(*) FROM city 
WHERE city ILIKE '%R'; 
