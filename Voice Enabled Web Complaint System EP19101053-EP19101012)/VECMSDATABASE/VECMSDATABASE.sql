USE [ComplaintManagementSystem]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComplaintRegistration]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComplaintRegistration](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ComplaintNo] [int] NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[ComplaintTypeId] [int] NULL,
	[StateId] [int] NULL,
	[ComplaintNature] [varchar](50) NULL,
	[ComplaintWord] [varchar](max) NULL,
	[ComplaintStatusId] [int] NULL,
	[ComplaintDocName] [nvarchar](100) NULL,
	[ComplaintDocPath] [varchar](150) NULL,
	[AddBy] [int] NULL,
	[AddOn] [datetime] NULL,
	[AddLog] [varchar](50) NULL,
	[EditBy] [int] NULL,
	[EditOn] [datetime] NULL,
	[EditLog] [varchar](50) NULL,
	[Version] [int] NULL,
	[ComplaintAssignedTo] [bigint] NULL,
	[ComplaintRemarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_ComplaintRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComplaintType]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComplaintType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Screens]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Screens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[State] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
	[Type] [varchar](100) NULL,
	[Icon] [varchar](100) NULL,
	[UserTypeId] [int] NULL,
 CONSTRAINT [PK_Screens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [varchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRegistration]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](150) NULL,
	[Password] [varchar](150) NULL,
	[Email] [varchar](150) NULL,
	[ContactNo] [varchar](20) NULL,
	[Address] [varchar](250) NULL,
	[PinCode] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[StateId] [int] NULL,
	[UserTypeId] [int] NULL,
	[IsApproved] [bit] NULL,
	[AddBy] [int] NULL,
	[AddOn] [datetime] NULL,
	[AddLog] [varchar](50) NULL,
	[EditBy] [int] NULL,
	[EditOn] [datetime] NULL,
	[EditLog] [varchar](50) NULL,
	[Version] [int] NULL,
	[ImageName] [varchar](100) NULL,
	[ImagePath] [nvarchar](500) NULL,
 CONSTRAINT [PK_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2/27/2021 8:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (5, N'E-Commerce', N'This is e-commerce.')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (6, N'Product Quality', N'Test ')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ComplaintRegistration] ON 

INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (24, 1, 1, 5, 1, 3, N'Card Slipping Out', N'it''s and urgent basis please review asap.', 3, N'hand-holdi202735023.jpg', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\hand-holdi202735023.jpg', 12, CAST(N'2020-07-07 18:27:35.057' AS DateTime), N'DESKTOP-5R46NI3', 11, CAST(N'2020-07-07 18:34:09.740' AS DateTime), N'DESKTOP-5R46NI3', 3, 11, N'It''s non acceptable..')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (25, 2, 3, 3, 1, 4, N'Electricity bill issues', N'please review my previous payments all are paid.', 1, N'SmartHL7.V202914974.exe', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\SmartHL7.V202914974.exe', 12, CAST(N'2020-07-07 18:29:15.003' AS DateTime), N'DESKTOP-5R46NI3', 5, CAST(N'2020-07-07 18:37:21.230' AS DateTime), N'DESKTOP-5R46NI3', 2, 0, N'Your previous payment issues has been resolved please pay your bill on time , next time we will not accept any query from your side. ')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (26, 3, 1, 4, 1, 3, N'refund payment', N'Need to review on urgent basis.', 1, N'', N'', 9, CAST(N'2020-07-07 18:30:08.287' AS DateTime), N'DESKTOP-5R46NI3', 5, CAST(N'2020-07-07 18:47:49.190' AS DateTime), N'DESKTOP-5R46NI3', 2, 0, N'we can''t refund but we are accepting your complaint as you can visit our office and change your items ')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (27, 4, 1, 5, 2, 2, N'card renewal', N'please review my application.', 1, N'hand-holdi203138754.jpg', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\hand-holdi203138754.jpg', 9, CAST(N'2020-07-07 18:31:38.780' AS DateTime), N'DESKTOP-5R46NI3', 10, CAST(N'2020-07-07 18:44:47.140' AS DateTime), N'DESKTOP-5R46NI3', 3, 10, N'acceptable issue.')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (28, 5, 1, 4, 1, 3, N'refund payment', N'need to refund my payment', 1, N'Job-Applic203547956.docx', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\Job-Applic203547956.docx', 12, CAST(N'2020-07-07 20:35:47.970' AS DateTime), N'DESKTOP-5R46NI3', 11, CAST(N'2020-07-07 20:40:15.093' AS DateTime), N'DESKTOP-5R46NI3', 3, 11, N'complaint completed.')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (29, 6, 1, 4, 1, 3, N'refund payment`', N'need my payment asap.', 3, N'Accounts202342811.png', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\Accounts202342811.png', 12, CAST(N'2020-07-10 14:23:42.967' AS DateTime), N'DESKTOP-5R46NI3', 11, CAST(N'2020-07-10 14:26:52.723' AS DateTime), N'DESKTOP-5R46NI3', 3, 11, N'The complaint is not acceptable.')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (30, 7, 3, 3, 1, 2, N'test', N'ras', 3, N'Job-Applic200114060.docx', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\Job-Applic200114060.docx', 12, CAST(N'2020-09-09 14:01:14.450' AS DateTime), N'DESKTOP-5R46NI3', 5, CAST(N'2020-09-09 14:02:27.383' AS DateTime), N'DESKTOP-5R46NI3', 2, 0, N'not valid!')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (31, 8, 1, 4, 1, 1, N'Urgent Recovery', N'', 3, N'Accounts200549897.txt', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\Accounts200549897.txt', 9, CAST(N'2020-10-17 16:05:50.073' AS DateTime), N'DESKTOP-FMAB3GA', 10, CAST(N'2020-10-17 16:07:21.197' AS DateTime), N'DESKTOP-FMAB3GA', 3, 10, N'asdsa')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (32, 9, 1, 4, 1, 1, N'need to solve asp', N'thsiasdfsa', 2, N'Muhammad-S205759273.docx', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\Muhammad-S205759273.docx', 13, CAST(N'2020-11-19 23:57:59.717' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (33, 10, 5, 1, 1, 2, N'Anonymous', N'
Pehli Nazar Mein Pehla Pyar Ho Gaya', 1, N'Intelligen214426493.pdf', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\Intelligen214426493.pdf', 17, CAST(N'2021-02-09 11:44:26.663' AS DateTime), N'DESKTOP-FMAB3GA', 5, CAST(N'2021-02-09 11:45:16.927' AS DateTime), N'DESKTOP-FMAB3GA', 2, 0, N'Done.')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (34, 11, 5, 3, 1, 14, N'Urgent', N'
this complain is coming from Karachi.
', 3, N'Topologies212825603.docx', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\Topologies212825603.docx', 20, CAST(N'2021-02-12 01:28:25.767' AS DateTime), N'DESKTOP-FMAB3GA', 10, CAST(N'2021-02-12 01:33:24.430' AS DateTime), N'DESKTOP-FMAB3GA', 3, 10, N'The complain is not acceptable.')
INSERT [dbo].[ComplaintRegistration] ([Id], [ComplaintNo], [CategoryId], [SubCategoryId], [ComplaintTypeId], [StateId], [ComplaintNature], [ComplaintWord], [ComplaintStatusId], [ComplaintDocName], [ComplaintDocPath], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ComplaintAssignedTo], [ComplaintRemarks]) VALUES (35, 12, 6, 7, 1, 14, N'Urgent basis', N'samsung product quality is not good we are requesting you to change it asap.', 1, N'Final-Year211441547.pdf', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\Final-Year211441547.pdf', 20, CAST(N'2021-02-12 15:14:41.683' AS DateTime), N'DESKTOP-FMAB3GA', 5, CAST(N'2021-02-12 15:16:56.450' AS DateTime), N'DESKTOP-FMAB3GA', 2, 0, N'Acceptable.')
SET IDENTITY_INSERT [dbo].[ComplaintRegistration] OFF
SET IDENTITY_INSERT [dbo].[ComplaintType] ON 

INSERT [dbo].[ComplaintType] ([Id], [Type]) VALUES (1, N'Complaint')
INSERT [dbo].[ComplaintType] ([Id], [Type]) VALUES (2, N'General Query')
SET IDENTITY_INSERT [dbo].[ComplaintType] OFF
SET IDENTITY_INSERT [dbo].[Screens] ON 

INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (1, N'dashboard', N'Dashbord', N'link', N'dashboard', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (2, N'userdashboard', N'Dashbord', N'link', N'dashboard', 2)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (3, N'category', N'Category', N'link', N'category', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (4, N'subcategory', N'Sub Category', N'link', N'view_list', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (5, N'state', N'State', N'link', N'apartment', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (6, N'registercomplaint', N'Register Complaint', N'link', N'donut_small', 2)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (7, N'complainthistory', N'Complaint History', N'link', N'list', 2)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (8, N'users', N'Users', N'link', N'person_pin', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (9, N'managecomplaints', N'Manage Complaints', N'link', N'widgets', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (10, N'userdashboard', N'Dashbord', N'link', N'dashboard', 3)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (11, N'profile', N'Profile', N'link', N'person_pin', 1)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (12, N'managecomplaints', N'Manage Complaints', N'link', N'widgets', 3)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (13, N'profile', N'Profile', N'link', N'person_pin', 2)
INSERT [dbo].[Screens] ([Id], [State], [Name], [Type], [Icon], [UserTypeId]) VALUES (14, N'profile', N'Profile', N'link', N'person_pin', 3)
SET IDENTITY_INSERT [dbo].[Screens] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [StateName], [Description]) VALUES (1, N'Punjab', N'capital- Lahore')
INSERT [dbo].[State] ([Id], [StateName], [Description]) VALUES (2, N'Khyber-Pakhtunkhwa', N'capital- Peshawar')
INSERT [dbo].[State] ([Id], [StateName], [Description]) VALUES (4, N'Balochistan', N'capital- Quetta')
INSERT [dbo].[State] ([Id], [StateName], [Description]) VALUES (12, N'Islamabad', N'capital- Terriority')
INSERT [dbo].[State] ([Id], [StateName], [Description]) VALUES (14, N'Sindh', N'capital- Karachi')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([Id], [SubCategoryName], [CategoryId]) VALUES (1, N'Laptop', 5)
INSERT [dbo].[SubCategory] ([Id], [SubCategoryName], [CategoryId]) VALUES (3, N'Power Supply', 5)
INSERT [dbo].[SubCategory] ([Id], [SubCategoryName], [CategoryId]) VALUES (4, N'Online Shopping', 5)
INSERT [dbo].[SubCategory] ([Id], [SubCategoryName], [CategoryId]) VALUES (5, N'E-Wallet', 5)
INSERT [dbo].[SubCategory] ([Id], [SubCategoryName], [CategoryId]) VALUES (6, N'Online Shopping', 5)
INSERT [dbo].[SubCategory] ([Id], [SubCategoryName], [CategoryId]) VALUES (7, N'Samsung Mobile running quality', 6)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[UserRegistration] ON 

INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (5, N'Shahzad Ismail', N'12345', N'shahzadismail392@gmail.com', N'923422898945', N'A 606 Sector 11-G new Karachi.', N'78580', N'Anonymous', 3, 1, 1, 4, CAST(N'2020-07-03 16:15:10.073' AS DateTime), N'DESKTOP-5R46NI3', 5, CAST(N'2021-01-09 23:09:44.607' AS DateTime), N'DESKTOP-FMAB3GA', 11, N'shah200026853.jpg', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\shah200026853.jpg')
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (9, N'Furqan', N'furqan123', N'furqanmitha@gmail.com', N'03152646302', N'', N'', N'Unknown', 3, 2, 0, 0, CAST(N'2020-07-06 21:29:10.327' AS DateTime), N'DESKTOP-5R46NI3', 0, CAST(N'2020-07-07 15:13:16.650' AS DateTime), N'DESKTOP-5R46NI3', 3, N'furqan201316637.jpg', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\furqan201316637.jpg')
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (10, N'Ali', N'ali123', N'Ali@gmail.com', N'90078601', N'', N'78580', N'Anonymous', 2, 3, 1, 5, CAST(N'2020-07-06 21:36:01.720' AS DateTime), N'DESKTOP-5R46NI3', 0, CAST(N'2020-07-07 15:51:33.393' AS DateTime), N'DESKTOP-5R46NI3', 2, N'images205133362.jpg', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\images205133362.jpg')
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (11, N'abbas', N'abbas123', N'abbas@gmail.com', N'09856746346', N'', N'', N'Test', 3, 3, 0, 0, CAST(N'2020-07-06 21:59:19.990' AS DateTime), N'DESKTOP-5R46NI3', 0, CAST(N'2020-07-07 18:25:40.347' AS DateTime), N'DESKTOP-5R46NI3', 2, N'download202539775.png', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\download202539775.png')
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (12, N'irfan', N'irfan123', N'irfanrafiq90@gmail.com', N'03232097143', N'', N'', N'Unknown', 3, 2, 0, 0, CAST(N'2020-07-07 16:54:17.860' AS DateTime), N'DESKTOP-5R46NI3', 0, CAST(N'2020-07-07 16:55:29.637' AS DateTime), N'DESKTOP-5R46NI3', 2, N'irfan205528230.jpg', N'D:\Angular\Personal Projects\WebApiCoreProject\Documents\irfan205528230.jpg')
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (13, N'Arif', N'arif', N'arif@gmail.com', N'034228945', N'', N'', N'', 0, 2, 0, 0, CAST(N'2020-11-19 23:54:09.877' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (14, N'Muhammad Shahzad', N'abc123', N'shahzadismail392@gmail.com', N'3422898945', N'New Karachi', N'78580', N'N/A', 3, 1, 1, 5, CAST(N'2021-01-02 18:53:43.873' AS DateTime), N'DESKTOP-FMAB3GA', 0, CAST(N'2021-01-02 18:54:23.293' AS DateTime), N'DESKTOP-FMAB3GA', 2, N'Shipping215423257.PNG', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\Shipping215423257.PNG')
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (15, N'Abid', N'abc123', N'abid@gmail.com', N'3243242354', N'', N'', N'', 0, 2, 0, 0, CAST(N'2021-01-02 18:56:12.520' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (16, N'Ali', N'123', N'shahzadismail392@gmail.com', N'030078601', N'', N'', N'', 0, 2, 0, 0, CAST(N'2021-02-09 09:31:09.950' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (17, N'athar', N'123', N'athar.saeed@tih.org.pk', N'21', N'', N'', N'', 0, 2, 0, 0, CAST(N'2021-02-09 10:54:26.270' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (18, N'waqas', N'123', N'waqas.yaqoob@tih.org.pk', N'91293', N'', N'', N'', 0, 2, 0, 0, CAST(N'2021-02-09 11:47:05.267' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (19, N'irfan rafiq', N'123', N'irfanrafiq90@gmail.com', N'03232097143', N'', N'', N'', 0, 2, 0, 0, CAST(N'2021-02-09 21:16:25.103' AS DateTime), N'DESKTOP-FMAB3GA', NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UserRegistration] ([Id], [FullName], [Password], [Email], [ContactNo], [Address], [PinCode], [CompanyName], [StateId], [UserTypeId], [IsApproved], [AddBy], [AddOn], [AddLog], [EditBy], [EditOn], [EditLog], [Version], [ImageName], [ImagePath]) VALUES (20, N'Dua', N'123', N'duazakir851@gmail.com', N'12313', N'', N'', N'Anonymous', 14, 2, 0, 0, CAST(N'2021-02-12 01:18:59.127' AS DateTime), N'DESKTOP-FMAB3GA', 0, CAST(N'2021-02-12 15:15:56.993' AS DateTime), N'DESKTOP-FMAB3GA', 2, N'quiz-2211556945.jpg', N'F:\Devoppia BackUp\Personal Projects\WebApiCoreProject\Documents\quiz-2211556945.jpg')
SET IDENTITY_INSERT [dbo].[UserRegistration] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([Id], [Type]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([Id], [Type]) VALUES (2, N'Normal')
INSERT [dbo].[UserType] ([Id], [Type]) VALUES (3, N'Company')
SET IDENTITY_INSERT [dbo].[UserType] OFF
/****** Object:  StoredProcedure [dbo].[GetChartData]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetChartData]
@Id int
as
begin
select count(*) TotalComplain ,DATENAME(Month,c.AddOn) MonthNo from [dbo].[ComplaintRegistration] as c group by DATENAME(Month,c.AddOn)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAdminDashboardData]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAdminDashboardData]
as
begin
   	select count(*) as TotalApprovedComplaint from ComplaintRegistration
		 where ComplaintRegistration.ComplaintStatusId = 1
	 				
    select count(*) as TotalPendingComplaint from ComplaintRegistration 
	    where ComplaintRegistration.ComplaintStatusId = 2
					
    select count(*) as TotalRejectedComplaint from ComplaintRegistration 
		where ComplaintRegistration.ComplaintStatusId = 3

 	select count(*) as TotalComplaint from ComplaintRegistration

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategory]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetCategory]

as
begin
select * from Category
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompanyUserDashboardData]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[sp_GetCompanyUserDashboardData]
@userid int
as
begin
   	select count(*) as TotalApprovedComplaint from ComplaintRegistration
		 where ComplaintRegistration.ComplaintStatusId = 1 and ComplaintRegistration.ComplaintAssignedTo = @userid
	 				
    select count(*) as TotalPendingComplaint from ComplaintRegistration 
	    where ComplaintRegistration.ComplaintStatusId = 2 and ComplaintRegistration.ComplaintAssignedTo = @userid
					
    select count(*) as TotalRejectedComplaint from ComplaintRegistration 
		where ComplaintRegistration.ComplaintStatusId = 3 and ComplaintRegistration.ComplaintAssignedTo = @userid
		 
 	select count(*) as TotalComplaint from ComplaintRegistration where ComplaintRegistration.ComplaintAssignedTo = @userid

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompanyUsers]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetCompanyUsers]
as
begin
  select  
  users.FullName,
  users.Email,
  users.ContactNo,
  users.[Address],
  users.PinCode,
  users.Id,
  users.UserTypeId,
  users.StateId,
  st.StateName,
  users.IsApproved,
  ut.[Type] as UserType,
  users.CompanyName,
  users.[Password] ,
  users.AddBy
  
  from UserRegistration as users
  left join UserType as ut on users.UserTypeId = ut.Id 
  left join State as st on users.StateId = st.Id 
   where users.UserTypeId = 3
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplaintDataById]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_GetComplaintDataById]
@Id int
as

select 
					compreg.Id,
					
					compreg.ComplaintNo,
					case when (compreg.ComplaintStatusId = 1) then  'Approved' 
					when   (compreg.ComplaintStatusId = 2) then 'Pending'
					else 'Rejected' end as ComplaintStatus,
					FORMAT(compreg.AddOn,'dd-MM-yyyy hh:mm:ss:tt') as RegistrationDate,
					 case  when(compreg.EditOn is not null ) then  FORMAT(compreg.EditOn,'dd-MM-yyyy hh:mm:ss:tt') 
					 else
					 '00-00-0000 00:00:00:00' end as ModifiedDate,
					 cat.CategoryName,
					 subcat.SubCategoryName,
					 comptype.[Type] as ComplaintType,
					 state.StateName,
					 compreg.ComplaintNature,
					 compreg.ComplaintWord,
					 compreg.ComplaintDocName,
					 compreg.ComplaintDocPath,
					 users.FullName ,
					 compreg.CategoryId,
					 compreg.StateId,
					 compreg.SubCategoryId,
					 compreg.AddBy,
					 compreg.ComplaintRemarks,
					 usersreg.FullName as AssignedTo,
					 compreg.ComplaintAssignedTo,
					 usersregs.FullName as AssignedBy
					 
					 
from ComplaintRegistration as compreg
left join UserRegistration as users on compreg.AddBy = users.Id
				left join Category as cat on compreg.CategoryId = cat.Id
					left join SubCategory as subcat on compreg.SubCategoryId = subcat.Id
					left join ComplaintType as comptype on compreg.ComplaintTypeId = comptype.Id
					left join [State] as state on compreg.StateId= state.Id
					left join UserRegistration as usersreg on compreg.ComplaintAssignedTo= usersreg.Id
left join UserRegistration as usersregs on compreg.EditBy = usersregs.Id
where compreg.id = @Id

GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplaintDataByStatus]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_GetComplaintDataByStatus]
@ComplaintStatusId int,
@UserId int
as

select 
					compreg.Id,
					
					compreg.ComplaintNo,
					case when (compreg.ComplaintStatusId = 1) then  'Approved' 
					when   (compreg.ComplaintStatusId = 2) then 'Pending'
					else 'Rejected' end as ComplaintStatus,
					FORMAT(compreg.AddOn,'dd-MM-yyyy hh:mm:ss:tt') as RegistrationDate,
					 case  when(compreg.EditOn is not null ) then  FORMAT(compreg.EditOn,'dd-MM-yyyy hh:mm:ss:tt') 
					 else
					 '00-00-0000 00:00:00:00' end as ModifiedDate,
					 cat.CategoryName,
					 subcat.SubCategoryName,
					 comptype.[Type] as ComplaintType,
					 state.StateName,
					 compreg.ComplaintNature,
					 compreg.ComplaintWord,
					 compreg.ComplaintDocName,
					 compreg.ComplaintDocPath,
					 users.FullName ,
					 compreg.CategoryId,
					 compreg.StateId,
					 compreg.SubCategoryId,
					 case when usersregs.FullName is not null then usersregs.FullName else '------' end as CompletedBy,
					 compreg.AddBy, compreg.ComplaintRemarks
from ComplaintRegistration as compreg
                    left join UserRegistration as users on compreg.AddBy = users.Id
			     	left join Category as cat on compreg.CategoryId = cat.Id
					left join SubCategory as subcat on compreg.SubCategoryId = subcat.Id
					left join ComplaintType as comptype on compreg.ComplaintTypeId = comptype.Id
					left join [State] as state on compreg.StateId= state.Id
						left join UserRegistration as usersregs on compreg.EditBy = usersregs.Id

					where
					compreg.ComplaintStatusId=@ComplaintStatusId
				AND 
					((ISNULL(@UserId, '') = ''OR compreg.ComplaintAssignedTo= @UserId))

		if(@UserId ='' )
				begin
					select count(*) as TotalApprovedComplaint
					 from ComplaintRegistration
					 where ComplaintRegistration.ComplaintStatusId = 1

					select count(*) as TotalPendingComplaint 
					 from ComplaintRegistration
					 where ComplaintRegistration.ComplaintStatusId = 2
					
					select count(*) as TotalRejectedComplaint 
					 from ComplaintRegistration 
					 where ComplaintRegistration.ComplaintStatusId = 3
				end
					
					else
					
				begin
					select count(*) as TotalApprovedComplaint
					 from ComplaintRegistration 
					 where (ComplaintRegistration.ComplaintStatusId = 1 and ComplaintRegistration.ComplaintAssignedTo = @UserId)

					select count(*) as TotalPendingComplaint 
					 from ComplaintRegistration
					 where (ComplaintRegistration.ComplaintStatusId = 2 and ComplaintRegistration.ComplaintAssignedTo = @UserId)
					
					select count(*) as TotalRejectedComplaint
					 from ComplaintRegistration
					 where (ComplaintRegistration.ComplaintStatusId = 3 and ComplaintRegistration.ComplaintAssignedTo = @UserId)					
				end


				

				
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplaintDataByUser]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[sp_GetComplaintDataByUser]
		@UserId int
				as
					select compreg.Id,
					compreg.ComplaintNo,
					case when (compreg.ComplaintStatusId = 1) then  'Approved' 
					when   (compreg.ComplaintStatusId = 2) then 'Pending'
					else 'Rejected' end as ComplaintStatus,
					FORMAT(compreg.AddOn,'dd-MM-yyyy hh:mm:ss:tt') as RegistrationDate,
					 case  when(compreg.EditOn is not null ) then  FORMAT(compreg.EditOn,'dd-MM-yyyy hh:mm:ss:tt') 
					 else
					 '00-00-0000 00:00:00:00' end as ModifiedDate,
					 cat.CategoryName,
					 subcat.SubCategoryName,
					 comptype.[Type] as ComplaintType,
					 state.StateName,
					 compreg.ComplaintNature,
					 compreg.ComplaintWord,
					 compreg.ComplaintDocName,
					 compreg.ComplaintDocPath,
					 compreg.ComplaintRemarks,
					 usersregs.FullName as CompletedBy
					from ComplaintRegistration  compreg
					left join Category as cat on compreg.CategoryId = cat.Id
					left join SubCategory as subcat on compreg.SubCategoryId = subcat.Id
					left join ComplaintType as comptype on compreg.ComplaintTypeId = comptype.Id
					left join [State] as state on compreg.StateId= state.Id
					left join UserRegistration as usersregs on compreg.EditBy = usersregs.Id


		where compreg.AddBy = @UserId
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubCategory]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetSubCategory]

as
begin
select * from SubCategory
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDashboardData]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[sp_GetUserDashboardData]
@userid int
as
begin
   	select count(*) as TotalApprovedComplaint from ComplaintRegistration
		 where ComplaintRegistration.ComplaintStatusId = 1 and ComplaintRegistration.AddBy = @userid
	 				
    select count(*) as TotalPendingComplaint from ComplaintRegistration 
	    where ComplaintRegistration.ComplaintStatusId = 2 and ComplaintRegistration.AddBy = @userid
					
    select count(*) as TotalRejectedComplaint from ComplaintRegistration 
		where ComplaintRegistration.ComplaintStatusId = 3 and ComplaintRegistration.AddBy = @userid
		 
 	select count(*) as TotalComplaint from ComplaintRegistration where ComplaintRegistration.AddBy = @userid

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 2/27/2021 8:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetUsers]
as
begin
  select  
  users.FullName,
  users.Email,
  users.ContactNo,
  users.[Address],
  users.PinCode,
  users.Id,
  users.UserTypeId,
  users.StateId,
  st.StateName,
  users.IsApproved,
  ut.[Type] as UserType,
  users.CompanyName,
  users.[Password] ,
  users.AddBy
  
  from UserRegistration as users
  left join UserType as ut on users.UserTypeId = ut.Id 
  left join State as st on users.StateId = st.Id 

end
GO
