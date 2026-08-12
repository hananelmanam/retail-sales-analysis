# retail-sales-analysis
Retail sales analysis using MySQL, SQL.
# Retail Sales Analysis — SQL Project

## Project Overview

This project analyzes retail sales data using MySQL and SQL to identify business performance, profitability, customer, regional, category, and product trends.

The project contains SQL analysis queries and reusable SQL views designed to support business reporting and dashboard development.

## Dataset

The dataset contains retail transaction information including:

- Order ID
- Order Date
- Customer information
- Region
- Category
- Sub-Category
- Product
- Sales
- Quantity
- Profit

## Business Questions

The SQL analysis answers the following questions:

1. What are the overall sales, profit, orders, quantity sold, and average order value?
2. Which region generates the highest sales and profit?
3. Which product category generates the highest sales and profit?
4. Which sub-categories are the most profitable and which generate losses?
5. Which customer segment generates the highest sales and profit?
6. Which products generate the highest sales and profit?
7. Which products generate losses?
8. How do sales and profit change over time?
9. How can orders be classified according to their profit level using CASE WHEN?

## Key Results

- **Total Orders:** 5,950
- **Total Sales:** 5,968,314.66
- **Total Profit:** 562,754.41
- **Total Quantity:** 55,102
- **Average Order Value:** 1,003.08

### Regional Insight

The **South region** generated the highest sales and profit:

- Sales: **1,609,115.22**
- Profit: **156,252.73**

## SQL Skills Demonstrated

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- Aggregate Functions
- COUNT DISTINCT
- CASE WHEN
- Date Functions
- SQL Views
- Data Aggregation
- Business KPI Analysis

## SQL Dashboard Views

The project includes reusable views for:

- KPI Summary
- Regional Performance
- Category Performance
- Sub-Category Performance
- Customer Segment Performance
- Top 10 Products
- Yearly Sales & Profit Performance

## Project Files

- `retail_sales_analysis.sql` — Complete SQL analysis and dashboard views
- `Retail_Sales_Dashboard.xlsx` — Interactive Excel dashboard
