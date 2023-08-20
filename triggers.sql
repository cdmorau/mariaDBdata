
DELIMITER //
CREATE TRIGGER actualizar_activo_eliminar AFTER DELETE ON grupo
FOR EACH ROW
BEGIN
    DECLARE countGrupos INT;
    SELECT COUNT(*) INTO countGrupos FROM grupo WHERE docente_idDocente = OLD.docente_idDocente;
    IF countGrupos = 0 THEN
        UPDATE docente
        SET activo = 0
        WHERE idDocente= OLD.docente_idDocente;
    END IF;
END; //

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
        AND periodo = NEW.periodo
    );

    -- Actualizar el valor de 'numero'
    SET NEW.numero = curso_count + 1;

    -- Calcular el periodo en base a la fecha de inicio
    SET periodo_year = YEAR(NEW.inicio);
    SET periodo_semester = CASE WHEN MONTH(NEW.inicio) <= 6 THEN 1 ELSE 2 END;
    SET NEW.periodo = CONCAT(periodo_year, '-', periodo_semester);
    
    -- Calcular la fecha de fin si no se especifica
    IF NEW.fin IS NULL OR NEW.fin = '' THEN
        SET NEW.fin = DATE_ADD(NEW.inicio, INTERVAL 4 MONTH);
    END IF;
    
    UPDATE docente
    SET activo = 1
    WHERE idDocente= NEW.docente_idDocente;
END;
//
DELIMITER ;