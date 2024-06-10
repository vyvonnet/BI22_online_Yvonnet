--a
SELECT MIN ([Weight]) as wt, MAX ([Size]) as sz
FROM [Production].[Product];

--b
SELECT ProductSubcategoryID, MIN ([Weight]) as wt, MAX ([Size]) as sz
FROM [Production].[Product]
WHERE ProductSubcategoryID IS NOT NULL --?? не уверена, скорее поставила просто логически
GROUP BY ProductSubcategoryID

--c (не совсем поняла условие, нужно ли задавать конкретный цвет или просто сгруппировать по ID и цвету, поэтому два решения
SELECT ProductSubcategoryID, MIN ([Weight]) as wt, MAX ([Size]) as sz
FROM [Production].[Product]
WHERE Color = 'Red'
GROUP BY ProductSubcategoryID
Order by ProductSubcategoryID 

SELECT ProductSubcategoryID, Color, MIN ([Weight]) as wt, MAX ([Size]) as sz
FROM [Production].[Product]
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID, Color
Order by ProductSubcategoryID 

--d
SELECT ProductSubcategoryID, MIN ([Weight]) as wt
FROM [Production].[Product]
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID
HAVING MIN ("Weight") !< 50 
Order by ProductSubcategoryID

--e
SELECT ProductSubcategoryID, MIN ([Weight]) as wt
FROM [Production].[Product]
WHERE  Color = 'Black' AND ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID
HAVING MIN ("Weight") !< 50
Order by ProductSubcategoryID

--f
SELECT [TaxType], MIN ([TaxRate]) as TR
FROM [Sales].[SalesTaxRate]
Group by TaxType
HAVING MIN (TaxRate) !> 7