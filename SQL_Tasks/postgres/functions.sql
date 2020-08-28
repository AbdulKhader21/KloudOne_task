---- FUNCTION TO PERFROM A SIMPLE SELECT QUERY ----

--CREATE TABLE
CREATE TABLE public.funtiontest
(
    id NUMERIC,
    name VARCHAR
);


-- INSERT STATEMENT & SELECT QUERY
INSERT INTO functiontest VALUES (1, 'ABDUL');
INSERT INTO functiontest VALUES (2, 'KHADER');

SELECT * FROM functiontest;


-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION public.get_data_table()
RETURNS TABLE (id NUMERIC, name VARCHAR)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
    SELECT id, name from functiontest;
END;
$$ ;


-- SELECT & VERIFY THE FUNCTION
SELECT * FROM get_data_table();
