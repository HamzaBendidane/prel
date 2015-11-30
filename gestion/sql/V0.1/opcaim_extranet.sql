SET DATEFORMAT YMD
USE [opcaim_extranet]
GO
/****** Object:  Table [dbo].[dgf]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgf](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_ref_esclave_adefim] [char](25) NULL,
  [t_adefim] [nvarchar](max) NULL,
  [montant_total_pec] [decimal](10, 2) NULL,
  [montant_verse] [decimal](10, 2) NULL,
  [numero_demande] [int] NULL,
  [statut] [int] NOT NULL,
  [statut_paiement] [int] NULL,
  [date_synthese] [datetime] NULL,
  [date_envoi_myopca] [datetime] NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [multi_etablissement] [bit] NULL CONSTRAINT [DF_dgf_multi_etablissement]  DEFAULT ((0)),
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_is_delete]  DEFAULT ((0)),
  [etape_demande] [int] NULL,
 CONSTRAINT [PK_dgf] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgf_form_contrat]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_contrat](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_type_contrat] [nvarchar](max) NULL,
  [t_type_contrat_pro] [nvarchar](max) NULL,
  [t_date_debut] [date] NULL,
  [t_date_fin] [date] NULL,
  [t_duree_contrat_mois] [int] NULL,
  [t_duree_essai_jour] [int] NULL,
  [t_duree_hebdo_travail_heure] [int] NULL,
  [t_duree_hebdo_travail_minute] [int] NULL,
  [t_coefficient] [int] NULL,
  [t_convention_collective] [nvarchar](max) NULL,
  [t_groupe] [nvarchar](max) NULL,
  [t_salaire_brut_mensuel] [decimal](10, 2) NULL,
  [t_emploi_occupe] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_contrat_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_form_contrat] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_demande]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_demande](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_nature_demande] [nvarchar](max) NOT NULL,
  [t_nature_formation] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_demande_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_dgf_form_demande] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_formation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_finalite_formation] [nvarchar](max) NULL,
  [t_intitule_formation] [nvarchar](max) NULL,
  [t_num_cqpi] [nvarchar](max) NULL,
  [t_saisie_libre_intitule_formation] [nvarchar](max) NULL,
  [t_reference_interne] [nvarchar](max) NULL,
  [t_intitule_finalite] [nvarchar](max) NULL,
  [t_niveau] [nvarchar](max) NULL,
  [t_date_debut] [date] NULL,
  [t_date_fin] [date] NULL,
  [t_date_examen] [date] NULL,
  [t_duree_jours] [int] NULL,
  [t_duree_heures] [int] NULL,
  [t_duree_totale_heure] [int] NULL,
  [t_duree_ens_gen_heure] [int] NULL,
  [t_duree_acc_heure] [int] NULL,
  [t_formation_interne] [bit] NULL CONSTRAINT [DF_dgf_t_form_formation_formation_interne]  DEFAULT ((0)),
  [t_attestation_formation_interne] [bit] NULL,
  [t_nb_participant] [int] NULL,
  [t_formation_intra_entreprise] [bit] NULL CONSTRAINT [DF_t_dgf_form_formation_formation_intra_entreprise]  DEFAULT ((0)),
  [t_specialite] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_formation_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_form_formation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_formation_repartition]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_formation_repartition](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf_form_formation] [int] NOT NULL,
  [t_annee] [int] NULL,
  [t_repartition_heure] [int] NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_form_formation_repartition_1] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_justificatif]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_justificatif](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_fichier] [nvarchar](max) NULL,
  [t_chemin_fichier] [nvarchar](max) NULL,
  [t_nom_ref_fichier] [nvarchar](max) NULL,
  [t_nom_fichier] [nvarchar](max) NULL,
  [t_repertoire_fichier] [nvarchar](max) NULL,
  [t_obligatoire] [bit] NULL CONSTRAINT [DF_t_dgf_justificatif_obligatoire]  DEFAULT ((0)),
  [t_extension_fichier] [nchar](10) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_justificatif_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_justificatif] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_justificatif_paiement]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_justificatif_paiement](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_fichier] [nvarchar](max) NULL,
  [t_chemin_fichier] [nvarchar](max) NULL,
  [t_nom_ref_fichier] [nvarchar](max) NULL,
  [t_nom_fichier] [nvarchar](max) NULL,
  [t_repertoire_fichier] [nvarchar](max) NULL,
  [t_obligatoire] [bit] NULL CONSTRAINT [DF_dgf_form_justificatif_paiement_t_obligatoire]  DEFAULT ((0)),
  [t_extension_fichier] [nchar](10) NULL,
  [date_creation] [date] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [date] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [date] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_justificatif_paiement_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_justificatif_paiement] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_organisme_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_organisme_formation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_siret] [nvarchar](max) NULL,
  [t_numero_declaration] [nvarchar](max) NULL,
  [t_raison_sociale] [nvarchar](max) NULL,
  [t_numero_adresse] [nvarchar](max) NULL,
  [t_rue] [nvarchar](max) NULL,
  [t_complement_rue] [nvarchar](max) NULL,
  [t_code_postal] [nvarchar](max) NULL,
  [t_ville] [nvarchar](max) NULL,
  [t_pays] [nvarchar](max) NULL,
  [t_telephone] [nvarchar](max) NULL,
  [t_email] [nvarchar](max) NULL,
  [t_assujetti_tva] [bit] NULL,
  [t_numero_tva] [nvarchar](max) NULL,
  [t_contact_nom] [nvarchar](max) NULL,
  [t_contact_prenom] [nvarchar](max) NULL,
  [t_contact_fonction] [nvarchar](max) NULL,
  [t_contact_email] [nvarchar](max) NULL,
  [t_contact_telephone] [nvarchar](max) NULL,
  [t_cout_pedagogique] [decimal](10, 2) NULL,
  [t_evaluation_preformative] [decimal](10, 2) NULL,
  [t_passage_certification] [decimal](10, 2) NULL,
  [t_paiement_direct] [bit] NULL,
  [t_cout_prestation] [decimal](10, 2) NULL,
  [t_ratio_cout_duree] [decimal](10, 2) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_organisme_formation_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_form_organisme_formation_1] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_salarie]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_salarie](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_entreprise] [nvarchar](max) NULL,
  [t_entreprise_numero_rue] [nvarchar](max) NULL,
  [t_entreprise_rue] [nvarchar](max) NULL,
  [t_entreprise_complement_rue] [nvarchar](max) NULL,
  [t_entreprise_code_postal] [int] NULL,
  [t_entreprise_ville] [nvarchar](max) NULL,
  [t_entreprise_telephone] [nvarchar](max) NULL,
  [t_entreprise_fax] [nvarchar](max) NULL,
  [t_entreprise_email] [nvarchar](max) NULL,
  [t_nom] [nvarchar](max) NULL,
  [t_prenom] [nvarchar](max) NULL,
  [t_date_naissance] [date] NULL,
  [t_age] [int] NULL,
  [t_sexe] [bit] NULL,
  [t_travailleur_handicape] [bit] NULL,
  [t_numero_rue] [nvarchar](max) NULL,
  [t_rue] [nvarchar](max) NULL,
  [t_complement_rue] [nvarchar](max) NULL,
  [t_code_postal] [int] NULL,
  [t_ville] [nvarchar](max) NULL,
  [t_telephone] [nvarchar](max) NULL,
  [t_email] [nvarchar](max) NULL,
  [t_derniere_situation] [nvarchar](max) NULL,
  [t_caisse_retraite] [nvarchar](max) NULL,
  [t_caisse_prevoyance] [nvarchar](max) NULL,
  [t_diplome] [nvarchar](max) NULL,
  [t_beneficiaire_minimas_sociaux] [nvarchar](max) NULL,
  [t_numero_pole_emploi] [nvarchar](max) NULL,
  [t_nombre_mois_inscrit_pole_emploi] [int] NULL,
  [t_salaire_horaire_brut] [decimal](10, 2) NULL,
  [t_salaire_horaire_net] [decimal](10, 2) NULL,
  [t_cout_pedagogique] [decimal](10, 2) NULL,
  [t_cout_evaluation_preformative] [decimal](10, 2) NULL,
  [t_frais_transport] [decimal](10, 2) NULL,
  [t_frais_repas] [decimal](10, 2) NULL,
  [t_nb_repas] [int] NULL,
  [t_frais_nuitee] [decimal](10, 2) NULL,
  [t_nb_nuitee] [int] NULL,
  [t_mobilisation_cpf] [bit] NULL CONSTRAINT [DF_dgf_form_salarie_mobilisation_cpf_1]  DEFAULT ((0)),
  [t_heure_cpf] [int] NULL,
  [t_numero_securite_sociale] [nvarchar](max) NULL,
  [t_duree_action] [decimal](10, 2) NULL,
  [t_duree_action_tt] [decimal](10, 2) NULL,
  [t_duree_action_htt] [decimal](10, 2) NULL,
  [t_duree_eval_preformative_heure] [int] NULL,
  [t_duree_eval_preformative_minute] [int] NULL,
  [t_particularite] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_salarie_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_form_salarie] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_tuteur]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_tuteur](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [t_etablissement] [nvarchar](max) NULL,
  [t_nom] [nvarchar](max) NULL,
  [t_prenom] [nvarchar](max) NULL,
  [t_telephone] [nvarchar](max) NULL,
  [t_email] [nvarchar](max) NULL,
  [t_date_naissance] [date] NULL,
  [t_emploi] [nvarchar](max) NULL,
  [t_diplome] [nvarchar](max) NULL,
  [t_nb_salarie_encadre] [int] NULL,
  [t_formation_tuteur] [bit] NOT NULL CONSTRAINT [DF_t_dgf_form_tuteur_formation_tuteur]  DEFAULT ((0)),
  [t_date_formation] [date] NULL,
  [t_duree_formation] [int] NULL,
  [t_nom_organisme] [nvarchar](max) NULL,
  [t_certif_role_tuteur] [bit] NULL CONSTRAINT [DF_t_dgf_form_tuteur_certif_role_tuteur]  DEFAULT ((0)),
  [t_certif_deux_ans_exp] [bit] NULL CONSTRAINT [DF_t_dgf_form_tuteur_certif_deux_ans_exp]  DEFAULT ((0)),
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_tuteur_is_delete_1]  DEFAULT ((0)),
 CONSTRAINT [PK_t_dgf_form_tuteur] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_paiement]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_paiement](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NULL,
  [montant] [decimal](10, 2) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_paiement] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[drupal_user]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[drupal_user](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [civilite] [char](10) NULL,
  [last_name] [nvarchar](max) NULL,
  [first_name] [nvarchar](max) NULL,
  [password] [nvarchar](max) NULL,
  [mail] [nvarchar](max) NULL,
  [fonction] [nvarchar](max) NULL,
  [telephone] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_drupal_user_is_delete]  DEFAULT ((0)),
  [id_user_drupal] [int] NOT NULL,
  [statut] [int] NULL,
 CONSTRAINT [PK_drupal_user] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[habilitation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[habilitation](
  [cle] [char](20) NOT NULL,
  [libelle] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_habilitation] PRIMARY KEY CLUSTERED 
(
  [cle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lien_dgf_ref_esclave_entreprise]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lien_dgf_ref_esclave_entreprise](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_esclave_entreprise] [char](25) NOT NULL,
  [t_numero_adherent] [nvarchar](max) NULL,
  [t_raison_sociale] [nvarchar](max) NULL,
  [t_siret] [nvarchar](max) NULL,
  [t_nom_demandeur] [nvarchar](max) NULL,
  [numero_myopca] [int] NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_lien_dgf_ref_esclave_entreprise_is_delete]  DEFAULT ((0)),
  [t_entreprise_ville] [nvarchar](max) NULL,
  [t_code_naf] [nvarchar](max) NULL,
  [t_convention_collective] [nvarchar](max) NULL,
  [t_effectif] [nvarchar](max) NULL,
  [t_code_idcc] [nvarchar](max) NULL,
 CONSTRAINT [PK_lien_dgf_ref_esclave_entreprise] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lien_drupal_user_habilitation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lien_drupal_user_habilitation](
  [id_drupal_user] [int] NOT NULL,
  [id_habilitation] [char](20) NOT NULL,
 CONSTRAINT [PK_lien_drupal_user_habilitation] PRIMARY KEY CLUSTERED 
(
  [id_drupal_user] ASC,
  [id_habilitation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lien_ref_finalite_formation_nature_demande]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_ref_finalite_formation_nature_demande](
  [id_ref_nature_demande] [int] NOT NULL,
  [id_ref_finalite_formation] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lien_ref_nature_demande_ref_justificatif]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_ref_nature_demande_ref_justificatif](
  [id_ref_nature_demande] [int] NOT NULL,
  [id_ref_justificatif] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lien_ref_nature_demande_ref_nature_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_ref_nature_demande_ref_nature_formation](
  [id_ref_nature_demande] [int] NOT NULL,
  [id_ref_nature_formation] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lien_user_autre_entreprise]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lien_user_autre_entreprise](
  [id_user_autre] [int] NOT NULL,
  [id_ref_esclave_entreprise] [char](25) NOT NULL,
  [est_actif] [bit] NOT NULL,
  [est_valide] [bit] NOT NULL,
 CONSTRAINT [PK_lien_user_autre_entreprise] PRIMARY KEY CLUSTERED 
(
  [id_user_autre] ASC,
  [id_ref_esclave_entreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lien_user_entreprise_ref_esclave_entreprise]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lien_user_entreprise_ref_esclave_entreprise](
  [id_user_entreprise] [int] NOT NULL,
  [id_ref_esclave_entreprise] [char](25) NOT NULL,
  [est_valide] [bit] NOT NULL,
  [est_actif] [bit] NOT NULL,
 CONSTRAINT [PK_lien_user_entreprise_ref_esclave_entreprise] PRIMARY KEY CLUSTERED 
(
  [id_user_entreprise] ASC,
  [id_ref_esclave_entreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logs]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logs](
  [id] [int] NOT NULL,
  [date] [datetime] NOT NULL,
  [adresse_ip] [nchar](10) NOT NULL,
  [id_user] [int] NOT NULL,
  [description] [nvarchar](max) NOT NULL,
  [type_objet] [nvarchar](max) NULL,
  [id_object] [int] NULL,
 CONSTRAINT [PK_logs] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_beneficiaire_minimas_sociaux]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_beneficiaire_minimas_sociaux](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_beneficiaire_minimas_sociaux_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_beneficiaire_minimas_sociaux] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_derniere_situation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_derniere_situation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_derniere_situation_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_derniere_situation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_diplome]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_diplome](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_diplome_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_diplome] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_finalite_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_finalite_formation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_intitulé_formation_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_intitulé_formation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_groupe]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_groupe](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_groupe_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_groupe] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_justificatif]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_justificatif](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_justificatif_is_delete]  DEFAULT ((0)),
  [id_ref_nature_demande] [int] NULL,
  [is_mandatory] [bit] NULL,
 CONSTRAINT [PK_ref_justificatif] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_nature_demande]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_nature_demande](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_nature_demande_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_nature_demande] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_nature_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_nature_formation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_ref_nature_formation_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_ref_nature_formation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_nomenclature_fichier_reporting]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_nomenclature_fichier_reporting](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [nom] [nvarchar](max) NOT NULL,
  [pattern_fichier] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_ref_nomenclature_fichier_reporting] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_params]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_params](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [code] [nchar](10) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_type_contrat]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_type_contrat](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [label] [nvarchar](max) NOT NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL,
  [parent] [int] NULL,
  [code] [nchar](10) NULL,
 CONSTRAINT [PK_ref_type_contrat] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_dgf_form_contrat]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_dgf_form_contrat](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_type_contrat] [int] NULL,
  [id_ref_esclave_type_contrat] [char](25) NULL,
  [id_ref_esclave_convention_collective] [char](25) NULL,
  [id_ref_groupe] [int] NULL,
  [date_debut] [date] NULL,
  [date_fin] [date] NULL,
  [duree_contrat_mois] [int] NULL,
  [duree_essai_jour] [int] NULL,
  [duree_hebdo_travail_heure] [int] NULL,
  [duree_hebdo_travail_minute] [int] NULL,
  [coefficient] [int] NULL,
  [salaire_brut_mensuel] [decimal](10, 2) NULL,
  [emploi_occupe] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_contrat_is_delete]  DEFAULT ((0)),
  [niveau] [int] NULL,
 CONSTRAINT [PK_dgf_form_contrat] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_demande]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_dgf_form_demande](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_dgf_nature_demande] [int] NOT NULL,
  [id_dgf_nature_formation] [int] NULL,
 CONSTRAINT [PK_temp_dgf_form_demande] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_dgf_form_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_dgf_form_formation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_finalite_formation] [int] NULL,
  [id_ref_esclave_intitule_formation] [char](25) NULL,
  [id_ref_esclave_niveau] [char](25) NULL,
  [id_ref_esclave_specialite] [char](25) NULL,
  [intitule_finalite] [nvarchar](max) NULL,
  [intitule_formation] [nvarchar](max) NULL,
  [num_cqpi] [int] NULL,
  [reference_interne] [nvarchar](max) NULL,
  [formation_interne] [bit] NULL CONSTRAINT [DF_dgf_form_formation_formation_interne]  DEFAULT ((0)),
  [date_debut] [date] NULL,
  [date_fin] [date] NULL,
  [date_examen] [date] NULL,
  [duree_jours] [int] NULL,
  [duree_heures] [int] NULL,
  [duree_totale_heure] [int] NULL,
  [duree_ens_gen_heure] [int] NULL,
  [duree_acc_heure] [int] NULL,
  [nb_participant] [int] NULL,
  [formation_intra_entreprise] [bit] NULL CONSTRAINT [DF_dgf_form_formation_formation_intra_entreprise]  DEFAULT ((0)),
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_formation_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_dgf_form_formation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_formation_repartition]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_dgf_form_formation_repartition](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf_form_formation] [int] NULL,
  [annee] [int] NULL,
  [repartition_heure] [int] NULL,
 CONSTRAINT [PK_dgf_form_formation_repartition] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_dgf_form_justificatif]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_dgf_form_justificatif](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_justificatifs] [int] NULL,
  [nom_fichier] [nvarchar](max) NULL,
  [chemin_fichier] [nvarchar](max) NULL,
  [repertoire_fichier] [nvarchar](max) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_justificatif_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_dgf_form_justificatif] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_dgf_form_justificatif_paiement]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_dgf_form_justificatif_paiement](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_justificatifs] [int] NULL,
  [nom_fichier] [nvarchar](max) NULL,
  [chemin_fichier] [nvarchar](max) NULL,
  [obligatoire] [bit] NULL,
  [extension_fichier] [nchar](10) NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_form_justificatif_paiement] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_dgf_form_organisme_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_dgf_form_organisme_formation](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_esclave_organisme_formation] [char](25) NOT NULL,
  [id_ref_esclave_contacts_organisme_formation] [char](25) NULL,
  [cout_pedagogique] [decimal](10, 2) NULL,
  [evaluation_preformative] [decimal](10, 2) NULL,
  [passage_certification] [decimal](10, 2) NULL,
  [cout_prestation] [decimal](10, 2) NULL,
  [ratio_cout_duree] [decimal](10, 2) NULL,
  [paiement_direct] [bit] NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_organisme_formation_is_delete]  DEFAULT ((0)),
 CONSTRAINT [PK_dgf_form_organisme_formation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_salarie]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_dgf_form_salarie](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_esclave_salarie] [char](25) NOT NULL,
  [id_ref_esclave_entreprise] [char](25) NULL,
  [id_ref_esclave_particularites] [char](25) NULL,
  [id_ref_beneficiaire_minimas_sociaux] [int] NULL,
  [id_ref_derniere_situation] [int] NULL,
  [id_ref_diplome] [int] NULL,
  [salaire_horaire_brut] [decimal](10, 2) NULL,
  [salaire_horaire_net] [decimal](10, 2) NULL,
  [cout_pedagogique] [decimal](10, 2) NULL,
  [cout_evaluation_preformative] [decimal](10, 2) NULL,
  [frais_transport] [decimal](10, 2) NULL,
  [frais_repas] [decimal](10, 2) NULL,
  [nb_repas] [int] NULL,
  [frais_nuitee] [decimal](10, 2) NULL,
  [nb_nuitee] [int] NULL,
  [mobilisation_cpf] [bit] NULL CONSTRAINT [DF_dgf_form_salarie_mobilisation_cpf]  DEFAULT ((0)),
  [heure_cpf] [int] NULL,
  [numero_securite_sociale] [nvarchar](max) NULL,
  [duree_action] [decimal](10, 2) NULL,
  [duree_action_tt] [decimal](10, 2) NULL,
  [duree_action_htt] [decimal](10, 2) NULL,
  [duree_eval_preformative_heure] [int] NULL,
  [duree_eval_preformative_minute] [int] NULL,
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_salarie_is_delete]  DEFAULT ((0)),
  [numero_rue] [nvarchar](max) NULL,
  [nom_rue] [nvarchar](max) NULL,
  [complement_adresse] [nvarchar](max) NULL,
  [code_postal] [nvarchar](max) NULL,
  [ville] [nvarchar](max) NULL,
  [telephone] [nvarchar](max) NULL,
  [email] [nvarchar](max) NULL,
  [numero_inscrit_pole_emploi] [nvarchar](max) NULL,
  [nombre_mois_inscrit_pole_emploi] [nvarchar](max) NULL,
  [caisse_retraite] [nvarchar](max) NULL,
  [caisse_prevoyance] [nvarchar](max) NULL,
 CONSTRAINT [PK_dgf_form_salarie] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_tuteur]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_dgf_form_tuteur](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_dgf] [int] NOT NULL,
  [id_ref_esclave_salarie] [char](25) NULL,
  [id_ref_esclave_entreprise] [char](25) NULL,
  [id_ref_diplome] [int] NULL,
  [nb_salarie_encadre] [int] NULL,
  [emploi] [nvarchar](max) NULL,
  [formation_tuteur] [bit] NOT NULL CONSTRAINT [DF_dgf_form_tuteur_formation_tuteur]  DEFAULT ((0)),
  [date_formation] [date] NULL,
  [duree_formation] [int] NULL,
  [nom_organisme] [nvarchar](max) NULL,
  [certif_role_tuteur] [bit] NULL CONSTRAINT [DF_dgf_form_tuteur_info_role_tuteur]  DEFAULT ((0)),
  [certif_deux_ans_exp] [bit] NULL CONSTRAINT [DF_dgf_form_tuteur_certif_deux_ans_exp]  DEFAULT ((0)),
  [date_creation] [datetime] NOT NULL,
  [id_user_creation] [int] NOT NULL,
  [date_last_edit] [datetime] NULL,
  [id_user_last_edit] [int] NULL,
  [date_delete] [datetime] NULL,
  [id_user_delete] [int] NULL,
  [is_delete] [bit] NOT NULL CONSTRAINT [DF_dgf_form_tuteur_is_delete]  DEFAULT ((0)),
  [telephone] [nvarchar](max) NULL,
  [email] [nvarchar](max) NULL,
 CONSTRAINT [PK_dgf_form_tuteur] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_autre]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_autre](
  [id] [int] NOT NULL,
  [id_drupal_user] [int] NOT NULL,
 CONSTRAINT [PK_user_autre] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_entreprise]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_entreprise](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [id_user_responsable] [int] NULL,
  [numero_demande] [int] NULL,
  [charte_signe] [bit] NULL CONSTRAINT [DF_user_entreprise_charte_signe]  DEFAULT ((0)),
  [nom_signe] [nvarchar](max) NULL,
  [date_charte_signe] [datetime] NULL,
  [id_drupal_user] [int] NOT NULL,
 CONSTRAINT [PK_user_entreprise] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_organisme_formation]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_organisme_formation](
  [id] [int] NOT NULL,
  [id_ref_esclave_organisme_formation] [char](25) NULL,
  [id_user_responsable] [int] NULL,
  [numero_demande] [int] NULL,
  [charte_signe] [bit] NULL,
  [date_charte_signe] [date] NULL,
  [id_drupal_user] [int] NOT NULL,
 CONSTRAINT [PK_user_organisme_formation] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_responsable]    Script Date: 10/06/2015 16:06:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_responsable](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [civilite] [char](10) NULL,
  [nom] [nvarchar](max) NULL,
  [prenom] [nvarchar](max) NULL,
  [email] [nvarchar](max) NULL,
  [fonction] [nvarchar](max) NULL,
 CONSTRAINT [PK_user_responsable] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[dgf] ON 

GO
INSERT [dbo].[dgf] ([id], [id_ref_esclave_adefim], [t_adefim], [montant_total_pec], [montant_verse], [numero_demande], [statut], [statut_paiement], [date_synthese], [date_envoi_myopca], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [multi_etablissement], [is_delete], [etape_demande]) VALUES (88, NULL, NULL, NULL, NULL, 88, 1, NULL, NULL, NULL, CAST(N'2015-06-01 14:01:03.000' AS DateTime), 1, CAST(N'2015-06-01 15:42:58.000' AS DateTime), 1, NULL, NULL, 0, 0, NULL)
GO
INSERT [dbo].[dgf] ([id], [id_ref_esclave_adefim], [t_adefim], [montant_total_pec], [montant_verse], [numero_demande], [statut], [statut_paiement], [date_synthese], [date_envoi_myopca], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [multi_etablissement], [is_delete], [etape_demande]) VALUES (89, N'INFORMIX.3401            ', N'ADEFIM LANGUEDOC ROUSSILLON (LANR) ', NULL, NULL, 89, 2, NULL, CAST(N'2015-06-02 00:03:27.000' AS DateTime), NULL, CAST(N'2015-06-01 23:41:20.000' AS DateTime), 1, CAST(N'2015-06-02 00:03:27.000' AS DateTime), 1, NULL, NULL, 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[dgf] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_contrat] ON 

GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_contrat] ([id], [id_dgf], [t_type_contrat], [t_type_contrat_pro], [t_date_debut], [t_date_fin], [t_duree_contrat_mois], [t_duree_essai_jour], [t_duree_hebdo_travail_heure], [t_duree_hebdo_travail_minute], [t_coefficient], [t_convention_collective], [t_groupe], [t_salaire_brut_mensuel], [t_emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'0', N'Contrat initial                                                                                                                                                                                                                                                ', CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, N'Cc nationale des établissements privés d''hospitalisation, de                                                                                                                                                                                                   ', N'GR1', CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-01-06 23:42:20.000' AS DateTime), 1, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_contrat] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_demande] ON 

GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_demande] ([id], [id_dgf], [t_nature_demande], [t_nature_formation], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'Contrat de professionnalisation', NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_demande] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_formation] ON 

GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_formation] ([id], [id_dgf], [t_finalite_formation], [t_intitule_formation], [t_num_cqpi], [t_saisie_libre_intitule_formation], [t_reference_interne], [t_intitule_finalite], [t_niveau], [t_date_debut], [t_date_fin], [t_date_examen], [t_duree_jours], [t_duree_heures], [t_duree_totale_heure], [t_duree_ens_gen_heure], [t_duree_acc_heure], [t_formation_interne], [t_attestation_formation_interne], [t_nb_participant], [t_formation_intra_entreprise], [t_specialite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'Certification enregistrée au RNCP', NULL, N'0', N'if1', NULL, NULL, NULL, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, 0, NULL, NULL, 0, NULL, CAST(N'2015-01-06 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_formation] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_justificatif] ON 

GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (8, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (9, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (10, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (11, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (12, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (13, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (14, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (15, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (16, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (17, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (18, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (19, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (20, 89, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Convention de formation', N'logo.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (21, 89, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Programme', N'title.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-01-06 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_justificatif] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_justificatif_paiement] ON 

GO
INSERT [dbo].[dgf_form_justificatif_paiement] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-06-01' AS Date), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif_paiement] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-06-01' AS Date), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif_paiement] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-06-01' AS Date), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif_paiement] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-06-01' AS Date), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif_paiement] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-06-01' AS Date), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_justificatif_paiement] ([id], [id_dgf], [t_fichier], [t_chemin_fichier], [t_nom_ref_fichier], [t_nom_fichier], [t_repertoire_fichier], [t_obligatoire], [t_extension_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'Cerfa signé', N'footer-top.png', N'/48830717/48830717400034/89/demande/', 1, N'          ', CAST(N'2015-06-01' AS Date), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_justificatif_paiement] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_organisme_formation] ON 

GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_organisme_formation] ([id], [id_dgf], [t_siret], [t_numero_declaration], [t_raison_sociale], [t_numero_adresse], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_pays], [t_telephone], [t_email], [t_assujetti_tva], [t_numero_tva], [t_contact_nom], [t_contact_prenom], [t_contact_fonction], [t_contact_email], [t_contact_telephone], [t_cout_pedagogique], [t_evaluation_preformative], [t_passage_certification], [t_paiement_direct], [t_cout_prestation], [t_ratio_cout_duree], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'68201009500060', N'294857593    ', N'Test new OF                        ', N'102       ', N'terrasse boieldieu                 ', N'                                   ', N'92200', N'La défense                    ', NULL, N'0102030405     ', N'baptiste.ferreira+test3@gmail.com                           ', 1, N'             ', N'FERREIRA                      ', N'Baptiste       ', N'Chargé(e) de Mission                                                                                                                                                                                                                                           ', N'baptiste.ferreira+test4@gmail.com                           ', N'0102030405     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, 0, NULL, NULL, CAST(N'2015-01-06 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_organisme_formation] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_salarie] ON 

GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_salarie] ([id], [id_dgf], [t_entreprise], [t_entreprise_numero_rue], [t_entreprise_rue], [t_entreprise_complement_rue], [t_entreprise_code_postal], [t_entreprise_ville], [t_entreprise_telephone], [t_entreprise_fax], [t_entreprise_email], [t_nom], [t_prenom], [t_date_naissance], [t_age], [t_sexe], [t_travailleur_handicape], [t_numero_rue], [t_rue], [t_complement_rue], [t_code_postal], [t_ville], [t_telephone], [t_email], [t_derniere_situation], [t_caisse_retraite], [t_caisse_prevoyance], [t_diplome], [t_beneficiaire_minimas_sociaux], [t_numero_pole_emploi], [t_nombre_mois_inscrit_pole_emploi], [t_salaire_horaire_brut], [t_salaire_horaire_net], [t_cout_pedagogique], [t_cout_evaluation_preformative], [t_frais_transport], [t_frais_repas], [t_nb_repas], [t_frais_nuitee], [t_nb_nuitee], [t_mobilisation_cpf], [t_heure_cpf], [t_numero_securite_sociale], [t_duree_action], [t_duree_action_tt], [t_duree_action_htt], [t_duree_eval_preformative_heure], [t_duree_eval_preformative_minute], [t_particularite], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'2AB                                ', NULL, N'498 AVENUE MARCELIN ALBERT         ', N'', 30730, N'FONS OUTRE GARDON             ', NULL, NULL, NULL, N'stagiaire nom                 ', N'stagiaire préno', CAST(N'1997-06-01' AS Date), 0, 0, 0, N'38', N'rue faidherbe', N'', 75011, N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', N'', N'préovyance', N'Doctorat', NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-01-06 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_salarie] OFF
GO
SET IDENTITY_INSERT [dbo].[dgf_form_tuteur] ON 

GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[dgf_form_tuteur] ([id], [id_dgf], [t_etablissement], [t_nom], [t_prenom], [t_telephone], [t_email], [t_date_naissance], [t_emploi], [t_diplome], [t_nb_salarie_encadre], [t_formation_tuteur], [t_date_formation], [t_duree_formation], [t_nom_organisme], [t_certif_role_tuteur], [t_certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, 89, N'', N'Tuteur nom                    ', N'Tuteur prénom  ', N'0102030405', N'baptiste.ferreira+test5@gmail.com', CAST(N'1980-06-01' AS Date), N'test', NULL, 0, 0, NULL, NULL, N'', 1, 0, CAST(N'2015-01-06 23:53:04.000' AS DateTime), 1, CAST(N'2015-01-06 23:53:09.000' AS DateTime), 1, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[dgf_form_tuteur] OFF
GO
SET IDENTITY_INSERT [dbo].[drupal_user] ON 

GO
INSERT [dbo].[drupal_user] ([id], [civilite], [last_name], [first_name], [password], [mail], [fonction], [telephone], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_user_drupal], [statut]) VALUES (29, N'M.        ', N'Ferreira90', N'Baptiste90', NULL, N'baptiste.ferreira+90@gmail.com', N'Fonction90', N'Téléphone 90', CAST(N'2015-06-01 00:00:00.000' AS DateTime), 0, CAST(N'2015-06-03 12:14:42.000' AS DateTime), 1, NULL, NULL, 0, 68, 1)
GO
INSERT [dbo].[drupal_user] ([id], [civilite], [last_name], [first_name], [password], [mail], [fonction], [telephone], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_user_drupal], [statut]) VALUES (30, N'Mle       ', N'vds', N'vds', NULL, N'baptiste.ferreira+89@gmail.com', N'vds', N'vds', CAST(N'2015-06-01 23:11:42.000' AS DateTime), 0, NULL, NULL, NULL, NULL, 0, 71, 0)
GO
INSERT [dbo].[drupal_user] ([id], [civilite], [last_name], [first_name], [password], [mail], [fonction], [telephone], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_user_drupal], [statut]) VALUES (31, N'M.        ', N'Ferreira93', N'Baptiste93', NULL, N'baptiste.ferreira+92@gmail.com', N'CP93', N'0147754043', CAST(N'2015-06-01 23:20:30.000' AS DateTime), 0, CAST(N'2015-06-02 18:22:57.000' AS DateTime), 1, NULL, NULL, 0, 73, 1)
GO
SET IDENTITY_INSERT [dbo].[drupal_user] OFF
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'ACC_REP             ', N'Accéder aux reporting')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'GES_CON_FPC         ', N'Gérer les contributions FPC (formation professionnelle continue)')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'GES_CON_TA          ', N'Gérer les contributions TA (taxe apprentissage)')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'SAI_DGF_CP          ', N'Faire une demande Contrat Pro')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'SAI_DGF_TA          ', N'Faire une demande Toutes Actions')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'SUI_DGF_CP          ', N'Accéder à la liste des demandes Contrat Pro')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'SUI_DGF_TA          ', N'Accéder à la liste des demandes Toutes Actions')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'SUI_PAI_CP          ', N'Accéder à la liste des paiements Contrat Pro')
GO
INSERT [dbo].[habilitation] ([cle], [libelle]) VALUES (N'SUI_PAI_TA          ', N'Accéder à la liste des paiements Toutes Actions')
GO
SET IDENTITY_INSERT [dbo].[lien_dgf_ref_esclave_entreprise] ON 

GO
INSERT [dbo].[lien_dgf_ref_esclave_entreprise] ([id], [id_dgf], [id_ref_esclave_entreprise], [t_numero_adherent], [t_raison_sociale], [t_siret], [t_nom_demandeur], [numero_myopca], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [t_entreprise_ville], [t_code_naf], [t_convention_collective], [t_effectif], [t_code_idcc]) VALUES (3, 88, N'INFORMIX.690100004613    ', NULL, NULL, NULL, NULL, NULL, CAST(N'2015-06-01 14:01:03.000' AS DateTime), 1, CAST(N'2015-06-01 15:42:58.000' AS DateTime), 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[lien_dgf_ref_esclave_entreprise] ([id], [id_dgf], [id_ref_esclave_entreprise], [t_numero_adherent], [t_raison_sociale], [t_siret], [t_nom_demandeur], [numero_myopca], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [t_entreprise_ville], [t_code_naf], [t_convention_collective], [t_effectif], [t_code_idcc]) VALUES (4, 89, N'INFORMIX.340100003837    ', NULL, N'2AB                                ', N'48830717400034', NULL, NULL, CAST(N'2015-06-01 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[lien_dgf_ref_esclave_entreprise] OFF
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (29, N'SUI_DGF_CP          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (29, N'SUI_DGF_TA          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (29, N'SUI_PAI_CP          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (29, N'SUI_PAI_TA          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (30, N'GES_CON_TA          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (30, N'SAI_DGF_CP          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (30, N'SAI_DGF_TA          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (30, N'SUI_DGF_CP          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (30, N'SUI_DGF_TA          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (30, N'SUI_PAI_CP          ')
GO
INSERT [dbo].[lien_drupal_user_habilitation] ([id_drupal_user], [id_habilitation]) VALUES (31, N'SUI_DGF_CP          ')
GO
INSERT [dbo].[lien_user_entreprise_ref_esclave_entreprise] ([id_user_entreprise], [id_ref_esclave_entreprise], [est_valide], [est_actif]) VALUES (26, N'H.13                     ', 1, 1)
GO
INSERT [dbo].[lien_user_entreprise_ref_esclave_entreprise] ([id_user_entreprise], [id_ref_esclave_entreprise], [est_valide], [est_actif]) VALUES (26, N'INFORMIX.630100003146    ', 0, 0)
GO
INSERT [dbo].[lien_user_entreprise_ref_esclave_entreprise] ([id_user_entreprise], [id_ref_esclave_entreprise], [est_valide], [est_actif]) VALUES (28, N'H.15                     ', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ON 

GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'RSA       ', N'Revenu de solidarité active', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'ASS       ', N'Allocation de solidarité spécifique', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'AAH       ', N'Allocation pour adulte handicapé', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, N'API       ', N'Allocation de parent isolé', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, CAST(N'2015-05-26 14:12:32.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, N'zz        ', N'ddddd', CAST(N'2015-05-26 11:10:19.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 12:01:05.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, N'fezefz    ', N'aaaaaaaaaaaaaaaa', CAST(N'2015-05-26 11:13:48.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 12:01:05.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, N'aa        ', N'bbbb', CAST(N'2015-05-26 12:29:30.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 12:29:42.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (8, N'rze       ', N'rzqrzzzz', CAST(N'2015-05-26 14:12:44.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 14:13:17.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[ref_beneficiaire_minimas_sociaux] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (9, N'test      ', N'test', CAST(N'2015-05-26 14:13:25.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 14:13:31.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ref_beneficiaire_minimas_sociaux] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_derniere_situation] ON 

GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'1         ', N'Scolaire', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'2         ', N'Jeune bénéficiaire du CIVIS', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'3         ', N'Etudiant', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, N'4         ', N'Contrat d''apprentissage', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, N'5         ', N'Contrat de professionnalisation', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, N'6         ', N'Salarié en contrat aidé : CUI-CIE, CUI-CAE', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (8, N'7         ', N'Stagiaire de la formation professionnelle', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (9, N'8         ', N'Salarié (y compris intérimaires et salariés à temps partiel) ', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (10, N'9         ', N'Personne à la recherche d’un emploi', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (11, N'10        ', N'Inactif', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_derniere_situation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (12, N'          ', N'', CAST(N'2015-05-26 11:55:04.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 14:12:17.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ref_derniere_situation] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_diplome] ON 

GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'10        ', N'Doctorat', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'11        ', N'Master 2 professionnel /DESS/ diplôme grande école', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'12        ', N'Master 2 recherche / DEA', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, N'19        ', N'Autre diplôme ou titre de niveau bac +5 ou plus', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, N'21        ', N'Master 1 professionnel ', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, N'22        ', N'Master 1 général', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, N'23        ', N'Licence professionnelle', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (8, N'24        ', N'Licence générale 
', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (9, N'29        ', N'Autre diplôme ou titre de niveau bac +3 ou 4', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (10, N'31        ', N'Brevet de Technicien Supérieur', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (11, N'32        ', N'Diplôme Universitaire de technologie ', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (12, N'39        ', N'Autre diplôme ou titre de niveau bac +2 
', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (13, N'41        ', N'Baccalauréat professionnel 
', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (14, N'42        ', N'Baccalauréat général ', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (15, N'43        ', N'Baccalauréat technologique ', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (16, N'49        ', N'Autre diplôme ou titre de niveau bac', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (17, N'51        ', N'CAP', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (18, N'52        ', N'BEP
', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (19, N'53        ', N'Mention complémentaire
', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (20, N'59        ', N'Autre diplôme ou titre de niveau CAP/BEP', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (21, N'60        ', N'Aucun diplôme ni titre professionnel', CAST(N'2015-05-13 00:00:00.000' AS DateTime), 1, CAST(N'2015-05-26 18:37:35.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (22, NULL, N'yry', CAST(N'2015-05-26 10:19:29.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (23, N'test      ', N'abbb', CAST(N'2015-05-26 18:33:53.000' AS DateTime), 1, CAST(N'2015-05-26 18:34:00.000' AS DateTime), 1, CAST(N'2015-05-26 18:34:33.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[ref_diplome] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (24, N'nfg       ', N'fezfezbnfg', CAST(N'2015-05-26 18:35:02.000' AS DateTime), 1, CAST(N'2015-05-26 18:35:24.000' AS DateTime), 1, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ref_diplome] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_finalite_formation] ON 

GO
INSERT [dbo].[ref_finalite_formation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'2         ', N'Certificat de qualification professionnelle (CQP)', CAST(N'2015-05-17 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_finalite_formation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'1         ', N'Certification enregistrée au RNCP', CAST(N'2015-05-17 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_finalite_formation] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'3         ', N'Qualification reconnue dans les classifications d’une convention collective nationale', CAST(N'2015-05-17 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ref_finalite_formation] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_groupe] ON 

GO
INSERT [dbo].[ref_groupe] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'GR1       ', N'GR1', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_groupe] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'GR2       ', N'GR2', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_groupe] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'GR3       ', N'GR3', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[ref_groupe] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, N'GR4       ', N'GR4', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ref_groupe] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_justificatif] ON 

GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (1, N'RM1       ', N'Convention de formation', CAST(N'2015-05-21 16:22:36.620' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 1)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (2, N'RM2       ', N'Programme', CAST(N'2015-05-21 16:22:42.497' AS DateTime), 1, CAST(N'2015-05-26 16:15:08.000' AS DateTime), 1, NULL, NULL, 0, 1, 1)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (3, N'RM3       ', N'Cerfa signé', CAST(N'2015-05-21 16:22:49.193' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 1)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (4, N'RC1       ', N'Attestation pôle emploi si demande d''emploi de + de 26 ans', CAST(N'2015-05-21 16:22:54.323' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (5, N'RC2       ', N'Pièce justifiant de l’évaluation pré-formative', CAST(N'2015-05-21 16:22:59.863' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (6, N'RC3       ', N'Attestation MDPH SI Travailleur Handicapé', CAST(N'2015-05-21 16:23:05.670' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (7, N'RC4       ', N'Courrier CQPM', CAST(N'2015-05-21 16:23:13.197' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (8, N'RC5       ', N'Résultat du précédent examen', CAST(N'2015-05-21 16:23:13.197' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, 1, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (10, N'1234567890', N'aaa', CAST(N'2015-05-26 16:20:53.000' AS DateTime), 1, CAST(N'2015-05-26 18:40:30.000' AS DateTime), 1, CAST(N'2015-06-01 23:53:50.000' AS DateTime), 1, 1, 2, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (11, N'test      ', N'aaa', CAST(N'2015-05-26 17:20:20.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-06-01 23:53:59.000' AS DateTime), 1, 1, 4, 1)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (12, N'a         ', N'fezfe', CAST(N'2015-05-26 17:20:32.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-06-01 23:54:02.000' AS DateTime), 1, 1, 4, 0)
GO
INSERT [dbo].[ref_justificatif] ([id], [code], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [id_ref_nature_demande], [is_mandatory]) VALUES (13, N'gre       ', N'gregre', CAST(N'2015-05-26 17:20:46.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-06-01 23:53:55.000' AS DateTime), 1, 1, 6, 0)
GO
SET IDENTITY_INSERT [dbo].[ref_justificatif] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_nature_demande] ON 

GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'Contrat de professionnalisation', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'Action de formation', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, CAST(N'2015-05-26 14:27:43.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'Bilan de compétences', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (4, N'VAE', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (5, N'GPEC', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (6, N'Jury CQPM', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (7, N'yry', CAST(N'2015-05-26 10:19:29.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 14:15:39.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[ref_nature_demande] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (8, N'test', CAST(N'2015-05-26 14:27:50.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 14:27:59.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ref_nature_demande] OFF
GO
SET IDENTITY_INSERT [dbo].[ref_nature_formation] ON 

GO
INSERT [dbo].[ref_nature_formation] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (1, N'Adaptation au poste ou maintien dans l''emploi', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, CAST(N'2015-05-26 14:35:02.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_formation] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (2, N'Développement des compétences', CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[ref_nature_formation] ([id], [label], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (3, N'test', CAST(N'2015-05-26 14:35:08.000' AS DateTime), 1, NULL, NULL, CAST(N'2015-05-26 14:35:14.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ref_nature_formation] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_contrat] ON 

GO
INSERT [dbo].[temp_dgf_form_contrat] ([id], [id_dgf], [id_ref_type_contrat], [id_ref_esclave_type_contrat], [id_ref_esclave_convention_collective], [id_ref_groupe], [date_debut], [date_fin], [duree_contrat_mois], [duree_essai_jour], [duree_hebdo_travail_heure], [duree_hebdo_travail_minute], [coefficient], [salaire_brut_mensuel], [emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [niveau]) VALUES (8, 88, 0, N'1                        ', N'0001                     ', 1, CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, CAST(1600.00 AS Decimal(10, 2)), N'test', CAST(N'2015-06-01 14:01:52.000' AS DateTime), 1, CAST(N'2015-06-01 16:02:27.000' AS DateTime), 1, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[temp_dgf_form_contrat] ([id], [id_dgf], [id_ref_type_contrat], [id_ref_esclave_type_contrat], [id_ref_esclave_convention_collective], [id_ref_groupe], [date_debut], [date_fin], [duree_contrat_mois], [duree_essai_jour], [duree_hebdo_travail_heure], [duree_hebdo_travail_minute], [coefficient], [salaire_brut_mensuel], [emploi_occupe], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [niveau]) VALUES (9, 89, 0, N'1                        ', N'0029                     ', 1, CAST(N'2015-09-01' AS Date), CAST(N'2016-06-30' AS Date), 9, 30, 35, 0, NULL, CAST(1700.00 AS Decimal(10, 2)), N'test', CAST(N'2015-06-01 23:42:20.000' AS DateTime), 1, CAST(N'2015-06-01 23:42:48.000' AS DateTime), 1, NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_contrat] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_demande] ON 

GO
INSERT [dbo].[temp_dgf_form_demande] ([id], [id_dgf], [id_dgf_nature_demande], [id_dgf_nature_formation]) VALUES (2, 88, 1, NULL)
GO
INSERT [dbo].[temp_dgf_form_demande] ([id], [id_dgf], [id_dgf_nature_demande], [id_dgf_nature_formation]) VALUES (3, 89, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_demande] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_formation] ON 

GO
INSERT [dbo].[temp_dgf_form_formation] ([id], [id_dgf], [id_ref_finalite_formation], [id_ref_esclave_intitule_formation], [id_ref_esclave_niveau], [id_ref_esclave_specialite], [intitule_finalite], [intitule_formation], [num_cqpi], [reference_interne], [formation_interne], [date_debut], [date_fin], [date_examen], [duree_jours], [duree_heures], [duree_totale_heure], [duree_ens_gen_heure], [duree_acc_heure], [nb_participant], [formation_intra_entreprise], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (8, 88, 2, N'1                        ', NULL, N'0                        ', NULL, N'if1', 0, NULL, 0, CAST(N'2015-06-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 300, 200, NULL, 0, CAST(N'2015-06-01 14:02:26.000' AS DateTime), 1, CAST(N'2015-06-01 16:02:27.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[temp_dgf_form_formation] ([id], [id_dgf], [id_ref_finalite_formation], [id_ref_esclave_intitule_formation], [id_ref_esclave_niveau], [id_ref_esclave_specialite], [intitule_finalite], [intitule_formation], [num_cqpi], [reference_interne], [formation_interne], [date_debut], [date_fin], [date_examen], [duree_jours], [duree_heures], [duree_totale_heure], [duree_ens_gen_heure], [duree_acc_heure], [nb_participant], [formation_intra_entreprise], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (9, 89, 2, NULL, NULL, N'2                        ', NULL, N'if1', 0, NULL, 0, CAST(N'2015-09-01' AS Date), NULL, CAST(N'2016-06-01' AS Date), NULL, NULL, 500, 400, 100, NULL, 0, CAST(N'2015-06-01 23:42:48.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_formation] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_formation_repartition] ON 

GO
INSERT [dbo].[temp_dgf_form_formation_repartition] ([id], [id_dgf_form_formation], [annee], [repartition_heure]) VALUES (49, 8, 2015, 350)
GO
INSERT [dbo].[temp_dgf_form_formation_repartition] ([id], [id_dgf_form_formation], [annee], [repartition_heure]) VALUES (50, 8, 2016, 150)
GO
INSERT [dbo].[temp_dgf_form_formation_repartition] ([id], [id_dgf_form_formation], [annee], [repartition_heure]) VALUES (51, 9, 2015, 250)
GO
INSERT [dbo].[temp_dgf_form_formation_repartition] ([id], [id_dgf_form_formation], [annee], [repartition_heure]) VALUES (52, 9, 2016, 250)
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_formation_repartition] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_justificatif] ON 

GO
INSERT [dbo].[temp_dgf_form_justificatif] ([id], [id_dgf], [id_ref_justificatifs], [nom_fichier], [chemin_fichier], [repertoire_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (20, 89, 3, N'footer-top.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'/48830717/48830717400034/89/demande/', CAST(N'2015-06-01 23:54:23.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[temp_dgf_form_justificatif] ([id], [id_dgf], [id_ref_justificatifs], [nom_fichier], [chemin_fichier], [repertoire_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (21, 89, 1, N'logo.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'/48830717/48830717400034/89/demande/', CAST(N'2015-06-01 23:54:39.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[temp_dgf_form_justificatif] ([id], [id_dgf], [id_ref_justificatifs], [nom_fichier], [chemin_fichier], [repertoire_fichier], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (22, 89, 2, N'title.png', N'D:/Dev/workspace/opcaim//sites/default/files/opcaim/48830717/48830717400034/89/demande/', N'/48830717/48830717400034/89/demande/', CAST(N'2015-06-01 23:54:47.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_justificatif] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_organisme_formation] ON 

GO
INSERT [dbo].[temp_dgf_form_organisme_formation] ([id], [id_dgf], [id_ref_esclave_organisme_formation], [id_ref_esclave_contacts_organisme_formation], [cout_pedagogique], [evaluation_preformative], [passage_certification], [cout_prestation], [ratio_cout_duree], [paiement_direct], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (10, 88, N'INFORMIX.6201002630      ', N'H.12                     ', CAST(600.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, 0, CAST(N'2015-06-01 14:21:38.000' AS DateTime), 1, CAST(N'2015-06-01 16:04:14.000' AS DateTime), 1, NULL, NULL, 0)
GO
INSERT [dbo].[temp_dgf_form_organisme_formation] ([id], [id_dgf], [id_ref_esclave_organisme_formation], [id_ref_esclave_contacts_organisme_formation], [cout_pedagogique], [evaluation_preformative], [passage_certification], [cout_prestation], [ratio_cout_duree], [paiement_direct], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete]) VALUES (11, 89, N'H.2                      ', N'H.13                     ', CAST(150.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, 0, CAST(N'2015-06-01 23:51:36.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_organisme_formation] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_salarie] ON 

GO
INSERT [dbo].[temp_dgf_form_salarie] ([id], [id_dgf], [id_ref_esclave_salarie], [id_ref_esclave_entreprise], [id_ref_esclave_particularites], [id_ref_beneficiaire_minimas_sociaux], [id_ref_derniere_situation], [id_ref_diplome], [salaire_horaire_brut], [salaire_horaire_net], [cout_pedagogique], [cout_evaluation_preformative], [frais_transport], [frais_repas], [nb_repas], [frais_nuitee], [nb_nuitee], [mobilisation_cpf], [heure_cpf], [numero_securite_sociale], [duree_action], [duree_action_tt], [duree_action_htt], [duree_eval_preformative_heure], [duree_eval_preformative_minute], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [numero_rue], [nom_rue], [complement_adresse], [code_postal], [ville], [telephone], [email], [numero_inscrit_pole_emploi], [nombre_mois_inscrit_pole_emploi], [caisse_retraite], [caisse_prevoyance]) VALUES (27, 88, N'H.1                      ', N'INFORMIX.690100004613    ', NULL, NULL, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-06-01 14:01:03.000' AS DateTime), 1, CAST(N'2015-06-01 15:42:58.000' AS DateTime), 1, NULL, NULL, 0, N'38', N'rue faidherbe', N'', N'75011', N'Paris', N'', N'baptiste.ferreira@gmail.com', N'', N'', N'', N'prévoyance ')
GO
INSERT [dbo].[temp_dgf_form_salarie] ([id], [id_dgf], [id_ref_esclave_salarie], [id_ref_esclave_entreprise], [id_ref_esclave_particularites], [id_ref_beneficiaire_minimas_sociaux], [id_ref_derniere_situation], [id_ref_diplome], [salaire_horaire_brut], [salaire_horaire_net], [cout_pedagogique], [cout_evaluation_preformative], [frais_transport], [frais_repas], [nb_repas], [frais_nuitee], [nb_nuitee], [mobilisation_cpf], [heure_cpf], [numero_securite_sociale], [duree_action], [duree_action_tt], [duree_action_htt], [duree_eval_preformative_heure], [duree_eval_preformative_minute], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [numero_rue], [nom_rue], [complement_adresse], [code_postal], [ville], [telephone], [email], [numero_inscrit_pole_emploi], [nombre_mois_inscrit_pole_emploi], [caisse_retraite], [caisse_prevoyance]) VALUES (28, 89, N'H.25                     ', N'INFORMIX.340100003837    ', NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-06-01 23:41:20.000' AS DateTime), 1, NULL, NULL, NULL, NULL, 0, N'38', N'rue faidherbe', N'', N'75011', N'Paris', N'', N'baptiste.ferreira+test2@gmail.com', N'', N'', N'', N'préovyance')
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_salarie] OFF
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_tuteur] ON 

GO
INSERT [dbo].[temp_dgf_form_tuteur] ([id], [id_dgf], [id_ref_esclave_salarie], [id_ref_esclave_entreprise], [id_ref_diplome], [nb_salarie_encadre], [emploi], [formation_tuteur], [date_formation], [duree_formation], [nom_organisme], [certif_role_tuteur], [certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [telephone], [email]) VALUES (11, 88, N'H.2                      ', N'INFORMIX.690100004613    ', NULL, 1, N'aaa', 0, NULL, NULL, N'', 1, 1, CAST(N'2015-06-01 16:04:34.000' AS DateTime), 1, CAST(N'2015-06-01 16:04:39.000' AS DateTime), 1, NULL, NULL, 0, N'', N'aa@aa.fr')
GO
INSERT [dbo].[temp_dgf_form_tuteur] ([id], [id_dgf], [id_ref_esclave_salarie], [id_ref_esclave_entreprise], [id_ref_diplome], [nb_salarie_encadre], [emploi], [formation_tuteur], [date_formation], [duree_formation], [nom_organisme], [certif_role_tuteur], [certif_deux_ans_exp], [date_creation], [id_user_creation], [date_last_edit], [id_user_last_edit], [date_delete], [id_user_delete], [is_delete], [telephone], [email]) VALUES (12, 89, N'H.26                     ', N'INFORMIX.340100003837    ', NULL, 0, N'test', 0, NULL, NULL, N'', 1, 1, CAST(N'2015-06-01 23:53:04.000' AS DateTime), 1, CAST(N'2015-06-01 23:53:09.000' AS DateTime), 1, NULL, NULL, 0, N'0102030405', N'baptiste.ferreira+test5@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[temp_dgf_form_tuteur] OFF
GO
SET IDENTITY_INSERT [dbo].[user_entreprise] ON 

GO
INSERT [dbo].[user_entreprise] ([id], [id_user_responsable], [numero_demande], [charte_signe], [nom_signe], [date_charte_signe], [id_drupal_user]) VALUES (26, 26, 4, 0, N'Baptiste Ferreira', CAST(N'2015-06-01 00:00:00.000' AS DateTime), 29)
GO
INSERT [dbo].[user_entreprise] ([id], [id_user_responsable], [numero_demande], [charte_signe], [nom_signe], [date_charte_signe], [id_drupal_user]) VALUES (27, 27, 5, 1, N'Baptiste89 Ferreira89', CAST(N'2015-06-01 23:13:56.000' AS DateTime), 30)
GO
INSERT [dbo].[user_entreprise] ([id], [id_user_responsable], [numero_demande], [charte_signe], [nom_signe], [date_charte_signe], [id_drupal_user]) VALUES (28, 28, 6, 1, N'Baptiste Ferreira 92', CAST(N'2015-06-01 23:24:10.000' AS DateTime), 31)
GO
SET IDENTITY_INSERT [dbo].[user_entreprise] OFF
GO
SET IDENTITY_INSERT [dbo].[user_responsable] ON 

GO
INSERT [dbo].[user_responsable] ([id], [civilite], [nom], [prenom], [email], [fonction]) VALUES (26, N'M.        ', N'Fer', N'Ba', N'baptiste.ferreira@gmail.com', N'test')
GO
INSERT [dbo].[user_responsable] ([id], [civilite], [nom], [prenom], [email], [fonction]) VALUES (27, N'M.        ', N'vds', N'vds', N'baptiste.ferreira@gmail.com', N'vds')
GO
INSERT [dbo].[user_responsable] ([id], [civilite], [nom], [prenom], [email], [fonction]) VALUES (28, N'M.        ', N'Ferreira', N'Baptiste', N'baptiste.ferreira@gmail.com', N'fonction')
GO
SET IDENTITY_INSERT [dbo].[user_responsable] OFF
GO
ALTER TABLE [dbo].[dgf_form_formation_repartition] ADD  CONSTRAINT [DF_dgf_form_formation_repartition_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_paiement] ADD  CONSTRAINT [DF_dgf_paiement_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[ref_nomenclature_fichier_reporting] ADD  CONSTRAINT [DF_ref_nomenclature_fichier_reporting_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[ref_params] ADD  CONSTRAINT [DF_ref_params_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[ref_type_contrat] ADD  CONSTRAINT [DF_ref_type_contrat_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif_paiement] ADD  CONSTRAINT [DF_dgf_form_justificatif_paiement_obligatoire]  DEFAULT ((0)) FOR [obligatoire]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif_paiement] ADD  CONSTRAINT [DF_dgf_form_justificatif_paiement_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[user_organisme_formation] ADD  CONSTRAINT [DF_user_organisme_formation_charte_signe]  DEFAULT ((0)) FOR [charte_signe]
GO
ALTER TABLE [dbo].[dgf_form_contrat]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_contrat_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_contrat] CHECK CONSTRAINT [FK_dgf_form_contrat_dgf]
GO
ALTER TABLE [dbo].[dgf_form_demande]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_demande_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_demande] CHECK CONSTRAINT [FK_dgf_form_demande_dgf]
GO
ALTER TABLE [dbo].[dgf_form_formation]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_formation_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_formation] CHECK CONSTRAINT [FK_dgf_form_formation_dgf]
GO
ALTER TABLE [dbo].[dgf_form_formation_repartition]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_formation_repartition_dgf_form_formation1] FOREIGN KEY([id_dgf_form_formation])
REFERENCES [dbo].[dgf_form_formation] ([id])
GO
ALTER TABLE [dbo].[dgf_form_formation_repartition] CHECK CONSTRAINT [FK_dgf_form_formation_repartition_dgf_form_formation1]
GO
ALTER TABLE [dbo].[dgf_form_justificatif]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_justificatif_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_justificatif] CHECK CONSTRAINT [FK_dgf_form_justificatif_dgf]
GO
ALTER TABLE [dbo].[dgf_form_justificatif_paiement]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_justificatif_paiement_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_justificatif_paiement] CHECK CONSTRAINT [FK_dgf_form_justificatif_paiement_dgf]
GO
ALTER TABLE [dbo].[dgf_form_organisme_formation]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_organisme_formation_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_organisme_formation] CHECK CONSTRAINT [FK_dgf_form_organisme_formation_dgf]
GO
ALTER TABLE [dbo].[dgf_form_salarie]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_salarie_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_salarie] CHECK CONSTRAINT [FK_dgf_form_salarie_dgf]
GO
ALTER TABLE [dbo].[dgf_form_tuteur]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_tuteur_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_form_tuteur] CHECK CONSTRAINT [FK_dgf_form_tuteur_dgf]
GO
ALTER TABLE [dbo].[dgf_paiement]  WITH CHECK ADD  CONSTRAINT [FK_dgf_paiement_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[dgf_paiement] CHECK CONSTRAINT [FK_dgf_paiement_dgf]
GO
ALTER TABLE [dbo].[lien_dgf_ref_esclave_entreprise]  WITH CHECK ADD  CONSTRAINT [FK_lien_dgf_ref_esclave_entreprise_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[lien_dgf_ref_esclave_entreprise] CHECK CONSTRAINT [FK_lien_dgf_ref_esclave_entreprise_dgf]
GO
ALTER TABLE [dbo].[lien_drupal_user_habilitation]  WITH CHECK ADD  CONSTRAINT [FK_lien_drupal_user_habilitation_drupal_user] FOREIGN KEY([id_drupal_user])
REFERENCES [dbo].[drupal_user] ([id])
GO
ALTER TABLE [dbo].[lien_drupal_user_habilitation] CHECK CONSTRAINT [FK_lien_drupal_user_habilitation_drupal_user]
GO
ALTER TABLE [dbo].[lien_drupal_user_habilitation]  WITH CHECK ADD  CONSTRAINT [FK_lien_drupal_user_habilitation_habilitation] FOREIGN KEY([id_habilitation])
REFERENCES [dbo].[habilitation] ([cle])
GO
ALTER TABLE [dbo].[lien_drupal_user_habilitation] CHECK CONSTRAINT [FK_lien_drupal_user_habilitation_habilitation]
GO
ALTER TABLE [dbo].[lien_ref_finalite_formation_nature_demande]  WITH CHECK ADD  CONSTRAINT [FK_lien_ref_finalite_formation_nature_demande_ref_finalite_formation] FOREIGN KEY([id_ref_finalite_formation])
REFERENCES [dbo].[ref_finalite_formation] ([id])
GO
ALTER TABLE [dbo].[lien_ref_finalite_formation_nature_demande] CHECK CONSTRAINT [FK_lien_ref_finalite_formation_nature_demande_ref_finalite_formation]
GO
ALTER TABLE [dbo].[lien_ref_finalite_formation_nature_demande]  WITH CHECK ADD  CONSTRAINT [FK_lien_ref_finalite_formation_nature_demande_ref_nature_demande] FOREIGN KEY([id_ref_nature_demande])
REFERENCES [dbo].[ref_nature_demande] ([id])
GO
ALTER TABLE [dbo].[lien_ref_finalite_formation_nature_demande] CHECK CONSTRAINT [FK_lien_ref_finalite_formation_nature_demande_ref_nature_demande]
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_justificatif]  WITH CHECK ADD  CONSTRAINT [FK_lien_ref_nature_demande_ref_justificatif_ref_justificatif] FOREIGN KEY([id_ref_justificatif])
REFERENCES [dbo].[ref_justificatif] ([id])
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_justificatif] CHECK CONSTRAINT [FK_lien_ref_nature_demande_ref_justificatif_ref_justificatif]
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_justificatif]  WITH CHECK ADD  CONSTRAINT [FK_lien_ref_nature_demande_ref_justificatif_ref_nature_demande] FOREIGN KEY([id_ref_nature_demande])
REFERENCES [dbo].[ref_nature_demande] ([id])
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_justificatif] CHECK CONSTRAINT [FK_lien_ref_nature_demande_ref_justificatif_ref_nature_demande]
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_nature_formation]  WITH CHECK ADD  CONSTRAINT [FK_lien_ref_nature_demande_ref_nature_formation_ref_nature_demande] FOREIGN KEY([id_ref_nature_demande])
REFERENCES [dbo].[ref_nature_demande] ([id])
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_nature_formation] CHECK CONSTRAINT [FK_lien_ref_nature_demande_ref_nature_formation_ref_nature_demande]
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_nature_formation]  WITH CHECK ADD  CONSTRAINT [FK_lien_ref_nature_demande_ref_nature_formation_ref_nature_formation] FOREIGN KEY([id_ref_nature_formation])
REFERENCES [dbo].[ref_nature_formation] ([id])
GO
ALTER TABLE [dbo].[lien_ref_nature_demande_ref_nature_formation] CHECK CONSTRAINT [FK_lien_ref_nature_demande_ref_nature_formation_ref_nature_formation]
GO
ALTER TABLE [dbo].[lien_user_autre_entreprise]  WITH CHECK ADD  CONSTRAINT [FK_lien_user_autre_entreprise_user_autre] FOREIGN KEY([id_user_autre])
REFERENCES [dbo].[user_autre] ([id])
GO
ALTER TABLE [dbo].[lien_user_autre_entreprise] CHECK CONSTRAINT [FK_lien_user_autre_entreprise_user_autre]
GO
ALTER TABLE [dbo].[lien_user_entreprise_ref_esclave_entreprise]  WITH CHECK ADD  CONSTRAINT [FK_lien_user_entreprise_ref_esclave_entreprise_user_entreprise] FOREIGN KEY([id_user_entreprise])
REFERENCES [dbo].[user_entreprise] ([id])
GO
ALTER TABLE [dbo].[lien_user_entreprise_ref_esclave_entreprise] CHECK CONSTRAINT [FK_lien_user_entreprise_ref_esclave_entreprise_user_entreprise]
GO
ALTER TABLE [dbo].[temp_dgf_form_contrat]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_contrat_ref_groupe] FOREIGN KEY([id_ref_groupe])
REFERENCES [dbo].[ref_groupe] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_contrat] CHECK CONSTRAINT [FK_dgf_form_contrat_ref_groupe]
GO
ALTER TABLE [dbo].[temp_dgf_form_contrat]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_contrat_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_contrat] CHECK CONSTRAINT [FK_temp_dgf_form_contrat_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_demande]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_demande_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_demande] CHECK CONSTRAINT [FK_temp_dgf_form_demande_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_formation]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_formation_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_formation] CHECK CONSTRAINT [FK_temp_dgf_form_formation_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_formation_repartition]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_formation_repartition_dgf_form_formation] FOREIGN KEY([id_dgf_form_formation])
REFERENCES [dbo].[temp_dgf_form_formation] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_formation_repartition] CHECK CONSTRAINT [FK_dgf_form_formation_repartition_dgf_form_formation]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif]  WITH CHECK ADD  CONSTRAINT [FK_dgf_form_justificatif_ref_justificatif] FOREIGN KEY([id_ref_justificatifs])
REFERENCES [dbo].[ref_justificatif] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif] CHECK CONSTRAINT [FK_dgf_form_justificatif_ref_justificatif]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_justificatif_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif] CHECK CONSTRAINT [FK_temp_dgf_form_justificatif_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif_paiement]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_justificatif_paiement_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif_paiement] CHECK CONSTRAINT [FK_temp_dgf_form_justificatif_paiement_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_organisme_formation]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_organisme_formation_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_organisme_formation] CHECK CONSTRAINT [FK_temp_dgf_form_organisme_formation_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_salarie_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie] CHECK CONSTRAINT [FK_temp_dgf_form_salarie_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_salarie_ref_beneficiaire_minimas_sociaux] FOREIGN KEY([id_ref_beneficiaire_minimas_sociaux])
REFERENCES [dbo].[ref_beneficiaire_minimas_sociaux] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie] CHECK CONSTRAINT [FK_temp_dgf_form_salarie_ref_beneficiaire_minimas_sociaux]
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_salarie_ref_derniere_situation] FOREIGN KEY([id_ref_derniere_situation])
REFERENCES [dbo].[ref_derniere_situation] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie] CHECK CONSTRAINT [FK_temp_dgf_form_salarie_ref_derniere_situation]
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_salarie_ref_diplome] FOREIGN KEY([id_ref_diplome])
REFERENCES [dbo].[ref_diplome] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie] CHECK CONSTRAINT [FK_temp_dgf_form_salarie_ref_diplome]
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_tuteur_dgf] FOREIGN KEY([id_dgf])
REFERENCES [dbo].[dgf] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur] CHECK CONSTRAINT [FK_temp_dgf_form_tuteur_dgf]
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur]  WITH CHECK ADD  CONSTRAINT [FK_temp_dgf_form_tuteur_ref_diplome] FOREIGN KEY([id_ref_diplome])
REFERENCES [dbo].[ref_diplome] ([id])
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur] CHECK CONSTRAINT [FK_temp_dgf_form_tuteur_ref_diplome]
GO
ALTER TABLE [dbo].[user_autre]  WITH CHECK ADD  CONSTRAINT [FK_user_autre_drupal_user] FOREIGN KEY([id_drupal_user])
REFERENCES [dbo].[drupal_user] ([id])
GO
ALTER TABLE [dbo].[user_autre] CHECK CONSTRAINT [FK_user_autre_drupal_user]
GO
ALTER TABLE [dbo].[user_entreprise]  WITH CHECK ADD  CONSTRAINT [FK_user_entreprise_drupal_user] FOREIGN KEY([id_drupal_user])
REFERENCES [dbo].[drupal_user] ([id])
GO
ALTER TABLE [dbo].[user_entreprise] CHECK CONSTRAINT [FK_user_entreprise_drupal_user]
GO
ALTER TABLE [dbo].[user_entreprise]  WITH CHECK ADD  CONSTRAINT [FK_user_entreprise_user_responsable] FOREIGN KEY([id_user_responsable])
REFERENCES [dbo].[user_responsable] ([id])
GO
ALTER TABLE [dbo].[user_entreprise] CHECK CONSTRAINT [FK_user_entreprise_user_responsable]
GO
ALTER TABLE [dbo].[user_organisme_formation]  WITH CHECK ADD  CONSTRAINT [FK_user_organisme_formation_drupal_user] FOREIGN KEY([id_drupal_user])
REFERENCES [dbo].[drupal_user] ([id])
GO
ALTER TABLE [dbo].[user_organisme_formation] CHECK CONSTRAINT [FK_user_organisme_formation_drupal_user]
GO
ALTER TABLE [dbo].[user_organisme_formation]  WITH CHECK ADD  CONSTRAINT [FK_user_organisme_formation_user_responsable] FOREIGN KEY([id_user_responsable])
REFERENCES [dbo].[user_responsable] ([id])
GO
ALTER TABLE [dbo].[user_organisme_formation] CHECK CONSTRAINT [FK_user_organisme_formation_user_responsable]
GO
SET DATEFORMAT DMY