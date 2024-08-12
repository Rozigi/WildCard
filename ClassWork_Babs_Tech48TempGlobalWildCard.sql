/**
**Functions
-uper case
-lower case
-ubstring
-Trims
-
**/
--UPPER CASE
--Q1- make the values in the field 'type' capital letters - incase you want to join 2 tables and one is capital lettered you change the other to match the same case
SELECT [No]
   ,upper(type) as Type_cap
   ,[Name]
      ,[type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SQLTrainning].[dbo].[Movies]


  --LOW CASE
  --Q1- make the values in the field 'stars' lower letters letters
  SELECT [No]
  ,lower(Stars) as stars_low
      ,[Name]
      ,[type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SQLTrainning].[dbo].[Movies]

  update [SQLTrainning].[dbo].[Movies]
  set stars= lower(Stars) 
  where stars = 'cruise'

  --SUBSTRING
  --used to determine the location of a value of a record, eg in drama if you anly want to show DRA and not the whole DRAMA
  --Q1- make the values in the field 'stars' lower letters letters 
  --(1,3) it starts from number 1 and the 3rd number

  SELECT [No]
  ,substring (type, 1,2) as Type_string
      ,[Name]
      ,[type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SQLTrainning].[dbo].[Movies]

  --Wild cars- used for pattern searching
  --show only stars that name starts with C
  SELECT [No]
      ,[Name]
      ,[type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SQLTrainning].[dbo].[Movies]
  where stars like 'c%'

  --show only stars that name ends with E (then percentage comes before the letter)
  SELECT [No]
      ,[Name]
      ,[type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SQLTrainning].[dbo].[Movies]
  where stars like '%e'

  /* Next class 8/9/24
  --Trims*/

  SELECT [No]
      ,[Name]
      ,[type]
      ,[Rating]
      ,[Stars]
      ,[Qty]
      ,[Price]
  FROM [SQLTrainning].[dbo].[Movies]

  SELECT TOP (1000) [EMPLOYEEID]
      ,(Lastname + ' ' + Firstname + ' ' + middlename) as employeename
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  FROM [SQLTraining].[dbo].[EMPLOYEE]


  -- to change all the selected fields to Upper case
  --the + is to join while '' is to give space in between between  
  --(concatenate)- also mean adding, joining

  SELECT TOP (1000) [EMPLOYEEID]
      ,upper((Lastname + ' ' + Firstname + ' ' + middlename)) as employeename
	  ,upper((Lastname + Firstname + middlename)) as employeename2
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
	  ,AVG (((salary)))
      ,[COMM]
      ,[DEPARTMENTID]
  FROM [SQLTraining].[dbo].[EMPLOYEE]

  --show first 4 letter in last name
  --create a new table as employeeString
  
  SELECT [EMPLOYEEID]
      ,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
	  into Employee_String1
  FROM [SQLTraining].[dbo].[EMPLOYEE]

  ---join table Employee-strings Lastname_strings to Employee table Lastname (just where the 2 tables match)
  select *
  from Employee_String1 as ES
  join EMPLOYEE as E
  on substring (ES.Lastname_string, 1,5) = substring (E.Lastname, 1,5)

   ---join table Employee-strings lastname to Employee table Lastname
  select *
  from Employee_String as ES
  join EMPLOYEE as E
  on ES.Lastname = E.LASTNAME

  /**
  --union all show all records on both tables, but the tables have to have same colum fro it to work,
  hence why we added the table structure on both command
  while union
  **/
  select [EMPLOYEEID]
      --,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  from Employee_String
  union all
  select [EMPLOYEEID]
      --,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  from EMPLOYEE
  -- union eradicated duplicated 
  select [EMPLOYEEID]
      --,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  from Employee_String
  union 
  select [EMPLOYEEID]
      --,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  from EMPLOYEE
  select *
  from Employee_String1
  
  ------adding a Derived column when combinning 2 tables using union or union all clause
  ------ ' ' creates fake column/ derived / made up column
  ---u can put distinct on both or one it doesnt mater

  select [EMPLOYEEID]
  --, 'employee_string ' as tableName
     --,Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  from Employee_String
  union 
  select [EMPLOYEEID]
     -- , 'employee ' as tableName
     -- ,' ' as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
  from EMPLOYEE

--Temporary Table
----temp tables are accessible in the current session 
--to create a temp table, you add pound (#)
--put the # infront of the table name no space
SELECT [EMPLOYEEID]
      ,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
	  into #Employee_String
  FROM [SQLTraining].[dbo].[EMPLOYEE]

  select *
  From #Employee_String

--global table
----temp tables are accessible in the other sessions 
--to create a Global table, you add 2 pound (##)
--put the ## infront of the table name no space
SELECT [EMPLOYEEID]
      ,substring (Lastname, 1,5) as Lastname_string
      ,[LASTNAME]
      ,[FIRSTNAME]
      ,[MIDDLENAME]
      ,[JOBID]
      ,[MANAGERID]
      ,[HIREDATE]
      ,[SALARY]
      ,[COMM]
      ,[DEPARTMENTID]
	  into ##Employee_String
  FROM [SQLTraining].[dbo].[EMPLOYEE]

  select *
  From ##Employee_String


  /**
  --Assignment
  1 - Create from (noble,employeinfo, word, games, companyinfo, businesstable) - temporary table and global table
  2 - from any of the tables, create substrings, combine 2 column together, show values as lower case and upper case
  3 - create substring using 1 and 6 and join the tables together - if you pick noble make it (table name- noble_substring) substrings of 6
  4 - Once table is created join the table to the originaltable join noble_substring to noble
  5 - create a union and union all of the tables
  */

 --1 - Create from (noble,employeinfo, word, games, companyinfo, businesstable) - temporary table and global table
 --A--Temporary Tables
 --EmployeeInfo Temp Table
SELECT [First_Name]
      ,[Last_Name]
      ,[Employees]
	  INTO #EmployeeInfo
  FROM [SqlTraining].[dbo].[EmployeeInfo]

--CompanyInfo Temp Table
  SELECT[First_Name]
      ,[Last_Name]
      ,[Country]
	  INTO #CompanyInfo
  FROM [SqlTraining].[dbo].[CompanyInfo]

  --Games Temporary Table
  SELECT [Year]
      ,[City]
	  INTO #Games
  FROM [SqlTraining].[dbo].[Games]

  --Noble Temp Table
  SELECT [Year]
      ,[Subject]
      ,[Winner]
	  INTO #Noble
  FROM [SqlTraining].[dbo].[Noble]

   --CarDealer Temporary Table
  SELECT [CarID]
      ,[Make]
      ,[Model]
      ,[Price]
      ,[StoreLocation]
      ,[CustomerID]
	INTO #CarDeal
  FROM [SqlTraining].[dbo].[CarDealerCar]


  ---Global Tables
--EmployeeInfo Global Table
SELECT [First_Name]
      ,[Last_Name]
      ,[Employees]
	  INTO ##EmployeeInfo
  FROM [SqlTraining].[dbo].[EmployeeInfo]

  --CompanyInfo Global Taable
  SELECT[First_Name]
      ,[Last_Name]
      ,[Country]
	  INTO ##CompanyInfo
  FROM [SqlTraining].[dbo].[CompanyInfo]

  --Games Global Table
    SELECT [Year]
      ,[City]
	  INTO ##Games
  FROM [SqlTraining].[dbo].[Games]

  Select *
  FROM  ##Games

  --Noble Global Table
  SELECT [Year]
      ,[Subject]
      ,[Winner]
	  INTO ##Noble
  FROM [SqlTraining].[dbo].[Noble]

  --CarDeal Global Table
    SELECT [CarID]
      ,[Make]
      ,[Model]
      ,[Price]
      ,[StoreLocation]
      ,[CustomerID]
	INTO ##CarDeal
  FROM [SqlTraining].[dbo].[CarDealerCar]


 ---2 - from any of the tables, create Concatenate, combine 2 column together, show values as lower case and upper case
--Combine First and last Name Into Upper_Case With The Names Together
 SELECT [First_Name]
      ,[Last_Name]
	   ,UPPER (First_Name +' ' + Last_Name) AS Employee_Name
      ,[Employees]
	  FROM [SqlTraining].[dbo].[EmployeeInfo]

--Combine First and last Name Into Lower_Case With The Names Together
	   SELECT [First_Name]
      ,[Last_Name]
	   ,LOWER (First_Name +' ' + Last_Name) AS Employee_Name
      ,[Employees]
	  FROM [SqlTraining].[dbo].[EmployeeInfo]

--Combine Year and City Into Upper_Case
SELECT [Year]
      ,[City]
	,(Year +' ' + City)
  FROM [SqlTraining].[dbo].[Games]

--1st change Data Type to Int cos of error message----Conversion failed when converting the varchar value 'Sydney' to data type int.
--Duplicate Table then change Data Type
  SELECT [Year]
      ,[City]
	  INTO Games2
  FROM [SqlTraining].[dbo].[Games]

  SELECT *
  FROM Games2

--Change Data Type
  ALTER TABLE Games2
  ALTER COLUMN Year VARCHAR (50)

---Showing Upper 
  SELECT [Year]
      ,[City]
	,UPPER (Year +' ' + City) AS CityYear
  FROM [SqlTraining].[dbo].[Games2]

  ---Showing LowerCase 
  SELECT [Year]
      ,[City]
	,Lower (Year +' ' + City) AS CityYear
  FROM [SqlTraining].[dbo].[Games2]

     --Combine Year and Subject Into Lower_Case
  SELECT [Year]
      ,[Subject]
      ,[Winner]
	   ,Upper (Winner + '-' + Subject) AS Subject_Winner
	   FROM [SqlTraining].[dbo].[Noble]

 ---Combine Make and Model To Show Type Of Car in UpperCase
  SELECT [CarID]
      ,[Make]
      ,[Model]
	  ,UPPER (Make+' '+Model) AS TypeOfCar
      ,[Price]
      ,[StoreLocation]
      ,[CustomerID]
  FROM [SqlTraining].[dbo].[CarDealerCar]

---3 - create substring using 1 and 6 and join the tables together - if you pick noble make it (table name- noble_substring) substrings of 6
---Create Newtable
 SELECT [Year]
      ,[Subject]
      ,[Winner]
	  ,(Subject + Winner) As Subject_Winner
	  INTO Noble_Substring
  FROM [SqlTraining].[dbo].[Noble]
  

  DROP TABLE IF EXISTS Noble_Substring 
  SELECT *
FROM Noble_Substring

 SELECT *
FROM Noble



 SELECT [Year]
      ,[Subject]
      ,[Winner]
	  ,(Subject + Winner) As Subject_Winner
	  ,Substring (Subject_Winner, 1, 6) AS NobleString
  FROM [SqlTraining].[dbo].[Noble_Substring]

---4 - Once table is created join the table to the originaltable join noble_substring to noble

SELECT *
FROM Noble AS N
JOIN Noble_Substring AS NS
ON N.Year = NS.Year