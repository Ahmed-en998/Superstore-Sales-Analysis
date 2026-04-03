-- Counting Orders And Customers
SELECT 
	COUNT(*) AS Total_Rows,
    COUNT(DISTINCT(Order_ID)) AS Total_Order,
    COUNT(DISTINCT(Customer_ID)) AS Total_Customer
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
	CONCAT('$', FORMAT(SUM(Sales), 2)) AS total_sales,
    CONCAT('$', FORMAT(SUM(Profit), 2)) AS total_profits,
    CONCAT('$', FORMAT(AVG(Sales), 2)) AS average_sales,
    CONCAT('$', FORMAT(AVG(Profit), 2)) AS average_profits,
    CONCAT('$', FORMAT(MAX(Sales), 2)) AS highest_sales
FROM superstore;