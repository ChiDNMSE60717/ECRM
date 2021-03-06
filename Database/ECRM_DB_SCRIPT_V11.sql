USE [master]
GO
/****** Object:  Database [ecrm]    Script Date: 6/15/2015 3:37:58 PM ******/
CREATE DATABASE [ecrm] ON  PRIMARY 
( NAME = N'ecrm', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ecrm.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ecrm_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ecrm_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ecrm] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecrm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecrm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecrm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecrm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecrm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecrm] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecrm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecrm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecrm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecrm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecrm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecrm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecrm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecrm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecrm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecrm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ecrm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecrm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecrm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecrm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecrm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecrm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecrm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecrm] SET RECOVERY FULL 
GO
ALTER DATABASE [ecrm] SET  MULTI_USER 
GO
ALTER DATABASE [ecrm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecrm] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecrm', N'ON'
GO
USE [ecrm]
GO
/****** Object:  Table [dbo].[tblClassroom]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[IsDelete] [bit] NULL,
	[UpdateTime] [datetime] NULL,
	[IsAllInformation] [tinyint] NULL,
	[DamagedLevel] [int] NULL,
 CONSTRAINT [PK_tblClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEquipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ClassroomId] [int] NULL,
	[Position] [nchar](10) NULL,
	[Status] [bit] NOT NULL,
	[TimeRemain] [int] NULL,
	[Name] [varchar](255) NULL,
	[SerialNumber] [varchar](255) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEquipmentCategory]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEquipmentCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UsingTime] [int] NULL,
 CONSTRAINT [PK_EquipmentCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReport]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[ClassRoomId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Evaluate] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReportDetail]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportDetail](
	[EquipmentId] [int] NOT NULL,
	[ReportId] [int] NOT NULL,
	[DamagedLevel] [nvarchar](250) NOT NULL,
	[Position] [nchar](10) NULL,
	[Description] [nvarchar](max) NULL,
	[Solution] [nvarchar](max) NULL,
	[ResolveTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblReportDetail] PRIMARY KEY CLUSTERED 
(
	[EquipmentId] ASC,
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Slots] [int] NOT NULL,
	[VerticalRows] [int] NOT NULL,
	[HorizontalRows] [nvarchar](50) NOT NULL,
	[NumberOfSlotsEachHRows] [nvarchar](50) NOT NULL,
	[Projector] [int] NOT NULL,
	[AirConditioning] [int] NOT NULL,
	[Bulb] [int] NOT NULL,
	[Fan] [int] NOT NULL,
	[Speaker] [int] NOT NULL,
	[Television] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[IsDelete] [bit] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK__tblRoomT__3213E83FC4B07A2A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSchedule]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[ClassroomId] [int] NOT NULL,
	[NumberOfStudents] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[TimeFrom] [time](7) NOT NULL,
	[Slots] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[Username] [varchar](30) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [varchar](45) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser_1] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 6/15/2015 3:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserInfo](
	[Username] [varchar](30) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
 CONSTRAINT [PK_tblUserInfo] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassroom] ON 

INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1034, 1015, N'101', CAST(N'2015-06-10 03:56:53.043' AS DateTime), 0, NULL, 1, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1035, 1016, N'102', CAST(N'2015-06-13 12:15:34.627' AS DateTime), 0, NULL, 1, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1036, 1017, N'103', CAST(N'2015-06-13 12:16:14.033' AS DateTime), 0, NULL, 1, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1037, 1016, N'213', CAST(N'2015-06-15 10:31:13.593' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1038, 1016, N'312', CAST(N'2015-06-15 10:31:38.403' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1039, 1016, N'407', CAST(N'2015-06-15 10:32:01.133' AS DateTime), 0, NULL, NULL, 50)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1040, 1017, N'403', CAST(N'2015-06-15 10:34:35.447' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1041, 1017, N'310', CAST(N'2015-06-15 10:34:55.687' AS DateTime), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblClassroom] OFF
SET IDENTITY_INSERT [dbo].[tblEquipment] ON 

INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (102, 1, 1035, N'[1]       ', 1, NULL, N'Projector2015', N'ASD1333223')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (103, 1, 1034, N'[1]       ', 1, NULL, N'Projector2015', N'XXX1234124')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (104, 2, 1035, N'[2]       ', 1, NULL, N'SONY', N'BRAVA123123')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (105, 3, 1035, N'[3]       ', 1, NULL, N'DAIKIN', N'DAK123123')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (106, 3, 1035, N'[3]       ', 1, NULL, N'DAIKIN', N'DAK454545')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (107, 1, 1036, N'[1]       ', 1, NULL, N'ProjectorJapan', N'PJT987123122')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (108, 2, 1036, N'[2]       ', 1, NULL, N'SONYBRAVA', N'SN234234')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (109, 2, 1037, N'[2]       ', 1, NULL, N'SONY', N'HIHI21312312')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (110, 3, 1036, N'[3]       ', 1, NULL, N'HITACHI', N'HTC213123')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (115, 1, 1038, N'[1]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (116, 3, 1038, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (117, 3, 1038, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (118, 2, 1038, N'[2]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (119, 1, 1039, N'[1]       ', 1, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (120, 3, 1039, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (121, 3, 1039, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (122, 2, 1039, N'[2]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (123, 1, 1040, N'[1]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (124, 3, 1040, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (125, 3, 1040, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (126, 2, 1040, N'[2]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (127, 1, 1041, N'[1]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (128, 3, 1041, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (129, 3, 1041, N'[3]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (130, 2, 1041, N'[2]       ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (131, 1, 1037, N'[1]       ', 1, NULL, N'asdx', N'1231231412')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (132, 1, NULL, NULL, 1, NULL, N'gfhfh', N'4534534576')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (133, 1, NULL, NULL, 1, NULL, N'rtrthf', N'2343434323')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (134, 3, 1036, N'[3]       ', 1, NULL, N'seret', N'245465765')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (135, 3, 1037, N'[3]       ', 1, NULL, N'lkhlrtkjh', N'12o238534y895')
SET IDENTITY_INSERT [dbo].[tblEquipment] OFF
SET IDENTITY_INSERT [dbo].[tblEquipmentCategory] ON 

INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (1, N'Máy chiếu', 3000)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (2, N'Tivi', 0)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (3, N'Máy lạnh', 6000)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (4, N'Máy quạt', 0)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (5, N'Loa', 0)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (6, N'Bóng đèn', 0)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (7, N'Bàn', 0)
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (8, N'Ghế', 0)
SET IDENTITY_INSERT [dbo].[tblEquipmentCategory] OFF
SET IDENTITY_INSERT [dbo].[tblReport] ON 

INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (1, N'KhanhKT', 1039, CAST(N'2015-06-15 15:36:14.750' AS DateTime), N'1', 1)
SET IDENTITY_INSERT [dbo].[tblReport] OFF
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (119, 1, N'1', N'[1]       ', N'hinh bi be', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblRoomType] ON 

INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1015, N'Loai 3 day', 30, 3, N'5-5-5', N'2-2-2', 1, 0, 1, 1, 1, 1, CAST(N'2015-06-10 00:13:39.373' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1016, N'Loai 30 cho', 30, 2, N'5-5', N'3-3', 1, 2, 1, 0, 0, 1, CAST(N'2015-06-10 08:10:18.327' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1017, N'Loai 25 cho', 25, 2, N'5-5', N'3-2', 1, 2, 1, 2, 0, 1, CAST(N'2015-06-13 12:14:04.220' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1018, N'Loai 40 cho', 40, 2, N'5-5', N'4-4', 1, 2, 1, 4, 1, 1, CAST(N'2015-06-14 20:42:56.097' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[tblRoomType] OFF
SET IDENTITY_INSERT [dbo].[tblSchedule] ON 

INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (700, N'KhanhKT', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (701, N'KhanhKT', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (702, N'KhanhKT', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (703, N'KhanhKT', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (704, N'KhanhKT', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (705, N'KhanhKT', 1037, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (706, N'KhanhKT', 1037, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (707, N'KhanhKT', 1037, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (708, N'KhanhKT', 1037, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (709, N'KhanhKT', 1037, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (710, N'SuTV', 1041, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (711, N'SuTV', 1041, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (712, N'SuTV', 1041, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (713, N'SuTV', 1041, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (714, N'SuTV', 1041, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (715, N'SuTV', 1038, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (716, N'SuTV', 1038, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (717, N'SuTV', 1038, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (718, N'SuTV', 1038, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (719, N'SuTV', 1038, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (720, N'KhanhKT', 1038, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (721, N'KhanhKT', 1038, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (722, N'KhanhKT', 1038, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (723, N'KhanhKT', 1038, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (724, N'KhanhKT', 1038, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (725, N'SuTV', 1038, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (726, N'SuTV', 1038, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (727, N'SuTV', 1038, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (728, N'SuTV', 1038, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (729, N'SuTV', 1038, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (730, N'SuTV', 1040, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (731, N'SuTV', 1040, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (732, N'SuTV', 1040, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (733, N'SuTV', 1040, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (734, N'SuTV', 1040, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (735, N'KhanhKT', 1039, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-15' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (736, N'KhanhKT', 1039, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-16' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (737, N'KhanhKT', 1039, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-17' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (738, N'KhanhKT', 1039, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-18' AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (739, N'KhanhKT', 1039, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-06-19' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblSchedule] OFF
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'admin', 1, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'BaoNQ', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'Gerardo', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'hungtv', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'KhanhKT', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'LienTTH', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'PhuongLHK', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'staff', 2, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'SuTV', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'teacher', 3, N'123456', 1)
INSERT [dbo].[tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'VinhDP', 3, N'123456', 1)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'staff', N'Doan Nguyen', N'01666815718', CAST(N'2015-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'teacher', N'Minh Chi', N'1666812243', CAST(N'2015-05-15 00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[tblClassroom]  WITH CHECK ADD  CONSTRAINT [FK_tblClassroom_tblRoomType1] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[tblRoomType] ([Id])
GO
ALTER TABLE [dbo].[tblClassroom] CHECK CONSTRAINT [FK_tblClassroom_tblRoomType1]
GO
ALTER TABLE [dbo].[tblEquipment]  WITH CHECK ADD  CONSTRAINT [FK_tblEquipment_tblClassroom] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblEquipment] CHECK CONSTRAINT [FK_tblEquipment_tblClassroom]
GO
ALTER TABLE [dbo].[tblEquipment]  WITH CHECK ADD  CONSTRAINT [FK_tblEquipment_tblEquipmentCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblEquipmentCategory] ([Id])
GO
ALTER TABLE [dbo].[tblEquipment] CHECK CONSTRAINT [FK_tblEquipment_tblEquipmentCategory]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblClassroom] FOREIGN KEY([ClassRoomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblClassroom]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblUser1] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblUser1]
GO
ALTER TABLE [dbo].[tblReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReportDetail_tblEquipment1] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[tblEquipment] ([Id])
GO
ALTER TABLE [dbo].[tblReportDetail] CHECK CONSTRAINT [FK_tblReportDetail_tblEquipment1]
GO
ALTER TABLE [dbo].[tblReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReportDetail_tblReport] FOREIGN KEY([ReportId])
REFERENCES [dbo].[tblReport] ([Id])
GO
ALTER TABLE [dbo].[tblReportDetail] CHECK CONSTRAINT [FK_tblReportDetail_tblReport]
GO
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblClassroom] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblClassroom]
GO
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblUser1] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblUser1]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FKA5A810A9A9DD896A] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FKA5A810A9A9DD896A]
GO
ALTER TABLE [dbo].[tblUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInfo_tblUser] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblUserInfo] CHECK CONSTRAINT [FK_tblUserInfo_tblUser]
GO
USE [master]
GO
ALTER DATABASE [ecrm] SET  READ_WRITE 
GO
