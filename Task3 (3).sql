SELECT 
    project_id,
    project_name,
    budget,
    hours_worked,
    ROUND(budget / hours_worked, 2) AS cost_per_hour
FROM 
    project_assignments
WHERE 
    hours_worked > 0 
ORDER BY cost_per_hour ASC;
