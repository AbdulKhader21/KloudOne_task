-- PUB (Port-9999)

CREATE DATABASE publication;



-- SUB (Port-8888)

CREATE DATABASE subscription;



-- PUB (Port-9999)

CREATE TABLE t1 (a int primary key, b int);

INSERT INTO t1(1, 10):
INSERT INTO t1(2, 20):

SELECT * FROM t1;

CREATE ROLE rep REPLICATION LOGIN PASSWORD 'postgres'

CREATE PUBLICATION pub for TABLE t1 ;

\dRp    - Lists the publications

GRANT SELECT ON t1 TO rep;

\q

-- TO COPY TABLE t1 TO PORT-8888 :-    pg_dump -t -s publication -p 9999 | psql -p 8888 subscription



-- SUB (Port-8888)

\d      -- To list Tables

CREATE SUBSCRIPTION sub CONNECTION 'host=localhost port=9999 dbname=publication' PUBLICATION pub;

SELECT * FROM t1;



-- PUB (Port-9999)

INSERT INTO t1 VALUES (3, 30);



-- SUB (Port-8888)

SELECT * FROM t1;



--- SUB2 (Port-7777)

CREATA DATABASE subsription2;

\q

-- TO COPY TABLE t1 TO PORT-8888 :-    pg_dump -t -s publication -p 9999 | psql -p 7777 subscription2

-- psql -p 7777 -d subscription2

\d      -- To list Tables

CREATE SUBSCRIPTION sub2 CONNECTION 'host=localhost port=9999 dbname=publication' PUBLICATION pub;

SELECT * FROM t1;



-- PUB (Port-9999)

INSERT INTO t1 VALUES (4, 40);



-- SUB (Port-8888)

SELECT * FROM t1;



-- SUB2 (Port-7777)

SELECT * FROM t1;

