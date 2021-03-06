-- PUB (Port-9999)
CREATE DATABASE pub;

CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) 
);

insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Dare', 'Mila', null, 'Male', '2020-01-25', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Prudi', 'Filimore', 'pfilimore1@reference.com', 'Female', '2020-01-09', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Maxi', 'Swepson', 'mswepson2@i2i.jp', 'Female', '2020-04-10', 'South Africa');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Hilliard', 'Olligan', 'holligan3@opensource.org', 'Male', '2020-01-16', 'Philippines');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Katinka', 'Limpertz', 'klimpertz4@odnoklassniki.ru', 'Female', '2020-04-20', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Renato', 'Marner', 'rmarner5@latimes.com', 'Male', '2020-01-04', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Roxanne', 'Micklem', null, 'Female', '2019-12-11', 'Indonesia');

SELECT * FROM person;

CREATE PUBLICATION my_pub FOR ALL TABLES;

\dRp    - Lists the publications



-- SUB (Port-8888)

CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) 
);

SELECT * FROM person;

CREATE SUBSCRIPTION my_sub CONNECTION 'host=localhost port=9999 dbname=pub' PUBLICATION my_pub;

\dRs    - Lists the subscription

\d      - Lists the Tables


-- PUB (Port-9999)

insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Meade', 'Smale', 'msmale7@list-manage.com', 'Female', '2019-10-03', 'China');



-- SUB (Port-8888)

select * from person;

insert into person (id, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (9, 'Myca', 'Dogg', 'mdogg8@cdbaby.com', 'Male', '2020-07-13', 'Bolivia');

select * from person;



-- PUB (Port-9999)

select * from person;

delete from person where id=8;



-- SUB (Port-8888)

ALTER SUBSCRIPTION my_sub DISABLE;

ALTER SUBSCRIPTION my_sub ENABLE;

