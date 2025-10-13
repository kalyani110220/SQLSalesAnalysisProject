SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(o.Sales) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c 
    ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING SUM(o.Sales) IN (
    SELECT TOP 3 SUM(o2.Sales)
    FROM Sales.Orders o2
    GROUP BY o2.CustomerID
    ORDER BY SUM(o2.Sales) DESC
)
ORDER BY TotalSpent DESC;
