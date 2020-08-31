------------------------------------------------------
----------  GETTING STARTED WITH PGLOGICAL  ----------
------------------------------------------------------


-- PUB (Port-9999)

CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'provider1',
    dsn := 'host=localhost port=9999 dbname=db'
);

CREATE TABLE tbl_1(id int primary key, name text, reg_time timestamp);

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);

SELECT * FROM pglogical.replication_set_table ;

\q

-- TO COPY TABLE tbl_1 from Port-9999 to Port-7777 :   pg_dump -t tbl_1 -s db -p 9999 | psql -p 7777 db



-- SUB (Port-7777)

CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'subscriber1',
    dsn := 'host=localhost port=7777 dbname=db'
);

SELECT pglogical.create_subscription(
    subscription_name := 'subscription1',
    provider_dsn := 'host=localhost port=9999 dbname=db'
);



-- PUB (Port-9999)

INSERT INTO tbl_1 VALUES (1, 'ABDUL', now());

SELECT * FROM tbl_1;



-- SUB (Port-7777)

SELECT * FROM tbl_1;



-- PUB (Port-9999)

INSERT INTO tbl_1 VALUES (2, 'KHADER', now());

SELECT * FROM tbl_1;



-- SUB (Port-7777)

SELECT * FROM tbl_1;

