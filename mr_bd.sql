CREATE DATABASE mascotas_bd;

CREATE TABLE mascotas_bd.usuarios(
    id_usuario INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    es_propietario BOOLEAN DEFAULT 1,
    es_veterinario BOOLEAN DEFAULT 0,
    es_administrador BOOLEAN DEFAULT 0,
    email VARCHAR(100) NOT NULL,
    contrasenna VARCHAR(100) NOT NULL
);

SELECT * FROM mascotas_bd.usuarios;

CREATE TABLE mascotas_bd.veterinarios(
    id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    horario VARCHAR(100) NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_usuario)  REFERENCES usuarios(id_usuario)
);

SELECT * FROM mascotas_bd.veterinarios;

CREATE TABLE mascotas_bd.propietarios(
    id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    mascotas VARCHAR(255) NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

SELECT * FROM mascotas_bd.propietarios;

CREATE TABLE mascotas_bd.historiales_medicos(
    codigo INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    tratamiento VARCHAR(255) NOT NULL,
    id_veterinario INT UNSIGNED NOT NULL,
    codigo_mascota INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)
);

SELECT * FROM mascotas_bd.historiales_medicos;

CREATE TABLE mascotas_bd.mascotas(
    codigo INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    especie VARCHAR(100),
    raza VARCHAR(100),
    edad INT UNSIGNED NOT NULL,
    peso FLOAT UNSIGNED NOT NULL,
    id_propietario INT UNSIGNED NOT NULL,
    historial_medico INT UNSIGNED UNIQUE NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES propietarios(id),
    FOREIGN KEY (historial_medico) REFERENCES historiales_medicos(codigo)
);

ALTER TABLE historiales_medicos
ADD FOREIGN KEY (codigo_mascota) REFERENCES mascotas(codigo);

SELECT * FROM mascotas_bd.mascotas;

CREATE TABLE mascotas_bd.administradores(
    id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

SELECT * FROM mascotas_bd.administradores;

CREATE TABLE mascotas_bd.productos(
    codigo INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio FLOAT NOT NULL,
    id_administrador INT UNSIGNED NOT NULL,
    codigo_servicio INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_administrador) REFERENCES administradores(id)
);

SELECT * FROM mascotas_bd.productos;

CREATE TABLE mascotas_bd.servicios(
    codigo INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio FLOAT NOT NULL,
    codigo_producto INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);

ALTER TABLE productos
ADD FOREIGN KEY (codigo_servicio) REFERENCES servicios(codigo);

SELECT * FROM mascotas_bd.servicios;

CREATE TABLE mascotas_bd.citas(
    codigo INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    servicio INT UNSIGNED NOT NULL,
    veterinario INT UNSIGNED NOT NULL,
    mascota INT UNSIGNED NOT NULL,
    estado VARCHAR(100) NOT NULL,
    FOREIGN KEY(servicio) REFERENCES servicios(codigo),
    FOREIGN KEY(veterinario) REFERENCES veterinarios(id),
    FOREIGN KEY(mascota) REFERENCES mascotas(codigo)
);

SELECT * FROM mascotas_bd.citas;