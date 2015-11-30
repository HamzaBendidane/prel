/****** Object:  Table [dbo].[lien_user_entreprise_ref_esclave_entreprise]    Script Date: 07/08/2015 16:25:40 ******/
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
CREATE INDEX X_USER ON lien_user_entreprise_ref_esclave_entreprise
(id_user_entreprise)
CREATE INDEX X_CPS_ENTREPRIS ON lien_user_entreprise_ref_esclave_entreprise(id_ref_esclave_entreprise)


