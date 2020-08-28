--------------------------------------------
---- STORED PROCEDURE TO INSERT A QUERY ----
--------------------------------------------

-- CREATE TABLE & SELECT QUERY
CREATE TABLE public.test_proc
(
    id NUMERIC,
    name VARCHAR
);

SELECT * FROM test_proc;


-- CREATE PROCEDURE
CREATE PROCEDURE insert_test (NUMERIC, VARCHAR)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO test_proc (id, name)
    VALUES ($1, $2)
    COMMIT;
END;
$$ ;


-- CALL THE PROCEDURE TO INSERT VALUES IN THE CONCERNED TABLE
CALL insert_test (1, 'One');

CALL insert_test (2, 'Two');


-- SELECT QUERY TO CHECK THE OPERATION
SELECT * FROM test_proc;




----------------------------------------------------------
---- STORED PROCEDURE TO INSERT A QUERY IN TWO TABLES ----
----------------------------------------------------------

-- CREATE TWO TABLES WITH JUST ONE COLUMN IN EACH & SELECT QUERY FOR BOTH
CREATE TABLE tbl1 (id INTEGER);
SELECT * FROM tbl1;

CREATE TABLE tbl2 (id INTEGER);
SELECT * FROM tbl2;


-- CREATE PROCEDURE
CREATE PROCEDURE insert_values (x INTEGER, y INTEGER)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO tbl1 VALUES (x);
    INSERT INTO tbl2 VALUES (y);    
END;
$$ ;


-- CALL THE PROCEDURE AND CHECK THE OPERATION BY SELECT QUERY
CALL insert_values (10, 55);

SELECT * FROM tbl1;

SELECT * FROM tbl2;




-----------------------------------------------------------
---- STORED PROCEDURE TO PERFORM ARITHMETIC OPERATIONS ----
-----------------------------------------------------------

-- CREATE PROCEDURE
CREATE OR REPLACE PROCEDURE public.test_proc
(
    num1 NUMERIC, num2 NUMERIC
)
LANGUAGE 'plpgsql'
AS $$
DECLARE
n_sum NUMERIC;
n_mult NUMERIC;
n_div NUMERIC;
BEGIN
        n_sum := num1 + num2;
        n_mult := num1 * num2;
        BEGIN       -- EXCEPTION HANDLING FOR ZERO DIVISION ERROR
            n_div := num1 / num2;
            EXCEPTION WHEN OTHERS THEN
            n_div := 0; 
        END;
        RAISE NOTICE 'The Sum is : %', n_sum;
        RAISE NOTICE 'The Multiplication is : %', n_mult;
        RAISE NOTICE 'The Division is : %', n_div;
END;
$$ ;


-- CALL THE PROCEDURE TO PERFORM THE ARITHMETIC OPERATION
CALL test_proc (10, 5);


-- CALLING THE ABOVE PROCEDURE TO CHECK EXC. HANDLING - ZERO ERROR
CALL test_proc (2, 0);




----------------------------------------------------
---- STORED PROCEDURE TO DISPLAY A TEXT/MESSAGE ----
----------------------------------------------------

-- CREATE PROCEDURE
CREATE PROCEDURE proc_displayText (msg INOUT TEXT)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RAISE NOTICE '%', msg;
END;
$$ ;

-- CALL PROCEDURE
CALL proc_displayText ('Hello')

CALL proc_displayText('Welcome')




--------------------------------------------------------------------------------------------------
---- STORED PROCEDURE TO PERFORM ARITHMETIC OPERATIONS USING 'IN' & 'INOUT' WITHOUT 'DECLARE' ----
--------------------------------------------------------------------------------------------------

-- CREATE PROCEDURE
CREATE OR REPLACE PROCEDURE public.test_proc
(
    n_num1 IN NUMERIC, n_num2 IN NUMERIC, n_sum INOUT NUMERIC, n_mult INOUT NUMERIC, n_div INOUT NUMERIC
)
LANGUAGE 'plpgsql'
AS $$
BEGIN
        n_sum := n_num1 + n_num2;
        n_mult := n_num1 * n_num2;
        BEGIN       -- EXCEPTION HANDLING FOR ZERO DIVISION ERROR
            n_div := n_num1 / n_num2;
            EXCEPTION WHEN OTHERS THEN
            n_div := 0; 
        END;
        RAISE NOTICE 'The Sum is : %', n_sum;
        RAISE NOTICE 'The Multiplication is : %', n_mult;
        RAISE NOTICE 'The Division is : %', n_div;
END;
$$ ;


-- CALL THE PROCEDURE TO PERFORM THE ARITHMETIC OPERATION
CALL test_proc (10, 5, NULL ,NULL, NULL);


-- CALLING THE ABOVE PROCEDURE TO CHECK EXC. HANDLING - ZERO ERROR
CALL test_proc (2, 0, NULL ,NULL, NULL);




