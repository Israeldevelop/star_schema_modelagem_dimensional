-- Ver todos os registros da fato

SELECT *
FROM fato_ensino;

-- Ver o professor e a disciplina

SELECT
    p.nome_professor,
    d.nome_disciplina
FROM fato_ensino f
JOIN dim_professor p
    ON f.professor_key = p.professor_key
JOIN dim_disciplina d
    ON f.disciplina_key = d.disciplina_key;
    

-- Professor + curso + disciplina

SELECT
    p.nome_professor,
    c.nome_curso,
    d.nome_disciplina
FROM fato_ensino f
JOIN dim_professor p
    ON f.professor_key = p.professor_key
JOIN dim_curso c
    ON f.curso_key = c.curso_key
JOIN dim_disciplina d
    ON f.disciplina_key = d.disciplina_key
ORDER BY p.nome_professor;


-- Professor + departamento

SELECT 
    p.nome_professor, dep.nome_departamento
FROM
    fato_ensino f
        JOIN
    dim_professor p ON f.professor_key = p.professor_key
        JOIN
    dim_departamento dep ON f.departamento_key = dep.departamento_key
ORDER BY dep.nome_departamento;


-- Professor + disciplina + data

SELECT
    p.nome_professor,
    d.nome_disciplina,
    dt.data,
    dt.ano,
    dt.semestre
FROM fato_ensino f
JOIN dim_professor p
    ON f.professor_key = p.professor_key
JOIN dim_disciplina d
    ON f.disciplina_key = d.disciplina_key
JOIN dim_data dt
    ON f.data_key = dt.data_key
ORDER BY dt.data;


-- Quantas disciplinas cada professor ministra?

SELECT
    p.nome_professor,
    SUM(f.qtd_disciplina) AS total_disciplinas
FROM fato_ensino f
JOIN dim_professor p
    ON f.professor_key = p.professor_key
GROUP BY p.nome_professor
ORDER BY total_disciplinas DESC;


-- Quantas disciplinas existem por departamento?

SELECT
    dep.nome_departamento,
    SUM(f.qtd_disciplina) AS total_disciplinas
FROM fato_ensino f
JOIN dim_departamento dep
    ON f.departamento_key = dep.departamento_key
GROUP BY dep.nome_departamento
ORDER BY total_disciplinas DESC;

-- Quantas disciplinas existem por curso?

SELECT
    c.nome_curso,
    SUM(f.qtd_disciplina) AS total_disciplinas
FROM fato_ensino f
JOIN dim_curso c
    ON f.curso_key = c.curso_key
GROUP BY c.nome_curso
ORDER BY total_disciplinas DESC;


-- Disciplinas por semestre

SELECT
    dt.ano,
    dt.semestre,
    SUM(f.qtd_disciplina) AS total_disciplinas
FROM fato_ensino f
JOIN dim_data dt
    ON f.data_key = dt.data_key
GROUP BY
    dt.ano,
    dt.semestre
ORDER BY
    dt.ano,
    dt.semestre;
    
-- Uma query completa

SELECT
    p.nome_professor,
    dep.nome_departamento,
    c.nome_curso,
    d.nome_disciplina,
    dt.data,
    dt.ano,
    dt.semestre,
    f.qtd_disciplina
FROM fato_ensino f

JOIN dim_professor p
    ON f.professor_key = p.professor_key

JOIN dim_departamento dep
    ON f.departamento_key = dep.departamento_key

JOIN dim_curso c
    ON f.curso_key = c.curso_key

JOIN dim_disciplina d
    ON f.disciplina_key = d.disciplina_key

JOIN dim_data dt
    ON f.data_key = dt.data_key

ORDER BY dt.data;
