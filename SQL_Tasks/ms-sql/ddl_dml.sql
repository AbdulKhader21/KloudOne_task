-- CREATE DATABASE
CREATE DATABASE students


-- LIST ALL THE DATABASES
SELECT Name from sys.Databases
GO

-- TO SWITCH TO PARTICULAR DATABASE
USE students

-- CREATE TABLE
CREATE TABLE studentsInfo
(
    studentID INT,
    studentName VARCHAR(8000),
    parentName VARCHAR(8000),
    phoneNumber BIGINT,
    student_address VARCHAR(8000),
    city VARCHAR (8000),
    country VARCHAR (8000)
)
GO


-- ALTER TABLE

-- ADD COLUMN
ALTER TABLE studentsInfo ADD bloodGroup VARCHAR(8000)
ALTER TABLE studentsInfo ADD dateOfBirth DATETIME;

-- TO CHANGE THE DATATYPE OF A COLUMN
ALTER TABLE studentsInfo ALTER COLUMN dateOfBirth DATE

-- DROP COLUMN
ALTER TABLE studentsInfo DROP COLUMN bloodGroup


-- INSERT INTO
INSERT INTO studentsInfo VALUES
(
    '01', 'Abdul', 'Mohamed', '987654321', '#1, XYZ Street', 'Bangalore', 'India', '1997-03-21'
)


-- SELECT QUERY 
SELECT * FROM studentsInfo      -- ALL ROWS FROM THE COLUMN
SELECT studentID, studentName FROM studentsInfo     -- PARTICULAR COLUMNS 
SELECT DISTINCT city FROM studentsInfo      -- IGNORES DUPLICATE VALUES
SELECT * FROM studensInfo ORDER BY parentName;      -- SORT USING PARENTNAMES
SELECT COUNT(studentsID), city FROM studentsInfo GROUP BY city      -- GROUP BY CLAUSE
SELECT COUNT(studentsID), city FROM studentsInfo GROUP BY city HAVING COUNT(studentsID) = 1     -- HAVING BY CLAUSE
SELECT studentID, studentName, count(city) FROM studentsInfo GROUP BY GROUPING SETS ((studentID, studentName, City), (studentID), (studentName), (city))      -- GROUPING SET
SELECT * INTO studentsInfoBackup FROM studentsInfo      -- TO CREATE A BACKUP OF THE TABLE


-- TRUNCATE TABLE (DELETES ALL VALUES IN THE TABLE, BUT NOT THE TABLE)
TRUNCATE TABLE studentsInfo


-- DROP TABLE (DELETES WHOLE TABLE FROM THE DATABASE)
DROP TABLE studentsInfo


-- RENAME THE TABLE
sp_rename 'studentsInfo', 'infoStudents'
