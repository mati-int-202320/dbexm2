CREATE TABLE CIUDADANO(
	NUMEROIDENTIFICACION INTEGER,
	TIPOIDENTIFICACION VARCHAR(100),
	FECHAEXPEDICION DATE,
	NOMBRES VARCHAR(100),
	PRIMERAPELLIDO VARCHAR(100),
	SEGUNDOAPELLIDO VARCHAR(100),
	CUENTACORREO VARCHAR(100),
	CELULAR INTEGER,
	PRIMARY KEY (NUMEROIDENTIFICACION)
);

CREATE TABLE CARPETA(
	IDCARPETA INTEGER
);

CREATE TABLE OPERADOR(
	IDOPERADOR VARCHAR(50),
	NOMBREOPERADOR VARCHAR(100),
	PRIMARY KEY (IDOPERADOR)
);

CREATE TABLE ENTIDAD(
	IDENTIDAD INTEGER,
	NOMBRE VARCHAR(200),
	TIPOENTIDAD VARCHAR(25),
	PRIMARY KEY (IDENTIDAD)
);

CREATE TABLE PAGQUETEDOCUMENTACION(
	IDPAQUETE INTEGER,
	ENTIDADSOLICITANTE INTEGER,
	PRIMARY KEY (IDPAQUETE),
	FOREIGN KEY (ENTIDADSOLICITANTE) REFERENCES ENTIDAD (IDENTIDAD)
);

CREATE TABLE DOCUMENTO(
	IDDOCUMENTO INTEGER,
	TIPODOCUMENTO VARCHAR(100),
	CONTENIDODOCUMENTO BYTEA,
	ESTADO VARCHAR(100),
	PRIMARY KEY (IDDOCUMENTO)
);

CREATE TABLE SERVICIO(
	IDSERVICIO INTEGER,
	TIPOSERVICIO VARCHAR(20),
	NOMBRE VARCHAR(200),
	DESCRIPCION VARCHAR(350),
	PRIMARY KEY (IDSERVICIO)
);

ALTER TABLE CIUDADANO ADD COLUMN IDOPERADOR VARCHAR(50);
ALTER TABLE CIUDADANO ADD COLUMN CORREOASOCIADO VARCHAR(100);

