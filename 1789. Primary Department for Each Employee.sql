
SELECT E1.employee_id, E1.department_id
FROM EMPLOYEE E1 
WHERE primary_flag = 'Y' 
OR 
employee_id in
(
    SELECT employee_id
    FROM EMPLOYEE
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1

) ;
