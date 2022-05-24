-- TASK 7
-- Question 1
SELECT rental_rate, COUNT(*) FROM film
GROUP BY rental_rate;

-- Question 2
SELECT replacement_cost, COUNT(*) FROM film
GROUP BY replacement_cost HAVING COUNT(*) > 50;

-- Question 3
SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id;

-- Question 4
SELECT country_id, COUNT(*) FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC LIMIT 1;
