CREATE TABLE Manufacturers(
 ManufacturerID int NOT NULL IDENTITY,
 Name varchar(50) NOT NULL,
 EstablishedOn date NOT NULL,
 CONSTRAINT PK_Manufacturers PRIMARY KEY (ManufacturerID)
)

CREATE TABLE Models(
 ModelID int NOT NULL IDENTITY,
 Name varchar(50) NOT NULL,
 ManufacturerID int NOT NULL,
 CONSTRAINT PK_Models PRIMARY KEY (ModelID),
 FOREIGN KEY(ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers(Name,EstablishedOn)
VALUES ('BMW','07-03-1916'),('Tesla','01-01-2003'),('Lada','01-05-1966')

INSERT INTO Models
VALUES 
     ('X1',1),
	 ('i6',1),
	 ('Model S',2),
	 ('Model X',2),
	 ('Model 3',2),
	 ('Nova',3)