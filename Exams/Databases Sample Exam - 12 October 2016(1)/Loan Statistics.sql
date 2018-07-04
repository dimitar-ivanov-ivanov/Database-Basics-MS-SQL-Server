SELECT SUM(l.Amount) AS TotalLoanAmount,
MAX(l.Interest) AS MaxInterest,
MIN(e.Salary) AS MinEmployeeSalary
FROM Employees AS e
JOIN EmployeesLoans AS el ON el.EmployeeID = e.EmployeeID
JOIN Loans AS l ON l.LoanID = el.LoanID