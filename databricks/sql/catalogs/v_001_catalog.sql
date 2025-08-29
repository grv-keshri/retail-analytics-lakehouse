-- Create a catalog with a managed location 
CREATE CATALOG IF NOT EXISTS retail_analytics
  MANAGED LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/uc-managed/';

-- Create schema
CREATE SCHEMA raw
  MANAGED LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/retail_analytics/_managed/raw/';
CREATE SCHEMA bronze
  MANAGED LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/retail_analytics/_managed/bronze/';
CREATE SCHEMA silver
  MANAGED LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/retail_analytics/_managed/silver/';
CREATE SCHEMA gold
  MANAGED LOCATION 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/retail_analytics/_managed/gold/';

-- Point to the catalog for following statements
USE CATALOG retail_analytics;


-- Create External locations
CREATE EXTERNAL LOCATION IF NOT EXISTS retail_bronze
  URL 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/bronze/'
  WITH (STORAGE CREDENTIAL `de-portfolio-ext-sc`)
  COMMENT 'Bronze layer root';

CREATE EXTERNAL LOCATION IF NOT EXISTS retail_silver
  URL 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/silver/'
  WITH (STORAGE CREDENTIAL `de-portfolio-ext-sc`)
  COMMENT 'Silver layer root';

CREATE EXTERNAL LOCATION IF NOT EXISTS retail_gold
  URL 'abfss://de-portfolio@newstoragegaurav.dfs.core.windows.net/gold/'
  WITH (STORAGE CREDENTIAL `de-portfolio-ext-sc`)
  COMMENT 'Gold layer root';