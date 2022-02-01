-- Criação de Banco de Dados: CREATE DATABASE nome;

create database hashtag;


-- 2. Seleção do Banco de Dados USE DATABASE

use hashtag;


-- 3. Criação de tabelas no Banco de Dados selecionado: CREATE TABLE

create table Venda(
	ID_Venda INT,
	Curso VARCHAR(100),
	Aluno VARCHAR(100),
	Estado VARCHAR(100),
	Valor DECIMAL(10, 2)
);


-- 4. Incluir dados na tabela: INSERT INTO

insert into Venda(ID_Venda, Curso, Aluno, Estado, Valor)
values
	(1, 'Excel', 'Cleitom', 'SP', 100),
	(2, 'VBA', 'Renaldo', 'PR', 55),
	(3, 'Python', 'Josi', 'CFC', 88),
	(4, 'Excel', 'Amiltom', 'PR', 76),
	(5, 'Power BI', 'Welizei', 'BH', 90),
	(6, 'Full stack', 'José', 'BA', 250);



-- 5. Selecionar dados de uma tabela: SELECT

select * from Venda;
select Aluno, Curso, Valor from Venda;


-- 6. Ordenar dados em uma tabela por ordem alfabética: ORDER BY

select * from Venda
order by Aluno, Curso;


-- 7. Filtrar dados em uma tabela: WHERE

select * from Venda
where Estado = 'PR';


-- 8. Atualização de valores dentro da tabela: UPDATE

select * from venda;

update Venda
set Valor = 150
where Curso = 'VBA';


-- 9. Exclusão de linhas da tabela: DELETE

delete from Venda
where ID_VENDA = 4;


-- 10. Exclusão de todos os dados de uma tabela(VAI SUMIR TUDO): TRUNCATE 

truncate table Venda;














