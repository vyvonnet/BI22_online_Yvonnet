--a 
SELECT BusinessEntityID, LoginID
FROM [HumanResources].[Employee]
WHERE Gender = 'F' AND Birthdate > '1969-01-29';

--b
SELECT DISTINCT [PersonType]
FROM Person.Person
WHERE (LastName LIKE 'M%' OR LastName LIKE 'N%') AND [MiddleName] is NOT NULL

--c
SELECT [DiscountPct]
FROM [Sales].[SpecialOffer]
WHERE [StartDate] BETWEEN '2013-01-01' AND '2014-01-01' 
ORDER BY [DiscountPct] DESC;

--d
SELECT [ProductID], [Name]
FROM [Production].[Product]
WHERE [ProductNumber] LIKE '_B%[0-9]'
ORDER BY [ProductID] DESC

--e
SELECT [ProductID],[Name]
FROM [Production].[Product]
WHERE [Color] IN ('Red', 'Silver', 'Black') AND [Size] is NOT NULL

--f
SELECT DISTINCT [JobTitle]
FROM [HumanResources].[Employee]
WHERE ([SickLeaveHours] <=15 OR [VacationHours] <20) AND [JobTitle] NOT LIKE '%Vice%President%' AND [JobTitle] NOT LIKE '%Manager%'

--d 
SELECT [LastName], [FirstName]
FROM [Person].[Person]
WHERE [LastName] LIKE 'R%'
ORDER BY [FirstName] ASC, [LastName] DESC

/* В данном выражении мы выводим [LastName] и [FirstName] из таблицы [Person].[Person], 
где [LastName] начинается на R, колонка [FirstName] упорядочивается по алфавиту, 
а колонка [LastName] - в обратном порядке */ 

