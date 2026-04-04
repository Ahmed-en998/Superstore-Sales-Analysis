-- table structure
DESCRIBE superstore;

-- Formating the Date Columns
UPDATE superstore
SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y')
WHERE Order_Date LIKE '%/%';

UPDATE superstore
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d')
WHERE Order_Date LIKE '%-%';

UPDATE superstore
SET Ship_Date = STR_TO_DATE(Ship_Date, '%m/%d/%Y')
WHERE Ship_Date LIKE '%/%';

UPDATE superstore
SET Ship_Date = STR_TO_DATE(Ship_Date, '%Y-%m-%d')
WHERE Ship_Date LIKE '%-%';

-- Modify Data Type
ALTER TABLE superstore
MODIFY Order_Date DATE,
MODIFY Ship_Date DATE;

ALTER TABLE superstore 
MODIFY Sales DECIMAL(10,2);

-- Checking NULL values
SELECT
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS null_profit
FROM superstore;

-- Checking duplicates
SELECT Order_ID, COUNT(*)
FROM superstore
GROUP BY Order_ID
HAVING COUNT(*) > 1;
-- duplicates are fine because multiple products can belong to the same order