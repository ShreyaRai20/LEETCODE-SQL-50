# Write your MySQL query statement below

WITH T1 AS (SELECT *
FROM ACTIVITY
WHERE ACTIVITY_TYPE = "start"
),
T2 AS (SELECT *
FROM ACTIVITY
WHERE ACTIVITY_TYPE = "end"
)

SELECT DISTINCT T1.machine_id, ROUND(AVG((T2.timestamp - T1.timestamp)),3) AS processing_time
FROM T1,T2
WHERE T1.process_id = T2.process_id AND T1.machine_id = T2.machine_id
GROUP BY T1.MACHINE_ID
;
