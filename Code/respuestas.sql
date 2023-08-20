-- ¿Cuantos Docentes hay activos en la facultad de ingeniería?
-- La columna activos se actualiza de manera automática cuando un grupo del periodo actual tiene un docente
SELECT COUNT(*)
FROM docente
WHERE activo = 1
AND facultad_idFacultad = 1;

