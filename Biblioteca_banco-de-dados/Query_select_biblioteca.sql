-- Consultas Simples com SELECT

/*
Sintaxe:
SELECT coluna(s) FROM tabela;
*/

SELECT Nome_Livro FROM Livro;

SELECT Sobrenome_Autor FROM Autor;

SELECT * FROM Autor;

SELECT Nome_Livro, Preco_Livro, ISBN13
FROM Livro;

-- DISTINCT modificador do SELECT que busca registros sem repetição
SELECT DISTINCT Id_Editora
FROM Livro;

--  SELECT INTO: criar uma tabela com dados de outra
/*
SELECT coluna(s)
INTO nova_tabela
FROM tabela_atual;
*/


