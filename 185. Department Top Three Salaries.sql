SELECT D.name Department, E.name Employee, E.Salary Salary
FROM DEPARTMENT D 
JOIN 
(SELECT *, RANK() OVER( PARTITION BY departmentId ORDER BY SALARY DESC) R_salary
FROM EMPLOYEE) AS E
ON E.departmentId = D.id 
WHERE R_salary <= 3;
