CREATE TABLE df_orders(
	order_id int primary key,
	order_date date,
	ship_mode varchar(20),
	segment varchar(20),
	country varchar(20),
	city varchar(20),
	state varchar(20),
	postal_code varchar(20),
	region varchar(20),
	category varchar(20),
	sub_category varchar(20),
	product_id varchar(50),
	quantity int,
	discount decimal(7,2),
	sale_price decimal(7,2),
	profit decimal(7,2)
)

--1) find top 10 highest reveue generating products 
SELECT product_id,SUM(sale_price) AS sales
FROM df_orders
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10

--2) find top 5 highest selling products in each region
WITH CTE1 AS (
SELECT region,product_id,SUM(sale_price) AS sales
FROM df_orders
GROUP BY region,product_id	
), CTE2 AS (
SELECT *, ROW_NUMBER() OVER(PARTITION BY REGION ORDER BY sales DESC) AS rn
FROM CTE1	
)
SELECT * FROM CTE2 WHERE rn<=5

--3) find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
WITH CTE AS(
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
	SUM(sale_price) AS sales
FROM df_orders
GROUP BY EXTRACT(YEAR FROM order_date),EXTRACT(MONTH FROM order_date)
-- ORDER BY order_year,order_month	
)
SELECT order_month
	, sum(case when order_year=2022 then sales else 0 end) as sales_2022
	, sum(case when order_year=2023 then sales else 0 end) as sales_2023
FROM CTE
GROUP BY order_month
ORDER BY order_month

--4) for each category which month had highest sales 
WITH CTE AS (
	SELECT category,TO_CHAR(order_date,'yyyyMM') AS order_year_month,SUM(sale_price) as sales 
FROM df_orders
GROUP BY category,TO_CHAR(order_date,'yyyyMM')
ORDER BY category,order_year_month
)
SELECT * FROM (
SELECT *,ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS rn
FROM CTE	
) AS A 
WHERE rn=1
 
--5) which sub category had highest growth by profit in 2023 compare to 2022
WITH CTE1 AS (
	SELECT sub_category, EXTRACT(YEAR FROM order_date) AS order_year,
SUM(sale_price) as sales
FROM df_orders
GROUP BY sub_category, EXTRACT(YEAR FROM order_date)
ORDER BY sub_category,order_year
),CTE2 AS (
	SELECT sub_category,
	SUM(CASE WHEN order_year=2022 THEN sales ELSE 0 END) AS sales_2022,
	SUM(CASE WHEN order_year=2023 THEN sales ELSE 0 END) AS sales_2023
	FROM CTE1
	GROUP BY sub_category
)
SELECT *,(sales_2023-sales_2022) FROM CTE2
ORDER BY (sales_2023-sales_2022) DESC
LIMIT 1
