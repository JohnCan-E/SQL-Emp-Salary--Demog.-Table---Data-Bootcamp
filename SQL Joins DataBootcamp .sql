/*
Inner joins ,Fiull/left/Right Outer Joins 
*/

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT JobTitle,AVG(Salary)
FROM[SQL Tutorial].dbo.EmployeeDemographics
 Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
 ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
 Where JobTitle='Salesman'
 Group BY JobTitle
	 