
/****** Object:  Table [dbo].[liens_adefim_entreprise]    Script Date: 06/08/2015 10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [opcaim_extranet].[dbo].[liens_adefim_entreprise](
	[id_adefim] [char](25) NOT NULL,
	[id_entreprise] [char](25) NOT NULL,
	[est_valide] [bit] NOT NULL,
	[est_actif] [bit] NOT NULL,
	[creation_utilisateur][char](25) NOT NULL,
	[creation_date][datetime] NOT NULL,
	[modification_utilisateur][char](25) NULL,
	[modification_date][datetime]  NULL,
 CONSTRAINT [PK_lien_adefim_entreprise] PRIMARY KEY CLUSTERED 
(
	[id_entreprise] ASC,
	[id_adefim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

CREATE INDEX X_ADEFIM ON liens_adefim_entreprise
(id_adefim);
CREATE INDEX X_ENTREPRISE ON liens_adefim_entreprise(id_entreprise);