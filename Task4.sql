SELECT
    e.department_id,
    COUNT(a.employee_id) AS total_records,
    SUM(CASE WHEN a.attendance_status = 'Absent' THEN 1 ELSE 0 END) AS total_absent,
    AVG(CAST(a.total_hours AS FLOAT)) AS avg_total_hours,
    STDDEV(CAST(a.total_hours AS FLOAT)) AS std_total_hours,
    SUM(CASE WHEN a.attendance_status = 'Absent' THEN 1 ELSE 0 END) * 1.0 / COUNT(a.employee_id) AS absence_rate
FROM
    final_attendance_2024_leave_realistic a
JOIN
    employee_details e ON a.employee_id = e.employee_id
GROUP BY
    e.department_id
ORDER BY
    absence_rate DESC,
    std_total_hours DESC
LIMIT 10;
