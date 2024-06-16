--1
SELECT [StandardCost], 
CASE
WHEN [StandardCost] = 0 OR [StandardCost] is NULL then 'Not for sale'
WHEN[StandardCost] >0 AND [StandardCost] <100 then '<100$'
WHEN[StandardCost] >=100 AND [StandardCost] <500 then '<500$'
ELSE '>500$'
END AS Category_of_prices
FROM [Production].[Product]
GROUP BY [StandardCost]


--2 
SELECT [StandardCost],
IIF (StandardCost = 0 OR StandardCost IS NULL, 'Not for sale', IIF ( StandardCost>0 AND StandardCost <=100, '<100$', IIF (StandardCost <500, '<500$', '>500$'))) as Category_of_prices
FROM [Production].[Product]
GROUP BY [StandardCost]

--3
SELECT
	CASE 
WHEN CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) BETWEEN 1 AND 2 OR CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) = 12 then 'Winter'
WHEN CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) BETWEEN 3 AND 5 then 'Spring'
WHEN CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) BETWEEN 6 AND 8 then 'Summer'
ELSE 'Autumn'
END AS Seasons,

	CASE 
WHEN CAST (sum ([LastReceiptCost]) as int) <2000 THEN 'Do not include'
ELSE CAST (sum ([LastReceiptCost]) as varchar)
END AS Summ

FROM [Purchasing].[ProductVendor]
WHERE [AverageLeadTime] > 15
GROUP BY CASE 
WHEN CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) BETWEEN 1 AND 2 OR CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) = 12 then 'Winter'
WHEN CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) BETWEEN 3 AND 5 then 'Spring'
WHEN CAST(DATEPART(month, LastReceiptDate) AS VARCHAR(20)) BETWEEN 6 AND 8 then 'Summer'
ELSE 'Autumn'
END;

--4
SELECT *,
sum (LastReceiptCost) OVER (PARTITION BY [BusinessEntityID]) as Summ,
max (LastReceiptCost) OVER (PARTITION BY [UnitMeasureCode]) as Max_m
FROM [Purchasing].[ProductVendor]
WHERE [AverageLeadTime] = 15 

