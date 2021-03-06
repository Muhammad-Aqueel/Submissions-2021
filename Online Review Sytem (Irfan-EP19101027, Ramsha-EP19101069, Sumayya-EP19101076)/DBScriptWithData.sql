USE [ORM_FYP]
GO
/****** Object:  UserDefinedTableType [dbo].[GooglePlusReviewsTableType]    Script Date: 2/22/2021 11:46:10 AM ******/
CREATE TYPE [dbo].[GooglePlusReviewsTableType] AS TABLE(
	[GoogleID] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[OverallRating] [decimal](2, 1) NULL,
	[Date] [datetime] NOT NULL,
	[GoogleReviewID] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMAM_Menu_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMAM_Proxies_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMAM_ReviewSites_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
	[Color] [varchar](10) NULL,
	[ImageURL] [varchar](100) NULL,
 CONSTRAINT [PK_SMAM_ReviewSites_ST] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMAM_ReviewSiteTypes_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMAM_SystemService_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMAM_Words_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMAM_Words_ST](
	[WordTypeID] [int] NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WordTypeID_Word] PRIMARY KEY CLUSTERED 
(
	[WordTypeID] ASC,
	[Word] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMAM_WordTypes_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMAM_WordTypes_ST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_WordTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMIM_AccountType_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMIM_ReviewAccounts_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMIM_ReviewAccountSite_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMIM_UserAccess_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMIM_UserMst_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMIM_UserType_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMIM_UserTypeAccess_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_Areas_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_City_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_CompanyMst_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_Country_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_Logs_HI]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_Organization_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_Roles_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SMSA_States_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SRCC_GooglePlus_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
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
	[ReviewCount] [int] NOT NULL CONSTRAINT [DF_GooglePlus_ReviewCount]  DEFAULT ((0)),
	[APIReference] [varchar](300) NULL,
 CONSTRAINT [PK_SRCC_GooglePlus_TR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SRCC_GooglePlusReviews_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
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
	[Date] [datetime] NOT NULL CONSTRAINT [DF_SRCC_GooglePlusReviews_Date]  DEFAULT (getdate()),
	[Entered] [datetime] NULL CONSTRAINT [DF_SRCC_GooglePlusReviews_Entered]  DEFAULT (getdate()),
	[AlertDate] [datetime] NULL,
	[ReviewStatusID] [int] NOT NULL CONSTRAINT [DF_SRCC_GooglePlusReviews_ReviewStatusID]  DEFAULT ((1)),
	[Note] [varchar](1000) NULL,
 CONSTRAINT [PK_SRCC_GooglePlusReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SRCC_ReviewStatusTypes_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SRCC_ReviewWordsCount_HI]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRCC_ReviewWordsCount_HI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NULL,
	[ReviewSiteID] [int] NULL,
	[AccountID] [int] NULL,
	[AccountSiteID] [int] NULL,
	[AccountTypeID] [int] NULL,
	[CompanyID] [int] NULL,
	[OrgID] [int] NULL,
	[Word] [nvarchar](50) NULL,
	[WrdTypeId] [int] NULL,
 CONSTRAINT [PK_SRCC_ReviewWordsCount_HI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SRCC_SalesAccount_ST]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  Table [dbo].[SRCC_Yelp_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SRCC_Yelp_TR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteAccountID] [int] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Overall] [decimal](2, 1) NULL,
	[ReviewCount] [int] NOT NULL,
	[APIReference] [varchar](300) NULL,
 CONSTRAINT [PK_Yelp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SRCC_YelpReviews_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
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
	[Entered] [datetime] NULL,
	[AlertDate] [datetime] NULL,
	[ReviewStatusID] [int] NOT NULL,
	[Note] [varchar](1000) NULL,
 CONSTRAINT [PK_SRCC_YelpReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Vw_AccountReviews]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Vw_AccountReviews]
AS
Select 
	 a.ReviewSiteID as SiteID,s.SiteName,
	 a.AccountSiteID,
	 r.ID as AccountID,
	 t.ID,t.Description,
	 gr.ID as ReviewID, gr.Author,
	 gr.Text,gr.Date, gr.Rating as Rating,
	 r.Description AS AccountName, r.FirstName, r.LastName, r.MiddleName,
	 c.CompanyName AS Client, 
	 r.AccountTypeID, 
	 r.CompanyID,c.OrgID, r.IsBenchmarkAccount
						From SMIM_ReviewAccountSite_ST as a
							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
							inner join SMIM_ReviewAccounts_ST as r on a.AccountID = r.ID
							inner join SMIM_AccountType_ST as t on r.AccountTypeID  = t.ID
							inner join SRCC_Yelp_TR as gp on a.AccountSiteID = gp.SiteAccountID
							inner join SRCC_YelpReviews_TR gr on gp.ID = gr.YelpID	
							inner join  dbo.SMSA_CompanyMst_ST AS c ON c.CompanyID = r.CompanyID
							Where a.IsActive = 1
UNION ALL
Select 
	 a.ReviewSiteID as SiteID,s.SiteName,
	 a.AccountSiteID,
	 r.ID as AccountID,
	 t.ID,t.Description,
	 gr.ID as ReviewID, gr.Author,
	 gr.Text,gr.Date, gr.OverallRating as Rating,
	 r.Description AS AccountName, r.FirstName, r.LastName, r.MiddleName,
	 c.CompanyName AS Client, 
	 r.AccountTypeID, 
	 r.CompanyID,c.OrgID, r.IsBenchmarkAccount
						From SMIM_ReviewAccountSite_ST as a
							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
							inner join SMIM_ReviewAccounts_ST as r on a.AccountID = r.ID
							inner join SMIM_AccountType_ST as t on r.AccountTypeID  = t.ID
							inner join SRCC_GooglePlus_TR as gp on a.AccountSiteID = gp.SiteAccountID
							inner join SRCC_GooglePlusReviews_TR gr on gp.ID = gr.GoogleID	
							inner join  dbo.SMSA_CompanyMst_ST AS c ON c.CompanyID = r.CompanyID
							Where a.IsActive = 1													



GO
/****** Object:  View [dbo].[Vw_AccountToScrape]    Script Date: 2/22/2021 11:46:10 AM ******/
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
                         a.Description AS AccountName, c.CompanyName AS Client, 2 AS LoadDelayMillSeconds, a.AccountTypeID, a.CompanyID, c.OrgID
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
                               FROM            dbo.SRCC_GooglePlusReviews_TR AS fr
                               WHERE        (GoogleID = g.ID)) AS ReviewTableCount, ISNULL(ra.ReviewSiteTypeID, 0) AS SubTypeID, ISNULL(rast.SiteTypeName, '') AS SubTypeName, 
                         a.Description AS AccountName, c.CompanyName AS Client, 2 AS LoadDelayMillSeconds, a.AccountTypeID, a.CompanyID, c.OrgID
FROM            dbo.SMAM_ReviewSites_ST AS rat INNER JOIN
                         dbo.SMIM_ReviewAccountSite_ST AS ra ON rat.SiteID = ra.ReviewSiteID LEFT OUTER JOIN
                         dbo.SRCC_Yelp_TR AS g ON g.SiteAccountID = ra.ReviewSiteID LEFT OUTER JOIN
                         dbo.SMAM_ReviewSiteTypes_ST AS rast ON rast.SiteTypeID = ra.ReviewSiteTypeID INNER JOIN
                         dbo.SMIM_ReviewAccounts_ST AS a ON a.ID = ra.AccountID INNER JOIN
                         dbo.SMSA_CompanyMst_ST AS c ON c.CompanyID = a.CompanyID
WHERE        (rat.SiteID = 1) AND (ISNULL(rat.IsActive, 1) = 1) AND (ISNULL(ra.IsActive, 1) = 1) AND (ISNULL(a.Inactive, 0) = 0) AND (ISNULL(c.IsActive, 'Y') = 'Y')





GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'ab94fec4-196e-4477-a7dc-ad3335681483', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cfbf551c-ec81-42d6-a847-62061871c243', N'admin123', 0, N'NOnN26mA2Hsr8dPhhZkbSw==', NULL, N'admin', N'admin', N'ok', N'ok', 1, 0, CAST(N'2018-11-23 11:37:44.000' AS DateTime), CAST(N'2021-02-12 11:05:31.890' AS DateTime), CAST(N'2018-12-19 10:23:24.130' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ea33ca4d-7e23-47da-a4ec-2571bc02e9e5', N'orgabc123', 0, N'uF/y6IWkc9zdh/SQLkB/8w==', NULL, N'Orgabcgroup', N'orgabcgroup', N'ok', N'ok', 1, 0, CAST(N'2021-02-08 17:40:26.000' AS DateTime), CAST(N'2021-02-08 18:16:56.833' AS DateTime), CAST(N'2021-02-08 18:04:43.047' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e54d62b5-9e15-4d36-b1ea-abd2bf4ac4be', N'abc123', 0, N'+L2JIuEBNUkR8GmC48IiaQ==', NULL, N'abcgroup', N'abcgroup', N'ok', N'ok', 1, 0, CAST(N'2021-02-08 17:40:26.000' AS DateTime), CAST(N'2021-02-09 12:49:02.473' AS DateTime), CAST(N'2021-02-08 18:27:18.947' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'06fb864f-9a6c-446e-8acb-de5966858645', N'cde123', 0, N'dX3gZYmY8EmYZ8BZhiDyCQ==', NULL, N'cdeadmin', N'cdeadmin', N'ok', N'ok', 1, 0, CAST(N'2021-02-08 17:41:30.000' AS DateTime), CAST(N'2021-02-08 17:41:30.000' AS DateTime), CAST(N'2021-02-08 17:41:30.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'43b393ae-6435-4115-961b-c1d9221e7b27', N'subuser123', 0, N'9/fuHJtLMOZcs7aANFOAtA==', NULL, N'Sub User 1', N'sub user 1', N'ok', N'ok', 1, 0, CAST(N'2019-01-17 06:24:49.000' AS DateTime), CAST(N'2019-01-17 06:24:49.000' AS DateTime), CAST(N'2019-01-17 06:24:49.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
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
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'36dca28a-3234-4273-a19e-510837d3b4c5', N'View Sale Account', N'view sale account', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'b8c51c39-d369-4b12-9f53-2fe40893dbb8', N'View Company', N'view company', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'9696980e-5f5b-4b9d-b39a-1be678e6c898', N'Account Management', N'account management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'76fb5189-2ffc-4efe-8166-5377a9967144', N'View Sites', N'view sites', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'5986dc79-6953-4ef7-98e0-2927dc1d252b', N'Report', N'report', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'a47c40d2-f86e-4e60-9cca-c392b990f864', N'Manage Account', N'manage account', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ea29504c-bb2c-4822-8786-0d6a6291b5fa', N'Manage Information', N'manage information', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'946f5a1d-986f-4608-9d5b-00116c44009c', N'Company Management', N'company management', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cf790107-8c55-413d-9fa3-2bb8e832cde7', N'Employee Management', N'employee management', NULL)
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
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'cfbf551c-ec81-42d6-a847-62061871c243', N'admin', N'admin', NULL, 0, CAST(N'2021-02-12 11:05:31.890' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'27ee333b-8f98-421e-baea-3831c65d687e', N'OrgabcAdmin', N'orgabcadmin', NULL, 0, CAST(N'2018-11-25 08:29:30.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'299b6662-6d86-4963-9359-d298fa065541', N'abcAdmin', N'abcadmin', NULL, 0, CAST(N'2018-11-25 08:31:44.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'06fb864f-9a6c-446e-8acb-de5966858645', N'cdeAdmin', N'cdeadmin', NULL, 0, CAST(N'2021-02-08 17:41:30.000' AS DateTime))
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
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'ea33ca4d-7e23-47da-a4ec-2571bc02e9e5', N'Orgabcgroup', N'orgabcgroup', NULL, 0, CAST(N'2021-02-08 18:16:56.833' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ab94fec4-196e-4477-a7dc-ad3335681483', N'e54d62b5-9e15-4d36-b1ea-abd2bf4ac4be', N'abcgroup', N'abcgroup', NULL, 0, CAST(N'2021-02-09 12:49:02.473' AS DateTime))
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (1, NULL, N'P', N'System Setup', N'fas fa-cogs', 1, N'#', NULL, NULL, NULL, N'System Administration', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (2, 1, N'C', N'Rights', N'glyphicon glyphicon-user', 1, N'/Setup/RolesIndex', NULL, 1, CAST(N'2015-11-30 16:34:09.507' AS DateTime), N'View Role', N'Rights')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (3, 1, N'C', N'Role(s)', N'glyphicon glyphicon-plus', 2, N'/Setup/UserTypeIndex', NULL, 1, CAST(N'2015-11-30 16:34:53.770' AS DateTime), N'View User Type', N'Role(s)')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (4, 1, N'C', N'Assign Role(s)', N'glyphicon glyphicon-user', 3, N'/Access/AssignRoles', NULL, NULL, NULL, N'View Assign Role', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (5, 1, N'C', N'Manage Menu', N'glyphicon glyphicon-plus', 4, N'/Setup/MenuIndex', NULL, 1, CAST(N'2015-12-27 13:18:09.673' AS DateTime), N'View Menu', N'Manage Menu')
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (6, NULL, N'P', N'User Setup', N'fas fa-users', 2, N'#', NULL, NULL, NULL, N'User Management', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (7, 6, N'C', N'Manage Users', N'glyphicon glyphicon-user', 1, N'/User/UserIndex', NULL, NULL, NULL, N'View User', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (8, NULL, N'P', N'Company Setup', N'fas fa-building', 3, N'#', NULL, NULL, NULL, N'Company Management', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (9, 8, N'C', N'Manage Company', N'glyphicon glyphicon-plus', 1, N'/Company/CompanyIndex', NULL, NULL, NULL, N'View Company', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (19, 1, N'C', N'Manage Agent / Sub Agent', N' ', 6, N'/SaleAccount/SaleAccountIndex', NULL, NULL, NULL, N'View Sale Account', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (24, NULL, N'P', N'Account Setup', N'fas fa-address-card', 7, N'#', NULL, NULL, NULL, N'Account Management', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (25, 1, N'C', N'Manage Sites', N'glyphicon glyphicon-plus', 7, N'/ReviewSites/ReviewSitesIndex', NULL, NULL, NULL, N'Manage Sites', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (26, NULL, N'P', N'Report', N'fas fa-file', 8, N'#', NULL, NULL, NULL, N'Report', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (27, 24, N'C', N'Manage Account', N'glyphicon glyphicon-plus', 1, N'/CompanyAccounts/CompanyAccountsIndex', NULL, NULL, NULL, N'Manage Account', NULL)
INSERT [dbo].[SMAM_Menu_ST] ([MenuId], [ParentMenuId], [MenuType], [MenuDescription], [IconPath], [MenuSeq], [urlPath], [DefaultValue], [CreatedBy], [CreatedOn], [RoleName], [LocalizeId]) VALUES (28, 26, N'C', N'Manage Information', N'glyphicon glyphicon-user', 1, N'/ReviewsSiteInfo/ReviewsSiteInfo', NULL, NULL, NULL, N'Manage Information', NULL)
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'200.89.174.148')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'43.239.205.153')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'82.177.38.187')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'154.72.197.106')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'155.93.109.218')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'103.92.213.33')
INSERT [dbo].[SMAM_Proxies_ST] ([IP]) VALUES (N'111.92.164.242')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (1, N'Google', N'G', 2, CAST(N'2021-02-09 17:44:28.000' AS DateTime), 1, N'#F7464A', N'/Content/Images/google.png')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (2, N'Yelp', N'Y', 2, CAST(N'2021-02-09 13:37:22.000' AS DateTime), 0, N'#1ac5a4', N'/Content/Images/yelp.png')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (3, N'Vitals', N'V', 2, CAST(N'2019-09-27 17:03:06.920' AS DateTime), 0, N'#101010', N'/Content/Images/vitals.png')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (4, N'Healthgrades', N'H', 2, CAST(N'2019-09-27 17:03:06.920' AS DateTime), 0, N'#46BFBD', N'/Content/Images/healthgrades.png')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (5, N'RateMDs', N'R', 2, CAST(N'2019-09-27 17:03:06.920' AS DateTime), 0, N'#828282', N'/Content/Images/rateMDs.png')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (6, N'YellowPages', N'P', 2, CAST(N'2019-09-27 17:03:06.920' AS DateTime), 0, N'#17a78b', N'/Content/Images/yellowpages.png')
INSERT [dbo].[SMAM_ReviewSites_ST] ([SiteID], [SiteName], [ShortName], [TimerValue], [LastScrapeOn], [IsActive], [Color], [ImageURL]) VALUES (7, N'Facebook', N'F', 2, CAST(N'2019-09-27 17:03:06.920' AS DateTime), 0, N'#3578E5', N'/Content/Images/facebook.png')
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (1, N'ServiceGenerateSIF', 1)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (2, N'Servicesifack', 1)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (3, N'ServiceSifNak', 1)
INSERT [dbo].[SMAM_SystemService_ST] ([ServiceId], [ServiceName], [IsActive]) VALUES (4, N'MSSQLSERVER', 1)
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'2 girls 1 cup')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'2g1c')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'acrotomophilia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'alabama hot pocket')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'alaskan pipeline')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'anal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'anilingus')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'anus')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'apeshit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'arsehole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ass')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'asshole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'assmunch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'auto erotic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'autoerotic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'babeland')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'baby batter')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'baby juice')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ball gag')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ball gravy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ball kicking')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ball licking')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ball sack')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ball sucking')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bangbros')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bareback')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'barely legal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'barenaked')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bastard')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bastard!')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bastardo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bastinado')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bbw')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bdsm')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'beaner')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'beaners')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'beaver cleaver')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'beaver lips')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bestiality')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'big black')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'big breasts')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'big knockers')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'big tits')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bimbos')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'birdlock')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bitch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bitches')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'black cock')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blonde action')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blonde on blonde action')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blow job')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blow your load')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blowjob')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blue waffle')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'blumpkin')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bollocks')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bondage')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'boner')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'boob')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'boobs')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'booty call')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'brown showers')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'brunette action')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bukkake')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bulldyke')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bullet vibe')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bullshit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bung hole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'bunghole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'busty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'butt')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'buttcheeks')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'butthole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'camel toe')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'camgirl')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'camslut')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'camwhore')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'carpet muncher')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'carpetmuncher')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'chocolate rosebuds')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'circlejerk')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cleveland steamer')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'clit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'clitoris')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'clover clamps')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'clusterfuck')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cock')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cocks')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'coon')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'coons')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'coprolagnia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'coprophilia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cornhole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'creampie')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cum')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cumming')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cunnilingus')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'cunt')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dafuq')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dank')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'darkie')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'date rape')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'daterape')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'deep throat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'deepthroat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dendrophilia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dick')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dildo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dingleberries')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dingleberry')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dips hit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dirty pillows')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dirty sanchez')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dog style')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'doggie style')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'doggiestyle')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'doggy style')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'doggystyle')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dolcett')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'domination')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dominatrix')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dommes')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'donkey punch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dork')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'double dong')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'double penetration')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'douche')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'douchebag')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dp action')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dry hump')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dumbass')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'dvda')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'eat my ass')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ecchi')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ejaculation')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'erotic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'erotism')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'escort')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'eunuch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fag')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'faggot')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fecal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'felch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fellatio')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'feltch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'female squirting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'femdom')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'figging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fingerbang')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fingering')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fisting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'foot fetish')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'footjob')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'frotting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fuck')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fuck buttons')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fuckin')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fucking')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fucktards')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fudge packer')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'fudgepacker')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'futanari')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'gang bang')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'gay sex')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'genitals')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'giant cock')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'girl on')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'girl on top')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'girls gone wild')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'goatcx')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'goatse')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'god damn')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'gokkun')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'golden shower')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'goo girl')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'goodpoop')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'goregasm')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'grope')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'group sex')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'g-spot')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'guro')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hand job')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'handjob')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hard core')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hardcore')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hentai')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hoe')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'homoerotic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'honkey')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hooker')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hot carl')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'hot chick')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'how to kill')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'how to murder')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'huge fat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'humping')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'incest')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'intercourse')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jack off')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jail bait')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jailbait')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jelly donut')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jerk off')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jigaboo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jiggaboo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jiggerboo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'jizz')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'juggs')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'kike')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'kinbaku')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'kinkster')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'kinky')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'knobbing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'leather restraint')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'leather straight jacket')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'lemon party')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'lolita')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'lovemaking')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'make me come')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'male squirting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'masturbate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'menage a trois')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'milf')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'missionary position')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'motherfucker')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'mound of venus')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'mr hands')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'muff diver')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'muffdiving')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nambla')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nawashi')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'negro')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'neonazi')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nig nog')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nigga')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nigger')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nimphomania')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nipple')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nipples')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nsfw images')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nude')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nudity')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nympho')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'nymphomania')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'octopussy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'omorashi')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'one cup two girls')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'one guy one jar')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'orgasm')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'orgy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'paedophile')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'paki')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'panties')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'panty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pedobear')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pedophile')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pegging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'penis')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'phone sex')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'piece of shit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'piss pig')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pissing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pisspig')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'playboy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pleasure chest')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pole smoker')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'ponyplay')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'poof')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'poon')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'poontang')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'poop chute')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'poopchute')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'porn')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'porno')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pornography')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'prince albert piercing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pthc')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pubes')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'punany')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'pussy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'queaf')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'queef')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'quim')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'raghead')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'raging boner')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rape')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'raping')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rapist')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rectum')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'reverse cowgirl')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rimjob')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rimming')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rosy palm')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rosy palm and her 5 sisters')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'rusty trombone')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N's&m')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sadism')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'santorum')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'scat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'schlong')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'scissoring')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'semen')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sex')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sexo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sexy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shaved beaver')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shaved pussy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shemale')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shibari')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shitblimp')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shitty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shota')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'shrimping')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'skeet')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'slanteye')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'slut')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'smut')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'snatch')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'snowballing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sodomize')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sodomy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'spic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'splooge')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'splooge moose')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'spooge')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'spread legs')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'spunk')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'strap on')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'strapon')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'strappado')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'strip club')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'style doggy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'suck')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sucks')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'suicide girls')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'sultry women')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'swastika')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'swinger')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tainted love')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'taste my')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tea bagging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'threesome')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'throating')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tied up')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tight white')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tits')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'titties')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'titty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tongue in a')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'topless')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tosser')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'towelhead')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tranny')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tribadism')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tub girl')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tubgirl')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'tushy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'twat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'twink')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'twinkie')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'two girls one cup')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'undressing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'upskirt')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'urethra play')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'urophilia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'vagina')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'venus mound')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'vibrator')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'violet wand')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'vorarephilia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'voyeur')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'vulva')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'wank')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'wet dream')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'wetback')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'white power')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'whore')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'wrapping men')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'wrinkled starfish')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'xx')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'xxx')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'yaoi')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'yellow showers')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'yiffy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (1, N'zoophilia')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'absolutely')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'accepted')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'acclaimed')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'accomodate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'accomplish')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'accomplishment')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'accountable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'achievement')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'action')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'active')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'admire')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'adorable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'adventure')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'affirmative')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'affluent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'agree')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'agreeable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'angelic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'appealing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'approve')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'aptitude')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'attractive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'awesome')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'beaming')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'beauteous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'beautiful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'believe')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'beloved')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'beneficial')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'benevolence')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'best')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'best doctor')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'betterment')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'bliss')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'bountiful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'bounty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'brave')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'bravo')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'brilliant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'bubbly')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'calm')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'captivate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'carrying')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'celebrate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'celebrated')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'certain')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'champ')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'champion')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'charisma')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'charming')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'cheery')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'choice')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'classic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'classical')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'clean')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'commend')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'composed')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'congratulation')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'constant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'cool')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'courageous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'creative')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'cute')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'dandy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'dauntless')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'dazzled')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'dazzling')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'delight')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'delightful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'determination')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'distinguished')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'divine')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'eager')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'earnest')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'easy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ecstatic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'effective')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'effervescent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'efficient')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'effortless')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'elated')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'electrifying')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'elegant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'embolden')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'enchanting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'encouraging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'endorsed')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'energetic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'energized')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'engaging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'enthusiastic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'essential')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'esteemed')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ethical')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'excellent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'exciting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'exquisite')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fabulous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fair')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'familiar')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'famous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fantastic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'favorable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'feat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fervidly')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fetching')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fine')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'finesse')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fitting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'flourishing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fortunate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'free')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fresh')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'friendly')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'fun')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'funny')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'gallant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'generous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'genius')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'genuine')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'giving')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'gladness')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'glamor')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'glamorous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'glowing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'good')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'gorgeous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'graceful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'great')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'greatess ')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'greatess man')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'green')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'grin')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'growing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'handsome')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'handy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'happily')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'happy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'harmonious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'healing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'healthy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'hearty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'heavenly')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'honest')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'honorable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'honored')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'hug')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'idea')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ideal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'illuminate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'illustrious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'imaginative')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'imagine')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'immaculate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'impress')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'impressed')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'impressive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'inclusive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'independent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'innovate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'innovative')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'instant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'instantaneous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'instinctive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'intellectual')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'intelligent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'intuitive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'inventive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'jewell')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'jovial')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'joy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'joyful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'jubilant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'justice')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'keen')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'kind')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'kindness')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'kindred')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'kissable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'knack')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'knowing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'knowledgable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'knowledgeable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'laugh')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'lavish')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'learned')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'legendary')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'liberate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'light')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'lively')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'lovable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'love')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'loved')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'lovely')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'lucid')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'lucky')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'luminous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'magnificence')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'majestic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'marvel')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'marvelous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'masterful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'meaningful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'merit')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'meritorious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'miraculous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'motivating')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'moving')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'natural')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'neat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'nice')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'nicety')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'nimble')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'noble')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'novel')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'novelty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'now')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'nurturing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'nutritious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'observant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'okay')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'one')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'one-hundred percent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'open')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'openhearted')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'openness')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'optimism')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'optimistic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'paradise')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'perfect')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'phenomenal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'pleasant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'pleasurable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'plentiful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'poised')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'polished')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'popular')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'positive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'powerful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'prepared')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'pretty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'principled')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'productive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'progress')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'prominent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'protected')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'proud')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'quaint')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'quality')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'queen')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'quick')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'quick-witted')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'quiet')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'quotable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'radiant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'rapture')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ready')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'reassuring')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'refined')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'refreshing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'rejoice')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'reliable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'remarkable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'resounding')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'respected')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'restorative')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'restored')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'revival')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'reward')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'rewarding')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'right')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'robust')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'safe')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'satisfactory')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'scrumptious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'secure')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'seemly')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sensational')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sensible')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'simple')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sincere')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'skilled')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'skillful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'smile')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'soulful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sparkling')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'special')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'spirited')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'spiritual')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'stirring')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'stunning')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'stupendous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'success')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'successful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sunny')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'super')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'super doctor')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'superb')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'superhero')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'supporting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'surprising')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sweet')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'sweetess')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'tact')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'teach')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'teacher')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'teaching')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'team')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'terrific')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'testament')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'testimonial')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'testimony')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thank')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thankful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thanksgiving')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'therapeutic')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'therapy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thorough')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thoughtful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thoughtfulness')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thril')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thrilling')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thrive')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'thriving')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'tidy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'timeless')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'timely')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'top')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'tops')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'training')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'tranquil')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'tranquillity')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'transcend')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'transformative')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'transforming')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'transient')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'transparent')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'triumph')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'triumphant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'true')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'trust')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'trusting')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'trustworthy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'trusty')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'truth')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'truthful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'try')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'tuition')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ultimate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ultra')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unconditional')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'uncritical')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'understand')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'understanding')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unequalled')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unequivocal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unerring')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unfetter')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unflagging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'ungrudging')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unparalleled')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unreal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'unwavering')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'up')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'upbeat')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'upgrade')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'uplift')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'upright')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'upstanding')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'urbane')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'useful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'user-friendly')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'utmost')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'valid')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'validate')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'valuable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'value')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'valued')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'venerable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'veracious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'verify')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'versatile')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'very')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'very good')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'viable')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'vibrant')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'victorious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'victory')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'vigorous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'virtue')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'virtuosity')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'virtuoso')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'virtuous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'vital')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'vitality')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'vivacious')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'vivid')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'warmth')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wealthy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'welcome')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'well')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wellbeing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'whole')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wholesome')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'willing')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'winsome')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wise')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wonderful')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wondrous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'worthy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'wow')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'yes')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'yippee')
GO
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'yummy')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'zany
')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'zeal')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'zealous')
INSERT [dbo].[SMAM_Words_ST] ([WordTypeID], [Word]) VALUES (2, N'zest')
SET IDENTITY_INSERT [dbo].[SMAM_WordTypes_ST] ON 

INSERT [dbo].[SMAM_WordTypes_ST] ([ID], [Description]) VALUES (1, N'Bad')
INSERT [dbo].[SMAM_WordTypes_ST] ([ID], [Description]) VALUES (2, N'Good')
SET IDENTITY_INSERT [dbo].[SMAM_WordTypes_ST] OFF
SET IDENTITY_INSERT [dbo].[SMIM_AccountType_ST] ON 

INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (1, N'Doctor')
INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (2, N'Provider')
INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (3, N'Resturant')
INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (4, N'Hospital')
INSERT [dbo].[SMIM_AccountType_ST] ([ID], [Description]) VALUES (5, N'Individual')
SET IDENTITY_INSERT [dbo].[SMIM_AccountType_ST] OFF
SET IDENTITY_INSERT [dbo].[SMIM_ReviewAccounts_ST] ON 

INSERT [dbo].[SMIM_ReviewAccounts_ST] ([ID], [CompanyID], [AccountTypeID], [Description], [Inactive], [Address], [City], [State], [Zip], [FirstName], [MiddleName], [LastName], [Credentials], [PhoneNumber], [Website], [NPI], [Specialty], [StoreCode], [ReviewPullType], [ProfilePullType], [IsBenchmarkAccount], [Comments]) VALUES (1, 1, 4, N'Keeva Indian Kitchen', 0, N'Abc Road', NULL, NULL, NULL, N'Keeva', N'Indian', N'Kitchen', N'CR', N'3211234567', N'https://test.com', NULL, NULL, NULL, 2, NULL, 0, NULL)
INSERT [dbo].[SMIM_ReviewAccounts_ST] ([ID], [CompanyID], [AccountTypeID], [Description], [Inactive], [Address], [City], [State], [Zip], [FirstName], [MiddleName], [LastName], [Credentials], [PhoneNumber], [Website], [NPI], [Specialty], [StoreCode], [ReviewPullType], [ProfilePullType], [IsBenchmarkAccount], [Comments]) VALUES (2, 1, 3, N'Lal Qila Resturant', 0, NULL, NULL, NULL, NULL, N'Lal', N'Qila', N' ', NULL, N'3211234567', NULL, NULL, NULL, NULL, 2, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[SMIM_ReviewAccounts_ST] OFF
INSERT [dbo].[SMIM_ReviewAccountSite_ST] ([AccountSiteID], [AccountID], [ReviewSiteID], [ReviewSiteTypeID], [ReviewURL], [IsActive], [LastScrapeOn], [SetInActive], [EnableProfile]) VALUES (1, 1, 1, NULL, N'https://www.google.com/search?q=american+dental+clinic+america&oq=american+dental+clinic+america&#lrd=0x38dfbe73944d4db3:0x90b6e552598a7f2f,1,,,', 1, NULL, NULL, NULL)
INSERT [dbo].[SMIM_ReviewAccountSite_ST] ([AccountSiteID], [AccountID], [ReviewSiteID], [ReviewSiteTypeID], [ReviewURL], [IsActive], [LastScrapeOn], [SetInActive], [EnableProfile]) VALUES (2, 2, 1, NULL, N'https://www.google.com/search?safe=active&source=hp&ei=HXkiYO_7DduU8gKPvongAQ&q=Swadish&oq=Swadish&gs_lcp=CgZwc3ktYWIQA1DPBljPBmDyCWgAcAB4AIABAIgBAJIBAJgBAKABAqABAaoBB2d3cy13aXo&sclient=psy-ab&ved=0ahUKEwiv_rik4NzuAhVbilwKHQ9fAhwQ4dUDCAc&uact=5#lrd=0x3eb33d69957f2cf9:0x570f31adec0393b1,1,,,', 1, NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (1, 1, 1, N'Y')
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (2, 2, 1, N'Y')
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (3, 3, 3, N'Y')
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (4, 4, 4, N'Y')
INSERT [dbo].[SMIM_UserAccess_ST] ([CoAccId], [UserTypeId], [UserId], [Allow]) VALUES (5, 4, 5, N'Y')
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (1, 1, NULL, NULL, N'admin', NULL, N'admin', N'admin', N'admin@unknown.com', NULL, NULL, NULL, CAST(N'2018-11-23 20:06:50.847' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (2, 2, NULL, NULL, N'Sub User 1', NULL, N'Test', N'User', N'subuser@user.com', N'0300221121212', N'+971535656544', N'75850', NULL, NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (3, 3, 1, NULL, N'orgabcgroup', NULL, N'Irfan', N' ', N'irfanrafiq90@gmail.com', NULL, NULL, NULL, CAST(N'2021-02-08 23:04:43.060' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (4, 4, 1, 1, N'abcgroup', NULL, N'Irfan', N' ', N'irfanrafiq90@gmail.com', NULL, NULL, NULL, CAST(N'2021-02-08 23:27:18.957' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserMst_ST] ([UserId], [UserTypeId], [OrgId], [CompanyId], [UserName], [Salutation], [FirstName], [LastName], [Email], [Phone], [Mobile], [ZipCode], [LoginDate], [CreateOn], [CreatedBy], [SACId]) VALUES (5, 4, 1, 2, N'cde (Abc Group)', NULL, N'Irfan', N' ', N'irfanrafiq90@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (1, N'A', N'Admin')
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (2, N'C', N'Sub Users')
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (3, N'O', N'Organization Admin')
INSERT [dbo].[SMIM_UserType_ST] ([UserTypeId], [Type], [Description]) VALUES (4, N'C', N'Company Admin')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (40, 2, N'U', N'View Group', N'Y', N'baf09bf5-9ec0-499c-bcca-e0bbd0edc1a5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (41, 1, N'U', N'Company Management', N'Y', N'946f5a1d-986f-4608-9d5b-00116c44009c')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (42, 1, N'U', N'System Administration', N'Y', N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (43, 1, N'U', N'Account Management', N'Y', N'9696980e-5f5b-4b9d-b39a-1be678e6c898')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (48, 1, N'U', N'User Management', N'Y', N'148df38a-46de-48d3-be50-cc7650eaa80a')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (49, 1, N'U', N'View User', N'Y', N'6f6652f0-123f-4a9b-a4c0-04ccc47771ec')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (50, 1, N'U', N'View Assign Role', N'Y', N'b9ed80b6-6350-4031-b431-0949b63ccac5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (52, 1, N'U', N'Insert Role', N'Y', N'2e780a91-8998-4099-b18b-1cea1fa4deed')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (53, 1, N'U', N'Edit Role', N'Y', N'052d7788-4087-4fbe-98e8-209ff9999263')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (55, 1, N'U', N'Delete Role', N'Y', N'0b74d92b-9ebd-4742-8e2a-e93776c91762')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (56, 1, N'U', N'View Company', N'Y', N'b8c51c39-d369-4b12-9f53-2fe40893dbb8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (58, 1, N'U', N'Insert User Type', N'Y', N'fe667dc4-74a2-4a5a-abd9-9212a48a901d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (59, 1, N'U', N'Edit User Type', N'Y', N'358aef2b-c3f3-420c-ba32-d41389087f16')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (60, 1, N'U', N'Delete User Type', N'Y', N'a78eff4e-68f1-4227-8696-e3d9ea7681e9')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (61, 1, N'U', N'View Sale Account', N'Y', N'36dca28a-3234-4273-a19e-510837d3b4c5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (70, 1, N'U', N'View Menu', N'Y', N'7809c384-69a7-47f0-826f-fa796f446eda')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (71, 1, N'U', N'View Sites', N'Y', N'76fb5189-2ffc-4efe-8166-5377a9967144')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (72, 1, N'U', N'Report', N'Y', N'5986dc79-6953-4ef7-98e0-2927dc1d252b')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (73, 1, N'U', N'Manage Account', N'Y', N'a47c40d2-f86e-4e60-9cca-c392b990f864')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (74, 1, N'U', N'Manage Information', N'Y', N'ea29504c-bb2c-4822-8786-0d6a6291b5fa')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (109, 3, N'U', N'Company Management', N'Y', N'946f5a1d-986f-4608-9d5b-00116c44009c')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (110, 3, N'U', N'System Administration', N'Y', N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (111, 3, N'U', N'Account Management', N'Y', N'9696980e-5f5b-4b9d-b39a-1be678e6c898')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (112, 3, N'U', N'Report', N'Y', N'5986dc79-6953-4ef7-98e0-2927dc1d252b')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (117, 3, N'U', N'User Management', N'Y', N'148df38a-46de-48d3-be50-cc7650eaa80a')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (118, 3, N'U', N'View User', N'Y', N'6f6652f0-123f-4a9b-a4c0-04ccc47771ec')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (120, 3, N'U', N'Manage Information', N'Y', N'ea29504c-bb2c-4822-8786-0d6a6291b5fa')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (132, 3, N'U', N'View Sale Account', N'Y', N'36dca28a-3234-4273-a19e-510837d3b4c5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (139, 3, N'U', N'Manage Account', N'Y', N'a47c40d2-f86e-4e60-9cca-c392b990f864')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (142, 2, N'U', N'Manage Account', N'Y', N'a47c40d2-f86e-4e60-9cca-c392b990f864')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (143, 2, N'U', N'View Sale Account', N'Y', N'36dca28a-3234-4273-a19e-510837d3b4c5')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (144, 2, N'U', N'Manage Information', N'Y', N'ea29504c-bb2c-4822-8786-0d6a6291b5fa')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (145, 2, N'U', N'Account Management', N'Y', N'9696980e-5f5b-4b9d-b39a-1be678e6c898')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (146, 2, N'U', N'Report', N'Y', N'5986dc79-6953-4ef7-98e0-2927dc1d252b')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (148, 2, N'U', N'System Administration', N'Y', N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (149, 4, N'U', N'Account Management', N'Y', N'9696980e-5f5b-4b9d-b39a-1be678e6c898')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (150, 4, N'U', N'Report', N'Y', N'5986dc79-6953-4ef7-98e0-2927dc1d252b')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (151, 4, N'U', N'Manage Information', N'Y', N'ea29504c-bb2c-4822-8786-0d6a6291b5fa')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (152, 4, N'U', N'Manage Account', N'Y', N'a47c40d2-f86e-4e60-9cca-c392b990f864')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (153, 1, N'U', N'View Role', N'Y', N'b5896a9a-ee0d-4dff-8788-4e050156f57d')
INSERT [dbo].[SMIM_UserTypeAccess_ST] ([AccessId], [UserTypeId], [AccessType], [Description], [Allow], [RoleId]) VALUES (154, 1, N'U', N'View User Type', N'Y', N'9e55a01d-11a8-46d0-9003-3b055537b173')
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (1, 1, N'ABC Group', NULL, N'123456', NULL, NULL, NULL, N'Irfan', N'abcgroup', N'Abc Road', NULL, 0, N'032112345678', N'032312345678', N'irfanrafiq90@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2021-02-08 22:40:26.730' AS DateTime), NULL, NULL)
INSERT [dbo].[SMSA_CompanyMst_ST] ([OrgID], [CompanyID], [CompanyName], [logoPath], [EstID], [TotalEmp], [Activity], [Salutation], [ContactPerson], [UserName], [Address], [Area], [CityID], [Phone], [Mobile], [Email], [VerifyEmail], [SaleAccId], [IsActive], [IsApproved], [Terms], [Balance], [SifCharges], [WPSUserId], [CreatedBy], [CreatedOn], [ModifyOn], [ModifyBy]) VALUES (1, 2, N'CDE (ABC Group)', NULL, N'345678', NULL, NULL, NULL, N'Irfan', N'cdeadmin', N'Abc Road', NULL, 0, N'032112345678', N'032312345678', N'irfanrafiq90@gmail.com', NULL, NULL, N'Y', N'Y', NULL, NULL, NULL, NULL, 1, CAST(N'2021-02-08 22:41:30.890' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SMSA_Logs_HI] ON 

INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (1, 1, N'I', N'Add Company', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (2, 1, N'U', N'Edit Company', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (3, 1, N'I', N'Add Bank', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (4, 3, N'D', N'Delete Bank', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (5, 101, N'I', N'Upload New Company', CAST(N'2019-04-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (6, 4, N'U', N'Edit Company Details', CAST(N'2019-04-08 12:49:15.743' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (7, 28, N'I', N'Add New Company', CAST(N'2019-04-08 12:50:07.197' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (8, 8, N'I', N'Add New Agent/SubAgent', CAST(N'2021-01-09 23:04:56.403' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (9, 9, N'I', N'Add New Agent/SubAgent', CAST(N'2021-01-09 23:05:29.593' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10008, 7, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:06:48.983' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10009, 5, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:07:05.167' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10010, 9, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:08:52.047' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10011, 8, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:08:59.380' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10012, 6, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:09:23.153' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10013, 4, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:09:31.157' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10014, 3, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:09:37.420' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10015, 2, N'D', N'Delete Agent/SubAgent', CAST(N'2021-02-08 22:09:45.107' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10016, 2, N'I', N'Add New Agent/SubAgent', CAST(N'2021-02-08 22:10:05.117' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10017, 1, N'I', N'Add New Company', CAST(N'2021-02-08 22:40:26.793' AS DateTime), 1)
INSERT [dbo].[SMSA_Logs_HI] ([LogId], [ColumnId], [ActivityType], [ActivityDesc], [ActivityOn], [ActivityBy]) VALUES (10018, 2, N'I', N'Add New Company', CAST(N'2021-02-08 22:41:30.923' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SMSA_Logs_HI] OFF
INSERT [dbo].[SMSA_Organization_ST] ([OrgID], [Title], [Description], [UserName], [SaleAccId], [Reference], [OrgType], [Status], [Reason], [CreatedBy], [CreatedOn]) VALUES (1, NULL, N'ABC Group', N'Orgabcgroup', NULL, NULL, N'G', N'A', NULL, 1, CAST(N'2021-02-08 22:40:26.583' AS DateTime))
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'946f5a1d-986f-4608-9d5b-00116c44009c', N'Company Management', NULL, NULL, N'Parent Menu', N'Company Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'6f6652f0-123f-4a9b-a4c0-04ccc47771ec', N'View User', NULL, NULL, N'User', N'User')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'b9ed80b6-6350-4031-b431-0949b63ccac5', N'View Assign Role', NULL, NULL, N'Assign Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'ea29504c-bb2c-4822-8786-0d6a6291b5fa', N'Manage Information', NULL, NULL, N'Reviews Information', N'Manage Information')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'43c9d6cf-b130-400c-bb2c-0f3dd087f7a8', N'System Administration', NULL, NULL, N'Parent Menu', N'System Administration')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'9696980e-5f5b-4b9d-b39a-1be678e6c898', N'Account Management', NULL, NULL, N'Parent Menu', N'Account Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'2e780a91-8998-4099-b18b-1cea1fa4deed', N'Insert Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'052d7788-4087-4fbe-98e8-209ff9999263', N'Edit Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'5986dc79-6953-4ef7-98e0-2927dc1d252b', N'Report', NULL, NULL, N'Parent Menu', N'Report')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'b8c51c39-d369-4b12-9f53-2fe40893dbb8', N'View Company', NULL, NULL, N'Company', N'Company')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'9e55a01d-11a8-46d0-9003-3b055537b173', N'View User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'b5896a9a-ee0d-4dff-8788-4e050156f57d', N'View Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'36dca28a-3234-4273-a19e-510837d3b4c5', N'View Sale Account', NULL, NULL, N'Sale Account', N'Sale Account')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'76fb5189-2ffc-4efe-8166-5377a9967144', N'Manage Sites', NULL, NULL, N'Review Sites', N'Manage Sites')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'fe667dc4-74a2-4a5a-abd9-9212a48a901d', N'Insert User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'a47c40d2-f86e-4e60-9cca-c392b990f864', N'Manage Account', NULL, NULL, N'Review Account', N'Manage Account')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'148df38a-46de-48d3-be50-cc7650eaa80a', N'User Management', NULL, NULL, N'Parent Menu', N'User Management')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'358aef2b-c3f3-420c-ba32-d41389087f16', N'Edit User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'a78eff4e-68f1-4227-8696-e3d9ea7681e9', N'Delete User Type', NULL, NULL, N'User Type', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'0b74d92b-9ebd-4742-8e2a-e93776c91762', N'Delete Role', NULL, NULL, N'Role', N'Setup')
INSERT [dbo].[SMSA_Roles_ST] ([RoleId], [RoleName], [CreatedBy], [CreatedOn], [Header], [FormName]) VALUES (N'7809c384-69a7-47f0-826f-fa796f446eda', N'View Menu', NULL, NULL, N'Menu', N'Setup')
SET IDENTITY_INSERT [dbo].[SRCC_GooglePlus_TR] ON 

INSERT [dbo].[SRCC_GooglePlus_TR] ([ID], [SiteAccountID], [Name], [OverallRating], [ReviewCount], [APIReference]) VALUES (1, 1, N'ABC Group', CAST(4.6 AS Decimal(2, 1)), 54, NULL)
INSERT [dbo].[SRCC_GooglePlus_TR] ([ID], [SiteAccountID], [Name], [OverallRating], [ReviewCount], [APIReference]) VALUES (2, 2, N'ABC Group', CAST(4.3 AS Decimal(2, 1)), 16, NULL)
SET IDENTITY_INSERT [dbo].[SRCC_GooglePlus_TR] OFF
SET IDENTITY_INSERT [dbo].[SRCC_GooglePlusReviews_TR] ON 

INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1, 1, N'556e313a-67d7-44dc-8d17-774f8a6811e0', N'I must say that Dr. Khurram is an excellent Dentist and he practices his profession with upmost dedication. His hospitable nature is to be mentioned.When it comes to oral health issues relating to me or my family Dr. Khurram always has long lasting affordable soloution.The dental implants are perfect Thank you! for bringing the smile back on my face.May Almighty bless you.', N'Syed Mujtaba', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.390' AS DateTime), CAST(N'2021-02-09 16:43:18.583' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (2, 1, N'cf8da76d-dcd8-4c5b-a99b-2542b7181a2e', N'Just got my wisdom tooth extracted. Didn''t hurt a bit, the doctor was super nice, friendly helpful staff, hygiene levels were pretty high, and super reasonable. . Would definitely recommend to others.', N'Maiiyam Raza', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.393' AS DateTime), CAST(N'2021-02-09 16:43:18.780' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (3, 1, N'008a4323-cbbe-4b14-aca1-e51c8cd7ed2d', N'Best dentist (Dr Khurram) in Islamabad after Dr Rehman (old Islamabadies must know). He is very professional, gives the best advice. The prices are very reasonable too. Recommended.', N'Faiza b', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.397' AS DateTime), CAST(N'2021-02-09 16:43:18.780' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (4, 1, N'8883058b-3a15-4020-969a-42b4c4e0c335', N'Dr. Khurram Tahir is expert , efficient and fast Dental Surgeon. Did my Root Canal , Crown and Bridge work at an affordable price. Staff is curteous and helpful. Full hygeine is maintained due to Covid 19.', N'Syed Aslam Ali', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.400' AS DateTime), CAST(N'2021-02-09 16:43:18.783' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (5, 1, N'ca775a5b-eda0-44a0-ba58-817316cf0710', N'Way better than other nearby Hospitals like Shifa or Maroof in F-10, the only negative point is that they donâ€™t have in house Detailed Full X-Ray.', N'Usama Khan', CAST(4.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.403' AS DateTime), CAST(N'2021-02-09 16:43:18.783' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (6, 1, N'43240c36-cd35-4655-8a44-985495ed7a8a', N'I am glad to share my experience at this clinic.i had an orthodontic treatment and I am fully satisfied.Had an amazing experience with Dr khurram who''s very humble and devoted to this work.I would highly recommend this clinic to everyone.', N'komal javed', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.403' AS DateTime), CAST(N'2021-02-09 16:43:18.783' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (7, 1, N'e0e40faf-26bb-4b12-9188-a1edc798216a', N'Dr Khurram is an excellent dentist who makes patients feel right at home. Clinic is very nice and clean', N'M.Ali Baig', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.407' AS DateTime), CAST(N'2021-02-09 16:43:18.783' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (8, 1, N'c97d15d2-4d33-4840-9df8-64212faf4d8f', N'I got my dental treatment from Dr. Khurram of American Dental Clinic. My experience was extremely rewarding in terms of the service and treatment provided , dental care , health and safety standard (A+) as per any of international standards  of dental Clinic. I would highly recommend it for all kinds of dental services !Thanks again Dr. Khurram and your team !Afshan Tehseen', N'Afshan Tehseen', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.410' AS DateTime), CAST(N'2021-02-09 16:43:18.787' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (9, 1, N'0a56bbd8-1c01-4121-b3a3-f5c6e9911e65', N'I am glad to share my experience about Dr khurrum Tahir  American dental clinic Islamabad.  It has been  three to seven years  since I got my dental treatments  with Dr khurrum time to time and still I am under his treatment. I  found the Dr and his team very professional,competent humble and committed with thier patients .Either it''s filling,root canal ,extraction,scalling implants or whatever the treatment you need in dental category with sterilised instruments  I must  say the  best clinic in Islamabad with reasonable fee and payments  and will recommend for others too.Thier are lot of dental clinics open at every door step but the important  thing is choosing the one you rely on .In short I will again recommend that clinic which will never disappoint you in any of the treatments and services .', N'Sana Nisar', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.410' AS DateTime), CAST(N'2021-02-09 16:43:18.787' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (10, 1, N'472cab86-d18f-44c9-8061-76a6aadc2690', N'I was always unhappy with my smile but all those horror stories about braces kept me away from the orthodontist. I googled the best dentist in islamabad and found Dr. Khurram. I visited him for fillings but after meeting he suggested me to go for braces. Dr. Khurram briefed me about everything by showing pictures on the screen and answered all of my queries. I felt so confident to proceed with the treatment. Today I''m so happy with the outcome, he has literally changed my smile :) Hygienic clinic, very reasonable and high quality care. I would highly recommend American Dental Clinic to anyone looking for the best dentist.', N'Maryam Sahi', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:14.413' AS DateTime), CAST(N'2021-02-09 16:43:18.787' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (11, 1, N'4d25ea53-a473-4269-826c-5e73b1d454cd', N'Dr khurram is definitely the best dentist in the twin cities. After going to many other dentists before, no one compares to him. He is incredibly skilled at what he does, very kind and caring and makes the patient feel completely relaxed and at ease. I have had a number of different treatments done and everything was completely painless and I am very happy and more than satisfied with everything. All the equipment is state of the art and the clinic is very nice and hygienic. Everyone in my family goes to him and I would highly recommend him to anyone looking for an amazing dentist. Youâ€™ll never go to anyone else after him.', N'Tooba Rana', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.143' AS DateTime), CAST(N'2021-02-09 16:43:18.787' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (12, 1, N'89ef79ea-abfd-4d41-bb3b-f04946fcd03c', N'Dr. Khurram is very friendly and gentle in dealing with patientsI am going through braces treatment which is very satisfactory in terms of perfection and looking forward to see the best results :)Highly recommended', N'Saad Sultan', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.147' AS DateTime), CAST(N'2021-02-09 16:43:18.843' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (13, 1, N'5634fe86-3d4e-46c2-ab07-997ef5732adc', N'Excellent Treatment and perfect Diagnosis.I am work for Saudi Airline for last 17 years, i came from Jeddah for wedding season ðŸ˜ƒ with my family. My wife had an extreme pain just after the take off, landed islamabad on 17 dec. We went to 5 different Dentists in 6 days with extreme pain but was not diagnosed for exact pain an issue. Dr. khuram was referred by my friend Hassan Hadii. Trust me just 15 minutes of excellent excellent treatment , and yes perfectly diagnosed. Did a root canal and my family really prayed for Dr. khuram. We pray for drkhuram and highly recommend. Excellent doctor, well and modern equipped clinic. My special prayers.Rizwan Khalid Khan.Jeddah.SA.', N'Rizwan Khalidkhan', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.147' AS DateTime), CAST(N'2021-02-09 16:43:18.843' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (14, 1, N'f9025067-2c8e-4f55-b8bd-046b3fc694de', N'got braces done here. highly satisfied with results. also got tooth extraction, filling n crowns. sterilized sealed instruments, change of gloves with every tiny procedure, extremely clean clinic, amazing with scared children and elderly. the only dentist I trust in Pakistan. even my parents don''t visit anyone else for their dental treatments.', N'Rabia M', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.150' AS DateTime), CAST(N'2021-02-09 16:43:18.847' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (15, 1, N'084ede42-3b8e-4288-8570-7415cfef5cc0', N'I''ve just got one wisdom tooth removed yesterday and the work Dr. Khurrum did was just amazing. The procedure was beyond clean and he was explaining to me step by step what he was doing, Very satisfied with the level of care and attention for an extremely anxious patient like me. exceptionally tolerant, professional young man he is. and he made the procedure seem so easy and seamless.I will definitely recommend him to my whole family. Without any doubt I found the best dentist in Islamabad..', N'Sitwat Shahzad', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.153' AS DateTime), CAST(N'2021-02-09 16:43:18.847' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (16, 1, N'6dc5f679-4078-455c-9ddd-0d92941dfc6f', N'I''m from mirpur AJk .I searched on internet for best dental clinic in Islamabad and I found it. Best survice,comfortable, neat and clean environment.just I got my root canal treatment without any pain  Allhumdullilah.                                                 I''m so happy.I would highly recommended Dr khurram .', N'Jannat Shah', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.157' AS DateTime), CAST(N'2021-02-09 16:43:18.847' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (17, 1, N'65837ce9-eae9-4118-b02b-311dd8ad48c7', N'Recommended.I Visited this clinic in 2018. Found the staff well mannered. The Dentist gave fair and straightforward opinion, rare in town now. Prices are somehow better, as I compared with clinics nearby (ie. Islamabad).', N'Zulfiqar Ali', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.157' AS DateTime), CAST(N'2021-02-09 16:43:18.847' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (18, 1, N'b53c10f6-13ae-43c2-8f93-f39cb8a46f47', N'Best dental clinic in town in respect of professionalism and treatment. Staff is cooperative and responsive. Dr himself is a real noble and gentleman. His behavior is just like a real brother. I wish him all the success in his field.Regards SRK', N'Shahid Razi', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.160' AS DateTime), CAST(N'2021-02-09 16:43:18.850' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (19, 1, N'9b110662-6a43-4e3e-8898-1c618d8fec5f', N'My small city is better than this isb clinic in treatment..', N'Khalid Khan', CAST(1.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.160' AS DateTime), CAST(N'2021-02-09 16:43:18.850' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (20, 1, N'335978bf-2761-4e9c-be1e-d1c023d34b5a', N'Dr. Khurrum is a throurogh professional and a great doctor. Iâ€™ve been going to him to get my dental treatments since the last 13 years. He is very accommodating and listens very patiently and the treatments at top notch!P.S. the clinicâ€™s ambiance is so amazing. Most importantly the clinic is very neat and clean and very hygienic.', N'Zoha Fatima', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:15.163' AS DateTime), CAST(N'2021-02-09 16:43:18.850' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (21, 1, N'b0ab0096-d80a-4801-9275-f289b11b6c48', N'The best dentist I have had so far! I heard a lot of good reviews about American Dental Clinic and went there myself for crowning. The doctor and technical staff was very pleasant. I was walked through the procedure whenever I asked. The doctor answered to all my queries with patience and in detail.', N'Rizwan Asif', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.153' AS DateTime), CAST(N'2021-02-09 16:43:18.850' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (22, 1, N'e7af8f7f-24e7-4e85-8ea3-4910665637ee', N'I am Usually squeamish when going to the dentists and here I was laughing while having my wisdom tooth extracted at ADC. that''s how much at ease I was.Dr Khurram is a terrific and experienced dentist mashAllah! He listens, is super friendly , his clinic is spotless and his staff extremely courteous! Thank you for fitting me in your schedule on an emergency basis.I am so glad to have found his clinic. To anyone out there considering a visit here, don''t think twice!Thank you for the painless procedure and making an extraction actually fun!', N'Hassan Khan', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.153' AS DateTime), CAST(N'2021-02-09 16:43:18.850' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (23, 1, N'66389212-8cfe-4ccd-a0ad-bf2fc424af7d', N'I searched over 15 places before being referred to Dr. Kurum.  His clinic is the cleanest I have seen.  Hygiene practice is a 10/10.  The Dr. is experienced, quick and through.  Have referred many here now for braces, crowns.  Thank you for giving the same quality of dental service and infrastructure I would get in Canada.', N'Tariq Khursheed', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.157' AS DateTime), CAST(N'2021-02-09 16:43:18.853' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (24, 1, N'c7d9e8de-aa1f-444f-b947-cf8a94f34b9e', N'Wisdom tooth extraction. Executed painlessly and very smoothly by Dr. Khurrum. Very satisfied with my overall experience. Neat and clean environment. Polite staff.', N'Oneeb Ahmed Chohan', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.170' AS DateTime), CAST(N'2021-02-09 16:43:18.853' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (25, 1, N'ec55f399-7402-430b-b402-43f31d0a5ce8', N'I would highly recommend Dr. Khurram, I personally think he is the best dentist in town, whom you can trust for your family.Before we met Dr. Khurram, we have had pathetic experiences with money making Dentists (Read: Butchers) of Islamabad.My 3 year old daughter was operated for 1.5 hours under General Anesthesia at Maroof International hospital, she had to go through 3 Root canals and 5 fillings and a bill of almost 1 Lac PKR, but the only complain we went there with was of a tooth ache.2 years fast forward , her tooth started  aching again, and we took her Shifa International Hospital and the dentists there (after criticizing Maroof and blaming its management of irresponsible & unprofessional behavior blah blah) suggested the same procedure, this time with a bill of 1 lac 75000 PKR only. Wow!Everything set aside, we didnâ€™t want our 5 year old to be operated under General Anesthesia 2nd time in a time frame of mere 2 years.Long story short, someone suggested us Dr. Khurram at American Dental Clinic, and going to him was the best decision we could have taken for our child. Turns out, she doesnâ€™t even need to go through such a painful procedure when the issue can be cured with many other feasible, healthier, humanly and child friendly alternatives.May Allah shower his blessings upon Dr. Khurram! :)', N'sujda shah', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.173' AS DateTime), CAST(N'2021-02-09 16:43:18.853' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (26, 1, N'd06bd488-eb35-490e-9bd6-c6929cd9c4d1', N'I Went to consult for me as well as my four year old daughter. The doctor listened patiently and did a great job. Very nice and recommended.', N'Muddassir Malik', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.173' AS DateTime), CAST(N'2021-02-09 16:43:18.853' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (27, 1, N'cf80667e-2263-4b00-ba71-a1ee31125cc0', N'I had two of my wisdom teeth removed here in December 2017 and it was a great experience. I have anxiety and ask a lot of questions. Dr. Khuram was very patient with me. In the US, it would''ve cost me $350 per tooth and $150 for anastasia for each other. My ticket to Pakistan was $750 (I went in winter-off season) and about $160 (16000rupees) for my teeth. The bonus is that I got to see my family!', N'Guriya Mano', CAST(4.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.177' AS DateTime), CAST(N'2021-02-09 16:43:18.857' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (28, 1, N'523c6df5-8901-4d70-b106-8055615c4e2b', N'I got two implants done by Dr. Khurrum and the procedure was carried out by him painlessly and very professionally. He''s a very professional yet extremely friendly and lively dentist. I''ve never enjoyed going to a doctor before. Moreover, the clinic is very clean and hygienic. I would highly recommend him. After being tortured by another dentist for 4 years, Dr. Khurrum not only did my implants but also improved my smile using braces that too only in 7 months! My family and I are very glad to have found him and my mom really adores him.', N'Manahil Adnan', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.180' AS DateTime), CAST(N'2021-02-09 16:43:18.857' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (29, 1, N'a4fccc68-1929-48fc-99e1-4ad7e2ee2d25', N'Alright so as a general dislike for doctors without any bias, there comes a time when you have no choice but need one. And so after chewing on one side of my mouth for a couple of months i decided to find meself a dentist. Unfortunately all the suggestions i got from people did not appeal to me. I went with google clicked the first website that popped up choose the most qualified lookin dude, however at the last minute my friend suggested dr khurram from american dental clinic and boy im glad i listened.Needless to say Dr Khurram is going to be my official family dentist. Everything about the guy is perfect. Great staff, friendly n welcoming with a smile. Good ambiance and excellent service. I also think the pricing is very reasonable, i say this because its important for some people.', N'Mati Rehman', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.183' AS DateTime), CAST(N'2021-02-09 16:43:18.857' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (30, 1, N'769e9e95-485e-47bc-90bd-c63cb90d4e2e', N'Most friendly and relaxed environment for children especially. I had heard horror stories about getting braces but had an amazing experience with Dr. Khurram in getting braces and fixing my teeth. Would highly recommend American Dental Clinic to others.', N'Hareem Nisar', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.183' AS DateTime), CAST(N'2021-02-09 16:43:18.860' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (31, 1, N'0e0083fe-d27e-4796-93c7-d8198c4b3d9a', N'My friend from USA got implants and bridges from Dr. Khurram at American Dental Clinic. Got Swiss implants in an affordable price , with an excellent hygiene. Found one of the best places for dental treatment. Thank you very much Dr Khurram for treating and handling her treatment so professionally.', N'Aqsa Kausar', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.793' AS DateTime), CAST(N'2021-02-09 16:43:18.860' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (32, 1, N'fb4f6d1a-784c-4832-b143-f5188fe7aa2e', N'I am blogger and basically write too many reviews for different experiences.I had an excellent out standing experience wth  Dr khuram, one the best person i met. I had two root canals and two crowns of lower molars. It took 15 min to complete root canal. He did it wth lazer ,amazing, Totally painless. Very quick and Excellent services by Dr khurram.Keep it up and keep GrowingVery very neat and clean clinic and equipment.All is you need to wait for your appointment, waiting time is about 15- 30 min .Location mark on the google map if its your first visit for easy and quick approach.Thanks', N'Eshal Fatima', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.793' AS DateTime), CAST(N'2021-02-09 16:43:18.860' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (33, 1, N'fe6afb41-1231-4ace-a4ea-0f7a584ef098', N'Nice place and intelligent doctor.', N'Aftab Akram', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.797' AS DateTime), CAST(N'2021-02-09 16:43:18.860' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (34, 1, N'bb2df2c6-49cb-43c5-9055-6f9613526aba', N'I have had a really bad experience with Dr. Khurram at this clinic. He may be easily available and responsive over phone but this does not make him a competent doctor. He superficially cleaned my son''s cavity and got us going in no time. The same tooth developed a deeper infection and we had to do his root canal at such a young age. Root canals are bad at any age and doc''s negligence and lack of care or guidance led us to make this rather painful decision. It wasn''t a one off, I was at the clinic for later follow up check ups also.My husband also got his treatment done and developed abscesses multiple times. Dr. Khurram would operate, seal the tooth on surface and it would turn into such horrible puss and pain. After two successive failures we didn''t want to spend more money on him and shifted to a much better, way more professional doctor at Shifa; however it was too late to save the tooth. And again we lost due to Dr. Khurram''s lack of professionalism and guidance.Same feedback for Dr. Noeen. Lots of people go to him, and may we be all saved from operations for money shrouded in ignorance of the patient.', N'Harime Khan', CAST(1.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.797' AS DateTime), CAST(N'2021-02-09 16:43:18.860' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (35, 1, N'aedfd75e-10ea-47d6-b223-e77cb035b0bd', N'Best service and experience with Dr. Khurram. Needless to say, I was very conscious person when it comes to personal care. I had my orthodontic treatment with american dental clinic. The treatment was great. Doctor listened to me patiently everytime and made sure to make me satisfied at its best. Very humble and down to earth doctor. Dr.khurram made appointments according to my convenience everytime. I highly recommend to go anytime for every treatment at american dental clinic.', N'Moni Mona', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.797' AS DateTime), CAST(N'2021-02-09 16:43:18.863' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (36, 1, N'bebf7f30-2d83-4ebc-bf6a-f65b256268b3', N'I searched on internet for best dental center in Islamabad and I found it! American dental clinic in F-10. Dr. Khurram Tahir performed an oral surgery and my jaw has never felt better. He was very patient with me and carried out the procedure in a calm manner. Dr. Khurram and his team made the experience friendly and as less painful as possible.', N'Beenish Khan', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.800' AS DateTime), CAST(N'2021-02-09 16:43:18.863' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (37, 1, N'de7d3d29-ea23-409e-8357-ea794841f3fa', N'Doctor is v frindly and amazing ... He makes u feel at home ... Highly recommended', N'red arena', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.800' AS DateTime), CAST(N'2021-02-09 16:43:18.863' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (38, 1, N'0d5fb479-bf08-47a5-afc2-2fefb3652945', N'I Went there for the extraction of my wisdom tooth Dr.Tahir is an amazing human being beside being a qualified and professional dentist.The procedure was done painlessly by Dr.Tahir,i would definitely recommend Dr.Tahir if you are having any dental problems.', N'Omer Rasool', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.803' AS DateTime), CAST(N'2021-02-09 16:43:18.867' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (39, 1, N'3f45d305-21f7-452d-83c7-e093e77c52ea', N'Comfortable,neat and clean environment..cooperative staff and well qualified doctor..must visit :)', N'num tahir', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.803' AS DateTime), CAST(N'2021-02-09 16:43:18.867' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (40, 1, N'63673319-5752-411c-a95d-4f531c1d2d20', N'Great doctor. excellent services. Operated for rct on eid ul fitr 16. 2nddayNo one does that. Great and sincere doctor with field.', N'Danyal Nasir', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:16.807' AS DateTime), CAST(N'2021-02-09 16:43:18.867' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (41, 1, N'007bea4e-8bab-42f5-a43e-87acd5cc864e', N'Excellent experience and well qualified dentist. Must visit', N'Omer Tahir', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.443' AS DateTime), CAST(N'2021-02-09 16:43:18.870' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (42, 1, N'7ab161e4-b1d5-4e5f-bd9a-79426991a341', N'Dr. Khurram is a young ambitious dentist who knows what he''s doing.', N'Mansoor Ahmed', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.447' AS DateTime), CAST(N'2021-02-09 16:43:18.870' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (43, 1, N'adf531e8-77ed-474e-9ed5-d7ac99fffda3', N'Expensive but quality services', N'Muhammad Tayyab', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.450' AS DateTime), CAST(N'2021-02-09 16:43:18.870' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (44, 1, N'267e599f-2e31-4e3f-95bb-0d42e4097e25', N'', N'Kashif Haider', CAST(3.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.453' AS DateTime), CAST(N'2021-02-09 16:43:18.870' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (45, 1, N'1c542b9a-3339-4b54-953e-0398bfeea940', N'', N'Waleed sarwar', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.453' AS DateTime), CAST(N'2021-02-09 16:43:18.873' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (46, 1, N'34e79195-12d6-4a3f-ac22-13d630d74eb3', N'', N'Ufaq Tasneem', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.457' AS DateTime), CAST(N'2021-02-09 16:43:18.873' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (47, 1, N'4d8cb701-b002-45be-8949-129cc5559105', N'', N'å¤§é±¼å°é±¼æˆé•¿è®°', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.457' AS DateTime), CAST(N'2021-02-09 16:43:18.873' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (48, 1, N'0911215a-2abb-47ac-9cbd-d36ab7a19007', N'', N'Afaq Ahmad', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.460' AS DateTime), CAST(N'2021-02-09 16:43:18.877' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (49, 1, N'855e63d6-48da-4e3f-bcb9-897dee32993b', N'', N'palwasha ibrar', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.460' AS DateTime), CAST(N'2021-02-09 16:43:18.877' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (50, 1, N'08bff5bb-4a92-4978-8165-c35f71969350', N'', N'Asmad Hussain', CAST(4.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.463' AS DateTime), CAST(N'2021-02-09 16:43:18.877' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (51, 1, N'b6251d8c-fc8d-4287-bcb7-cca5ecebac80', N'', N'Mehtab Ahmed', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.950' AS DateTime), CAST(N'2021-02-09 16:43:18.877' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (52, 1, N'dd36b1c7-8662-4472-a89a-0810b0a529ff', N'', N'Zerry Nazir', CAST(3.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.950' AS DateTime), CAST(N'2021-02-09 16:43:18.880' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (53, 1, N'b3895058-8340-485b-a49b-fd1053e48120', N'', N'Surgeonotilo den', CAST(1.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.953' AS DateTime), CAST(N'2021-02-09 16:43:18.880' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (54, 1, N'a590614e-0b40-49f6-a109-f18286165608', N'', N'asia saad', CAST(1.0 AS Decimal(2, 1)), CAST(N'2021-02-09 16:43:17.953' AS DateTime), CAST(N'2021-02-09 16:43:18.880' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1071, 2, N'78d3eef0-8180-4440-9644-6920e104d77d', N'Probably the best Nihari I have had in Karachi. Definitely comparable to Kolachi. We tried Special Nihari and boneless chicken Karahi. They were both excellent. The meat was well cooked and tender. Spices were spot on. Staff was professional and courteous. Service was excellent. The place was cute and cozy but filled up fairly quickly.I highly recommend this place!', N'Taha Ubaid', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.747' AS DateTime), CAST(N'2021-02-09 17:45:22.587' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1072, 2, N'22efd885-5a68-4ba6-8159-3ec2af300578', N'Excellent experience. The menu is limited  but what is served is outstanding. The Nihari is delectable as is the reshmi kebabs.The service is prompt and very courteous.', N'Glen A. Bayat', CAST(4.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.747' AS DateTime), CAST(N'2021-02-09 17:45:22.590' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1073, 2, N'a832804a-dc4d-404b-90ff-54699fe6fc67', N'Amazing food, Great Atmosphere & Ambience... Overall great experience ðŸ‘', N'ebk sourcing', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.750' AS DateTime), CAST(N'2021-02-09 17:45:22.607' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1074, 2, N'a6124fb6-b31f-48cf-99bb-99a6d97bdd41', N'Average food but the staff and service was good', N'Adeeb Khalid', CAST(3.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.753' AS DateTime), CAST(N'2021-02-09 17:45:22.607' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1075, 2, N'fda756cf-2d39-4073-a20c-7af825183d23', N'Best desi food', N'tooba noor', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.757' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1076, 2, N'ce46864b-1e82-475f-97ae-2c784a4b9632', N'(Translated by Google) Truly Dehli walla Desi cuisine.(Original)Truly Dehli walla Desi cuisine.', N'Husain Azfar', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.757' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1077, 2, N'c4c1ba2f-0786-443d-944b-7eabd75fa7ef', N'(Translated by Google) Nehari is awesome(Original)Nehari is awesome', N'Narmeen Faiyaz', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.760' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1078, 2, N'1778ea60-6a66-41ce-bf2c-10a8ff5e2621', N'', N'Dr Junaid Mahmood Alam', CAST(4.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.763' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1079, 2, N'17583ec5-f002-487f-a90c-f25483e28b0f', N'', N'Sami Noorsumar', CAST(4.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.767' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1080, 2, N'1fe9c918-7e11-4ef4-b146-1e151f440ab5', N'', N'Omar Salah Ahmed', CAST(3.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:25.767' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1081, 2, N'312ec615-201d-45d0-a6d8-f1a31b199b51', N'', N'Naveed Iqbal', CAST(3.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:28.777' AS DateTime), CAST(N'2021-02-09 17:45:22.610' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1082, 2, N'139cdd17-05b0-408a-818e-20f87a4a3686', N'', N'hiraanis anis', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:28.780' AS DateTime), CAST(N'2021-02-09 17:45:22.613' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1083, 2, N'898005a8-9bd0-40e1-9677-cc35d82b3b26', N'', N'waleed effendi', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:28.780' AS DateTime), CAST(N'2021-02-09 17:45:22.613' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1084, 2, N'9622e48c-2c4f-4271-81cd-90fedc298b53', N'', N'Shahzain Feroze', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:28.783' AS DateTime), CAST(N'2021-02-09 17:45:22.613' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1085, 2, N'6692ac4e-da5c-4c71-8449-5c95f496c7a9', N'', N'Syed Imran Mohsin Ali', CAST(3.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:28.787' AS DateTime), CAST(N'2021-02-09 17:45:22.613' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[SRCC_GooglePlusReviews_TR] ([ID], [GoogleID], [GoogleReviewID], [Text], [Author], [OverallRating], [Date], [Entered], [AlertDate], [ReviewStatusID], [Note]) VALUES (1086, 2, N'13bd2f31-166c-45f0-a33f-4523fcfec5ac', N'', N'Ammar Kushtiwala', CAST(5.0 AS Decimal(2, 1)), CAST(N'2021-02-09 17:44:28.787' AS DateTime), CAST(N'2021-02-09 17:45:22.617' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[SRCC_GooglePlusReviews_TR] OFF
SET IDENTITY_INSERT [dbo].[SRCC_ReviewStatusTypes_ST] ON 

INSERT [dbo].[SRCC_ReviewStatusTypes_ST] ([ID], [Description]) VALUES (1, N'Active')
SET IDENTITY_INSERT [dbo].[SRCC_ReviewStatusTypes_ST] OFF
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (1, N'Agent A', N'A001', N'A', NULL, N'Test Road Abc', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SRCC_SalesAccount_ST] ([SaleAccId], [SaleAccount], [AccountCode], [AccountType], [ParentSaleId], [Address], [Area], [Phone], [Mobile], [CreatedBy], [CreatedOn]) VALUES (2, N'Sub Agent A', NULL, N'S', 1, NULL, NULL, NULL, NULL, 1, CAST(N'2021-02-08 22:10:05.047' AS DateTime))
/****** Object:  Index [PK__aspnet_A__C93A4C98D32D0581]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE4BF873645]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__309103313BAD74F9]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D75B8A8BC]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58DD20DEF8]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC0671C799DB]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B112B2E9B]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D10DA5499]    Script Date: 2/22/2021 11:46:10 AM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SRCC_Yelp_TR] ADD  CONSTRAINT [DF_Yelp_Overall]  DEFAULT (NULL) FOR [Overall]
GO
ALTER TABLE [dbo].[SRCC_Yelp_TR] ADD  CONSTRAINT [DF_Yelp_ReviewCount]  DEFAULT ((0)) FOR [ReviewCount]
GO
ALTER TABLE [dbo].[SRCC_YelpReviews_TR] ADD  CONSTRAINT [DF_SRCC_YelpReviews_Entered]  DEFAULT (getdate()) FOR [Entered]
GO
ALTER TABLE [dbo].[SRCC_YelpReviews_TR] ADD  CONSTRAINT [DF_SRCC_YelpReviews_ReviewStatusID]  DEFAULT ((1)) FOR [ReviewStatusID]
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
ALTER TABLE [dbo].[SMAM_Words_ST]  WITH CHECK ADD  CONSTRAINT [FK_Words_WordTypes] FOREIGN KEY([WordTypeID])
REFERENCES [dbo].[SMAM_WordTypes_ST] ([ID])
GO
ALTER TABLE [dbo].[SMAM_Words_ST] CHECK CONSTRAINT [FK_Words_WordTypes]
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
/****** Object:  StoredProcedure [dbo].[AddGooglePlusReviews]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
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
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
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
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END









GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
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
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
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
/****** Object:  StoredProcedure [dbo].[GetDashboard]    Script Date: 2/22/2021 11:46:10 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Get_Account_By_Company]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 26-Jun-2020          
-- Description : Create Sp For Get Accounts By Company 
-- SP_Get_Account_By_Company '2'
--====================================================================  
CREATE PROCEDURE [dbo].[SP_Get_Account_By_Company] 
@CompanyID nvarchar(10) = '%',
@OrgID nvarchar(10) = '%'
As
Begin
Select 
		c.CompanyID,c.CompanyName,
		isnull((Select Count(a.ID) From SMIM_ReviewAccounts_ST as a Where a.CompanyID = c.CompanyID group by CompanyID),0) as AccountCount
						From SMSA_CompanyMst_ST as c
												Where c.CompanyID Like @CompanyID
												  And c.OrgID Like @OrgID
End

GO
/****** Object:  StoredProcedure [dbo].[SP_GetCompanies_By_Organization]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 22-Jun-2020          
-- Description : Create Sp For etCompany By Organization 
-- SP_GetCompanies_By_Organization
--====================================================================  
CREATE PROCEDURE [dbo].[SP_GetCompanies_By_Organization] 
@OrgName varchar(50) = '%'
As
Begin
Select  
		v.OrgID,v.Description,
		(Select Count(CompanyID) From SMSA_CompanyMst_ST as c Where c.OrgID = v.OrgID group by OrgID) as CompanyCount
				From SMSA_Organization_ST as v
				Where  v.Description Like @OrgName
End
															
	

GO
/****** Object:  StoredProcedure [dbo].[SP_IsAccount_Benchmark_Dashboard]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 13-Aug-2020          
-- Description : Create Sp For Benchmark Dashboard Comparing Accounts
-- SP_IsAccount_Benchmark_Dashboard '%','%','%','%',null  
--====================================================================  
CREATE PROCEDURE [dbo].[SP_IsAccount_Benchmark_Dashboard] 
@CompnayID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%', 
@AcctountType nvarchar(15) = '%',
@Date datetime = null 
As
Begin
	Select
			s.SiteID,s.SiteName,
			COUNT(1) as ReviewsCount,
			Cast(Isnull(Avg(Rating),0) as decimal(2,1)) as Rating
						From Vw_AccountReviews as s
						Where 
								s.SiteID like @SiteID
							And	s.AccountID like @AccountID 
							And	s.AccountTypeID like @AcctountType
							And s.CompanyID like @CompnayID 
							And s.[IsBenchmarkAccount] = 0
							And (@Date is null OR DateDiff(DAY, s.Date, @Date) = 0)
						Group By
								s.SiteID,s.SiteName
End

	--Select 
	--	s.SiteID,s.SiteName,
	--	Case When s.SiteId = 1 Then Sum(isnull(google.ReviewCount,0))
	--		 When s.SiteId = 2 Then Sum(isnull(yelp.ReviewCount,0))
	--	End As ReviewsCount,
	--	Case When s.SiteId = 1 Then Cast(AVG(isnull(google.OverallRating,0)) as Decimal(6,1))
	--		 When s.SiteId = 2 Then Cast(AVG(isnull(yelp.Overall,0)) as Decimal(6,1))
	--	End As Rating	
	--						From SMIM_ReviewAccountSite_ST as a
	--							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
	--							inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID And r.IsBenchmarkAccount = 0
	--							inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID							
	--							outer apply (SELECT * FROM SRCC_GooglePlus_TR AS google WHERE a.AccountSiteID = google.SiteAccountID) google
	--							outer apply (SELECT * FROM SRCC_Yelp_TR AS yelp WHERE a.AccountSiteID = yelp.SiteAccountID) yelp
	--						Where 
	--								s.SiteID like @SiteID
	--							And	r.ID like @AccountID 
	--							And	t.ID like @AcctountType
	--							And r.CompanyID like @CompnayID 
	--							And a.IsActive = 'True'
	--							--And (@Date is null OR DateDiff(DAY, s.Date, @Date) = 0)							
	--						Group By
	--								s.SiteID,s.SiteName
															
	

GO
/****** Object:  StoredProcedure [dbo].[SP_IsBenAccount_Benchmark_Dashboard]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 13-Aug-2020          
-- Description : Create Sp For Benchmark Dashboard Comparing Accounts
-- SP_IsBenAccount_Benchmark_Dashboard '%','%','%','%',null     
--====================================================================  
CREATE PROCEDURE [dbo].[SP_IsBenAccount_Benchmark_Dashboard] 
@CompnayID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%', 
@AcctountType nvarchar(15) = '%',
@Date datetime = null
As
Begin
	Select
			s.SiteID,s.SiteName,
			COUNT(1) as ReviewsCount,
			Cast(Isnull(Avg(Rating),0) as decimal(2,1)) as Rating
						From Vw_AccountReviews as s
						Where 
								s.SiteID like @SiteID
							And	s.AccountID like @AccountID 
							And	s.AccountTypeID like @AcctountType
							And s.CompanyID like @CompnayID 
							And s.[IsBenchmarkAccount] = 1
							And (@Date is null OR DateDiff(DAY, s.Date, @Date) = 0)
						Group By
								s.SiteID,s.SiteName
End
															
	--Select 
	--	s.SiteID,s.SiteName,
	--	Case When s.SiteId = 1 Then Sum(isnull(google.ReviewCount,0))
	--		 When s.SiteId = 2 Then Sum(isnull(yelp.ReviewCount,0))
	--	End As ReviewsCount,
	--	Case When s.SiteId = 1 Then Cast(AVG(isnull(google.OverallRating,0)) as Decimal(6,1))
	--		 When s.SiteId = 2 Then Cast(AVG(isnull(yelp.Overall,0)) as Decimal(6,1))
	--	End As Rating	
	--						From SMIM_ReviewAccountSite_ST as a
	--							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
	--							inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID And r.IsBenchmarkAccount = 1
	--							inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID							
	--							outer apply (SELECT * FROM SRCC_GooglePlus_TR AS google WHERE a.AccountSiteID = google.SiteAccountID) google
	--							outer apply (SELECT * FROM SRCC_Yelp_TR AS yelp WHERE a.AccountSiteID = yelp.SiteAccountID) yelp
	--						Where 
	--								s.SiteID like @SiteID
	--							And	r.ID like @AccountID 
	--							And	t.ID like @AcctountType
	--							And r.CompanyID like @CompnayID 
	--							And a.IsActive = 'True'							
	--						Group By
	--								s.SiteID,s.SiteName

GO
/****** Object:  StoredProcedure [dbo].[SP_Review_WordCount_Dashboard_HI]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 08-July-2020          
-- Description : Create Sp For Review Words Count 'Good/Bad'
-- SP_Review_WordCount_Dashboard_HI '0'  
--==================================================================== 
CREATE PROCEDURE [dbo].[SP_Review_WordCount_Dashboard_HI]
@WrdTypeId int = '0'
As
Begin
Select 
		Isnull(Count(w.ID),0) as WrdTypeCount,w.Description
		From SRCC_ReviewWordsCount_HI as a
			Inner join SMAM_WordTypes_ST as w on w.ID = a.WrdTypeId
		Where WrdTypeId = Case When @WrdTypeId = '0' Then WrdTypeId Else @WrdTypeId End
		Group by w.ID,w.Description 
End              

GO
/****** Object:  StoredProcedure [dbo].[SP_Reviews_Chart_Dashboard_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 16-Jun-2020          
-- Description : Create Sp For 
-- SP_Reviews_Chart_Dashboard_TR      
--====================================================================  
CREATE PROCEDURE [dbo].[SP_Reviews_Chart_Dashboard_TR] 
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%', 
@AcctountType nvarchar(15) = '%'
As
Begin
Select 
	s.SiteID,s.SiteName,
	Case When s.SiteId = 1 Then Sum(isnull(google.ReviewCount,0))
		 --When s.SiteId = 2 Then Sum(isnull(yelp.ReviewCount,0))
	End As ReviewsCount,
	Case When s.SiteId = 1 Then Cast(AVG(isnull(google.OverallRating,0)) as Decimal(6,1))
		 --When s.SiteId = 2 Then Cast(AVG(isnull(yelp.Overall,0)) as Decimal(6,1))
	End As Rating	
						From SMIM_ReviewAccountSite_ST as a
							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
							inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID
							inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID
							outer apply (SELECT * FROM SRCC_GooglePlus_TR AS google WHERE a.AccountSiteID = google.SiteAccountID) google
							--outer apply (SELECT * FROM SRCC_Yelp_TR AS yelp WHERE a.AccountSiteID = yelp.SiteAccountID) yelp
						Where 
								s.SiteID like @SiteID
							And	r.ID like @AccountID 
							And	t.ID like @AcctountType
							And a.IsActive = 'True' 							
						Group By
								s.SiteID,s.SiteName
End
															
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Reviews_CompanyWise_Dashboard]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 25-Jun-2020          
-- Description : Create Sp For Reviews Chart Dashboard TR Company Wise
-- SP_Reviews_CompanyWise_Dashboard '%','%','%','%'      
--====================================================================  
CREATE PROCEDURE [dbo].[SP_Reviews_CompanyWise_Dashboard] 
@CompnayID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%', 
@AcctountType nvarchar(15) = '%'
As
Begin
Select 
	s.SiteID,s.SiteName,
	Case When s.SiteId = 1 Then Sum(isnull(google.ReviewCount,0))
		 --When s.SiteId = 2 Then Sum(isnull(yelp.ReviewCount,0))
	End As ReviewsCount,
	Case When s.SiteId = 1 Then Cast(AVG(isnull(google.OverallRating,0)) as Decimal(6,1))
		 --When s.SiteId = 2 Then Cast(AVG(isnull(yelp.Overall,0)) as Decimal(6,1))
	End As Rating	
						From SMIM_ReviewAccountSite_ST as a
							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
							inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID
							inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID							
							outer apply (SELECT * FROM SRCC_GooglePlus_TR AS google WHERE a.AccountSiteID = google.SiteAccountID) google
							--outer apply (SELECT * FROM SRCC_Yelp_TR AS yelp WHERE a.AccountSiteID = yelp.SiteAccountID) yelp
						Where 
								s.SiteID like @SiteID
							And	r.ID like @AccountID 
							And	t.ID like @AcctountType
							And r.CompanyID like @CompnayID 
							And a.IsActive = 'True'							
						Group By
								s.SiteID,s.SiteName
End
															
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Reviews_Line_CompanyWise_Dashboard]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 25-Jun-2020          
-- Description : Create Sp For Reviews Line Dashboard TR Company Wise
-- SP_Reviews_Line_CompanyWise_Dashboard '%','%','0','0'    
--====================================================================  
CREATE PROCEDURE [dbo].[SP_Reviews_Line_CompanyWise_Dashboard] 
@CompnayID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID int = '0', 
@AcctountType int = '0'
As
Begin
--SP Body Start There--
DECLARE 
@FromDate datetime,
@Todate datetime,
@RunningDate datetime

Set @ToDate = GETDATE()
Set @FromDate = DateAdd(day, 1, DATEADD(Year, -1, @ToDate))
Set @RunningDate = @FromDate

Declare @Months as Table
(
	MonthNo int,
	MonthNam varchar(3),
	MonthYr varchar(4),
	AccountType int,
	AccountId int,
	GoogleReviews int,
	YelpReviews int,
	GoogleRating int,
	YelpRating int
)
While @RunningDate <= @ToDate
Begin
	Declare @monthNo int, @MonthYr varchar(4), @GoogleReviews int, @YelpReviews int, @GoogleRating int, @YelpRating int, @Date datetime

	Set @monthNo = DatePart(Month,@RunningDate)
	Set @MonthYr = DatePart(Year, @RunningDate)

	Set @Date = @MonthYr + '-' + Convert(varchar, @monthNo) + '-01'


	Set @GoogleReviews = (SELECT 
							count(1) ReviewCount
						  FROM SRCC_GooglePlus_TR AS googlem
						  inner join SRCC_GooglePlusReviews_TR googleReview on googlem.ID = googleReview.GoogleID
						  inner join SMIM_ReviewAccountSite_ST as s on s.ReviewSiteID = Case When @SiteID in ('%', '1') then 1 else 0 end  and s.AccountSiteID = googlem.SiteAccountID
						  inner join SMIM_ReviewAccounts_ST as r on r.ID = s.AccountID And r.CompanyID Like @CompnayID
						  WHERE r.ID = Case When @AccountID = '0' Then r.Id else @AccountID  end
						  And	r.AccountTypeID  = Case When @AcctountType = '0' Then r.AccountTypeID else @AcctountType  end
						  and  DateDiff(month, googleReview.Date, @Date) = 0
						  )

Set @YelpReviews = 0;

	--Set @YelpReviews = (SELECT 
	--						count(1) ReviewCount
	--					  FROM SRCC_Yelp_TR AS googlem
	--					  inner join SRCC_YelpReviews_TR googleReview on googlem.ID = googleReview.YelpID
	--					  inner join SMIM_ReviewAccountSite_ST as s on s.ReviewSiteID = Case When @SiteID in ('%', '2') then 2 else 0 end and s.AccountSiteID = googlem.SiteAccountID
	--					  inner join SMIM_ReviewAccounts_ST as r on r.ID = s.AccountID And r.CompanyID Like @CompnayID
	--					  WHERE r.ID = Case When @AccountID = '0' Then r.Id else @AccountID  end
	--					  And	r.AccountTypeID  = Case When @AcctountType = '0' Then r.AccountTypeID else @AcctountType  end
	--					  and  DateDiff(month, googleReview.Date, @Date) = 0
	--					  )

	Set @GoogleRating = (SELECT 
							isnull(avg(googleReview.OverallRating),0)  as GoogleRating
						  FROM SRCC_GooglePlus_TR AS googlem
						  inner join SRCC_GooglePlusReviews_TR googleReview on googlem.ID = googleReview.GoogleID
						  inner join SMIM_ReviewAccountSite_ST as s on s.ReviewSiteID = Case When @SiteID in ('%', '1') then 1 else 0 end  and s.AccountSiteID = googlem.SiteAccountID
						  inner join SMIM_ReviewAccounts_ST as r on r.ID = s.AccountID And r.CompanyID Like @CompnayID
						  WHERE r.ID = Case When @AccountID = '0' Then r.Id else @AccountID  end
						  And	r.AccountTypeID  = Case When @AcctountType = '0' Then r.AccountTypeID else @AcctountType  end
						  and  DateDiff(month, googleReview.Date, @Date) = 0)

	Set @YelpRating = (SELECT 
							isnull(avg(googleReview.Rating),0) as YelpRating
						  FROM SRCC_Yelp_TR AS googlem
						  inner join SRCC_YelpReviews_TR googleReview on googlem.ID = googleReview.YelpID
						  inner join SMIM_ReviewAccountSite_ST as s on s.ReviewSiteID = Case When @SiteID in ('%', '2') then 2 else 0 end and s.AccountSiteID = googlem.SiteAccountID
						  inner join SMIM_ReviewAccounts_ST as r on r.ID = s.AccountID And r.CompanyID Like @CompnayID
						  WHERE r.ID = Case When @AccountID = '0' Then r.Id else @AccountID  end
						  And	r.AccountTypeID  = Case When @AcctountType = '0' Then r.AccountTypeID else @AcctountType  end
						  and  DateDiff(month, googleReview.Date, @Date) = 0)

	Insert into @Months 
	values(@monthNo , left(DATEName(Month, @RunningDate),3), @MonthYr, @AcctountType, @AccountID, @GoogleReviews, @YelpReviews, @GoogleRating, @YelpRating)
	
	Set @RunningDate = DateAdd(Month, 1, @RunningDate)

End

Select * From @Months
End
															
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Reviews_LineChart_Dashboard_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 19-Jun-2020          
-- Description : Create Sp For SP_Reviews_LineChart_Dashboard_TR    
-- SP_Reviews_LineChart_Dashboard_TR  '1',1,1
--====================================================================  
CREATE PROCEDURE [dbo].[SP_Reviews_LineChart_Dashboard_TR] 
@SiteID nvarchar(15) = '%',
@AccountID int = '0', 
@AcctountType int = '0'
As
Begin
	--SP Body Start There--
DECLARE 
@FromDate datetime,
@Todate datetime,
@RunningDate datetime

Set @ToDate = GETDATE()
Set @FromDate = DateAdd(day, 1, DATEADD(Year, -1, @ToDate))
Set @RunningDate = @FromDate

Declare @Months as Table
(
	MonthNo int,
	MonthNam varchar(3),
	MonthYr varchar(4),
	AccountType int,
	AccountId int,
	GoogleReviews int,
	YelpReviews int
)
While @RunningDate <= @ToDate
Begin
	Declare @monthNo int, @MonthYr varchar(4), @GoogleReviews int, @YelpReviews int, @Date datetime

	Set @monthNo = DatePart(Month,@RunningDate)
	Set @MonthYr = DatePart(Year, @RunningDate)

	Set @Date = @MonthYr + '-' + Convert(varchar, @monthNo) + '-01'


	Set @GoogleReviews = (SELECT 
							count(1) ReviewCount
						  FROM SRCC_GooglePlus_TR AS googlem
						  inner join SRCC_GooglePlusReviews_TR googleReview on googlem.ID = googleReview.GoogleID
						  inner join SMIM_ReviewAccountSite_ST as s on s.ReviewSiteID = Case When @SiteID in ('%', '1') then 1 else 0 end  and s.AccountSiteID = googlem.SiteAccountID
						  inner join SMIM_ReviewAccounts_ST as r on r.ID = s.AccountID
						  WHERE r.ID = Case When @AccountID = '0' Then r.Id else @AccountID  end
						  And	r.AccountTypeID  = Case When @AcctountType = '0' Then r.AccountTypeID else @AcctountType  end
						  and  DateDiff(month, googleReview.Date, @Date) = 0
						  )

	--Set @GoogleReviews = (SELECT 
	--						count(1) ReviewCount
	--					  FROM dbo.Vw_AccountToScrape as v
	--					  inner join SRCC_GooglePlusReviews_TR googleReview on v.SiteID = googleReview.GoogleID
	--					  WHERE v.AccountID = Case When @AccountID = '0' Then v.AccountID else @AccountID  end
	--					  And	v.AccountTypeID  = Case When @AcctountType = '0' Then v.AccountTypeID else @AcctountType  end
	--					  and v.TypeID = Case When @SiteID in ('%', '1') then 1 else 0 end
	--					  and  DateDiff(month, googleReview.Date, @Date) = 0
	--					  )

	Set @YelpReviews = 0
	--Set @YelpReviews = (SELECT 
	--						count(1) ReviewCount
	--					  FROM SRCC_Yelp_TR AS googlem
	--					  inner join SRCC_YelpReviews_TR googleReview on googlem.ID = googleReview.YelpID
	--					  inner join SMIM_ReviewAccountSite_ST as s on s.ReviewSiteID = Case When @SiteID in ('%', '2') then 2 else 0 end and s.AccountSiteID = googlem.SiteAccountID
	--					  inner join SMIM_ReviewAccounts_ST as r on r.ID = s.AccountID
	--					  WHERE r.ID = Case When @AccountID = '0' Then r.Id else @AccountID  end
	--					  And	r.AccountTypeID  = Case When @AcctountType = '0' Then r.AccountTypeID else @AcctountType  end
	--					  and  DateDiff(month, googleReview.Date, @Date) = 0
	--					  )

	Insert into @Months 
	values(@monthNo , left(DATEName(Month, @RunningDate),3), @MonthYr, @AcctountType, @AccountID, @GoogleReviews, @YelpReviews)

	

	Set @RunningDate = DateAdd(Month, 1, @RunningDate)

End

Select * From @Months
End
															
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Reviews_Rating_Summary_Dashboard]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 05-Aug-2020          
-- Description : Create Sp For Reviews Rating Summary Dashboard
-- SP_Reviews_Rating_Summary_Dashboard '%','%','0','0',null,null
--==================================================================== 
CREATE PROCEDURE [dbo].[SP_Reviews_Rating_Summary_Dashboard]
@CompnayID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID int = '0', 
@AcctountType int = '0',
@Date datetime = null, --'2013-02-26',
@SqlQry varchar(max) = null
As
Begin

	Declare @tblRatingSum Table
	(
		AccountID int,
		AccountName varchar(50),  
		Google int, 
		GoogleRating decimal(9,1), 
		Yelp int,  
		YelpRating decimal(9,1), 
		Vitals int, 
		VitalsRating decimal(9,1), 
		Healthgrades int, 
		HealthgradesRating decimal(9,1), 
		RateMDs int, 
		RateMDsRating decimal(9,1), 
		YellowPages int, 
		YellowPagesRating decimal(9,1), 
		Facebook int, 
		FacebookRating decimal(9,1)	
	)

	Insert Into @tblRatingSum (AccountID,AccountName)
	Select a.ID as AccountID,
		   (a.FirstName + ' ' + a.MiddleName + ' ' + a.LastName) as AccountName
					 From SMIM_ReviewAccounts_ST as a

	Update wt Set wt.Google = isnull(wc.RatingCount, 0), wt.GoogleRating = isnull(wc.TotalRating, 0)
	From @tblRatingSum as wt
	inner join( 
				Select s.SiteID,s.SiteName,a.AccountID,
				Count(isnull(googleReview.OverallRating,0)) As RatingCount, Avg(isnull(googleReview.OverallRating,0)) TotalRating		
										From SRCC_GooglePlus_TR AS google 
										inner join SRCC_GooglePlusReviews_TR as googleReview on google.ID = googleReview.GoogleID
										inner join SMIM_ReviewAccountSite_ST as a on a.AccountSiteID = google.SiteAccountID
										inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID
										inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
										inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID							
												
									Where 
										 s.SiteID = Case When @SiteID in ('%', '1') Then 1 Else 0 End And
										 r.ID = Case When @AccountID = '0' Then r.ID Else @AccountID End And
										 t.ID = Case When @AcctountType = '0' Then t.ID Else @AcctountType End And									 						
										 (@Date is null OR DateDiff(DAY, googleReview.Date, @Date) = 0) And
										 a.IsActive = 'True'
									Group By
											s.SiteID,s.SiteName,a.AccountID
								
	) wc on wc.AccountID = wt.AccountID

	Update wt Set wt.Yelp = isnull(wc.RatingCount, 0), wt.YelpRating = isnull(wc.TotalRating, 0)
	From @tblRatingSum as wt
	inner join( 
				Select s.SiteID,s.SiteName,a.AccountID,
				count(isnull(yelpReview.Rating,0)) As RatingCount, Avg(isnull(yelpReview.Rating,0)) TotalRating		
										From SRCC_Yelp_TR AS yelp 
										inner join	SRCC_YelpReviews_TR AS yelpReview on yelp.ID = yelpReview.YelpID
										inner join SMIM_ReviewAccountSite_ST as a on a.AccountSiteID = yelp.SiteAccountID
										inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID
										inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
										inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID							
									
									Where 
										 s.SiteID = Case When @SiteID in ('%', '2') Then 2 Else 0 End And
										 r.ID = Case When @AccountID = '0' Then r.ID Else @AccountID End And
										 t.ID = Case When @AcctountType = '0' Then t.ID Else @AcctountType End And									 
										 (@Date is null OR DateDiff(DAY, yelpReview.Date, @Date) = 0) And
										 a.IsActive = 'True'
									Group By
											s.SiteID,s.SiteName,a.AccountID
								
	) wc on wc.AccountID = wt.AccountID

	--Select * From @tblRatingSum
	Select 
			tbl.AccountID,
			tbl.AccountName,
			isnull(tbl.Google,0) as Google,
			isnull(tbl.GoogleRating,0) as GoogleRating,
			isnull(tbl.Yelp,0) as Yelp,
			isnull(tbl.YelpRating,0) as YelpRating,
			isnull(tbl.Vitals,0) as Vitals,
			isnull(tbl.VitalsRating,0) as VitalsRating,
			isnull(tbl.Healthgrades,0) as Healthgrades,
			isnull(tbl.HealthgradesRating,0) as HealthgradesRating,
			isnull(tbl.RateMDs,0) as RateMDs,
			isnull(tbl.RateMDsRating,0) as RateMDsRating,
			isnull(tbl.YellowPages,0) as YellowPages,
			isnull(tbl.YellowPagesRating,0) as YellowPagesRating,
			isnull(tbl.Facebook,0) as Facebook,
			isnull(tbl.FacebookRating,0) as FacebookRating
	From @tblRatingSum as tbl

End

--Set @SqlQry = 'Declare @tblRatingSum Table
--				(
--					AccountID int,
--					AccountName varchar(50)'
--					Declare @SiteName varchar(200)  
--					Declare EachSite Cursor For 
--					Select s.SiteName From SMAM_ReviewSites_ST as s
--					Open EachSite
--					Fetch Next From EachSite into @SiteName --,@SiteRatings 
--					While @@FETCH_STATUS = 0
--					Begin
--						Set @SqlQry = @SqlQry + ', ' + @SiteName + ' decimal(9,1)'
--						Set @SqlQry = @SqlQry + ', ' + @SiteName + 'Rating decimal(9,1)'
--						--EXEC ('ALTER TABLE @tblRatingSum ADD ' + @SiteName + ' VARCHAR(50);')
--						Fetch Next From EachSite into @SiteName --,@SiteRatings
--					End
--					Close EachSite
--					Deallocate EachSite

--					Set @SqlQry = @SqlQry + 

--				')'

--Select  @SqlQry

--exec(@SqlQry)

GO
/****** Object:  StoredProcedure [dbo].[SP_ReviewsListFor_Dashboard_TR]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 16-Jun-2020          
-- Description : Create Sp For SP_ReviewsListFor_Dashboard_TR      
--====================================================================  
CREATE PROCEDURE [dbo].[SP_ReviewsListFor_Dashboard_TR] 
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%', 
@AcctountType nvarchar(15) = '%',
@Review nvarchar(15) = '%',
@Rating nvarchar(15) = '%'
As
Begin

Select 
	s.SiteID,s.SiteName,
	Case When s.SiteID = 1 Then Sum(isnull(google.ReviewCount,0))
		 When s.SiteID = 2 Then Sum(isnull(yelp.ReviewCount,0))
	End as ReviewsCount,
	Case When s.SiteId = 1 Then Cast(AVG(isnull(google.OverallRating,0)) as Decimal(6,2))
		 When s.SiteId = 2 Then Cast(AVG(isnull(yelp.Overall,0)) as Decimal(6,2))
	End As Rating	 
						From SMIM_ReviewAccountSite_ST as a
							inner join SMAM_ReviewSites_ST as s on a.ReviewSiteID  = s.SiteID
							inner join SMIM_ReviewAccounts_ST as r on r.ID = a.AccountID
							inner join SMIM_AccountType_ST as t on t.ID = r.AccountTypeID
							outer apply (SELECT * FROM SRCC_GooglePlus_TR AS google 
																			WHERE a.AccountSiteID = google.SiteAccountID) google
							outer apply (SELECT * FROM SRCC_Yelp_TR AS yelp 
																			WHERE a.AccountSiteID = yelp.SiteAccountID) yelp 
						Where 
								s.SiteID Like @SiteID
							And	r.ID Like @AccountID 
							And	t.ID Like @AcctountType
							And a.IsActive = 'True'
							And (google.ReviewCount like @Review OR yelp.ReviewCount like @Review)
							And (google.OverallRating like @Rating OR yelp.Overall like @Rating)
						Group By
								s.SiteID,s.SiteName

End

GO
/****** Object:  StoredProcedure [dbo].[Sp_ReviewsSiteInfo]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 26-Jun-2020          
-- Description : Create Sp For Get Reviews Site Information
-- Sp_ReviewsSiteInfo
--==================================================================== 
CREATE PROCEDURE [dbo].[Sp_ReviewsSiteInfo] 
@SiteID nvarchar(15),
@AccountID nvarchar(15),
@AcctountType nvarchar(15),
@Rating nvarchar(15)
--@YelpReviewID nvarchar(15),
As
Begin
Select s.SiteID,s.SiteName,(e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName) as AccountName,
				r.ReviewURL as SitesURL,a.Description as AccountType,v.Rating,v.Author,
				v.Date as ReviewDate,v.Text as Reviews,y.Overall
               from SMAM_ReviewSites_ST as s
					inner join SMIM_ReviewAccountSite_ST as r on r.ReviewSiteID = s.SiteID
					inner join SMIM_ReviewAccounts_ST as e on e.ID = r.AccountID
					inner join SMIM_AccountType_ST as a on a.ID = e.AccountTypeID
					inner join SRCC_Yelp_TR as y on y.SiteAccountID = r.AccountSiteID
					inner join SRCC_YelpReviews_TR as v on v.YelpID = y.ID
													Where 
														s.SiteID like @SiteID And
														v.Rating like @Rating And
														e.ID like @AccountID And
														a.ID like @AcctountType 
														--v.ID like @YelpReviewID 
	UNION ALL

	Select s.SiteID,s.SiteName,
					(e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName) as AccountName,
					r.ReviewURL as SitesURL,
					a.Description as AccountType,
					v.OverallRating as Rating,v.Author,v.Date as ReviewDate,v.Text as Reviews,
					y.OverallRating as Overall
               from SMAM_ReviewSites_ST as s
					inner join SMIM_ReviewAccountSite_ST as r on r.ReviewSiteID = s.SiteID
					inner join SMIM_ReviewAccounts_ST as e on e.ID = r.AccountID
					inner join SMIM_AccountType_ST as a on a.ID = e.AccountTypeID					
					inner join SRCC_GooglePlus_TR as y on y.SiteAccountID = r.AccountSiteID
					inner join SRCC_GooglePlusReviews_TR as v on v.GoogleID = y.ID
														  Where 
															s.SiteID like @SiteID And
															v.OverallRating like @Rating And
															e.ID like @AccountID And
															a.ID like @AcctountType 
End
														
														  
			 

GO
/****** Object:  StoredProcedure [dbo].[Sp_ReviewsSitesList]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 16-May-2020          
-- Description : Create Sp For Reviews Sites List
-- Sp_ReviewsSitesList      
--====================================================================
CREATE PROCEDURE [dbo].[Sp_ReviewsSitesList] 
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%',
@AcctountType nvarchar(15) = '%',
@Rating nvarchar(15) = '%'
As
Begin
Select s.SiteName,
				Sum(a.ReviewCount )as TotalReview,
				AVG(a.OverallRating )as Rating				
		from SMAM_ReviewSites_ST as s
		inner join SMIM_ReviewAccountSite_ST as n on n.ReviewSiteID = s.SiteID
		inner join SMIM_ReviewAccounts_ST as e on e.ID = n.AccountID
		inner join SMIM_AccountType_ST as i on i.ID = e.AccountTypeID  
		inner join SRCC_GooglePlus_TR as a on a.SiteAccountID = n.AccountSiteID
											  Where 
													s.SiteID like @SiteID And
													a.OverallRating like @Rating And
													e.ID like @AccountID And
													i.ID like @AcctountType 
											 Group By
											        s.SiteName
End

GO
/****** Object:  StoredProcedure [dbo].[Sp_RptSalesAccount]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_RptSalesAccount]
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
/****** Object:  StoredProcedure [dbo].[SP_WordCount_Desc_CloudChart_Dashboard_HI]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 10-July-2020          
-- Description : Create Sp For WordCount / Words Cloud Chart
-- SP_WordCount_Desc_CloudChart_Dashboard_HI '%','%','0','0'
--====================================================================  
CREATE PROCEDURE [dbo].[SP_WordCount_Desc_CloudChart_Dashboard_HI]
@CompanyID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID int = '0', 
@AcctountTypeID int = '0'
As
Begin
		Select 
				h.Word, Count(1) as  WordCount, (Select Description From SMAM_WordTypes_ST wtype where wtype.ID = h.WrdTypeId) WorType
						From Vw_AccountReviews as a 
						inner join SRCC_ReviewWordsCount_HI as h on h.ReviewSiteID = a.SiteID and h.AccountID = a.AccountID and h.ReviewID = a.ReviewID
				Where 
						a.SiteID like @SiteID
						And a.CompanyID like @CompanyID
						And	a.AccountID = Case When @AccountID = '0' Then a.AccountID Else @AccountID End 
						And	a.AccountTypeID = Case When @AcctountTypeID = '0' Then a.AccountTypeID Else @AcctountTypeID End
				Group by h.Word, h.WrdTypeId

End

GO
/****** Object:  StoredProcedure [dbo].[SP_WordDesc_MonthWise_BarChart_Dashboard_HI]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 09-July-2020          
-- Description : Create Sp For Review Word and Word Type Line/Bar Chart
-- SP_WordDesc_MonthWise_BarChart_Dashboard_HI '%','%','0','0','0'
--====================================================================  
CREATE PROCEDURE [dbo].[SP_WordDesc_MonthWise_BarChart_Dashboard_HI]
@CompnayID nvarchar(15) = '%',
@SiteID nvarchar(15) = '%',
@AccountID int = '0', 
@AcctountTypeID int = '0',
@WrdTypeID int = '0'
As
Begin
--SP Body Start There--
DECLARE 
@FromDate datetime,
@Todate datetime,
@RunningDate datetime

Set @ToDate = GETDATE()
Set @FromDate = DateAdd(day, 1, DATEADD(Year, -1, @ToDate))
Set @RunningDate = @FromDate

Declare @tblMonths as Table
(
	MonthNo int,
	MonthNam varchar(3),
	MonthYr varchar(4),
	Good int,
	Bad int
)
While @RunningDate <= @ToDate
Begin
	Declare @monthNo int, @MonthYr varchar(4), @Date datetime, @Good int, @Bad int

	Set @monthNo = DatePart(Month,@RunningDate)
	Set @MonthYr = DatePart(Year, @RunningDate)

	Set @Date = @MonthYr + '-' + Convert(varchar, @monthNo) + '-01' 

	Insert into @tblMonths 
	values(@monthNo , left(DATEName(Month, @RunningDate),3), @MonthYr,0,0)

	Update wt Set Good = wc.Good
	From @tblMonths as wt
	Inner join (Select 
					DATEPART(month,a.Date) as Date, Count(1) as  Good
				From Vw_AccountReviews as a 
				inner join SRCC_ReviewWordsCount_HI as h on h.ReviewSiteID = a.SiteID and h.AccountID = a.AccountID and h.ReviewID = a.ReviewID and WrdTypeId = 2
				Where 
				a.SiteID Like @SiteID
				And a.CompanyID Like @CompnayID
				And	a.AccountID = Case When @AccountID = '0' Then a.AccountID Else @AccountID End 
				And	a.AccountTypeID = Case When @AcctountTypeID = '0' Then a.AccountTypeID Else @AcctountTypeID End
				And  DateDiff(month, a.Date, @Date) = 0
				Group by Date) wc on wc.Date = wt.MonthNo

	Update wt Set Bad = wc.Bad
	From @tblMonths as wt
	Inner join (Select 
					DATEPART(month,a.Date) as Date, Count(1) as  Bad
				From Vw_AccountReviews as a 
				inner join SRCC_ReviewWordsCount_HI as h on h.ReviewSiteID = a.SiteID and h.AccountID = a.AccountID and h.ReviewID = a.ReviewID and WrdTypeId = 1
				Where 
				a.SiteID Like @SiteID
				And a.CompanyID Like @CompnayID
				And	a.AccountID = Case When @AccountID = '0' Then a.AccountID Else @AccountID End 
				And	a.AccountTypeID = Case When @AcctountTypeID = '0' Then a.AccountTypeID Else @AcctountTypeID End
				And  DateDiff(month, a.Date, @Date) = 0
				Group by Date) wc on wc.Date = wt.MonthNo

	Set @RunningDate = DateAdd(Month, 1, @RunningDate)


End

Select * From @tblMonths order by MonthNo

End

GO
/****** Object:  StoredProcedure [dbo].[SP_WordType_Desc_PieChart_Dashboard_HI]    Script Date: 2/22/2021 11:46:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================================================          
-- Author      : Ahmed Raza          
-- Date        : 07-July-2020          
-- Description : Create Sp For Review Word and Word Type Pie Chart
-- SP_WordType_Desc_PieChart_Dashboard_HI '2','%','%','%','0'
--====================================================================  
CREATE PROCEDURE [dbo].[SP_WordType_Desc_PieChart_Dashboard_HI]
@CompnayID nvarchar = '%',
@SiteID nvarchar(15) = '%',
@AccountID nvarchar(15) = '%', 
@AcctountType nvarchar(15) = '%',
@WrdTypeId int = '0'
As
Begin
DEclare @WordsTable as Table
(
	SiteId int,
	SiteName varchar(50),
	Color varchar(10),
	Good int,
	Bad int
)
INSERT INTO @WordsTable
Select 
	SiteID, SiteName, Color, 0, 0
From SMAM_ReviewSites_ST rs

Update wt Set Bad = wc.Bad
From @WordsTable as wt
Inner join (Select 
				a.SiteID, Count(1) as  Bad

			From Vw_AccountReviews as a 
			inner join SRCC_ReviewWordsCount_HI as h on h.ReviewSiteID = a.SiteID and h.AccountID = a.AccountID and h.ReviewID = a.ReviewID and WrdTypeId = 1
			Where 
			a.SiteID like @SiteID
			And	a.ID like @AccountID 
			And	a.ID like @AcctountType
			And a.CompanyID like @CompnayID
			Group by SiteID) wc on wt.SiteId = wc.SiteID

Update wt Set Good = wc.Good
From @WordsTable as wt
Inner join (Select 
				a.SiteID, Count(1) as  Good

			From Vw_AccountReviews as a 
			inner join SRCC_ReviewWordsCount_HI as h on h.ReviewSiteID = a.SiteID and h.AccountID = a.AccountID and h.ReviewID = a.ReviewID and WrdTypeId = 2
			Where 
			a.SiteID like @SiteID
			And	a.ID like @AccountID 
			And	a.ID like @AcctountType
			And a.CompanyID like @CompnayID
			Group by SiteID) wc on wt.SiteId = wc.SiteID

Select * from @WordsTable ORder by SiteId

--Select 
--	a.SiteID,a.SiteName,
--	--h.Word,
--	Count(h.WrdTypeId) as WrdTypeID,
--	(Select t.Description From SMAM_WordTypes_ST as t where t.ID = h.WrdTypeId) as WrdDesc
--						From Vw_AccountReviews as a
--						inner join SRCC_ReviewWordsCount_HI as h on h.ReviewSiteID = a.SiteID and h.AccountID = a.AccountID and h.ReviewID = a.ReviewID
--						Where 
--								a.SiteID like @SiteID
--							And	a.ID like @AccountID 
--							And	a.ID like @AcctountType
--							And a.CompanyID like @CompnayID
--							And h.WrdTypeId = Case When @WrdTypeId = '0' Then h.WrdTypeId Else @WrdTypeId End							
--						Group By
--								 a.SiteID,a.SiteName,
--								 --h.Word,
--								 h.WrdTypeId
--						Order By a.SiteID --h.Word
End

GO
/****** Object:  StoredProcedure [dbo].[UpdateGooglePlusAccount]    Script Date: 2/22/2021 11:46:10 AM ******/
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
				SET @Name = (SELECT CompanyName from SMSA_CompanyMst_ST WHERE CompanyID = @ClientID)
				
				INSERT INTO SRCC_GooglePlus_TR(SiteAccountID,Name, OverallRating, ReviewCount) VALUES (@SiteAccountID,@NAME, @Rating, @ReviewCount)
				
				-- Get main table identity
				SET @GooglePlusID = (Select ident_current('dbo.SRCC_GooglePlus_TR'))
				
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
