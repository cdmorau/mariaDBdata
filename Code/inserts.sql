USE `sia_ing`;


-- PERIODOS
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2010-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2010-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2011-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2011-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2012-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2012-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2013-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2013-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2014-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2014-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2015-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2015-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2016-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2016-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2017-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2017-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2018-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2018-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2019-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2019-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2020-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2020-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2021-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2021-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2022-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2022-2');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2023-1');
INSERT INTO `sia_ing`.`periodo` (`referencia`) VALUES ('2023-2');





-- FACULTADES
INSERT INTO `sia_ing`.`facultad` (`nombre`) VALUES ('Ingeniería');
INSERT INTO `sia_ing`.`facultad` (`nombre`) VALUES ('Medicina');
INSERT INTO `sia_ing`.`facultad` (`nombre`) VALUES ('Humanas');
INSERT INTO `sia_ing`.`facultad` (`nombre`) VALUES ('Ciencias');

-- CURSOS
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('Diferencial', '4');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('Programación', '3');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('Quimica', '3');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('materia 1', '4');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('materia 2', '3');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('materia 3', '2');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('materia 4 ', '4');
INSERT INTO `sia_ing`.`curso` (`nombre`, `creditos`) VALUES ('materia 5', '3');

-- ESTUDIANTES
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('Al1');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al2');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al3');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al4');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al5');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al6');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al7');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al8');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al9');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al10');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al11');
INSERT INTO `sia_ing`.`estudiante` (`nombre`) VALUES ('al12');

-- DOCENTE
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p0');
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p01');
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p02');
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p03');
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('2', 'p1' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('2', 'p2' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('3', 'p3' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('3', 'p4' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('4', 'p5' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('4', 'p6' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p7' );
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p8' );


-- GRUPOS
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('1', '1',28);
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('2', '1',28);
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('3', '1',28);
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`,`periodo_idPeriodo`) VALUES ('4', '1',28);


-- Calificaciones

INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('1', '1', '39');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('2', '1', '45');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('3', '1', '23');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('4', '1', '36');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('5', '1', '43');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('6', '1', '34');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('7', '2', '20');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('8', '2', '25');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('9', '2', '15');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('11', '3', '40');
INSERT INTO `sia_ing`.`calificaciones` (`estudiante_idEstudiante`, `grupo_idGrupo`, `notaFinal`) VALUES ('12', '3', '45');
