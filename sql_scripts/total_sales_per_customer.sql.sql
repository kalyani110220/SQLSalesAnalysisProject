SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    CONCAT('£', FORMAT(SUM(o.Sales), 'N2')) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY SUM(o.Sales) DESC;
