-- TASK 9

-- Question 1
SELECT city.city, country.country FROM city
INNER JOIN country ON city.country_id = country.country_id;

-- Question 2
SELECT customer.first_name, customer.last_name, payment.payment_id FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id;

-- Question 3
SELECT customer.first_name, customer.last_name, rental.rental_id FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id;
