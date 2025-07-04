SELECT * FROM KMS

---product category WITH the highest sales at top---

SELECT Product_Category,
SUM(Sales) AS TotalSales
FROM KMS
GROUP BY Product_Category
ORDER BY TotalSales DESC
OPTION (MAXDOP 1);

-- Top 3

SELECT TOP 3 Region,
SUM(Sales) AS Total_Sales
FROM KMS
GROUP BY Region
ORDER BY Total_Sales DESC;

-- For bottom 3

SELECT TOP 3 Region,
SUM(Sales) AS Total_Sales
FROM KMS
GROUP BY Region
ORDER BY Total_Sales ASC;

----Total sales of appliances in Ontario---

SELECT SUM(Sales) AS Total_Appliance_Sales
FROM KMS
WHERE Product_Category = 'Appliances'
AND Province = 'Ontario';

-- List bottom 10 customers by total sales---

SELECT Customer_Name,
SUM(Sales) AS Total_Sales
FROM KMS
GROUP BY Customer_Name
ORDER BY Total_Sales ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--advice to management: Focus on strategies like targeted promotions, loyalty programs, or cross-selling to these low-revenue customers.

---Shipping method with highest shipping costs----

SELECT Ship_Mode,
SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM KMS
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost DESC
OPTION (MAXDOP 1);

----Most valuable customers & their typical purchases----

-- Most valuable customers by total profit---

SELECT TOP 10 Customer_Name,
SUM(Profit) AS Total_Profit
FROM KMS
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;

----what they purchase:

SELECT Customer_Name,
Product_Category, Product_Sub_Category, Product_Name,
SUM(Sales) AS Total_Sales
FROM KMS
WHERE Customer_Name IN ('Emily Phan', 'Deborah Brumfield', 'Grant Carroll', 'Karen Carlisle', 'Alejandro Grove', 
'Liz MacKendrick', 'John Stevenson', 'Clytie Kelty', 'Clytie Kelty', 'Logan Haushalter')
GROUP BY Customer_Name, Product_Category, Product_Sub_Category, Product_Name;

select * from KMS

---- Small business customer with highest sales----

SELECT TOP 1 Customer_Name,
SUM(Sales) AS Total_Sales
FROM KMS
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

---- Corporate Customer placed the most number of orders in 2009 – 2012---

SELECT TOP 1 Customer_Name,
COUNT(DISTINCT Order_ID) AS Number_of_Orders
FROM KMS
WHERE Customer_Segment = 'Corporate'
AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY Number_of_Orders DESC;

----Most profitable consumer customer---

SELECT TOP 1 Customer_Name,
SUM(Profit) AS Total_Profit
FROM KMS
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;

-----Which customer returned items, and what segment do they belong to?---




-----Average shipping costs per Order_Priority----

SELECT Order_Priority,
AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM KMS
GROUP BY Order_Priority;


----No, the company likely isn't appropriately spending shipping costs based on order priority.

---If higher priority orders are paying lower shipping costs,
--it suggests a disconnect between the perceived value of speed and the actual cost of providing it, 
---The company is likely underspending on express shipping for high-priority orders.

