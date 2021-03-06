USE [master]
GO
/****** Object:  Database [ecrm]    Script Date: 6/12/2015 10:26:39 AM ******/
CREATE DATABASE [ecrm] ON  PRIMARY 
( NAME = N'ecrm', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ecrm.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ecrm_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ecrm_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[tblClassroom]    Script Date: 6/12/2015 10:26:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DamagedLevel] [int] NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[IsDelete] [bit] NULL,
	[IsAllInformation] [bit] NULL,
 CONSTRAINT [PK_tblClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 6/12/2015 10:26:39 AM ******/
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
	[TimeRemain] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[SerialNumber] [nvarchar](20) NULL,
	[Status] [varchar](50) NOT NULL,
	[UsingTime] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEquipmentCategory]    Script Date: 6/12/2015 10:26:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEquipmentCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReport]    Script Date: 6/12/2015 10:26:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](30) NOT NULL,
	[ClassRoomId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Evaluate] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[Username] [varchar](255) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReportDetail]    Script Date: 6/12/2015 10:26:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportDetail](
	[EquipmentId] [int] NOT NULL,
	[ReportId] [int] NOT NULL,
	[DamagedLevel] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[Position] [nchar](10) NOT NULL,
	[Solution] [nchar](10) NULL,
	[ResolveTime] [datetime] NULL,
 CONSTRAINT [PK_tblReportDetail] PRIMARY KEY CLUSTERED 
(
	[EquipmentId] ASC,
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 6/12/2015 10:26:39 AM ******/
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
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 6/12/2015 10:26:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slots] [int] NOT NULL,
	[VerticalRows] [int] NOT NULL,
	[HorizontalRows] [nvarchar](50) NOT NULL,
	[NumberOfSlotsEachHRows] [nvarchar](50) NOT NULL,
	[AirConditioning] [int] NOT NULL,
	[Fan] [int] NOT NULL,
	[Projector] [int] NOT NULL,
	[Speaker] [int] NOT NULL,
	[Bulb] [int] NOT NULL,
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
/****** Object:  Table [dbo].[tblSchedule]    Script Date: 6/12/2015 10:26:39 AM ******/
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
	[DateFrom] [date] NOT NULL,
 CONSTRAINT [PK_tblSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/12/2015 10:26:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[RoleId] [int] NOT NULL,
	[Username] [varchar](30) NOT NULL,
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
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 6/12/2015 10:26:39 AM ******/
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
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_tblUserInfo] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassroom] ON 

INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (1022, 3, N'101', 0, CAST(N'2015-06-02 00:31:55.803' AS DateTime), CAST(N'2015-06-08 10:12:49.077' AS DateTime), 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (1023, 3, N'102', 0, CAST(N'2015-06-04 01:01:24.037' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (1024, 1006, N'103', 0, CAST(N'2015-06-04 13:09:09.983' AS DateTime), CAST(N'2015-06-08 10:13:42.713' AS DateTime), 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (1025, 3, N'104', 0, CAST(N'2015-06-04 14:25:37.737' AS DateTime), CAST(N'2015-06-08 10:10:42.340' AS DateTime), 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (1026, 2, N'105', 0, CAST(N'2015-06-05 13:55:19.873' AS DateTime), CAST(N'2015-06-08 10:14:23.367' AS DateTime), 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (1027, 2011, N'106', 0, CAST(N'2015-06-05 13:55:54.230' AS DateTime), CAST(N'2015-06-09 22:37:04.733' AS DateTime), 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (2027, 2011, N'107', 0, CAST(N'2015-06-09 22:38:43.920' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (2028, 2011, N'108', 0, CAST(N'2015-06-09 22:41:49.043' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (2029, 2011, N'109', 0, CAST(N'2015-06-09 22:44:01.503' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (2030, 2012, N'110', 0, CAST(N'2015-06-09 22:48:53.980' AS DateTime), CAST(N'2015-06-09 23:42:51.417' AS DateTime), 0, 1)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime], [IsDelete], [IsAllInformation]) VALUES (2031, 2010, N'112', 0, CAST(N'2015-06-09 23:57:23.340' AS DateTime), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[tblClassroom] OFF
SET IDENTITY_INSERT [dbo].[tblEquipment] ON 

INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [TimeRemain], [Name], [SerialNumber], [Status], [UsingTime]) VALUES (3, 1, 1027, N'[1]       ', 3000, N'Projector', N'asdsd123123', N'OK', NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [TimeRemain], [Name], [SerialNumber], [Status], [UsingTime]) VALUES (4, 2, 1027, N'[2]       ', 3000, N'TiviSony', N'BAKND12312', N'OK', NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [TimeRemain], [Name], [SerialNumber], [Status], [UsingTime]) VALUES (5, 3, 1027, N'[3]       ', 3000, N'DAIKIN', N'ASDASQ2123', N'OK', NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [TimeRemain], [Name], [SerialNumber], [Status], [UsingTime]) VALUES (6, 3, 1027, N'[3]       ', 3000, N'HITACHI', N'ASDSA123122', N'OK', NULL)
SET IDENTITY_INSERT [dbo].[tblEquipment] OFF
SET IDENTITY_INSERT [dbo].[tblEquipmentCategory] ON 

INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (1, N'Projector')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (2, N'Television')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (3, N'AirConditioning')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (4, N'Fan')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (5, N'Speaker')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (6, N'Buld')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (7, N'Table')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (8, N'Chair')
SET IDENTITY_INSERT [dbo].[tblEquipmentCategory] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblRoomType] ON 

INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (2, 30, 2, N'5-5', N'3-3', 1, 1, 1, 1, 1, 1, CAST(N'1900-01-01 00:00:06.673' AS DateTime), 0, CAST(N'2015-06-08 09:46:00.270' AS DateTime))
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (3, 25, 2, N'5-5', N'3-2', 1, 1, 1, 0, 1, 1, CAST(N'2015-05-28 22:07:07.477' AS DateTime), 0, CAST(N'2015-06-08 09:46:25.017' AS DateTime))
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (4, 90, 3, N'5-5-5', N'3-3-3', 1, 1, 1, 1, 10, 1, CAST(N'2015-05-29 00:40:27.803' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (5, 60, 2, N'5-5', N'6-6', 1, 1, 1, 0, 10, 0, CAST(N'2015-05-29 16:34:45.643' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (6, 120, 3, N'5-5-5', N'3-4-5', 1, 1, 0, 1, 10, 1, CAST(N'2015-05-30 01:16:11.910' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (7, 6, 2, N'1-1', N'1-1', 1, 1, 0, 0, 10, 0, CAST(N'2015-05-30 02:20:10.753' AS DateTime), 1, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1006, 4, 4, N'1-1-1-1', N'1-1-1-1', 1, 0, 1, 0, 10, 0, CAST(N'2015-06-01 12:04:39.200' AS DateTime), 1, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1007, 7, 7, N'1-1-1-1-1-1-1', N'1-1-1-1-1-1-1', 0, 0, 0, 1, 10, 0, CAST(N'2015-06-01 12:06:40.630' AS DateTime), 1, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1009, 1, 1, N'1', N'1', 0, 0, 0, 1, 10, 1, CAST(N'2015-06-04 00:32:59.567' AS DateTime), 1, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1010, 4, 1, N'2', N'2', 0, 1, 1, 0, 1, 0, CAST(N'2015-06-05 14:18:02.777' AS DateTime), 1, CAST(N'2015-06-05 14:25:21.113' AS DateTime))
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (2010, 25, 2, N'5-5', N'3-2', 0, 0, 0, 0, 1, 0, CAST(N'2015-06-08 09:54:00.053' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (2011, 1, 1, N'1', N'1', 2, 0, 1, 0, 1, 1, CAST(N'2015-06-09 22:22:41.483' AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Bulb], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (2012, 1, 1, N'1', N'1', 2, 0, 0, 0, 1, 0, CAST(N'2015-06-09 23:39:07.757' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[tblRoomType] OFF
SET IDENTITY_INSERT [dbo].[tblSchedule] ON 

INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (263, N'SuTV', 1022, 25, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (264, N'PhuongLHK', 1022, 25, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (265, N'SuTV', 1022, 25, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (266, N'PhuongLHK', 1022, 25, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (267, N'SuTV', 1022, 25, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (268, N'SuTV', 1022, 25, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (269, N'PhuongLHK', 1022, 25, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (270, N'PhuongLHK', 1022, 25, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (271, N'PhuongLHK', 1022, 25, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (272, N'PhuongLHK', 1022, 25, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (273, N'HungLH', 1022, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (274, N'LienTTH', 1022, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (275, N'LienTTH', 1022, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (276, N'LienTTH', 1022, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (277, N'LienTTH', 1022, 25, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (278, N'Gerardo', 1022, 25, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (279, N'PhuongLHK', 1022, 25, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (280, N'Gerardo', 1022, 25, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (281, N'PhuongLHK', 1022, 25, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (282, N'Gerardo', 1022, 25, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (283, N'VinhDP', 1022, 25, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (284, N'VinhDP', 1022, 25, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (285, N'VinhDP', 1022, 25, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (286, N'VinhDP', 1022, 25, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (287, N'VinhDP', 1022, 25, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (288, N'BaoNQ', 1022, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (289, N'BaoNQ', 1022, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (290, N'BaoNQ', 1022, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (291, N'BaoNQ', 1022, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [DateFrom]) VALUES (292, N'BaoNQ', 1022, 25, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
SET IDENTITY_INSERT [dbo].[tblSchedule] OFF
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (1, N'admin', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'BaoNQ', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'chidvm', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'Gerardo', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'HungLH', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'hungtv', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'Joseph', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'LienTTH', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'PhuongLHK', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'quangtv', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (2, N'staff', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'SuTV', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'teacher', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'VinhDP', N'123456', 1)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'chidvm', N'Doan Vo Minh Chi', N'0123456789', NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'hungtv', N'Tang Viet Hung', N'0962067505', NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'quangtv', N'Tran Vinh Quang', N'0123456789', NULL)
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
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_Report_tblClassroom] FOREIGN KEY([ClassRoomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_Report_tblClassroom]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblUser]
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
