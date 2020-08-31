---------------------------------------------------------
---------------  ROW FILTER IN PGLOGICAL  ---------------
---------------------------------------------------------


-- PROVIDER (Port-9999)

CREATE EXTENSION pglogical;

create table car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

SELECT pglogical.create_node (
    node_name := 'provider',
    dsn := 'host=localhost port=9999 dbname=provider'
);

SELECT pglogical.replication_set_add_table ( 
    set_name := 'default', relation := 'car', synchronize_data := true,
    row_filter := 'price > 54686'
);



-- SUBSCRIBER (Port-8888)

CREATE EXTENSION pglogical;

create table car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

SELECT pglogical.create_node (
    node_name := 'subscriber',
    dsn := 'host=localhost port=8888 dbname=subscriber'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription', 
    provider_dsn := 'host=localhost port=9999 dbname=provider'
);



-- PROVIDER (Port-9999)

\i /home/khader/Desktop/git/KloudOne_task/SQL_Tasks/pglogical/car.sql

SELECT * FROM car;



-- SUBSCRIBER (Port-8888)

SELECT * FROM car;

select count(id) from car;



-- PROVIDER (Port-9999)

select count(id) from car where (price > 54686);

