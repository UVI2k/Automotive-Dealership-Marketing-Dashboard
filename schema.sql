DROP TABLE IF EXISTS store_dim;
DROP TABLE IF EXISTS marketing_campaigns;
DROP TABLE IF EXISTS sales_funnel;

CREATE TABLE store_dim (
  store_id INTEGER PRIMARY KEY,
  store_name TEXT,
  city TEXT,
  region TEXT
);

CREATE TABLE marketing_campaigns (
  date TEXT,
  store_id INTEGER,
  channel TEXT,
  campaign_name TEXT,
  spend REAL,
  impressions INTEGER,
  clicks INTEGER,
  leads INTEGER,
  FOREIGN KEY (store_id) REFERENCES store_dim(store_id)
);

CREATE TABLE sales_funnel (
  date TEXT,
  store_id INTEGER,
  test_drives INTEGER,
  sales INTEGER,
  revenue REAL,
  FOREIGN KEY (store_id) REFERENCES store_dim(store_id)
);
