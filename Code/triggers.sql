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
