# Storage Layout — Retail Analytics Lakehouse

This project uses **Unity Catalog (UC)** for Gold layer governance.  
Therefore, the ADLS storage layer is kept simple: it only contains **Landing, Bronze, and Silver**, plus checkpoints and schema tracking.

## Container
- **Name:** `de-portfolio`

## Folder structure

landing/
    ecommerce/
        orders/
        orderlines/
        customers/
        products/
        returns/

bronze/
    ecommerce/

silver/
    ecommerce/

chk/
    ecommerce/ # checkpoints for Auto Loader & streaming jobs

schemas/
    ecommerce/ # Auto Loader schema tracking