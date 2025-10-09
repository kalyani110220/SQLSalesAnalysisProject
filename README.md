# 🧾 SQL Sales Analysis Project

This project analyzes customer spending data using Microsoft SQL Server.  
It demonstrates SQL skills such as **joins**, **aggregations**, and **formatting**.

---

## 📊 Query 1: Total Sales per Customer

### 🧩 SQL Code
```sql
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    CONCAT('£', FORMAT(SUM(o.Sales), 'N2')) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c 
    ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY SUM(o.Sales) DESC;
