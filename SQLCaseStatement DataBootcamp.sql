/*
Today's Topic : CASE Statement
*/

--SELECT FirstName,LastName, Age,
--CASE
--	When Age=38 THEN 'Stanley'
--	WHEN Age > 30 THEN 'Old'

--	ELSE 'Baby'
--END
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Where Age is NOT  NULL 
--Order BY Age DESC

SELECT FirstName,LastName,JobTitle,Salary,
CASE 
	WHEN JobTitle='Salesman' THEN Salary + (Salary* .10)
	When JobTitle='Accountant' THEN Salary + ( Salary*.05)
	When JobTitle='HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary*.03)
END AS SalaryAfterRaise
FROM [SQL Tutorial].dbo.EmployeeDemographics
Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
