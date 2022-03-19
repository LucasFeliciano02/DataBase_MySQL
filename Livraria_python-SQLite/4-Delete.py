import sqlite3 as lite


######* UPDATE DE INFORMAÇÕES *######

conexao = lite.connect('livraria.db')


# --- Tabela Livro ---

valores = [2]  # id = 1

with conexao:
    cursor = conexao.cursor()
    query = "DELETE FROM Livro WHERE id=?"
    cursor.execute(query, valores)


#* EX:  Só pra ver o que tem dentro da tabela

cursor = conexao.cursor()
cursor.execute("SELECT * FROM Livro")
print(cursor.fetchall())