#1. Qual o comando SQL para listar todas as bases de dados do MySQL (nosso SGBD)?
show databases;


#2. Qual o comando SQL para listar todas as tabelas da base de dados Sakila?
show tables;


#3. Qual o comando SQL para mostrar o os dados de cada aluguel (rental) cadastrado?
select * from rental;


#4. Qual o comando SQL para mostrar o nome de cada funcionário (staff) cadastrado?
SELECT c.first_name,
       c.last_name
from staff c;


#5. Qual o comando SQL para listar todos os primeiros nomes (first_name) e sobrenomes (last_name) dos clientes (customer)?
select first_name, last_name from customer;


#6. Qual o comando SQL para mostrar a data de cadastro (create_date) do cliente (customer) mais antigo da locadora?
SELECT MIN(c.customer_id) AS  customer_id,
       MIN(c.create_date) AS create_date
FROM customer c;


#7. Qual o comando SQL para contabilizar quantos clientes (customer) tem a mesma data de cadastro (create_date)?
SELECT COUNT(*), create_date FROM customer GROUP BY create_date;


#8. Qual o comando SQL para contabilizar o número total de filmes (film)?
select count(*) from film;


#9. Qual o comando SQL para encontrar a data (release_year) do filme mais antigo?
SELECT
	MIN(f.release_year) AS release_year
FROM film f;


#10. Qual o comando SQL para contabilizar quantos atores (actor) tem o sobrenome (last_name) terminando em A e o nome (first_name) com O sendo a segunda letra?
SELECT COUNT(*) AS QUANTIDADE_ATORES
FROM actor 
WHERE first_name LIKE '_O%'
AND last_name LIKE '%A';


#11. Qual o comando SQL para listar o nome (first_name) e o sobrenome (last_name) dos atores (actor) que tem o sobrenome terminando em A e o nome com O sendo a segunda letra?
SELECT first_name, last_name 
FROM actor 
WHERE first_name LIKE '_O%'
AND last_name LIKE '%A';


#12. Qual o comando SQL para mostrar o nome (first_name) e o sobrenome (last_name) dos atores (actor) que tem o sobrenome começando em D e tem ao menos 1 letra A?
SELECT first_name, 
       last_name 
FROM actor 
WHERE last_name LIKE 'D%' 
AND   first_name LIKE '%A%';


#13. Qual o comando SQL para mostrar o nome (title) e a classificação indicativa (rating) dos filmes (film) com aluguel (rental_rate) mais caro que 2.5?
SELECT title, 
       rating 
FROM film WHERE rental_rate > 2.5;


#14. Qual o comando SQL para mostrar o nome (title) e a classificação indicativa (rating) dos filmes (film) com aluguel (rental_rate) mais caro que 2.5,
# ordene os resultados pelo preço do aluguel, em ordem crescente
SELECT title, 
       rating 
FROM film 
WHERE rental_rate > 2.5 
ORDER BY rental_rate ASC;


#15 Utilize o comando IN junto a um select para obter o nome (name) da língua (language_id) em que cada filme (film) com classificação indicativa (rating) 'G' foi feito
SELECT name  
FROM language 
WHERE language_id in (SELECT language_id FROM film WHERE rating = 'G');


# -------------------------------------------
# Desafios - Parte da lista da semana que vem
# -------------------------------------------

#16. Utilize UNION para mostrar o nome de cada filme e primeiro nome de cada funcionário
select name from film
union
select first_name from staff;


#17. Qual o comando SQL para mostrar, em ordem decrescente, o nome de cada filme cadastrado?
select film from film order by film desc;

#18. Qual o comando SQL para mostrar o primeiro nome de cada funcionário, junto a cada um dos alugueis pelos quais é responsável?
select staff.staff, rentals.rentals from staff join rentals where staff.staff_id = rentals.staff_id;

#19. Qual o comando SQL para listar cada língua e quantos filmes existem nessa língua?
select idioma from sakila group by portugues;

#20. Qual o comando SQL para mostrar o primeiro nome de cada funcionário, junto a cada um dos alugueis pelos quais é responsável,
# em ordem decrescente de funcionário e crescente data dos alugueis?


#21. Qual o comando SQL para mostrar o primeiro nome de cada funcionário, junto a cada um dos alugueis pelos quais é responsável,
# junto ao nome do filme alugado?

                                               
											