/* 6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage */

SELECT a.customer_code,a.customer ,ROUND(AVG(b.pre_invoice_discount_pct),4) AS Average_discount_percentage
FROM dim_customer a JOIN fact_pre_invoice_deductions b on a.customer_code=b.customer_code WHERE a.market='India' AND b.fiscal_year=2021  GROUP BY a.customer_code,a.customer ORDER BY Average_discount_percentage DESC LIMIT 5;
