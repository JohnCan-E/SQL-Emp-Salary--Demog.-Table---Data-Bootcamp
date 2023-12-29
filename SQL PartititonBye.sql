/*
Partition By
*/

SELECT FirstName,LastName,Gender,Salary
, COUNT (GENDER) OVER (PARTITION BY Gender) as TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT  Gender , COUNT (Gender) 
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY Gender 
