
-- Pointing to the right catalog
USE CATALOG retail_analytics;

-- Catalog usage
GRANT USAGE ON CATALOG retail_analytics TO `myself`;

-- Schema access
GRANT USAGE, CREATE ON SCHEMA retail_analytics.raw    TO `myself`;
GRANT USAGE, CREATE ON SCHEMA retail_analytics.bronze TO `myself`;
GRANT USAGE, CREATE ON SCHEMA retail_analytics.silver TO `myself`;
GRANT USAGE, CREATE ON SCHEMA retail_analytics.gold   TO `myself`;


-- Current tables
GRANT SELECT, MODIFY ON TABLE silver.ecommerce_customers  TO `myself`;
GRANT SELECT, MODIFY ON TABLE silver.ecommerce_orderlines TO `myself`;
GRANT SELECT, MODIFY ON TABLE silver.ecommerce_orders     TO `myself`;
GRANT SELECT, MODIFY ON TABLE silver.ecommerce_products   TO `myself`;
GRANT SELECT, MODIFY ON TABLE silver.ecommerce_returns    TO `myself`;

-- ---
GRANT READ FILES, WRITE FILES ON EXTERNAL LOCATION `de-portfolio` TO `myself`;
