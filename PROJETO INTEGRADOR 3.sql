CREATE DATABASE  TuneStream;
USE TuneStream;

CREATE TABLE CADASTRO (
    IDCadastro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    CPF VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE USUARIOS (
    IDUSUARIO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeUsuario VARCHAR(150) NOT NULL,
    IDCadastro INT NOT NULL,
    FOREIGN KEY (IDCadastro) REFERENCES CADASTRO(IDCadastro) ON DELETE CASCADE
);

CREATE TABLE PREMIUM (
    IDPremium INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeUsuario VARCHAR(150) NOT NULL,
    IDUSUARIO INT NOT NULL,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO) ON DELETE CASCADE
);

CREATE TABLE ARTISTAS (
    IDARTISTA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeArtista VARCHAR(255) NOT NULL,
    Musica DECIMAL(10,2),
    IDCadastro INT NOT NULL,
    FOREIGN KEY (IDCadastro) REFERENCES CADASTRO(IDCadastro) ON DELETE CASCADE
);

CREATE TABLE MUSICAS (
    IDMusica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MNOME VARCHAR(255) NOT NULL,
    GeneroM VARCHAR(100),
    idSupplier INT,
    idCategory INT
);

CREATE TABLE ALBUNS (
    IDAlbum INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeAlbum VARCHAR(255) NOT NULL,
    MusicQTD INT DEFAULT 0,
    IDMusica INT NOT NULL,
    IDArtista INT NOT NULL,
    FOREIGN KEY (IDMusica) REFERENCES MUSICAS(IDMusica) ON DELETE CASCADE,
    FOREIGN KEY (IDArtista) REFERENCES ARTISTAS(IDARTISTA) ON DELETE CASCADE
);

CREATE TABLE PLAYLIST (
    IDPlaylist INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NameP VARCHAR(150) NOT NULL,
    IDUSUARIO INT NOT NULL,
    IDMusica INT NOT NULL,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO) ON DELETE CASCADE,
    FOREIGN KEY (IDMusica) REFERENCES MUSICAS(IDMusica) ON DELETE CASCADE
);

CREATE TABLE HisReprod (
    IDHisReprod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MusicaRep VARCHAR(255),
    PlayListRep VARCHAR(255),
    IDMusica INT NOT NULL,
    IDUSUARIO INT NOT NULL,
    NomeUsuario VARCHAR(150),
    FOREIGN KEY (IDMusica) REFERENCES MUSICAS(IDMusica) ON DELETE CASCADE,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO) ON DELETE CASCADE
);

ALTER TABLE CADASTRO 
ADD DataCadastro DATE NULL;

ALTER TABLE USUARIOS 
ADD StatusUsuario VARCHAR(20) DEFAULT 'Ativo';

ALTER TABLE PREMIUM 
ADD DataExpiracao DATE NULL;

ALTER TABLE ARTISTAS 
ADD GeneroPrincipal VARCHAR(100) NULL;

ALTER TABLE MUSICAS 
ADD Duracao INT NULL;

ALTER TABLE ALBUNS 
ADD AnoLancamento INT NULL;

ALTER TABLE ALBUNS 
ADD NomeArtista VARCHAR(255) NOT NULL;

ALTER TABLE PLAYLIST 
ADD DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE HisReprod 
ADD DataReproducao DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE CADASTRO 
ADD DataCadastro DATE NULL;

ALTER TABLE USUARIOS 
ADD StatusUsuario VARCHAR(20) DEFAULT 'Ativo';

ALTER TABLE PREMIUM 
ADD DataExpiracao DATE NULL;

ALTER TABLE ARTISTAS 
ADD GeneroPrincipal VARCHAR(100) NULL;

ALTER TABLE MUSICAS 
ADD Duracao INT NULL;

ALTER TABLE ALBUNS 
ADD AnoLancamento INT NULL;

ALTER TABLE ALBUNS 
ADD NomeArtista VARCHAR(255) NOT NULL;

ALTER TABLE PLAYLIST 
ADD DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP;

INSERT INTO CADASTRO (Nome, Email, Telefone, CPF, DataCadastro) VALUES
('Ana Silva', 'ana.silva@email.com', '11999991111', '12345678901', '2026-01-01'),
('Bruno Santos', 'bruno.santos@email.com', '11999991112', '12345678902', '2026-01-02'),
('Carlos Oliveira', 'carlos.oliveira@email.com', '11999991113', '12345678903', '2026-01-03'),
('Daniela Souza', 'daniela.souza@email.com', '11999991114', '12345678904', '2026-01-04'),
('Eduardo Lima', 'eduardo.lima@email.com', '11999991115', '12345678905', '2026-01-05'),
('Fernanda Costa', 'fernanda.costa@email.com', '11999991116', '12345678906', '2026-01-06'),
('Gabriel Almeida', 'gabriel.almeida@email.com', '11999991117', '12345678907', '2026-01-07'),
('Amanda Martins', 'amanda.martins@email.com', '11999991118', '12345678908', '2026-01-08'),
('Igor Ribeiro', 'igor.ribeiro@email.com', '11999991119', '12345678909', '2026-01-09'),
('Juliana Carvalho', 'juliana.carvalho@email.com', '11999991120', '12345678910', '2026-01-10'),
('Lucas Pereira', 'lucas.pereira@email.com', '11999991121', '12345678911', '2026-01-11'),
('Mariana Rocha', 'mariana.rocha@email.com', '11999991122', '12345678912', '2026-01-12'),
('Nicolas Gomes', 'nicolas.gomes@email.com', '11999991123', '12345678913', '2026-01-13'),
('Olivia Mendes', 'olivia.mendes@email.com', '11999991124', '12345678914', '2026-01-14'),
('Pedro Barbosa', 'pedro.barbosa@email.com', '11999991125', '12345678915', '2026-01-15'),
('Beatriz Ramos', 'beatriz.ramos@email.com', '11999991126', '12345678916', '2026-01-16'),
('Rodrigo Vieira', 'rodrigo.vieira@email.com', '11999991127', '12345678917', '2026-01-17'),
('Sofia Castro', 'sofia.castro@email.com', '11999991128', '12345678918', '2026-01-18'),
('Thiago Melo', 'thiago.melo@email.com', '11999991129', '12345678919', '2026-01-19'),
('Larissa Dias', 'larissa.dias@email.com', '11999991130', '12345678920', '2026-01-20'),
('Vitor Nunes', 'vitor.nunes@email.com', '11999991131', '12345678921', '2026-01-21'),
('Camila Farias', 'camila.farias@email.com', '11999991132', '12345678922', '2026-01-22'),
('William Cardoso', 'william.cardoso@email.com', '11999991133', '12345678923', '2026-01-23'),
('Leticia Teixeira', 'leticia.teixeira@email.com', '11999991134', '12345678924', '2026-01-24'),
('Arthur Marques', 'arthur.marques@email.com', '11999991135', '12345678925', '2026-01-25'),
('Barbara Machado', 'barbara.machado@email.com', '11999991136', '12345678926', '2026-01-26'),
('Caio Medeiros', 'caio.medeiros@email.com', '11999991137', '12345678927', '2026-01-27'),
('Bruna Assis', 'bruna.assis@email.com', '11999991138', '12345678928', '2026-01-28'),
('Diego Moreira', 'diego.moreira@email.com', '11999991139', '12345678929', '2026-01-29'),
('Gabriela Fontes', 'gabriela.fontes@email.com', '11999991140', '12345678930', '2026-01-30'),
('Eduarda Neves', 'eduarda.neves@email.com', '11999991141', '12345678931', '2026-02-01'),
('Felipe Diniz', 'felipe.diniz@email.com', '11999991142', '12345678932', '2026-02-02'),
('Giovanna Cunha', 'giovanna.cunha@email.com', '11999991143', '12345678933', '2026-02-03'),
('Heitor Aguiar', 'heitor.aguiar@email.com', '11999991144', '12345678934', '2026-02-04'),
('Isabela Pires', 'isabela.pires@email.com', '11999991145', '12345678935', '2026-02-05'),
('Joao Rezende', 'joao.rezende@email.com', '11999991146', '12345678936', '2026-02-06'),
('Karina Guimaraes', 'karina.guimaraes@email.com', '11999991147', '12345678937', '2026-02-07'),
('Leonardo Borges', 'leonardo.borges@email.com', '11999991148', '12345678938', '2026-02-08'),
('Manuela Leitão', 'manuela.leitao@email.com', '11999991149', '12345678939', '2026-02-09'),
('Mateus Prado', 'mateus.prado@email.com', '11999991150', '12345678940', '2026-02-10'),
('Natalia Campos', 'natalia.campos@email.com', '11999991151', '12345678941', '2026-02-11'),
('Otavio Franco', 'otavio.franco@email.com', '11999991152', '12345678942', '2026-02-12'),
('Patricia Miranda', 'patricia.miranda@email.com', '11999991153', '12345678943', '2026-02-13'),
('Rafael Viana', 'rafael.viana@email.com', '11999991154', '12345678944', '2026-02-14'),
('Sabrina Antunes', 'sabrina.antunes@email.com', '11999991155', '12345678945', '2026-02-15'),
('Samuel Moraes', 'samuel.moraes@email.com', '11999991156', '12345678946', '2026-02-16'),
('Tatiane Guerra', 'tatiane.guerra@email.com', '11999991157', '12345678947', '2026-02-17'),
('Vinicius Paiva', 'vinicius.paiva@email.com', '11999991158', '12345678948', '2026-02-18'),
('Yasmin Caldas', 'yasmin.caldas@email.com', '11999991159', '12345678949', '2026-02-19'),
('Renan Malta', 'renan.malta@email.com', '11999991160', '12345678950', '2026-02-20');

INSERT INTO USUARIOS (NomeUsuario, IDCadastro, StatusUsuario) VALUES
('anasilva', 1, 'Ativo'), ('brunosantos', 2, 'Ativo'), ('carlosoli', 3, 'Inativo'),
('danisouza', 4, 'Ativo'), ('edulima', 5, 'Ativo'), ('fercosta', 6, 'Ativo'),
('gabalmeida', 7, 'Ativo'), ('amandamartins', 8, 'Ativo'), ('igorrib', 9, 'Inativo'),
('jucarvalho', 10, 'Ativo'), ('lucaspereira', 11, 'Ativo'), ('marirocha', 12, 'Ativo'),
('nicgomes', 13, 'Ativo'), ('oliviamendes', 14, 'Ativo'), ('pedrobarbosa', 15, 'Ativo'),
('biaramos', 16, 'Ativo'), ('rodrigovieira', 17, 'Ativo'), ('sofiacastro', 18, 'Ativo'),
('thiagomelo', 19, 'Ativo'), ('laridias', 20, 'Ativo'), ('vitornunes', 21, 'Ativo'),
('camilafarias', 22, 'Inativo'), ('willcardoso', 23, 'Ativo'), ('leticiateix', 24, 'Ativo'),
('arthurmarques', 25, 'Ativo'), ('barbaramach', 26, 'Ativo'), ('caiomedeiros', 27, 'Ativo'),
('brunaassis', 28, 'Ativo'), ('diegomoreira', 29, 'Ativo'), ('gabifontes', 30, 'Ativo'),
('eduneves', 31, 'Ativo'), ('felipediniz', 32, 'Ativo'), ('giovannacunha', 33, 'Ativo'),
('heitoraguiar', 34, 'Ativo'), ('isabelapires', 35, 'Inativo'), ('joaorezende', 36, 'Ativo'),
('karinaguimaraes', 37, 'Ativo'), ('leoborges', 38, 'Ativo'), ('manuelaleitao', 39, 'Ativo'),
('mateusprado', 40, 'Ativo'), ('natcampos', 41, 'Ativo'), ('otaviofranco', 42, 'Ativo'),
('patriciamiranda', 43, 'Ativo'), ('rafaelviana', 44, 'Ativo'), ('sabrinaantunes', 45, 'Ativo'),
('samuelmoraes', 46, 'Ativo'), ('tatiguerra', 47, 'Ativo'), ('viniciuspaiva', 48, 'Ativo'),
('yasmincaldas', 49, 'Ativo'), ('renanmalta', 50, 'Ativo');

INSERT INTO PREMIUM (NomeUsuario, IDUSUARIO, DataExpiracao) VALUES
('anasilva', 1, '2026-12-31'), ('brunosantos', 2, '2026-12-31'), ('carlosoli', 3, '2026-11-30'),
('danisouza', 4, '2026-12-31'), ('edulima', 5, '2027-01-15'), ('fercosta', 6, '2026-10-22'),
('gabalmeida', 7, '2026-08-14'), ('amandamartins', 8, '2027-03-01'), ('igorrib', 9, '2026-09-09'),
('jucarvalho', 10, '2026-12-25'), ('lucaspereira', 11, '2026-12-31'), ('marirocha', 12, '2027-02-28'),
('nicgomes', 13, '2026-07-19'), ('oliviamendes', 14, '2026-11-11'), ('pedrobarbosa', 15, '2026-12-05'),
('biaramos', 16, '2026-12-31'), ('rodrigovieira', 17, '2027-05-20'), ('sofiacastro', 18, '2026-12-31'),
('thiagomelo', 19, '2026-06-18'), ('laridias', 20, '2027-04-12'), ('vitornunes', 21, '2026-12-01'),
('camilafarias', 22, '2026-08-30'), ('willcardoso', 23, '2026-12-31'), ('leticiateix', 24, '2026-10-10'),
('arthurmarques', 25, '2027-01-01'), ('barbaramach', 26, '2026-11-20'), ('caiomedeiros', 27, '2026-12-31'),
('brunaassis', 28, '2026-09-15'), ('diegomoreira', 29, '2026-12-31'), ('gabifontes', 30, '2027-02-10'),
('eduneves', 31, '2026-12-31'), ('felipediniz', 32, '2026-07-07'), ('giovannacunha', 33, '2026-12-31'),
('heitoraguiar', 34, '2026-11-05'), ('isabelapires', 35, '2026-12-15'), ('joaorezende', 36, '2027-06-01'),
('karinaguimaraes', 37, '2026-12-31'), ('leoborges', 38, '2026-10-05'), ('manuelaleitao', 39, '2026-12-31'),
('mateusprado', 40, '2027-01-20'), ('natcampos', 41, '2026-12-31'), ('otaviofranco', 42, '2026-09-22'),
('patriciamiranda', 43, '2026-12-31'), ('rafaelviana', 44, '2026-08-18'), ('sabrinaantunes', 45, '2027-03-15'),
('samuelmoraes', 46, '2026-12-31'), ('tatiguerra', 47, '2026-11-12'), ('viniciuspaiva', 48, '2026-12-31'),
('yasmincaldas', 49, '2026-10-30'), ('renanmalta', 50, '2027-02-02');

INSERT INTO ARTISTAS (NomeArtista, Musica, IDCadastro, GeneroPrincipal) VALUES
('The Beats', 10.50, 1, 'Rock'), ('MC Ritmo', 15.20, 2, 'Funk'), ('Aline Vox', 8.00, 3, 'Pop'),
('Dupla Sertaneja', 22.10, 4, 'Sertanejo'), ('Jazz Band', 5.40, 5, 'Jazz'), ('DJ Sunset', 45.00, 6, 'Eletrônica'),
('Samba de Roda', 30.00, 7, 'Samba'), ('Rapper Clan', 18.25, 8, 'Rap'), ('Classic Orchestra', 3.00, 9, 'Clássica'),
('Reggae Vibes', 14.10, 10, 'Reggae'), ('Indie Sound', 11.40, 11, 'Indie'), ('Blues Masters', 9.20, 12, 'Blues'),
('Heavy Metal Club', 13.60, 13, 'Heavy Metal'), ('Forró Bom', 25.80, 14, 'Forró'), ('MPB Trio', 19.30, 15, 'MPB'),
('Pop Star', 50.00, 16, 'Pop'), ('Gospel Choir', 40.00, 17, 'Gospel'), ('Axé Bahia', 21.90, 18, 'Axé'),
('Pagode Chic', 28.40, 19, 'Pagode'), ('Chill Out Crew', 16.00, 20, 'Lo-Fi'), ('Trap Nation', 33.10, 21, 'Trap'),
('Soul Diva', 12.50, 22, 'Soul'), ('Country Road', 17.40, 23, 'Country'), ('Punk Rebellion', 14.20, 24, 'Punk'),
('Bossa Nova Duo', 8.90, 25, 'Bossa Nova'), ('Electronic Waves', 29.00, 26, 'Techno'), ('Salsa Kings', 11.10, 27, 'Salsa'),
('Tango Real', 6.50, 28, 'Tango'), ('Folk Acoustic', 15.00, 29, 'Folk'), ('Dance Hits', 35.60, 30, 'Dance'),
('Groove Machine', 18.00, 31, 'Funk Groove'), ('Acoustic Sessions', 20.00, 32, 'Acústico'), ('Hard Rockers', 12.40, 33, 'Hard Rock'),
('Metal Core', 10.00, 34, 'Metalcore'), ('Synthwave Co.', 24.50, 35, 'Synthwave'), ('Hip Hop Crew', 31.20, 36, 'Hip Hop'),
('Velha Guarda', 16.70, 37, 'Samba'), ('Nova Geração', 22.00, 38, 'Pop Regional'), ('Modão Raiz', 14.90, 39, 'Sertanejo Raiz'),
('Electro Swing', 9.80, 40, 'Electro Swing'), ('Psytrance DJ', 13.15, 41, 'Psytrance'), ('Piano Solo', 5.00, 42, 'Instrumental'),
('Cyberpunk Sounds', 44.00, 43, 'Industrial'), ('Reggaeton Star', 38.00, 44, 'Reggaeton'), ('K-Pop Group', 60.00, 45, 'K-Pop'),
('J-Rock Band', 12.00, 46, 'J-Rock'), ('Alternative Project', 19.00, 47, 'Alternativo'), ('Sertanejo Universitário', 33.40, 48, 'Sertanejo'),
('Samba Enredo', 11.00, 49, 'Samba'), ('New Age Project', 7.70, 50, 'New Age');

INSERT INTO MUSICAS (MNOME, GeneroM, idSupplier, idCategory, Duracao) VALUES
('Song One', 'Rock', 1, 10, 210), ('Baile da Penha', 'Funk', 2, 11, 150), ('Sweet Voice', 'Pop', 1, 10, 180),
('Coração Partido', 'Sertanejo', 3, 12, 195), ('Midnight Notes', 'Jazz', 4, 13, 320), ('Neon Lights', 'Eletrônica', 2, 11, 240),
('Cadência do Samba', 'Samba', 5, 14, 205), ('Street Law', 'Rap', 6, 15, 233), ('Symphony 5', 'Clássica', 7, 16, 450),
('Redemption Waves', 'Reggae', 4, 13, 215), ('Garage Days', 'Indie', 1, 10, 190), ('Sad Morning', 'Blues', 4, 13, 280),
('Iron Wheels', 'Heavy Metal', 8, 17, 310), ('Xote Quente', 'Forró', 5, 14, 175), ('Caminhos do Mar', 'MPB', 9, 18, 222),
('Glitter', 'Pop', 1, 10, 165), ('Faithful', 'Gospel', 10, 19, 290), ('Dança do Trio', 'Axé', 5, 14, 210),
('Sextou no Pagode', 'Pagode', 5, 14, 198), ('Chill Station', 'Lo-Fi', 2, 11, 140), ('Dark Beats', 'Trap', 6, 15, 178),
('Feeling Free', 'Soul', 9, 18, 245), ('Wild Horse', 'Country', 3, 12, 202), ('No Rules', 'Punk', 8, 17, 135),
('Garota de Aluguel', 'Bossa Nova', 9, 18, 187), ('Laser Beam', 'Techno', 2, 11, 380), ('Caliente', 'Salsa', 5, 14, 215),
('Noite de Luna', 'Tango', 7, 16, 192), ('Woodland', 'Folk', 1, 10, 220), ('Club Anthem', 'Dance', 2, 11, 230),
('Slap Bass', 'Funk Groove', 9, 18, 201), ('Unplugged Dreams', 'Acústico', 1, 10, 185), ('High Voltage', 'Hard Rock', 8, 17, 244),
('Broken Strings', 'Metalcore', 8, 17, 212), ('Retro Drive', 'Synthwave', 2, 11, 255), ('Concrete Jungle', 'Hip Hop', 6, 15, 221),
('Terreiro Antigo', 'Samba', 5, 14, 250), ('Novos Tempos', 'Pop Regional', 9, 18, 190), ('Poeira da Estrada', 'Sertanejo Raiz', 3, 12, 240),
('Vegas Vibe', 'Electro Swing', 4, 13, 210), ('Alien Frequencies', 'Psytrance', 2, 11, 420), ('Serenade', 'Instrumental', 7, 16, 300),
('Machine Age', 'Industrial', 8, 17, 275), ('Dale Reggaeton', 'Reggaeton', 6, 15, 188), ('Supernova', 'K-Pop', 1, 10, 195),
('Tokyo Drift', 'J-Rock', 8, 17, 230), ('Shadows', 'Alternativo', 1, 10, 218), ('Chora Sanfona', 'Sertanejo', 3, 12, 176),
('Avenida Sapucaí', 'Samba', 5, 14, 400), ('Deep Cosmos', 'New Age', 7, 16, 350);

INSERT INTO ALBUNS (NomeAlbum, MusicQTD, IDMusica, IDArtista, AnoLancamento, NomeArtista) VALUES
('Origins', 12, 1, 1, 2020, 'The Beats'), ('Proibidão', 10, 2, 2, 2022, 'MC Ritmo'), ('Star', 8, 3, 3, 2024, 'Aline Vox'),
('No Rancho', 14, 4, 4, 2021, 'Dupla Sertaneja'), ('Blue Note', 9, 5, 5, 2018, 'Jazz Band'), ('Electric Sky', 15, 6, 6, 2025, 'DJ Sunset'),
('Festa de Bamba', 11, 7, 7, 2019, 'Samba de Roda'), ('Rhymes', 13, 8, 8, 2023, 'Rapper Clan'), ('Masterpieces', 6, 9, 9, 2015, 'Classic Orchestra'),
('Roots', 10, 10, 10, 2020, 'Reggae Vibes'), ('Basement', 12, 11, 11, 2021, 'Indie Sound'), ('Delta', 8, 12, 12, 2017, 'Blues Masters'),
('Steel', 11, 13, 13, 2022, 'Heavy Metal Club'), ('Sanfona', 14, 14, 14, 2023, 'Forró Bom'), ('Essência', 10, 15, 15, 2024, 'MPB Trio'),
('Shiny', 9, 16, 16, 2025, 'Pop Star'), ('Grace', 12, 17, 17, 2021, 'Gospel Choir'), ('EletroTrio', 15, 18, 18, 2020, 'Axé Bahia'),
('Churrasco', 12, 19, 19, 2024, 'Pagode Chic'), ('Study Session', 20, 20, 20, 2023, 'Chill Out Crew'), ('Underground', 14, 21, 21, 2025, 'Trap Nation'),
('Soulful', 10, 22, 22, 2019, 'Soul Diva'), ('Boots', 11, 23, 23, 2021, 'Country Road'), ('Anarchy', 13, 24, 24, 2018, 'Punk Rebellion'),
('Copacabana', 9, 25, 25, 2016, 'Bossa Nova Duo'), ('Technopolis', 8, 26, 26, 2024, 'Electronic Waves'), ('Ritmo Latino', 12, 27, 27, 2022, 'Salsa Kings'),
('Arrabal', 10, 28, 28, 2015, 'Tango Real'), ('Greenwood', 11, 29, 29, 2022, 'Folk Acoustic'), ('Floor Fillers', 14, 30, 30, 2025, 'Dance Hits'),
('Funkadelic', 10, 31, 31, 2023, 'Groove Machine'), ('Pure', 8, 32, 32, 2021, 'Acoustic Sessions'), ('Thunder', 11, 33, 33, 2020, 'Hard Rockers'),
('Bleed', 10, 34, 34, 2024, 'Metal Core'), ('Grid', 12, 35, 35, 2022, 'Synthwave Co.'), ('Blocks', 13, 36, 36, 2023, 'Hip Hop Crew'),
('Patrimônio', 15, 37, 37, 2017, 'Velha Guarda'), ('Futuro', 10, 38, 38, 2025, 'Nova Geração'), ('Viola', 12, 39, 39, 2019, 'Modão Raiz'),
('Vintage', 9, 40, 40, 2021, 'Electro Swing'), ('Psychedelia', 7, 41, 41, 2024, 'Psytrance DJ'), ('Keys', 8, 42, 42, 2018, 'Piano Solo'),
('Factory', 11, 43, 43, 2020, 'Cyberpunk Sounds'), ('Fuego', 13, 44, 44, 2023, 'Reggaeton Star'), ('Idols', 6, 45, 45, 2025, 'K-Pop Group'),
('Neon Tokyo', 10, 46, 46, 2022, 'J-Rock Band'), ('Paradox', 12, 47, 47, 2024, 'Alternative Project'), ('Balada', 14, 48, 48, 2023, 'Sertanejo Universitário'),
('Campeãs', 11, 49, 49, 2026, 'Samba Enredo'), ('Meditation', 9, 50, 50, 2021, 'New Age Project');

INSERT INTO PLAYLIST (NameP, IDUSUARIO, IDMusica) VALUES
('My Rock', 1, 1), ('Fluxo', 2, 2), ('Pop Mix', 3, 3), ('Modões', 4, 4), ('Jazz Club', 5, 5),
('Rave', 6, 6), ('Samba 10', 7, 7), ('Ghetto', 8, 8), ('Relaxing', 9, 9), ('Jah Live', 10, 10),
('Hipster', 11, 11), ('Cry Me', 12, 12), ('Headbang', 13, 13), ('Arraiá', 14, 14), ('Leve', 15, 15),
('Hits', 16, 16), ('Church', 17, 17), ('Carnaval', 18, 18), ('Churras', 19, 19), ('Chill', 20, 20),
('Glow', 21, 21), ('Deep', 22, 22), ('Rodeio', 23, 23), ('Anarquia', 24, 24), ('Praia', 25, 25),
('Techno Room', 26, 26), ('Bailando', 27, 27), ('Milonga', 28, 28), ('Forest', 29, 29), ('Party', 30, 30),
('Bass Line', 31, 31), ('Unplugged', 32, 32), ('Stadium', 33, 33), ('Mosh', 34, 34), ('Outrun', 35, 35),
('Rhyme Line', 36, 36), ('Tradição', 37, 37), ('Fresh', 38, 38), ('Interior', 39, 39), ('Swing', 40, 40),
('Trance', 41, 41), ('Study', 42, 42), ('Industry', 43, 43), ('Latino', 44, 44), ('Coreano', 45, 45),
('Japan', 46, 46), ('Indie Mix', 47, 47), ('Piseiro', 48, 48), ('Desfile', 49, 49), ('Zen', 50, 50);

INSERT INTO HisReprod (MusicaRep, PlayListRep, IDMusica, IDUSUARIO, NomeUsuario, DataReproducao) VALUES
('Song One', 'My Rock', 1, 1, 'anasilva', '2026-07-01 10:00:00'),
('Baile da Penha', 'Fluxo', 2, 2, 'brunosantos', '2026-07-01 10:05:00'),
('Sweet Voice', 'Pop Mix', 3, 3, 'carlosoli', '2026-07-01 10:12:00'),
('Coração Partido', 'Modões', 4, 4, 'danisouza', '2026-07-01 10:20:00'),
('Midnight Notes', 'Jazz Club', 5, 5, 'edulima', '2026-07-01 10:30:00'),
('Neon Lights', 'Rave', 6, 6, 'fercosta', '2026-07-01 10:45:00'),
('Cadência do Samba', 'Samba 10', 7, 7, 'gabalmeida', '2026-07-01 11:00:00'),
('Street Law', 'Ghetto', 8, 8, 'amandamartins', '2026-07-01 11:15:00'),
('Symphony 5', 'Relaxing', 9, 9, 'igorrib', '2026-07-01 11:30:00'),
('Redemption Waves', 'Jah Live', 10, 10, 'jucarvalho', '2026-07-01 11:45:00'),
('Garage Days', 'Hipster', 11, 11, 'lucaspereira', '2026-07-01 12:00:00'),
('Sad Morning', 'Cry Me', 12, 12, 'marirocha', '2026-07-01 12:10:00'),
('Iron Wheels', 'Headbang', 13, 13, 'nicgomes', '2026-07-01 12:25:00'),
('Xote Quente', 'Arraiá', 14, 14, 'oliviamendes', '2026-07-01 12:40:00'),
('Caminhos do Mar', 'Leve', 15, 15, 'pedrobarbosa', '2026-07-01 13:00:00'),
('Glitter', 'Hits', 16, 16, 'biaramos', '2026-07-01 13:20:00'),
('Faithful', 'Church', 17, 17, 'rodrigovieira', '2026-07-01 13:45:00'),
('Dança do Trio', 'Carnaval', 18, 18, 'sofiacastro', '2026-07-01 14:00:00'),
('Sextou no Pagode', 'Churras', 19, 19, 'thiagomelo', '2026-07-01 14:15:00'),
('Chill Station', 'Chill', 20, 20, 'laridias', '2026-07-01 14:30:00'),
('Dark Beats', 'Glow', 21, 21, 'vitornunes', '2026-07-01 14:50:00'),
('Feeling Free', 'Deep', 22, 22, 'camilafarias', '2026-07-01 15:05:00'),
('Wild Horse', 'Rodeio', 23, 23, 'willcardoso', '2026-07-01 15:20:00'),
('No Rules', 'Anarquia', 24, 24, 'leticiateix', '2026-07-01 15:40:00'),
('Garota de Aluguel', 'Praia', 25, 25, 'arthurmarques', '2026-07-01 16:00:00'),
('Laser Beam', 'Techno Room', 26, 26, 'barbaramach', '2026-07-01 16:15:00'),
('Caliente', 'Bailando', 27, 27, 'caiomedeiros', '2026-07-01 16:30:00'),
('Noite de Luna', 'Milonga', 28, 28, 'brunaassis', '2026-07-01 16:45:00'),
('Woodland', 'Forest', 29, 29, 'diegomoreira', '2026-07-01 17:00:00'),
('Club Anthem', 'Party', 30, 30, 'gabifontes', '2026-07-01 17:20:00'),
('Slap Bass', 'Bass Line', 31, 31, 'eduneves', '2026-07-01 17:40:00'),
('Unplugged Dreams', 'Unplugged', 32, 32, 'felipediniz', '2026-07-01 18:00:00'),
('High Voltage', 'Stadium', 33, 33, 'giovannacunha', '2026-07-01 18:15:00'),
('Broken Strings', 'Mosh', 34, 34, 'heitoraguiar', '2026-07-01 18:30:00'),
('Retro Drive', 'Outrun', 35, 35, 'isabelapires', '2026-07-01 18:50:00'),
('Concrete Jungle', 'Rhyme Line', 36, 36, 'joaorezende', '2026-07-01 19:10:00'),
('Terreiro Antigo', 'Tradição', 37, 37, 'karinaguimaraes', '2026-07-01 19:30:00'),
('Novos Tempos', 'Fresh', 38, 38, 'leoborges', '2026-07-01 19:50:00'),
('Poeira da Estrada', 'Interior', 39, 39, 'manuelaleitao', '2026-07-01 20:10:00'),
('Vegas Vibe', 'Swing', 40, 40, 'mateusprado', '2026-07-01 20:30:00'),
('Alien Frequencies', 'Trance', 41, 41, 'natcampos', '2026-07-01 20:50:00'),
('Serenade', 'Study', 42, 42, 'otaviofranco', '2026-07-01 21:10:00'),
('Machine Age', 'Industry', 43, 43, 'patriciamiranda', '2026-07-01 21:30:00'),
('Dale Reggaeton', 'Latino', 44, 44, 'rafaelviana', '2026-07-01 21:50:00'),
('Supernova', 'Coreano', 45, 45, 'sabrinaantunes', '2026-07-01 22:10:00'),
('Tokyo Drift', 'Japan', 46, 46, 'samuelmoraes', '2026-07-01 22:30:00'),
('Shadows', 'Indie Mix', 47, 47, 'tatiguerra', '2026-07-01 22:50:00'),
('Chora Sanfona', 'Piseiro', 48, 48, 'viniciuspaiva', '2026-07-01 23:10:00'),
('Avenida Sapucaí', 'Desfile', 49, 49, 'yasmincaldas', '2026-07-01 23:30:00'),
('Deep Cosmos', 'Zen', 50, 50, 'renanmalta', '2026-07-01 23:50:00');

