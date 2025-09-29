# View Architecture and Rationale

- **category_wise_qty** (TEMPORARY): Calculates total stock in each product category, useful for session-scoped exploration.
- **count_suplier** (GLOBAL TEMP): Shows how many products each supplier provides, accessible across notebooks/sessions.
- **category_wise_product_count** (PERSISTENT): Tracks the total number of products per category, remains available in the schema.
- **category_wise_product_count_mv** (MATERIALIZED): Same as above, but optimized for frequent queries and refreshed every hour automatically.

All views are automatically generated after running the notebook top-down. This architecture supports ad-hoc reporting, dashboard embedding, and data API feeding.
