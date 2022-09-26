-- SQL Advance Level (ORACLE)

SELECT * FROM user_tables


-- Tablolari gormek icin user_ ifadesini kullaniyoruz
SELECT * FROM USER_TAB_COLUMNS 
WHERE table_name = 'EMPLOYEES'


-- Baglantili olan tum tablolarla beraber getirir
SELECT * FROM all_tables


-- Tum tablolar (ancak yetki ister, hata verir)
SELECT * FROM dba_tables


-- Sana ait olmayan (giris yaptigin hesaba) bir sorguda asagidaki gibidir
SELECT * FROM hr.EMPLOYEES

-- Oracle from olmadan sorgu yaptirmiyor. 
SELECT * FROM dual -- Bu dummy kolon

-- Dummy kullanarak bu tarz islemele yapilabilir
SELECT SYSDATE, 22*5, 'Eyup' FROM DUAL  



-- Manager ID si 103 ile 120 arasinda olan calisanlar
SELECT first_name ADI, last_name SOYADI, salary MAAŞ, manager_id FROM employees  WHERE manager_id BETWEEN 103 AND 120

-- Manager ID si 103 veya 120 olan calisanlar
SELECT first_name ADI, last_name SOYADI, salary MAAŞ, manager_id FROM employees  WHERE manager_id IN (103, 120)



--Employees tablosunda manager_id kolonu bos olmayan calisan​

SELECT first_name, last_name, manager_id FROM employees  WHERE manager_id IS NOT NULL 




--Employees tablosunda job_id kolonu IT_PROG, FI_ACCOUNT ve SH_CLERK olmayan calisanlar​


SELECT * FROM EMPLOYEES WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SH_CLERK')


-- PIPE kullanimi: Isim soyisim kolonlarini birlestirdik, maas kolonuna 'MAAS' yazdirdik

SELECT first_name ||' '|| last_name "AD SOYAD", 'Maas: '||salary "MAAS" FROM EMPLOYEES 


-- Case kullanimi 

SELECT OrderID, Quantity,
CASE WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;


SELECT * FROM (SELECT first_name, last_name, AS "soyadi" FROM employees)
WHERE adi = 'MEHMET'               



