CREATE DATABASE campeonato_rugby_uruguayo;


USE campeonato_rugby_uruguayo;


CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estadio VARCHAR(100) NOT NULL
);


CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);


CREATE TABLE partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    equipo_local INT,
    equipo_visitante INT,
    marcador_local INT,
    marcador_visitante INT,
    id_estadio INT,
    FOREIGN KEY (equipo_local) REFERENCES equipos(id_equipo),
    FOREIGN KEY (equipo_visitante) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_estadio) REFERENCES estadios(id_estadio)
);


CREATE TABLE estadios (
    id_estadio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estadio VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
);


CREATE TABLE resultados (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_partido INT,
    marcador_local INT NOT NULL,
    marcador_visitante INT NOT NULL,
    FOREIGN KEY (id_partido) REFERENCES partidos(id_partido)
);


INSERT INTO equipos (nombre_equipo, ciudad, estadio) VALUES 
('Old Boys Club', 'Montevideo', 'Estadio Charrúa'),
('Old Christians Club', 'Montevideo', 'Cancha de Old Christians'),
('Carrasco Polo Club', 'Montevideo', 'Estadio de Carrasco Polo'),
('Trébol Rugby Club', 'Paysandú', 'Cancha de Trébol Rugby Club'),
('Lobos Rugby Club', 'Punta del Este', 'Cancha de Lobos Rugby Club'),
('PSG Rugby', 'Paysandú', 'Cancha de PSG Rugby'),
('Ceibos Rugby Club', 'Montevideo', 'Cancha de Ceibos Rugby Club'),
('Los Cuervos Rugby Club', 'Montevideo', 'Campo de Deportes de Los Cuervos'),
('MVCC', 'Montevideo', 'Estadio del Parque Central'),
('Champagnat Rugby Club', 'Montevideo', 'Estadio Charrúa'),
('Centro Los Teros', 'Montevideo', 'Estadio Charrúa'),
('San Luis Rugby', 'Canelones', 'Cancha de San Luis Rugby');


INSERT INTO estadios (nombre_estadio, ciudad, capacidad) VALUES 
('Estadio Charrúa', 'Montevideo', 14000),
('Estadio del Parque Central', 'Montevideo', 34000),
('Estadio de Carrasco Polo', 'Montevideo', 1000),
('Cancha de Old Christians', 'Montevideo', 1000),
('Cancha de Trébol Rugby Club', 'Paysandú', 2000),
('Cancha de Lobos Rugby Club', 'Punta del Este', 1500),
('Cancha de PSG Rugby', 'Paysandú', 2000),
('Campo de Deportes de Los Cuervos', 'Montevideo', 1000),
('Cancha de Ceibos Rugby Club', 'Montevideo', 1000),
('Cancha de San Luis Rugby', 'Canelones', 800);


INSERT INTO jugadores (nombre_jugador, posicion, edad, id_equipo) VALUES 
('Juan Pérez', 'Ala', 25, 1),
('Carlos Rodríguez', 'Centro', 27, 2),
('Martín González', 'Apertura', 22, 3),
('Federico López', 'Fullback', 30, 4),
('Santiago Martínez', 'Segunda línea', 28, 5),
('Rodrigo Fernández', 'Pilar', 26, 6),
('Andrés García', 'Hooker', 24, 7),
('Diego Sánchez', 'Medio scrum', 23, 8),
('Lucas Silva', 'Medio apertura', 29, 9),
('Matías Pérez', 'Centro', 31, 10),
('Esteban Gutiérrez', 'Ala', 24, 11),
('Gonzalo Suárez', 'Fullback', 26, 12),
('Pablo Ramírez', 'Pilar', 28, 1),
('Miguel Torres', 'Centro', 27, 2),
('Raúl Díaz', 'Apertura', 23, 3),
('Javier Fernández', 'Segunda línea', 30, 4),
('Oscar García', 'Hooker', 25, 5),
('Manuel Pereira', 'Medio scrum', 22, 6),
('Ricardo López', 'Medio apertura', 29, 7),
('Héctor Silva', 'Centro', 28, 8);


INSERT INTO partidos (fecha, equipo_local, equipo_visitante, marcador_local, marcador_visitante, id_estadio) VALUES 
('2024-07-15', 1, 2, 20, 15, 1),
('2024-07-22', 3, 4, 10, 25, 2),
('2024-07-29', 5, 6, 30, 10, 3),
('2024-08-05', 7, 8, 22, 18, 4),
('2024-08-12', 9, 10, 15, 15, 5),
('2024-08-19', 1, 3, 18, 20, 1),
('2024-08-26', 2, 4, 25, 30, 2),
('2024-09-02', 5, 7, 12, 22, 3),
('2024-09-09', 6, 8, 28, 26, 4),
('2024-09-16', 9, 11, 17, 21, 5),
('2024-09-23', 10, 12, 14, 19, 6),
('2024-09-30', 1, 5, 24, 10, 1);

INSERT INTO resultados (id_partido, marcador_local, marcador_visitante) VALUES 
(1, 20, 15),
(2, 10, 25),
(3, 30, 10),
(4, 22, 18),
(5, 15, 15),
(6, 18, 20),
(7, 25, 30),
(8, 12, 22),
(9, 28, 26),
(10, 17, 21),
(11, 14, 19),
(12, 24, 10);


-- Funciones

DROP FUNCTION IF EXISTS EdadPromedioJugadores;

DELIMITER //

CREATE FUNCTION EdadPromedioJugadores(id_equipo INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE edad_promedio FLOAT DEFAULT 0;
    
    SELECT AVG(edad)
    INTO edad_promedio
    FROM jugadores
    WHERE id_equipo = id_equipo;
    
    RETURN edad_promedio;
END //

DELIMITER ;

SELECT EdadPromedioJugadores(1) AS EdadPromedio;

DELIMITER // 

CREATE FUNCTION TotalPartidosJugados (id_equipo INT) 
RETURNS INT 
DETERMINISTIC 
		BEGIN 
    DECLARE total_partidos INT DEFAULT 0;
	SELECT COUNT(*)
	INTO total_partidos
	FROM partidos
	WHERE equipo_local = id_equipo OR equipo_visitante = id_equipo;
		RETURN total_partidos;
	END // 
    DELIMITER ; 

SELECT TotalPartidosJugados(1) AS TotalPartidos ; 




-- Procesamientos Almacenados
DELIMITER //

CREATE PROCEDURE TotalPuntosEquipo(IN id_equipo INT)
BEGIN
    SELECT 
        (SUM(CASE WHEN equipo_local = id_equipo THEN marcador_local ELSE 0 END) +
         SUM(CASE WHEN equipo_visitante = id_equipo THEN marcador_visitante ELSE 0 END)) AS TotalPuntos
    FROM partidos
    WHERE equipo_local = id_equipo OR equipo_visitante = id_equipo;
END //

DELIMITER ;

CALL TotalPuntosEquipo(2);

SELECT *
FROM Equipos  ; 


DROP PROCEDURE DiferenciaPuntuacion ; 
DROP PROCEDURE PromedioPuntuacionEquipo; 

DELIMITER //

CREATE PROCEDURE PromedioPuntosEquipo(IN id_equipo INT, OUT promedio_puntos FLOAT)
BEGIN

    SET promedio_puntos = NULL;

 
    SELECT AVG(puntos) INTO promedio_puntos
    FROM (
        SELECT marcador_local AS puntos
        FROM partidos
        WHERE equipo_local = id_equipo
        UNION ALL
        SELECT marcador_visitante AS puntos
        FROM partidos
        WHERE equipo_visitante = id_equipo
    ) AS todas_puntuaciones;


    IF promedio_puntos IS NULL THEN
        SET promedio_puntos = 0;
    END IF;
END //

DELIMITER ;

CALL PromedioPuntosEquipo(1, @promedio_puntos);
SELECT @promedio_puntos AS PromedioPuntos;

-- vistas 
CREATE VIEW informacion_partidos AS
SELECT 
    id_partido,
    equipo_local,
    equipo_visitante,
    marcador_local,
    marcador_visitante
FROM partidos;

SELECT * FROM informacion_partidos;

CREATE VIEW vista_total_puntos_equipo AS
SELECT 
    equipo_local AS equipo,
    SUM(marcador_local) AS total_puntos_local
FROM partidos
GROUP BY equipo_local
UNION ALL
SELECT 
    equipo_visitante AS equipo,
    SUM(marcador_visitante) AS total_puntos_visitante
FROM partidos
GROUP BY equipo_visitante;

SELECT * FROM vista_total_puntos_equipo
;

-- indices 

CREATE INDEX idx_nombre_equipo ON equipos(nombre_equipo);

CREATE INDEX idx_nombre_jugador ON jugadores(nombre_jugador);

CREATE INDEX idx_equipo_local_fecha ON partidos(equipo_local, fecha);

CREATE INDEX idx_nombre_estadio ON estadios(nombre_estadio);

CREATE INDEX idx_id_partido ON resultados(id_partido);

SHOW INDEXES FROM equipos;
SHOW INDEXES FROM jugadores;
SHOW INDEXES FROM partidos;
SHOW INDEXES FROM estadios;
SHOW INDEXES FROM resultados;


-- Triggers 

DELIMITER //

CREATE TRIGGER after_insert_partido
AFTER INSERT ON partidos
FOR EACH ROW
BEGIN
  
    INSERT INTO resultados (id_partido, marcador_local, marcador_visitante)
    VALUES (NEW.id_partido, NEW.marcador_local, NEW.marcador_visitante);
END //

DELIMITER ;

SHOW TRIGGERS LIKE 'after_insert_partido';

INSERT INTO partidos (fecha, equipo_local, equipo_visitante, marcador_local, marcador_visitante, id_estadio)
VALUES ('2024-10-05', 2, 3, 22, 18, 2);

SELECT * FROM resultados WHERE id_partido = LAST_INSERT_ID();

SHOW CREATE TRIGGER after_insert_partido;

SELECT *
FROM resultados; 

-- Sublenguaje TCL 

 INSERT INTO equipos (nombre_equipo, ciudad, estadio) VALUES 
 ('Old Boys Club', 'Montevideo', 'Estadio Charrúa'),
('Old Christians Club', 'Montevideo', 'Cancha de Old Christians');

SELECT *
FROM resultados; 


SELECT COUNT(*) AS TotalRegistrosResultados FROM resultados;

START TRANSACTION;
DELETE FROM resultados WHERE id_resultado IN (1, 2);
ROLLBACK;
COMMIT;

-- INSERT INTO resultados (id_partido, marcador_local, marcador_visitante) VALUES (1, 20, 15), (2, 10, 25);


START TRANSACTION;
INSERT INTO jugadores (nombre_jugador, posicion, edad, id_equipo) VALUES 
('Juan Pérez', 'Ala', 25, 1),
('Carlos Rodríguez', 'Centro', 27, 2),
('Martín González', 'Apertura', 22, 3),
('Federico López', 'Fullback', 30, 4);

SAVEPOINT after_insert_4;


INSERT INTO jugadores (nombre_jugador, posicion, edad, id_equipo) VALUES 
('Santiago Martínez', 'Segunda línea', 28, 5),
('Rodrigo Fernández', 'Pilar', 26, 6),
('Andrés García', 'Hooker', 24, 7),
('Diego Sánchez', 'Medio scrum', 23, 8);

SAVEPOINT after_insert_8;
COMMIT;

-- RELEASE SAVEPOINT after_insert_4;
-- ROLLBACK TO SAVEPOINT after_insert_4;








