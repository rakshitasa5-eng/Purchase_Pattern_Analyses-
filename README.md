🛒 Market Basket Analysis – Purchase Pattern Analysis

📌 Project Overview

This project analyzes customer purchase behavior to identify frequently bought product combinations using Market Basket Analysis. By combining SQL for data cleaning, Power BI for visualization, and Python (Apriori Algorithm) for association rule mining, the project converts raw transactional data into actionable business insights that support data-driven decision-making in retail.

🎯 Objectives

    Clean and preprocess transactional sales data

    Analyze purchase patterns using SQL

    Build interactive dashboards using Power BI

    Apply the Apriori algorithm to identify frequent itemsets

    Generate association rules for cross-selling and bundling strategies

🗂 Dataset Description

The dataset contains transaction-level purchase records where each row represents a product purchased within a bill.

Key Columns:

    BillNo – Transaction ID

    Itemname – Product name

    Quantity – Units purchased

    Price – Unit price

    CustomerID – Customer identifier

    Country – Purchase location

🧹 Data Cleaning & Preparation (SQL)

    Removed null and duplicate records

    Filtered invalid quantities and prices

    Standardized product names

    Prepared clean transactional data for analysis

📊 Exploratory Data Analysis (Power BI)

    An interactive Power BI dashboard was created to visualize:

    Total transactions, revenue, customers, and products

    Top-selling and most frequently purchased products

    Revenue contribution by product

    Price vs quantity patterns

    Customer and country-wise distribution

🤖 Market Basket Analysis (Python – Apriori Algorithm)

    The Apriori algorithm was implemented using Python to:

    Identify frequent itemsets

    Generate association rules

    Measure relationships using Support, Confidence, and Lift

    These results help uncover hidden product relationships and customer buying patterns.

💡 Key Insights

    A small set of products contributes significantly to total revenue

    Certain products are consistently purchased together

    High-value transactions involve higher quantities and premium products

    Strong cross-selling and bundling opportunities exist

📈 Business Recommendations

    Introduce bundles for frequently associated products

    Optimize inventory for high-demand items

    Apply targeted promotions for high-value customers

    Use association rules for personalized product recommendations

🛠 Tools & Technologies Used

    SQL – Data cleaning and analysis

    Power BI – Dashboard and visualization

    Python – Apriori algorithm and association rule mining

📁 Project Structure
├── SQL_Queries/
├── PowerBI_Dashboard/
├── Python_Apriori/
├── Dataset/
├── Report/
└── README.md

✅ Conclusion

This project demonstrates an end-to-end data analytics workflow, showcasing how SQL, Power BI, and Python can be integrated to derive meaningful insights from transactional data. The findings support strategic business decisions related to sales optimization, product placement, and customer engagement.

👩‍💻 Author

Rakshita S A

Aspiring Data Analyst

📎 LinkedIn: https://www.linkedin.com/in/rakshita-sa-98a749256
