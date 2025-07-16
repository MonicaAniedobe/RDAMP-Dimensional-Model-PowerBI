# RDAMP-Dimensional-Model-PowerBI
A dimensional modeling and Power BI reporting project for Ace Superstore Sales, featuring a PostgreSQL star schema implementation, reusable SQL views, and an interactive Power BI dashboard for enterprise-grade sales insights.


# 📋 Project Procedure  
**Project Title:** RDAMP Dimensional Model & Power BI Reporting  
**Author:** Aniedobe Monica Chinaza  
**Client:** Ace Superstore  

---

## 📖 Objective  

The objective of this project is to design and implement a scalable, query-optimized dimensional model for Ace Superstore sales data using PostgreSQL and deliver an interactive Power BI dashboard based on structured reporting views.  

---

## 📌 Project Stages and Procedure  

The project was executed in six clear stages:

---

## ✅ Stage 1: Data Preparation  

- Received the cleaned sales dataset [`Ace Sales Clean Dataset.csv`](https://github.com/MonicaAniedobe/RDAMP-Dimensional-Model-PowerBI/blob/main/Ace%20Sales%20Clean%20Dataset.csv.csv)
- Launched **PostgreSQL** and created a new database `acesalesdb`.
- Created a staging table `raw_sales` with appropriate data types to temporarily hold the raw data.
- Imported the cleaned CSV file into the `raw_sales` table using PostgreSQL’s `\copy` command or via pgAdmin’s Import tool.

---

## ✅ Stage 2: Dimensional Model Design  

- Analyzed the dataset’s structure and reporting requirements.
- Designed a **Star Schema** dimensional model comprising:
  - **One Fact Table:** `fact_sales`
  - **Seven Dimension Tables:** `dim_customer`, `dim_product`, `dim_location`, `dim_date`, `dim_category`, `dim_segment`, `dim_order_mode`
- Drafted a dimensional model diagram to visualize table relationships, keys, and measures.

**Key Measures:**
- Sales
- Quantity
- Cost Price
- Revenue
- Profit
- Discount  

**Key Date Attributes:**  
Order Date, Year, Month, Quarter

---

## ✅ Stage 3: Table Creation and Data Population  

- Wrote SQL scripts to create all dimension and fact tables [`create table.sql`](https://github.com/MonicaAniedobe/RDAMP-Dimensional-Model-PowerBI/blob/main/Table%20scripts.sql)
- Populated each dimension table from `raw_sales`, ensuring:
  - No duplicates
  - Cleaned and standardized text fields
  - No NULLs in primary or foreign keys
- Created primary keys on dimension tables.
- Populated the fact table by joining `raw_sales` to dimension tables, replacing text fields with foreign keys.

Scripts used:
- [`populate_dimensions.sql`](https://github.com/MonicaAniedobe/RDAMP-Dimensional-Model-PowerBI/blob/main/Dimension%20Table.sql)
- [`populate_fact_table.sql`](https://github.com/MonicaAniedobe/RDAMP-Dimensional-Model-PowerBI/blob/main/Dimension%20Table.sql

---

## ✅ Stage 4: SQL View Creation  

- Developed five analytical views to provide summarized reporting tables for Power BI:
  1. `vw_product_seasonality`
  2. `vw_discount_impact_analysis`
  3. `vw_customer_order_patterns`
  4. `vw_channel_margin_report`
  5. `vw_region_category_rankings`

- Views were saved in `create_views_AniedobeMonicaChinaza.sql`.

---

## ✅ Stage 5: Business Insight Queries  

- Created five reusable SQL queries outside of the views for additional strategic insights:
  - Top 10 Products by Profit
  - Monthly Sales & Profit Trends
  - Profit Margin by Order Mode
  - Total Quantity Sold by Region
  - Customer Order Frequency

- Saved queries inside `queries_AniedobeMonicaChinaza.sql`

---

## ✅ Stage 6: Power BI Reporting  

- Installed the **Npgsql PostgreSQL Connector** for Power BI.
- Opened Power BI Desktop and connected to the PostgreSQL database via native connector.
- Imported the five SQL views as datasets.
- Built an interactive dashboard containing:
  - Product Seasonality Heatmap
  - Discount vs Profit Scatter Plot
  - Average Order Value by Segment (Combo Chart)
  - Top 10 Customers by Profit (Bar Chart)
  - Category Ranking by Region (Matrix/Bar Chart)

- Saved final dashboard as `AceSuperstore_Dashboard_AniedobeMonicaChinaza.pbix`
- Exported and saved screenshots for each visualization into the `powerbi/screenshots/` directory.

---

## 📦 Final Deliverables  

- SQL scripts for table creation, data population, views, and queries
- Power BI dashboard file (.pbix)
- Dashboard screenshots
- Dimensional model diagram image
- README.md documentation
- This Project Procedure document

---

## ✅ Conclusion  

The project successfully transitioned Ace Superstore’s cleaned sales dataset into a structured dimensional model optimized for business reporting. The final Power BI dashboard delivers enterprise-grade insights for stakeholders to make data-driven decisions.

---

> **Prepared by:** Aniedobe Monica Chinaza  
> **Date:** July 2025
