USE AdventureWorks2019
GO


SELECT 
	COUNT(GroupName) AS 'Num of groups'
FROM 
	HumanResources.Department
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
	PS.Name
	,StandardCost
	,SubTotal
	,MIN(UnitPrice) AS MinPrice
FROM
	Sales.SalesOrderHeader SOH
	,Sales.SalesOrderDetail SOD
	,Production.Product P
	,Production.ProductSubcategory PS
WHERE 
	P.ProductSubcategoryID = PS.ProductSubcategoryID 
	AND
		SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY
	SubTotal
	,StandardCost
	,PS.Name
	;
GO


SELECT 
	COUNT(PSC.ProductSubcategoryID) AS 'Num of subcategories'
FROM	
	Production.ProductCategory PC
	,Production.ProductSubcategory PSC
WHERE
	PC.ProductCategoryID=PSC.ProductCategoryID
	;
GO


SELECT 
	PSC.Name
	,SOH.RevisionNumber
	,AVG(DISTINCT SOD.UnitPrice) AS 'Average price'
	,P.ListPrice
FROM 
	Sales.SalesOrderHeader SOH
	,Sales.SalesOrderDetail SOD
	,Production.Product P
	,Production.ProductSubcategory PSC
WHERE 
	SOH.SalesOrderID = SOD.SalesOrderID
	AND
		P.ProductSubcategoryID = PSC.ProductSubcategoryID
GROUP BY
	SOH.RevisionNumber
	,P.ListPrice
	,PSC.Name
	;
GO


SELECT
	LoginID
	,MAX(Rate) AS MaxRate
	,HireDate
FROM 
	HumanResources.EmployeePayHistory EPH
	,HumanResources.Employee E
WHERE E.BusinessEntityID = EPH.BusinessEntityID
GROUP BY
	LoginID
	,HireDate
	;
GO
