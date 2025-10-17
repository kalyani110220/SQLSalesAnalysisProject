SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.CustomerID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.FirstName, c.LastName;

