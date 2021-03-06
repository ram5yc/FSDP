/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT IF EXISTS [FK_Locations_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenPositions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatus]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatus]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/31/2021 9:22:07 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNote] [varchar](200) NULL,
	[ApplicationStatus] [int] NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationStatus](
	[ApplicationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatus] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [varchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ManagerId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionId] [int] IDENTITY(1,1) NOT NULL,
	[PositionId] [int] NOT NULL,
	[LocationId] [int] NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/31/2021 9:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [nvarchar](75) NULL,
	[PhotoFileName] [varchar](75) NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103221916141_InitialCreate', N'FSDP.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2DBB61323E30BA6ED41DE066C89DD1646A2B412E5B511EC97E5219F945F4851A22EBCE9D22D77B7170B2CDC2279AA583C248BC5E2FCEF3FFF9DFEF41206D6334E523F2267F6D1E4D0B6307123CF27AB333BA3CB1F3ED93FFDF8C73F4C2FBDF0C5FA5AD63B61F5A02549CFEC274AE353C749DD271CA27412FA6E12A5D1924EDC2874901739C787877F738E8E1C0C10366059D6F44B46A81FE2FC07FC9C45C4C531CD507013793848F9772899E7A8D62D0A711A23179FD9D71E86B6F4758EC238C093A2816D9D073E0265E63858DA162224A28882AAA78F299ED32422AB790C1F50F0F01A63A8B744418A79174EEBEA7D7B7378CC7AE3D40D4B28374B69140E043C3AE1E671E4E66B19D9AECC0706BCCC8DC57A9D1BB1B6DF97280003C8024F6741C22A9FD9379588F334BEC57452369C14905709C0FD1A25DF274DC403AB77BB838A4EC79343F6DF8135CB029A25F88CE08C262838B0EEB345E0BBFFC4AF0FD1774CCE4E8E16CB934F1F3E22EFE4E35FF1C987664FA1AF504FF8009FEE9328C609E8869755FF6DCB11DB3972C3AA59A34D6115E012CC0CDBBA412F9F3159D1279833C79F6CEBCA7FC15EF98593EB91F83091A0114D32F8799B05015A04B82A775A65B2FFB7483DFEF07114A9B7E8D95FE5432FC9878993C0BCFA8283BC347DF2E3627A09E3FD8D57BB4AA290FD16F955947E9B4759E2B2CE44C62A0F2859612A6A37756AF2F6A234831A9FD625EAFE539B69AAD25B5B9575689D99508AD8F66C28F57D5BB9BD19771EC7307839B59845DA08A7DDAF2612C0817535BFB89F3C5E4F6EBECE6AF61CF5650F815EFD9E17C3CB10F9C108AB610F29E08B2CFD24C4552F7F8E807B880CD6F91EA5292C06DE3F50FAD4A23AFC3982EA73EC66096319059ABDB9B4FBA788E0DB2C5C30EA6F4FD66843F3F06B74855C1A259784B5DA18EF73E47E8F327A49BC0B44F123754B40F6F3C10FFB038CA2CEB9EBE234BD0232636F1681AB5D025E137A723C188E2D50BBF6466601F243BD3B222DA5DFCAAAB54BA2AFA1B825866A3AD7A44DD5CFD1CA27FD542DAB9A552D6A74AACAAB0D559581F5D394D7342B9A57E8D4B3A8359AB3978FD0F8DE5E0EBBFFEEDE669BB7692D6898710E2B24FE3B26388165CCBB4794E284D423D067DDD885B3900F1F13FAE67B532EE92B0AB2B145AD351BF24560FCD990C3EEFF6CC8D584CFCFBEC7BC921E67A0B232C0F7AAAF3F5E75CF3949B36D4F07A19BDB16BE9D35C0345DCED33472FD7C1668A25F3C7621EA0F3E9CD51DC8287A230743A06340749F6D79F005FA66CBA4BA231738C0145BE76E111D9CA1D4459E6A46E8903740B17247D52856074544E5FEA2C804A6E3843542EC1094C24CF50955A7854F5C3F4641A795A4963DB730D6F74A865C7281634C98C04E4BF411AE8F8130052A39D2A0745968EA3418D74E4483D76A1AF32E17B61E772534B1154E76F8CE065E72FFED4D88D96EB12D90B3DD247D1430C6F37641507E56E94B00F9E0B26F04954E4C068272976A2B04152DB603828A267977042D8EA87DC75F3AAFEE1B3DC583F2F6B7F55673ED809B823DF68C9A85EF096D28B4C0894ACF8B052BC42F547338033DF9F92CE5AEAE4C91FCF20053316453FBBB5A3FD469079149D4065813AD0394DF042A40CA841AA05C19CB6BD58E7B110360CBB85B2B2C5FFB25D8060754ECE68D68A3A2F9DE542667AFD347D5B38A0D0AC97B1D161A381A42C88B97D8F11E4631C56555C3F4F1858778C38D8EF1C168315087E76A3052D999D1AD5452B3DB4A3A876C884BB6919524F7C960A5B233A35B8973B4DB481AA760805BB09189C42D7CA4C956463AAADDA62A9B3A45AE14FF30750C4955D31B14C73E593592ACF8176B5E6458CD7E980FCF3B0A0B0CC74D35E94795B695241A256885A552100D9A5EF9494A2F10450BC4E23C332F54AA69F756C3F25F8A6C6E9FEA2096FB40599BFD2DAEEDE2FDBDB0DDAAFE0887B9824E86CCA9C923E91A0AE89B5B2CEF0D0528D104EF67519085C4EC63995B175778CDF6C5171561EA48FA2B3E946230C5D315ADDF6B6CD47931DE38555ECCFA6365863059BCF4419B3637F9A56694324CD5443185AE763676267766E878C9CEE2F0E1EA44789BD9C533549A00FCD3408C46928302D628EB8F2AE6A13431C592FE8852B24913522A1AA06533A54450B259B0169EC1A2FA1AFD25A849244D74B5B43FB2269DA409AD295E035BA3B35CD61F559371D204D614F7C7AED34FE475748FF72FE31166930DAC38E86EB6831930DE66511C67036CDCE737811A9F0762F11B7B058C7FDF4B42194F7B9B10AA08716C4628038679FD112EC3C5E5A7F506DF8C29DC700B4B7CDB0DBF196F186DDF941CCA794FAE5249AFCE7DD2F96ECACF5ADD2F6B94C35751C5B64A33C2F6FE9A521C4E5885C9FC976016F8982DE665851B44FC254E6991D5611F1F1E1D4B2F73F6E7958C93A65EA039AB9A9ECA8863B685042DF28C12F709256ABAC4062F496A5025127D4D3CFC7266FF3B6F759A0735D85FF9E703EB3A7D24FE2F19143C2419B67E53D33FC7C9ACEFF196A352F4B777F148A2BFC9AFFFF5AD687A60DD25309D4EAD43C9D0EB0CBFF87462903645D30DB459FB41C5FB9D6DC253052DAA345BD67F99B0F0E928AF124A2DFF14A2973F0F554DFBF2602344CDEB82B1F04631A1E9F5C03A58C697031EFCA4F9CB81619DD5BF24584735E32B029F0C0793DF10F45F86CA963BDC873467A66D2C49B99D3B73B0374AC8DCF5DEA4A46A6F34D1D574EC0170A3A65C6FE6A2BCB354E6D1B64E4DA6F268D8BBE4FD9BA727EF4B4672EDB4EF3611799BB9C72D374BBFAB94E33D4892D324FDEC3EB178DB5C330581F73C3B7358FAF09E918D6FF3BB4F12DE36D94C01E23D27DBA054E03DE3DAAEF6CF1D33ADF716BAF3C45E3547C97099A38B227725EE16217738FE2F222041E15116EF2DF59962266135598C02EB2A66A1E6143559B0327114B94A8D76B1C3FACA37FCD6CEF23AED620D899D6DB2F9FADF2A9BD769976D4897DC45CAB13661519706DEB18EB5E551BDA71463A1271D19ED5D3E6BEBCDFC7BCA281EC528C2EC31DC2EBF9F04E2514C32E6D4199030AC5E14C3DED9F8871A61FF4EFD550DC1FED946825D61D7ACEA5C9365546EDE924665152942738329F2604B3D4FA8BF442E85621680CE1F8CE7413D760DB2C0DE35B9CB689C51E8320E178110F0624E409BFC3C2B5AD4797A17B35FE9185D00357D16B8BF233F677EE0557A5F6962420608E65DF0702F1B4BCAC2BEABD70AE936223D81B8F92AA7E80187710060E91D99A367BC8E6E40BFCF7885DCD73A026802E91E08D1ECD30B1FAD1214A61CA36E0F3F81C35EF8F2E3FF01F6C36771AF540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (13, 4, N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', CAST(N'2021-03-25' AS Date), N' Received app 3/25', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (16, 4, N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', CAST(N'2021-03-25' AS Date), N' Received app 3/25', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (17, 5, N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', CAST(N'2021-03-26' AS Date), N' Talked with future employee on 3/23. Accepted position', 3, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (18, 8, N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', CAST(N'2021-03-26' AS Date), N' Received app on 3/26
', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (19, 14, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-26' AS Date), N' received app on 3/26', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (20, 15, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-26' AS Date), N' Currently under review. Seeing if other applicant accepts before moving forward.', 1, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (21, 10, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-26' AS Date), N' Not reviewed yet.', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (22, 9, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-26' AS Date), N' Reached out to set up an interview.', 2, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (23, 12, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-30' AS Date), N' ', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (24, 12, N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', CAST(N'2021-03-30' AS Date), N' ', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (25, 5, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-30' AS Date), N' ', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (26, 13, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-30' AS Date), N' ', 5, N'resume.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNote], [ApplicationStatus], [ResumeFilename]) VALUES (27, 16, N'06647a56-7274-422a-beaf-fb530b2f381a', CAST(N'2021-03-30' AS Date), N' ', 5, N'resume.pdf')
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 

INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (1, N'Under Review', NULL)
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (2, N'Interview Offer', NULL)
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (3, N'Accepted', NULL)
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (4, N'Declined', NULL)
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (5, N'Pending', NULL)
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'86e6534d-a4c6-4454-8550-e986169f40f0', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5cc4cce5-5a26-4e81-beee-74927a668c32', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f3a5d701-8630-441f-ada1-898e82c9b120', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'06647a56-7274-422a-beaf-fb530b2f381a', N'5cc4cce5-5a26-4e81-beee-74927a668c32')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', N'5cc4cce5-5a26-4e81-beee-74927a668c32')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00a705b4-939d-4145-8417-8b794a5b40b9', N'86e6534d-a4c6-4454-8550-e986169f40f0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'353be377-ec74-4e73-9ea7-7d349734d468', N'f3a5d701-8630-441f-ada1-898e82c9b120')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'55ae46a5-d0b9-4d5f-9c87-0490d4896cfc', N'f3a5d701-8630-441f-ada1-898e82c9b120')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a7a2d275-1824-4f8f-a8ee-e0dac794abf0', N'f3a5d701-8630-441f-ada1-898e82c9b120')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bbf0d96d-97ad-49a3-b37c-39691311ecd2', N'f3a5d701-8630-441f-ada1-898e82c9b120')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00a705b4-939d-4145-8417-8b794a5b40b9', N'admin@example.com', 0, N'AC1fpfAWY45Ihac1JRICj45C/GxAY5u6lNGJSQ3dwFyHQK/XpHUMcwzP6KIIb3K3QA==', N'0f10d32c-f6fa-436c-9dd3-13227c7b1499', NULL, 0, 0, NULL, 1, 0, N'admin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'06647a56-7274-422a-beaf-fb530b2f381a', N'employee2@example.com', 0, N'AJX7oi1y9uVyRxink8JsKHd7F88z5d279ZASvsNERwGhv86do1L2xWN26PkqBFQLDg==', N'222b5a75-2642-4b2b-943d-4c9a0f67e1ef', NULL, 0, 0, NULL, 1, 0, N'employee2@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'353be377-ec74-4e73-9ea7-7d349734d468', N'manager@chesterfield.com', 0, N'AHz8ew+rEYfKtXt284gisfqAPCfRFvwdPnh8fH0DP0lgOyastwg+9A/sMQcB1s1JvQ==', N'83617089-4697-4dc4-9641-63f3207f6d90', NULL, 0, 0, NULL, 1, 0, N'manager@chesterfield.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', N'employee@example.com', 0, N'ACTeFy02lEnhvocB+sapOJMFxPw2FXkk+US6IWDWl3KDmCnXEArUAmH6Tn2TJX9u/A==', N'219429e9-ee4d-4dc0-9dc5-e6c2d8720038', NULL, 0, 0, NULL, 1, 0, N'employee@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'55ae46a5-d0b9-4d5f-9c87-0490d4896cfc', N'manager@chicago.com', 0, N'AFyw/zcobYQFGK24Fi5lqpUrn4R3BOkjHJt++SKP3QUN6xKJTdx/494O9vujtiD/xA==', N'e7f015ec-6455-4897-ad93-aafe3594dcec', NULL, 0, 0, NULL, 1, 0, N'manager@chicago.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'961e32af-5631-4f8e-8ccf-de0ee3039c14', N'ram5yc@Mail.missouri.edu', 0, N'AK9H491csv6VFGXwaipeWhlmdff9yse68aZ9RmjzI2lw9rdrIUUhZgR/TXOKuZYI9g==', N'7814e898-7f24-43b9-b9ad-a983df664249', NULL, 0, 0, NULL, 1, 0, N'ram5yc@Mail.missouri.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a7a2d275-1824-4f8f-a8ee-e0dac794abf0', N'manager@columbia.com', 0, N'ACKc48MGCZS63GBMLsMEOYIuq1/rPXoo0OTQ9LexljQIpsRFYaTrXxzYEzgD8aagiw==', N'0f0b751a-7766-403e-9f44-df237a324ff3', NULL, 0, 0, NULL, 1, 0, N'manager@columbia.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bbf0d96d-97ad-49a3-b37c-39691311ecd2', N'manager@example.com', 0, N'AIoCLz3HaRxomiRDGB4cc7Si7VoVNDNvjRwgc8LXPyfkER0JTWGyanixjRJ4arBKWw==', N'0e6cb052-26e1-457d-8359-87708eb92dea', NULL, 0, 0, NULL, 1, 0, N'manager@example.com')
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (3, N'5', N'Roeland Park', N'KS', N'bbf0d96d-97ad-49a3-b37c-39691311ecd2')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (4, N'75', N'Columbia', N'MO', N'a7a2d275-1824-4f8f-a8ee-e0dac794abf0')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (5, N'22', N'Chesterfield', N'MO', N'353be377-ec74-4e73-9ea7-7d349734d468')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (6, N'2', N'Chicago', N'IL', N'55ae46a5-d0b9-4d5f-9c87-0490d4896cfc')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OpenPositions] ON 

INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (4, 2, 4)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (5, 5, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (6, 2, 4)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (7, 2, 3)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (8, 8, 5)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (9, 4, 3)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (10, 4, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (11, 4, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (12, 13, 4)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (13, 12, 5)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (14, 12, 5)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (15, 12, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PositionId], [LocationId]) VALUES (16, 3, 5)
SET IDENTITY_INSERT [dbo].[OpenPositions] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (1, N'Assistant Branch Manger', N'Works closely with the bank manager to ensure that all the processes and services a bank offers runs smoothly. He/she assists in directing and managing the tellers’ and loan officers’ jobs. He/she makes daily schedules and duties as well as trains the newly hired employees with the using of the machines and the like.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (2, N'Teller', N'Involved in customizing banking services and products for high-net individuals and businesses. They serve as a client’s financial adviser in developing a wealth management plan and assist clients in loan generation and investment referrals. As their job title suggests, personal bankers manage all aspects of a client’s portfolio, which includes insurance and investments.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (3, N'Personal Banker', N'Involved in customizing banking services and products for high-net individuals and businesses. They serve as a client’s financial adviser in developing a wealth management plan and assist clients in loan generation and investment referrals. As their job title suggests, personal bankers manage all aspects of a client’s portfolio, which includes insurance and investments.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (4, N'Administrative Assistant', N'Handle routine and advanced duties for other professionals. They organize files, create correspondence, prepare reports and documents, manage calendars to schedule appointments, sort mail, prepare invoices and offer general staff support.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (5, N'Fraud Specialist', N'Responsible for tracking and monitoring illegal transactions on customers'' financial accounts without the authorization of the account owner. Fraud specialists report any suspicious account movements and unusual transactions that may be risky to the financial institution and customers.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (6, N'IT Test Analyst', N'Responsible for creating and examining the functional specifications. Analyst has to develop efficient IT systems to suffice the business and technology needs. The IT Analyst collaborates with the developers to design and implement technology solutions.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (7, N'Payment Support Specialist', N'Receiving and sorting incoming payments with attention to credibility. Managing the status of accounts and balances and identifying inconsistencies. Issuing bills, receipts and invoices.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (8, N'Home Equity Processor', N'Performs a variety of clerical duties related to processing, closing, and administration of real estate loans. Process and fund Second Mortgages and Home Equity Lines of Credit.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (9, N'Financial Advisor', N'Provides financial planning and support to clients in order to help clients achieve their financial goals. Financial Advisors assist clients maintain their current assets and portfolios and assist with obtaining additional assets as necessary/desired.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (10, N'Branch Manager', N'Responsible for supervising and managing a bank branch. They will oversee financial reporting, hire and train staff, and grow branch revenue. Duties include managing and supervising employees, assisting customers, and providing excellent customer service.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (11, N'CFO', N'Plans, implements, manages and runs all the finance activities of a company, including business planning, budgeting, forecasting and negotiations.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (12, N'Customer Service Representative', N'Help customers with complaints and questions, give customers information about products and services, take orders, and process returns. By helping customers understand the product and answering questions about their reservations, they are sometimes seen as having a role in sales.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (13, N'Mortgage Loan Officer', N'Approves mortgage loans by examining application and supporting documentation; estimating credit-worthiness; calculating repayment risk. Competes mortgage loans by monitoring collection, verification, and preparation of mortgage loan documentation; scheduling and completing mortgage loan closing.')
SET IDENTITY_INSERT [dbo].[Positions] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'00a705b4-939d-4145-8417-8b794a5b40b9', N'Admin', N'Admin', N'admin@example', NULL, N'resume.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'06647a56-7274-422a-beaf-fb530b2f381a', N'Employee2', N'Employee', N'employee2@example.com', NULL, N'resume.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'353be377-ec74-4e73-9ea7-7d349734d468', N'Manager', N'Manager', N'manager@chesterfield.com', NULL, N'resume.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'4b2c60b1-3f9e-491a-b8b2-62567f827caa', N'Employee', N'Employee', N'employee@example.com', NULL, N'resume.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'55ae46a5-d0b9-4d5f-9c87-0490d4896cfc', N'Manager', N'Manager', N'manager@chicago.com', NULL, N'resume.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'a7a2d275-1824-4f8f-a8ee-e0dac794abf0', N'Manager', N'Manager', N'manager@columbia.com', NULL, N'resume.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email], [PhotoFileName], [ResumeFilename]) VALUES (N'bbf0d96d-97ad-49a3-b37c-39691311ecd2', N'Manager', N'Manager', N'manager@example.com', NULL, N'resume.pdf')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatus] FOREIGN KEY([ApplicationStatus])
REFERENCES [dbo].[ApplicationStatus] ([ApplicationStatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionId])
REFERENCES [dbo].[OpenPositions] ([OpenPositionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Locations_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_UserDetails] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Locations_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([PositionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
