USE AdventureWorks2019
GO


SELECT 
	GroupName ,COUNT(GroupName) AS 'Num of groups'
FROM 
	HumanResources.Department
	GROUP BY GroupName
	;
GO


SELECT
	E.JobTitle
	,MAX(EPH.Rate) AS MaxRate
FROM 
	HumanResources.EmployeePayHistory EPH
	,HumanResources.Employee E
WHERE 
	E.BusinessEntityID = EPH.BusinessEntityID
GROUP BY 
	JobTitle
	;
GO


SELECT 
	MIN(UnitPrice) AS MinPrice
FROM
	Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD
	ON SOH.SalesOrderID = SOD.SalesOrderID
	JOIN Production.Product P
	ON SOD.ProductID = P.ProductID
	JOIN Production.ProductSubcategory PS
	ON P.ProductSubcategoryID = PS.ProductSubcategoryID 

GROUP BY
	PS.Name
	;
GO


SELECT 
	COUNT(PSC.ProductSubcategoryID) AS 'Num of subcategories'
FROM	
	Production.ProductCategory PC
	,Production.ProductSubcategory PSC
WHERE
	PC.ProductCategoryID=PSC.ProductCategoryID
GROUP BY PC.Name
	;
GO


SELECT 
	PSC.Name
	,AVG(SOD.LineTotal) AS AverageOrder
	FROM Sales.SalesOrderHeader SOH
		JOIN Sales.SalesOrderDetail SOD
		ON SOH.SalesOrderID = SOD.SalesOrderID
		JOIN Production.Product P
		ON SOD.ProductID = P.ProductID
		JOIN Production.ProductSubcategory PSC
		ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
	GROUP BY 
		PSC.Name
GO


SELECT
	EPH.BusinessEntityID
	,EPH.Rate
	,MAX(EPH.RateChangeDate) AS MaxRate
FROM HumanResources.EmployeePayHistory EPH
GROUP BY EPH.BusinessEntityID, EPH.Rate
HAVING EPH.RATE = (SELECT MAX(EPH.Rate)
						FROM HumanResources.EmployeePayHistory EPH)

