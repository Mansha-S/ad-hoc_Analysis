/* 5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost */

SELECT  a.product_code,a.product,b.manufacturing_cost FROM dim_product a JOIN fact_manufacturing_cost b ON a.product_code=b.product_code WHERE b.manufacturing_cost=(SELECT max(manufacturing_cost) FROM fact_manufacturing_cost) 

UNION

SELECT  a.product_code,a.product,b.manufacturing_cost FROM dim_product a JOIN fact_manufacturing_cost b ON a.product_code=b.product_code WHERE b.manufacturing_cost=(SELECT min(manufacturing_cost) FROM fact_manufacturing_cost) ;