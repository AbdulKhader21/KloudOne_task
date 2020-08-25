-- CREATE TABLE
CREATE TABLE employee
(
    fname VARCHAR,
    lname VARCHAR,
    ssn NUMERIC(9) UNIQUE,
    dob DATE,
    gender VARCHAR,
    salary NUMERIC
);


-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION auditlogfunc()
RETURNS TRIGGER
AS $$
BEGIN
    INSERT INTO audit
    (
        emp_id, entry_date
    )
    VALUES
    (
        new.ssn, CURRENT_TIMESTAMP
    );
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql' ;


-- CREATE TRIGGER
CREATE TRIGGER example_trigger
AFTER INSERT ON  employee FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();


-- INSERT INTO employee TABLE
INSERT INTO employee
VALUES
(
    'Abdul', 'Khader', 123456789, '1997-03-21', 'Male', 10000
);


-- SELECT QUERY FROM employee TABLE
SELECT * FROM employee;


-- SELECT QUERY FROM audit TABLE 
SELECT * FROM audit;
