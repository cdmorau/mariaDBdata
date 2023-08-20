
CREATE DATABASE sia_ing
USE `sia_ing`;

DROP TABLE IF EXISTS `calificaciones` ;
DROP TABLE IF EXISTS `grupo` ;
DROP TABLE IF EXISTS `docente` ;
DROP TABLE IF EXISTS `curso` ;
DROP TABLE IF EXISTS `estudiante` ;
DROP TABLE IF EXISTS `facultad` ;



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

CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `facultad_idFacultad` BIGINT(20) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `activo` BOOLEAN NOT NULL DEFAULT 0,
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
  `inicio` DATE NULL,
  `fin` DATE NULL,
  `periodo` VARCHAR(8) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idGrupo`),
  CONSTRAINT `fk_Grupo_Curso1`
    FOREIGN KEY (`curso_idCurso`)
    REFERENCES `curso` (`idCurso`),
  CONSTRAINT `fk_grupo_docente1`
    FOREIGN KEY (`docente_idDocente`)
    REFERENCES `docente` (`idDocente`)
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





SHOW TABLES FROM `sia_ing`;