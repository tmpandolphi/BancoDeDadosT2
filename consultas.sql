--01
SELECT DISTINCT ON(titulov) titulov, lingua.nomel, anoprod FROM videoepisodio
	INNER JOIN dublagem ON dublagem.codv = videoepisodio.codv
	INNER JOIN lingua ON lingua.codl= dublagem.codl
	WHERE cods = 0
	ORDER BY titulov  

--02
SELECT titulos,	videoepisodio.temporada, videoepisodio.nroepisodio, videoepisodio.titulov
	FROM seriado
	INNER JOIN videoepisodio ON videoepisodio.cods = seriado.cods
	WHERE videoepisodio.cods != 0
    ORDER BY titulos
--03
SELECT DISTINCT ON(seriado.titulos) seriado.titulos, COUNT(videoepisodio.nroepisodio) AS contagem
	FROM videoepisodio
	INNER JOIN seriado ON videoepisodio.cods = seriado.cods
	WHERE videoepisodio.cods != 0
	GROUP BY seriado.titulos, videoepisodio.nroepisodio
--04
SELECT titulov, lingua.nomel FROM videoepisodio
    INNER JOIN dublagem ON dublagem.codv = videoepisodio.codv
	INNER JOIN lingua ON lingua.codl = dublagem.codl
	WHERE cods = 0
--05 NAO DEU
SELECT (dublagem.codv), videoepisodio.titulov FROM dublagem 
	INNER JOIN legenda ON legenda.codv = dublagem.codv AND legenda.codl = dublagem.codl

--06
SELECT titulov, temporada, nroepisodio, assistiu.adata, assistiu.email FROM videoepisodio
		INNER JOIN assistiu ON assistiu.codv = videoepisodio.codv AND assistiu.email = 
		(SELECT email FROM usuario 
			WHERE nome = 'Amanda')
				WHERE cods != 0 AND videoepisodio.codv IN 
				(SELECT codv FROM assistiu )
				ORDER BY adata
--07
SELECT titulov, anoprod, tempoduracao, usuario.nome, assistiu.adata FROM videoepisodio
	INNER JOIN assistiu ON assistiu.codv = videoepisodio.codv
	INNER JOIN usuario ON usuario.email = assistiu.email
	WHERE cods != 0 AND videoepisodio.codv IN 
	(SELECT codv FROM legenda
		WHERE codl = 1)
--08
SELECT titulos FROM seriado
	WHERE cods != 0 AND cods NOT IN 
	(SELECT cods FROM videoepisodio
		WHERE codv IN 
		(SELECT codv FROM assistiu
			WHERE email IN
			(SELECT email FROM usuario
				WHERE nome = 'Thales')
		)
	 )

--09
SELECT usuario.nome, COUNT(adata) AS contagem FROM assistiu
	INNER JOIN usuario ON usuario.email = assistiu.email
	GROUP BY usuario.nome
	ORDER BY contagem DESC
	LIMIT 3

--10
SELECT * FROM videoepisodio
    WHERE codv NOT IN 
        (SELECT codv FROM assistiu);