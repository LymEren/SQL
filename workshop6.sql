-- Workshop 45 Soru - Cevap 

-- 65. Hangi çalışan şimdiye kadar  toplam kaç sipariş almış..?

SELECT  e.employee_id, e.first_name, e.last_name, COUNT (order_id) FROM orders o
INNER JOIN employees e
ON e.employee_id = o.employee_id
GROUP BY e.employee_id
order by e.employee_id;

-- 66. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun

SELECT DISTINCT customer_id FROM customers
WHERE customer_id NOT IN ( 
    SELECT customer_id FROM orders
);

-- 67. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri

SELECT country, company_name, contact_name, address, city, country FROM  customers
WHERE country = 'Brazil';

-- 68. Brezilya’da olmayan müşteriler

SELECT customer_id, country FROM  customers
WHERE country != 'Brazil';

-- 69. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler

SELECT company_name,country FROM customers 
WHERE country = 'Spain' OR country = 'France' OR country ='Germany' 
ORDER BY country;

-- 70. Faks numarasını bilmediğim müşteriler

select customer_id, fax from customers
where fax IS NULL
order by customer_id;

-- 71. Londra’da ya da Paris’de bulunan müşterilerim

SELECT * FROM customers
WHERE city = 'Londra' OR city = 'Paris';

-- 72. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler

select city, contact_title from customers
where city = 'México D.F.' and contact_title = 'Owner';
    
-- 73. C ile başlayan ürünlerimin isimleri ve fiyatları

SELECT product_name , unit_price FROM products
WHERE product_name LIKE 'C%';

-- 74. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri

select first_name,last_name,birth_date from employees
where first_name like 'A%';

-- 75. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları

select customer_id, company_name,contact_name from customers
where company_name ILIKE '%restaurant%';

-- 76. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları

SELECT product_name, unit_price FROM products
WHERE unit_price BETWEEN 50 AND 100
ORDER BY unit_price;

-- 77. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) 
-- ve SiparişTarihi (OrderDate) bilgileri

select order_id, order_date from orders 
where order_date between '1996-07-01' and '1996-12-31';

-- 78. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler

select company_name,country from customers 
where country = 'Spain' or country = 'France' or country ='Germany' order by country;

-- 79. Faks numarasını bilmediğim müşteriler

select customer_id, fax from customers
where fax IS NULL
order by customer_id;

-- 80. Müşterilerimi ülkeye göre sıralıyorum:

select customer_id, country from customers
ORDER BY country;

-- 81. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz

SELECT product_name, unit_price FROM products
ORDER BY unit_price DESC;

-- ***************** 82. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe 
-- doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz:

select  product_name, unit_price, units_in_stock from products  
order by unit_price desc, units_in_stock asc;


-- 83. 1 Numaralı kategoride kaç ürün vardır..?

SELECT category_id , COUNT(quantity_per_unit) FROM products
WHERE category_id = '1'
GROUP BY category_id;

-- 84. Kaç farklı ülkeye ihracat yapıyorum..?

select count(distinct country) from customers;


-- 85. Bu ülkeler hangileri..?

select distinct country from customers;

-- 86. En Pahalı 5 ürün

SELECT * FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- 87. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?

SELECT customers.customer_id, COUNT(order_id) AS "Siparis Sayisi" FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.customer_id = 'ALFKI'
GROUP BY customers.customer_id;


-- 88. Ürünlerimin toplam maliyeti

SELECT SUM(unit_price*quantity) AS "Toplam Maliyet" 
FROM order_details;

-- 89. Şirketim, şimdiye kadar ne kadar ciro yapmış..?

SELECT SUM(unit_price * quantity * (1-discount)) AS "Toplam Ciro" 
FROM order_detail;

-- 90. Ortalama Ürün Fiyatım

select product_id, avg(unit_price) from products
group by product_id;

-- veya

select avg(unit_price) as "Ortalama" from products;

-- 91. En Pahalı Ürünün Adı

SELECT product_name, unit_price FROM products
ORDER BY unit_price DESC
LIMIT 1;

-- 92. En az kazandıran sipariş

select order_id, (unit_price * quantity) as "kazanc" from order_details
order by (unit_price * quantity) asc
limit 1;

-- 93. Müşterilerimin içinde en uzun isimli müşteri (harf sayısı)

SELECT company_name, MAX(LENGTH(company_name)) AS "En Uzun Isim" 
FROM customers
GROUP BY company_name
ORDER BY MAX(LENGTH(company_name)) DESC
LIMIT 1;

-- 94. Çalışanlarımın Ad, Soyad ve Yaşları

SELECT first_name,last_name, age(current_date,birth_date) 
FROM employees;

-- 95. Hangi üründen toplam kaç adet alınmış..?

select products.product_id, product_name, COUNT (order_id) from order_details
inner join products
on order_details.product_id = products.product_id
group by products.product_id
order by products.product_id ;

-- 97. Hangi kategoride toplam kaç adet ürün bulunuyor..?

SELECT categories.category_id, COUNT(product_id) FROM categories
INNER JOIN products
ON categories.category_id = products.category_id
GROUP BY categories.category_id
ORDER BY categories.category_id;


-- 98. 1000 Adetten fazla satılan ürünler?

SELECT product_id , SUM(quantity) FROM order_details
GROUP BY product_id
HAVING SUM(quantity) > 1000
ORDER BY product_id;

-- 99. Hangi Müşterilerim sipariş vermistir..? (91 Müşteriden 2'si sipariş vermemisti..) 
-- (66. Sorunun aynisi oldugu icin degistirildi)

SELECT DISTINCT customer_id AS "Siparis Veren Musteriler" FROM customers
WHERE customer_id IN ( 
    SELECT customer_id FROM orders
);


-- 100. Hangi tedarikçi hangi ürünü sağlıyor ?

select p.supplier_id, product_id, company_name, contact_name from products p
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id
order by p.supplier_id;

-- 101. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..? (shipper_id olmadigi icin)

SELECT order_id , shippers.company_name , orders.order_date FROM Shippers
INNER JOIN orders
ON shippers.shipper_id = orders.ship_via;


-- 102. Hangi siparişi hangi müşteri verir..?

select customers.company_name, orders.order_id from customers 
inner join orders
on customers.customer_id = orders.customer_id;

-- 103. Hangi çalışan, toplam kaç sipariş almış..?

SELECT orders.employee_id , COUNT(order_id) FROM orders
INNER JOIN employees
ON orders.employee_id = employees.employee_id
GROUP BY orders.employee_id;

-- 104. En fazla siparişi kim almış..?

select count(order_id) as number_of_order,first_name,last_name from  orders o 
inner join employees e on o.employee_id = e.employee_id
group by first_name,last_name
order by count(order_id) desc
limit 1;

-- 105. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?

SELECT order_id, employees.employee_id , customer_id , employees.first_name , employees.last_name 
FROM orders
INNER JOIN employees
ON orders.employee_id = employees.employee_id
GROUP BY order_id, employees.employee_id, customer_id
ORDER BY employee_id;

-- 106. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?

SELECT product_id, product_name , category_name, suppliers.company_name AS "Tedarikci" FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
INNER JOIN suppliers
ON products.supplier_id = suppliers.supplier_id;


-- 107. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş 
-- hangi üründen kaç adet alınmış, hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış
-- (Fatih'e tesekkurler :D)

SELECT orders.order_id , customers.company_name AS "Musteri" , first_name || ' ' || last_name AS "Calisan Ismi" , 
orders.order_date AS "Siparis Verilme Tarihi" , shippers.company_name AS "Kargo Sirketi", 
products.product_name AS "Urun Ismi", order_details.quantity AS "Adet", order_details.unit_price  AS "Urun Fiyati",  
categories.category_name AS "Kategori", suppliers.company_name AS "Tedarikci"
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.ship_via = shippers.shipper_id
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id
INNER JOIN categories ON products.category_id = categories.category_id
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY orders.order_id DESC


-- 108. Altında ürün bulunmayan kategoriler

SELECT categories.category_id , products.product_name FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE product_name IS NULL;
