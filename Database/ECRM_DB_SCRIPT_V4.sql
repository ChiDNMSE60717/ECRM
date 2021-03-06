USE [master]
GO
/****** Object:  Database [ecrm]    Script Date: 5/29/2015 4:38:04 PM ******/
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
/****** Object:  Table [dbo].[tblClassroom]    Script Date: 5/29/2015 4:38:04 PM ******/
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
 CONSTRAINT [PK_tblClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 5/29/2015 4:38:04 PM ******/
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
/****** Object:  Table [dbo].[tblEquipmentCategory]    Script Date: 5/29/2015 4:38:04 PM ******/
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
/****** Object:  Table [dbo].[tblReport]    Script Date: 5/29/2015 4:38:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[tblReportDetail]    Script Date: 5/29/2015 4:38:04 PM ******/
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 5/29/2015 4:38:04 PM ******/
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
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 5/29/2015 4:38:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slots] [int] NOT NULL,
	[VerticalRows] [int] NOT NULL,
	[HorizontalRows] [nvarchar](50) NOT NULL,
	[NoSlotsEachHRows] [nvarchar](50) NOT NULL,
	[AirConditioning] [bit] NOT NULL,
	[Fan] [bit] NOT NULL,
	[Projector] [bit] NOT NULL,
	[Speaker] [bit] NOT NULL,
	[Television] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK__tblRoomT__3213E83FC4B07A2A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSchedule]    Script Date: 5/29/2015 4:38:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClassroomId] [int] NOT NULL,
	[NoStudents] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[TimeFrom] [time](7) NOT NULL,
	[TimeTo] [time](7) NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NOT NULL,
 CONSTRAINT [PK_tblSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/29/2015 4:38:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Username] [varchar](45) NOT NULL,
	[Password] [varchar](45) NOT NULL,
	[Fullname] [varchar](45) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeachingTime]    Script Date: 5/29/2015 4:38:04 PM ******/
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

INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime]) VALUES (7, 2, N'101', 0, CAST(N'2015-05-29 01:58:02.667' AS DateTime), NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime]) VALUES (8, 2, N'101', 0, CAST(N'2015-05-29 01:58:29.287' AS DateTime), NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [DamagedLevel], [CreateTime], [UpdateTime]) VALUES (9, 1, N'', 0, CAST(N'2015-05-29 09:00:52.220' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblClassroom] OFF
SET IDENTITY_INSERT [dbo].[tblEquipmentCategory] ON 

INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (1, N'Projector')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (2, N'Television')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (3, N'Fan')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (4, N'AirConditioning')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (5, N'Speaker')
INSERT [dbo].[tblEquipmentCategory] ([Id], [Name]) VALUES (6, N'Buld')
SET IDENTITY_INSERT [dbo].[tblEquipmentCategory] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblRoomType] ON 

INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NoSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Television], [CreateTime], [UpdateTime]) VALUES (1, 25, 2, N'5-5', N'3-2', 1, 1, 1, 1, 1, CAST(N'1900-01-01 00:00:06.670' AS DateTime), NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NoSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Television], [CreateTime], [UpdateTime]) VALUES (2, 30, 2, N'5-5', N'3-3', 1, 1, 1, 1, 1, CAST(N'1900-01-01 00:00:06.673' AS DateTime), NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NoSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Television], [CreateTime], [UpdateTime]) VALUES (3, 2, 2, N'1-1', N'1-1', 1, 1, 1, 0, 1, CAST(N'2015-05-28 22:07:07.477' AS DateTime), NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NoSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Television], [CreateTime], [UpdateTime]) VALUES (4, 90, 3, N'5-5-5', N'3-3-3', 1, 1, 1, 1, 1, CAST(N'2015-05-29 00:40:27.803' AS DateTime), NULL)
INSERT [dbo].[tblRoomType] ([Id], [Slots], [VerticalRows], [HorizontalRows], [NoSlotsEachHRows], [AirConditioning], [Fan], [Projector], [Speaker], [Television], [CreateTime], [UpdateTime]) VALUES (5, 60, 2, N'5-5', N'6-6', 1, 1, 1, 0, 0, CAST(N'2015-05-29 16:34:45.643' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblRoomType] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [RoleId], [Username], [Password], [Fullname], [Phone], [Status]) VALUES (1, 1, N'admin', N'123456', N'admin', N'901234567', 1)
INSERT [dbo].[tblUser] ([Id], [RoleId], [Username], [Password], [Fullname], [Phone], [Status]) VALUES (5, 2, N'staff', N'123456', N'staff', N'987654321', 1)
INSERT [dbo].[tblUser] ([Id], [RoleId], [Username], [Password], [Fullname], [Phone], [Status]) VALUES (6, 3, N'teacher', N'123456', N'teacher', N'1234567890', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblClassroom]  WITH CHECK ADD  CONSTRAINT [FK_tblClassroom_tblRoomType1] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[tblRoomType] ([Id])
GO
ALTER TABLE [dbo].[tblClassroom] CHECK CONSTRAINT [FK_tblClassroom_tblRoomType1]
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
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_Report_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_Report_tblUser]
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
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FKA5A810A9A9DD896A] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FKA5A810A9A9DD896A]
GO
USE [master]
GO
ALTER DATABASE [ecrm] SET  READ_WRITE 
GO
