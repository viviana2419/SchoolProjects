/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
 SELECT *
  FROM [SQLTutorial].[dbo].EmployeeSalary

SELECT *
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
  inner join SQLTutorial.dbo.EmployeeSalary
  --inner join, left outer, right outer, full outer join 
  on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
  where FirstName <>'Michael'
  order by Salary desc

  SELECT JobTitle,AVG(Salary)
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
  inner join SQLTutorial.dbo.EmployeeSalary
  --inner join, left outer, right outer, full outer join 
  on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
  where JobTitle='Salesman'
  group by JobTitle

  SELECT *
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
  union--combine everything with no duplicates
  --union all(everything including duplicates)
 SELECT *
  FROM [SQLTutorial].[dbo].EmployeeSalary

  SELECT FirstName, LastName, Age,
  case
	when Age=38 then 'stanley'
	when Age>30 then 'old'
	else 'baby'
  end
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
  WHERE Age is not null
  order by Age

  SELECT FirstName, LastName, JobTitle,Salary,
  case
	when JobTitle='Salesman' then Salary+(Salary*.10)
	when JobTitle='Accountant' then Salary+(Salary*.05)
	else Salary+(Salary*.03)
  end as SalaryAfterRaise
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
  join SQLTutorial.dbo.EmployeeSalary
  on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
 
 --1.29 Having clause
 SELECT JobTitle,avg(Salary)
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]
  join SQLTutorial.dbo.EmployeeSalary
  on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
  group by JobTitle
  having avg(Salary)>45000
  order by avg(Salary)

  --1.29 updating/deleting data
  SELECT *
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]

  update SQLTutorial.dbo.EmployeeDemographics
  set Age=31
  where FirstName='Toby' and LastName='Flenderson'

  delete from SQLTutorial.dbo.EmployeeDemographics
  where EmployeeID =1009

  --1.30 Aliasing
  SELECT FirstName +' '+LastName as FullName
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]

  SELECT demo.EmployeeID
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] as demo
  join SQLTutorial.dbo.EmployeeSalary as sal
  on demo.EmployeeID=sal.EmployeeID

  --1.30 partition by compare to group by
  SELECT FirstName, LastName, Gender, Salary, count(Gender) over(partition by Gender) as TotalGender
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] as demo
  join SQLTutorial.dbo.EmployeeSalary as sal
	on demo.EmployeeID=sal.EmployeeID

SELECT  Gender, count(Gender) 
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] as demo
  join SQLTutorial.dbo.EmployeeSalary as sal
	on demo.EmployeeID=sal.EmployeeID
  group by Gender

  --2.1 SQL Advance CTEs
  with CTE_Employee as
  (SELECT FirstName, LastName, Gender, Salary, count(Gender) over(partition by Gender) as TotalGender
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] as demo
  join SQLTutorial.dbo.EmployeeSalary as sal
	on demo.EmployeeID=sal.EmployeeID
	where Salary>'45000')

	select FirstName
	from CTE_Employee
--2.1 TEMP Tables
create table #temp_employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)

select*
from #temp_employee

insert into #temp_employee values(
'1001','hr','45000')
insert into #temp_employee
select*
from SQLTutorial.dbo.EmployeeSalary

drop table if exists #temp_employee2
create table #temp_employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

insert into #temp_employee2
SELECT JobTitle, COUNT(JobTitle),AVG(age),AVG(salary)
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] as demo
  join SQLTutorial.dbo.EmployeeSalary as sal
	on demo.EmployeeID=sal.EmployeeID
	group by JobTitle

select *
from #temp_employee2

--2.2: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM
select EmployeeID,TRIM(employeeID) as IDTRIM
from EmployeeErrors
select EmployeeID,LTRIM(employeeID) as IDTRIM
from EmployeeErrors
select EmployeeID,RTRIM(employeeID) as IDTRIM
from EmployeeErrors

--Using replace
select LastName, REPLACE(lastname,'- Fired','') as LastNameFixed
from EmployeeErrors

--using substring
Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN SQLTutorial.dbo.EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)

--using upper and lower
Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors

--2.3 stored procedures??similar to functions, set parameters and everyone could use it to get updated desired result
create procedure test 
as
select*
from SQLTutorial.dbo.EmployeeDemographics 

CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial.dbo.EmployeeDemographics  emp
JOIN SQLTutorial.dbo.EmployeeSalary  sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee
GO;
exec Temp_Employee

--2.4 subquery
select EmployeeID,Salary,(select AVG(salary) from SQLTutorial.dbo.EmployeeSalary) as AllAvgSalary
from SQLTutorial.dbo.EmployeeSalary
--subquery in from
select a.employeeID, AllAvgSalary
from (select EmployeeID,Salary,AVG(salary) over() as AllAvgSalary from SQLTutorial.dbo.EmployeeSalary) a
--subquery in where
select EmployeeID,Salary,JobTitle
from SQLTutorial.dbo.EmployeeSalary
where EmployeeID in (
	select EmployeeID
	from SQLTutorial.dbo.EmployeeDemographics
	where age>30)