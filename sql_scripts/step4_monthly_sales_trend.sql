SELECT 
    YEAR(o.OrderDate) AS SalesYear,
    DATENAME(MONTH, o.OrderDate) AS SalesMonth,
    SUM(o.Sales) AS TotalMonthlySales
FROM Sales.Orders o
GROUP BY 
    YEAR(o.OrderDate),
    DATENAME(MONTH, o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY 
    YEAR(o.OrderDate),
    MONTH(o.OrderDate);
