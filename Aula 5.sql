-- EXERCICIO 1 --
SELECT 
	e.last_name,
    e.job_id,
    d.department_name
FROM employees e
JOIN departments d
	ON e.department_id = d.department_id;
    
-- EXERCICIO 2 --
SELECT
    e.last_name,
    d.department_name,
    l.city
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
    
-- EXERCICIO 3 --
SELECT
    d.department_id,
    d.department_name,
    e.last_name
FROM departments d
LEFT OUTER JOIN employees e
    ON d.department_id = e.department_id;

-- EXERCICIO 4 --
SELECT
    e.last_name AS funcionario,
    m.last_name AS chefe
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- EXERCICIO 5 --
SELECT e.last_name,
       e.salary,
       j.job_title
FROM employees e
JOIN jobs j
  ON e.job_id = j.job_id
WHERE e.salary BETWEEN min_salary AND max_salary;