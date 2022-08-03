
-- PAIR 8 Eyyub Eren, Berk Çetiner, Mustafa Deniz Gökcan, Fatih Şahin

-- PROCEDURE ORNEGI 

-- Sectigimiz (product_id) urunumuzun indirim miktarini (discount) belirleyebildigimiz procedure (tekil_urun_indirim). 

-- Sorgunun Orjinal Hali

SELECT DISTINCT products.product_id , discount, products.product_name 
FROM order_details
INNER JOIN products 
ON order_details.product_id = products.product_id
WHERE  products.product_id = 5

-- PROCEDURE CALL

CALL tekil_urun_indirim(22.3, 5)

------------------------------------------------------

-- SQL Kodlari:

CREATE OR REPLACE PROCEDURE public.tekil_urun_indirim(IN discount_rate real, IN secilen_product_id integer)
    LANGUAGE 'sql'
    
AS $BODY$
UPDATE order_details
SET discount = discount_rate
WHERE product_id IN (
    SELECT product_id FROM products
    WHERE product_id = secilen_product_id
)
$BODY$;



-------------------------------------------------------


-- FONKSIYON ORNEGI
-- Belirttigimiz gun sayisi kadar gecikmis urunleri gosteren fonksiyon

-- Sorgunun orjinal hali:

SELECT order_id, shipped_date, company_name, (shipped_date - required_date) AS "Gecikme Gunu"
FROM orders 
INNER JOIN customers ON orders.customer_id = customers.customer_id
WHERE (shipped_date - required_date) > 17

----------------------

-- Fonksiyonu Cagirma:


SELECT * FROM geciken_urunler(14)

---------------------------------

-- SQL Codes:

CREATE OR REPLACE FUNCTION public.geciken_urunler(IN geciken_gun_sayisi integer)
    RETURNS SETOF gecikme_tablolar
    LANGUAGE 'sql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
SELECT order_id, shipped_date, company_name, (shipped_date - required_date) AS "Gecikme Gunu"
FROM orders 
INNER JOIN customers ON orders.customer_id = customers.customer_id
WHERE (shipped_date - required_date) > geciken_gun_sayisi
$BODY$;

---------------------------------









