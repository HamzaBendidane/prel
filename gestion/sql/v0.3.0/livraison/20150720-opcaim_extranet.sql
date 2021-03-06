USE opcaim_extranet
GO
ALTER DATABASE [opcaim_extranet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [opcaim_extranet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [opcaim_extranet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [opcaim_extranet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [opcaim_extranet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [opcaim_extranet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [opcaim_extranet] SET ARITHABORT OFF 
GO
ALTER DATABASE [opcaim_extranet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [opcaim_extranet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [opcaim_extranet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [opcaim_extranet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [opcaim_extranet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [opcaim_extranet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [opcaim_extranet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [opcaim_extranet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [opcaim_extranet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [opcaim_extranet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [opcaim_extranet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [opcaim_extranet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [opcaim_extranet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [opcaim_extranet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [opcaim_extranet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [opcaim_extranet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [opcaim_extranet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [opcaim_extranet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [opcaim_extranet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [opcaim_extranet] SET  MULTI_USER 
GO
ALTER DATABASE [opcaim_extranet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [opcaim_extranet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [opcaim_extranet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [opcaim_extranet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [opcaim_extranet]
GO
/****** Object:  Table [dbo].[dgf]    Script Date: 20/07/2015 14:15:40 ******/
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
	[multi_etablissement] [bit] NULL,
	[is_delete] [bit] NOT NULL,
	[etape_demande] [int] NULL,
 CONSTRAINT [PK_dgf] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgf_form_contrat]    Script Date: 20/07/2015 14:15:40 ******/
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
	[t_duree_contrat_jour] [int] NULL,
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
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_t_dgf_form_contrat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_demande]    Script Date: 20/07/2015 14:15:40 ******/
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
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_form_demande] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
	[t_formation_interne] [bit] NULL,
	[t_attestation_formation_interne] [bit] NULL,
	[t_nb_participant] [int] NULL,
	[t_formation_intra_entreprise] [bit] NULL,
	[t_specialite] [nvarchar](max) NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_t_dgf_form_formation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_formation_repartition]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[dgf_form_justificatif]    Script Date: 20/07/2015 14:15:40 ******/
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
	[t_taille_fichier] [int] NULL,
	[t_obligatoire] [bit] NULL,
	[t_extension_fichier] [nchar](10) NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_t_dgf_justificatif] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_justificatif_paiement]    Script Date: 20/07/2015 14:15:40 ******/
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
	[t_obligatoire] [bit] NULL,
	[t_extension_fichier] [nchar](10) NULL,
	[date_creation] [date] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [date] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [date] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
	[t_taille_fichier] [int] NULL,
 CONSTRAINT [PK_t_dgf_justificatif_paiement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_organisme_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_t_dgf_form_organisme_formation_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_salarie]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgf_form_salarie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_dgf] [int] NOT NULL,
	[t_entreprise] [nvarchar](max) NULL,
	[t_entreprise_rue] [nvarchar](max) NULL,
	[t_entreprise_complement_rue] [nvarchar](max) NULL,
	[t_entreprise_complement_rue_2] [nvarchar](max) NULL,
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
	[t_rue] [nvarchar](max) NULL,
	[t_complement_rue] [nvarchar](max) NULL,
	[t_complement_rue_2] [nvarchar](max) NULL,
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
	[t_mobilisation_cpf] [bit] NULL,
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
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_t_dgf_form_salarie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_form_tuteur]    Script Date: 20/07/2015 14:15:40 ******/
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
	[t_formation_tuteur] [bit] NOT NULL,
	[t_date_formation] [date] NULL,
	[t_duree_formation] [int] NULL,
	[t_nom_organisme] [nvarchar](max) NULL,
	[t_certif_role_tuteur] [bit] NULL,
	[t_certif_deux_ans_exp] [bit] NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_t_dgf_form_tuteur] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dgf_paiement]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[drupal_user]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[drupal_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[civilite] [char](25) NULL,
	[last_name] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[mail] [nvarchar](max) NULL,
	[fonction] [char](25) NULL,
	[telephone] [nvarchar](max) NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[habilitation]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[lien_dgf_ref_esclave_entreprise]    Script Date: 20/07/2015 14:15:40 ******/
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
	[is_delete] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[lien_drupal_user_habilitation]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[lien_ref_finalite_formation_nature_demande]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_ref_finalite_formation_nature_demande](
	[id_ref_nature_demande] [int] NOT NULL,
	[id_ref_finalite_formation] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lien_ref_nature_demande_ref_justificatif]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_ref_nature_demande_ref_justificatif](
	[id_ref_nature_demande] [int] NOT NULL,
	[id_ref_justificatif] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lien_ref_nature_demande_ref_nature_formation]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_ref_nature_demande_ref_nature_formation](
	[id_ref_nature_demande] [int] NOT NULL,
	[id_ref_nature_formation] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lien_user_autre_entreprise]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[lien_user_entreprise_ref_esclave_entreprise]    Script Date: 20/07/2015 14:15:40 ******/
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
	[raison_retrait_id] [tinyint] NULL,
	[raison_retrait_label] [nvarchar](50) NULL,
	[raison_retrait_autre] [nvarchar](max) NULL,
 CONSTRAINT [PK_lien_user_entreprise_ref_esclave_entreprise] PRIMARY KEY CLUSTERED 
(
	[id_user_entreprise] ASC,
	[id_ref_esclave_entreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logs]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[notification]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_creation] [datetime] NOT NULL,
	[date_lecture] [datetime] NULL,
	[lu_notif] [bit] NOT NULL,
	[avec_mail] [bit] NOT NULL,
	[envoi_mail] [bit] NOT NULL,
	[notification_event_id] [int] NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_notifaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_alerte_mail]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_alerte_mail](
	[id_user] [int] NOT NULL,
	[notification_config_id] [int] NOT NULL,
	[alerte_mail] [bit] NULL,
 CONSTRAINT [PK_notification_alerte_mail] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC,
	[notification_config_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_categorie]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_categorie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [nvarchar](max) NULL,
 CONSTRAINT [PK_notification_categorie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_config]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_declenchante] [nvarchar](max) NULL,
	[action_attendue] [nvarchar](max) NULL,
	[code_action] [nvarchar](20) NOT NULL,
	[composants] [nvarchar](max) NULL,
	[notification_categorie_id] [int] NOT NULL,
 CONSTRAINT [PK_notification_config] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_notification_config] UNIQUE NONCLUSTERED 
(
	[code_action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_config_has_destinaire]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_config_has_destinaire](
	[notification_destinaire_id] [int] NOT NULL,
	[notification_config_id] [int] NOT NULL,
 CONSTRAINT [PK_notification_config_has_destinaire] PRIMARY KEY CLUSTERED 
(
	[notification_destinaire_id] ASC,
	[notification_config_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_destinaire]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_destinaire](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [nvarchar](max) NULL,
	[callback] [nvarchar](max) NULL,
 CONSTRAINT [PK_notification_destinaire] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_event]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [nvarchar](max) NULL,
	[statut] [int] NULL,
	[date_creation] [datetime] NOT NULL,
	[notification_config_id] [int] NOT NULL,
 CONSTRAINT [PK_notification_event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_mail]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_mail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_creation] [datetime] NOT NULL,
	[date_envoi] [datetime] NULL,
	[envoi_mail] [bit] NOT NULL,
	[notification_event_id] [int] NOT NULL,
	[destinataire] [nvarchar](max) NULL,
	[destinataire_email] [nvarchar](max) NULL,
 CONSTRAINT [PK_notification_mail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_beneficiaire_minimas_sociaux]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_derniere_situation]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_diplome]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_finalite_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_groupe]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_justificatif]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_nature_demande]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_nature_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_nomenclature_fichier_reporting]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_params]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[ref_type_contrat]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[temp_dgf_form_contrat]    Script Date: 20/07/2015 14:15:40 ******/
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
	[duree_contrat_jour] [int] NULL,
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
	[is_delete] [bit] NOT NULL,
	[niveau] [int] NULL,
 CONSTRAINT [PK_dgf_form_contrat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_demande]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[temp_dgf_form_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
	[num_cqpi] [nvarchar](50) NULL,
	[reference_interne] [nvarchar](max) NULL,
	[formation_interne] [bit] NULL,
	[date_debut] [date] NULL,
	[date_fin] [date] NULL,
	[date_examen] [date] NULL,
	[duree_jours] [int] NULL,
	[duree_heures] [int] NULL,
	[duree_totale_heure] [int] NULL,
	[duree_ens_gen_heure] [int] NULL,
	[duree_acc_heure] [int] NULL,
	[nb_participant] [int] NULL,
	[formation_intra_entreprise] [bit] NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_form_formation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_formation_repartition]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[temp_dgf_form_justificatif]    Script Date: 20/07/2015 14:15:40 ******/
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
	[taille_fichier] [int] NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_form_justificatif] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_dgf_form_justificatif_paiement]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[temp_dgf_form_organisme_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_dgf_form_organisme_formation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_salarie]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_dgf_form_salarie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_dgf] [int] NOT NULL,
	[id_ref_esclave_salarie] [char](25) NULL,
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
	[mobilisation_cpf] [bit] NULL,
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
	[is_delete] [bit] NOT NULL,
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
	[complement_adresse_2] [nvarchar](max) NULL,
 CONSTRAINT [PK_dgf_form_salarie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp_dgf_form_tuteur]    Script Date: 20/07/2015 14:15:40 ******/
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
	[formation_tuteur] [bit] NOT NULL,
	[date_formation] [date] NULL,
	[duree_formation] [int] NULL,
	[nom_organisme] [nvarchar](max) NULL,
	[certif_role_tuteur] [bit] NULL,
	[certif_deux_ans_exp] [bit] NULL,
	[date_creation] [datetime] NOT NULL,
	[id_user_creation] [int] NOT NULL,
	[date_last_edit] [datetime] NULL,
	[id_user_last_edit] [int] NULL,
	[date_delete] [datetime] NULL,
	[id_user_delete] [int] NULL,
	[is_delete] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[user_autre]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[user_entreprise]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_entreprise](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user_responsable] [int] NULL,
	[numero_demande] [int] NULL,
	[charte_signe] [bit] NULL,
	[nom_signe] [nvarchar](max) NULL,
	[date_charte_signe] [datetime] NULL,
	[id_drupal_user] [int] NOT NULL,
 CONSTRAINT [PK_user_entreprise] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_organisme_formation]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  Table [dbo].[user_responsable]    Script Date: 20/07/2015 14:15:40 ******/
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
/****** Object:  View [dbo].[v_dossier]    Script Date: 20/07/2015 14:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_dossier]
AS
SELECT        T0.t_raison_sociale AS employeur_raison_sociale, T1.t_entreprise_rue AS employeur_nom_rue, T1.t_entreprise_numero_rue AS employeur_numero_de_rue, 
                         T1.t_entreprise_complement_rue AS employeur_complement_de_rue, T1.t_entreprise_code_postal AS employeur_code_postal, T1.t_entreprise_ville AS employeur_ville, 
                         T1.t_entreprise_telephone AS employeur_telephone, T1.t_entreprise_fax AS employeur_fax, T1.t_entreprise_email AS employeur_email, T1.t_caisse_retraite AS employeur_caisse_de_retraite, 
                         T1.t_caisse_prevoyance AS employeur_prevoyance, T0.t_siret AS employeur_siret, T0.t_code_naf AS employeur_naf, T0.t_effectif AS employeur_effectif, 
                         T0.t_convention_collective AS employeur_convention_collective, T0.t_code_idcc AS employeur_code_convention_collective, T1.t_nom AS salarie_nom, T1.t_prenom AS salarie_prenom, T1.t_rue AS salarie_rue, 
                         T1.t_complement_rue AS salarie_complement_de_rue, T1.t_code_postal AS salarie_code_postal, T1.t_ville AS salarie_ville, T1.t_telephone AS salarie_telephone, T1.t_email AS salarie_email, 
                         T1.t_date_naissance AS salarie_date_de_naissance, T1.t_sexe AS salarie_sexe, T1.t_travailleur_handicape AS est_salarie_handicape, CASE WHEN T1.t_numero_pole_emploi IS NOT NULL 
                         THEN 1 ELSE 0 END AS est_salarie_inscrit_a_pole_emploi, T1.t_numero_pole_emploi AS salarie_numero_pole_emploi, T1.t_derniere_situation AS salarie_derniere_situation, 
                         T1.t_beneficiaire_minimas_sociaux AS est_salarie_beneficiaire_minimas_sociaux, T1.t_diplome, T2.t_nom, T2.t_prenom, T2.t_emploi, T2.t_date_naissance, T3.t_type_contrat, T3.t_type_contrat_pro, 
                         T3.t_emploi_occupe, T3.t_convention_collective, T3.t_coefficient, T3.t_date_debut, T3.t_date_fin, T3.t_duree_essai_jour, T3.t_duree_hebdo_travail_heure, T3.t_duree_hebdo_travail_minute, 
                         T3.t_salaire_brut_mensuel, T4.t_raison_sociale AS formation_raison_sociale_organisme, T5.t_formation_interne AS est_formation_interne, T5.t_attestation_formation_interne AS formation_attestation, 
                         T4.t_siret AS formation_siret_organisme, T4.t_numero_declaration AS formation_numero_de_declaration_organisme, T5.t_finalite_formation AS formation_, 
                         T5.t_num_cqpi AS formation_type_de_qualification_visee, T5.t_intitule_finalite AS formation_intitule, T5.t_specialite AS formation_specialite, T5.t_duree_acc_heure AS formation_duree_totale_en_heures, 
                         T5.t_duree_ens_gen_heure AS formation_duree_des_enseignements_en_heures, T5.t_date_debut AS formation_date_debut, T5.t_date_examen AS formation_date_examen, 
                         T0.t_entreprise_ville AS formation_ville, T0.t_numero_adherent AS employeur_numero_adherent
FROM            dbo.lien_dgf_ref_esclave_entreprise AS T0 INNER JOIN
                         dbo.dgf AS T6 ON T0.id_dgf = T6.id INNER JOIN
                         dbo.dgf_form_salarie AS T1 ON T6.id = T1.id_dgf INNER JOIN
                         dbo.dgf_form_tuteur AS T2 ON T6.id = T2.id_dgf INNER JOIN
                         dbo.dgf_form_contrat AS T3 ON T6.id = T3.id_dgf INNER JOIN
                         dbo.dgf_form_organisme_formation AS T4 ON T6.id = T4.id_dgf INNER JOIN
                         dbo.dgf_form_formation AS T5 ON T6.id = T5.id_dgf

GO
/****** Object:  View [dbo].[v_suivi_demande]    Script Date: 20/07/2015 14:15:40 ******/
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
                         CONCAT(RTRIM(fs.[t_nom]), ' ', RTRIM(fs.[t_prenom])) AS [t_salarie]
FROM            dgf dgf LEFT OUTER JOIN
                         lien_dgf_ref_esclave_entreprise ree ON ree.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_demande fd ON fd.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_formation ff ON ff.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_organisme_formation fof ON fof.id_dgf = dgf.id LEFT OUTER JOIN
                         dgf_form_salarie fs ON fs.id_dgf = dgf.id
WHERE        statut <> 1
UNION
SELECT        dgf.[statut] AS [statut], dgf.[multi_etablissement] AS [multi_etablissement], dgf.[date_creation] AS [date_creation], dgf.[numero_demande] AS [numero_demande], dgf.[date_envoi_myopca] AS [date_envoi_myopca], 
                         dgf.[id] AS [id], dgf.[etape_demande] AS [etape_demande], ree.[id_ref_esclave_entreprise] AS [id_ref_esclave_entreprise], ent.[raison_sociale] AS [t_raison_sociale], ree.[t_siret] AS [t_siret], 
                         /* tfd.[id_dgf_nature_demande] AS [id_dgf_nature_demande],*/ rnd.[label] AS [nature_demande], tff.[duree_totale_heure] AS [duree_totale_heure], tff.[date_debut] AS [date_debut], tff.[date_fin] AS [date_fin], 
                         tff.[nb_participant] AS [nb_participant], /* tff.[id_ref_esclave_intitule_formation] AS [id_ref_esclave_intitule_formation],*/ tff.[intitule_formation] AS [intitule_formation], 
                         /* tfof.[id_ref_esclave_organisme_formation] AS [id_ref_esclave_organisme_formation],*/ odf.[raison_sociale] AS [fof_raison_sociale], tfof.[paiement_direct] AS [paiement_direct], 
                         tfof.[cout_pedagogique] AS [cout_pedagogique], /* tfs.[id_ref_esclave_salarie] AS [id_ref_esclave_salarie] */ CONCAT(RTRIM(sa.[nom]), ' ', RTRIM(sa.[prenom])) AS [salarie]
FROM            dgf dgf LEFT OUTER JOIN
                         lien_dgf_ref_esclave_entreprise ree ON ree.id_dgf = dgf.id LEFT OUTER JOIN
                         temp_dgf_form_demande tfd ON tfd.id_dgf = dgf.id LEFT OUTER JOIN
                         ref_nature_demande rnd ON rnd.id = tfd.id_dgf_nature_demande LEFT OUTER JOIN
                         temp_dgf_form_formation tff ON tff.id_dgf = dgf.id LEFT OUTER JOIN
                         temp_dgf_form_organisme_formation tfof ON tfof.id_dgf = dgf.id LEFT OUTER JOIN
                         temp_dgf_form_salarie tfs ON tfs.id_dgf = dgf.id LEFT OUTER JOIN
                         [referentiel_3006].[dbo].[salaries] sa ON tfs.id_ref_esclave_salarie = sa.id LEFT OUTER JOIN
                         [referentiel_3006].[dbo].[organismes_de_formation] odf ON tfof.id_ref_esclave_organisme_formation = odf.id LEFT OUTER JOIN
                         [referentiel_3006].[dbo].[entreprises] ent ON ent.id = ree.id_ref_esclave_entreprise
WHERE        statut = 1

GO
ALTER TABLE [dbo].[dgf] ADD  CONSTRAINT [DF_dgf_multi_etablissement]  DEFAULT ((0)) FOR [multi_etablissement]
GO
ALTER TABLE [dbo].[dgf] ADD  CONSTRAINT [DF_dgf_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_contrat] ADD  CONSTRAINT [DF_dgf_form_contrat_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_demande] ADD  CONSTRAINT [DF_dgf_form_demande_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_formation] ADD  CONSTRAINT [DF_dgf_t_form_formation_formation_interne]  DEFAULT ((0)) FOR [t_formation_interne]
GO
ALTER TABLE [dbo].[dgf_form_formation] ADD  CONSTRAINT [DF_t_dgf_form_formation_formation_intra_entreprise]  DEFAULT ((0)) FOR [t_formation_intra_entreprise]
GO
ALTER TABLE [dbo].[dgf_form_formation] ADD  CONSTRAINT [DF_dgf_form_formation_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_formation_repartition] ADD  CONSTRAINT [DF_dgf_form_formation_repartition_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_justificatif] ADD  CONSTRAINT [DF_t_dgf_justificatif_obligatoire]  DEFAULT ((0)) FOR [t_obligatoire]
GO
ALTER TABLE [dbo].[dgf_form_justificatif] ADD  CONSTRAINT [DF_dgf_form_justificatif_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_justificatif_paiement] ADD  CONSTRAINT [DF_dgf_form_justificatif_paiement_t_obligatoire]  DEFAULT ((0)) FOR [t_obligatoire]
GO
ALTER TABLE [dbo].[dgf_form_justificatif_paiement] ADD  CONSTRAINT [DF_dgf_form_justificatif_paiement_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_organisme_formation] ADD  CONSTRAINT [DF_dgf_form_organisme_formation_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_salarie] ADD  CONSTRAINT [DF_dgf_form_salarie_mobilisation_cpf_1]  DEFAULT ((0)) FOR [t_mobilisation_cpf]
GO
ALTER TABLE [dbo].[dgf_form_salarie] ADD  CONSTRAINT [DF_dgf_form_salarie_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_form_tuteur] ADD  CONSTRAINT [DF_t_dgf_form_tuteur_formation_tuteur]  DEFAULT ((0)) FOR [t_formation_tuteur]
GO
ALTER TABLE [dbo].[dgf_form_tuteur] ADD  CONSTRAINT [DF_t_dgf_form_tuteur_certif_role_tuteur]  DEFAULT ((0)) FOR [t_certif_role_tuteur]
GO
ALTER TABLE [dbo].[dgf_form_tuteur] ADD  CONSTRAINT [DF_t_dgf_form_tuteur_certif_deux_ans_exp]  DEFAULT ((0)) FOR [t_certif_deux_ans_exp]
GO
ALTER TABLE [dbo].[dgf_form_tuteur] ADD  CONSTRAINT [DF_dgf_form_tuteur_is_delete_1]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[dgf_paiement] ADD  CONSTRAINT [DF_dgf_paiement_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[drupal_user] ADD  CONSTRAINT [DF_drupal_user_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[drupal_user] ADD  CONSTRAINT [default_statut]  DEFAULT ((0)) FOR [statut]
GO
ALTER TABLE [dbo].[lien_dgf_ref_esclave_entreprise] ADD  CONSTRAINT [DF_lien_dgf_ref_esclave_entreprise_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[notification] ADD  CONSTRAINT [DF__notifacti__lu_no__1758727B]  DEFAULT ((0)) FOR [lu_notif]
GO
ALTER TABLE [dbo].[notification] ADD  CONSTRAINT [DF__notifacti__is_ma__184C96B4]  DEFAULT ((0)) FOR [avec_mail]
GO
ALTER TABLE [dbo].[notification] ADD  CONSTRAINT [DF__notifacti__envoi__1940BAED]  DEFAULT ((0)) FOR [envoi_mail]
GO
ALTER TABLE [dbo].[notification_mail] ADD  DEFAULT ((0)) FOR [envoi_mail]
GO
ALTER TABLE [dbo].[ref_nomenclature_fichier_reporting] ADD  CONSTRAINT [DF_ref_nomenclature_fichier_reporting_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[ref_params] ADD  CONSTRAINT [DF_ref_params_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[ref_type_contrat] ADD  CONSTRAINT [DF_ref_type_contrat_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_contrat] ADD  CONSTRAINT [DF_dgf_form_contrat_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_formation] ADD  CONSTRAINT [DF_dgf_form_formation_formation_interne]  DEFAULT ((0)) FOR [formation_interne]
GO
ALTER TABLE [dbo].[temp_dgf_form_formation] ADD  CONSTRAINT [DF_dgf_form_formation_formation_intra_entreprise]  DEFAULT ((0)) FOR [formation_intra_entreprise]
GO
ALTER TABLE [dbo].[temp_dgf_form_formation] ADD  CONSTRAINT [DF_dgf_form_formation_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif] ADD  CONSTRAINT [DF_dgf_form_justificatif_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif_paiement] ADD  CONSTRAINT [DF_dgf_form_justificatif_paiement_obligatoire]  DEFAULT ((0)) FOR [obligatoire]
GO
ALTER TABLE [dbo].[temp_dgf_form_justificatif_paiement] ADD  CONSTRAINT [DF_dgf_form_justificatif_paiement_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_organisme_formation] ADD  CONSTRAINT [DF_dgf_form_organisme_formation_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie] ADD  CONSTRAINT [DF_dgf_form_salarie_mobilisation_cpf]  DEFAULT ((0)) FOR [mobilisation_cpf]
GO
ALTER TABLE [dbo].[temp_dgf_form_salarie] ADD  CONSTRAINT [DF_dgf_form_salarie_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur] ADD  CONSTRAINT [DF_dgf_form_tuteur_formation_tuteur]  DEFAULT ((0)) FOR [formation_tuteur]
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur] ADD  CONSTRAINT [DF_dgf_form_tuteur_info_role_tuteur]  DEFAULT ((0)) FOR [certif_role_tuteur]
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur] ADD  CONSTRAINT [DF_dgf_form_tuteur_certif_deux_ans_exp]  DEFAULT ((0)) FOR [certif_deux_ans_exp]
GO
ALTER TABLE [dbo].[temp_dgf_form_tuteur] ADD  CONSTRAINT [DF_dgf_form_tuteur_is_delete]  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[user_entreprise] ADD  CONSTRAINT [DF_user_entreprise_charte_signe]  DEFAULT ((0)) FOR [charte_signe]
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
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK_notifaction_notification_event] FOREIGN KEY([notification_event_id])
REFERENCES [dbo].[notification_event] ([id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK_notifaction_notification_event]
GO
ALTER TABLE [dbo].[notification_alerte_mail]  WITH CHECK ADD  CONSTRAINT [FK_notification_abonnement_mail_notification_config] FOREIGN KEY([notification_config_id])
REFERENCES [dbo].[notification_config] ([id])
GO
ALTER TABLE [dbo].[notification_alerte_mail] CHECK CONSTRAINT [FK_notification_abonnement_mail_notification_config]
GO
ALTER TABLE [dbo].[notification_config]  WITH CHECK ADD  CONSTRAINT [FK_notification_config_notification_categorie] FOREIGN KEY([notification_categorie_id])
REFERENCES [dbo].[notification_categorie] ([id])
GO
ALTER TABLE [dbo].[notification_config] CHECK CONSTRAINT [FK_notification_config_notification_categorie]
GO
ALTER TABLE [dbo].[notification_config_has_destinaire]  WITH CHECK ADD  CONSTRAINT [FK_notification_config_has_destinaire_notification_config] FOREIGN KEY([notification_config_id])
REFERENCES [dbo].[notification_config] ([id])
GO
ALTER TABLE [dbo].[notification_config_has_destinaire] CHECK CONSTRAINT [FK_notification_config_has_destinaire_notification_config]
GO
ALTER TABLE [dbo].[notification_config_has_destinaire]  WITH CHECK ADD  CONSTRAINT [FK_notification_config_has_destinaire_notification_destinaire] FOREIGN KEY([notification_destinaire_id])
REFERENCES [dbo].[notification_destinaire] ([id])
GO
ALTER TABLE [dbo].[notification_config_has_destinaire] CHECK CONSTRAINT [FK_notification_config_has_destinaire_notification_destinaire]
GO
ALTER TABLE [dbo].[notification_event]  WITH CHECK ADD  CONSTRAINT [FK_notification_event_notification_config] FOREIGN KEY([notification_config_id])
REFERENCES [dbo].[notification_config] ([id])
GO
ALTER TABLE [dbo].[notification_event] CHECK CONSTRAINT [FK_notification_event_notification_config]
GO
ALTER TABLE [dbo].[notification_mail]  WITH CHECK ADD  CONSTRAINT [FK_notification_mail_notification_event] FOREIGN KEY([notification_event_id])
REFERENCES [dbo].[notification_event] ([id])
GO
ALTER TABLE [dbo].[notification_mail] CHECK CONSTRAINT [FK_notification_mail_notification_event]
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T6"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T3"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 532
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T5"
            Begin Extent = 
               Top = 6
               Left = 817
               Bottom = 136
               Right = 1071
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T4"
            Begin Extent = 
               Top = 138
               Left = 781
               Bottom = 268
               Right = 1007
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T1"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 308
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T2"
            Begin Extent = 
               Top = 270
               Left = 346
               Bottom = 400
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T0"
            Begin Extent = 
               Top = 6
               Left = 570
               Bottom = 136
               Right = 788
            End
            DisplayFlags = 280
            TopColumn = 0
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_dossier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1905
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_dossier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_dossier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_suivi_demande'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_suivi_demande'
GO
USE [master]
GO
ALTER DATABASE [opcaim_extranet] SET  READ_WRITE 
GO
