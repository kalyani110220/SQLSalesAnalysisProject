WITH ProductSales AS (
    SELECT 
        p.Category,
        p.Product,
        SUM(o.Sales) AS TotalSales
    FROM Sales.Orders o
    JOIN Sales.Products p 
        ON o.ProductID = p.ProductID
    GROUP BY p.Category, p.Product
),
RankedProducts AS (
    SELECT 
        Category,
        PRODUCT,
        RANK() OVER (PARTITION BY Category ORDER BY Product DESC) AS SalesRank
    FROM sales.Products
)
SELECT *
FROM RankedProducts
WHERE SalesRank <= 2
ORDER BY Category, SalesRank;
