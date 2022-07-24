import pymysql.cursors


# * Conexao com o banco de dados MySQL

# porta padrao MySQL  =  3306
# varchar  =  string de uma qtd x de caracteres
# antes, criar manmualmente uma db com o mesmo nome que aqui no dbeaver mysql

con = pymysql.connect(
    host='localhost',
    user='root',
    password='SENHA',
    port=3306,
    db='python_mysql',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor)


# * Função de criar tabela e Remover tabela

def criaTabela(nomeTabela):

    try:
        with con.cursor() as cursor:
            cursor.execute(f'create table {nomeTabela} (nome varchar(50))')
        print('tabela criada com sucesso')
    except Exception as ex:
        print(f'Ocorreu um erro {ex}')    


criaTabela('teste2')
        
        
def removeTabela(nomeTabela):
    
    try:
        with con.cursor() as cursor:
            cursor.execute(f'drop table {nomeTabela}')
        print('tabela Removida com sucesso')
    except Exception as ex:
        print(f'Ocorreu um erro {ex}')    


removeTabela('teste2')
        
        
# * insert_into, inserindo valores       

def insereTabela(nome):
    # nome = input('Digite um nome: ')
    
        try:
            with con.cursor() as cursor:
                cursor.execute("INSERT INTO teste values ('{nome}')")
            print('Valor inserido com sucesso')
        except Exception as ex:
            print(f'Ocorreu um erro {ex}')       

insereTabela('Djao')
        

# * Select


try:
    with con.cursor() as cursor:
        cursor.execute("SELECT * from teste")
        resultado = cursor.fetchall()
        for i in resultado:
            print(i)
        print(len(resultado))  # n de itens dessa classe
except Exception as ex:
    print(f'Ocorreu um erro {ex}')  


# * update

try:
    with con.cursor() as cursor:
        cursor.execute("UPDATE teste SET nome = 'Lucas' WHERE nome = 'marcos'")
    print('Atualização efetuada com sucesso')
except Exception as ex:
    print(f'Ocorreu um erro {ex}')  


# * DELETE

try:
    with con.cursor() as cursor:
        cursor.execute("DELETE FROM teste WHERE nome='Lucas'")
    print('Remoção efetuada com sucesso')
except Exception as ex:
    print(f'Ocorreu um erro {ex}')  




     
con.close()