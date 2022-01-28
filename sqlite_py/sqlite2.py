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

cursor.execute('SELECT nome, peso FROM clientes WHERE peso > :peso',
               {'peso': 50})

for linha in cursor.fetchall():
    nome, peso = linha

    print(nome, peso)

cursor.close()
conexao.close()
