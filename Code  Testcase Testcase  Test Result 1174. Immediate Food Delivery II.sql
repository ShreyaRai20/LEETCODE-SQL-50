# Write your MySQL query statement below
WITH T1 AS (
    SELECT customer_id, min(order_date) as ord
    FROM Delivery
    GROUP BY customer_id
)


SELECT
ROUND(AVG(IF(T1.ord = D.customer_pref_delivery_date, 1, 0))*100,2) AS immediate_percentage
FROM Delivery D
INNER JOIN T1
ON D.customer_id = T1.customer_id
AND T1.ord = D.order_date
;
