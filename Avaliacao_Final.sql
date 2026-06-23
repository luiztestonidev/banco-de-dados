-- Q01 --

SHOW DATABASES;

USE academia_movimento;

-- Q02 --

SHOW TABLES;

-- Q03 --

DESCRIBE alunos;

-- Q04 --

SELECT COUNT(*) AS total_pagamentos
FROM pagamentos;

-- Q05 --

SELECT *
FROM planos
ORDER BY valor_mensal DESC;

-- Q06 --

CREATE TABLE equipamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    marca VARCHAR(40),
    data_compra DATE,
    em_uso BOOLEAN DEFAULT TRUE );

-- Q07 --

ALTER TABLE alunos
ADD COLUMN telefone VARCHAR(15) NULL;

-- Q08 --

DROP TABLE equipamentos;

-- Q09 --

INSERT INTO alunos (
    nome,
    email,
    data_matricula,
    data_nascimento,
    plano_id,
    ativo )
VALUES (
    'Mariana Rocha',
    'mariana.r@email.com',
    CURDATE(),
    '1995-06-15',
    2,
    TRUE );

-- Q10 --

UPDATE instrutores
SET salario = salario * 1.08
WHERE salario < 3700.00;

-- Q11 --

START TRANSACTION;

UPDATE inscricoes
SET status = 'cancelada'
WHERE aluno_id = 4
  AND status = 'ativa';

SELECT *
FROM inscricoes
WHERE aluno_id = 4;

COMMIT;

-- Q12 --

SELECT nome, email, data_matricula
FROM alunos
WHERE ativo = TRUE
ORDER BY data_matricula DESC;

-- Q13 --

SELECT nome, salario
FROM instrutores
WHERE especialidade <> 'Yoga'
ORDER BY salario ASC;

-- Q14 --

SELECT nome, valor_mensal
FROM planos
WHERE valor_mensal BETWEEN 100.00 AND 200.00;

-- Q15 --

SELECT nome
FROM alunos
WHERE nome LIKE 'A%' 
	OR nome LIKE '%Souza%';
    
-- Q16 --

SELECT a.nome AS aluno, 
		p.nome AS plano
FROM alunos a
LEFT JOIN planos p
    ON a.plano_id = p.id;
    
-- Q17 --

SELECT au.nome AS aula,
       i.nome AS instrutor
FROM aulas au
INNER JOIN instrutores i
        ON au.instrutor_id = i.id
ORDER BY au.nome;

-- Q18 --

SELECT a.nome AS aluno,
       au.nome AS aula,
       i.nome AS instrutor
FROM inscricoes ins
INNER JOIN alunos a
        ON ins.aluno_id = a.id
INNER JOIN aulas au
        ON ins.aula_id = au.id
INNER JOIN instrutores i
        ON au.instrutor_id = i.id
WHERE ins.status = 'ativa'
ORDER BY a.nome;

-- Q19 --

SELECT p.nome AS plano,
       COUNT(a.id) AS quantidade_alunos
FROM planos p
INNER JOIN alunos a
    ON p.id = a.plano_id
GROUP BY p.id, p.nome
HAVING COUNT(a.id) >= 1;

-- Q20 --

SELECT especialidade,
       ROUND(AVG(salario), 2) AS media_salarial
FROM instrutores
GROUP BY especialidade;

-- Q21 --

SELECT a.nome AS aula,
       COUNT(i.id) AS quantidade_inscricoes
FROM aulas a
INNER JOIN inscricoes i
    ON a.id = i.aula_id
WHERE i.status = 'ativa'
GROUP BY a.id, a.nome
HAVING COUNT(i.id) > 2;

-- Q22 --

SELECT a.nome
FROM alunos a
INNER JOIN planos p
    ON a.plano_id = p.id
WHERE p.valor_mensal > (
    SELECT AVG(valor_mensal)
    FROM planos );
    
-- Q23-- 

SELECT nome
FROM instrutores
WHERE id NOT IN (
    SELECT instrutor_id
    FROM aulas
    WHERE instrutor_id IS NOT NULL );