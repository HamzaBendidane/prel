CREATE VIEW [dbo].[v_adefims_entreprise_ext]
WITH SCHEMABINDING
AS
	SELECT
	T2.id_entreprise,
	T1.id_adefim,
	T1.siret AS siret_adefim,
	0 AS type_de_demande -- TODO : IMPORT CMV FILE
	FROM dbo.antennes AS T1
	INNER JOIN dbo.liens_antenne_entreprise AS T2 ON T2.id_antenne = T1.id
	AND (T2.est_valide = T2.est_actif) OR (T2.est_valide = 0 AND T2.est_actif = 1)
GO