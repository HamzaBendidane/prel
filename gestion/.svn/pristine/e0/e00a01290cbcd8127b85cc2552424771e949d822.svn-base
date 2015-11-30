USE [opcaim_extranet]
GO

/****** Object:  View [dbo].[v_suivi_demande]    Script Date: 22/07/2015 17:52:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_suivi_demande]
AS
SELECT        dgf.[statut] AS [statut], dgf.[multi_etablissement] AS [multi_etablissement], dgf.[date_creation] AS [date_creation], dgf.[numero_demande] AS [numero_demande], dgf.[date_envoi_myopca] AS [date_envoi_myopca], 
                         dgf.[id] AS [id], dgf.[etape_demande] AS [etape_demande], ree.[id_ref_esclave_entreprise] AS [id_ref_esclave_entreprise], ree.[t_raison_sociale] AS [t_raison_sociale], ree.[t_siret] AS [t_siret], 
                         fd.[t_nature_demande] AS [t_nature_demande], ff.[t_duree_totale_heure] AS [t_duree_totale_heure], ff.[t_date_debut] AS [t_date_debut], ff.[t_date_fin] AS [t_date_fin], ff.[t_nb_participant] AS [t_nb_participant], 
                         CASE WHEN ff.[t_intitule_formation] IS NULL THEN ff.[t_saisie_libre_intitule_formation] ELSE ff.[t_intitule_formation] END AS [t_intitule_formation], fof.[t_raison_sociale] AS [fof_t_raison_sociale], fof.[t_paiement_direct] AS [t_paiement_direct], fof.[t_cout_pedagogique] AS [t_cout_pedagogique], 
                         CONCAT(RTRIM(fs.[t_nom]), ' ', RTRIM(fs.[t_prenom])) AS [t_salarie],null as id_ref_esclave_salarie,null as id_ref_esclave_organisme_formation
FROM            dgf dgf LEFT OUTER JOIN
                         lien_dgf_ref_esclave_entreprise ree ON ree.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_demande fd ON fd.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_formation ff ON ff.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_organisme_formation fof ON fof.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_salarie fs ON fs.id_dgf = dgf.id
WHERE        statut <> 1
UNION
SELECT        dgf.[statut] AS [statut], dgf.[multi_etablissement] AS [multi_etablissement], dgf.[date_creation] AS [date_creation], dgf.[numero_demande] AS [numero_demande], dgf.[date_envoi_myopca] AS [date_envoi_myopca], 
                         dgf.[id] AS [id], dgf.[etape_demande] AS [etape_demande], ree.[id_ref_esclave_entreprise] AS [id_ref_esclave_entreprise], null AS [t_raison_sociale], ree.[t_siret] AS [t_siret], 
                         rnd.[label] AS [nature_demande], tff.[duree_totale_heure] AS [duree_totale_heure], tff.[date_debut] AS [date_debut], tff.[date_fin] AS [date_fin], 
                         tff.[nb_participant] AS [nb_participant],tff.[intitule_formation] AS [intitule_formation], 
                         null AS [fof_raison_sociale], tfof.[paiement_direct] AS [paiement_direct], 
                         tfof.[cout_pedagogique] AS [cout_pedagogique],  null AS [salarie],id_ref_esclave_salarie,id_ref_esclave_organisme_formation
FROM            dgf dgf LEFT OUTER JOIN
                         lien_dgf_ref_esclave_entreprise ree ON ree.id_dgf = dgf.id LEFT OUTER JOIN
                         temp_dgf_form_demande tfd ON tfd.id_dgf = dgf.id LEFT OUTER JOIN
                         ref_nature_demande rnd ON rnd.id = tfd.id_dgf_nature_demande LEFT OUTER JOIN
                         temp_dgf_form_formation tff ON tff.id_dgf = dgf.id LEFT OUTER JOIN
                         temp_dgf_form_organisme_formation tfof ON tfof.id_dgf = dgf.id LEFT OUTER JOIN
                         temp_dgf_form_salarie tfs ON tfs.id_dgf = dgf.id
WHERE        statut = 1
