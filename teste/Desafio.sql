
-- 1) Insira 5 usuários

insert into users (first_name, last_name, email, password_hash) values
("Yuri", "Nado", "WWW@DWADA.com", round(rand() * 10000)),
("Takamassa", "Nomuro", "ww@.dwada.com", round(rand() * 10000)),
("Alceu", "Dispor", "www@.coms", round(rand() * 10000)),
("Silas", "Cando", "www.dwacxas", round(rand() * 10000)),
("Davi", "Agra", "ww.ccawe@.com", round(rand() * 10000));

update users set salary = round(rand() * 100000, 2) where id in   # caso so 1 registro, se colocaria where id = 32 por ex
(122, 121, 120, 119, 118);


-- 2) Insira 5 perfís para os usuários inseridos

insert into profiles (bio, description, user_id) values
('uma bio', 'uma description', (select id from users where email = 'WWW@DWADA.com')),  -- Mais complexo
('uma bio', 'uma description', (select id from users where email = 'ww@.dwada.com')),  
('uma bio', 'uma description', 120),  -- so o numero do id seria mais pratico
('uma bio', 'uma description', (select id from users where email = 'www.dwacxas')),
('uma bio', 'uma description', (select id from users where email = 'ww.ccawe@.com'));


-- 3) Insira permissões (roles) para os usuários inseridos

insert into users_roles (user_id, role_id) values
((4, 4), (5, 2), (59, 2), (32, 1),  -- no id 5, coloca-se a permissao 2 por ex
	(select id from users where email = 'WWW@DWADA.com'),
	(select id from roles where name = 'PUT')
));


-- 4) Selecione os últimos 5 usuários por ordem decrescente

select * from users order by id desc limit 5;


-- 5) Atualize o último usuário inserido

update users set first_name='Caindo', last_name='Atualizado' where id = 94;


-- 6) Remova uma permissão de algum usuário

delete from users_roles where 
user_id = 110;


-- 7) Remova um usuário que tem a permissão "PUT"

delete from users_roles where 
user_id = 111 and role_id = 3;


-- 8) Selecione usuários com perfís e permissões (obrigatório)

select u.id as uid, u.first_name, r.name, p.bio
from users u 
inner join users_roles ur on u.id = ur.user_id 
inner join roles r on ur.role_id = r.id
inner join profiles p on p.user_id = u.id;


-- 9) Selecione usuários com perfís e permissões (opcional)

select u.id as uid, u.first_name, r.name, p.bio, u.salary
from users u 
left join users_roles ur on u.id = ur.user_id 
left join roles r on ur.role_id = r.id
left join profiles p on p.user_id = u.id;


-- 10) Selecione usuários com perfís e permissões ordenando por salário

select u.id as uid, u.first_name, r.name, p.bio, u.salary
from users u 
inner join users_roles ur on u.id = ur.user_id 
inner join roles r on ur.role_id = r.id
inner join profiles p on p.user_id = u.id
order by u.salary asc;


