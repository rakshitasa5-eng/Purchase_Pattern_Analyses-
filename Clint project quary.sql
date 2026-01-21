use project_purchase_pattern_analysis;
show tables;
select * from mytable;
-- 1
SELECT
  BillNo,
  UPPER(TRIM(Itemname)) AS Itemname,
  Quantity,
  Price,
  Present_Date,
  CustomerID,
  Country
FROM mytable
WHERE Itemname IS NOT NULL
  AND Quantity > 0
  AND Price > 0;
  
-- 2
SELECT
  BillNo,
  UPPER(TRIM(Itemname)) AS Itemname,
  SUM(Quantity) AS Quantity,
  AVG(Price) AS Price
FROM mytable
WHERE Itemname IS NOT NULL
  AND Quantity > 0
GROUP BY BillNo, Itemname limit 10;

SELECT
  BillNo,
  Itemname,
  Quantity
FROM mytable
WHERE Quantity > 0
LIMIT 10;


-- 3
SELECT
  BillNo,
  Itemname,
  COALESCE(CustomerID, 'UNKNOWN') AS CustomerID,
  Country
FROM mytable;


-- 4
SELECT *
FROM mytable
WHERE BillNo NOT LIKE 'C%';


-- 5
SELECT
  BillNo,
  Itemname,
  STR_TO_DATE(Present_Date, '%d-%m-%Y %H:%i') AS clean_date
FROM mytable;

-- 5
SELECT
  BillNo,
  UPPER(TRIM(Itemname)) AS Itemname
FROM mytable
WHERE Itemname IS NOT NULL
  AND Quantity > 0
  AND BillNo NOT LIKE 'C%'
GROUP BY BillNo, Itemname;


-- 6
SELECT
  BillNo,
  Itemname,
  Quantity * Price AS revenue,
  DATE(Present_Date) AS sales_date,
  Country
FROM mytable
WHERE Quantity > 0
  AND Price > 0;

-- 8
SELECT
  BillNo,
  Itemname,
  Quantity * Price AS revenue,
  DATE(STR_TO_DATE(Present_Date, '%d-%m-%Y %H:%i')) AS sales_date,
  Country
FROM mytable
WHERE Quantity > 0
  AND Price > 0;
  
-- 1. Top 10 Most Frequently Purchased Products
SELECT Itemname, COUNT(*) AS purchase_frequency
FROM mytable
GROUP BY Itemname
ORDER BY purchase_frequency DESC
LIMIT 10;

-- 2. Top 10 Products by Total Quantity Sold
SELECT Itemname, SUM(Quantity) AS total_quantity_sold
FROM mytable
GROUP BY Itemname
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- 3. Average Basket Size (Items per Transaction)
SELECT AVG(item_count) AS avg_items_per_transaction
FROM (
    SELECT BillNo, COUNT(Itemname) AS item_count
    FROM mytable
    GROUP BY BillNo
) t;

-- 4. Customers with Highest Purchase Frequency 
SELECT CustomerID, COUNT(DISTINCT BillNo) AS total_transactions
FROM mytable
GROUP BY CustomerID
ORDER BY total_transactions DESC
LIMIT 10;

-- 5. Customers Buying the Widest Variety of Products
SELECT CustomerID, COUNT(DISTINCT Itemname) AS unique_products
FROM mytable
GROUP BY CustomerID
ORDER BY unique_products DESC
LIMIT 10;

-- 6. Bulk Purchase Transactions
SELECT BillNo, SUM(Quantity) AS total_items
FROM mytable
GROUP BY BillNo
HAVING SUM(Quantity) > 50;

-- 7. Frequently Bought Product Pairs (Market Basket Base)
SELECT t1.Itemname AS product_1,
       t2.Itemname AS product_2,
       COUNT(*) AS frequency
FROM mytable t1
JOIN mytable t2
  ON t1.BillNo = t2.BillNo
 AND t1.Itemname < t2.Itemname
GROUP BY product_1, product_2
ORDER BY frequency DESC
LIMIT 10;

-- 8. Country-wise Purchase Volume
SELECT Country, SUM(Quantity) AS total_items_sold
FROM mytable
GROUP BY Country
ORDER BY total_items_sold DESC;

-- 9. Daily Transaction Trend
SELECT sales_date, COUNT(DISTINCT BillNo) AS total_transactions
FROM mytable
GROUP BY sales_date
ORDER BY sales_date;

-- 10. Single-Item Transactions (Low Engagement)
SELECT BillNo
FROM mytable
GROUP BY BillNo
HAVING COUNT(Itemname) = 1;















