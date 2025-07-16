-------create_tables_AniedobeMonicaChinaza.sql
CREATE TABLE raw_sales (
    order_id VARCHAR,
    order_date DATE,
    order_mode VARCHAR,
    customer_id VARCHAR,
    city VARCHAR,
    postal_code VARCHAR,
    country VARCHAR,
    region VARCHAR,
    product_id VARCHAR,
    product_name VARCHAR,
    sub_category VARCHAR,
    sales NUMERIC,
    cost_price NUMERIC,
    quantity INTEGER,
    discount NUMERIC,
    revenue NUMERIC,
    profit NUMERIC,
    category VARCHAR,
    segment VARCHAR
);