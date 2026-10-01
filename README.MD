# Modelagem Dimensional — Star Schema

## 📌 Sobre o projeto

Projeto de modelagem dimensional desenvolvido a partir de um modelo relacional acadêmico, utilizando o conceito de **Star Schema**.

O modelo foi construído com foco na análise dos dados relacionados aos **professores**, considerando disciplinas ministradas, cursos, departamentos e períodos.

## 🎯 Objetivo

Transformar um modelo relacional em um modelo dimensional orientado à análise de dados e Business Intelligence.

## ⭐ Modelo Dimensional

O modelo é composto por uma tabela fato central e cinco dimensões:

### Tabela Fato

- `fato_ensino`

### Tabelas Dimensão

- `dim_professor`
- `dim_disciplina`
- `dim_curso`
- `dim_departamento`
- `dim_data`

## 📊 Granularidade

A granularidade definida para a tabela fato é:

> Uma linha representa um professor ministrando uma disciplina em determinado curso e período.
