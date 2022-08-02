-- SQL Notes 3

-- DATE Part (Eger order_date datasi string ise ::date ifadesini ekliyoruz)

WHERE DATE_PART('year', order_date::date) = '1998' AND ship_city = 'London';

-- LEFT JOIN

SELECT employees.employee_id, COUNT(orders.employee_id) FROM employees
LEFT JOIN orders ON employees.employee_id = orders.employee_id
GROUP BY employees.employee_id, orders.employee_id;


-- SELF JOIN

SELECT A.first_name AS "Birinci Calisan", B.first_name AS "Ikinci Calisan", A.City 
FROM employees A, employees B
WHERE A.first_name <> B.first_name
AND A.City = B.City
ORDER BY A.City;




-- DELETE

DELETE FROM table_name WHERE conditions

-- DELETE Ornek

SELECT * FROM employees
DELETE FROM employees WHERE employee_id = 7;

-- Bu kod calismayacak cunku diger tablolarlar foreign key baglantisi var



-- UPDATE

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

-- UPDATE Ornek

UPDATE us_states
SET city_name = 'Alabama Test'
WHERE city_name = 'Alabama';


--UPDATE ve yazi ekleme

UPDATE us_states
SET city_name = 'Alabama Test' + ' 2'
WHERE city_name = 'Alabama';

-- veya

UPDATE us_states
SET city_name = 'Alabama Test' || ' 2'
WHERE city_name = 'Alabama';


-- Fonksiyon ekleme

UPDATE us_states
SET state_name = state_name || ' ' || lower(state_abbr)

-- lower kullanildi


-- UPDATE ORNEK (Replace)

UPDATE us_states
SET state_name = replace(state_name, state_abbr, '' )
                        -- text      -- from     --to
                        
                        
                                                
-- TERS CEVIRME 

UPDATE us_states
SET state_name = reverse(state_name)



-- INSERT INTO

INSERT INTO us_states  -- Sira belirtmezsen default sirayi kullanir
VALUE()

-- Tabloda auto identity yoksa id girersin en basa varsa girmezsin


-- veya 

INSERT INTO us_states(state_abbr, state_name, state_region) -- Elle de girebilirsin
VALUE(state_id, x1,x2,x3)
-- ilk state_abbr, ikincisi state_name, ucuncu state_region

-- Bu durumda sutunlara bakmaksizin yazdigin siraya 


-- WORKSHOP IN kullanarak 3 bagli sutun sil


-- ORNEK KODLAR

delete from order_details
where order_id
IN(
    select order_id from orders where employee_id 
    IN(select employee_id from employees where city = 'Seattle')
)



delete from orders 
where employee_id 
IN(select employee_id from employees where city = 'London')

delete from employee_territories where employee_id 
IN(select employee_id from employees where city = 'Seattle')


delete from employees where city='Seattle'


select * from employees

---------------------------








