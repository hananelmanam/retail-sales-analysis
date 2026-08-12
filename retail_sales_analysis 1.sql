USE retail_sales;

CREATE OR REPLACE VIEW vw_kpi AS
SELECT
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(`Sales`), 2) AS Total_Sales,
    ROUND(SUM(`Profit`), 2) AS Total_Profit,
    SUM(`Quantity`) AS Total_Quantity,
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Order ID`),
        2
    ) AS Average_Order_Value
FROM retail_sales_data;
SELECT *
FROM vw_kpi;
-- Q2: Which region generates the highest sales and profit?

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;
-- Q3: Which product category generates the highest sales and profit?

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;
-- Q4: Which sub-categories are the most profitable and which are loss-making?

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;
-- Q5: Which customer segment generates the highest sales and profit?

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY Segment
ORDER BY Total_Sales DESC;
-- Q6: Which products generate the highest sales and profit?

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
-- Q7: Which products are generating losses?

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10; 
-- Q8: How do sales and profit change over time?

SELECT
    YEAR(`Order Date`) AS Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY YEAR(`Order Date`)
ORDER BY Year;
-- Q9: Classify orders by profit level

SELECT
    `Order ID`,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    CASE
        WHEN SUM(Profit) >= 500 THEN 'High Profit'
        WHEN SUM(Profit) >= 0 THEN 'Positive Profit'
        ELSE 'Loss'
    END AS Profit_Category
FROM retail_sales_data
GROUP BY `Order ID`
ORDER BY Total_Profit DESC;
-- =====================================================
-- SQL DASHBOARD VIEWS
-- =====================================================

USE retail_sales;


-- 1. KPI SUMMARY
CREATE OR REPLACE VIEW vw_kpi AS
SELECT
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Average_Order_Value
FROM retail_sales_data;


-- 2. REGION PERFORMANCE
CREATE OR REPLACE VIEW vw_region_performance AS
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 3. CATEGORY PERFORMANCE
CREATE OR REPLACE VIEW vw_category_performance AS
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 4. SUB-CATEGORY PERFORMANCE
CREATE OR REPLACE VIEW vw_subcategory_performance AS
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


-- 5. CUSTOMER SEGMENT PERFORMANCE
CREATE OR REPLACE VIEW vw_segment_performance AS
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 6. TOP 10 PRODUCTS
CREATE OR REPLACE VIEW vw_top_products AS
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


-- 7. SALES & PROFIT BY YEAR
CREATE OR REPLACE VIEW vw_yearly_performance AS
SELECT
    YEAR(`Order Date`) AS Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_sales_data
GROUP BY YEAR(`Order Date`)
ORDER BY Year;
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
SELECT *
FROM vw_kpi;