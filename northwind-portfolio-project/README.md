# Northwind Sales Analysis - Portfolio Project

## Overview
End-to-end data analysis project using the Northwind sample database (SQLite), 
demonstrating SQL querying, data cleaning, and business insight generation.

## Tools Used
- **SQL** (SQLite via DBeaver): data extraction and analysis
- **Python** (pandas, numpy, matplotlib, seaborn): data cleaning and visualization
- **Power BI / Tableau**: dashboard creation
- **Notion / Excel**: final reporting

## Project Structure
```
northwind-portfolio-project/
├── sql/queries.sql - SQL queries used for analysis
├── data/ - Exported CSV results
├── notebooks/ - Python analysis notebooks
├── dashboards/ - Power BI/Tableau files
└── README.md
```
## Business Questions Answered
1. Who are the top 10 customers by number of orders?
2. Who are the top 10 customers by total revenue?
3. Which products are priced above their category average?
4. Are there any customers with zero orders?
5. How do products rank by price within each category?
6. What is the top-priced product in each category?
7. What is the total revenue per category, plus grand total?
8. How can we optimize slow queries using indexes?

## Key SQL Techniques Demonstrated
- Joins (INNER JOIN across multiple tables)
- Correlated Subqueries
- EXISTS / NOT EXISTS
- Window Functions (ROW_NUMBER, RANK, DENSE_RANK, LAG)
- Common Table Expressions (CTEs)
- Advanced Aggregations (UNION ALL as ROLLUP alternative)
- Transactions (COMMIT/ROLLBACK)
- Query Optimization (EXPLAIN QUERY PLAN, Indexes)

## Author
Chiraz Moussaoui - Data Analyst in training
