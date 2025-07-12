SELECT 
    e.employee_id,
    e.employee_name,
    COALESCE(h.total_hours_worked, 0) AS total_hours_worked,
    COALESCE(a.total_absences, 0) AS total_absences,
    (COALESCE(h.total_hours_worked, 0) - COALESCE(a.total_absences, 0) * 10) AS rank_score
FROM 
    employee_details e
LEFT JOIN (
    SELECT 
        employee_id,
        SUM(total_hours) AS total_hours_worked
    FROM 
        final_attendance_2024_leave_realistic
    GROUP BY 
        employee_id
) h ON e.employee_id = h.employee_id
LEFT JOIN (
    SELECT 
        employee_id,
        SUM(COALESCE(days_absent_x, 0) + COALESCE(vacation_leaves, 0)) AS total_absences
    FROM 
        final_attendance_2024_leave_realistic
    GROUP BY 
        employee_id
) a ON e.employee_id = a.employee_id
ORDER BY 
    rank_score DESC
LIMIT 10;