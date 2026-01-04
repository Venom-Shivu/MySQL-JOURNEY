
# 📊 VenomSQL Corp – Executive Analytics Dashboard

<p align="center">
  <a href="https://github.com/Venom-Shivu">
    <img src="https://img.shields.io/badge/VenomSQL%20Corp-Executive%20Analytics%20Dashboard-1E3A8A?style=for-the-badge&logo=postgresql&logoColor=white" alt="VenomSQL Banner">
  </a>
</p>


## Overview
This project showcases **analytics-engineering–grade SQL** aligned with modern **dbt-style data modeling**.  
It emphasizes **layered transformations, performance optimization, and scalable analytical design**, reflecting real-world production analytics workflows.

This is not ad-hoc querying — it mirrors how analytics engineers build **maintainable, BI-ready data models**.

---

## Analytics Engineering Model Layers

### 🟡 Staging Models (`stg_*`)
Prepare and standardize raw source data:
- Column renaming and type normalization  
- Basic filtering  
- JSON field extraction  

---

### 🟠 Intermediate Models (`int_*`)
Apply business logic and relationships:
- Table joins and self-joins  
- Window functions and ranking logic  
- Business rule enforcement  

---

### 🔵 Mart Models (`fct_*, dim_*`)
Analytics-ready outputs consumed by BI tools:
- KPI and fact tables  
- Dimension models  
- Materialized views for dashboards  

---

## Performance Engineering

- **Index Strategy**  
  Optimized joins and aggregations for mart-level queries and BI workloads.

- **Materialized Views**  
  Precomputed marts to support **low-latency, read-heavy dashboards**.

- **Refresh Logic**  
  Designed to mirror scheduled dbt runs or orchestration tools.

---

## Data Quality & Testing (dbt mindset)

- `not_null` on primary keys  
- `unique` on user identifiers  
- `accepted_values` on categorical fields  
- `relationships` between users ↔ addresses  

Ensures **trustworthy, production-ready analytics outputs**.

---

## Business Use Cases

- 📍 City-level user density analysis (expansion planning)  
- 💰 Compensation & equity audit  
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

This structure supports **team collaboration, testing, and scalability**.

---

## ⚙️ How to Run Manually

Since these are dbt-style models (pure `SELECT` logic), the scripts do not include a `USE` statement.

**To run them in MySQL Workbench / DBeaver:**
1.  Run `USE venomsql;` in your query tab first.
2.  Execute the model script.

*If you see "Error: No database selected", you skipped step 1!*

---

## Interview Questions (Analytics Engineer Focus)

**Q1. How is this different from ad-hoc SQL?**  
A: Logic is organized into reusable transformation layers with clear ownership, enabling scale and collaboration.

**Q2. Where would dbt fit in this workflow?**  
A: dbt would orchestrate staging → intermediate → mart models with testing and scheduled executions.

**Q3. Why materialized views instead of regular views?**  
A: For read-heavy dashboards, precomputation reduces query latency and execution cost.

**Q4. How would you add a new KPI?**  
A: Extend intermediate logic → create a new mart model → add tests → expose to the BI layer.

**Q5. What makes this scalable for a growing data team?**  
A: Clear model separation, test coverage, and performance-aware design.

---

## Skills Demonstrated

- dbt-style layered data modeling  
- SQL performance optimization  
- Window functions & JSON querying  
- BI-ready analytics design  
- Analytics engineering best practices

---

## 👤 Author

**Shivansh Yadav**  
Aspiring Analytics Engineer | SQL • dbt • Python • Data Analytics  
GitHub: [https://github.com/Venom-Shivu](https://github.com/Venom-Shivu)

---

*Designed to reflect real-world analytics engineering workflows — not isolated SQL scripts.*

---
