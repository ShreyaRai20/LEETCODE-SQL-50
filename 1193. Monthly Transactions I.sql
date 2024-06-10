# Write your MySQL query statement below

SELECT 
DATE_FORMAT(trans_date, '%Y-%m') AS month,
country, 
COUNT(1) trans_count, 
COUNT(IF(state ="approved",1,NULL)) approved_count,
SUM(AMOUNT) trans_total_amount,
sum(IF(state ="approved",amount,0)) approved_total_amount
FROM TRANSACTIONS 
GROUP BY month, country;
