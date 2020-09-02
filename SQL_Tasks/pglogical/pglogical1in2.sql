-----------------------------------------------------------------
----------  PGLOGICAL WITH 1 PROVIDER IN 2 SUBSCRIBER  ----------
-----------------------------------------------------------------


-- PROVIDER (Port-9999 DB-prov)

CREATE EXTENSION pglogical;

CREATE TABLE tbl (id int primary key,name varchar);

SELECT pglogical.create_node (
    node_name := 'provider',
    dns := 'host=localhost port=9999 dbname=prov'
);

SELECT pglogical.replication_set_add_table (
    set_name := 'default', relation := 'tbl', synchronize_data := true
);



-- SUBSCRIBER1 (Port-6666 DB-sub1)

CREATE EXTENSION pglogical;

CREATE TABLE tbl (id int primary key,name varchar);

SELECT pglogical.create_node (
    node_name := 'subscriber1',
    dsn := 'host=localhost port=6666 dbname=sub1'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription1',
    provider_dsn := 'host=localhost port=9999 dbname=prov'
);



-- SUBSCRIBER2 (Port-6666 DB-sub1)

CREATE EXTENSION pglogical;

CREATE TABLE tbl (id int primaty key, name varchar);

SELECT pglogical.create_node (
    node_name := 'subscriber2',
    dsn := 'host=localhost port=6666 dbname=sub2'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscribtion2',
    provider_dsn := 'host=localhost port=9999 dbname=prov'
);



-- PROVIDER (Port-9999 DB-prov)

INSERT INTO tbl VALUES (1, 'ABDUL KHADER');
INSERT INTO tbl VALUES (2, 'USAMA');

SELECT * FROM tbl;



-- SUBSCRIBER1 (Port-6666 DB-sub1)

SELECT * FROM tbl;



-- SUBSCRIBER2 (Port-6666 DB-sub2)

SELECT * FROM tbl;
