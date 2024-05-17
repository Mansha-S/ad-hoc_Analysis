/* 4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference */

SELECT x.segment,y.product_count_2021,x.product_count_2020 ,y.product_count_2021-x.product_count_2020 AS difference

FROM

(SELECT a.segment ,count(*) AS product_count_2020 FROM dim_product a JOIN fact_gross_price b ON a.product_code=b.product_code WHERE b.fiscal_year=2020  GROUP BY segment) x JOIN
#this table name 'x' contains segment,product_count_2020


(SELECT a.segment ,count(*) AS product_count_2021 FROM dim_product a JOIN fact_gross_price b ON a.product_code=b.product_code WHERE b.fiscal_year=2021  GROUP BY segment) y
#this table name 'y' contains segment,product_count_2021

ON x.segment=y.segment ORDER BY difference DESC;