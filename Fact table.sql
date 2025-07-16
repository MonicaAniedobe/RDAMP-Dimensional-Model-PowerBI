---Populate_fact_table_Aniedobe_Monica_Chinaza.sql
INSERT INTO fact_sales (
    order_id, customer_id, product_id, location_id, date_id, category_id, segment_id, order_mode_id,
    sales, cost_price, quantity, discount, revenue, profit
)
SELECT 
    r.order_id,
    r.customer_id,
    r.product_id,
    l.location_id,
    d.date_id,
    c.category_id,
    s.segment_id,
    o.order_mode_id,
    r.sales,
    r.cost_price,
    r.quantity,
    r.discount,
    r.revenue,
    r.profit
FROM raw_sales r
JOIN dim_location l 
    ON r.city = l.city AND r.postal_code = l.postal_code AND r.region = l.region
JOIN dim_date d 
    ON r.order_date = d.order_date
JOIN dim_category c 
    ON r.category = c.category
JOIN dim_segment s 
    ON r.segment = s.segment
JOIN dim_order_mode o 
    ON r.order_mode = o.order_mode;