🧾 SQL Sales Analysis Project
👩‍💻 Author: Kalyani Nelluri
🗓️ Duration: Steps 1–9 Completed
🏁 Goal: Build a complete end-to-end SQL Sales Analytics Portfolio Project for skill showcase and interview preparation.
📘 Project Overview

This project analyzes sales performance using SQL across multiple business dimensions — customers, products, categories, and time.
It demonstrates your ability to write real-world SQL queries involving joins, aggregations, subqueries, and window functions.

Each step builds progressively, resulting in a professional analysis suitable for data analyst or data engineer portfolios.

🗂️ Project Folder Structure
SQL_Sales_Analysis_Project/
│
├── sql_scripts/
│   ├── step1_total_sales_per_customer.sql
│   ├── step2_top_customers.sql
│   ├── step3_product_performance.sql
│   ├── step4_category_performance.sql
│   ├── step5_high_value_orders.sql
│   ├── step6_customers_no_orders.sql
│   ├── step7_category_sales_summary.sql
│   ├── step8_top2_products_per_category.sql
│   └── step9_monthly_sales_trend.sql
│
├── results/
│   ├── output_tables/
│   └── readme_files/
│
└── README.md

🧮 Step-by-Step Analysis
🥇 Step 1 – Total Sales per Customer

Goal: Find total spending by each customer.

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    CONCAT('£', FORMAT(SUM(o.Sales), 'N2')) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY SUM(o.Sales) DESC;


Output: Total spending of each customer, sorted from highest to lowest.

🥈 Step 2 – Top 3 Customers by Spending (Subquery)

Goal: Identify the top 3 customers based on total sales.

SELECT TOP 3 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(o.Sales) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;


Output: Top 3 most valuable customers.

🧩 Step 3 – Product Performance

Goal: Measure total revenue per product.

SELECT 
    p.ProductName,
    SUM(o.Sales) AS TotalSales
FROM Sales.Orders o
JOIN Sales.Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;


Output: Each product’s contribution to total sales.

🧱 Step 4 – Category Performance

Goal: Find which product categories generate the most revenue.

SELECT 
    p.Category,
    SUM(o.Sales) AS TotalRevenue
FROM Sales.Orders o
JOIN Sales.Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;


Output: Category-wise sales totals.

💰 Step 5 – High-Value Orders

Goal: Identify orders where the total sales exceed a set threshold.

SELECT 
    OrderID,
    SUM(Sales) AS OrderTotal
FROM Sales.Orders
GROUP BY OrderID
HAVING SUM(Sales) > 1000;


Output: All orders with revenue greater than £1000.

🚫 Step 6 – Customers with No Orders

Goal: List customers who have never placed any orders.

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.CustomerID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.FirstName, c.LastName;


Output: Customers to target for re-engagement.

📊 Step 7 – Category-wise Sales Summary

Goal: Summarize orders, quantity, and revenue by product category.

SELECT 
    p.Category,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(o.Quantity) AS TotalQuantitySold,
    SUM(o.Sales) AS TotalRevenue,
    ROUND(AVG(o.Sales), 2) AS AvgOrderValue
FROM Sales.Orders o
JOIN Sales.Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;


Output: A performance breakdown by category.

🏆 Step 8 – Top 2 Products per Category

Goal: Use window functions to find the top-performing products in each category.

WITH ProductSales AS (
    SELECT 
        p.Category,
        p.ProductName,
        SUM(o.Sales) AS TotalSales
    FROM Sales.Orders o
    JOIN Sales.Products p ON o.ProductID = p.ProductID
    GROUP BY p.Category, p.ProductName
),
RankedProducts AS (
    SELECT 
        Category,
        ProductName,
        TotalSales,
        RANK() OVER (PARTITION BY Category ORDER BY TotalSales DESC) AS SalesRank
    FROM ProductSales
)
SELECT *
FROM RankedProducts
WHERE SalesRank <= 2
ORDER BY Category, SalesRank;


Output: Top 2 products per category by total sales.

📅 Step 9 – Monthly Sales Trend Analysis

Goal: View how total sales and orders change month by month.

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


Output: Month-by-month revenue and order trends for identifying seasonal patterns.

📈 Key SQL Concepts Covered
Concept	Steps Demonstrated
Joins (INNER, LEFT)	1, 4, 6, 7
Aggregations (SUM, COUNT, AVG)	1, 3, 4, 5, 7
Grouping & Sorting	All steps
Subqueries	Step 2
Window Functions	Step 8
Date Functions	Step 9
Conditional Logic (HAVING)	Step 5
💡 Real-World Business Value

Identify top customers and high-value orders

Track sales by category and product

Detect inactive customers for retention campaigns

Analyze monthly sales patterns for forecasting

🧠 Next Step

➡️ Step 10 – Year-over-Year Growth Analysis
You’ll compare total sales between years using window functions like LAG() to measure growth rates.
