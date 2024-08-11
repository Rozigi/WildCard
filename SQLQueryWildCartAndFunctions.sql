/**Friday 9th of August 2024.
---Cover 
--- 1, Add more Functions.
---2, Cover temporary Tables and Global Tables.
---3, CTE 
---4, Date Functions.
---5, Expand more on StoreProcedure and Parameters.
---6, SQL Joins.
---7, ERD.

---Assighnment for Tuesday 6th of August 2024
---Watch Youtube Videos on Data warehouse vs Data Mart.
---Watch Videos on DataBase Index.
**/


--UpperCase i'e to capitalise a row


SELECT [Name]
      ,Upper (Type) as Type_Cap
	  ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTraining].[dbo].[Movies]  


  
SELECT[Name]
      ,[Type]
	   ,Lower (Rating) as Type_Low
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTraining].[dbo].[Movies]



  
SELECT,[Name]
      ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTraining].[dbo].[Movies]


  
SELECT,[Name]
      ,[Type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SqlTraining].[dbo].[Movies]

USE SQLTrainingCase 
SELECT  [EmployeeID]
		,UPPER (LastName+ ' '+FirstName+' '+MiddleName)	AS EmployeeName
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
	  INTO NewEmployee
  FROM [SQLTrainingCase].[dbo].[Employee]

SELECT * 
FROM NewEmployee

SELECT  [EmployeeID]
,Substring(EmployeeName, 1, 8) As EMpName_String
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
  FROM [SQLTrainingCase].[dbo].[NewEmployee]

	---TEMP TABLES
	----To Creat a Temp Table add #
	---These table are accessible in the current session

SELECT  [EmployeeID]
,Substring(LastName, 1, 4) As LastName_String
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
	   INTO #Employee_String
  FROM [SQLTrainingCase].[dbo].[Employee]

  --Check Temp Table 
  SELECT * 
  FROM  #Employee_String

  ---Global TABLES
	----To Creat a Temp Table add 2 ##
	---These table are accessible in the other session

	
SELECT  [EmployeeID]
,Substring(LastName, 1, 4) As LastName_String
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[JobID]
      ,[ManagerID]
      ,[HireDate]
      ,[Salary]
      ,[Comm]
      ,[DepartmentID]
	  INTO ##Employee_String
  FROM [SQLTrainingCase].[dbo].[Employee]

  
  --Check Temp Table 
  SELECT * 
  FROM  #Employee_String


