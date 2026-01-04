import streamlit as st
import pandas as pd

st.set_page_config(page_title="NutriGuard AI", layout="wide")

st.title("🧠 NutriGuard AI – Health Risk Dashboard")

# Load sample data
df = pd.read_csv("../data/sample_health_data.csv")

# KPI Section
col1, col2, col3, col4 = st.columns(4)

col1.metric("👶 Children Monitored", df[df["person_type"] == "Child"].shape[0])
col2.metric("🤰 Pregnant Women", df[df["person_type"] == "Pregnant"].shape[0])
col3.metric("🚨 High-Risk Cases", df[df["risk_level"] == "High"].shape[0])
col4.metric("📊 Avg Risk Score", round(df["risk_score"].mean(), 1))

st.divider()

# Risk Table
st.subheader("🚨 High Risk Individuals")
high_risk_df = df[df["risk_level"] == "High"]
st.dataframe(high_risk_df)

st.divider()

# Risk Distribution Chart
st.subheader("📊 Risk Distribution")
risk_counts = df["risk_level"].value_counts()
st.bar_chart(risk_counts)
