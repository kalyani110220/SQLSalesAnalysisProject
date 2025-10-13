SELECT 
    p.Product,
    p.Category,
    SUM(o.Sales) AS TotalSales
FROM Sales.Orders o
JOIN Sales.Products p 
    ON o.ProductID = p.ProductID
GROUP BY p.Product, p.Category
ORDER BY SUM(o.Sales) DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
