-- SQL Advance Level 

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

