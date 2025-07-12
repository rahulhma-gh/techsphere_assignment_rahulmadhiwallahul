SELECT
    e.employee_id,
    e.employee_name,
    e.department_id,
    e.performance_score,
    SUM(p.budget) AS total_project_budget
FROM
    Employee_Details e
JOIN
    Project_Assignments p ON e.employee_id = p.employee_id
WHERE
    e.performance_score IN ('Excellent', 'Good')  -- assuming performance_score is categorical
    AND p.budget > 100000                         -- assuming budget is stored as numeric
GROUP BY
    e.employee_id, e.employee_name, e.department_id, e.performance_score
ORDER BY
    total_project_budget DESC;
