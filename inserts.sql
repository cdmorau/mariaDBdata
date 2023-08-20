USE `sia_ing`;

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
INSERT INTO `sia_ing`.`docente` (`facultad_idFacultad`, `nombre`) VALUES ('1', 'p0', );
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
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`, `inicio`) VALUES ('1', '1', '2020-03-25');
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`, `inicio`) VALUES ('2', '1', '2021-03-25');
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`, `inicio`) VALUES ('3', '1', '2020-07-25');
INSERT INTO `sia_ing`.`grupo` (`docente_idDocente`, `curso_idCurso`, `inicio`) VALUES ('4', '1', '2020-03-25');
