USE [master]
GO
/****** Object:  Database [SurveyManagement]    Script Date: 2/27/2021 8:44:37 PM ******/
CREATE DATABASE [SurveyManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SurveyManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SurveyManagement.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SurveyManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SurveyManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SurveyManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SurveyManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SurveyManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SurveyManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SurveyManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SurveyManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SurveyManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SurveyManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SurveyManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SurveyManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SurveyManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SurveyManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SurveyManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SurveyManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SurveyManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SurveyManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SurveyManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SurveyManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SurveyManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SurveyManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SurveyManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SurveyManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SurveyManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SurveyManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SurveyManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SurveyManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SurveyManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SurveyManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SurveyManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SurveyManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SurveyManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SurveyManagement]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 2/27/2021 8:44:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Options](
	[OptionId] [bigint] NOT NULL,
	[OptionName] [varchar](255) NOT NULL,
	[OptionTypeId] [tinyint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OptionType]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OptionType](
	[OptionTypeId] [tinyint] NOT NULL,
	[OptionTypeName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [bigint] NOT NULL,
	[QuestionName] [varchar](255) NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[PageId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questionnaire]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questionnaire](
	[QuestionnaireId] [bigint] NOT NULL,
	[QuestionnaireDesc] [varchar](255) NOT NULL,
	[QuestionnaireStatus] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[Expiry] [datetime] NULL,
	[MaxResponse] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionnaireId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RespondentAnswer]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespondentAnswer](
	[RespondentAnswerId] [bigint] NOT NULL,
	[RespondentAnswerValue] [varchar](255) NOT NULL,
	[OptionId] [bigint] NOT NULL,
	[RespondentId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RespondentAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Section]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Section](
	[SectionId] [bigint] NOT NULL,
	[SectionName] [varchar](255) NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[QuestionnaireId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SurveyPage]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SurveyPage](
	[PageId] [bigint] NOT NULL,
	[PageName] [varchar](255) NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[SectionId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SurveyRespondent]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SurveyRespondent](
	[RespondentId] [bigint] NOT NULL,
	[RespondentName] [varchar](255) NOT NULL,
	[RespondentAge] [tinyint] NOT NULL,
	[RespodentEmail] [varchar](255) NOT NULL,
	[RespondentContact] [varchar](15) NOT NULL,
	[QuestionnaireId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RespondentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[LoginPassword] [varchar](255) NOT NULL,
	[FatherName] [varchar](255) NOT NULL,
	[Cnic] [varchar](13) NULL,
	[Email] [varchar](255) NOT NULL,
	[UserAddress] [varchar](255) NOT NULL,
	[Department] [varchar](255) NOT NULL,
	[Organization] [varchar](255) NOT NULL,
	[UserType] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2/27/2021 8:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeId] [tinyint] NOT NULL,
	[UserTypeName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[OptionType] ([OptionTypeId], [OptionTypeName]) VALUES (1, N'Checkbox')
INSERT [dbo].[OptionType] ([OptionTypeId], [OptionTypeName]) VALUES (2, N'Radio Button')
INSERT [dbo].[OptionType] ([OptionTypeId], [OptionTypeName]) VALUES (3, N'Textbox')
INSERT [dbo].[OptionType] ([OptionTypeId], [OptionTypeName]) VALUES (4, N'Button')
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (1, N'What is your Age?', 1, 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (2, N'What is you occupation?', 2, 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (3, N'What is name?', 1, 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (4, N'What is your Age?', 1, 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (5, N'What is your Age?', 1, 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (6, N'What is your Father''s Name?', 1, 4)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (7, N'How do you like the food?', 1, 3)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (8, N'what is your name?', 1, 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [SequenceNumber], [PageId]) VALUES (9, N'What is your name', 1, 6)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (6, N'Questionnaire for Covid19', 0, 1, CAST(0x0000ACCB000420A8 AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (7, N'Covid19 Questionnaire', 1, 1, CAST(0x0000ACCB00045A88 AS DateTime), CAST(0x0000ACC500000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (8, N'Test', 1, 1, CAST(0x0000ACCB001C91C8 AS DateTime), CAST(0x0000ACCC00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (9, N'Smoking survey', 1, 1, CAST(0x0000ACCB00A76DE2 AS DateTime), CAST(0x0000ACCC00000000 AS DateTime), 200)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (10, N'New survey', 1, 1, CAST(0x0000ACCB00A94EFE AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 250)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (11, N'New survey 2', 1, 1, CAST(0x0000ACCB00AB0F6E AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 300)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (12, N'New', 1, 1, CAST(0x0000ACCB00AC9DFC AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 50)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (13, N'New', 1, 1, CAST(0x0000ACCB00ADB34C AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 30)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (14, N'New', 1, 1, CAST(0x0000ACCB00AE5EF0 AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 20)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (15, N'New Questionnaire', 1, 1, CAST(0x0000ACCB00B2E785 AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 20)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (16, N'New Test', 1, 1, CAST(0x0000ACCB016212AE AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (17, N'New', 1, 1, CAST(0x0000ACCB01642597 AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (18, N'New', 1, 1, CAST(0x0000ACCB01653BCF AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (19, N'New', 1, 1, CAST(0x0000ACCB016CBE6F AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (20, N'New', 1, 1, CAST(0x0000ACCB016D73BB AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (21, N'New', 1, 1, CAST(0x0000ACCB016DE1BD AS DateTime), CAST(0x0000ACCD00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (22, N'new', 1, 1, CAST(0x0000ACCB016EC724 AS DateTime), CAST(0x0000ACCE00000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (23, N'Questionnaire', 1, 1, CAST(0x0000ACCB0170CE47 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (24, N'Test', 1, 1, CAST(0x0000ACCB017151E8 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (25, N'Test', 1, 1, CAST(0x0000ACCB01722220 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (26, N'Test', 1, 1, CAST(0x0000ACCB01731336 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (27, N'Test', 1, 1, CAST(0x0000ACCB017806D3 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (28, N'Covid21', 1, 1, CAST(0x0000ACCB0178962B AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (29, N'Questionnaire One', 1, 1, CAST(0x0000ACCB017ABB52 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (30, N'Test One', 1, 1, CAST(0x0000ACCB017B4B64 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (31, N'Test One', 1, 1, CAST(0x0000ACCB017C00B5 AS DateTime), CAST(0x0000ACC500000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (32, N'Test One', 1, 1, CAST(0x0000ACCB017E3A4F AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (33, N'Test Covid', 1, 1, CAST(0x0000ACCB017F4B9E AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (34, N'Covid21', 1, 1, CAST(0x0000ACCB0180C534 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (35, N'Covid19', 1, 1, CAST(0x0000ACCB018216E6 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (36, N'Test A', 1, 1, CAST(0x0000ACCB0183B63E AS DateTime), CAST(0x0000ACC500000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (37, N'Test', 1, 1, CAST(0x0000ACCB01868E01 AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (38, N'Test', 1, 1, CAST(0x0000ACCB0187ADBF AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (39, N'Test One', 1, 1, CAST(0x0000ACCB0188D206 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (40, N'Test ', 1, 1, CAST(0x0000ACCB018AEB50 AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (41, N'Test Questionnaire', 1, 1, CAST(0x0000ACCC00013456 AS DateTime), CAST(0x0000ACC400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (42, N'New', 1, 1, CAST(0x0000ACCD0020AF6A AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 200)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (43, N'New', 1, 1, CAST(0x0000ACCD0020FB7F AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 200)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (44, N'Furqan', 1, 1, CAST(0x0000ACCD00EA39C4 AS DateTime), CAST(0x0000ACD400000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (45, N'New Survey', 1, 1, CAST(0x0000ACCD00F26AFC AS DateTime), CAST(0x0000ACDB00000000 AS DateTime), 150)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (46, N'New Survey', 1, 1, NULL, CAST(0x0000ACCE00000000 AS DateTime), 150)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (47, N'New Survey', 1, 1, NULL, CAST(0x0000ACDB00000000 AS DateTime), 150)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (48, N'New Survey', 1, 1, CAST(0x0000ACCD00F3B0C4 AS DateTime), CAST(0x0000ACD500000000 AS DateTime), 150)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (49, N'New Survey', 0, 1, NULL, CAST(0x0000ACD500000000 AS DateTime), 150)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (50, N'New Survey', 1, 1, NULL, CAST(0x0000ACD500000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (51, N'ggddf', 1, 1, CAST(0x0000ACCD00FF6334 AS DateTime), CAST(0x0000ACE500000000 AS DateTime), 100)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (52, N'New survey', 1, 1, CAST(0x0000ACDC0145F1C1 AS DateTime), CAST(0x0000ACDD00000000 AS DateTime), 500)
INSERT [dbo].[Questionnaire] ([QuestionnaireId], [QuestionnaireDesc], [QuestionnaireStatus], [UserId], [CreatedOn], [Expiry], [MaxResponse]) VALUES (53, N'New Survey', 1, 1, CAST(0x0000ACDC0147A552 AS DateTime), CAST(0x0000ACDD00000000 AS DateTime), 500)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (1, N'Section One', 1, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (2, N'Section Two', 2, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (3, N'Section Three', 3, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (4, N'First', 6, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (5, N'Second', 5, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (6, N'Third', 23, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (7, N'Fourth', 24, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (8, N'Five', 12, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (9, N'six', 13, 7)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (10, N'Section Four', 4, 26)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (11, N'Section Four', 4, 26)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (12, N'Section One', 1, 27)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (13, N'Section One', 1, 28)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (14, N'Section One', 1, 28)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (15, N'Section One', 1, 28)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (16, N'Section A', 1, 29)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (17, N'Section A', 1, 30)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (18, N'Section A', 1, 31)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (19, N'Section One', 1, 32)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (20, N'Section One', 1, 32)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (21, N'Section A', 1, 33)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (22, N'Section One', 1, 34)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (23, N'Section A of Covid19', 1, 35)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (24, N'Section One', 1, 36)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (25, N'One', 1, 37)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (26, N'Two', 2, 37)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (27, N'1 One', 1, 38)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (28, N'Section A', 1, 39)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (29, N'One', 1, 40)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (30, N'Section Aay', 1, 41)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (31, N'Two', 2, 40)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (32, N'Three', 3, 40)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (33, N'Four', 4, 40)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (34, N'Five', 5, 40)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (35, N'First Section', 1, 44)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (36, N'Second Section', 2, 44)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (37, N'First Section', 1, 50)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (38, N'Second Section', 2, 50)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (39, N'Two', 2, 51)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (40, N'Two', 1, 53)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (41, N'Four', 3, 53)
INSERT [dbo].[Section] ([SectionId], [SectionName], [SequenceNumber], [QuestionnaireId]) VALUES (42, N'Three', 2, 53)
INSERT [dbo].[SurveyPage] ([PageId], [PageName], [SequenceNumber], [SectionId]) VALUES (1, N'Page one of A', 1, 29)
INSERT [dbo].[SurveyPage] ([PageId], [PageName], [SequenceNumber], [SectionId]) VALUES (2, N'Page one of B', 2, 29)
INSERT [dbo].[SurveyPage] ([PageId], [PageName], [SequenceNumber], [SectionId]) VALUES (3, N'Page A of Two', 0, 29)
INSERT [dbo].[SurveyPage] ([PageId], [PageName], [SequenceNumber], [SectionId]) VALUES (4, N'Page 1 of Two', 1, 31)
INSERT [dbo].[SurveyPage] ([PageId], [PageName], [SequenceNumber], [SectionId]) VALUES (5, N'1', 1, 39)
INSERT [dbo].[SurveyPage] ([PageId], [PageName], [SequenceNumber], [SectionId]) VALUES (6, N'Page one', 1, 40)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (1, N'Adnan', N'6789', N'Yameen', N'123456789', N'furqan@gmail.com', N'Godhra Colony', N'Admin', N'LNH', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (2, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'11-E', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (3, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'11-E', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (4, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'11-E', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (5, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'11-E', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (6, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'19101027.irfan', N'11-E', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (7, N'Furqan', N'12345', N'Siraj', N'3717364726', N'email@email.com', N'new', N'LJ', N'sdkfjj', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (8, N'Adnansgfsdgs', N'12345', N'Rafiq', N'3717364726', N'email@email.com', N'new', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (9, N'Irfan', N'12345', N'Rafiq', N'1234567890', N'email@email.com', N'new', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (10, N'Irfan', N'12345', N'Rafiq', N'1234567890', N'email@email.com', N'new', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (11, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'new', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (12, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'new', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (13, N'Irfan', N'abcdef', N'Rafiq', N'1234567890', N'email@email.com', N'11-E', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (14, N'FurqanSIraj', N'246810', N'Siraj', N'1234567890', N'email@email.com', N'New Karachi', N'IT', N'B n F', 1)
INSERT [dbo].[UserInfo] ([UserId], [Name], [LoginPassword], [FatherName], [Cnic], [Email], [UserAddress], [Department], [Organization], [UserType]) VALUES (15, N'maheen', N'1234', N'ahmed', N'26782893786', N'email@email.com', N'fffffffvgt', N'ubit', N'qda', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName]) VALUES (1, N'Key User')
ALTER TABLE [dbo].[Options]  WITH CHECK ADD FOREIGN KEY([OptionTypeId])
REFERENCES [dbo].[OptionType] ([OptionTypeId])
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([PageId])
REFERENCES [dbo].[SurveyPage] ([PageId])
GO
ALTER TABLE [dbo].[Questionnaire]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[RespondentAnswer]  WITH CHECK ADD FOREIGN KEY([OptionId])
REFERENCES [dbo].[Options] ([OptionId])
GO
ALTER TABLE [dbo].[RespondentAnswer]  WITH CHECK ADD FOREIGN KEY([RespondentId])
REFERENCES [dbo].[SurveyRespondent] ([RespondentId])
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD FOREIGN KEY([QuestionnaireId])
REFERENCES [dbo].[Questionnaire] ([QuestionnaireId])
GO
ALTER TABLE [dbo].[SurveyPage]  WITH CHECK ADD FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[SurveyRespondent]  WITH CHECK ADD FOREIGN KEY([QuestionnaireId])
REFERENCES [dbo].[Questionnaire] ([QuestionnaireId])
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD FOREIGN KEY([UserType])
REFERENCES [dbo].[UserType] ([UserTypeId])
GO
USE [master]
GO
ALTER DATABASE [SurveyManagement] SET  READ_WRITE 
GO
