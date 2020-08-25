CREATE OR REPLACE PROCEDURE studentsCity @SCity varchar(8000)
AS
BEGIN
SELECT * FROM studentsInfo
WHERE city = @SCity
GO
END

SELECT * FROM studentsInfo
EXEC studentsCity @SCity = 'Bangalore'
