-----populate_dimensions_Aniedobe_Monica_Chinaza.sql
----- POPULATE DIMENSION TABLE 
--For dim_customer 
INSERT INTO dim_customer (customer_id)
SELECT DISTINCT customer_id FROM raw_sales;

--- dim_product
INSERT INTO dim_product (product_id, product_name, sub_category)
SELECT DISTINCT product_id, product_name, sub_category FROM raw_sales;

----dim_location
INSERT INTO dim_location (city, postal_code, country, region)
SELECT DISTINCT city, postal_code, country, region
FROM raw_sales;

----dim_category
INSERT INTO dim_category (category)
SELECT DISTINCT category
FROM raw_sales;

----dim_segment
INSERT INTO dim_segment (segment)
SELECT DISTINCT segment
FROM raw_sales;

---dim_order_mode
INSERT INTO dim_order_mode (order_mode)
SELECT DISTINCT order_mode
FROM raw_sales;

---dim_date
INSERT INTO dim_date (order_date, year, month, quarter)
SELECT DISTINCT 
    order_date,
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    EXTRACT(QUARTER FROM order_date)
FROM raw_sales;
