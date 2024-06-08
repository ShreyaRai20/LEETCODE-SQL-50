# Write your MySQL query statement below
WITH CTE1 AS (
    SELECT * ,
    CASE
    WHEN income < 20000 THEN "Low Salary"
    WHEN  income BETWEEN 20000 AND 50000 THEN "Average Salary"
    ELSE "High Salary"
    END AS category 
    FROM ACCOUNTS
),
categories AS (
    SELECT "Low Salary" AS category
    UNION ALL
    SELECT "Average Salary"
    UNION ALL
    SELECT "High Salary")

SELECT C.category, count(CTE1.category) AS accounts_count
FROM CTE1 
RIGHT JOIN categories C
on CTE1.CATEGORY = C.category
GROUP BY C.CATEGORY;
