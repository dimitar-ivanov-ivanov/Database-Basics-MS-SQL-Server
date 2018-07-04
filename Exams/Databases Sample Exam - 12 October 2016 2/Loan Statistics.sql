SELECT SUM(l.Amount) AS TotalLoanAmount,
MAX(l.Interest) AS MaxInterest,
MIN(e.Salary) AS MinEmployeeSalary  
FROM Loans AS l
JOIN EmployeesLoans AS el ON el.LoanID = l.LoanID
JOIN Employees AS e ON e.EmployeeID  = el.EmployeeID