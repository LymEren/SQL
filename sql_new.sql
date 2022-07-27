-- Con ile baslayan kelimeler

SELECT * FROM categories
WHERE category_name LIKE 'Con%'

-- Basi sonu onemsiz, icerisinde e bulunduran categorey_name icersinde

SELECT * FROM categories
WHERE category_name LIKE '%e%'


-- Ilk harf blank ikincisi r ve gerisi onemsiz (ve diger)

SELECT * FROM categories
WHERE category_name LIKE '_r%'

SELECT * FROM categories
WHERE category_name LIKE '__v%'

SELECT * FROM categories
WHERE category_name LIKE '_o%s'

-- Son harfi 's' ile bitmeyen

SELECT * FROM categories
WHERE category_name NOT LIKE '%s'

-- TOP TAKE ve Burada(LIMIT) ile ilk 3 siradakileri siralayabiliriz

SELECT * FROM categories
WHERE category_name NOT LIKE 'A%'
LIMIT 3

-- Matematiksel Operatorler 

SELECT * FROM products
WHERE unit_price > 15 and units_in_stock = 40;

-- MIN MAX 

SELECT MAX(unit_price) FROM products
SELECT MIN(unit_price) FROM products

-- SIRALAM A

SELECT * FROM products
ORDER BY unit_price;

-- Kucukten buyuge

SELECT * FROM products
ORDER BY unit_price ASC

-- Buyukten Kucuge ILK siradaki

SELECT * FROM products
ORDER BY unit_price DESC
LIMIT 1 

-- Soyle bir kullanim da mevcut (6. sutundaki)

SELECT * FROM products
ORDER BY 6 DESC

-- Alias kullanimi (AS)

SELECT product_name AS "Urun Adi" FROM products

-- Coklu kullanim

SELECT product_name AS "Urun Adi", product_id AS "Urun ID" FROM products

-- En pahali urun (ayni zamanda etiketleri kullandik

