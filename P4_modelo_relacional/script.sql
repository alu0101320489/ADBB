DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

DROP TABLE IF EXISTS zona;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS zona_producto;

CREATE TABLE zona(
    ID_zona INT,
    vivero VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID_zona)
);

CREATE TABLE producto(
    nombre_producto VARCHAR(20),
    tipo VARCHAR(30) NOT NULL,
    PRIMARY KEY(nombre_producto)
);

CREATE TABLE empleado(
    nombre_empleado VARCHAR(20),
    productividad INT,
    objetivos VARCHAR(20) NOT NULL,
    destino VARCHAR(20) NOT NULL,
    fecha_inicio VARCHAR(10),
    fecha_final VARCHAR(10),
    ID_zona int,
    PRIMARY KEY(nombre_empleado),
    CONSTRAINT no_zona
        FOREIGN KEY(ID_zona)
            REFERENCES zona(ID_zona)
                ON DELETE CASCADE
);

CREATE TABLE pedido(
    nombre_empleado VARCHAR(20),
    cliente VARCHAR(20) NOT NULL,
    bonificacion INT,
    fecha VARCHAR(10) NOT NULL,
    PRIMARY KEY(nombre_empleado),
    CONSTRAINT no_empleado
        FOREIGN KEY(nombre_empleado)
            REFERENCES empleado(nombre_empleado)
                ON DELETE CASCADE
);


CREATE TABLE zona_producto(
    ID_zona INT,
    nombre_producto VARCHAR(20),
    fecha VARCHAR(30) NOT NULL,
    stock INT,
    PRIMARY KEY(nombre_producto, ID_zona),
    CONSTRAINT no_zone
        FOREIGN KEY(ID_zona)
            REFERENCES zona(ID_zona)
                ON DELETE CASCADE,
    CONSTRAINT no_producto
        FOREIGN KEY(nombre_producto)
            REFERENCES producto(nombre_producto)
                ON DELETE CASCADE
  
);

INSERT INTO zona(ID_zona, vivero)
VALUES
    (1, 'a'),
    (2, 'b'),
    (3, 'c'),
    (4, 'd'),
    (5, 'e');

INSERT INTO producto(nombre_producto, tipo)
VALUES
    ('a', 'f'),
    ('b', 'g'),
    ('c', 'h'),
    ('d', 'i'),
    ('e', 'j');

INSERT INTO empleado(nombre_empleado, productividad, objetivos, destino, fecha_inicio, fecha_final, ID_zona)
VALUES
    ('Juan', 1, 'si', 'Santa Cruz', '1-1-2020', '1-2-2020', 1),
    ('Jose', 2, 'no', 'Burgos', '1-2-2020', '1-3-2020', 2),
    ('Maria', 3, 'quizas', 'Las Palmas', '1-3-2020', '1-4-2020', 3),
    ('Pedro', 4, 'puede', 'San Matias', '1-4-2020', '1-5-2020', 4),
    ('Minguito', 5, 'tambien', 'Añaza', '1-5-2020', '1-6-2020', 5);

INSERT INTO pedido(nombre_empleado, cliente, bonificacion, fecha)
VALUES
    ('Juan', 'Martinez', 1, '1-1-2020'),
    ('Jose', 'Miguel', 2, '1-2-2020'),
    ('Maria', 'Estefania', 3, '1-3-2020'),
    ('Pedro', 'Messi', 4, '1-4-2020'),
    ('Minguito', 'Abascal', 50, '1-5-2020');

INSERT INTO zona_producto(ID_zona, nombre_producto, fecha, stock)
VALUES
    (1, 'a', '1-1-2020', 1),
    (2, 'b', '1-2-2020', 2),
    (3, 'c', '1-3-2020', 3),
    (4, 'd', '1-4-2020', 4),
    (5, 'e', '1-5-2020', 120);

SELECT * FROM zona;
SELECT * FROM producto;
SELECT * FROM empleado;
SELECT * FROM pedido;
SELECT * FROM zona_producto;