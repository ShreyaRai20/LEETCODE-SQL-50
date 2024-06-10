/*
602. Friend Requests II: Who Has the Most Friends
Solved
Medium

Topics
Companies

Hint
SQL Schema
Pandas Schema
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

 

Example 1:

Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
 

Follow up: In the real world, multiple people could have the same most number of friends. Could you find all these people in this case?
    */

--SOLUTION

# Write your MySQL query statement below
WITH T1 AS(
    SELECT ACCEPTER_ID ID, COUNT(DISTINCT REQUESTER_ID) CNT
    FROM REQUESTACCEPTED
    GROUP BY ACCEPTER_ID
),
T2 AS (
    SELECT REQUESTER_ID ID, COUNT(DISTINCT ACCEPTER_ID) CNT
    FROM REQUESTACCEPTED
    GROUP BY REQUESTER_ID
),
T4 AS(
    SELECT ID,SUM(CNT) NUM
    FROM (
        SELECT ID , CNT
        FROM T1
        UNION ALL
        SELECT ID , CNT
        FROM T2
    ) AS COMBINED
    GROUP BY ID
    ORDER BY NUM DESC
    LIMIT 1
)

SELECT *
FROM T4;


___________________________________________________________________
ADDITIONAL QUERIES


select requester_id as id,
       (select count(*) from RequestAccepted
            where id=requester_id or id=accepter_id) as num
from RequestAccepted
group by requester_id
order by num desc limit 1

_________________________________________________________________
# Write your MySQL query statement below
WITH T1 AS(
    SELECT ACCEPTER_ID, COUNT(DISTINCT REQUESTER_ID) CNT1
    FROM REQUESTACCEPTED
    GROUP BY ACCEPTER_ID
),
T2 AS (
    SELECT REQUESTER_ID, COUNT(DISTINCT ACCEPTER_ID) CNT2
    FROM REQUESTACCEPTED
    GROUP BY REQUESTER_ID
)

SELECT DISTINCT(REQUESTER_ID) ID,( CNT1 + CNT2 ) NUM
FROM T1,T2
WHERE  T1.ACCEPTER_ID = T2.REQUESTER_ID
ORDER BY NUM DESC
LIMIT 1;
_______________________________________________

T3 AS (
    SELECT requester_id AS user_id FROM REQUESTACCEPTED
    UNION
    SELECT accepter_id AS user_id FROM REQUESTACCEPTED
)
