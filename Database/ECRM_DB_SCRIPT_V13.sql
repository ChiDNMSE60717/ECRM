USE [ecrm]
GO
/****** Object:  Table [dbo].[tblEquipmentCategory]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 06/22/2015 17:07:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblRoomType] ON
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1015, N'Loai 3 day', 30, 3, N'5-5-5', N'2-2-2', 1, 0, 1, 1, 1, 1, CAST(0x0000A4B30003C034 AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1016, N'Loai 30 cho', 30, 2, N'5-5', N'3-3', 1, 2, 1, 0, 0, 1, CAST(0x0000A4B30086AA9A AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1017, N'Loai 25 cho', 25, 2, N'5-5', N'3-2', 1, 2, 1, 2, 0, 1, CAST(0x0000A4B600C99E52 AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1018, N'Loai 40 cho', 40, 2, N'5-5', N'4-4', 1, 2, 1, 4, 1, 1, CAST(0x0000A4B7015561DD AS DateTime), 0, NULL)
INSERT [dbo].[tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1019, N'Loai 20 cho', 20, 2, N'5-5', N'2-2', 1, 2, 1, 0, 1, 0, CAST(0x0000A4B801020533 AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[tblRoomType] OFF
/****** Object:  Table [dbo].[tblRole]    Script Date: 06/22/2015 17:07:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NOT NULL,
 CONSTRAINT [PK__tblRole__3214EC072FDABDBB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [dbo].[tblRole] ([Id], [Name]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
/****** Object:  Table [dbo].[tblUser]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  Table [dbo].[tblClassroom]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblClassroom] ON
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1042, 1017, N'101', CAST(0x0000A4B900A7775C AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1043, 1017, N'213', CAST(0x0000A4B900A789AA AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1044, 1017, N'310', CAST(0x0000A4B900A7B51A AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1045, 1017, N'312', CAST(0x0000A4B900A7C8E4 AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1046, 1017, N'403', CAST(0x0000A4B900A7DE81 AS DateTime), 0, NULL, NULL, 83)
INSERT [dbo].[tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1047, 1017, N'407', CAST(0x0000A4B900A7F3F9 AS DateTime), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblClassroom] OFF
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 06/22/2015 17:07:35 ******/
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
	[DeviceId] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblUserInfo] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'BaoNQ', N'BaoNQ', N'123', CAST(0x0000A49900000000 AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'Gerardo', N'Gerardo', N'123', CAST(0x0000A49900000000 AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'hungtv', N'hungtv', N'123', CAST(0x0000A49900000000 AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'KhanhKT', N'KhanhKT', N'123', CAST(0x0000A4BA004EBD57 AS DateTime), N'APA91bHtQwK-j4I1Gl8BP3pYVwTqQfGwlqhU2JH_Nh-gDWK2wOHlgFksgIN5WVfYDwRmazskqOHHfG0AV7bDh1EaXNEIBvi6NGV6XWnyEiaxxWfiZVmOhtL-xEzHRq6q2PKCQgddMg5y')
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'LienTTH', N'LienTTH', N'123', CAST(0x0000A49900000000 AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'PhuongLHK', N'PhuongLHK', N'123', CAST(0x0000A49900000000 AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'staff', N'Doan Nguyen', N'01666815718', CAST(0x0000A4BA006CF2DB AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'SuTV', N'SuTV', N'123', CAST(0x0000A4BA00501B9F AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'teacher', N'Minh Chi', N'1666812243', CAST(0x0000A49900000000 AS DateTime), NULL)
INSERT [dbo].[tblUserInfo] ([Username], [FullName], [Phone], [LastLogin], [DeviceId]) VALUES (N'VinhDP', N'VinhDP', N'123', CAST(0x0000A49900000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[tblReport]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblReport] ON
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (5, N'SuTV', 1046, CAST(0x0000A4B900B2BE7A AS DateTime), N'3', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (8, N'SuTV', 1046, CAST(0x0000A4B900B480EC AS DateTime), N'3', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (9, N'SuTV', 1046, CAST(0x0000A4B900B63751 AS DateTime), N'3', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (10, N'KhanhKT', 1042, CAST(0x0000A4BA003E16AF AS DateTime), N'Không cần đổi phòng', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (11, N'KhanhKT', 1042, CAST(0x0000A4BA003F3C24 AS DateTime), N'Không cần đổi phòng', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (12, N'KhanhKT', 1042, CAST(0x0000A4BA003FC661 AS DateTime), N'Không cần đổi phòng', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (13, N'KhanhKT', 1042, CAST(0x0000A4BA0045A406 AS DateTime), N'Không cần đổi phòng', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (14, N'KhanhKT', 1042, CAST(0x0000A4BA00488A3D AS DateTime), N'Không cần đổi phòng', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (15, N'KhanhKT', 1042, CAST(0x0000A4BA004B2977 AS DateTime), N'Không cần đổi phòng', 1)
INSERT [dbo].[tblReport] ([Id], [Username], [ClassRoomId], [CreateTime], [Evaluate], [Status]) VALUES (16, N'KhanhKT', 1042, CAST(0x0000A4BA004C53AE AS DateTime), N'Không cần đổi phòng', 1)
SET IDENTITY_INSERT [dbo].[tblReport] OFF
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblEquipment] ON
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (161, 1, 1042, N'[1]       ', 1, NULL, N'Projector2015', N'11111111111')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (162, 1, 1043, N'[1]       ', 1, NULL, N'Projector2015', N'22222222222')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (163, 1, 1044, N'[1]       ', 1, NULL, N'Projector2015', N'33333333333')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (164, 1, 1045, N'[1]       ', 1, NULL, N'Projector2015', N'44444444444')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (165, 1, 1046, N'[1]       ', 0, NULL, N'Projector2015', N'55555555555')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (166, 1, 1047, N'[1]       ', 1, NULL, N'Projector2015', N'66666666666')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (167, 2, 1042, N'[2]       ', 1, NULL, N'SONY', N'11111111111')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (168, 1, NULL, NULL, 1, NULL, N'SONY', N'22222222222')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (169, 2, 1043, N'[2]       ', 1, NULL, N'SONY', N'33333333333')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (170, 2, 1044, N'[2]       ', 1, NULL, N'SONY', N'44444444444')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (171, 2, 1045, N'[2]       ', 1, NULL, N'SONY', N'55555555555')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (172, 2, 1046, N'[2]       ', 1, NULL, N'SONY', N'66666666666')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (173, 2, 1047, N'[2]       ', 1, NULL, N'SONY', N'22222222222')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (174, 3, 1042, N'[3]       ', 1, NULL, N'DAIKIN', N'11111111111')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (175, 2, NULL, NULL, 1, NULL, N'DAIKIN', N'22222222222')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (176, 3, 1042, N'[3]       ', 1, NULL, N'DAIKIN', N'22222222222')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (177, 3, 1043, N'[3]       ', 1, NULL, N'DAIKIN', N'33333333333')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (178, 3, 1043, N'[3]       ', 1, NULL, N'DAIKIN', N'44444444444')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (179, 3, 1044, N'[3]       ', 1, NULL, N'DAIKIN', N'55555555555')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (180, 3, 1044, N'[3]       ', 1, NULL, N'DAIKIN', N'66666666666')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (181, 3, 1045, N'[3]       ', 1, NULL, N'HITACHI', N'11111111111')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (182, 3, 1045, N'[3]       ', 1, NULL, N'HITACHI', N'22222222222')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (183, 3, 1046, N'[3]       ', 0, NULL, N'HITACHI', N'33333333333')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (184, 3, 1046, N'[3]       ', 1, NULL, N'HITACHI', N'44444444444')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (185, 3, 1047, N'[3]       ', 1, NULL, N'HITACHI', N'55555555555')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (186, 3, 1047, N'[3]       ', 1, NULL, N'HITACHI', N'66666666666')
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (187, 7, 1046, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (188, 8, 1046, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (189, 7, 1046, N'[0,1]     ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (190, 7, 1046, N'[1,1]     ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (191, 7, 1046, N'[0,2]     ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (192, 8, 1046, N'[0,1,0]   ', 0, 0, NULL, NULL)
INSERT [dbo].[tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (193, 8, 1046, N'[0,1,1]   ', 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblEquipment] OFF
/****** Object:  Table [dbo].[tblSchedule]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblSchedule] ON
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1032, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1033, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1034, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1035, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1036, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1037, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1038, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1039, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1040, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1041, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1042, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1043, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1044, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1045, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1046, N'KhanhKT', 1042, 25, NULL, CAST(0x0700D85EAC3A0000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1047, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1048, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1049, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1050, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1051, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1052, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1053, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1054, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1055, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1056, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1057, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1058, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1059, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1060, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1061, N'KhanhKT', 1043, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1062, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1063, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1064, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1065, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1066, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1067, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1068, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1069, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1070, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1071, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1072, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1073, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1074, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1075, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1076, N'SuTV', 1044, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1077, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1078, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1079, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1080, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1081, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1082, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1083, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1084, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1085, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1086, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1087, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1088, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1089, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1090, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1091, N'SuTV', 1045, 25, NULL, CAST(0x07008E7657490000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1092, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1093, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1094, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1095, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1096, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1097, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1098, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1099, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1100, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1101, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1102, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1103, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1104, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1105, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1106, N'KhanhKT', 1045, 25, NULL, CAST(0x07001417C6680000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1107, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1108, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1109, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1110, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1111, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1112, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1113, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1114, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1115, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1116, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1117, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1118, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1119, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1120, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1121, N'SuTV', 1045, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1122, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1123, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1124, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1125, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1126, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1127, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1128, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1129, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1130, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1131, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1132, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1133, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1134, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1135, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1136, N'SuTV', 1046, 25, NULL, CAST(0x0700448E02580000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1137, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1138, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1139, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1140, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1141, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1142, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1143, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1144, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1145, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1146, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1147, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1148, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1149, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1150, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1151, N'KhanhKT', 1047, 25, NULL, CAST(0x0700CA2E71770000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1152, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1153, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x143A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1154, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x153A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1155, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x163A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1156, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x173A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1157, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1A3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1158, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1B3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1159, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1C3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1160, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1D3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1161, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x1E3A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1162, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x213A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1163, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x223A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1164, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x233A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1165, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x243A0B00 AS Date), 1)
INSERT [dbo].[tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date], [IsActive]) VALUES (1166, N'KhanhKT', 1047, 25, NULL, CAST(0x070080461C860000 AS Time), 1, CAST(0x253A0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblSchedule] OFF
/****** Object:  Table [dbo].[tblReportDetail]    Script Date: 06/22/2015 17:07:35 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (165, 5, N'1', N'[1]       ', N'be man hinh', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (183, 5, N'1', N'[3]       ', N'khong lanh', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (187, 8, N'1', NULL, N'gay', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (188, 8, N'1', NULL, N'gay', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (189, 9, N'4', N'[0,1]     ', N'', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (190, 9, N'4', N'[1,1]     ', N'', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (191, 9, N'4', N'[0,2]     ', N'', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (192, 9, N'4', N'[0,1,0]   ', N'', NULL, NULL, 0)
INSERT [dbo].[tblReportDetail] ([EquipmentId], [ReportId], [DamagedLevel], [Position], [Description], [Solution], [ResolveTime], [Status]) VALUES (193, 9, N'4', N'[0,1,1]   ', N'', NULL, NULL, 0)
/****** Object:  ForeignKey [FK_tblClassroom_tblRoomType1]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblClassroom]  WITH CHECK ADD  CONSTRAINT [FK_tblClassroom_tblRoomType1] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[tblRoomType] ([Id])
GO
ALTER TABLE [dbo].[tblClassroom] CHECK CONSTRAINT [FK_tblClassroom_tblRoomType1]
GO
/****** Object:  ForeignKey [FK_tblEquipment_tblClassroom]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblEquipment]  WITH CHECK ADD  CONSTRAINT [FK_tblEquipment_tblClassroom] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblEquipment] CHECK CONSTRAINT [FK_tblEquipment_tblClassroom]
GO
/****** Object:  ForeignKey [FK_tblEquipment_tblEquipmentCategory]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblEquipment]  WITH CHECK ADD  CONSTRAINT [FK_tblEquipment_tblEquipmentCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblEquipmentCategory] ([Id])
GO
ALTER TABLE [dbo].[tblEquipment] CHECK CONSTRAINT [FK_tblEquipment_tblEquipmentCategory]
GO
/****** Object:  ForeignKey [FK_tblReport_tblClassroom]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblClassroom] FOREIGN KEY([ClassRoomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblClassroom]
GO
/****** Object:  ForeignKey [FK_tblReport_tblUser1]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblUser1] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblUser1]
GO
/****** Object:  ForeignKey [FK_tblReportDetail_tblEquipment1]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReportDetail_tblEquipment1] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[tblEquipment] ([Id])
GO
ALTER TABLE [dbo].[tblReportDetail] CHECK CONSTRAINT [FK_tblReportDetail_tblEquipment1]
GO
/****** Object:  ForeignKey [FK_tblReportDetail_tblReport]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReportDetail_tblReport] FOREIGN KEY([ReportId])
REFERENCES [dbo].[tblReport] ([Id])
GO
ALTER TABLE [dbo].[tblReportDetail] CHECK CONSTRAINT [FK_tblReportDetail_tblReport]
GO
/****** Object:  ForeignKey [FK_tblSchedule_tblClassroom]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblClassroom] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[tblClassroom] ([Id])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblClassroom]
GO
/****** Object:  ForeignKey [FK_tblSchedule_tblUser1]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblSchedule_tblUser1] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblSchedule] CHECK CONSTRAINT [FK_tblSchedule_tblUser1]
GO
/****** Object:  ForeignKey [FKA5A810A9A9DD896A]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FKA5A810A9A9DD896A] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FKA5A810A9A9DD896A]
GO
/****** Object:  ForeignKey [FK_tblUserInfo_tblUser]    Script Date: 06/22/2015 17:07:35 ******/
ALTER TABLE [dbo].[tblUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInfo_tblUser] FOREIGN KEY([Username])
REFERENCES [dbo].[tblUser] ([Username])
GO
ALTER TABLE [dbo].[tblUserInfo] CHECK CONSTRAINT [FK_tblUserInfo_tblUser]
GO
