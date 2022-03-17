import sqlite3 as lite


######* UPDATE DE INFORMAÇÕES *######

conexao = lite.connect('livraria.db')


# --- Tabela Livro_Alugado ---

valores = ['29/03/2011', 1]  # id = 1

with conexao:
    cursor = conexao.cursor()
    query = "UPDATE Livro_Alugado SET data_de_retorno=? WHERE id=?"
    cursor.execute(query, valores)


#* EX:  Só pra ver o que tem dentro da tabela

cursor = conexao.cursor()
cursor.execute("SELECT * FROM Livro_Alugado")
print(cursor.fetchall())