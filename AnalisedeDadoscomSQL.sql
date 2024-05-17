
---consultando tabelas 

USE AdventureWorksDW2022

SELECT TOP 100
	*
FROM FactInternetSales

---Quantidade de clientes distintos 

SELECT 
	COUNT(DISTINCT (CustomerKey))
FROM FactInternetSales


---Total de Vendas

SELECT 
	SUM(F.SalesAmount)
FROM FactInternetSales AS F


---Média de Vendas

SELECT 
	AVG(F.SalesAmount)
FROM FactInternetSales AS F


---Total de Vendas de 2013 

SELECT 
	D.CalendarYear,
	SUM(SalesAmount) AS 'TotalVendas'
FROM FactInternetSales S
INNER JOIN DimDate D ON D.DateKey = S.ShipDateKey
GROUP BY D.CalendarYear
HAVING D.CalendarYear = 2013


---País que mais vendeu em 2013 

SELECT 
	T.SalesTerritoryCountry,
	D.CalendarYear,
	SUM(SalesAmount) AS 'TotalVendas'
FROM FactInternetSales S
INNER JOIN DimDate D ON D.DateKey = S.ShipDateKey
INNER JOIN DimSalesTerritory T ON T.SalesTerritoryKey = S.SalesTerritoryKey
GROUP BY D.CalendarYear, T.SalesTerritoryCountry
HAVING D.CalendarYear = 2013
ORDER BY 3 DESC


