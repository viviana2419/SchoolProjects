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