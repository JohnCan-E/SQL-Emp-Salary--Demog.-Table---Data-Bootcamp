/* 
Stored Procedures
*/

--CREATE PROCEDURE TEST
--AS 
--Select *
--FROM EmployeeDemographics

--EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #Temp_Employee (
JobTitle varchar (50),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int )

INSERT #Temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM [SQL Tutorial]..EmployeeDemographics
JOIN [SQL Tutorial]..EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
Group BY JobTitle


Select *
From #Temp_Employee

EXEC Temp_Employee
