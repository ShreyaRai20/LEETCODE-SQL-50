SELECT E.name name, B.bonus bonus
FROM EMPLOYEE E 
LEFT JOIN BONUS B
ON E.empId = B.empId
WHERE B.bonus < 1000 OR B.bonus IS NULL;
