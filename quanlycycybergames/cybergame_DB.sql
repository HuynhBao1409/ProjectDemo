USE [QuanLyCYBERGAMES]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [varchar](15) NOT NULL,
	[ID_DV] [varchar](10) NOT NULL,
	[soluong] [varchar](10) NULL,
	[tongGia] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[ID_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[ID_DV] [varchar](10) NOT NULL,
	[TenDV] [nvarchar](30) NULL,
	[AnhSP] [nvarchar](max) NULL,
	[GiaBan] [money] NULL,
	[ID_Mathang] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [varchar](15) NOT NULL,
	[ngayDatHang] [date] NULL,
	[ID_KhachHang] [varchar](10) NULL,
	[tongGia] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KhachHang] [varchar](10) NOT NULL,
	[TenKhachHang] [nvarchar](30) NULL,
	[SDT] [varchar](10) NULL,
	[GioiTinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_KhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[ID_Mathang] [varchar](10) NOT NULL,
	[TenMatHang] [nvarchar](30) NULL,
	[SoLuong] [varchar](10) NULL,
	[TinhTrang] [nvarchar](30) NULL,
	[NgayNhap] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Mathang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[May]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[May](
	[ID_May] [varchar](10) NOT NULL,
	[TenMay] [nvarchar](30) NULL,
	[GiaMay] [varchar](10) NULL,
	[HoatDong] [bit] NULL,
	[ThoiGianMo] [datetime] NULL,
	[ThoiGianTat] [datetime] NULL,
	[TongTien] [money] NULL,
	[ID_TaiKhoan] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_May] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 14/4/2025 9:03:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID_TaiKhoan] [varchar](10) NOT NULL,
	[TenTaiKhoan] [nvarchar](20) NULL,
	[Matkhau] [varchar](20) NULL,
	[ThoiGianNap] [datetime] NULL,
	[SoTienNap] [money] NULL,
	[ID_KhachHang] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DonHang] ([MaDH], [ngayDatHang], [ID_KhachHang], [tongGia]) VALUES (N'1', CAST(N'2024-02-12' AS Date), N'2', NULL)
GO
INSERT [dbo].[KhachHang] ([ID_KhachHang], [TenKhachHang], [SDT], [GioiTinh]) VALUES (N'1', N'Bao', N'1234567890', 1)
INSERT [dbo].[KhachHang] ([ID_KhachHang], [TenKhachHang], [SDT], [GioiTinh]) VALUES (N'2', N'Buynh', N'23454678', 1)
INSERT [dbo].[KhachHang] ([ID_KhachHang], [TenKhachHang], [SDT], [GioiTinh]) VALUES (N'4', N'Bao', N'1234567898', 1)
GO
INSERT [dbo].[Kho] ([ID_Mathang], [TenMatHang], [SoLuong], [TinhTrang], [NgayNhap]) VALUES (N'1', N'tao', N'3', N'good', CAST(N'2024-04-14' AS Date))
GO
INSERT [dbo].[May] ([ID_May], [TenMay], [GiaMay], [HoatDong], [ThoiGianMo], [ThoiGianTat], [TongTien], [ID_TaiKhoan]) VALUES (N'1', N'PC1', N'5000', 1, CAST(N'2024-05-22T01:00:00.000' AS DateTime), CAST(N'2024-05-22T03:00:00.000' AS DateTime), NULL, N'1')
INSERT [dbo].[May] ([ID_May], [TenMay], [GiaMay], [HoatDong], [ThoiGianMo], [ThoiGianTat], [TongTien], [ID_TaiKhoan]) VALUES (N'2', N'PC2', N'15000', 1, CAST(N'2024-05-22T01:00:00.000' AS DateTime), CAST(N'2024-05-22T04:00:00.000' AS DateTime), NULL, N'2')
INSERT [dbo].[May] ([ID_May], [TenMay], [GiaMay], [HoatDong], [ThoiGianMo], [ThoiGianTat], [TongTien], [ID_TaiKhoan]) VALUES (N'3', N'PC3', N'5000', NULL, CAST(N'2024-05-31T02:30:00.000' AS DateTime), CAST(N'2024-05-31T05:00:00.000' AS DateTime), 12500.0000, N'4')
GO
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [TenTaiKhoan], [Matkhau], [ThoiGianNap], [SoTienNap], [ID_KhachHang]) VALUES (N'1', N'BaoHuynh', N'123', CAST(N'2024-05-22T01:00:00.000' AS DateTime), 30000.0000, N'1')
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [TenTaiKhoan], [Matkhau], [ThoiGianNap], [SoTienNap], [ID_KhachHang]) VALUES (N'2', N'BaoHuynh1', N'1234', CAST(N'2024-05-22T01:00:00.000' AS DateTime), 5000.0000, N'2')
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [TenTaiKhoan], [Matkhau], [ThoiGianNap], [SoTienNap], [ID_KhachHang]) VALUES (N'4', N'BaoHuynh2', N'1234', CAST(N'2024-05-30T01:00:00.000' AS DateTime), 7500.0000, N'2')
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [TenTaiKhoan], [Matkhau], [ThoiGianNap], [SoTienNap], [ID_KhachHang]) VALUES (N'Admin', N'Admin', N'123', NULL, NULL, N'1')
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([ID_DV])
REFERENCES [dbo].[DichVu] ([ID_DV])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD FOREIGN KEY([ID_Mathang])
REFERENCES [dbo].[Kho] ([ID_Mathang])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[KhachHang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[May]  WITH CHECK ADD FOREIGN KEY([ID_TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([ID_TaiKhoan])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[KhachHang] ([ID_KhachHang])
GO
