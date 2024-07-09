CREATE DATABASE laboratorio;
CREATE TABLE laboratorio.equipo(
    nomeq VARCHAR(20) PRIMARY KEY UNIQUE,
    director VARCHAR(50)
);

INSERT INTO laboratorio.equipo VALUES 
('Amore Vita', 'Ricardo Padacci'),
('Banesto', 'Miguel Echevarría'),
('Bresciali-Refin', 'Pietro Armani'),
('Carrera', 'Luigi Petroni'),
('Gatorade', 'Gian Luca Pacceli'),
('Kelme', 'Álvaro Pino'),
('Mapei-Clas', 'Juan Fernández'),
('Navigare', 'Lorenzo Sciacci'),
('Telecom', 'Morgan Reikacrd'),
('TVM', 'Steevens Henk');

SELECT * FROM laboratorio.equipo;

CREATE TABLE laboratorio.ciclistas(
    dorsal INT(11) UNSIGNED UNIQUE PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT(11),
    nomeq VARCHAR(20),
    FOREIGN KEY (nomeq) REFERENCES equipo(nomeq)
);

INSERT INTO laboratorio.ciclistas VALUES 
(1, 'Miguel Indurainssio Di Basco', 30, 'TVM'),
(5, 'Armand', 17, 'Amore Vita'),
(8, 'Jean Van Poppel', 24, 'Bresciali-Refin'),
(9, 'Maximo Podel', 17, 'Telecom'),
(10, 'Mario Cipollini', 31, 'Carrera'),
(11, 'Eddy Seigneur', 20, 'Amore Vita'),
(12, 'Alessio Di Basco', 34, 'Bresciali-Refin'),
(13, 'Gianni Bugno', 24, 'Gatorade'),
(15, 'Jesús Montoya', 25, 'Amore Vita'),
(16, 'Dimitri Konishev', 27, 'Amore Vita'),
(17, 'Bruno Lealli', 30, 'Amore Vita'),
(20, 'Alfonso Gutiérrez', 27, 'Navigare'),
(22, 'Giorgio Furlan', 22, 'Kelme'),
(26, 'Mikel Zarrabeitia', 30, 'Carrera'),
(27, 'Laurent Jalabert', 22, 'Banesto'),
(30, 'Melchor Mauri', 26, 'Mapei-Clas'),
(31, 'Per Pedersen', 33, 'Banesto'),
(32, 'Tony Rominger', 31, 'Kelme'),
(33, 'Stefenao della Sveitia', 26, 'Amore Vita'),
(34, 'Clauido Chiapucci', 23, 'Amore Vita'),
(35, 'Gian Mateo Faluca', 34, 'TVM');

SELECT * FROM laboratorio.ciclistas;

CREATE TABLE laboratorio.etapas(
    netapa INT(11) UNSIGNED UNIQUE PRIMARY KEY,
    km INT(11),
    salida VARCHAR(20),
    llegada VARCHAR(20),
    dorsal INT(11) UNSIGNED,
    FOREIGN KEY (dorsal) REFERENCES ciclistas(dorsal)
);

INSERT INTO laboratorio.etapas VALUES 
(1, 35, 'Valladolid', 'Ávila', 1),
(2, 70, 'Salamanca', 'Zamora', 2),
(3, 150, 'Zamora', 'Almendralejo', 1),
(4, 330, 'Córdoba', 'Granada', 1),
(5, 150, 'Granada', 'Almería', 3);

SELECT * FROM laboratorio.etapas;

CREATE TABLE laboratorio.puertos(
    nompuerto VARCHAR(20) UNIQUE PRIMARY KEY,
    altura INT(11),
    categoria VARCHAR(1),
    pendiente INT(11),
    netapa INT(11) UNSIGNED,
    dorsal INT(11) UNSIGNED,
    FOREIGN KEY (netapa) REFERENCES etapas(netapa),
    FOREIGN KEY (dorsal) REFERENCES ciclistas(dorsal)
);

INSERT INTO laboratorio.puertos VALUES 
('Puerto Alfa', 2489, '1', 34, 2, 3),
('Puerto Beta', 2789, '1', 44, 4, 3),
('Puerto Efe', 2500, 'E', 17, 4, 2),
('Puerto Triple', 2500, 'E', 17, 4, 2),
('Puerto Nuevo', 2500, 'a', 17, 4, 1),
('Puerto Otro', 2500, 'E', 17, 4, 1),
('Puerto Uno', 2500, 'E', 23, 1, 2);

SELECT * FROM laboratorio.puertos;

CREATE TABLE laboratorio.maillot(
    codigo VARCHAR(3) UNIQUE PRIMARY KEY,
    tipo VARCHAR(20),
    color VARCHAR(20),
    premio INT(11)
);

INSERT INTO laboratorio.maillot VALUES 
('MGE', 'General', 'Amarillo', 1000000),
('MMO', 'Montaña', 'Blanco y rojo', 500000),
('MMS', 'Más sufrido', 'Estrellitas rojas', 400000),
('MMV', 'Metas volantes', 'Rojo', 400000),
('MRE', 'Regularidad', 'Verde', 300000),
('MSE', 'Sprint especial', 'Rosa', 300000);

SELECT * FROM laboratorio.maillot;

CREATE TABLE laboratorio.llevar(
    dorsal INT(11) UNSIGNED,
    netapa INT(11) UNSIGNED,
    codigo VARCHAR(3),
    PRIMARY KEY(dorsal,netapa,codigo),
    FOREIGN KEY (dorsal) REFERENCES ciclistas(dorsal),
    FOREIGN KEY (netapa) REFERENCES etapas(netapa),
    FOREIGN KEY (codigo) REFERENCES maillot(codigo)
);

INSERT INTO laboratorio.llevar VALUES 
(1, 3, 'MGE'),
(1, 4, 'MGE'),
(2, 2, 'MGE'),
(3, 1, 'MGE'),
(3, 1, 'MMV'),
(3, 4, 'MRE'),
(4, 1, 'MMO'),
(5, 2, 'MMO');

SELECT * FROM laboratorio.llevar;
