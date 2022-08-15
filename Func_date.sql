-------- ORIGINAL CODES ---------

SELECT DISTINCT orders.order_id, orders.employee_id, unit_price FROM orders
FULL JOIN customers
ON orders.customer_id = customers.customer_id
FULL JOIN order_details 
ON orders.order_id = order_details.order_id
WHERE DATE_PART('year', order_date) = 1998
ORDER BY orders.employee_id


-------------- Type --------------

CREATE TYPE public.date_table_1 AS
(
	order_id smallint,
    employee_id smallint,
    unit_price real
);

ALTER TYPE public.date_table_1
    OWNER TO postgres;
    

------------ Function -------------

CREATE FUNCTION public.date_searcher(IN date_value integer DEFAULT '1998')
    RETURNS SETOF date_table_1
    LANGUAGE 'sql'
AS $BODY$
SELECT DISTINCT orders.order_id, orders.employee_id, unit_price FROM orders
FULL JOIN customers
ON orders.customer_id = customers.customer_id
FULL JOIN order_details 
ON orders.order_id = order_details.order_id
WHERE DATE_PART('year', order_date) = date_value
ORDER BY orders.employee_id
$BODY$;

ALTER FUNCTION public.date_searcher(integer)
    OWNER TO postgres;
    
--------------- QUERY -------------

SELECT * FROM date_searcher(1996)
