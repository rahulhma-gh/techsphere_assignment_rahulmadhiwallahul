CREATE TABLE employee_attendence_summary (
    employee_id INT PRIMARY KEY,
    total_work_day_cnt int,
    total_present int,
    total_abscences  Int,
    total_hours FLOAT
);
show tables
SELECT * FROM employee_attendence_summary
LIMIT 10;
SELECT COUNT(*) AS total_rows
FROM employee_attendence_summary;
SELECT *
FROM employee_attendence_summary
ORDER BY total_hours DESC
LIMIT 5;
SELECT *
FROM employee_attendence_summary
ORDER BY total_abscences DESC
LIMIT 5;
SELECT AVG(total_hours) AS avg_hours
FROM employee_attendence_summary;
SELECT *
FROM employee_attendence_summary
WHERE total_hours IS NULL
   OR total_present IS NULL
   OR total_work_day_cnt = 0;





