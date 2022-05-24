-- TASK 8

-- Question 1

id INTEGER,
name VARCHAR(50) ,
birthday DATE,
email VARCHAR(100)
);

-- Question 2

insert into employee (name, birthday, email) values ('Chancey', '2021-10-17', 'cleilem@phoca.cz');
insert into employee (name, birthday, email) values ('Claybourne', '2022-04-25', 'cchrichtonx@uol.com.br');
insert into employee (name, birthday, email) values ('Levi', '2021-09-19', 'lgudey@networksolutions.com');
insert into employee (name, birthday, email) values ('Rogers', '2021-10-11', 'rseathwright2@netvibes.com');
insert into employee (name, birthday, email) values ('Dudley', '2021-03-15', 'dblasing3@dailymotion.com');
insert into employee (name, birthday, email) values ('Friedrich', '2021-02-01', 'fcostello4@state.gov');
insert into employee (name, birthday, email) values ('Shaylah', '2021-05-26', 'ssimmens5@toplist.cz');
insert into employee (name, birthday, email) values ('Damita', '2020-12-01', 'dcartmael6@wordpress.org');
insert into employee (name, birthday, email) values ('Anstice', '2020-11-29', 'athewless7@yelp.com');
insert into employee (name, birthday, email) values ('Pia', '2021-01-18', 'pwegenen8@istockphoto.com');
insert into employee (name, birthday, email) values ('Enrico', '2020-12-20', 'eaps9@sitemeter.com');
insert into employee (name, birthday, email) values ('Wadsworth', '2020-12-24', 'wparfreya@gnu.org');
insert into employee (name, birthday, email) values ('Lexis', '2021-05-02', 'lweddupb@a8.net');
insert into employee (name, birthday, email) values ('Raye', '2021-06-16', 'rgentilec@google.de');
insert into employee (name, birthday, email) values ('Inness', '2020-09-24', 'icraikd@nps.gov');
insert into employee (name, birthday, email) values ('Delilah', '2021-03-23', 'dpaitone@studiopress.com');
insert into employee (name, birthday, email) values ('Kinsley', '2021-01-19', 'ktompionf@fda.gov');
insert into employee (name, birthday, email) values ('Dick', '2022-02-01', 'doleseng@godaddy.com');
insert into employee (name, birthday, email) values ('Brander', '2021-05-20', 'bfomichyovh@merriam-webster.com');
insert into employee (name, birthday, email) values ('Celina', '2021-03-04', 'corsmani@msn.com');
insert into employee (name, birthday, email) values ('Ronica', '2021-05-31', 'romurtaghj@gnu.org');
insert into employee (name, birthday, email) values ('Rozamond', '2021-08-18', 'rdashkovk@xing.com');
insert into employee (name, birthday, email) values ('Hastie', '2020-10-14', 'hdochonl@creativecommons.org');
insert into employee (name, birthday, email) values ('Carree', '2021-01-28', 'cvallens0@ted.com');
insert into employee (name, birthday, email) values ('David', '2021-06-21', 'dmomfordn@histats.com');
insert into employee (name, birthday, email) values ('Keary', '2021-08-14', 'kcornilso@fastcompany.com');
insert into employee (name, birthday, email) values ('Valli', '2021-06-12', 'vhoodlassp@seesaa.net');
insert into employee (name, birthday, email) values ('Mandel', '2022-04-23', 'mburnsidesq@google.de');
insert into employee (name, birthday, email) values ('Dwayne', '2021-11-22', 'ddunsmorer@hibu.com');
insert into employee (name, birthday, email) values ('Reynard', '2021-09-09', 'rsansburys@fc2.com');
insert into employee (name, birthday, email) values ('Charline', '2021-05-06', 'cplumt@sphinn.com');
insert into employee (name, birthday, email) values ('Antony', '2020-12-08', 'avanrossu@pcworld.com');
insert into employee (name, birthday, email) values ('Fairleigh', '2021-08-07', 'fcrollv@nifty.com');
insert into employee (name, birthday, email) values ('Belvia', '2021-12-26', 'bblindw@deliciousdays.com');
insert into employee (name, birthday, email) values ('Dev', '2021-12-28', 'dosipenko1@tumblr.com');
insert into employee (name, birthday, email) values ('Delainey', '2020-10-11', 'dmeadowcroftz@livejournal.com');
insert into employee (name, birthday, email) values ('Tersina', '2021-03-22', 'tpurchase10@seesaa.net');
insert into employee (name, birthday, email) values ('Wynnie', '2022-01-09', 'wbrougham11@netscape.com');
insert into employee (name, birthday, email) values ('Alfonso', '2020-11-04', 'agregor12@squidoo.com');
insert into employee (name, birthday, email) values ('Konstanze', '2022-02-08', 'kbrokenbrow13@pbs.org');
insert into employee (name, birthday, email) values ('Niel', '2020-12-09', 'nstandall14@ca.gov');
insert into employee (name, birthday, email) values ('Eddi', '2022-01-12', 'elydall15@dropbox.com');
insert into employee (name, birthday, email) values ('Bradney', '2020-11-19', 'blievesley16@dell.com');
insert into employee (name, birthday, email) values ('Dur', '2021-06-24', 'daguirrezabal17@economist.com');
insert into employee (name, birthday, email) values ('Cleopatra', '2020-09-07', 'cderl18@ftc.gov');
insert into employee (name, birthday, email) values ('Arney', '2021-05-31', 'apenrose19@dot.gov');
insert into employee (name, birthday, email) values ('Putnem', '2021-07-03', 'praubheim1a@google.de');
insert into employee (name, birthday, email) values ('Linnell', '2021-11-02', 'lgrigolon1b@disqus.com');
insert into employee (name, birthday, email) values ('Hamlin', '2021-12-29', 'hmichelotti1c@cnbc.com');
insert into employee (name, birthday, email) values ('Jayme', '2022-02-22', 'jbedborough1d@google.pl');


-- Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
UPDATE employee
		 SET name = 'Eren ' ,
		 email ='hello@gmail.com' ,
		 birthday ='1998-02-01'
		 WHERE id = 1 ;
UPDATE employee
		 SET name = 'Nusret ' ,
		 email ='nusssret@gmail.com' ,
		 birthday ='1994-01-06'
		 WHERE id = 2 ;
UPDATE employee
		 SET name = 'John ' ,
		 email ='hamza@gmail.com' ,
		 birthday ='1975-03-02'
		 WHERE id = 3 ;
UPDATE employee
		 SET name = 'Hilmi' ,
		 email ='hellme@gmail.com' ,
		 birthday ='1991-08-02'
		 WHERE id = 4 ;
UPDATE employee
		 SET name = 'Sam' ,
		 email ='samualll@gmail.com' ,
		 birthday ='2001-03-02'
		 WHERE id = 5 ;

-- Question 4

DELETE FROM employee WHERE id IN (6,7,8,9,10) RETURNING *;
