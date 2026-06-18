-- EXERCICIO 1 --
SELECT 
	* 
FROM 
	employees;
    
-- EXERCICIO 2 --
SELECT 
	department_name,location_id 
FROM 
	departments;

-- EXERCICIO 3 --
SELECT 
	job_id,job_title,
    max_salary 
FROM 
	jobs;

-- EXERCICIO 4 --
SELECT 
	job_title,
    max_salary,
    job_id 
FROM 
	jobs;

-- EXERCICIO 5 --
SELECT 
	first_name,
    last_name,
    email,
    phone_number 
FROM 
	employees;

-- EXERCICIO 6 --
SELECT 
	last_name,
    salary + 500 AS new_salary 
FROM 
	employees;

-- EXERCICIO 7 --
SELECT 
	last_name,
    salary * 12 AS salary_annual 
FROM 
	employees;

-- EXERCICIO 8 --
SELECT 
	last_name,
    salary * 12 + 1000 AS salary_annual 
FROM 
	employees;

-- EXERCICIO 9 --
SELECT 
	last_name,
    salary * (12 + 1000) AS salary_annual 
FROM 
	employees;
-- como esta em ( ) ele prioriza, ele primeiro soma (12 + 1000) e depois multiplica salary * 1012 --

-- EXERCICIO 10 --
SELECT 
	last_name,
    job_id,
    salary * 12 * IFNULL(commission_pct, 0) AS commission_annual 
FROM 
	employees;
-- acredito que o porque de retornar NULL seja porque o funcionario nao esteja apto para comissoes --

-- EXERCICIO 11 --
SELECT 
	last_name AS Sobrenome,
    salary AS Salário,
    salary * 12 AS "Salário Anual" 
FROM 
	employees;

-- EXERCICIO 12 --
SELECT concat
	(first_name , ' ' , last_name , ' (E-mail: ' , email, ')') AS "Identificação" 
FROM 
	employees;

-- EXERCICIO 13 --
SELECT concat
	(last_name, ' trabalha no cargo ', job_id, ' e ganha R$ ', salary, ' por mês.') AS "Apresentação do Funcionário" 
FROM 
	employees;

-- EXERCICIO 14 --
SELECT concat
	(job_title, ': de R$ ', min_salary, ' ate R$ ', max_salary) AS "Faixa Salarial" 
FROM 
	jobs;

-- EXERCICIO 15 --
SELECT DISTINCT 
	department_id 
FROM 
	employees;

-- EXERCICIO 16 --
SELECT DISTINCT 
	job_id 
FROM 
	employees;

-- EXERCICIO 17 --
SELECT DISTINCT 
	department_id,
	job_id 
FROM 
	employees;

-- EXERCICIO 18 --
SELECT
    concat(last_name, concat(', ', first_name)) AS "Funcionário",
    job_id AS "Cargo",
    salary AS "Salário Mensal",
    salary * 12 AS "Salário Anual",
    salary * 12 * commission_pct AS "Comissão Anual",
    (salary * 12) + (salary * 12 * commission_pct) AS "Remuneração Anual Total"
FROM 
	employees;
    
SELECT 
	