-- Gerenciamento de Tabelas
-- ALTER , DROP, NAME

-- ALTER TABLE Nome_Tabela
-- ADD / ALTER/ DROP Objeto;


-- Adicionar uma coluna a uma tabela existente.
ALTER TABLE Livro
ADD Edicao SMALLINT;

-- Alterar o tipo de dado de uma coluna
ALTER TABLE Livro
ALTER COLUMN Edicao TINYINT; 

INSERT INTO Assunto (Nome_Assunto)
VALUES