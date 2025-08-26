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
A[Landing: ADLS Gen2] --> B[Bronze: Delta (external)]
B --> C[Silver: Delta (external)]
C --> D[(Gold Star: UC managed tables)]
C --> E[(Gold OBT: UC managed table)]

subgraph Orchestration
ADF[Azure Data Factory]
DBX[Azure Databricks Jobs + SQL Warehouse]
end

A -->|ADF copy| B
B -->|Databricks Auto Loader (availableNow)| C
C -->|Databricks SQL (MERGE/CTAS)| D
C -->|Databricks SQL (CTAS)| E
