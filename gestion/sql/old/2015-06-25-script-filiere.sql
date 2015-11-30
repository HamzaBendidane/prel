/* Pour éviter les problèmes éventuels de perte de données, passez attentivement ce script en revue avant de l'exécuter en dehors du contexte du Concepteur de bases de données.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ref_filiere
  (
  id int NOT NULL IDENTITY (1, 1),
  label nvarchar(MAX) NOT NULL,
  date_creation datetime NOT NULL,
  id_user_creation int NOT NULL,
  date_last_edit datetime NULL,
  id_user_last_edit int NULL,
  date_delete datetime NULL,
  id_user_delete int NULL,
  is_delete bit NOT NULL
  )  ON [PRIMARY]
   TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.ref_filiere ADD CONSTRAINT
  DF_ref_filiere_is_delete DEFAULT ((0)) FOR is_delete
GO
ALTER TABLE dbo.ref_filiere ADD CONSTRAINT
  PK_ref_filiere PRIMARY KEY CLUSTERED 
  (
  id
  ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ref_filiere SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
