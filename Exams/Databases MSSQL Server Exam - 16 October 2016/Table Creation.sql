CREATE TABLE CustomerReviews(
 ReviewID int PRIMARY KEY,
 ReviewContent varchar(255) NOT NULL,
 ReviewGrade int CHECK(ReviewGrade BETWEEN 0 AND 10),
 AirlineID int  FOREIGN KEY REFERENCES Airlines(AirlineID),
 CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE CustomerBankAccounts(
 AccountID int PRIMARY KEY,
 AccountNumber varchar(10) NOT NULL UNIQUE,
 Balance decimal(10,2) NOT NULL,
 CustomerID int FOREIGN KEY REFERENCES  Customers(CustomerID)
)