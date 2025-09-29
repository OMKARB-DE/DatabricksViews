# DatabricksViews
# Databricks Views & Materialized Views

This repository provides a Databricks project that manages inventory and product analytics using Delta Tables, SQL views (temporary, global, and persistent), and materialized views for automated, up-to-date aggregation.

## Features

- Delta Table for Product Data: Supports product info, pricing, stock, supplier, and launch date.
- Sample Data: Insert statements and importable CSV for immediate development.
- Analytical Views:
  - **Temporary View**: Summary of product stock by category.
  - **Global Temporary View**: Product count by supplier (session-wide).
  - **Persistent View**: Product count by category (schema-wide).
  - **Materialized View**: Up-to-date category aggregations, auto-refresh every hour.
- Query Examples: Ready-to-use SQL for basic analytics and reporting.

## Getting Started

### Prerequisites

- Databricks platform or any Spark SQL-compatible environment
- Git
- (Optional) A supported database tool for previewing CSVs

### Setup Steps

1. Clone the repository:

databricks-views/
├── DatabricksViews.sql
├── sample-data/
│ └── sample-products.csv
├── docs/
│ └── view-design.md
├── .gitignore
├── README.md
