import sqlite3 as lite


# * SEMPRE COMENTAR O QUE JA FOI INSERIDO PARA NAO DUPLICAR


######* INSERINDO DADOS NAS TABELAS *######

conexao = lite.connect('livraria.db')


# --- Tabela Categoria ---

"""
with conexao:
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO Categoria (nome) VALUES('Romance')")
    cursor.execute("INSERT INTO Categoria (nome) VALUES('Drama')")
    cursor.execute("INSERT INTO Categoria (nome) VALUES('Aventura')")
    cursor.execute("INSERT INTO Categoria (nome) VALUES('Terror')")
    cursor.execute("INSERT INTO Categoria (nome) VALUES('Comedia')")
"""


# --- Tabela Membro ---

"""
valores = ['Teresão', 'M', '123455454', 'Brasil']

with conexao:
    cursor = conexao.cursor()
    query = ("INSERT INTO Membro (nome, genero, telefone, endereco) VALUES(?, ?, ?, ?)")
    cursor.execute(query, valores )
"""


# --- Tabela Livro ---

"""
valores = ['A vinganca da julieta', 'Davince', 'Br.Editora', 3, 10, '23/02/2011']

with conexao:
    cursor = conexao.cursor()
    query = "INSERT INTO Livro (titulo, autor, editora, categoria, copias, adicionado_em) VALUES (?, ?, ?, ?, ?, ?)"
    cursor.execute(query, valores)
"""


# --- Tabela Livro_Alugado ---
"""
valores = [1, 1, '43/02/2011', '29/03/2011']

with conexao:
    cursor = conexao.cursor()
    query = "INSERT INTO Livro_Alugado (id_livro, id_membro, alugado_em, data_de_retorno) VALUES (?, ?, ?)"
    cursor.execute(query, valores)
"""

                                                    
#* EX: Só pra ver o que tem dentro da tabela, TIPO UM  |GET|

cursor = conexao.cursor()
cursor.execute("SELECT * FROM Livro")
print(cursor.fetchall())
