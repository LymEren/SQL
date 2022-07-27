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

SELECT product_name AS "Urun Adi", unit_price AS "fiyat" FROM products
ORDER BY unit_price DESC LIMIT 1 ;

-- Icerisinde ca gecen hali. Gercek hayat ornek: Isminde internet gecen urunleri, en ucuzdan en pahaliya goruntuleyebilirsiniz ornegin

SELECT product_name AS "Urun Adi", unit_price AS "Fiyat" FROM products
WHERE product_name LIKE '%ca%'
ORDER BY unit_price DESC LIMIT 1 ;

-- Fiyati 50 ile 100 arasinda olan urunleri goruntuleme 

SELECT product_name AS "Urun Adi", unit_price AS "Fiyat" FROM products
WHERE unit_price BETWEEN 50 AND 100

-- Ilk 10 siradakini goruntulemek isterseniz 

SELECT product_name AS "Urun Adi", unit_price AS "Fiyat" FROM products
WHERE unit_price BETWEEN 50 AND 100
ORDER BY unit_price DESC LIMIT 10

-- IN OPERATORU Kullanimi

SELECT * FROM products
WHERE product_name IN('Chai','Chang')







-- WORKSHOP 1 

--Product isimlerini (`ProductName`) ve
-- birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.

SELECT product_name, quantity_per_unit FROM products

-- 2- Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) değerlerini almak için sorgu yazın. 
-- Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz.

SELECT product_id, product_name FROM products
WHERE discontinued = 1

-- 3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.

SELECT product_id, product_name, discontinued FROM products
WHERE discontinued = 1

-- 4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price < 20

-- 5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini 
-- (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price BETWEEN 15 AND 25

-- 6. Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) 
-- stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.

SELECT product_name, units_on_order, units_in_stock FROM products
WHERE units_in_stock < units_on_order

-- 7. İsmi `a` ile başlayan ürünleri listeleyeniz.

SELECT * FROM products
WHERE product_name LIKE 'A%'

-- 8. İsmi `i` ile biten ürünleri listeleyeniz.

SELECT * FROM products
WHERE product_name LIKE '%i'



-- AVG (Average)

SELECT AVG(unit_price) AS "Ortalama Birim Fiyati" FROM products

-- SUM

SELECT SUM(unit_price) FROM products

-- Ekstra sutun ile siralama (Alfabetik olarak siralar)

SELECT * FROM products
ORDER BY product_name;


-- DISTINCT (Sutunda ayni olan degerleri (1) kez listeler - Kalem kalem - Or: Kac farkli sehirde calisan var?)

SELECT DISTINCT category_id FROM products;



-- DISTINCT coklu kullanim (City tek olmayabilir 2 sutun olarak degerlendiriyor)

SELECT DISTINCT city, title_of_courtesy FROM employees


-- DISTINCT sayisi

SELECT COUNT(DISTINCT city) 
FROM employees





