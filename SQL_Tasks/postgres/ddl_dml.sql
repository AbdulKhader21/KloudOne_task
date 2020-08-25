-- TO CREATE A DATABASE
CREATE DATABASE test;


-- TO CREATE A SCHEMA
CREATE SCHEMA teachers;


-- TO SET THE SCHEMA
SET search_path TO teachers;


-- TO CREATE A TABLE
CREATE TABLE TeachersInfo
(
TeacherID int,
TeacherName varchar(255),
Address varchar(255),
City varchar(255),
PostalCode int,
Country varchar(255),
Salary int
);


-- TO ADD A NEW COLUMN IN THE TABLE
ALTER TABLE TeachersInfo
ADD DateOfBirth date;


-- TO INSERT INTO THE TABLE
INSERT INTO TeachersInfo(TeacherID, TeacherName, Address, City, PostalCode, Country, Salary) VALUES ('01', 'Saurav','Gangnam Street', 'Seoul', '06499', 'South Korea', '42000'); 
INSERT INTO TeachersInfo VALUES ('02', 'Preeti','Queens Quay', 'Rio Claro', '13500', 'Brazil', '45900');


-- UPDATE (TO MAKE CHANGES IN A ROW(S))
UPDATE TeachersInfo
SET TeacherName = 'Alfred', City= 'Frankfurt'
WHERE TeacherID = '01';


-- TO DELETE A ROW
DELETE FROM TeachersInfo WHERE TeacherName='Vinod';


-- SELECT...

-- ... ALL ROWS AND COLUMN
SELECT * FROM TeachersInfo;

-- ... PARTICULAR COLUMNS
SELECT Teachername, City FROM TeachersInfo;

-- ... DISTINCT (IGNORES DUPLICATES)
SELECT DISTINCT City FROM TeachersInfo;

-- ... ORDER BY (TO SORT)
SELECT * FROM TeachersInfo
ORDER BY Country; 

SELECT * FROM TeachersInfo
ORDER BY Country DESC;

SELECT * FROM TeachersInfo
ORDER BY Country, TeachersName;

SELECT * FROM TeachersInfo
ORDER BY Country ASC, TeachersName DESC;

-- ... GROUP BY
SELECT COUNT(TeacherID), Country
FROM TeachersInfo
GROUP BY Country
ORDER BY COUNT(TeacherID) DESC; -- DESC --> SORTING IN DESCENDING ORDER

-- ... HAVIN BY
SELECT COUNT(TeacherID), Country
FROM TeachersInfo
GROUP BY Country
HAVING COUNT(Salary) > 40000 ;


-- RENAME

-- RENAME A TABLE
ALTER TABLE table_name RENAME TO new_table_name;

-- RENAME A COLUMN
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;


-- TRUNCATE (DELETES ALL VALUES IN THE TABLE, BUT NOT THE TABLE)
TRUNCATE TABLE TeachersInfo;


-- DROP (DELETES THE WHOLE TABLE FROM THE DATABASE)
DROP TABLE TeachersInfo;
