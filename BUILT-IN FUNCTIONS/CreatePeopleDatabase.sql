CREATE DATABASE People
GO
USE People
GO

CREATE TABLE People(
 Id int  NOT NULL,
 Name nvarchar(255) NOT NULL,
 Birthdate date NOT  NULL,
 CONSTRAINT PK_People PRIMARY KEY(Id)
)

INSERT INTO People(Id,Name,Birthdate)
VALUES
    (1,'Victor','20001207'),
	(2,'Steven','19920910'),
	(3,'Stphen','19100919'),
	(4,'John','20100106')
