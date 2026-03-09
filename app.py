import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import plotly.express as px

# Load Data
marketing_data = pd.read_csv('marketing_campaigns.csv')
sales_funnel_data = pd.read_csv('sales_funnel.csv')
store_data = pd.read_csv('store_dim.csv')

# KPI Calculations
total_campaigns = marketing_data['campaign_id'].nunique()
total_sales = sales_funnel_data['sales'].sum()
total_stores = store_data['store_id'].nunique()

# Streamlit App Layout
st.title('Automotive Marketing Dashboard')

# KPI Cards
col1, col2, col3 = st.columns(3)

with col1:
    st.metric(label="Total Campaigns", value=total_campaigns)

with col2:
    st.metric(label="Total Sales", value=f"${total_sales:,.2f}")

with col3:
    st.metric(label="Total Stores", value=total_stores)

# Filtering Options
st.sidebar.header("Filters")
selected_campaign = st.sidebar.selectbox("Select Campaign", marketing_data['campaign_name'].unique())
filtered_marketing_data = marketing_data[marketing_data['campaign_name'] == selected_campaign]

# Visualization: Sales Funnel
st.subheader("Sales Funnel")
funnel_fig = px.bar(sales_funnel_data, x='stage', y='count', title='Sales Funnel Stages')
st.plotly_chart(funnel_fig)

# Further visualizations can be added here...

if st.button('Show Raw Data'):
    st.subheader('Raw Data')
    st.write(marketing_data)

# Run the application
if __name__ == '__main__':
    st.run()