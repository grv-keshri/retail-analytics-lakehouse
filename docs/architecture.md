# Architecture — Retail Analytics Lakehouse

## Overview
This project implements an **end-to-end Medallion Architecture** on Azure:
- **Landing** → Raw data in ADLS Gen2.
- **Bronze** → Incremental ingestion using Databricks Auto Loader.
- **Silver** → Conformed, deduplicated, and PII-masked Delta tables.
- **Gold** → **Unity Catalog managed tables**: a governed **Star Schema** and **One Big Table (OBT)**.

---

## Data Flow

```mermaid
flowchart LR
  %% ===== Styles =====
  classDef hidden fill:#f5f5f5,stroke:#bbb,color:#333;         %% not exposed (volumes/files)
  classDef internal fill:#e8f0fe,stroke:#6b8afd,color:#0b3;    %% exposed as tables (engineering/internal)
  classDef business fill:#e6ffed,stroke:#2ea043,color:#033;    %% exposed as tables (business/BI)

  %% ===== Catalog / Schemas =====
  subgraph C1["Catalog: retail_analytics"]
    direction LR

    %% RAW
    subgraph S1["Schema: raw"]
      direction TB
      LND["Volume: landing_ecommerce<br/>/landing/ecommerce/"]
      SCH["Volume: schemas_ecommerce<br/>/schemas/ecommerce/"]
      CHK["Volume: chk_ecommerce<br/>/chk/ecommerce/"]
    end

    %% BRONZE
    subgraph S2["Schema: bronze"]
      direction TB
      BRZ["Volume: bronze_ecommerce<br/>/bronze/ecommerce/"]
    end

    %% SILVER
    subgraph S3["Schema: silver"]
      direction TB
      S_ORD["Table: ecommerce_orders<br/>/silver/ecommerce/orders/"]
      S_OL["Table: ecommerce_orderlines<br/>/silver/ecommerce/orderlines/"]
      S_CUS["Table: ecommerce_customers<br/>/silver/ecommerce/customers/"]
      S_PROD["Table: ecommerce_products<br/>/silver/ecommerce/products/"]
      S_RET["Table: ecommerce_returns<br/>/silver/ecommerce/returns/"]
    end

    %% GOLD
    subgraph S4["Schema: gold (managed location: /gold/ecommerce/)"]
      direction TB
      G_D_
```