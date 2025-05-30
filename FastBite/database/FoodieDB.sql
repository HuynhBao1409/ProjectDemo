USE [FoodieDB]
GO
/****** Object:  UserDefinedTableType [dbo].[OrderDetails]    Script Date: 25/5/2025 7:33:58 pm ******/
CREATE TYPE [dbo].[OrderDetails] AS TABLE(
	[OrderNo] [varchar](max) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Subject] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](max) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[CardNo] [nvarchar](150) NULL,
	[ExpiryDate] [nvarchar](150) NULL,
	[CvvNo] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[PaymentMode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Username] [nvarchar](150) NULL,
	[Mobile] [nvarchar](12) NULL,
	[Email] [nvarchar](150) NULL,
	[Address] [nvarchar](max) NULL,
	[PostCode] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (102, 11, 1, 7)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (106, 7, 1, 19)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (108, 6, 4, 6)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (110, 10, 1, 6)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (111, 5, 1, 6)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (112, 7, 1, 6)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (117, 12, 1, 19)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (118, 7, 1, 7)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (119, 5, 1, 7)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (1, N'Đồ Uống', N'../Images/Category/de7ddbda-e68e-42cc-a7d3-6c093a41a66e.jpg', 1, CAST(N'2025-02-26T17:51:33.593' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (2, N'Pizza', N'../Images/Category/5433bd57-fcf3-4046-b025-91a6721b6700.png', 1, CAST(N'2025-02-26T19:22:57.350' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (3, N'Gà', N'../Images/Category/ac21874f-2291-41e2-88e5-6ca6f82f767b.jpg', 1, CAST(N'2025-02-26T19:23:12.320' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (4, N'Donut', N'../Images/Category/2222fb18-d156-408b-8b2b-c5368522d04b.png', 1, CAST(N'2025-02-28T12:04:33.653' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (5, N'Hamburger', N'../Images/Category/e4e46e0c-816d-46e9-9db7-d71589acddad.png', 1, CAST(N'2025-02-28T17:23:08.270' AS DateTime))
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [IsActive], [CreatedDate]) VALUES (6, N'Khoai tây', N'../Images/Category/9916804b-0476-41d7-a955-922a39077227.png', 1, CAST(N'2025-03-04T20:29:55.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactId], [Name], [Email], [Subject], [Message], [CreatedDate]) VALUES (2, N'Upin', N'abc03@gamil.com', N'Wow', N'Chưa đủ độ wow', CAST(N'2025-04-07T11:03:50.453' AS DateTime))
INSERT [dbo].[Contact] ([ContactId], [Name], [Email], [Subject], [Message], [CreatedDate]) VALUES (3, N'ABen', N'abc05@gamil.com', N'Đỉnh', N'Mút trai', CAST(N'2025-04-08T15:57:28.710' AS DateTime))
INSERT [dbo].[Contact] ([ContactId], [Name], [Email], [Subject], [Message], [CreatedDate]) VALUES (4, N'Ipin', N'abc04@gamil.com', N'Yes Sir', N'YES YES YES', CAST(N'2025-04-08T15:57:52.547' AS DateTime))
INSERT [dbo].[Contact] ([ContactId], [Name], [Email], [Subject], [Message], [CreatedDate]) VALUES (5, N'Quái vật bánh mì', N'abc03@gamil.com', N'Test', N'Ram Ram', CAST(N'2025-05-01T10:50:55.167' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Content], [ImageUrl], [IsActive], [CreatedDate]) VALUES (16, N'Combo 7up mát lạnh', N'Thưởng thức burger ngon hơn cùng combo 7up tươi mát! Mùa hè này, FastBite hợp tác cùng 7up mang đến cho bạn những phần ăn siêu tiết kiệm, giải khát cực đã. Số lượng có hạn, nhanh tay đừng bỏ lỡ!', N'../Images/News/2c3fe0d1-cfd4-4db7-92a0-053275408fd5.jpg', 1, CAST(N'2025-05-25T18:12:36.190' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [ImageUrl], [IsActive], [CreatedDate]) VALUES (17, N'Giảm giá cực sốc', N'FastBite tung khuyến mãi lớn nhất tháng! Giảm ngay đến 50% cho tất cả combo buổi trưa từ 11h đến 14h mỗi ngày. Cơ hội tuyệt vời để vừa tiết kiệm vừa thưởng thức món ăn yêu thích.', N'../Images/News/61a94ae1-eb93-4faa-a366-24008097cad5.png', 1, CAST(N'2025-05-25T18:12:50.460' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [ImageUrl], [IsActive], [CreatedDate]) VALUES (18, N'Black Friday – Mua 1 tặng 1', N'Duy nhất dịp Black Friday, FastBite triển khai chương trình "Mua 1 tặng 1" áp dụng cho tất cả burger và nước uống. Đặt hàng qua app hoặc đến trực tiếp để nhận ưu đãi khủng.', N'../Images/News/64eca513-900c-4f76-bbcf-197511c85943.jpeg', 1, CAST(N'2025-05-25T18:13:02.373' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [ImageUrl], [IsActive], [CreatedDate]) VALUES (19, N'Taco mới ra lò', N'FastBite chính thức ra mắt món Taco giòn rụm với lớp vỏ ngô vàng ươm và nhân thịt đậm đà, kèm sốt đặc biệt. Món ăn hoàn hảo cho tín đồ yêu vị cay nhẹ và cảm giác bùng nổ trong từng miếng cắn. Thử ngay hôm nay!', N'../Images/News/b1e9c671-d7b1-4283-87b0-82ef062e4219.jpg', 1, CAST(N'2025-05-25T18:14:00.513' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (1, N'551f42f3-f1a8-4525-b5a3-0df574b0414c', 16, 1, 6, N'Đã gửi đi', 6, CAST(N'2025-03-08T15:52:15.467' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (2, N'f72fec24-1dce-4922-9a42-072ce17ed04a', 18, 1, 6, N'Đã giao', 6, CAST(N'2025-03-08T15:52:16.943' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (3, N'9926fdeb-a02d-4305-9136-9d3e5930b84b', 17, 1, 6, N'Đã giao', 6, CAST(N'2025-03-08T15:52:18.303' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (4, N'f81023b6-6bdc-4629-b154-df9508de2f5c', 12, 1, 6, N'Đã giao', 6, CAST(N'2025-03-08T15:52:18.827' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (5, N'ee52fbd8-1923-415a-b357-48166cbbfc59', 7, 1, 6, N'Đã giao', 7, CAST(N'2025-03-08T15:56:40.840' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (6, N'87d9abd6-5553-46d8-ae17-61a8af9c2990', 10, 1, 6, N'Đang xử lý', 7, CAST(N'2025-03-08T15:56:40.840' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (7, N'5ab90e58-db2e-4edc-8f87-77ec526d40f7', 7, 3, 6, N'Đã giao', 8, CAST(N'2025-03-08T15:58:01.453' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (8, N'42bad296-d0c8-439f-a051-11e205956bcd', 9, 5, 6, N'Đã giao', 8, CAST(N'2025-03-08T15:58:01.453' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (9, N'7bff79f2-656d-4ade-b986-ce1d6ea12ddc', 11, 1, 6, N'Đã giao', 9, CAST(N'2025-03-16T15:04:34.750' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (10, N'9686cef4-7292-485c-a8f8-d353960b467b', 8, 1, 6, N'Đã giao', 10, CAST(N'2025-03-16T15:18:08.677' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (11, N'13ce5bb4-9abd-4852-b48a-4a23ab5b2b9b', 16, 1, 6, N'Đã giao', 11, CAST(N'2025-03-16T15:23:56.283' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (12, N'36dd4f85-8001-43dd-b4e1-d006ff9c4920', 10, 1, 7, N'Đã gửi đi', 12, CAST(N'2025-03-16T15:25:54.557' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (13, N'e4b435b2-e042-49cb-81f6-82234ef615e2', 11, 1, 7, N'Đã giao', 13, CAST(N'2025-03-16T15:38:10.900' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (14, N'4fe1cf66-6c7c-4938-a09d-e354da5d1713', 12, 1, 8, N'Đã gửi đi', 14, CAST(N'2025-03-16T16:13:21.773' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (15, N'ebc7a8a4-8db1-45ad-920c-0633ba2cf88a', 18, 1, 8, N'Đang xử lý', 14, CAST(N'2025-03-16T16:13:21.773' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (16, N'5f090983-66b7-46ac-8b91-e5f5cb78d314', 9, 1, 8, N'Đã hủy đơn', 15, CAST(N'2025-03-16T16:17:44.097' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (17, N'c53e30af-345c-4a81-915c-9e86c7c5b2f6', 10, 1, 7, N'Đã hủy đơn', 16, CAST(N'2025-03-16T16:36:47.983' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (18, N'37deeee8-9296-4c97-8518-f430c8568f73', 7, 1, 7, N'Đã giao', 17, CAST(N'2025-03-16T16:45:01.473' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (19, N'f6678a65-70d8-4e19-bdc7-6c3493f41e77', 13, 1, 6, N'Đang xử lý', 18, CAST(N'2025-03-18T10:41:20.230' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (20, N'fe0fa4c1-60ac-4c47-b723-f08bafde552a', 11, 2, 6, N'Đang xử lý', 18, CAST(N'2025-03-18T10:41:20.230' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (21, N'59143b62-4354-453c-958b-9d01b1b278cd', 8, 1, 6, N'Đã hủy đơn', 19, CAST(N'2025-03-18T10:50:11.140' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (22, N'21ee0911-88e7-472c-bc2f-aeb4b6e84784', 16, 1, 8, N'Đã giao', 20, CAST(N'2025-03-18T11:21:41.887' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (23, N'b6179bdf-80db-4ce4-8605-77cb9bacff50', 8, 1, 6, N'Đã giao', 21, CAST(N'2025-03-18T11:34:10.470' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (24, N'9d5f6c0a-7306-4a4c-a348-462fa14311c6', 9, 1, 6, N'Đang xử lý', 22, CAST(N'2025-03-18T11:35:39.537' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (25, N'4b398f41-07f6-4e25-abee-8db0382cf83f', 12, 1, 6, N'Đã hủy đơn', 23, CAST(N'2025-03-18T11:47:48.047' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (26, N'963d4c5a-3979-4acf-ac75-9777afa12e09', 10, 1, 7, N'Đang xử lý', 24, CAST(N'2025-03-18T11:55:29.247' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (27, N'520879e2-0d29-42e2-bf66-67fcd7aef785', 12, 2, 7, N'Đã hủy đơn', 24, CAST(N'2025-03-18T11:55:29.247' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (28, N'5ebc4a41-5e3b-43ad-8203-55034a583919', 18, 1, 7, N'Đã hủy đơn', 24, CAST(N'2025-03-18T11:55:29.247' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (29, N'd1da4498-b01d-435b-a4f3-0b5f54c507e9', 11, 1, 6, N'Đang xử lý', 25, CAST(N'2025-03-18T13:39:42.670' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (30, N'd5821ef3-0627-4c60-a1af-a3e9c7288604', 9, 2, 18, N'Đang xử lý', 26, CAST(N'2025-04-08T11:27:37.053' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (31, N'3d87ac2e-017d-489c-a95e-671312f04e3c', 12, 1, 19, N'Đã hủy đơn', 27, CAST(N'2025-04-14T10:32:49.573' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (32, N'a983481f-497f-4928-96f9-3ae08bf89106', 5, 1, 19, N'Đang xử lý', 27, CAST(N'2025-04-14T10:32:49.573' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (33, N'b6ad3e28-49fd-47f0-84c4-2bb46e8ae2ee', 18, 1, 19, N'Đã gửi đi', 27, CAST(N'2025-04-14T10:32:49.573' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (34, N'e27805f7-b034-44ce-a9ad-4a42d11b796a', 10, 1, 19, N'Đang xử lý', 27, CAST(N'2025-04-14T10:32:49.573' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (35, N'4923c858-1b21-4d08-9dc5-9c384a8b6a6a', 13, 1, 19, N'Đang xử lý', 27, CAST(N'2025-04-14T10:32:49.573' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (36, N'07a71936-5f21-4ef6-a78c-ce48c9fbb54c', 15, 1, 19, N'Đã giao', 27, CAST(N'2025-04-14T10:32:49.577' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (37, N'6316a539-8906-4389-883b-8dde6dcafdfc', 13, 1, 7, N'Đang xử lý', 28, CAST(N'2025-04-16T14:23:40.883' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (38, N'a3ef1b30-a116-400f-b28f-ed0f5b65e730', 6, 1, 7, N'Đã giao', 28, CAST(N'2025-04-16T14:23:40.887' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (39, N'c95e0fc3-79c7-40be-8742-2d1e2a953d2e', 8, 1, 7, N'Đã hủy đơn', 28, CAST(N'2025-04-16T14:23:40.887' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (40, N'b5dcfc9a-4088-44b2-944d-089a2a1f6b5e', 12, 2, 6, N'Đang xử lý', 29, CAST(N'2025-04-18T08:58:29.813' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (41, N'92b7eb0a-6d67-4da0-84ad-f4387090da11', 8, 1, 6, N'Đang xử lý', 29, CAST(N'2025-04-18T08:58:29.813' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (42, N'dfb7985f-4615-4323-8284-49908715e226', 7, 2, 6, N'Đang xử lý', 30, CAST(N'2025-04-18T10:51:18.717' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (43, N'0a295cef-9ffd-4cbe-89d1-225b0bfcfc4d', 11, 1, 7, N'Đã gửi đi', 31, CAST(N'2025-04-18T11:00:05.437' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (44, N'c4cfe760-88a0-4dd8-8639-f9f68a313fbe', 9, 1, 6, N'Đã giao', 32, CAST(N'2025-04-18T11:12:58.993' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (45, N'66abd704-4c5d-4941-bc2f-8ab9460eed9b', 8, 1, 19, N'Đang xử lý', 33, CAST(N'2025-04-18T11:23:06.890' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (46, N'c1f21195-1cb2-4189-9c5a-433c31f21c34', 11, 1, 19, N'Đã gửi đi', 34, CAST(N'2025-04-18T12:18:23.510' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (47, N'2e3122ac-3e88-4b8f-8714-64d70d1d2a71', 7, 1, 19, N'Đã hủy đơn', 35, CAST(N'2025-04-18T12:19:17.160' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (48, N'ef76391e-9781-462e-a0f7-76e39a1ea6d0', 7, 1, 18, N'Đang xử lý', 36, CAST(N'2025-05-12T08:01:19.100' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (49, N'6206e973-301f-4473-8a2a-4be651093e9f', 6, 1, 18, N'Đang xử lý', 37, CAST(N'2025-05-25T18:05:25.680' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (50, N'918934ba-5299-4428-8c0a-83268cb4b017', 16, 2, 18, N'Đang xử lý', 37, CAST(N'2025-05-25T18:05:25.680' AS DateTime))
INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserId], [Status], [PaymentId], [OrderDate]) VALUES (51, N'72968f09-0064-40b9-95ba-2c6e7040553f', 11, 12, 18, N'Đang xử lý', 37, CAST(N'2025-05-25T18:05:25.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (6, N'HUYNHGIABAO', N'**************8545', N'12/2024', 231, N'đá adsấdsadsa', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (7, N'LEEMINHONG', N'**************6948', N'12/2028', 357, N'Test', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (8, N'HUYNHQUOCBAO', N'**************5222', N'05/2028', 349, N'Test', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (9, N'HUYNHGIABAO', N'**************4987', N'12/2025', 265, N'asdsadas', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (10, N'HUYNHGIABAO', N'**************6164', N'12/2025', 231, N'ưqedqư', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (11, N'HUYNHGIABAO', N'**************4544', N'12/2025', 125, N'dsadâsd', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (12, N'HUYNHGIABAO', N'**************6456', N'13/2025', 352, N'ád sâsad', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (13, N'HUYNHGIABAO', N'**************8222', N'11/2026', 352, N'sađâs đá ád sad', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (14, N'', N'', N'', 0, N'úawdsad', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (15, N'', N'', N'', 0, N'123', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (16, N'HUYNHBAO', N'**************2542', N'09/2512', 213, N'avd', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (17, N'', N'', N'', 0, N'kk', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (18, N'', N'', N'', 0, N'sađasadá', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (19, N'HUYNHGIABAO', N'**************1654', N'10/2024', 154, N'ssđf ádá dâssa', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (20, N'HAOBUYNH', N'**************7897', N'03/2351', 123, N'sad ádâsđá', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (21, N'', N'', N'', 0, N'abcs', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (22, N'HUYNHGIABAO', N'**************1231', N'12/2514', 145, N'áđ', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (23, N'', N'', N'', 0, N'123', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (24, N'HUYNHGIABAO', N'**************3212', N'12/2342', 142, N'sadâsda', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (25, N'', N'', N'', 0, N'ád', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (26, N'', N'', N'', 0, N'123e', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (27, N'', N'', N'', 0, N'abcssd', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (28, N'', N'', N'', 0, N'12', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (29, N'HUYNHGIABAO', N'**************3331', N'12/2025', 123, N'ađá', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (30, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (31, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (32, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (33, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (34, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (35, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (36, N'', N'', N'', 0, N'', N'qr')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (37, N'', N'', N'', 0, N'sađeấd', N'cod')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (5, N'Pizza Chesse', N'Đế giòn rụm, phô mai béo, rau củ, thơm ngậy.', CAST(75000.00 AS Decimal(18, 2)), 5, N'Images/Product/2627d3df-f839-4444-85f7-5fcb94783b5b.png', 2, 1, CAST(N'2025-02-28T15:38:19.750' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (6, N'Pizza 4 Vị', N'Đế dày, bốn vị, phô mai, rau củ, hải sản, nấm đậm đà.', CAST(80000.00 AS Decimal(18, 2)), 7, N'Images/Product/202fc542-b64c-4e16-a67f-d2f7681a9887.jpg', 2, 1, CAST(N'2025-02-28T15:40:27.023' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (7, N'Fanta', N'Nước cam sủi bọt, vị ngọt, đá lạnh, thơm lừng.', CAST(20000.00 AS Decimal(18, 2)), 16, N'Images/Product/4c4f9eed-652e-4e4f-9cb6-e4eb3133b41a.jpg', 1, 1, CAST(N'2025-02-28T15:40:59.540' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (8, N'Pepsi', N'Nước cola đậm vị, sủi bọt, đá lạnh, hương thơm.', CAST(20000.00 AS Decimal(18, 2)), 44, N'Images/Product/c71a0640-2b86-4534-9872-bb62f96ae1cd.png', 1, 1, CAST(N'2025-02-28T15:41:29.577' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (9, N'Donut socola', N'Bánh rán socola, ngọt ngào, phủ lớp bóng, mềm thơm.', CAST(35000.00 AS Decimal(18, 2)), 10, N'Images/Product/13dcb680-11d2-4b9e-a5eb-3c0050d85ebd.jpg', 4, 1, CAST(N'2025-02-28T16:00:44.737' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (10, N'Donut Dâu', N'Bánh rán dâu, ngọt nhẹ, phủ dâu, thơm mềm.', CAST(30000.00 AS Decimal(18, 2)), 5, N'Images/Product/aeb32f48-7f3e-47ee-b049-79deae2a4657.jpg', 4, 1, CAST(N'2025-02-28T16:01:34.640' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (11, N'Coca cola', N'Nước cola truyền thống, đậm vị, sủi, đá mát, ít đường.', CAST(20000.00 AS Decimal(18, 2)), 1, N'Images/Product/b652c1b0-ca26-41c8-835b-983f2068a397.jpg', 1, 1, CAST(N'2025-02-28T16:03:07.113' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (12, N'Burger Gà', N'Thịt gà chiên giòn, bánh mềm, rau tươi, sốt đậm đà.', CAST(42000.00 AS Decimal(18, 2)), 7, N'Images/Product/b2356cc6-32d8-4a2a-b8a7-40c1141c90fc.png', 5, 1, CAST(N'2025-02-28T17:24:53.910' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (13, N'Burger x2 Thịt', N'Thịt bò nướng x2 thịt, bánh mềm, rau tươi, sốt đậm đà.', CAST(52000.00 AS Decimal(18, 2)), 10, N'Images/Product/a244b201-3bd0-4c39-a8ee-8e2e893eabc6.jpg', 5, 1, CAST(N'2025-02-28T17:26:06.120' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (14, N'Chicken Nuggest', N'thịt gà ngoài giòn, trong mọng nước vàng ươm, chấm sốt hấp dẫn.', CAST(65000.00 AS Decimal(18, 2)), 10, N'Images/Product/fc2f696c-a34c-42ef-9d8c-f019abb308bf.jpg', 3, 1, CAST(N'2025-02-28T17:32:41.133' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (15, N'Gà rán', N'vỏ giòn rụm, thịt gà mềm, mọng nước, thấm gia vị đậm đà.', CAST(65000.00 AS Decimal(18, 2)), 14, N'Images/Product/633eeadb-31ea-4ede-9799-bf43e2275456.jpg', 3, 1, CAST(N'2025-02-28T17:33:18.880' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (16, N'Sprite', N'Nước chanh sủi, tươi mát, đá lạnh, không màu.', CAST(20000.00 AS Decimal(18, 2)), 15, N'Images/Product/f8e54e48-f110-470f-83b9-d4fc3564a6b5.png', 1, 1, CAST(N'2025-02-28T17:34:15.107' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (17, N'Donut đường', N'Bánh rán đường cơ bản, ngọt nhẹ, lớp phủ, thơm bùi.', CAST(25000.00 AS Decimal(18, 2)), 8, N'Images/Product/ca886207-1694-410f-90eb-a4c20b42430f.jpg', 4, 1, CAST(N'2025-02-28T17:42:46.700' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (18, N'Khoai Tây Chiên', N'Vàng giòn,trong mềm xốt, muối mặn, thơm lừng.', CAST(15000.00 AS Decimal(18, 2)), 16, N'Images/Product/056a329d-a26b-4ba6-85a3-1939e850a00b.png', 6, 1, CAST(N'2025-03-04T21:40:56.030' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreatedDate]) VALUES (19, N'Pizza Địa Trung Hải', N'Đế mỏng giòn, phô mai, ô liu, rau thơm, nấm rơm thơm ngậy', CAST(80000.00 AS Decimal(18, 2)), 7, N'Images/Product/831d974f-f9e9-4184-95af-7f18428509e2.png', 2, 1, CAST(N'2025-05-25T17:48:03.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (6, N'Hào Gia Buỷnh', N'HuynhBao', N'0868986651', N'giabao1409203@gmail.com', N'addas asd as da', N'100121', N'123', N'~/Images/User/5be99d41-cf85-47d5-920e-38639c50c380.jpg', CAST(N'2025-02-28T15:28:03.230' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (7, N'Huỳnh Bảo', N'Buynh', N'12345424342', N'haogiabuynh01@gmail.com', N'sa jdhsaij ghdsaAJ Hsj hsajdhsa', N'526245', N'123', N'Images/User/d7d34d1e-f43e-40fe-9d97-6796fb01724d.jpg', CAST(N'2025-03-02T11:27:33.470' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (8, N'Bảo Gia Huỳnh', N'Hao', N'1235468795', N'haogiabuynh@gmail.com', N'á dá dsa dsad áđá', N'152465', N'123', NULL, CAST(N'2025-03-04T10:00:11.440' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (18, N'Giabao', N'ABen', N'12345432245', N'abc05@gamil.com', N'123dsadấ', N'123533', N'123', NULL, CAST(N'2025-03-21T18:01:49.810' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (19, N'Upin', N'Upin', N'12353123422', N'abc06@gamil.com', N'ád q123123wedqqewe', N'123123', N'123', N'Images/User/2756bd59-c501-4033-9e8e-02a70aebda90.jpg', CAST(N'2025-03-21T18:04:18.803' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4054DD970]    Script Date: 25/5/2025 7:33:58 pm ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534818561A6]    Script Date: 25/5/2025 7:33:58 pm ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
/****** Object:  StoredProcedure [dbo].[Cart_Crud]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Cart_Crud]
    @Action VARCHAR(10),
    @ProductId INT = NULL,
    @Quantity INT = NULL,
    @UserId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    --SELECT
    IF @Action = 'SELECT'
		BEGIN
		    SELECT c.ProductId, p.Name, p.ImageUrl, p.Price, c.Quantity,  c.Quantity AS Qty, p.Quantity AS PrdQty
		    FROM dbo.Carts c
		    INNER JOIN dbo.Products p ON p.ProductId = c.ProductId
		    WHERE c.UserId = @UserId
		END

	--INSERT
    IF @Action = 'INSERT'
		BEGIN
		    INSERT INTO dbo.Carts(ProductId,Quantity,UserId)
			VALUES(@ProductId,@Quantity,@UserId)
		END
	--UPDATE
	IF @Action = 'UPDATE'
	    BEGIN
	        UPDATE dbo.Carts
			SET Quantity = @Quantity
	        WHERE ProductId = @ProductId AND UserId = @UserId
	    END
	--DELETE
	IF @Action = 'DELETE'
	    BEGIN
	        DELETE FROM dbo.Carts
	        WHERE ProductId = @ProductId AND UserId = @UserId
	    END
	--GET BY ID (PRODUCTID & USERID)
    IF @Action = 'GETBYID'
		BEGIN
		    SELECT * FROM dbo.Carts 
		    WHERE ProductId = @ProductId AND UserId = @UserId
		END

END
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Category_Crud]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(10),
	@CategoryId INT = NULL,
	@Name NVARCHAR(100) = NULL,
	@IsActive BIT = false,
	@ImageUrl VARCHAR(MAX) NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT
	IF @Action = 'SELECT'
		BEGIN
			SELECT * FROM dbo.Categories ORDER BY CreatedDate DESC
		END

		--ACTIVECATEGORY
	IF @Action = 'ACTIVECAT'
		BEGIN
			SELECT * FROM dbo.Categories 
			WHERE IsActive = 1
		END

	--INSERT
	IF @Action = 'INSERT'
		BEGIN
			INSERT INTO dbo.Categories(Name, ImageUrl, IsActive, CreatedDate)
			VALUES (@Name, @ImageUrl, @IsActive, GETDATE())
		END
	--UPDATE
	IF @Action = 'UPDATE'
		BEGIN
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
			IF @UPDATE_IMAGE = 'NO'
				BEGIN
					UPDATE dbo.Categories
					SET Name = @Name,IsActive = @IsActive
					WHERE CategoryId = @CategoryId
				END
			ELSE
				BEGIN
					UPDATE dbo.Categories
					SET Name = @Name,ImageUrl = @ImageUrl, IsActive = @IsActive
					WHERE CategoryId = @CategoryId
				END
		END
	--DELETE
	IF @Action = 'DELETE'
		BEGIN
			DELETE FROM dbo.Categories WHERE CategoryId = @CategoryId
		END
	--GETBYID
	IF @Action = 'GETBYID'
		BEGIN
			SELECT * FROM dbo.Categories WHERE CategoryId = @CategoryId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ContactSp]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ContactSp]
	@Action NVARCHAR(10),
	@ContactId INT = NULL,
	@Name NVARCHAR(50) = NULL,
	@Email NVARCHAR(50) = NULL,
	@Subject NVARCHAR(200) = NULL,
	@Message NVARCHAR(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		--INSERT
	IF @Action = 'INSERT'
	BEGIN
		INSERT INTO dbo.Contact(Name, Email, Subject, Message, CreatedDate)
		VALUES (@Name, @Email, @Subject, @Message, GETDATE())
	END

	--SELECT
	IF @Action = 'SELECT'
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], * FROM dbo.Contact
	END

	--DELETE BY ADMIN
	IF @Action = 'DELETE'
	BEGIN
		DELETE FROM dbo.Contact WHERE ContactId = @ContactId
	END    
END
GO
/****** Object:  StoredProcedure [dbo].[Dashboard]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Dashboard]
@Action nvarchar(20) = null
as
begin
	SET NOCOUNT ON;

	-- 1. Categories
	IF @Action = 'CATEGORY'
	BEGIN
		SELECT COUNT(*) FROM dbo.Categories
	END

	-- 2. Products
	IF @Action = 'PRODUCT'
	BEGIN
		SELECT COUNT(*) FROM dbo.Products
	END

	-- 3. Orders
	IF @Action = 'ORDER'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders
	END

	-- 4. Orders Delivered
	IF @Action = 'DELIVERED'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders WHERE Status = N'Đã giao'
	END
	-- 5. Orders Pending
	IF @Action = 'PENDING'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders
		WHERE Status IN (N'Đang xử lý', N'Đã gửi đi')
	END
	-- 6. Orders Cancelled
	IF @Action = 'CANCELLED'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders WHERE Status = N'Đã hủy đơn'
	END
	-- 7. Users
	IF @Action = 'USER'
	BEGIN
		SELECT COUNT(*) FROM dbo.Users
	END

	-- 8. Sold Item Cost
	IF @Action = 'SOLDAMOUNT'
	BEGIN
		SELECT SUM(o.Quantity * p.Price) FROM Orders o
		INNER JOIN Products p ON p.ProductId = o.ProductId
	END
	-- 9. Contact
	IF @Action = 'CONTACT'
	BEGIN
		SELECT COUNT(*) FROM dbo.Contact
	END
	
end
GO
/****** Object:  StoredProcedure [dbo].[Invoice]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Invoice]
	@Action NVARCHAR(10),  
    @PaymentId INT = NULL,  
    @UserId INT = NULL,  
    @OrderDetailsId INT = NULL,  
    @Status NVARCHAR(50) = NULL  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	  -- GET INVOICE BY ID  
	IF @Action = 'INVOICBYID'  
	BEGIN  
		SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], o.OrderNo, p.Name, p.Price, o.Quantity,  
		(p.Price * o.Quantity) AS TotalPrice, o.OrderDate, o.Status, pm.PaymentMode, pm.CardNo 
		FROM Orders o  
		INNER JOIN Products p ON p.ProductId = o.ProductId  
		INNER JOIN Payment pm ON pm.PaymentId = o.PaymentId
		WHERE o.PaymentId = @PaymentId AND o.UserId = @UserId  

		-- Hàng tổng với các cột ép kiểu để khớp với bảng chi tiết
        SELECT CAST(NULL AS BIGINT) AS [SrNo], 
               CAST(NULL AS NVARCHAR(50)) AS OrderNo, 
               'Total' AS Name, 
               CAST(NULL AS DECIMAL(18,2)) AS Price, -- Ép kiểu Price thành DECIMAL
               CAST(NULL AS INT) AS Quantity,        -- Ép kiểu Quantity thành INT
               SUM(p.Price * o.Quantity) AS TotalPrice, 
               CAST(NULL AS DATETIME) AS OrderDate,  -- Ép kiểu OrderDate thành DATETIME
               CAST(NULL AS NVARCHAR(50)) AS Status,  -- Ép kiểu Status thành NVARCHAR
			   CAST(NULL AS NVARCHAR(50)) AS PaymentMode, -- Ép kiểu PaymentMode thành NVARCHAR
               CAST(NULL AS NVARCHAR(50)) AS CardNo       -- Ép kiểu CardNo thành NVARCHAR
        FROM Orders o  
        INNER JOIN Products p ON p.ProductId = o.ProductId  
        WHERE o.PaymentId = @PaymentId AND o.UserId = @UserId
	END  

	-- SELECT ORDER HISTORY  
	IF @Action = 'ODRHISTORY'  
	BEGIN  
		SELECT DISTINCT o.PaymentId, p.PaymentMode, p.CardNo  
		FROM Orders o  
		INNER JOIN Payment p ON p.PaymentId = o.PaymentId  
		WHERE o.UserId = @UserId  
	END  

	-- GET ORDER STATUS  
	IF @Action = 'GETSTATUS'  
	BEGIN  
		SELECT o.OrderDetailsId,  
			   o.OrderNo,  
			   (pr.Price * o.Quantity) AS TotalPrice,  
			   o.Status,  
			   o.OrderDate,  
			   p.PaymentMode,  
			   pr.Name FROM Orders o  
		INNER JOIN Payment p ON p.PaymentId = o.PaymentId  
		INNER JOIN Products pr ON pr.ProductId = o.ProductId  
	END  

	-- GET ORDER STATUS BY ID  
	IF @Action = 'STATUSBYID'  
	BEGIN  
		SELECT OrderDetailsId, Status FROM Orders  
		WHERE OrderDetailsId = @OrderDetailsId  
	END  

	-- UPDATE ORDER STATUS  
	IF @Action = 'UPDSTATUS'  
	BEGIN  
		UPDATE dbo.Orders  
		SET Status = @Status WHERE OrderDetailsId = @OrderDetailsId  
	END  

END
GO
/****** Object:  StoredProcedure [dbo].[News_Crud]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[News_Crud]
    @Action VARCHAR(10),
    @NewsId INT = NULL,
    @Title NVARCHAR(200) = NULL,
    @Content NVARCHAR(MAX) = NULL,
    @ImageUrl NVARCHAR(MAX) = NULL,
    @IsActive BIT = 0,
    @CreatedDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT
    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO News (Title, Content, ImageUrl, IsActive, CreatedDate)
        VALUES (@Title, @Content, @ImageUrl, @IsActive, GETDATE())
        SELECT SCOPE_IDENTITY() AS NewsId
    END

    -- UPDATE
    IF @Action = 'UPDATE'
    BEGIN
        UPDATE News
        SET Title = @Title,
            Content = @Content,
            ImageUrl = @ImageUrl,
            IsActive = @IsActive,
            CreatedDate = @CreatedDate
        WHERE NewsId = @NewsId
    END

    -- DELETE
    IF @Action = 'DELETE'
    BEGIN
        DELETE FROM News WHERE NewsId = @NewsId
    END

    -- SELECT ONE
    IF @Action = 'SELECT'
    BEGIN
        SELECT * FROM News WHERE NewsId = @NewsId
    END

    -- SELECT ALL (for Admin)
    IF @Action = 'SELECTALL'
    BEGIN
        SELECT * FROM News
        ORDER BY CreatedDate DESC
    END

    -- SELECT ACTIVE (for User view)
    IF @Action = 'SELECTACT'
    BEGIN
        SELECT * FROM News
        WHERE IsActive = 1
        ORDER BY CreatedDate DESC
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Crud]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Product_Crud]  
    @Action VARCHAR(20),  
    @ProductId INT = NULL,  
    @Name NVARCHAR(100) = NULL,  
    @Description NVARCHAR(MAX) = NULL,  
    @Price DECIMAL(18,2) = 0,  
    @Quantity INT = NULL,  
    @ImageUrl VARCHAR(MAX) = NULL,  
    @CategoryId INT = NULL,  
    @IsActive BIT = false  
AS  
BEGIN  
    SET NOCOUNT ON;  

    -- SELECT  
    IF @Action = 'SELECT'  
    BEGIN  
        SELECT p.*, c.Name AS CategoryName
        FROM dbo.Products p  
        INNER JOIN dbo.Categories c ON c.CategoryId = p.CategoryId  
        ORDER BY p.CreatedDate DESC;  
    END  

	-- ACTIVEPRODUCT  
    IF @Action = 'ACTIVEPROD'  
    BEGIN  
        SELECT p.*, c.Name AS CategoryName
        FROM dbo.Products p  
        INNER JOIN dbo.Categories c ON c.CategoryId = p.CategoryId  
        WHERE p.IsActive = 1  
    END  

    -- INSERT  
    IF @Action = 'INSERT'  
    BEGIN  
        INSERT INTO dbo.Products(Name, Description, Price, Quantity, ImageUrl, CategoryId, IsActive, CreatedDate)  
        VALUES (@Name, @Description, @Price, @Quantity, @ImageUrl, @CategoryId, @IsActive, GETDATE());  
    END  

    -- UPDATE  
    IF @Action = 'UPDATE'  
    BEGIN  
        DECLARE @UPDATE_IMAGE VARCHAR(20);  
        SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END);  

        IF @UPDATE_IMAGE = 'NO'
        BEGIN
            UPDATE dbo.Products
            SET Name = @Name, Description = @Description, Price = @Price, Quantity = @Quantity,
                CategoryId = @CategoryId, IsActive = @IsActive
            WHERE ProductId = @ProductId;
        END
        ELSE
        BEGIN
            UPDATE dbo.Products
            SET Name = @Name, Description = @Description, Price = @Price, Quantity = @Quantity,  
                ImageUrl = @ImageUrl, CategoryId = @CategoryId, IsActive = @IsActive  
            WHERE ProductId = @ProductId;  
        END  
    END  -- **Đóng đúng khối UPDATE**

    -- UPDATE QUANTITY  
    IF @Action = 'QTYUPDATE'  
    BEGIN  
        UPDATE dbo.Products SET Quantity = @Quantity  
        WHERE ProductId = @ProductId;  
    END 

    -- DELETE
    IF @Action = 'DELETE'
    BEGIN
        DELETE FROM dbo.Products WHERE ProductId = @ProductId;
    END

    -- GETBYID
    IF @Action = 'GETBYID'
    BEGIN
        SELECT * FROM dbo.Products WHERE ProductId = @ProductId;
    END

END  


GO
/****** Object:  StoredProcedure [dbo].[Save_Orders]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_Orders] @tblOrders OrderDetails READONLY  
AS  
BEGIN  
    SET NOCOUNT ON;  

    INSERT INTO Orders (OrderNo, ProductId, Quantity, UserId, Status, PaymentId, OrderDate)  
    SELECT OrderNo, ProductId, Quantity, UserId, Status, PaymentId, OrderDate FROM @tblOrders  
END 
GO
/****** Object:  StoredProcedure [dbo].[Save_Payment]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_Payment]  
    @Name NVARCHAR(100) = NULL,  
    @CardNo NVARCHAR(50) = NULL,  
    @ExpiryDate NVARCHAR(50) = NULL,  
    @Cvv INT = NULL,  
    @Address NVARCHAR(MAX) = NULL,  
    @PaymentMode NVARCHAR(10) = 'card',  
    @InsertedId INT OUTPUT  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  

	-- INSERT  
	BEGIN  
		INSERT INTO dbo.Payment (Name, CardNo, ExpiryDate, CvvNo, Address, PaymentMode)  
		VALUES (@Name, @CardNo, @ExpiryDate, @Cvv, @Address, @PaymentMode);  

		SELECT @InsertedId = SCOPE_IDENTITY();  
	END  


END  
GO
/****** Object:  StoredProcedure [dbo].[SellingReport]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SellingReport]  
    @FromDate Date = null,  
    @ToDate Date = null  
as  
begin  
    SET NOCOUNT ON;  
  
	Select ROW_NUMBER() OVER(ORDER BY MAX(o.OrderDate)) AS [SrNo],u.Name, u.Email,
		SUM(o.Quantity) AS TotalOrders,SUM(o.Quantity * p.Price) AS TotalPrice, 
		CONVERT(varchar, o.OrderDate, 103) AS OrderDateFormatted -- Định dạng ngày/tháng/năm (dd/MM/yyyy)
	From Orders o
	INNER JOIN Products p ON p.ProductId = o.ProductId
	INNER JOIN Users u ON u.UserId = o.UserId
	WHERE CAST(o.OrderDate AS Date) BETWEEN @FromDate AND @ToDate
	GROUP BY u.Name, u.Email, CONVERT(varchar, o.OrderDate, 103) -- Nhóm theo tên, email và ngày
    ORDER BY CONVERT(varchar, o.OrderDate, 103)
end
GO
/****** Object:  StoredProcedure [dbo].[User_Crud]    Script Date: 25/5/2025 7:33:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Crud]
    @Action VARCHAR(20),
    @UserId INT = NULL,
    @Name nvarchar(50) = null,
    @Username nvarchar(50) = null,
    @Mobile nvarchar(50) = null,
    @Email nvarchar(50) = null,
    @Address nvarchar(max) = null,
    @PostCode nvarchar(50) = null,
    @Password nvarchar(50) = null,
    @ImageUrl varchar(max) = null
AS
BEGIN
    SET NOCOUNT ON;

    --SELECT FOR LOGIN
    IF @Action = 'SELECT4LOGIN'
    BEGIN
        SELECT * FROM dbo.Users WHERE Username = @Username and Password = @Password
    END

    --SELECT FOR USER PROFILE
    IF @Action = 'SELECT4PROFILE'
		BEGIN
		    SELECT * FROM dbo.Users WHERE UserId = @UserId
		END

    -- Insert (REGISTRATION)
    IF @Action = 'INSERT'
		BEGIN
		    Insert into dbo.Users (Name, Username, Mobile, Email, Address, PostCode, Password, ImageUrl, CreatedDate)
		    values (@Name, @Username, @Mobile, @Email, @Address, @PostCode, @Password, @ImageUrl, GETDATE())
		END
	--UPDATE USER PROFILE
	IF @Action = 'UPDATE'
		BEGIN
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
			IF @UPDATE_IMAGE = 'NO'
			    BEGIN
			        UPDATE dbo.Users
			        SET Name = @Name, Username = @Username, Mobile = @Mobile, Email = @Email, Address = @Address,
			            PostCode = @PostCode
			        WHERE UserId = @UserId
			    END
			ELSE
				BEGIN
				    UPDATE dbo.Users
				    SET Name = @Name, Username = @Username, Mobile = @Mobile, Email = @Email, Address = @Address,
						PostCode = @PostCode, ImageUrl = @ImageUrl
				    WHERE UserId = @UserId
				END
		END
	-- SELECT FOR ADMIN
	IF @Action = 'SELECT4ADMIN'
	    BEGIN
	        SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], UserId, Name,
	               Username, Password, Email, CreatedDate
	        FROM Users
	    END
	
	-- DELETE BY ADMIN
	IF @Action = 'DELETE'
	    BEGIN
	        DELETE FROM dbo.Users WHERE UserId = @UserId
	    END
	-- SELECT BY EMAIL
    IF @Action = 'SELECTBYEMAIL'
    BEGIN
        SELECT * FROM dbo.Users WHERE Email = @Email
    END

    -- UPDATE PASSWORD
    IF @Action = 'UPDATEPASSWORD'
    BEGIN
        UPDATE dbo.Users
        SET Password = @Password
        WHERE Email = @Email
    END

END
GO
