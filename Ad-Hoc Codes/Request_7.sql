/* 7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount */

SELECT  SUM(z.gross_price * x.sold_quantity) AS Gross_sales_monthly,MONTHNAME(x.date) AS Month ,year(x.date) AS Year
FROM  fact_sales_monthly x JOIN dim_customer y on x.customer_code=y.customer_code 
JOIN fact_gross_price z ON x.product_code=z.product_code
WHERE y.customer='Atliq Exclusive' 
GROUP BY year(x.date),month(x.date),Month ORDER BY year(x.date),month(x.date) ;
