CREATE TABLE seriado(
	cods INTEGER NOT NULL PRIMARY KEY,
	titulos CHAR(30) NOT NULL
);

CREATE TABLE lingua(
	codl INTEGER NOT NULL PRIMARY KEY,
	nomel CHAR(15) NOT NULL
);

CREATE TABLE usuario(
	email CHAR(100) NOT NULL PRIMARY KEY,
	nome CHAR(50) NOT NULL,
	datanasc DATE NOT NULL,
	datavinc DATE NOT NULL
);

CREATE TABLE videoepisodio(
	codv INTEGER NOT NULL PRIMARY KEY,
	titulov CHAR(20) NOT NULL,
	pais CHAR(20) NOT NULL,
	tempoduracao INTEGER NOT NULL,
	anoprod INTEGER NOT NULL,
	tipo CHAR(10),
	cods INTEGER REFERENCES seriado(cods),
	temporada INTEGER,
	nroepisodio INTEGER
);

CREATE TABLE assistiu(
	codv INTEGER NOT NULL REFERENCES videoepisodio(codv),
	email CHAR(100) NOT NULL REFERENCES usuario(email),
	adata DATE NOT NULL,
	CONSTRAINT no_duplicate_tags PRIMARY KEY (codv, adata, email)
);

CREATE TABLE dublagem(
	codv INTEGER NOT NULL REFERENCES videoepisodio(codv),
	codl INTEGER NOT NULL REFERENCES lingua(codl),
	PRIMARY KEY (codv, codl)
);

CREATE TABLE legenda (
	codv INTEGER NOT NULL REFERENCES videoepisodio(codv),
	codl INTEGER NOT NULL REFERENCES lingua(codl),
	PRIMARY KEY (codv, codl)
);

