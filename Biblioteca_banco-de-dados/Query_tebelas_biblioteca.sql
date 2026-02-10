CREATE TABLE Autor (
Id_Autor SMALLINT IDENTITY,
Nome_Autor VARCHAR(50) NOT NULL,
Sobrenome_Autor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY(Id_Autor)
);

CREATE TABLE Editora(
Id_Editora SMALLINT PRIMARY KEY IDENTITY,
Nome_Editora VARCHAR(50) NOT NULL,
);

CREATE TABLE Assunto(
Id_Assunto TINYINT PRIMARY KEY IDENTITY,
Nome_Assunto VARCHAR(25) NOT NULL,
);

CREATE TABLE Livro (
Id_Livro SMALLINT PRIMARY KEY IDENTITY(100,1),
Nome_Livro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13) UNIQUE,
Data_Pub DATE,
Preco_Livro MONEY NOT NULL,
Numero_Paginas SMALLINT NOT NULL,
Id_Editora SMALLINT NOT NULL,
Id_Assunto TINYINT NOT NULL,
CONSTRAINT fk_id_editora FOREIGN KEY(Id_Editora)
  REFERENCES Editora(Id_Editora) ON DELETE CASCADE,
CONSTRAINT fk_id_assunto FOREIGN KEY(Id_Assunto)
  REFERENCES Assunto(Id_Assunto) ON DELETE CASCADE,
CONSTRAINT verifica_preco CHECK(Preco_Livro >= 0)
);

CREATE TABLE Livro_Autor(
Id_Livro SMALLINT NOT NULL,
Id_Autor SMALLINT NOT NULL,
CONSTRAINT fk_id_livros FOREIGN KEY(Id_Livro) REFERENCES Livro(Id_Livro),
CONSTRAINT fk_id_autores FOREIGN KEY(Id_Autor) REFERENCES Autor(Id_Autor),
CONSTRAINT pk_livro_autor PRIMARY KEY(Id_Livro, Id_Autor)
);

SELECT name FROM Biblioteca.sys.tables;

-- Inserir Registros

--Tabela de Assuntos
INSERT INTO Assunto (Nome_Assunto)
VALUES
('Ficção Científica'), ('Botânica'),
('Eletrônica'), ('Matemática'),
('Aventura'), ('Romance'),
('Finanças'), ('Gastronomia'),
('Terror'), ('Administração'),
('Informática'), ('Suspense');


-- Tabela de Editoras
INSERT INTO Editora (Nome_Editora)
VALUES
('Prentice Hall'), ('O´Reilly'),
('Aleph'), ('Microsoft Press'),
('Wiley'), ('HarperCollins'),
('Érica'), ('Novatec'),
('McGraw-Hill'), ('Apress'),
('Francisco Alves'), ('Sybex'),
('Globo'), ('Companhia das Letras'),
('Morro Branco'), ('Penguin Books'), ('Martin Claret'),
('Record'), ('Springer'), ('Melhoramentos'),
('Oxford'), ('Taschen'), ('Ediouro'),('Bookman');

SELECT * FROM Assunto;


-- Tabela de Autores
INSERT INTO Autor (Nome_Autor, Sobrenome_Autor)
VALUES
('Umberto','Eco'), ('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'),
('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'),
('James', 'Joyce'), ('John', 'Emsley'), ('José', 'Saramago'),
('Richard', 'Silverman'), ('Robert', 'Byrnes'), ('Jay', 'Ts'),
('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield', 'Hill'),
('Joel', 'Murach'), ('Paul', 'Scherz'), ('Simon', 'Monk'),
('George', 'Orwell'), ('Ítalo','Calvino'), ('Machado','de Assis'),
('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'),
('Benjamin','Graham'), ('Júlio','Verne'), ('Marcelo', 'Gleiser'),
('Harri','Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov'),
('Aldous', 'Huxley'), ('Arthur','Conan Doyle'), ('Blaise', 'Pascal'),
('Jostein', 'Gaarder'), ('Stephen', 'Hawking'), ('Stephen', 'Jay Gould'),
('Neil', 'De Grasse Tyson'), ('Charles', 'Darwin'), ('Alan', 'Turing'), ('Arthur', 'C. Clarke');

SELECT * FROM Autor;


INSERT INTO Livro (Nome_Livro, ISBN13, Data_Pub, Preco_Livro, Numero_Paginas,Id_Editora, Id_Assunto)
VALUES 
('1984', '9788535914849', '2009-07-21', 29.67, 416, 14, 1),
('A volta ao mundo em 80 dias', '9788537816134', '1873-01-01', 59.41, 256, 11, 5),
('O nome da Rosa', '9788501115829', '2019-12-16', 51.99, 592, 18, 5),
('Memórias Póstumas de Brás Cubas', '9788525443131', '1881-01-01', 34.90, 240, 14, 6),
('O Evangelho Segundo Jesus Cristo', '9788535905595', '1991-01-01', 49.90, 512, 14, 6),
('Cidades Invisíveis', '9788535907445', '1972-01-01', 42.80, 176, 14, 6),
('Windows Server 2016: Installing & Configuring', '9781535074094', '2016-07-12', 432.00, 436, 4, 11),
('Ensaio Sobre e Cegueira', '9788571645118', '1995-01-01', 39.90, 312, 14, 6),
('Ulisses', '9780141184432', '1922-02-02', 78.90, 450, 16, 6),
('Practical Electronics for Inventors, Fourth Edition', '9781259587542', '2016-07-11', 212.58, 1056, 9, 3),
('Eu Robô', '9788576571667', '1950-12-02', 35.00, 300, 3, 1),
('Dom Casmurro', '9788525404186', '1900-01-01', 19.90, 256, 14, 6);

-- Tabela Livro_Autor
INSERT INTO Livro_Autor(Id_Livro, Id_Autor)
VALUES
(100,15),
(100,16),
(101,27),
(102,26),
(103,41),
(104,24),
(105,32),
(106,20),
(107,27),
(108,1),
(109,22),
(110,10),
(111,21),
(112,5),
(113,10),
(114,8),
(115,18),
(115,19),
(116,31),
(117,22);

-- Verificação
SELECT * FROM Livro_Autor;

-- Verificação com INNER JOIN - consulta mais de uma tabela
SELECT Nome_Livro, Nome_Autor, Sobrenome_Autor
FROM Livro
INNER JOIN Livro_Autor
 ON Livro.Id_Livro = Livro_Autor.Id_Livro
INNER JOIN Autor
 ON Autor.Id_Autor = Livro_Autor.Id_Autor
 ORDER BY Nome_Livro;
