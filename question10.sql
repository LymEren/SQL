-- TASK 10

-- Question 1
SELECT city, country FROM city
LEFT JOIN country
ON city.country_id = country.country_id;

-- Question 2
SELECT payment_id, first_name, last_name FROM customer
RIGHT JOIN payment 
ON customer.customer_id = payment.customer_id; 

-- Question 3
SELECT rental, first_name, last_name FROM customer
FULL OUTER JOIN rental 
ON customer.customer_id = rental.customer_id;

