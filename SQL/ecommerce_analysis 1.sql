CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;

ALTER Table orders RENAME COLUMN `Order ID`TO Order_ID;
ALTER Table orders RENAME COLUMN `Order Date`TO Order_Date;
ALTER Table orders RENAME COLUMN `Ship Date`TO Ship_Date;
ALTER Table orders RENAME COLUMN `Ship Mode`TO Ship_Mode;
ALTER Table orders RENAME COLUMN `Customer ID`TO Customer_ID;
ALTER Table orders RENAME COLUMN `Customer Name`TO Customer_Name;
ALTER Table orders RENAME COLUMN `Postal Code`TO Postal_Code;
ALTER Table orders RENAME COLUMN `Product ID`TO Product_ID;
ALTER Table orders RENAME COLUMN `Product Name`TO Product_Name;
ALTER Table orders RENAME COLUMN `Sub-Category`TO Sub_Category;

SET SQL_SAFE_UPDATES = 0;
UPDATE orders
SET Order_Date =
CASE
    WHEN Order_Date LIKE '%/%'
    THEN STR_TO_DATE(Order_Date, '%c/%e/%Y')
    ELSE STR_TO_DATE(Order_Date, '%m-%d-%y')
END;
    
UPDATE orders
SET Ship_Date =
CASE
    WHEN Ship_Date LIKE '%/%'
    THEN STR_TO_DATE(Ship_Date, '%c/%e/%Y')
    ELSE STR_TO_DATE(Ship_Date, '%m-%d-%y')
END;     
ALTER Table orders MODIFY Order_Date DATE;
ALTER Table orders MODIFY Ship_Date DATE; 
- ------------------- -------------- ------------ -------------- -------------- ------------- 

--- Q1 How much revenue, profit, and quantity has the business generated? ---

SELECT ROUND(SUM(sales),2) AS Total_Sales, 
	   ROUND(SUM(profit),2) AS Total_Profit,
       ROUND(SUM(quantity),2) AS Total_Quantity
FROM orders ; 

--- Q2 How much revenue, profit, and quantity has the business generated? ---     

SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders ;

--- Q3 Which category drives the most revenue? ---

SELECT 
	Category,
	ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC ;

--- Q4 Which category is most profitable? ---

SELECT 
     Category,
     ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Category 
ORDER BY Total_Profit DESC ;

--- Q5 Sales by Region ? ---

SELECT 
     Region,
     ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC ;

--- Q6 Profit by Region? ---

SELECT 
     Region,
	 ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Region 
ORDER BY Total_Profit DESC ;

--- Q7 Which customer segment contributes most to revenue and profit? ---

SELECT 
	Segment,
	ROUND(SUM(Sales),2) AS Total_Sales,
	ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Segment
ORDER BY Total_sales DESC ;

--- Q8 Top 10 Customers by Sales? ---

SELECT
     Customer_Name,
	 ROUND(SUM(Sales),2) AS Total_Sales
FROM orders 
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10 ;

--- Q9 Top 10 Customers by Profit? ---

SELECT 
     Customer_Name,
     ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 10 ;  

--- Q10 Top 10 Products by Sales? ---

SELECT 
     Product_Name,
     ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10 ;

--- Q11 Top 10 Products by Profit? ---

SELECT 
     Product_Name,
     ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10 ;     

--- Q12 Which products are causing losses? BOTTOM TOP 10 PRODUCTS  ---

SELECT 
     Product_Name,
     ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit ASC
LIMIT 10 ;     

--- Q13 Top 10 States by Sales? ---

SELECT 
	  State,
      ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10 ;

--- Q14 Top 10 States by Profit? ---

SELECT 
      State,
      ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10 ;

--- Q15 Monthly Sales Trend // How are sales changing over time? ---

SELECT
	  YEAR(Order_Date) AS Year,
      MONTH(Order_Date) AS Month,
      ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month ;

--- Q16 Monthly Profit Trend? ---

SELECT 
      YEAR(Order_Date) AS Year,
      MONTH(Order_Date) AS Month,
      ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY YEAR(Order_Date) , MONTH(Order_Date)
ORDER BY Year , Month ;

--- Q17 Discount Impact Analysis// Does higher discount reduce profit? ---

SELECT 
      Discount,
      ROUND(SUM(Sales),2) AS Total_Sales,
      ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount ;

--- Q18 Average Profit by Category? ---

SELECT 
      Category,
      ROUND(AVG(Profit),2) AS Average_Profit
FROM orders
GROUP BY Category 
ORDER BY Average_Profit DESC ;

--- Q19 Top 10 Cities by Sales? ---

SELECT 
      City,
      ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10 ;

--- Q20 Top 10 Cities by Profit? ---

SELECT 
      City,
      ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY City
ORDER BY Total_Profit DESC
LIMIT 10 ;

































     







    