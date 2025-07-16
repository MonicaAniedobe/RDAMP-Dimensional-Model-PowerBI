----queries_Aniedobe_Monica_Chinaza.sql
----Top 10 product by profit
SELECT p.product_name, SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC
LIMIT 10;


----monthly sales and profit trend
SELECT d.year, d.month, SUM(f.sales) AS total_sales, SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

----Profit Margin by Order Mode
SELECT o.order_mode, SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_order_mode o ON f.order_mode_id = o.order_mode_id
GROUP BY o.order_mode;

------ Total Quantity Sold by Region
SELECT l.region, SUM(f.quantity) AS total_quantity
FROM fact_sales f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY l.region
ORDER BY total_quantity DESC;

-----Customer Order Frequency
SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
FROM fact_sales
GROUP BY customer_id
ORDER BY order_count DESC;