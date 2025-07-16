---create_views_Aniedobe_Monica_Chinaza.sql
------ CREATION OF VIEWS
----vw_product_seasonality
CREATE OR REPLACE VIEW vw_product_seasonality AS
SELECT 
    p.product_name,
    d.year,
    d.month,
    SUM(f.sales) AS total_sales,
    SUM(f.quantity) AS total_quantity,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY p.product_name, d.year, d.month
ORDER BY p.product_name, d.year, d.month;

----VW_DISCOUNT_IMPACT_ANALYSIS
CREATE OR REPLACE VIEW vw_discount_impact_analysis AS
SELECT 
    d.year,
    d.month,
    p.product_name,
    SUM(f.sales) AS total_sales,
    SUM(f.discount) AS total_discount,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month, p.product_name
ORDER BY d.year, d.month, p.product_name;

----vw_customer_order_pattern
CREATE OR REPLACE VIEW vw_customer_order_patterns AS
SELECT 
    s.segment,
    COUNT(DISTINCT f.order_id) AS order_frequency,
    AVG(f.sales) AS avg_order_value,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_segment s ON f.segment_id = s.segment_id
GROUP BY s.segment
ORDER BY total_profit DESC;

-----vw_channel_margin_report
CREATE OR REPLACE VIEW vw_channel_margin_report AS
SELECT 
    o.order_mode,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    SUM(f.sales) - SUM(f.cost_price * f.quantity) AS total_margin
FROM fact_sales f
JOIN dim_order_mode o ON f.order_mode_id = o.order_mode_id
GROUP BY o.order_mode
ORDER BY total_margin DESC;

-----vw_region_category
CREATE OR REPLACE VIEW vw_region_category_rankings AS
SELECT 
    l.region,
    c.category,
    SUM(f.profit) AS total_profit,
    RANK() OVER (PARTITION BY l.region ORDER BY SUM(f.profit) DESC) AS profit_rank
FROM fact_sales f
JOIN dim_location l ON f.location_id = l.location_id
JOIN dim_category c ON f.category_id = c.category_id
GROUP BY l.region, c.category
ORDER BY l.region, profit_rank;

-----
