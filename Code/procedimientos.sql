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

    
    -- Obtener año y semestre actual
    
    SET year = YEAR(CURDATE());
    SET semester = IF(MONTH(CURDATE()) <= 6, 1, 2);

    -- Buscar o crear el periodo correspondiente
    SELECT idPeriodo INTO periodo_id
    FROM periodo
    WHERE referencia = CONCAT(year, '-', semester) COLLATE utf8mb4_general_ci;

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
