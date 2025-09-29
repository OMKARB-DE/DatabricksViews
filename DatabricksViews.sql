-- Databricks notebook source
-- Table to store product information including product details, category, pricing, stock, supplier, and launch date for inventory and analytics purposes
CREATE OR REPLACE TABLE deltatables.default.product_info
(
    product_id    STRING,
    product_name  STRING,
    category      STRING,
    price         DOUBLE,
    stock_qty     INT,
    supplier      STRING,
    launch_date   DATE
);

-- COMMAND ----------

-- Insert sample product data into the product_info table, covering various categories, suppliers, and launch dates for testing and analysis
INSERT INTO deltatables.default.product_info VALUES
('P001','Laptop X1','Electronics',1200.50, 50,'TechSupplier Inc', DATE'2025-01-05'),
('P002','Smartphone S10','Electronics',899.99, 100,'MobileWorld Ltd', DATE'2025-02-10'),
('P003','Gaming Chair G5','Furniture',250.75, 25,'ComfortCo', DATE'2025-03-15'),
('P004','Wireless Mouse M2','Electronics',35.60, 200,'TechSupplier Inc', DATE'2025-01-20'),
('P005','Coffee Maker C100','Kitchen',99.99, 80,'HomeAppliances Ltd', DATE'2025-04-05'),
('P006','Yoga Mat Y10','Sports',25.50, 150,'FitnessGear', DATE'2025-05-01'),
('P007','LED Monitor 27"','Electronics',299.99, 60,'TechSupplier Inc', DATE'2025-02-25'),
('P008','Blender B200','Kitchen',75.40, 70,'HomeAppliances Ltd', DATE'2025-03-10'),
('P009','Office Desk D4','Furniture',180.00, 40,'ComfortCo', DATE'2025-01-30'),
('P010','Running Shoes R5','Sports',120.25, 120,'FitnessGear', DATE'2025-04-20');

-- COMMAND ----------

-- Retrieve all product information from the product_info table
select * from deltatables.default.product_info;

-- COMMAND ----------

-- Create a temporary view that summarizes the total available stock quantity for each product category
create temporary view category_wise_qty as
select category, sum(stock_qty) as total_stock_qty from deltatables.default.product_info group by category;

-- COMMAND ----------

-- Display the total stock quantity available for each product category
select * from category_wise_qty;

-- COMMAND ----------

-- Display all tables in the current schema
show tables

-- COMMAND ----------

-- Create a global temporary view that shows the total number of products supplied by each supplier
create global temp view count_suplier as
select supplier, count(*) as total_suppliers from deltatables.default.product_info group by supplier;

-- COMMAND ----------

-- Display the total number of products supplied by each supplier
select * from global_temp.count_suplier;

-- COMMAND ----------

-- Create a view that shows the total number of products available in each category
create view deltatables.default.category_wise_product_count as
select category, count(*) as total_products from deltatables.default.product_info group by category;

-- COMMAND ----------

-- Display all tables in the 'deltatables.default' schema
show tables in deltatables.default;

-- COMMAND ----------

-- Materialized view to maintain up-to-date product counts per category, refreshed automatically every hour
create or replace materialized view category_wise_product_count_mv 
schedule every 1 hour
as select category, count(*) as total_products from deltatables.default.product_info group by category;

-- COMMAND ----------

