-- These are external tables pointing at Silver.

USE CATALOG retail_analytics;
USE SCHEMA silver;


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
