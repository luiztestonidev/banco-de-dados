INSERT INTO departments (department_id, department_name)
VALUES (81, 'Pesquisa');

UPDATE employees
SET salary = salary * 1.15
WHERE department_id = 60;

CREATE TABLE devs_backups LIKE employees;

INSERT INTO devs_backups
SELECT *
FROM employees
WHERE job_id = 'IT_PROG';

DELETE FROM departments
WHERE department_id = 80;

START TRANSACTION;

SAVEPOINT antes_aumento;

UPDATE employees
SET salary = salary * 1.5;

SELECT employee_id, salary
FROM employees;

ROLLBACK TO antes_aumento;

COMMIT;