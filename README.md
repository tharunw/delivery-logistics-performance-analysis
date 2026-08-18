# Delivery Logistics Performance Analysis

## 📌 Project Overview

This project analyzes delivery logistics data to evaluate delivery performance, identify operational bottlenecks, and understand the factors contributing to delivery delays.

The project uses **Python, SQL, Machine Learning, and Power BI** to transform raw logistics data into business insights, predictive models, and an interactive dashboard.

## 🎯 Business Objective

The main objective is to understand:

- Overall delivery performance
- Route type performance
- Source center performance
- Source-to-destination route performance
- Day-of-week delivery patterns
- Time-of-day delivery patterns
- Relationship between distance and delivery time
- Distribution and severity of delivery delays
- Predictive performance of regression models

## 📊 Dataset

The dataset contains delivery-level logistics information including trip information, route type, source and destination centers, actual and expected/OSRM delivery time, actual and OSRM distance, cutoff information, segment-level delivery metrics, and delivery delay.

### Dataset Size

- **Records:** 144,867
- **Columns:** 28
- **Unique Trips:** 14,817

## 🛠️ Tools & Technologies

### Programming & Data Analysis
- Python
- Pandas
- NumPy
- SciPy
- Scikit-learn

### Machine Learning
- Supervised Learning
- Regression
- Baseline Linear Regression
- Random Forest Regression
- Leakage-Safe Random Forest
- Feature Engineering
- Model Evaluation
- Feature Importance

### Visualization
- Matplotlib
- Seaborn
- Power BI

### Database & Development
- SQL
- MySQL
- Jupyter Notebook
- Git
- GitHub

# 🔄 Project Workflow

```text
Raw Dataset
     ↓
Data Understanding & Cleaning
     ↓
Exploratory Data Analysis
     ↓
Feature Engineering
     ↓
Machine Learning Modeling
     ↓
Model Evaluation
     ↓
SQL Business Analysis
     ↓
Business Insights
     ↓
Power BI Dashboard
     ↓
Executive Summary
```

# 📁 Project Structure

```text
Delivery/
│
├── dashboard/
│   └── Delivery_Logistics_Performance_Analysis.pbix
│
├── data/
│   ├── raw/
│   │   └── delhivery_data.csv
│   │
│   └── processed/
│       └── delivery_cleaned.csv
│
├── notebooks/
│   ├── 01_data_understanding_and_clean.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_feature_engineering_and_modeling.ipynb
│   └── 04_business_insights.ipynb
│
├── sql/
│   ├── business_queries.sql
│   ├── data_loading.sql
│   ├── schema.sql
│   └── views.sql
│
├── src/
│   ├── data_cleaning.py
│   ├── feature_engineering.py
│   └── modeling.py
│
├── .gitignore
├── README.md
└── requirements.txt
```

# 🧹 Data Preparation

The data preparation process included:

1. Understanding the dataset structure.
2. Checking data types.
3. Identifying missing values.
4. Converting timestamp columns into datetime format.
5. Cleaning and validating the dataset.
6. Creating delivery delay metrics.
7. Creating route-level features.
8. Creating day-of-week features.
9. Creating start-hour features.
10. Preparing the cleaned dataset for business analysis and modeling.

Final analytical dataset:

**144,867 records × 28 columns**

# 📈 Business Analysis

## 1. Route Type Performance

Delivery performance was compared between **Carting** and **FTL** using average actual time, expected time, delay, and delay percentage.

**Key insight:** FTL operations showed substantially higher absolute average delays than Carting.

## 2. Source Center Performance

Delivery performance was analyzed across source centers to identify locations associated with high delays.

**Key insight:** Several source centers showed exceptionally high average delays, indicating potential hub-level operational bottlenecks.

## 3. Source → Destination Route Performance

Individual source-to-destination routes were analyzed using records, unique trips, average actual time, average expected time, average delay, and delay percentage.

**Key insight:** Several routes showed extremely high average delays, with the worst-performing routes exceeding **800 minutes** of average delay.

## 4. Day-of-Week Performance

Delivery performance was compared across all days of the week.

| Day | Average Delay (min) |
|---|---:|
| Monday | 203.48 |
| Tuesday | 192.68 |
| Wednesday | 213.18 |
| Thursday | 203.23 |
| Friday | 198.94 |
| Saturday | 200.31 |
| Sunday | 207.45 |

**Key insight:** Delay varies across the week, with Wednesday showing the highest average delay and Tuesday the lowest.

## 5. Time-of-Day Performance

Delivery delays were analyzed according to the start hour.

Some of the highest average delays occurred around:

- **13:00 → 334.80 minutes**
- **17:00 → 320.69 minutes**
- **22:00 → 304.53 minutes**

**Key insight:** Certain operating hours experience substantially higher delays.

## 6. Distance vs Delivery Time

The relationship between distance and delivery time was analyzed using descriptive statistics, correlation analysis, and a scatter plot.

The correlation between actual distance and actual delivery time was:

**0.9787**

**Key insight:** Longer delivery distances are strongly associated with longer actual delivery times.

## 7. Delay Distribution

The distribution and severity of delivery delays were analyzed using mean, quartiles, IQR, extreme-delay threshold, and distribution visualization.

| Metric | Value |
|---|---:|
| Mean Delay | 203.06 min |
| Q1 | 21 min |
| Q3 | 247 min |
| IQR | 226 min |
| Upper Bound | 586 min |
| Extreme Delay Records | 16,632 |
| Extreme Delay Percentage | 11.48% |

**Key insight:** Delivery delays have a strongly right-skewed distribution with a significant long tail of severe delays.

# 🤖 Machine Learning

A supervised regression approach was used to model delivery-related performance from engineered logistics features.

## Models Used

### Baseline Linear Regression

- **MAE:** 55.54
- **RMSE:** 110.63
- **R²:** 0.9680

### Random Forest Regression

- **MAE:** 28.97
- **RMSE:** 74.78
- **R²:** 0.9854

### Leakage-Safe Random Forest

- **MAE:** 41.76
- **RMSE:** 98.29
- **R²:** 0.9748

## Model Comparison

| Model | MAE | RMSE | R² |
|---|---:|---:|---:|
| Baseline Linear Regression | 55.54 | 110.63 | 0.9680 |
| Leakage-Safe Random Forest | 41.76 | 98.29 | 0.9748 |
| Random Forest | 28.97 | 74.78 | 0.9854 |

Lower MAE and RMSE indicate better prediction accuracy, while higher R² indicates that the model explains more variance in the target.

**Result:** The standard Random Forest achieved the strongest predictive performance among the evaluated models. The leakage-safe Random Forest also demonstrated strong performance under a more conservative evaluation setup.

## Feature Engineering

Features were engineered from the logistics data to represent delivery and operational characteristics, including distance, route information, timing-related variables, and other available operational factors.

## Feature Importance

Feature importance was analyzed using the Random Forest model to identify variables contributing most strongly to predictions.

# 🗄️ SQL Analysis

SQL was used for database setup, data loading, business queries, and reusable analytical views.

The SQL component includes:

- Database schema creation
- Data loading
- Business analysis queries
- Analytical views

# 📊 Overall Performance KPIs

| KPI | Value |
|---|---:|
| Total Records | 144,867 |
| Unique Trips | 14,817 |
| Average Actual Time | 416.93 min |
| Average Expected Time | 213.87 min |
| Average Delay | 203.06 min |
| Delay Percentage | 94.95% |
| Delayed Records Percentage | 97.84% |
| Extreme Delay Percentage | 11.48% |

# 📊 Power BI Dashboard

The interactive Power BI dashboard contains **9 pages**:

1. Overall Delivery Performance
2. Route Type Performance
3. Source Center Performance
4. Source → Destination Route Performance
5. Day-of-Week Performance
6. Time-of-Day Performance
7. Distance vs Delivery Time
8. Delay Distribution
9. Executive Summary

The dashboard includes KPI cards, route comparisons, time-based analysis, distance-time analysis, delay distribution, and an executive summary.

# 💡 Key Business Insights

1. **High Overall Delay:** 97.84% of delivery records are delayed.
2. **Significant Average Delay:** Average actual delivery time is 416.93 minutes compared with an average expected time of 213.87 minutes.
3. **FTL Delay Exposure:** FTL deliveries experience substantially higher absolute average delays compared with Carting.
4. **Hub-Level Bottlenecks:** Several source centers demonstrate exceptionally high average delays.
5. **Route-Level Bottlenecks:** Specific source-to-destination routes experience extremely high delays.
6. **Time-Based Delay Patterns:** Certain start hours show significantly higher average delays.
7. **Distance-Time Relationship:** Actual distance and actual delivery time have a very strong positive correlation of approximately 0.979.
8. **Extreme Delays:** 11.48% of records fall into the extreme-delay category.

# 🎯 Business Recommendations

Based on the analysis:

- Investigate high-delay source centers for potential hub-level bottlenecks.
- Prioritize the worst-performing source-to-destination routes for operational review.
- Investigate the causes of high absolute delays in FTL operations.
- Review staffing, vehicle availability, and dispatch processes during high-delay hours.
- Consider distance when establishing realistic delivery-time expectations.
- Monitor extreme-delay trips separately from normal delays.
- Track average delay, delayed-record percentage, and extreme-delay percentage as ongoing operational KPIs.

# 🎯 Project Outcome

The project demonstrates an end-to-end analytics workflow:

**Data Cleaning → EDA → Feature Engineering → Machine Learning → SQL Analysis → Business Insights → Power BI Dashboard**

The analysis identified major delivery-delay patterns across route types, source centers, routes, days, operating hours, distance, and delay severity, providing a foundation for targeted operational improvements.

---

## 👤 Author

**Tharun Kumar**

Data Analytics & Machine Learning Portfolio Project
