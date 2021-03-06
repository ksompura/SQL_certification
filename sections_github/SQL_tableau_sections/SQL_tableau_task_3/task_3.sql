/* Task 3 Compare the average salary of female versus male employees 
in the entire company until year 2002, and add a filter allowing you to see that per each department.

SQL output columns should be: gender, dept_name, salary, calendar_year
Will use tables: t_employees, t_salaries, t_departments, t_dept_emp

*/

SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(de.from_date) AS calendar_year
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY e.gender , d.dept_name , calendar_year
HAVING calendar_year <= 2002 AND calendar_year >= 1990
ORDER BY d.dept_no, e.gender, calendar_year; 

