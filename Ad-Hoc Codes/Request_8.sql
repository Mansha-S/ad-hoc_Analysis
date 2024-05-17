/* 8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity */

SELECT  
CASE 
	WHEN date BETWEEN '2019-9-1' AND '2019-11-1' THEN 1
    WHEN date BETWEEN '2019-12-1' AND '2020-2-1' THEN 2
	WHEN date BETWEEN '2020-3-1' AND '2020-5-1' THEN 3
    WHEN date BETWEEN '2020-6-1' AND '2020-8-1' THEN 4
END AS 'Quarter'
,SUM(sold_quantity) AS total_sold_quantity 
FROM fact_sales_monthly WHERE fiscal_year=2020 GROUP BY Quarter ORDER BY total_sold_quantity DESC;