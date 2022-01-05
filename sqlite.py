# (?, ?) é mais seguro pois previne o sql injection, é mais seguro

import sqlite3

conexao = sqlite3.connect('basededados.db')
cursor = conexao.cursor()

cursor.execute('CREATE TABLE IF NOT EXISTS clientes ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'nome TEXT,'
              'peso REAL'
               ')')

cursor.execute('INSERT INTO clientes (nome, peso) VALUES (?, ?)', ('Lucas', 50))
cursor.execute(
    'INSERT INTO clientes (nome, peso) VALUES (:nome, :peso)',
    {'nome': 'Joãozinho', 'peso': 25}
)
conexao.commit()

cursor.execute(
    'UPDATE clientes SET nome=:nome WHERE id=:id',
    {'nome': 'Joana', 'id': 2}
)
conexao.commit()  # == escrever modificação em DB Browser

cursor.execute(
    'DELETE FROM clientes WHERE id=:id',
    {'id': 1}
)
conexao.commit()
cursor.execute('SELECT * FROM clientes')  # mostra tds os valores que tem naquela tabela

for linha in cursor.fetchall():
    identificador, nome, peso = linha

    print(identificador, nome, peso)

cursor.close()
conexao.close()
