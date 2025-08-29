-- 10_tables_core.sql
-- Purpose: Define core external tables/views for the e-commerce dataset.
-- Note: You mentioned you'll primarily stage from Silver. These are external tables pointing at Silver.

USE CATALOG retail_analytics;
USE SCHEMA ecommerce;

-- Replace paths if your silver layout differs (e.g., /silver/ecommerce/orders)
-- External tables
CREATE TABLE IF NOT EXISTS orders
USING DELTA
LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/silver/ecommerce/orders';

CREATE TABLE IF NOT EXISTS orderlines
USING DELTA
LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/silver/ecommerce/orderlines';

CREATE TABLE IF NOT EXISTS customers
USING DELTA
LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/silver/ecommerce/customers';

CREATE TABLE IF NOT EXISTS products
USING DELTA
LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/silver/ecommerce/products';

CREATE TABLE IF NOT EXISTS returns
USING DELTA
LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/silver/ecommerce/returns';

-- Optional: convenience views with selected/renamed columns
-- CREATE OR REPLACE VIEW v_orders AS SELECT * FROM orders;
-- CREATE OR REPLACE VIEW v_orderlines AS SELECT * FROM orderlines;

-- Future: create gold star schema (dims/facts) with CTAS from these silver external tables
