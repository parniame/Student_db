DROP TABLE dbo.Student;
CREATE TABLE dbo.Student (
    ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
    LevelOFEducation INT NOT NULL,
    SchoolName varchar(100) NOT NULL,
	Gender BIT NOT NULL,
	GPA DECIMAL(4,2) NOT NULL,
	Score DECIMAL(5,2) NOT NULL
);

DECLARE @i int = 0;
DECLARE @num INT = ROUND(RAND()*3,0) + 1;
DECLARE @name varchar(50) =  CHOOSE(@num, 'Ali','Reza','Mohammad','Parnia');
DECLARE @nameOfSchool varchar(50) =  CHOOSE(@num, 'Maktab','Nehzat','Danesh','Salam') ;
DECLARE @Gender bit = ROUND(RAND(),0);
DECLARE @GPA FLOAT ;
DECLARE @Score FLOAT ;
WHILE @i < 50 -- insert 100 rows.  change this value to whatever you want.
BEGIN
	
	SET @GPA  = RAND()*20;
	SET @Score  = RAND()*100;
	INSERT dbo.Student  VALUES(@name,'lastname' + 'ii',FLOOR(RAND()*(12-9+1)+9),@nameOfSchool
	,@Gender,@GPA,@Score);
	
	SET @i = @i + 1;
	SET @num  = ROUND(RAND()*3,0) + 1;
	SET @name = CHOOSE(@num, 'Ali','Reza','Mohammad','Parnia');
	SET	 @nameOfSchool  =  CHOOSE(@num, 'Maktab','Nehzat','Danesh','Salam') ;
	SET @Gender = ~@Gender;

END

--SELECT * FROM dbo.Student;
--SELECT FirstName,LastName,LevelOFEducation,GPA FROM dbo.Student;
--SELECT FirstName,LastName,GPA FROM dbo.Student
--WHERE GPA <12;
UPDATE dbo.Student SET Score = 0;
--SELECT * FROM dbo.Student
--WHERE LevelOFEducation IN (10,11,12) AND GPA  >= 18 AND GPA <=19;
UPDATE  dbo.Student SET Score = 1
WHERE LevelOFEducation IN (10,11,12) AND GPA  >= 18 AND GPA <=19;
--SELECT * FROM dbo.Student
--WHERE LevelOFEducation = 9  AND Gender = 0 
--AND FirstName IN ('Reza','Ali');
DELETE dbo.Student
WHERE Score = 0 AND LevelOFEducation < 12;
SELECT * FROM dbo.Student;