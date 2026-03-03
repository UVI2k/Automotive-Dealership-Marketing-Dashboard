# Automotive Dealership Marketing Analytics Dashboard (SQL + Tableau)

This is a marketing analytics project that demonstrates:
- Campaign effectiveness analysis
- KPI design (CTR, CPL, CAC, ROAS, funnel conversion)
- Store-level performance variation
- SQL transformation layer (views)
- Dashboard-ready dataset for Tableau / Power BI

## What’s Included
- `store_dim.csv`, `marketing_campaigns.csv`, `sales_funnel.csv` (90 days, 4 stores, 4 channels)
- `autocanada_marketing.db` (SQLite database with tables + views)
- SQL scripts:
  - `schema.sql` (tables)
  - `views.sql` (KPI views)
- Suggested dashboard layout

## KPI Definitions
- **CTR** = clicks / impressions  
- **Click→Lead Rate** = leads / clicks  
- **Lead→Test Drive %** = test_drives / leads  
- **Lead→Sale %** = sales / leads  
- **CPL** = spend / leads  
- **CAC** = spend / sales  
- **ROAS** = revenue / spend  

## Tableau Setup 
1. Open Tableau → **Connect** → **SQLite**
2. Select `autocanada_marketing.db`
3. Use these sources:
   - `v_channel_kpis` (main dashboard)
   - `v_store_weekly` (store variation / weekly trend)

## Dashboard Pages
### Page 1 — Executive Overview
- KPI cards: Spend, Leads, Sales, Revenue, ROAS, CPL, CAC, Lead→Sale %
- Trend line: Spend vs Revenue (weekly)
- Bar: ROAS by Channel

### Page 2 — Channel Performance
- Table: Channel | Spend | Leads | Sales | ROAS | CPL | CAC
- Funnel chart: Leads → Test Drives → Sales (by channel)

### Page 3 — Store Performance (Variation)
- Store leaderboard by ROAS (top/bottom)
- Scatter: Spend vs Revenue by store (weekly)
- Heatmap (optional): Store × Channel ROAS


