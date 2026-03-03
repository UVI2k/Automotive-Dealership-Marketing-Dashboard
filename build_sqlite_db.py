import sqlite3
import pandas as pd
from pathlib import Path

BASE = Path(__file__).resolve().parent
db_path = BASE / "autocanada_marketing.db"

schema = (BASE / "schema.sql").read_text(encoding="utf-8")
views = (BASE / "views.sql").read_text(encoding="utf-8")

store = pd.read_csv(BASE / "store_dim.csv")
campaigns = pd.read_csv(BASE / "marketing_campaigns.csv")
funnel = pd.read_csv(BASE / "sales_funnel.csv")

con = sqlite3.connect(db_path)
cur = con.cursor()
cur.executescript(schema)

store.to_sql("store_dim", con, if_exists="append", index=False)
campaigns.to_sql("marketing_campaigns", con, if_exists="append", index=False)
funnel.to_sql("sales_funnel", con, if_exists="append", index=False)

cur.executescript(views)
con.commit()
con.close()

print(f"Built SQLite DB at: {db_path}")
