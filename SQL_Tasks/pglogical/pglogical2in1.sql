-----------------------------------------------------------------
----------  PGLOGICAL WITH 2 PROVIDER IN 1 SUBSCRIBER  ----------
-----------------------------------------------------------------


-- PROVIDER1 (Port-8888)

CREATE EXTENSION pglogical;

CREATE TABLE tbl (id int primary key,name varchar);

CREATE SEQUENCE seq_tbl_id INCREMENT BY 2 START WITH 1;

SELECT pglogical.create_node (
    node_name := 'provider1',
    dsn := 'host=localhost port=8888 dbname=provider1'
);

SELECT pglogical.replication_set_add_table ( 
    set_name := 'default', relation := 'tbl', synchronize_data := true
);



-- PROVIDER2 (Port-8888)

CREATE EXTENSION pglogical;

CREATE TABLE tbl (id int primary key,name varchar);

CREATE SEQUENCE seq_tbl_id INCREMENT BY 2 START WITH 2;

SELECT pglogical.create_node (
    node_name := 'provider2',
    dsn := 'host=localhost port=8888 dbname=provider2'
);

SELECT pglogical.replication_set_add_table (
    set_name := 'default', relation := 'tbl', synchronize_data := true
);



-- SUBSCRIBER (Port-6666)

CREATE EXTENSION pglogical;

CREATE TABLE tbl (id int primary key,name varchar);

SELECT pglogical.create_node (
    node_name := 'subscriber', dsn := 'host=localhost port=6666 dbname=subscriber'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription1', 
    provider_dsn := 'host=localhost port=8888 dbname=provider1'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription2', 
    provider_dsn := 'host=localhost port=8888 dbname=provider2'
);



-- PROVIDER1 (Port-8888)

insert into tbl select nextval ('seq_tbl_id'),'user' || generate_series(1,10,2);



-- PROVIDER2 (Port-8888)

insert into tbl select nextval ('seq_tbl_id'),'user' || generate_series(1,10,2);



-- SUBSCRIBER (Port-6666)

SELECT * FROM tbl ;