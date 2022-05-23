-- TASK 5
-- Question 1
SELECT * FROM film 
WHERE title LIKE '%n' ORDER BY length DESC LIMIT 5;

-- Question 2
SELECT * FROM film 
WHERE title LIKE '%n'ORDER BY length ASC LIMIT 5 OFFSET 5 ;

-- Question 3
SELECT * FROM customer 
WHERE store_id = 1 ORDER BY last_name DESC LIMIT 4;
