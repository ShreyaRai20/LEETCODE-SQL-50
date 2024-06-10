/*
1164. Product Price at a Given Date
Solved
Medium

Topics
Companies
SQL Schema
Pandas Schema
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+
*/


--SOLUTION

# Write your MySQL query statement below

-- GETS PRODUCT_IDS AND PRICE FOR THE PRODUCTS CHANGE DATE <= "2019-08-16" WITH RK = 1
SELECT product_id, new_price price
FROM

-- SUBQUERY - RANKS THE PRODUCTS WITHIN PRODUCT_ID BY ORDER - CHANGE_DATE DESC (GREATEST TO SMALLEST)
(
    SELECT *, RANK() OVER( PARTITION BY PRODUCT_ID ORDER BY CHANGE_DATE DESC) AS RK
    FROM PRODUCTS
    WHERE change_date <= "2019-08-16"
) T1
WHERE RK = 1

UNION

-- RETURNS THE PRODUCT THATS PRICE DIDN'T CHANGE BEFORE "2019-08-16" AND DEFAULT VALUE AS 10.

SELECT product_id, 10 price
FROM Products 
WHERE CHANGE_DATE >=  "2019-08-16" 
AND product_id NOT IN (
    SELECT PRODUCT_ID
    FROM PRODUCTS
    WHERE change_date <= "2019-08-16"
)
;

-- USED UNION TO GOIN BOTH THE TABLES/QUERY TO GET THE DESIRED OUTPUT.
