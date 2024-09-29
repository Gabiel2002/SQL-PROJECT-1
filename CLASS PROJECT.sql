---CREATING DATABASE CALLED Shopxyz_db
CREATE DATABASE Shopxyz_db;
USE Shopxyz_db;

--- CREATING THE sales_data TABLE
CREATE table sales_data  ( sale_id INT PRIMARY KEY,
    rep_id INT,
    region VARCHAR(50),
    sales DECIMAL(10, 2)
);
---INTERTING INTO THE SALES DATA
INSERT INTO sales_data (sale_id, rep_id, region, sales) VALUES
(1, 101, 'East', 1000.00),
(2, 102, 'East', 1500.50),
(3, 103, 'West', 2000.00),
(4, 104, 'West', 2500.75),
(5, NULL, 'West', 3000.00);

--- CREATING representatives Table
CREATE TABLE representatives (
    rep_id INT PRIMARY KEY,
    sales_rep VARCHAR(100),
    region VARCHAR(50)
);
---INTERTING THE representatives Table
INSERT INTO representatives (rep_id, sales_rep, region) VALUES
(101, 'John Doe', 'East'),
(102, 'Jane Smith', 'East'),
(105, 'Jim Beam', 'North'),
(106, 'Jill Jackson', 'North'),
(107, 'Jack Johnson', 'South');

--- TO VIEW THE SALE_DATA
Select * from sales_data;
Select * from representatives; 

---Inner Join: Write a query to fetch sales data along with the names of the representatives where there is a match in both tables.
SELECT s.sales, r.sales_rep
FROM sales_data s
INNER JOIN  representatives r
ON s.rep_id = r.rep_id


SELECT sales_data.sales, representatives.sales_rep
FROM sales_data
INNER JOIN representatives
ON sales_data.rep_id = representatives.rep_id;


--- fetch all sales data (including unmatched rows) along with the names of the representatives in the West region.
SELECT s.sales, r.sales_rep
FROM sales_data s
LEFT JOIN representatives r
ON s.rep_id = r.rep_id
WHERE s.region = 'West';

---fetch all representatives and their sales data in the North region, even if they don't have any sales.
SELECT s.sales, r.sales_rep
FROM sales_data s
RIGHT JOIN representatives r
ON s.rep_id = r.rep_id
WHERE r.region = 'North';

 ---fetch all sales data and representative names, regardless of matches between them.
 SELECT s.sales, r.sales_rep
 FROM sales_data s
 FULL OUTER JOIN representatives r
 ON s.rep_id = r.rep_id;

 ---Total sales across all regions.
 SELECT SUM(sales) AS total_sales
 FROM sales_data;

 ---Count the number of sales records.
 SELECT COUNT(*) AS total_sales_records
 FROM sales_data;

 ---Average sales amount
 SELECT AVG(sales) AS averge_sales
 FROM sales_data;

 ---MAXIMUM sales amount
 SELECT MAX(sales) AS Max_sales
 FROM sales_data;


 --- String Function
 --Concatenate the first name and last of the representatives.
 SELECT CONCAT (SUBSTRING(sales_rep, 1, CHARINDEX(' ', sales_rep)-1),'', SUBSTRING(sales_rep, CHARINDEX(' ', sales_rap)+1, LEN(sales_rep))) AS full_name
 FROM representatives;

 SELECT CONCAT(sales_rep,' ', region) AS fullname FROM representatives

 --- Find the length of the seles_rep name.
 SELECT sales_rep, LEN(sales_rep) AS name_length
 FROM representatives;

 ---Convert the sales_rep name to lowercase
 SELECT LOWER(sales_rep) AS lowercase_name
 FROM representatives;

 ---
 SELECT TRIM(region) AS trimmed_region
 FROM representatives;

---CREATE A TABLE CALLED SALES WITH THE FOLLOWING
CREATE TABLE sales ( sale_id INT PRIMARY KEY, rep_id INT, sale_date DATE, amount DECIMAL(10, 2) );
INSERT INTO sales (sale_id, rep_id, sale_date, amount) 
VALUES (1, 101, '2024-09-15', 1000.00), (2, 102, '2024-09-16', 1500.50), (3, 103, '2024-09-17', 2000.00);

---GET THE CURRENT DATE.
SELECT GETDATE();
SELECT * FROM sales
---ADDING 7 DAYS TO THE SALES_DATE.
SELECT DATEADD(DAY, 7, sale_date) AS new_date
FROM sales;

ALTER TABLE sales
ADD new_date DATE;

SELECT sales. *,
DATEADD(DAY, 7, sale_date) AS new_date
FROM sales;



---sql
SELECT *
FROM sales_data
WHERE region LIKE '%East'

SELECT * from sales_data

SELECT ISNULL(rep_id, 105) AS rep_id
FROM sales_data;

SELECT NULLIF(sales, 1000) AS Sales 
FROM sales_data;

SELECT * FROM representatives;

---trim extra space in sales_rap column.
SELECT LTRIM(RTRIM(sales_rep)) AS trimmed_sales_rap
FROM representatives

---Replace occurrences of 'Doe' in sales_rep with 'Johnson'
SELECT REPLACE(sales_rep, 'Doe', 'Jonhson') AS replaced_sales_rep
FROM representatives;

---Replace occurrences of 'Doe' in sales_rep with 'Johnson'
SELECT representatives. *,
REPLACE(sales_rep, 'Doe', 'Jonhson') AS replaced_sales_rep
FROM  representatives;

---Sort sales data in descending order based on the sales amount.
SELECT *
FROM sales_data
ORDER BY sales DESC;

---Filter and Fetch sales data where amount is greater than 1500.
SELECT *
FROM sales_data
WHERE sales > 1500;

--- Fetch only unique regions fron the sales_data table.
SELECT DISTINCT region
FROM sales_data;