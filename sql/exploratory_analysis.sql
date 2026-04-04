-- Counting Orders And Customers
SELECT 
	COUNT(*) AS Total_Rows,
    COUNT(DISTINCT(Order_ID)) AS Total_Orders,
    COUNT(DISTINCT(Customer_ID)) AS Total_Customers
FROM superstore;

-- Time range
SELECT 
    MIN(Order_Date) AS Start_date,
    MAX(Order_Date) AS End_date,
    CONCAT(
        TIMESTAMPDIFF(YEAR, MIN(Order_Date), MAX(Order_Date)), ' years ',
        TIMESTAMPDIFF(MONTH, MIN(Order_Date), MAX(Order_Date)) % 12, ' months'
    ) AS Time_Range
FROM superstore;

-- Basic aggregations
SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    AVG(Sales) AS avg_line_sales,
    AVG(Profit) AS avg_line_profit,
    MAX(Sales) AS max_line_sale
FROM superstore;