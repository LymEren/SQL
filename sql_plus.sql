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



------------


UPDATE employees
   SET job_id =
       (SELECT job_id FROM employees WHERE employee_ıd = 101),
       salary =
       (SELECT salary FROM employees WHERE employee_ıd = 101)
 WHERE employee_id = 103;

DELETE FROM countrıes
WHERE country_name = 'Türkiye';

MERGE INTO departments U1
USING (Select * from departments_cp) U2
ON (U1.department_id = U2.department_id)
WHEN MATCHED THEN 
  UPDATE SET U1.department_name = u2.department_name
  WHEN NOT MATCHED THEN
    INSERT                        
    VALUES(U2.department_id, U2.department_name, U2.manager_id, U2.location_id)

-------------------

INSERT INTO countrıes (country_ıd, country_name, regıon_ıd)
VALUES ('TR', 'Türkiye', 1);
1 rows inserted

INSERT INTO countrıes (country_ıd, country_name, regıon_ıd)
VALUES ('GR', 'Almanya', 1);
1 rows inserted

SAVEPOINT ulkeler_eklendi

INSERT INTO managers(managerID, managerName, salary, commission_pct)
  SELECT employee_id, last_name, salary + 400, commission_pct * 0.2
  FROM   employees
  WHERE  job_id LIKE '%MAN%';
11 rows inserted

SAVEPOINT yoneticiler_eklendi

UPDATE   employees
SET      job_id  = (SELECT  job_id 
                    FROM    employees 
                    WHERE   employee_ıd = 101), 
         salary  = (SELECT  salary 
                    FROM    employees 
                    WHERE   employee_ıd = 101) 
WHERE    employee_id    =  103;
1 rows updated

SAVEPOINT maaslar_guncellendi


ROLLBACK TO yoneticiler_eklendi;
