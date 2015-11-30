ALTER TABLE dbo.drupal_user
  ADD statut int NULL
GO
ALTER TABLE dbo.drupal_user
  ALTER COLUMN civilite CHAR(25)
GO
ALTER TABLE dbo.drupal_user
  ALTER COLUMN fonction CHAR(25)
GO
ALTER TABLE dbo.drupal_user
  ADD CONSTRAINT default_statut DEFAULT 0 FOR statut
GO