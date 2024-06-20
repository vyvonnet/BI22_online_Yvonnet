--2а
SELECT *
FROM [Production].[UnitMeasure]
WHERE [UnitMeasureCode] LIKE 'T%'

SELECT DISTINCT count (UnitMeasureCode)
FROM [Production].[UnitMeasure]

INSERT INTO [Production].[UnitMeasure]
VALUES ('TT1', 'Test 1', '20200909'), ('TT2', 'Test 2', GETDATE())

--2b

SELECT * INTO Production.UnitMeasureTEST
FROM [Production].[UnitMeasure]
WHERE [UnitMeasureCode] LIKE 'T%'

SELECT *
FROM Production.UnitMeasureTEST


INSERT INTO Production.UnitMeasureTEST
SELECT * FROM [Production].[UnitMeasure]
WHERE [UnitMeasureCode] LIKE 'CAN' 

--2c
UPDATE Production.UnitMeasureTEST
    SET UnitMeasureCode = 'TTT' 

--2d
DELETE FROM Production.UnitMeasureTEST


--2e
SELECT [SalesOrderID],
MAX (Linetotal) OVER (PARTITION BY [SalesOrderID]) as Max_m,
MIN (Linetotal) OVER (PARTITION BY [SalesOrderID]) as Min_m,
AVG (Linetotal) OVER (PARTITION BY [SalesOrderID]) as Midd_le
FROM [Sales].[SalesOrderDetail]
WHERE [SalesOrderID] IN ('43659', '43664')

--2f
SELECT *
FROM (SELECT UPPER (LEFT(LastName, 3)) + 'login' + ISNULL (TerritoryGroup, ' ') as Login_,
	RANK () OVER (ORDER BY SalesYTD DESC) as sales_current,
	RANK () OVER (ORDER BY SalesLastYear DESC) as sales_last_year
	FROM [Sales].[vSalesPerson] as ssp) as Results
WHERE Results.sales_current = 1 OR Results.sales_last_year = 1

