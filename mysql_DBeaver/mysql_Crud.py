
# TEM QUE SEMPRE FECHAR A CONEXAO NO FINAL DO CODIGO

# CRUD - CREATE, READ, UPDATE, DELETE

import pymysql.cursors
from contextlib import contextmanager

@contextmanager
def conecta():
    conexao = pymysql.connect(
        host='127.0.0.1',
        user='Lucas',
        password='SENHA',
        db='clientes',
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )

    try:
        yield conexao
    finally:
        print('Conexão fechada')
        conexao.close()


# ADD UM REGTISTRO NA BASE DE DADOS DO MYSQL

with conecta() as conexao:
    with conexao.cursor() as cursor:  # Nao precisa colocar id pois é auto incremente
        sql = 'INSERT INTO clientes (nome, sobrenome, idade, peso) VALUES' \
              '(%s, %s, %s, %s)'  # Cada %s é um valor dentro do (jack é %s que significa o nome )
        cursor.execute(sql, ('jack', 'Avilson', 30, 220))
        conexao.commit()


# ADD VARIOS NOMES NA LISTA DO MYSQL

with conecta() as conexao:
    with conexao.cursor() as cursor:
        sql = 'INSERT INTO clientes (nome, sobrenome, idade, peso) VALUES ' \
              '(%s, %s, %s, %s)'

    dados = [
            ('MURIEL', 'FIGUEIREDO', 19, 55),
           ('REYNALDO', 'FIGUEIREDO', 19, 55),
            ('JOSE', 'FIGUEIREDO', 19, 55),
        ]
    cursor.executemany(sql, dados)  # mandar varios valores de uma vez
    conexao.commit()


#  APAGA REGISTROS COM TAL ID DA BASE DE DADOS E COM RANGE CASO USAR O BETWEEN
with conecta() as conexao:
    with conexao.cursor() as cursor:
        sql = 'DELETE FROM clientes WHERE id IN (%s, %s)'  # ... WHERE id BETWEEN %s AND %s'  remove entre valor x e x
        cursor.execute(sql, (4, 5))
        conexao.commit()


# ATUALIZA UM REGISTRO NA BASE DE DADOS
with conecta() as conexao:
    with conexao.cursor() as cursor:
        sql = 'UPDATE clientes SET nome=%s WHERE id=%s'
        cursor.execute(sql, ('JOANA', 2))
        conexao.commit()


# SELECIONA OS DADOS DA BASE DE DADOS
with conecta() as conexao:  # Esse gerenciador de contexto esta fechando a conexao
    with conexao.cursor() as cursor:  # e esse esta fechando o cursor, sao duas conexoes interligadas
        cursor.execute('SELECT * FROM clientes ORDER BY id ASC LIMIT 100')  # Limita as consultas, boa pratica de progra
        resultado = cursor.fetchall()  # Pega tudo de uma vez

        for linha in resultado:
            print(linha['nome'], linha['sobrenome'])
            