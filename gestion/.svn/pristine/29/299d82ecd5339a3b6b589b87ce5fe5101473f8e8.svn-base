USE [opcaim_extranet]
GO
ALTER TABLE [dbo].[user_entreprise] DROP CONSTRAINT [FK_user_entreprise_user_responsable]
GO
ALTER TABLE [dbo].[user_entreprise] DROP CONSTRAINT [FK_user_entreprise_drupal_user]
GO
/****** Object:  Table [dbo].[user_responsable]    Script Date: 02/06/2015 00:18:53 ******/
DROP TABLE [dbo].[user_responsable]
GO
/****** Object:  Table [dbo].[user_entreprise]    Script Date: 02/06/2015 00:18:53 ******/
DROP TABLE [dbo].[user_entreprise]
GO
/****** Object:  Table [dbo].[drupal_user]    Script Date: 02/06/2015 00:18:53 ******/
DROP TABLE [dbo].[drupal_user]
GO
/****** Object:  Table [dbo].[drupal_user]    Script Date: 02/06/2015 00:18:53 ******/
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
 CONSTRAINT [PK_drupal_user] PRIMARY KEY CLUSTERED 
(
  [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_entreprise]    Script Date: 02/06/2015 00:18:53 ******/
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
/****** Object:  Table [dbo].[user_responsable]    Script Date: 02/06/2015 00:18:53 ******/
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
