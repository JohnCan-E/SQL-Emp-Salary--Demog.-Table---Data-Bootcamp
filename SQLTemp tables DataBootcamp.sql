/*
Temp Tables :
*/

--CREATE TABLE  #temp_Employee (
--EmployeeID int ,
--JobTitle varchar (100),
--Salary int
--)


--SELECT *
--FROM #temp_Employee

--INSERT INTO #temp_Employee VALUES (
--'1001' , 'HR' , ' 45000 '
--)


--INSERT INTO #temp_Employee 
--SELECT * 
--FROM  [SQL Tutorial]..EmployeeSalary

DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2 (
JobTitle varchar (50),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int )

INSERT #Temp_Employee2 
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM [SQL Tutorial]..EmployeeDemographics
JOIN [SQL Tutorial]..EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
Group BY JobTitle

SELECT *
FROM #Temp_Employee2