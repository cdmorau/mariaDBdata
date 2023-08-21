
DROP DATABASE IF EXISTS `sia_ing`;
CREATE DATABASE `sia_ing`;
USE `sia_ing`;

DROP TABLE IF EXISTS `calificaciones` ;
DROP TABLE IF EXISTS `grupo` ;
DROP TABLE IF EXISTS `docente` ;
DROP TABLE IF EXISTS `curso` ;
DROP TABLE IF EXISTS `estudiante` ;
DROP TABLE IF EXISTS `facultad` ;
DROP TABLE IF EXISTS `periodo` ;



CREATE TABLE IF NOT EXISTS `estudiante` (
  `idEstudiante` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEstudiante`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `curso` (
  `idCurso` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `creditos` TINYINT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCurso`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS `facultad` (
  `idFacultad` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFacultad`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `periodo`(
  `idPeriodo` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `referencia` VARCHAR(8) NOT NULL,
  `inicio` DATE,
  `fin` DATE,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPeriodo`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `facultad_idFacultad` BIGINT(20) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idDocente`),
  CONSTRAINT `fk_docente_facultad1`
    FOREIGN KEY (`facultad_idFacultad`)
    REFERENCES `facultad` (`idFacultad`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `grupo` (
  `idGrupo` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `docente_idDocente` BIGINT(20) UNSIGNED NOT NULL,
  `curso_idCurso` BIGINT(20) UNSIGNED NOT NULL,
  `numero` INT NULL,
  `periodo_idPeriodo` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idGrupo`),
  CONSTRAINT `fk_Grupo_Curso1`
    FOREIGN KEY (`curso_idCurso`)
    REFERENCES `curso` (`idCurso`),
  CONSTRAINT `fk_grupo_docente1`
    FOREIGN KEY (`docente_idDocente`)
    REFERENCES `docente` (`idDocente`),
  CONSTRAINT `fk_grupo_periodo1`
    FOREIGN KEY (`periodo_idPeriodo`)
    REFERENCES `periodo` (`idPeriodo`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;




CREATE TABLE IF NOT EXISTS `calificaciones` (
  `idCalificaciones` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estudiante_idEstudiante` BIGINT(20) UNSIGNED NOT NULL,
  `grupo_idGrupo` BIGINT(20) UNSIGNED NOT NULL,
  `notaFinal` DOUBLE NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCalificaciones`),
  CONSTRAINT `fk_Calificaciones_Estudiante1`
    FOREIGN KEY (`estudiante_idEstudiante`)
    REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `fk_Calificaciones_Grupo1`
    FOREIGN KEY (`grupo_idGrupo`)
    REFERENCES `grupo` (`idGrupo`)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

DELIMITER //
CREATE TRIGGER set_group_number
BEFORE INSERT ON grupo
FOR EACH ROW
BEGIN
    DECLARE curso_count INT;
    DECLARE periodo_year INT;
    DECLARE periodo_semester INT;

    -- Contar la cantidad de grupos con el mismo curso y periodo
    SET curso_count = (
        SELECT COUNT(*)
        FROM grupo
        WHERE curso_idCurso = NEW.curso_idCurso
        AND periodo_idPeriodo = NEW.periodo_idPeriodo
    );

    -- Actualizar el valor de 'numero'
    SET NEW.numero = curso_count + 1;

END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER set_period_dates
BEFORE INSERT ON periodo
FOR EACH ROW
BEGIN
    DECLARE year_part INT;
    DECLARE month_part INT;
    
    -- Obtener el año y el semestre de la referencia
    SET year_part = SUBSTRING(NEW.referencia, 1, 4);
    SET month_part = SUBSTRING(NEW.referencia, 6);

    -- Calcular las fechas de inicio y fin en base a la referencia
    IF NEW.inicio IS NULL THEN
        IF month_part = '1' THEN
            SET NEW.inicio = CONCAT(year_part, '-02-01');
        ELSEIF month_part = '2' THEN
            SET NEW.inicio = CONCAT(year_part, '-08-01');
        END IF;
    END IF;
    
    IF NEW.fin IS NULL THEN
        SET NEW.fin = DATE_ADD(NEW.inicio, INTERVAL 4 MONTH);
    END IF;
END;
//
DELIMITER ;


USE `sia_ing`;


-- PERIODOS
INSERT INTO `periodo` (`referencia`) VALUES ('2010-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2010-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2011-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2011-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2012-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2012-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2013-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2013-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2014-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2014-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2015-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2015-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2016-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2016-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2017-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2017-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2018-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2018-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2019-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2019-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2020-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2020-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2021-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2021-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2022-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2022-2');
INSERT INTO `periodo` (`referencia`) VALUES ('2023-1');
INSERT INTO `periodo` (`referencia`) VALUES ('2023-2');





-- FACULTADES
INSERT INTO `facultad` (`nombre`) VALUES ('Ingeniería');
INSERT INTO `facultad` (`nombre`) VALUES ('Medicina');
INSERT INTO `facultad` (`nombre`) VALUES ('Humanas');
INSERT INTO `facultad` (`nombre`) VALUES ('Ciencias');

-- CURSOS
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('Diferencial', '4');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('Programación', '3');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('Quimica', '3');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('materia 1', '4');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('materia 2', '3');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('materia 3', '2');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('materia 4 ', '4');
INSERT INTO `curso` (`nombre`, `creditos`) VALUES ('materia 5', '3');

-- ESTUDIANTES
INSERT INTO `estudiante` (`nombre`) VALUES ('Al1');
INSERT INTO `estudiante` (`nombre`) VALUES ('al2');
INSERT INTO `estudiante` (`nombre`) VALUES ('al3');
INSERT INTO `estudiante` (`nombre`) VALUES ('al4');
INSERT INTO `estudiante` (`nombre`) VALUES ('al5');
INSERT INTO `estudiante` (`nombre`) VALUES ('al6');
INSERT INTO `estudiante` (`nombre`) VALUES ('al7');
INSERT INTO `estudiante` (`nombre`) VALUES ('al8');
INSERT INTO `estudiante` (`nombre`) VALUES ('al9');
INSERT INTO `estudiante` (`nombre`) VALUES ('al10');
INSERT INTO `estudiante` (`nombre`) VALUES ('al11');
INSERT INTO `estudiante` (`nombre`) VALUES ('al12');

-- DOCENTE
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p0');
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p01');
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p02');
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p03');
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('2', 'p1' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('2', 'p2' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('3', 'p3' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('3', 'p4' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('4', 'p5' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('4', 'p6' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p7' );
INSERT INTO `docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p8' );


-- GRUPOS
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('1', '1',28);
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('2', '1',28);
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('3', '1',26);
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('4', '1',24);
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`, `periodo_idPeriodo`) VALUES ('1', '2', '26');
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`, `periodo_idPeriodo`) VALUES ('2', '2', '27');
INSERT INTO `grupo` (`docente_idDocente`, `curso_idCurso`, `periodo_idPeriodo`) VALUES ('3', '2', '27');


-- Calificaciones

INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('1', '1', '39');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('2', '1', '45');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('3', '1', '23');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('4', '1', '36');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('5', '1', '43');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('6', '1', '34');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('7', '2', '20');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('8', '2', '25');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('9', '2', '15');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('11', '3', '40');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('12', '3', '45');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('1', '5', '30');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('2', '5', '30');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('3', '5', '30');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('4', '6', '50');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('5', '6', '50');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('6', '7', '50');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('7', '7', '40');
INSERT INTO `calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('8', '7', '48');



DROP PROCEDURE IF EXISTS GetActiveDocentesInFacultad;
DROP PROCEDURE IF EXISTS GetCoursesByPeriodReference;
DROP PROCEDURE IF EXISTS GetStudentsByCourseGroupAndPeriod;
DROP PROCEDURE IF EXISTS CalculateAverageGradeByCourse;
DROP PROCEDURE IF EXISTS CreateCourseAndAssignDocent;

-- ¿ Cual es el numero de docentes activos en la facultad de ingeniería?


DELIMITER //
CREATE PROCEDURE GetActiveDocentesInFacultad()
BEGIN
    SELECT COUNT(DISTINCT docente_idDocente)
    FROM grupo
    WHERE periodo_idPeriodo IN (
        SELECT idPeriodo
        FROM periodo
        WHERE CURDATE() BETWEEN inicio AND fin
    )
    AND docente_idDocente IN (
        SELECT idDocente
        FROM docente
        WHERE facultad_idFacultad = 1 -- Cambiar según la facultad de ingeniería
    );
END;
//
DELIMITER ;

-- ¿Cuáles son los cursos que se dictaron en un periodo dado?
DELIMITER //
CREATE PROCEDURE GetCoursesByPeriodReference(IN reference VARCHAR(8))
BEGIN
    DECLARE period_id INT;
    
    SELECT idPeriodo INTO period_id FROM periodo WHERE referencia COLLATE utf8mb4_unicode_ci = reference;
    
    SELECT DISTINCT c.idCurso, c.nombre
    FROM curso c
    INNER JOIN grupo g ON c.idCurso = g.curso_idCurso
    WHERE g.periodo_idPeriodo = period_id;
END;
//
DELIMITER ;

-- ¿Cuál es la lista de estudiantes para un curso y grupo dados en el periodo actual?

DELIMITER //
CREATE PROCEDURE GetStudentsByCourseGroupAndPeriod(IN course_id INT, IN group_id INT)
BEGIN
    DECLARE period_id INT;
    
    -- Obtener el id del periodo actual
    SELECT idPeriodo INTO period_id FROM periodo WHERE CURDATE() BETWEEN inicio AND fin;
    
    -- Obtener la lista de estudiantes
    SELECT e.idEstudiante, e.nombre
    FROM estudiante e
    INNER JOIN calificaciones c ON e.idEstudiante = c.estudiante_idEstudiante
    INNER JOIN grupo g ON c.grupo_idGrupo = g.idGrupo
    WHERE g.curso_idCurso = course_id AND g.idGrupo = group_id AND g.periodo_idPeriodo = period_id;
END;
//
DELIMITER ;


-- ¿Cuál es el promedio de las calificaciones obtenidas en un curso los últimos 5 años?
DELIMITER //
CREATE PROCEDURE CalculateAverageGradeByCourse(IN course_id INT)
BEGIN
    DECLARE current_year INT;
    DECLARE start_year INT;
    DECLARE end_year INT;
    
    SET current_year = YEAR(CURDATE());
    SET start_year = current_year - 5;
    SET end_year = current_year;

    SELECT AVG(c.notaFinal) AS promedio
    FROM calificaciones c
    WHERE c.grupo_idGrupo IN (
        SELECT idGrupo
        FROM grupo g
        WHERE g.curso_idCurso = course_id
          AND EXISTS (
              SELECT *
              FROM periodo p
              WHERE g.periodo_idPeriodo = p.idPeriodo
                AND YEAR(p.inicio) BETWEEN start_year AND end_year
          )
    )
    AND c.notaFinal IS NOT NULL;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CreateCourseAndAssignDocent(
    IN course_name VARCHAR(45),
    IN creditos_value TINYINT,
    IN docent_id INT,
    IN facultad_id INT,
    IN periodo_reference VARCHAR(8),
    INOUT result_message VARCHAR(100)
)
BEGIN
    DECLARE course_id INT;
    DECLARE periodo_id INT;
	DECLARE year INT;
	DECLARE semester INT;
    -- Colación para las comparaciones
    SET collation_connection = 'utf8mb4_general_ci';

    -- Crear el nuevo curso
    INSERT INTO curso (nombre, creditos) VALUES (course_name, creditos_value);
    SET course_id = LAST_INSERT_ID();

    -- Verificar si se proporcionó un periodo
    IF periodo_reference IS NOT NULL THEN
        -- Obtener el ID del periodo proporcionado
        SELECT idPeriodo INTO periodo_id
        FROM periodo
        WHERE referencia = periodo_reference COLLATE utf8mb4_general_ci;
    ELSE
        -- Obtener año y semestre actual
        
        SET year = YEAR(CURDATE());
        SET semester = IF(MONTH(CURDATE()) <= 6, 1, 2);

        -- Buscar o crear el periodo correspondiente
        SELECT idPeriodo INTO periodo_id
        FROM periodo
        WHERE referencia = CONCAT(year, '-', semester) COLLATE utf8mb4_general_ci;

        IF periodo_id IS NULL THEN
            INSERT INTO periodo (referencia, inicio, fin) VALUES (CONCAT(year, '-', semester), CONCAT(year, '-01-01'), DATE_ADD(CONCAT(year, '-01-01'), INTERVAL 4 MONTH));
            SET periodo_id = LAST_INSERT_ID();
        END IF;
    END IF;

    -- Crear el nuevo grupo
    INSERT INTO grupo (docente_idDocente, curso_idCurso, periodo_idPeriodo) VALUES (docent_id, course_id, periodo_id);

    SET result_message = CONCAT('Curso "', course_name, '" creado y docente asignado al grupo. Grupo creado con ID: ', LAST_INSERT_ID());
END;
//
DELIMITER ;




CALL GetStudentsByCourseGroupAndPeriod('1','1');
CALL GetActiveDocentesInFacultad;
CALL GetCoursesByPeriodReference('2023-2'); -- Cambia el valor de referencia según tus necesidades
CALL CalculateAverageGradeByCourse(1);
SET @message = '';
CALL CreateCourseAndAssignDocent('Nuevo Curso',4,1, 1, '2023-2', @message);
SELECT @message;



SHOW TABLES FROM `sia_ing`;