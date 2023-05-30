CREATE DATABASE dbperfiles;
USE dbperfiles;

CREATE TABLE usuarios
(
	idusuario 		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos 		VARCHAR(30)			NOT NULL,
	nombres 			VARCHAR(30)			NOT NULL,
	email 			VARCHAR(120) 		NULL,
	telefono 		CHAR(9) 				NULL,
	nombreusuario	VARCHAR(20)			NOT NULL,
	claveacceso		VARCHAR(90)			NOT NULL,
	nivelacceso		CHAR(3)				NOT NULL, -- ADM = Administrador, SPV = Supervisor, AST = Asistente
	estado			CHAR(1) 				NOT NULL DEFAULT '1',
	create_at 		DATETIME 			NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 			NULL,
	CONSTRAINT uk_nombreusuario_usu UNIQUE (nombreusuario)
)ENGINE = INNODB;

-- Registramos 3 usuarios (cada uno de un nivel)
INSERT INTO usuarios 
	(apellidos, nombres, nombreusuario, claveacceso, nivelacceso)
	VALUES
		('Cárdenas Mejía', 'Katherine', 'katherinecm', 'CLAVE_AQUI', 'ADM'),
		('Mendoza Castro', 'Flor', 'flormc', 'CLAVE_AQUI', 'SPV'),
		('Hernandez Prada', 'Cristina', 'cristinahp', 'CLAVE_AQUI', 'AST');

-- Le actualizamos la clave por SENATI (encriptado)
UPDATE usuarios SET
	claveacceso = '$2y$10$WY.iP85bEYxBMkVBG0jKO.9Q97kEbofLVwJPUT1OAmsDzLXQ8Pcka';

SELECT * FROM usuarios;