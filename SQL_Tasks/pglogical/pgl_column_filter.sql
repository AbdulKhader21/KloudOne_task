------------------------------------------------------------
---------------  COLUMN FILTER IN PGLOGICAL  ---------------
------------------------------------------------------------


-- PROVIDER (Port-6666)

CREATE EXTENSION pglogical;

create table person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) 
);

SELECT pglogical.create_node (
    node_name := 'provider',
    dsn := 'host=localhost port=6666 dbname=provider'
);

SELECT pglogical.replication_set_add_table ( 
    set_name := 'default', relation := 'person', synchronize_data := true,
    columns :='{id, first_name, last_name, country_of_birth}'
);



-- SUBSCRIBER (Port-7777 DB-subscriber)

CREATE EXTENSION pglogical;

create table person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) 
);

SELECT pglogical.create_node (
    node_name := 'subscriber',
    dsn := 'host=localhost port=7777 dbname=subscriber'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription', 
    provider_dsn := 'host=localhost port=6666 dbname=provider'
);



-- SUBSCRIBER2 (Port-7777 DB-subscriber2)

CREATE EXTENSION pglogical;

create table person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	country_of_birth VARCHAR(50) 
);

SELECT pglogical.create_node (
    node_name := 'subscriber2',
    dsn := 'host=localhost port=7777 dbname=subscriber2'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription2', 
    provider_dsn := 'host=localhost port=6666 dbname=provider'
);



-- PROVIDER (Port-6666)

insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Roxanne', 'Micklem', null, 'Female', '2019-12-11', 'Indonesia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Meade', 'Smale', 'msmale7@list-manage.com', 'Female', '2019-10-03', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Myca', 'Dogg', 'mdogg8@cdbaby.com', 'Male', '2020-07-13', 'Bolivia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Sib', 'Elrick', null, 'Female', '2020-02-03', 'Bangladesh');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Delila', 'Ithell', 'dithella@feedburner.com', 'Female', '2019-12-18', 'Brazil');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kimberlyn', 'Remer', 'kremerb@infoseek.co.jp', 'Female', '2019-09-23', 'Slovenia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Dana', 'Welling', null, 'Male', '2019-12-11', 'Japan');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Say', 'Briiginshaw', 'sbriiginshawd@mozilla.com', 'Male', '2020-04-07', 'China');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Elsinore', 'Le Clercq', 'eleclercqe@chicagotribune.com', 'Female', '2020-07-19', 'Thailand');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Lura', 'Crux', 'lcruxf@list-manage.com', 'Female', '2019-09-18', 'Jamaica');

SELECT * FROM person;



-- SUBSCRIBER (Port-7777 DB-subscriber)

SELECT * FROM person;



-- SUBSCRIBER2 (Port-7777 DB-subscriber2)

SELECT * FROM person;
