# Retail_Orders_Data_Analysis_Project

Project Description: In this project, I utilized both Python and SQL to analyze a retail orders dataset sourced from Kaggle. I performed data extraction, transformation, and loading (ETL) operations by cleaning the data in Python—handling null values, deriving new columns for discount, sale price, and profit, and converting data types. The clean data was then loaded into SQL for advanced querying and analysis. Using SQL, I identified the top 10 revenue-generating products, analyzed month-over-month sales growth between 2022 and 2023, and determined the category with the highest sales growth. These insights helped uncover trends and informed business decisions.

Tools & Technologies used : 
1) Python:
* Used for data extraction, cleaning, transformation, and preprocessing.
* Libraries: pandas (for data manipulation), zipfile (for file extraction), and datetime (for date conversion).
2) SQL:
* Performed advanced data analysis, querying, and aggregation (e.g., identifying top-selling products, month-over-month sales growth).
3) Kaggle:
* Source of the dataset used for retail orders analysis.
4) SQLAlchemy:
* Python library used to establish a connection between Python and SQL Server for data loading.
5) PostgreSQL:
* Database management system used to store, query, and analyze the cleaned data.

* ETL (Extract, Transform, Load) process in the Retail Orders Data Analysis project involved:

1) Extract: Data was sourced from the Kaggle retail orders dataset, downloaded and extracted using Python.
2) Transform: Data cleaning was performed using Python—handling missing values, converting data types, renaming columns, and deriving new columns (e.g., discount, sale price, and profit).
Additional transformations included dropping irrelevant columns and calculating key metrics such as month-over-month growth.
3) Load: The cleaned and transformed data was loaded into PostgreSQL using SQLAlchemy for further querying and analysis.
4) Analyze: SQL was used to perform advanced analysis, identifying top products, category performance, and growth trends.

Key Insights : 
1) The top 10 products contributed significantly to total revenue, highlighting areas to focus on for inventory optimization and targeted marketing.
2) Regional analysis revealed varying product demand across different regions, emphasizing the need for localized strategies to boost sales.
3) Month-over-month sales growth between 2022 and 2023 identified key periods of higher sales, indicating opportunities for seasonal promotions.
4) Specific product categories showed peak sales during certain months, uncovering consumer behavior trends and potential seasonal patterns.
5) One sub-category exhibited significant profit growth in 2023 compared to 2022, suggesting it became more popular and profitable, guiding future stocking and pricing strategies.





