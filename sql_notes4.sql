-- Procedure Creating (Create Update and Delete)  --------------------------------------

-- Procedure Create Tool
INSERT INTO customers
VALUES(id,'Eeren','Eyup','','','','','','','','')

-- SQL Codes

CREATE OR REPLACE PROCEDURE public.insert_customers(IN id integer)
LANGUAGE 'sql'
    
AS $BODY$
INSERT INTO customers
VALUES(id,'Eeren','Eyup','','','','','','','','')
$BODY$;


-- CALL  -- If we use variable name in procedure, we can use that in function brackets

CALL insert_customers(232323)


-- UPDATE (List Usage)

UPDATE PRODUCTS
SET unit_price = (unit_price - deger)
WHERE product_id IN(urunler)

-- SQL 

CREATE PROCEDURE public.discount_maker(IN urunler integer[], IN deger integer)
LANGUAGE 'sql'
AS $BODY$
UPDATE PRODUCTS
SET unit_price = (unit_price - deger)
WHERE product_id IN(urunler)
$BODY$;
ALTER PROCEDURE public.discount_maker(integer[], integer)
    OWNER TO postgres;
    
    
-- FUNCTIONS USAGE (Read) (get_customer_by_city)  -------------------------------------------

-- Codes

SELECT * FROM customers
WHERE city = city

-- SQL Codes

CREATE FUNCTION public.get_customer_by_city(IN "city" character varying DEFAULT London)
    RETURNS customers
    LANGUAGE 'sql'
    
AS $BODY$
SELECT * FROM customers
WHERE city = city
$BODY$;

ALTER FUNCTION public.get_customer_by_city(character varying)
    OWNER TO postgres;
    
    
-- Usage

SELECT * FROM get_customer_by_city('Berlin')




-- TYPES ---------------------------------------------------------

-- Bir table getirmemiz gerektiginde (join kullanilmis)
-- Return edilen sonuc tek table icermez o nedenle yeni bir type olustururuz
-- 3 sutun ekleyip yeni bir type olusturmaliyiz

-- Ornegin bu tablo 

SELECT c.customer_id, o.order_id, 
c.country, (unit_price * quantity) as "Fiyat" FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_details od
ON o.order_id = od.order_id
WHERE c.country= 'USA' or c.country= 'France'
ORDER BY c.country


