# Delivery Logistics Performance Analysis

## 📌 Project Overview

This project analyzes delivery logistics data to evaluate delivery performance, identify operational bottlenecks, understand factors contributing to delivery delays, and build predictive regression models.

The project follows an end-to-end analytics workflow using **Python, SQL, Machine Learning, and Power BI**.

## 🎯 Business Objective

- Evaluate overall delivery performance
- Compare route types
- Identify high-delay source centers and routes
- Analyze day-of-week and time-of-day patterns
- Study the relationship between distance and delivery time
- Analyze delay severity and distribution
- Build and evaluate regression models

## 📊 Dataset

- **Records:** 144,867
- **Columns:** 28
- **Unique Trips:** 14,817

The dataset includes trip information, route type, source/destination centers, actual and OSRM delivery times, distances, cutoff information, segment-level metrics, and delivery delay.

> The original raw dataset is excluded from GitHub using `.gitignore` because of its size.

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

### Visualization & BI
- Matplotlib
- Seaborn
- Power BI

### Database & Development
- SQL
- MySQL
- Jupyter Notebook
- Git
- GitHub

## 🔄 Project Workflow

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

## 📁 Project Structure

```text
Delivery/
│
├── dashboard/
│   ├── Delivery_Logistics_Performance_Analysis.pbix
│   └── screenshots/
│       └── Power BI dashboard screenshots
│
├── outputVisuals/
│   ├── Actual Time Vs OSRM Estimated Distance.png
│   ├── Actual time Vs OSRM Estimated Time.png
│   ├── Average Actual time by route_type.png
│   ├── Average TIme deviation By route_type.png
│   ├── Source center volume vs time deviation.png
│   ├── Top 15 feature importances- final random forest.png
│   ├── cutoff factor vs Time deviation.png
│   ├── distribution of actual delivery time.png
│   ├── output.png
│   └── time Deviation By cutoff Status.png
│
├── data/
│   ├── raw/
│   │   └── delhivery_data.csv
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

## 🧹 Data Preparation

The data preparation process included:

1. Understanding the dataset structure
2. Checking data types
3. Identifying missing values
4. Converting timestamp columns
5. Cleaning and validating the dataset
6. Creating delivery delay metrics
7. Creating route-level features
8. Creating day-of-week features
9. Creating start-hour features
10. Preparing the dataset for business analysis and modeling

Final analytical dataset: **144,867 records × 28 columns**

## 📈 Business Analysis

### 1. Route Type Performance

Delivery performance was compared between **Carting** and **FTL** using actual time, expected time, delay, and delay percentage.

**Key insight:** FTL operations showed substantially higher absolute average delays than Carting.

### 2. Source Center Performance

Source centers were compared to identify locations associated with high delivery delays.

**Key insight:** Several source centers showed exceptionally high average delays, indicating potential hub-level operational bottlenecks.

### 3. Source → Destination Route Performance

Individual source-to-destination routes were analyzed using records, unique trips, actual time, expected time, delay, and delay percentage.

**Key insight:** Several routes showed extremely high average delays, with the worst-performing routes exceeding **800 minutes** of average delay.

### 4. Day-of-Week Performance

| Day | Average Delay (min) |
|---|---:|
| Monday | 203.48 |
| Tuesday | 192.68 |
| Wednesday | 213.18 |
| Thursday | 203.23 |
| Friday | 198.94 |
| Saturday | 200.31 |
| Sunday | 207.45 |

**Key insight:** Wednesday had the highest average delay, while Tuesday had the lowest.

### 5. Time-of-Day Performance

Some of the highest average delays occurred around:

- **13:00 → 334.80 minutes**
- **17:00 → 320.69 minutes**
- **22:00 → 304.53 minutes**

**Key insight:** Certain operating hours experience substantially higher delays.

### 6. Distance vs Delivery Time

The correlation between actual distance and actual delivery time was:

**0.9787**

**Key insight:** Longer delivery distances are strongly associated with longer actual delivery times.

### 7. Delay Distribution

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

## 🤖 Machine Learning

A supervised regression approach was used to model delivery-related performance from engineered logistics features.

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

### Model Comparison

| Model | MAE | RMSE | R² |
|---|---:|---:|---:|
| Baseline Linear Regression | 55.54 | 110.63 | 0.9680 |
| Leakage-Safe Random Forest | 41.76 | 98.29 | 0.9748 |
| Random Forest | 28.97 | 74.78 | 0.9854 |

**Result:** Standard Random Forest achieved the strongest predictive performance among the evaluated models, while the leakage-safe Random Forest also demonstrated strong performance under a more conservative evaluation setup.

### Feature Engineering

Engineered features represented:

- Distance-related variables
- Route information
- Timing-related variables
- Cutoff-related variables
- Operational delivery metrics

### Feature Importance

Random Forest feature importance was analyzed to identify variables contributing most strongly to model predictions.

## 📊 Visual Analysis

Python-generated visualizations are stored in `outputVisuals/`.

Key visuals include:

- Actual Time vs OSRM Estimated Distance
- Actual Time vs OSRM Estimated Time
- Average Actual Time by Route Type
- Average Time Deviation by Route Type
- Source Center Volume vs Time Deviation
- Cutoff Factor vs Time Deviation
- Distribution of Actual Delivery Time
- Time Deviation by Cutoff Status
- Top 15 Random Forest Feature Importances

## 🗄️ SQL Analysis

SQL was used for:

- Database schema creation
- Data loading
- Business analysis queries
- Reusable analytical views

SQL files are available in the `sql/` directory.

## 📊 Overall Performance KPIs

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

## 📊 Power BI Dashboard

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

The Power BI file is available at:

```text
dashboard/Delivery_Logistics_Performance_Analysis.pbix
```

Dashboard screenshots are stored in:

```text
dashboard/screenshots/
```

## 💡 Key Business Insights

1. **High Overall Delay:** 97.84% of delivery records are delayed.
2. **Significant Average Delay:** Average actual delivery time is 416.93 minutes compared with an average expected time of 213.87 minutes.
3. **FTL Delay Exposure:** FTL deliveries experience substantially higher absolute average delays compared with Carting.
4. **Hub-Level Bottlenecks:** Several source centers demonstrate exceptionally high average delays.
5. **Route-Level Bottlenecks:** Specific source-to-destination routes experience extremely high delays.
6. **Time-Based Delay Patterns:** Certain start hours show significantly higher average delays.
7. **Distance-Time Relationship:** Actual distance and actual delivery time have a very strong positive correlation of approximately 0.979.
8. **Extreme Delays:** 11.48% of records fall into the extreme-delay category.

## 🎯 Business Recommendations

- Investigate high-delay source centers for potential hub-level bottlenecks.
- Prioritize the worst-performing source-to-destination routes for operational review.
- Investigate causes of high absolute delays in FTL operations.
- Review staffing, vehicle availability, and dispatch processes during high-delay hours.
- Consider distance when establishing realistic delivery-time expectations.
- Monitor extreme-delay trips separately from normal delays.
- Track average delay, delayed-record percentage, and extreme-delay percentage as ongoing operational KPIs.

## 🎯 Project Outcome

The project demonstrates an end-to-end analytics workflow:

**Data Cleaning → EDA → Feature Engineering → Machine Learning → SQL Analysis → Business Insights → Power BI Dashboard**

The analysis identified major delivery-delay patterns across route types, source centers, routes, days, operating hours, distance, and delay severity, providing a foundation for targeted operational improvements.

---

## 👤 Author

**Tharun Kumar**

Data Analytics & Machine Learning Portfolio Project
