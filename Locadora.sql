CREATE TABLE enderecos
(
    id serial primary key,
    logradouro varchar (40) not null,
    tipo varchar (40) not null,
    complemento varchar (20),
    cidade varchar (40)not null,
    UF varchar (5)not null,
    cep varchar (10)not null,
    numero varchar (10)not null,
    bairro varchar (60) not null
);

CREATE TABLE profissoes
(
    id serial primary key,
    nome varchar (60) not null
);

CREATE TABLE categorias
(
    id serial primary key,
    nome varchar (40) not null,
    valor money
);

CREATE TABLE generos
(
    id serial primary key,
    nome varchar (100) not null
);

CREATE TABLE atores
(
    id serial primary key,
    nome varchar (60) not null
);

CREATE TABLE filmes
(
    id serial primary key,
    titulo_original varchar (100) not null,
    titulo varchar (100) not null,
    qtd integer not null,
    fk_categoria integer not null,
    fk_genero integer not null,
    foreign key (fk_categoria) references categorias(id),
    foreign key (fk_genero) references generos(id)
);

CREATE TABLE clientes
(
    id serial primary key,
    cpf varchar (11) not null,
    nome varchar (60) not null,
    tel varchar (15) not null,
    fk_profissao integer not null,
    foreign key (fk_profissao) references profissoes(id)
);

CREATE TABLE locacoes
(
    id serial primary key,
    data_loc date not null,
    desconto money,
    multa money,
    sub_total money not null,
    fk_cliente integer not null,
    data_devolucao date, -- Adicionando a coluna data_devolucao
    foreign key (fk_cliente) references clientes(id)
);

CREATE TABLE dependentes
(
    id serial primary key,
    parentesco varchar (40) not null,
    fk_cliente integer not null,
    fk_dependente integer not null,
    foreign key (fk_cliente) references clientes(id),
    foreign key (fk_dependente) references clientes(id)
);

CREATE TABLE cli_enderecos
(
    id serial primary key,
    fk_endereco integer not null,
    fk_cliente integer not null,
    foreign key (fk_endereco) references enderecos(id),
    foreign key (fk_cliente) references clientes(id)
);

CREATE TABLE filme_ator
(
    id serial primary key,
    e_ator varchar (1) not null,
    e_diretor varchar (1) not null,
    fk_filme integer not null,
    fk_ator integer not null,
    foreign key (fk_filme) references filmes(id),
    foreign key (fk_ator) references atores(id)
);

CREATE TABLE locacao_filme
(
    id serial primary key,
    valor money not null,
    duracao integer not null,
    devolucao date not null,
    fk_locacao integer not null,
    fk_filme integer not null,
    foreign key (fk_locacao) references locacoes(id),
    foreign key (fk_filme) references filmes(id)
);

INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) VALUES ('Rua Indios Cariris', 'Rua', 'Apt 101', 'Campina Grande', 'PB', '58400000', '10', 'Centro');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) VALUES ('Rua Curemas', 'Rua', 'Apt 102', 'Campina Grande', 'PB', '58400001', '20', 'Catolé');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) VALUES ('Rua Acre', 'Rua', 'Apt 103', 'Campina Grande', 'PB', '58400002', '30', 'Liberdade');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) VALUES ('Rua Francisco Pereira d costa', 'Rua', 'Apt 104', 'Campina Grande', 'PB', '58400003', '40', 'Cidades');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) VALUES ('Rua Patos', 'Rua', 'Apt 105', 'Campina Grande', 'PB', '58400004', '50', 'Malvinas');

/*Profissoes */
INSERT INTO profissoes (nome) VALUES ('Pedreiro');
INSERT INTO profissoes (nome) VALUES ('Programador');
INSERT INTO profissoes (nome) VALUES ('Professor');
INSERT INTO profissoes (nome) VALUES ('Eletricista');
INSERT INTO profissoes (nome) VALUES ('Mecanico');

/* generos */
INSERT INTO generos (nome) VALUES('Ação');
INSERT INTO generos (nome) VALUES('Comédia');
INSERT INTO generos (nome) VALUES('Drama');
INSERT INTO generos (nome) VALUES('gospel');
INSERT INTO generos (nome) VALUES('Ficção' );

	/* categorias */
INSERT INTO categorias (nome, valor) VALUES ('Ação', 10.00);
INSERT INTO categorias (nome, valor) VALUES ('Comédia', 8.50);
INSERT INTO categorias (nome, valor) VALUES ('Drama', 9.75);
INSERT INTO categorias (nome, valor) VALUES ('Ficção Científica', 12.20);
INSERT INTO categorias (nome, valor) VALUES ('Romance', 7.90);

SELECT * FROM filmes;
/*Inserções de Filmes */
INSERT INTO filmes (id, titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (1, 'The Dark Knight', 'O Cavaleiro das Trevas', 5, 1, 1);  -- Ação

INSERT INTO filmes (id, titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (2, 'The Hangover', 'Se Beber, Não Case!', 10, 2, 2); -- Comédia

INSERT INTO filmes (id,titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (3,'Mad Max: Fury Road', 'Mad Max: Estrada da Fúria', 2, 1, 1);  -- Ação

INSERT INTO filmes (id,titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (4,'The Social Network', 'A Rede Social', 2, 3, 4);   --Drama

INSERT INTO filmes (id,titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (5,'The Matrix', 'Matrix', 1, 5, 4);   --Ficção Científica

INSERT INTO filmes (id,titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (6,'The Pursuit of Happyness', 'À Procura da Felicidade', 3, 3, 5);   --Drama

INSERT INTO filmes (id,titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (7,'The Lion King', 'O Rei Leão', 2, 2, 2);   --Animação, Ação

INSERT INTO filmes (id,titulo_original, titulo, qtd, fk_genero, fk_categoria)
VALUES (8,'Fireproof', 'Prova de Fogo', 2, 7, 5);  --Gospel


                  -- Inserção filmes_ator
-- O Cavaleiro das Trevas
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('S', 'N', 1, 1), -- Robert Downey Jr.
       ('N', 'N', 1, 4); -- Mark Ruffalo

-- Se Beber, Não Case!
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('S', 'N', 2, 5), -- Chris Evans
       ('N', 'N', 2, 2); -- Chris Hemsworth

-- Mad Max: Estrada da Fúria
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('N', 'N', 3, 1); -- Robert Downey Jr.

-- A Rede Social
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('S', 'N', 4, 3); -- Scarlett Johansson

-- Matrix
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('S', 'N', 5, 1); -- Robert Downey Jr.

-- À Procura da Felicidade
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('N', 'N', 6, 2); -- Chris Hemsworth

-- O Rei Leão
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('N', 'N', 7, 5); -- Chris Evans

-- Prova de Fogo
INSERT INTO filme_ator (e_ator, e_diretor, fk_filme, fk_ator)
VALUES ('N', 'N', 8, 3); -- Scarlett Johansson

/* Atores */
INSERT INTO atores (nome) VALUES ('Robert Downey Jr.');
INSERT INTO atores (nome) VALUES ('Chris Hemsworth');
INSERT INTO atores (nome) VALUES ('Scarlett Johansson');
INSERT INTO atores (nome) VALUES ('Mark Ruffalo');
INSERT INTO atores (nome) VALUES ('Chris Evans');

 /*  Profissoes */
INSERT INTO profissoes (nome) VALUES ('Pedreiro');
INSERT INTO profissoes (nome) VALUES ('Programador');
INSERT INTO profissoes (nome) VALUES ('Professor');
INSERT INTO profissoes (nome) VALUES ('Eletricista');
INSERT INTO profissoes (nome) VALUES ('Mecanico');

/* enderecos */
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) values ('Rua Indios Cariris', 'Rua', 'Apt 101', 'Campina Grande', 'PB', '58400000', '10', 'Centro');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) values ('Rua Curemas', 'Rua', 'Apt 102', 'Campina Grande', 'PB', '58400001', '20', 'Catolé');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) values ('Rua Acre', 'Rua', 'Apt 103', 'Campina Grande', 'PB', '58400002', '30', 'Liberdade');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) values ('Rua Francisco Pereira d costa', 'Rua', 'Apt 104', 'Campina Grande', 'PB', '58400003', '40', 'Cidades');
INSERT INTO enderecos (logradouro, tipo, complemento, cidade, UF, cep, numero, bairro) values ('Rua Patos', 'Rua', 'Apt 105', 'Campina Grande', 'PB', '58400004', '50', 'Malvinas');

/* cli_enderecos */
INSERT INTO cli_enderecos (fk_endereco, fk_cliente) VALUES (1, 1);  -- João Silva
INSERT INTO cli_enderecos (fk_endereco, fk_cliente) VALUES (2, 2);  -- Maria Santos
INSERT INTO cli_enderecos (fk_endereco, fk_cliente) VALUES (3, 3);  -- José Oliveira
INSERT INTO cli_enderecos (fk_endereco, fk_cliente) VALUES (4, 4);  -- Ana Souza
INSERT INTO cli_enderecos (fk_endereco, fk_cliente) VALUES (5, 5);  -- Carlos Ferreira

INSERT INTO clientes (cpf, nome, tel, fk_profissao) VALUES ('12345678901', 'João Silva', '43991234567', 1);
INSERT INTO clientes (cpf, nome, tel, fk_profissao) VALUES ('98765432109', 'Maria Santos', '43998876543', 1);
INSERT INTO clientes (cpf, nome, tel, fk_profissao) VALUES ('56789012345', 'José Oliveira', '43997788990', 5);
INSERT INTO clientes (cpf, nome, tel, fk_profissao) VALUES ('34567890123', 'Ana Souza', '43995566778', 7);
INSERT INTO clientes (cpf, nome, tel, fk_profissao) VALUES ('78901234567', 'Carlos Ferreira', '43994455666', 5);

/* dependentes */
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Filho', 1, 2);  -- João Silva tem um dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Filha', 1, 3);  -- João Silva tem outro dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Esposa', 2, 1);  -- Maria Santos tem um dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Filho', 2, 4);  -- Maria Santos tem mais um dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Filha', 3, 4);  -- José Oliveira tem um dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Filho', 4, 2);  -- Ana Souza tem um dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Filho', 4, 3);  -- Ana Souza tem outro dependente
INSERT INTO dependentes (parentesco, fk_cliente, fk_dependente) VALUES ('Irmã', 5, 2);   -- Carlos Ferreira tem um dependente


                  -- Inserções de locações para cada cliente
-- Cliente 1
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (23.80, 8, '2024-04-24', 1, 1);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (18.50, 6, '2024-04-26', 2, 2);

-- Cliente 2
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (20.50, 7, '2024-04-25', 3, 3);

-- Cliente 3
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (17.90, 5, '2024-04-27', 4, 4);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (15.75, 4, '2024-04-28', 5, 5);

-- Cliente 4
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (21.30, 6, '2024-04-29', 6, 6);

-- Cliente 5
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (19.80, 7, '2024-04-30', 7, 7);

/* locacao_filme */
                  -- Inserções de locações de filmes para cada 
SELECT * FROM filmes WHERE id IN (1, 2, 3, 4, 5);
-- Cliente 1
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (23.80, 8, '2024-04-24', 1, 1);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (18.50, 6, '2024-04-26', 2, 2);

-- Cliente 2
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (20.50, 7, '2024-04-25', 3, 3);

-- Cliente 3
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (17.90, 5, '2024-04-27', 4, 4);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (15.75, 4, '2024-04-28', 5, 5);

-- Cliente 4
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (21.30, 6, '2024-04-29', 6, 6);

-- Cliente 5
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (19.80, 7, '2024-04-30', 7, 7);



/* locacao_filme */
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (18.90, 1, '2024-04-06', 1, 1);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (20.30, 1, '2024-04-07', 2, 2);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (23.80, 8, '2024-04-24', 3, 1);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (12.50, 2, '2024-05-01', 4, 5);
INSERT INTO locacao_filme (valor, duracao, devolucao, fk_locacao, fk_filme) VALUES (16.00, 3, '2024-05-15', 5, 8);

--Consultas
-- 1  - Listar todos os filmes alugados por um cliente específico, incluindo a data de locação e a data de devolução.
SELECT clientes.nome as "Cliente", filmes.titulo as "Filme", locacoes.data_loc as "Data da locação", locacao_filme.devolucao as "Data da devolução"
FROM locacao_filme
JOIN locacoes ON locacao_filme.fk_locacao = locacoes.id
JOIN filmes ON locacao_filme.fk_filme = filmes.id
JOIN clientes ON locacoes.fk_cliente = clientes.id
WHERE clientes.nome = 'Maria Santos';

-- 2  - Obter uma lista de clientes e seus dependentes.
SELECT c.nome AS nome_cliente, d.nome AS nome_dependente, dep.parentesco
FROM clientes c
JOIN dependentes dep ON c.id = dep.fk_cliente
JOIN clientes d ON dep.fk_dependente = d.id;

-- 3  - Listar todos os filmes de um determinado gênero.
SELECT filmes.titulo AS "Filme", generos.nome AS "Gênero"
FROM filmes
JOIN generos ON filmes.fk_genero = generos.id
WHERE generos.nome = 'Ação';

-- 4  - Exibir todos os clientes que têm uma profissão específica.
SELECT clientes.nome AS "Cliente", profissoes.nome AS "Profissão"
FROM clientes
JOIN profissoes ON clientes.fk_profissao = profissoes.id
WHERE profissoes.nome = 'Programador';

-- 5  - Encontrar todos os filmes em uma categoria específica com quantidade disponível maior que 3.
SELECT filmes.titulo AS "Filme", categorias.nome AS "Categoria", filmes.qtd AS "Quantidade Disponível"
FROM filmes
JOIN categorias ON filmes.fk_categoria = categorias.id
WHERE categorias.nome = 'Livre'
AND filmes.qtd > 3;

-- 6  - Listar todos os atores que participaram de filmes com um determinado título.
SELECT atores.nome AS "Ator", filmes.titulo_original AS "Filme"
FROM filme_ator
JOIN atores ON filme_ator.fk_ator = atores.id
JOIN filmes ON filme_ator.fk_filme = filmes.id
WHERE filmes.titulo_original = 'The Dark Knight';

-- 7  - Obter o endereço completo de um cliente específico.
SELECT c.nome AS "Cliente", e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.UF, e.cep
FROM clientes c
JOIN cli_enderecos ce ON c.id = ce.fk_cliente
JOIN enderecos e ON ce.fk_endereco = e.id
WHERE c.nome = 'João Silva';

-- 8  - Listar todos os filmes e seus respectivos gêneros e categorias.
SELECT f.titulo AS "Filme", g.nome AS "Gênero", c.nome AS "Categoria"
FROM filmes f
JOIN generos g ON g.id = f.fk_genero
JOIN categorias c ON c.id = f.fk_categoria;

-- 9  - Mostrar todos os clientes que alugaram um filme específico e a data de locação.
SELECT clientes.nome AS "Cliente", filmes.titulo AS "Título", locacoes.data_loc AS "Data da locação"
FROM locacao_filme
JOIN locacoes ON locacoes.id = locacao_filme.fk_locacao
JOIN clientes ON locacoes.fk_cliente = clientes.id
JOIN filmes ON filmes.id = locacao_filme.fk_filme
WHERE filmes.titulo = 'O Cavaleiro das Trevas';

-- 10 - Exibir a lista de clientes com multas superiores a um valor específico.
SELECT clientes.nome AS "Cliente", locacoes.multa AS "Multa"
FROM locacoes
JOIN clientes ON locacoes.fk_cliente = clientes.id
WHERE locacoes.multa > 5.00::money; -- Posso ajustar o valor da multa conforme necessario

-- 11 - Listar todas as locações feitas em um período específico.
SELECT locacoes.id AS "ID Locação", clientes.nome AS "Cliente", locacoes.data_loc AS "Data de Locação"
FROM locacoes
JOIN clientes ON locacoes.fk_cliente = clientes.id
WHERE locacoes.data_loc BETWEEN '2024-04-01' AND '2024-04-30'; -- Período específico

-- 12 - Obter a quantidade total de filmes alugados por cada cliente. (DESAFIO
SELECT clientes.nome AS "Cliente", COUNT(locacao_filme.id) AS "Total de Filmes Alugados"
FROM locacoes
JOIN clientes ON locacoes.fk_cliente = clientes.id
JOIN locacao_filme ON locacoes.id = locacao_filme.fk_locacao
GROUP BY clientes.nome;

-- 13 - Listar os clientes e os filmes que eles alugaram, ordenados por data de locação.
SELECT clientes.nome AS "Cliente",filmes.titulo AS "Filme",locacoes.data_loc AS "Data da locação"
FROM locacoes
JOIN locacao_filme ON locacoes.id = locacao_filme.fk_locacao
JOIN clientes ON locacoes.fk_cliente = clientes.id
JOIN filmes ON locacao_filme.fk_filme = filmes.id
ORDER BY locacoes.data_loc;

-- 14 - Mostrar todos os clientes que moram em uma cidade específica e que alugaram filmes de uma categoria específica.
SELECT clientes.nome AS "Cliente", enderecos.cidade, filmes.titulo AS "Filme", categorias.nome AS "Categoria"
FROM cli_enderecos
JOIN clientes ON clientes.id = cli_enderecos.fk_cliente
JOIN enderecos ON enderecos.id = cli_enderecos.fk_endereco
JOIN locacoes ON locacoes.fk_cliente = clientes.id
JOIN locacao_filme ON locacoes.id = locacao_filme.fk_locacao
JOIN filmes ON filmes.id = locacao_filme.fk_filme
JOIN categorias ON filmes.fk_categoria = categorias.id
WHERE enderecos.cidade = 'Campina Grande' AND categorias.nome = 'Livre';

-- 15 - Encontrar todos os atores que participaram de pelo menos 5 filmes, listando o nome do ator e o número de filmes em que atuou. (DESAFIO)
SELECT atores.nome AS "Ator", COUNT(DISTINCT filme_ator.fk_filme) AS "Número de Filmes"
FROM filme_ator
JOIN atores ON atores.id = filme_ator.fk_ator
GROUP BY atores.nome
HAVING COUNT(DISTINCT filme_ator.fk_filme) >= 2;

-- 16 - Exibir a quantidade total de filmes alugados por categoria e gênero, incluindo apenas as categorias e gêneros que têm mais de 5 filmes alugados no total (DESAFIO)
SELECT categorias.nome AS "Categoria", generos.nome AS "Gênero",COUNT(*) AS "Quantidade Total de Filmes Alugados"
FROM locacao_filme lf
JOIN filmes f ON lf.fk_filme = f.id
JOIN categorias ON f.fk_categoria = categorias.id
JOIN generos ON f.fk_genero = generos.id
GROUP BY categorias.nome, generos.nome
HAVING COUNT(*) > 5;


SELECT * FROM categorias;
SELECT * FROM generos;
SELECT * FROM filmes;
SELECT * FROM atores;
SELECT * FROM filme_ator;
SELECT * FROM profissoes;
SELECT * FROM clientes;
SELECT * FROM locacoes;
SELECT * FROM locacao_filme