SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.Sales) AS TotalSales,
    ROUND(AVG(o.Sales), 2) AS AvgOrderValue
FROM Sales.Orders o
JOIN Sales.Customers c 
    ON o.CustomerID = c.CustomerID
GROUP BY 
    c.FirstName, 
    c.LastName
ORDER BY 
    AvgOrderValue DESC;
