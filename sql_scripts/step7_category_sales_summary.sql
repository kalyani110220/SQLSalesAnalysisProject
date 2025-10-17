SELECT 
    p.Category,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(o.Quantity) AS TotalQuantitySold,
    SUM(o.Sales) AS TotalRevenue,
    ROUND(AVG(o.Sales), 2) AS AvgOrderValue
FROM Sales.Orders o
JOIN Sales.Products p 
    ON o.ProductID = p.ProductID
GROUP BY 
    p.Category
ORDER BY 
    TotalRevenue DESC;
