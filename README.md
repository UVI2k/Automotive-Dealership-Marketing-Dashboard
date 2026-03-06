# Automotive Dealership Marketing Analytics Dashboard (SQL + Power BI)

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

## Dashboard Setup 
1. Open Power BI → **Connect** → **SQLite**
2. Select `autocanada_marketing.db`
3. Use these sources:
   - `v_channel_kpis` (main dashboard)
   - `v_store_weekly` (store variation / weekly trend)

## Dashboard Pages
### Page 1 — Executive Overview
- KPI cards: Spend, Leads, Sales, Revenue, ROAS, CPL, CAC, Lead→Sale %
- Trend line: Spend vs Revenue (weekly)
- Bar: ROAS by Channel
<img width="1386" height="776" alt="Screenshot 2026-03-03 155018" src="https://github.com/user-attachments/assets/74fc3e94-a3b0-4886-b9b1-858300054cf2" />

### Page 2 — Channel Performance
- Table: Channel | Spend | Leads | Sales | ROAS | CPL | CAC
- Funnel chart: Leads → Test Drives → Sales (by channel)
<img width="1383" height="777" alt="Screenshot 2026-03-03 174625" src="https://github.com/user-attachments/assets/7d25aff1-a86c-4263-a3bb-9869c9a98729" />

### Page 3 — Store Performance (Variation)
- Store leaderboard by ROAS (top/bottom)
- Scatter: Spend vs Revenue by store (weekly)
<img width="1382" height="780" alt="Screenshot 2026-03-03 175930" src="https://github.com/user-attachments/assets/9a6d1902-6576-46b8-930d-a238bcc1511a" />


