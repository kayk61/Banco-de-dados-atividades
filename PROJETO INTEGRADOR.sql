CREATE DATABASE AutoPrime;

USE AutoPrime;

CREATE TABLE Cadastro (
    IDCadastro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CPF_CNPJ VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    Estado VARCHAR(100),
    NomeRua VARCHAR(255),
    Cep INT,
    Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Clientes (
    IDCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    IDCadastro INT NOT NULL,
    Campo VARCHAR(255),
    FOREIGN KEY (IDCadastro) REFERENCES Cadastro(IDCadastro)
);

CREATE TABLE Vendas (
    IDVenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Estado VARCHAR(100),
    CPF VARCHAR(20) NOT NULL,
    Telefone INT,
    Email VARCHAR(255),
    Carrop VARCHAR(255),
    Preco DECIMAL(10,2) NOT NULL,
    Data DATE NOT NULL
);

CREATE TABLE Funcionarios (
    IDFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeFunc VARCHAR(255) NOT NULL,
    TelefoneFunc INT,
    EmailFunc VARCHAR(255) UNIQUE,
    Campo VARCHAR(255)
);

CREATE TABLE TestDrive (
    IDTestDrive INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nomec VARCHAR(255) NOT NULL,
    CarroPego VARCHAR(255) NOT NULL,
    NomeFunc VARCHAR(255),
    IDFuncionario INT NOT NULL,
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionarios(IDFuncionario)
);

CREATE TABLE Carros (
    IDCarroN INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Carros VARCHAR(255) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Condicao VARCHAR(100)
);

CREATE TABLE FornedorP (
    IDFornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FornecedorN VARCHAR(255) NOT NULL,
    NumeroF VARCHAR(20),
    PecaFornecida VARCHAR(255),
    EmailF VARCHAR(255) UNIQUE
);

CREATE TABLE Pecas (
    IDPeca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomePeca VARCHAR(255) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    NomeF VARCHAR(255),
    IDFornecedor INT NOT NULL,
    FOREIGN KEY (IDFornecedor) REFERENCES FornedorP(IDFornecedor)
);

CREATE TABLE Estoque (
    IDEstoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomePeca VARCHAR(255) NOT NULL,
    IDPeca INT NOT NULL,
    QTD INT NOT NULL DEFAULT 0,
    IDFornecedor INT NOT NULL,
    FOREIGN KEY (IDPeca) REFERENCES Pecas(IDPeca),
    FOREIGN KEY (IDFornecedor) REFERENCES FornedorP(IDFornecedor)
);

CREATE TABLE Mecanicos (
    IDMecanico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeMecanico VARCHAR(255) NOT NULL,
    Especialidade VARCHAR(255)
);

CREATE TABLE ServicosOF (
    IDServicoOF INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Atividade VARCHAR(255) NOT NULL,
    IDMecanico INT NOT NULL,
    FOREIGN KEY (IDMecanico) REFERENCES Mecanicos(IDMecanico)
);

CREATE TABLE Vendas_Clientes (
    IDVenda INT NOT NULL,
    IDCliente INT NOT NULL,
    PRIMARY KEY (IDVenda, IDCliente),
    FOREIGN KEY (IDVenda) REFERENCES Vendas(IDVenda) ,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente) 
);


CREATE TABLE Carros_Pecas (
    IDCarro INT NOT NULL,
    IDPeca INT NOT NULL,
    PRIMARY KEY (IDCarro, IDPeca),
    FOREIGN KEY (IDCarro) REFERENCES Carros(IDCarroN),
    FOREIGN KEY (IDPeca) REFERENCES Pecas(IDPeca)
);

CREATE TABLE Pecas_Estoque (
    IDPeca INT NOT NULL,
    IDEstoque INT NOT NULL,
    PRIMARY KEY (IDPeca, IDEstoque),
    FOREIGN KEY (IDPeca) REFERENCES Pecas(IDPeca),
    FOREIGN KEY (IDEstoque) REFERENCES Estoque(IDEstoque) 
);

ALTER TABLE Carros ADD AnoModelo INT NOT NULL;

ALTER TABLE Carros ADD Marca VARCHAR(100) NOT NULL;

ALTER TABLE TestDrive ADD StatusTest VARCHAR(50) DEFAULT 'Agendado';

ALTER TABLE TestDrive ADD KmInicial INT;

ALTER TABLE Funcionarios ADD CPF VARCHAR(20) UNIQUE;

ALTER TABLE Funcionarios ADD DataContratacao DATE;

ALTER TABLE ServicosOF ADD ValorMaoDeObra DECIMAL(10,2) NOT NULL DEFAULT 0.00;

ALTER TABLE FornedorP ADD PrazoEntregaDias INT;

INSERT INTO Cadastro (Nome, CPF_CNPJ, Email, Telefone, Estado, NomeRua, Cep, Senha) VALUES
('Ana Silva', '11111111111', 'ana@email.com', '11999998881', 'SP', 'Av Paulista', 1311000, 'senha1'),
('Carlos Souza', '22222222222', 'carlos@email.com', '21988887772', 'RJ', 'Rua Copacabana', 2202000, 'senha2'),
('Bruno Lima', '33333333333', 'bruno@email.com', '31977776663', 'MG', 'Av Amazonas', 3018000, 'senha3'),
('Diana Costa', '44444444444', 'diana@email.com', '41966665554', 'PR', 'Rua das Flores', 8001000, 'senha4'),
('Eduardo Rocha', '55555555555', 'eduardo@email.com', '51955554445', 'RS', 'Av Ipiranga', 9016009, 'senha5'),
('Fernanda Alves', '66666666666', 'fernanda@email.com', '71944443336', 'BA', 'Av Tancredo', 4182002, 'senha6'),
('Gabriel Cruz', '77777777777', 'gabriel@email.com', '61933332227', 'DF', 'W3 Sul', 7034000, 'senha7'),
('Helena Reis', '88888888888', 'helena@email.com', '81922221118', 'PE', 'Av Boa Viagem', 5101100, 'senha8'),
('Igor Santos', '99999999999', 'igor@email.com', '85911110009', 'CE', 'Av Beira Mar', 6016512, 'senha9'),
('Julia Mendes', '10101010101', 'julia@email.com', '92900009910', 'AM', 'Av Djalma', 6905001, 'senha10'),
('Kevin Oliveira', '12121212121', 'kevin@email.com', '11911112222', 'SP', 'Rua Augusta', 1305000, 'senha11'),
('Larissa Pinto', '13131313131', 'larissa@email.com', '21922223333', 'RJ', 'Av Atlantica', 2201000, 'senha12'),
('Murilo Costa', '14141414141', 'murilo@email.com', '31933334444', 'MG', 'Rua Bahia', 3016000, 'senha13'),
('Natalia Abreu', '15151515151', 'natalia@email.com', '41944445555', 'PR', 'Av Parana', 8002000, 'senha14'),
('Otavio Faria', '16161616161', 'otavio@email.com', '51955556666', 'RS', 'Rua Praia de Belas', 9011000, 'senha15'),
('Paula Souza', '17171717171', 'paula@email.com', '71966667777', 'BA', 'Rua Chile', 4002000, 'senha16'),
('Queiroz Neto', '18181818181', 'queiroz@email.com', '61977778888', 'DF', 'L2 Sul', 7020000, 'senha17'),
('Rafaela Vaz', '19191919191', 'rafaela@email.com', '81988889999', 'PE', 'Rua do Hospicio', 5006000, 'senha18'),
('Samuel Dias', '20202020202', 'samuel@email.com', '85999990000', 'CE', 'Rua Barao do Rio Branco', 6002500, 'senha19'),
('Tatiana Luz', '21212121212', 'tatiana@email.com', '92988881111', 'AM', 'Rua Para', 6905300, 'senha20');

INSERT INTO Clientes (Nome, IDCadastro) VALUES
('Ana Silva', 1), ('Carlos Souza', 2), ('Bruno Lima', 3), ('Diana Costa', 4), ('Eduardo Rocha', 5),
('Fernanda Alves', 6), ('Gabriel Cruz', 7), ('Helena Reis', 8), ('Igor Santos', 9), ('Julia Mendes', 10),
('Kevin Oliveira', 11), ('Larissa Pinto', 12), ('Murilo Costa', 13), ('Natalia Abreu', 14), ('Otavio Faria', 15),
('Paula Souza', 16), ('Queiroz Neto', 17), ('Rafaela Vaz', 18), ('Samuel Dias', 19), ('Tatiana Luz', 20);

INSERT INTO Vendas (Nome, Estado, CPF, Telefone, Email, Carrop, Preco, Data) VALUES
('Ana Silva', 'SP', '11111111111', 99998881, 'ana@email.com', 'Corolla', 145000.00, '2026-01-02'),
('Carlos Souza', 'RJ', '22222222222', 98887772, 'carlos@email.com', 'Onix', 85000.00, '2026-01-05'),
('Bruno Lima', 'MG', '33333333333', 97776663, 'bruno@email.com', 'Civic', 160000.00, '2026-01-10'),
('Diana Costa', 'PR', '44444444444', 96665554, 'diana@email.com', 'Compass', 180000.00, '2026-01-15'),
('Eduardo Rocha', 'RS', '55555555555', 95554445, 'eduardo@email.com', 'HB20', 75000.00, '2026-01-20'),
('Fernanda Alves', 'BA', '66666666666', 94443336, 'fernanda@email.com', 'Creta', 135000.00, '2026-01-25'),
('Gabriel Cruz', 'DF', '77777777777', 93332227, 'gabriel@email.com', 'T-Cross', 140000.00, '2026-02-01'),
('Helena Reis', 'PE', '88888888888', 92221118, 'helena@email.com', 'Argo', 80000.00, '2026-02-05'),
('Igor Santos', 'CE', '99999999999', 91110009, 'igor@email.com', 'Kwid', 65000.00, '2026-02-10'),
('Julia Mendes', 'AM', '10101010101', 90009910, 'julia@email.com', 'S10', 250000.00, '2026-02-15'),
('Kevin Oliveira', 'SP', '12121212121', 91112222, 'kevin@email.com', 'Tracker', 130000.00, '2026-02-20'),
('Larissa Pinto', 'RJ', '13131313131', 92223333, 'larissa@email.com', 'Renegade', 125000.00, '2026-02-25'),
('Murilo Costa', 'MG', '14141414141', 93334444, 'murilo@email.com', 'Pulse', 110000.00, '2026-03-01'),
('Natalia Abreu', 'PR', '15151515151', 94445555, 'natalia@email.com', 'Fastback', 140000.00, '2026-03-05'),
('Otavio Faria', 'RS', '16161616161', 95556666, 'otavio@email.com', 'Nivus', 135000.00, '2026-03-10'),
('Paula Souza', 'BA', '17171717171', 96667777, 'paula@email.com', 'Yaris', 95000.00, '2026-03-15'),
('Queiroz Neto', 'DF', '18181818181', 97778888, 'queiroz@email.com', 'Mobi', 70000.00, '2026-03-20'),
('Rafaela Vaz', 'PE', '19191919191', 98889999, 'rafaela@email.com', 'City', 120000.00, '2026-03-25'),
('Samuel Dias', 'CE', '20202020202', 99990000, 'samuel@email.com', 'Versa', 105000.00, '2026-04-01'),
('Tatiana Luz', 'AM', '21212121212', 98881111, 'tatiana@email.com', 'Hilux', 290000.00, '2026-04-05');

INSERT INTO Funcionarios (NomeFunc, TelefoneFunc, EmailFunc, Campo, CPF, DataContratacao) VALUES
('Roberto Melo', 97771, 'roberto@func.com', 'Senior', '311.111.111-11', '2020-01-15'),
('Marcos Lima', 96662, 'marcos@func.com', 'Consultor', '322.222.222-22', '2021-03-22'),
('Patricia Ramos', 95553, 'patricia@func.com', 'Gerente', '333.333.333-33', '2019-07-01'),
('Lucas Vieira', 94444, 'lucas@func.com', 'Junior', '344.444.444-44', '2023-11-10'),
('Sandra Gomes', 93335, 'sandra@func.com', 'Atendente', '355.555.555-55', '2022-05-18'),
('Andre Silva', 92226, 'andre@func.com', 'Pleno', '366.666.666-66', '2024-02-27'),
('Camila Dias', 91117, 'camila@func.com', 'Vendedor', '377.777.777-77', '2020-09-14'),
('Rodrigo Luz', 90008, 'rodrigo@func.com', 'Vendedor', '388.888.888-88', '2018-12-05'),
('Amanda Vaz', 99999, 'amanda@func.com', 'Consultor', '399.999.999-99', '2023-01-20'),
('Felipe Neto', 98880, 'felipe@func.com', 'Junior', '300.000.000-00', '2021-08-30'),
('Gustavo Cruz', 97770, 'gustavo@func.com', 'Vendedor', '411.111.111-11', '2022-04-12'),
('Juliana Reis', 96660, 'juliana@func.com', 'Atendente', '422.222.222-22', '2025-01-08'),
('Leonardo Costa', 95550, 'leonardo@func.com', 'Pleno', '433.333.333-33', '2017-06-25'),
('Mariana Rocha', 94440, 'mariana@func.com', 'Vendedor', '444.444.444-44', '2023-05-19'),
('Pedro Garcia', 93330, 'pedro@func.com', 'Senior', '455.555.555-55', '2019-11-03'),
('Renata Lima', 92220, 'renata@func.com', 'Consultor', '466.666.666-66', '2020-03-17'),
('Tiago Santos', 91110, 'tiago@func.com', 'Gerente', '477.777.777-77', '2021-10-22'),
('Vanessa Alves', 90000, 'vanessa@func.com', 'Vendedor', '488.888.888-88', '2024-07-14'),
('William Faria', 99991, 'william@func.com', 'Junior', '499.999.999-99', '2022-09-09'),
('Beatriz Pinto', 98882, 'beatriz@func.com', 'Consultor', '400.000.000-00', '2023-02-11');

INSERT INTO TestDrive (Nomec, CarroPego, NomeFunc, IDFuncionario, StatusTest, KmInicial) VALUES
('Ana Silva', 'Corolla', 'Roberto Melo', 1, 'Realizado', 12000),
('Carlos Souza', 'Onix', 'Marcos Lima', 2, 'Cancelado', 45000),
('Bruno Lima', 'Civic', 'Patricia Ramos', 3, 'Agendado', 1500),
('Diana Costa', 'Compass', 'Lucas Vieira', 4, 'Realizado', 0),
('Eduardo Rocha', 'HB20', 'Sandra Gomes', 5, 'Realizado', 89000),
('Fernanda Alves', 'Creta', 'Andre Silva', 6, 'Agendado', 500),
('Gabriel Cruz', 'T-Cross', 'Camila Dias', 7, 'Realizado', 23000),
('Helena Reis', 'Argo', 'Rodrigo Luz', 8, 'Cancelado', 61000),
('Igor Santos', 'Kwid', 'Amanda Vaz', 9, 'Realizado', 1200),
('Julia Mendes', 'S10', 'Felipe Neto', 10, 'Agendado', 34000),
('Kevin Oliveira', 'Tracker', 'Gustavo Cruz', 11, 'Realizado', 9500),
('Larissa Pinto', 'Renegade', 'Juliana Reis', 12, 'Realizado', 100),
('Murilo Costa', 'Pulse', 'Leonardo Costa', 13, 'Cancelado', 54000),
('Natalia Abreu', 'Fastback', 'Mariana Rocha', 14, 'Agendado', 18000),
('Otavio Faria', 'Nivus', 'Pedro Garcia', 15, 'Realizado', 72000),
('Paula Souza', 'Yaris', 'Renata Lima', 16, 'Realizado', 4300),
('Queiroz Neto', 'Mobi', 'Tiago Santos', 17, 'Agendado', 25000),
('Rafaela Vaz', 'City', 'Vanessa Alves', 18, 'Realizado', 105000),
('Samuel Dias', 'Versa', 'William Faria', 19, 'Cancelado', 15000),
('Tatiana Luz', 'Hilux', 'Beatriz Pinto', 20, 'Realizado', 800);

INSERT INTO Carros (Carros, Preco, Condicao, AnoModelo, Marca) VALUES
('Corolla', 145000.00, 'Novo', 2024, 'Toyota'),
('Onix', 85000.00, 'Usado', 2022, 'Chevrolet'),
('Civic', 160000.00, 'Novo', 2025, 'Honda'),
('Compass', 180000.00, 'Novo', 2024, 'Jeep'),
('HB20', 75000.00, 'Usado', 2021, 'Hyundai'),
('Creta', 135000.00, 'Novo', 2023, 'Hyundai'),
('T-Cross', 140000.00, 'Novo', 2025, 'Volkswagen'),
('Argo', 80000.00, 'Usado', 2020, 'Fiat'),
('Kwid', 65000.00, 'Novo', 2024, 'Renault'),
('S10', 250000.00, 'Usado', 2022, 'Chevrolet'),
('Tracker', 130000.00, 'Novo', 2023, 'Chevrolet'),
('Renegade', 125000.00, 'Novo', 2025, 'Jeep'),
('Pulse', 110000.00, 'Usado', 2021, 'Fiat'),
('Fastback', 140000.00, 'Novo', 2024, 'Fiat'),
('Nivus', 135000.00, 'Usado', 2022, 'Volkswagen'),
('Yaris', 95000.00, 'Novo', 2023, 'Toyota'),
('Mobi', 70000.00, 'Novo', 2025, 'Fiat'),
('City', 120000.00, 'Usado', 2020, 'Honda'),
('Versa', 105000.00, 'Novo', 2024, 'Nissan'),
('Hilux', 290000.00, 'Novo', 2023, 'Toyota');

INSERT INTO FornedorP (FornecedorN, NumeroF, PecaFornecida, EmailF, PrazoEntregaDias) VALUES
('Bosch Brasil', '1140041', 'Pastilha Freio', 'contato@bosch.com', 3),
('Magneti Marelli', '1140042', 'Amortecedor', 'vendas@marelli.com', 5),
('NGK Spark', '1140043', 'Vela Ignicao', 'comercial@ngk.com', 2),
('Cofap Distribui', '1140044', 'Pivo Suspensao', 'atendimento@cofap.com', 4),
('Moura Baterias', '1140045', 'Bateria 60A', 'suporte@moura.com', 1),
('Fras-le', '1140046', 'Lona de Freio', 'vendas@frasle.com', 3),
('Sabó Retentores', '1140047', 'Junta Cabecote', 'sabo@sabo.com', 2),
('Nakata Auto', '1140048', 'Barra Direcao', 'contato@nakata.com', 4),
('Monroe', '1140049', 'Pivo Dianteiro', 'atendimento@monroe.com', 6),
('Fram Filtros', '1140050', 'Filtro de Oleo', 'suporte@fram.com', 2),
('Tecfil', '1140051', 'Filtro de Ar', 'vendas@tecfil.com', 1),
('Dayco Belts', '1140052', 'Correia Dentada', 'comercial@dayco.com', 5),
('TRW Automotive', '1140053', 'Cilindro Mestre', 'trw@trw.com', 3),
('Mahle Metal', '1140054', 'Pistao Motor', 'mahle@mahle.com', 7),
('Delphi Tech', '1140055', 'Bico Injetor', 'delphi@delphi.com', 4),
('Siemens VDO', '1140056', 'Bomba Combustivel', 'vdo@siemens.com', 5),
('Osram Lampadas', '1140057', 'Lampada H4', 'osram@osram.com', 2),
('3M Brasil', '1140058', 'Fita Isolante', 'comercial@3m.com', 1),
('Pirelli Pneus', '1140059', 'Pneu 175/70', 'vendas@pirelli.com', 3),
('Goodyear Pneus', '1140060', 'Pneu 205/55', 'suporte@goodyear.com', 4);

INSERT INTO Pecas (NomePeca, Preco, NomeF, IDFornecedor) VALUES
('Pastilha de Freio', 180.00, 'Bosch', 1),
('Amortecedor Dianteiro', 450.00, 'Magneti Marelli', 2),
('Vela de Ignicao', 45.00, 'NGK', 3),
('Pivo Suspensao', 120.00, 'Cofap', 4),
('Bateria 60A', 390.00, 'Moura', 5),
('Lona de Freio', 150.00, 'Fras-le', 6),
('Junta de Cabecote', 210.00, 'Sabó', 7),
('Barra de Direcao', 320.00, 'Nakata', 8),
('Pivo Dianteiro', 115.00, 'Monroe', 9),
('Filtro de Oleo', 35.00, 'Fram', 10),
('Filtro de Ar', 40.00, 'Tecfil', 11),
('Correia Dentada', 190.00, 'Dayco', 12),
('Cilindro Mestre', 280.00, 'TRW', 13),
('Jogo de Pistoes', 850.00, 'Mahle', 14),
('Bico Injetor', 240.00, 'Delphi', 15),
('Bomba de Combustivel', 310.00, 'Siemens', 16),
('Lampada H4', 25.00, 'Osram', 17),
('Fita Isolante High', 15.00, '3M', 18),
('Pneu Aro 14', 350.00, 'Pirelli', 19),
('Pneu Aro 16', 520.00, 'Goodyear', 20);

INSERT INTO Estoque (NomePeca, IDPeca, QTD, IDFornecedor) VALUES
('Pastilha de Freio', 1, 50, 1), ('Amortecedor Dianteiro', 2, 30, 2), ('Vela de Ignicao', 3, 100, 3),
('Pivo Suspensao', 4, 40, 4), ('Bateria 60A', 5, 25, 5), ('Lona de Freio', 6, 15, 6),
('Junta de Cabecote', 7, 10, 7), ('Barra de Direcao', 8, 22, 8), ('Pivo Dianteiro', 9, 35, 9),
('Filtro de Oleo', 10, 200, 10), ('Filtro de Ar', 11, 150, 11), ('Correia Dentada', 12, 45, 12),
('Cilindro Mestre', 13, 12, 13), ('Jogo de Pistoes', 14, 8, 14), ('Bico Injetor', 15, 60, 15),
('Bomba de Combustivel', 16, 18, 16), ('Lampada H4', 17, 80, 17), ('Fita Isolante High', 18, 500, 18),
('Pneu Aro 14', 19, 40, 19), ('Pneu Aro 16', 20, 24, 20);

INSERT INTO Mecanicos (NomeMecanico, Especialidade) VALUES
('Julio Cezar', 'Injecao Eletronica'), ('Ricardo Santos', 'Suspensao e Freios'), ('Andre Souza', 'Motor Geral'),
('Fabio Lima', 'Eletrica Automotiva'), ('Thiago Costa', 'Alinhamento'), ('Marcos Silva', 'Ar Condicionado'),
('Marcelo Ramos', 'Cambio Automatico'), ('Alexandre Melo', 'Lanternagem'), ('Rogerio Cruz', 'Pintura'),
('Luciano Reis', 'Injecao Eletronica'), ('Rodrigo Oliveira', 'Suspensao'), ('Bruno Alves', 'Motor Geral'),
('Cleber Santos', 'Eletrica'), ('Daniel Rocha', 'Alinhamento'), ('Eduardo Faria', 'Freios'),
('Fernando Pinto', 'Ar Condicionado'), ('Guilherme Costa', 'Diagnostico'), ('Hugo Abreu', 'Mecanica Geral'),
('Jefferson Souza', 'Cambio'), ('Leandro Luz', 'Suspensao');

INSERT INTO ServicosOF (Atividade, IDMecanico, ValorMaoDeObra) VALUES
('Troca de Pastilha de Freio', 2, 150.00), ('Alinhamento e Balanceamento', 5, 220.00),
('Diagnostico de Injecao', 1, 350.00), ('Troca de Bateria', 4, 120.00),
('Retifica de Motor', 3, 2500.00), ('Carga de Gas Ar Condicionado', 6, 180.00),
('Manutencao de Cambio', 7, 800.00), ('Reparo de Parachoque', 8, 400.00),
('Pintura de Porta', 9, 600.00), ('Limpeza de Bicos', 10, 130.00),
('Troca de Amortecedor', 11, 300.00), ('Troca de Junta Cabecote', 12, 450.00),
('Instalacao de Alarme', 13, 170.00), ('Cambagem Dianteira', 14, 100.00),
('Troca de Fluido Freio', 15, 140.00), ('Higienizacao do Ar', 16, 90.00),
('Passar Scanner OBD', 17, 110.00), ('Revisao de 40k KM', 18, 500.00),
('Troca de Embreagem', 19, 550.00), ('Troca de Caixa Direcao', 20, 380.00);

INSERT INTO Vendas_Clientes (IDVenda, IDCliente) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10),
(11,11), (12,12), (13,13), (14,14), (15,15), (16,16), (17,17), (18,18), (19,19), (20,20);

INSERT INTO Carros_Pecas (IDCarro, IDPeca) VALUES
(1,1), (2,1), (3,3), (4,2), (5,5), (6,6), (7,4), (8,1), (9,10), (10,15),
(11,11), (12,2), (13,4), (14,9), (15,12), (16,16), (17,17), (18,13), (19,18), (20,20);

INSERT INTO Pecas_Estoque (IDPeca, IDEstoque) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10),
(11,11), (12,12), (13,13), (14,14), (15,15), (16,16), (17,17), (18,18), (19,19), (20,20);

UPDATE Carros SET AnoModelo = 2024 WHERE IDCarroN = 1;
UPDATE Carros SET AnoModelo = 2022 WHERE IDCarroN = 2;
UPDATE Carros SET AnoModelo = 2025 WHERE IDCarroN = 3;
UPDATE Carros SET AnoModelo = 2024 WHERE IDCarroN = 4;
UPDATE Carros SET AnoModelo = 2021 WHERE IDCarroN = 5;
UPDATE Carros SET AnoModelo = 2023 WHERE IDCarroN = 6;
UPDATE Carros SET AnoModelo = 2025 WHERE IDCarroN = 7;
UPDATE Carros SET AnoModelo = 2020 WHERE IDCarroN = 8;
UPDATE Carros SET AnoModelo = 2024 WHERE IDCarroN = 9;
UPDATE Carros SET AnoModelo = 2022 WHERE IDCarroN = 10;
UPDATE Carros SET AnoModelo = 2023 WHERE IDCarroN = 11;
UPDATE Carros SET AnoModelo = 2025 WHERE IDCarroN = 12;
UPDATE Carros SET AnoModelo = 2021 WHERE IDCarroN = 13;
UPDATE Carros SET AnoModelo = 2024 WHERE IDCarroN = 14;
UPDATE Carros SET AnoModelo = 2022 WHERE IDCarroN = 15;
UPDATE Carros SET AnoModelo = 2023 WHERE IDCarroN = 16;
UPDATE Carros SET AnoModelo = 2025 WHERE IDCarroN = 17;
UPDATE Carros SET AnoModelo = 2020 WHERE IDCarroN = 18;
UPDATE Carros SET AnoModelo = 2024 WHERE IDCarroN = 19;
UPDATE Carros SET AnoModelo = 2023 WHERE IDCarroN = 20;

UPDATE Carros SET Marca = 'Toyota' WHERE IDCarroN = 1;
UPDATE Carros SET Marca = 'Chevrolet' WHERE IDCarroN = 2;
UPDATE Carros SET Marca = 'Honda' WHERE IDCarroN = 3;
UPDATE Carros SET Marca = 'Jeep' WHERE IDCarroN = 4;
UPDATE Carros SET Marca = 'Hyundai' WHERE IDCarroN = 5;
UPDATE Carros SET Marca = 'Volkswagen' WHERE IDCarroN = 6;
UPDATE Carros SET Marca = 'Fiat' WHERE IDCarroN = 7;
UPDATE Carros SET Marca = 'Ford' WHERE IDCarroN = 8;
UPDATE Carros SET Marca = 'Renault' WHERE IDCarroN = 9;
UPDATE Carros SET Marca = 'Nissan' WHERE IDCarroN = 10;
UPDATE Carros SET Marca = 'Caoa Chery' WHERE IDCarroN = 11;
UPDATE Carros SET Marca = 'BYD' WHERE IDCarroN = 12;
UPDATE Carros SET Marca = 'GWM' WHERE IDCarroN = 13;
UPDATE Carros SET Marca = 'Peugeot' WHERE IDCarroN = 14;
UPDATE Carros SET Marca = 'Citroen' WHERE IDCarroN = 15;
UPDATE Carros SET Marca = 'BMW' WHERE IDCarroN = 16;
UPDATE Carros SET Marca = 'Mercedes-Benz' WHERE IDCarroN = 17;
UPDATE Carros SET Marca = 'Audi' WHERE IDCarroN = 18;
UPDATE Carros SET Marca = 'Volvo' WHERE IDCarroN = 19;
UPDATE Carros SET Marca = 'Porsche' WHERE IDCarroN = 20;

UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 1;
UPDATE TestDrive SET StatusTest = 'Cancelado' WHERE IDTestDrive = 2;
UPDATE TestDrive SET StatusTest = 'Agendado' WHERE IDTestDrive = 3;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 4;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 5;
UPDATE TestDrive SET StatusTest = 'Agendado' WHERE IDTestDrive = 6;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 7;
UPDATE TestDrive SET StatusTest = 'Cancelado' WHERE IDTestDrive = 8;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 9;
UPDATE TestDrive SET StatusTest = 'Agendado' WHERE IDTestDrive = 10;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 11;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 12;
UPDATE TestDrive SET StatusTest = 'Cancelado' WHERE IDTestDrive = 13;
UPDATE TestDrive SET StatusTest = 'Agendado' WHERE IDTestDrive = 14;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 15;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 16;
UPDATE TestDrive SET StatusTest = 'Agendado' WHERE IDTestDrive = 17;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 18;
UPDATE TestDrive SET StatusTest = 'Cancelado' WHERE IDTestDrive = 19;
UPDATE TestDrive SET StatusTest = 'Realizado' WHERE IDTestDrive = 20;

UPDATE TestDrive SET KmInicial = 12000 WHERE IDTestDrive = 1;
UPDATE TestDrive SET KmInicial = 45000 WHERE IDTestDrive = 2;
UPDATE TestDrive SET KmInicial = 1500 WHERE IDTestDrive = 3;
UPDATE TestDrive SET KmInicial = 0 WHERE IDTestDrive = 4;
UPDATE TestDrive SET KmInicial = 89000 WHERE IDTestDrive = 5;
UPDATE TestDrive SET KmInicial = 500 WHERE IDTestDrive = 6;
UPDATE TestDrive SET KmInicial = 23000 WHERE IDTestDrive = 7;
UPDATE TestDrive SET KmInicial = 61000 WHERE IDTestDrive = 8;
UPDATE TestDrive SET KmInicial = 1200 WHERE IDTestDrive = 9;
UPDATE TestDrive SET KmInicial = 34000 WHERE IDTestDrive = 10;
UPDATE TestDrive SET KmInicial = 9500 WHERE IDTestDrive = 11;
UPDATE TestDrive SET KmInicial = 100 WHERE IDTestDrive = 12;
UPDATE TestDrive SET KmInicial = 54000 WHERE IDTestDrive = 13;
UPDATE TestDrive SET KmInicial = 18000 WHERE IDTestDrive = 14;
UPDATE TestDrive SET KmInicial = 72000 WHERE IDTestDrive = 15;
UPDATE TestDrive SET KmInicial = 4300 WHERE IDTestDrive = 16;
UPDATE TestDrive SET KmInicial = 25000 WHERE IDTestDrive = 17;
UPDATE TestDrive SET KmInicial = 105000 WHERE IDTestDrive = 18;
UPDATE TestDrive SET KmInicial = 15000 WHERE IDTestDrive = 19;
UPDATE TestDrive SET KmInicial = 800 WHERE IDTestDrive = 20;


UPDATE ServicosOF SET ValorMaoDeObra = 150.00 WHERE IDServicoOF = 1;
UPDATE ServicosOF SET ValorMaoDeObra = 220.00 WHERE IDServicoOF = 2;
UPDATE ServicosOF SET ValorMaoDeObra = 350.00 WHERE IDServicoOF = 3;
UPDATE ServicosOF SET ValorMaoDeObra = 120.00 WHERE IDServicoOF = 4;
UPDATE ServicosOF SET ValorMaoDeObra = 2500.00 WHERE IDServicoOF = 5;
UPDATE ServicosOF SET ValorMaoDeObra = 180.00 WHERE IDServicoOF = 6;
UPDATE ServicosOF SET ValorMaoDeObra = 400.00 WHERE IDServicoOF = 7;
UPDATE ServicosOF SET ValorMaoDeObra = 90.00 WHERE IDServicoOF = 8;
UPDATE ServicosOF SET ValorMaoDeObra = 600.00 WHERE IDServicoOF = 9;
UPDATE ServicosOF SET ValorMaoDeObra = 130.00 WHERE IDServicoOF = 10;
UPDATE ServicosOF SET ValorMaoDeObra = 300.00 WHERE IDServicoOF = 11;
UPDATE ServicosOF SET ValorMaoDeObra = 450.00 WHERE IDServicoOF = 12;
UPDATE ServicosOF SET ValorMaoDeObra = 170.00 WHERE IDServicoOF = 13;
UPDATE ServicosOF SET ValorMaoDeObra = 500.00 WHERE IDServicoOF = 14;
UPDATE ServicosOF SET ValorMaoDeObra = 210.00 WHERE IDServicoOF = 15;
UPDATE ServicosOF SET ValorMaoDeObra = 800.00 WHERE IDServicoOF = 16;
UPDATE ServicosOF SET ValorMaoDeObra = 140.00 WHERE IDServicoOF = 17;
UPDATE ServicosOF SET ValorMaoDeObra = 950.00 WHERE IDServicoOF = 18;
UPDATE ServicosOF SET ValorMaoDeObra = 280.00 WHERE IDServicoOF = 19;
UPDATE ServicosOF SET ValorMaoDeObra = 110.00 WHERE IDServicoOF = 20;

UPDATE FornedorP SET PrazoEntregaDias = 3 WHERE IDFornecedor = 1;
UPDATE FornedorP SET PrazoEntregaDias = 5 WHERE IDFornecedor = 2;
UPDATE FornedorP SET PrazoEntregaDias = 2 WHERE IDFornecedor = 3;
UPDATE FornedorP SET PrazoEntregaDias = 4 WHERE IDFornecedor = 4;
UPDATE FornedorP SET PrazoEntregaDias = 1 WHERE IDFornecedor = 5;
UPDATE FornedorP SET PrazoEntregaDias = 7 WHERE IDFornecedor = 6;
UPDATE FornedorP SET PrazoEntregaDias = 3 WHERE IDFornecedor = 7;
UPDATE FornedorP SET PrazoEntregaDias = 6 WHERE IDFornecedor = 8;
UPDATE FornedorP SET PrazoEntregaDias = 2 WHERE IDFornecedor = 9;
UPDATE FornedorP SET PrazoEntregaDias = 5 WHERE IDFornecedor = 10;
UPDATE FornedorP SET PrazoEntregaDias = 4 WHERE IDFornecedor = 11;
UPDATE FornedorP SET PrazoEntregaDias = 10 WHERE IDFornecedor = 12;
UPDATE FornedorP SET PrazoEntregaDias = 3 WHERE IDFornecedor = 13;
UPDATE FornedorP SET PrazoEntregaDias = 2 WHERE IDFornecedor = 14;
UPDATE FornedorP SET PrazoEntregaDias = 5 WHERE IDFornecedor = 15;
UPDATE FornedorP SET PrazoEntregaDias = 1 WHERE IDFornecedor = 16;
UPDATE FornedorP SET PrazoEntregaDias = 8 WHERE IDFornecedor = 17;
UPDATE FornedorP SET PrazoEntregaDias = 4 WHERE IDFornecedor = 18;
UPDATE FornedorP SET PrazoEntregaDias = 6 WHERE IDFornecedor = 19;
UPDATE FornedorP SET PrazoEntregaDias = 2 WHERE IDFornecedor = 20;