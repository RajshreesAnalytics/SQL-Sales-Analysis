-- SQL Sales Analysis Project 
-- Dataset: Sales Data 
-- Objective: Analyze sales performance using SQL queries.

-- Query 1: Total Revenue Generated

   SELECT SUM(Revenue) AS TOtal_Revenue 
   FROM sales_data;

-- Query 2: Total quantity sold

   SELECT SUM(Units_sold) AS Total_Units_Sold
   FROM sales_data;

-- Query 3: Total Revenue by Product Category
   
   SELECT p.Category, SUM(s.Revenue) AS Total_Revenue
   FROM sales_data s
   JOIN product_master p 
   ON s.Product_ID = p.Product_ID 
   GROUP BY p.Category;

-- Query 4: Total Revenue By Region 

   SELECT c.Region , SUM(s.Revenue) AS Total_Revenue 
   FROM sales_data s
   JOIN customer_master c 
   ON s.Customer_ID = c.Customer_ID
   GROUP BY c.Region 
   ORDER BY Total_Revenue DESC;

-- Query 5: Top 5 Products by Revenue 

   SELECT p.Product_Name , SUM(s.Revenue) AS Total_Revenue 
   FROM sales_data s
   JOIN product_master p
   ON s.Product_ID = p.Product_ID
   GROUP BY p.Product_Name
   ORDER BY Total_Revenue DESC 
   LIMIT 5;

-- Query 6: Revenue by category and product 

   SELECT p.Category , p.Product_Name , SUM(s.Revenue) AS Total_Revenue 
   FROM sales_data s
   JOIN product_master p
   ON s.Product_ID = p.Product_ID 
   GROUP BY p.Category, p.Product_Name 
   ORDER BY p.Category, Total_Revenue 
   DESC;

-- Query 7: Monthly revenue trend 

   SELECT MONTH (Date) AS Month, SUM(Revenue) AS Total_Revenue
   FROM sales_data 
   GROUP BY MONTH(Date) 
   ORDER BY Month;

-- Query 8: Average Revenue per Transaction

   SELECT AVG(Revenue) AS Avg_Revenue_per_Transaction
   FROM sales_data;

-- Query 9: Rank Products by Total Revenue 

   SELECT p.Product_Name , SUM(s.Revenue) AS TOtal_Revenue 
   FROM sales_data s
   JOIN product_master p
   ON s.Product_ID = p.Product_ID 
   GROUP BY p.Product_Name
   ORDER BY Total_Revenue DESC;

-- Query 10: Top 2 Products in Each category by Revenue

    SELECT p.Category , p.Product_Name, SUM(Revenue) AS Total_Revenue
    FROM sales_data s 
    JOIN product_master p 
    ON s.Product_ID = p.Product_ID 
    GROUP BY p.Category, p.Product_Name
    ORDER BY p.Category , Total_Revenue DESC;
    
   