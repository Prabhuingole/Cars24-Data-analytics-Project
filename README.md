# Cars24-Data-analytics-Project
Capturing insights from data of reselled cars for Cars24 overall India
# 🚗 Used Car Market Analysis - Cars24 Dataset

This project uses the Cars24 dataset to provide insights into the used car market in India. The analysis was conducted using MySQL for data preprocessing and aggregation and Tableau for interactive data visualization.

## 📁 Project Structure
📦Used-Car-Market-Analysis ┣ 📂SQL_Scripts ┃ ┗ car24_script.sql ┣ 📂Tableau_Dashboard ┃ ┗ final_dashboard.twbx ┣ 📂Dataset ┃ ┗ Dataset_Used_Cars.csv ┗ README.md


## 📊 Objectives

- Understand market trends in used car reselling.
- Analyze pricing dynamics based on car make, model, year, and region.
- Identify the most popular car makes and models.
- Visualize regional price variations using Tableau maps and dashboards.

## 🧹 Data Preprocessing

Performed in **MySQL Workbench**:
- Cleaned invalid entries (`'Call'` in price, `'0'` in engine capacity).
- Converted data types (e.g., price, year, engine capacity).
- Handled null and inconsistent values using `WHERE`, `CASE`, and `COALESCE`.
- Used `CAST()` and `REPLACE()` functions to clean numeric fields.

## 🔍 Key SQL Tasks

- Aggregate analysis using `AVG()`, `COUNT()`, `MAX()` grouped by model, make, year, etc.
- Filtered rows where important fields (price, engine, distance) were NULL or invalid.
- Created a staging table for cleaned data.
- Generated custom SQL queries for Tableau.

## 📍 Tableau Dashboard

### Includes:
- Regional average price maps.
- Most popular car makes and models.
- Price trends by year of manufacture.
- Mileage analysis by make/model.

### Key Insights:
- Certain brands like **Maruti Suzuki**, **Hyundai**, and **Honda** dominate the resale market.
- Metropolitan cities show higher resale prices.
- Newer cars (less than 5 years old) fetch significantly better prices.
- Diesel cars generally show higher mileage than petrol variants.

## 💡 Recommendations

- **For Dealerships**: Focus inventory on top-performing brands and popular cities.
- **For Buyers**: Consider cars under 5 years old for best price-to-value ratio.
- **For Sellers**: Highlight location and engine capacity for better pricing.

## 🛠️ Tools Used

- **MySQL 8.0** (Workbench)
- **Tableau Public / Desktop**
- **Excel / CSV for raw data**
- **VS Code / GitHub for code management**

## ✅ Getting Started

1. Clone the repo:  
   ```bash
   git clone https://github.com/your-username/used-car-market-analysis.git

