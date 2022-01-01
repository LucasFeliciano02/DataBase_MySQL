-- operadores de comparação   = < <= >= <> !=
-- operadores lógicos   and e or


-- Mostra as tabelas da base de dados
show tables;


-- Descreve as colunas da tabela
describe users;


-- inserir registros na base de dados
insert into users (first_name, last_name, email, password_hash) values
("Lucas", "Diazepam", "ccc@hotmail.com", "3"),
("Joana", "rivotril", "joana@hotmail.com", "4"),
("Marcos", "nafitalina", "1234567", "5");


-- Seleciona colunas / select id, name..
select * from users;


-- where filtra registros  /  select ve os registros antes de fazer algo sem retorno como o update e delete
select * from users  # between seleciona um range de datas,  ids, numeros em geral 
where 
created_at between '2021-08-28 00:00:00' 
and '2021-12-03 20:48:09' and id between 50	and 100;


-- in seleciona elementos entre os valores enviados

select * from users 
where id in (110,115,120,125,130,1000)
and first_name in ('Luiz', 'Keelie');


-- like (parecido com in)  %a = qualquer coisa que termine com 'a' vai aparecer na pesquisa | a% sao palavras que comecam com a
-- '%mo%'  =  aparece uma palavra que tem mo no meio
--  %  =  qualquer coisa  |  _  =  1  caractere

select * from users
where first_name like '%a';


-- Ordena valores: 
-- order by id asc (id crescente) 
-- order by id desc (id decrescente)
-- order by id asc, first_name desc (prioriza o id) A ORDEM DOS FATORES ALTERA O RESULTADO

select id, first_name, email as uemail
from users 
where id between 100 and 150
order by first_name desc, id asc;


-- Limit limita a quantidade de valores
-- offset desloca seu ponteiro para frente e é muito usado para fazer paginação
-- offset desloca o cursor para exibir os resultados

select id, first_name, email as uemail
from users 
where id between 100 and 150
order by id asc
limit 2 offset 4;


-- insert com select 
-- insere valores em uma tabela usando outra

insert into profiles 
(bio, description, user_id)
select 1,2,5
concat('Bio de ', first_name),
concat ('Description de', ' ',first_name,),
id
from users;

-- DELETE apaga registros da tabela
-- Aviso: use SELECT para garantir que está apagando os valores corretos

delete from users where id = 55; 

select * from users where id between 50 and 60;


-- update  =  Atualiza registros
-- where id = 60;  =  1 valor so pra id 60
-- where id between 56 and 58;  =  1 valor pros 3

update users set
first_name = 'Lulu',
last_name = 'Anjos '
where id between 56 and 58;
where id = 60;

select * from users where id between 56 and 58;
select * from users where id = 60;


-- u.id  =  id da tabela users
-- p.user_id = user_id da tabela profiles

select u.id as uid, p.id as pid,
p.bio, u.first_name
from users as u, profiles as p
where u.id = p.user_id;
-- id do usuario precisa ser igual ao id que existe em user_id de profiles



-- inner join  (ambos registros de duas tabelas devem existir se nao o valor nao é retornado)
-- right join  |  left join  = pega os registros da tabela x mesmo que nao exista relação com outra tabela (nao precisam estar atrelados)

select u.id as uid, p.id as pid,
p.bio, u.first_name
from users as u
inner join profiles p
on u.id = p.user_id
where u.first_name like '%a'
order by u.first_name desc 
limit 5;


-- RAND E ROUND  =  Configura um salário aleatório para users
-- RAND gera numero aleatório
-- ROUND configura o n de casas decimais
update users set salary = round(rand() * 10000, 2);

-- ve os salarios que estao entre 1000 e 1500 ordenados do menor pro maior
select salary from users where 
salary between 1000 and 1500
order by salary asc;  




-- O usuario que tiver a role POST pode criar coisas na minha api por exemplo
-- Que tiver permissao PUT pode atualizar coisas
-- permissao DELETE pode deletar
-- permissao GET PODE LER COISAS

insert into roles (name) 
values
('POST'), ('PUT'), ('DELETE'), ('GET');



-- Adiciona o id 17 da tabela user e o id 3 da tabela role na tabela users_roles com os mesmos ids
insert into users_roles (user_id, role_id)
values
(17, 3);

-- Apenas ve a tabela com os ids selecionados
select user_id, role_id from users_roles where
user_id = 17  and role_id = 3;


-- Coloca os ids com permissoes roles na tabela users_roles para saber ter controle do user_id, role_id e suas permissoes
-- Nao é possivel rodar o codigo novamente pois se nao criaria os mesmos ids, pois nao pode ser duplicado
insert into users_roles (user_id, role_id)
select
id,
(select id from roles order by rand() limit 1) as qualquer
from users;


-- insert ignore
-- Mais de 1 usuario com mais de uma permissao
-- Muitos usuarios tem muitas permissoes (role_id que é a tabela de permissoes)

insert ignore into users_roles (user_id, role_id)
select
id,
(select id from roles order by rand() limit 1) as qualquer
from users order by rand() limit 10;



-- Select com varios Joins
-- Selecionar usuario, a role que o usuario tem, e o perfil, como fazer a consulta: 

-- u.id as uid;  | uid  = eilias =  quando se seleciona mais de uma tabela, geralmente precisa especificar de qual tabela estou selecionando o campo
-- so coloca isso caso esse mesmo campo existir em duas tabela diferentes
select
u.id as uid, u.first_name, p.bio, r.name as role_name
from users as u;
left join profiles as p on u.id = p.user_id
inner join users_roles as ur on u.id = ur.user_id
inner join roles as r on ur.role_id = r.id
order by uid asc
;
-- Resumo: Estou selecionando os campos u.id e u.first_name da tabela users, 
-- juntando com a tabela profiles onde o id do usuario for igual ao users_id que esta na tabela de profiles



-- Update com joins
-- Esse select ve quantos usuarios tem esse nome
select u.first_name from users u
where u.first_name = 'Keelie';

-- Precisa atualizar o perfil de uma pessoa que tem tal nome

select u.first_name, p.bio from users u
update users as u
join profiles as p 
on p.user_id = u.id
set p.bio = concat(p.bio, 'Atualizado')
where u.first_name = 'Keelie';


-- delete com joins especificando

delete p, u from users u
left join profiles as p 
on p.user_id = u.id
where u.first_name = 'Keelie';



-- GROUP BY  = vai agrupar valores iguais da coluna que vc pedir e vem logo antes do order by
-- Saber quantos usuarios tem o mesmo first_name, last_name
-- quando se tem valores repetidos, posso agrupar eles e utilizar uma função de agregação pra contar esses valores pra mim
-- Aba (total) na tabela é a qtd de vezes que aquele valor esta repetido na tabela users  (tem 2 Lucas por ex)

select first_name, count(id) as total from users 
group by first_name 
order by first_name desc;



select u.first_name, count(u.id) as total from users u
left join profiles as p 
on p.user_id = u.id;
where u.id in (20)
group by first_name 
order by total desc
limit 5;



-- funcoes de agregação
-- xxx as total, soma, maximo   ==  esse é o nome que vai aparecer na tabela de pesquisa ao vc dar Ctrl + enter
-- checando uma tabela por inteiro

select 
max(salary) as max_salary,
min(salary) as min_salary,  
avg(salary) as avg_salary,  -- media
sum(salary) as sum_salary,  -- soma de todos os salarios daquela tabela
count(salary) as count_salary  -- retorna o numero de registros que existe na tabela
from users
where first_name = 'lulu';  -- ve o maximo, minimo, media, soma, vezes que recebeu dos salarios do nome da pessoa x




-- Agregação, so funciona quando tiver registros agregados ou checando uma tabela por inteiro
select
u.first_name,
max(u.salary) as max_salary,
min(u.salary) as min_salary,  
avg(u.salary) as avg_salary,  -- media
sum(u.salary) as sum_salary,  -- soma de todos os salarios daquela tabela
count(u.id) as total 
from users u
left join profiles as p 
on p.user_id = u.id
group by u.first_name 
order by total desc;
