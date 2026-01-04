
# 📊 VenomSQL Corp – Executive Analytics Dashboard

<p align="center">
  <a href="https://github.com/Venom-Shivu">
    <img src="https://img.shields.io/badge/VenomSQL%20Corp-Executive%20Analytics%20Dashboard-1E3A8A?style=for-the-badge&logo=mysql&logoColor=white" alt="VenomSQL Banner">
  </a>
</p>

---

## Overview
This project demonstrates **analytics-engineering–grade SQL** using a **dbt-style layered modeling approach**.

It focuses on:
- clean separation of concerns  
- reusable transformations  
- performance-aware design  
- BI-ready analytical outputs  

This is **not ad-hoc SQL**.  
The structure mirrors how analytics engineers design **maintainable, scalable models** in production environments.

---

## Analytics Engineering Model Layers

### 🟡 Staging Models (`stg_*`)
Standardize raw source data:
- Column renaming and type normalization  
- Light filtering and cleanup  
- JSON field extraction  

Purpose: **Make raw data consistent and predictable.**

---

### 🟠 Intermediate Models (`int_*`)
Apply business logic:
- Joins and self-joins  
- Window functions and ranking logic  
- Business rule enforcement  

Purpose: **Centralize logic once, reuse everywhere.**

---

### 🔵 Mart Models (`fct_*, dim_*`)
Analytics-ready datasets:
- KPI and fact tables  
- Dimension models  
- Precomputed tables for dashboard performance  

Purpose: **Serve BI tools efficiently and reliably.**

---

## Performance Engineering

- **Index Strategy**  
  Indexes designed around join keys and aggregation paths used by mart queries.

- **Precomputed Tables (Materialized View Alternative)**  
  Used to avoid repeated heavy aggregations in read-heavy dashboard workloads  
  (MySQL-compatible replacement for materialized views).

- **Refresh Logic**  
  Tables can be refreshed manually or via scheduled orchestration  
  (cron, Airflow, dbt jobs, etc.).

---

## Data Quality & Testing (dbt Mindset)

Intended test coverage includes:
- `not_null` on primary keys  
- `unique` on user identifiers  
- `accepted_values` on categorical columns  
- `relationships` between users ↔ addresses  

Goal: **Trustworthy, production-ready analytics outputs.**

---

## Business Use Cases

- 📍 City-level user density (expansion planning)  
- 💰 Compensation & equity analysis  
- 🌙 UI preference (Dark Mode) adoption  
- 🔗 Internal referral network mapping  

Each use case maps directly to a **mart-level analytical model**.

---

## Project Structure (dbt-style)

```

models/
├── staging/
│   ├── stg_users.sql
│   ├── stg_addresses.sql
│   └── stg_user_preferences.sql
├── intermediate/
│   ├── int_user_locations.sql
│   ├── int_salary_rankings.sql
│   └── int_referral_network.sql
└── marts/
├── fct_city_user_density.sql
├── fct_salary_equity.sql
└── dim_referrals.sql

```

This structure supports:
- collaboration  
- clear ownership of logic  
- easy extension as requirements grow  

---

## ⚙️ How to Run Manually

### ⚠️ Prerequisites
The database must exist before executing models.

1. Navigate to the **`SQL-Code/`** folder  
2. Run **`00_setup_database.sql`** (creates the `venomsql` database)  
3. Run **`01_insert_users.sql`** and **`05_setup_addresses.sql`** (loads sample data)

These models follow a dbt-style pattern and therefore **do not include `USE` statements**.

### Running in MySQL Workbench / DBeaver
1. Execute **`00_init_session.sql`** (or run `USE venomsql;`)
2. Open the desired model file
3. Run the query

> If you see **“No database selected”**, step 1 was skipped.

---

## Interview Questions (Analytics Engineer Focus)

**Q1. How is this different from ad-hoc SQL?**  
A: Logic is structured into reusable transformation layers instead of being duplicated across queries.

**Q2. Where would dbt fit in this workflow?**  
A: dbt would orchestrate model execution, testing, documentation, and scheduling across environments.

**Q3. Why use precomputed tables instead of regular views?**  
A: For read-heavy dashboards, precomputation reduces execution cost and improves query latency.

**Q4. How would you add a new KPI?**  
A: Extend intermediate logic → create a new mart model → validate with tests → expose to BI.

**Q5. What makes this scalable for teams?**  
A: Clear model separation, centralized logic, predictable performance, and testable outputs.

---

## Skills Demonstrated

- Analytics-engineering mindset  
- dbt-style layered SQL modeling  
- Window functions & JSON querying  
- SQL performance optimization  
- BI-ready data design  

---

## 👤 Author

**Shivansh Yadav**  
Aspiring Analytics Engineer  
SQL • dbt • Python • Data Analytics  

GitHub: https://github.com/Venom-Shivu

---

*Designed to reflect real-world analytics engineering workflows — not isolated SQL scripts.*
```

---
