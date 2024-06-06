SELECT D.name Department, E.name Employee, E.Salary Salary
FROM DEPARTMENT D 
JOIN 
(SELECT *, RANK() OVER( PARTITION BY departmentId ORDER BY SALARY DESC) R_salary
FROM EMPLOYEE) AS E
ON E.departmentId = D.id 
WHERE R_salary <= 3;


-- The above code is giving the right output with different order.
--  To get the right order(order in LEETCODE) run the code given below.

SELECT D.name AS Department, 
       E.name AS Employee, 
       E.salary AS Salary
FROM Department D 
JOIN Employee E ON E.departmentId = D.id
WHERE E.salary IN (
    SELECT DISTINCT salary
    FROM (
        SELECT salary,
               departmentId,
               DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
        FROM Employee
    ) AS RankedSalaries
    WHERE salary_rank <= 3
        AND RankedSalaries.departmentId = D.id
)
ORDER BY D.name, E.salary DESC;



