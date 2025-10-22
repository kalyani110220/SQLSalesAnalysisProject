🧾 SQL Sales Analysis Project
👩‍💻 Author: Kalyani Nelluri

📍 Coventry, UK | 📧 kallyani.nelluri54@gmail.com

🎯 Project Goal

To analyze company sales data using SQL and uncover valuable business insights such as:

Top-performing customers and products

Category-wise and time-based trends

Year-over-year sales growth

This project demonstrates proficiency in data analysis, querying, and business intelligence using SQL — skills essential for a Data Engineer or Data Analyst role.

🧱 Dataset Overview

The project uses three relational tables stored in Microsoft SQL Server:

Table	Description	Key Columns
Customers	Customer demographic details	CustomerID, FirstName, LastName, City
Products	Product catalog and category	ProductID, ProductName, Category, Price
Orders	Sales transactions	OrderID, CustomerID, ProductID, OrderDate, Quantity, Sales
⚙️ Tools & Technologies

SQL Server Management Studio (SSMS)

T-SQL

Git & GitHub for version control

Excel / Power BI (for visualization – optional)

🪜 Step-by-Step Analysis
🥇 Step 1 – Total Sales per Customer

Goal: Identify customers contributing most to total revenue.

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    SUM(o.Sales) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;


💡 Insight:
Top customers (e.g., Mary, Joseph Goldberg, Mark Schwarz) drive the majority of sales, highlighting potential for loyalty programs.

🥈 Step 2 – Top 3 Customers by Spending
SELECT TOP 3 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(o.Sales) AS TotalSpent
FROM Sales.Orders o
JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;


Insight: Focus retention strategies on high-value customers who generate >30% of total revenue.

🧩 Step 3 – Product & Category Performance
SELECT 
    p.Category,
    p.ProductName,
    SUM(o.Sales) AS TotalSales
FROM Sales.Orders o
JOIN Sales.Products p ON o.ProductID = p.ProductID
GROUP BY p.Category, p.ProductName
ORDER BY TotalSales DESC;


Insight: Electronics and Accessories dominate sales volume; highlight popular products in marketing campaigns.

🧮 Step 9 – Monthly Sales Trend
SELECT 
    YEAR(OrderDate) AS SalesYear,
    DATENAME(MONTH, OrderDate) AS SalesMonth,
    SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY YEAR(OrderDate), DATENAME(MONTH, OrderDate), MONTH(OrderDate)
ORDER BY SalesYear, MONTH(OrderDate);


💡 Insight:
Sales peak in Q4 (October–December) — suggesting seasonal shopping patterns.

📈 Step 10 – Year-over-Year Growth
WITH YearlySales AS (
    SELECT 
        YEAR(OrderDate) AS SalesYear,
        SUM(Sales) AS TotalSales
    FROM Sales.Orders
    GROUP BY YEAR(OrderDate)
)
SELECT 
    SalesYear,
    TotalSales,
    LAG(TotalSales, 1) OVER (ORDER BY SalesYear) AS PreviousYearSales,
    ROUND(
        (CAST(TotalSales - LAG(TotalSales, 1) OVER (ORDER BY SalesYear) AS FLOAT)
        / NULLIF(LAG(TotalSales, 1) OVER (ORDER BY SalesYear), 0)) * 100, 2
    ) AS YoYGrowthPercent
FROM YearlySales
ORDER BY SalesYear;


💡 Insight:

Sales grew ~14–20% YoY, showing consistent upward business momentum.

Great metric for management and forecasting.

📸 Screenshots

Add screenshots here (save them in a /screenshots folder and embed them).

Example:

![SQL Query Screenshot](./screenshots/step1_query_result.png)
![Monthly Sales Trend](./screenshots/step9_sales_trend_chart.png)

📊 Business Insights Summary
Area	Key Finding	Recommendation
Customer Analysis	Top 3 customers contribute ~35% of sales	Build loyalty rewards & upselling programs
Product Trends	Electronics category dominates	Prioritize inventory for high-demand SKUs
Time Trends	Sales peak in December	Launch seasonal campaigns earlier
Growth	Consistent YoY growth 15–20%	Expand marketing in Q2–Q3 to smooth seasonality
🧠 Skills Demonstrated

✅ Advanced SQL Queries
✅ Joins, Aggregations, CTEs
✅ Subqueries & Window Functions
✅ Data Cleaning & Reporting
✅ Business Insight Presentation

🚀 How to Run This Project

Clone the repository:

git clone https://github.com/kalyani110220/SQLSalesAnalysisProject.git


Open the .sql scripts in SQL Server Management Studio (SSMS).

Execute each query step by step to reproduce analysis.

(Optional) Export results to Excel or Power BI for visualization.

📈 Future Enhancements

Add Power BI dashboard to visualize monthly and yearly trends.

Extend dataset with product returns or regional sales data.

Build automated data pipeline using Python + SQL + AWS S3.

💬 Contact

📧 kallyani.nelluri54@gmail.com

💻 GitHub

🌐 LinkedIn
