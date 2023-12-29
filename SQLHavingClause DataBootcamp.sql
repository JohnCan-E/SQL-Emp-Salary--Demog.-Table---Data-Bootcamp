/*
Having Clause
*/

SELECT JobTitle, AVG (Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics
Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING  AVG(Salary) >45000
ORDER BY AVG (Salary)

