CREATE DATABASE faculdade_dw;

USE faculdade_dw;


-- DIMENSÃO PROFESSOR

CREATE TABLE dim_professor (
    professor_key INT PRIMARY KEY,
    id_professor INT NOT NULL,
    nome_professor VARCHAR(100) NOT NULL
);


-- DIMENSÃO DEPARTAMENTO

CREATE TABLE dim_departamento (
    departamento_key INT PRIMARY KEY,
    id_departamento INT NOT NULL,
    nome_departamento VARCHAR(100) NOT NULL,
    campus VARCHAR(100),
    id_professor_coordenador INT
);


-- DIMENSÃO CURSO

CREATE TABLE dim_curso (
    curso_key INT PRIMARY KEY,
    id_curso INT NOT NULL,
    nome_curso VARCHAR(150) NOT NULL
);


-- DIMENSÃO DISCIPLINA

CREATE TABLE dim_disciplina (
    disciplina_key INT PRIMARY KEY,
    id_disciplina INT NOT NULL,
    nome_disciplina VARCHAR(150) NOT NULL
);


-- DIMENSÃO DATA

CREATE TABLE dim_data (
    data_key INT PRIMARY KEY,
    data DATE NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    trimestre INT NOT NULL,
    mes INT NOT NULL,
    nome_mes VARCHAR(20) NOT NULL,
    dia INT NOT NULL,
    dia_semana INT NOT NULL,
    nome_dia_semana VARCHAR(20) NOT NULL
);


-- TABELA FATO

CREATE TABLE fato_ensino (
    ensino_key INT PRIMARY KEY,

    professor_key INT NOT NULL,
    departamento_key INT NOT NULL,
    data_key INT NOT NULL,
    curso_key INT NOT NULL,
    disciplina_key INT NOT NULL,

    qtd_disciplina INT NOT NULL,

    CONSTRAINT fk_fato_professor
        FOREIGN KEY (professor_key)
        REFERENCES dim_professor(professor_key),

    CONSTRAINT fk_fato_departamento
        FOREIGN KEY (departamento_key)
        REFERENCES dim_departamento(departamento_key),

    CONSTRAINT fk_fato_data
        FOREIGN KEY (data_key)
        REFERENCES dim_data(data_key),

    CONSTRAINT fk_fato_curso
        FOREIGN KEY (curso_key)
        REFERENCES dim_curso(curso_key),

    CONSTRAINT fk_fato_disciplina
        FOREIGN KEY (disciplina_key)
        REFERENCES dim_disciplina(disciplina_key)
);


INSERT INTO dim_professor
    (professor_key, id_professor, nome_professor)
VALUES
    (1, 101, 'João Silva'),
    (2, 102, 'Maria Souza'),
    (3, 103, 'Carlos Oliveira'),
    (4, 104, 'Ana Santos'),
    (5, 105, 'Pedro Lima');
    
    
INSERT INTO dim_departamento
    (departamento_key, id_departamento, nome_departamento, campus, id_professor_coordenador)
VALUES
    (1, 10, 'Tecnologia da Informação', 'Campus Centro', 101),
    (2, 20, 'Engenharia', 'Campus Centro', 103),
    (3, 30, 'Administração', 'Campus Norte', 105);
    

INSERT INTO dim_curso
    (curso_key, id_curso, nome_curso)
VALUES
    (1, 1001, 'Análise e Desenvolvimento de Sistemas'),
    (2, 1002, 'Ciência da Computação'),
    (3, 1003, 'Engenharia de Software'),
    (4, 1004, 'Administração');   


INSERT INTO dim_disciplina
    (disciplina_key, id_disciplina, nome_disciplina)
VALUES
    (1, 501, 'Banco de Dados'),
    (2, 502, 'Programação Python'),
    (3, 503, 'Engenharia de Software'),
    (4, 504, 'Redes de Computadores'),
    (5, 505, 'Algoritmos'),
    (6, 506, 'Gestão de Projetos'),
    (7, 507, 'Sistemas Operacionais'),
    (8, 508, 'Segurança da Informação');


INSERT INTO dim_data
    (data_key, data, ano, semestre, trimestre, mes, nome_mes, dia, dia_semana, nome_dia_semana)
VALUES
    (20260210, '2026-02-10', 2026, 1, 1, 2, 'Fevereiro', 10, 2, 'terça-feira'),

    (20260211, '2026-02-11', 2026, 1, 1, 2, 'Fevereiro', 11, 3, 'quarta-feira'),

    (20260212, '2026-02-12', 2026, 1, 1, 2, 'Fevereiro', 12, 4, 'quinta-feira'),

    (20260305, '2026-03-05', 2026, 1, 1, 3, 'Março', 5, 4, 'quinta-feira'),

    (20260810, '2026-08-10', 2026, 2, 3, 8, 'Agosto', 10, 1, 'segunda-feira'),

    (20260811, '2026-08-11', 2026, 2, 3, 8, 'Agosto', 11, 2, 'terça-feira'),

    (20260915, '2026-09-15', 2026, 2, 3, 9, 'Setembro', 15, 2, 'terça-feira');
    


INSERT INTO fato_ensino
    (ensino_key, professor_key, departamento_key, data_key, curso_key, disciplina_key, qtd_disciplina)
VALUES
    (1, 1, 1, 20260210, 1, 1, 1),
    (2, 1, 1, 20260211, 1, 2, 1),
    (3, 2, 1, 20260212, 1, 4, 1),
    (4, 3, 2, 20260305, 2, 5, 1),
    (5, 3, 2, 20260810, 2, 3, 1),
    (6, 4, 1, 20260811, 1, 7, 1),
    (7, 5, 3, 20260915, 4, 6, 1),
    (8, 1, 1, 20260915, 3, 8, 1);

