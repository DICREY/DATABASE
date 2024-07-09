CREATE DATABASE laboratorio;
CREATE TABLE laboratorio.equipo(
    nomeq VARCHAR(20) PRIMARY KEY UNIQUE,
    director VARCHAR(50)
);
CREATE TABLE laboratorio.ciclistas(
    dorsal INT(11) UNSIGNED UNIQUE PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT(11),
    nomeq VARCHAR(20),
    Foreign Key (nomeq) REFERENCES equipo(nomeq)
);
CREATE TABLE laboratorio.etapas(
    netapa INT(11) UNSIGNED UNIQUE PRIMARY KEY,
    km INT(11),
    salida VARCHAR(20),
    llegada VARCHAR(20),
    dorsal INT(11) UNSIGNED UNIQUE,
    Foreign Key (dorsal) REFERENCES ciclistas(dorsal)
);
CREATE TABLE laboratorio.puertos(
    nompuerto VARCHAR(20) UNIQUE PRIMARY KEY,
    altura INT(11),
    categoria VARCHAR(1),
    pendiente INT(11),
    netapa INT(11) UNSIGNED UNIQUE,
    dorsal INT(11) UNSIGNED UNIQUE,
    Foreign Key (netapa) REFERENCES etapas(netapa),
    Foreign Key (dorsal) REFERENCES ciclistas(dorsal)
);
CREATE TABLE laboratorio.maillot(
    codigo VARCHAR(3) UNIQUE PRIMARY KEY,
    tipo VARCHAR(20),
    color VARCHAR(20),
    premio INT(11)
);
CREATE TABLE laboratorio.llevar(
    dorsal INT(11) UNSIGNED UNIQUE,
    netapa INT(11) UNSIGNED UNIQUE,
    codigo VARCHAR(3) UNIQUE,
    PRIMARY KEY(dorsal,netapa,codigo),
    Foreign Key (dorsal) REFERENCES ciclistas(dorsal),
    Foreign Key (netapa) REFERENCES etapas(netapa),
    Foreign Key (codigo) REFERENCES maillot(codigo)
);