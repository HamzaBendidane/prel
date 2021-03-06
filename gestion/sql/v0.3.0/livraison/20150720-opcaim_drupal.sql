ALTER DATABASE [opcaim_drupal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [opcaim_drupal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [opcaim_drupal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [opcaim_drupal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [opcaim_drupal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [opcaim_drupal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [opcaim_drupal] SET ARITHABORT OFF 
GO
ALTER DATABASE [opcaim_drupal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [opcaim_drupal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [opcaim_drupal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [opcaim_drupal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [opcaim_drupal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [opcaim_drupal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [opcaim_drupal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [opcaim_drupal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [opcaim_drupal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [opcaim_drupal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [opcaim_drupal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [opcaim_drupal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [opcaim_drupal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [opcaim_drupal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [opcaim_drupal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [opcaim_drupal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [opcaim_drupal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [opcaim_drupal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [opcaim_drupal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [opcaim_drupal] SET  MULTI_USER 
GO
ALTER DATABASE [opcaim_drupal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [opcaim_drupal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [opcaim_drupal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [opcaim_drupal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [opcaim_drupal]
GO
/****** Object:  UserDefinedFunction [dbo].[CONCAT]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CONCAT](@op1 sql_variant, @op2 sql_variant) RETURNS nvarchar(4000) AS
BEGIN
  DECLARE @result nvarchar(4000)
  SET @result = CAST(@op1 AS nvarchar(4000)) + CAST(@op2 AS nvarchar(4000))
  RETURN @result
END
GO
/****** Object:  UserDefinedFunction [dbo].[GREATEST]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GREATEST](@op1 real, @op2 real) RETURNS real AS
BEGIN
  DECLARE @result real
  SET @result = CASE WHEN @op1 >= @op2 THEN @op1 ELSE @op2 END
  RETURN @result
END
GO
/****** Object:  UserDefinedFunction [dbo].[IF]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IF](@expr1 sql_variant, @expr2 sql_variant, @expr3 sql_variant) RETURNS sql_variant AS
BEGIN
  DECLARE @result sql_variant
  SET @result = CASE WHEN CAST(@expr1 AS int) != 0 THEN @expr2 ELSE @expr3 END
  RETURN @result
END
GO
/****** Object:  UserDefinedFunction [dbo].[LPAD]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[LPAD](@str nvarchar(max), @len int, @padstr nvarchar(max)) RETURNS nvarchar(4000) AS
BEGIN
  RETURN left(@str + replicate(@padstr,@len),@len);
END
GO
/****** Object:  UserDefinedFunction [dbo].[MD5]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MD5](@value varchar(255)) RETURNS varchar(32) AS
BEGIN
  RETURN SUBSTRING(sys.fn_sqlvarbasetostr(HASHBYTES('MD5', @value)),3,32);
END
GO
/****** Object:  UserDefinedFunction [dbo].[SUBSTRING]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SUBSTRING](@op1 nvarchar(max), @op2 sql_variant, @op3 sql_variant) RETURNS nvarchar(max) AS
BEGIN
  RETURN CAST(SUBSTRING(CAST(@op1 AS nvarchar(max)), CAST(@op2 AS int), CAST(@op3 AS int)) AS nvarchar(max))
END
GO
/****** Object:  UserDefinedFunction [dbo].[SUBSTRING_INDEX]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SUBSTRING_INDEX](@string varchar(8000), @delimiter char(1), @count int) RETURNS varchar(8000) AS
BEGIN
  DECLARE @result varchar(8000)
  DECLARE @end int
  DECLARE @part int
  SET @end = 0
  SET @part = 0
  IF (@count = 0)
  BEGIN
    SET @result = ''
  END
  ELSE
  BEGIN
    IF (@count < 0)
    BEGIN
      SET @string = REVERSE(@string)
    END
    WHILE (@part < ABS(@count))
    BEGIN
      SET @end = CHARINDEX(@delimiter, @string, @end + 1)
      IF (@end = 0)
      BEGIN
        SET @end = LEN(@string) + 1
        BREAK
      END
      SET @part = @part + 1
    END
    SET @result = SUBSTRING(@string, 1, @end - 1)
    IF (@count < 0)
    BEGIN
      SET @result = REVERSE(@result)
    END
  END
  RETURN @result
END
GO
/****** Object:  Table [dbo].[actions]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actions](
	[aid] [nvarchar](255) NOT NULL CONSTRAINT [actions_aid_df]  DEFAULT ('0'),
	[type] [nvarchar](32) NOT NULL CONSTRAINT [actions_type_df]  DEFAULT (''),
	[callback] [nvarchar](255) NOT NULL CONSTRAINT [actions_callback_df]  DEFAULT (''),
	[parameters] [varbinary](max) NOT NULL,
	[label] [nvarchar](255) NOT NULL CONSTRAINT [actions_label_df]  DEFAULT ('0'),
 CONSTRAINT [actions_pkey] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[authmap]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[authmap](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[authname] [nvarchar](128) NOT NULL,
	[module] [nvarchar](128) NOT NULL,
	[__pk] [uniqueidentifier] NOT NULL,
	[__unique_authname]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[authname]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [authmap_pkey] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[batch]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[batch](
	[bid] [int] NOT NULL,
	[token] [nvarchar](64) NOT NULL,
	[timestamp] [int] NOT NULL,
	[batch] [varbinary](max) NULL,
 CONSTRAINT [batch_pkey] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[block]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[block](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[module] [nvarchar](64) NOT NULL CONSTRAINT [block_module_df]  DEFAULT (''),
	[delta] [nvarchar](32) NOT NULL CONSTRAINT [block_delta_df]  DEFAULT ('0'),
	[theme] [nvarchar](64) NOT NULL CONSTRAINT [block_theme_df]  DEFAULT (''),
	[status] [smallint] NOT NULL CONSTRAINT [block_status_df]  DEFAULT ((0)),
	[weight] [int] NOT NULL CONSTRAINT [block_weight_df]  DEFAULT ((0)),
	[region] [nvarchar](64) NOT NULL CONSTRAINT [block_region_df]  DEFAULT (''),
	[custom] [smallint] NOT NULL CONSTRAINT [block_custom_df]  DEFAULT ((0)),
	[visibility] [smallint] NOT NULL CONSTRAINT [block_visibility_df]  DEFAULT ((0)),
	[pages] [nvarchar](max) NOT NULL,
	[title] [nvarchar](255) NOT NULL CONSTRAINT [block_title_df]  DEFAULT (''),
	[cache] [smallint] NOT NULL CONSTRAINT [block_cache_df]  DEFAULT ((1)),
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_tmd]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce((CONVERT([varbinary](max),[theme])+CONVERT([varbinary](max),[module]))+CONVERT([varbinary](max),[delta]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [block_pkey] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[block_custom]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[block_custom](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[body] [nvarchar](max) NULL,
	[info] [nvarchar](128) NOT NULL,
	[format] [nvarchar](255) NULL,
	[__pk] [uniqueidentifier] NOT NULL,
	[__unique_info]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[info]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [block_custom_pkey] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[block_node_type]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block_node_type](
	[module] [nvarchar](64) NOT NULL,
	[delta] [nvarchar](32) NOT NULL,
	[type] [nvarchar](32) NOT NULL,
 CONSTRAINT [block_node_type_pkey] PRIMARY KEY CLUSTERED 
(
	[module] ASC,
	[delta] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[block_role]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block_role](
	[module] [nvarchar](64) NOT NULL,
	[delta] [nvarchar](32) NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [block_role_pkey] PRIMARY KEY CLUSTERED 
(
	[module] ASC,
	[delta] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[blocked_ips]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blocked_ips](
	[iid] [int] IDENTITY(1,1) NOT NULL,
	[ip] [nvarchar](40) NOT NULL,
 CONSTRAINT [blocked_ips_pkey] PRIMARY KEY CLUSTERED 
(
	[iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cache]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_admin_menu]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_admin_menu](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_admin_menu_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_admin_menu_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_admin_menu_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_admin_menu_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_admin_menu_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_block]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_block](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_block_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_bootstrap]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_bootstrap](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_bootstrap_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_bootstrap_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_bootstrap_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_bootstrap_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_bootstrap_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_features]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_features](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_features_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_field]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_field](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_field_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_field_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_field_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_field_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_field_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_filter]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_filter](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_filter_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_form]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_form](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_form_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_image]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_image](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_image_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_l10n_update]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_l10n_update](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_l10n_update_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_menu]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_menu](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_menu_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_menu_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_menu_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_menu_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_menu_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_page]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_page](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_page_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_path]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_path](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_path_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_path_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_path_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_path_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_path_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_token]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_token](
	[cid] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
	[serialized] [smallint] NOT NULL,
 CONSTRAINT [cache_token_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache_update]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache_update](
	[cid] [nvarchar](255) NOT NULL CONSTRAINT [cache_update_cid_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL CONSTRAINT [cache_update_expire_df]  DEFAULT ((0)),
	[created] [int] NOT NULL CONSTRAINT [cache_update_created_df]  DEFAULT ((0)),
	[serialized] [smallint] NOT NULL CONSTRAINT [cache_update_serialized_df]  DEFAULT ((0)),
 CONSTRAINT [cache_update_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ckeditor_input_format]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ckeditor_input_format](
	[name] [nvarchar](128) NOT NULL CONSTRAINT [ckeditor_input_format_name_df]  DEFAULT (''),
	[format] [nvarchar](128) NOT NULL CONSTRAINT [ckeditor_input_format_format_df]  DEFAULT (''),
 CONSTRAINT [ckeditor_input_format_pkey] PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ckeditor_settings]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ckeditor_settings](
	[name] [nvarchar](128) NOT NULL CONSTRAINT [ckeditor_settings_name_df]  DEFAULT (''),
	[settings] [nvarchar](max) NULL,
 CONSTRAINT [ckeditor_settings_pkey] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comment]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[nid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[subject] [nvarchar](64) NOT NULL,
	[hostname] [nvarchar](128) NOT NULL,
	[created] [int] NOT NULL,
	[changed] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[thread] [nvarchar](255) NOT NULL,
	[name] [nvarchar](60) NULL,
	[mail] [nvarchar](64) NULL,
	[homepage] [nvarchar](255) NULL,
	[language] [nvarchar](12) NOT NULL,
 CONSTRAINT [comment_pkey] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[date_format_locale]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[date_format_locale](
	[format] [nvarchar](100) NOT NULL,
	[type] [nvarchar](64) NOT NULL,
	[language] [nvarchar](12) NOT NULL,
 CONSTRAINT [date_format_locale_pkey] PRIMARY KEY CLUSTERED 
(
	[type] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[date_format_type]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[date_format_type](
	[type] [nvarchar](64) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[locked] [smallint] NOT NULL CONSTRAINT [date_format_type_locked_df]  DEFAULT ((0)),
 CONSTRAINT [date_format_type_pkey] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[date_formats]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[date_formats](
	[dfid] [int] IDENTITY(1,1) NOT NULL,
	[format] [nvarchar](100) NOT NULL,
	[type] [nvarchar](64) NOT NULL,
	[locked] [smallint] NOT NULL CONSTRAINT [date_formats_locked_df]  DEFAULT ((0)),
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_formats]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[format])+CONVERT([varbinary](max),[type]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [date_formats_pkey] PRIMARY KEY CLUSTERED 
(
	[dfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[field_config]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[field_config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[field_name] [nvarchar](32) NOT NULL,
	[type] [nvarchar](128) NOT NULL,
	[module] [nvarchar](128) NOT NULL CONSTRAINT [field_config_module_df]  DEFAULT (''),
	[active] [smallint] NOT NULL CONSTRAINT [field_config_active_df]  DEFAULT ((0)),
	[storage_type] [nvarchar](128) NOT NULL,
	[storage_module] [nvarchar](128) NOT NULL CONSTRAINT [field_config_storage_module_df]  DEFAULT (''),
	[storage_active] [smallint] NOT NULL CONSTRAINT [field_config_storage_active_df]  DEFAULT ((0)),
	[locked] [smallint] NOT NULL CONSTRAINT [field_config_locked_df]  DEFAULT ((0)),
	[data] [varbinary](max) NOT NULL,
	[cardinality] [smallint] NOT NULL CONSTRAINT [field_config_cardinality_df]  DEFAULT ((0)),
	[translatable] [smallint] NOT NULL CONSTRAINT [field_config_translatable_df]  DEFAULT ((0)),
	[deleted] [smallint] NOT NULL CONSTRAINT [field_config_deleted_df]  DEFAULT ((0)),
 CONSTRAINT [field_config_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[field_config_instance]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[field_config_instance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[field_id] [int] NOT NULL,
	[field_name] [nvarchar](32) NOT NULL CONSTRAINT [field_config_instance_field_name_df]  DEFAULT (''),
	[entity_type] [nvarchar](32) NOT NULL CONSTRAINT [field_config_instance_entity_type_df]  DEFAULT (''),
	[bundle] [nvarchar](128) NOT NULL CONSTRAINT [field_config_instance_bundle_df]  DEFAULT (''),
	[data] [varbinary](max) NOT NULL,
	[deleted] [smallint] NOT NULL CONSTRAINT [field_config_instance_deleted_df]  DEFAULT ((0)),
 CONSTRAINT [field_config_instance_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[field_data_body]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_data_body](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[body_value] [nvarchar](max) NULL,
	[body_summary] [nvarchar](max) NULL,
	[body_format] [nvarchar](255) NULL,
 CONSTRAINT [field_data_body_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_data_comment_body]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_data_comment_body](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[comment_body_value] [nvarchar](max) NULL,
	[comment_body_format] [nvarchar](255) NULL,
 CONSTRAINT [field_data_comment_body_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_data_field_image]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_data_field_image](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[field_image_fid] [int] NULL,
	[field_image_alt] [nvarchar](512) NULL,
	[field_image_title] [nvarchar](1024) NULL,
	[field_image_width] [int] NULL,
	[field_image_height] [int] NULL,
 CONSTRAINT [field_data_field_image_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_data_field_tags]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_data_field_tags](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[field_tags_tid] [int] NULL,
 CONSTRAINT [field_data_field_tags_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_revision_body]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_revision_body](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NOT NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[body_value] [nvarchar](max) NULL,
	[body_summary] [nvarchar](max) NULL,
	[body_format] [nvarchar](255) NULL,
 CONSTRAINT [field_revision_body_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[revision_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_revision_comment_body]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_revision_comment_body](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NOT NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[comment_body_value] [nvarchar](max) NULL,
	[comment_body_format] [nvarchar](255) NULL,
 CONSTRAINT [field_revision_comment_body_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[revision_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_revision_field_image]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_revision_field_image](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NOT NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[field_image_fid] [int] NULL,
	[field_image_alt] [nvarchar](512) NULL,
	[field_image_title] [nvarchar](1024) NULL,
	[field_image_width] [int] NULL,
	[field_image_height] [int] NULL,
 CONSTRAINT [field_revision_field_image_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[revision_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[field_revision_field_tags]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_revision_field_tags](
	[entity_type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[deleted] [smallint] NOT NULL,
	[entity_id] [int] NOT NULL,
	[revision_id] [int] NOT NULL,
	[language] [nvarchar](32) NOT NULL,
	[delta] [int] NOT NULL,
	[field_tags_tid] [int] NULL,
 CONSTRAINT [field_revision_field_tags_pkey] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC,
	[entity_id] ASC,
	[revision_id] ASC,
	[deleted] ASC,
	[delta] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[file_managed]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[file_managed](
	[fid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL CONSTRAINT [file_managed_uid_df]  DEFAULT ((0)),
	[filename] [nvarchar](255) NOT NULL CONSTRAINT [file_managed_filename_df]  DEFAULT (''),
	[uri] [nvarchar](255) NOT NULL CONSTRAINT [file_managed_uri_df]  DEFAULT (''),
	[filemime] [nvarchar](255) NOT NULL CONSTRAINT [file_managed_filemime_df]  DEFAULT (''),
	[filesize] [bigint] NOT NULL CONSTRAINT [file_managed_filesize_df]  DEFAULT ((0)),
	[status] [smallint] NOT NULL CONSTRAINT [file_managed_status_df]  DEFAULT ((0)),
	[timestamp] [int] NOT NULL CONSTRAINT [file_managed_timestamp_df]  DEFAULT ((0)),
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_uri]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[uri]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [file_managed_pkey] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[file_usage]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[file_usage](
	[fid] [int] NOT NULL,
	[module] [nvarchar](255) NOT NULL,
	[type] [nvarchar](64) NOT NULL,
	[id] [int] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [file_usage_pkey] PRIMARY KEY CLUSTERED 
(
	[fid] ASC,
	[type] ASC,
	[id] ASC,
	[module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[filter]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[filter](
	[format] [nvarchar](255) NOT NULL,
	[module] [nvarchar](64) NOT NULL CONSTRAINT [filter_module_df]  DEFAULT (''),
	[name] [nvarchar](32) NOT NULL CONSTRAINT [filter_name_df]  DEFAULT (''),
	[weight] [int] NOT NULL CONSTRAINT [filter_weight_df]  DEFAULT ((0)),
	[status] [int] NOT NULL CONSTRAINT [filter_status_df]  DEFAULT ((0)),
	[settings] [varbinary](max) NULL,
 CONSTRAINT [filter_pkey] PRIMARY KEY CLUSTERED 
(
	[format] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[filter_format]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[filter_format](
	[format] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL CONSTRAINT [filter_format_name_df]  DEFAULT (''),
	[cache] [smallint] NOT NULL CONSTRAINT [filter_format_cache_df]  DEFAULT ((0)),
	[status] [smallint] NOT NULL CONSTRAINT [filter_format_status_df]  DEFAULT ((1)),
	[weight] [int] NOT NULL CONSTRAINT [filter_format_weight_df]  DEFAULT ((0)),
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_name]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[name]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [filter_format_pkey] PRIMARY KEY CLUSTERED 
(
	[format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[flood]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flood](
	[fid] [int] IDENTITY(1,1) NOT NULL,
	[event] [nvarchar](64) NOT NULL,
	[identifier] [nvarchar](128) NOT NULL,
	[timestamp] [int] NOT NULL,
	[expiration] [int] NOT NULL,
 CONSTRAINT [flood_pkey] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[history]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[uid] [int] NOT NULL,
	[nid] [int] NOT NULL,
	[timestamp] [int] NOT NULL,
 CONSTRAINT [history_pkey] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ife]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ife](
	[form_id] [nvarchar](128) NOT NULL,
	[field_types] [nvarchar](max) NULL,
	[status] [int] NOT NULL CONSTRAINT [ife_status_df]  DEFAULT ((0)),
	[display] [int] NOT NULL CONSTRAINT [ife_display_df]  DEFAULT ((-1)),
 CONSTRAINT [ife_pkey] PRIMARY KEY CLUSTERED 
(
	[form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[image_effects]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[image_effects](
	[ieid] [int] IDENTITY(1,1) NOT NULL,
	[isid] [int] NOT NULL,
	[weight] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NOT NULL,
 CONSTRAINT [image_effects_pkey] PRIMARY KEY CLUSTERED 
(
	[ieid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[image_styles]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[image_styles](
	[isid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[__pk] [uniqueidentifier] NOT NULL,
	[__unique_name]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[name]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [image_styles_pkey] PRIMARY KEY CLUSTERED 
(
	[isid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[l10n_update_file]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[l10n_update_file](
	[project] [nvarchar](50) NOT NULL,
	[language] [nvarchar](12) NOT NULL,
	[type] [nvarchar](50) NOT NULL CONSTRAINT [l10n_update_file_type_df]  DEFAULT (''),
	[filename] [nvarchar](255) NOT NULL CONSTRAINT [l10n_update_file_filename_df]  DEFAULT (''),
	[fileurl] [nvarchar](255) NOT NULL CONSTRAINT [l10n_update_file_fileurl_df]  DEFAULT (''),
	[uri] [nvarchar](255) NOT NULL CONSTRAINT [l10n_update_file_uri_df]  DEFAULT (''),
	[timestamp] [int] NULL CONSTRAINT [l10n_update_file_timestamp_df]  DEFAULT ((0)),
	[version] [nvarchar](128) NOT NULL CONSTRAINT [l10n_update_file_version_df]  DEFAULT (''),
	[status] [int] NOT NULL CONSTRAINT [l10n_update_file_status_df]  DEFAULT ((1)),
	[last_checked] [int] NULL CONSTRAINT [l10n_update_file_last_checked_df]  DEFAULT ((0)),
 CONSTRAINT [l10n_update_file_pkey] PRIMARY KEY CLUSTERED 
(
	[project] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[l10n_update_project]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[l10n_update_project](
	[name] [nvarchar](50) NOT NULL,
	[project_type] [nvarchar](50) NOT NULL,
	[core] [nvarchar](128) NOT NULL CONSTRAINT [l10n_update_project_core_df]  DEFAULT (''),
	[version] [nvarchar](128) NOT NULL CONSTRAINT [l10n_update_project_version_df]  DEFAULT (''),
	[l10n_server] [nvarchar](255) NOT NULL CONSTRAINT [l10n_update_project_l10n_server_df]  DEFAULT (''),
	[l10n_path] [nvarchar](255) NOT NULL CONSTRAINT [l10n_update_project_l10n_path_df]  DEFAULT (''),
	[status] [int] NOT NULL CONSTRAINT [l10n_update_project_status_df]  DEFAULT ((1)),
 CONSTRAINT [l10n_update_project_pkey] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[languages]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[language] [nvarchar](12) NOT NULL CONSTRAINT [languages_language_df]  DEFAULT (''),
	[name] [nvarchar](64) NOT NULL CONSTRAINT [languages_name_df]  DEFAULT (''),
	[native] [nvarchar](64) NOT NULL CONSTRAINT [languages_native_df]  DEFAULT (''),
	[direction] [int] NOT NULL CONSTRAINT [languages_direction_df]  DEFAULT ((0)),
	[enabled] [int] NOT NULL CONSTRAINT [languages_enabled_df]  DEFAULT ((0)),
	[plurals] [int] NOT NULL CONSTRAINT [languages_plurals_df]  DEFAULT ((0)),
	[formula] [nvarchar](255) NOT NULL CONSTRAINT [languages_formula_df]  DEFAULT (''),
	[domain] [nvarchar](128) NOT NULL CONSTRAINT [languages_domain_df]  DEFAULT (''),
	[prefix] [nvarchar](128) NOT NULL CONSTRAINT [languages_prefix_df]  DEFAULT (''),
	[weight] [int] NOT NULL CONSTRAINT [languages_weight_df]  DEFAULT ((0)),
	[javascript] [nvarchar](64) NOT NULL CONSTRAINT [languages_javascript_df]  DEFAULT (''),
 CONSTRAINT [languages_pkey] PRIMARY KEY CLUSTERED 
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[locales_source]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locales_source](
	[lid] [int] IDENTITY(1,1) NOT NULL,
	[location] [nvarchar](max) NULL,
	[textgroup] [nvarchar](255) NOT NULL CONSTRAINT [locales_source_textgroup_df]  DEFAULT ('default'),
	[source] [nvarchar](max) NOT NULL,
	[context] [nvarchar](255) NOT NULL CONSTRAINT [locales_source_context_df]  DEFAULT (''),
	[version] [nvarchar](20) NOT NULL CONSTRAINT [locales_source_version_df]  DEFAULT ('none'),
 CONSTRAINT [locales_source_pkey] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[locales_target]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locales_target](
	[lid] [int] NOT NULL CONSTRAINT [locales_target_lid_df]  DEFAULT ((0)),
	[translation] [nvarchar](max) NOT NULL,
	[language] [nvarchar](12) NOT NULL CONSTRAINT [locales_target_language_df]  DEFAULT (''),
	[plid] [int] NOT NULL CONSTRAINT [locales_target_plid_df]  DEFAULT ((0)),
	[plural] [int] NOT NULL CONSTRAINT [locales_target_plural_df]  DEFAULT ((0)),
	[l10n_status] [int] NOT NULL CONSTRAINT [locales_target_l10n_status_df]  DEFAULT ((0)),
 CONSTRAINT [locales_target_pkey] PRIMARY KEY CLUSTERED 
(
	[language] ASC,
	[lid] ASC,
	[plural] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu_custom]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu_custom](
	[menu_name] [nvarchar](32) NOT NULL CONSTRAINT [menu_custom_menu_name_df]  DEFAULT (''),
	[title] [nvarchar](255) NOT NULL CONSTRAINT [menu_custom_title_df]  DEFAULT (''),
	[description] [nvarchar](max) NULL,
 CONSTRAINT [menu_custom_pkey] PRIMARY KEY CLUSTERED 
(
	[menu_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu_links]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu_links](
	[menu_name] [nvarchar](32) NOT NULL CONSTRAINT [menu_links_menu_name_df]  DEFAULT (''),
	[mlid] [int] IDENTITY(1,1) NOT NULL,
	[plid] [int] NOT NULL CONSTRAINT [menu_links_plid_df]  DEFAULT ((0)),
	[link_path] [nvarchar](255) NOT NULL CONSTRAINT [menu_links_link_path_df]  DEFAULT (''),
	[router_path] [nvarchar](255) NOT NULL CONSTRAINT [menu_links_router_path_df]  DEFAULT (''),
	[link_title] [nvarchar](255) NOT NULL CONSTRAINT [menu_links_link_title_df]  DEFAULT (''),
	[options] [varbinary](max) NULL,
	[module] [nvarchar](255) NOT NULL CONSTRAINT [menu_links_module_df]  DEFAULT ('system'),
	[hidden] [smallint] NOT NULL CONSTRAINT [menu_links_hidden_df]  DEFAULT ((0)),
	[external] [smallint] NOT NULL CONSTRAINT [menu_links_external_df]  DEFAULT ((0)),
	[has_children] [smallint] NOT NULL CONSTRAINT [menu_links_has_children_df]  DEFAULT ((0)),
	[expanded] [smallint] NOT NULL CONSTRAINT [menu_links_expanded_df]  DEFAULT ((0)),
	[weight] [int] NOT NULL CONSTRAINT [menu_links_weight_df]  DEFAULT ((0)),
	[depth] [smallint] NOT NULL CONSTRAINT [menu_links_depth_df]  DEFAULT ((0)),
	[customized] [smallint] NOT NULL CONSTRAINT [menu_links_customized_df]  DEFAULT ((0)),
	[p1] [int] NOT NULL CONSTRAINT [menu_links_p1_df]  DEFAULT ((0)),
	[p2] [int] NOT NULL CONSTRAINT [menu_links_p2_df]  DEFAULT ((0)),
	[p3] [int] NOT NULL CONSTRAINT [menu_links_p3_df]  DEFAULT ((0)),
	[p4] [int] NOT NULL CONSTRAINT [menu_links_p4_df]  DEFAULT ((0)),
	[p5] [int] NOT NULL CONSTRAINT [menu_links_p5_df]  DEFAULT ((0)),
	[p6] [int] NOT NULL CONSTRAINT [menu_links_p6_df]  DEFAULT ((0)),
	[p7] [int] NOT NULL CONSTRAINT [menu_links_p7_df]  DEFAULT ((0)),
	[p8] [int] NOT NULL CONSTRAINT [menu_links_p8_df]  DEFAULT ((0)),
	[p9] [int] NOT NULL CONSTRAINT [menu_links_p9_df]  DEFAULT ((0)),
	[updated] [smallint] NOT NULL CONSTRAINT [menu_links_updated_df]  DEFAULT ((0)),
 CONSTRAINT [menu_links_pkey] PRIMARY KEY CLUSTERED 
(
	[mlid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menu_router]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu_router](
	[path] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_path_df]  DEFAULT (''),
	[load_functions] [varbinary](max) NOT NULL,
	[to_arg_functions] [varbinary](max) NOT NULL,
	[access_callback] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_access_callback_df]  DEFAULT (''),
	[access_arguments] [varbinary](max) NULL,
	[page_callback] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_page_callback_df]  DEFAULT (''),
	[page_arguments] [varbinary](max) NULL,
	[delivery_callback] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_delivery_callback_df]  DEFAULT (''),
	[fit] [int] NOT NULL CONSTRAINT [menu_router_fit_df]  DEFAULT ((0)),
	[number_parts] [smallint] NOT NULL CONSTRAINT [menu_router_number_parts_df]  DEFAULT ((0)),
	[context] [int] NOT NULL CONSTRAINT [menu_router_context_df]  DEFAULT ((0)),
	[tab_parent] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_tab_parent_df]  DEFAULT (''),
	[tab_root] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_tab_root_df]  DEFAULT (''),
	[title] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_title_df]  DEFAULT (''),
	[title_callback] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_title_callback_df]  DEFAULT (''),
	[title_arguments] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_title_arguments_df]  DEFAULT (''),
	[theme_callback] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_theme_callback_df]  DEFAULT (''),
	[theme_arguments] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_theme_arguments_df]  DEFAULT (''),
	[type] [int] NOT NULL CONSTRAINT [menu_router_type_df]  DEFAULT ((0)),
	[description] [nvarchar](max) NOT NULL,
	[position] [nvarchar](255) NOT NULL CONSTRAINT [menu_router_position_df]  DEFAULT (''),
	[weight] [int] NOT NULL CONSTRAINT [menu_router_weight_df]  DEFAULT ((0)),
	[include_file] [nvarchar](max) NULL,
 CONSTRAINT [menu_router_pkey] PRIMARY KEY CLUSTERED 
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[node]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[node](
	[nid] [int] IDENTITY(1,1) NOT NULL,
	[vid] [int] NULL,
	[type] [nvarchar](32) NOT NULL,
	[language] [nvarchar](12) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[uid] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created] [int] NOT NULL,
	[changed] [int] NOT NULL,
	[comment] [int] NOT NULL,
	[promote] [int] NOT NULL,
	[sticky] [int] NOT NULL,
	[tnid] [int] NOT NULL,
	[translate] [int] NOT NULL,
	[__pk] [uniqueidentifier] NOT NULL,
	[__unique_vid]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[vid]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [node_pkey] PRIMARY KEY CLUSTERED 
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[node_access]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[node_access](
	[nid] [int] NOT NULL CONSTRAINT [node_access_nid_df]  DEFAULT ((0)),
	[gid] [int] NOT NULL CONSTRAINT [node_access_gid_df]  DEFAULT ((0)),
	[realm] [nvarchar](255) NOT NULL CONSTRAINT [node_access_realm_df]  DEFAULT (''),
	[grant_view] [smallint] NOT NULL CONSTRAINT [node_access_grant_view_df]  DEFAULT ((0)),
	[grant_update] [smallint] NOT NULL CONSTRAINT [node_access_grant_update_df]  DEFAULT ((0)),
	[grant_delete] [smallint] NOT NULL CONSTRAINT [node_access_grant_delete_df]  DEFAULT ((0)),
 CONSTRAINT [node_access_pkey] PRIMARY KEY CLUSTERED 
(
	[nid] ASC,
	[gid] ASC,
	[realm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[node_comment_statistics]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[node_comment_statistics](
	[nid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[last_comment_timestamp] [int] NOT NULL,
	[last_comment_name] [nvarchar](60) NULL,
	[last_comment_uid] [int] NOT NULL,
	[comment_count] [int] NOT NULL,
 CONSTRAINT [node_comment_statistics_pkey] PRIMARY KEY CLUSTERED 
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[node_revision]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[node_revision](
	[nid] [int] NOT NULL,
	[vid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[log] [nvarchar](max) NOT NULL,
	[timestamp] [int] NOT NULL,
	[status] [int] NOT NULL,
	[comment] [int] NOT NULL,
	[promote] [int] NOT NULL,
	[sticky] [int] NOT NULL,
 CONSTRAINT [node_revision_pkey] PRIMARY KEY CLUSTERED 
(
	[vid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[node_type]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[node_type](
	[type] [nvarchar](32) NOT NULL,
	[name] [nvarchar](255) NOT NULL CONSTRAINT [node_type_name_df]  DEFAULT (''),
	[base] [nvarchar](255) NOT NULL,
	[module] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[help] [nvarchar](max) NOT NULL,
	[has_title] [smallint] NOT NULL,
	[title_label] [nvarchar](255) NOT NULL CONSTRAINT [node_type_title_label_df]  DEFAULT (''),
	[custom] [smallint] NOT NULL CONSTRAINT [node_type_custom_df]  DEFAULT ((0)),
	[modified] [smallint] NOT NULL CONSTRAINT [node_type_modified_df]  DEFAULT ((0)),
	[locked] [smallint] NOT NULL CONSTRAINT [node_type_locked_df]  DEFAULT ((0)),
	[disabled] [smallint] NOT NULL CONSTRAINT [node_type_disabled_df]  DEFAULT ((0)),
	[orig_type] [nvarchar](255) NOT NULL CONSTRAINT [node_type_orig_type_df]  DEFAULT (''),
 CONSTRAINT [node_type_pkey] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[queue]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[queue](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[data] [varbinary](max) NULL,
	[expire] [int] NOT NULL,
	[created] [int] NOT NULL,
 CONSTRAINT [queue_pkey] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rdf_mapping]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rdf_mapping](
	[type] [nvarchar](128) NOT NULL,
	[bundle] [nvarchar](128) NOT NULL,
	[mapping] [varbinary](max) NULL,
 CONSTRAINT [rdf_mapping_pkey] PRIMARY KEY CLUSTERED 
(
	[type] ASC,
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registry]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registry](
	[name] [nvarchar](255) NOT NULL CONSTRAINT [registry_name_df]  DEFAULT (''),
	[type] [nvarchar](9) NOT NULL CONSTRAINT [registry_type_df]  DEFAULT (''),
	[filename] [nvarchar](255) NOT NULL,
	[module] [nvarchar](255) NOT NULL CONSTRAINT [registry_module_df]  DEFAULT (''),
	[weight] [int] NOT NULL CONSTRAINT [registry_weight_df]  DEFAULT ((0)),
 CONSTRAINT [registry_pkey] PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[registry_file]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registry_file](
	[filename] [nvarchar](255) NOT NULL,
	[hash] [nvarchar](64) NOT NULL,
 CONSTRAINT [registry_file_pkey] PRIMARY KEY CLUSTERED 
(
	[filename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL CONSTRAINT [role_name_df]  DEFAULT (''),
	[weight] [int] NOT NULL CONSTRAINT [role_weight_df]  DEFAULT ((0)),
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_name]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[name]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [role_pkey] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role_permission]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permission](
	[rid] [int] NOT NULL,
	[permission] [nvarchar](128) NOT NULL CONSTRAINT [role_permission_permission_df]  DEFAULT (''),
	[module] [nvarchar](255) NOT NULL CONSTRAINT [role_permission_module_df]  DEFAULT (''),
 CONSTRAINT [role_permission_pkey] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[search_dataset]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_dataset](
	[sid] [int] NOT NULL,
	[type] [nvarchar](16) NOT NULL,
	[data] [nvarchar](max) NOT NULL,
	[reindex] [int] NOT NULL,
 CONSTRAINT [search_dataset_pkey] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[search_index]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_index](
	[word] [nvarchar](50) NOT NULL,
	[sid] [int] NOT NULL,
	[type] [nvarchar](16) NOT NULL,
	[score] [real] NULL,
 CONSTRAINT [search_index_pkey] PRIMARY KEY CLUSTERED 
(
	[word] ASC,
	[sid] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[search_node_links]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_node_links](
	[sid] [int] NOT NULL,
	[type] [nvarchar](16) NOT NULL,
	[nid] [int] NOT NULL,
	[caption] [nvarchar](max) NULL,
 CONSTRAINT [search_node_links_pkey] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[type] ASC,
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[search_total]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_total](
	[word] [nvarchar](50) NOT NULL,
	[count] [real] NULL,
 CONSTRAINT [search_total_pkey] PRIMARY KEY CLUSTERED 
(
	[word] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[semaphore]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semaphore](
	[name] [nvarchar](255) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[expire] [float] NOT NULL,
 CONSTRAINT [semaphore_pkey] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sequences]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sequences](
	[value] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [sequences_pkey] PRIMARY KEY CLUSTERED 
(
	[value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sessions]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sessions](
	[uid] [int] NOT NULL,
	[sid] [nvarchar](128) NOT NULL,
	[ssid] [nvarchar](128) NOT NULL CONSTRAINT [sessions_ssid_df]  DEFAULT (''),
	[hostname] [nvarchar](128) NOT NULL CONSTRAINT [sessions_hostname_df]  DEFAULT (''),
	[timestamp] [int] NOT NULL CONSTRAINT [sessions_timestamp_df]  DEFAULT ((0)),
	[cache] [int] NOT NULL CONSTRAINT [sessions_cache_df]  DEFAULT ((0)),
	[session] [varbinary](max) NULL,
 CONSTRAINT [sessions_pkey] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[ssid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shortcut_set]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shortcut_set](
	[set_name] [nvarchar](32) NOT NULL CONSTRAINT [shortcut_set_set_name_df]  DEFAULT (''),
	[title] [nvarchar](255) NOT NULL CONSTRAINT [shortcut_set_title_df]  DEFAULT (''),
 CONSTRAINT [shortcut_set_pkey] PRIMARY KEY CLUSTERED 
(
	[set_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[shortcut_set_users]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shortcut_set_users](
	[uid] [int] NOT NULL,
	[set_name] [nvarchar](32) NOT NULL,
 CONSTRAINT [shortcut_set_users_pkey] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[system](
	[filename] [nvarchar](255) NOT NULL CONSTRAINT [system_filename_df]  DEFAULT (''),
	[name] [nvarchar](255) NOT NULL CONSTRAINT [system_name_df]  DEFAULT (''),
	[type] [nvarchar](12) NOT NULL CONSTRAINT [system_type_df]  DEFAULT (''),
	[owner] [nvarchar](255) NOT NULL CONSTRAINT [system_owner_df]  DEFAULT (''),
	[status] [int] NOT NULL CONSTRAINT [system_status_df]  DEFAULT ((0)),
	[bootstrap] [int] NOT NULL CONSTRAINT [system_bootstrap_df]  DEFAULT ((0)),
	[schema_version] [smallint] NOT NULL CONSTRAINT [system_schema_version_df]  DEFAULT ((-1)),
	[weight] [int] NOT NULL CONSTRAINT [system_weight_df]  DEFAULT ((0)),
	[info] [varbinary](max) NULL,
 CONSTRAINT [system_pkey] PRIMARY KEY CLUSTERED 
(
	[filename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[taxonomy_index]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxonomy_index](
	[nid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[sticky] [smallint] NULL,
	[created] [int] NOT NULL,
	[__pk] [uniqueidentifier] NOT NULL,
 CONSTRAINT [taxonomy_index_pkey_technical] PRIMARY KEY CLUSTERED 
(
	[__pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taxonomy_term_data]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxonomy_term_data](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[vid] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[format] [nvarchar](255) NULL,
	[weight] [int] NOT NULL,
 CONSTRAINT [taxonomy_term_data_pkey] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taxonomy_term_hierarchy]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxonomy_term_hierarchy](
	[tid] [int] NOT NULL,
	[parent] [int] NOT NULL,
 CONSTRAINT [taxonomy_term_hierarchy_pkey] PRIMARY KEY CLUSTERED 
(
	[tid] ASC,
	[parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taxonomy_vocabulary]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[taxonomy_vocabulary](
	[vid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL CONSTRAINT [taxonomy_vocabulary_name_df]  DEFAULT (''),
	[machine_name] [nvarchar](255) NOT NULL CONSTRAINT [taxonomy_vocabulary_machine_name_df]  DEFAULT (''),
	[description] [nvarchar](max) NULL,
	[hierarchy] [smallint] NOT NULL CONSTRAINT [taxonomy_vocabulary_hierarchy_df]  DEFAULT ((0)),
	[module] [nvarchar](255) NOT NULL CONSTRAINT [taxonomy_vocabulary_module_df]  DEFAULT (''),
	[weight] [int] NOT NULL CONSTRAINT [taxonomy_vocabulary_weight_df]  DEFAULT ((0)),
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_machine_name]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[machine_name]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [taxonomy_vocabulary_pkey] PRIMARY KEY CLUSTERED 
(
	[vid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[url_alias]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[url_alias](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[source] [nvarchar](255) NOT NULL CONSTRAINT [url_alias_source_df]  DEFAULT (''),
	[alias] [nvarchar](255) NOT NULL CONSTRAINT [url_alias_alias_df]  DEFAULT (''),
	[language] [nvarchar](12) NOT NULL CONSTRAINT [url_alias_language_df]  DEFAULT (''),
 CONSTRAINT [url_alias_pkey] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[uid] [int] NOT NULL CONSTRAINT [users_uid_df]  DEFAULT ((0)),
	[name] [nvarchar](60) NOT NULL CONSTRAINT [users_name_df]  DEFAULT (''),
	[pass] [nvarchar](128) NOT NULL CONSTRAINT [users_pass_df]  DEFAULT (''),
	[mail] [nvarchar](254) NULL CONSTRAINT [users_mail_df]  DEFAULT (''),
	[theme] [nvarchar](255) NOT NULL CONSTRAINT [users_theme_df]  DEFAULT (''),
	[signature] [nvarchar](255) NOT NULL CONSTRAINT [users_signature_df]  DEFAULT (''),
	[signature_format] [nvarchar](255) NULL,
	[created] [int] NOT NULL CONSTRAINT [users_created_df]  DEFAULT ((0)),
	[access] [int] NOT NULL CONSTRAINT [users_access_df]  DEFAULT ((0)),
	[login] [int] NOT NULL CONSTRAINT [users_login_df]  DEFAULT ((0)),
	[status] [smallint] NOT NULL CONSTRAINT [users_status_df]  DEFAULT ((0)),
	[timezone] [nvarchar](32) NULL,
	[language] [nvarchar](12) NOT NULL CONSTRAINT [users_language_df]  DEFAULT (''),
	[picture] [int] NOT NULL CONSTRAINT [users_picture_df]  DEFAULT ((0)),
	[init] [nvarchar](254) NULL CONSTRAINT [users_init_df]  DEFAULT (''),
	[data] [varbinary](max) NULL,
	[__pk] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[__unique_name]  AS (CONVERT([varbinary](16),hashbytes('MD4',coalesce(CONVERT([varbinary](max),[name]),CONVERT([varbinary](max),[__pk]))))),
 CONSTRAINT [users_pkey] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[uid] [int] NOT NULL CONSTRAINT [users_roles_uid_df]  DEFAULT ((0)),
	[rid] [int] NOT NULL CONSTRAINT [users_roles_rid_df]  DEFAULT ((0)),
 CONSTRAINT [users_roles_pkey] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[variable]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[variable](
	[name] [nvarchar](128) NOT NULL CONSTRAINT [variable_name_df]  DEFAULT (''),
	[value] [varbinary](max) NOT NULL,
 CONSTRAINT [variable_pkey] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[watchdog]    Script Date: 20/07/2015 15:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[watchdog](
	[wid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL CONSTRAINT [watchdog_uid_df]  DEFAULT ((0)),
	[type] [nvarchar](64) NOT NULL CONSTRAINT [watchdog_type_df]  DEFAULT (''),
	[message] [nvarchar](max) NOT NULL,
	[variables] [varbinary](max) NOT NULL,
	[severity] [smallint] NOT NULL CONSTRAINT [watchdog_severity_df]  DEFAULT ((0)),
	[link] [nvarchar](255) NULL CONSTRAINT [watchdog_link_df]  DEFAULT (''),
	[location] [nvarchar](max) NOT NULL,
	[referer] [nvarchar](max) NULL,
	[hostname] [nvarchar](128) NOT NULL CONSTRAINT [watchdog_hostname_df]  DEFAULT (''),
	[timestamp] [int] NOT NULL CONSTRAINT [watchdog_timestamp_df]  DEFAULT ((0)),
 CONSTRAINT [watchdog_pkey] PRIMARY KEY CLUSTERED 
(
	[wid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [authname_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [authname_unique] ON [dbo].[authmap]
(
	[__unique_authname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [token_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [token_idx] ON [dbo].[batch]
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [list_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [list_idx] ON [dbo].[block]
(
	[theme] ASC,
	[status] ASC,
	[region] ASC,
	[weight] ASC,
	[module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [tmd_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [tmd_unique] ON [dbo].[block]
(
	[__unique_tmd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [info_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [info_unique] ON [dbo].[block_custom]
(
	[__unique_info] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [type_idx] ON [dbo].[block_node_type]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [rid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [rid_idx] ON [dbo].[block_role]
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [blocked_ip_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [blocked_ip_idx] ON [dbo].[blocked_ips]
(
	[ip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_admin_menu]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_block]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_bootstrap]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_features]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_field]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_filter]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_form]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_image]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_l10n_update]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_menu]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_page]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_path]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_token]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[cache_update]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [comment_created_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_created_idx] ON [dbo].[comment]
(
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [comment_nid_language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_nid_language_idx] ON [dbo].[comment]
(
	[nid] ASC,
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [comment_num_new_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_num_new_idx] ON [dbo].[comment]
(
	[nid] ASC,
	[status] ASC,
	[created] ASC,
	[cid] ASC,
	[thread] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [comment_status_pid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_status_pid_idx] ON [dbo].[comment]
(
	[pid] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [comment_uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_uid_idx] ON [dbo].[comment]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [title_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [title_idx] ON [dbo].[date_format_type]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [formats_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [formats_unique] ON [dbo].[date_formats]
(
	[__unique_formats] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [active_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [active_idx] ON [dbo].[field_config]
(
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_config]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [field_name_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [field_name_idx] ON [dbo].[field_config]
(
	[field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [module_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [module_idx] ON [dbo].[field_config]
(
	[module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [storage_active_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [storage_active_idx] ON [dbo].[field_config]
(
	[storage_active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [storage_module_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [storage_module_idx] ON [dbo].[field_config]
(
	[storage_module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [storage_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [storage_type_idx] ON [dbo].[field_config]
(
	[storage_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [type_idx] ON [dbo].[field_config]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_config_instance]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [field_name_bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [field_name_bundle_idx] ON [dbo].[field_config_instance]
(
	[field_name] ASC,
	[entity_type] ASC,
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [body_format_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [body_format_idx] ON [dbo].[field_data_body]
(
	[body_format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_data_body]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_data_body]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_data_body]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_data_body]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_data_body]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_data_body]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_data_comment_body]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [comment_body_format_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_body_format_idx] ON [dbo].[field_data_comment_body]
(
	[comment_body_format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_data_comment_body]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_data_comment_body]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_data_comment_body]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_data_comment_body]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_data_comment_body]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_data_field_image]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_data_field_image]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_data_field_image]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_data_field_image]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [field_image_fid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [field_image_fid_idx] ON [dbo].[field_data_field_image]
(
	[field_image_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_data_field_image]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_data_field_image]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_data_field_tags]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_data_field_tags]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_data_field_tags]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_data_field_tags]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [field_tags_tid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [field_tags_tid_idx] ON [dbo].[field_data_field_tags]
(
	[field_tags_tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_data_field_tags]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_data_field_tags]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [body_format_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [body_format_idx] ON [dbo].[field_revision_body]
(
	[body_format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_revision_body]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_revision_body]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_revision_body]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_revision_body]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_revision_body]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_revision_body]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_revision_comment_body]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [comment_body_format_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_body_format_idx] ON [dbo].[field_revision_comment_body]
(
	[comment_body_format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_revision_comment_body]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_revision_comment_body]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_revision_comment_body]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_revision_comment_body]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_revision_comment_body]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_revision_field_image]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_revision_field_image]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_revision_field_image]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_revision_field_image]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [field_image_fid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [field_image_fid_idx] ON [dbo].[field_revision_field_image]
(
	[field_image_fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_revision_field_image]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_revision_field_image]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [bundle_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [bundle_idx] ON [dbo].[field_revision_field_tags]
(
	[bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [deleted_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [deleted_idx] ON [dbo].[field_revision_field_tags]
(
	[deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [entity_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_id_idx] ON [dbo].[field_revision_field_tags]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [entity_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [entity_type_idx] ON [dbo].[field_revision_field_tags]
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [field_tags_tid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [field_tags_tid_idx] ON [dbo].[field_revision_field_tags]
(
	[field_tags_tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[field_revision_field_tags]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [revision_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [revision_id_idx] ON [dbo].[field_revision_field_tags]
(
	[revision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [status_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [status_idx] ON [dbo].[file_managed]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [timestamp_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [timestamp_idx] ON [dbo].[file_managed]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [uid_idx] ON [dbo].[file_managed]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [uri_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [uri_unique] ON [dbo].[file_managed]
(
	[__unique_uri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fid_count_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [fid_count_idx] ON [dbo].[file_usage]
(
	[fid] ASC,
	[count] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fid_module_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [fid_module_idx] ON [dbo].[file_usage]
(
	[fid] ASC,
	[module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [type_id_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [type_id_idx] ON [dbo].[file_usage]
(
	[type] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [list_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [list_idx] ON [dbo].[filter]
(
	[weight] ASC,
	[module] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [name_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [name_unique] ON [dbo].[filter_format]
(
	[__unique_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [status_weight_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [status_weight_idx] ON [dbo].[filter_format]
(
	[status] ASC,
	[weight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [allow_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [allow_idx] ON [dbo].[flood]
(
	[event] ASC,
	[identifier] ASC,
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [purge_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [purge_idx] ON [dbo].[flood]
(
	[expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [nid_idx] ON [dbo].[history]
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [isid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [isid_idx] ON [dbo].[image_effects]
(
	[isid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [weight_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [weight_idx] ON [dbo].[image_effects]
(
	[weight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [name_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [name_unique] ON [dbo].[image_styles]
(
	[__unique_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [list_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [list_idx] ON [dbo].[languages]
(
	[weight] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [lid_idx] ON [dbo].[locales_target]
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [plid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [plid_idx] ON [dbo].[locales_target]
(
	[plid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [plural_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [plural_idx] ON [dbo].[locales_target]
(
	[plural] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [menu_parents_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [menu_parents_idx] ON [dbo].[menu_links]
(
	[menu_name] ASC,
	[p1] ASC,
	[p2] ASC,
	[p3] ASC,
	[p4] ASC,
	[p5] ASC,
	[p6] ASC,
	[p7] ASC,
	[p8] ASC,
	[p9] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [menu_plid_expand_child_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [menu_plid_expand_child_idx] ON [dbo].[menu_links]
(
	[menu_name] ASC,
	[plid] ASC,
	[expanded] ASC,
	[has_children] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [path_menu_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [path_menu_idx] ON [dbo].[menu_links]
(
	[link_path] ASC,
	[menu_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [router_path_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [router_path_idx] ON [dbo].[menu_links]
(
	[router_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fit_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [fit_idx] ON [dbo].[menu_router]
(
	[fit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [tab_parent_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [tab_parent_idx] ON [dbo].[menu_router]
(
	[tab_parent] ASC,
	[weight] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [tab_root_weight_title_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [tab_root_weight_title_idx] ON [dbo].[menu_router]
(
	[tab_root] ASC,
	[weight] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [language_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [language_idx] ON [dbo].[node]
(
	[language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [node_changed_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_changed_idx] ON [dbo].[node]
(
	[changed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [node_created_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_created_idx] ON [dbo].[node]
(
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [node_frontpage_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_frontpage_idx] ON [dbo].[node]
(
	[promote] ASC,
	[status] ASC,
	[sticky] ASC,
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [node_status_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_status_type_idx] ON [dbo].[node]
(
	[status] ASC,
	[type] ASC,
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [node_title_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_title_type_idx] ON [dbo].[node]
(
	[title] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [node_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_type_idx] ON [dbo].[node]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [tnid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [tnid_idx] ON [dbo].[node]
(
	[tnid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [translate_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [translate_idx] ON [dbo].[node]
(
	[translate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [uid_idx] ON [dbo].[node]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [vid_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [vid_unique] ON [dbo].[node]
(
	[__unique_vid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [comment_count_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [comment_count_idx] ON [dbo].[node_comment_statistics]
(
	[comment_count] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [last_comment_uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [last_comment_uid_idx] ON [dbo].[node_comment_statistics]
(
	[last_comment_uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [node_comment_timestamp_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [node_comment_timestamp_idx] ON [dbo].[node_comment_statistics]
(
	[last_comment_timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [nid_idx] ON [dbo].[node_revision]
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [uid_idx] ON [dbo].[node_revision]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[queue]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [name_created_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [name_created_idx] ON [dbo].[queue]
(
	[name] ASC,
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [hook_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [hook_idx] ON [dbo].[registry]
(
	[type] ASC,
	[weight] ASC,
	[module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [name_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [name_unique] ON [dbo].[role]
(
	[__unique_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [name_weight_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [name_weight_idx] ON [dbo].[role]
(
	[name] ASC,
	[weight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [permission_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [permission_idx] ON [dbo].[role_permission]
(
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sid_type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [sid_type_idx] ON [dbo].[search_index]
(
	[sid] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [nid_idx] ON [dbo].[search_node_links]
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [expire_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [expire_idx] ON [dbo].[semaphore]
(
	[expire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [value_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [value_idx] ON [dbo].[semaphore]
(
	[value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ssid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [ssid_idx] ON [dbo].[sessions]
(
	[ssid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [timestamp_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [timestamp_idx] ON [dbo].[sessions]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [uid_idx] ON [dbo].[sessions]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [set_name_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [set_name_idx] ON [dbo].[shortcut_set_users]
(
	[set_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [system_list_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [system_list_idx] ON [dbo].[system]
(
	[status] ASC,
	[bootstrap] ASC,
	[type] ASC,
	[weight] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [type_name_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [type_name_idx] ON [dbo].[system]
(
	[type] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [nid_idx] ON [dbo].[taxonomy_index]
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [term_node_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [term_node_idx] ON [dbo].[taxonomy_index]
(
	[tid] ASC,
	[sticky] ASC,
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [name_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [name_idx] ON [dbo].[taxonomy_term_data]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [taxonomy_tree_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [taxonomy_tree_idx] ON [dbo].[taxonomy_term_data]
(
	[vid] ASC,
	[weight] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [vid_name_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [vid_name_idx] ON [dbo].[taxonomy_term_data]
(
	[vid] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [parent_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [parent_idx] ON [dbo].[taxonomy_term_hierarchy]
(
	[parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [list_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [list_idx] ON [dbo].[taxonomy_vocabulary]
(
	[weight] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [machine_name_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [machine_name_unique] ON [dbo].[taxonomy_vocabulary]
(
	[__unique_machine_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [alias_language_pid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [alias_language_pid_idx] ON [dbo].[url_alias]
(
	[alias] ASC,
	[language] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [source_language_pid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [source_language_pid_idx] ON [dbo].[url_alias]
(
	[source] ASC,
	[language] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [access_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [access_idx] ON [dbo].[users]
(
	[access] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [created_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [created_idx] ON [dbo].[users]
(
	[created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [mail_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [mail_idx] ON [dbo].[users]
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [name_unique]    Script Date: 20/07/2015 15:38:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [name_unique] ON [dbo].[users]
(
	[__unique_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [picture_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [picture_idx] ON [dbo].[users]
(
	[picture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [rid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [rid_idx] ON [dbo].[users_roles]
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [severity_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [severity_idx] ON [dbo].[watchdog]
(
	[severity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [type_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [type_idx] ON [dbo].[watchdog]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uid_idx]    Script Date: 20/07/2015 15:38:41 ******/
CREATE NONCLUSTERED INDEX [uid_idx] ON [dbo].[watchdog]
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[authmap] ADD  CONSTRAINT [authmap_uid_df]  DEFAULT ((0)) FOR [uid]
GO
ALTER TABLE [dbo].[authmap] ADD  CONSTRAINT [authmap_authname_df]  DEFAULT ('') FOR [authname]
GO
ALTER TABLE [dbo].[authmap] ADD  CONSTRAINT [authmap_module_df]  DEFAULT ('') FOR [module]
GO
ALTER TABLE [dbo].[authmap] ADD  DEFAULT (newid()) FOR [__pk]
GO
ALTER TABLE [dbo].[block_custom] ADD  CONSTRAINT [block_custom_info_df]  DEFAULT ('') FOR [info]
GO
ALTER TABLE [dbo].[block_custom] ADD  DEFAULT (newid()) FOR [__pk]
GO
ALTER TABLE [dbo].[blocked_ips] ADD  CONSTRAINT [blocked_ips_ip_df]  DEFAULT ('') FOR [ip]
GO
ALTER TABLE [dbo].[cache_block] ADD  CONSTRAINT [cache_block_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_block] ADD  CONSTRAINT [cache_block_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_block] ADD  CONSTRAINT [cache_block_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_block] ADD  CONSTRAINT [cache_block_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_features] ADD  CONSTRAINT [cache_features_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_features] ADD  CONSTRAINT [cache_features_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_features] ADD  CONSTRAINT [cache_features_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_features] ADD  CONSTRAINT [cache_features_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_filter] ADD  CONSTRAINT [cache_filter_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_filter] ADD  CONSTRAINT [cache_filter_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_filter] ADD  CONSTRAINT [cache_filter_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_filter] ADD  CONSTRAINT [cache_filter_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_form] ADD  CONSTRAINT [cache_form_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_form] ADD  CONSTRAINT [cache_form_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_form] ADD  CONSTRAINT [cache_form_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_form] ADD  CONSTRAINT [cache_form_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_image] ADD  CONSTRAINT [cache_image_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_image] ADD  CONSTRAINT [cache_image_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_image] ADD  CONSTRAINT [cache_image_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_image] ADD  CONSTRAINT [cache_image_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_l10n_update] ADD  CONSTRAINT [cache_l10n_update_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_l10n_update] ADD  CONSTRAINT [cache_l10n_update_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_l10n_update] ADD  CONSTRAINT [cache_l10n_update_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_l10n_update] ADD  CONSTRAINT [cache_l10n_update_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_page] ADD  CONSTRAINT [cache_page_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_page] ADD  CONSTRAINT [cache_page_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_page] ADD  CONSTRAINT [cache_page_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_page] ADD  CONSTRAINT [cache_page_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[cache_token] ADD  CONSTRAINT [cache_token_cid_df]  DEFAULT ('') FOR [cid]
GO
ALTER TABLE [dbo].[cache_token] ADD  CONSTRAINT [cache_token_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[cache_token] ADD  CONSTRAINT [cache_token_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[cache_token] ADD  CONSTRAINT [cache_token_serialized_df]  DEFAULT ((0)) FOR [serialized]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_pid_df]  DEFAULT ((0)) FOR [pid]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_nid_df]  DEFAULT ((0)) FOR [nid]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_uid_df]  DEFAULT ((0)) FOR [uid]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_subject_df]  DEFAULT ('') FOR [subject]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_hostname_df]  DEFAULT ('') FOR [hostname]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_changed_df]  DEFAULT ((0)) FOR [changed]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_status_df]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [comment_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_data_body] ADD  CONSTRAINT [field_data_body_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_data_body] ADD  CONSTRAINT [field_data_body_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_data_body] ADD  CONSTRAINT [field_data_body_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_data_body] ADD  CONSTRAINT [field_data_body_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_data_comment_body] ADD  CONSTRAINT [field_data_comment_body_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_data_comment_body] ADD  CONSTRAINT [field_data_comment_body_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_data_comment_body] ADD  CONSTRAINT [field_data_comment_body_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_data_comment_body] ADD  CONSTRAINT [field_data_comment_body_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_data_field_image] ADD  CONSTRAINT [field_data_field_image_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_data_field_image] ADD  CONSTRAINT [field_data_field_image_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_data_field_image] ADD  CONSTRAINT [field_data_field_image_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_data_field_image] ADD  CONSTRAINT [field_data_field_image_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_data_field_tags] ADD  CONSTRAINT [field_data_field_tags_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_data_field_tags] ADD  CONSTRAINT [field_data_field_tags_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_data_field_tags] ADD  CONSTRAINT [field_data_field_tags_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_data_field_tags] ADD  CONSTRAINT [field_data_field_tags_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_revision_body] ADD  CONSTRAINT [field_revision_body_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_revision_body] ADD  CONSTRAINT [field_revision_body_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_revision_body] ADD  CONSTRAINT [field_revision_body_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_revision_body] ADD  CONSTRAINT [field_revision_body_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_revision_comment_body] ADD  CONSTRAINT [field_revision_comment_body_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_revision_comment_body] ADD  CONSTRAINT [field_revision_comment_body_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_revision_comment_body] ADD  CONSTRAINT [field_revision_comment_body_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_revision_comment_body] ADD  CONSTRAINT [field_revision_comment_body_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_revision_field_image] ADD  CONSTRAINT [field_revision_field_image_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_revision_field_image] ADD  CONSTRAINT [field_revision_field_image_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_revision_field_image] ADD  CONSTRAINT [field_revision_field_image_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_revision_field_image] ADD  CONSTRAINT [field_revision_field_image_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[field_revision_field_tags] ADD  CONSTRAINT [field_revision_field_tags_entity_type_df]  DEFAULT ('') FOR [entity_type]
GO
ALTER TABLE [dbo].[field_revision_field_tags] ADD  CONSTRAINT [field_revision_field_tags_bundle_df]  DEFAULT ('') FOR [bundle]
GO
ALTER TABLE [dbo].[field_revision_field_tags] ADD  CONSTRAINT [field_revision_field_tags_deleted_df]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[field_revision_field_tags] ADD  CONSTRAINT [field_revision_field_tags_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[file_usage] ADD  CONSTRAINT [file_usage_module_df]  DEFAULT ('') FOR [module]
GO
ALTER TABLE [dbo].[file_usage] ADD  CONSTRAINT [file_usage_type_df]  DEFAULT ('') FOR [type]
GO
ALTER TABLE [dbo].[file_usage] ADD  CONSTRAINT [file_usage_id_df]  DEFAULT ((0)) FOR [id]
GO
ALTER TABLE [dbo].[file_usage] ADD  CONSTRAINT [file_usage_count_df]  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[flood] ADD  CONSTRAINT [flood_event_df]  DEFAULT ('') FOR [event]
GO
ALTER TABLE [dbo].[flood] ADD  CONSTRAINT [flood_identifier_df]  DEFAULT ('') FOR [identifier]
GO
ALTER TABLE [dbo].[flood] ADD  CONSTRAINT [flood_timestamp_df]  DEFAULT ((0)) FOR [timestamp]
GO
ALTER TABLE [dbo].[flood] ADD  CONSTRAINT [flood_expiration_df]  DEFAULT ((0)) FOR [expiration]
GO
ALTER TABLE [dbo].[history] ADD  CONSTRAINT [history_uid_df]  DEFAULT ((0)) FOR [uid]
GO
ALTER TABLE [dbo].[history] ADD  CONSTRAINT [history_nid_df]  DEFAULT ((0)) FOR [nid]
GO
ALTER TABLE [dbo].[history] ADD  CONSTRAINT [history_timestamp_df]  DEFAULT ((0)) FOR [timestamp]
GO
ALTER TABLE [dbo].[image_effects] ADD  CONSTRAINT [image_effects_isid_df]  DEFAULT ((0)) FOR [isid]
GO
ALTER TABLE [dbo].[image_effects] ADD  CONSTRAINT [image_effects_weight_df]  DEFAULT ((0)) FOR [weight]
GO
ALTER TABLE [dbo].[image_styles] ADD  CONSTRAINT [image_styles_label_df]  DEFAULT ('') FOR [label]
GO
ALTER TABLE [dbo].[image_styles] ADD  DEFAULT (newid()) FOR [__pk]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_type_df]  DEFAULT ('') FOR [type]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_language_df]  DEFAULT ('') FOR [language]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_title_df]  DEFAULT ('') FOR [title]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_uid_df]  DEFAULT ((0)) FOR [uid]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_status_df]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_changed_df]  DEFAULT ((0)) FOR [changed]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_comment_df]  DEFAULT ((0)) FOR [comment]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_promote_df]  DEFAULT ((0)) FOR [promote]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_sticky_df]  DEFAULT ((0)) FOR [sticky]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_tnid_df]  DEFAULT ((0)) FOR [tnid]
GO
ALTER TABLE [dbo].[node] ADD  CONSTRAINT [node_translate_df]  DEFAULT ((0)) FOR [translate]
GO
ALTER TABLE [dbo].[node] ADD  DEFAULT (newid()) FOR [__pk]
GO
ALTER TABLE [dbo].[node_comment_statistics] ADD  CONSTRAINT [node_comment_statistics_nid_df]  DEFAULT ((0)) FOR [nid]
GO
ALTER TABLE [dbo].[node_comment_statistics] ADD  CONSTRAINT [node_comment_statistics_cid_df]  DEFAULT ((0)) FOR [cid]
GO
ALTER TABLE [dbo].[node_comment_statistics] ADD  CONSTRAINT [node_comment_statistics_last_comment_timestamp_df]  DEFAULT ((0)) FOR [last_comment_timestamp]
GO
ALTER TABLE [dbo].[node_comment_statistics] ADD  CONSTRAINT [node_comment_statistics_last_comment_uid_df]  DEFAULT ((0)) FOR [last_comment_uid]
GO
ALTER TABLE [dbo].[node_comment_statistics] ADD  CONSTRAINT [node_comment_statistics_comment_count_df]  DEFAULT ((0)) FOR [comment_count]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_nid_df]  DEFAULT ((0)) FOR [nid]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_uid_df]  DEFAULT ((0)) FOR [uid]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_title_df]  DEFAULT ('') FOR [title]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_timestamp_df]  DEFAULT ((0)) FOR [timestamp]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_status_df]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_comment_df]  DEFAULT ((0)) FOR [comment]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_promote_df]  DEFAULT ((0)) FOR [promote]
GO
ALTER TABLE [dbo].[node_revision] ADD  CONSTRAINT [node_revision_sticky_df]  DEFAULT ((0)) FOR [sticky]
GO
ALTER TABLE [dbo].[queue] ADD  CONSTRAINT [queue_name_df]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[queue] ADD  CONSTRAINT [queue_expire_df]  DEFAULT ((0)) FOR [expire]
GO
ALTER TABLE [dbo].[queue] ADD  CONSTRAINT [queue_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[search_dataset] ADD  CONSTRAINT [search_dataset_sid_df]  DEFAULT ((0)) FOR [sid]
GO
ALTER TABLE [dbo].[search_dataset] ADD  CONSTRAINT [search_dataset_reindex_df]  DEFAULT ((0)) FOR [reindex]
GO
ALTER TABLE [dbo].[search_index] ADD  CONSTRAINT [search_index_word_df]  DEFAULT ('') FOR [word]
GO
ALTER TABLE [dbo].[search_index] ADD  CONSTRAINT [search_index_sid_df]  DEFAULT ((0)) FOR [sid]
GO
ALTER TABLE [dbo].[search_node_links] ADD  CONSTRAINT [search_node_links_sid_df]  DEFAULT ((0)) FOR [sid]
GO
ALTER TABLE [dbo].[search_node_links] ADD  CONSTRAINT [search_node_links_type_df]  DEFAULT ('') FOR [type]
GO
ALTER TABLE [dbo].[search_node_links] ADD  CONSTRAINT [search_node_links_nid_df]  DEFAULT ((0)) FOR [nid]
GO
ALTER TABLE [dbo].[search_total] ADD  CONSTRAINT [search_total_word_df]  DEFAULT ('') FOR [word]
GO
ALTER TABLE [dbo].[semaphore] ADD  CONSTRAINT [semaphore_name_df]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[semaphore] ADD  CONSTRAINT [semaphore_value_df]  DEFAULT ('') FOR [value]
GO
ALTER TABLE [dbo].[shortcut_set_users] ADD  CONSTRAINT [shortcut_set_users_uid_df]  DEFAULT ((0)) FOR [uid]
GO
ALTER TABLE [dbo].[shortcut_set_users] ADD  CONSTRAINT [shortcut_set_users_set_name_df]  DEFAULT ('') FOR [set_name]
GO
ALTER TABLE [dbo].[taxonomy_index] ADD  CONSTRAINT [taxonomy_index_nid_df]  DEFAULT ((0)) FOR [nid]
GO
ALTER TABLE [dbo].[taxonomy_index] ADD  CONSTRAINT [taxonomy_index_tid_df]  DEFAULT ((0)) FOR [tid]
GO
ALTER TABLE [dbo].[taxonomy_index] ADD  CONSTRAINT [taxonomy_index_sticky_df]  DEFAULT ((0)) FOR [sticky]
GO
ALTER TABLE [dbo].[taxonomy_index] ADD  CONSTRAINT [taxonomy_index_created_df]  DEFAULT ((0)) FOR [created]
GO
ALTER TABLE [dbo].[taxonomy_index] ADD  DEFAULT (newid()) FOR [__pk]
GO
ALTER TABLE [dbo].[taxonomy_term_data] ADD  CONSTRAINT [taxonomy_term_data_vid_df]  DEFAULT ((0)) FOR [vid]
GO
ALTER TABLE [dbo].[taxonomy_term_data] ADD  CONSTRAINT [taxonomy_term_data_name_df]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[taxonomy_term_data] ADD  CONSTRAINT [taxonomy_term_data_weight_df]  DEFAULT ((0)) FOR [weight]
GO
ALTER TABLE [dbo].[taxonomy_term_hierarchy] ADD  CONSTRAINT [taxonomy_term_hierarchy_tid_df]  DEFAULT ((0)) FOR [tid]
GO
ALTER TABLE [dbo].[taxonomy_term_hierarchy] ADD  CONSTRAINT [taxonomy_term_hierarchy_parent_df]  DEFAULT ((0)) FOR [parent]
GO
ALTER TABLE [dbo].[authmap]  WITH CHECK ADD CHECK  (([aid]>=(0)))
GO
ALTER TABLE [dbo].[batch]  WITH CHECK ADD CHECK  (([bid]>=(0)))
GO
ALTER TABLE [dbo].[block_custom]  WITH CHECK ADD CHECK  (([bid]>=(0)))
GO
ALTER TABLE [dbo].[block_role]  WITH CHECK ADD CHECK  (([rid]>=(0)))
GO
ALTER TABLE [dbo].[blocked_ips]  WITH CHECK ADD CHECK  (([iid]>=(0)))
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD CHECK  (([status]>=(0)))
GO
ALTER TABLE [dbo].[date_formats]  WITH CHECK ADD CHECK  (([dfid]>=(0)))
GO
ALTER TABLE [dbo].[field_data_body]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_data_body]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_body]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_comment_body]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_data_comment_body]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_comment_body]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_image]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_image]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_image]  WITH CHECK ADD CHECK  (([field_image_fid]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_image]  WITH CHECK ADD CHECK  (([field_image_width]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_image]  WITH CHECK ADD CHECK  (([field_image_height]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_image]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_tags]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_tags]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_tags]  WITH CHECK ADD CHECK  (([field_tags_tid]>=(0)))
GO
ALTER TABLE [dbo].[field_data_field_tags]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_body]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_body]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_body]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_comment_body]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_comment_body]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_comment_body]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_image]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_image]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_image]  WITH CHECK ADD CHECK  (([field_image_fid]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_image]  WITH CHECK ADD CHECK  (([field_image_width]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_image]  WITH CHECK ADD CHECK  (([field_image_height]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_image]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_tags]  WITH CHECK ADD CHECK  (([delta]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_tags]  WITH CHECK ADD CHECK  (([entity_id]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_tags]  WITH CHECK ADD CHECK  (([field_tags_tid]>=(0)))
GO
ALTER TABLE [dbo].[field_revision_field_tags]  WITH CHECK ADD CHECK  (([revision_id]>=(0)))
GO
ALTER TABLE [dbo].[file_managed]  WITH CHECK ADD CHECK  (([filesize]>=(0)))
GO
ALTER TABLE [dbo].[file_managed]  WITH CHECK ADD CHECK  (([timestamp]>=(0)))
GO
ALTER TABLE [dbo].[file_managed]  WITH CHECK ADD CHECK  (([fid]>=(0)))
GO
ALTER TABLE [dbo].[file_managed]  WITH CHECK ADD CHECK  (([uid]>=(0)))
GO
ALTER TABLE [dbo].[file_usage]  WITH CHECK ADD CHECK  (([count]>=(0)))
GO
ALTER TABLE [dbo].[file_usage]  WITH CHECK ADD CHECK  (([fid]>=(0)))
GO
ALTER TABLE [dbo].[file_usage]  WITH CHECK ADD CHECK  (([id]>=(0)))
GO
ALTER TABLE [dbo].[filter_format]  WITH CHECK ADD CHECK  (([status]>=(0)))
GO
ALTER TABLE [dbo].[image_effects]  WITH CHECK ADD CHECK  (([ieid]>=(0)))
GO
ALTER TABLE [dbo].[image_effects]  WITH CHECK ADD CHECK  (([isid]>=(0)))
GO
ALTER TABLE [dbo].[image_styles]  WITH CHECK ADD CHECK  (([isid]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([mlid]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p1]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p2]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p3]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p4]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p5]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p6]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p7]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p8]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([p9]>=(0)))
GO
ALTER TABLE [dbo].[menu_links]  WITH CHECK ADD CHECK  (([plid]>=(0)))
GO
ALTER TABLE [dbo].[node]  WITH CHECK ADD CHECK  (([nid]>=(0)))
GO
ALTER TABLE [dbo].[node]  WITH CHECK ADD CHECK  (([tnid]>=(0)))
GO
ALTER TABLE [dbo].[node]  WITH CHECK ADD CHECK  (([vid]>=(0)))
GO
ALTER TABLE [dbo].[node_access]  WITH CHECK ADD CHECK  (([grant_view]>=(0)))
GO
ALTER TABLE [dbo].[node_access]  WITH CHECK ADD CHECK  (([grant_update]>=(0)))
GO
ALTER TABLE [dbo].[node_access]  WITH CHECK ADD CHECK  (([grant_delete]>=(0)))
GO
ALTER TABLE [dbo].[node_access]  WITH CHECK ADD CHECK  (([gid]>=(0)))
GO
ALTER TABLE [dbo].[node_access]  WITH CHECK ADD CHECK  (([nid]>=(0)))
GO
ALTER TABLE [dbo].[node_comment_statistics]  WITH CHECK ADD CHECK  (([comment_count]>=(0)))
GO
ALTER TABLE [dbo].[node_comment_statistics]  WITH CHECK ADD CHECK  (([nid]>=(0)))
GO
ALTER TABLE [dbo].[node_revision]  WITH CHECK ADD CHECK  (([nid]>=(0)))
GO
ALTER TABLE [dbo].[node_revision]  WITH CHECK ADD CHECK  (([vid]>=(0)))
GO
ALTER TABLE [dbo].[node_type]  WITH CHECK ADD CHECK  (([has_title]>=(0)))
GO
ALTER TABLE [dbo].[queue]  WITH CHECK ADD CHECK  (([item_id]>=(0)))
GO
ALTER TABLE [dbo].[role]  WITH CHECK ADD CHECK  (([rid]>=(0)))
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD CHECK  (([rid]>=(0)))
GO
ALTER TABLE [dbo].[search_dataset]  WITH CHECK ADD CHECK  (([reindex]>=(0)))
GO
ALTER TABLE [dbo].[search_dataset]  WITH CHECK ADD CHECK  (([sid]>=(0)))
GO
ALTER TABLE [dbo].[search_index]  WITH CHECK ADD CHECK  (([sid]>=(0)))
GO
ALTER TABLE [dbo].[search_node_links]  WITH CHECK ADD CHECK  (([nid]>=(0)))
GO
ALTER TABLE [dbo].[search_node_links]  WITH CHECK ADD CHECK  (([sid]>=(0)))
GO
ALTER TABLE [dbo].[sequences]  WITH CHECK ADD CHECK  (([value]>=(0)))
GO
ALTER TABLE [dbo].[sessions]  WITH CHECK ADD CHECK  (([uid]>=(0)))
GO
ALTER TABLE [dbo].[shortcut_set_users]  WITH CHECK ADD CHECK  (([uid]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_index]  WITH CHECK ADD CHECK  (([nid]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_index]  WITH CHECK ADD CHECK  (([tid]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_term_data]  WITH CHECK ADD CHECK  (([tid]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_term_data]  WITH CHECK ADD CHECK  (([vid]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_term_hierarchy]  WITH CHECK ADD CHECK  (([parent]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_term_hierarchy]  WITH CHECK ADD CHECK  (([tid]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_vocabulary]  WITH CHECK ADD CHECK  (([hierarchy]>=(0)))
GO
ALTER TABLE [dbo].[taxonomy_vocabulary]  WITH CHECK ADD CHECK  (([vid]>=(0)))
GO
ALTER TABLE [dbo].[url_alias]  WITH CHECK ADD CHECK  (([pid]>=(0)))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([uid]>=(0)))
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD CHECK  (([rid]>=(0)))
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD CHECK  (([uid]>=(0)))
GO
ALTER TABLE [dbo].[watchdog]  WITH CHECK ADD CHECK  (([severity]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [opcaim_drupal] SET  READ_WRITE 
GO
