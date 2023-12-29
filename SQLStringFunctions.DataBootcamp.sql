/* 
String Functions, - TRIM, LTRIM, Replace, Substring, Upper, Lower

*/

--Drop TAble EmployeeErrors;

--CREATE TABLE EmployeeErrors (
--EmployeeID varchar (50),
--FirstName varchar (50),
--LastName varchar (50)
--)

Insert Into  EmployeeErrors VALUES 
('1001', 'Jimbo' , 'Halbert'),
('   1002', 'Pamela' , 'Beasley'),
('1005', 'TOby' , 'Flenderson-Fired')

Select * 
From EmployeeErrors

---Using Trim, LTRIM, RTRIM

--SELECT EmployeeID, TRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, RTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, LTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--Using  Replace 

--SELECT LastName  , Replace (LastName, '-Fired', ' ' ) as LastNameFix
--From EmployeeErrors 

-- Using substring 
--SELECT SUBSTRING  (FirstName, 3, 3) 
--From EmployeeErrors 

--Select Substring(err.EmployeeErrors.FirstName,1,3 ), Substring(dem.FirstName,1,3)
--from  EmployeeErrors err
--Join EmployeeDemographics dem
--	ON SUBSTRING (err.FirstName, 1 , 3) = Substring(dem.FirstName,1,3)

-- using  Upper  and Lower

Select FirstName , Lower (FirstName)
From EmployeeErrors

Select FirstName , Upper (FirstName)
From EmployeeErrors