DROP VIEW IF EXISTS v_channel_kpis;
DROP VIEW IF EXISTS v_store_weekly;

CREATE VIEW v_channel_kpis AS
SELECT
  m.date,
  m.store_id,
  s.store_name,
  s.city,
  s.region,
  m.channel,
  SUM(m.spend) AS spend,
  SUM(m.impressions) AS impressions,
  SUM(m.clicks) AS clicks,
  SUM(m.leads) AS leads,
  SUM(f.test_drives) AS test_drives,
  SUM(f.sales) AS sales,
  SUM(f.revenue) AS revenue,

  CASE WHEN SUM(m.impressions) > 0 THEN 1.0 * SUM(m.clicks) / SUM(m.impressions) END AS ctr,
  CASE WHEN SUM(m.clicks) > 0 THEN 1.0 * SUM(m.leads) / SUM(m.clicks) END AS click_to_lead_rate,
  CASE WHEN SUM(m.leads) > 0 THEN 1.0 * SUM(f.test_drives) / SUM(m.leads) END AS lead_to_testdrive_rate,
  CASE WHEN SUM(m.leads) > 0 THEN 1.0 * SUM(f.sales) / SUM(m.leads) END AS lead_to_sale_rate,

  CASE WHEN SUM(m.leads) > 0 THEN 1.0 * SUM(m.spend) / SUM(m.leads) END AS cpl,
  CASE WHEN SUM(f.sales) > 0 THEN 1.0 * SUM(m.spend) / SUM(f.sales) END AS cac,
  CASE WHEN SUM(m.spend) > 0 THEN 1.0 * SUM(f.revenue) / SUM(m.spend) END AS roas

FROM marketing_campaigns m
JOIN store_dim s ON s.store_id = m.store_id
LEFT JOIN sales_funnel f
  ON f.store_id = m.store_id AND f.date = m.date

GROUP BY m.date, m.store_id, s.store_name, s.city, s.region, m.channel;

CREATE VIEW v_store_weekly AS
SELECT
  store_id,
  store_name,
  region,
  strftime('%Y-%W', date) AS year_week,
  SUM(spend) AS spend,
  SUM(leads) AS leads,
  SUM(sales) AS sales,
  SUM(revenue) AS revenue,
  CASE WHEN SUM(spend) > 0 THEN 1.0 * SUM(revenue) / SUM(spend) END AS roas,
  CASE WHEN SUM(leads) > 0 THEN 1.0 * SUM(sales) / SUM(leads) END AS lead_to_sale_rate
FROM v_channel_kpis
GROUP BY store_id, store_name, region, strftime('%Y-%W', date);
