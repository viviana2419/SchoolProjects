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
 