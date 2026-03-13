SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN Department d
ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, salary
    FROM Employee
    WHERE (
        SELECT COUNT(DISTINCT salary)
        FROM Employee e2
        WHERE e2.departmentId = Employee.departmentId
        AND e2.salary > Employee.salary
    ) < 3
);
