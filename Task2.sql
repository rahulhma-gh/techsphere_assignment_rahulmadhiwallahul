SELECT 
    t.department_id,
    t.training_count,
    t.avg_feedback_score,
    t.total_training_cost,
    e.avg_experience_years,
    e.employee_count
FROM 
    (
        SELECT 
            department_id,
            COUNT(program_id) AS training_count,
            AVG(feedback_score) AS avg_feedback_score,
            SUM(cost) AS total_training_cost
        FROM 
            training_records
        GROUP BY 
            department_id
    ) t
JOIN 
    (
        SELECT 
            department_id,
            AVG(experience_years) AS avg_experience_years,
            COUNT(employee_id) AS employee_count
        FROM 
            employee_details
        GROUP BY 
            department_id
    ) e ON t.department_id = e.department_id;
