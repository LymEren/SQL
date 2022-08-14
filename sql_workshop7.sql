-- 10 Joinli (veya ic ice) Sorgu

-- 1*- Siparis sirasinda musteriye 'Kargoya verildikten sonra 14 gun icerisinde teslim edilecek' dedigimizi dusunelim.
--     Bu sorgu, kargoya verildikten sonra 14 gun geciken siparislerde, calisanin notlar kismina
--     "Sorumlu oldugu siparisin kargo suresi gecikti" notunu ekliyor. Prim sistemi mantigi gibi dusunebilirsiniz.

UPDATE employees
SET notes = (notes || '. Sorumlu oldugu siparisin kargo suresi gecikti')
WHERE employee_id IN (
    SELECT employees.employee_id FROM employees
    FULL JOIN orders
    ON employees.employee_id = orders.employee_id
    WHERE (shipped_date - required_date) > 14
)

-- Sorgulamak icin:
SELECT notes FROM employees



-- 2- Musteri, siparisi verilen urun ve kargo firmasini gosteren sorgu:

SELECT customers.company_name AS "Musteri", products.product_name AS "Urun",shippers.company_name AS "Kargo Firmasi",
COUNT(orders.order_id) AS "Toplam Urun"
FROM orders
INNER JOIN shippers
ON orders.ship_via = shippers.shipper_id
INNER JOIN order_details
ON order_details.order_id = orders.order_id
INNER JOIN products
ON products.product_id = order_details.product_id
FULL JOIN customers
ON customers.customer_id = orders.customer_id
WHERE shipper_id = 3
GROUP BY shippers.company_name, products.product_name, customers.company_name


-- 3- Ulkesi Ispanya olanlara %50 indirim tanimlayan sorgu:

UPDATE order_details
SET discount = 0.5
WHERE order_id IN(
    SELECT order_id FROM orders
    WHERE customer_id IN (
        SELECT customer_id FROM customers
        WHERE country = 'Spain'
    ) 
)

-- 3b- Ayni sorgunun Joinli versiyonu:

UPDATE order_details
SET discount = 0.5
WHERE order_id IN(
    SELECT order_details.order_id FROM order_details
    FULL JOIN orders
    ON order_details.order_id = orders.order_id
    FULL JOIN shippers
    ON orders.ship_via = shippers.shipper_id
    FULL JOIN customers
    ON customers.customer_id = orders.customer_id
    WHERE customers.country = 'Spain'
)



-- 4- Telefon numarasi (171) 555-2222 olan musterinin siparisini silme:

DELETE FROM order_details
WHERE product_id IN(
    SELECT product_id FROM products
    WHERE supplier_id IN(
        SELECT supplier_id FROM suppliers
        WHERE phone = '(171) 555-2222'
    )
)

    
-- 4b- Ayni sorgunun Joinli versiyonu:


DELETE FROM order_details
WHERE order_id IN(
    SELECT orders.order_id FROM orders
    LEFT JOIN order_details
    ON orders.order_id = order_details.order_id
    RIGHT JOIN products
    ON order_details.product_id = products.product_id
    FULL JOIN suppliers
    ON products.supplier_id = suppliers.supplier_id
    WHERE phone = '(171) 555-2222'
)
    


-- 5- Bulunduğu şehir 'Berlin' olan müşterilerin sipariş ettikleri ürünlerin adları ve ID'leri nelerdir ?

SELECT o.customer_id, od.product_id, pro.product_name, od.order_id, cus.city from customers cus
FULL JOIN orders o
ON cus.customer_id = o.customer_id
FULL JOIN order_details od
ON o.order_id = od.order_id
FULL JOIN products pro
ON od.product_id = pro.product_id
WHERE cus.city = 'Berlin'


-- 6- Hangi müşteri,hangi çalışandan ürün sipariş etmiş, sipariş numarasına göre siralayan sorgu:

SELECT e.first_name,e.last_name,o.order_id,c.company_name FROM orders o
INNER JOIN employees e on e.employee_id = o.employee_id
INNER JOIN customers c on c.customer_id = o.customer_id
GROUP BY e.first_name,e.last_name,o.order_id,c.company_name
ORDER BY o.order_id;


-- 7-- Hangi ürün,hangi kategoride,hangi tedarikçi,stokta olan ürünleri product_id'ye göre sıralayan sorgu:

SELECT product_name,product_id,category_name,s.company_name from products p
INNER JOIN categories c ON p.category_id = c.category_id
INNER JOIN suppliers s ON p.supplier_id =s.supplier_id
WHERE units_in_stock > 0
ORDER BY product_id ;


-- 8- %20 ve üstü indirimli sipariş edilen ürünler ve fiyatları,müşterileri,sipariş edilme tarihleri,
--    kargo şirketini,müşteri adına göre sıralayan sorgu:

SELECT c.company_name,p.product_name,(ord.unit_price * ord.quantity * (1-ord.discount)) as "reduced_price",
o.order_date,s.company_name as "shipper_name" 
FROM orders o
INNER JOIN customers c ON c.customer_id = o.customer_id
INNER JOIN order_details ord ON ord.order_id = o.order_id
INNER JOIN shippers s  ON s.shipper_id = o.ship_via
INNER JOIN products p ON p.product_id = ord.product_id
WHERE discount >= 0.2
ORDER BY c.company_name;


-- 9- INSERT, UPDATE, DELETE Ornekleri:

INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
VALUES ('11077','47', '24.7', '14', '0.25')

select order_id, product_id, unit_price, quantity, discount from order_details
WHERE order_id = '11077'

UPDATE order_details
SET unit_price = '35.3', discount = '0.45'
WHERE order_id = '11077'

DELETE FROM order_details
WHERE order_id= '11077' and product_id = '47' and unit_price = '35.3' and quantity = '14' and discount = '0.45'


-- 10- Hangi ürünün siparişi hangi gün girilmiştir ?

SELECT od.product_id, od.order_id, o.order_date FROM orders o
FULL JOIN order_details od
ON o.order_id = od.order_id
LIMIT 3
                        
