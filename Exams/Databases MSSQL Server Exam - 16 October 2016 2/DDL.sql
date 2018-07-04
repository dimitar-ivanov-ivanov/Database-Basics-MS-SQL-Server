CREATE DATABASE AirplanesDatabase
GO
USE AirplanesDatabase
GO

CREATE TABLE Towns(
 TownID int,
 TownName varchar(30) NOT NULL,
 CONSTRAINT PK_Towns PRIMARY KEY(TownID)
)

CREATE TABLE Airports(
 AirportID int,
 AirportName varchar(50) NOT NULL,
 TownID int NOT NULL,
 CONSTRAINT PK_Airports PRIMARY KEY(AirportID),
 CONSTRAINT FK_Airports_Towns FOREIGN KEY(TownID)
 REFERENCES Towns(TownID)
)

CREATE TABLE Airlines(
 AirlineID int,
 AirlineName varchar(30) NOT NULL,
 Nationality varchar(30) NOT NULL,
 Rating int DEFAULT(0),
 CONSTRAINT PK_Airlines PRIMARY KEY(AirlineID)
)

CREATE TABLE Customers(
 CustomerID INT,
 FirstName varchar(20) NOT NULL,
 LastName varchar(20) NOT NULL,
 DateOfBirth date NOT NULL,
 Gender char(1) CHECK(Gender IN('M','F')),
 HomeTownID INT NOT NULL,
 CONSTRAINT PK_Customers PRIMARY KEY(CustomerID),
 CONSTRAINT FK_Customers_Towns FOREIGN KEY(HomeTownID)
 REFERENCES Towns(TownID)
)

CREATE TABLE Flights(
 FlightID INT,
 DepartureTime DATETIME NOT NULL,
 ArrivalTime DATETIME NOT NULL,
 Status varchar(9) 
 CHECK(Status IN('Departing','Delayed','Arrived','Cancelled')),
 OriginAirportID INT NOT NULL,
 DestinationAirportID INT NOT NULL,
 AirlineID INT NOT NULL,
 CONSTRAINT PK_Flights PRIMARY KEY(FlightID),
 CONSTRAINT FK_Flights_Airports FOREIGN KEY(OriginAirportID)
 REFERENCES Airports(AirportID),
 CONSTRAINT FK_Flights_Airports2 FOREIGN KEY(DestinationAirportID)
 REFERENCES Airports(AirportID),
 CONSTRAINT FK_Flights_Airlines FOREIGN KEY(AirlineID)
 REFERENCES Airlines(AirlineID)
)

CREATE TABLE Tickets(
 TicketID INT,
 Price decimal(8,2) NOT NULL,
 Class varchar(6) CHECK(Class IN ('First','Second','Third')),
 Seat varchar(5) NOT NULL,
 CustomerID int NOT NULL,
 FlightID int NOT NULL,
 CONSTRAINT PK_Tickets PRIMARY KEY(TicketID),
 CONSTRAINT FK_Tickets_Customers FOREIGN KEY(CustomerID)
 REFERENCES Customers(CustomerID),
 CONSTRAINT FK_Tickets_Flights FOREIGN KEY(FlightID)
 REFERENCES Flights(FlightID),
)



INSERT INTO Towns(TownID, TownName)
VALUES
(1, 'Sofia'),
(2, 'Moscow'),
(3, 'Los Angeles'),
(4, 'Athene'),
(5, 'New York')

INSERT INTO Airports(AirportID, AirportName, TownID)
VALUES
(1, 'Sofia International Airport', 1),
(2, 'New York Airport', 5),
(3, 'Royals Airport', 1),
(4, 'Moscow Central Airport', 2)

INSERT INTO Airlines(AirlineID, AirlineName, Nationality, Rating)
VALUES
(1, 'Royal Airline', 'Bulgarian', 200),
(2, 'Russia Airlines', 'Russian', 150),
(3, 'USA Airlines', 'American', 100),
(4, 'Dubai Airlines', 'Arabian', 149),
(5, 'South African Airlines', 'African', 50),
(6, 'Sofia Air', 'Bulgarian', 199),
(7, 'Bad Airlines', 'Bad', 10)

INSERT INTO Customers(CustomerID, FirstName, LastName, DateOfBirth, Gender, HomeTownID)
VALUES
(1, 'Cassidy', 'Isacc', '19971020', 'F', 1),
(2, 'Jonathan', 'Half', '19830322', 'M', 2),
(3, 'Zack', 'Cody', '19890808', 'M', 4),
(4, 'Joseph', 'Priboi', '19500101', 'M', 5),
(5, 'Ivy', 'Indigo', '19931231', 'F', 1)
