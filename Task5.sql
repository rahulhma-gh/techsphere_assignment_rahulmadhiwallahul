SELECT
    e.certifications AS training_technology,
    AVG(p.milestones_achieved) AS avg_milestones_achieved,
    COUNT(DISTINCT p.project_id) AS projects_count
FROM
    employee_details e
JOIN
    project_assignments p ON e.employee_id = p.employee_id
WHERE
    e.certifications IS NOT NULL
    AND p.technologies_used IS NOT NULL
    AND (
        LOWER(p.technologies_used) LIKE '%aws%'
        OR LOWER(p.technologies_used) LIKE '%azure%'
        OR LOWER(p.technologies_used) LIKE '%sql%'
        OR LOWER(p.technologies_used) LIKE '%python%'
        OR LOWER(p.technologies_used) LIKE '%node.js%'
        OR LOWER(p.technologies_used) LIKE '%react%'
        OR LOWER(p.technologies_used) LIKE '%flutter%'
        OR LOWER(p.technologies_used) LIKE '%ccna%'
        OR LOWER(p.technologies_used) LIKE '%tableau%'
        OR LOWER(p.technologies_used) LIKE '%itil%'
    )
GROUP BY
    e.certifications
ORDER BY
    avg_milestones_achieved DESC;
