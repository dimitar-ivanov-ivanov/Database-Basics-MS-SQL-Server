CREATE TABLE People(
 Id int UNIQUE IDENTITY NOT NULL,
 Name nvarchar(200) NOT NULL,
 Picture varbinary(MAX),
 Height float(2),
 Weight float(2),
 Gender char(1) NOT NULL,
 Birthdate  nvarchar(11) NOT NULL,
 Biography nvarchar(MAX),
 CONSTRAINT PK_PEOPLE PRIMARY KEY(Id),
 CONSTRAINT CK_PEOPLE_GENDER CHECK(Gender ='m' OR Gender ='f')
)

INSERT INTO People (Name,Picture,Height,Weight,Gender,Birthdate,Biography)
VALUES 
      ('Maria', 011010101, 1.64, 65.77, 'f', '1985/01/17', 'Marias Bio'),
	  ('Pesho', 010010101, 3.74, 23.45, 'm', '1977/02/1', 'Peshos Bio'),
	  ('Gosho', 001010101, 2.46, 77.65, 'm', '1999/25/2', 'Goshos Bio'),
	  ('Strahil', 000010101, 1.04, 23.77, 'm', '1987/12/3', 'Strahil Bio'),
	  ('Ginka', 111110101, 0.99, 34.93, 'f', '1982/04/4', 'Ginkas Bio')
