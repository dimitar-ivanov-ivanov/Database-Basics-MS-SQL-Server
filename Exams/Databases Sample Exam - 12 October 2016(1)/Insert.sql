INSERT INTO DepositTypes(DepositTypeID,Name)
VALUES
(1,	'Time Deposit'),
(2,	'Call Deposit'),
(3,	'Free Deposit')

INSERT INTO Deposits(Amount,StartDate,EndDate,DepositTypeID,CustomerID)
(
 SELECT
 CASE 
  WHEN DateOfBirth > '1980/01/01' AND Gender = 'M' THEN 1000 + 100
  WHEN DateOfBirth > '1980/01/01' AND Gender = 'F' THEN 1000 + 200
  WHEN DateOfBirth <= '1980/01/01' AND Gender = 'M' THEN 1500 + 100
  WHEN DateOfBirth <= '1980/01/01' AND Gender = 'F' THEN 1500 + 200
 END,
 GETDATE(),
 NULL,
 CASE
  WHEN CustomerID > 15  THEN 3
  WHEN CustomerID % 2 != 0 THEN 1
  WHEN CustomerID % 2 = 0 THEN 2   
 END,
 CustomerID
 FROM Customers
 WHERE CustomerID < 20
)

INSERT INTO EmployeesDeposits(EmployeeID,DepositID)
VALUES
(15,4),
(20,15),
(8,7),
(4,8),
(3,13),
(3,8),
(4,10),
(10,1),
(13,4),
(14,9)