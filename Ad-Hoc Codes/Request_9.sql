/* 9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage */

SELECT x.channel ,ROUND(SUM(y.sold_quantity * z.gross_price)/1000000,2) AS 'gross_sales_mln(M)',

ROUND(100*(SUM(y.sold_quantity * z.gross_price)/1000000)/
      
(SELECT SUM(y.sold_quantity * z.gross_price)/1000000 FROM fact_sales_monthly y JOIN fact_gross_price z ON y.product_code=z.product_code WHERE y.fiscal_year=2021),2
) AS percentage

FROM dim_customer x JOIN fact_sales_monthly y ON x.customer_code=y.customer_code
JOIN fact_gross_price z ON y.product_code=z.product_code 
WHERE y.fiscal_year=2021 GROUP BY x.channel ORDER BY percentage DESC;
