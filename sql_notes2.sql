-- SQL Notes 2 

-- JOIN 

SELECT order_date, ship_city, quantity FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id;

SELECT shipped_date, quantity FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id;

SELECT customer_id, shipped_date, quantity FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id;

SELECT customer_id, ship_city, shipped_date, quantity FROM orders
FULL JOIN order_details ON orders.order_id = order_details.order_id;




-- GROUP BY 

SELECT category_id, COUNT(*) AS "Urun Sayisi" FROM products
GROUP BY category_id
ORDER BY category_id 

-- HAVING (GROUP BY altina kod yaziyorsak, secilen sutunlarda - WHERE komutu aggregate fonksiyonlarda kullanilamaz)

SELECT category_id, COUNT(*) AS "Urun Sayisi" FROM products
GROUP BY category_id
HAVING COUNT(*) > 10
ORDER BY category_id 

-- veya

SELECT category_id, COUNT(category_id) AS "Urun Sayisi" FROM products
GROUP BY category_id
HAVING COUNT(category_id) > 10
ORDER BY COUNT(*) 


--  NICKNAME VERME   (orderstan sonra ord yazarak alt tarafta o sekilde kullandik)

SELECT * FROM orders ord
INNER JOIN order_details ordd ON ord.order_id = ordd.order_id;


-- LEFT JOIN Ornek

SELECT orders.order_id, ship_name, quantity, shipped_date 
FROM orders
LEFT JOIN order_details 
ON orders.order_id = order_details.order_id
ORDER BY quantity 


-- 3 lu ornek

SELECT * FROM products
INNER JOIN categories ON products.category_id =  categories.category_id
INNER JOIN suppliers ON products.supplier_id =  suppliers.supplier_id


-- Diger ornek = 3 numarali musterinin toplam yaptigi satisi gosteriniz


SELECT orders.employee_id, SUM(quantity*unit_price) AS "Toplam" FROM orders
INNER JOIN order_details ON orders.order_id =  order_details.order_id
WHERE orders.employee_id = 3
GROUP BY orders.employee_id


-- Farkli bir ornek en cok satis yapan elemanlar

SELECT orders.employee_id, SUM(quantity*unit_price) AS "Toplam" FROM orders
INNER JOIN order_details ON orders.order_id =  order_details.order_id
GROUP BY orders.employee_id
ORDER BY SUM(quantity*unit_price)


-- PAIR WORKSHOP

-- Real Scenerio 1 










-- Date Islemleri

SELECT * FROM employees
WHERE birth_date LIKE '1948-12-08'






