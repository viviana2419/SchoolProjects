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