---Checking the Dataset
SELECT*FROM project.data.sales

---Calculating Daily Sales Price Per Unit
SELECT
   Date,
   Sales,
   "Quantity Sold" AS Quantity_Sold,
   ROUND(Sales / NULLIF(`Quantity Sold`, 0), 2) AS Daily_Per_Unit_Cost
FROM project.data.sales;

---Calculating Average Unit Sales Price   
SELECT 
   "Quantity Sold" AS Quantity_Sold,
   ROUND(AVG(Sales / NULLIF(`Quantity Sold`, 0)), 2) AS AVG_Unit_Sales_Price
FROM project.data.sales;


---Calculating Daily percentage Gross Profit
SELECT 
    Date,
    Sales,
    `Cost of Sales` AS Cost_Of_Sales,
    ROUND(((Sales - `Cost of Sales`) / NULLIF(Sales, 0)) * 100.0, 2) AS Gross_Profit_Percentage
FROM project.data.sales;

----Calculating percentage Gross Profit Per Unit
SELECT 
  Date,
  ROUND((((Sales - `Cost of Sales`) / `Quantity Sold`) / (Sales / `Quantity Sold`)) * 100, 2) AS Gross_Profit_Per_Unit_Percentage
FROM project.data.sales;

---Calculating Average Unit Sales Price Before, During and After Promo

---Calculating Average Unit Sales Price Before
SELECT
   'Before Promo' AS Period,
   AVG(Sales / `Quantity Sold`) AS Price,
   AVG(`Quantity Sold`) AS Quantity_Sold
FROM project.data.sales
WHERE Date BETWEEN '2014-01-01' AND '2014-01-10';

---Calculating Average Unit Sales Price During
SELECT
   'During Promo' AS Period,
   AVG(Sales / `Quantity Sold`) AS Price,
   AVG(`Quantity Sold`) AS Quantity_Sold
FROM project.data.sales
WHERE Date BETWEEN '2014-01-11' AND '2014-01-20';

---Calculating Average Unit Sales Price After
SELECT
   'After Promo' AS Period,
   AVG(Sales / `Quantity Sold`) AS Price,
   AVG(`Quantity Sold`) AS Quantity_Sold
FROM project.data.sales
WHERE Date BETWEEN '2014-01-21' AND '2014-01-31';

---Combining the Promo Period
SELECT
   'Before Promo' AS Period,
   AVG(Sales / `Quantity Sold`) AS Price,
   AVG(`Quantity Sold`) AS Quantity_Sold
FROM project.data.sales
WHERE Date BETWEEN '2014-01-01' AND '2014-01-10'

UNION ALL

SELECT
   'During Promo' AS Period,
   AVG(Sales / `Quantity Sold`) AS Price,
   AVG(`Quantity Sold`) AS Quantity_Sold
FROM project.data.sales
WHERE Date BETWEEN '2014-01-11' AND '2014-01-20'

UNION ALL

SELECT
   'After Promo' AS Period,
   AVG(Sales / `Quantity Sold`) AS Price,
   AVG(`Quantity Sold`) AS Quantity_Sold
FROM project.data.sales
WHERE Date BETWEEN '2014-01-21' AND '2014-01-31';


---CREATE OR REPLACE TEMP VIEW daily_metrics AS (
  
   WITH daily_metrics AS (
  SELECT
    Date,
    Sales,
    `Quantity Sold` AS Quantity_Sold,
    `Cost of Sales` AS Cost_Of_Sales,
    ROUND(Sales / NULLIF(`Quantity Sold`, 0), 2) AS Daily_Per_Unit_Cost,
    ROUND(((Sales - `Cost of Sales`) / NULLIF(Sales, 0)) * 100.0, 2) AS Gross_Profit_Percentage,
    ROUND((((Sales - `Cost of Sales`) / NULLIF(`Quantity Sold`, 0)) / NULLIF(Sales / NULLIF(`Quantity Sold`, 0), 0)) * 100, 2) AS Gross_Profit_Per_Unit_Percentage,
    CASE
      WHEN Date BETWEEN '2014-01-01' AND '2014-01-10' THEN 'Before Promo'
      WHEN Date BETWEEN '2014-01-11' AND '2014-01-20' THEN 'During Promo'
      ELSE 'After Promo'
    END AS Period
  FROM project.data.sales
)
---Creating the final table
SELECT
  Period,
  ROUND(AVG(Daily_Per_Unit_Cost), 2) AS Avg_Unit_Sales_Price,
  ROUND(AVG(Quantity_Sold), 2) AS Avg_Quantity_Sold,
  ROUND(AVG(Gross_Profit_Percentage), 2) AS Avg_Gross_Profit_Percentage,
  ROUND(AVG(Gross_Profit_Per_Unit_Percentage), 2) AS Avg_Gross_Profit_Per_Unit_Percentage
FROM daily_metrics
GROUP BY Period
ORDER BY 
  CASE 
    WHEN Period = 'Before Promo' THEN 1
    WHEN Period = 'During Promo' THEN 2
    WHEN Period = 'After Promo' THEN 3
    ELSE 4
  END;
