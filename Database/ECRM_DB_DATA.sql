USE [ecrm]
GO
SET IDENTITY_INSERT [tblEquipmentCategory] ON 

INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (1, N'Máy chiếu', 3000)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (2, N'Tivi', 0)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (3, N'Máy lạnh', 6000)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (4, N'Máy quạt', 0)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (5, N'Loa', 0)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (6, N'Bóng đèn', 0)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (7, N'Bàn', 0)
INSERT [tblEquipmentCategory] ([Id], [Name], [UsingTime]) VALUES (8, N'Ghế', 0)
SET IDENTITY_INSERT [tblEquipmentCategory] OFF
SET IDENTITY_INSERT [tblRoomType] ON 

INSERT [tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1015, NULL, 30, 3, N'5-5-5', N'2-2-2', 1, 0, 1, 1, 1, 1, CAST(N'2015-06-10 00:13:39.373' AS DateTime), 0, NULL)
INSERT [tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1016, NULL, 34, 2, N'5-5', N'3-3', 1, 2, 1, 0, 0, 1, CAST(N'2015-06-10 08:10:18.327' AS DateTime), 0, NULL)
INSERT [tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1017, NULL, 45, 2, N'5-5', N'3-2', 1, 2, 1, 2, 0, 1, CAST(N'2015-06-13 12:14:04.220' AS DateTime), 0, NULL)
INSERT [tblRoomType] ([Id], [Name], [Slots], [VerticalRows], [HorizontalRows], [NumberOfSlotsEachHRows], [Projector], [AirConditioning], [Bulb], [Fan], [Speaker], [Television], [CreateTime], [IsDelete], [UpdateTime]) VALUES (1018, NULL, 40, 2, N'5-5', N'4-4', 1, 2, 1, 4, 1, 1, CAST(N'2015-06-14 20:42:56.097' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [tblRoomType] OFF
SET IDENTITY_INSERT [tblClassroom] ON 

INSERT [tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1034, 1015, N'101', CAST(N'2015-06-10 03:56:53.043' AS DateTime), 0, NULL, 1, NULL)
INSERT [tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1035, 1016, N'102', CAST(N'2015-06-13 12:15:34.627' AS DateTime), 0, NULL, 1, NULL)
INSERT [tblClassroom] ([Id], [RoomTypeId], [Name], [CreateTime], [IsDelete], [UpdateTime], [IsAllInformation], [DamagedLevel]) VALUES (1036, 1017, N'103', CAST(N'2015-06-13 12:16:14.033' AS DateTime), 0, NULL, 1, NULL)
SET IDENTITY_INSERT [tblClassroom] OFF
SET IDENTITY_INSERT [tblEquipment] ON 

INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (98, 1, 1036, N'[1]       ', 1, 0, NULL, NULL)
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (99, 3, 1036, N'[3]       ', 1, 0, NULL, NULL)
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (100, 3, 1036, N'[3]       ', 1, 0, NULL, NULL)
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (102, 1, 1035, N'[1]       ', 1, NULL, N'Projector2015', N'ASD1333223')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (103, 1, 1034, N'[1]       ', 1, NULL, N'Projector2015', N'XXX1234124')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (104, 2, 1035, N'[2]       ', 1, NULL, N'SONY', N'BRAVA123123')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (105, 3, 1035, N'[3]       ', 1, NULL, N'DAIKIN', N'DAK123123')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (106, 3, 1035, N'[3]       ', 1, NULL, N'DAIKIN', N'DAK454545')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (107, 1, NULL, NULL, 1, NULL, N'ProjectorJapan', N'PJT987123122')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (108, 2, 1036, N'[2]       ', 1, NULL, N'SONYBRAVA', N'SN234234')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (109, 2, NULL, NULL, 1, NULL, N'SONY', N'HIHI21312312')
INSERT [tblEquipment] ([Id], [CategoryId], [ClassroomId], [Position], [Status], [TimeRemain], [Name], [SerialNumber]) VALUES (110, 3, NULL, NULL, 1, NULL, N'HITACHI', N'HTC213123')
SET IDENTITY_INSERT [tblEquipment] OFF
SET IDENTITY_INSERT [tblRole] ON 

INSERT [tblRole] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [tblRole] ([Id], [Name]) VALUES (2, N'Staff')
INSERT [tblRole] ([Id], [Name]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [tblRole] OFF
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'admin', 1, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'BaoNQ', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'Gerardo', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'hungtv', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'LienTTH', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'PhuongLHK', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'staff', 2, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'SuTV', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'teacher', 3, N'123456', 1)
INSERT [tblUser] ([Username], [RoleId], [Password], [Status]) VALUES (N'VinhDP', 3, N'123456', 1)
INSERT [tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'staff', N'Doan Nguyen', N'01666815718', CAST(N'2015-01-06 00:00:00.000' AS DateTime))
INSERT [tblUserInfo] ([Username], [FullName], [Phone], [LastLogin]) VALUES (N'teacher', N'Minh Chi', N'1666812243', CAST(N'2015-05-15 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [tblSchedule] ON 

INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (185, N'PhuongLHK', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 2, CAST(N'2015-05-12' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (186, N'SuTV', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (187, N'PhuongLHK', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 2, CAST(N'2015-05-14' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (188, N'SuTV', 1034, 30, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (189, N'PhuongLHK', 1034, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (190, N'PhuongLHK', 1034, 30, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (191, N'SuTV', 1034, 30, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (192, N'LienTTH', 1034, 30, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (193, N'LienTTH', 1034, 30, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (194, N'LienTTH', 1034, 30, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (195, N'LienTTH', 1034, 30, NULL, CAST(N'10:30:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (196, N'SuTV', 1034, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (197, N'PhuongLHK', 1034, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (198, N'Gerardo', 1034, 30, NULL, CAST(N'12:30:00' AS Time), 2, CAST(N'2015-05-13' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (199, N'PhuongLHK', 1034, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (200, N'Gerardo', 1034, 30, NULL, CAST(N'12:30:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (201, N'VinhDP', 1034, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (202, N'VinhDP', 1034, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (203, N'VinhDP', 1034, 30, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (204, N'VinhDP', 1034, 30, NULL, CAST(N'14:15:00' AS Time), 2, CAST(N'2015-05-15' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (205, N'BaoNQ', 1034, 30, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (206, N'BaoNQ', 1034, 30, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (207, N'BaoNQ', 1034, 30, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (208, N'BaoNQ', 1034, 30, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (209, N'PhuongLHK', 1035, 34, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-12' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (210, N'PhuongLHK', 1035, 34, NULL, CAST(N'08:45:00' AS Time), 1, CAST(N'2015-05-14' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (211, N'Gerardo', 1035, 34, NULL, CAST(N'14:15:00' AS Time), 1, CAST(N'2015-05-13' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (212, N'VinhDP', 1035, 34, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-15' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (213, N'hungtv', 1036, 45, NULL, CAST(N'08:45:00' AS Time), 2, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (214, N'hungtv', 1036, 45, NULL, CAST(N'12:30:00' AS Time), 2, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (215, N'hungtv', 1036, 45, NULL, CAST(N'16:00:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
INSERT [tblSchedule] ([Id], [Username], [ClassroomId], [NumberOfStudents], [Note], [TimeFrom], [Slots], [Date]) VALUES (217, N'hungtv', 1034, 25, NULL, CAST(N'07:00:00' AS Time), 1, CAST(N'2015-05-11' AS Date))
SET IDENTITY_INSERT [tblSchedule] OFF
