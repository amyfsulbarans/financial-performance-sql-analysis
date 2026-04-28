-- Financial Performance Analysis with SQL
-- This project analyzes revenue, profit, margin, and ROI using SQL queries.

--------------------------------------------------
-- 1. Total Revenue by Market
--------------------------------------------------

SELECT 
    country,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY country
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 2. Profit and Margin by Product
--------------------------------------------------

SELECT 
    product_name,
    SUM(revenue) AS revenue,
    SUM(cost) AS cost,
    SUM(revenue - cost) AS profit,
    ROUND((SUM(revenue - cost) / SUM(revenue)) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY product_name
ORDER BY profit DESC;

--------------------------------------------------
-- 3. ROI Calculation by Campaign
--------------------------------------------------

SELECT 
    campaign_name,
    SUM(revenue) AS total_revenue,
    SUM(marketing_spend) AS total_cost,
    ROUND(((SUM(revenue) - SUM(marketing_spend)) / SUM(marketing_spend)) * 100, 2) AS roi_pct
FROM marketing_data
GROUP BY campaign_name
ORDER BY roi_pct DESC;

--------------------------------------------------
-- 4. Revenue by Customer Segment
--------------------------------------------------

SELECT 
    customer_segment,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY customer_segment
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 5. Top Performing Markets
--------------------------------------------------

SELECT 
    country,
    COUNT(order_id) AS total_orders,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY country
ORDER BY total_revenue DESC;
