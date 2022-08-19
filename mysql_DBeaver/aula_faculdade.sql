create database bd_aula;
use bd_aula;

show databases;
show tables;
describe Professores;
    
    
create table Professores(
	nome varchar(30),
    formacao varchar(55),  -- VARCHAR é de comprimento variável
    cpf char(16),  -- CHAR é um tipo de dado de comprimento fixo
    data_nasc date,
    primary key(cpf)
);

-- alter table Professores rename to Professores;

create table professores_fk(
	chaveFKCPF char(16),  -- PK cpf da outra tabela vai ser FK nessa tabela
    foreign key (chaveFKCPF) references  professores(cpf)
);


# Criando banco de dados Exemplo

create database Exemplo;
use Exemplo;


# Criando tabela Universidade

create table Universidade(
	nome varchar(20),
    estado enum('PR', 'SC'),  -- Filtra para apenas a universidade ser apenas desses estados
    primary key (nome)
);

describe Universidade;


# Criando tabela Cursos
create table Cursos(
	nome varchar(20),
    id int,
	numeroAlunos int,
    Uni varchar(20),
    primary key(id),
    foreign key (Uni) references Universidade(nome)
);

describe Cursos;


# Criando tabela Alunos

create table Alunos(
	nome Varchar(20),
    curso int,
    RGM int,
    primary Key (RGM),
    foreign key (curso) references Cursos(id)
);