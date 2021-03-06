USE [master]
GO
/****** Object:  Database [ORM]    Script Date: 6/10/2020 11:02:48 AM ******/
CREATE DATABASE [ORM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EWPS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ORM.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EWPS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ORM_log.ldf' , SIZE = 11200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ORM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ORM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ORM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ORM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ORM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ORM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ORM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ORM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ORM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ORM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ORM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ORM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ORM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ORM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ORM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ORM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ORM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ORM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ORM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ORM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ORM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ORM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ORM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ORM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ORM] SET RECOVERY FULL 
GO
ALTER DATABASE [ORM] SET  MULTI_USER 
GO
ALTER DATABASE [ORM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ORM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ORM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ORM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ORM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ORM', N'ON'
GO
USE [ORM]
GO
/****** Object:  UserDefinedTableType [dbo].[GooglePlusReviewsTableType]    Script Date: 6/10/2020 11:02:48 AM ******/
CREATE TYPE [dbo].[GooglePlusReviewsTableType] AS TABLE(
	[GoogleID] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[OverallRating] [decimal](2, 1) NULL,
	[Date] [datetime] NOT NULL,
	[GoogleReviewID] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[YelpReviewsTableType]    Script Date: 6/10/2020 11:02:48 AM ******/
CREATE TYPE [dbo].[YelpReviewsTableType] AS TABLE(
	[YelpID] [int] NOT NULL,
	[ReviewID] [nvarchar](256) NOT NULL,
	[Author] [nvarchar](256) NULL,
	[Rating] [decimal](3, 1) NULL,
	[Date] [datetime] NULL,
	[Text] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMAM_Menu_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMAM_Menu_ST](
	[MenuId] [int] NOT NULL,
	[ParentMenuId] [int] NULL,
	[MenuType] [char](1) NULL,
	[MenuDescription] [nvarchar](100) NULL,
	[IconPath] [nvarchar](100) NULL,
	[MenuSeq] [int] NULL,
	[urlPath] [nvarchar](500) NULL,
	[DefaultValue] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[RoleName] [nvarchar](50) NULL,
	[LocalizeId] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMAM_Menu_MenuId] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMAM_Proxies_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMAM_Proxies_ST](
	[IP] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMAM_ReviewSites_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMAM_ReviewSites_ST](
	[SiteID] [int] NOT NULL,
	[SiteName] [varchar](40) NULL,
	[ShortName] [char](1) NULL,
	[TimerValue] [int] NULL,
	[LastScrapeOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SMAM_ReviewSites_ST] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMAM_ReviewSiteTypes_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMAM_ReviewSiteTypes_ST](
	[SiteTypeID] [int] NOT NULL,
	[SiteTypeName] [varchar](40) NULL,
 CONSTRAINT [PK_SMAM_ReviewSiteTypes_ST] PRIMARY KEY CLUSTERED 
(
	[SiteTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMAM_SystemService_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMAM_SystemService_ST](
	[ServiceId] [int] NOT NULL,
	[ServiceName] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SMAM_SystemService_ST] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMIM_AccountType_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMIM_AccountType_ST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_SMIM_AccountType_ST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMIM_ReviewAccounts_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMIM_ReviewAccounts_ST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Inactive] [bit] NOT NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](35) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](10) NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Credentials] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[Website] [nvarchar](max) NULL,
	[NPI] [nvarchar](10) NULL,
	[Specialty] [nvarchar](256) NULL,
	[StoreCode] [nvarchar](20) NULL,
	[ReviewPullType] [int] NULL,
	[ProfilePullType] [int] NULL,
	[IsBenchmarkAccount] [bit] NULL,
	[Comments] [nvarchar](4000) NULL,
 CONSTRAINT [PK_SMIM_ReviewAccounts_ST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMIM_ReviewAccountSite_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMIM_ReviewAccountSite_ST](
	[AccountSiteID] [int] NOT NULL,
	[AccountID] [int] NULL,
	[ReviewSiteID] [int] NULL,
	[ReviewSiteTypeID] [int] NULL,
	[ReviewURL] [nvarchar](1000) NULL,
	[IsActive] [bit] NULL,
	[LastScrapeOn] [datetime] NULL,
	[SetInActive] [datetime] NULL,
	[EnableProfile] [bit] NULL,
 CONSTRAINT [PK_SMIM_ReviewAccountSite_ST] PRIMARY KEY CLUSTERED 
(
	[AccountSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMIM_UserAccess_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMIM_UserAccess_ST](
	[CoAccId] [int] NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Allow] [char](1) NULL,
 CONSTRAINT [PK_SMIM_UserAcc_CoAccId] PRIMARY KEY CLUSTERED 
(
	[CoAccId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMIM_UserMst_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMIM_UserMst_ST](
	[UserId] [int] NOT NULL,
	[UserTypeId] [int] NULL,
	[OrgId] [int] NULL,
	[CompanyId] [int] NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Salutation] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[LoginDate] [datetime] NULL,
	[CreateOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[SACId] [int] NULL,
 CONSTRAINT [PK_SMIM_UserMST_UserId] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMIM_UserType_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMIM_UserType_ST](
	[UserTypeId] [int] NOT NULL,
	[Type] [char](1) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMIM_UserType_UserTypeId] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMIM_UserTypeAccess_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMIM_UserTypeAccess_ST](
	[AccessId] [int] NOT NULL,
	[UserTypeId] [int] NULL,
	[AccessType] [char](1) NULL,
	[Description] [varchar](100) NULL,
	[Allow] [char](1) NULL,
	[RoleId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SMIM_UserType_AccessId] PRIMARY KEY CLUSTERED 
(
	[AccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMSA_Areas_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSA_Areas_ST](
	[AreaID] [int] NOT NULL,
	[Title] [nchar](10) NULL,
	[CityName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[CityID] [int] NULL,
	[CreateBy] [int] NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [PK_SMSA_Area_AreaID] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSA_Bank_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSA_Bank_ST](
	[BankId] [int] NOT NULL,
	[BankName] [nvarchar](80) NULL,
	[RoutingCode] [nvarchar](50) NULL,
	[IsMaster] [bit] NULL,
	[Agent_id] [int] NULL,
 CONSTRAINT [PK_SMSA_Bank_ST] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSA_City_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSA_City_ST](
	[CityID] [int] NOT NULL,
	[Title] [nchar](10) NULL,
	[CityName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[CreateBy] [int] NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [Key12] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSA_CompanyMst_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMSA_CompanyMst_ST](
	[OrgID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[logoPath] [nvarchar](max) NULL,
	[EstID] [nvarchar](50) NULL,
	[TotalEmp] [int] NULL,
	[Activity] [nvarchar](100) NULL,
	[Salutation] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Area] [nvarchar](100) NULL,
	[CityID] [int] NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[VerifyEmail] [nvarchar](50) NULL,
	[SaleAccId] [int] NULL,
	[IsActive] [char](1) NULL,
	[IsApproved] [char](1) NULL,
	[Terms] [char](1) NULL,
	[Balance] [decimal](18, 0) NULL,
	[SifCharges] [decimal](18, 0) NULL,
	[WPSUserId] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifyOn] [datetime] NULL,
	[ModifyBy] [int] NULL,
 CONSTRAINT [PK_SMSA_CompanyMst_CompanyID] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMSA_Country_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSA_Country_ST](
	[CountryID] [int] NOT NULL,
	[Title] [nchar](5) NULL,
	[CountryName] [nvarchar](50) NULL,
	[CountryCode] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [Key11] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSA_Logs_HI]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMSA_Logs_HI](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NULL,
	[ActivityType] [char](1) NULL,
	[ActivityDesc] [varchar](1000) NULL,
	[ActivityOn] [datetime] NULL,
	[ActivityBy] [int] NULL,
 CONSTRAINT [PK_SMSA_Logs_HI] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMSA_Organization_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMSA_Organization_ST](
	[OrgID] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[UserName] [nvarchar](50) NULL,
	[SaleAccId] [int] NULL,
	[Reference] [nvarchar](max) NULL,
	[OrgType] [char](1) NULL,
	[Status] [char](1) NULL,
	[Reason] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_SMSA_Organization_OrgID] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMSA_Roles_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSA_Roles_ST](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Header] [nvarchar](50) NULL,
	[FormName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMSA_Roles_RoleId] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSA_States_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSA_States_ST](
	[StateID] [int] NOT NULL,
	[Title] [nchar](10) NULL,
	[StateName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[CreateBy] [int] NULL,
	[CreateOn] [datetime] NULL,
 CONSTRAINT [PK_SMSA_States_StateID] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SRCC_GooglePlus_TR]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SRCC_GooglePlus_TR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteAccountID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[OverallRating] [decimal](2, 1) NULL,
	[ReviewCount] [int] NOT NULL,
	[APIReference] [varchar](300) NULL,
 CONSTRAINT [PK_SRCC_GooglePlus_TR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SRCC_GooglePlusReviews_TR]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SRCC_GooglePlusReviews_TR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoogleID] [int] NOT NULL,
	[GoogleReviewID] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[OverallRating] [decimal](2, 1) NULL,
	[Date] [datetime] NOT NULL,
	[Entered] [datetime] NULL,
	[AlertDate] [datetime] NULL,
	[ReviewStatusID] [int] NOT NULL,
	[Note] [varchar](1000) NULL,
 CONSTRAINT [PK_SRCC_GooglePlusReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SRCC_ReviewStatusTypes_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRCC_ReviewStatusTypes_ST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SRCC_ReviewStatusTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SRCC_SalesAccount_ST]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SRCC_SalesAccount_ST](
	[SaleAccId] [int] NOT NULL,
	[SaleAccount] [nvarchar](50) NULL,
	[AccountCode] [varchar](10) NULL,
	[AccountType] [char](1) NULL,
	[ParentSaleId] [int] NULL,
	[Address] [nvarchar](100) NULL,
	[Area] [nvarchar](100) NULL,
	[Phone] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_SRCC_SalesAccount_SaleAccId] PRIMARY KEY CLUSTERED 
(
	[SaleAccId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SRCC_Yelp_TR]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRCC_Yelp_TR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteAccountID] [int] NOT NULL,
	[Overall] [decimal](2, 1) NULL CONSTRAINT [DF_Yelp_Overall]  DEFAULT (NULL),
	[ReviewCount] [int] NOT NULL CONSTRAINT [DF_Yelp_ReviewCount]  DEFAULT ((0)),
 CONSTRAINT [PK_Yelp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SRCC_YelpReviews_TR]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SRCC_YelpReviews_TR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YelpID] [int] NOT NULL,
	[ReviewID] [nvarchar](256) NOT NULL,
	[Author] [nvarchar](256) NULL,
	[Rating] [decimal](2, 1) NULL,
	[Date] [datetime] NULL,
	[Text] [nvarchar](max) NULL,
	[Entered] [datetime] NULL CONSTRAINT [DF_SRCC_YelpReviews_Entered]  DEFAULT (getdate()),
	[AlertDate] [datetime] NULL,
	[ReviewStatusID] [int] NOT NULL CONSTRAINT [DF_SRCC_YelpReviews_ReviewStatusID]  DEFAULT ((1)),
	[Note] [varchar](1000) NULL,
 CONSTRAINT [PK_SRCC_YelpReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Vw_AccountToScrape]    Script Date: 6/10/2020 11:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Vw_AccountToScrape]
AS
SELECT        TOP (100) PERCENT g.ID AS SiteID, ra.AccountSiteID AS SiteAccountID, ra.ReviewSiteID AS TypeID, rat.SiteName AS Name, ra.AccountID, ra.ReviewURL AS URL, 
                         ra.LastScrapeOn AS LastPullDate,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            dbo.SRCC_GooglePlusReviews_TR AS fr
                               WHERE        (GoogleID = g.ID)) AS ReviewTableCount, ISNULL(ra.ReviewSiteTypeID, 0) AS SubTypeID, ISNULL(rast.SiteTypeName, '') AS SubTypeName, 
                         a.Description AS AccountName, c.CompanyName AS Client, 2 AS LoadDelayMillSeconds, a.AccountTypeID
FROM            dbo.SMAM_ReviewSites_ST AS rat INNER JOIN
                         dbo.SMIM_ReviewAccountSite_ST AS ra ON rat.SiteID = ra.ReviewSiteID LEFT OUTER JOIN
                         dbo.SRCC_GooglePlus_TR AS g ON g.SiteAccountID = ra.ReviewSiteID LEFT OUTER JOIN
                         dbo.SMAM_ReviewSiteTypes_ST AS rast ON rast.SiteTypeID = ra.ReviewSiteTypeID INNER JOIN
                         dbo.SMIM_ReviewAccounts_ST AS a ON a.ID = ra.AccountID INNER JOIN
                         dbo.SMSA_CompanyMst_ST AS c ON c.CompanyID = a.CompanyID
WHERE        (rat.SiteID = 1) AND (ISNULL(rat.IsActive, 1) = 1) AND (ISNULL(ra.IsActive, 1) = 1) AND (ISNULL(a.Inactive, 0) = 0) AND (ISNULL(c.IsActive, 'Y') = 'Y')
UNION ALL

SELECT        TOP (100) PERCENT g.ID AS SiteID, ra.AccountSiteID AS SiteAccountID, ra.ReviewSiteID AS TypeID, rat.SiteName AS Name, ra.AccountID, ra.ReviewURL AS URL, 
                         ra.LastScrapeOn AS LastPullDate,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            dbo.SRCC_YelpReviews_TR AS fr
                               WHERE        (YelpID = g.ID)) AS ReviewTableCount, ISNULL(ra.ReviewSiteTypeID, 0) AS SubTypeID, ISNULL(rast.SiteTypeName, '') AS SubTypeName, 
                         a.Description AS AccountName, c.CompanyName AS Client, 2 AS LoadDelayMillSeconds, a.AccountTypeID
FROM            dbo.SMAM_ReviewSites_ST AS rat INNER JOIN
                         dbo.SMIM_ReviewAccountSite_ST AS ra ON rat.SiteID = ra.ReviewSiteID LEFT OUTER JOIN
                         dbo.SRCC_Yelp_TR AS g ON g.SiteAccountID = ra.ReviewSiteID LEFT OUTER JOIN
                         dbo.SMAM_ReviewSiteTypes_ST AS rast ON rast.SiteTypeID = ra.ReviewSiteTypeID INNER JOIN
                         dbo.SMIM_ReviewAccounts_ST AS a ON a.ID = ra.AccountID INNER JOIN
                         dbo.SMSA_CompanyMst_ST AS c ON c.CompanyID = a.CompanyID
WHERE        (rat.SiteID = 2) AND (ISNULL(rat.IsActive, 1) = 1) AND (ISNULL(ra.IsActive, 1) = 1) AND (ISNULL(a.Inactive, 0) = 0) AND (ISNULL(c.IsActive, 'Y') = 'Y')


GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'ab94fec4-196e-4477-a7dc-ad3335681483', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cfbf551c-ec81-42d6-a847-62061871c243', N'admin123', 0, N'NOnN26mA2Hsr8dPhhZkbSw==', NULL, N'admin', N'admin', N'ok', N'ok', 1, 0, CAST(N'2018-11-23 11:37:44.000' AS DateTime), CAST(N'2019-10-16 16:09:33.590' AS DateTime), CAST(N'2018-12-19 10:23:24.130' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'27ee333b-8f98-421e-baea-3831c65d687e', N'6C5eH3jq', 0, N'xGbFgl6XsyuIT1j6Ifq6fA==', NULL, N'OrgabcAdmin', N'orgabcadmin', N'ok', N'ok', 1, 0, CAST(N'2018-11-25 08:29:30.000' AS DateTime), CAST(N'2018-11-25 08:29:30.000' AS DateTime), CAST(N'2018-11-25 08:29:30.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'299b6662-6d86-4963-9359-d298fa065541', N'g9847zLx', 0, N'tV+3vakRoXAZUD6rPTz3kQ==', NULL, N'abcAdmin', N'abcadmin', N'ok', N'ok', 1, 0, CAST(N'2018-11-25 08:31:44.000' AS DateTime), CAST(N'2018-11-25 08:31:44.000' AS DateTime), CAST(N'2018-11-25 08:31:44.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'06fb864f-9a6c-446e-8acb-de5966858645', N'1nekpcRE', 0, N'ti5D0Hxi4fAMGyHNm2iRPw==', NULL, N'cdeAdmin', N'cdeadmin', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 06:42:37.000' AS DateTime), CAST(N'2018-11-26 06:42:37.000' AS DateTime), CAST(N'2018-11-26 06:42:37.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'927d372f-2c0a-4b5a-a0c3-88974a51cafa', N'6f6QdetU', 0, N'7iKvYo5ljfcYwQlmnL8JTg==', NULL, N'Orgsingle001', N'orgsingle001', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:47:53.000' AS DateTime), CAST(N'2018-11-26 11:47:53.000' AS DateTime), CAST(N'2018-11-26 11:47:53.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'86f9463b-e6c2-4492-b78f-c72807d82bcb', N'LK000q2G', 0, N'ftWJO3oI5SLh0kAlc8eM3Q==', NULL, N'single001', N'single001', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:47:54.000' AS DateTime), CAST(N'2018-11-26 11:47:54.000' AS DateTime), CAST(N'2018-11-26 11:47:54.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'1b1bef68-ef16-4d43-a364-7643b809cacd', N'9qZKZ4Vp', 0, N'LzSGZY36EinfFue+4yRVEQ==', NULL, N'Orgagcgroup', N'orgagcgroup', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:55:33.000' AS DateTime), CAST(N'2018-11-26 11:55:33.000' AS DateTime), CAST(N'2018-11-26 11:55:33.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'85e539ce-1146-4211-9936-9d401d047b26', N'GbSd2PXy', 0, N'QkrFar668TGg5xbNzysKVA==', NULL, N'agcgroup', N'agcgroup', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:55:33.000' AS DateTime), CAST(N'2018-11-26 11:55:33.000' AS DateTime), CAST(N'2018-11-26 11:55:33.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'4976580a-794c-4801-b547-f62db6240956', N'fNmV9Btt', 0, N'IdJO+kK+X2LOJkcReux2Kg==', NULL, N'agccompany1', N'agccompany1', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:56:50.000' AS DateTime), CAST(N'2018-11-26 11:56:50.000' AS DateTime), CAST(N'2018-11-26 11:56:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ae73b856-01cf-4173-9365-f11638ceb44d', N'GblDVYSR', 0, N'GtRH6Fxoj1Smruoxg2mQYw==', NULL, N'Orgacdirect', N'orgacdirect', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:57:57.000' AS DateTime), CAST(N'2018-11-26 11:57:57.000' AS DateTime), CAST(N'2018-11-26 11:57:57.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'f5e8cc56-bdd7-4862-8ffd-1acae0c2e71b', N'F696cZve', 0, N'81U0kXSXUGMooxhOtWeu9w==', NULL, N'acdirect', N'acdirect', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:57:57.000' AS DateTime), CAST(N'2018-11-26 11:57:57.000' AS DateTime), CAST(N'2018-11-26 11:57:57.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'b0e6867c-4317-452f-af4f-2479686337a1', N'WRCVj0rO', 0, N'CiQa4FztBFU8NBzWcMx8TQ==', NULL, N'OrgsagcGroup', N'orgsagcgroup', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:58:50.000' AS DateTime), CAST(N'2018-11-26 11:58:50.000' AS DateTime), CAST(N'2018-11-26 11:58:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'1d73842a-05b3-4845-8e45-8df76fcbc716', N'lsCU0HVX', 0, N'ICzDaDP7aVRo/xTCHVaF7A==', NULL, N'sagcGroup', N'sagcgroup', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:58:50.000' AS DateTime), CAST(N'2018-11-26 11:58:50.000' AS DateTime), CAST(N'2018-11-26 11:58:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'c7c1ae70-f9db-40c4-8dac-de1441fca4a5', N'oVhugnVo', 0, N'oCDwiU2C5CbtO0fZ5VdAoA==', NULL, N'saccompany1', N'saccompany1', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 11:59:44.000' AS DateTime), CAST(N'2018-11-26 11:59:44.000' AS DateTime), CAST(N'2018-11-26 11:59:44.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'70a62366-7a8f-4790-b9e8-95799f2d8fca', N'O5dU6Uur', 0, N'lhFsi1QykXa0Zt3Sg/ZsKw==', NULL, N'OrgsaDirect', N'orgsadirect', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 12:00:27.000' AS DateTime), CAST(N'2018-11-26 12:00:27.000' AS DateTime), CAST(N'2018-11-26 12:00:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cffee345-0149-420b-b81f-9fbe4ab30b3d', N'8QKzHv31', 0, N'zjo9Bb6xEPwxlaB39dyRqQ==', NULL, N'saDirect', N'sadirect', N'ok', N'ok', 1, 0, CAST(N'2018-11-26 12:00:27.000' AS DateTime), CAST(N'2018-11-26 12:00:27.000' AS DateTime), CAST(N'2018-11-26 12:00:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e90e6611-5295-4d7a-9fff-f5bd9122f034', N'c1dSMKeg', 0, N'x1lfYAkFOLM9THmz3oe+pg==', NULL, N'jamaca', N'jamaca', N'ok', N'ok', 1, 0, CAST(N'2018-12-26 08:03:02.000' AS DateTime), CAST(N'2018-12-26 08:07:58.920' AS DateTime), CAST(N'2018-12-26 08:03:02.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'0a98195a-cb65-49c0-a2db-123b06a89159', N'vtSxSPeP', 0, N'c9fs38UFVHDL6mVGfqRm5w==', NULL, N'Orgtestcompany', N'orgtestcompany', N'ok', N'ok', 1, 0, CAST(N'2019-01-03 16:46:54.000' AS DateTime), CAST(N'2019-01-03 16:46:54.000' AS DateTime), CAST(N'2019-01-03 16:46:54.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'a8547259-0def-4ee1-958a-29b8d29b751d', N'tSImaFJT', 0, N'skXE2SUP9JfMRc5uF6Kk0Q==', NULL, N'testcompany', N'testcompany', N'ok', N'ok', 1, 0, CAST(N'2019-01-03 16:46:54.000' AS DateTime), CAST(N'2019-01-03 16:46:54.000' AS DateTime), CAST(N'2019-01-03 16:46:54.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'43b393ae-6435-4115-961b-c1d9221e7b27', N'krZh7hoP', 0, N'9/fuHJtLMOZcs7aANFOAtA==', NULL, N'Sub User 1', N'sub user 1', N'ok', N'ok', 1, 0, CAST(N'2019-01-17 06:24:49.000' AS DateTime), CAST(N'2019-01-17 06:24:49.000' AS DateTime), CAST(N'2019-01-17 06:24:49.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'95850e55-49e8-4800-9eef-e618212da19a', N'c7J8s0hd', 0, N'nbYtG6rvjZUiGRi/zATMhg==', NULL, N'Orgismail001', N'orgismail001', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:05:12.000' AS DateTime), CAST(N'2019-02-24 11:05:12.000' AS DateTime), CAST(N'2019-02-24 11:05:12.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'09589833-3d9f-4482-9ac2-ec8ad19e37f8', N'jHqm4Zw3', 0, N'O6vj0TpgannfP8aGwG0O6Q==', NULL, N'ismail001', N'ismail001', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:05:20.000' AS DateTime), CAST(N'2019-02-24 11:05:20.000' AS DateTime), CAST(N'2019-02-24 11:05:20.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'080468e0-d6a8-49e5-b3e5-b1c48b5342a7', N'3HlIR67O', 0, N'FFdzzxPpChOoL7SIIQr+Rw==', NULL, N'Orgjaff001', N'orgjaff001', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:09:55.000' AS DateTime), CAST(N'2019-02-24 11:09:55.000' AS DateTime), CAST(N'2019-02-24 11:09:55.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ef58d1ab-dc3b-46cb-a583-ba87c96a1169', N'Df7OnPyh', 0, N'st+6sGD6Jc9c/p/ovv2fuw==', NULL, N'jaff001', N'jaff001', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:09:56.000' AS DateTime), CAST(N'2019-02-24 11:09:56.000' AS DateTime), CAST(N'2019-02-24 11:09:56.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'324ace5a-366c-4364-af2a-5d04851fee01', N'y6JNcPb4', 0, N'a/02o0IYjf6KL9Gvm3uLQA==', NULL, N'Orgcmc', N'orgcmc', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:13:41.000' AS DateTime), CAST(N'2019-02-24 11:13:41.000' AS DateTime), CAST(N'2019-02-24 11:13:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ac58c6bf-556d-4eb8-aee2-1acb85f8bd74', N'J9lRqnd2', 0, N'IOph4qYGo1iyF9oNxMa0lw==', NULL, N'cmc', N'cmc', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:13:41.000' AS DateTime), CAST(N'2019-02-24 11:13:41.000' AS DateTime), CAST(N'2019-02-24 11:13:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'88e9f455-2c8d-4f5f-b992-1e4f9b79ffd3', N'XcnDwTdq', 0, N'jmtTjm2jgdsnxIqWnAmK+Q==', NULL, N'Orgdirect001', N'orgdirect001', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:14:04.000' AS DateTime), CAST(N'2019-02-24 11:14:04.000' AS DateTime), CAST(N'2019-02-24 11:14:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ef9c4c48-8cab-4de4-ad78-becf3ad37a1a', N'5PgMTJ1O', 0, N'bpVPmKGNBGERgHqx2lKadA==', NULL, N'direct001', N'direct001', N'ok', N'ok', 1, 0, CAST(N'2019-02-24 11:14:04.000' AS DateTime), CAST(N'2019-02-24 11:14:04.000' AS DateTime), CAST(N'2019-02-24 11:14:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'80370bfa-1286-4fa7-9da5-3f20da99036d', N'aE0erM95', 0, N'VlhsnFMIHTUh7963s1UaRQ==', NULL, N'Orgcontact1', N'orgcontact1', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:24.000' AS DateTime), CAST(N'2019-03-18 11:13:24.000' AS DateTime), CAST(N'2019-03-18 11:13:24.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'600ee296-8a74-47fb-866d-791ff8b7c0fe', N'C5cgrtmH', 0, N'LQ7jOlUDNRH9r0PN7jDfjA==', NULL, N'contact1', N'contact1', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:24.000' AS DateTime), CAST(N'2019-03-18 11:13:24.000' AS DateTime), CAST(N'2019-03-18 11:13:24.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'89feb5df-ab6d-4b91-b585-93d71dec0efa', N'yjG0q8EN', 0, N'rA3VEVEPapmZkqzQXSLBFg==', NULL, N'Orgcontact3', N'orgcontact3', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'a18ffc84-fdbd-4389-9c1d-16c7aafc9658', N'yWp59wFG', 0, N'y/X05wx2DhdLlhxcnCRyfA==', NULL, N'contact3', N'contact3', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'fabec224-c5c1-4661-9686-2ec751fa75f8', N'Vv8g8KF4', 0, N'TSmbuApK6pmAPNwRGuxyUw==', NULL, N'Orgcontact4', N'orgcontact4', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'2019-03-18 11:13:25.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'c8da4f97-4215-46f5-8941-48588375f2fa', N'LLbBtM6n', 0, N'ana8Xt+Ai4qVLW0yWG8W7w==', NULL, N'contact4', N'contact4', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'493d511d-bae2-4dbe-bf4d-cbfdac23edc7', N'd7GnyS3z', 0, N'M3wbCcX08i7OgDmoQxZAcA==', NULL, N'Orgcontact5', N'orgcontact5', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'8124b3a4-c8ca-434a-aeee-708ddec960ed', N'cr0pjzap', 0, N'CEqDr/0V+KqLcPJxRddYFQ==', NULL, N'contact5', N'contact5', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'acb5983b-6e03-4b6e-b9dc-8319e4e67a5e', N'ZUUvpqfh', 0, N'NBUVczLREnYf1D4whPETOA==', NULL, N'Orgcontact6', N'orgcontact6', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'2019-03-18 11:13:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e031fe5f-a8f8-4da5-8ee7-5cadfeda7d3a', N'QvAghchg', 0, N'9u8Dh/6DbG4ejB+q8pgHlA==', NULL, N'contact6', N'contact6', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:13:27.000' AS DateTime), CAST(N'2019-03-18 11:13:27.000' AS DateTime), CAST(N'2019-03-18 11:13:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'51f6fd74-9bda-440a-92f8-b337a5b2e901', N'w95xAS9e', 0, N'QF/tz/4U9kHw5qb2+aHwpg==', NULL, N'Orgcontact7', N'orgcontact7', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:14:59.000' AS DateTime), CAST(N'2019-03-18 11:14:59.000' AS DateTime), CAST(N'2019-03-18 11:14:59.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'718941e5-bc79-476d-9e19-3898251c6c04', N'cbcMGyvC', 0, N'pGEBN9gK/Ue0Bs9T4AhBLA==', NULL, N'contact7', N'contact7', N'ok', N'ok', 1, 0, CAST(N'2019-03-18 11:14:59.000' AS DateTime), CAST(N'2019-03-18 11:14:59.000' AS DateTime), CAST(N'2019-03-18 11:14:59.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'c4696aaa-945f-4b3a-9a94-4549d4230545', N'xRHNqj0u', 0, N'bmtfEX0mSFV7h8tAK7i6Fg==', NULL, N'OrgSathish_user1', N'orgsathish_user1', N'ok', N'ok', 1, 0, CAST(N'2019-03-19 06:51:11.000' AS DateTime), CAST(N'2019-03-19 06:51:11.000' AS DateTime), CAST(N'2019-03-19 06:51:11.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'd5ddf613-1228-4768-93e4-7676faed24b9', N'MfmiIpfh', 0, N'nfgm3cdAL7eLc0kZhB5Gzg==', NULL, N'Sathish_user1', N'sathish_user1', N'ok', N'ok', 1, 0, CAST(N'2019-03-19 06:51:19.000' AS DateTime), CAST(N'2019-03-19 06:51:19.000' AS DateTime), CAST(N'2019-03-19 06:51:19.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'406b62d3-9235-4237-ba99-efa929bf5071', N'Wd0Do2Xd', 0, N'ROp0TotLw6zzBWYB7tJD0w==', NULL, N'Sathish1_user1', N'sathish1_user1', N'ok', N'ok', 1, 0, CAST(N'2019-03-19 06:53:50.000' AS DateTime), CAST(N'2019-03-19 06:53:50.000' AS DateTime), CAST(N'2019-03-19 06:53:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'32931e77-74a5-4ff1-9bf4-d9847802a2cc', N'mlEcbT5f', 0, N'+t8JPJRvs8CeADaX6MeAxg==', NULL, N'OrgASathish_user1', N'orgasathish_user1', N'ok', N'ok', 1, 0, CAST(N'2019-03-19 07:06:37.000' AS DateTime), CAST(N'2019-03-19 07:06:37.000' AS DateTime), CAST(N'2019-03-19 07:06:37.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e9e6b297-c0c2-4da8-8a98-f25e5baf341f', N'3S0V2xiB', 0, N'ZPGlmbm7qv9dWbtmlL/k9A==', NULL, N'ASathish_user1', N'asathish_user1', N'ok', N'ok', 1, 0, CAST(N'2019-03-19 07:06:42.000' AS DateTime), CAST(N'2019-03-19 07:06:42.000' AS DateTime), CAST(N'2019-03-19 07:06:42.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e4c9cbda-8176-4094-85c3-4f64cf7f403a', N'CEDZ0Lqc', 0, N'nmMMr2eKzmyrPHVnjqwTIg==', NULL, N'Orgtetete', N'orgtetete', N'ok', N'ok', 1, 0, CAST(N'2019-03-26 08:32:26.000' AS DateTime), CAST(N'2019-03-26 08:32:26.000' AS DateTime), CAST(N'2019-03-26 08:32:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'9293886d-5fc8-4196-930e-1a457286ce0f', N'2JyELEyx', 0, N'wzLZt0zeMcxOEhQF/v6yxA==', NULL, N'tetete', N'tetete', N'ok', N'ok', 1, 0, CAST(N'2019-03-26 08:32:26.000' AS DateTime), CAST(N'2019-03-26 08:32:26.000' AS DateTime), CAST(N'2019-03-26 08:32:26.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'75a0bab2-2f66-414b-a704-65f01ea110d4', N'SjelRM8y', 0, N'HXJ0lhkBqAzdSikSAkRgbg==', NULL, N'Orgtrtrtr', N'orgtrtrtr', N'ok', N'ok', 1, 0, CAST(N'2019-03-26 08:33:00.000' AS DateTime), CAST(N'2019-03-26 08:33:00.000' AS DateTime), CAST(N'2019-03-26 08:33:00.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'142f43c0-f589-4037-8c4c-883583068f1d', N'KURgZSQL', 0, N'44YKonvVIxnDYj74NMf4CQ==', NULL, N'trtrtr', N'trtrtr', N'ok', N'ok', 1, 0, CAST(N'2019-03-26 08:33:00.000' AS DateTime), CAST(N'2019-03-26 08:33:00.000' AS DateTime), CAST(N'2019-03-26 08:33:00.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'16b54a6b-f26f-43c0-a30e-35e0adb53077', N'Qq3C2cxh', 0, N'/h1ACnBBOqwatK+VhH341g==', NULL, N'Orgfinalfinal120', N'orgfinalfinal120', N'ok', N'ok', 1, 0, CAST(N'2019-04-02 10:36:40.000' AS DateTime), CAST(N'2019-04-02 10:36:40.000' AS DateTime), CAST(N'2019-04-02 10:36:40.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ab8de455-a84c-4527-8470-8d6568310bf4', N'evtDsCUf', 0, N'BYHOTxSN88OZepYtV8w6PQ==', NULL, N'finalfinal120', N'finalfinal120', N'ok', N'ok', 1, 0, CAST(N'2019-04-02 10:36:45.000' AS DateTime), CAST(N'2019-04-02 10:36:45.000' AS DateTime), CAST(N'2019-04-02 10:36:45.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'0ca759b8-1d8b-4889-8a7b-ff36f39fe2b0', N'R4EatrL0', 0, N'3panciHWq/ljOwDFYDTERA==', NULL, N'OrgMycompany', N'orgmycompany', N'ok', N'ok', 1, 0, CAST(N'2019-04-08 07:47:36.000' AS DateTime), CAST(N'2019-04-08 07:47:36.000' AS DateTime), CAST(N'2019-04-08 07:47:36.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'3dc23923-ffd5-4368-aeec-ca2b6d560974', N'HHnjyLgj', 0, N'zMt8F3OaiVctCG1R47MbwQ==', NULL, N'Mycompany', N'mycompany', N'ok', N'ok', 1, 0, CAST(N'2019-04-08 07:47:40.000' AS DateTime), CAST(N'2019-04-08 07:47:40.000' AS DateTime), CAST(N'2019-04-08 07:47:40.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'5d52e1ba-d420-4e79-8408-a2dc022a8be8', N'7E6hLQtn', 0, N'j/CnBEM6tuNqHvJebMq9JA==', NULL, N'Orgdontknow', N'orgdontknow', N'ok', N'ok', 1, 0, CAST(N'2019-04-08 07:50:05.000' AS DateTime), CAST(N'2019-04-08 07:50:05.000' AS DateTime), CAST(N'2019-04-08 07:50:05.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'7f5d9c55-2b61-429d-bb16-46ddf721dc72', N'zMtzAQFe', 0, N'2DXaUkxbpzE4L5ng2XgGGQ==', NULL, N'dontknow', N'dontknow', N'ok', N'ok', 1, 0, CAST(N'2019-04-08 07:50:07.000' AS DateTime), CAST(N'2019-04-08 07:50:07.000' AS DateTime), CAST(N'2019-04-08 07:50:07.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'82dca12f-5bca-43bd-8fca-30627d73db17', N'vSKkiSFp', 0, N'ErcExK4PuhhQ7sIrsc4VxA==', NULL, N'ASathish1_user1', N'asathish1_user1', N'ok', N'ok', 1, 0, CAST(N'2019-03-19 07:07:40.000' AS DateTime), CAST(N'2019-03-19 07:07:40.000' AS DateTime), CAST(N'2019-03-19 07:07:40.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'2e780a91-8998-4099-b18b-1cea1fa4deed', N'Insert Role', N'insert role', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'052d7788-4087-4fbe-98e8-209ff9999263', N'Edit Role', N'edit role', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'0b74d92b-9ebd-4742-8e2a-e93776c91762', N'Delete Role', N'delete role', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'b5896a9a-ee0d-4dff-8788-4e050156f57d', N'View Role', N'view role', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'fe667dc4-74a2-4a5a-abd9-9212a48a901d', N'Insert User Type', N'insert user type', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'358aef2b-c3f3-420c-ba32-d41389087f16', N'Edit User Type', N'edit user type', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'a78eff4e-68f1-4227-8696-e3d9ea7681e9', N'Delete User Type', N'delete user type', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'9e55a01d-11a8-46d0-9003-3b055537b173', N'View User Type', N'view user type', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8', N'System Administration', N'system administration', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'b9ed80b6-6350-4031-b431-0949b63ccac5', N'View Assign Role', N'view assign role', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'7809c384-69a7-47f0-826f-fa796f446eda', N'View Menu', N'view menu', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'6f6652f0-123f-4a9b-a4c0-04ccc47771ec', N'View User', N'view user', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'148df38a-46de-48d3-be50-cc7650eaa80a', N'User Management', N'user management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'8621c981-9711-4cfb-b4e9-5ed0070c84bb', N'View Bank', N'view bank', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'36dca28a-3234-4273-a19e-510837d3b4c5', N'View Sale Account', N'view sale account', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'b8c51c39-d369-4b12-9f53-2fe40893dbb8', N'View Company', N'view company', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'bc775c9c-6c54-4994-ad9e-18a284ddd683', N'View Deduction', N'view deduction', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'698ce7b6-9638-4e8e-9f71-6dc2f00e57b8', N'Employee Operation', N'employee operation', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'898c0bad-653d-455b-bfe7-881ee3a354a0', N'PAF Management', N'paf management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'efc7f424-b6d3-47de-8f10-d06d35c6c483', N'Approve Employee', N'approve employee', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'2119360e-6a51-4730-8ae5-81fcda46eb94', N'Delete Uploaded Employee', N'delete uploaded employee', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'300fe82d-ddd4-4f9d-8682-62c7b27deb85', N'Verify Sif', N'verify sif', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'd67185ad-6281-4d00-a4dc-6ed3937d9482', N'View Employee', N'view employee', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'946f5a1d-986f-4608-9d5b-00116c44009c', N'Company Management', N'company management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cf790107-8c55-413d-9fa3-2bb8e832cde7', N'Employee Management', N'employee management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'dffcfc38-c5ff-4b71-897c-2c8f7a9881a9', N'SIF Management', N'sif management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'4efdbc1b-ce07-49a5-b23b-7c186e5eada3', N'Generate SIF', N'generate sif', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'73d87242-44ed-4eb1-a5d9-de53fd7fab23', N'Approve SIF', N'approve sif', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'db0b02d6-d856-4f34-81f3-e7153c747d75', N'Upload SIF', N'upload sif', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'baf09bf5-9ec0-499c-bcca-e0bbd0edc1a5', N'View Group', N'view group', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'3b22aa0d-ca86-4867-9f0c-9bef274e045c', N'Insert Group', N'insert group', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'4e3989a2-3f90-404a-8a13-919e5b5c9771', N'Edit Group', N'edit group', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'98a9db7f-09de-40ec-a572-d831e33ab508', N'Delete Group', N'delete group', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cfbf551c-ec81-42d6-a847-62061871c243', N'admin', N'admin', NULL, 0, CAST(N'2019-10-16 16:09:33.590' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'27ee333b-8f98-421e-baea-3831c65d687e', N'OrgabcAdmin', N'orgabcadmin', NULL, 0, CAST(N'2018-11-25 08:29:30.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'299b6662-6d86-4963-9359-d298fa065541', N'abcAdmin', N'abcadmin', NULL, 0, CAST(N'2018-11-25 08:31:44.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'06fb864f-9a6c-446e-8acb-de5966858645', N'cdeAdmin', N'cdeadmin', NULL, 0, CAST(N'2018-11-26 06:42:37.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'927d372f-2c0a-4b5a-a0c3-88974a51cafa', N'Orgsingle001', N'orgsingle001', NULL, 0, CAST(N'2018-11-26 11:47:53.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'86f9463b-e6c2-4492-b78f-c72807d82bcb', N'single001', N'single001', NULL, 0, CAST(N'2018-11-26 11:47:54.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'1b1bef68-ef16-4d43-a364-7643b809cacd', N'Orgagcgroup', N'orgagcgroup', NULL, 0, CAST(N'2018-11-26 11:55:33.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'85e539ce-1146-4211-9936-9d401d047b26', N'agcgroup', N'agcgroup', NULL, 0, CAST(N'2018-11-26 11:55:33.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'4976580a-794c-4801-b547-f62db6240956', N'agccompany1', N'agccompany1', NULL, 0, CAST(N'2018-11-26 11:56:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ae73b856-01cf-4173-9365-f11638ceb44d', N'Orgacdirect', N'orgacdirect', NULL, 0, CAST(N'2018-11-26 11:57:57.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'f5e8cc56-bdd7-4862-8ffd-1acae0c2e71b', N'acdirect', N'acdirect', NULL, 0, CAST(N'2018-11-26 11:57:57.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'b0e6867c-4317-452f-af4f-2479686337a1', N'OrgsagcGroup', N'orgsagcgroup', NULL, 0, CAST(N'2018-11-26 11:58:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'1d73842a-05b3-4845-8e45-8df76fcbc716', N'sagcGroup', N'sagcgroup', NULL, 0, CAST(N'2018-11-26 11:58:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'c7c1ae70-f9db-40c4-8dac-de1441fca4a5', N'saccompany1', N'saccompany1', NULL, 0, CAST(N'2018-11-26 11:59:44.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'70a62366-7a8f-4790-b9e8-95799f2d8fca', N'OrgsaDirect', N'orgsadirect', NULL, 0, CAST(N'2018-11-26 12:00:27.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cffee345-0149-420b-b81f-9fbe4ab30b3d', N'saDirect', N'sadirect', NULL, 0, CAST(N'2018-11-26 12:00:27.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e90e6611-5295-4d7a-9fff-f5bd9122f034', N'jamaca', N'jamaca', NULL, 0, CAST(N'2018-12-26 08:07:58.920' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'0a98195a-cb65-49c0-a2db-123b06a89159', N'Orgtestcompany', N'orgtestcompany', NULL, 0, CAST(N'2019-01-03 16:46:54.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'a8547259-0def-4ee1-958a-29b8d29b751d', N'testcompany', N'testcompany', NULL, 0, CAST(N'2019-01-03 16:46:54.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'43b393ae-6435-4115-961b-c1d9221e7b27', N'Sub User 1', N'sub user 1', NULL, 0, CAST(N'2019-01-17 06:24:49.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'95850e55-49e8-4800-9eef-e618212da19a', N'Orgismail001', N'orgismail001', NULL, 0, CAST(N'2019-02-24 11:05:12.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'09589833-3d9f-4482-9ac2-ec8ad19e37f8', N'ismail001', N'ismail001', NULL, 0, CAST(N'2019-02-24 11:05:20.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'080468e0-d6a8-49e5-b3e5-b1c48b5342a7', N'Orgjaff001', N'orgjaff001', NULL, 0, CAST(N'2019-02-24 11:09:55.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ef58d1ab-dc3b-46cb-a583-ba87c96a1169', N'jaff001', N'jaff001', NULL, 0, CAST(N'2019-02-24 11:09:56.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'324ace5a-366c-4364-af2a-5d04851fee01', N'Orgcmc', N'orgcmc', NULL, 0, CAST(N'2019-02-24 11:13:41.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ac58c6bf-556d-4eb8-aee2-1acb85f8bd74', N'cmc', N'cmc', NULL, 0, CAST(N'2019-02-24 11:13:41.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'88e9f455-2c8d-4f5f-b992-1e4f9b79ffd3', N'Orgdirect001', N'orgdirect001', NULL, 0, CAST(N'2019-02-24 11:14:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ef9c4c48-8cab-4de4-ad78-becf3ad37a1a', N'direct001', N'direct001', NULL, 0, CAST(N'2019-02-24 11:14:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'80370bfa-1286-4fa7-9da5-3f20da99036d', N'Orgcontact1', N'orgcontact1', NULL, 0, CAST(N'2019-03-18 11:13:24.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'600ee296-8a74-47fb-866d-791ff8b7c0fe', N'contact1', N'contact1', NULL, 0, CAST(N'2019-03-18 11:13:24.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'89feb5df-ab6d-4b91-b585-93d71dec0efa', N'Orgcontact3', N'orgcontact3', NULL, 0, CAST(N'2019-03-18 11:13:25.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'a18ffc84-fdbd-4389-9c1d-16c7aafc9658', N'contact3', N'contact3', NULL, 0, CAST(N'2019-03-18 11:13:25.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'fabec224-c5c1-4661-9686-2ec751fa75f8', N'Orgcontact4', N'orgcontact4', NULL, 0, CAST(N'2019-03-18 11:13:25.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'c8da4f97-4215-46f5-8941-48588375f2fa', N'contact4', N'contact4', NULL, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'493d511d-bae2-4dbe-bf4d-cbfdac23edc7', N'Orgcontact5', N'orgcontact5', NULL, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'8124b3a4-c8ca-434a-aeee-708ddec960ed', N'contact5', N'contact5', NULL, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'acb5983b-6e03-4b6e-b9dc-8319e4e67a5e', N'Orgcontact6', N'orgcontact6', NULL, 0, CAST(N'2019-03-18 11:13:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e031fe5f-a8f8-4da5-8ee7-5cadfeda7d3a', N'contact6', N'contact6', NULL, 0, CAST(N'2019-03-18 11:13:27.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'51f6fd74-9bda-440a-92f8-b337a5b2e901', N'Orgcontact7', N'orgcontact7', NULL, 0, CAST(N'2019-03-18 11:14:59.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'718941e5-bc79-476d-9e19-3898251c6c04', N'contact7', N'contact7', NULL, 0, CAST(N'2019-03-18 11:14:59.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'c4696aaa-945f-4b3a-9a94-4549d4230545', N'OrgSathish_user1', N'orgsathish_user1', NULL, 0, CAST(N'2019-03-19 06:51:11.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'd5ddf613-1228-4768-93e4-7676faed24b9', N'Sathish_user1', N'sathish_user1', NULL, 0, CAST(N'2019-03-19 06:51:19.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'406b62d3-9235-4237-ba99-efa929bf5071', N'Sathish1_user1', N'sathish1_user1', NULL, 0, CAST(N'2019-03-19 06:53:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'32931e77-74a5-4ff1-9bf4-d9847802a2cc', N'OrgASathish_user1', N'orgasathish_user1', NULL, 0, CAST(N'2019-03-19 07:06:37.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e4c9cbda-8176-4094-85c3-4f64cf7f403a', N'Orgtetete', N'orgtetete', NULL, 0, CAST(N'2019-03-26 08:32:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'9293886d-5fc8-4196-930e-1a457286ce0f', N'tetete', N'tetete', NULL, 0, CAST(N'2019-03-26 08:32:26.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'75a0bab2-2f66-414b-a704-65f01ea110d4', N'Orgtrtrtr', N'orgtrtrtr', NULL, 0, CAST(N'2019-03-26 08:33:00.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'142f43c0-f589-4037-8c4c-883583068f1d', N'trtrtr', N'trtrtr', NULL, 0, CAST(N'2019-03-26 08:33:00.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'16b54a6b-f26f-43c0-a30e-35e0adb53077', N'Orgfinalfinal120', N'orgfinalfinal120', NULL, 0, CAST(N'2019-04-02 10:36:40.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'0ca759b8-1d8b-4889-8a7b-ff36f39fe2b0', N'OrgMycompany', N'orgmycompany', NULL, 0, CAST(N'2019-04-08 07:47:36.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'3dc23923-ffd5-4368-aeec-ca2b6d560974', N'Mycompany', N'mycompany', NULL, 0, CAST(N'2019-04-08 07:47:40.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'5d52e1ba-d420-4e79-8408-a2dc022a8be8', N'Orgdontknow', N'orgdontknow', NULL, 0, CAST(N'2019-04-08 07:50:05.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'7f5d9c55-2b61-429d-bb16-46ddf721dc72', N'dontknow', N'dontknow', NULL, 0, CAST(N'2019-04-08 07:50:07.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e9e6b297-c0c2-4da8-8a98-f25e5baf341f', N'ASathish_user1', N'asathish_user1', NULL, 0, CAST(N'2019-03-19 07:06:42.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'82dca12f-5bca-43bd-8fca-30627d73db17', N'ASathish1_user1', N'asathish1_user1', NULL, 0, CAST(N'2019-03-19 07:07:40.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ab8de455-a84c-4527-8470-8d6568310bf4', N'finalfinal120', N'finalfinal120', NULL, 0, CAST(N'2019-04-02 10:36:45.000' AS DateTime))
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (1, NULL, N'P', N'System Management', N'fas fa-cogs', 1, N'#', NULL, 1, CAST(N'2015-11-30 16:32:51.177' AS DateTime), N'System Administration', N'System Administration')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (2, 1, N'C', N'Rights', N'glyphicon glyphicon-user', 1, N'/Setup/RolesIndex', NULL, 1, CAST(N'2015-11-30 16:34:09.507' AS DateTime), N'View Role', N'Rights')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (3, 1, N'C', N'Role(s)', N'glyphicon glyphicon-plus', 2, N'/Setup/UserTypeIndex', NULL, 1, CAST(N'2015-11-30 16:34:53.770' AS DateTime), N'View User Type', N'Role(s)')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (4, 1, N'C', N'Assign Role(s)', N'glyphicon glyphicon-user', 3, N'/Access/AssignRoles', NULL, 1, CAST(N'2015-11-30 16:35:48.840' AS DateTime), N'View Assign Role', N'Assign Role(s)')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (5, 1, N'C', N'Manage Menu', N'glyphicon glyphicon-plus', 4, N'/Setup/MenuIndex', NULL, 1, CAST(N'2015-12-27 13:18:09.673' AS DateTime), N'View Menu', N'Manage Menu')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (6, NULL, N'P', N'User Management', N'fas fa-users', 2, N'#', NULL, 1, CAST(N'2015-11-30 16:23:31.127' AS DateTime), N'User Management', N'User Management')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (7, 6, N'C', N'Manage Users', N'glyphicon glyphicon-user', 1, N'/User/UserIndex', NULL, NULL, NULL, N'View User', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (8, NULL, N'P', N'Company Management', N'fas fa-building', 3, N'#', NULL, NULL, NULL, N'Company Management', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (9, 8, N'C', N'Manage Company', N'glyphicon glyphicon-plus', 1, N'/Company/CompanyIndex', NULL, NULL, NULL, N'View Company', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (12, NULL, N'P', N'Employee Management', N'fas fa-user', 6, N'#', NULL, 1, CAST(N'2016-01-07 12:51:31.107' AS DateTime), N'Employee Management', N'Employee Operations')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (13, 12, N'C', N'Manage Employee', N' ', 1, N'/Employee/EmployeeIndex', NULL, NULL, NULL, N'View Employee', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (14, NULL, N'P', N'SIF Management', N'fas fa-file', 7, N'#', NULL, 2, CAST(N'2016-01-24 10:38:21.767' AS DateTime), N'SIF Management', N'PAF Management')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (15, 14, N'C', N'Generate SIF', N'glyphicon glyphicon-user', 1, N'/SIF/SIF', NULL, 2, CAST(N'2016-01-24 10:39:07.000' AS DateTime), N'Generate SIF', N'PAF Process')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (16, 14, N'C', N'Approve SIF', N'glyphicon glyphicon-user', 2, N'/SIF/ApproveSif', NULL, NULL, NULL, N'Approve SIF', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (18, 1, N'C', N'Manage Bank Agents', N' ', 5, N'/Bank/BankIndex', NULL, NULL, NULL, N'View Bank', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (19, 1, N'C', N'Manage Agent / Sub Agent', N' ', 6, N'/SaleAccount/SaleAccountIndex', NULL, NULL, NULL, N'View Sale Account', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (20, NULL, N'P', N'Employee Operation', N'fa fa-money', 9, N'#', NULL, NULL, NULL, N'Employee Operation', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (21, 20, N'C', N'Payment', N' ', 1, N'/Deduction/DeductionIndex', NULL, NULL, NULL, N'View Deduction', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (22, NULL, N'P', N'PAF Management', N'fas fa-file', 8, N'#', NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (23, 22, N'C', N'PAF', N' ', 1, N'/PAF/Index', NULL, NULL, NULL, N'PAF Management', NULL)
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'200.89.174.148')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'43.239.205.153')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'82.177.38.187')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'154.72.197.106')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'155.93.109.218')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'103.92.213.33')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'111.92.164.242')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive]) VALUES (1, N'Google', N'G', 2, NULL, 0)
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive]) VALUES (2, N'Yelp', N'Y', 2, NULL, NULL)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (1, N'ServiceGenerateSIF', 1)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (2, N'Servicesifack', 1)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (3, N'ServiceSifNak', 1)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (4, N'MSSQLSERVER', 1)
SET IDENTITY_INSERT [dbo].[SMIM_AccountType_ST] ON 

INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (1, N'Doctor')
INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (2, N'Provider')
SET IDENTITY_INSERT [dbo].[SMIM_AccountType_ST] OFF
SET IDENTITY_INSERT [dbo].[SMIM_ReviewAccounts_ST] ON 

INSERT [dbo].[SMIM_ReviewAccounts_ST] ([ID], [CompanyID], [AccountTypeID], [Description], [Inactive], [Address], [City], [State], [Zip], [FirstName], [MiddleName], [LastName], [Credentials], [PhoneNumber], [Website], [NPI], [Specialty], [StoreCode], [ReviewPullType], [ProfilePullType], [IsBenchmarkAccount], [Comments]) VALUES (1, 1, 1, N'dsdfsdfa', 0, N'sdfasdfa', NULL, NULL, NULL, N'Dr. Lal', N'BADSHA', N'Nehro', N'MD', N'1234', N'www.tec.com', NULL, NULL, NULL, 2, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[SMIM_ReviewAccounts_ST] OFF
INSERT [dbo].[SMIM_ReviewAccountSite_ST] ([AccountSiteID], [AccountID], [ReviewSiteID], [ReviewSiteTypeID], [ReviewURL], [IsActive], [LastScrapeOn], [SetInActive], [EnableProfile]) VALUES (1, 1, 1, NULL, N'https://www.google.com.pk/search?authuser=0&biw=1600&bih=757&sxsrf=ACYBGNTujLIf0OdL8sYc1WSL55WEnzZ_jg:1569567290341&ei=eLGNXdbOLMO68gLgnYugBQ&q=urgent%20care&oq=urgen&gs_l=psy-ab.3.0.0i67l2j0i20i263j0l7.189718.190399..192492...0.1..0.421.1720.3-4j1......0....1..gws-wiz.......0i71j35i39j0i131i273j0i273j0i131.FJMgr1CKiFA&npsic=0&rflfq=1&rlha=0&rllag=24823781,67083420,3339&tbm=lcl&rldimm=6273713228813642375&ved=2ahUKEwjWu6rmtfDkAhWkolwKHfBvBGIQvS4wAHoECAsQIA&rldoc=1&tbs=lrf:!2m1!1e2!2m1!1e3!3sIAE,lf:1,lf_ui:2#lrd=0x3eb33b9fd829f78f:0x5710b4f12a1b2a87,1,,,&rlfi=hd:;si:6273713228813642375;mv:[[24.8291532,67.1200315],[24.818408899999998,67.0468101]];tbs:lrf:!2m1!1e2!2m1!1e3!3sIAE,lf:1,lf_ui:2', 1, NULL, NULL, NULL)
INSERT [dbo].[SMIM_ReviewAccountSite_ST] ([AccountSiteID], [AccountID], [ReviewSiteID], [ReviewSiteTypeID], [ReviewURL], [IsActive], [LastScrapeOn], [SetInActive], [EnableProfile]) VALUES (2, 1, 2, NULL, N'https://www.yelp.com/biz/wailea-medical-center-and-urgent-care-kihei', 1, NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (1, 1, 1, N'Y')
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (2, 2, 1, N'Y')
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (1, 1, NULL, NULL, N'admin', NULL, N'admin', N'admin', N'admin@unknown.com', NULL, NULL, NULL, CAST(N'2018-11-23 20:06:50.847' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (2, 2, NULL, NULL, N'Sub User 1', NULL, N'Test', N'User', N'subuser@user.com', N'0300221121212', N'+971535656544', N'75850', NULL, NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (1, N'A', N'Admin')
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (2, N'A', N'Sub Users')
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (3, N'O', N'Organization Admin')
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (4, N'C', N'Company Admin')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (1, 1, N'U', N'Insert Role', N'Y', N'2e780a91-8998-4099-b18b-1cea1fa4deed')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (2, 1, N'U', N'Edit Role', N'Y', N'052d7788-4087-4fbe-98e8-209ff9999263')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (4, 1, N'U', N'Delete Role', N'Y', N'0b74d92b-9ebd-4742-8e2a-e93776c91762')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (6, 1, N'U', N'Insert User Type', N'Y', N'fe667dc4-74a2-4a5a-abd9-9212a48a901d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (7, 1, N'U', N'Edit User Type', N'Y', N'358aef2b-c3f3-420c-ba32-d41389087f16')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (8, 1, N'U', N'Delete User Type', N'Y', N'a78eff4e-68f1-4227-8696-e3d9ea7681e9')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (12, 2, N'U', N'Insert User Type', N'Y', N'fe667dc4-74a2-4a5a-abd9-9212a48a901d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (13, 3, N'U', N'View User Type', N'Y', N'9e55a01d-11a8-46d0-9003-3b055537b173')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (14, 3, N'U', N'Insert User Type', N'Y', N'fe667dc4-74a2-4a5a-abd9-9212a48a901d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (15, 3, N'U', N'Edit User Type', N'Y', N'358aef2b-c3f3-420c-ba32-d41389087f16')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (16, 2, N'U', N'Edit Role', N'Y', N'052d7788-4087-4fbe-98e8-209ff9999263')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (17, 3, N'U', N'Insert Role', N'Y', N'2e780a91-8998-4099-b18b-1cea1fa4deed')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (18, 3, N'U', N'View Role ', N'Y', N'b5896a9a-ee0d-4dff-8788-4e050156f57d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (19, 4, N'U', N'View Role ', N'Y', N'b5896a9a-ee0d-4dff-8788-4e050156f57d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (20, 4, N'U', N'View User Type', N'Y', N'9e55a01d-11a8-46d0-9003-3b055537b173')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (22, 1, N'U', N'View Assign Role', N'Y', N'b9ed80b6-6350-4031-b431-0949b63ccac5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (24, 1, N'U', N'View Role', N'Y', N'b5896a9a-ee0d-4dff-8788-4e050156f57d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (25, 1, N'U', N'System Administration', N'Y', N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (26, 1, N'U', N'View User Type', N'Y', N'9e55a01d-11a8-46d0-9003-3b055537b173')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (27, 1, N'U', N'View Menu', N'Y', N'7809c384-69a7-47f0-826f-fa796f446eda')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (28, 1, N'U', N'View User', N'Y', N'6f6652f0-123f-4a9b-a4c0-04ccc47771ec')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (29, 1, N'U', N'User Management', N'Y', N'148df38a-46de-48d3-be50-cc7650eaa80a')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (30, 1, N'U', N'View Sale Account', N'Y', N'36dca28a-3234-4273-a19e-510837d3b4c5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (31, 1, N'U', N'View Bank', N'Y', N'8621c981-9711-4cfb-b4e9-5ed0070c84bb')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (32, 1, N'U', N'Company Management', N'Y', N'946f5a1d-986f-4608-9d5b-00116c44009c')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (33, 1, N'U', N'Employee Management', N'Y', N'cf790107-8c55-413d-9fa3-2bb8e832cde7')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (34, 1, N'U', N'SIF Management', N'Y', N'dffcfc38-c5ff-4b71-897c-2c8f7a9881a9')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (35, 1, N'U', N'View Company', N'Y', N'b8c51c39-d369-4b12-9f53-2fe40893dbb8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (36, 1, N'U', N'View Employee', N'Y', N'd67185ad-6281-4d00-a4dc-6ed3937d9482')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (37, 1, N'U', N'Generate SIF', N'Y', N'4efdbc1b-ce07-49a5-b23b-7c186e5eada3')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (38, 1, N'U', N'Approve SIF', N'Y', N'73d87242-44ed-4eb1-a5d9-de53fd7fab23')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (39, 1, N'U', N'Upload SIF', N'Y', N'db0b02d6-d856-4f34-81f3-e7153c747d75')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (40, 2, N'U', N'View Group', N'Y', N'baf09bf5-9ec0-499c-bcca-e0bbd0edc1a5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (41, 1, N'U', N'View Deduction', N'Y', N'bc775c9c-6c54-4994-ad9e-18a284ddd683')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (42, 1, N'U', N'Employee Operation', N'Y', N'698ce7b6-9638-4e8e-9f71-6dc2f00e57b8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (43, 1, N'U', N'PAF Management', N'Y', N'898c0bad-653d-455b-bfe7-881ee3a354a0')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (44, 1, N'U', N'Delete Uploaded Employee', N'Y', N'2119360e-6a51-4730-8ae5-81fcda46eb94')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (45, 1, N'U', N'Approve Employee', N'Y', N'efc7f424-b6d3-47de-8f10-d06d35c6c483')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (46, 1, N'U', N'Verify Sif', N'Y', N'300fe82d-ddd4-4f9d-8682-62c7b27deb85')
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (1, N'Siraj Finance PJSC', N'711310001', 1, 113)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (2, N'ABU DHABI COMMERCIAL BANK (ADCB)', N'600310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (3, N'AL AHLI BANK OF KUWAIT - Dubai', N'200420101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (4, N'AL AHLI BANK OF KUWAIT - Abu Dhabi', N'800410102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (5, N'Al RAFIDIAN', N'400510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (6, N'ARAB AFRICAN INT’L', N'900720101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (7, N'ARBIFT', N'100810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (8, N'ARAB BANK', N'000910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (9, N'BANK MELLI IRAN', N'201020102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (10, N'BANK OF BARODA - Dubai ', N'801120101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (11, N'BANK OF BARODA - Deira', N'101120102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (12, N'BANK OF BARODA - Abu Dhabi', N'101110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (13, N'BANK OF BARODA - Sharjah', N'501130101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (14, N'BANK OF BARODA - Al Ain', N'801111002', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (15, N'BANK OF BARODA - Rasal Khaima', N'601160101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (16, N'BANK OF SHARJAH', N'401230101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (17, N'BANK OF SADERAT IRAN', N'901320124', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (18, N'BANQUE BANORABE', N'001420151', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (19, N'BANK MISR (BANQUE DU CAIRE)', N'001510102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (20, N'CREDIT AGRICOLE', N'301620101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (21, N'BLC BANK (BANQUE LIBAINAISE POUR DE COMMERCE)', N'201720101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (22, N'BANQUE PARIBAS', N'401810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (23, N'BARCLAYS BANK', N'401920110', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (24, N'HSBC BANK MIDDLE EAST', N'302020120', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (25, N'CITI BANK', N'102120101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (26, N'COMMERCIAL BANK INTERNATIONAL', N'002220101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (27, N'COMMERCIAL BANK OF DUBAI', N'102320150', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (28, N'DUBAI ISLAMIC BANK', N'802420101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (29, N'EL NILIEN BANK', N'002510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (30, N'EmiratesNBD', N'302620122', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (31, N'FIRST GULF BANK', N'102710102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (32, N'HABIB BANK LTD.', N'102820111', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (33, N'HABIB BANK A.G. ZURICH', N'302920101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (34, N'INVEST BANK', N'503030102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (35, N'JANATA BANK', N'103110110', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (36, N'LLOYDS BANK', N'303220101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (37, N'MASHREQ BANK', N'203320101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (38, N'EMIRATES ISLAMIC  BANK', N'703420114', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (39, N'NATIONAL BANK OF ABU DHABI', N'803510106', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (40, N'NATIONAL BANK OF BAHRAIN', N'203610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (41, N'NATIONAL BANK OF DUBAI', N'803720101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (42, N'NATIONAL BANK OF FUJAIRAH', N'503870102', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (43, N'NATIONAL BANK OF OMAN', N'903910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (44, N'RAK BANK (NATIONAL  BANK OF RAS AL KHAIMAH)', N'804020101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (45, N'SHARJAH ISLAMIC BANK (NATIONAL BANK OF SHARJAH)', N'404130101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (46, N'NAT. BANK OF UAQ', N'104251001', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (47, N'STANDARD CHARTERED', N'504420120', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (48, N'UNION NATIONAL BANK', N'704510131', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (49, N'UNITED ARAB BANK', N'904630101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (50, N'UNITED BANK LTD.', N'604720106', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (51, N'ARAB EMIRAES INVESTMENT BK', N'004820101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (52, N'DEUTSCHE BK', N'204910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (53, N'ABU DHABI ISLAMIC BK', N'405010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (54, N'DUBAI BANK PJSC', N'005120101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (55, N'NOOR ISLAMIC BK', N'905220101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (56, N'Al HILAL BK', N'105310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (57, N'DOHA BANK', N'705420101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (58, N'SAMBA', N'605520101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (59, N'NAT. BK OF KUWAIT', N'505620101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (60, N'AJMAN BK', N'805740101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (61, N'Abdul Latif Exchange - LLC. - Dubai', N'220110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (62, N'Ahmed Al Amery Exchange Est-Abu Dhabi', N'120210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (63, N'Ahmed Al Hussain Exchange Est. - Dubai', N'020310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (64, N'Ain Al Faydah Exchange-Al Ain', N'920410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (65, N'Al Ahalia Money Exchange Bureau-Abu Dhabi', N'820510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (66, N'Al Ansari Exchange-Abu Dhabi', N'720610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (67, N'Al Ansari Exchange Services -Al Ain', N'620710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (68, N'Al Azhar Exchange- Dubai', N'520810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (69, N'Al Bader Exchange-Abu Dhabi', N'420910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (70, N'Al Balooch Money Exchange- Al Ain', N'621010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (71, N'Al Dahab  Exchange, Dubai ', N'521110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (72, N'Al Darmaki Exchange Est. - Dubai', N'421210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (73, N'Al Dhahery Money Exchange- Al Ain', N'321310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (74, N'Al Falah Exchange Company-Abu Dhabi', N'221410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (75, N'Al Fardan Exchange-Abu Dhabi', N'121510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (76, N'Al Fuad Exchange - Dubai', N'021610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (77, N'Al Gergawi Exchange - LLC. - Dubai', N'921710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (78, N'Al Ghurair Exchange- Dubai', N'821810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (79, N'Al Ghurair International Exchange- Dubai', N'721910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (80, N'Al Hadha Exchange LLC. - Dubai', N'922010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (81, N'Al Hamed Exchange - Sharjah', N'822110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (82, N'Al Hamriyah Exchange- Dubai', N'722210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (83, N'Al Jarwan Money Exchange-Sharjah', N'622310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (84, N'Al Masood Exchange-Abu Dhabi', N'522410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (85, N'Al Mazroui Exchange Est-Abu Dhabi', N'422510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (86, N'Al Modawallah Exchange- Dubai', N'322610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (87, N'Al Mona Exchange Co. - LLC. - Dubai', N'222710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (88, N'Al Mussabah Exchange- Dubai', N'122810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (89, N'Al Nafees Exchange LLC. - Dubai', N'022910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (90, N'Al Ne''emah Exchange Co. LLC- Dubai', N'223010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (91, N'Al Rajihi Exchange Company - LLC. - Dubai', N'123110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (92, N'Al Razouki Int''l Exchange Co. LLC. - Dub', N'023210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (93, N'Al Zari & Al Fardan Exchange LLC. - Sharjah', N'923310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (94, N'Al Zarooni Exchange- Dubai', N'823410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (95, N'Alukkass Exchange, Dubai', N'723510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (96, N'Arabian Exchange Co-Abu Dhabi', N'623610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (97, N'ARY International Exchange- Dubai', N'523710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (98, N'Asia Exchange Centre- Dubai', N'423810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (99, N'Aziz Exchange Co. LLC.- Dubai', N'323910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (100, N'Bhagwandas Jethanand and Sons-Sharjah', N'524010101', 0, NULL)
GO
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (101, N'Bin Bakheet Exchange Est.- Ajman', N'424110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (102, N'Bin Belaila Exchange Co.-LLC. - Dubai', N'324210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (103, N'Cash Express Exchange Est. - Dubai', N'224310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (104, N'Central Exchange LLC Dubai', N'124410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (105, N'City Exchange - LLC. - Dubai', N'024510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (106, N'Daniba International Exchange- Dubai', N'924610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (107, N'Day Exchange LLC.- Dubai', N'824710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (108, N'Dinar Exchange - Dubai', N'724810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (109, N'Dubai Exchange Centre - LLC. - Dubai', N'624910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (110, N'Dubai Express Exchange, Dubai  ', N'825010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (111, N'Emirates & East India Exchange - Sharjah', N'725110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (112, N'Emirates India International Exchange-Sharjah', N'625210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (113, N'ROYAL BANK OF SCOTLAND (ABN AMRO)', N'400220101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (114, N'First Gulf Exchange Centre- Dubai', N'425410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (115, N'Gomti Exchange - LLC. - Dubai', N'325510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (116, N'Gulf Express Exchange- Dubai', N'225610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (117, N'Gulf Int''l Exchange Co.-LLC. - Dubai', N'125710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (118, N'Habib Exchange Co. LLC. - Sharjah', N'025810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (119, N'Hadi Express Exchange- Dubai', N'925910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (120, N'Harib Sultan Exchange-Abu Dhabi', N'126010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (121, N'Horizon Exchange - Dubai', N'026110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (122, N'International Development Exchange-Dubai', N'926210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (123, N'Jumana Exchange Est. - Dubai', N'826310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (124, N'Kanoo Exchange- Dubai', N'726410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (125, N'Khalil Al Fardan Exchange- Dubai', N'626510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (126, N'Khalili Exchange Co. LLC. - Dubai', N'526610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (127, N'Lari Exchange Est-Abu Dhabi', N'426710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (128, N'Lee La Megh Exchange LLC- Dubai', N'326810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (129, N'Malik Exchange-Abu Dhabi', N'226910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (130, N'Multinet Trust Exchange - LLC. - Dubai', N'427010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (131, N'Nanikdas Nathoomal Exchange Co. LLC- Dub', N'327110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (132, N'Naser Khoory Exchange Est. - Abu Dhabi', N'227210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (133, N'National Exchange Co.-Abu Dhabi', N'127310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (134, N'Oasis Exchange, Al Ain', N'027410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (135, N'Orient Exchange Co.- LLC- Dubai', N'927510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (136, N'Pacific Exchange- Dubai', N'827610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (137, N'Redha Al Ansari Exchange Est. - Dubai', N'727710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (138, N'Reems Exchange- Dubai', N'627810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (139, N'Sa''ad Exchange-Fujairah', N'527910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (140, N'Sabah Exchange-Sharjah', N'728010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (141, N'Sajwani Exchange- Dubai', N'628110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (142, N'Salim Exchange-Sharjah', N'528210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (143, N'Sana''a Exchange- Dubai', N'428310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (144, N'Sawan Exchange Co. - LLC. - Dubai', N'328410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (145, N'Shaheen Money Exchange LLC. - Dubai', N'228510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (146, N'Sharjah International Exchange-Sharjah', N'128610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (147, N'Tabra & Al Nebal Exchange - Dubai', N'028710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (148, N'Tahir Exchange Est. - Dubai', N'928810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (149, N'Taymour & Abou Harb Exchange Co. LLC. -Sharjah', N'828910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (150, N'Al Rostamani Exchange- Dubai', N'029010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (151, N'U.A.E. Exchange Centre - LLC.- Dubai', N'929110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (152, N'Union Exchange-Abu Dhabi', N'829210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (153, N'Universal Exchange Centre - Dubai', N'729310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (154, N'Wall Street Exchange Centre - LLC- Dubai', N'629410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (155, N'Zahra Al Yousuf Exchange- Dubai', N'529510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (156, N'Global Exchange', N'429610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (157, N'Economic Exchange', N'329710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (158, N'Royal Exchange Co.  LLC', N'229810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (159, N'Bin Belaila Exchange Co. L.L.C', N'129910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (160, N'Alfalah Exchange Company', N'030010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (161, N'GCC EXCHANGE', N'930110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (162, N'Economic Exchange Centre', N'830210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (163, N'Global Exchange', N'730310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (164, N'Zareen Exchange', N'630410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (165, N'Future Exchange', N'530510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (166, N'Nasim Al Barari Exchange', N'430610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (167, N'Al Dhahery Exchange', N'330710101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (168, N'Al Nibal International Exchange', N'230810101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (169, N'AL DINAR EXCHANGE COMPANY', N'130910101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (170, N'HSBC Financial Services', N'331010101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (171, N'ALFA EXCHANGE', N'231110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (172, N'DELMA EXCHANGE', N'131210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (173, N'SHARAF EXCHANGE', N'031310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (174, N'LULU EXCHANGE', N'931410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (175, N'SMART Exchange', N'831510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (176, N'Al Jaber Exchange', N'731610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (177, N'C3', N'640110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (178, N'Western Union', N'540210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (179, N'Mint-ADIB', N'440310101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (180, N'Workers Equity Holdings', N'340410101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (181, N'SEIDCO', N'240510101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (182, N'Finance House', N'060110101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (183, N'Dunia', N'960210101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (184, N'Mint - Ajman', N'140610101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (185, N'Abu Dhabi Islamic Bank', N'105070106', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (186, N'Dubai Islamic Bank PJSC', N'802420101', 0, NULL)
INSERT [dbo].[SMSA_Bank_ST] ([BankId], [BankName], [RoutingCode], [IsMaster], [Agent_id]) VALUES (253, N'Federal Exchange- Dubai', N'525310101', 0, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (1, 1, N'Abc Corporation', NULL, N'9638521', NULL, NULL, NULL, N'Jaffrullah', N'abcAdmin', N'Dubai, UAE', NULL, 0, N'+971535245123', N'+971565304001', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, CAST(1830 AS Decimal(18, 0)), NULL, NULL, 1, CAST(N'2018-11-25 13:31:38.713' AS DateTime), CAST(N'2019-01-16 12:18:51.057' AS DateTime), 1)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (1, 2, N'CDE Corporation', NULL, N'987654321', NULL, NULL, NULL, N'Jaffrullah', N'cdeAdmin', N'Dubai, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 11:42:37.627' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (2, 3, N'Single Company', NULL, N'852963', NULL, NULL, NULL, N'Test001', N'single001', N'Dubai, UAE', NULL, 0, N'+97156565656', N'+97152525252', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 16:47:53.973' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (3, 4, N'Agent Group of Company', NULL, N'85412', NULL, NULL, NULL, N'Agent A', N'agcgroup', N'Dubai, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 1, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 16:55:33.073' AS DateTime), CAST(N'2019-04-08 12:49:15.700' AS DateTime), 1)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (3, 5, N'Agent A Company 1', NULL, N'741254', NULL, NULL, NULL, N'Test001', N'agccompany1', N'Dubai, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 1, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 16:56:50.527' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (4, 6, N'Agent Direct Company', NULL, N'85274143', NULL, NULL, NULL, N'Direct1', N'acdirect', N'Dubia, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 16:57:57.347' AS DateTime), CAST(N'2019-03-26 13:09:51.720' AS DateTime), 1)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (5, 7, N'Sub Agent Group Company', NULL, N'96541', NULL, NULL, NULL, N'Jaff', N'sagcGroup', N'Dubia, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 2, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 16:58:50.753' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (5, 8, N'Sub Agent Group Company 1', NULL, N'841254', NULL, NULL, NULL, N'Jaffrullah', N'saccompany1', N'Dubia, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 2, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 16:59:44.583' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (6, 9, N'Sub Agent Direct', NULL, N'874523', NULL, NULL, NULL, N'Jaff', N'saDirect', N'Dubai, UAE', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 2, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-26 17:00:27.637' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (7, 10, N'Test Company', NULL, N'888888', NULL, NULL, NULL, N'Irfan', N'testcompany', N'Test', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 5, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-01-03 21:46:54.583' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (8, 11, N'Abc Corporation LC', NULL, N'785236', NULL, NULL, NULL, N'Ismail', N'ismail001', N'abc road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, 1, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-24 16:05:15.347' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (9, 12, N'Master Company', NULL, N'1234567', NULL, NULL, NULL, N'Jaff', N'jaff001', N'abc road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-24 16:09:55.973' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (10, 13, N'Company of Master Company', NULL, N'9876542', NULL, NULL, NULL, N'Jaff', N'cmc', N'abc road', NULL, 0, N'050', N'05', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-24 16:13:41.700' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (11, 14, N'Direct Company', NULL, N'8527419', NULL, NULL, NULL, N'ismail', N'direct001', N'cde road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-24 16:14:04.560' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (12, 15, N'Test 1', NULL, N'1234567', NULL, NULL, NULL, N'Contact 1', N'contact1', N'abc road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, 1, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-18 16:13:24.063' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (13, 16, N'Test 3', NULL, N'1234569', NULL, NULL, NULL, N'Contact 3', N'contact3', N'abc road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-18 16:13:25.017' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (14, 17, N'Test 4', NULL, N'1234570', NULL, NULL, NULL, N'Contact 4', N'contact4', N'abc road', NULL, 0, N'050', N'05', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-18 16:13:25.843' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (15, 18, N'Test 5', NULL, N'1234571', NULL, NULL, NULL, N'Contact 5', N'contact5', N'cde road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-18 16:13:26.473' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (16, 19, N'Test 6', NULL, N'1234572', NULL, NULL, NULL, N'Contact 6', N'contact6', N'cde road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-18 16:13:26.983' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (17, 20, N'Test 7', NULL, N'1234573', NULL, NULL, NULL, N'Contact 7', N'contact7', N'cde road', NULL, 0, N'050', N'051', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-18 16:14:59.847' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (18, 21, N'Upload LLC', NULL, N'12345678', NULL, NULL, NULL, N'Sathish', N'Sathish_user1', N'Abu dhabi', NULL, 0, N'+971506226', N'+971506226', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-19 11:51:14.590' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (18, 22, N'Upload LLC - Sub', NULL, N'123456789', NULL, NULL, NULL, N'Sathish1', N'Sathish1_user1', N'Abu dhabi', NULL, 0, N'+971506226', N'+971506226', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-19 11:53:43.543' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (19, 23, N'Upload LLC', NULL, N'212345678', NULL, NULL, NULL, N'Sathish', N'ASathish_user1', N'Abu dhabi', NULL, 0, N'+971506226', N'+971506226', N'irfan.alphasoft@gmail.com', NULL, 2, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-19 12:06:39.627' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (19, 24, N'Upload LLC - Sub', NULL, N'2123456789', NULL, NULL, NULL, N'Sathish1', N'ASathish1_user1', N'Abu dhabi', NULL, 0, N'+971506226', N'+971506226', N'irfan.alphasoft@gmail.com', NULL, 2, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-19 12:07:40.377' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (20, 25, N'Abc Corporation', NULL, N'85412', NULL, NULL, NULL, N'Jaff', N'tetete', N'asd', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-03-26 13:32:26.573' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (22, 26, N'Final Choice Final', NULL, N'120150160', NULL, NULL, NULL, N'Sathish', N'finalfinal120', N'Abu dhabi', NULL, 0, N'+971506226', N'+971506226', N'irfan.alphasoft@gmail.com', NULL, 1, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-04-02 15:36:40.647' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (23, 27, N'My Company', NULL, N'987841', NULL, NULL, NULL, N'TT', N'Mycompany', N'asd', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 5, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-04-08 12:47:36.827' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (24, 28, N'My Dontknow', NULL, N'1456785', NULL, NULL, NULL, N'Jaff', N'dontknow', N'asd', NULL, 0, N'+97152525252', N'+971535656544', N'irfan.alphasoft@gmail.com', NULL, 1, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2019-04-08 12:50:05.553' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SMSA_Logs_HI] ON 

INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (1, 1, N'I', N'Add Company', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (2, 1, N'U', N'Edit Company', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (3, 1, N'I', N'Add Bank', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (4, 3, N'D', N'Delete Bank', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (5, 101, N'I', N'Upload New Company', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (6, 4, N'U', N'Edit Company Details', CAST(N'2019-04-08 12:49:15.743' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (7, 28, N'I', N'Add New Company', CAST(N'2019-04-08 12:50:07.197' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SMSA_Logs_HI] OFF
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (1, NULL, N'Abc Corporation', N'OrgabcAdmin', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2018-11-25 13:29:24.317' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (2, NULL, N'Single Company', N'Orgsingle001', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2018-11-26 16:47:52.880' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (3, NULL, N'Agent Group of Company', N'Orgagcgroup', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2018-11-26 16:55:32.907' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (4, NULL, N'Agent Direct Company', N'Orgacdirect', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2018-11-26 16:57:57.217' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (5, NULL, N'Sub Agent Group Company', N'OrgsagcGroup', 2, NULL, N'G', N'A', NULL, 1, CAST(N'2018-11-26 16:58:50.473' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (6, NULL, N'Sub Agent Direct', N'OrgsaDirect', 2, NULL, N'C', N'A', NULL, 1, CAST(N'2018-11-26 17:00:27.417' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (7, NULL, N'Test Company', N'Orgtestcompany', 5, NULL, N'C', N'A', NULL, 1, CAST(N'2019-01-03 21:46:54.347' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (8, NULL, N'Abc Corporation LC', N'Orgismail001', 1, NULL, N'G', N'A', NULL, 1, CAST(N'2019-02-24 16:05:08.787' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (9, NULL, N'Master Company', N'Orgjaff001', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2019-02-24 16:09:55.940' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (10, NULL, N'Company of Master Company', N'Orgcmc', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2019-02-24 16:13:41.670' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (11, NULL, N'Direct Company', N'Orgdirect001', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2019-02-24 16:14:04.527' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (12, NULL, N'Test 1', N'Orgcontact1', 1, NULL, N'G', N'A', NULL, 1, CAST(N'2019-03-18 16:13:23.487' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (13, NULL, N'Test 3', N'Orgcontact3', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2019-03-18 16:13:24.953' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (14, NULL, N'Test 4', N'Orgcontact4', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2019-03-18 16:13:25.607' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (15, NULL, N'Test 5', N'Orgcontact5', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2019-03-18 16:13:26.347' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (16, NULL, N'Test 6', N'Orgcontact6', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2019-03-18 16:13:26.877' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (17, NULL, N'Test 7', N'Orgcontact7', NULL, NULL, N' ', N'A', NULL, 1, CAST(N'2019-03-18 16:14:59.613' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (18, NULL, N'Upload LLC', N'OrgSathish_user1', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2019-03-19 11:51:09.553' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (19, NULL, N'Upload LLC', N'OrgASathish_user1', 2, NULL, N'G', N'A', NULL, 1, CAST(N'2019-03-19 12:06:35.863' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (20, NULL, N'Abc Corporation', N'Orgtetete', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2019-03-26 13:32:26.390' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (21, NULL, N'Abc Corporation', N'Orgtrtrtr', NULL, NULL, N'C', N'A', NULL, 1, CAST(N'2019-03-26 13:33:00.487' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (22, NULL, N'Final Choice Final', N'Orgfinalfinal120', 1, NULL, N'G', N'A', NULL, 1, CAST(N'2019-04-02 15:36:37.787' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (23, NULL, N'My Company', N'OrgMycompany', 5, NULL, N'C', N'A', NULL, 1, CAST(N'2019-04-08 12:47:36.613' AS DateTime))
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (24, NULL, N'My Dontknow', N'Orgdontknow', 1, NULL, N'C', N'A', NULL, 1, CAST(N'2019-04-08 12:50:05.487' AS DateTime))
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'946f5a1d-986f-4608-9d5b-00116c44009c', N'Company Management', NULL, NULL, N'Parent Menu', N'Company Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'6f6652f0-123f-4a9b-a4c0-04ccc47771ec', N'View User', NULL, NULL, N'User', N'User')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'b9ed80b6-6350-4031-b431-0949b63ccac5', N'View Assign Role', NULL, NULL, N'Assign Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8', N'System Administration', NULL, NULL, N'Parent Menu', N'System Administration')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'bc775c9c-6c54-4994-ad9e-18a284ddd683', N'View Deduction', NULL, NULL, N'Employee Operation', N'Deduction')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'2e780a91-8998-4099-b18b-1cea1fa4deed', N'Insert Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'052d7788-4087-4fbe-98e8-209ff9999263', N'Edit Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'cf790107-8c55-413d-9fa3-2bb8e832cde7', N'Employee Management', NULL, NULL, N'Parent Menu', N'Employee Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'dffcfc38-c5ff-4b71-897c-2c8f7a9881a9', N'SIF Management', NULL, NULL, N'Parent Menu', N'SIF Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'b8c51c39-d369-4b12-9f53-2fe40893dbb8', N'View Company', NULL, NULL, N'Company', N'Company')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'9e55a01d-11a8-46d0-9003-3b055537b173', N'View User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'b5896a9a-ee0d-4dff-8788-4e050156f57d', N'View Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'36dca28a-3234-4273-a19e-510837d3b4c5', N'View Sale Account', NULL, NULL, N'Sale Account', N'Sale Account')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'8621c981-9711-4cfb-b4e9-5ed0070c84bb', N'View Bank', NULL, NULL, N'Bank', N'Bank')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'300fe82d-ddd4-4f9d-8682-62c7b27deb85', N'Verify Sif', NULL, NULL, N'SIF', N'SIF')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'698ce7b6-9638-4e8e-9f71-6dc2f00e57b8', N'Employee Operation', NULL, NULL, N'Parent Menu', N'Employee Operation')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'd67185ad-6281-4d00-a4dc-6ed3937d9482', N'View Employee', NULL, NULL, N'Employee', N'Employee')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'4efdbc1b-ce07-49a5-b23b-7c186e5eada3', N'Generate SIF', NULL, NULL, N'SIF', N'Generate SIF')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'2119360e-6a51-4730-8ae5-81fcda46eb94', N'Delete Uploaded Employee', NULL, NULL, N'Employee Management', N'Employee Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'898c0bad-653d-455b-bfe7-881ee3a354a0', N'PAF Management', NULL, NULL, N'Parent Menu', N'PAF')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'fe667dc4-74a2-4a5a-abd9-9212a48a901d', N'Insert User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'148df38a-46de-48d3-be50-cc7650eaa80a', N'User Management', NULL, NULL, N'Parent Menu', N'User Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'efc7f424-b6d3-47de-8f10-d06d35c6c483', N'Approve Employee', NULL, NULL, N'Employee Management', N'Employee Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'358aef2b-c3f3-420c-ba32-d41389087f16', N'Edit User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'73d87242-44ed-4eb1-a5d9-de53fd7fab23', N'Approve SIF', NULL, NULL, N'SIF', N'Approve SIF')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'a78eff4e-68f1-4227-8696-e3d9ea7681e9', N'Delete User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'db0b02d6-d856-4f34-81f3-e7153c747d75', N'Upload SIF', NULL, NULL, N'SIF', N'Upload SIF')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'0b74d92b-9ebd-4742-8e2a-e93776c91762', N'Delete Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'7809c384-69a7-47f0-826f-fa796f446eda', N'View Menu', NULL, NULL, N'Menu', N'Setup')
SET IDENTITY_INSERT [dbo].[SRCC_ReviewStatusTypes_ST] ON 

INSERT [dbo].[SRCC_ReviewStatusTypes_ST] ([ID], [Description]) VALUES (1, N'Active')
SET IDENTITY_INSERT [dbo].[SRCC_ReviewStatusTypes_ST] OFF
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (1, N'Agent A', N'A001', N'A', NULL, N'Test Road Abc', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (2, N'Sub Agent 1', N'A002', N'A', NULL, N'Test Road Abc', NULL, N'+97152525252', N'+971535656544', NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (3, N'Agent B', N'A003', N'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (4, N'Agent A', N'A004', N'A', NULL, N'Test Road Abc', NULL, N'+97152525252', N'+971535656544', NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (5, N'Sub Agent ABC', N'S001', N'S', 1, N'Test Road Abc', NULL, N'+97152525252', N'+971535656544', NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (6, N'Agent AB', N'A005', N'A', NULL, N'Test Road Abc', NULL, N'+97152525252', N'+971535656544', NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (7, N'Agent B Sub Agent ', N'S007', N'S', 3, NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-23 11:24:32.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[SRCC_Yelp_TR] ON 

INSERT [dbo].[SRCC_Yelp_TR] ([ID], [SiteAccountID], [Overall], [ReviewCount]) VALUES (1, 2, CAST(4.0 AS Decimal(2, 1)), 24)
SET IDENTITY_INSERT [dbo].[SRCC_Yelp_TR] OFF
SET IDENTITY_INSERT [dbo].[SRCC_YelpReviews_TR] ON 

INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (2, 1, N'IsIWXofAfmL4Yrc4_qYA_g', N'Brian M.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2014-07-07 00:00:00.000' AS DateTime), N'If you are visiting Maui and happen to need medical care, this is the place to go. Dr. Onishi was fantastic. Her office was clean and professional. She took care of the problem quickly and efficiently. We were a walk in, but she still saw us timely. Great care and service. Her office staff was also quite nice.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (3, 1, N'THUSfyncSXZ6_rn-imbpkg', N'Colleen P.', CAST(1.0 AS Decimal(2, 1)), CAST(N'2018-08-18 00:00:00.000' AS DateTime), N'This is an awful facility. I drive myself there with a centipede bite. They would not take my HMSA (Blue Shield) insurance and would not even give me an ice pack...as my arm was increasingly swelling and was in terrible pain. Went next door to a local surf shop and the sales girl went out of her way to get me ice and help me. I find this Urgent Care inexcusable. Never been treated that bad. My neighbor picked me up and got me to the hospital.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (4, 1, N'YC-DWQgWGhjPiQMYRwWSCg', N'Sarah B.', CAST(1.0 AS Decimal(2, 1)), CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'Do not go here! I''m from out of state, I made a appointment to get a prescription from a local doctor. I guess Hawaii doesn''t allow for out of state prescriptions. When I called to set up my appointment I told the receptionist my story and told her my insurance information but I would be paying out of pocket. When I showed up to my appointment a different receptionist was there. A very rude lady, when she asked to see my insurance card I politelyTold her I''m paying out of pocket but she insisted on seeing my insurance information anyways. She looked at my card threw it back at me and told me they can''t see me because state law won''t let them see me because they don''t take my insurance carrier. (Blue cross) I then reminded her that I was paying out of pocket. And that I would like to see the law document that states that. After refusing my request. She turned her back on me and started playing with her cell phone. My question is that why they couldn''t just lie to me over the phone instead of wasting 1/2 my day? I''ve made an appointment with a local attorney and I''m planning on taking them to court for discrimination!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (5, 1, N'eEQ0WMxWox-QCr1B_O2FDQ', N'Paul D.', CAST(2.0 AS Decimal(2, 1)), CAST(N'2017-02-22 00:00:00.000' AS DateTime), N'Great doctors and very nice staff. Unfortunately not a very organized office, I have had appointments cancelled without notice, I have received already payed bills and extra add on costs in the mail for over a year after some appointments. When I call they say they are all paid and that I should ignore them, yet they persist. Half way through a recent vaccination regiment over the course of two months they informed me that they decided to stop accepting my insurance anymore after seeing me for years. I have since found a clinic that was able to finish my regiment.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (6, 1, N'Af83tBoav97bG0NrHllEbg', N'Nadia F.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2015-08-21 00:00:00.000' AS DateTime), N'I was very impressed with this Urgent Care clinic! It was so peaceful, the receptionists were very sweet and the atmosphere was spa-like. It was easy to make an appointment and I was seen shortly after I arrived. Dr. Onishi is super! She was quick yet thorough and took the time to listen to symptoms and other needs I had, then prescribed the necessary treatment. I highly recommend this place!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (7, 1, N'Wn9xkRAn4syGJH-JCuQytA', N'Megan H.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2014-05-21 00:00:00.000' AS DateTime), N'I can''t even tell you how frustrating it is to have the best doctor I''ve EVER met on Maui, while I can''t find anyone even close to her back at home. I long for Doctor Onishi when I''m sick in Los Angeles. Doctor Onishi is awesome! Though I live in LA, I''m on Maui frequently enough to have need of a doctor. And Doc Onishi has helped me out of many an asthmatic nightmare with her calm and sweet demeanor. I have a phobia of doctors and all things medical, and there''s something about her energy that puts me at ease. I also have a phobia of all things stuffy, so I love that Doctor Onishi actually has a personality! I want my doctor to make me feel like they care about me, not like I''m just some collection of human parts on a paper-covered bed.If you find yourself needing medical care on Maui, stop reading this review right now and head over to Wailea Medical Center!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (8, 1, N'Lh2BUo_oGlO_ChxkrXOZkg', N'Maria A.', CAST(1.0 AS Decimal(2, 1)), CAST(N'2017-03-05 00:00:00.000' AS DateTime), N'I have never ever had a bad experience from a receptionist at a doctor''s office, but today was to be my first! I walked in to her desk and she didn''t look up from her paperwork and acknowledge me and when she finally did, she looked and just stared at me waiting for me to say something. Then, when she did speak, she said, "are you here to sign in?" I told her I was having heart flutterings and she said there was just a physician''s assistant here only. I said okay, and she gave me paperwork. Her rudeness was palpable.  I ultimately decided to leave and find a hospital. Her lack of care and consideration for me as a possible patient, let alone a human being was shocking. To this day, I just don''t know why she is in the profession she is in. This happened on 2/28/17', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (9, 1, N'aZbgG1iTydNnivHQQ-0www', N'Laci T.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2013-12-01 00:00:00.000' AS DateTime), N'Lifesavers! After straining his back the week before we left for Maui then partaking in all the fun that the island has to offer for another week, my boyfriend''s back went from bad to horrible the morning of our departure. Concerned that he wouldn''t be able to sit (not "sit comfortably" but just sit) on our flight home that afternoon, we were happy to find Wailea Medical Center & Urgent Care just outside the condo complex we were staying in. There was virtually no wait (I was able to grab a quick coffee around the corner while he went to the exam room with the doctor) and Dr. Onishi knew immediately what the problem was and how to best help him cope with it for the 24 hours it''d take before he could see his doctor here at home. In the short time I spent sipping my iced coffee and fantasizing about the possibility of extending our Maui visit, I noticed the front desk nurses'' contact with three other patients. She was nothing but kind, patient, and accommodating making the environment surprisingly relaxing for a doctor''s office. Many thanks to Dr. Onishi and her staff for making what began as a mini nightmare a silly story to share with our friends.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (10, 1, N'P98p-iMkdV5vFRrIEFAHqw', N'Kathy K.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2017-05-10 00:00:00.000' AS DateTime), N'I highly recommend this place. I called late in the day to see if I could be seen for possible bronchitis. The office accommodated me even though I arrived 20 minutes later than I should have. Scott was very attentive, thorough and educational. He also had a great sense of humor. They take insurance and called the pharmacy up the road. I was on my with scripts in hand a half hour later. Mahalo for great service!!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (11, 1, N'sbpXoRgWKFNwIhEr1D7F_Q', N'Sean D.', CAST(1.0 AS Decimal(2, 1)), CAST(N'2017-08-03 00:00:00.000' AS DateTime), N'I''d like to preface this review by saying I have worked the front office of a medical office -- I know what is good and what is the bare minimum of patient care. This was worse than the latter. I made an appointment a week in advance to have a simple TB test to be done for new employment with a woman at the front desk. I spoke to the same woman a week later, who swore that no appointment had been made. I showed her the phone record and explained the exact conservation we had -- again, no recollection. She never smiled, never apologized, no form of action that would help rectify the situation. She simply said, sit down and and fill out the paperwork -- it will be awhile. Annoyed but understanding that mistakes are made, I sat down and filled out the paper work. I returned the completed paper work with my insurance card and my ID and asked that she not make a copy of the ID. She took my insurance card and demanded that I give her my ID card. I started to explain that I do not like giving out personal information so easily, as I have heard identities being stolen in this type of situation. Without looking me in the eye, she handed me back my insurance card, and said, "You can go down the road then." I began to leave and she followed up with saying (obviously sarcastically) "I hope you have a great day!" I have never written a poor review on Yelp, and I hope this is my last.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (12, 1, N'oGR8sEAyI67SXiJ9HIt8dQ', N'Tommy A.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2016-07-25 00:00:00.000' AS DateTime), N'Vacation saver!  I was visiting the island this month and on my second day I sliced my foot surfing. I thought my trip was over. I visited Wailea Medical Center and I was blown away by the experience. I saw Dr. Smith who happens to be a surfer as well. The office was super clean, the staff had the aloha spirit and Dr Smith was personable, funny and most importantly fixed up my foot so I could enjoy the rest of my vacation.  Dr Smith was better than any Doctor I have experienced in my hometown of Newport Beach.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (13, 1, N'L6r3zufE8jmrNtj89eVTpA', N'Gavin G.', CAST(1.0 AS Decimal(2, 1)), CAST(N'2014-05-07 00:00:00.000' AS DateTime), N'The absolute WORST. I sprained my back on vacation and went here to get checked out. After making me fill out all their forms, they told me they couldn''t treat me because I didn''t have my insurance card. After I got all of my insurance info from my office back home (my insurance group #, etc) they still said they needed my card to treat me, even after I said I''d pay out of pocket. When I asked if they could recommend another facility they looked at me like I was speaking Greek. Finally a patient in the waiting room got me the number for another clinic up the street. I was in so much pain I could barely move and they were so rude and unhelpful I couldn''t believe it. I went up the street to Kihei -Wailea Medical Group and Dr. See took great care of me. I have never been so frustrated in my life - this is NOT how anyone should be treated when they are in need of medical attention.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (14, 1, N'_b052qdX4-oXykkfxTQOkw', N'Deejay T.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2014-09-12 00:00:00.000' AS DateTime), N'I recently got a new job and was told I needed to get a TB clearance. At the last minute I realized that my past TB test was expired. Long story short I called the Wailea Medical center, where her friendly receptionist were able to squeeze me in that very same day so I would be able to start my new job on time! When I arrived at the medical center the staff was very helpful. I was in and out in less than 20 minutes! AMAZING! I highly recommend this medical center to all my family and friends. Ps. I currently do not have medical insurance and it did not cost me an arm and a leg to be seen here.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (15, 1, N'C4PKO3eDUpEu4FwKEuP_wQ', N'Hannah L.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2016-07-14 00:00:00.000' AS DateTime), N'Dr. Onishi runs a beautiful, top notch office. I have never seen her as a patient, but I have heard rave reviews from her patients. All the doctors and staff are very caring and knowledgeable. Dr Scott is my go to doctor. He has helped me with many medical issues over the years. He listens to my concerns and offers quick and accurate diagnosis, and he is extremely skilled at fixing Boo boos. His competence and friendly manner put people at ease, and I know he has many loyal patients that have followed him for years. I highly recommend this office to anyone who needs medical care.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (16, 1, N'ZnyBroqYBD6jqKyLtM3_Zw', N'Michael K.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2014-08-25 00:00:00.000' AS DateTime), N'Just after New Years 2014 I had a lot of fluid in my lungs and I could not even walk up three stairs.I had this for about 3 months and it got to the point where I couldn''t breathe at night.My friend got me a last minute appointment with Dr.Onishi.I spent a week in the hospital where I was advised by hospital physicians that Dr.Onishi saved my life.She did! She is a no B.S. straight forward caring physician .', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (17, 1, N'm-WUawIx3CkV4VEivZvMuQ', N'Daniel R.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2015-05-08 00:00:00.000' AS DateTime), N'Dr. Onishii has always provided thorough review to both myself, my coworkers and my even my manager at my workplace. I also send my clients to her when they are in need of assistance due to my confidence in her service and staff.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (18, 1, N'q3OUvWSayJHZQfpvj1mWNA', N'Sara H.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2013-10-14 00:00:00.000' AS DateTime), N'My husband strained his neck pretty badly during our vacation. Since he could barely turn his neck it was really putting a damper on our vacation. Being from out of town we were worried that we wouldn''t find a place that accepted our insurance or that could get us in for an appointment. Wailea Medical Center got us in ASAP and accepted our insurance. Registration was quick and easy, the staff were knowledgeable, and we were seen on time. My husband saw Dr. Onishi who was very nice, patient, and knowledgeable. She came up with a plan to get my hubby on the mend so he could get some relief from the pain and enjoy the rest of our vacation. Can''t thank them enough for all their expertise and help.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (19, 1, N'q3iq50ZEtWkHvqGR8DFqbA', N'Crystal B.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2013-08-26 00:00:00.000' AS DateTime), N'Wailea Medical Center & Urgent care is probably the nicest most up-to-date medical facility I have been to. I never had any problems booking an appointment even to be seen the same day. The waiting room is comfortable with more than enough seats not to mention relaxing with the "Spa like" music playing in the background. My appointments have always been on time. The patient exam rooms are clean & brand new & I''ve never had to wait long before Dr. Onishi knocks on the door to greet me. The staff has been awesome & caring. Nurse Jackie is always "on top" of things especially with requesting refills or insurance prescription prior authorizations. I can see why so many of Dr. Onishi''s patients followed her all the way to Wailea.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (20, 1, N'7OhBKjXg-tpPYkVGCKaCgQ', N'Shawn T.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2013-02-26 00:00:00.000' AS DateTime), N'Thank God for Wailea Medical Center & Urgent Care! Dr. Onishi is one of the most knowledgeable and caring doctors I have ever come across in my life. It''s reassuring to know that at this medical center, they are able to take walk-in urgent & emergency care patients without an appointment, and the nurses & staff are very friendly & helpful as well! This practice is fairly new, but Dr. Onishi has been serving the South Maui community for over a decade, and I''ve never heard anything but positive things about her and her abilities to diagnose & treat various ailments that she comes across. I''ve heard of several cases where other doctors on Maui could not diagnose an ailment for their patient, but when they went to see Dr. Onishi, she was able to quickly diagnose the ailment and get them the proper care they needed to get better. I''m so happy that Kihei & Wailea have a physician like her in the community. I live in Kihei part-time for work every summer, and whenever I don''t feel well, I have the utmost confidence that she will help me get better. I usually don''t write reviews, but in certain instances, such as this one, I take the time because people like Dr. Onishi are hard to find in this world.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (21, 1, N'38JUYOpKzraW4hMO29_Q9A', N'Lindsey R.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2015-10-26 00:00:00.000' AS DateTime), N'Nobody wants to get sick or injured on vacation, but when I did, I was thankful for the doctors, nurses, and staff at Wailea Medical Center & Urgent Care. They got me in the same day to see a doctor and I had almost zero wait time. The office is very nice and run very efficiently (which is really appreciated when you are on vacation!) The doctor spent a lot of time with me, answering my questions and providing a diagnosis, and then sent my RX directly to the pharmacy so it was ready by the time I got there. When I needed to return the next day for a follow-up, I saw the other doctor in the practice and I was just as impressed with her. We often visit Maui and I''m so happy to know I have a safe, reliable practice to visit should the need ever arise again!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (22, 1, N'-PkYtRukiWA5qgSvlaea4A', N'Shelly D.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2013-03-05 00:00:00.000' AS DateTime), N'Both Dr. Onishi and Mr. Kaneda never get negative feedback from any of their patients. Ever since Dr. Onishi opened her own facility, almost all of her patients have followed her. They say they don''t mind the drive, as long as they get to stay with her.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (23, 1, N'tsf6XysDgqiLnIi7SrEF0w', N'Julie M.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2015-03-18 00:00:00.000' AS DateTime), N'Thank you for getting me in so quickly for my respiratory infection. Staff was great and I was in and out in 30 min. Hopefully I won''t need your services again, but it''s great knowing you are available when I come to Maui!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (24, 1, N'_KX-20vL2kFZq1nh6m075g', N'Ashley G.', CAST(1.0 AS Decimal(2, 1)), CAST(N'2013-06-26 00:00:00.000' AS DateTime), N'Do not go here! We called, was told there was no wait. After 45 minutes I asked how much longer.. I was told there are still 3 patients ahead of me yet there was not another person in the waiting room the entire time! Finally I walked out. The girls at the front are not helpful and not very nice. Go somewhere else.', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_YelpReviews_TR] ([ID], [YelpID], [ReviewID], [Author], [Rating], [Date], [Text], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (25, 1, N'P9UDICBCogHuH2ioC4lAIg', N'Bo B.', CAST(5.0 AS Decimal(2, 1)), CAST(N'2015-02-07 00:00:00.000' AS DateTime), N'My second day of vacation I tripped and scraped my forearm badly on a rock. The hotel staff recommended this clinic. I called and got an appointment that morning. I was upset, in a lot of pain and my husband sat in the room with me for support.  Dr. Bejenaru couldn''t have been nicer. Very thorough, professional, and sympathetic. After cleaning and bandaging me up, I left with instructions and supplies to treat it myself. Fortunately, I was staying for a month so after 2-1/2 weeks I was completely healed with no infection and was able to finally swim in the ocean!', CAST(N'2019-09-27 16:03:06.920' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[SRCC_YelpReviews_TR] OFF
/****** Object:  Index [PK__aspnet_A__C93A4C980DE0384E]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE4381886A3]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__3091033128365E2C]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4DACD1AA35]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58CAE78C35]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06AD0F0817]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B49941D91]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D83C1DCBA]    Script Date: 6/10/2020 11:02:49 AM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SRCC_GooglePlus_TR] ADD  CONSTRAINT [DF_GooglePlus_ReviewCount]  DEFAULT ((0)) FOR [ReviewCount]
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR] ADD  CONSTRAINT [DF_SRCC_GooglePlusReviews_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR] ADD  CONSTRAINT [DF_SRCC_GooglePlusReviews_Entered]  DEFAULT (getdate()) FOR [Entered]
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR] ADD  CONSTRAINT [DF_SRCC_GooglePlusReviews_ReviewStatusID]  DEFAULT ((1)) FOR [ReviewStatusID]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[SMIM_ReviewAccounts_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_ReviewAccounts_ST_SMIM_AccountType_ST] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[SMIM_AccountType_ST] ([ID])
GO
ALTER TABLE [dbo].[SMIM_ReviewAccounts_ST] CHECK CONSTRAINT [FK_SMIM_ReviewAccounts_ST_SMIM_AccountType_ST]
GO
ALTER TABLE [dbo].[SMIM_ReviewAccounts_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_ReviewAccounts_ST_SMSA_CompanyMst_ST] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[SMSA_CompanyMst_ST] ([CompanyID])
GO
ALTER TABLE [dbo].[SMIM_ReviewAccounts_ST] CHECK CONSTRAINT [FK_SMIM_ReviewAccounts_ST_SMSA_CompanyMst_ST]
GO
ALTER TABLE [dbo].[SMIM_ReviewAccountSite_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_ReviewAccountSite_ST_SMAM_ReviewSites_ST] FOREIGN KEY([ReviewSiteID])
REFERENCES [dbo].[SMAM_ReviewSites_ST] ([SiteID])
GO
ALTER TABLE [dbo].[SMIM_ReviewAccountSite_ST] CHECK CONSTRAINT [FK_SMIM_ReviewAccountSite_ST_SMAM_ReviewSites_ST]
GO
ALTER TABLE [dbo].[SMIM_ReviewAccountSite_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_ReviewAccountSite_ST_SMAM_ReviewSiteTypes_ST] FOREIGN KEY([ReviewSiteTypeID])
REFERENCES [dbo].[SMAM_ReviewSiteTypes_ST] ([SiteTypeID])
GO
ALTER TABLE [dbo].[SMIM_ReviewAccountSite_ST] CHECK CONSTRAINT [FK_SMIM_ReviewAccountSite_ST_SMAM_ReviewSiteTypes_ST]
GO
ALTER TABLE [dbo].[SMIM_ReviewAccountSite_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_ReviewAccountSite_ST_SMIM_ReviewAccounts_ST] FOREIGN KEY([AccountID])
REFERENCES [dbo].[SMIM_ReviewAccounts_ST] ([ID])
GO
ALTER TABLE [dbo].[SMIM_ReviewAccountSite_ST] CHECK CONSTRAINT [FK_SMIM_ReviewAccountSite_ST_SMIM_ReviewAccounts_ST]
GO
ALTER TABLE [dbo].[SMIM_UserAccess_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserAcc_UserMst_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[SMIM_UserMst_ST] ([UserId])
GO
ALTER TABLE [dbo].[SMIM_UserAccess_ST] CHECK CONSTRAINT [FK_SMIM_UserAcc_UserMst_UserId]
GO
ALTER TABLE [dbo].[SMIM_UserAccess_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserAcc_UserType_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[SMIM_UserType_ST] ([UserTypeId])
GO
ALTER TABLE [dbo].[SMIM_UserAccess_ST] CHECK CONSTRAINT [FK_SMIM_UserAcc_UserType_UserTypeId]
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserMst_ST_SMIM_UserType_ST] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[SMIM_UserType_ST] ([UserTypeId])
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST] CHECK CONSTRAINT [FK_SMIM_UserMst_ST_SMIM_UserType_ST]
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserMst_ST_SMSA_CompanyMst_ST] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[SMSA_CompanyMst_ST] ([CompanyID])
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST] CHECK CONSTRAINT [FK_SMIM_UserMst_ST_SMSA_CompanyMst_ST]
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserMst_ST_SMSA_Organization_ST] FOREIGN KEY([OrgId])
REFERENCES [dbo].[SMSA_Organization_ST] ([OrgID])
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST] CHECK CONSTRAINT [FK_SMIM_UserMst_ST_SMSA_Organization_ST]
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserMst_ST_SRCC_SalesAccount_ST] FOREIGN KEY([SACId])
REFERENCES [dbo].[SRCC_SalesAccount_ST] ([SaleAccId])
GO
ALTER TABLE [dbo].[SMIM_UserMst_ST] CHECK CONSTRAINT [FK_SMIM_UserMst_ST_SRCC_SalesAccount_ST]
GO
ALTER TABLE [dbo].[SMIM_UserTypeAccess_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserTypeAccess_ST_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[SMIM_UserTypeAccess_ST] CHECK CONSTRAINT [FK_SMIM_UserTypeAccess_ST_aspnet_Roles]
GO
ALTER TABLE [dbo].[SMIM_UserTypeAccess_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMIM_UserTypeAccess_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[SMIM_UserType_ST] ([UserTypeId])
GO
ALTER TABLE [dbo].[SMIM_UserTypeAccess_ST] CHECK CONSTRAINT [FK_SMIM_UserTypeAccess_UserType]
GO
ALTER TABLE [dbo].[SMSA_Areas_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_Areas_ST_SMSA_Country_ST] FOREIGN KEY([CountryID])
REFERENCES [dbo].[SMSA_Country_ST] ([CountryID])
GO
ALTER TABLE [dbo].[SMSA_Areas_ST] CHECK CONSTRAINT [FK_SMSA_Areas_ST_SMSA_Country_ST]
GO
ALTER TABLE [dbo].[SMSA_Areas_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_Areas_ST_SMSA_States_ST] FOREIGN KEY([StateID])
REFERENCES [dbo].[SMSA_States_ST] ([StateID])
GO
ALTER TABLE [dbo].[SMSA_Areas_ST] CHECK CONSTRAINT [FK_SMSA_Areas_ST_SMSA_States_ST]
GO
ALTER TABLE [dbo].[SMSA_Areas_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_City_ST_SMSA_Area_ST] FOREIGN KEY([CityID])
REFERENCES [dbo].[SMSA_City_ST] ([CityID])
GO
ALTER TABLE [dbo].[SMSA_Areas_ST] CHECK CONSTRAINT [FK_SMSA_City_ST_SMSA_Area_ST]
GO
ALTER TABLE [dbo].[SMSA_Areas_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_City_ST_SMSA_Areas_ST] FOREIGN KEY([StateID])
REFERENCES [dbo].[SMSA_City_ST] ([CityID])
GO
ALTER TABLE [dbo].[SMSA_Areas_ST] CHECK CONSTRAINT [FK_SMSA_City_ST_SMSA_Areas_ST]
GO
ALTER TABLE [dbo].[SMSA_City_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_City_ST_SMSA_States_ST] FOREIGN KEY([StateID])
REFERENCES [dbo].[SMSA_States_ST] ([StateID])
GO
ALTER TABLE [dbo].[SMSA_City_ST] CHECK CONSTRAINT [FK_SMSA_City_ST_SMSA_States_ST]
GO
ALTER TABLE [dbo].[SMSA_City_ST]  WITH CHECK ADD  CONSTRAINT [Relationship13] FOREIGN KEY([CountryID])
REFERENCES [dbo].[SMSA_Country_ST] ([CountryID])
GO
ALTER TABLE [dbo].[SMSA_City_ST] CHECK CONSTRAINT [Relationship13]
GO
ALTER TABLE [dbo].[SMSA_CompanyMst_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_CompanyMst_SMSA_Organization] FOREIGN KEY([OrgID])
REFERENCES [dbo].[SMSA_Organization_ST] ([OrgID])
GO
ALTER TABLE [dbo].[SMSA_CompanyMst_ST] CHECK CONSTRAINT [FK_SMSA_CompanyMst_SMSA_Organization]
GO
ALTER TABLE [dbo].[SMSA_CompanyMst_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_CompanyMst_SRCC_SalesAccount] FOREIGN KEY([SaleAccId])
REFERENCES [dbo].[SRCC_SalesAccount_ST] ([SaleAccId])
GO
ALTER TABLE [dbo].[SMSA_CompanyMst_ST] CHECK CONSTRAINT [FK_SMSA_CompanyMst_SRCC_SalesAccount]
GO
ALTER TABLE [dbo].[SMSA_Organization_ST]  WITH CHECK ADD  CONSTRAINT [FK_HRMS_Organization_ST_SRCC_SalesAccount_ST] FOREIGN KEY([SaleAccId])
REFERENCES [dbo].[SRCC_SalesAccount_ST] ([SaleAccId])
GO
ALTER TABLE [dbo].[SMSA_Organization_ST] CHECK CONSTRAINT [FK_HRMS_Organization_ST_SRCC_SalesAccount_ST]
GO
ALTER TABLE [dbo].[SMSA_Roles_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_Roles_ST_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[SMSA_Roles_ST] CHECK CONSTRAINT [FK_SMSA_Roles_ST_aspnet_Roles]
GO
ALTER TABLE [dbo].[SMSA_States_ST]  WITH CHECK ADD  CONSTRAINT [FK_SMSA_Country_SMSA_States] FOREIGN KEY([CountryID])
REFERENCES [dbo].[SMSA_Country_ST] ([CountryID])
GO
ALTER TABLE [dbo].[SMSA_States_ST] CHECK CONSTRAINT [FK_SMSA_Country_SMSA_States]
GO
ALTER TABLE [dbo].[SRCC_GooglePlus_TR]  WITH CHECK ADD  CONSTRAINT [FK_SRCC_GooglePlus_SMIM_ReviewAccountSite] FOREIGN KEY([SiteAccountID])
REFERENCES [dbo].[SMIM_ReviewAccountSite_ST] ([AccountSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SRCC_GooglePlus_TR] CHECK CONSTRAINT [FK_SRCC_GooglePlus_SMIM_ReviewAccountSite]
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR]  WITH CHECK ADD  CONSTRAINT [FK_SRCC_GooglePlusReviews_GooglePlus] FOREIGN KEY([GoogleID])
REFERENCES [dbo].[SRCC_GooglePlus_TR] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR] CHECK CONSTRAINT [FK_SRCC_GooglePlusReviews_GooglePlus]
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR]  WITH CHECK ADD  CONSTRAINT [FK_SRCC_GooglePlusReviews_SRCC_ReviewStatusTypes] FOREIGN KEY([ReviewStatusID])
REFERENCES [dbo].[SRCC_ReviewStatusTypes_ST] ([ID])
GO
ALTER TABLE [dbo].[SRCC_GooglePlusReviews_TR] CHECK CONSTRAINT [FK_SRCC_GooglePlusReviews_SRCC_ReviewStatusTypes]
GO
ALTER TABLE [dbo].[SRCC_SalesAccount_ST]  WITH CHECK ADD  CONSTRAINT [FK_SRCC_SalesAccount_SRCC_SalesAccount] FOREIGN KEY([ParentSaleId])
REFERENCES [dbo].[SRCC_SalesAccount_ST] ([SaleAccId])
GO
ALTER TABLE [dbo].[SRCC_SalesAccount_ST] CHECK CONSTRAINT [FK_SRCC_SalesAccount_SRCC_SalesAccount]
GO
ALTER TABLE [dbo].[SRCC_Yelp_TR]  WITH CHECK ADD  CONSTRAINT [FK_Yelp_ReviewAccounts] FOREIGN KEY([SiteAccountID])
REFERENCES [dbo].[SMIM_ReviewAccountSite_ST] ([AccountSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SRCC_Yelp_TR] CHECK CONSTRAINT [FK_Yelp_ReviewAccounts]
GO
ALTER TABLE [dbo].[SRCC_YelpReviews_TR]  WITH CHECK ADD  CONSTRAINT [FK_SRCC_YelpReviews_ReviewStatusTypes] FOREIGN KEY([ReviewStatusID])
REFERENCES [dbo].[SRCC_ReviewStatusTypes_ST] ([ID])
GO
ALTER TABLE [dbo].[SRCC_YelpReviews_TR] CHECK CONSTRAINT [FK_SRCC_YelpReviews_ReviewStatusTypes]
GO
ALTER TABLE [dbo].[SRCC_YelpReviews_TR]  WITH CHECK ADD  CONSTRAINT [FK_SRCC_YelpReviews_SRCC_Yelp] FOREIGN KEY([YelpID])
REFERENCES [dbo].[SRCC_Yelp_TR] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SRCC_YelpReviews_TR] CHECK CONSTRAINT [FK_SRCC_YelpReviews_SRCC_Yelp]
GO
/****** Object:  StoredProcedure [dbo].[AddGooglePlusReviews]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddGooglePlusReviews] 
	-- Add the parameters for the stored procedure here
	@DataTable as GooglePlusReviewsTableType readonly
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  --  DECLARE @OldCount int, @NewCount int
  --  SELECT @NewCount = COUNT(*) FROM @DataTable
  --  SELECT @OldCount = COUNT(*) FROM GooglePlusReviews WHERE GoogleID IN (SELECT GoogleID FROM @DataTable)
  --  IF(@OldCount > 0 AND @NewCount= 0)
		--RAISERROR(N'Possible problem with values returned from scrape of GooglePlus site for Reviews.',
		--		16,
		--		1);
	DECLARE @GoogleID int, @GoogleReviewID nvarchar(max),@Text nvarchar(max),@Author nvarchar (100),@OverallRating decimal(2,1),@Date datetime
	DECLARE ReviewCursor Cursor
	FOR 
		SELECT GoogleID, GoogleReviewID,Text,Author,OverallRating,[Date] FROM @DataTable
		OPEN ReviewCursor
			FETCH NEXT FROM ReviewCursor INTO @GoogleID,@GoogleReviewID,@Text,@Author,@OverallRating,@Date
		WHILE (@@FETCH_STATUS=0)
		BEGIN
			IF(NOT EXISTS(SELECT * FROM SRCC_GooglePlusReviews_TR WHERE GoogleID = @GoogleID AND Author = @Author AND ISNULL(SUBSTRING([Text],0,10),'') = ISNULL(SUBSTRING(@Text,0,10),'')))
				BEGIN
					INSERT INTO SRCC_GooglePlusReviews_TR 
						(GoogleID,Text,Author,OverallRating,Date, GoogleReviewID)
							VALUES (@GoogleID,@Text,@Author,@OverallRating,@Date,@GoogleReviewID)
				END
			FETCH NEXT FROM ReviewCursor INTO @GoogleID,@GoogleReviewID,@Text,@Author,@OverallRating,@Date
		END
		
END

GO
/****** Object:  StoredProcedure [dbo].[AddYelpReviews]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddYelpReviews] 
	-- Add the parameters for the stored procedure here
	@DataTable as YelpReviewsTableType readonly
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  --  DECLARE @OldCount int, @NewCount int
  --  SELECT @NewCount = COUNT(*) FROM @DataTable
  --  SELECT @OldCount = COUNT(*) FROM YelpReviews WHERE YelpID IN (SELECT YelpID FROM @DataTable)
  --  IF(@OldCount > 0 AND @NewCount= 0)
		--RAISERROR(N'Possible problem with values returned from scrape of Yelp site for Reviews.',
		--		16,
		--		1);
	INSERT INTO SRCC_YelpReviews_TR
	(
		YelpID,ReviewID,Author,Rating,[Date],Text
	)
	SELECT YelpID,ReviewID,Author,Rating,[Date],Text from @DataTable
END




GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_alterApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_alterPath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_alterApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_alterPath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_alterUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_alterApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_alterUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END






GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END








GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        








GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Procedure [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END








GO
/****** Object:  StoredProcedure [dbo].[GetDashboard]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDashboard]
@CompanyId int,
@Date datetime
AS
BEGIN

Declare @SifMaster table
(
	[CompanyID] [int] NULL,
	[SifId] [int] NOT NULL,
	[EstID] [nvarchar](50) NULL,
	[SifDate] [datetime] NULL,
	[FolderName] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[Month] [nvarchar](2) NULL,
	[Year] [nvarchar](4) NULL,
	[TotalEmployees] [int] NULL,
	[TotalSalary] [numeric](9, 2) NULL,
	[WPSRefNo] [nvarchar](50) NULL,
	[WPSDepositSlip] [nvarchar](max) NULL,
	[ChargesRefNo] [nvarchar](50) NULL,
	[ChargesDepositSlip] [nvarchar](max) NULL,
	[ProcessType] [char](1) NULL,
	[Reason] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[SND_CBUAE] [bit] NOT NULL,
	[SND_CBUAE_DATE] [datetime] NULL,
	[ACK_NAK] [varchar](50) NULL,
	[ACT_NAK_DATE] [datetime] NULL
)

INSERT INTO @SifMaster
Select
	CompanyID, SifId, EstID, SifDate, FolderName, [FileName], [Month], [Year], 
	TotalEmployees, TotalSalary, WPSRefNo, WPSDepositSlip, 
	ChargesRefNo, ChargesDepositSlip, ProcessType, Reason,
	CreatedBy, CreatedOn,
	SND_CBUAE, SND_CBUAE_DATE, ACK_NAK, ACT_NAK_DATE
From HRPR_SifMaster_TR
Where CompanyID = @CompanyId
And DateDiff(day, SifDate, @Date) = 0

Select * From @SifMaster

Select * FRom HRPR_SifDetail_TR Where SifId in (Select SifId From @SifMaster)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateRFA]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GenerateRFA]
AS
BEGIN	

	Declare @HRPR_RFADetail_TR as TABLE 
	(
		[RFAId] [int] IDENTITY(1,1) NOT NULL,
		[PafId] [int] NULL,
		[PafActualName] [nvarchar](50) NULL,
		[BankId] [int] NULL,
		[RoutingCode] [nvarchar](35) NULL,
		[PersonalNo] [nvarchar](35) NULL,
		[IBAN] [nvarchar](35) NULL,
		[RefundAmount] [decimal](9, 2) NULL,
		[ReturnReasonCode] [nvarchar](5) NULL,
		[Reference] [nvarchar](35) NULL,
		[CreatedBy] [int] NULL,
		[CreatedOn] [datetime] NULL,
		[IsExported] [bit] NULL,
		[ExportedOn] [datetime] NULL,
		[ExportedFileName] [varchar](max) NULL
	)

	INSERT INTO @HRPR_RFADetail_TR 
	Select
		T.PafId, T.pafactualname, NULL, NULL, 
		T.personalnumber, T.accountnumber,
		T.netpay, '00001' as ReturnReasonCode, 'Employer Reference not found' as Reference, 
		NULL, GETDATE(), 0, NULL, NULL
	From 
		(Select 
			tb.id as PafId, tb.uploadid, tb.pafactualname, 
			tb.numberofrecords, tbd.personalnumber, tbd.accountnumber, 
			tbd.fixedamount, tbd.variableamount, tbd.netpay,
			isnull(empid, 0)  as EmpId, tb.IsRFAGenerated, tb.RFATimestamp
		From tblPaf tb 
		inner join tblPafdetails tbd on tb.uploadid = tbd.uploadid
		left outer join HRMS_EmployeeMst_TR emp on emp.PersonalNo = tbd.personalnumber and tbd.accountnumber = emp.IBAN
		where tb.deleted <> 1
		and isnull(IsRFAGenerated, 'N') = 'N'
		) T
		Where EmpId = 0
	
	INSERT INTO HRPR_RFADetail_TR
	Select
		T.PafId, T.pafactualname, NULL, NULL, 
		T.PersonalNo, T.IBAN,
		T.RefundAmount, '00001' as ReturnReasonCode, 'Employer Reference not found' as Reference, 
		NULL, GETDATE(), 0, NULL, NULL 
	From @HRPR_RFADetail_TR T

	Update tblPaf Set IsRFAGenerated = 'Y', RFATimestamp = GETDATE()
	Where id in (Select Pafid From @HRPR_RFADetail_TR)
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPAF]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_GetPAF] 
@currentDate		datetime,
@CompanyId			INT
AS

		BEGIN
			Select 
				tb.ID,
				tb.uploadid,
				tb.pafactualname as paffilename,
				(Select Count(td.ID) from tblPafdetails td where tb.uploadid = td.uploadid) as numberofrecords,
				tb.uploaddate,
				tb.BatchID,
				tb.status,
				case 
					when tb.status = 0 then 'Fully Accepted' 
					when tb.status = 1 then 'Partially Accepted'
					when tb.status = 2 then 'Proccessed' 
				end as Status2,
				isnull(tb.PafStatus, '') as pafStatus
			from
				tbl_Paf tb
			where
				DateDiff(DAY, tb.uploaddate, @currentDate) = 0
				--and tb.deleted <> 1
				and tb.status in (0,1,2)
				and tb.companyid = @CompanyId--(case when @exchangeID = 0 then tb.companyid else @exchangeID end)
				

			union all
			Select 
				tb.ID,
				tb.uploadid,
				tb.pafactualname as paffilename,
				(Select Count(TE.ID) from dbo.tblErrors TE where tb.uploadid = TE.uploadid AND TE.errorbit = 1) as numberofrecords,
				tb.uploaddate,
				tb.BatchID,
				tb.status,
				case 
					when tb.status = 1 then 'Partially Rejected'
					when tb.status = 3 then 'Fully Rejected' 
				end as Status2,
				isnull(tb.PafStatus, '') as pafStatus
			from
				tbl_Paf tb
				--Left join dbo.tblErrors as te on tb.uploadid = te.uploadid
			where
				DateDiff(DAY, tb.uploaddate, @currentDate) = 0
				--and tb.deleted <> 1
				and tb.status in (1,3)
				--and te.errorbit = 1
				and tb.companyid = @CompanyId--(case when @exchangeID = 0 then tb.companyid else @exchangeID end)
				--and tb.PafStatus <> 'Confirmed'
			order by
				tb.uploadid,
				tb.uploaddate,
				tb.status desc
			
		END

		
	
GO
/****** Object:  StoredProcedure [dbo].[sp_getPAFSummaryByDate]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getPAFSummaryByDate]
@currentDate	datetime,
@CompanyId		INT
as
	Select 
		tb.id as PafId, tb.uploadid, tb.pafactualname, 
		tb.numberofrecords, tbd.personalnumber, tbd.accountnumber, 
		tbd.fixedamount, tbd.variableamount, tbd.netpay,
		isnull(empid, 0)  as EmpId, tbd.RFAGenerated as IsRFAGenerated, tbd.RFATimestamp
From tbl_Paf tb 
inner join tbl_Paf_details tbd on tb.uploadid = tbd.uploadid
left outer join HRMS_EmployeeMst_TR emp on emp.PersonalNo = tbd.personalnumber and tbd.accountnumber = emp.IBAN
where DateDiff(DAY, tb.uploaddate, @currentDate) = 0 
--and tb.deleted <> 1
and tb.companyid = @CompanyId

GO
/****** Object:  StoredProcedure [dbo].[sp_getPayrollAmountByDate]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getPayrollAmountByDate]
@CompanyId		int,
@PayrollDate			varchar(50),
@PersonelNo		varchar(50)
as
Select 
	tpd.ID AS Value,
	tpd.remainingamount as Text,
	tp.status
from 
	tbl_Paf_details tpd
	INNER JOIN tbl_Paf as tp on tp.uploadid = tpd.uploadid
	INNER JOIN HRMS_EmployeeMst_TR as te on te.PersonalNo = tpd.personalnumber
Where	
	te.CompanyId = @CompanyId
	and datename(Month,tpd.Payrolldate) + ',' + datename(Year,tpd.Payrolldate) = @payrollDate
	and tpd.personalnumber = @PersonelNo
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayrollDates]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetPayrollDates]
@CompanyId		int
as
Select 
	distinct 
	datename(Month,tpd.Payrolldate) + ',' + datename(Year,tpd.Payrolldate)   as [Text]
from 
	tbl_Paf_details tpd
	INNER JOIN HRMS_EmployeeMst_TR as te on te.PersonalNo = tpd.personalnumber
Where	
	te.CompanyID = @CompanyId
	
--group by
--	datename(Month,tpd.Payrolldate) + ',' + datename(Year,tpd.Payrolldate) 
GO
/****** Object:  StoredProcedure [dbo].[sp_getPayrollProcessEmp]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getPayrollProcessEmp]
@CompanyId		int,
@payrollDate			varchar(50)
as
Select 
	distinct
	te.PersonalNo as [PersonalNo]
from 
	tbl_Paf_details tpd
	INNER JOIN HRMS_EmployeeMst_TR as te on te.PersonalNo = tpd.personalnumber
Where	
	te.CompanyId = @CompanyId
	and datename(Month,tpd.Payrolldate) + ',' + datename(Year,tpd.Payrolldate)  = @payrollDate
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRFRDetail]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertRFRDetail]
@RefundDate		datetime,
@ID				INT,
@EstbId			varchar(13),
@RoutingCode	varchar(50),
@EmployeeNo		varchar(50),
@AmountToRefund	decimal(18,0),
@Pan			varchar(50),
@CreateBy		int,
@CreateOn		datetime,
@Reason			varchar(5)
as
BEGIN
	Declare @PafFileName varchar(50), @SifFile varchar(100), @Ack varchar(100), @IBAN varchar(23)

	Set @PafFileName = (Select left(right(pafactualname, 16), 12) From TBL_PAF tp
						inner join TBL_PAF_DETAILS as tpd on tp.uploadid = tpd.uploadid Where tpd.ID = @ID and personalnumber = @EmployeeNo)

	Select @SifFile = isnull(S.[FileName], ''), @Ack = isnull(S.ACK_NAK, '') , @IBAN = D.IBAN
	From HRPR_SifMaster_TR S 
	inner join HRPR_SifDetail_TR D on S.SifId = D.SifId
	Where left(right(ack_nak, 16), 12) = @PafFileName
	and D.PersonalNo = @EmployeeNo
	
	
	Select @SifFile, @ack
	Declare @RFRId int
	
	Set @RFRId = isnull((Select max(RFRId) From HRPR_RFRDetail_HI),0) + 1
	INSERT INTO HRPR_RFRDetail_HI
	(RefundDate, 
	uploadId, 
	RecordType, 
	SIFRef, 
	ACKRef, 
	RountingCode, 
	EmployeeNo, 
	AmountToRefund, 
	RequestCode, 
	PAN, 
	RecordCount, 
	CreatedBy, 
	CreatedOn,
	FutureCol1, 
	FutureCol2, 
	FutureCol3, 
	RFRId,
	Reason)
VALUES     
	(@RefundDate,
	@ID,
	'FDR',
	@SifFile,
	@Ack,
	@RoutingCode,
	@EmployeeNo,
	@AmountToRefund,
	'006',
	@IBAN,
	'1',
	@CreateBy,
	@CreateOn,
	'',
	'',
	'EWPMS',
	@RFRId,
	@Reason)
	
	Set @RFRId = isnull((Select max(RFRId) From HRPR_RFRDetail_HI),0) + 1
	INSERT INTO HRPR_RFRDetail_HI
	(RefundDate, 
	uploadId, 
	RecordType, 
	SIFRef, 
	ACKRef, 
	RountingCode, 
	EmployeeNo, 
	AmountToRefund, 
	RequestCode, 
	PAN, 
	RecordCount, 
	CreatedBy, 
	CreatedOn,
	FutureCol1, 
	FutureCol2, 
	FutureCol3, 
	RFRId,
	Reason)
VALUES     
	(@RefundDate,
	@ID,
	'FCR',
	RIGHT('0000000000000' + CONVERT(varchar(13),@EstbId),13),
	CONVERT(varchar, Year(GETDATE())) + 'CORFR' + CONVERT(varchar, MONTH(GETDATE())),
	@RoutingCode,
	'',
	@AmountToRefund,
	'1',
	RIGHT('000000000000000' + CONVERT(varchar(13),@RoutingCode),23),
	'1',
	@CreateBy,
	@CreateOn,
	'',
	'',
	'EWPMS',
	@RFRId,
	@Reason)
	
begin
	update TBL_PAF_Details
	set remainingamount = remainingamount - @AmountToRefund,
	RFRGenerated = 1, RFRTimestamp = @RefundDate
	where 
		ID = @ID
end

Select 
	ph.RecordType,
	Ph.SIFRef,
	ph.ACKRef,
	ph.RountingCode,
	ph.EmployeeNo,
	ph.AmountToRefund,
	ph.RequestCode,
	ph.PAN,
	''as Future,
	ph.FutureCol3 as Last
from 
 	HRPR_RFRDetail_HI ph
where
	ph.RefundDate = @RefundDate
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_RptEmpInfo]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_RptEmpInfo]
@FromDate Datetime,
@ToDate Datetime,
@User Varchar(30),
@EstId varchar(30),
@PersonalNo varchar(30)
As
Begin	
	Select E.EmpId,E.PersonalNo,EmpCode,FullName,DOJ,DOB,DOE,E.IBAN,E.Email,
	       PhoneNo,MobileNo,BasicSalary,E.CreatedOn,E.CreatedBy,u.UserName,
		   c.EstId,c.CompanyName as Company,
		   c.SaleAccId, Case When a.AccountType = 'A' Then a.SaleAccount 
									else (Select SaleAccount From SRCC_SalesAccount_ST where SaleAccId = a.ParentSaleId ) end as Agent,
		   Case When a.AccountType = 'S' Then a.SaleAccount else 'N/A' end as Subagent,
		   b.BankName,b.RoutingCode
	       from HRMS_EmployeeMst_TR E
    inner join SMIM_UserMst_ST u 
	       on u.UserId = E.CreatedBy
	inner join SMSA_CompanyMst_ST c
	      on c.CompanyID = E.CompanyId
	inner join SMSA_Bank_ST b
	      on b.BankId = E.BankId
	inner join SRCC_SalesAccount_ST a
	      on a.SaleAccId = c.SaleAccId	
    Where Datediff(Day,E.CreatedOn,@FromDate)<=0
	And  Datediff(Day,E.CreatedOn,@ToDate)>=0
	And E.CreatedBy Like @User
	And  c.EstId Like @EstId
	And  E.PersonalNo Like @PersonalNo
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_RptRFRId]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_RptRFRId]
@FromDate Datetime,
@ToDate Datetime,
@User Varchar(30)
As
Begin	
	Select RFRId,RefundDate,RecordType,EmployeeNo,AmountToRefund,RequestCode,
	       PAN,RecordCount,CreatedOn,E.CreatedBy,UserName,SIFRef,ACKRef
		       from HRPR_RFRDetail_HI E
           inner join SMIM_UserMst_ST  u 
               on u.UserId = E.CreatedBy
	Where Datediff(Day,CreatedOn,@FromDate)<=0
			And Datediff(Day,CreatedOn,@ToDate)>=0
			And UserId Like @User
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_RptSalesAccount]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_RptSalesAccount]
@FromDate Datetime,
@ToDate  Datetime,
@User   Varchar(30)
As
Begin
Select SaleAccId,SaleAccount,AccountCode,
	Case When AccountType = 'A' 
	     then 'Agent' 
		 When AccountType = 'S'  
		 then 'Sub Agent' 
		 else AccountType 
		 end as AccountType,
	     Address,Area,S.Mobile,S.CreatedBy ,CreatedOn
	From  SRCC_SalesAccount_ST S
Where DateDiff(Day,CreatedOn,@FromDate)<=0
  And DateDiff(Day,CreatedOn,@ToDate)>=0
  And CreatedBy Like @User
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_SifMstDtl]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_SifMstDtl]
@FromDate Datetime,
@ToDate Datetime,
@User varchar(30),
@EstId varchar(30),
@PersonalNo varchar(30),
@ProcessType varchar(30)
As
Begin
	SELECT d.SifDtlId,d.SifId,
		   d.CompanyID,
		   d.EmpId,
		   d.BankId,
		   s.SifDate, S.Month, S.Year,s.FileName, s.TotalEmployees,
		   d.EstId, c.CompanyName, d.PersonalNo,e.FullName,
		   b.BankName, d.RoutingCode, d.IBAN, d.Basic, d.Allowances, d.NetSalary,d.LeavesPeriod,
	       s.TotalSalary,s.WPSRefNo,s.WPSDepositSlip,
		   s.ChargesRefNo,s.ChargesDepositSlip,
		   Case s.ProcessType When 'P' Then 'Pending' When 'V' Then 'Verified' When 'A' Then 'Approved' end as ProcessType,
		   s.Reason,s.CreatedBy,
		   s.CreatedOn,s.SND_CBUAE,s.SND_CBUAE_DATE,s.ACK_NAK,s.ACT_NAK_DATE,
		   s.DeletedBy,s.DeletedOn,s.DeleteRemarks
		   		   
		   FROM HRPR_SifMaster_TR as s

	inner join HRPR_SifDetail_TR as d	
		   on d.SifId = s.SifId
	inner join SMSA_CompanyMst_ST as c
	       on c.CompanyID = s.CompanyID
	inner join HRMS_EmployeeMst_TR as e
	       on e.EmpId = d.EmpId
	inner join SMSA_Bank_ST as b
	       on b.BankId = d.BankId
    Where DATEDIFF(DAY,s.CreatedOn,@FromDate)<=0
	And  DATEDIFF(DAY,s.CreatedOn,@ToDate)>=0
	And  s.CreatedBy Like @User
	And  d.EstId Like @EstId
	And  d.PersonalNo Like @PersonalNo
	And  s.ProcessType Like @ProcessType	
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateGooglePlusAccount]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateGooglePlusAccount]
	
	@GooglePlusID int = null OUT,
	@SiteAccountID int,
	@AccountID int,
	@Rating decimal(2,1)=null,
	@ReviewCount int,
	@LogID int = null OUT
	
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @ErrCode int, @ErrSeverity int, @ErrState int
	DECLARE @ErrDescription varchar(500)
	
    BEGIN TRY
    
		BEGIN TRAN
		
			IF (ISNULL(@GooglePlusID,0) = 0)
			BEGIN
				-- Check if never been scrapped
				SET @GooglePlusID = (SELECT TOP 1 ID FROM SRCC_GooglePlus_TR WHERE SiteAccountID = @SiteAccountID)
			END
			
			IF @GooglePlusID IS NULL
			BEGIN
			
				--Never been scrapped, Insert New Summary Data
				DECLARE @ClientID int, @NAME varchar (100)
				SET @ClientID = (SELECT CompanyID FROM SMIM_ReviewAccounts_ST where ID = @AccountID)
				SET @Name = (SELECT CompanyName from SMIM_CompanyMst_ST WHERE CompanyID = @ClientID)
				
				INSERT INTO SRCC_GooglePlus_TR(SiteAccountID,Name, OverallRating, ReviewCount) VALUES (@SiteAccountID,@NAME, @Rating, @ReviewCount)
				
				-- Get main table identity
				SET @GooglePlusID = SCOPE_IDENTITY()
				
			END
			ELSE
			BEGIN
			
				-- Update Summary Data
				UPDATE SRCC_GooglePlus_TR
				SET	ReviewCount = @ReviewCount, OverallRating = @Rating
				WHERE ID = @GooglePlusID
				
			END
			
			-- Get Log identity
			SET @LogID = @@IDENTITY
			
			--PRINT @LogID
			--EXEC ResetProblemSite @SiteAccountID
			
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @ErrSeverity = ERROR_SEVERITY(), @ErrState = ERROR_STATE(), @ErrDescription = ERROR_MESSAGE()
		ROLLBACK TRAN	
		BEGIN TRY
			--EXEC AddProblemSite  @SiteAccountID;
			RAISERROR(@ErrDescription,@ErrSeverity,@ErrState)
		END TRY
		BEGIN CATCH
		END CATCH
		RAISERROR(@ErrDescription,@ErrSeverity,@ErrState)
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateYelpAccount]    Script Date: 6/10/2020 11:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateYelpAccount] 

	@YelpID int = null OUT, 
	@SiteAccountID int,
	@OverallRating decimal (2,1) =null,
	@ReviewCount int = null,
	@LogID int = null OUT
	
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @ErrCode int, @ErrSeverity int, @ErrState int
	DECLARE @ErrDescription varchar(500)
	
    BEGIN TRY
		BEGIN TRAN
			
			IF ISNULL(@YelpID,0) = 0
			BEGIN
				-- Check if never been scrapped
				SET @YelpID = (SELECT TOP 1 ID FROM SRCC_Yelp_TR WHERE SiteAccountID = @SiteAccountID)
			END
			
			IF @YelpID IS NULL
			BEGIN
				
				--Never been scrapped, Insert New Summary Data
				INSERT INTO SRCC_Yelp_TR(SiteAccountID, Overall, ReviewCount)VALUES(@SiteAccountID, @OverallRating, @ReviewCount)
				
				-- Get main table identity
				SET @YelpID = SCOPE_IDENTITY()
			
			END
			ELSE
			BEGIN
			
				-- Update Summary Data
				UPDATE SRCC_Yelp_TR
				SET Overall = @OverallRating,ReviewCount = @ReviewCount
				WHERE ID = @YelpID
				
			END
			
			-- Get Log identity
			SET @LogID = @@IDENTITY
			
			--EXEC ResetProblemSite @SiteAccountID
			
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @ErrSeverity = ERROR_SEVERITY(), @ErrState = ERROR_STATE(), @ErrDescription = ERROR_MESSAGE()
		ROLLBACK TRAN	
		BEGIN TRY
			--EXEC AddProblemSite  @SiteAccountID;
			RAISERROR(@ErrDescription,@ErrSeverity,@ErrState)
		END TRY
		BEGIN CATCH
		END CATCH
		RAISERROR(@ErrDescription,@ErrSeverity,@ErrState)
	END CATCH
END



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
         Begin Table = "rat"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ra"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 135
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rast"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 101
               Right = 844
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 882
               Bottom = 135
               Right = 1084
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 102
               Left = 674
               Bottom = 231
               Right = 847
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_AccountToScrape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_AccountToScrape'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_AccountToScrape'
GO
USE [master]
GO
ALTER DATABASE [ORM] SET  READ_WRITE 
GO
