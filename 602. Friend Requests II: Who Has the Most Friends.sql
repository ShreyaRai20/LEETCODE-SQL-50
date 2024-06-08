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
