INSERT INTO DepositTypes(DepositTypeID,Name)
VALUES
(1,'Time Deposit'),
(2,'Call Deposit'),
(3,'Free Deposit')

INSERT INTO Deposits(Amount,StartDate,EndDate,DepositTypeID,CustomerId)
(
 SELECT 
 CASE
  WHEN DateOfBirth > '01/01/1980' AND Gender = 'M' THEN 1100
  WHEN DateOfBirth > '01/01/1980' AND Gender = 'F' THEN 1200
  WHEN DateOfBirth <= '01/01/1980' AND Gender = 'M' THEN 1600
  WHEN DateOfBirth <= '01/01/1980' AND Gender = 'F' THEN 1700 
 END,
 GETDATE(),
 NULL,
 CASE
  WHEN CustomerID > 15 THEN 3
  WHEN CustomerID  % 2 = 1 THEN 1
  WHEN CustomerID  % 2 = 0 THEN 2
 END,
 CustomerID
 FROM Customers
)
 
INSERT INTO EmployeesDeposits(EmployeeID,DepositID)
VALUES
(15,4),
(20,15),
(8,	7),
(4,	8),
(3,	13),
(3,	8),
(4,	10),
(10,1),
(13,4),
(14,9)