CREATE TABLE Teachers(
 TeacherID int NOT NULL,
 ManagerID int,
 Name varchar(50) NOT NULL,
 CONSTRAINT PK_Teachers PRIMARY KEY(TeacherID),
 CONSTRAINT FK_Teachers_Managers 
 FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)
 )

 INSERT INTO Teachers (TeacherID,Name,ManagerID)
 VALUES (101,'John',NULL),
        (102,'Maya',106),
		(103,'Silvia',106),
		(104,'Ted',105),
		(105,'Mark',101),
		(106,'Greta',101)

