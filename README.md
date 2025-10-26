# 📊 Sales Analysis Case Study

This repository contains a comprehensive data analytics project focused on sales performance for a retail product. The analysis is based on a simulated dataset provided by BrightLearn and includes SQL queries, metrics development, and business insights.

## 📁 Dataset

- **File**: `Sales Case Study.csv`
  
- **Source**: BrightLearn Data Analytics
  
- **Contents**:
  
  - Date: Daily sales date
  - Sales: Total Rand value of sales
  - Cost of Sales: Total Rand value of cost of goods sold
  - Quantity Sold: Total units sold

## 🎯 Objectives

1. Calculate daily and average unit sales price
2. Determine daily gross profit percentage and per-unit profitability
3. Analyze price elasticity of demand across three promotional periods
4. Derive actionable business insights and recommendations
5. Visualize key metrics for decision-making

## 🧮 SQL Metrics

- **Daily Unit Price**  
  `Sales / Quantity Sold`

- **Average Unit Price**  
  `AVG(Sales / Quantity Sold)`

- **Gross Profit %**  
  `(Sales - Cost of Sales) / Sales * 100`

- **Gross Profit Per Unit %**  
  `((Sales - Cost of Sales) / Quantity Sold) / (Sales / Quantity Sold) * 100`

- **Price Elasticity of Demand (PED)**  
  `% Change in Quantity / % Change in Price`

## 📊 Final Summary Table

| Period        | Avg Unit Price (ZAR) | Avg Quantity Sold | Price Elasticity | Gross Profit % | Per Unit Profit % |
|---------------|----------------------|-------------------|------------------|----------------|-------------------|
| Before Promo  | 31.61%               | 6068.50           | -112.28%         |     -0.64      |      -0.61        |
| During Promo  | 32.74%               | 3118.40           | 371.93%          |      2.12      |       2.12        |
| After Promo   | 35.65%               | 5022.27           | -159.65%         |     -0.91      |      -0.91        |

## 📌 Key Insights

- Demand is highly elastic: small price increases lead to large drops in quantity sold.
- Profitability declines post-promotion despite higher prices.
- Best performance observed at lower price points.

## ✅ Recommendations

- Maintain lower pricing or frequent promotions to sustain volume.
- Monitor price thresholds to avoid demand collapse.
- Consider bundling or loyalty offers to retain customers.
- Use dashboards to visualize trends and support strategic decisions.

## 📈 Visualization Suggestions

- Bar charts for price and quantity comparisons
- Line charts for profit trends
- Column chart for the Avg Quantity sold
- Bar chart for the Avg Unit Sales Price

## 🛠 Tools Used
- Miro (For the planning
- SQL (Databricks syntax)
- Excel (for elasticity and visualization)
- Canva (For the Presentation)



---

