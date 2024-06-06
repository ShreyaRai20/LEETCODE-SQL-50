SELECT E1.employee_id, E1.name, E2.reports_count, E2.average_age 
FROM EMPLOYEES E1 JOIN
(
    SELECT reports_to, COUNT(employee_id) reports_count, round(avg(age))
    average_age
    FROM EMPLOYEES E1 
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
) E2
ON E2.reports_to = E1.employee_id
ORDER BY E1.employee_id;
