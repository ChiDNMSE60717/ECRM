USE [master]
GO
/****** Object:  Database [ecrm]    Script Date: 6/5/2015 11:12:54 AM ******/
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
/****** Object:  Table [dbo].[tblClassroom]    Script Date: 6/5/2015 11:12:54 AM ******/
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
	[IsDelete] [bit] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_tblClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 6/5/2015 11:12:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEquipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ClassroomId] [int] NOT NULL,
	[UsingTime] [int] NOT NULL,
	[Position] [nchar](10) NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEquipmentCategory]    Script Date: 6/5/2015 11:12:54 AM ******/
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
/****** Object:  Table [dbo].[tblReport]    Script Date: 6/5/2015 11:12:54 AM ******/
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
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReportDetail]    Script Date: 6/5/2015 11:12:54 AM ******/
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 6/5/2015 11:12:54 AM ******/
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
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 6/5/2015 11:12:54 AM ******/
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
	[Buld] [int] NULL,
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
/****** Object:  Table [dbo].[tblSchedule]    Script Date: 6/5/2015 11:12:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](30) NOT NULL,
	[ClassroomId] [int] NOT NULL,
	[NumberOfStudents] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[TimeFrom] [time](7) NOT NULL,
	[Slots] [int] NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NOT NULL,
 CONSTRAINT [PK_tblSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/5/2015 11:12:54 AM ******/
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
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 6/5/2015 11:12:54 AM ******/
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
/****** Object:  Table [dbo].[TeachingTime]    Script Date: 6/5/2015 11:12:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachingTime](
	[TimeFrom] [time](7) NOT NULL,
	[TimeTo] [time](7) NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NOT NULL,
	[ScheduleId] [int] NOT NULL,
 CONSTRAINT [PK_TeachingTime] PRIMARY KEY CLUSTERED 
(
	[TimeFrom] ASC,
	[TimeTo] ASC,
	[DateFrom] ASC,
	[DateTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblClassroom] ON 

INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1022, 2, N'101', 0, CAST(N'2015-06-02 00:31:55.803' AS DateTime), NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1023, 3, N'102', 0, CAST(N'2015-06-04 01:01:24.037' AS DateTime), NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1024, 4, N'103', 0, CAST(N'2015-06-04 13:09:09.983' AS DateTime), NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1025, 6, N'104', 0, CAST(N'2015-06-04 14:25:37.737' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblClassroom] OFF
SET IDENTITY_INSERT [dbo].[tblEquipment] ON 

INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (1, 7, 1022, 3000, N'[0,0]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (2, 8, 1022, 3000, N'[0,0,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (3, 7, 1022, 3000, N'[0,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (4, 8, 1022, 3000, N'[0,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (5, 8, 1022, 3000, N'[0,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (6, 8, 1022, 3000, N'[0,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (7, 7, 1022, 3000, N'[0,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (8, 8, 1022, 3000, N'[0,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (9, 8, 1022, 3000, N'[0,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (10, 8, 1022, 3000, N'[0,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (11, 7, 1022, 3000, N'[0,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (12, 8, 1022, 3000, N'[0,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (13, 8, 1022, 3000, N'[0,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (14, 8, 1022, 3000, N'[0,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (15, 7, 1022, 3000, N'[0,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (16, 8, 1022, 3000, N'[0,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (17, 8, 1022, 3000, N'[0,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (18, 8, 1022, 3000, N'[0,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (19, 7, 1022, 3000, N'[0,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (20, 8, 1022, 3000, N'[0,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (21, 8, 1022, 3000, N'[0,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (22, 8, 1022, 3000, N'[0,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (23, 7, 1022, 3000, N'[1,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (24, 8, 1022, 3000, N'[1,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (25, 8, 1022, 3000, N'[1,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (26, 7, 1022, 3000, N'[1,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (27, 8, 1022, 3000, N'[1,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (28, 8, 1022, 3000, N'[1,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (29, 7, 1022, 3000, N'[1,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (30, 8, 1022, 3000, N'[1,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (31, 8, 1022, 3000, N'[1,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (32, 7, 1022, 3000, N'[1,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (33, 8, 1022, 3000, N'[1,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (34, 8, 1022, 3000, N'[1,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (35, 7, 1022, 3000, N'[1,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (36, 8, 1022, 3000, N'[1,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (37, 8, 1022, 3000, N'[1,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (38, 1, 1022, 3000, N'[1]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (39, 2, 1022, 3000, N'[2]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (40, 3, 1022, 3000, N'[3]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (41, 4, 1022, 3000, N'[4]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (42, 5, 1022, 3000, N'[5]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (43, 6, 1022, 3000, N'[6]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (44, 7, 1023, 3000, N'[0,0]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (45, 8, 1023, 3000, N'[0,0,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (46, 7, 1023, 3000, N'[0,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (47, 8, 1023, 3000, N'[0,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (48, 7, 1023, 3000, N'[1,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (49, 8, 1023, 3000, N'[1,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (50, 1, 1023, 3000, N'[1]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (51, 2, 1023, 3000, N'[2]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (52, 3, 1023, 3000, N'[3]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (53, 4, 1023, 3000, N'[4]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (54, 6, 1023, 3000, N'[6]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (55, 7, 1024, 3000, N'[0,0]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (56, 8, 1024, 3000, N'[0,0,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (57, 7, 1024, 3000, N'[0,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (58, 8, 1024, 3000, N'[0,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (59, 8, 1024, 3000, N'[0,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (60, 8, 1024, 3000, N'[0,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (61, 7, 1024, 3000, N'[0,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (62, 8, 1024, 3000, N'[0,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (63, 8, 1024, 3000, N'[0,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (64, 8, 1024, 3000, N'[0,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (65, 7, 1024, 3000, N'[0,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (66, 8, 1024, 3000, N'[0,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (67, 8, 1024, 3000, N'[0,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (68, 8, 1024, 3000, N'[0,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (69, 7, 1024, 3000, N'[0,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (70, 8, 1024, 3000, N'[0,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (71, 8, 1024, 3000, N'[0,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (72, 8, 1024, 3000, N'[0,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (73, 7, 1024, 3000, N'[0,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (74, 8, 1024, 3000, N'[0,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (75, 8, 1024, 3000, N'[0,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (76, 8, 1024, 3000, N'[0,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (77, 7, 1024, 3000, N'[1,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (78, 8, 1024, 3000, N'[1,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (79, 8, 1024, 3000, N'[1,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (80, 8, 1024, 3000, N'[1,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (81, 7, 1024, 3000, N'[1,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (82, 8, 1024, 3000, N'[1,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (83, 8, 1024, 3000, N'[1,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (84, 8, 1024, 3000, N'[1,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (85, 7, 1024, 3000, N'[1,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (86, 8, 1024, 3000, N'[1,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (87, 8, 1024, 3000, N'[1,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (88, 8, 1024, 3000, N'[1,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (89, 7, 1024, 3000, N'[1,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (90, 8, 1024, 3000, N'[1,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (91, 8, 1024, 3000, N'[1,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (92, 8, 1024, 3000, N'[1,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (93, 7, 1024, 3000, N'[1,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (94, 8, 1024, 3000, N'[1,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (95, 8, 1024, 3000, N'[1,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (96, 8, 1024, 3000, N'[1,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (97, 7, 1024, 3000, N'[2,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (98, 8, 1024, 3000, N'[2,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (99, 8, 1024, 3000, N'[2,1,1]   ', N'OK')
GO
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (100, 8, 1024, 3000, N'[2,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (101, 7, 1024, 3000, N'[2,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (102, 8, 1024, 3000, N'[2,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (103, 8, 1024, 3000, N'[2,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (104, 8, 1024, 3000, N'[2,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (105, 7, 1024, 3000, N'[2,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (106, 8, 1024, 3000, N'[2,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (107, 8, 1024, 3000, N'[2,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (108, 8, 1024, 3000, N'[2,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (109, 7, 1024, 3000, N'[2,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (110, 8, 1024, 3000, N'[2,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (111, 8, 1024, 3000, N'[2,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (112, 8, 1024, 3000, N'[2,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (113, 7, 1024, 3000, N'[2,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (114, 8, 1024, 3000, N'[2,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (115, 8, 1024, 3000, N'[2,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (116, 8, 1024, 3000, N'[2,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (117, 1, 1024, 3000, N'[1]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (118, 2, 1024, 3000, N'[2]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (119, 3, 1024, 3000, N'[3]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (120, 4, 1024, 3000, N'[4]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (121, 5, 1024, 3000, N'[5]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (122, 6, 1024, 3000, N'[6]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (123, 7, 1025, 3000, N'[0,0]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (124, 8, 1025, 3000, N'[0,0,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (125, 7, 1025, 3000, N'[0,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (126, 8, 1025, 3000, N'[0,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (127, 8, 1025, 3000, N'[0,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (128, 8, 1025, 3000, N'[0,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (129, 7, 1025, 3000, N'[0,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (130, 8, 1025, 3000, N'[0,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (131, 8, 1025, 3000, N'[0,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (132, 8, 1025, 3000, N'[0,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (133, 7, 1025, 3000, N'[0,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (134, 8, 1025, 3000, N'[0,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (135, 8, 1025, 3000, N'[0,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (136, 8, 1025, 3000, N'[0,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (137, 7, 1025, 3000, N'[0,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (138, 8, 1025, 3000, N'[0,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (139, 8, 1025, 3000, N'[0,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (140, 8, 1025, 3000, N'[0,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (141, 7, 1025, 3000, N'[0,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (142, 8, 1025, 3000, N'[0,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (143, 8, 1025, 3000, N'[0,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (144, 8, 1025, 3000, N'[0,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (145, 7, 1025, 3000, N'[1,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (146, 8, 1025, 3000, N'[1,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (147, 8, 1025, 3000, N'[1,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (148, 8, 1025, 3000, N'[1,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (149, 8, 1025, 3000, N'[1,1,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (150, 7, 1025, 3000, N'[1,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (151, 8, 1025, 3000, N'[1,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (152, 8, 1025, 3000, N'[1,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (153, 8, 1025, 3000, N'[1,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (154, 8, 1025, 3000, N'[1,2,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (155, 7, 1025, 3000, N'[1,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (156, 8, 1025, 3000, N'[1,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (157, 8, 1025, 3000, N'[1,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (158, 8, 1025, 3000, N'[1,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (159, 8, 1025, 3000, N'[1,3,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (160, 7, 1025, 3000, N'[1,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (161, 8, 1025, 3000, N'[1,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (162, 8, 1025, 3000, N'[1,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (163, 8, 1025, 3000, N'[1,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (164, 8, 1025, 3000, N'[1,4,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (165, 7, 1025, 3000, N'[1,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (166, 8, 1025, 3000, N'[1,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (167, 8, 1025, 3000, N'[1,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (168, 8, 1025, 3000, N'[1,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (169, 8, 1025, 3000, N'[1,5,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (170, 7, 1025, 3000, N'[2,1]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (171, 8, 1025, 3000, N'[2,1,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (172, 8, 1025, 3000, N'[2,1,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (173, 8, 1025, 3000, N'[2,1,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (174, 8, 1025, 3000, N'[2,1,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (175, 8, 1025, 3000, N'[2,1,4]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (176, 7, 1025, 3000, N'[2,2]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (177, 8, 1025, 3000, N'[2,2,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (178, 8, 1025, 3000, N'[2,2,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (179, 8, 1025, 3000, N'[2,2,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (180, 8, 1025, 3000, N'[2,2,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (181, 8, 1025, 3000, N'[2,2,4]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (182, 7, 1025, 3000, N'[2,3]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (183, 8, 1025, 3000, N'[2,3,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (184, 8, 1025, 3000, N'[2,3,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (185, 8, 1025, 3000, N'[2,3,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (186, 8, 1025, 3000, N'[2,3,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (187, 8, 1025, 3000, N'[2,3,4]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (188, 7, 1025, 3000, N'[2,4]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (189, 8, 1025, 3000, N'[2,4,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (190, 8, 1025, 3000, N'[2,4,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (191, 8, 1025, 3000, N'[2,4,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (192, 8, 1025, 3000, N'[2,4,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (193, 8, 1025, 3000, N'[2,4,4]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (194, 7, 1025, 3000, N'[2,5]     ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (195, 8, 1025, 3000, N'[2,5,0]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (196, 8, 1025, 3000, N'[2,5,1]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (197, 8, 1025, 3000, N'[2,5,2]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (198, 8, 1025, 3000, N'[2,5,3]   ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (199, 8, 1025, 3000, N'[2,5,4]   ', N'OK')
GO
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (200, 2, 1025, 3000, N'[2]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (201, 3, 1025, 3000, N'[3]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (202, 4, 1025, 3000, N'[4]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (203, 5, 1025, 3000, N'[5]       ', N'OK')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [UsingTime], [Position], [Status]) VALUES (204, 6, 1025, 3000, N'[6]       ', N'OK')
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

INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (2, 30, 2, N'5-5', N'3-3', 1, 1, 1, 1, NULL, 1, CAST(N'1900-01-01 00:00:06.673' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (3, 2, 2, N'1-1', N'1-1', 1, 1, 1, 0, NULL, 1, CAST(N'2015-05-28 22:07:07.477' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (4, 90, 3, N'5-5-5', N'3-3-3', 1, 1, 1, 1, NULL, 1, CAST(N'2015-05-29 00:40:27.803' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (5, 60, 2, N'5-5', N'6-6', 1, 1, 1, 0, NULL, 0, CAST(N'2015-05-29 16:34:45.643' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (6, 120, 3, N'5-5-5', N'3-4-5', 1, 1, 0, 1, NULL, 1, CAST(N'2015-05-30 01:16:11.910' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (7, 6, 2, N'1-1', N'1-1', 1, 1, 0, 0, NULL, 0, CAST(N'2015-05-30 02:20:10.753' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1006, 4, 4, N'1-1-1-1', N'1-1-1-1', 1, 0, 1, 0, NULL, 0, CAST(N'2015-06-01 12:04:39.200' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1007, 7, 7, N'1-1-1-1-1-1-1', N'1-1-1-1-1-1-1', 0, 0, 0, 1, NULL, 0, CAST(N'2015-06-01 12:06:40.630' AS DateTime), NULL, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Buld], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1009, 1, 1, N'1', N'1', 0, 0, 0, 1, NULL, 1, CAST(N'2015-06-04 00:32:59.567' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblRoomType] OFF
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (1, N'admin', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (2, N'staff', N'123456', 1)
INSERT [dbo].[tblUser] ([RoleId], [Username], [Password], [Status]) VALUES (3, N'teacher', N'123456', 1)
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
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblUser1] FOREIGN KEY([UserId])
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
