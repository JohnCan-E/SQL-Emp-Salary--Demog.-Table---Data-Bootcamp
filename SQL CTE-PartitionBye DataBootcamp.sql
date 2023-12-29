/*
CTE: Common Table Expression
*/

WITH CTE_Employee as 
(SELECT FirstName, LastName, Gend OVER( PARTITION BY Gender ) as TotalGender
,AVG (Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE Salary > '45000' 
)
SELECT FirstName, AvgSalary
FROM CTE_Employee 

