CREATE DATABASE EduGest;
USE EduGest;


CREATE TABLE CURSOS (
    id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    duracao_anos INT,
    grau VARCHAR(50)
);

CREATE TABLE ALUNOS (
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    morada VARCHAR(200),
    data_cadastro DATE
);

CREATE TABLE DISCIPLINAS (
    id_disciplina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    creditos INT,
    semestre INT,
    FOREIGN KEY (id_curso) REFERENCES CURSOS(id_curso)
);

CREATE TABLE TURMAS (
    id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    ano_letivo VARCHAR(9),
    periodo VARCHAR(20),
    sala VARCHAR(30),
    FOREIGN KEY (id_curso) REFERENCES CURSOS(id_curso)
);

CREATE TABLE MATRICULAS (
    id_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE,
    status VARCHAR(30),
    FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES CURSOS(id_curso),
    FOREIGN KEY (id_turma) REFERENCES TURMAS(id_turma)
);

CREATE TABLE FALTAS (
    id_falta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    data_falta DATE,
    justificativa TINYINT(1),
    observacao VARCHAR(200),
    FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINAS(id_disciplina)
);

CREATE TABLE PROPINAS (
    id_propina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    competencia VARCHAR(20),
    valor DECIMAL(10,2),
    data_vencimento DATE,
    data_pagamento DATE,
    estado VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno)
);

CREATE TABLE PAUTAS_NOTAS (
    id_nota INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(5,2),
    tipo_avaliacao VARCHAR(50),
    data_registo DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_aluno) REFERENCES ALUNOS(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINAS(id_disciplina)
);
ALTER TABLE CURSOS 
ADD codigo_curso VARCHAR(10) NULL;

ALTER TABLE ALUNOS 
ADD estado_aluno VARCHAR(20) DEFAULT 'Ativo';

ALTER TABLE DISCIPLINAS 
ADD carga_horaria INT NULL;

ALTER TABLE TURMAS 
ADD capacidade_maxima INT NULL;

ALTER TABLE MATRICULAS 
ADD observacoes_matricula VARCHAR(255) NULL;

ALTER TABLE FALTAS 
ADD periodo_falta VARCHAR(20) NULL;

ALTER TABLE PROPINAS 
ADD metodo_pagamento VARCHAR(50) NULL;

ALTER TABLE PAUTAS_NOTAS 
ADD observacao_nota VARCHAR(255) NULL;

ALTER TABLE PAUTAS_NOTAS 
ADD nome_professor VARCHAR(120) NOT NULL;

INSERT INTO CURSOS (nome, duracao_anos, grau, codigo_curso) VALUES
('Engenharia Informática', 5, 'Licenciatura', 'ENG-INF'), ('Administração de Empresas', 4, 'Licenciatura', 'ADM-EMP'),
('Medicina', 6, 'Mestrado Integrado', 'MED-INT'), ('Direito', 5, 'Licenciatura', 'DIR-LIC'),
('Arquitetura', 5, 'Mestrado Integrado', 'ARQ-MIN'), ('Psicologia', 4, 'Licenciatura', 'PSI-LIC'),
('Enfermagem', 4, 'Licenciatura', 'ENF-LIC'), ('Gestão de Recursos Humanos', 4, 'Licenciatura', 'GRH-LIC'),
('Marketing Digital', 3, 'Licenciatura', 'MKT-DIG'), ('Biomedicina', 4, 'Licenciatura', 'BIO-MED'),
('Fisioterapia', 4, 'Licenciatura', 'FIS-LIC'), ('Medicina Veterinária', 5, 'Licenciatura', 'MVET-LIC'),
('Nutrição', 4, 'Licenciatura', 'NUT-LIC'), ('Educação Física', 4, 'Licenciatura', 'EDF-LIC'),
('Jornalismo', 4, 'Licenciatura', 'JOR-LIC'), ('Design Gráfico', 3, 'Licenciatura', 'DSG-GRA'),
('Ciências Contábeis', 4, 'Licenciatura', 'CCN-CONT'), ('Engenharia Civil', 5, 'Licenciatura', 'ENG-CIV'),
('Engenharia Mecânica', 5, 'Licenciatura', 'ENG-MEC'), ('Engenharia Elétrica', 5, 'Licenciatura', 'ENG-ELE'),
('Farmácia', 5, 'Licenciatura', 'FAR-LIC'), ('Odontologia', 5, 'Licenciatura', 'ODO-LIC'),
('Agronomia', 5, 'Licenciatura', 'AGR-LIC'), ('Gastronomia', 3, 'Tecnólogo', 'GAS-TEC'),
('Logística', 3, 'Tecnólogo', 'LOG-TEC'), ('Análise de Sistemas', 3, 'Tecnólogo', 'ADS-TEC'),
('Redes de Computadores', 3, 'Tecnólogo', 'RED-TEC'), ('História', 4, 'Licenciatura', 'HIS-LIC'),
('Geografia', 4, 'Licenciatura', 'GEO-LIC'), ('Letras', 4, 'Licenciatura', 'LET-LIC'),
('Matemática', 4, 'Licenciatura', 'MAT-LIC'), ('Física', 4, 'Licenciatura', 'FIS-PU-LIC'),
('Química', 4, 'Licenciatura', 'QUI-LIC'), ('Biologia', 4, 'Licenciatura', 'BIOL-LIC'),
('Sociologia', 4, 'Licenciatura', 'SOC-LIC'), ('Filosofia', 4, 'Licenciatura', 'FIL-LIC'),
('Relações Internacionais', 4, 'Licenciatura', 'REL-INT'), ('Comércio Exterior', 4, 'Licenciatura', 'COM-EXT'),
('Publicidade e Propaganda', 4, 'Licenciatura', 'PUB-PROP'), ('Cinema', 4, 'Licenciatura', 'CIN-LIC'),
('Teatro', 4, 'Licenciatura', 'TEA-LIC'), ('Música', 4, 'Licenciatura', 'MUS-LIC'),
('Artes Visuais', 4, 'Licenciatura', 'ART-VIS'), ('Pedagogia', 4, 'Licenciatura', 'PED-LIC'),
('Serviço Social', 4, 'Licenciatura', 'SER-SOC'), ('Turismo', 4, 'Licenciatura', 'TUR-LIC'),
('Hotelaria', 3, 'Tecnólogo', 'HOT-TEC'), ('Secretariado Executivo', 4, 'Licenciatura', 'SEC-EXE'),
('Engenharia de Produção', 5, 'Licenciatura', 'ENG-PROD'), ('Engenharia Química', 5, 'Licenciatura', 'ENG-QUIM');

INSERT INTO ALUNOS (nome, email, data_nascimento, telefone, morada, data_cadastro, estado_aluno) VALUES
('Ana Silva', 'ana.silva@edu.com', '2005-01-15', '911111111', 'Rua das Flores 12', '2026-01-10', 'Ativo'),
('Bruno Santos', 'bruno.santos@edu.com', '2004-03-22', '922222222', 'Av. Central 45', '2026-01-11', 'Ativo'),
('Carlos Oliveira', 'carlos.oli@edu.com', '2003-07-09', '933333333', 'Rua Nova 78', '2026-01-12', 'Inativo'),
('Daniela Souza', 'daniela.s@edu.com', '2005-11-30', '944444444', 'Travessa do Sol 3', '2026-01-13', 'Ativo'),
('Eduardo Lima', 'eduardo.l@edu.com', '2004-05-14', '955555555', 'Alameda Verde 90', '2026-01-14', 'Ativo'),
('Fernanda Costa', 'fernanda.c@edu.com', '2005-02-27', '966666666', 'Rua dos Pinheiros 11', '2026-01-15', 'Ativo'),
('Gabriel Almeida', 'gabriel.a@edu.com', '2002-09-18', '977777777', 'Av. da Liberdade 200', '2026-01-16', 'Ativo'),
('Amanda Martins', 'amanda.m@edu.com', '2004-12-05', '988888888', 'Rua da Praia 5', '2026-01-17', 'Ativo'),
('Igor Ribeiro', 'igor.r@edu.com', '2003-04-20', '999999999', 'Rua das Pedras 34', '2026-01-18', 'Inativo'),
('Juliana Carvalho', 'juliana.c@edu.com', '2005-06-12', '912345678', 'Beco Escuro 2', '2026-01-19', 'Ativo'),
('Lucas Pereira', 'lucas.p@edu.com', '2004-08-25', '923456789', 'Rua do Ouro 88', '2026-01-20', 'Ativo'),
('Mariana Rocha', 'mariana.r@edu.com', '2005-10-02', '934567890', 'Av. das Nações 71', '2026-01-21', 'Ativo'),
('Nicolas Gomes', 'nicolas.g@edu.com', '2003-01-29', '945678901', 'Rua da Fonte 14', '2026-01-22', 'Ativo'),
('Olivia Mendes', 'olivia.m@edu.com', '2004-02-14', '956789012', 'Rua Direita 50', '2026-01-23', 'Ativo'),
('Pedro Barbosa', 'pedro.b@edu.com', '2005-07-07', '967890123', 'Largo da Matriz 9', '2026-01-24', 'Ativo'),
('Beatriz Ramos', 'beatriz.r@edu.com', '2004-09-11', '978901234', 'Rua dos Artistas 43', '2026-01-25', 'Ativo'),
('Rodrigo Vieira', 'rodrigo.v@edu.com', '2003-05-23', '989012345', 'Av. Brasil 1500', '2026-01-26', 'Ativo'),
('Sofia Castro', 'sofia.c@edu.com', '2005-03-19', '990123456', 'Rua do Comércio 12', '2026-01-27', 'Ativo'),
('Thiago Melo', 'thiago.m@edu.com', '2004-10-31', '911223344', 'Rua da Aurora 77', '2026-01-28', 'Ativo'),
('Larissa Dias', 'larissa.d@edu.com', '2005-08-08', '922334455', 'Av. Marginal 10', '2026-01-29', 'Ativo'),
('Vitor Nunes', 'vitor.n@edu.com', '2003-12-15', '933445566', 'Rua de Cima 61', '2026-01-30', 'Ativo'),
('Camila Farias', 'camila.f@edu.com', '2004-04-04', '944556677', 'Rua de Baixo 32', '2026-01-31', 'Inativo'),
('William Cardoso', 'will.c@edu.com', '2005-01-01', '955667788', 'Travessa Linda 8', '2026-02-01', 'Ativo'),
('Leticia Teixeira', 'leticia.t@edu.com', '2004-06-20', '966778899', 'Rua das Oliveiras 4', '2026-02-02', 'Ativo'),
('Arthur Marques', 'arthur.m@edu.com', '2003-02-17', '977889900', 'Av. do Bosque 99', '2026-02-03', 'Ativo'),
('Barbara Machado', 'barbara.m@edu.com', '2005-05-05', '988990011', 'Rua do Teatro 21', '2026-02-04', 'Ativo'),
('Caio Medeiros', 'caio.m@edu.com', '2004-07-22', '999112233', 'Rua da Estação 15', '2026-02-05', 'Ativo'),
('Bruna Assis', 'bruna.a@edu.com', '2005-09-30', '911335577', 'Rua Formosa 55', '2026-02-06', 'Ativo'),
('Diego Moreira', 'diego.m@edu.com', '2003-11-12', '922446688', 'Av. das Palmeiras 3', '2026-02-07', 'Ativo'),
('Gabriela Fontes', 'gabriela.f@edu.com', '2004-03-14', '933557799', 'Rua da Colina 19', '2026-02-08', 'Ativo'),
('Eduarda Neves', 'eduarda.n@edu.com', '2005-12-25', '944668800', 'Rua da Paz 100', '2026-02-09', 'Ativo'),
('Felipe Diniz', 'felipe.d@edu.com', '2004-01-08', '955779911', 'Alameda Central 40', '2026-02-10', 'Ativo'),
('Giovanna Cunha', 'giovanna.c@edu.com', '2005-04-17', '966880022', 'Rua Bela 23', '2026-02-11', 'Ativo'),
('Heitor Aguiar', 'heitor.a@edu.com', '2003-10-24', '977991133', 'Rua do Porto 50', '2026-02-12', 'Ativo'),
('Isabela Pires', 'isabela.p@edu.com', '2004-06-03', '988002244', 'Av. Europa 80', '2026-02-13', 'Inativo'),
('Joao Rezende', 'joao.r@edu.com', '2005-07-19', '999113355', 'Rua Augusta 400', '2026-02-14', 'Ativo'),
('Karina Guimaraes', 'karina.g@edu.com', '2004-02-28', '911447700', 'Rua das Américas 12', '2026-02-15', 'Ativo'),
('Leonardo Borges', 'leonardo.b@edu.com', '2003-08-14', '922558811', 'Rua dos Limões 9', '2026-02-16', 'Ativo'),
('Manuela Leitão', 'manuela.l@edu.com', '2005-05-19', '933669922', 'Beco da Lapa 4', '2026-02-17', 'Ativo'),
('Mateus Prado', 'mateus.p@edu.com', '2004-11-02', '944770033', 'Av. Principal 250', '2026-02-18', 'Ativo'),
('Natalia Campos', 'natalia.c@edu.com', '2005-03-21', '955881144', 'Rua das Flores 99', '2026-02-19', 'Ativo'),
('Otavio Franco', 'otavio.f@edu.com', '2003-09-05', '966992255', 'Rua da Serra 14', '2026-02-20', 'Ativo'),
('Patricia Miranda', 'patricia.m@edu.com', '2004-12-12', '977003366', 'Av. das Indústrias 8', '2026-02-21', 'Ativo'),
('Rafael Viana', 'rafael.v@edu.com', '2005-06-30', '988114477', 'Rua do Bosque 15', '2026-02-22', 'Ativo'),
('Sabrina Antunes', 'sabrina.a@edu.com', '2004-01-22', '999225588', 'Travessa Nova 3', '2026-02-23', 'Ativo'),
('Samuel Moraes', 'samuel.m suicide@edu.com', '2003-07-15', '911559933', 'Rua da Ponte 74', '2026-02-24', 'Ativo'),
('Tatiane Guerra', 'tatiane.g@edu.com', '2005-10-10', '922660044', 'Largo do Rosário 11', '2026-02-25', 'Ativo'),
('Vinicius Paiva', 'vinicius.p@edu.com', '2004-04-18', '933771155', 'Rua da Grama 2', '2026-02-26', 'Ativo'),
('Yasmin Caldas', 'yasmin.c@edu.com', '2005-08-29', '944882266', 'Av. de Paris 30', '2026-02-27', 'Ativo'),
('Renan Malta', 'renan.m@edu.com', '2003-05-11', '955993377', 'Rua do Sol 190', '2026-02-28', 'Ativo');

INSERT INTO DISCIPLINAS (id_curso, nome, creditos, semestre, carga_horaria) VALUES
(1, 'Introdução à Programação', 6, 1, 60), (1, 'Álgebra Linear', 6, 1, 60), (1, 'Estruturas de Dados', 6, 2, 60),
(2, 'Teoria Geral da Administração', 5, 1, 45), (2, 'Contabilidade Básica', 5, 1, 45), (2, 'Comportamento Organizacional', 5, 2, 45),
(3, 'Anatomia Humana I', 8, 1, 90), (3, 'Biologia Celular', 6, 1, 60), (3, 'Fisiologia Médica I', 8, 3, 90),
(4, 'Introdução ao Estudo do Direito', 6, 1, 60), (4, 'Direito Romano', 4, 1, 40), (4, 'Direito Civil I', 6, 2, 60),
(5, 'História da Arquitetura I', 4, 1, 40), (5, 'Desenho Técnico', 6, 1, 60), (5, 'Projeto de Arquitetura I', 10, 2, 100),
(6, 'História da Psicologia', 5, 1, 45), (6, 'Psicologia do Desenvolvimento', 6, 2, 60), (7, 'Fundamentos de Enfermagem', 6, 1, 60),
(8, 'Legislação Trabalhista', 5, 2, 45), (9, 'Marketing de Conteúdo', 4, 1, 40), (10, 'Imunologia Básica', 6, 2, 60),
(11, 'Cinesioterapia', 6, 3, 60), (12, 'Anatomia Animal', 8, 1, 90), (13, 'Dietética', 5, 2, 45),
(14, 'Fisiologia do Exercício', 6, 2, 60), (15, 'Técnicas de Reportagem', 6, 2, 60), (16, 'História do Design', 4, 1, 40),
(17, 'Contabilidade Gerencial', 6, 3, 60), (18, 'Cálculo Técnico I', 6, 1, 60), (19, 'Termodinâmica', 6, 3, 60),
(20, 'Circuitos Elétricos I', 6, 3, 60), (21, 'Farmacobotânica', 5, 1, 45), (22, 'Anatomia Odontológica', 6, 1, 60),
(23, 'Fisiologia Vegetal', 6, 2, 60), (24, 'Higiene e Segurança Alimentar', 4, 1, 40), (25, 'Gestão de Cadeia de Suprimentos', 5, 2, 45),
(26, 'Lógica de Programação', 6, 1, 60), (27, 'Arquitetura de Redes', 6, 2, 60), (28, 'História Antiga', 5, 1, 45),
(29, 'Geografia Física I', 5, 1, 45), (30, 'Morfologia Portuguesa', 6, 2, 60), (31, 'Cálculo Diferencial I', 6, 1, 60),
(32, 'Mecânica Clássica', 6, 2, 60), (33, 'Química Geral', 6, 1, 60), (34, 'Genética Geral', 6, 3, 60),
(35, 'Teoria Sociológica I', 5, 1, 45), (36, 'Introdução à Filosofia', 5, 1, 45), (37, 'Geopolítica Internacional', 6, 2, 60),
(38, 'Economia Internacional', 5, 3, 45), (39, 'Mídias Sociais', 4, 2, 40), (40, 'História do Cinema', 4, 1, 40);

INSERT INTO TURMAS (id_curso, ano_letivo, periodo, sala, capacidade_maxima) VALUES
(1, '2026/2027', 'Manhã', 'Sala 101', 40), (1, '2026/2027', 'Noite', 'Sala 102', 40), (2, '2026/2027', 'Manhã', 'Sala 201', 35),
(2, '2026/2027', 'Noite', 'Sala 202', 35), (3, '2026/2027', 'Integral', 'Anfiteatro Med', 50), (4, '2026/2027', 'Noite', 'Sala 301', 45),
(5, '2026/2027', 'Manhã', 'Estúdio 1', 30), (6, '2026/2027', 'Tarde', 'Sala 105', 40), (7, '2026/2027', 'Manhã', 'Lab Enf', 30),
(8, '2026/2027', 'Noite', 'Sala 108', 35), (9, '2026/2027', 'Manhã', 'Sala 205', 40), (10, '2026/2027', 'Integral', 'Lab Bio', 25),
(11, '2026/2027', 'Tarde', 'Clínica 2', 30), (12, '2026/2027', 'Integral', 'Hospital Vet', 30), (13, '2026/2027', 'Manhã', 'Lab Nut', 30),
(14, '2026/2027', 'Tarde', 'Ginásio A', 40), (15, '2026/2027', 'Manhã', 'Estúdio Redação', 25), (16, '2026/2027', 'Tarde', 'Lab Mac', 25),
(17, '2026/2027', 'Noite', 'Sala 209', 45), (18, '2026/2027', 'Manhã', 'Sala C1', 40), (19, '2026/2027', 'Integral', 'Oficina Mec', 30),
(20, '2026/2027', 'Noite', 'Lab Eletro', 30), (21, '2026/2027', 'Integral', 'Lab Far', 30), (22, '2026/2027', 'Integral', 'Clínica Odo', 25),
(23, '2026/2027', 'Integral', 'Campo Exp', 35), (24, '2026/2027', 'Tarde', 'Cozinha Piloto', 20), (25, '2026/2027', 'Noite', 'Sala L3', 40),
(26, '2026/2027', 'Manhã', 'Sala Inf 1', 30), (27, '2026/2027', 'Noite', 'Sala Inf 2', 30), (28, '2026/2027', 'Manhã', 'Sala H1', 40),
(29, '2026/2027', 'Tarde', 'Lab Geo', 35), (30, '2026/2027', 'Noite', 'Sala Letras', 45), (31, '2026/2027', 'Manhã', 'Sala M2', 30),
(32, '2026/2027', 'Tarde', 'Lab Fis', 25), (33, '2026/2027', 'Integral', 'Lab Quim', 25), (34, '2026/2027', 'Integral', 'Lab Genet', 25),
(35, '2026/2027', 'Noite', 'Sala S4', 40), (36, '2026/2027', 'Noite', 'Sala F2', 40), (37, '2026/2027', 'Manhã', 'Sala RI', 35),
(38, '2026/2027', 'Noite', 'Sala CE', 35), (39, '2026/2027', 'Tarde', 'Sala PP', 30), (40, '2026/2027', 'Noite', 'Sala Projeção', 30),
(41, '2026/2027', 'Tarde', 'Auditório Teatro', 30), (42, '2026/2027', 'Manhã', 'Estúdio Som', 20), (43, '2026/2027', 'Tarde', 'Ateliê Artes', 25),
(44, '2026/2027', 'Manhã', 'Sala Ped', 40), (45, '2026/2027', 'Noite', 'Sala SS', 40), (46, '2026/2027', 'Tarde', 'Sala Tur', 35),
(47, '2026/2027', 'Noite', 'Sala Hot', 30), (48, '2026/2027', 'Manhã', 'Sala Sec', 35), (49, '2026/2027', 'Noite', 'Sala EP', 40),
(50, '2026/2027', 'Integral', 'Lab EQ', 25);

INSERT INTO MATRICULAS (id_aluno, id_curso, id_turma, data_matricula, status, observacoes_matricula) VALUES
(1, 1, 1, '2026-02-01', 'Confirmada', 'Sem observações'), (2, 1, 2, '2026-02-01', 'Confirmada', 'Trabalhador-Estudante'), (3, 2, 3, '2026-02-02', 'Cancelada', 'Mudança de instituição'),
(4, 2, 4, '2026-02-02', 'Confirmada', 'Sem observações'), (5, 3, 5, '2026-02-03', 'Confirmada', 'Bolsista'), (6, 4, 6, '2026-02-03', 'Confirmada', 'Sem observações'),
(7, 5, 7, '2026-02-04', 'Confirmada', 'Frequência regular'), (8, 6, 8, '2026-02-04', 'Confirmada', 'Sem observações'), (9, 7, 9, '2026-02-05', 'Suspensa', 'Documentos em falta'),
(10, 8, 10, '2026-02-05', 'Confirmada', 'Sem observações'), (11, 9, 11, '2026-02-06', 'Confirmada', 'Sem observações'), (12, 10, 12, '2026-02-06', 'Confirmada', 'Sem observações'),
(13, 11, 13, '2026-02-07', 'Confirmada', 'Sem observações'), (14, 12, 14, '2026-02-07', 'Confirmada', 'Necessita apoio específico'), (15, 13, 15, '2026-02-08', 'Confirmada', 'Sem observações'),
(16, 14, 16, '2026-02-08', 'Confirmada', 'Atleta de alta competição'), (17, 15, 17, '2026-02-09', 'Confirmada', 'Sem observações'), (18, 16, 18, '2026-02-09', 'Confirmada', 'Sem observações'),
(19, 17, 19, '2026-02-10', 'Confirmada', 'Sem observações'), (20, 18, 20, '2026-02-10', 'Confirmada', 'Sem observações'), (21, 19, 21, '2026-02-11', 'Confirmada', 'Sem observações'),
(22, 20, 22, '2026-02-11', 'Cancelada', 'Desistência voluntária'), (23, 21, 23, '2026-02-12', 'Confirmada', 'Sem observações'), (24, 22, 24, '2026-02-12', 'Confirmada', 'Sem observações'),
(25, 23, 25, '2026-02-13', 'Confirmada', 'Sem observações'), (26, 24, 26, '2026-02-13', 'Confirmada', 'Sem observações'), (27, 25, 27, '2026-02-14', 'Confirmada', 'Sem observações'),
(28, 26, 28, '2026-02-14', 'Confirmada', 'Sem observações'), (29, 27, 29, '2026-02-15', 'Confirmada', 'Sem observações'), (30, 28, 30, '2026-02-15', 'Confirmada', 'Sem observações'),
(31, 29, 31, '2026-02-16', 'Confirmada', 'Sem observações'), (32, 30, 32, '2026-02-16', 'Confirmada', 'Sem observações'), (33, 31, 33, '2026-02-17', 'Confirmada', 'Sem observações'),
(34, 32, 34, '2026-02-17', 'Confirmada', 'Sem observações'), (35, 33, 35, '2026-02-18', 'Suspensa', 'Falta de pagamento propina'), (36, 34, 36, '2026-02-18', 'Confirmada', 'Sem observações'),
(37, 35, 37, '2026-02-19', 'Confirmada', 'Sem observações'), (38, 36, 38, '2026-02-19', 'Confirmada', 'Sem observações'), (39, 37, 39, '2026-02-20', 'Confirmada', 'Sem observações'),
(40, 38, 40, '2026-02-20', 'Confirmada', 'Sem observações'), (41, 39, 41, '2026-02-21', 'Confirmada', 'Sem observações'), (42, 40, 42, '2026-02-21', 'Confirmada', 'Sem observações'),
(43, 41, 43, '2026-02-22', 'Confirmada', 'Sem observações'), (44, 42, 44, '2026-02-22', 'Confirmada', 'Sem observações'), (45, 43, 45, '2026-02-23', 'Confirmada', 'Sem observações'),
(46, 44, 46, '2026-02-23', 'Confirmada', 'Sem observações'), (47, 45, 47, '2026-02-24', 'Confirmada', 'Sem observações'), (48, 46, 48, '2026-02-24', 'Confirmada', 'Sem observações'),
(49, 47, 49, '2026-02-25', 'Confirmada', 'Sem observações'), (50, 48, 50, '2026-02-25', 'Confirmada', 'Sem observações');

INSERT INTO FALTAS (id_aluno, id_disciplina, data_falta, justificativa, observacao, periodo_falta) VALUES
(1, 1, '2026-03-02', 1, 'Apresentou atestado médico', 'Manhã'), (2, 1, '2026-03-02', 0, 'Sem justificação', 'Noite'), (4, 4, '2026-03-03', 0, 'Faltou ao teste', 'Noite'),
(5, 7, '2026-03-04', 1, 'Declaração de trabalho', 'Manhã'), (6, 10, '2026-03-05', 0, 'Sem comunicação', 'Noite'), (7, 13, '2026-03-06', 1, 'Consulta médica', 'Manhã'),
(8, 16, '2026-03-09', 0, 'Não compareceu', 'Tarde'), (10, 19, '2026-03-10', 0, 'Falta injustificada', 'Noite'), (11, 20, '2026-03-11', 1, 'Problema de transporte', 'Manhã'),
(12, 21, '2026-03-12', 0, 'Sem aviso', 'Tarde'), (13, 22, '2026-03-13', 0, 'Falta regular', 'Tarde'), (14, 23, '2026-03-16', 1, 'Representação institucional', 'Manhã'),
(15, 24, '2026-03-17', 0, 'Nenhuma justificação', 'Manhã'), (16, 25, '2026-03-18', 1, 'Competição desportiva', 'Tarde'), (17, 26, '2026-03-19', 0, 'Injustificada', 'Manhã'),
(18, 27, '2026-03-20', 0, 'Injustificada', 'Tarde'), (19, 28, '2026-03-23', 0, 'Atraso longo', 'Noite'), (20, 29, '2026-03-24', 1, 'Doença súbita', 'Manhã'),
(21, 30, '2026-03-25', 0, 'Falta', 'Noite'), (23, 31, '2026-03-26', 0, 'Falta injustificada', 'Manhã'), (24, 32, '2026-03-27', 1, 'Atestado médico', 'Tarde'),
(25, 33, '2026-03-30', 0, 'Sem contacto', 'Manhã'), (26, 34, '2026-03-31', 0, 'Injustificada', 'Manhã'), (27, 35, '2026-04-01', 0, 'Falta', 'Noite'),
(28, 36, '2026-04-02', 1, 'Falecimento familiar', 'Manhã'), (29, 37, '2026-04-03', 0, 'Injustificada', 'Tarde'), (30, 38, '2026-04-06', 0, 'Sem justificação', 'Manhã'),
(31, 39, '2026-04-07', 1, 'Problema pessoal urgente', 'Manhã'), (32, 40, '2026-04-08', 0, 'Falta injustificada', 'Tarde'), (33, 1, '2026-04-09', 0, 'Injustificada', 'Manhã'),
(34, 2, '2026-04-10', 0, 'Falta comum', 'Tarde'), (36, 3, '2026-04-13', 1, 'Consulta odontológica', 'Manhã'), (37, 4, '2026-04-14', 0, 'Não compareceu', 'Manhã'),
(38, 5, '2026-04-15', 0, 'Injustificada', 'Noite'), (39, 6, '2026-04-16', 0, 'Sem aviso', 'Manhã'), (40, 7, '2026-04-17', 1, 'Atestado legal', 'Manhã'),
(41, 8, '2026-04-20', 0, 'Falta', 'Tarde'), (42, 9, '2026-04-21', 0, 'Injustificada', 'Manhã'), (43, 10, '2026-04-22', 0, 'Sem justificação', 'Manhã'),
(44, 11, '2026-04-23', 1, 'Atestado de isolamento', 'Manhã'), (45, 12, '2026-04-24', 0, 'Não justificado', 'Manhã'), (46, 13, '2026-04-27', 0, 'Falta regular', 'Tarde'),
(47, 14, '2026-04-28', 1, 'Doença comprovada', 'Manhã'), (48, 15, '2026-04-29', 0, 'Falta injustificada', 'Manhã'), (49, 16, '2026-04-30', 0, 'Sem justificação', 'Tarde'),
(50, 17, '2026-05-04', 0, 'Não compareceu', 'Noite'), (1, 2, '2026-05-05', 0, 'Injustificada', 'Manhã'), (2, 3, '2026-05-06', 1, 'Atestado', 'Noite'),
(4, 5, '2026-05-07', 0, 'Falta involuntária', 'Noite'), (5, 8, '2026-05-08', 0, 'Sem motivo informado', 'Manhã');

INSERT INTO PROPINAS (id_aluno, competencia, valor, data_vencimento, data_pagamento, estado, metodo_pagamento) VALUES
(1, 'Março 2026', 150.00, '2026-03-10', '2026-03-08', 'Pago', 'Referência Bancária'), (2, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (3, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL),
(4, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Multibanco'), (5, 'Março 2026', 150.00, '2026-03-10', '2026-03-05', 'Pago', 'Transferência'), (6, 'Março 2026', 150.00, '2026-03-10', '2026-03-11', 'Pago com Atraso', 'Multibanco'),
(7, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Referência Bancária'), (8, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (9, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL),
(10, 'Março 2026', 150.00, '2026-03-10', '2026-03-07', 'Pago', 'Multibanco'), (11, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Transferência'), (12, 'Março 2026', 150.00, '2026-03-10', '2026-03-08', 'Pago', 'Referência Bancária'),
(13, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Multibanco'), (14, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (15, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL),
(16, 'Março 2026', 150.00, '2026-03-10', '2026-03-04', 'Pago', 'Transferência'), (17, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Multibanco'), (18, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Referência Bancária'),
(19, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (20, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL), (21, 'Março 2026', 150.00, '2026-03-10', '2026-03-06', 'Pago', 'Multibanco'),
(22, 'Março 2026', 150.00, '2026-03-10', '2026-03-05', 'Pago', 'Transferência'), (23, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Referência Bancária'), (24, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Multibanco'),
(25, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL), (26, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (27, 'Março 2026', 150.00, '2026-03-10', '2026-03-12', 'Pago com Atraso', 'Multibanco'),
(28, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Transferência'), (29, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Referência Bancária'), (30, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL),
(31, 'Março 2026', 150.00, '2026-03-10', '2026-03-08', 'Pago', 'Multibanco'), (32, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Transferência'), (33, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Referência Bancária'),
(34, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (35, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL), (36, 'Março 2026', 150.00, '2026-03-10', '2026-03-07', 'Pago', 'Multibanco'),
(37, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Transferência'), (38, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Referência Bancária'), (39, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'),
(40, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL), (41, 'Março 2026', 150.00, '2026-03-10', '2026-03-06', 'Pago', 'Multibanco'), (42, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Transferência'),
(43, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Referência Bancária'), (44, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (45, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL),
(46, 'Março 2026', 150.00, '2026-03-10', '2026-03-05', 'Pago', 'Multibanco'), (47, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Transferência'), (48, 'Março 2026', 150.00, '2026-03-10', '2026-03-09', 'Pago', 'Referência Bancária'),
(49, 'Março 2026', 150.00, '2026-03-10', '2026-03-10', 'Pago', 'Cartão de Crédito'), (50, 'Março 2026', 150.00, '2026-03-10', NULL, 'Dívida', NULL);

INSERT INTO PAUTAS_NOTAS (id_aluno, id_disciplina, nota, tipo_avaliacao, data_registo, observacao_nota, nome_professor) VALUES
(1, 1, 15.50, 'Exame Final', '2026-06-15 14:00:00', 'Aprovado', 'Dr. António Carvalho'),
(2, 1, 18.20, 'Exame Final', '2026-06-15 14:05:00', 'Excelente desempenho', 'Dr. António Carvalho'),
(3, 4, 10.00, 'Avaliação Contínua', '2026-06-15 14:10:00', 'Aprovado no limite', 'Dra. Maria Antunes'),
(4, 4, 14.00, 'Avaliação Contínua', '2026-06-15 14:15:00', 'Bom aproveitamento', 'Dra. Maria Antunes'),
(5, 7, 16.80, 'Trabalho Prático', '2026-06-15 14:20:00', 'Muito bom', 'Dr. Carlos Pires'),
(6, 10, 11.50, 'Exame Final', '2026-06-15 14:25:00', 'Suficiente', 'Dra. Joana Silva'),
(7, 13, 13.00, 'Avaliação Contínua', '2026-06-15 14:30:00', 'Regular', 'Dr. Jorge Mendes'),
(8, 16, 17.00, 'Projeto', '2026-06-15 14:35:00', 'Destacado', 'Dra. Francisca Ramos'),
(9, 19, 08.50, 'Exame Final', '2026-06-15 14:40:00', 'Reprovado', 'Dr. Manuel Costa'),
(10, 20, 12.00, 'Exame Final', '2026-06-15 14:45:00', 'Aprovado', 'Dr. Rui Barbosa'),
(11, 21, 14.50, 'Avaliação Contínua', '2026-06-15 14:50:00', 'Bom percurso', 'Dra. Alice Fonseca'),
(12, 22, 19.00, 'Exame Final', '2026-06-15 14:55:00', 'Excelente', 'Dr. Alberto Nobre'),
(13, 23, 10.50, 'Exame Final', '2026-06-15 15:00:00', 'Suficiente', 'Dra. Patrícia Reis'),
(14, 24, 15.00, 'Trabalho Prático', '2026-06-15 15:05:00', 'Bom trabalho', 'Dr. Ricardo Santos'),
(15, 25, 07.00, 'Exame Final', '2026-06-15 15:10:00', 'Reprovado', 'Dra. Cristina Lima'),
(16, 26, 16.00, 'Projeto', '2026-06-15 15:15:00', 'Aprovado com mérito', 'Dr. Miguel Sousa'),
(17, 27, 13.50, 'Exame Final', '2026-06-15 15:20:00', 'Regular', 'Dr. Henrique Neto'),
(18, 28, 11.00, 'Avaliação Contínua', '2026-06-15 15:25:00', 'Suficiente', 'Dra. Cláudia Rocha'),
(19, 29, 12.50, 'Exame Final', '2026-06-15 15:30:00', 'Regular', 'Dr. Fernando Viana'),
(20, 30, 09.00, 'Exame Final', '2026-06-15 15:35:00', 'Reprovado em recurso', 'Dra. Sónia Martins'),
(21, 31, 14.00, 'Avaliação Contínua', '2026-06-15 15:40:00', 'Aprovado', 'Dr. Gabriel Castro'),
(22, 32, 15.20, 'Exame Final', '2026-06-15 15:45:00', 'Bom desempenho', 'Dr. Paulo Alves'),
(23, 33, 10.00, 'Exame Final', '2026-06-15 15:50:00', 'Aprovado no limite', 'Dra. Helena Guerra'),
(24, 34, 17.50, 'Projeto', '2026-06-15 15:55:00', 'Excelente criatividade', 'Dr. Daniel Freitas'),
(25, 35, 11.00, 'Exame Final', '2026-06-15 16:00:00', 'Suficiente', 'Dra. Sofia Nunes'),
(26, 36, 13.00, 'Avaliação Contínua', '2026-06-15 16:05:00', 'Regular', 'Dr. Artur Correia'),
(27, 37, 16.00, 'Exame Final', '2026-06-15 16:10:00', 'Muito bom', 'Dr. Victor Marques'),
(28, 38, 08.00, 'Exame Final', '2026-06-15 16:15:00', 'Reprovado', 'Dra. Laura Diniz'),
(29, 39, 14.80, 'Avaliação Contínua', '2026-06-15 16:20:00', 'Bom progresso', 'Dr. Nelson Ramos'),
(30, 40, 12.00, 'Projeto', '2026-06-15 16:25:00', 'Regular', 'Dra. Rosa Caldas'),
(31, 1, 15.00, 'Exame Final', '2026-06-15 16:30:00', 'Aprovado', 'Dr. António Carvalho'),
(32, 2, 16.50, 'Exame Final', '2026-06-15 16:35:00', 'Muito bom', 'Dr. Alfredo Teixeira'),
(33, 3, 11.00, 'Avaliação Contínua', '2026-06-15 16:40:00', 'Suficiente', 'Dra. Luísa Faria'),
(34, 4, 13.50, 'Exame Final', '2026-06-15 16:45:00', 'Regular', 'Dra. Maria Antunes'),
(35, 5, 09.50, 'Exame Final', '2026-06-15 16:50:00', 'Reprovado por décimas', 'Dr. Júlio César'),
(36, 6, 14.00, 'Avaliação Contínua', '2026-06-15 16:55:00', 'Aprovado', 'Dra. Diana Melo'),
(37, 7, 17.00, 'Trabalho Prático', '2026-06-15 17:00:00', 'Destacado', 'Dr. Carlos Pires'),
(38, 8, 12.00, 'Exame Final', '2026-06-15 17:05:00', 'Regular', 'Dr. Samuel Pereira'),
(39, 9, 10.00, 'Exame Final', '2026-06-15 17:12:00', 'Aprovado', 'Dr. Manuel Costa'),
(40, 10, 15.50, 'Exame Final', '2026-06-15 17:18:00', 'Bom desempenho', 'Dra. Joana Silva'),
(41, 11, 13.00, 'Avaliação Contínua', '2026-06-15 17:25:00', 'Regular', 'Dr. Álvaro Moniz'),
(42, 12, 16.00, 'Exame Final', '2026-06-15 17:30:00', 'Muito bom', 'Dr. Alberto Nobre'),
(43, 13, 08.00, 'Exame Final', '2026-06-15 17:35:00', 'Reprovado', 'Dr. Jorge Mendes'),
(44, 14, 14.50, 'Trabalho Prático', '2026-06-15 17:40:00', 'Aprovado', 'Dr. Ricardo Santos'),
(45, 15, 11.00, 'Exame Final', '2026-06-15 17:45:00', 'Suficiente', 'Dra. Cristina Lima'),
(46, 16, 18.00, 'Projeto', '2026-06-15 17:50:00', 'Excelente trabalho', 'Dra. Francisca Ramos'),
(47, 17, 12.50, 'Exame Final', '2026-06-15 17:55:00', 'Regular', 'Dr. Eduardo Malta'),
(48, 18, 10.00, 'Avaliação Contínua', '2026-06-15 18:00:00', 'Aprovado no limite', 'Dr. Pedro Viana'),
(49, 19, 15.00, 'Exame Final', '2026-06-15 18:05:00', 'Bom aproveitamento', 'Dr. Manuel Costa'),
(50, 20, 13.80, 'Exame Final', '2026-06-15 18:10:00', 'Regular', 'Dr. Rui Barbosa');