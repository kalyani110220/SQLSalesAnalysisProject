SELECT 
    YEAR(OrderDate) AS SalesYear,
    DATENAME(MONTH, OrderDate) AS SalesMonth,
    SUM(Sales) AS TotalSales,
    COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY 
    YEAR(OrderDate),
    DATENAME(MONTH, OrderDate),
    MONTH(OrderDate)
ORDER BY 
    SalesYear,
    MONTH(OrderDate);
