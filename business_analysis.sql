-- Identify most profitable regions
SELECT
	Region,
    COUNT(DISTINCT(Customer_ID)) AS num_customer,
    CONCAT('$', FORMAT(SUM(Sales), 2)) AS total_sales,
    CONCAT('$', FORMAT(SUM(Profit), 2)) AS total_profit,
    CONCAT(ROUND(SUM(Profit)/NULLIF(SUM(Sales), 0), 2)*100, '%') AS profit_margin,
    CONCAT('$', ROUND(SUM(Discount), 2)) AS sum_of_discount
FROM superstore
GROUP BY Region
ORDER BY ROUND(SUM(Profit)/NULLIF(SUM(Sales), 0), 2) DESC;


-- Categories Performances
SELECT 
	Category,
    CONCAT('$',FORMAT(SUM(Sales), 2)) AS total_sales,
    CONCAT('$',FORMAT(SUM(Profit), 2)) AS total_profit,
    CONCAT(FORMAT(SUM(Profit)/SUM(Sales), 2)*100, '%') AS profit_margin,
    CONCAT('$',FORMAT(SUM(Discount), 2)) AS total_discount,
    SUM(Quantity) AS total_quantity
FROM superstore
GROUP BY Category;


-- Sub-Categories Performances, and which product is bleeding money
SELECT 
	Sub_Category,
    CONCAT('$',FORMAT(SUM(Sales), 2)) AS total_sales,
    CONCAT('$',FORMAT(SUM(Profit), 2)) AS total_profit,
    CONCAT(FORMAT(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 0), '%') AS profit_margin,
    CONCAT('$',FORMAT(SUM(Discount), 2)) AS total_discount,
    SUM(Quantity) AS total_quantity
FROM superstore
GROUP BY Sub_Category
ORDER BY SUM(Profit) ASC;

-- Analysing data based on DISCOUNT levels
SELECT 
	CASE
		WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE '30%+'
	END AS Discount_group,
    COUNT(*) AS total_recorded_orders,
    CONCAT('$', FORMAT(SUM(Sales), 2)) AS total_sales,
    CONCAT('$', FORMAT(SUM(Profit), 2)) AS total_profit,
    CONCAT(FORMAT(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 0), '%') AS profit_margin,
    SUM(Quantity) AS total_quantity
FROM superstore
GROUP BY Discount_group
ORDER BY Discount_group;