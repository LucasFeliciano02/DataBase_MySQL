"""

# * Caso der erro de ja existencia de tabela, é so excluir o arquivo.db e rodar novamente 

• Banco de dados para uma livraria:

- Categoria  ==  id, nome 
- Membro  ==  id, nome ,tel, genero, endereço
- Livro  ==  id, titulo, ator, editora, categoria, copias, adicionado_em
- Livro_alugado  =  id, id_livro, id_membro, alugado_em, data_de_retorno


- with  =  quando se usa with, nao precisa colocar no final:  conexao.close()

"""


import sqlite3 as lite


#* ------- CONECTANDO PYTHON COM SQLITE -------

conexao = lite.connect('Livraria.db')  # Nome do banco de dados a criar


######* CRIANDO TABELAS *######


# --- Tabela Categoria ---

with conexao:
    cursor = conexao.cursor()
    cursor.execute("CREATE TABLE Categoria(id INTEGER, nome TEXT, PRIMARY KEY('id' AUTOINCREMENT))")


# --- Tabela Membro ---

with conexao:
    cursor = conexao.cursor()
    cursor.execute("CREATE TABLE Membro(id INTEGER, nome TEXT, genero TEXT, telefone TEXT, endereco TEXT, PRIMARY KEY('id' AUTOINCREMENT))")


# --- Tabela Livro ---

with conexao:
    cursor = conexao.cursor()
    cursor.execute("CREATE TABLE Livro(id INTEGER, titulo TEXT, autor TEXT, editora TEXT, categoria INTEGER, copias INT, adicionado_em DATE, PRIMARY KEY('id' AUTOINCREMENT), FOREIGN KEY('categoria') REFERENCES 'Categoria' ('id') ON DELETE CASCADE)")


# --- Tabela Livros_Alugados ---

with conexao:
    cursor = conexao.cursor()
    cursor.execute("CREATE TABLE Livro_Alugado(id INTEGER, id_livro INT, id_membro INT, alugado_em DATE, data_de_retorno DATE, PRIMARY KEY('id' AUTOINCREMENT), FOREIGN KEY('id_livro') REFERENCES 'Livro'('id') ON DELETE CASCADE, FOREIGN KEY('id_membro') REFERENCES 'Membro'('id') ON DELETE CASCADE )")

    
