
--3а
SELECT 
CONCAT(FirstName, ' ', LastName) AS Full_name
FROM [Person].[Person]
JOIN [Person].[PersonPhone]
ON [Person].[Person].BusinessEntityID = [Person].[PersonPhone].BusinessEntityID
GROUP BY CONCAT(FirstName, ' ', LastName) 
HAVING COUNT (*) > 1 


--3b
SELECT 
PP."Name"
FROM [Production].[Product] as PP 
JOIN [Purchasing].[ProductVendor] as PPV
ON PP.[ProductID] = PPV.[ProductID]
JOIN [Purchasing].[Vendor] as PV
ON PPV.[BusinessEntityID]= PV.[BusinessEntityID]
WHERE PP."Name" LIKE '%a%' OR PV.[AccountNumber] LIKE 'a%' 
GROUP BY PP."Name"
Having AVG ([StandardPrice]) > 10


--3c
SELECT PV.[Name]
FROM [Purchasing].[Vendor] as PV
LEFT JOIN [Purchasing].[ProductVendor] as PPV
ON PV.[BusinessEntityID] = PPV.BusinessEntityID
WHERE PPV.[OnOrderQty] IS NULL
ORDER BY 1



--4-й самый сложный пункт для меня оказался, потому что нет возможности проверить в консольке( Пока еще сложно писать запросики вслепую :)

--4a 
SELECT 
emp.emp_name, 
dep.dep_name
FROM Table Employees as emp
FULL JOIN Table Departments as dep
ON emp.dep_id=dep.dep_id


--4b
SELECT
dep.dep_name, ISNULL(emp.dep_id, 'N.D.'),
count (emp_name)
FROM Table Departments as dep
FULL JOIN Table Employees as emp
ON dep.dep_id=emp.dep_id
GROUP BY dep.dep_name


--4c
SELECT
concat (lower (replace ([emp_name], ' ', '_' )), '@gmail.com')
FROM [Table Employees]


--4d
SELECT TOP 1
ISNULL(dep.dep_name, 'N.D.'), 
sum (revenue)
from Table Departsmen as dep
FULL JOIN Table Employees as emp
ON dep.dep_id=emp.dep_id
FULL JOIN Table Revenue as rev
ON emp.emp_id=rev.emp_id
GROUP by emp.id


--5a 
SELECT *
FROM [Purchasing].[ProductVendor]
WHERE DATEDIFF (yy,[LastReceiptDate], CURRENT_TIMESTAMP) <= 10


--5b
SELECT *
FROM [Purchasing].[ProductVendor]
WHERE MONTH (LastReceiptDate) = MONTH (CURRENT_TIMESTAMP)

--5c
--1
SELECT datepart(dw, LastReceiptDate) as Day_of_week,
count (*) as Number_of_events
FROM [Purchasing].[ProductVendor]
GROUP BY datepart(dw, LastReceiptDate) -- не придумала в данном решении, как красиво переименовать дни недели (если c 7-ю Replace только), поэтому ниже варик с кейсом

--2
SELECT
CASE datepart(dw, LastReceiptDate)
    WHEN 1 THEN 'Monday' 
	WHEN 2 THEN 'Tuesday' 
	WHEN 3 THEN 'Wednesday' 
	WHEN 4 THEN 'Thursday' 
	WHEN 5 THEN 'Friday' 
	WHEN 6 THEN 'Saturday' 
	WHEN 7 THEN 'Sunday' 
END AS Day_Of_Week,
count (*) as Number_of_events
FROM [Purchasing].[ProductVendor]
GROUP BY datepart(dw, LastReceiptDate) -- а в этом решении почему-то русские названия дней недели отображались как куча вопросительных знаков "???????" о_О

-- 5d
SELECT *
FROM
	(SELECT 
	datename(mm, LastReceiptDate) as Month_,
	count (*) as Month_Events
	FROM [Purchasing].[ProductVendor]
	GROUP BY datename(mm, LastReceiptDate)) as T1,
	
	(SELECT
	datename(dd, LastReceiptDate) as Day_, 
	count (*) as Day_Events
	FROM [Purchasing].[ProductVendor]
	GROUP BY datename(dd, LastReceiptDate)) as T2,
	
	(SELECT
	datename(yy, LastReceiptDate)  as Year_,
	count (*) as Year_Events
	FROM [Purchasing].[ProductVendor]
	GROUP BY datename(yy, LastReceiptDate)) as T3
	Order by 1 DESC, 3, 5
	
-- тут по какой-то причине не работает группировка. Возможно есть какие-то специальные методики объединения подзапросов во FROM? Не нашла, к сожалению( Отдельно каждый селект работает красиво(


