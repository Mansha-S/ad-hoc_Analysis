/* 2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg */

SELECT a.unique_products_2020,b.unique_products_2021,ROUND(100*(b.unique_products_2021-a.unique_products_2020)/b.unique_products_2021,2) AS percentage_chg

FROM
(SELECT DISTINCT COUNT(DISTINCT product_code) AS unique_products_2020 FROM fact_gross_price WHERE fiscal_year=2020)  a,

(SELECT DISTINCT COUNT(DISTINCT product_code) AS unique_products_2021 FROM fact_gross_price WHERE fiscal_year=2021) b;
