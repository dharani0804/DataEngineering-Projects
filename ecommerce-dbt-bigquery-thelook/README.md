# 🛒 TheLook Ecommerce Analytics Engineering Project

An end-to-end analytics engineering project built using **BigQuery + dbt + Looker Studio**.

This project demonstrates how to design, model, transform, and visualize ecommerce data using modern data engineering tools.

---

## 🚀 Architecture

Raw Data (BigQuery Public Dataset)  
→ dbt Staging Layer  
→ dbt Intermediate Layer  
→ dbt KPI Mart Layer  
→ Looker Studio Dashboard  

Tech Stack:
- **Google BigQuery** – Cloud Data Warehouse
- **dbt (Core)** – Transformation & Modeling
- **Looker Studio** – BI Dashboard
- **GitHub** – Version Control

---

## 🏗 Data Model

The warehouse follows a layered architecture:
### 🔹 Staging Layer
- Standardized raw tables
- Renamed columns
- Type casting
- Added derived date fields

Tables:
- `stg_orders`
- `stg_order_items`
- `stg_users`
- `stg_products`
- `stg_events`

---

### 🔹 Intermediate Layer
Business-enriched fact models.

- `int_orders_enriched`
  - Order + user attributes
  - Grain: 1 row per order

- `int_order_items_enriched`
  - Order item + product attributes
  - Grain: 1 row per order item

---

### 🔹 Mart Layer (KPI Tables)

Aggregated, dashboard-ready tables.

- `mart_kpis_daily`
  - Daily revenue, orders, AOV, margin
  - Grain: date

- `mart_kpis_daily_by_acquisition`
  - Performance by country & traffic source
  - Grain: date, country, traffic_source

- `mart_sales_daily_by_product`
  - Revenue & margin by category and brand
  - Grain: date, category, brand

---

## 📊 KPI Definitions

- **Orders** = count(order_id)
- **Revenue** = sum(sale_price)
- **Units Sold** = count(order_item_id)
- **AOV (Average Order Value)** = revenue / orders
- **Gross Margin** = sum(sale_price - cost)
- **Gross Margin %** = gross_margin / revenue
- **Orders per User** = orders / distinct users

All KPIs are computed in dbt marts to ensure consistency.

---

## 📈 Dashboard

Built in **Looker Studio** connected directly to BigQuery marts.

### Dashboard Pages
1. Executive Overview
2. Acquisition Performance
3. Product Performance

🔗 **Live Dashboard:**  
[View Looker Studio Dashboard](PASTE_YOUR_LINK_HERE)

(Screenshots available in `/dashboard/screenshots/`)

---

## 🧠 Key Engineering Decisions

- Implemented layered warehouse architecture
- Maintained strict grain discipline
- Used dbt `ref()` and `source()` for lineage tracking
- Overrode default schema generation for clean environment separation
- Designed marts for analytical clarity (no double counting)

---

## 🔄 How to Run This Project

1. Clone repo
2. Configure `profiles.yml` for BigQuery
3. Run:

---

## 📌 Future Enhancements

- Cohort retention modeling
- Funnel conversion analysis
- Incremental models
- Automated dbt tests
- CI/CD pipeline
- AI-powered KPI diagnostic agent

---

## 🎯 Why This Project?

This project demonstrates:

- Data modeling discipline
- Analytics engineering best practices
- Cloud data warehouse expertise
- BI integration
- End-to-end ownership

---

Built as part of a modern data engineering portfolio.

🔗 Dashboard:https://lookerstudio.google.com/reporting/ff1c41a6-58ce-4343-be87-4a9ae43dd8fd
