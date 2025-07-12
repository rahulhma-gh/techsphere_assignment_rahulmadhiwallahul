SELECT
    e.employee_id,
    e.employee_name,
    e.certifications,
    p.project_id,
    p.technologies_used,
    p.milestones_achieved
FROM
    employee_details e
JOIN
    project_assignments p ON e.employee_id = p.employee_id
WHERE
    p.milestones_achieved >= 8
ORDER BY
    p.milestones_achieved DESC;
