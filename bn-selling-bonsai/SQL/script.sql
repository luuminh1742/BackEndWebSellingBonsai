USE [master]
GO
/****** Object:  Database [SellingBonsai]    Script Date: 10/28/2021 8:23:49 PM ******/
CREATE DATABASE [SellingBonsai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SellingBonsai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SellingBonsai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SellingBonsai_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SellingBonsai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SellingBonsai] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SellingBonsai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SellingBonsai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SellingBonsai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SellingBonsai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SellingBonsai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SellingBonsai] SET ARITHABORT OFF 
GO
ALTER DATABASE [SellingBonsai] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SellingBonsai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SellingBonsai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SellingBonsai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SellingBonsai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SellingBonsai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SellingBonsai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SellingBonsai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SellingBonsai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SellingBonsai] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SellingBonsai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SellingBonsai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SellingBonsai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SellingBonsai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SellingBonsai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SellingBonsai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SellingBonsai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SellingBonsai] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SellingBonsai] SET  MULTI_USER 
GO
ALTER DATABASE [SellingBonsai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SellingBonsai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SellingBonsai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SellingBonsai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SellingBonsai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SellingBonsai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SellingBonsai] SET QUERY_STORE = OFF
GO
USE [SellingBonsai]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](255) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[RecipientName] [nvarchar](255) NOT NULL,
	[RecipientPhone] [varchar](15) NOT NULL,
	[RecipientAddress] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Shipping] [int] NULL,
	[Subtotal] [int] NULL,
	[Total] [int] NULL,
	[AtStatusCode] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[BillId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillStatus]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NOT NULL,
	[StatusName] [nvarchar](255) NOT NULL,
	[Code] [tinyint] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [text] NULL,
	[Price] [int] NULL,
	[Discount] [smallint] NULL,
	[ShortDescription] [nvarchar](255) NULL,
	[ProductDetail] [text] NULL,
	[Quantity] [smallint] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Star] [smallint] NULL,
	[Content] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/28/2021 8:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [RoleCode], [Email], [Password], [FullName], [Phone], [Address], [Status]) VALUES (1, N'ADMIN', N'admin@gmail.com', N'00000000', N'Lưu Bá Minh', N'0999999999', N'Hà Lội', 1)
INSERT [dbo].[Account] ([Id], [RoleCode], [Email], [Password], [FullName], [Phone], [Address], [Status]) VALUES (2, N'CLIENT', N'minhit@gmail.com', N'11111111', N'Anh Minh', N'0111111111', N'Yên Hùng - Yên Định - Thanh Hóa', 1)
INSERT [dbo].[Account] ([Id], [RoleCode], [Email], [Password], [FullName], [Phone], [Address], [Status]) VALUES (3, N'CLIENT', N'demo@gmail.com', N'00000000', N'Demo', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Id], [AccountId], [RecipientName], [RecipientPhone], [RecipientAddress], [Note], [Shipping], [Subtotal], [Total], [AtStatusCode]) VALUES (13, 2, N'Anh Minh', N'0111111111', N'Yên Hùng - Yên Định - Thanh Hóa', N'', 30000, 1250000, 1280000, 1)
INSERT [dbo].[Bill] ([Id], [AccountId], [RecipientName], [RecipientPhone], [RecipientAddress], [Note], [Shipping], [Subtotal], [Total], [AtStatusCode]) VALUES (14, 2, N'Anh Minh', N'0111111111', N'Yên Hùng - Yên Định - Thanh Hóa', N'', 30000, 900000, 930000, 3)
INSERT [dbo].[Bill] ([Id], [AccountId], [RecipientName], [RecipientPhone], [RecipientAddress], [Note], [Shipping], [Subtotal], [Total], [AtStatusCode]) VALUES (15, 2, N'Anh Minh', N'0111111111', N'Yên Hùng - Yên Định - Thanh Hóa', N'', 30000, 1675000, 1705000, 2)
INSERT [dbo].[Bill] ([Id], [AccountId], [RecipientName], [RecipientPhone], [RecipientAddress], [Note], [Shipping], [Subtotal], [Total], [AtStatusCode]) VALUES (16, 2, N'Anh Minh', N'0111111111', N'Yên Hùng - Yên Định - Thanh Hóa', N'', 30000, 949000, 979000, 4)
INSERT [dbo].[Bill] ([Id], [AccountId], [RecipientName], [RecipientPhone], [RecipientAddress], [Note], [Shipping], [Subtotal], [Total], [AtStatusCode]) VALUES (17, 2, N'Anh Minh', N'0111111111', N'Yên Hùng - Yên Định - Thanh Hóa', N'', 30000, 199000, 229000, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (21, 7, 13, N'Cây cọ nhật', 350000, 1, N'chau-cay-co-nhat-dep.jpg', 0)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (22, 8, 13, N'Cây đại lộc', 1000000, 1, N'cay-dai-loc-500x600.jpg', 10)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (23, 8, 14, N'Cây đại lộc', 1000000, 1, N'cay-dai-loc-500x600.jpg', 10)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (24, 14, 15, N'Cây trầu bà lá xẻ', 500000, 1, N'Cay-trau-ba-la-xe.jpg', 0)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (25, 15, 15, N'Cây lưỡi cọp', 700000, 1, N'Cay-luoi-cop-3.jpg', 0)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (26, 13, 15, N'Cây đại lan', 500000, 1, N'cay-dai-lan-1.jpg', 5)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (27, 22, 16, N'Cây cau hawai', 499000, 1, N'16010292_1618383151511320_732240845_o-600x600.jpg', 0)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (28, 20, 16, N'Cây chuối cảnh', 450000, 1, N'cay-chuoi-canh-1-500x600.jpg', 0)
INSERT [dbo].[BillDetail] ([Id], [ProductId], [BillId], [ProductName], [Price], [Quantity], [Image], [Discount]) VALUES (29, 28, 17, N'Cây phỉ thúy', 199000, 1, N'cay-phi-thuy-dep-2.jpg', 0)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[BillStatus] ON 

INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (56, 13, N'Order Success', 0, CAST(N'2021-10-28T20:05:30.827' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (57, 13, N'Cancel order', 1, CAST(N'2021-10-28T20:06:44.343' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (58, 13, N'Order confirmed', 2, CAST(N'2021-10-28T20:05:31.180' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (59, 13, N'Delivery in progress', 3, CAST(N'2021-10-28T20:05:31.217' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (60, 13, N'Delivery successful', 4, CAST(N'2021-10-28T20:05:31.573' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (61, 14, N'Order Success', 0, CAST(N'2021-10-28T20:05:38.283' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (62, 14, N'Cancel order', 1, CAST(N'2021-10-28T20:05:38.390' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (63, 14, N'Order confirmed', 2, CAST(N'2021-10-28T20:07:33.620' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (64, 14, N'Delivery in progress', 3, CAST(N'2021-10-28T20:11:10.650' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (65, 14, N'Delivery successful', 4, CAST(N'2021-10-28T20:05:38.967' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (66, 15, N'Order Success', 0, CAST(N'2021-10-28T20:05:50.670' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (67, 15, N'Cancel order', 1, CAST(N'2021-10-28T20:05:50.827' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (68, 15, N'Order confirmed', 2, CAST(N'2021-10-28T20:09:10.280' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (69, 15, N'Delivery in progress', 3, CAST(N'2021-10-28T20:05:51.190' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (70, 15, N'Delivery successful', 4, CAST(N'2021-10-28T20:05:51.530' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (71, 16, N'Order Success', 0, CAST(N'2021-10-28T20:06:04.010' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (72, 16, N'Cancel order', 1, CAST(N'2021-10-28T20:06:04.303' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (73, 16, N'Order confirmed', 2, CAST(N'2021-10-28T20:11:04.063' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (74, 16, N'Delivery in progress', 3, CAST(N'2021-10-28T20:11:18.220' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (75, 16, N'Delivery successful', 4, CAST(N'2021-10-28T20:11:48.057' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (76, 17, N'Order Success', 0, CAST(N'2021-10-28T20:06:14.133' AS DateTime), 1)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (77, 17, N'Cancel order', 1, CAST(N'2021-10-28T20:06:14.177' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (78, 17, N'Order confirmed', 2, CAST(N'2021-10-28T20:06:14.520' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (79, 17, N'Delivery in progress', 3, CAST(N'2021-10-28T20:06:14.780' AS DateTime), 0)
INSERT [dbo].[BillStatus] ([Id], [BillId], [StatusName], [Code], [ModifiedDate], [Status]) VALUES (80, 17, N'Delivery successful', 4, CAST(N'2021-10-28T20:06:14.853' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[BillStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (7, 1, N'Cây cọ nhật', N'chau-cay-co-nhat-dep.jpg', 350000, 0, N'Cây cọ nhật đã được nhiều người biết đến với vẻ đẹp thanh lịch thường được ưa chuộng đặt ở trong phòng khách, môi trường có ánh sáng kém thích hợp ở các văn phòng có điều hòa đều có khả năng phát triển tươi tốt.', N'<p><a href="https://cayvahoa.net/cay-co-nhat/">C&acirc;y c? nh?t</a>&nbsp;d&atilde; du?c nhi?u ngu?i bi?t d?n v?i v? d?p thanh l?ch thu?ng du?c ua chu?ng d?t ? trong ph&ograve;ng kh&aacute;ch, m&ocirc;i tru?ng c&oacute; &aacute;nh s&aacute;ng k&eacute;m th&iacute;ch h?p ? c&aacute;c van ph&ograve;ng c&oacute; di?u h&ograve;a d?u c&oacute; kh? nang ph&aacute;t tri?n tuoi t?t. Ngu?i ta thu?ng ch?n tr?ng c&acirc;y c? c?nh trong ch?u composite d? tang v? d?p sang tr?ng, thanh l?ch gi&uacute;p can ph&ograve;ng tr? n&ecirc;n d?p m?t c&aacute;ch d?c d&aacute;o, cao c?p.</p>

<p>Tru?c ti&ecirc;n, ch&uacute;ng t&ocirc;i gi?i thi?u d?n v?i b?n c&acirc;y c? nh?t c&ograve;n du?c g?i v?i nhi?u t&ecirc;n kh&aacute;c nhu: c?y k&egrave; nh?t, c? l&aacute; tr&ograve;n. T&ecirc;n khoa h?c &ldquo;Livistona rotundifolia&rdquo;, h? c&acirc;y cau &ldquo;Arecaceae&rdquo; c&oacute; ngu?n g?c xu?t x? t? Nh?t B?n. Ngu?i ta d&atilde; ph&aacute;t hi?n ra v? d?p xanh mu?t c?a c?, ph?n t&aacute;n l&agrave; h&igrave;nh chi?c qu?t trong r?t thu h&uacute;t t?m m?t khi du?c trung b&agrave;y d? b&agrave;n, thu vi?n s&aacute;ch, ban c&ocirc;ng, hi&ecirc;n nh&agrave;, ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m vi?c,&hellip;n&oacute; gi&uacute;p cho c&aacute;c c&ocirc;ng tr&igrave;nh ki?n tr&uacute;c tang t&iacute;nh th?m m? cao c?p.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/c%E1%BB%8D-nh%E1%BA%ADt.png" style="height:833px; width:545px" /></p>

<p><strong>Nh?ng di?m n?i b?t c?a c&acirc;y c? nh?t</strong></p>

<p>L&agrave; m?t trong nh?ng lo&agrave;i th?c v?t h? cau ph&aacute;t tri?n r?t t?t ? v&ugrave;ng nhi?t d?i ?m. Ð?i v?i nh?ng v&ugrave;ng s&ocirc;ng nu?c th&igrave; c&acirc;y c? c&oacute; th? ph&aacute;t tri?n nhanh, tuoi t?t th&igrave; d&acirc;y l&agrave; m?t lo?i c&acirc;y c?nh, c&acirc;y n?i th?t th&iacute;ch h?p cho m?i kh&ocirc;ng gian tr? n&ecirc;n d?p thanh tao, d?m ch?t qu&ecirc; huong khi k?t h?p nhi?u y?u t? s? mang d?n cho b?n m?t can ph&ograve;ng tho m?ng, sang tr?ng th? hi?n du?c ch?t ri&ecirc;ng trong phong c&aacute;ch trang tr&iacute; n?i th?t. Y?u t? n?i b?t c?a c&acirc;y c? nh?t du?c nhi?u ngu?i ch?n tr?ng l&agrave; ch&uacute;ng c&oacute; kh? nang s?ng b?n b?, v?i m&agrave;u xanh c?a l&aacute; d?p tr&agrave;n d?y nang lu?ng, s?c s?ng d?o dai, kh?e m?nh v&agrave; trong phong th?y ngu?i ta c&ograve;n c&oacute; quan ni?m mang d?n s?c s?ng d?o dai, kh?e m?nh cho ngu?i m?nh Th? v&agrave; m?nh Kim. Ch&iacute;nh v&igrave; th?, nhi?u ngu?i d&atilde; bi?t du?c uu di?m n&agrave;y thu?ng ch?n l&agrave;m m&oacute;n qu&agrave; t?ng cho nh?ng ngu?i th&acirc;n y&ecirc;u, b?n b&egrave; v?i &yacute; nghia l&agrave; ch&uacute;c cho ngu?i b?n lu&ocirc;n kh?e m?nh.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/chau-cay-co-nhat-dep.jpg" style="height:500px; width:500px" /></p>

<p><strong>Ð?c di?m sinh th&aacute;i</strong></p>

<ul>
	<li>C? nh?t l&agrave; lo&agrave;i c&oacute; s?c s?ng l&acirc;u nam, c&oacute; th? s?ng ? m&ocirc;i tru?ng thi?u &aacute;nh s&aacute;ng v&agrave; kh? nang ch?u h?n r?t t?t.</li>
	<li>Th&iacute;ch h?p tr?ng c? trong nh&agrave; ho?c ngo&agrave;i tr?i, c&acirc;y ph&ugrave; h?p v?i nh?ng ngu?i b?n r?n.</li>
	<li>T?c d? sinh tru?ng ch?m</li>
	<li>Khi c&ograve;n non v&agrave; tru?ng th&agrave;nh th&igrave; c&acirc;y d?u kh&ocirc;ng ua &aacute;nh s&aacute;ng m?nh, chi?u tr?c ti?p v&igrave; th? b?n n&ecirc;n d?t c&acirc;y ? noi &iacute;t b? &aacute;nh s&aacute;ng m?t tr?i chi?u tr?c ti?p v&agrave;o.</li>
	<li>M?t ng&agrave;y ch&uacute;ng ta c&oacute; th? dua c&acirc;y ra ngo&agrave;i &aacute;nh s&aacute;ng kho?ng 6 &ndash; 8 ti?ng d? d?m b?o l&aacute; c&acirc;y c&oacute; m&agrave;u xanh d?p, kh? nang ph&aacute;t tri?n t?t hon.</li>
	<li>Nhu c?u nu?c ? c&acirc;y l?n hon so v?i m?t s? lo&agrave;i c&acirc;y kh&aacute;c tr?ng trong nh&agrave;, ch&uacute;ng ta n&ecirc;n tu?i c&acirc;y kho?ng 3 l?n/ tu?n t&ugrave;y v&agrave;o di?u ki?n th?i ti?t. Tuy nhi&ecirc;n, n&ecirc;n tu?i cho c&acirc;y khi m?t d?t tr&ecirc;n ch?u d&atilde; kh&ocirc;, n?u tu?i qu&aacute; nhi?u khi?n c&acirc;y b? ng?p &uacute;ng, th?i khi?n c&acirc;y b? ch?t.</li>
	<li>Ð?t tr?ng ph&ugrave; h?p v?i lo?i d?t th?t, d?t m&ugrave;n gi&agrave;u ch?t h?u co v&agrave; c&oacute; kh? nang tho&aacute;t nu?c t?t. Tuy nhi&ecirc;n, m?i nam ch&uacute;ng ta n&ecirc;n thay d?t 1 l?n d? gi&uacute;p c&acirc;y cung c?p th&ecirc;m ch?t dinh du?ng.</li>
</ul>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-co-nhat.jpg" style="height:448px; width:336px" /></p>

<p><strong>Hu?ng d?n tr?ng c&acirc;y c? nh?t d?p</strong></p>

<p>B?n dang mu?n tr?ng c&acirc;y c? nh?t trong nh&agrave; gi&uacute;p can ph&ograve;ng tr? n&ecirc;n d?p hon, th?i gian b?n cho c&ocirc;ng vi?c nhi?u v&agrave; kh&ocirc;ng c&oacute; th?i gian cham s&oacute;c c&acirc;y th&igrave; c? c?nh l&agrave; s? l?a ch?n h&agrave;ng d?u gi&uacute;p b?n t&ocirc; di?m th&ecirc;m cho kh&ocirc;ng gian tr? n&ecirc;n xanh &ndash; s?ch &ndash; d?p gi&uacute;p ng&ocirc;i nh&agrave; tr? n&ecirc;n tho&aacute;ng d&atilde;ng, m&aacute;t m? hon b?ng c&aacute;ch tham kh?o c&aacute;ch tr?ng c&acirc;y nhu sau:</p>

<p>Y?u t? d?u ti&ecirc;n d? c&oacute; c&acirc;y c?nh d?p trong kh&ocirc;ng gian nh&agrave; th&igrave; b?n c?n l?a ch?n d?a di?m mua gi?ng c&acirc;y ch?t lu?ng, d?m b?o kh? nang sinh tru?ng c?a c&acirc;y v? l&acirc;u d&agrave;i s?ng t?t, kh?e m?nh. M&aacute;ch b?n hi?n nay Th? gi?i c&acirc;y v&agrave; hoa dang l&agrave; nh&agrave; ph&acirc;n ph?i gi?ng c&acirc;y c?nh chuy&ecirc;n nghi?p &ndash; uy t&iacute;n t?i th? tru?ng Vi?t Nam, c&ocirc;ng ty chuy&ecirc;n cung c?p c&aacute;c lo?i h?t gi?ng, gi?ng hoa, gi?ng c&acirc;y c?nh, c&acirc;y c&ocirc;ng tr&igrave;nh cho c&aacute;c d? &aacute;n, c&ocirc;ng tr&igrave;nh, h? gia d&igrave;nh,&hellip;B?n c&oacute; th? tham kh?o mua gi?ng c&acirc;y ? d&acirc;y ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m v&agrave; d?m b?o ch?t lu?ng 100%. Tuy nhi&ecirc;n, b&ecirc;n c?nh d&oacute; th&igrave; b?n v?n ph?i ch&uacute; &yacute; d?n c&aacute;ch tr?ng v&agrave; cham s&oacute;c c&acirc;y th&igrave; d?m b?o cho qu&aacute; tr&igrave;nh ph&aacute;t tri?n c?a c&acirc;y du?c d?m b?o t?t.</p>

<p>Th&ocirc;ng thu?ng, khi ch&uacute;ng ta tr?ng c&acirc;y c? nh?t trong nh&agrave; th&igrave; kh&ocirc;ng c?n &aacute;nh s&aacute;ng m?t tr?i b?i ch&uacute;ng c&oacute; th? trong b&oacute;ng r&acirc;m kho?ng t? 3- 5 th&aacute;ng. V?i m?c &aacute;nh s&aacute;ng kho?ng 40 &ndash; 50% l&agrave; th&iacute;ch h?p d? c&acirc;y ph&aacute;t tri?n. N?u nhu ch&uacute;ng ta d? g?n c?a s?, c?a k&iacute;nh hay ban c&ocirc;ng th&igrave; c&acirc;y ph&aacute;t tri?n r?t thu?n l?i, c&acirc;y v?n c&oacute; th? s?ng t?t trong m&ocirc;i tru?ng c&oacute; di?u h&ograve;a m&aacute;t kho?ng 18&ordm;C d?n 28&ordm;C.</p>

<p><strong>M?t s? luu &yacute;:</strong></p>

<ul>
	<li>Khi c&acirc;y d&atilde; xu?t hi?n c&aacute;c l&aacute; &uacute;a, l&aacute; h&eacute;o hay l&aacute; v&agrave;ng th&igrave; ch&uacute;ng ta c?n ph?i c?t b? di ngay.</li>
	<li>C&acirc;y r?ng l&aacute;, nh&aacute;nh c&acirc;y c&oacute; hi?n tu?ng m?m &uacute;ng th&igrave; c?n c&oacute; ch? d? cham s&oacute;c d?c bi?t.</li>
	<li>D&ugrave;ng ph&acirc;n NPK, H?u co, Vi sinh,&hellip;d? gi&uacute;p c&acirc;y lu&ocirc;n xanh t?t, gi? du?c s?c d?p, c&agrave;nh m?p th&igrave; 1 th&aacute;ng ch&uacute;ng ta n&ecirc;n b&oacute;n ph&acirc;n 1 l?n.&nbsp;</li>
</ul>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (8, 1, N'Cây đại lộc', N'cay-dai-loc-500x600.jpg', 1000000, 10, N'Cây đại lộc nghe cái tên chúng ta cũng có thể đoán được một phần ý nghĩa của cây ngay cái tên gọi đầu tiên. ', N'<p>C&acirc;y d?i l?c nghe c&aacute;i t&ecirc;n ch&uacute;ng ta cung c&oacute; th? do&aacute;n du?c m?t ph?n &yacute; nghia c?a c&acirc;y ngay c&aacute;i t&ecirc;n g?i d?u ti&ecirc;n. Ð?i l?c hay c&ograve;n g?i l&agrave; c&acirc;y ph&aacute;t t&agrave;i thu?ng sinh s?ng ? v&ugrave;ng d?i n&uacute;i cao, c&oacute; th? ch?u du?c kh&ocirc; h?n r?t t?t v?i c?u tr&uacute;c th&acirc;n v&agrave; l&aacute; xanh d?p tr?ng nhi?u d? t?o c?nh quan, n?i th?t trong nh&agrave;.</p>

<p>Trong cu?c s?ng h&agrave;ng ng&agrave;y&nbsp;<a href="https://cayvahoa.net/cay-dai-loc/">c&acirc;y d?i l?c</a>&nbsp;c&ograve;n du?c g?i v?i nhi?u c&aacute;i t&ecirc;n g?i kh&aacute;c nhau nhu: Ph?t d? r?ng, ph&aacute;t t&agrave;i n&uacute;i, huy?t r?ng,&hellip;.c&ograve;n t&ecirc;n khoa h?c &ldquo;Dracaena Draco L&rdquo; thu?c h? th?c v?t &ldquo;Dracaenaceae &ndash; B?ng b?ng&rdquo; ch&uacute;ng ph&acirc;n b? ch? y?u ? c&aacute;c v&ugrave;ng n&uacute;i cao c?a mi?n nam nu?c ta.</p>

<p><strong>Ð?c di?m ch&iacute;nh c?a c&acirc;y d?i l?c</strong></p>

<p>Th&acirc;n c&acirc;y d?i l?c c&oacute; th? cao t? 1,5m d?n 4m, m?t g?c c&oacute; th? nhi?u th&acirc;n v&agrave; h&igrave;nh d&aacute;ng c?a ch&uacute;ng g?n nhu c&acirc;y ph&aacute;t t&agrave;i n&uacute;i v&agrave; ch&uacute;ng c&oacute; th? sinh s?ng ? ngo&agrave;i n?ng ho?c trong b&oacute;ng r&acirc;m. Ch? y?u ngu?i ta tr?ng c&acirc;y d?i l?c d? l&agrave;m c&acirc;y n?i th?t. V?n di l&agrave; c&acirc;y th&acirc;n g?, ph&aacute;t tri?n ch?m th&iacute;ch h?p tr?ng l&agrave;m c&acirc;y c?nh n?i th?t ? trong ph&ograve;ng kh&aacute;ch, van ph&ograve;ng l&agrave;m vi?c, h&agrave;nh lang, ban c&ocirc;ng,&hellip;v?i h&igrave;nh d&aacute;ng v&agrave; th&acirc;n h&igrave;nh d?p, nh?ng chi?c l&aacute; d&agrave;i t?o di?m nh?n cho ngu?i xem c&aacute;i nh&igrave;n tinh t?.</p>

<p>Ði?m d? nh?n d?ng nh?t c?a th&acirc;n c&acirc;y l&agrave; c&oacute; nhi?u v?t s?o do cu?n l&aacute; r?ng d? l?i t?o th&agrave;nh t?ng d?t nh?, m?t g?c c&oacute; th? c&oacute; nhi?u th&acirc;n h&igrave;nh tr? tr&ograve;n tuong ?ng v?i du?ng k&iacute;nh kho?ng 10cm &ndash; 12cm, m?t th&acirc;n th&igrave; chia th&agrave;nh nhi?u nh&aacute;nh nh? c&oacute; m&agrave;u tr?ng xanh. L&aacute; c&acirc;y du?c m?c ? tr&ecirc;n d?nh c?a th&acirc;n th&igrave; t?p trung th&agrave;nh t?ng ch&ugrave;m, ? m?i ch&ugrave;m th&igrave; du?c li&ecirc;n k?t th&ocirc;ng qua nhi?u b? qu?n xung quanh th&acirc;n, chi?u d&agrave;i c?a l&aacute; kho?ng 30cm &ndash; 40m, nh?n ? cu?i l&aacute; v&agrave; c&aacute;c l&aacute; thu?ng m?c d&agrave;i ra, cong xu?ng t?o d? m?m m?i hon nh?ng chi?c l&aacute; c&acirc;y ph&aacute;t t&agrave;i n&uacute;i. Nhung ch&uacute;ng thu?ng xanh hon, d? b&oacute;ng hon v&agrave; khi v? gi&agrave; c&aacute;c l&aacute; s? r?ng t?o th&agrave;nh d?t tr&ecirc;n th&acirc;n c&acirc;y.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-dai-loc.jpg" style="height:667px; width:500px" /></p>

<p><strong>&Yacute; nghia c&acirc;y d?i l?c trong phong th?y</strong></p>

<p>Trong phong c&aacute;ch trang tr&iacute; c&acirc;y c?nh n?i th?t th&igrave; ch&uacute;ng ta kh&ocirc;ng th? b? qua nh?ng c&acirc;y mang &yacute; nghia s&acirc;u s?c trong phong th?y. V?i c&acirc;y d?i l?c du?c xem l&agrave; c&acirc;y mang d?n s? t&agrave;i l?c, may m?n cho ngu?i tr?ng v&agrave; ngo&agrave;i ra c&acirc;y c&ograve;n c&oacute; t&aacute;c d?ng d? trong l&agrave;m s?ch m&ocirc;i tru?ng s?ng, gi?m b?t di ngu?n kh&ocirc;ng kh&iacute; &ocirc; nhi?m xung quanh c&acirc;y.</p>

<p>Ch&iacute;nh v&igrave; th?, ngu?i ta v?n lu&ocirc;n th&iacute;ch tr?ng c&acirc;y d?i l?c trong nh&agrave; ho?c s? d?ng d? t?ng cho b?n b&egrave;, ngu?i th&acirc;n, d?ng nghi?p, d?i t&aacute;c d?u mang &yacute; nghia th?c s? s&acirc;u s?c. N?u l&agrave; m?t doanh nghi?p kinh doanh lu&ocirc;n c?n d?n s? may m?n v&agrave; t&agrave;i l?c th&igrave; vi?c trang tr&iacute; c&acirc;y d?i l?c l&agrave; r?t h?p v?a mang d?n v? d?p cho kh&ocirc;ng gian, v?a mang &yacute; nghia th?c s? s&acirc;u s?c c?n du?c ch&uacute; tr?ng d?n.</p>

<p><strong>Nh?ng t&aacute;c d?ng ch&iacute;nh c?a c&acirc;y v?i d?i s?ng</strong></p>

<p>Ð?i l?c kh&ocirc;ng ch? c&oacute; h&igrave;nh d&aacute;ng d?p l? m?t m&agrave; c&ograve;n c&oacute; nhi?u l&aacute; m?c ? tr&ecirc;n d?u nh&aacute;nh. M?i g?c c&acirc;y thu?ng c&oacute; nhi?u th&acirc;n nh&aacute;nh t?o n&ecirc;n cho ngu?i s? d?ng l&agrave;m c&acirc;y trang tr&iacute; c?nh quan. Th&ocirc;ng thu?ng, ngu?i ta ch?n tr?ng c&acirc;y d?i l?c v&agrave;o nh?ng ch?u s? c&oacute; m&agrave;u tr?ng, ch?u s? cao c?p d? trung b&agrave;y ? trong nh&agrave;, van ph&ograve;ng, h&agrave;nh lang, tru?c s?nh kh&aacute;ch s?n, c?nh b&agrave;n ti?p t&acirc;n v&agrave; th&iacute;ch h?p l&agrave;m c&acirc;y n?i th?t ua th&iacute;ch.</p>

<p>Thu?ng ch&uacute;ng du?c tr?ng l&agrave;m d?i c?nh trong c&ocirc;ng vi&ecirc;n s&acirc;n vu?n hay m?t g&oacute;c nh? trong khu vu?n nh&agrave; d? t?o khung c?nh s&acirc;n vu?n.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-dai-loc-1.jpg" style="height:745px; width:600px" /></p>

<p>Ngo&agrave;i nh?ng t&aacute;c d?ng tr&ecirc;n th&igrave; c&acirc;y d?i l?c mang d?n cho con ngu?i c&aacute;i nh&igrave;n tinh t?, d?c d&aacute;o hon b?i m&agrave;u c&aacute;ch nh&igrave;n, s? chi&ecirc;m ngu?ng v? d?p xanh mu?t ho&agrave;n m?.</p>

<p><strong>Hu?ng d?n c&aacute;ch tr?ng v&agrave; cham s&oacute;c hoa t?t nh?t</strong></p>

<p>Sau khi d&atilde; t&igrave;m hi?u v? nh?ng d?c t&iacute;nh, t&aacute;c d?ng, &yacute; nghia c?a c&acirc;y th&igrave; b?n y&ecirc;u th&iacute;ch d? tr?ng trong nh&agrave;, trong s&acirc;n vu?n th&igrave; h&atilde;y tham kh?o ngay c&aacute;ch tr?ng, cham s&oacute;c c&acirc;y tuoi t?t gi? du?c c&acirc;y d?p th?a th&iacute;ch s? chi&ecirc;m ngu?ng c?a nhi?u t?m m?t. C&acirc;y d?i l?c c&oacute; kh? nang sinh s?ng ? ngo&agrave;i n?ng, trong ph&ograve;ng r&acirc;m v&agrave; c&acirc;y c&oacute; ph&aacute;t tri?n ch?m thu?ng r?t hi?m g?p s&acirc;u b?nh n&ecirc;n qu&aacute; tr&igrave;nh cham s&oacute;c tuong d?i d? d&agrave;ng ch&uacute;ng ta c?n luu &yacute; m?t s? v?n d? ch&iacute;nh nhu sau:</p>

<p>+&nbsp;<strong>Ð?t tr?ng:</strong>&nbsp;Th&iacute;ch h?p v?i d?t m&agrave;u m?, nhi?u dinh du?ng v&agrave; c&oacute; kh? nang tho&aacute;t nu?c t?t. C&acirc;y kh&ocirc;ng c&oacute; kh? nang ch?u du?c &uacute;ng. V&igrave; v?y, ch? c?n 2 th&aacute;ng, 3 th&aacute;ng th&igrave; cung c?p th&ecirc;m m?t lu?ng ph&acirc;n h?u co, ph&acirc;n tr&ugrave;n qu? hay lo?i ph&acirc;n h&oacute;a h?c du?c c?i t?o v&agrave; b? sung nang lu?ng cho c&acirc;y.</p>

<p>+&nbsp;<strong>Nhu c?u nu?c:</strong>&nbsp;Khi tr?ng c&acirc;y n?i th?t ? trong nh&agrave; th&igrave; b?n lu&ocirc;n ch&uacute; &yacute; lu?ng nu?c tu?i &iacute;t hon b&igrave;nh thu?ng. Thu?ng th&igrave; m?t tu?n ch? c?n tu?i kho?ng 2 l?n l&agrave; d?. V&igrave; th?, c&acirc;y c&oacute; kh? nang ch?u h?n r?t t?t cho n&ecirc;n s? kh&ocirc;ng s? b? kh&ocirc; h&eacute;o. V&igrave; v?y, n?u tr?ng ? ngo&agrave;i tr?i th&igrave; c?n ph?i tu?i nu?c h&agrave;ng ng&agrave;y, tu?i cho th&acirc;n c&acirc;y, l&aacute; u?t d?m d? c&oacute; th? ch?ng b?i b?n v&agrave; gi&uacute;p c&acirc;y c&oacute; kh? nang quang h?p t?t hon.</p>

<p>+&nbsp;<strong>&Aacute;nh s&aacute;ng:</strong>&nbsp;Khi tr?ng ? trong nh&agrave; th&igrave; ch&uacute;ng ta c?n mang ra h?ng h?ng t? 4-6 ti?ng. C&aacute;ch 2 tu?n mang ra m?t l?n.</p>

<p>V&agrave; khi th?y c&aacute;c l&aacute; b&ecirc;n du?i c&oacute; m&agrave;u v&agrave;ng &uacute;a th&igrave; c?n t&aacute;ch c?t b? ngay d? d?m b?o s?c kh?e sinh tru?ng c?a c&acirc;y du?c tuoi t?t. Hi?n nay, d?i l?c du?c tr?ng b?ng phuong ph&aacute;p gi&acirc;m c&agrave;nh ho?c c&oacute; th? c?t m?t do?n th&acirc;n sau d&oacute; gi&acirc;m xu?ng d?t, ch?n noi m&aacute;t m? d? kh&ocirc;ng kho?ng 2 tu?n th&igrave; c&acirc;y s? m?c r? v&agrave; ph&aacute;t tri?n.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-dai-loc-2.jpeg" style="height:588px; width:441px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (9, 1, N'Cây đại tứ lan', N'cay-dai-tu-lan-1.jpg', 200000, 0, N'Trồng cây đại tứ lan sẽ giúp cho không gian trở nên sáng, xinh xắn giúp không gian thoáng đoãng, trong sạch mà điều hòa được ánh sáng trong những khu vực thiết ánh sáng.', N'<p>Tr?ng c&acirc;y d?i t? lan s? gi&uacute;p cho kh&ocirc;ng gian tr? n&ecirc;n s&aacute;ng, xinh x?n gi&uacute;p kh&ocirc;ng gian tho&aacute;ng do&atilde;ng, trong s?ch m&agrave; di?u h&ograve;a du?c &aacute;nh s&aacute;ng trong nh?ng khu v?c thi?t &aacute;nh s&aacute;ng.</p>

<p>C&acirc;y d?i t? lan c&oacute; t&ecirc;n khoa h?c &rdquo; Dracaena sanderiana&rdquo; c&oacute; ngu?n g?c t? c&aacute;c nu?c Ch&acirc;u Phi nhi?t d?i, thu?c gi?ng c&acirc;y d? l&agrave;m c?nh, trang tr&iacute; n?i th?t van ph&ograve;ng. Hi?n t?i, c&acirc;y du?c nh&acirc;n gi?ng r?ng r&atilde;i kh?p ? m?i noi v&agrave; Th? gi?i c&acirc;y v&agrave; hoa dang l&agrave; noi ph&acirc;n ph?i c&acirc;y d?i t? lan ch?t lu?ng v&agrave; uy t&iacute;n nh?t t?i H&agrave; N?i.</p>

<p><strong>=&gt; B?n c&oacute; th? li&ecirc;n h?:&nbsp;0988 580 657&nbsp;d? du?c tu v?n</strong></p>

<p><img alt="cay-dai-tu-lan" src="https://cayvahoa.net/wp-content/uploads/cay-dai-tu-lan.jpg" style="height:795px; width:650px" /></p>

<p>Ð?i t? lan l&agrave; m?t gi?ng c&acirc;y c?nh m?c b?i kh&aacute; d&agrave;y d?n, nh?ng chi?c l&agrave; c&oacute; h&igrave;nh gi&aacute;o d?u nh?n, l&aacute; s?c h?p m&agrave;u tr?ng hay v&agrave;ng. ? tr&ecirc;n c&aacute;c phi?n l&aacute; m?m m&agrave;u xanh b&oacute;ng nh?t, th&iacute;ch h?p v?i nh?ng noi c&oacute; b&oacute;ng r&acirc;m, th?i ti?t m&aacute;t m?. V?i c&acirc;y n&agrave;y th&igrave; r?t &iacute;t khi c&oacute; hoa, ch? y?u v? d?p b?i nh?ng chi?c l&aacute; s?c tr?ng, v&agrave;ng tr&ecirc;n m&agrave;u l&agrave; xanh th?t thu h&uacute;t v&agrave; n?i b?t trong m?t kh&ocirc;ng gian ph&ograve;ng.</p>

<p>Ch&iacute;nh v&igrave; th?, ngu?i ta thu?ng ch?n tr?ng c&acirc;y d?i t? lan ? trong c&aacute;c van ph&ograve;ng l&agrave;m vi?c d? t?o m?t kh&ocirc;ng gian th?t tho?i m&aacute;i, ti?t ki?m kh&ocirc;ng gian ch?t h?p c?a ph&ograve;ng l&agrave;m vi?c d? trang tr&iacute; mang l?i nh?ng l?i &iacute;ch cho s?c kh?e con ngu?i g?n gui v?i thi&ecirc;n nhi&ecirc;n hon.</p>

<p><img alt="cay-dai-tu-lan-1" src="https://cayvahoa.net/wp-content/uploads/cay-dai-tu-lan-1.jpg" style="height:320px; width:292px" /></p>

<p><strong>Ð?c di?m h&igrave;nh th&aacute;i c?a c&acirc;y d?i t? lan</strong></p>

<p>V?i chi?u cao kho?ng 40cm &ndash; 70cm th&ocirc;ng thu?ng th&iacute;ch h?p tr?ng c&acirc;y trong nh&agrave; th&igrave; tuong ?ng m?c chi?u cao kho?ng 40cm -45cm, nh?ng chi?c l&agrave; h&igrave;nh mui gi&aacute;o v?i 2 s?c m&agrave;u xanh c?m ? hai b&ecirc;n m&eacute;p l&aacute;, ? gi?a chi?c l&aacute; l&agrave; m&agrave;u xanh d?m pha th&ecirc;m s?c tr?ng, v&agrave;ng nh? nh&igrave;n r?t xinh x?n v&agrave; quy?n ru.</p>

<p><img alt="cay-dai-tu-lan-2" src="https://cayvahoa.net/wp-content/uploads/cay-dai-tu-lan-2-768x1024.jpg" style="height:860px; width:645px" /></p>

<p><strong>K? thu?t cham s&oacute;c c&acirc;y</strong></p>

<p>Ð? c&acirc;y ph&aacute;t tri?n tuoi t?t, c&oacute; nh?ng chi?c l&aacute; m&agrave;u s?c d?p th&igrave; b?n kh&ocirc;ng th? b? qua bu?c cham s&oacute;c c&acirc;y. V&agrave; l&agrave;m th? n&agrave;o d? bi?t du?c nhu c?u ph&aacute;t tri?n c?a d?i lan t? th&igrave; b?n t&igrave;m hi?u k? thu?t cham s&oacute;c du?i d&acirc;y:</p>

<p><strong>+ Ð?t tr?ng:</strong>&nbsp;C&acirc;y th&iacute;ch h?p v?i lo?i d?t toi x?p, s?ch b?nh. B?n n&ecirc;n mua d?t tr?ng c&acirc;y b&aacute;n s?n s? gi&uacute;p c&acirc;y ph&aacute;t tri?n t?t hon.</p>

<p><strong>+ Tr?ng c&acirc;y:</strong>&nbsp;S? d?ng m?t l?p d?t cho du?i d&aacute;y ch?u. Sau d&oacute;, d?t c&acirc;y l&ecirc;n cao sao cho c&acirc;y th?ng d?ng ? th&acirc;n v&agrave; g?c c&acirc;y r?i m?i ph? m?t l?p d?t l&ecirc;n, n&eacute;n ch?t v&ugrave;ng d?t xung quanh ch?u r?i tu?i nu?c cho c&acirc;y.</p>

<p><strong>+ Tu?i nu?c:</strong>&nbsp;Khi th?y b? m?t d?t c?a c&acirc;y kh&ocirc; th&igrave; b?n n&ecirc;n tu?i nu?c cho c&acirc;y. Luu &yacute; tr&aacute;nh d? c&acirc;y qu&aacute; kh&ocirc; ho?c d? c&acirc;y ?m u?t qu&aacute; thu?ng xuy&ecirc;n.</p>

<p><strong>+ B&oacute;n ph&acirc;n:</strong>&nbsp;1 th&aacute;ng th&igrave; n&ecirc;n b&oacute;n ph&acirc;n cho c&acirc;y 1 l?n, c&aacute;c lo?i ph&acirc;n b&oacute;n nhu: Ð?u Tr&acirc;u, ph&acirc;n Ð?c Nitrophoska d?c hi?u cho hoa, c&acirc;y c?nh. Tuy nhi&ecirc;n, b?n n&ecirc;n d?c k? hu?ng d?n v? li?u lu?ng d? gi&uacute;p c&acirc;y tuoi t?t hon.</p>

<p><img alt="cay-dai-tu-lan-3" src="https://cayvahoa.net/wp-content/uploads/cay-dai-tu-lan-3.jpg" style="height:450px; width:600px" /></p>

<p><strong>&nbsp;C&aacute;c lo?i s&acirc;u b?nh thu?ng g?p c?a c&acirc;y d?i lan t?:</strong></p>

<ul>
	<li><strong>Ch&aacute;y d?u l&aacute;</strong></li>
</ul>

<p>B?nh thu?ng do c&acirc;y ti?p x&uacute;c v?i cu?ng d? &aacute;nh s&aacute;ng m?nh trong nhi?u ng&agrave;y, d? trong m&ocirc;i tru?ng b&oacute;ng r&acirc;m v?i th?i gian d&agrave;i c&acirc;y r?t d? b? ch&aacute;y d?u l&aacute;. V&igrave; v?y, c?n s? ch&uacute; &yacute; c?a b?nh, khi ph&aacute;t hi?n c&acirc;y m?c b?nh ch&aacute;y l&aacute; th&igrave; n&oacute; s? m?t th?m m?.</p>

<ul>
	<li><strong>B?nh d?m n&acirc;u</strong></li>
</ul>

<p>M?t trong nh?ng b?nh thu?ng xu?t hi?n nh?ng v?t d?m nh? tr&ecirc;n t&agrave;u l&agrave; nhung sau d&oacute; ch&uacute;ng loang d?n th&agrave;nh nh?ng v?t d?m n&acirc;u b?nh n?ng hon th&igrave; l&aacute; g?n nhu s? b? ch&aacute;y h?t. B?nh s? xu?t hi?n v&agrave;o th?i di?m n?ng mua th?t thu?ng ho?c giai do?n chuy?n m&ugrave;a b?nh do lo?i n?m Pestalotia palmarum g&acirc;y ra. Thu?ng khi m?c b?nh n&agrave;y th&igrave; b?n ph?i c?t b? nh?ng l&aacute; h?ng d? ti&ecirc;u h?y v&agrave; l&agrave;m s?ch g?c. Sau d&oacute; phun thu?c Ridomil MZ d? ph&ograve;ng tr? b?nh cho c&acirc;y m?t c&aacute;ch hi?u qu?.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (10, 1, N'Cây kim tiền', N'cay-kim-tien-2-600x600.jpg', 700000, 5, N'Cây kim tiền là một trong những loại cây cảnh được ưa chuộng trang trí cho không gian, văn phòng làm việc, bàn làm việc,…trở tươi tắn, thư giãn tinh thần làm việc hăng say, nhiệt huyết hơn. ', N'<p><a href="https://cayvahoa.net/cay-kim-tien-hop-tuoi/">C&acirc;y kim ti?n</a>&nbsp;l&agrave; m?t trong nh?ng lo?i c&acirc;y c?nh du?c ua chu?ng trang tr&iacute; cho kh&ocirc;ng gian, van ph&ograve;ng l&agrave;m vi?c, b&agrave;n l&agrave;m vi?c,&hellip;tr? tuoi t?n, thu gi&atilde;n tinh th?n l&agrave;m vi?c hang say, nhi?t huy?t hon. Ð?c di?t, c&acirc;y kim ti?n c&ograve;n c&oacute; kh? nang gi?m stress mang l?i nh?ng may m?n, t&agrave;i l?c cho gia ch?.</p>

<p><strong>Ð?c di?m c?a c&acirc;y kim ti?n</strong></p>

<p>Kim ti?n m?t c&aacute;i t&ecirc;n khoi g?i cho ch&uacute;ng ta bi?t d?n &yacute; nghia ph&aacute;t l?c, ph&aacute;t t&agrave;i. N&oacute; c&oacute; t&ecirc;n khoa h?c &ldquo;Zamioculcas zamifollia&rdquo; c&oacute; ngu?n g?c t? Ch&acirc;u &Aacute; nhi?t d?i. Thu?c lo?i c&acirc;y c&oacute; th&acirc;n m?ng nu?c, th&acirc;n b?i v&agrave; c&oacute; kh? nang s?ng l&acirc;u nam v?i chi?u cao kho?ng 20cm &ndash; 90cm, th&acirc;n c&acirc;y m?c s&acirc;u du?i d?t th&acirc;n ph? ph&igrave;nh to ? g?c, c&aacute;c t&aacute;n l&aacute; m?c th?ng vuon xa, x&ograve;e sang thu?ng m?c d?i x?ng v?i nhau. L&aacute; c&acirc;y thu?ng m?c th&agrave;nh c&agrave;nh l&aacute; c&oacute; d?y s?c s?ng, m&agrave;u s?c m? vuon cao d?y kh&iacute; th?, nh?ng chi?c l&aacute; m&agrave;u xanh l?c s&aacute;ng b&oacute;ng, h&igrave;nh tr&aacute;i xoan khi nh&igrave;n th?y d?ng l&agrave; k&eacute;p l&ocirc;ng chim cang m?ng. Hoa thu?ng m?c t? g?c d? t?o th&agrave;nh t?ng c?m.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-kim-tien-1.jpg" style="height:657px; width:640px" /></p>

<p>Th&ocirc;ng thu?ng c&acirc;y c&oacute; tu?i th? s?ng du?c kho?ng t? 2-3 nam. Khi s? h?u du?c c&acirc;y kim ti?n cung gi?ng nhu s? h?u du?c s? may m?n, t&agrave;i l?c, th?nh vu?ng. Cung ch&iacute;nh v&igrave; th?, c&acirc;y kim ti?n du?c ua chu?ng trong ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m vi?c, van ph&ograve;ng c&ocirc;ng s?, nh&agrave; h&agrave;ng, kh&aacute;ch s?n ho?c c&oacute; th? l&agrave;m qu&agrave; t?ng trong nh?ng d?p m?ng l? t?t, khai truong,&hellip;Nh&igrave;n ngay ? chi?c l&aacute; ch&uacute;ng ta th?y du?c s? m&agrave;u m?, ph&aacute;t tri?n di?u d&oacute; tu?ng trung cho ti?n t&agrave;i, may m?n,..</p>

<p><strong>&Yacute; nghia c&acirc;y kim ti?n trong phong th?y</strong></p>

<p>Thu?c lo?i c&acirc;y ua th&iacute;ch v?i t&ecirc;n g?i kh&aacute;c l&agrave; kim ph&aacute;t t&agrave;i, m?t lo&agrave;i c&acirc;y thu?c v&ugrave;ng nhi?t d?i l&acirc;u nam, c&oacute; ngu?n g?c t? mi?n Ð&ocirc;ng Ch&acirc;u Phi. Khi nh?c d?n c&aacute;i t&ecirc;n kim ti?n ch&uacute;ng ta c&oacute; th? h&igrave;nh dung du?c &yacute; nghia c?a lo&agrave;i c&acirc;y n&agrave;y, cung thu?c lo?i c&acirc;y ch?u b&oacute;ng b&aacute;n ph?n v?i l&aacute; m&agrave;u xanh d?m, m?ng nu?c. Ð?ng th?i, c&acirc;y c&oacute; kh? nang d&acirc;m ch?i n?y l?c sinh s?n ph&aacute;t tri?n nhanh. Cung ch&iacute;nh v&igrave; th?, ngu?i ta cho rang kim ti?n tu?ng trung cho s? th?nh vu?ng, ti?n t&agrave;i. Ch? &ldquo;Kim&rdquo; c&oacute; nghia ph&aacute;t t&agrave;i, &ldquo;Ti?n&rdquo; c&oacute; nghia l&agrave; ph&uacute; qu&yacute;. T&aacute;c d?ng c?a kim ti?n l&agrave; th&iacute;ch h?p d? l&agrave;m qu&agrave; t?ng trong nh?ng d?p khai truong c?a c?a h&agrave;ng, l? t?t ngu?i ta s? d?ng nh?ng s?i ch? d? treo l&ecirc;n c&acirc;y ho?c nh?ng d?ng ti?n v&agrave;ng d? nh?m mang du?c s? t&agrave;i l?c, ph&aacute;t l?c nh&igrave;n d? d&agrave;ng thu h&uacute;t t?m m?t c?a nhi?u ngu?i.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-kim-tien-1-1.jpg" style="height:485px; width:630px" /></p>

<p>N?u nhu b?n nghe ai n&oacute;i trang tr&iacute; c&acirc;y n?i th?t b?ng c&acirc;y kim ti?n d? th? hi?n s? ph&uacute; qu&yacute;, gi&agrave;u sang v&agrave; ti?n b?c. Ði?u d&oacute;, r?t d&uacute;ng b?i c&acirc;y du?c ua chu?ng trong phong th?y v&agrave; ngu?i ta lu&ocirc;n c&oacute; quan ni?m khi kim ti?n n? hoa th&igrave; mang d?n nhi?u t&agrave;i l?c, may m?n cho t?ng ch?.</p>

<p>Ngo&agrave;i l&yacute; do trang tr&iacute; c&acirc;y kim ti?n c&oacute; &yacute; nghia may m?n, t&agrave;i l?c th&igrave; c&acirc;y c&ograve;n c&oacute; kh? nang thanh l?c kh&ocirc;ng kh&iacute;, h?p th? c&aacute;c ch?t h?u co d? bay hoi c&oacute; h?i nhu: Benzen, xylen,..v&agrave; c&oacute; th? tr? l?i b?u kh&ocirc;ng kh&iacute; s?ch s? cho con ngu?i c?m th?y tho&aacute;ng m&aacute;t, tho?i m&aacute;i tinh th?n.</p>

<p>C&acirc;y kim ti?n l&agrave; lo?i c&acirc;y ph? th&ocirc;ng nh?t, n&oacute; h?p v?i t?t c? d? tu?i n&agrave;o, m?nh n&agrave;o cung h?p v?i kim ti?n, d&oacute; l&agrave; l&yacute; do t?i sao ch&uacute;ng ta r?t hay g?p n&oacute; t?i b?t c? van ph&ograve;ng hay khu vui choi, ng&acirc;n h&agrave;ng&hellip; n&agrave;o.</p>

<p><strong>Ð?t c&acirc;y kim ti?n sao cho ph&ugrave; h?p</strong></p>

<p>V? tr&iacute; d?t c&acirc;y cung r?t quan tr?ng b?i n&oacute; s? ?nh hu?ng t?i kh? nang sinh tru?ng, ph&aacute;t tri?n. V&igrave; th?, ch?n v? tr&iacute; c&oacute; nhi?u &aacute;nh s&aacute;ng nhu: Ph&ograve;ng kh&aacute;ch, h&agrave;nh lang di l?i ? ch? c?a ra v&agrave;o, c?a k&iacute;nh. Theo phong th?y thu?ng n&ecirc;n d?t t?i ph&ograve;ng kh&aacute;ch theo hu?ng Ð&ocirc;ng Nam, thu?c qu? t?n, m?c thu?c cung t&agrave;i l?c hay thu?c cung ph&iacute;a Ð&ocirc;ng, qu? ch?n, ngu h&agrave;nh thu?c m?c.</p>

<p>Luu &yacute; kh&ocirc;ng n&ecirc;n d?t c&acirc;y ? tr?ng ph&ograve;ng ng?, tr&aacute;nh d?t c&acirc;y ? v? tr&iacute; d?i di?n v?i c?a, c&oacute; th? d?t ? nh?ng noi b? cao, g?n c?a ra v&agrave;o.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-kim-tien-2.jpg" style="height:960px; width:720px" /></p>

<p><strong>K? thu?t cham s&oacute;c c&acirc;y</strong></p>

<p>Kh? nang ph&aacute;t tri?n t?t v&agrave; kh&ocirc;ng qu&aacute; c?u k? ? c&aacute;ch nh&acirc;n gi?ng d? gi&uacute;p c&acirc;y c&oacute; th? ra hoa du?c theo &yacute; mu?n. C&aacute;ch gi&uacute;p c&acirc;y ph&aacute;t tri?n t?t nhu sau:</p>

<p>+&nbsp;<strong>Ð?t tr?ng:</strong>&nbsp;Ch?n lo?i d?t m&agrave;u m?, c&oacute; nhi?u ch?t m&ugrave;n, tr?n th&ecirc;m d?t c&aacute;t s?i d? tang kh? nang tho&aacute;t nu?c t?t. Tuy nhi&ecirc;n, b?n ph?i luu &yacute; c&acirc;y nh?y c?m v?i c&aacute;c lo?i d?t c?n c?i, c&oacute; th? thu?ng xuy&ecirc;n b&oacute;n ph&acirc;n v&agrave;o mua xu&acirc;n, m&ugrave;a thu. Khi l&agrave;m nhu v?y th&igrave; c&acirc;y c&oacute; th? ph&aacute;t tri?n nhanh b? l&aacute; m?i v&agrave; ra hoa d?p.</p>

<p>+&nbsp;<strong>Nhu c?u nu?c:&nbsp;</strong>Kh? nang ch?u h?n k&eacute;m n&ecirc;n c?n tu?i nu?c v?a ph?i, thu?ng xuy&ecirc;n. Kh&ocirc;ng n&ecirc;n tu?i qu&aacute; nhi?u c&acirc;y s? ng?p r?, ch? c?n tu?i 2 ng&agrave;y/ l?n. M&ugrave;a thu th&igrave; c?n tu?i ng&agrave;y 1 l?n. Luu &yacute; kh&ocirc;ng n&ecirc;n tu?i tr?c ti?p xu?ng g?c c&acirc;y m&agrave; s? d?ng b&igrave;nh x?t d? tu?i d?u.</p>

<p>+&nbsp;<strong>&Aacute;nh s&aacute;ng:</strong>&nbsp;C&acirc;y ua th&iacute;ch &aacute;nh s&aacute;ng nhung tr&aacute;nh &aacute;nh n?ng m?t tr?i tr?c ti?p, c&acirc;y ph&aacute;t tri?n b&igrave;nh thu?ng ? trong di?u ki?n b&oacute;ng r&acirc;m, kh&ocirc;ng n&ecirc;n d?t c&acirc;y ? du?i &aacute;nh n?ng tr?c ti?p s? l&agrave;m c&acirc;y d? b? ch&aacute;y l&aacute;, nhi?u d&oacute;m n&acirc;u v&agrave; m&agrave;u xanh c?a l&aacute; chuy?n sang m&agrave;u xanh den.</p>

<p>+&nbsp;<strong>Nhi?t d?, d? ?m th&iacute;ch h?p:</strong>&nbsp;C&oacute; kh? nang ch?u du?c nhi?t d? cao trong kho?ng t? 25- 27&deg;C, c&acirc;y c&oacute; kh? nang ph&aacute;t tri?n nhanh t?t, d? ?m th&aacute;p l?n d? ?m cao.</p>

<p><strong>C&aacute;ch cham s&oacute;c</strong></p>

<p>Ð? gi&uacute;p c&acirc;y c&oacute; nh?ng chi?c l&aacute; kim ti?n b&oacute;ng d?p th&igrave; c&aacute;c gia ch? n&ecirc;n lau nh? b?ng khan u?t qua b? m?t l&aacute;, lau c&aacute;c b?i b&aacute;m xung quanh m?t ch?u. Ki?m tra, nh?t b? di c&aacute;c l&aacute; &uacute;a v&agrave;ng, c?t b? nhanh c&aacute;c nh&aacute;nh h&eacute;o. Khi d&atilde; ph&aacute;t hi?n ? trong ch?u c&acirc;y c&oacute; m?t nh&aacute;nh th?i th&igrave; c?n tr?c ti?p r&uacute;t ra ho?c s? d?ng k&eacute;o d? c?t b?, tr&aacute;nh tru?ng h?p d? l&acirc;y lan qua nh?ng c&acirc;y kh&aacute;c.</p>

<p>Kim ti?n thu?c c&acirc;y c&oacute; kh? nang sinh tru?ng r?t t?t, s?ng kh?e, ra hoa theo mong mu?n mang d?n cho c&aacute;c gia ch? kh&ocirc;ng gian s?ch d?p, nhi?u &yacute; nghia,&hellip;Cung ch&iacute;nh nh?ng uu di?m d&oacute;, nhi?u nh&agrave; h&agrave;ng, qu&aacute;n x&aacute;, shop kinh doanh, c&ocirc;ng ty, van ph&ograve;ng giao d?ch,..ua th&iacute;ch trang tr&iacute; c&acirc;y kim ti?n v?i nh?ng mong mu?n mang d?n s? may m?n, t&agrave;i l?c, th?nh vu?ng.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (11, 1, N'Cây hoa nhài', N'cay-hoa-nhai-2.jpg', 200000, 0, N'Hoa nhài là loài cây được trồng rất phổ biến ở Việt Nam. Thông thường hay trồng trước hiên nhà, cổng, hành lang hoặc ban công,…', N'<p><a href="https://cayvahoa.net/cay-hoa-nhai/"><strong>Hoa nh&agrave;i</strong></a>&nbsp;l&agrave; lo&agrave;i c&acirc;y du?c tr?ng r?t ph? bi?n ? Vi?t Nam. Th&ocirc;ng thu?ng hay tr?ng tru?c hi&ecirc;n nh&agrave;, c?ng, h&agrave;nh lang ho?c ban c&ocirc;ng,&hellip;v?i m?c d&iacute;ch huong thom t? hoa nh&agrave;i l&agrave;m xua tan di c&aacute;i m?t nh?c gi&uacute;p tinh th?n thu th&aacute;i hon. Ch&iacute;nh v&igrave; v?y, ngu?i ta thu?ng s? d?ng c&acirc;y hoa nh&agrave;i d? l&agrave;m huong li?u u?p tr&agrave;, m? ph?m,&hellip;.</p>

<p>Ngu?i ta d&atilde; ph&aacute;t hi?n c&acirc;y hoa nh&agrave;i t? r?t l&acirc;u ? trong nhi?u th? k?. B?t ngu?n t? ?n Ð? cho d?n nay th&igrave; c&acirc;y du?c tr?ng ph? bi?n tr&ecirc;n nhi?u qu?c gia kh&ocirc;ng ch? ri&ecirc;ng Vi?t Nam. ? Philippin, Indonesia hoa nh&agrave;i du?c ch?n l&agrave;m qu?c hoa, bi?t d?n nhu lo&agrave;i hoa Sampaguita, Melati.</p>

<p><strong>&Yacute; nghia c?a c&acirc;y hoa nh&agrave;i dang du?c tr?ng ph? bi?n ? Vi?t Nam</strong></p>

<p>V?i th&acirc;n h&igrave;nh d?p, nhi?u hoa nh?ng b&ocirc;ng hoa t?a huong thom ng&aacute;t mang trong m&igrave;nh &yacute; nghia tr? x&uacute; u?, dem d?n t&agrave;i l?c cho gia ch?. Huong thom ng?t ng&agrave;o, d? ch?u c&oacute; th? gi&uacute;p b?n xua di cang th?ng, gi?m strees,&hellip;nh?ng b&ocirc;ng hoa nh? b&eacute; m&agrave;u tr?ng tinh kh&ocirc;i, th&acirc;n d&agrave;i c&oacute; th? u?n, xo?n khi m?c ? d&acirc;u c&oacute; th? lan r?ng ra ch? d&oacute;. Thu?c lo&agrave;i c&acirc;y b?i nh? nh&acirc;n th&agrave;nh nhi?u nh&aacute;nh, chi?u cao kho?ng 30-100cm, l&aacute; c&acirc;y c&oacute; m&agrave;u xanh d?m, du?ng k&iacute;nh c?a nh?ng b&ocirc;ng hoa kho?ng t? 2,5-5cm, m?i ch&ugrave;m thu?ng t? 3-15 b&ocirc;ng nh? xinh, m&agrave;u tr?ng r?t l&agrave; d?p.</p>

<p><img alt="cay-hoa-nhai-1" src="https://cayvahoa.net/wp-content/uploads/cay-hoa-nhai-1.jpg" style="height:495px; width:660px" /></p>

<p>Trong phong th?y th&igrave; hoa nh&agrave;i c&oacute; h&igrave;nh d&aacute;ng r?t d?p, sai hoa, huong thom d? ch?u nh?m mang d?n t&agrave;i l?c cho gia ch? khi du?c tr?ng ? ban c&ocirc;ng, van ph&ograve;ng hay nh&agrave; h&agrave;ng,&hellip;..Nh?ng b&ocirc;ng hoa thu h&uacute;t nang lu?ng t&iacute;ch c?c v?i huong thom ng?t ng&agrave;o gi?m di s? cang th?ng v&agrave; cung c?p th&ecirc;m nang lu?ng cho co th? n&ecirc;n du?c nhi?u ngu?i l?a ch?n tr?ng v&agrave; y&ecirc;u th&iacute;ch lo&agrave;i c&acirc;y n&agrave;y. Trong phong th?y th&igrave; n&ecirc;n d?t c&acirc;y ? g?n c?a s? hu?ng v? ph&iacute;a nam c?a nh&agrave;, c&ograve;n khi tr?ng ngo&agrave;i vu?n n&ecirc;n ch?n hu?ng b?c, ph&iacute;a d&ocirc;ng, ph&iacute;a d&ocirc;ng b?c. Hoa n? quanh nam nhung n? r? nh?t v&agrave;o m&ugrave;a h&egrave;, ch? y?u huong thom du?c t?a r?ng v&agrave;o ban d&ecirc;m.</p>

<p><img alt="cay-hoa-nhai" src="https://cayvahoa.net/wp-content/uploads/cay-hoa-nhai.jpg" style="height:660px; width:660px" /></p>

<p>=&gt;&nbsp;<strong>B?n c&oacute; th? s?m ri&ecirc;ng cho m&igrave;nh ch?u hoa nh&agrave;i d?t trong van ph&ograve;ng l&agrave;m vi?c b?ng c&aacute;ch li&ecirc;n h?:&nbsp;0988 580 657&nbsp;d? du?c h? tr?!</strong></p>

<p>Nh?ng b&ocirc;ng hoa nh&agrave;i tr?ng nhu tuy?t c&oacute; hoi ch&uacute;t pha l?n v&agrave;ng nh?t, m?t ch&ugrave;m c&oacute; th? t? 3-15 b&ocirc;ng hoa, c&oacute; huong thom n?ng, khi s?p t&agrave;n th&igrave; ch&uacute;ng s? chuy?n d?n sang m&agrave;u h?ng, v&agrave;ng ng&agrave;. Khi d?t ch?u c&acirc;y hoa nh&agrave;i tr&ecirc;n b&agrave;n l&agrave;m vi?c s? gi&uacute;p b?n th?y tinh th?n thu th&aacute;i hon, gi?m du?c strees r?t nhi?u, t?p trung &yacute; tu?ng v&agrave; kh? nang l&agrave;m vi?c cao d?,&hellip;.Ð?c bi?t, l&agrave;m tang t&iacute;nh th?m m? cho kh&ocirc;ng gian, nh?t l&agrave; hoa n? li&ecirc;n t?c ? c&aacute;c v&ugrave;ng kh&iacute; h?u ?m &aacute;p, m&aacute;t m? nhu nu?c ta.</p>

<p><strong>K? thu?t tr?ng v&agrave; cham s&oacute;c c&acirc;y hoa nh&agrave;i</strong></p>

<p>C&acirc;y hoa nh&agrave;i l&agrave; lo?i c&acirc;y d? tr?ng b?i ch&uacute;ng c&oacute; th&acirc;n h&igrave;nh kh?e m?nh, c&oacute; kh? nang ch?u du?c th?i ti?t kh?c nghi?t k? c? l&agrave; n?ng hay mua. Ch&uacute;ng ta c&oacute; th? tr?ng quanh nam nhung th?i di?m tr?ng t?t nh?t t? th&aacute;ng 2 d?n th&aacute;ng 4.</p>

<p>+/ &Aacute;nh s&aacute;ng: C&acirc;y ph&aacute;t tri?n t?t ? trong m&ocirc;i tru?ng b&oacute;ng r&acirc;m, khi ra hoa th&igrave; c&acirc;y kh&ocirc;ng ua &aacute;nh n?ng.</p>

<p>+/ Nhi?t d? th&iacute;ch h?p: Nhi?t d? sinh tru?ng l&yacute; tu?ng nh?t trong kho?ng 20-25 d? C, hoa ua ?m ?p v&agrave; kh&ocirc;ng ch?u du?c s? gi&aacute; r&eacute;t.</p>

<p>+/ Nu?c: Nhu c?u nu?c trung b&igrave;nh, b?n ch? c?n ch&uacute; &yacute; kh&ocirc;ng d? qu&aacute; kh&ocirc; ho?c qu&aacute; ?m khi tu?i. ? th?i k? d?u th&igrave; n&ecirc;n gi? ?m cho d?t, c&ograve;n v&agrave;o m&ugrave;a kh&ocirc; th&igrave; thu?ng xuy&ecirc;n tu?i nu?c cho c&acirc;y, m&ugrave;a d&ocirc;ng th&igrave; c?n h?n ch?.</p>

<p>+/ Ð?t tr?ng:&nbsp; Th&iacute;ch h?p v?i lo?i d?t c&aacute;t, &iacute;t chua v&agrave; c&oacute; nhi?u ch?t m&ugrave;n, c&oacute; kh? nang toi x?p, tho&aacute;t nu?c t?t. V&igrave; th? b?n c&oacute; th? tr?ng ? lo?i d?t m&ugrave;n, d?t th?t ho?c d?t h?n h?p c&oacute; ch?a ch?t h?u co.</p>

<p><img alt="cay-hoa-nhai-2" src="https://cayvahoa.net/wp-content/uploads/cay-hoa-nhai-2.jpg" style="height:597px; width:600px" /></p>

<p>Khi tr?ng c&acirc;y hoa nh&agrave;i trong ch?u tru?c hi&ecirc;n nh&agrave; th&igrave; n&ecirc;n t?o kh&ocirc;ng gian d?p, thom ng&aacute;t cho ngu?i hu?ng th?. Ng&agrave;y nay, hoa nh&agrave;i du?c ?ng d?ng trong vi?c s?n xu?t tr&agrave; nh&agrave;i, tr&agrave; l&agrave;i,&hellip;tr? th&agrave;nh m?t trong nh?ng thuong hi?u m? ph?m nu?c hoa v&agrave; c&aacute;c s?n ph?m kh&aacute;c t? huong hoa nh&agrave;i.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (12, 1, N'Cây ngân hậu', N'cay-ngan-hau-2.jpg', 300000, 5, N'Cây ngân hậu thuộc loài cây cảnh đẹp, thường được dùng trang trí nội thất văn phòng, quán ăn, nhà hàng,…ngân hậu mang đến sự may mắn cho gia chủ.', N'<p><a href="https://cayvahoa.net/cay-ngan-hau/">C&acirc;y ng&acirc;n h?u</a>&nbsp;thu?c lo&agrave;i c&acirc;y c?nh&nbsp;d?p, thu?ng&nbsp;du?c d&ugrave;ng&nbsp;trang tr&iacute; n?i th?t van ph&ograve;ng, qu&aacute;n&nbsp;an, nh&agrave; h&agrave;ng,&hellip;ng&acirc;n h?u mang&nbsp;d?n s? may m?n cho gia ch?. Ng&acirc;n h?u t&ecirc;n khoa h?c Aglaonema marantifolium, h? (Areceae) ngu?n g?c t?&nbsp;d?o Muluca, Philippin.</p>

<p><img alt="cay-ngan-hau -3" src="https://cayvahoa.net/wp-content/uploads/cay-ngan-hau-3.jpg" style="height:480px; width:640px" /></p>

<p>B?n th?y&nbsp;d?y n?u van ph&ograve;ng c?a m&igrave;nh, ph&ograve;ng kh&aacute;ch hay h&agrave;nh lang c&oacute; m?t ch?u c&acirc;y ng&acirc;n h?u&nbsp;d?t&nbsp;?&nbsp;d&oacute; th&igrave; s? l&agrave;m cho kh&ocirc;ng gian tr? n&ecirc;n tho&aacute;ng&nbsp;d&atilde;ng, m&aacute;t m?, tho?i m&aacute;i hon r?t nhi?u.</p>

<p>C&acirc;y ng&acirc;n h?u th&iacute;ch nghi v?i m&ocirc;i tru?ng&nbsp;&aacute;nh s&aacute;ng,&nbsp;? nhi?t&nbsp;d? th?p, c&oacute; t?c&nbsp;d? tang tru?ng nhanh, ch?u b&oacute;ng b&aacute;n ph?n ho&agrave;n to&agrave;n, th&iacute;ch h?p l&agrave;m c&acirc;y n?i th?t,&nbsp;ua kh&iacute; h?u m&aacute;t m?,&nbsp;?m th?p.</p>

<p>* _ *&nbsp;C&acirc;y v?n ni&ecirc;n thanh leo c?t</p>

<p><strong>Ð?c&nbsp;di?m c?a c&acirc;y ng&acirc;n h?u</strong></p>

<p>L&agrave; c&acirc;y c&oacute; s?c s?ng r?t m?nh li?t, l&acirc;u nam thu?ng m?c th&agrave;nh b?i, g?n nhu kh&ocirc;ng c&oacute; th&acirc;n c&acirc;y. C&aacute;c phi?n l&aacute; c&oacute; m&agrave;u xanh nh?t&nbsp;? m?t du?i,&nbsp;? m?t tr&ecirc;n th&igrave; xanh&nbsp;d?m, nh?ng v?t xanh nh?t chi?m ph?n l?n tr&ecirc;n phi?n l&aacute; c&aacute;c g&acirc;n&nbsp;? gi?a r?t r&otilde; r&agrave;ng m&agrave;u xanh&nbsp;d?m.</p>

<p><img alt="cay-ngan-hau -1" src="https://cayvahoa.net/wp-content/uploads/cay-ngan-hau-1.jpg" style="height:428px; width:500px" /></p>

<p>L&aacute; c&acirc;y m?c ch? y?u tr&ecirc;n m?t&nbsp;d?t, l?n d?ng thu&ocirc;n nh?n&nbsp;? 2&nbsp;d?u, cu?ng d&agrave;i, m?nh m?m. H&igrave;nh d?ng c?a nh?ng chi?c l&aacute; h&igrave;nh tr&aacute;i xoan d&agrave;i, l&aacute; c&oacute; m&agrave;u xanh m&aacute;t,&nbsp;du?ng g&acirc;n h&igrave;nh xuong c&aacute; mang&nbsp;d?n m?t v?&nbsp;d?p r?t ri&ecirc;ng bi?t.</p>

<p>C&acirc;y ng&acirc;n h?u thu?c lo&agrave;i c&acirc;y b?i c&oacute; chi?u cao&nbsp;d?t t? 30 cm &ndash; 50 cm, r?t th&iacute;ch h?p tr?ng trong ch?u. N?u nh&igrave;n th?c t? b?ng m?t th&igrave; ch&uacute;ng thu?c d?ng th&acirc;n th?ng, tr?ng c&oacute; nhi?u v?t seo do v?t l&aacute; r?ng, x?p s&aacute;t v&agrave;o nhau, c&acirc;y c&oacute; m&agrave;u xanh tr&ocirc;ng cung r?t l? m?t c&ugrave;ng c&aacute;c&nbsp;d?m s&aacute;ng. T&aacute;n l&aacute; c&acirc;y x&ograve;e r?ng xung quanh t?o n&ecirc;n&nbsp;di?m nh?n r?t&nbsp;?n tu?ng.</p>

<p><img alt="cay-ngan-hau -2" src="https://cayvahoa.net/wp-content/uploads/cay-ngan-hau-2.jpg" style="height:505px; width:480px" /></p>

<p><strong>K? thu?t cham s&oacute;c c&acirc;y tr?ng</strong></p>

<p>Ð?i v?i c&acirc;y ng&acirc;n h?u th&igrave; ngu?i ta thu?ng d&ugrave;ng phuong ph&aacute;p nh&acirc;n gi?ng b?ng c&aacute;ch t&aacute;ch b?i. C&aacute;ch cham s&oacute;c tuong&nbsp;d?i d? cung nhu nh?ng lo?i c&acirc;y c?nh kh&aacute;c. Tuy nhi&ecirc;n,&nbsp;d? cho b?n c&oacute; th? cham s&oacute;c cho c&acirc;y m?t c&aacute;ch t?t nh?t, c&acirc;y c&oacute; kh? nang ph&aacute;t tri?n th&igrave; b?n n&ecirc;n xem th&ocirc;ng tin du?i&nbsp;d&acirc;y:</p>

<p>+ C&acirc;y chuy&ecirc;n d&ugrave;ng&nbsp;d? trang tr&iacute; trong nh&agrave; th&igrave; lu?ng nu?c kh&ocirc;ng n&ecirc;n tu?i qu&aacute; nhi?u. V&agrave;o m&ugrave;a h&egrave;, th&igrave; b?n n&ecirc;n tu?i ng&agrave;y 2 l?n&nbsp;d? tang cu?ng&nbsp;d?&nbsp;?m, l&agrave;m s?ch l&aacute; c&oacute; l?i cho qu&aacute; tr&igrave;nh quang h?p c?a c&acirc;y gi&uacute;p c&acirc;y c&oacute; kh? nang xanh t?t hon.</p>

<p>+ B?n luu&nbsp;&yacute; khi tu?i nu?c cho c&acirc;y th&igrave; n&ecirc;n tu?i&nbsp;d?u l&ecirc;n th&acirc;n c&acirc;y v&agrave; g?c c&acirc;y. H&agrave;ng tu?n th&igrave; n&ecirc;n cho c&acirc;y ti?p x&uacute;c v?i&nbsp;&aacute;nh n?ng m?t tr?i kho?ng 30 ph&uacute;t&nbsp;&iacute;t nh?t.</p>

<p>+ B?n luu&nbsp;&yacute; kh&ocirc;ng&nbsp;du?c d&ugrave;ng thu?c x?t mu?i&nbsp;d? tr? s&acirc;u ho?c thu?c tr? s&acirc;u.</p>

<p>+&nbsp;Ð?i v?i c&aacute;c b?nh ph?n tr?ng c&oacute; th? d&ugrave;ng khan ho?c c?n lau s?ch&nbsp;d?&nbsp;d?m b?o cho b?nh kh&ocirc;ng b? l&acirc;y lan.</p>

<p>+ Khi c&acirc;y b? kh&ocirc;, h&eacute;o hay v&agrave;ng&nbsp;&uacute;a, r?ng&nbsp;&uacute;a kh&ocirc;ng n&ecirc;n cho&nbsp;&aacute;nh s&aacute;ng m?t tr?i chi?u tr?c ti?p&nbsp;d? l&agrave;m cho c&acirc;y ch?t do m?t nu?c.</p>

<p>+ N&ecirc;n&nbsp;d? c&acirc;y&nbsp;? khu v?c tr&aacute;nh gi&oacute;, cham s&oacute;c noi m&aacute;t m?, kh&ocirc;ng kh&iacute; trong l&agrave;nh&nbsp;d? c&acirc;y c&oacute; kh? nang ph&aacute;t tri?n t?t nh?t.</p>

<p>+ N&ecirc;n ch?n lo?i&nbsp;d?t m?c,&nbsp;d?t ph&ugrave; sa&nbsp;d? tr?ng.</p>

<p>+ N&ecirc;n b&oacute;n l&oacute;t b?ng ph&acirc;n b?c tru?c khi tr?ng c&acirc;y.</p>

<p>*-*&nbsp;C&acirc;y thi?t m?c lan trong phong th?y</p>

<p><img alt="cay-ngan-hau" src="https://cayvahoa.net/wp-content/uploads/cay-ngan-hau.jpg" style="height:468px; width:468px" /></p>

<p>Th? gi?i c&acirc;y v&agrave; hoa hi?n&nbsp;dang l&agrave; nh&agrave; ph&acirc;n ph?i c&acirc;y c?nh tr&ecirc;n to&agrave;n qu?c. Ng&acirc;n h?u l&agrave; m?t lo?i c&acirc;y c?nh&nbsp;dang&nbsp;du?c r?t nhi?u kh&aacute;ch h&agrave;ng&nbsp;ua chu?ng.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (13, 1, N'Cây đại lan', N'cay-dai-lan-1.jpg', 500000, 5, N'Cây đại lan được sử dụng trang trí nội thất văn phòng rất phổ biến, có nguồn gốc từ nhiệt đới, Châu Á. Thân cỏ mọc thẳng, lá thuôn dài hình bầu dục, màu xanh đậm.', N'<p>C&acirc;y&nbsp;d?i lan&nbsp;du?c s? d?ng trang tr&iacute; n?i th?t van ph&ograve;ng r?t ph? bi?n, c&oacute; ngu?n g?c t? nhi?t&nbsp;d?i, Ch&acirc;u&nbsp;&Aacute;. Th&acirc;n c? m?c th?ng, l&aacute; thu&ocirc;n d&agrave;i h&igrave;nh b?u d?c, m&agrave;u xanh&nbsp;d?m. X?p l&aacute; t?a tr&ograve;n theo th&acirc;n c&acirc;y, cum mo th?ng. C&acirc;y c&oacute; kh? nang s?ng trong m&ocirc;i tru?ng b&aacute;n d&acirc;m, ph&ugrave; h?p cho vi?c trang tr&iacute;&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-noi-that-cay-van-phong/">c&acirc;y c?nh trong van ph&ograve;ng</a>&nbsp;tr? n&ecirc;n&nbsp;d?p hon, s?ch s? hon, m?t kh&ocirc;ng gian s?ng th?t tho?i m&aacute;i.</p>

<p><img alt="cay-dai-lan-2" src="https://cayvahoa.net/wp-content/uploads/cay-dai-lan-2.jpg" style="height:307px; width:500px" /></p>

<p>B?n&nbsp;dang t&igrave;m hi?u c&acirc;y&nbsp;d?a lan&nbsp;d? tr?ng trang tr&iacute; n?i th?t, ngo?i th?t trong van ph&ograve;ng hay nh&agrave; ri&ecirc;ng. V?i ch?u c&acirc;y n&agrave;y th&igrave; b?n c&oacute; th?&nbsp;trung b&agrave;y&nbsp;? c&aacute;c van ph&ograve;ng l&agrave;m vi?c, kh&ocirc;ng gian l?n, trong ph&ograve;ng kh&ocirc;ng c&oacute; nhi?u&nbsp;d? trang tr&iacute;,&hellip;</p>

<h2><strong>Ch?n v? tr&iacute; th&iacute;ch h?p&nbsp;d?t c&acirc;y&nbsp;d?i lan</strong></h2>

<p>C&acirc;y c&oacute; kh? nang sinh tru?ng t?t trong m&ocirc;i tru?ng&nbsp;&aacute;nh s&aacute;ng, n?u&nbsp;d?t trong c&aacute;c ph&ograve;ng t?i th&igrave; ngu?i ta ph?i d&ugrave;ng th&ecirc;m&nbsp;&aacute;nh&nbsp;d&egrave;n s&aacute;ng,&nbsp;&aacute;nh s&aacute;ng t? c&aacute;c lo?i&nbsp;d&egrave;n n&agrave;y cung gi?ng nhu&nbsp;&aacute;nh s&aacute;ng m?t tr?i n&ecirc;n c&acirc;y c&oacute; kh? nang quang h?p&nbsp;du?c gi?ng m&ocirc;i tru?ng b&ecirc;n ngo&agrave;i gi&uacute;p s? ph&aacute;t tri?n c?a c&acirc;y tuoi t?t.</p>

<p>Ch?n v? tr&iacute; trung t&acirc;m trang tr&iacute; nhu: Ph&ograve;ng h?p, b&agrave;n h?p, b&agrave;n h?i ngh?, b&agrave;n l&agrave;m vi?c,&hellip;</p>

<p>&lt;&nbsp;<a href="https://cayvahoa.net/cay-bang-singapore/">C&acirc;y hoa gi?y</a>&nbsp;/&nbsp;<a href="https://cayvahoa.net/cay-bang-singapore/">c&acirc;y b&agrave;ng singapore</a>&nbsp;/&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-de-ban/">c&acirc;y c?nh d? b&agrave;n</a>&nbsp;&gt;</p>

<p><img alt="cay-dai-lan-1" src="https://cayvahoa.net/wp-content/uploads/cay-dai-lan-1.jpg" style="height:320px; width:275px" /></p>

<h2><strong>L?i&nbsp;&iacute;ch c?a vi?c trang tr&iacute; c&acirc;y d?i lan trong van ph&ograve;ng</strong></h2>

<p>V?i th&acirc;n h&igrave;nh xinh x?n r?t ph&ugrave; h?p tr?ng trong nh?ng ch?u k&iacute;ch c? trung b&igrave;nh,&nbsp;d?t&nbsp;? v? tr&iacute; th&iacute;ch h?p t?o n&ecirc;n kh&ocirc;ng gian gian&nbsp;d?p, thu gi&atilde;n cho ngu?i d&ugrave;ng.</p>

<p>C&acirc;y c&oacute; kh? nang ch?u b&oacute;ng t?o&nbsp;d?&nbsp;?m th&iacute;ch h?p trong m&ocirc;i tru?ng m&aacute;y l?nh. Cung kh&ocirc;ng qu&aacute; kh&oacute; cham s&oacute;c trong m&ocirc;i tru?ng b&oacute;ng, nhu c?u nu?c trung b&igrave;nh, ch? c?n tu?i&nbsp;d?&nbsp;?m, c&oacute; kh? nang ch?u h?n t? n&ecirc;n c&oacute; th? v&agrave;i ng&agrave;y tu?i m?t l?n n&ecirc;n cung tuong&nbsp;d?i d? d&agrave;ng. N?u mu?n c&acirc;y ph&aacute;t tri?n xanh t?t th&igrave; 1 th&aacute;ng n&ecirc;n b&oacute;n ph&acirc;n l?n, h&agrave;ng ng&agrave;y n?u l&aacute; b?n th&igrave; n&ecirc;n lau s?ch&nbsp;d? c&acirc;y&nbsp;d?p hon v&agrave; c&oacute; kh? nang thu h&uacute;t kh&iacute;&nbsp;d?c t?t nh?t.</p>

<p><img alt="cay-dai-lan" src="https://cayvahoa.net/wp-content/uploads/cay-dai-lan.jpg" style="height:560px; width:562px" /></p>

<p>Theo nghi&ecirc;n c?u t? c&aacute;c nh&agrave; khoa h?c cho bi?t th&igrave; trong qu&aacute; tr&igrave;nh quang h?p c&acirc;y c&oacute; t&aacute;c d?ng l?c kh&iacute;, h?p thu c&aacute;c lo?i kh&iacute;&nbsp;d?c gi&uacute;p cho kh&ocirc;ng gian tr? n&ecirc;n trong s?ch, gi?m stress v&agrave; l&agrave;m tang hi?u qu? c&ocirc;ng vi?c.</p>

<p>C&acirc;y d?i lan l&agrave; m?t lo&agrave;i c&acirc;y c?nh&nbsp;du?c r?t&nbsp;ua chu?ng tr?ng trang tr&iacute; trong van ph&ograve;ng, nh&agrave;&nbsp;?, g&oacute;c l&agrave;m vi?c,..n&oacute; v?a t?o n&ecirc;n m?t kh&ocirc;ng gia&nbsp;d?p, s?ch s? c&ograve;n mang&nbsp;d?n cho m?i gia ch? m?t b?u kh&ocirc;ng kh&iacute; trong l&agrave;nh. Ch&iacute;nh v&igrave; v?y, hi?n nay lo&agrave;i c&acirc;y n&agrave;y&nbsp;dang&nbsp;du?c r?t ngu?i ngu?i san&nbsp;d&oacute;n.</p>

<p>Tuy nhi&ecirc;n, cung c&oacute; m?t s? ngu?i chua bi?t&nbsp;d?n nh?ng l?i&nbsp;&iacute;ch c?a c&acirc;y d?i lan n&ecirc;n trong b&agrave;i n&agrave;y Th? gi?i c&acirc;y v&agrave; hoa xin chia s? nh?ng th&ocirc;ng tin v? c&acirc;y&nbsp;d? gi&uacute;p nh?ng ai&nbsp;dang y&ecirc;u th&iacute;ch bi?t r&otilde; hon. K? thu?t cham s&oacute;c c&acirc;y r?t&nbsp;don gi?n, d? tr?ng v&agrave; c&acirc;y c&oacute; s?c s?ng t?t mang&nbsp;d?n nhi?u hi?u qu? v&agrave; l?i&nbsp;&iacute;ch cho ngu?i tr?ng.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (14, 1, N'Cây trầu bà lá xẻ', N'Cay-trau-ba-la-xe.jpg', 500000, 0, N'Cây trầu bà lá xẻ dễ trồng, dễ chăm sóc nên được ưa chuộng trồng nội thất và trong văn phòng, phòng khách rất đẹp với hình dạng rất đẹp mắt,..', N'<p><a href="https://cayvahoa.net/cay-trau-ba-la-xe/">C&acirc;y tr?u b&agrave; l&aacute; x?&nbsp;</a>d? tr?ng, d? cham s&oacute;c n&ecirc;n&nbsp;du?c&nbsp;ua chu?ng&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-noi-that-cay-van-phong/">tr?ng n?i th?t v&agrave; trong van ph&ograve;ng</a>, ph&ograve;ng kh&aacute;ch r?t d?p v?i h&igrave;nh d?ng r?t d?p m?t, l&aacute; c&oacute; m&ugrave;i thom r?t d?c bi?t v&agrave; c&ograve;n c&oacute; t&aacute;c d?ng l?c kh&ocirc;ng kh&iacute; v&agrave; c?i thi?n m&ocirc;i tru?ng s?ng. Nh?ng b?i c&acirc;y nh? c&oacute; kh? nang s?ng trong dung d?ch&nbsp;? ch?u th?y tinh&nbsp;d? trang tr&iacute; t?i c&aacute;c b&agrave;n l&agrave;m vi?c r?t&nbsp;d?p v&agrave; ti?n&nbsp;&iacute;ch.</p>

<p>T&ecirc;n thu?ng g?i: C&acirc;y tr?u b&agrave; l&aacute; x?</p>

<p>T&ecirc;n kh&aacute;c: C&acirc;y tr?u b&agrave; ch&acirc;n v?t, tr?u b&agrave; kh&iacute;a</p>

<p>T&ecirc;n khoa h?c: Philodendron xanadu</p>

<p>T&ecirc;n ti?ng anh: Xanadu, Philodendron</p>

<p>Thu?c h?: R&aacute;y (Areceae)</p>

<p>&lt;&gt;&nbsp;<a href="https://cayvahoa.net/cay-trau-ba-de-vuong-xanh/">C&acirc;y tr?u b&agrave; d? vuong xanh</a></p>

<p><img alt="cay-trau-ba-la-xe-02" src="https://cayvahoa.net/wp-content/uploads/cay-trau-ba-la-xe-02.jpg" style="height:410px; width:564px" /></p>

<p><strong>Ð?c&nbsp;di?m h&igrave;nh th&aacute;i:</strong></p>

<p>+ Chi?u cao trung b&igrave;nh c?a c&acirc;y tr?u b&agrave; l&aacute; x?&nbsp;d?t t? 0.8m &ndash; 1.2m.</p>

<p>+ Thu?c lo?i c&acirc;y m?c th&agrave;nh b?i nh?, th&acirc;n th?o, l&aacute; c&oacute; cu?ng d&agrave;i, m&agrave;u xanh l?c t?p trung&nbsp;?&nbsp;d?u c&agrave;nh, ch&igrave;a th&ugrave;y d?ng l&ocirc;ng chim r?t&nbsp;d?p.</p>

<p>+ C&acirc;y&nbsp;du?c ph&acirc;n c&agrave;nh th&agrave;nh nhi?u nh&aacute;nh, x?p t?a ra r?t&nbsp;d?u nhau.</p>

<p>+ C&acirc;y c&oacute; hoa, qu? v&agrave; h?y m?c th&agrave;nh c?m d?ng mo.</p>

<p>+ C&oacute; nhi?u r? kh&iacute; sinh tr?ng trong c&aacute;c ch?u th?y tinh s? r?t&nbsp;d?p.</p>

<p>+ L&aacute; c&oacute; m&ugrave;i huong&nbsp;d?c bi?t, h&igrave;nh d&aacute;ng l? m?t, d&aacute;ng l&aacute; h&igrave;nh d?ng c&aacute;ch&nbsp;di?u.</p>

<p>+ C&acirc;y c&oacute; kh? nang l?c kh&ocirc;ng kh&iacute; gi&uacute;p m&ocirc;i tru?ng s?ng&nbsp;trong s?ch.</p>

<h2><strong>&nbsp;&Yacute; nghia c?a c&acirc;y tr?u b&agrave; l&aacute; x? trong&nbsp;d?i s?ng</strong></h2>

<p>Ð&atilde; r?t nhi?u ngu?i tin r?ng: C&acirc;y mang&nbsp;d?n cho ch&uacute;ng ta&nbsp;di?u may m?n, t&agrave;i l?c v&agrave; ni?m vui trong cu?c s?ng c?a m&igrave;nh, mang&nbsp;d?n nh?ng l?i&nbsp;&iacute;ch v? s?c kh?e gi&uacute;p tinh th?n tho?i m&aacute;i, gi?m strees,..Ch&iacute;nh&nbsp;di?u n&agrave;y,&nbsp;d&atilde;&nbsp;du?c ngu?i ta&nbsp;ua chu?ng&nbsp;d? tr?ng hay l&agrave;m qu&agrave; t?ng cho b?n b&egrave;, kh&aacute;ch h&agrave;ng, ngu?i th&acirc;n.</p>

<p><img alt="Cay-trau-ba-la-xe-1" src="https://cayvahoa.net/wp-content/uploads/Cay-trau-ba-la-xe-1.jpg" style="height:705px; width:550px" /></p>

<p>C&acirc;y th&iacute;ch h?p tr?ng n?i th?t&nbsp;d?p, ki?u d&aacute;ng&nbsp;d?p, h?p d?n thu h&uacute;t&nbsp;du?c nhi?u t?m nh&igrave;n. C&acirc;y thu?ng&nbsp;du?c ch?n tr?ng trong ch?u&nbsp;d? trang tr&iacute; t?i ph&ograve;ng kh&aacute;ch, b&agrave;n l&agrave;m vi?c, h&agrave;nh lang, khu h&agrave;nh ch&iacute;nh,&hellip;.V?i m?c&nbsp;d&iacute;ch l?c kh&ocirc;ng kh&iacute;, ph&ugrave; h?p cho nh?ng khu v?c&nbsp;&iacute;t luu th&ocirc;ng l&agrave;m c?i thi?n m&ocirc;i tru?ng s?ng.</p>

<p><img alt="1375423957_thanhxuan" src="https://cayvahoa.net/wp-content/uploads/1375423957_thanhxuan.jpg" style="height:324px; width:432px" /></p>

<p><strong>K? thu?t tr?ng v&agrave; cham s&oacute;c c&acirc;y tr?u b&agrave; l&aacute; x?</strong></p>

<p>C&acirc;y&nbsp;du?c ch?n phuong ph&aacute;p nh&acirc;n gi?ng b?ng c&aacute;ch t&aacute;ch c&acirc;y con.</p>

<p>Ð?u ti&ecirc;n,&nbsp;d? c&acirc;y c&oacute; kh? nang sinh tru?ng v&agrave; ph&aacute;t tri?n t?t th&igrave; v?i&nbsp;di?u ki?n kh&iacute; h?u&nbsp;? nu?c ta hi?n nay th&igrave; c&acirc;y thu?c lo?i ch?u b&oacute;ng b&aacute;n ph?n n&ecirc;n c?n&nbsp;d?m b?o v?&nbsp;d?t tr?ng, nu?c, ph&acirc;n b&oacute;n v&agrave; c&aacute;ch cham s&oacute;c t?t th&igrave; c&acirc;y s? ph&aacute;t tri?n tuoi t?t. Thu?c c&acirc;y y&ecirc;u th&iacute;ch kh&iacute; h?u n&oacute;ng&nbsp;?m nhung kh? nang ch?u r&eacute;t k&eacute;m, th&iacute;ch h?p cho nh?ng noi&nbsp;d?y&nbsp;d?&nbsp;&aacute;nh s&aacute;ng m?t tr?i, kh&ocirc;ng th&iacute;ch h?p cho&nbsp;&aacute;nh n?ng tr?c ti?p. Nhi?t&nbsp;d? th&iacute;ch h?p n?m trong kho?ng 18&deg;C &ndash; 30&deg;C.</p>

<p>+&nbsp;Ð?t tr?ng:&nbsp;Ð?t l&agrave; ngu?n dinh du?ng thi?t y?u cho c&acirc;y, ch&uacute;ng ta c&oacute; th? s? d?ng&nbsp;d?t h?n h?p t? tro, x&aacute;c d?a,&nbsp;d?t toi x?p&nbsp;d?&nbsp;d?m b?o s? ph&aacute;t tri?n cho c&acirc;y.</p>

<p>+ Nu?c: Tu?i 3 l?n m?i tu?n cho c&acirc;y&nbsp;d?m b?o lu?ng nu?c ph&ugrave; h?p v?i m&ocirc;i tru?ng s?ng. Nhung luu&nbsp;&yacute; kh&ocirc;ng n&ecirc;n tu?i qu&aacute;&nbsp;d?m s? g&acirc;y ra t&igrave;nh tr?ng ng?p&nbsp;&uacute;ng cho c&acirc;y.</p>

<p>+ Ph&acirc;n b&oacute;n: D&ugrave;ng ph&acirc;n NPK&nbsp;d? b&oacute;n cho c&acirc;y</p>

<p>+ Thu?ng xuy&ecirc;n c?t t?a nh?ng c&agrave;nh, l&aacute;&nbsp;&uacute;a, hu h?ng gi&uacute;p c&acirc;y th&ocirc;ng tho&aacute;ng v&agrave; tr? n&ecirc;n&nbsp;d?p hon.</p>

<p><img alt="Cay-trau-ba-la-xe-2" src="https://cayvahoa.net/wp-content/uploads/Cay-trau-ba-la-xe-2.jpg" style="height:514px; width:600px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (15, 1, N'Cây lưỡi cọp', N'Cay-luoi-cop-3.jpg', 700000, 0, N'Cây lưỡi cọp là một loài thực vật có hoa trong họ nhà Măng tây, tên khoa học: Sansevieria hyacinthoides, xuất hiện vào năm 1913 được miêu tả bởi (L.) Druce.', N'<p><a href="https://cayvahoa.net/cay-luoi-cop/">C&acirc;y lu?i c?p</a>&nbsp;l&agrave; m?t lo&agrave;i th?c v?t c&oacute; hoa trong h? nh&agrave; Mang t&acirc;y, t&ecirc;n khoa h?c: Sansevieria hyacinthoides, xu?t hi?n v&agrave;o nam 1913&nbsp;du?c mi&ecirc;u t? b?i (L.) Druce.</p>

<p>T&ecirc;n thu?ng g?i: C&acirc;y lu?i c?p</p>

<p>T&ecirc;n khoa h?c:&nbsp;Sansevieria hyacinthoides</p>

<p>T&ecirc;n kh&aacute;c: h? vi, h?&nbsp;thi?t</p>

<p>Ngu?n g?c: t? Nigeria</p>

<p>C&acirc;y lu?i c?p thu?c lo&agrave;i c&acirc;y m?ng nu?c, th?c v?t kh&ocirc;ng c&oacute; th&acirc;n tr&ecirc;n m?t&nbsp;d?t, c&acirc;y m?c th?ng&nbsp;d?ng chi?u d&agrave;i t? 30-80 cm, c&oacute; th&acirc;n r?, l&aacute; lu?i c?p&nbsp;d&agrave;y, c?ng, d?ng gi&aacute;o h?p m?c th&agrave;nh b?i 5-6 l&aacute;. L&aacute; lu?i c?p k?t h?p h&agrave;i h&ograve;a gi?a m&aacute;u xanh b&oacute;ng, xanh&nbsp;d?m v&agrave; hai d?i m&agrave;u v&agrave;ng k&eacute;o t? g?c&nbsp;d?n ng?n, khi lu?i c?p&nbsp;c&oacute; m&agrave;u tr?ng l?c nh?t &nbsp;m?m m?i, c&oacute; 6 c&aacute;nh thu&ocirc;n d&agrave;i 3,5 cm. Hoa c?a lu?i c?p r?t hi?m g?p m?m m?i,&nbsp;d?i l?p v?i th&acirc;n l&aacute;.</p>

<p>__&nbsp;C&acirc;y lu?i h?&nbsp;/ t?ng h?p c&acirc;y phong th?y theo tu?i</p>

<p><img alt="Cay-luoi-cop" src="https://cayvahoa.net/wp-content/uploads/Cay-luoi-cop.jpg" style="height:450px; width:600px" /></p>

<p><strong>&Yacute; nghia theo phong th?y c?a c&acirc;y lu?i c?p</strong></p>

<p>C&acirc;y lu?i c?p mang&nbsp;d?n cho gia ch?&nbsp;&yacute; nghia may m?n, an cu l?c nghi?p, t&agrave;i l?c d?i d&agrave;o. Ch&iacute;nh&nbsp;&yacute; nghia nhu v&acirc;y m&agrave;&nbsp;d&atilde;&nbsp;du?c nhi?u ngu?i l&agrave;m qu&agrave; t?ng cho&nbsp;d?i t&aacute;c, b?n b&egrave;, t&acirc;n gia.</p>

<p>Theo quan ni?m c?a Phuong&nbsp;Ð&ocirc;ng, Trung Qu?c, Nh?t B?n th&igrave; c&acirc;y lu?i c?p l&agrave; m?t lo&agrave;i c&acirc;y phong th?y thu?c c&acirc;y bi?u trung cho s?c m?nh c?a lo&agrave;i h? d? nh?m xua&nbsp;du?i ma qu?, ch?ng l?i s? b? b&ugrave;a, l&aacute; lu?i c?p m?c th?ng&nbsp;d?ng tu?ng trung cho s?c m?nh c&aacute; nh&acirc;n.</p>

<p>Ngo&agrave;i ra, c&acirc;y lu?i c?p c&ograve;n&nbsp;du?c xem l&agrave; lo&agrave;i c&acirc;y c&oacute; kh? nang h?p th?&nbsp;d?c t? g&acirc;y ung thu nhu: Formaldehyde v&agrave; nitrogenoxide. T?&nbsp;d&oacute;, ngu?i ta s? d?ng&nbsp;d? tr?ng trong ph&ograve;ng ng? b?i v&igrave; gi&uacute;p tang cu?ng oxy v&agrave;o ban&nbsp;d&ecirc;m. C&acirc;y c&oacute; t&aacute;c d?ng h?p thu ch?t g&acirc;y&nbsp;&ocirc; nhi?m, c?i thi?n kh&ocirc;ng gian s?ng v&agrave; l&agrave; lo?i c&acirc;y s?ng l&acirc;u b?n, c&oacute; nhi?u c&ocirc;ng d?ng, hi?u qu? nh?t. Theo NASA th&igrave; lu?i c?p c&oacute; kh? nang h?p thi&nbsp;du?c formaldehyde 0,938 grams/h, v?i m?t ph&ograve;ng di?n t&iacute;ch r?ng kho?ng 75m2 th&igrave; n&ecirc;n tr?ng 1 c&acirc;y gi? cho can ph&ograve;ng kh&ocirc;ng b?&nbsp;&ocirc; nhi?m.</p>

<p><img alt="Cay-luoi-cop-3" src="https://cayvahoa.net/wp-content/uploads/Cay-luoi-cop-3.jpg" style="height:600px; width:550px" /></p>

<p><strong>K? thu?t tr?ng v&agrave; cham s&oacute;c c&acirc;y lu?i c?p</strong></p>

<p>L&agrave; lo&agrave;i c&acirc;y c&oacute; kh? nang ch?u n&oacute;ng, ch?u kh&ocirc; h?n v&agrave; cung c&oacute; th? s?ng&nbsp;du?c trong m&ocirc;i tru?ng thi?u&nbsp;&aacute;nh s&aacute;ng v?i th?i gian d&agrave;i nhung&nbsp;d? c&acirc;y ph&aacute;t tri?n nhanh ch&oacute;ng th&igrave; ch&uacute;ng ta cung n&ecirc;n t&igrave;m hi?u&nbsp;v? k? thu?t tr?ng v&agrave; cham s&oacute;c c&acirc;y nhu sau:</p>

<p>+&nbsp;<strong>&Aacute;nh s&aacute;ng:&nbsp;</strong>Ua th&iacute;ch kh&iacute; h?u kh&ocirc; n&oacute;ng, ch?u r&eacute;t kh&aacute; k&eacute;m n&ecirc;n&nbsp;du?c ch?u&nbsp;&aacute;nh n?ng tr?c ti?p, kh?e m?nh trong nh&agrave; v&agrave;&nbsp;? noi b&oacute;ng r&acirc;m.</p>

<p>+&nbsp;<strong>Ð?t tr?ng:</strong>&nbsp;Lo?i&nbsp;d?t th&iacute;ch h?p nh?t l&agrave;&nbsp;d?t pha c&aacute;t v&agrave; s?i, n&ecirc;n ch?n lo?i&nbsp;d?t c&oacute;&nbsp;d? ki?m cao.</p>

<p>+&nbsp;<strong>Tu?i nu?c:</strong>&nbsp;C&acirc;y c&oacute; kh? nang ch?u h?n r?t t?t do v?y cung kh&ocirc;ng n&ecirc;n tu?i cho c&acirc;y nhi?u s? g&acirc;y t&igrave;nh tr?ng&nbsp;&uacute;ng. V&agrave;o m&ugrave;a&nbsp;d&ocirc;ng th&igrave; th&aacute;ng tu?i l?n, m&ugrave;a h&egrave; hanh kh&ocirc; tang cu?ng hon nhung kho?ng 1 tu?n/ l?n.</p>

<p>+&nbsp;<strong>Nhi?t&nbsp;d? th&iacute;ch h?p:</strong>&nbsp;Ð? c&acirc;y c&oacute; th? ph&aacute;t tri?n t?i&nbsp;t?t th&igrave; nhi?t&nbsp;d?&nbsp;?m&nbsp;&aacute;p t? 18-30&deg;C, n?u nhi?t&nbsp;d? du?i 10&deg;C k&eacute;o d&agrave;i l&acirc;u ng&agrave;u c&oacute; th? l&agrave;m c&acirc;y k&eacute;m ph&aacute;t tri?n v&agrave; ch?t d?n.</p>

<p>+&nbsp;<strong>Ð?&nbsp;?m:</strong>&nbsp;C&acirc;y&nbsp;ua kh&ocirc; n&ecirc;n&nbsp;d?&nbsp;?m trung b&igrave;nh, n?u cao qu&aacute; s? l&agrave;m ch?t c&acirc;y, th?i r?.</p>

<p>+&nbsp;<strong>Ph&acirc;n b&oacute;n:</strong>&nbsp;C&acirc;y c&oacute; kh? nang ph&aacute;t tri?n m?nh m?, nhu c?u dinh du?ng trung b&igrave;nh v&agrave;i th&aacute;ng th&igrave; n&ecirc;n b&oacute;n l?n ph&acirc;n, nhung tr&aacute;nh v&agrave;o m&ugrave;a l?nh v&igrave; c&acirc;y h?p thu k&eacute;m.</p>

<p><img alt="Cay-luoi-cop-2" src="https://cayvahoa.net/wp-content/uploads/Cay-luoi-cop-2.jpg" style="height:668px; width:600px" /></p>

<p>Lu?i c?p l&agrave; m?t trong nh?ng lo?i c&acirc;y&nbsp;du?c nhi?u ngu?i&nbsp;ua chu?ng l&agrave;m&nbsp;c&acirc;y trang tr&iacute; n?i th?t trong nh&agrave;, trong ph&ograve;ng ng?, ph&ograve;ng l&agrave;m vi?c, ph&ograve;ng kh&aacute;ch, h&agrave;ng lang,&hellip;.n&oacute; mang&nbsp;&yacute; nghia may m?n, t&agrave;i l?c cho gia ch?, c&ograve;n c&oacute; kh? nang l&agrave;m s?ch kh&ocirc;ng gian s?ng. V?i nhi?u&nbsp;uu&nbsp;di?m c? v?&nbsp;&yacute; nghia v&agrave; c&aacute;ch tr?ng cham s&oacute;c c&acirc;y tuong&nbsp;d?i d? n&ecirc;n kh&ocirc;ng&nbsp;&iacute;t ngu?i&nbsp;d&atilde; ch?n.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (16, 1, N'Cây bàng singapore', N'Cay-bang-Singapore.jpg', 550000, 0, N'Cây bàng singapore _ Bạn đang có nhu cầu trang trí nội thất, để tìm được cây phù hợp với không gian nhà mình thì bạn hãy tìm hiểu về cây bàng Singapore,...', N'<p><a href="https://cayvahoa.net/cay-bang-singapore/">C&acirc;y b&agrave;ng singapore</a>&nbsp;_ B?n&nbsp;dang c&oacute; nhu c?u trang tr&iacute; n?i th?t,&nbsp;d? t&igrave;m&nbsp;du?c c&acirc;y ph&ugrave; h?p v?i kh&ocirc;ng gian nh&agrave; m&igrave;nh th&igrave; b?n h&atilde;y t&igrave;m hi?u v?&nbsp;c&acirc;y b&agrave;ng Singapore, lo?i c&acirc;y b&agrave;ng&nbsp;d&atilde;&nbsp;du?c du nh?p v&agrave;o Vi?t Nam c&aacute;ch&nbsp;d&acirc;y v&agrave;i nam v&agrave;&nbsp;du?c&nbsp;dua v&agrave;o danh s&aacute;ch nh?ng lo?i c&acirc;y n?i th?t b?n nh?t.&nbsp;C&acirc;y b&agrave;ng l&agrave; m?t trong nh?ng d&ograve;ng c&acirc;y&nbsp;ua th&iacute;ch kh&iacute; h?u&nbsp;?m v&agrave;&nbsp;?m gi?ng nhu kh&iacute; h?u&nbsp;? nu?c ta, c&acirc;y th&iacute;ch nghi v?i&nbsp;&aacute;nh s&aacute;ng nh?,&nbsp;&aacute;nh&nbsp;d&egrave;n. L&agrave; m?t lo?i c&acirc;y nhi?t&nbsp;d?i c&oacute; th? tr?ng trong nh&agrave; c&acirc;y cung ph&aacute;t tri?n r?t t?t.</p>

<p>T&ecirc;n thu?ng g?i: C&acirc;y b&agrave;ng Singapore</p>

<p>T&ecirc;n ti?ng anh: Ficus lyrata</p>

<p>T&ecirc;n khoa h?c: Ficus pandurata</p>

<p>H? th?c v?t: Ficus</p>

<p>Xu?t x?: t? T&acirc;y phi, gi?ng&nbsp;du?c lai t?o t? Singapore r?i ph&aacute;t tri?n m?nh&nbsp;?&nbsp;Ð&agrave;i Loan, sau&nbsp;d&oacute; m?i&nbsp;du?c nh?p v&agrave;o Vi?t Nam.</p>

<p>__&nbsp;C&acirc;y Lan &Yacute;&nbsp;/ C&acirc;y N?i Th?t Van Ph&ograve;ng</p>

<p><img alt="Cay-bang-Singapore" src="https://cayvahoa.net/wp-content/uploads/Cay-bang-Singapore.jpg" style="height:500px; width:500px" /></p>

<p><strong>Ð?c&nbsp;di?m h&igrave;nh th&aacute;i:</strong></p>

<p>C&acirc;y b&agrave;ng ph&aacute;t tri?n ch?m v?i k&iacute;ch thu?c dao&nbsp;d?ng kho?ng 1,5 &ndash; 3(m), m?t kho?ng 10-15 nam&nbsp;d? tr? th&agrave;nh c&acirc;y c&oacute; t&aacute;n l?n v&agrave; r?ng, thu?c c&acirc;y tru?ng th&agrave;nh. Ngu?i ta thu?ng&nbsp;uom c&acirc;y b?ng h?t ho?c gi&acirc;m b?ng c&agrave;nh. Nh?ng chi?c l&aacute; to nh&igrave;n nhu chi?c&nbsp;d&agrave;n violon, t?o n&ecirc;n&nbsp;di?m nh?n cho kh&ocirc;ng gian s? m?i l?, h&agrave;i h&ograve;a, tuoi m&aacute;t nh?m thu h&uacute;t b?i kh?i m&agrave;u xanh c?a phi?n l&aacute; mang&nbsp;d?n cho can ph&ograve;ng kh&aacute;ch, ph&ograve;ng ng? hay nh&agrave; b?p,&hellip;m?t kh&ocirc;ng gian s?ng th?c s? tho?i m&aacute;i v&agrave; thu gi&atilde;n&nbsp;d?u&nbsp;&oacute;c s? c?m th?y nh? nh&agrave;ng hon.</p>

<p>Trong&nbsp;di?u ki?n m&ocirc;i tru?ng t? nhi&ecirc;n th&igrave; c&acirc;y v&agrave; l&aacute; ngo&agrave;i tr?i s? n? hoa v&agrave; sau&nbsp;d&oacute; k?t tr&aacute;i nhung&nbsp;di?u&nbsp;d&oacute; l?i r?t kh&oacute; x?y ra v&igrave; h?u nhu c&acirc;y kh&ocirc;ng ra hoa. Tuy nhi&ecirc;n th&igrave; c&acirc;y v?n c&oacute; kh? nang ph&aacute;t tri?n t?t trong van ph&ograve;ng v&agrave; c? ngo&agrave;i tr?i.</p>

<p><img alt="Cay-bang-Singapore-1" src="https://cayvahoa.net/wp-content/uploads/Cay-bang-Singapore-1.jpg" style="height:700px; width:700px" /></p>

<p><strong>K? thu?t tr?ng c&acirc;y b&agrave;ng Singapore</strong></p>

<p>Ð? c&oacute; ch?u c&acirc;y ph&aacute;t tri?n t?t trong kh&ocirc;ng gian nh&agrave;&nbsp;d?p lung linh, th&igrave; c&aacute;c b?n c?n t&igrave;m hi?u k? thu?t tr?ng c&acirc;y nhu sau:</p>

<p><strong>+ Ch?n&nbsp;d?t tr?ng:</strong>&nbsp;Ð?t tr?ng quan tr?ng gi&uacute;p cho vi?c c&acirc;y ph&aacute;t tri?n c&oacute; t?t hay kh&ocirc;ng? N&ecirc;n s? d?ng lo?i&nbsp;d?t tr?ng c&oacute; tr?n l?n c&aacute;c ch?t dinh du?ng theo t? l? nh?t&nbsp;d?nh.</p>

<p><strong>+ Gi?ng c&acirc;y:</strong>&nbsp;C&oacute; th? ch?n b?ng phuong ph&aacute;p gi&acirc;m c&agrave;nh ho?c c&ocirc;ng ngh? vi sinh.</p>

<p><strong>+&nbsp;&Aacute;nh s&aacute;ng:</strong>&nbsp;C&acirc;y s? ph&aacute;t tri?n t?t trong m&ocirc;i tru?ng&nbsp;&aacute;nh s&aacute;ng cao, c&oacute; kh? nang ph&aacute;t tri?n t?t trong nh&agrave; k&iacute;nh. Luu&nbsp;&yacute;: tr&aacute;nh&nbsp;&aacute;nh n?ng g?t tr?c ti?p t?&nbsp;&aacute;nh m?t tr?i.</p>

<p><strong>+ Nhi?t&nbsp;d? th&iacute;ch h?p tr?ng c&acirc;y:</strong>&nbsp;Nhi?t&nbsp;d? n?m trong kho?ng 16&deg;C -22&deg;C thu?ng s? r?t th&iacute;ch h?p v?i nhi?t&nbsp;d? van ph&ograve;ng c&oacute;&nbsp;di?u h&ograve;a, ph&ugrave; h?p cho nhi?t&nbsp;d? kh&iacute; h?u nhi?t&nbsp;d?i&nbsp;? nu?c ta, phong l?c hoa kh&ocirc;ng ch?u&nbsp;du?c nhi?t&nbsp;d? qu&aacute; th?p ho?c tr&aacute;nh ti?p x&uacute;c v?i nhi?t&nbsp;d? kho?ng 10&deg;C.</p>

<p><strong>+ Nhu c?u nu?c:</strong>&nbsp;C&acirc;y s? r?t nh?y c?m v?i Clo va flo trong nu?c m&aacute;y. Do&nbsp;d&oacute;, h&atilde;y tu?i nu?c cho c&acirc;y b?ng nu?c mua ho?c nu?c gi?ng.</p>

<p><img alt="Cay-bang-Singapore-2" src="https://cayvahoa.net/wp-content/uploads/Cay-bang-Singapore-2.jpg" style="height:643px; width:700px" /></p>

<p><strong>Ch?&nbsp;d? cham s&oacute;c c&acirc;y b&agrave;ng Singapore c?n bi?t</strong></p>

<p>B?n c?n ph?i n?m&nbsp;du?c ch?&nbsp;d? cham s&oacute;c c?a c&acirc;y b&agrave;ng Singapore&nbsp;d?&nbsp;d?m b?o cho c&acirc;y lu&ocirc;n ph&aacute;t tri?n tuoi t?t c? trong ph&ograve;ng v&agrave; ngo&agrave;i tr?i.</p>

<p>Nh?ng c&acirc;y b&agrave;ng&nbsp;du?c tr?ng&nbsp;? ngo&agrave;i tr?i th&igrave; ch&uacute;ng ta n&ecirc;n gi? cho&nbsp;d?t&nbsp;d?&nbsp;?m, tho&aacute;t nu?c t?t. Khi c&acirc;y ph&aacute;t tri?n v&agrave; l?n d?n th&igrave; n&ecirc;n thay ch?u (2 nam/ l?n), thay&nbsp;d?t c&oacute; h?n h?p c&aacute;c ch?t dinh du?ng c?n thi?t cho c&acirc;y. C&ograve;n&nbsp;d?i v?i c&acirc;y&nbsp;du?c tr?ng trong nh&agrave;, van ph&ograve;ng th&igrave; n&ecirc;n tu?i nu?c cho c&acirc;y 2 l?n/ tu?n.</p>

<p>N&ecirc;n b&oacute;n ph&acirc;n cho c&acirc;y kho?ng 2-3 th&aacute;ng/ l?n, luu&nbsp;&yacute; b&oacute;n ph&acirc;n&nbsp;du?c pha lo&atilde;ng, tr&aacute;nh vi?c di chuy?n c&acirc;y nhi?u ho?c tr&aacute;nh nh?ng noi c&oacute; gi&oacute; l&ugrave;a m?nh. Khi c&acirc;y c&oacute; nh?ng l&aacute; gi&agrave;, l&aacute; h&eacute;o hay c&oacute; bi?u hi?n s&acirc;u b?nh th&igrave; n&ecirc;n c?t t?a, l&agrave;m s?ch l&aacute; khi c&oacute; b?i b&aacute;m, thu?ng xuy&ecirc;n phun suong.</p>

<p>C&acirc;y b&agrave;ng Singapore&nbsp;du?c r?t nhi?u&nbsp;ngu?i y&ecirc;u th&iacute;ch tr?ng trong ph&ograve;ng kh&aacute;ch, ph&ograve;ng h?p, nh&agrave; b?p hay h&agrave;nh lang&nbsp;? c&aacute;c nh&agrave; h&agrave;ng, kh&aacute;ch s?n,&hellip;c&ograve;n&nbsp;du?c ch?n l&agrave;m c&acirc;y c?nh quan&nbsp;d? th? t?o b&oacute;ng m&aacute;t.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (17, 1, N'Cây đuôi sam', N'Cay-duoi-sam-1-600x600.jpg', 250000, 0, N'Cây đuôi sam là một trong những loài cây được yêu thích trồng để bàn, quầy thu ngân, phòng khách, bàn làm việc hoặc làm món quà tặng sinh nhật cho người thân đang trở nên rất phổ biến.', N'<p><a href="https://cayvahoa.net/cay-duoi-sam/"><strong>C&acirc;y&nbsp;du&ocirc;i sam</strong></a>&nbsp;l&agrave; m?t trong nh?ng lo&agrave;i c&acirc;y&nbsp;du?c y&ecirc;u th&iacute;ch tr?ng&nbsp;d? b&agrave;n, qu?y thu ng&acirc;n, ph&ograve;ng kh&aacute;ch, b&agrave;n l&agrave;m vi?c ho?c l&agrave;m m&oacute;n qu&agrave; t?ng sinh nh?t cho ngu?i th&acirc;n&nbsp;dang tr? n&ecirc;n r?t ph? bi?n.</p>

<p>T&ecirc;n thu?ng g?i: C&acirc;y&nbsp;du&ocirc;i sam / c&acirc;y th?t b&iacute;m</p>

<p>T&ecirc;n kh&aacute;c: Kim ng&acirc;n, c&acirc;y b&iacute;nh (b&iacute;m) t&oacute;c, c&acirc;y th?t b&iacute;nh, c&acirc;y b&iacute;m&nbsp;du&ocirc;i sam, c&acirc;y ph&aacute;t l?c</p>

<p>T&ecirc;n khoa h?c: Pachia Aquatica</p>

<p>H?: Malvaceae (c?m qu?)</p>

<p>Xu?t x?: Mexico, Brazill Nam M? v&agrave; c&aacute;c&nbsp;d?m l&acirc;y Trung M?</p>

<p>&mdash;&nbsp;<a href="https://cayvahoa.net/cay-thinh-vuong/">https://cayvahoa.net/cay-thinh-vuong/</a></p>

<p><img alt="Cay-duoi-sam" src="https://cayvahoa.net/wp-content/uploads/Cay-duoi-sam.jpg" style="height:600px; width:600px" /></p>

<p><strong>Ð?c&nbsp;di?m h&igrave;nh th&aacute;i&nbsp;</strong></p>

<p>Th&acirc;n c&acirc;y&nbsp;du&ocirc;i sam&nbsp;du?c th?t l?i v?i nhau nhu b&iacute;nh t&oacute;c c?a c&ocirc; g&aacute;i, l&aacute; c&acirc;y x&ograve;e r?ng nhu b&agrave;n tay, l&aacute; xanh quanh nam v?i m&agrave;u xanh man m&aacute;t, hoa thu?ng n? v&agrave;o th&aacute;ng 4&nbsp;d?n th&aacute;ng 11. Nh?ng c&aacute;nh hoa l?n, thu?ng n? v?&nbsp;d&ecirc;m v?i m&agrave;u kem nh?t, t?a huong thoang tho?ng,&nbsp;d&agrave;i hoa c&oacute; m&agrave;u n&acirc;u nh?t h&igrave;nh b?u d?c v?i 5 c&aacute;nh m&agrave;u xanh v&agrave;ng, d&agrave;i 15cm. Qu? c?a c&acirc;y c&oacute; h&igrave;nh tr?ng,&nbsp;du?ng k&iacute;nh kho?ng 10cm, khi ch&iacute;n c&oacute; m&agrave;u n&acirc;u nh?t, qu? kh&ocirc; n?t r?ng vang ra kho?ng 10&nbsp;d?n 10 h?t.</p>

<p>C&acirc;y th?t b&iacute;m&nbsp;th&iacute;ch nghi&nbsp;du?c t?t c? m&ocirc;i tru?ng n&oacute;ng, l?nh,&nbsp;d?y cung&nbsp;du?c xem l&agrave; m?t&nbsp;uu&nbsp;di?m m&agrave; ch&uacute;ng ta c&oacute; th? tr?ng c&acirc;y&nbsp;? m&ocirc;i tru?ng kh&aacute;c nhau.</p>

<p><strong>&Yacute; nghia phong th?y c?a c&acirc;y&nbsp;du&ocirc;i sam</strong></p>

<p>Trong phong th?y, c&acirc;y&nbsp;du&ocirc;i sam v&agrave; c&acirc;y th?t b&iacute;m c&oacute; t&aacute;c d?ng khai v?n; Ph&uacute; qu&yacute; chi&ecirc;u t&agrave;i, m?ng l? v?t, t?t, thang ch?c khai truong. Th&iacute;ch h?p trang tr&iacute; trong ph&ograve;ng h?p, kh&aacute;ch s?n, ph&ograve;ng l&agrave;m vi?c, nh&agrave; h&agrave;ng ho?c c&aacute;c khu h&agrave;nh ch&iacute;nh. Phuong v? khai v?n t?t nh?t l&agrave; hu?ng&nbsp;Ð&ocirc;ng v&agrave; hu?ng&nbsp;Ð&ocirc;ng B?c.</p>

<p>N?u&nbsp;du?c c?t l&ecirc;n c&acirc;y v&agrave;i s?i ch?&nbsp;d? ho?c&nbsp;d?ng ti?n v&agrave;ng th&igrave; c&acirc;y s? tr? th&agrave;nh c&acirc;y ph&aacute;t t&agrave;i m&agrave; ai cung y&ecirc;u th&iacute;ch. Ch&iacute;nh v&igrave; th?, m&agrave; c&acirc;y&nbsp;du?c ch?n l&agrave;m trang tr&iacute; trong nh&agrave; m?i khi v&agrave;o nh?ng d?p l?, t?t.</p>

<p>Nhi?u ngu?i&nbsp;ua chu?ng l&agrave;m qu&agrave; t?ng v?i&nbsp;&yacute; nghia l&agrave; ph&uacute; qu&yacute; chi&ecirc;u t&agrave;i.</p>

<p>&mdash;- Xem th&ecirc;m:&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-noi-that-cay-van-phong/">C&acirc;y n?i th?t van ph&ograve;ng</a></p>

<p><img alt="Cay-duoi-sam-1" src="https://cayvahoa.net/wp-content/uploads/Cay-duoi-sam-1.jpg" style="height:793px; width:625px" /></p>

<p><strong>K? thu?t tr?ng c&acirc;y&nbsp;du&ocirc;i sam n&ecirc;n bi?t</strong></p>

<p>Ch&uacute;ng ta c&oacute; th? tr?ng c&acirc;y tr&ocirc;ng ch?u ho?c du?i&nbsp;d?t t&ugrave;y theo nhu c?u c?a m?i ngu?i v? kinh t?, c?nh quan, s? th&iacute;ch kh&aacute;c nhau. Th?i gian gieo h?t trong v&ograve;ng 6 th&aacute;ng, c&acirc;y con s? ph&aacute;t tri?n&nbsp;d?n giai&nbsp;do?n u?n ch&eacute;o th&acirc;n l?i v?i nhau&nbsp;d? t?o th&agrave;nh h&igrave;nh th?t b&iacute;m, k? ti?p&nbsp;d&oacute; 6 th&aacute;ng th&igrave; n&ecirc;n tr?ng c&acirc;y v&agrave;o ch?u.</p>

<p>Ð?t tr?ng c&acirc;y&nbsp;g?m: Tro tr?u; tr?u s&oacute;ng k?t h?p v?i xo d?a t? l? 60%; 15%; 25% v&agrave; 100g &ndash; 200g ph&acirc;n l&acirc;n&nbsp;d? gi&uacute;p c&acirc;y c&oacute; ngu?n ph&acirc;n d? tr?. Tuy nhi&ecirc;n, ngu?i tr?ng cho h?n h?p n&agrave;y v&agrave;o kho?ng 1/2 ch?u, sau&nbsp;d&oacute;&nbsp;d?t h?t v&agrave;o&nbsp;d? cho b? d? ngang v?i m&eacute;p ch?u, l?p&nbsp;d?t l?i, sau&nbsp;d&oacute; tu?i nu?c cho&nbsp;u?t to&agrave;n b?&nbsp;d?t trong ch?u.</p>

<p><strong>Luu&nbsp;&yacute;:</strong>&nbsp;Thi tho?ng n&ecirc;n mang c&acirc;y&nbsp;d?t&nbsp;? noi c&oacute;&nbsp;&aacute;nh s&aacute;ng m?t tr?i nhung kh&ocirc;ng n&ecirc;n&nbsp;d? du?i&nbsp;&aacute;nh n?ng g?t qu&aacute;.</p>

<p>Ð? c&acirc;y ph&aacute;t tri?n t?t v&agrave; s?ng l&acirc;u hon th&igrave; ngu?i choi n&ecirc;n&nbsp;d?t&nbsp;? ngo&agrave;i tr?i v&agrave;&nbsp;d?t du?i nh?ng t&aacute;n c&acirc;y l?n theo chu k? (10 ng&agrave;y/ l?n) l&agrave;m nhu v?y th&igrave; c&acirc;y s? h?p thu&nbsp;du?c&nbsp;&aacute;nh s&aacute;ng v&agrave; ph&aacute;t tri?n t?t hon. C&acirc;y c&oacute; kh? nang ch?u&nbsp;du?c n&oacute;ng v&agrave; h?n nhung ngu?i choi cung n&ecirc;n tu?i 1 -2 l?n/ tu?n&nbsp;d? gi&uacute;p c&acirc;y ph&aacute;t tri?n t?t v&agrave; s?ng l&acirc;u hon.</p>

<p><img alt="Cay-duoi-sam--2" src="https://cayvahoa.net/wp-content/uploads/Cay-duoi-sam-2-1024x1024.jpg" style="height:1024px; width:1024px" /></p>

<p><strong>C&aacute;ch cham s&oacute;c c&acirc;y du&ocirc;i sam ph&aacute;t tri?n t?t&nbsp;</strong></p>

<p>+ C&acirc;y c&oacute; kh? nang sinh tru?ng v&agrave; ph&aacute;t tri?n t?t, r?t d? cham s&oacute;c v&agrave; th&iacute;ch nghi v?i m&ocirc;i tru?ng trong nh&agrave;.</p>

<p>+ Lu&ocirc;n&nbsp;d?m b?o cho c&acirc;y ph&aacute;t tri?n t?t th&igrave; ch&uacute;ng ta n&ecirc;n ch?n lo?i&nbsp;d?t tr?ng c&oacute;&nbsp;d? c&aacute;c ch?t dinh du?ng tr?n th&ecirc;m v?i m&ugrave;n, tro v&agrave; x&aacute;c d?a&nbsp;d? t?o th&ecirc;m&nbsp;d? m&agrave;u m? cho&nbsp;d?t.</p>

<p>+ Thu?ng xuy&ecirc;n cho c&acirc;y ti?p x&uacute;c v?i&nbsp;&aacute;nh s&aacute;ng&nbsp;d? c&acirc;y h?p th?&nbsp;du?c nhi?u ch?t.</p>

<p>+ Khi c&acirc;y c&oacute; l&aacute; h?ng, l&aacute; gi&agrave; th&igrave; c?t t?a b?t&nbsp;d? c&acirc;y th&ocirc;ng tho&aacute;ng c&oacute; th? ph&aacute;t tri?n nh?ng l&aacute; m?i nhanh hon.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (18, 1, N'Cây lan ý', N'cay-lan-y-2-600x600.jpg', 300000, 0, N'Cây lan ý nằm trong một chi của khoảng 40 loài thực vật lá mầm có hoa, họ Araceae, hoa có màu trắng muốt rất đẹp, ưa thích trồng trong chậu để bàn, để trong phòng, để tại các hành lang,…', N'<p><a href="https://cayvahoa.net/cay-lan-y/"><strong>C&acirc;y lan&nbsp;&yacute;</strong></a>&nbsp;n?m trong m?t chi c?a kho?ng 40 lo&agrave;i th?c v?t l&aacute; m?m c&oacute; hoa, h? Araceae, hoa c&oacute; m&agrave;u tr?ng mu?t r?t&nbsp;d?p,&nbsp;ua th&iacute;ch tr?ng trong ch?u&nbsp;d? b&agrave;n,&nbsp;d? trong ph&ograve;ng,&nbsp;d? t?i c&aacute;c h&agrave;nh lang,&hellip;</p>

<p>T&ecirc;n thu?ng g?i: C&acirc;y lan&nbsp;&yacute;</p>

<p>T&ecirc;n g?i kh&aacute;c: B?ch m&ocirc;n, v? hoa tr?ng, hu? h&ograve;a b&igrave;nh</p>

<p>T&ecirc;n khoa h?c: Spathiphyllum wallisii</p>

<p>T&ecirc;n ti?ng anh: Peace Lily</p>

<p>H?: Araceae</p>

<p>Ngu?n g?c xu?t x?: T? c&aacute;c khu v?c nhi?t&nbsp;d?i v&agrave; c?n nhi?t&nbsp;d?i c?a Ch&acirc;u M?,&nbsp;Ð&ocirc;ng Nam&nbsp;&Aacute;.</p>

<p>&mdash;&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-de-ban/">https://cayvahoa.net/cay-canh/cay-de-ban/</a></p>

<p>&mdash;&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-trong-trong-nha/">https://cayvahoa.net/cay-canh/cay-trong-trong-nha/</a></p>

<p><img alt="cay-lan-y" src="https://cayvahoa.net/wp-content/uploads/cay-lan-y.jpg" style="height:400px; width:400px" /></p>

<p><strong>Ð?c&nbsp;di?m h&igrave;nh th&aacute;i</strong></p>

<p>C&acirc;y c&oacute; chi?u cao kho?ng 0,5m m?c th&agrave;nh t?ng b?i, th&acirc;n c? nh? c&oacute; tu?i th? l&acirc;u&nbsp;d?i n&ecirc;n ch&uacute;ng s? h?u nh?ng chi?c l&aacute; l?n&nbsp;du?c t&iacute;nh t? cu?ng l&aacute; d&agrave;i kho?ng 12-65 cm v&agrave; r?ng 3-25 cm, c&acirc;y b?t&nbsp;d?u m?c t? m?t&nbsp;d?t, v?i nh?ng chi?c l&aacute; c&oacute; h&igrave;nh b?u d?c thu&ocirc;n nh?n&nbsp;d?u m&agrave;u xanh th?m, b&oacute;ng v&agrave; d&agrave;y d?n tr&ecirc;n m?t l&aacute; c&ograve;n n?i l&ecirc;n nh?ng v?t g&acirc;n m&agrave;u xanh nh?t, nhi?u ngu?i&nbsp;d&atilde; l?m tu?ng hoa c?a lan&nbsp;&yacute; v?i m?t ph?n mo bao quanh c&aacute;i nh?, nhung th?c t? th&igrave; hoa lan&nbsp;&yacute; l&agrave; c&aacute;i nh?&nbsp;d&oacute;, m?c th&agrave;nh t?ng c?m h&igrave;nh tr? cong m&agrave;u tr?ng ng&agrave;, v&agrave;ng nh?t v&agrave; b?c b?i l?p mo l&aacute; h&igrave;nh g?n nhu l&agrave; m?t tr&aacute;i tim c&oacute; m&agrave;u tr?ng mu?t pha m?t ch&uacute;t xanh nh?t.</p>

<p>C&acirc;y lan&nbsp;&yacute; r?t th&iacute;ch h?p tr?ng trong m&ocirc;i tru?ng thi?u&nbsp;&aacute;nh s&aacute;ng nhung n&ecirc;n&nbsp;d?t c&acirc;y&nbsp;? nh?ng noi c&oacute;&nbsp;&aacute;nh s&aacute;ng th&igrave; s? t?t hon v? ch?&nbsp;d? sinh tru?ng v&agrave; ph&aacute;t tri?n tuoi t?t, c&acirc;y c&oacute; nhu c?u v? nu?c kh&ocirc;ng cao ch?&nbsp;? m?c b&igrave;nh thu?ng, c&oacute; th? tu?i 2 ng&agrave;y/ l?n kh&ocirc;ng n&ecirc;n tu?i qu&aacute; nhi?u. V&igrave; lan&nbsp;&yacute;&nbsp;ua kh&iacute; h?u&nbsp;?m nhi?t&nbsp;d? v?a ph?i, kh&ocirc;ng qu&aacute; n&oacute;ng, kh&ocirc;ng qu&aacute; l?nh.</p>

<p>N?m trong s?&nbsp;&iacute;t nh?ng lo&agrave;i c&acirc;y c&oacute; t&aacute;c d?ng h?p th? nh?ng ch?t&nbsp;d?c h?i lo l?ng trong kh&ocirc;ng kh&iacute;&nbsp;du?c sinh ra t? vi?c&nbsp;d?t ch&aacute;y nh?ng nang lu?ng h&oacute;a th?ch, ch?t h?u co (benzen, formaldehyde v&agrave; c&aacute;c ch?t g&acirc;y&nbsp;&ocirc; nhi?m kh&aacute;c).</p>

<p><img alt="cay-lan-y-1" src="https://cayvahoa.net/wp-content/uploads/cay-lan-y-1.jpg" style="height:800px; width:800px" /></p>

<p><strong>S? th?t v? c&acirc;y lan&nbsp;&yacute; c&oacute; th? b?n chua bi?t</strong></p>

<p>Nh?ng b&ocirc;ng lan&nbsp;&yacute; n? mang&nbsp;d?n cho ngu?i ta c&aacute;i c?m nh?n v? v?&nbsp;d?p qu&yacute; ph&aacute;i, trang nh&atilde;. Nh?ng chi?c l&aacute; lan&nbsp;&yacute; xanh mu?t chen nh?ng b&ocirc;ng hoa tr?ng mu?t g?i cho ch&uacute;ng ta th?y&nbsp;s? thanh cao v&agrave; trong tr?ng.&nbsp;? trong m&ocirc;i tru?ng s?ng th&igrave; con ngu?i ph?i&nbsp;d?i m?t v?i h?ng tia b?c x? m?t tr?i, nh?ng tia h?ng ngo?i c&oacute; s&oacute;ng&nbsp;di?n t? xu?t ph&aacute;t t? nh?ng lo?i thi?t b?&nbsp;di?n t? trong nh&agrave;.</p>

<p>Nh?ng t&aacute;c nh&acirc;n&nbsp;d&oacute;&nbsp;d&atilde; g&acirc;y ra nh?ng hi?n tu?ng nhu ung thu da, bi?n&nbsp;d?i s?&nbsp;d?c t&iacute;nh c?a co th?, th&igrave; c&acirc;y lan&nbsp;&yacute; c&oacute; kh? nang l&agrave;m gi?m thi?u c&aacute;c t&aacute;c h?i c?a c&aacute;c tia t? ngo?i v&agrave; s&oacute;ng&nbsp;di?n t? c&oacute; h?i cho co th?. Theo nghi&ecirc;n c?u c?a c&aacute;c nh&agrave; khoa h?c M? th&igrave; c&acirc;y&nbsp;d?t trong nh&agrave; s? gi&uacute;p c&acirc;n b?ng&nbsp;ngu?n s&oacute;ng sinh ra t? c&aacute;c thi?t b?&nbsp;di?n t? nhu: Tivi, m&aacute;y t&iacute;nh,&nbsp;d?ng h?,&hellip;.</p>

<p>Khi&nbsp;d?t c&acirc;y lan&nbsp;&yacute; trong nh&agrave; s? r?t t?t cho nh?ng ai m?c can b?nh qu&aacute;i&nbsp;&aacute;c nhu: Ung thu ph?i&nbsp;di?u tr? qua b?c x?, h&oacute;a tr? li?u, nh?ng b?nh nh&acirc;n m?t ng?, m?t m?i ho?c c&aacute;c b?nh c?p t&iacute;nh&nbsp;s? r?t t?t khi&nbsp;d?t c&acirc;y n&agrave;y trong ph&ograve;ng,</p>

<p>Theo phong th?y c&acirc;y c&oacute; t&aacute;c d?ng gi&uacute;p c&acirc;n b?ng tru?ng kh&iacute;,&nbsp;di?u h&ograve;a v&agrave; h?p thu ngu?n nang lu?ng xung kh?c trong nh&agrave; gi&uacute;p cho gia ch? c&oacute; m?t kh&ocirc;ng gian s?ng h&agrave;i h&ograve;a v&agrave; y&ecirc;n b&igrave;nh.</p>

<p><img alt="cay-lan-y-2" src="https://cayvahoa.net/wp-content/uploads/cay-lan-y-2.jpg" style="height:600px; width:800px" /></p>

<h2><a href="https://cayvahoa.net/cach-cham-soc-cay-lan-y-dung-cach/"><strong>K? thu?t tr?ng v&agrave; cham s&oacute;c c&acirc;y lan&nbsp;&yacute;</strong></a></h2>

<p>&Aacute;nh s&aacute;ng: Lo&agrave;i c&acirc;y n&agrave;y c&oacute; th? s?ng trong m&ocirc;i tru?ng thi?u&nbsp;&aacute;nh s&aacute;ng, khi tr?ng c?n&nbsp;d?t ra nh?ng noi c&oacute;&nbsp;&aacute;nh s&aacute;ng.&nbsp;Ð?c bi?t n?u tr?ng&nbsp;? ngo&agrave;i tr?i th&igrave; n&ecirc;n s? d?ng m&aacute;i che cho c&acirc;y tr&aacute;nh&nbsp;du?c&nbsp;&aacute;nh n?ng tr?c ti?p chi?u v&agrave;o c&acirc;y khi?n c&acirc;y sinh tru?ng v&agrave; ph&aacute;t tri?n kh&ocirc;ng t?t.</p>

<p>Ð?t tr?ng: L&agrave; c&acirc;y th&acirc;n b?i th&iacute;ch s?ng&nbsp;? nh?ng noi&nbsp;d?t&nbsp;?m&nbsp;u?t v&agrave; m&agrave;u m?. Ch&iacute;nh v&igrave; th?, khi mu?n tr?ng th&igrave; c?n s? d?ng lo?i&nbsp;d?t c&oacute; h&agrave;m lu?ng dinh du?ng cao. C&oacute; th? d&ugrave;ng h?n h?p&nbsp;d?t, ph&acirc;n h?u co, than b&ugrave;n v&agrave; l&aacute; m?c.</p>

<p>Nhi?t&nbsp;d?: Th&iacute;ch h?p cho&nbsp;di?u ki?n&nbsp;?m&nbsp;u?t th&igrave; c&acirc;y s? sinh tru?ng v&agrave; ph&aacute;t tri?n r?t t?t, nhi?t&nbsp;d? th&iacute;ch h?p trong kho?ng 27&deg;C.</p>

<p>Tu?i nu?c: Kh&ocirc;ng c?n tu?i qu&aacute; nhi?u l?n, ch? c?n duy tr&igrave;&nbsp;d?&nbsp;?m khi th?y&nbsp;d?t c&oacute; v? kh&ocirc; th&igrave; n&ecirc;n tu?i nu?c cho c&acirc;y, th&iacute;ch h?p nh?t th&igrave; 1 l?n/ tu?n.</p>

<p>Nhi?t d?: c&acirc;y l&agrave; lo&agrave;i hoa ua b&oacute;ng m&aacute;t v&agrave; nhi?t d? kh&ocirc;ng qu&aacute; cao cung kh&ocirc;ng qu&aacute; th?p, ch&iacute;nh v&igrave; v?y ? di?u ki?n ?m u?t, c&acirc;y lan &yacute; sinh tru?ng v&agrave; ph&aacute;t tri?n t?t nh?t ? nhi?t d? 27 d?.</p>

<p>&nbsp;</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (19, 2, N'Cây đế vương', N'cay-de-vuong-van-phong-600x600.jpg', 500000, 0, N'Bạn là dân văn phòng và có sở thích trồng cây cảnh thì hãy chọn cây đế vương nghe cái tên thôi cũng thấy sự uy nghiêm cũng như thăng tiến trong sự nghiệp rồi.', N'<p>B?n l&agrave; d&acirc;n van ph&ograve;ng v&agrave; c&oacute; s? th&iacute;ch tr?ng c&acirc;y c?nh th&igrave; h&atilde;y ch?n&nbsp;<a href="https://cayvahoa.net/cay-de-vuong/">c&acirc;y d? vuong</a>&nbsp;nghe c&aacute;i t&ecirc;n th&ocirc;i cung th?y s? uy nghi&ecirc;m cung nhu thang ti?n trong s? nghi?p r?i. M&agrave; ch&uacute;ng l?i du?c chia nhi?u lo?i kh&aacute;c nhau nhu d? vuong xanh, d? vuong v&agrave;ng, d? vuong d?, d? vuong t&iacute;m&hellip;Kh&ocirc;ng nh?ng ch? ch?n theo s? th&iacute;ch m&agrave; c&ograve;n ch&uacute; &yacute; d?n phong th?y v&agrave; m?nh c&oacute; h?p v?i b?n kh&ocirc;ng? H&atilde;y c&ugrave;ng t&igrave;m hi?u nh&eacute;!</p>

<p><strong>V&igrave; sao c&acirc;y d? vuong du?c gi?i van ph&ograve;ng y&ecirc;u th&iacute;ch d?n th??</strong></p>

<p>H&igrave;nh th?c: B?n d? d&agrave;ng quan s&aacute;t du?c lo?i c&acirc;y kh&aacute; b?t m?t n&agrave;y, kh&ocirc;ng kh&oacute; thu h&uacute;t ngu?i kh&aacute;c d?c bi?t nh?ng ngu?i y&ecirc;u th&iacute;ch c&acirc;y c?nh. Ði?m n?i b?t l&agrave; nh?ng chi?c l&aacute; xanh mu?t v&agrave; to d&agrave;i d? d&oacute;n nh?ng tia n?ng ?m. N?u b?n ch?n ch?u nh? d? b&agrave;n l&agrave;m vi?c th&igrave; qu&aacute; l?a ch?n s&aacute;ng su?t d&oacute;, c&acirc;y s? gi&uacute;p b?n c&oacute; kh&ocirc;ng kh&iacute; trong l&agrave;nh v&igrave;&nbsp; c&aacute;c kh&iacute; d?c s? du?c ch&uacute;ng h&uacute;t s?ch tr? l?i b?u kh&ocirc;ng kh&iacute; trong l&agrave;nh, an to&agrave;n cho s?c kh?e.</p>

<p>C&acirc;y d? vuong &nbsp;r?t ph&ugrave; h?p trung b&agrave;y b&ecirc;n trong nh&agrave; hay van ph&ograve;ng d?u r?t h?p l&yacute;. V&igrave; c&acirc;y th&iacute;ch b&oacute;ng r&acirc;m, ua ?m v&agrave; s?ng t?t trong m&ocirc;i tru?ng &iacute;t n?ng. C&oacute; ngu?n g?c t? Ch&acirc;u M? xa x&ocirc;i nay d&atilde; du?c du nh?p v? Vi?t Nam v&agrave; r?t du?c ua chu?ng.</p>

<p>Nh?ng c&oacute; l? di?m n?i b?t v&agrave; &yacute; nghia nh?t m&agrave; d&acirc;n van ph&ograve;ng th&iacute;ch d&oacute; l&agrave; &yacute; nghia cho s? thang ti?n trong s? nghi?p m&agrave; t&acirc;m l&yacute; ai cung mu?n c&oacute; di?u d&oacute;. C&aacute;c s?p v&agrave; nh?ng ngu?i c&oacute; ch?c v? qu?n l&yacute; da s? d?u ch?n cho m&igrave;nh ch?u d? vuong xinh xinh d? b&agrave;n ho?c ph&ograve;ng l&agrave;m vi?c th&ecirc;m ph?n phong th?y, c&ocirc;ng vi?c hanh th&ocirc;ng v&agrave; thu?n l?i hon.</p>

<p>Ð?c bi?t nh?ng ngu?i m?nh m?c r?t h?p trung b&agrave;y c&acirc;y d? vuong n&agrave;y theo c&aacute;ch nh&igrave;n t&acirc;m linh n&oacute; mang d?n t&agrave;i l?c, v?n may cho gia ch?. C&aacute;c lo?i c&acirc;y d? vuong ph? bi?n tr&ecirc;n th? tru?ng</p>

<p><strong>C&acirc;y d? vuong xanh</strong></p>

<p>Ð? Vuong Xanh (t&ecirc;n khoa h?c: Philodendron Imperial Green) l&agrave; m?t lo&agrave;i th?c v?t c&oacute; hoa trong h? R&aacute;y (Araceae). C&acirc;y th&iacute;ch s?ng trong m&ocirc;i tru?ng thi?u n?ng v&agrave; kh&ocirc; c?n thu?n ti?n vi?c cham s&oacute;c cho kh?i van ph&ograve;ng. Lo&agrave;i c&acirc;y c?nh du?c s? d?ng r?ng r&atilde;i tr&ecirc;n th? gi?i v&agrave; t?i Vi?t Nam cung dang du?c nhi?u t&iacute;n d? san l&ugrave;ng. M&agrave;u xanh tu?ng trung cho nh?ng ngu?i m?nh m?c v&igrave; th? r?t h?p l&agrave;m c&acirc;y c?nh phong th?y cho nh?ng ai mang m?nh m?c v&agrave; h?a mang d?n s? quy?n l?c v&agrave; may m?n.</p>

<p><strong>C&acirc;y d? vuong v&agrave;ng</strong></p>

<p>C&oacute; t&ecirc;n g?i khoa h?c l&agrave; Philodendron imperial gold. Cung du?c ?ng d?ng l?a ch?n trang tr&iacute; cho kh&aacute;ch s?n, van ph&ograve;ng&hellip;Nhung c&acirc;y d? vuong v&agrave;ng l&agrave; th&acirc;n leo n&ecirc;n tr?ng noi c&oacute; d&agrave;n gi&acirc;y leo, v&aacute;ch tu?ng v&agrave; di?u ki?n s?ng ua ?m u?t kh&ocirc;ng ch?u du?c &aacute;nh n?ng v&agrave; kh&ocirc; h?n. Ð?c di?m ri&ecirc;ng bi?t l&agrave; nh?ng chi?c l&aacute; non m&agrave;u v&agrave;ng, v&agrave; xanh d?n khi l&aacute; d&atilde; gi&agrave;.V?i &yacute; nghia phong th?y mang l?i uy nghi&ecirc;m v&agrave; th? hi?n tinh th?n kh&ocirc;ng ng?ng n? l?c d? th&agrave;nh c&ocirc;ng trong s? nghi?p.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-de-vuong-1024x768.jpg" style="height:768px; width:1024px" /></p>

<p>C&acirc;y Ð?i d? vuong d? cham s&oacute;c, ua b&oacute;ng b&aacute;n ph?n, ch?u l?nh t?t.</p>

<p><strong>C&acirc;y d? vuong d?</strong></p>

<p>T&ecirc;n g?i khoa h?c l&agrave; Philodendron sp thu?c h? nh&agrave; tr?u, ngu?n g?c Ch&acirc;u m? nhi?t d?i. Ð?c di?m sinh th&aacute;i s?ng b?i nh? v&agrave; leo b&aacute;m, l&aacute; c&acirc;y c&oacute; m&agrave;u d?m s?c ?n tu?ng. Nhung c&ocirc;ng d?ng quan tr?ng d&oacute; l&agrave; kh&ocirc;ng ch? l&agrave; c&acirc;y c?nh trang tr&iacute; n?i th?t m&agrave; c&ograve;n mang l?i kh&ocirc;ng kh&iacute; trong l&agrave;nh v&igrave; c&oacute; kh? nang h&uacute;t c&aacute;c kh&oacute;i d?c t? m&ocirc;i tru?ng nhu kh&oacute;i thu?c, xang, d?u, b?c x? m&aacute;y t&iacute;nh, s&oacute;ng di?n tho?i&hellip;Kh&ocirc;ng nh?ng th? c&acirc;y mang d?n s? n?i b?t v&agrave; sang trong khi trung b&agrave;y trong van ph&ograve;ng, kh&aacute;ch s?n&hellip;.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-de-vuong-1.jpg" style="height:523px; width:700px" /></p>

<p>B?n c&oacute; th? l?a ch?n c&acirc;y tr?u d? vuong d? ch&uacute;c m?ng sinh nh?t ho?c t&acirc;n gia, khia truong c?a h&agrave;ng d?u r?t &yacute; nghia.</p>

<p><strong>C&acirc;y d? vuong t&iacute;m</strong></p>

<p>Ð?u l&agrave; nh?ng lo?i c&acirc;y thu?c h? nh&agrave; tr?u b&agrave; n&ecirc;n k? thu?t cham s&oacute;c cung gi?ng nhau v&agrave; mang l?i &yacute; nghia may m?n, th&agrave;nh d?t, b&igrave;nh an cho gia ch?.C&acirc;y du?c m?c th&agrave;nh b?i h&igrave;nh tr&ograve;n v?i t&aacute;n l&aacute; thu&ocirc;n r?ng, th&acirc;n v&agrave; l&aacute; c&oacute; m&agrave;u d? t&iacute;a ri&ecirc;ng bi?t t?o n&ecirc;n s? n?i b?t v&agrave; sang tr?ng &nbsp;khi du?c trung b&agrave;y nhung noi van ph&ograve;ng, kh&aacute;ch s?n, nh&agrave; ? nh&igrave;n r?t thu h&uacute;t.</p>

<p>&nbsp;</p>

<p><strong>Tham kh?o k? thu?t tr?ng c&acirc;y Ð? Vuong</strong></p>

<p>Sau khi d&atilde; l?a ch?n c&acirc;y d? vuong y&ecirc;u th&iacute;ch ch&uacute;ng ta c?n n?m r&otilde; c&aacute;c d?c di?m d? cham d? d&agrave;ng hon. N&ecirc;n d? c&acirc;y noi b&oacute;ng r&acirc;m nhi?u hon &aacute;nh s&aacute;ng v&igrave; c&acirc;y ua s?ng noi thi?u &aacute;nh s&aacute;ng. Nhung cung d?ng qu&ecirc;n mang c&acirc;y ra n?ng d? h?p th? &aacute;nh s&aacute;ng nu&ocirc;i du?ng th&acirc;n v&agrave; l&aacute; nh&eacute;, th?i gian ph&ugrave; h?p l&agrave; 7 gi? d?n 9 gi? s&aacute;ng th&ocirc;i.</p>

<p>B?n ph?i th?t cham ch? v? sinh l&acirc;u ch&ugrave;i l&aacute; c&acirc;y thu?ng xuy&ecirc;n, m?t ph?n gi&uacute;p c&acirc;y tuoi s&aacute;ng v&agrave; d?p hon. Nhung quan tr?ng l&agrave; gi&uacute;p l&aacute; kh&ocirc;ng b? ch&aacute;y n?ng do d?ng nu?c tr&ecirc;n l&aacute; c&acirc;y. Kh&ocirc;ng n&ecirc;n tu?i nu?c qu&aacute; nhi?u v&agrave; khi tu?i n&ecirc;n d&ugrave;ng d?ng phun suong l&agrave; du?c.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-de-vuong-van-phong.jpg" style="height:663px; width:600px" /></p>

<p>Ð?ng qu&ecirc;n b&oacute;n ph&acirc;n theo d?nh k? cho c&acirc;y d? vuong v&igrave; ch&uacute;ng cung c?n dinh du?ng nu&ocirc;i du?ng d? ph&aacute;t tri?n v&agrave; lu&ocirc;n gi? du?c v? d?p tuoi t?n cung nhu c&ocirc;ng d?ng h&uacute;t kh&iacute; d?c c?a m&igrave;nh. Kh&ocirc;ng n&ecirc;n d?ng ch?m d?n g?c r? c?a c&acirc;y s? l&agrave;m h? r? b? t?n thuong . B?n ph?i c? g?ng thu?ng xuy?n d? &yacute; v&agrave; quan s&aacute;t c?t b? c&aacute;c l&aacute; v&agrave;ng &uacute;a, kh&ocirc; h&eacute;o, tu?i nu?c d?y d?, d?ng th?i c&oacute; th? h&ograve;a d?m v&agrave;o nu?c v?i n?ng d? th?p d? tu?i cho c&acirc;y, m?i tu?n m?t l?n, sau m?i th&aacute;ng th&igrave; s? tang d?n lu?ng, sau kho?ng 2 -3 th&aacute;ng th&igrave; s? tang n?ng d?.</p>

<p>Ch&uacute; &yacute; hon c&acirc;y d? vuong r?t hay m?c b?nh ph?n tr?ng. N?u ? m?c d? nh? b?n ch? c?n d&ugrave;ng khan lau s?ch nh?ng ph?n tr?ng tr&ecirc;n l&aacute; c&acirc;y l&agrave; du?c. Nhung b?nh l?i ti?n tri?n n?ng hon th&igrave; ch&uacute;ng ta c?n ph?i tr? b? cho c&acirc;y c?p t?c. Nh?ng hi?n tu?ng nhu l&aacute; &uacute;a, kh&ocirc;, h&eacute;o c?n du?c cham s&oacute;c d?c bi?t d? gi&uacute;p c&acirc;y ph?c h?i nhanh ch&oacute;ng. Tuy?t d?i kh&ocirc;ng n&ecirc;n cho &aacute;nh s&aacute;ng m?t tr?i tr?c ti?p chi?u x? v&agrave;o c&acirc;y d? tr&aacute;nh l&agrave;m cho s?c n&oacute;ng c?a &aacute;nh n?ng g&acirc;y ?nh hu?ng b?t l?i d?n c&acirc;y c?i ho?c c&oacute; th? l&agrave;m cho c&acirc;y ch?t do b? m?t nu?c. Noi cham s&oacute;c c&acirc;y ph?i l&agrave; noi m&aacute;t m?, kh&ocirc;ng kh&iacute; trong l&agrave;nh v&agrave; n&ecirc;n tr&aacute;nh gi&oacute; m?nh.</p>

<p><strong>Ch&uacute; &yacute;:</strong>&nbsp;Kh&ocirc;ng d? b&atilde; ch&egrave;, b&atilde; caf&eacute; v&agrave;o ch?u c&acirc;y, lu&ocirc;n gi?a m?t ch?u c&acirc;y tho&aacute;ng, m?i th&aacute;ng m?t l?n n&ecirc;n mang ch?u c&acirc;y ra ngo&agrave;i tr?i m?t tu?n.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (20, 2, N'Cây chuối cảnh', N'cay-chuoi-canh-1-500x600.jpg', 450000, 0, N'Cây chuối cảnh có hơn 400 loài chuối trên thế giới, ngày nay chuối đã trở thành một trong những loại cây cảnh được ưa chuộng bởi nhiều nhất trong việc trang trí nội thất, ngoại thất trong và ngoài nước.', N'<p><a href="https://cayvahoa.net/cay-chuoi-canh/">C&acirc;y chu?i c?nh</a>&nbsp;c&oacute; hon 400 lo&agrave;i chu?i tr&ecirc;n th? gi?i, ng&agrave;y nay chu?i&nbsp;d&atilde; tr? th&agrave;nh m?t trong nh?ng lo?i c&acirc;y c?nh&nbsp;du?c&nbsp;ua chu?ng b?i nhi?u nh?t trong vi?c trang tr&iacute; n?i th?t, ngo?i th?t trong v&agrave; ngo&agrave;i nu?c. Chu?i c?nh b?t ngu?n t?&nbsp;Ð&ocirc;ng&nbsp;&Aacute; khi&nbsp;&ocirc;ng cha ta&nbsp;d&atilde; c&oacute; c&acirc;u: Tru?c cau sau chu?i ch?&nbsp;d? hai lo?i c&acirc;y kh&ocirc;ng th? thi?u trong s&acirc;n vu?n. B?i nh?ng ng&ocirc;i nh&agrave; th?i xua.</p>

<p>&lt;&lt;&nbsp;C&acirc;y t&agrave;i l?c&nbsp;&gt;&gt;</p>

<p><strong>=&gt; C&acirc;y chu?i c?nh&nbsp;du?c xem l&agrave;&nbsp;di?m nh?n cho kh&ocirc;ng gian nh&agrave;.</strong></p>

<p><img alt="cay-chuoi-canh" src="https://cayvahoa.net/wp-content/uploads/cay-chuoi-canh.jpg" style="height:750px; width:500px" /></p>

<p><strong>Ð&ocirc;i n&eacute;t v?&nbsp;c&acirc;y chu?i c?nh&nbsp;</strong></p>

<p>C&acirc;y chu?i c?nh kh&ocirc;ng ch? g&acirc;y ?n tu?ng b?i nh?ng t&agrave;u l&aacute; b?n to, xanh mu?t, chu?i c&ograve;n c&oacute; nhi?u t&aacute;c d?ng trong phong th?y. B?n d&atilde; t?ng nghe &ocirc;ng cha ta n&oacute;i: &lsquo;Tru?c cau sau chu?i&rdquo;&nbsp;di?u n&agrave;y&nbsp;dang ch? cho ch&uacute;ng ta th?y&nbsp;d&acirc;y l&agrave; lo?i c&acirc;y kh&ocirc;ng th? thi?u&nbsp;? trong s&acirc;n vu?n c?a c&aacute;c ng&ocirc;i nh&agrave; th?i xua. Ngu?i ta c&ograve;n cho r?ng tr?ng chu?i&nbsp;? sau nh&agrave; th&igrave; s? thu h&uacute;t&nbsp;du?c nh?ng sinh kh&iacute; kh&ocirc;ng t?t ti?m&nbsp;?n.</p>

<p>&nbsp;<strong>&Yacute; nghia v? c&acirc;y chu?i&nbsp;</strong></p>

<p>Chu?i c?nh mang&nbsp;d?n v?&nbsp;d?p cho kh&ocirc;ng gian. Trong phong th?y th&igrave; chu?i c?nh c&ograve;n mang&nbsp;d?n m?t ph?n t&agrave;i t?c, s? sinh s&ocirc;i n?y n? v?i m?t kh&ocirc;ng gian xanh th?t tuy?t v?i. Ngo&agrave;i ra ch&uacute;ng c&ograve;n c&oacute; kh? nang thu h&uacute;t&nbsp;du?c nh?ng sinh kh&iacute; kh&ocirc;ng t?t ti?m&nbsp;?n, l&agrave;m s?ch b?u kh&ocirc;ng kh&iacute;.</p>

<p><img alt="cay-chuoi-canh-1" src="https://cayvahoa.net/wp-content/uploads/cay-chuoi-canh-1.jpg" style="height:618px; width:500px" /></p>

<p>Ngu?i ta tr?ng chu?i nh?m mang&nbsp;d?n khung c?nh th&acirc;n thi?n cho ng&ocirc;i nh&agrave;&nbsp;d?p hon v&agrave; g?n gui v?i m&ocirc;i tru?ng hon. H&igrave;nh tu?ng c?a nh?ng c&acirc;y chu?i th&igrave; g?n li?n v?i con ngu?i Vi?t Nam n&oacute;&nbsp;du?c bi?t&nbsp;d?n ch? y?u&nbsp;d? qu?, l&agrave;m&nbsp;d?p v&agrave; l&agrave;m thu?c b?i s? gi&agrave;u ch?t dinh du?ng mang nhi?u du?c t&iacute;nh. Tru?c&nbsp;d&acirc;y khi c&ograve;n chi?n tranh c?nh ngh&egrave;o&nbsp;d&oacute;i, n?n&nbsp;d&oacute;i di?n ra th&igrave; chu?i&nbsp;du?c xem l&agrave; th?c ph?m&nbsp;d&atilde; c?u s?ng bi?t bao sinh m?ng con ngu?i trong l&uacute;c com kh&ocirc;ng c&oacute;&nbsp;an,&nbsp;&aacute;o kh&ocirc;ng c&oacute;&nbsp;d? m?c. Ngu?i ta kh&ocirc;ng ch?&nbsp;an qu? chu?i m&agrave;&nbsp;an c? c? chu?i, th?m ch&iacute; n&otilde;n chu?i, nh?ng th&acirc;n chu?i th&igrave; l&agrave;m th?c&nbsp;an cho c&aacute;c lo?i gia s&uacute;c, gia c?m, th?y s?n, trong&nbsp;d&ocirc;ng y ngu?i ta c&ograve;n l?y h?t chu?i&nbsp;d? l&agrave;m m?t v? thu?c t?t.</p>

<p>=&gt; Do&nbsp;d&oacute;, c&acirc;y chu?i&nbsp;c&oacute;&nbsp;&yacute; nghia r?t quan tr?ng v?i&nbsp;d?i s?ng t&acirc;m linh, t&iacute;n ngu?ng c?a con ngu?i v&agrave;o m?i d?p l?, t?t, ng&agrave;y r?m&nbsp;du?c xem l&agrave; nghi th?c linh thi&ecirc;ng kh&ocirc;ng th? thi?u tr&ecirc;n b&agrave;n th?.</p>

<p><strong>Phuong ph&aacute;p tr?ng c&acirc;y chu?i c?nh&nbsp;c&acirc;y trong nh&agrave;&nbsp;</strong></p>

<p>Ð? t?o m?t kh&ocirc;ng gian xanh,&nbsp;d?p t? c&acirc;y chu?i c?nh th&igrave; tru?c ti&ecirc;n ch&uacute;ng ta c?n th?c hi?n theo phuong ph&aacute;p m&agrave; ch&uacute;ng t&ocirc;i chia s? nhu sau:</p>

<p><img alt="cay-chuoi-canh" src="https://cayvahoa.net/wp-content/uploads/cay-chuoi-canh-2.jpg" style="height:553px; width:566px" /></p>

<p>+ Khi mua chu?i th&igrave; ch&uacute;ng ta ch&uacute;&nbsp;&yacute; v&agrave;o k&iacute;ch thu?c ch?u, chi?u cao c?a c&acirc;y v&agrave; s? c&acirc;y tr&ecirc;n m?i ch?u, l&aacute; r?t d? r&aacute;ch n&ecirc;n ch?n nh?ng t&agrave;u h?n ch? r&aacute;ch.</p>

<p>+ B?n n&ecirc;n bi?t lo&agrave;i r?p l&agrave; m?t trong nh?ng lo&agrave;i g&acirc;y h?i ph? bi?n nh?t cho c&acirc;y n?u c&acirc;y qu&aacute; kh&ocirc; cung c&oacute; kh? nang c&oacute; r?p&nbsp;d?.</p>

<p>+ C&acirc;y s? ph&aacute;t tri?n t?t trong&nbsp;di?u ki?n nhi?t&nbsp;d?&nbsp;?m&nbsp;&aacute;p, khi tr?ng trong ch?u th&igrave; n&ecirc;n&nbsp;d?t&nbsp;? noi c&oacute; nhi?u&nbsp;&aacute;nh s&aacute;ng ban ng&agrave;y nhung ch&uacute;ng ta v?n tr&aacute;nh&nbsp;&aacute;nh s&aacute;ng tr?c ti?p c?a m?t tr?i.</p>

<p>+ C?n tu?i nhi?u nu?c cho c&acirc;y v&igrave; kh? nang bay hoi c?a nu?c nhi?u do t&aacute;n l&aacute; r?ng.</p>

<p>+ Tr&aacute;nh tu?i nu?c x?i m?nh v&agrave;o g?c ho?c r? c&acirc;y n&oacute; s? l&agrave;m gi?m kh? nang ph&aacute;t tri?n c?a c&acirc;y.</p>

<p>+ L?a ch?n chu?i l&ugrave;n l&agrave;m c?nh cho ph&ograve;ng kh&aacute;ch&nbsp;di?u n&agrave;y s? r?t th&iacute;ch h?p v?i kh&ocirc;ng gian.</p>

<p>+ B&oacute;n ph&acirc;n&nbsp;d?u 2 l?n/ tu?n s? gi&uacute;p c&acirc;y ph&aacute;t tri?n t?t v&agrave; lu&ocirc;n kh?e m?nh.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (21, 2, N'Cây saphia / hồng diệp môn', N'cay-saphia-600x600.jpg', 460000, 0, N'Cây Saphia hay còn gọi là cây hồng diệp môn, tên khoa học là Philodendron erubescens. Saphia là cây cảnh được giới văn phòng ưa thích với thân leo vô cùng đẹp mắt,..', N'<p><strong>C&acirc;y Saphia</strong>&nbsp;hay c&ograve;n g?i l&agrave;&nbsp;<strong>c&acirc;y h?ng di?p m&ocirc;n</strong>, t&ecirc;n khoa h?c l&agrave; Philodendron erubescens. Saphia l&agrave; c&acirc;y c?nh du?c gi?i&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-noi-that-cay-van-phong/">van ph&ograve;ng</a>&nbsp;ua th&iacute;ch v?i th&acirc;n leo v&ocirc; c&ugrave;ng d?p m?t, l&aacute; xanh b&oacute;ng h&igrave;nh tr&aacute;i tim. Kh&ocirc;ng nh?ng th? h?ng di?p m&ocirc;n&nbsp;cung l&agrave; c&acirc;y c&oacute; t&aacute;c d?ng r?t t?t cho s?c kh?e c?a ch&uacute;ng ta nh? kh? nang thanh l?c kh&ocirc;ng kh&iacute;.</p>

<p><img alt="Cây Saphia1" src="https://cayvahoa.net/wp-content/uploads/2016/09/cay-saphia.jpg" style="height:379px; width:505px" /></p>

<p>M?t d?c di?m nh?n d?ng ?&nbsp;<strong>c&acirc;y h?ng di?p m&ocirc;n&nbsp;</strong>l&agrave; lo?i c&acirc;y d&acirc;y leo v?i h? th?ng r? tuong d?i kh?e b&aacute;m ch?c v&agrave;o tr? c?t d? leo. Th&acirc;n c&acirc;y saphia m?p, c&oacute; c&aacute;c d?t m?m. L&aacute; c&oacute; h&igrave;nh tr&aacute;i tim, g&acirc;n doe n?i r&otilde; gi?a l&aacute;, m?t tr&ecirc;n l&aacute; xanh b&oacute;ng. Cu?ng l&aacute; m&agrave;u xanh ho?c h?ng d?. H?ng di?p m&ocirc;n&nbsp;l&agrave; c&acirc;y tuong d?i d? tr?ng, kh?e m?nh, ua r&acirc;m m&aacute;t th&iacute;ch h?p l&agrave; c&acirc;y trang tr&iacute; n?i th?t.</p>

<p><a href="https://cayvahoa.net/ban-cay-saphia-mang-y-nghia-tien-tai-va-suc-khoe/"><strong>&Yacute; nghia c?a c&acirc;y saphia</strong></a>&nbsp;trong phong th?y l&agrave; lo?i c&acirc;y mang d?n t&agrave;i l?c v&agrave; s?c kh?e cho gia ch?. M?t s? nghi?n c?u cho th?y r?ng d?t saphia trong ph&ograve;ng gi&uacute;p kh&ocirc;ng kh&iacute; s?ch hon nh? kh? nang h&uacute;t b?i, ch?t d?c h?i v&agrave; gi&uacute;p c&acirc;n b?ng d? ?m trong kh&ocirc;ng kh&iacute;, gi? b?u kh&ocirc;ng kh&iacute; kh&ocirc;ng b? kh&ocirc; khi m? m&aacute;y l?nh trong th?i gian d&agrave;i.</p>

<p><img alt="caysaphia3" src="https://cayvahoa.net/wp-content/uploads/2016/09/caysaphia3-300x300.jpg" style="height:300px; width:300px" /></p>

<p><strong>Du?i d&acirc;y l&agrave; m?t s? luu &yacute; trong c&aacute;ch tr?ng v&agrave; cham s&oacute;c c&acirc;y saphia / c&acirc;y h?ng di?p m&ocirc;n :</strong></p>

<ul>
	<li>Lo?i d?t tr?ng gi&uacute;p c&acirc;y ph&aacute;t tri?n t?t nh?t l&agrave; lo?i d?t h?n h?p du?c tr?n t? xo d?a, m&ugrave;n cua, ch?u tuoi, d?t th?t v&agrave; ph&acirc;n t?ng h?p. Lo?i d?t n&agrave;y b?n ch? vi?c thay ho?c cho th&ecirc;m v&agrave;o 1 nam m?t l?n b?n nh&eacute;</li>
	<li>C?n d?m b?o d?y d? d? ?m cho c&acirc;y d? b? r? c&oacute; th? ph&aacute;t tri?n m?t c&aacute;ch t?t nh?t. C&acirc;y l?n d?n s? tang lu?ng nu?c tu?i cho c&acirc;y.</li>
	<li>Saphia ph&aacute;t tri?n r?t nhanh sau 3 th&aacute;ng l&agrave; b?n c&oacute; th? t&aacute;ch ho?c b&aacute;n du?c r?i.</li>
	<li>Ð? c&acirc;y c&oacute; m&agrave;u xanh b&oacute;ng h&agrave;ng tu?n b?n cho c&acirc;y ra t?m n?ng v&agrave;o bu?i s&aacute;ng s?m d? c&acirc;y quang h?p t?t b?n nh&eacute;.</li>
</ul>

<p><strong>C&acirc;y saphia</strong>&nbsp;kh&ocirc;ng b? s&acirc;u b?nh n&ecirc;n b?n kh&ocirc;ng lo ph?i s? d?ng thu?c b?o v? th?c v?t.&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-trong-trong-nha/">C&acirc;y tr?ng trong nh&agrave;</a>&nbsp;c?n ch?n c&acirc;y c&oacute; b? r? d&atilde; ph&aacute;t tri?n m?nh v&agrave; l&agrave; xanh t?t, m?p m?p. B?n c?n tr&aacute;nh d?t c&acirc;y ? v? tr&iacute; c&oacute; &aacute;nh n?ng tr?c ti?p chi?u v&agrave;o nh&eacute; di?u d&oacute; s? l&agrave;m c&acirc;y b? ch&aacute;y n?ng d&oacute; ?. Ngo&agrave;i ra ch&uacute;ng ta c&oacute; th? t?n d?ng b&atilde; ch&egrave; d? b&oacute;n cho c&acirc;y.</p>

<p><img alt="Cây Saphia3" src="https://cayvahoa.net/wp-content/uploads/2016/09/Untitled-11.jpg" style="height:400px; width:352px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (22, 2, N'Cây cau hawai', N'16010292_1618383151511320_732240845_o-600x600.jpg', 499000, 0, N'Cây cau Hawai hay còn gọi với cái tên cau trúc, dừa Hawai… Tên khoa học là Chamaedorea elegans, thuộc họ Arecaceae.', N'<p><strong>C&acirc;y cau Hawai</strong>&nbsp;hay c&ograve;n g?i v?i c&aacute;i t&ecirc;n cau tr&uacute;c, d?a Hawai&hellip; T&ecirc;n khoa h?c l&agrave; Chamaedorea elegans, thu?c h? Arecaceae. C&acirc;y c&oacute; ngu?n g?c t? r?ng nhi?t d?i ? ph&iacute;a nam Mexico. ? Vi?t Nam cau hawai du?c tr?ng ch? y?u ? mi?n Nam.</p>

<p><img alt="cây cau hawai1" src="https://cayvahoa.net/wp-content/uploads/2016/09/1387155872_cau-hawai.jpg" style="height:413px; width:502px" /></p>

<p>H&igrave;nh d&aacute;ng c?a cau hawai hoi gi?ng&nbsp;<a href="https://cayvahoa.net/cay-truc-nhat/"><strong>tr&uacute;c nh?t</strong></a>&nbsp;v?i th&acirc;n m?nh mai, tr&ograve;n l&aacute; c&oacute; m&agrave;u xanh b&oacute;ng k&eacute;p ch&acirc;n chim, th&acirc;n c&acirc;y c&oacute; chia d?t. Ð?c t&iacute;nh c?a cau Hawai m?c th&agrave;nh b?i d? nh&aacute;nh li&ecirc;n t?c. Hoa c&oacute; m&agrave;u v&agrave;ng, m?c ? k? l&aacute;. Qu? khi ch&iacute;n c&oacute; m&agrave;u d? h&igrave;nh c?u. Trung b&igrave;nh m?i c&acirc;y cau d?t chi?u cao t? 1m- 1,6m t&ugrave;y thu?c v&agrave;o v? tr&iacute; d? c&acirc;y. N?u nhu b?n mu?n d?t b&agrave;n ch? c?n l?a ch?n c&acirc;y v?i chi?u cao tr&ecirc;n 10cm.</p>

<p>V? d?c t&iacute;nh sinh tru?ng th&igrave; cau tuong d?i d? tr?ng v&agrave; cham s&oacute;c, ch?u du?c b&oacute;ng r&acirc;m n&ecirc;n ch&uacute;ng r?t th&iacute;ch h?p l&agrave;m c&acirc;y c?nh trong nh&agrave;, van ph&ograve;ng, &nbsp;trang tr&iacute; qu&aacute;n cafe&hellip; B?n y&ecirc;n t&acirc;m l&agrave; ch&uacute;ng c&oacute; th? s?ng kh?e m?nh trong van ph&ograve;ng c&oacute; m&aacute;y l?nh.</p>

<p><img alt="16010292_1618383151511320_732240845_o" src="https://cayvahoa.net/wp-content/uploads/2016/09/16010292_1618383151511320_732240845_o.jpg" style="height:514px; width:385px" /></p>

<p>M?t uu di?m c?a&nbsp;<a href="https://cayvahoa.net/y-nghia-cham-soc-ban-cay-cau-hawai/%20%E2%80%8E"><strong>c&acirc;y cau Hawai</strong></a>&nbsp;d&oacute; l&agrave; kh? nang h?p th? kh&iacute; d?c h?i v&agrave; b?i b?n t? c&aacute;c thi?t b? di?n t?, t? m&ocirc;i tru?ng b&ecirc;n ngo&agrave;i, t? c&aacute;c ch?t h&oacute;a h?c t?y r?a&hellip; Cau Hawai gi&uacute;p kh&ocirc;ng kh&iacute; th&ecirc;m trong s&aacute;ch, gi&uacute;p b?n minh m?n, t?p trung hon trong c&ocirc;ng vi?c&hellip;.</p>

<p>Theo phong th?y<strong>&nbsp;&yacute; nghia c&acirc;y cau Hawai</strong>&nbsp;l&agrave; c&acirc;y gi&uacute;p xua du?i nh?ng di?u kh&ocirc;ng may m?n, l&agrave; c&acirc;y mang l?i t&agrave;i l?c, ph&uacute; qu&yacute;, gia tang du?ng t&agrave;i v?n cho b?n.</p>

<p><strong>M?t s? luu &yacute; khi tr?ng cau Hawai</strong></p>

<p><img alt="cây cau hawai3" src="https://cayvahoa.net/wp-content/uploads/2016/09/cham-soc-cau-hawaii.jpg" style="height:668px; width:500px" /></p>

<p>Ð? c&acirc;y xanh t?t v&agrave; ph&aacute;t tri?n t?t b?n c?n ch&uacute; &yacute; m?t trong nh?ng y&ecirc;u t? sau d&acirc;y:</p>

<ul>
	<li>C?n ch?n lo?i d?t toi x?p, kh? nang tho&aacute;t nu?c t?t</li>
	<li>Gi? d? ?m cho d?t b?ng c&aacute;ch tu?i nu?c d?u d?n tu?n 2 l?n.</li>
	<li>Trong di?u ki?n c&acirc;y tr?ng trong ph&ograve;ng h&agrave;ng tu?n c?n cho c&acirc;y ra ngo&agrave;i t?m n?ng nh? d? c&acirc;y xanh t?t hon</li>
	<li>B?n c&oacute; th? d&ugrave;ng ph&acirc;n b&oacute;n th&uacute;c cho c&acirc;y theo d?nh k&igrave; 2 th&aacute;ng/l?n</li>
	<li>Khi c&acirc;y d?t d?n m?t k&iacute;ch thu?c nh?t d?nh b?n c&oacute; th? t&aacute;ch b?i ho?c thay ch?u kh&aacute;c d? t?o m&ocirc;i tru?ng tho?i m&aacute;i cho b? r? c&acirc;y ph&aacute;t tri?n</li>
	<li>Ð? c&acirc;y c&oacute; d&aacute;ng th?ng b?n c?n d?t th?ng d?ng c&acirc;y khi tr?ng v&agrave;o ch?u kh&ocirc;ng b? nghi&ecirc;ng.</li>
	<li>N&ecirc;n d?t c&acirc;y g?n v? tr&iacute; c&oacute; &aacute;nh s&aacute;ng th&igrave; l&aacute; d? d&agrave;y hon, xanh hon. Ð?t c&acirc;y trong b&oacute;ng t?i nhi?u c&acirc;y s? v&agrave;ng l&aacute; v&agrave; ch?t.</li>
</ul>

<p><img alt="cay-cau-hawai" src="https://cayvahoa.net/wp-content/uploads/2016/09/cay-cau-hawai.jpg" style="height:258px; width:290px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (23, 2, N'Cây bao thanh thiên', N'cay-bao-thanh-thien-4.jpg', 289000, 0, N'Cây bao thanh thiên – loại cây mang vẻ đẹp sang trọng và quý phái, luôn đem đến cho gia chủ sự thịnh vượng, tiền tài, danh vọng.', N'<p><a href="https://cayvahoa.net/cach-trong-va-cham-soc-cay-bao-thanh-thien/"><strong>C&acirc;y bao thanh thi&ecirc;n</strong></a>&nbsp;&ndash; lo?i c&acirc;y mang v? d?p sang tr?ng v&agrave; qu&yacute; ph&aacute;i, lu&ocirc;n dem d?n cho gia ch? s? th?nh vu?ng, ti?n t&agrave;i, danh v?ng. Ch&uacute;ng kh&ocirc;ng ch? d?p b?i &yacute; nghia m&agrave; c&ograve;n d?c di?m h&igrave;nh th?c c&acirc;y cung d?p. V?i v? ngo&agrave;i tuoi t?n, n?i b?t v?i gam m&agrave;u d? t&iacute;a b?i ph?n du?i l&aacute;, du?ng g&acirc;n l&aacute; m&agrave;u h?ng, m?t tr&ecirc;n m&agrave;u xanh khi?n cho c&acirc;y c&agrave;ng th&ecirc;m r?c r? hon n?a. N?u b?n ch?n mua lo?i c&acirc;y n&agrave;y d? trang tr&iacute; n?i th?t trong nh&agrave; th&igrave; b?n c?n hi?u r&otilde; hon v? ch&uacute;ng d?c bi?t l&agrave; c&aacute;ch tr&ocirc;ng v&agrave; cham s&oacute;c. H&atilde;y d?&nbsp;th? gi?i c&acirc;y v&agrave; hoa&nbsp;gi&uacute;p b?n nh&eacute;!</p>

<p>***&nbsp;<strong>T&igrave;m hi?u v? c&acirc;y ph&uacute; qu&yacute;</strong></p>

<p><img alt="Cách tr?ng và cham sóc cây bao thanh thiên" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-bao-thanh-thien-1.jpg" style="width:500px" /></p>

<p>Du?ng nhu lo?i c&acirc;y bao thanh thi&ecirc;n&nbsp;kh&ocirc;ng c&oacute; th&acirc;n v&agrave; nh?ng c&agrave;nh c&acirc;y m?c l&ecirc;n th&agrave;nh t?ng ch&ugrave;m c&oacute; m&agrave;u d? h?ng tr&ocirc;ng r?t d?p. V?i c&aacute;i t&ecirc;n g?i kh&aacute;c l&agrave; c&acirc;y cung di?n, c&acirc;y c&oacute; chi?u cao t? 25 d?n 35 cm, l&aacute; thu&ocirc;n d&agrave;i, nh?n ph&iacute;a d?u, c&oacute; m&agrave;u t&iacute;m du?i l&aacute;, m?t tr&ecirc;n m&agrave;u xanh c&ograve;n g&acirc;n l&aacute; m&agrave;u h?ng. Nh?ng m&agrave;u n&agrave;y xen l?n v&agrave;o v?i nhau khi?n cho c&acirc;y c&agrave;ng tr? n&ecirc;n r?c r? hon bao gi? h?t.</p>

<p>Lo?i c&acirc;y n&agrave;y sinh tru?ng nhanh, c&oacute; th? s?ng l&acirc;u nam dem d?n cho kh&ocirc;ng gian&nbsp;n?i th?t trong nh&agrave;&nbsp;th&ecirc;m d?p, sang tr?ng v&agrave; tinh t? nh?t. &Yacute; nghia m&agrave; c&acirc;y bao thanh thi&ecirc;n mang l?i ch&iacute;nh l&agrave; mang l?i s? qu&yacute; ph&aacute;i sang tr?ng cho ngu?i s? d?ng. Khi m?t ngu?i s? h?u lo?i c&acirc;y n&agrave;y s? du?c nh?n t? ch&uacute;ng nhu m?t l?i ch&uacute;c ph&uacute;c, th?nh vu?ng, tang t&agrave;i l?c. Trong phong th?y c&ograve;n c&oacute; nghia xua du?i nh?ng di?u xui x?o, ma qu?, tr? t&agrave; khi?n cho c&ocirc;ng vi?c lu&ocirc;n thu?n l?i, thu?n bu?m xu&ocirc;i gi&oacute;. M&agrave; kh&ocirc;ng dung ngu?i ta d?t cho c&acirc;y t&ecirc;n l&agrave;&nbsp;<strong>c&acirc;y bao thanh thi&ecirc;n</strong>&nbsp;b?i ch&uacute;ng c&ograve;n mang h&agrave;m &yacute; lu&ocirc;n th? hi?n t?m l&ograve;ng ngay th?ng, ch&iacute;nh tr?c, li&ecirc;m khi?t&hellip;</p>

<p><img alt="Cách tr?ng và cham sóc cây bao thanh thiên" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-bao-thanh-thien-2.jpg" style="width:500px" /></p>

<p>Ch&uacute;ng c&oacute; th? s?ng trong m&ocirc;i tru?ng d?t v&agrave; th?y sinh n&ecirc;n c?n k? thu?t cham s&oacute;c t?t d? c&acirc;y sinh tru?ng v&agrave; ph&aacute;t tri?n m?nh m? hon n?a.<strong>&nbsp;C&aacute;ch tr?ng c&acirc;y bao thanh thi&ecirc;n</strong>&nbsp;l&agrave; h?u nhu lo?i c&acirc;y n&agrave;y du?c nh&acirc;n gi?ng b?ng c&aacute;ch t&aacute;ch t? b?i l?n th&agrave;nh c&aacute;c c&acirc;y con sau d&oacute; tr?ng ra c&aacute;c ch?u c&acirc;y kh&aacute;c. Ð? c&oacute; th? con du?c gi?ng t?t th&igrave; c&acirc;y b? m? c?n d?m b?o v? m?i m?t nhu s?c kh?e c&acirc;y, t?c d? sinh tru?ng m?nh, kh&ocirc;ng s&acirc;u b?nh.</p>

<p><img alt="Cách tr?ng và cham sóc cây bao thanh thiên" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-bao-thanh-thien-3.jpg" style="width:500px" /></p>

<p><strong>C&aacute;ch cham s&oacute;c c&acirc;y bao thanh thi&ecirc;n</strong></p>

<p>Cho d&ugrave; c&acirc;y s?ng ? m&ocirc;i tru?ng d?t hay th?y sinh di chang n?a th&igrave; b?n cung n&ecirc;n luu &yacute; m?t s? y?u t? nhu:</p>

<p><strong>&ndash; Nu?c:&nbsp;</strong>l&agrave; lo?i c&acirc;y ua ?m n&ecirc;n c?n cung c?p d? nu?c cho c&acirc;y tr?ng, tr&aacute;nh kh&ocirc; d?t s? d?n d?n l&agrave;m c&acirc;y kh&ocirc; h&eacute;o v&agrave; ch?t. N?u tr?ng trong nu?c th&igrave; ph?i d?m b?o nu?c lu&ocirc;n ph?i ng?p 2/3 b? r? d? c&acirc;y h&uacute;t nu?c.</p>

<p><strong>&ndash; &Aacute;nh s&aacute;ng:</strong>&nbsp;M?c d&ugrave; tr?ng trong nh&agrave; nhung b?n c?n ph?i cho c&acirc;y h?ng n?ng thu?ng xuy&ecirc;n d? c&acirc;y lu&ocirc;n tuoi t?t.</p>

<p><strong>&ndash; Cham s&oacute;c:</strong>&nbsp;C&acirc;y hay thay l&aacute; n&ecirc;n b?n c?n ph?i nh?t, t?a l&aacute; d? kh&ocirc;ng l&agrave;m d?c nu?c hay b?n ch?u c&acirc;y. Ð?i v?i c&acirc;y trong nu?c th&igrave; c?n thay nu?c khi th?y hi?n tu?ng d?c, v?y b?n, s?i b?t. N?u v?y b?n c?n x? l&yacute; b?ng c&aacute;ch lo?i b? nh?ng l&aacute; v&agrave;ng th?i khi?n nu?c b? d?c sau d&oacute; c?n th?n d? kh&ocirc;ng b? d?p c&agrave;nh l&aacute; kh&aacute;c, l?y v&ograve;i x?t r?a s?ch r? c&acirc;y r?i r?a s?ch b&igrave;nh m?i thay nu?c m?i v&agrave;o.</p>

<p>&ndash; Ð?i v?i c&acirc;y tr?ng trong d?t th&igrave; n&ecirc;n ch&uacute; &yacute; d?n d?t tr?ng v?i th&igrave; n&ecirc;n ch?n d?t c&oacute; nhi?u dinh du?ng, tr?n th&ecirc;m m&ugrave;n ho?c ph&acirc;n h?n h?p, t?o m&ocirc;i tru?ng thu?n l?i cho c&acirc;y ph&aacute;t tri?n m?nh hon.</p>

<p>&ndash; Ph&acirc;n b&oacute;n v&agrave; s&acirc;u b?nh: trong t?ng th?i k? c?a c&acirc;y th&igrave; b?n n&ecirc;n b&oacute;n ph&acirc;n d?nh k?, kho?ng 1 th&aacute;ng 1 l?n v?i ph&acirc;n NPK. N?u trong qu&aacute; tr&igrave;nh c&acirc;y ph&aacute;t tri?n g?p s&acirc;u b?nh b?n h&atilde;y s? d?ng thu?c b?o v? th?c v?t d? ngan ch?n l&acirc;y lan.</p>

<p><img alt="Cách tr?ng và cham sóc cây bao thanh thiên" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-bao-thanh-thien-4.jpg" style="width:500px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (24, 2, N'Cây đa búp đỏ', N'cay-da-bup-do-su-truong-ton-mai-mai-4.jpg', 150000, 0, N'Cây búp đỏ _ Cây đa, bến nước, sân đình là những đặc trưng của người Việt Nam qua bao nhiêu năm thăng trầm lịch sử.', N'<p><a href="https://cayvahoa.net/y-nghia-cay-da-bup-trong-trong-nha-duoc-ban-tai-ha-noi/">C&acirc;y b&uacute;p d?</a>&nbsp;_ C&acirc;y da, b?n nu?c, s&acirc;n d&igrave;nh l&agrave; nh?ng d?c trung c?a ngu?i Vi?t Nam qua bao nhi&ecirc;u nam thang tr?m l?ch s?. N?m trong b? t? qu&yacute; da, sung, sanh, si, th&igrave; c&acirc;y da du?c nh?c d?n v?i s? g?n gui v?i con ngu?i hon. Ng&agrave;y nay v?i s?&nbsp;sinh tru?ng ph&aacute;t tri?n gi?ng nhu c&acirc;y da v&agrave; nh?ng ch?i m?i c?a c&acirc;y du?c bao b?c b?i l?p l&aacute; non m&agrave;u d?, b&uacute;p non n&agrave;y c&oacute; h&igrave;nh gi?ng ng&ograve;i b&uacute;t c?a &ocirc;ng d? n&ecirc;n ch&uacute;ng du?c g?i l&agrave;&nbsp;<strong>c&acirc;y b&uacute;p da d?&nbsp;</strong>. C&ugrave;ng cayvahoa.net&nbsp;th? t&igrave;m hi?u v? lo?i c&acirc;y n&agrave;y v? d?c di?m v&agrave; &yacute; nghia c&acirc;y da b&uacute;p d? c?a ch&uacute;ng mang l?i nh&eacute;.</p>

<p>***&nbsp;C&acirc;y t&ugrave;ng b?ng lai d? b&agrave;n&nbsp;/&nbsp;C&acirc;y thi?t m?c lan&nbsp;</p>

<p><img alt="Cây da búp d? s? tru?ng t?n mãi mãi" src="https://cayvahoa.net/wp-content/uploads/2016/07/cay-da-bup-do-su-truong-ton-mai-mai-1.jpg" style="width:500px" /></p>

<p><strong>Ð?c di?m c&acirc;y da b&uacute;p d?</strong></p>

<p>T&ecirc;n g?i kh&aacute;c: Ða cao su, da dai.<br />
Ngu?n g?c: ? v&ugrave;ng d&ocirc;ng b?c ?n Ð?, ph&iacute;a nam Indonesia<br />
Th&acirc;n c&acirc;y g?, c&oacute; th? cao d?n 30 -40 m&eacute;t. Ðu?ng k&iacute;nh th&acirc;n c&oacute; th? t?i 2m, c&aacute;c c&agrave;nh l&aacute; ph&aacute;t tri?n ra t? c&aacute;c r? kh&iacute;, r? tr?. L&agrave;m cho c&acirc;y th&ecirc;m v?ng ch?c, b&aacute;m s&acirc;u v&agrave;o d?t. L&aacute; h&igrave;nh ovan, b&oacute;ng m?n. Nh?ng l&aacute; non ph&aacute;t tri?n trong m?t l?p b&uacute;p, thu?ng g?i l&aacute; b&uacute;p da, v&agrave; khi l&aacute; ph&aacute;t tri?n ra th&igrave; l?p b?c d&oacute; r?ng di.</p>

<p>Hi?n nay c&acirc;y da du?c &aacute;p d?ng v&agrave;o th?c ti?n d?i s?ng con ngu?i n&ecirc;n chi?u cao c?a c&acirc;y c&oacute; ph?n h?n ch?. Ch&uacute;ng du?c ch?n l?a v&agrave; lai t?o d? l&agrave;m<strong>&nbsp;c&acirc;y c?nh tr?ng trong nh&agrave;&nbsp;</strong>hi?n du?c ua chu?ng nh?t. B&uacute;p da d? c&oacute; ch?i&nbsp;ng?n b?c l?p b&uacute;p m&agrave;u d? r?c. C&acirc;y c&oacute; m? m&agrave;u tr?ng b?i ng&agrave;y xua khi con ngu?i mang c&acirc;y cao su di tr?ng th? nghi?m ? c&aacute;c v&ugrave;ng d?t m?i nhung kh&ocirc;ng th&agrave;nh c&ocirc;ng n&ecirc;n ng&agrave;y nay ch&uacute;ng du?c lai t?o th&agrave;nh c&acirc;y da b&uacute;p d? c&oacute; m? gi?ng cao su.</p>

<p><img alt="Cây da búp d? s? tru?ng t?n mãi mãi" src="https://cayvahoa.net/wp-content/uploads/2016/07/cay-da-bup-do-su-truong-ton-mai-mai-2.jpg" style="width:500px" /></p>

<p>C&acirc;y thu?ng du?c tr?ng ? c&aacute;c c&ocirc;ng tr&igrave;nh, khu bi?t th?, s&acirc;n vu?n, di t&iacute;ch&hellip; Ð? th?y nh?ng h&igrave;nh ?nh c? k&iacute;nh c?a ngu?i Vi?t trong d&acirc;y. Lo?i c&acirc;y n&agrave;y kh&ocirc;ng nh?ng l&agrave;m d?p c?nh quan thi&ecirc;n nhi&ecirc;n m&agrave; ch&uacute;ng c&ograve;n mang l?i kh&ocirc;ng kh&iacute; trong l&agrave;nh tuoi m&aacute;t hon. C&oacute; nhi?u t&agrave;i li?u vi?t r?ng l&aacute; da b&uacute;p d? c&oacute; th? ch?a du?c m?n nh?t, l?i ti?u, gi?i c?m.</p>

<p>Ngo&agrave;i ra&nbsp;<strong>c&acirc;y da b&uacute;p d?</strong>&nbsp;tr?ng trong nh&agrave; cung du?c nhi?u ngu?i ch&uacute; &yacute; v&agrave; s? d?ng ch&uacute;ng nhu c&acirc;y n?i th?t d?p. N&ecirc;n hi?n nay ch&uacute;ng r?t du?c th?nh h&agrave;nh v&agrave; nh&acirc;n gi?ng r?ng r&atilde;i kh?p noi.</p>

<p><img alt="Cây da búp d? s? tru?ng t?n mãi mãi" src="https://cayvahoa.net/wp-content/uploads/2016/07/cay-da-bup-do-su-truong-ton-mai-mai-3.jpg" style="width:500px" /></p>

<p><strong>&Yacute; nghia c&acirc;y da b&uacute;p d?</strong></p>

<p>Th? hi?n cho s? tru?ng t?n vinh c?u, s?c s?ng d?o dai phi thu?ng. B&ecirc;n c?nh d&oacute; ch&uacute;ng c&ograve;n l&agrave; bi?u tu?ng th?n quy?n vuong th? c?a con ngu?i.</p>

<p>Theo &yacute; nghia c&acirc;y da b&uacute;p d? trong phong th?y th&igrave; lo?i c&acirc;y n&agrave;y s? lu&ocirc;n mang l?i b&igrave;nh an, &ecirc;m ?m cho con ngu?i v&agrave; gia d&igrave;nh b?n.</p>

<p><img alt="Cây da búp d? s? tru?ng t?n mãi mãi" src="https://cayvahoa.net/wp-content/uploads/2016/07/cay-da-bup-do-su-truong-ton-mai-mai-4.jpg" style="width:500px" /></p>

<p><strong>Mua c&acirc;y da b&uacute;p d? H&agrave; N?i ? d&acirc;u?</strong></p>

<p>Nhu ch&uacute;ng t&ocirc;i d&atilde; n&oacute;i nhu tr&ecirc;n, hi?n lo?i c&acirc;y n&agrave;y r?t du?c ua chu?ng v&agrave; tr&ecirc;n th? tru?ng c&acirc;y c?nh trong nu?c n&oacute;i chung, th? tru?ng c&acirc;y c?nh H&agrave; N?i n&oacute;i ri&ecirc;ng th&igrave;&nbsp;<strong>c&acirc;y da b&uacute;p d? H&agrave; N?i</strong>&nbsp;du?c r?t nhi?u kh&aacute;ch quan t&acirc;m. Khi ch&uacute;ng du?c h?n ch? v? chi?u cao, qua nhi?u l?n lai t?o khi?n ch&uacute;ng c&agrave;ng tr? n&ecirc;n d?p hon, kh&ocirc;ng ch? l&agrave; c&acirc;y c?nh c&ocirc;ng tr&igrave;nh m&agrave; hi?n ch&uacute;ng c&ograve;n du?c tr?ng trong ch?u d? d?t d? v&agrave;o nh&agrave; v?i nhi?u v? tr&iacute; kh&aacute;c nhau.</p>

<p>V?i nh?ng ch?u c&acirc;y v?i nhi?u ki?u d&aacute;ng k&iacute;ch c? kh&aacute;c nhau. Hi?n c?a h&agrave;ng&nbsp;<em>th? gi?i c&acirc;y v&agrave; hoa</em>&nbsp;chuy&ecirc;n cung c?p v&agrave;&nbsp;<strong>b&aacute;n c&acirc;y da b&uacute;p d?</strong>&nbsp;v?i gi&aacute; c? h?p l&yacute; nh?t cho kh&aacute;ch h&agrave;ng c&oacute; th? tho?i m&aacute;i l?a ch?n. Kh&ocirc;ng ch? ri&ecirc;ng g&igrave; c&acirc;y b&uacute;p da d? m&agrave; c&ograve;n r?t nhi?u lo?i c&acirc;y c?nh kh&aacute;c. B?n c&oacute; th? d?t ch&uacute;ng ? ph&ograve;ng kh&aacute;ch, h&agrave;nh lang, d? b&agrave;n&hellip; v?i nhi?u k&iacute;ch thu?c kh&aacute;c nhau, s? l&agrave;m nh&agrave; b?n th&ecirc;m n&eacute;t c? k&iacute;nh, tho&aacute;ng m&aacute;t hon.</p>

<p><img alt="Cây da búp d? s? tru?ng t?n mãi mãi" src="https://cayvahoa.net/wp-content/uploads/2016/07/cay-da-bup-do-su-truong-ton-mai-mai-5.jpg" style="width:500px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (25, 2, N'Cây cỏ đồng tiền', N'13043210_1714013022199522_8777861098397467765_n.jpg', 120000, 0, N'Cỏ đồng tiền giúp điều hòa không khí, hấp thụ khí CO2 nhờ đó mang lại cảm giác thư thái, thoải mái cho bạn. Người ta còn gọi nó là cây cỏ may mắn.', N'<p><strong>C&acirc;u h?i:&nbsp;</strong>Ch&agrave;o chuy&ecirc;n m?c c&acirc;y v&agrave; hoa! T&ocirc;i t&ecirc;n l&agrave; Nguy?n H?i H&agrave; (27 tu?i). T&ocirc;i l&agrave; m?t ngu?i kh&aacute; y&ecirc;u th&iacute;ch c&acirc;y c?nh, t&ocirc;i hay suu t?p nh?ng&nbsp;<a href="https://cayvahoa.net/cay-canh/cay-de-ban/"><strong>c&acirc;y d? b&agrave;n d?p</strong></a>, nh? nh?n. D?o n&agrave;y c&ocirc;ng vi?c kinh doanh c?a t&ocirc;i cung kh&ocirc;ng du?c thu?n l?i do t&ocirc;i hay do d? v&agrave; b? qua nhi?u co h?i ki?m ti?n. C&oacute; ngu?i c&oacute; b?o t&ocirc;i b?o tu?i c?a t&ocirc;i l&agrave; tu?i r?n, m&agrave; d?t nh?ng c&acirc;y nhu n&agrave;y kh&ocirc;ng h?p v?i phong th?y, c?n chuy?n sang c&acirc;y kh&aacute;c. V?y shop c&oacute; th? tu v?n cho t&ocirc;i lo?i c? h?p v?i tu?i c?a t&ocirc;i d? c&ocirc;ng vi?c th&ecirc;m thu?n l?i th&ecirc;m kh&ocirc;ng ?? V&agrave; d?a ch? mua b&aacute;n n&oacute; ? d&acirc;u ?? Xin ch&acirc;n th&agrave;nh c?m on!</p>

<p>&nbsp; ***&nbsp;<strong><a href="https://cayvahoa.net/cay-truong-sinh-loai-cay-cua-su-truong-ton/">C&acirc;y tru?ng sinh</a></strong>&nbsp;/&nbsp;<strong><a href="https://cayvahoa.net/cay-cam-nhung-cach-trong-va-cham-soc/">c&acirc;y c?m nhung</a></strong></p>

<p><img alt="cây c? d?ng ti?n" src="https://cayvahoa.net/wp-content/uploads/2016/07/13043210_1714013022199522_8777861098397467765_n.jpg" style="height:575px; width:385px" /></p>

<p>c? d?ng ti?n mua ? d&acirc;u ?</p>

<p><strong>Tr? l?i</strong>: C?m on b?n d&atilde; g?i thu v? cho chuy&ecirc;n m?c. Ngo&agrave;i v? d?p xinh x?n c?a c&acirc;y c?nh, y?u t? phong th?y cung r?t c?n thi?t v?i b?n. Tu?i c?a b?n l&agrave; tu?i r?n nh&agrave; nh?ng ngu?i kh&ocirc;ng bi?t n?m ch?c co h?i, hay do d? v&agrave; b? qua nh?ng co h?i c?a m&igrave;nh. V?i tu?i n&agrave;y b?n c?n d?t m?t ch?u nh?&nbsp;<a href="https://cayvahoa.net/cay-co-dong-tien-mua-o-dau-uy-tin-gia-re/"><strong>c? d?ng ti?n&nbsp;</strong></a>? g?n c?a s? noi b?n l&agrave;m vi?c gi&uacute;p du?ng t&agrave;i v?n tr? n&ecirc;n su&ocirc;n s? hon, d?ng th?i gi&uacute;p b?n m?nh m?, quy?t do&aacute;n, n&acirc;ng cao kh? nang c?a b?n.</p>

<p><img alt="c? d?ng ti?n mua ? dâu2" src="https://cayvahoa.net/wp-content/uploads/2016/07/10406535_662070900543513_7200769103669760226_n.png" style="height:375px; width:513px" /></p>

<p>shop c&acirc;y v&agrave; hoa b&aacute;n c? d?ng ti?n d?p</p>

<p>C? d?ng ti?n c&oacute; v? l&agrave; hoi x? l? v?i nhi?u b?n, nhung g?n d&acirc;y n&oacute; l&agrave; m?t tr&agrave;o luu. V?i h&igrave;nh d&aacute;ng nh? nh?n, l&aacute; c&oacute; m&agrave;u xanh d?m, l&aacute; h&igrave;nh tr&ograve;n gi?ng nhu d?ng ti?n xu. L&agrave; m?t c&acirc;y v&ocirc; c&ugrave;ng r?t d? tr?ng, s?ng du?c c? 2 m&ocirc;i tru?ng th?y canh v&agrave; d?t. C? th&iacute;ch nghi v?i &aacute;nh s&aacute;ng. B?n c&oacute; th? t&ugrave;y ch?nh d? cao th?p c?a c&acirc;y b?ng c&aacute;ch dua ra ngo&agrave;i &aacute;nh s&aacute;ng ho?c d? trong ph&ograve;ng v?i di?u ki?n &aacute;nh s&aacute;ng y?u. ? di?u ki?n &aacute;nh s&aacute;ng m?nh ch&uacute;ng s? m?c v?i chi?u cao th?p, chuy?n sang b&ograve; th&agrave;nh c&aacute;c th?m. Ngu?c l?i v?i di?u ki?n &aacute;nh s&aacute;ng y?u ch&uacute;ng s? vuon cao l&ecirc;n tuy nhi&ecirc;n trong th?i gian qu&aacute; l&acirc;u c&acirc;y s? ng?ng ph&aacute;t tri?n. Khi d?t d?n chi?u cao mong mu?n b?n c?n dua ra ngo&agrave;i c?a s? d? c&acirc;y c&oacute; th? h?p th? &aacute;nh s&aacute;ng v&agrave; CO2.</p>

<p><img alt="c? d?ng ti?n mua ? dâu3" src="https://cayvahoa.net/wp-content/uploads/2016/07/10456273_662070907210179_2133343286711979680_n.png" style="height:320px; width:526px" /></p>

<p>Ð? tr? l?i cho c&acirc;u h?i&nbsp;<strong>c&acirc;y c? d?ng ti?n mua ? d&acirc;u&nbsp;</strong>? Chuy&ecirc;n m?c xin tr? l?i nhu sau: Hi?n t?i b&ecirc;n shop dang nh?p kh&aacute; nhi?u c? d?ng ti?n v? ch?t lu?ng th&igrave; b?n kh?i lo l?ng. B&ecirc;n m&igrave;nh s? tu v?n cho b?n c? th? v? c&aacute;ch tr?ng v&agrave; cham s&oacute;c. Trong qu&aacute; tr&igrave;nh tr?ng c&ograve;n th?c m?c g&igrave; b?n c? d? l?i ph?n h?i, b&ecirc;n m&igrave;nh s? gi&uacute;p d? cho b?n. B?n c&oacute; th? li&ecirc;n l?c theo s? hotline:&nbsp;0988.580.657 &ndash; 01682.831.686. Ho?c:</p>

<p>TH? GI?I&nbsp;<a href="https://cayvahoa.net/">C&Acirc;Y V&Agrave; HOA</a></p>

<p>VP: 0830 HH4B Linh Ð&agrave;m &ndash; Ho&agrave;ng Mai</p>

<p>Kho: 1410 HH4B Linh Ð&agrave;m &ndash; Ho&agrave;ng Mai</p>

<p>N?u b?n l&agrave; ngu?i y&ecirc;u th&iacute;ch m&agrave;u xanh th&igrave; d&acirc;y ch&iacute;nh l&agrave; s? l?a ch?n th&iacute;ch h?p cho b?n. C? d?ng ti?n gi&uacute;p t?o c?m gi&aacute;c m&aacute;t m?, t? nhi&ecirc;n, xua tan c&aacute;i oi b?c cho ch&iacute;nh can ph&ograve;ng c?a b?n.</p>

<p>C? d?ng ti?n gi&uacute;p di?u h&ograve;a kh&ocirc;ng kh&iacute;, h?p th? kh&iacute; CO2 nh? d&oacute; mang l?i c?m gi&aacute;c thu th&aacute;i, tho?i m&aacute;i cho b?n. Ngu?i ta c&ograve;n g?i n&oacute; l&agrave; c&acirc;y c? may m?n.</p>

<p><img alt="c? d?ng ti?n mua ? dâu4" src="https://cayvahoa.net/wp-content/uploads/2016/07/10460458_662070837210186_7365216360080377436_n.png" style="height:370px; width:503px" /></p>

<p>C&oacute; b?n c&oacute; h?i shop c? d?ng ti?n c&oacute; h?t gi?ng kh&ocirc;ng? D? thua&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;c&oacute; h?t gi?ng b?n nh&eacute;. M&igrave;nh s? hu?ng d?n chi ti?t cho b?n v? c&aacute;ch ch?m s&oacute;c c? d?ng ti?n&nbsp;xanh t?t nh?t.</p>

<ul>
	<li>B?n c&oacute; th? tr?ng quanh nam, tuy nhi&ecirc;n ch&uacute;ng v?n ua kh&ocirc;ng kh&iacute; ?m &aacute;p v&agrave;o mua fh&egrave; v&agrave; thu.</li>
	<li>C&aacute;ch&nbsp;cham s&oacute;c kh&aacute; l&agrave; don gi?n ch? c?n cho ch&uacute;ng v&agrave;o nu?c, c&oacute; th&ecirc;m b&ugrave;n m?ng ? du?i th&igrave; c&agrave;ng t?t. Th?c hi?n thay nu?c d?u d?n 1 tu?n/ l?n. C&acirc;y th?y canh cung s? kh&iacute; clo t? nu?c m&aacute;y n&ecirc;n b?n c?n x? ra ch?u cho bay h?t clo r?i m?i thay nu?c cho c&acirc;y b?n nh&eacute;.</li>
</ul>

<p>Cham s&oacute;c c? d?ng ti?n&nbsp;cung kh&aacute; don gi?n d&uacute;ng kh&ocirc;ng c&aacute;c b?n. N?u b?n kh&ocirc;ng c&oacute; th?i gian, ho?c c?n ngay m?t b?i c? d? tr?ng th&igrave; b?n c&oacute; th? d?t mua ngay t?i shop.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (26, 2, N'Cây trắc bách diệp', N'cay-de-ban-trac-bach-diep-640-600x460.jpg', 200000, 0, N'Trắc bách diệp có tính mát, vị đắng, có tác dụng cầm máu, kiết lỵ ra máu, thổ huyết, táo bón, các bệnh về đường hô hấp như: ho, sốt, ra nhiều mồ hôi… Trồng một cây trắc bách diệp trong nhà rất tiện lợi phải không các bạn?', N'<p><a href="https://cayvahoa.net/cay-trac-bach-diep-gia-re-bai-thuoc-ban-can-biet/"><strong>C&acirc;y tr?c b&aacute;ch di?p</strong></a>&nbsp;t&ecirc;n &nbsp;khoa h?c l&agrave; platycladus orientalis. L&agrave; lo?i c&acirc;y c&oacute; ngu?n g?c t? Trung Qu?c v&agrave; Tri?u Ti&ecirc;n. ? m&ocirc;i tru?ng t? nhi&ecirc;n ch&uacute;ng thu?ng m?c ? c&aacute;c v&aacute;ch d&atilde;, su?n d?i c&oacute; chi?u cao hon ch?c m&eacute;t v&agrave; t&aacute;n r?ng. Ch&uacute;ng du?c nh?p v? Vi?t Nam c&oacute; chi?u cao trung b&igrave;nh t? 40 cm- 50 cm. L&agrave; lo?i c&acirc;y c&oacute; m&agrave;u s?c b?t m?t, h&igrave;nh d&aacute;ng d?p thu?ng du?c tr?ng trong ch?u , s&acirc;n vu?n&hellip; B?i v?y ngu?i ta d&ugrave;ng trang tr&iacute; nhi?u. Ngo&agrave;i ra theo d&ocirc;ng y n&oacute; c&ograve;n l&agrave; lo?i thu?c tr? c&aacute;c b?nh v? du?ng h&ocirc; h?p, ho ra m&aacute;u, rong kinh&hellip;</p>

<p><img alt="cây tr?c bách di?p" src="https://cayvahoa.net/wp-content/uploads/2016/07/cay-de-ban-trac-bach-diep-640.jpg" style="height:351px; width:500px" /></p>

<p>C&acirc;y tr?c b&aacute;ch di?p c&oacute; nhi?u c&agrave;nh nhung c&oacute; th? c?t t?a theo m?t d&aacute;ng, c&aacute;c c&agrave;nh l&agrave;m th&agrave;nh m?t m?t ph?ng n&ecirc;n c&oacute; t&ecirc;n tr?c b&aacute;ch di?p. H&igrave;nh d?ng t?ng th? c?a c&acirc;y tr?c b&aacute;ch di?p l&agrave; h&igrave;nh n&oacute;n v?i ng?n c&acirc;y tr? n&ecirc;n kh&ocirc;ng d?u khi c&acirc;y c&agrave;ng l?n.</p>

<p>H&igrave;nh d?ng c?a ch&uacute;ng khi du?c tr?ng ? nh&agrave; thu?ng c&oacute; h&igrave;nh n&oacute;n du?c c&aacute;c b&agrave;n tay c?a c&aacute;c th? c&acirc;y c?nh t?a kh&eacute;o l&eacute;o. V? c&oacute; m&agrave;u n&acirc;u, l&aacute; m&agrave;u xanh non v?y nh? ch?ng ch&eacute;o g?n ch?t v?i nhau, m?c tuong d?i th?ng.</p>

<p>Ch&uacute;ng thu?ng m?c ? noi hoang d&atilde; quanh su?n n&uacute;i d?c, v&aacute;ch d&atilde; n&ecirc;n ch&uacute;ng c&oacute; b? r? tuong d?i kh?e, th&iacute;ch nghi v?i noi nhi?u &aacute;nh s&aacute;ng m?t tr?i, ch?u h?n tuong d?i t?t. Ngu?i ta thu?ng tr?ng&nbsp;<strong>c&acirc;y tr?c b&aacute;ch di?p&nbsp;</strong>b?ng h?t.</p>

<p><img alt="cây tr?c bách di?p2" src="https://cayvahoa.net/wp-content/uploads/2016/07/trac-bach-diep.jpg" style="height:417px; width:500px" /></p>

<p>T?i shop&nbsp;<strong>c&acirc;y v&agrave; hoa</strong>&nbsp;c&oacute; b&aacute;n tr?c b&aacute;ch di?p. Gi&aacute; c&acirc;y tr?c b&aacute;ch di?p t&ugrave;y thu?c v&agrave;o k&iacute;ch thu?c v&agrave; h&igrave;nh d?ng kh&oacute;m c&acirc;y. Ð? bi?t th&ecirc;m chi ti?t b?n c&oacute; th? li&ecirc;n h? : 0988580657</p>

<p><img alt="cây tr?c bách di?p3" src="https://cayvahoa.net/wp-content/uploads/2016/07/CIMG2052.jpg" style="height:527px; width:400px" /></p>

<p><strong>Trong d&ocirc;ng y t&aacute;c d?ng c?a tr?c b&aacute;ch di?p l&agrave; g&igrave;?</strong>&nbsp;&nbsp;</p>

<p>Tr?c b&aacute;ch di?p c&oacute; t&iacute;nh m&aacute;t, v? d?ng, c&oacute; t&aacute;c d?ng c?m m&aacute;u, ki?t l? ra m&aacute;u, th? huy?t, t&aacute;o b&oacute;n, c&aacute;c b?nh v? du?ng h&ocirc; h?p nhu: ho, s?t, ra nhi?u m? h&ocirc;i&hellip; Tr?ng m?t c&acirc;y tr?c b&aacute;ch di?p trong nh&agrave; r?t ti?n l?i ph?i kh&ocirc;ng c&aacute;c b?n?</p>

<p>Xem th&ecirc;m :&nbsp;<strong>C&acirc;y thu?c nam</strong></p>

<p><strong>C&aacute;ch cham s&oacute;c c&acirc;y tr?c b&aacute;ch di?p</strong></p>

<p>L&agrave; lo?i c&acirc;y th&iacute;ch h?p v?i d?t th?t, tuong d?i d? s?ng v&agrave; cham s&oacute;c. Ð? c&acirc;y ph&aacute;t tri?n t?t b?n c?n b&oacute;n l&oacute;t tru?c khi dem c&acirc;y tr?ng. Khi mua v? c?n gi? b?u d?t d? kh&ocirc;ng l&agrave;m d?t g&atilde;y r? b?n nh&eacute;. Vun g?c v&agrave; tu?i d?m nu?c b?n nh&eacute;.</p>

<p>Khi tr?ng c?n ch&uacute; &yacute; d?n d?c di?m c?a c&acirc;y, l&agrave; lo?i c&acirc;y ua s&aacute;ng b?n c?n d?t c&acirc;y ? v? tr&iacute; c&oacute; d?y d? &aacute;nh s&aacute;ng d? c&acirc;y quang h?p t?t, t?o m&agrave;u xanh ng?c b&iacute;ch b?t m?t. C&acirc;y ch?u h?n t?t n&ecirc;n c?n tr&aacute;nh d? c&acirc;y ng?p &uacute;ng g&acirc;y hi?n tu?ng th?i r? d?n d?n v&agrave;ng l&aacute;.</p>

<p>Ch&uacute;c c&aacute;c b?n th&agrave;nh c&ocirc;ng!</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (27, 3, N'Cây giữ tiền', N'cay-giu-tien-2-600x600.jpg', 199000, 0, N'Cây giữ tiền là gì . Bạn là người yêu thích cây cảnh và muốn trang trí cho không gian của mình trở nên đẹp hơn.', N'<p>C&acirc;y gi? ti?n l&agrave; g&igrave; . B?n l&agrave; ngu?i y&ecirc;u th&iacute;ch c&acirc;y c?nh v&agrave; mu?n trang tr&iacute; cho kh&ocirc;ng gian c?a m&igrave;nh tr? n&ecirc;n&nbsp;d?p hon.&nbsp;Ð?c bi?t, c&acirc;y c?nh n?i th?t phong th?y mang&nbsp;d?n nhi?u&nbsp;&yacute; nghia ph&aacute;t t&agrave;i, ph&aacute;t l?c. Trong gi?i c&acirc;y c?nh n?i th?t phong th?y c&oacute;&nbsp;da d?ng ch?ng lo?i c&acirc;y c?nh, trong&nbsp;d&oacute;&nbsp;<a href="https://cayvahoa.net/cay-giu-tien/">c&acirc;y gi? ti?n</a>&nbsp;l&agrave; m?t lo?i c&acirc;y kh&aacute; m?i m? tr&ecirc;n th? tru?ng ch?c h?n kh&ocirc;ng ph?i ai cung bi?t. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hi?u v? lo?i c&acirc;y n&agrave;y v?i nh?ng&nbsp;uu&nbsp;di?m, c&ocirc;ng d?ng&nbsp;d? gi&uacute;p b?n t&ocirc;&nbsp;di?m kh&ocirc;ng gian th&ecirc;m ph?n sinh&nbsp;d?ng hon.</p>

<p>Ð?c bi?t, c&aacute;c c&ocirc;ng ty, van ph&ograve;ng, kh&aacute;ch s?n, qu&aacute;n cafe,&hellip;xu hu?ng l?a ch?n c&acirc;y gi? ti?n nhi?u&nbsp;d? gi&uacute;p kh&ocirc;ng gian xanh m&aacute;t, sinh&nbsp;d?ng hon m&agrave;u xanh t? nhi&ecirc;n, tuoi t?n c?a nh?ng chi?c l&aacute; m&agrave;u xanh b&oacute;ng mu?t k?t h?p v?i kh? nang thanh l?c kh&ocirc;ng kh&iacute; gi&uacute;p cho con ngu?i c&oacute; m&ocirc;i tru?ng s?ng trong s?ch, an to&agrave;n&nbsp;d?m b?o cho s?c kh?e. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hi?u chi ti?t v? nh?ng t&iacute;nh nang n?i b?t c?a c&acirc;y n&agrave;y nhu sau:</p>

<p><strong>Uu di?m c?a c&acirc;y gi? ti?n&nbsp;</strong></p>

<ul>
	<li>C&oacute; kh? nang sinh s?ng t?t trong m&ocirc;i tru?ng m&aacute;y l?nh</li>
	<li>D? tr?ng v&agrave; d? cham s&oacute;c</li>
	<li>Th&acirc;n c&acirc;y c&oacute; m&agrave; tr?ng thanh t&uacute;, c&aacute;c t&aacute;n l&aacute; m&agrave;u xanh l?a t?o cho ngu?i xem c?m gi&aacute;c r?t m&aacute;t m? v&agrave; d? ch?u.</li>
	<li>Khi tr?ng c&acirc;y gi? ti?n&nbsp;? trong nh&agrave; c&oacute; kh? nang gi?m b?c x? t? c&aacute;c thi?t b?&nbsp;di?n t?,&nbsp;di?n tho?i, m&aacute;y t&iacute;nh,&hellip;.</li>
	<li>Thanh l?c kh&ocirc;ng kh&iacute; gi&uacute;p b?n s?ng m&ocirc;i tru?ng s?ch.</li>
</ul>

<p>Ch?c h?n trong ch&uacute;ng ta khi nghe&nbsp;d?n c&acirc;y gi? ti?n ai cung t&ograve; m&ograve; mu?n&nbsp;du?c nh&igrave;n th?y xem n&oacute; c&oacute; h&igrave;nh d&aacute;ng nhu th? n&agrave;o? Th? gi?i c&acirc;y v&agrave; hoa l&agrave; noi cung c?p c&acirc;y gi? ti?n&nbsp;d?p, ch&uacute;ng c&ograve;n c&oacute; kh? nang thanh l?c kh&ocirc;ng kh&iacute; mang&nbsp;d?n cho kh&ocirc;ng gian ph&ograve;ng tr? n&ecirc;n trong s?ch, lo?i b?&nbsp;du?c c&aacute;c ch?t b?i b?n t? trong kh&ocirc;ng kh&iacute;.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-giu-tien-771x1024.jpg" style="height:1024px; width:771px" /></p>

<p>C&acirc;y gi? ti?n c&oacute; b? l&aacute; xanh mu?t r?t&nbsp;d?p, ki?u d&aacute;ng th&acirc;n h&igrave;nh thanh tao, nh?ng chi?c l&aacute; d&agrave;i m?c th?ng l&ecirc;n nh&igrave;n r?t&nbsp;d?p. Nhi?u ngu?i&nbsp;dang b? thu h&uacute;t b?i nh?ng chi?c l&aacute; xanh khi&nbsp;du?c tr?ng trong nh?ng chi?c ch?u composite m&agrave;u tr?ng t?o n&ecirc;n v?&nbsp;d?p lung linh, d? nh?n d?ng&nbsp;du?c khi&nbsp;d?t ngay ph&ograve;ng kh&aacute;ch, b&agrave;n l&agrave;m vi?c, thu vi?n, h&agrave;nh lang, qu?y l? t&acirc;n,&hellip;</p>

<p><strong>&Yacute; nghia c?a c&acirc;y gi? ti?n</strong></p>

<p>Tru?c&nbsp;d&acirc;y&nbsp;&ocirc;ng b&agrave; ch&uacute;ng ta v?n thu?ng hay c&oacute; c&acirc;u n&oacute;i kh?i nghi?p kh&oacute;, gi? nghi?p c&agrave;ng kh&oacute;. C&acirc;y gi? ti?n l&agrave; m?t lo?i c&acirc;y phong th?y mang h&agrave;m&nbsp;&yacute; trong phong th?y nhu t&ecirc;n g?i gi&uacute;p gia tang t&agrave;i l?c, gi? g&igrave;n c?a c?i cho gia ch?.</p>

<p>Ch&uacute;ng ta c&oacute; th? tr?ng c&acirc;y gi? ti?n&nbsp;? trong ph&ograve;ng l&agrave;m vi?c, ph&ograve;ng kh&aacute;ch hay qu?y ti?p t&acirc;n,&hellip;.d? l&agrave;m gia tang v?&nbsp;d?p th?m m? cho kh&ocirc;ng gian nh?m thu h&uacute;t t&agrave;i l?c cho c&aacute;c gia ch?. V?i&nbsp;&yacute; nghia s&acirc;u s?c trong phong th?y l&agrave;m tang t&agrave;i l?c, gi? g&igrave;n c?a c?i cho c&aacute;c gia ch? k?t h?p t&iacute;nh nang thanh l?c kh&ocirc;ng kh&iacute;, lo?i b?&nbsp;du?c c&aacute;c ch?t b?i b?n trong kh&ocirc;ng kh&iacute; mang&nbsp;d?n cho con ngu?i s? thu gi&atilde;n, tho?i m&aacute;i lu&ocirc;n t?o c?m gi&aacute;c an to&agrave;n, thu th&aacute;i cho con ngu?i. Cung ch&iacute;nh v&igrave; v?y, nhi?u ngu?i l?a ch?n tr?ng c&acirc;y gi? ti?n&nbsp;d? tang v?n cho m&igrave;nh t?i ph&ograve;ng l&agrave;m vi?c, ph&ograve;ng kh&aacute;ch,&hellip;</p>

<p><strong>C&ocirc;ng d?ng c?a c&acirc;y gi? ti?n</strong></p>

<p>V?n di c&acirc;y gi? ti?n l&agrave; lo?i c&acirc;y b?i c&oacute; l&aacute; xanh mu?t c&oacute; th? ph&aacute;t tri?n t?t&nbsp;? trong m&ocirc;i tru?ng c&oacute;&nbsp;&aacute;nh s&aacute;ng th?p, nh?ng noi r&acirc;m m&aacute;t v&agrave; ch&uacute;ng kh&ocirc;ng c?n tu?i nu?c thu?ng xuy&ecirc;n.&nbsp;Ð?c bi?t kh? nang thanh l?c kh&ocirc;ng kh&iacute;, lo?i b? kh&oacute;i b?i, kh&iacute;&nbsp;d?c n&ecirc;n c&acirc;y gi? ti?n&nbsp;du?c&nbsp;ua chu?ng tr?ng trong nh&agrave;, van ph&ograve;ng, b&agrave;n l&agrave;m vi?c, kh&aacute;ch s?n, nh&agrave; h&agrave;ng, qu&aacute;n cafe,&hellip;.d? gi&uacute;p kh&ocirc;ng gian tr? n&ecirc;n xinh&nbsp;d?p, tho&aacute;ng&nbsp;d&atilde;ng thu h&uacute;t&nbsp;du?c t?m m?t c?a nhi?u ngu?i.</p>

<p>C&acirc;y c?a ch&uacute;ng thu?ng m?c th&agrave;nh b?i, kh? nang s?ng trong m&ocirc;i tru?ng t? nhi&ecirc;n chi?u cao c&oacute; th?&nbsp;d?t t?i 30cm -100cm, h&igrave;nh d&aacute;ng t?o th&agrave;nh t?p h?p c&aacute;c nh&aacute;nh l&aacute;, c&aacute;c l&aacute; n&agrave;y c&oacute; m&agrave;u xanh v?i nh?ng&nbsp;d?m hoi t?i m&agrave;u hon, m?ng nu?c, m?p m?p v?i h&igrave;nh tr? d&agrave;y&nbsp;? ph?n g?n r?, thon nh? khi&nbsp;d?n ng?n. Z.zamiifolia ch?a lu?ng nu?c cao b?t thu?ng 91%&nbsp;? l&aacute; v&agrave; 9% t?i cu?ng n&ecirc;n ch&uacute;ng c&oacute; th? s?ng ho&agrave;n to&agrave;n th?nh thoi 4 th&aacute;ng m&agrave; kh&ocirc;ng c?n tu?i nu?c. V&agrave; cung ch&iacute;nh ch?t Z.zamiifolia n&agrave;y c&oacute; kh? nang thanh l?c kh&ocirc;ng kh&iacute; gi&uacute;p m&ocirc;i tru?ng trong s?ch hon.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-giu-tien-1.jpg" style="height:960px; width:720px" /></p>

<p><strong>K? thu?t tr?ng v&agrave; cham s&oacute;c c&acirc;y gi? ti?n</strong></p>

<p>L&agrave; m?t lo?i c&acirc;y d? s?ng kh&ocirc;ng c?n&nbsp;d&ograve;i h?i ph?i cham s&oacute;c qu&aacute; k? c&agrave;ng. Ch&uacute;ng&nbsp;&iacute;t g?p ph?i s&acirc;u b?nh v&agrave; kh? nang sinh tru?ng cung ph&aacute;t tri?n r?t m?nh m? khi&nbsp;d&aacute;p&nbsp;?ng c&aacute;c y&ecirc;u c?u sau:</p>

<p><strong>+&nbsp;&Aacute;nh s&aacute;ng:</strong>&nbsp;C&acirc;y d? d&agrave;ng th&iacute;ch nghi&nbsp;du?c&nbsp;&aacute;nh s&aacute;ng t?t, tr&aacute;nh&nbsp;du?c&nbsp;&aacute;nh s&aacute;ng tr?c ti?p t? m?t tr?i v&agrave; ch&uacute;ng c&oacute; th? ph&aacute;t tri?n b&igrave;nh thu?ng trong&nbsp;di?u ki?n b&oacute;ng r&acirc;m. Ch&iacute;nh v&igrave; v?y, khi tr?ng th&igrave; b?n kh&ocirc;ng n&ecirc;n&nbsp;d?t c&acirc;y du?i&nbsp;&aacute;nh n?ng tr?c ti?p ho?c ph?i c&oacute; lu?i che&nbsp;d? tr&aacute;nh b? nu?c mua v&agrave;o s? g&acirc;y th?i, v&agrave;ng l&aacute; c&oacute; th? b? ch?t.</p>

<p>+&nbsp;<strong>Nhi?t&nbsp;d?,&nbsp;d?&nbsp;?m:</strong>&nbsp;C&oacute; kh? nang ch?&nbsp;du?c nhi?t tuong&nbsp;d?i cao, th&ocirc;ng thu?ng m?c nhi?t th&iacute;ch h?p l&agrave; 25 -27&deg;C. Khi nhi?t&nbsp;d? du?i 18&deg;C c&acirc;y s? c&oacute; hi?n tu?ng r?ng l&aacute; roi v&agrave;o t&igrave;nh tr?ng ng?&nbsp;d&ocirc;ng, c&ograve;n n?u tru?ng h?p du?i 5&deg;C th&igrave; c&acirc;y s? ch?t. Ch&uacute;ng c&oacute; th? ph&aacute;t tri?n&nbsp;? m&ocirc;i truong 2&nbsp;d?&nbsp;?m th?p l?n&nbsp;d?&nbsp;?m cao.</p>

<p><strong>+&nbsp;Ð?t tr?ng:</strong>&nbsp;Th&iacute;ch h?p cho nhi?u lo?i&nbsp;d?t. Tuy nhi&ecirc;n, th&igrave; ch&uacute;ng ta n&ecirc;n l?a ch?n lo?i&nbsp;d?t m&agrave;u m?, nhi?u m&ugrave;n c&oacute; kh? nang tho&aacute;t nu?c nhanh.&nbsp; V&igrave; v?y, khi pha h?n h?p&nbsp;d?t ph&ugrave; sa v?i 1/3 lu?ng tr?u tr?n th&ecirc;m x? than&nbsp;d? c&acirc;y c&oacute; kh? nang tho&aacute;t nu?c t?t hon. Ngo&agrave;i ra c&oacute; th? tr?ng th&ecirc;m&nbsp;&iacute;t l&acirc;n&nbsp;d? k&iacute;ch th&iacute;ch s? ra r?. M?t th?i gian khi&nbsp;d&atilde; ra r? th&igrave; n&ecirc;n thu?ng xuy&ecirc;n b&oacute;n th&ecirc;m ph&acirc;n&nbsp;d?nh k? 4 tu?n/ 1 l?n. Ngo&agrave;i ra t? th&aacute;ng 4- 5 th&aacute;ng th&igrave; n&ecirc;n thay&nbsp;d?t&nbsp;d? gi&uacute;p c&acirc;y c&oacute; kh? nang ph&aacute;t tri?n tuoi t?t hon.</p>

<p><strong>+</strong>&nbsp;<strong>Nhu c?u nu?c:&nbsp;</strong>&nbsp;C&acirc;y gi? ti?n thu?c c&acirc;y c&oacute; kh? nang ch?u h?n k&eacute;m, y&ecirc;u c?u lu?ng nu?c tu?i ph?i v?a&nbsp;d? kh&ocirc;ng tu?i qu&aacute; nhi?u l?n. Khi&nbsp;d?t c&acirc;y&nbsp;? trong nh&agrave;, trong van ph&ograve;ng th&igrave; 1 tu?n ch? n&ecirc;n tu?i 1 l?n. Tr&aacute;nh tu?i qu&aacute; nhi?u nu?c s? g&acirc;y ra hi?n tuong&nbsp;&uacute;ng r?, th?i, m?c n&aacute;t th&acirc;n c&acirc;y s? g&acirc;y ch?t. V&igrave; th?, ch&uacute;ng ta n&ecirc;n s? d?ng b&igrave;nh x?t l&ecirc;n l&aacute;, th&acirc;n&nbsp;d? c&acirc;y lu&ocirc;n tu?i m&aacute;t,&nbsp;?m.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (28, 3, N'Cây phỉ thúy', N'cay-phi-thuy-dep-2.jpg', 199000, 0, N'Cây phỉ thúy còn có tên gọi khác là cây ngọc bích chúng thuộc họ nhà lá bỏng với những hoa nhỏ màu trắng hay hồng, thân cây luôn xanh mướt mang lại một vẻ đẹp tự nhiên.', N'<p>C&acirc;y ph? th&uacute;y c&ograve;n c&oacute; t&ecirc;n g?i kh&aacute;c l&agrave; c&acirc;y ng?c b&iacute;ch ch&uacute;ng thu?c h? nh&agrave; l&aacute; b?ng v?i nh?ng hoa nh? m&agrave;u tr?ng hay h?ng, th&acirc;n c&acirc;y lu&ocirc;n xanh mu?t mang l?i m?t v? d?p t? nhi&ecirc;n. Lo?i c&acirc;y n&agrave;y du?ng nhu dang r?t du?c ua chu?ng nhi?u b?i l? ch&iacute;nh nh? v&agrave;o d?c t&iacute;nh, d?c di?m cung nhu &yacute; nghia c?a c&acirc;y dem d?n cho con ngu?i. V?i m?t ch?u ph? th&uacute;y trong nh&agrave; don gi?n ch&uacute;ng s? mang d?n cho gia ch? t&agrave;i l?c v&agrave; s? gi&agrave;u sang ph&uacute; qu&yacute;.</p>

<p><img alt="Cây ph? thúy mang d?n s? giàu sang phú quý" src="https://cayvahoa.net/wp-content/uploads/2016/11/cay-phi-thuy-dep-1.jpg" style="width:500px" /></p>

<p>Lo?i c&acirc;y ph? th&uacute;y c&oacute; d?c di?m l&aacute; c?a c&acirc;y kh&aacute; d&agrave;y, m?n, b&oacute;ng v&agrave; c&acirc;y s?ng kh&aacute; l&acirc;u n&ecirc;n th&iacute;ch h?p cho vi?c tr?ng trong nh&agrave; l&agrave;m c&acirc;y n?i th?t d?p. L&aacute; c?a c&acirc;y c&oacute; m&agrave;u xanh nhu m&agrave;u xanh c?a d&aacute; ng?c b&iacute;ch n&ecirc;n ch&uacute;ng c&oacute; th&ecirc;m t&ecirc;n g?i kh&aacute;c l&agrave; c&acirc;y ng?c b&iacute;ch, nhung c&oacute; ngu?i l?i g?i n&oacute; l&agrave; c&acirc;y t&igrave;nh b?n, c&acirc;y may m?n. Ch&uacute;ng l&agrave; m?t lo?i c&acirc;y c&oacute; ngh? l?c cao b?i c&oacute; kh? nang ch?u kh&ocirc; h?n l&acirc;u d&agrave;i, v?n c&oacute; th? s?ng s&oacute;t khi kh&ocirc;ng du?c tu?i nu?c thu?ng xuy&ecirc;n. N?u g?p di?u ki?n &aacute;nh s&aacute;ng t? nhi&ecirc;n thu?n l?i ch&uacute;ng ph&aacute;t tri?n r?t nhanh. N&ecirc;n ngu?i tr?ng c&acirc;y kh&ocirc;ng c?n ph?i tu?i nu?c thu?ng xuy&ecirc;n cho c&acirc;y. Ð?c bi?t lo?i c&acirc;y n&agrave;y cho hoa m&agrave;u tr?ng hay h?ng, c&oacute; k&iacute;ch thu?c nh? v&agrave; b?n c&oacute; th? tr?ng m?t c&acirc;y m?i ch? nh? v&agrave;o 1 chi?c l&aacute; r?ng xu?ng d?t. Ch&iacute;nh nh? h&igrave;nh ?nh n&agrave;y n&ecirc;n c&acirc;y c&ograve;n bi?u tu?ng cho tu?i tr? vuon cao trong cu?c s?ng.</p>

<p><img alt="Cây ph? thúy mang d?n s? giàu sang phú quý" src="https://cayvahoa.net/wp-content/uploads/2016/11/cay-phi-thuy-dep-2.jpg" style="width:500px" /></p>

<p>Nhi?u ngu?i cho r?ng khi d?t c&acirc;y ph? th&uacute;y ? ph&iacute;a l?i v&agrave;o ngay ph&iacute;a b&ecirc;n ph?i th&igrave; s? gi&uacute;p ch&uacute;ng t&iacute;ch t? du?c nhi?u tinh d?u hon trong c&acirc;y v&agrave; nh? tinh d?u n&agrave;y s? gi&uacute;p tinh th?n con ngu?i du?c thu gi&atilde;n hon. Nh? v&agrave;o nang lu?ng c?a c&acirc;y tr?ng n&agrave;y khi?n cho tinh th?n du?c tang cu?ng v&agrave; th? ch?t con ngu?i t?t hon. B?i l? ch&uacute;ng du?c g?i l&agrave; c&acirc;y thu h&uacute;t th?n t&agrave;i v&agrave; ph&uacute; qu&yacute; cho gia ch? v&igrave; theo phong th?y c&acirc;y ti?p nh?n ngu?n nang lu?ng tuoi m?i nh? v&agrave;o ngu?n nang lu?ng du?c cung c?p n&agrave;y khi?n cho t&agrave;i v?n c?a ngu?i s? h?u ng&agrave;y c&agrave;ng di l&ecirc;n, l&agrave;m an ph&aacute;t d?t v&agrave; lu&ocirc;n th&agrave;nh c&ocirc;ng trong c&ocirc;ng vi?c. N&ecirc;n nhi?u ngu?i l&agrave;m kinh doanh c&aacute;c thuong gia thu?ng tr?ng c&acirc;y ph? th&uacute;y ngay tr&ecirc;n b&agrave;n l&agrave;m vi?c ho?c ? qu?y thu ng&acirc;n s? gi&uacute;p chi&ecirc;u m? t&agrave;i l?c v? nh&agrave;.</p>

<p><img alt="Cây ph? thúy mang d?n s? giàu sang phú quý" src="https://cayvahoa.net/wp-content/uploads/2016/11/cay-phi-thuy-dep-3.jpg" style="width:500px" /></p>

<p>V?i d?c di?m khi v&agrave;o m&ugrave;a xu&acirc;n c&acirc;y cho hoa m&agrave;u tr?ng ho?c h?ng, c&aacute;nh c?a ch&uacute;ng nhu nh?ng ng&ocirc;i sao m&agrave;u t?a s&aacute;ng v&agrave; &yacute; nghia n&agrave;y n&oacute;i l&ecirc;n vi?c ti?n t&agrave;i, t&agrave;i s?n trong nh&agrave; lu&ocirc;n d?y ?p c&ugrave;ng s? gi&agrave;u sang no d? d?n v?i gia d&igrave;nh. Kh&ocirc;ng ch? ri&ecirc;ng v? &yacute; nghia phong th?y t?t m&agrave; lo?i c&acirc;y n&agrave;y c&ograve;n r?t c&oacute; l?i d?i v?i s?c kh?e c?a con ngu?i, n?u b?n d?t m?t ch?u c&acirc;y ph? th&uacute;y ngay c?a s? ng&ocirc;i nh&agrave; khi?n cho b?n s?c kh?e th&ecirc;m d?i d&agrave;o hon, tinh th&acirc;n lu&ocirc;n ph?n ch?n gi&uacute;p l&agrave;m vi?c du?c t?nh t&aacute;o hon.</p>

<p><img alt="Cây ph? thúy mang d?n s? giàu sang phú quý" src="https://cayvahoa.net/wp-content/uploads/2016/11/cay-phi-thuy-dep-4.jpg" style="width:500px" /></p>

<p>M?t m?o nh? trong phong th?y d?i v?i lo?i c&acirc;y h&uacute;t ti?n t&agrave;i n&agrave;y ch&iacute;nh l&agrave; theo nhu ngu?i phuong t&acirc;y quan ni?m n?u b?n d?t th&ecirc;m v&agrave;o ch?u c&acirc;y ph? th&uacute;y n&agrave;y m?t d?ng xu s? k&iacute;ch th&iacute;ch ngu?n nang lu?ng t?t hon b&igrave;nh thu?ng. V?y n&ecirc;n b?n c&oacute; th? &aacute;p d?ng m?o n&agrave;y d?i v?i c&acirc;y tr?ng c?a m&igrave;nh d? xem k?t qu? d?c bi?t hon m&agrave; ch&uacute;ng mang l?i nh&eacute; c&aacute;c b?n!</p>

<p><img alt="Cây ph? thúy mang d?n s? giàu sang phú quý" src="https://cayvahoa.net/wp-content/uploads/2016/11/cay-phi-thuy-dep-5.jpg" style="width:500px" /></p>

<p>C&acirc;y ph&iacute; th?y hay ng?c b&iacute;ch, ch&uacute;ng l&agrave; lo?i c&acirc;y c?nh mang nhi?u &yacute; nghia t?t d&uacute;ng kh&ocirc;ng c&aacute;c b?n. H&atilde;y s? h?u cho m&igrave;nh m?t c&acirc;y c?nh d?p n&agrave;y nh&eacute;. Ð? c&oacute; du?c ch?u c&acirc;y d?p b?n h&atilde;y gh&eacute; d?n c?a h&agrave;ng th? gi?i c&acirc;y v&agrave; hoa, ? d&acirc;y ch&uacute;ng t&ocirc;i c&oacute; nhi?u ch?u c&acirc;y c?nh kh&aacute;c nhau v?i t?ng k&iacute;ch c? s? c&oacute; gi&aacute; ti?n tuong ?ng. H&atilde;y tr?ng m?t ch?u c&acirc;y h&uacute;t ti?n t&agrave;i trong nh&agrave; b?n d? lu&ocirc;n th?y may m?n xung quanh m&igrave;nh nh&eacute;!</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (29, 3, N'Cây cẩm thạch', N'cay-cam-thach.jpg', 220000, 0, N'Bởi ý nghĩa của cây nên người ta còn gọi là cây cẩm thạch phát tài, được trang trí trong nhà với hàm ý mang lại nhiều điều may mắn cho người sở hữu.', N'<p><a href="https://cayvahoa.net/cay-cam-thach-bieu-trung-cho-tien-bac-va-tai-loc/">C&acirc;y c?m th?ch</a>&nbsp;_ N&oacute;i d?n nh?ng lo?i c&acirc;y c&oacute; th? thu h&uacute;t ti?n b?c v&agrave; t&agrave;i l?c v? cho gia ch? th&igrave; kh&ocirc;ng th? thi?u&nbsp;<strong>c&acirc;y c?m th?ch</strong>&nbsp;du?c. Ch&uacute;ng du?c tr?ng r?ng r&atilde;i nhi?u noi v&agrave; d?c bi?t thu?ng d? trang tr&iacute; tru?c c?a nh&agrave;, kh&aacute;ch s?n, nh&agrave; h&agrave;ng&hellip; nh?m thu t&agrave;i h&uacute;t l?c, dua d?n nhi?u may m?n hon d?n cho ngu?i s? h?u. C&oacute; nhi?u ngu?i cho r?ng m&agrave;u l&aacute; c?a c&acirc;y gi?ng m&agrave;u c?a vi&ecirc;n d&aacute; qu&yacute; cung c&oacute; t&ecirc;n l&agrave; c?m th?ch, tu?ng trung cho ng?c u?c n&ecirc;n ch&uacute;ng du?c d&aacute;nh gi&aacute; cao trong vi?c trang tr&iacute;.</p>

<p>***&nbsp;https://cayvahoa.net/cay-canh/cay-phong-thuy/<strong>&nbsp;</strong>(C&aacute;c lo?i c&acirc;y phong th?y)</p>

<p><img alt="Cây c?m th?ch bi?u trung cho ti?n b?c và tài l?c" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-cam-thach-1.jpg" style="width:500px" /></p>

<p><strong>C&acirc;y c?m th?ch</strong>&nbsp;c&oacute; l&aacute; d?p, ch&uacute;ng m?c th?p xu?ng d?t, c&aacute;ch cham s&oacute;c ch&uacute;ng r?t d? n&ecirc;n r?t du?c ua chu?ng l&agrave;m c&acirc;y c?nh trang tr&iacute; ? c&ocirc;ng vi&ecirc;n, d&ocirc; th?, tru?ng h?c, du?ng ph?&hellip;. N?u d?t ch&uacute;ng trong nh&agrave; thu?ng du?c tr?ng trong ch?u ho?c c&aacute;c gi? treo. B?i l&aacute; c?a c&acirc;y c&oacute; m&agrave;u xanh tr?ng d?c d&aacute;o, mang d?n m?t c?m gi&aacute;c thu h&uacute;t l? thu?ng, t?o n&ecirc;n s? b&igrave;nh y&ecirc;n gi?n d? cho kh&ocirc;ng gian s?ng d?ng hon.</p>

<p><img alt="cay-hoa-cam-thach" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-hoa-cam-thach.jpg" style="height:303px; width:498px" /></p>

<p>Khi tr?ng c&acirc;y n?u du?c k?t h?p v?i m?t s? lo?i c&acirc;y c?nh, c&acirc;y hoa kh&aacute;c th&igrave; s? khi?n ch&uacute;ng tr? n&ecirc;n c&agrave;ng l&ocirc;i cu?n hon nhi?u. Ð?c bi?t ch&uacute;ng c&oacute; th? ch?u du?c b&oacute;ng r&acirc;m n&ecirc;n c&oacute; th? l&agrave;m c&acirc;y n?i th?t d? trang tr&iacute; trong van ph&ograve;ng, ph&ograve;ng kh&aacute;ch, ph&ograve;ng l&agrave;m vi?c, c?a s?&hellip;.</p>

<p><img alt="cam-thach" src="https://cayvahoa.net/wp-content/uploads/2016/08/cam-thach.jpg" style="height:504px; width:420px" /></p>

<p>L&aacute; c?a c&acirc;y kh&ocirc;ng nh?ng d?p m&agrave; c&ograve;n r?t b?t m?t ch&uacute;ng du?c tr?ng th&agrave;nh nh?ng b?i c&acirc;y nh? trong nh?ng ch?u hoa d?p, v?y c&acirc;y c?m th?ch n&agrave;y c&oacute; hoa kh&ocirc;ng? Hoa c?a ch&uacute;ng nhu th? n&agrave;o? C&acirc;u tr? l?i l&agrave; lo?i c&acirc;y n&agrave;y c&oacute; hoa v&agrave; hoa r?t d?p.&nbsp;<strong>Hoa c&acirc;y c?m th?ch</strong>&nbsp;c&oacute; m&agrave;u h?ng ho?c t&iacute;m nh?t v?i h&igrave;nh chu&ocirc;ng, c&aacute;nh hoa m?ng manh. Hoa thu?ng n? t? th&aacute;ng 10 d?n th&aacute;ng 4 c?a nam k?, sau khi hoa t&agrave;n th&igrave; cho ra tr&aacute;i.</p>

<p>***&nbsp;C&acirc;y c?m nhung</p>

<p>Ð? tr?ng du?c c&acirc;y c?m th?ch n&agrave;y b?n c&oacute; th? ti?n h&agrave;nh gi&acirc;m c&agrave;nh ho?c t&aacute;ch b?i hay gieo h?t t&ugrave;y v&agrave;o di?u ki?n. Nhung trong d&oacute; c&aacute;ch nh&acirc;n gi?ng b?ng c&aacute;ch gi&acirc;m c&agrave;nh v&agrave; t&aacute;ch b?i lu&ocirc;n du?c s? d?ng nhi?u nh?t d? c&oacute; th? nh&acirc;n gi?ng r?ng r&atilde;i cung nhu gi&uacute;p c&acirc;y nhanh ph&aacute;t tri?n hon.</p>

<p><img alt="cay-cam-thach" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-cam-thach.jpg" style="height:492px; width:428px" /></p>

<p>N?u b?n s? h?u cho m&igrave;nh m?t ch?u c&acirc;y c?m th?ch th&igrave; c?n ph?i cham s&oacute;c ch&uacute;ng nhu th? n&agrave;o? Do d?c di?m lo?i c&acirc;y n&agrave;y r?t kh?e m?nh, ch&uacute;ng ph&aacute;t tri?n nhanh v&agrave; r?t &iacute;t b? s&acirc;u b?nh, b&ecirc;n c?nh d&oacute; c&acirc;y c&ograve;n c&oacute; th? ch?u du?c nh?ng di?u ki?n s?ng kh?c nghi?t n&ecirc;n vi?c cham s&oacute;c ch&uacute;ng kh&ocirc;ng h? kh&oacute; khan l?m. Ch? c?n b?n ch&uacute; &yacute; d?n m?t s? d?c di?m nhu d?t tr?ng, &aacute;nh s&aacute;ng, nu?c, nhi?t d?&hellip;.</p>

<p><img alt="Cây c?m th?ch bi?u trung cho ti?n b?c và tài l?c" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-cam-thach-4.jpg" style="width:500px" /></p>

<p>C?n ch?n d?t tr?ng ph&ugrave; h?p v?i c&acirc;y, n&ecirc;n ch?n d?t gi&agrave;u dinh du?ng, c&oacute; t? l? tho&aacute;t nu?c t?t. V?i m&ocirc;i tru?ng d?t nhu v?y th&igrave; c&acirc;y s? ph&aacute;t tri?n r?t m?nh m?, tuy nhi&ecirc;n n?u lo?i d?t kh&aacute;c th&igrave; c&acirc;y v?n c&oacute; th? s?ng v&agrave; ph&aacute;t tri?n du?c. C?n ch&uacute; &yacute; d?n giai do?n c&acirc;y s?p n? hoa d? c&oacute; th? b&oacute;n ph&acirc;n cho ch&uacute;ng d? c&acirc;y c&oacute; dinh du?ng nu&ocirc;i hoa nhi?u hon. V&agrave;o nh?ng ng&agrave;y kh&ocirc; h?n th&igrave; c?n cung c?p nu?c nu?c d? c&oacute; d? nu?c cho c&acirc;y sinh tru?ng. Cho d&ugrave; th?i ti?t nhu th? n&agrave;o, kh&ocirc; h?n, n?ng mua hay l?nh gi&aacute; th&igrave; ch&uacute;ng v?n ch?u du?c v&agrave; vuon l&ecirc;n m?t c&aacute;ch d?y ngh? l?c nh?t.</p>

<p><img alt="Cây c?m th?ch bi?u trung cho ti?n b?c và tài l?c" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-cam-thach-5.jpg" style="width:500px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (30, 3, N'Cây phát tài may mắn', N'13223409_709250152548474_753534938_o-600x600.jpg', 250000, 0, N'Cây phát tài với cái tên khoa học là Lucky Bamboo là cây mang đến sự may mắn, shop cây và hoa trân trọng gửi đến khách hàng nhiều mẫu cây phát tài đẹp nhất', N'<p><strong>C&acirc;y ph&aacute;t t&agrave;i</strong>&nbsp;phong th?y v?i c&aacute;i t&ecirc;n khoa h?c l&agrave; Lucky Bamboo l&agrave; c&acirc;y mang d?n s? may m?n. N&oacute; h?i t? d?y d? c?a 3 y?u t? phong th?y nu?c ,g? v&agrave; d?t. Ð&acirc;y l&agrave; m?t lo?i c&acirc;y d? cham s&oacute;c c&oacute; th? t?n t?i trong b?t k? lo?i &aacute;nh s&aacute;ng n&agrave;o. C&acirc;y thu h&uacute;t t?t c? c&aacute;c nang lu?ng b?i v?y ngu?i ta tin r?ng n&oacute; c&oacute; th? ti?p sinh l?c cho ng&ocirc;i nh&agrave; c?a b?n.</p>

<p><img alt="cây phát tài" src="https://cayvahoa.net/wp-content/uploads/2016/04/cay-phat-tai-1.jpg" style="height:518px; width:400px" /></p>

<p>Ngu?i ta mua ch&uacute;ng v? d?&nbsp;d? b&agrave;n, d?t ? van ph&ograve;ng c&ocirc;ng ty ,trong nh&agrave;. Ch&uacute;ng du?c coi nhu bi?u tu?ng quan tr?ng trong phong th?y. V?i &yacute; nghia mang d?n ti?n t&agrave;i ,s? may m?n, v?n m?nh. Qu&yacute; hon h?t l&agrave; b?n du?c ngu?i kh&aacute;c trao t?ng. Th&acirc;n c&acirc;y m?m d?o, d? s?ng ,c&oacute; th? s?ng du?c c? ch?u trong nu?c v&agrave; trong d?t, th&iacute;ch nghi v?i di?u ki?n &aacute;nh s&aacute;ng da d?ng.</p>

<p><strong>&Yacute; nghia c&acirc;y ph&aacute;t t&agrave;i c?a nh?ng con s? may m?n</strong></p>

<p><img alt="cây phát tài" src="https://cayvahoa.net/wp-content/uploads/2016/04/13223409_709250152548474_753534938_o.jpg" style="height:711px; width:400px" /></p>

<p>c&acirc;y ph&aacute;t t&agrave;i b&aacute;n ? d&acirc;u h&agrave; n?i ?</p>

<p>Ph?n l?n s? may m?n d&oacute; l&agrave; li&ecirc;n k?t v?i c&aacute;c m?t v?i nhau v&agrave; s? lu?ng cu?ng ch?m l?i v?i nhau ho?c dan l?i v?i nhau th&agrave;nh m?t s? s?p x?p. S? lu?ng c&agrave;ng nhi?u c&agrave;ng thu h&uacute;t c&aacute;c lo?i nang lu?ng v&agrave;o nh&agrave; v&agrave; cu?c s?ng c?a b?n.</p>

<p>Ð&acirc;y l&agrave; m?t lo?i c&acirc;y tr&ocirc;ng nhu m?t kh&uacute;c g? kh&ocirc;ng c&oacute; r?. B?n ch? c?n c?m m?t d?u xu?ng nu?c n&oacute; c&oacute; th? ph&aacute;t tri?n l&aacute; v&agrave; li&ecirc;n t?c t?o ra l&aacute; m?i.&nbsp;C&acirc;y l&agrave;&nbsp;bi?u tu?ng c?a m?t cu?c s?ng m?nh m? d&oacute; l&agrave; d?y th?nh vu?ng. Ch&uacute;ng du?c y&ecirc;u th&iacute;ch cho c&aacute;c doanh nghi?p d? l&agrave;m qu&agrave; t?ng, d?c bi?t l&agrave; cho c&aacute;c c&ocirc;ng ty v&igrave; n&oacute; h?a h?n s? gi? cho s? ph&aacute;t tri?n kinh doanh. M?t s? gi?ng s?n xu?t hoa tr?ng thom, th&ecirc;m v&agrave;o nh?ng chi?c l&aacute; m&agrave;u xanh l&aacute; c&acirc;y kh?e m?nh.</p>

<p>C&acirc;y ph&aacute;t t&agrave;i n&oacute; mang d?n cho ba lo?i may m?n cho b?n:</p>

<p>-H?nh ph&uacute;c</p>

<p>-Cu?c s?ng kh&eacute;o d&agrave;i</p>

<p>-S?c kh?e</p>

<p>C&acirc;y ph&aacute;t t&agrave;i d? b&agrave;n du?c nhi?u ngu?i ua chu?ng nh?t hi?n nay, ch&uacute;ng thu?ng du?c trang tr&iacute; tr&ecirc;n b&agrave;n l&agrave;m vi?c, b&agrave;n ph&ograve;ng kh&aacute;ch&hellip; Ch&uacute;ng c&oacute; d?c t&iacute;nh lo?i b? c&aacute;c kh&iacute; d?c, gi&uacute;p thanh l?c kh&ocirc;ng kh&iacute; l&agrave;m cho kh&ocirc;ng gian tho&aacute;ng d&atilde;ng r?t t?t cho s?c kh?e c?a con ngu?i, ngo&agrave;i ra ch&uacute;ng c&ograve;n c&oacute; s?c s?ng m?nh m?, ch?u du?c di?u ki?n m&ocirc;i tru?ng thi?u &aacute;nh s&aacute;ng, s?ng l&acirc;u nam lu&ocirc;n xanh tuoi m&aacute;t, ch&iacute;nh v&igrave; th? n&ecirc;n ch&uacute;ng kh&aacute; du?c nhi?u ngu?i mua l&agrave;m c&acirc;y n?i th?t d?p.</p>

<p><img alt="Cây phát tài d? bàn d?p" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-phat-tai-de-ban-1.jpg" style="width:500px" /></p>

<p>Lo?i c&acirc;y ph&aacute;t t&agrave;i n&agrave;y thu?ng du?c tr?ng b?ng g?c v&agrave; t? g?c m?c l&ecirc;n c&aacute;c c&acirc;y ch?i xanh mu?t. Nh?ng&nbsp;<a href="https://cayvahoa.net/cay-phat-tai-cay-cua-su-may-man/"><strong>c&acirc;y ph&aacute;t t&agrave;i d? b&agrave;n</strong></a>&nbsp;thu?ng du?c thi?t k? nh? g?n, tr?ng trong nh?ng ch?u nh? v?a v?n tr&ocirc;ng th?t d?p m?t. Ch&uacute;ng kh&ocirc;ng ch? s?ng trong m&ocirc;i tru?ng d?t m&agrave; c&oacute; th? s?ng trong m&ocirc;i tru?ng th?y sinh. V?i t?c d? sinh tru?ng m?nh, nh&acirc;n gi?ng b?ng c&aacute;ch gi&acirc;m c&aacute;c g?c g&acirc;y xu?ng d?t, g?p di?u ki?n thu?n l?i s? ph&aacute;t tri?n th&agrave;nh c&acirc;y con. Lo?i c&acirc;y n&agrave;y c&ograve;n du?c coi nhu m?t chi?c m&aacute;y di?u h&ograve;a mini v?i kh? nang thanh l?c kh&iacute; c?c nhanh c?c t?t, dem d?n kh&ocirc;ng gian s?ng th&ecirc;m tuoi m&aacute;t hon. C&aacute;c kh&iacute; d?c h?i, &ocirc;i nhi?m t? m&ocirc;i tru?ng s? du?c c&acirc;y thanh l?c v&agrave; kh? b?t, d?c bi?t trong m&ocirc;i tru?ng c&oacute; m&aacute;y di?u h&ograve;a, m&aacute;y l?nh.</p>

<p><img alt="Cây phát tài d? bàn d?p" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-phat-tai-de-ban-2.jpg" style="width:500px" /></p>

<p>C&acirc;y xanh n&agrave;y kh&ocirc;ng nh?ng l&agrave;m d?p cho c?nh quan n?i th?t m&agrave; c&ograve;n gi&uacute;p cho s?c kh?e con ngu?i du?c d?m b?o hon. M?t uu di?m n?a c?a&nbsp;<strong>c&acirc;y ph&aacute;t t&agrave;i d? b&agrave;n</strong>&nbsp;ch&iacute;nh l&agrave; &yacute; nghia s&acirc;u s?c c?a ch&uacute;ng mang l?i. C&oacute; nhi?u ngu?i cho r?ng &yacute; nghia c&acirc;y ph? thu?c v&agrave;o s? lu?ng g?c c&acirc;y c?u th&agrave;nh l&ecirc;n ch?u c?nh d&oacute;. Ch?ng h?n nhu:</p>

<p>&ndash; Ch?u c&oacute; 2 g?c c&acirc;y s? tu?ng trung cho t&igrave;nh y&ecirc;u b?n v?ng, lu&ocirc;n d?p m&atilde;i.<br />
&ndash; Ch?u c&oacute; 3 ho?c 6 c&acirc;y s? tu?ng trung cho h?nh ph&uacute;c ?m &ecirc;m.<br />
&ndash; N?u 5 ho?c 7 c&acirc;y s? tu?ng trung cho s?c kh?e lu&ocirc;n d?i d&agrave;o.<br />
&ndash; N?u 8 c&acirc;y s? l&agrave; tu?ng trung cho t&agrave;i l?c<br />
&ndash; V?i s? 9 s? dem d?n s? may m?n.<br />
&ndash; Con s? d?c bi?t l&agrave; 21 s? mang h&agrave;m &yacute; thay cho l?i c?u ph&uacute;c d?n v?i ngu?i s? h?u c&acirc;y.</p>

<p><img alt="Cây phát tài d? bàn d?p" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-phat-tai-de-ban-3.jpg" style="width:500px" /></p>

<p>Cho d&ugrave; l&agrave; s? lu?ng c&acirc;y bao nhi&ecirc;u di chang n?a hay ch&uacute;ng du?c tr?ng nhu th? n&agrave;o th&igrave; lo?i c&acirc;y n&agrave;y lu&ocirc;n mang d?n s? may m?n, ti?n t&agrave;i, b?ng l?c cho gia ch? d&uacute;ng nhu t&ecirc;n g?i c?a c&acirc;y.&nbsp;<strong>C&acirc;y ph&aacute;t t&agrave;i d? b&agrave;n</strong>&nbsp;s? gi&uacute;p cho ch? s? h?u lu&ocirc;n an t&acirc;m, thu?n l?i trong c&ocirc;ng vi?c cung nhu th&agrave;nh d?t trong cu?c s?ng h&agrave;ng ng&agrave;y.</p>

<p><img alt="Cây phát tài d? bàn d?p" src="https://cayvahoa.net/wp-content/uploads/2016/08/cay-phat-tai-de-ban-4.jpg" style="width:500px" /></p>

<p>Ch&iacute;nh nh? nh?ng t&aacute;c d?ng v&agrave; &yacute; nghia c?a lo?i c&acirc;y n&agrave;y n&ecirc;n ch&uacute;ng du?c d&ugrave;ng l&agrave;m qu&agrave; t?ng trong nh?ng d?p d?c bi?t nhu thang quan ti?n ch?c, t&acirc;n gia, khai truong&hellip;. Ngo&agrave;i vi?c l&agrave;m c&acirc;y n?i th?t trong nh&agrave; ch&uacute;ng c&oacute; th? tr?ng l&agrave;m c?nh b&ecirc;n ngo&agrave;i gi&uacute;p cho kh&ocirc;ng gian nh&agrave; b?n tr? n&ecirc;n xanh tuoi, m?i m? hon. Ch&uacute;ng c&ograve;n thu t&agrave;i, h&uacute;t l?c v? cho gia d&igrave;nh nh&agrave; b?n.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (31, 14, N'Cây tùng tuyết mai', N'cay-tung-tuyet-mai-2-600x536.jpg', 250000, 0, N'Cây tùng tuyết mai _ Tết đến mọi người đều rộn ràng chuẩn bị sắm sửa đón giao thừa chào mừng năm mới và đừng quên chọn thêm những cây cảnh lung linh trưng bày ngày tết nhé', N'<p><a href="https://cayvahoa.net/cay-tung-tuyet-mai/">C&acirc;y t&ugrave;ng tuy?t mai</a>&nbsp;_ T?t d?n m?i ngu?i d?u r?n r&agrave;ng chu?n b? s?m s?a d&oacute;n giao th?a ch&agrave;o m?ng nam m?i v&agrave; d?ng qu&ecirc;n ch?n th&ecirc;m nh?ng c&acirc;y c?nh lung linh trung b&agrave;y ng&agrave;y t?t nh&eacute;. Nh?ng nam g?n d&acirc;y, r?t nhi?u ngu?i th&iacute;ch choi c&acirc;y c?nh l?a ch?n t&ugrave;ng tuy?t mai l&agrave; c&acirc;y c?nh ch? d?o trang tr&iacute; nh&agrave; ?, s?nh c&ocirc;ng ty, s&acirc;n vu?n th&ecirc;m ph?n sinh d?ng m&agrave; gi&aacute; c? r?t h?p l&yacute; n?a.</p>

<p>Ðu?c bi?t c&acirc;y t&ugrave;ng tuy?t mai c&oacute; ngu?n g?c t? Ch&acirc;u &Uacute;c v&agrave; du?c xem nhu l&agrave; m?t lo&agrave;i c&acirc;y hoa hi?m. Nhung d?n th?i di?m nay, gi?ng c&acirc;y n&agrave;y d&atilde; du?c ph&acirc;n b? r?ng r&atilde;i ? c&aacute;c nu?c nhu Trung Qu?c, Vi?t Nam&hellip;G&iacute;a nh?ng c&acirc;y tuy?t t&ugrave;ng mai b&ecirc;n b&ecirc;n x? Trung s? c&oacute; gi&aacute; r? so voi nu?c ta.</p>

<p><strong>Ð?c di?m n?i b?t c?a c&acirc;y t&ugrave;ng tuy?t mai t?o kh&ocirc;ng gian sinh d?ng</strong></p>

<p>Theo nhu t&igrave;m hi?u t? nh?ng ngu?i b&aacute;n c&acirc;y c?nh l&acirc;u nam cho bi?t, th?c ch?t lo?i c&acirc;y c?nh n&agrave;y kh&ocirc;ng ph?i m?i l? m&agrave; d&atilde; xu?t hi?n d&atilde; l&acirc;u tr&ecirc;n th? tru?ng v&agrave; du?c b&aacute;n r?t ch?y trong nh?ng ng&agrave;y t?t d?n. T?i Vi?t Nam ch&uacute;ng c&ograve;n c&oacute; nhi?u t&ecirc;n g?i d? nh?n bi?t theo v&ugrave;ng mi?n nhu l&agrave; b?ch tuy?t mai, hoa thanh li?u. Lo?i c&acirc;y n&agrave;y thu?c lo&agrave;i c&acirc;y b?i s?ng l&acirc;u nam n&ecirc;n cung r?t d? tr?ng v&agrave; cham s&oacute;c. N?u tr?ng du?i d?t c&acirc;y c&oacute; th? ph&aacute;t tri?n t?t c&oacute; chi?u cao l&ecirc;n d?n t? 2 &ndash; 3 m&eacute;t.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-tung-tuyet-mai.jpg" style="height:500px; width:648px" /></p>

<p>Ði?m n?i b?t c?a c&acirc;y t&ugrave;ng tuy?t mai l&agrave; nh?ng b&ocirc;ng hoa nhi?u m&agrave;u s?c d?p d?u d&agrave;ng. B?n d? d&agrave;ng chi&ecirc;m ngu?ng v? d?p d&oacute; nh&igrave;n th?y khi ch&uacute;ng n?, nh?ng c&aacute;nh hoa m&agrave;u h?ng ph?n, v&agrave;ng, t&iacute;m khoe s?c tr&ecirc;n ch&iacute;nh s&acirc;n nh&agrave; c?a b?n th&igrave; d?p tuy?t. K&iacute;ch thu?c t?ng b&ocirc;ng hoa t? 0,7 &ndash; 2 cm v&agrave; c&oacute; nhi?u h&igrave;nh th&ugrave; d?c bi?t chu&ocirc;ng v&agrave; sao. L&aacute; kim nh? c&oacute; m&agrave;u xanh d?m du?c m?c quanh th&acirc;n v&agrave; c?nh nh?ng b&ocirc;ng hoa t?o n&ecirc;n di?m nh?n n?i b?t.</p>

<p>Ði?m thu h&uacute;t d&acirc;n choi c&acirc;y c?nh lu&ocirc;n th&iacute;ch ch&iacute;nh l&agrave; m&ugrave;i huong lan t?a t? nh?ng c&aacute;nh hoa, l&aacute; c&acirc;y r?t ri&ecirc;ng bi?t m&agrave; nhi?u ngu?i d&atilde; ch?ng ki?n v&agrave; chia s?. H? n&oacute;i b?n s? c?m th?y r?t s?n kho&aacute;i t? t? khi ng?i th?y, c?m nh?n c&aacute;i huong thom ng?t ng&agrave;o quy?n r? gi&uacute;p tinh th?n tr? n&ecirc;n minh m?n v&agrave; t?nh t&aacute;o hon sau nh?ng ng&agrave;y l&agrave;m vi?c m?t nh?c hay bu?i s&aacute;ng&nbsp; s?m th?c d?y.</p>

<p>C&acirc;y t&ugrave;ng tuy?t mai l&agrave; lo&agrave;i c?nh s?ng trong kh&iacute; h?u se l?nh n&ecirc;n th?i di?m m&ugrave;a t?t l&agrave; di?u ki?n r?t thu?n l?i d? c&acirc;y n? hoa. Th?i gian n? hoa k&eacute;o d&agrave;i t? th&aacute;ng 12 duong l?ch d?n th&aacute;ng 5 nam sau. Kh&ocirc;ng ch? ? mi?n b?c c&oacute; th? tr?ng du?c lo?i hoa qu&yacute; n&agrave;y m&agrave; t?i Ð&agrave; L?t m&aacute;t m? quanh nam cung l&agrave; d?a di?m l&yacute; tu?ng d? cho ch&uacute;ng ph&aacute;t tri?n.</p>

<p><strong>C&ocirc;ng d?ng c?a c&acirc;y t&ugrave;ng tuy?t mai m&agrave; b?n n&ecirc;n bi?t</strong></p>

<p>Ð&atilde; c&oacute; r?t nhi?u ngu?i h?ng th&uacute; v?i lo&agrave;i hoa d?c d&aacute;o n&agrave;y. Tuy?t t&ugrave;ng mai d&atilde; t?o n&ecirc;n con s?t m&agrave; t?i c&aacute;c shop hoa ph?i ch&aacute;y h&agrave;ng. B?i m&ugrave;i huong thom c?a hoa v&agrave; l&aacute; d&atilde; m&ecirc; ho?c nhi?u ngu?i ph?i ch&uacute; &yacute; d?n s?c lan t?a kh&ocirc;ng gian r?t r?ng. &nbsp;L&agrave; d&ograve;ng c&acirc;y c?nh d? cham s&oacute;c cung nhu m&ugrave;a n? hoa d&uacute;ng v&agrave;o d?p t?t v&agrave; k&eacute;o d&agrave;i v&agrave;i th&aacute;ng sau d&oacute; r?t &nbsp;ph&ugrave; h?p cho vi?c trang tr&iacute; cho nh&agrave; b?n v?i &yacute; nghia sinh s&ocirc;i n?y n?, ru?c l?c v? nh&agrave;. Ði?u ch?c ch?n n?a l&agrave; gi&aacute; c? cung kh&aacute; h?p l&yacute; d? m?i ngu?i l?a ch?n, gi&aacute; dao d?ng t? 150 000 ng&agrave;n d?n v&agrave;i tri?u m?t ch?u c?nh.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-tung-tuyet-mai-1.jpg" style="height:500px; width:408px" /></p>

<p>V?i nh?ng ngu?i thu nh?p th?p cung d? d&agrave;ng mua ch&uacute;ng t?i nh?ng di?m b&aacute;n hoa v&agrave;o d?p t?t. Nh?ng ch?u hoa nh? b?n cung c&oacute; th? d? b&agrave;n kh&aacute;ch cung kh&aacute; h?p v&agrave; tinh t?. Nh?ng ch?u to hon trung b&agrave;y gi?a nh&agrave; ho?c tru?c h&agrave;nh lang th&ecirc;m ph?n sinh d?ng h&agrave;i h&ograve;a cho ng&ocirc;i nh&agrave;.</p>

<p>Ch&uacute; &yacute;: mu?n c&acirc;y t&ugrave;ng tuy?t mai du?c ph&aacute;t tri?n t?t n&ecirc;n ch?n di?m hu?ng &aacute;nh s&aacute;ng v&agrave; tho&aacute;ng m&aacute;t. V?i di?u ki?m ?m u?t v&agrave; nhi?t d? cao s? r?t kh&oacute; cham s&oacute;c v&agrave; tr&ocirc;ng ch&uacute;ng.</p>

<p><strong>C&aacute;ch tr?ng v&agrave; cham s&oacute;c c&acirc;y T&ugrave;ng tuy?t mai d&uacute;ng c&aacute;ch</strong></p>

<p>B?n dang h?ng th&uacute; v&agrave; quan t&acirc;m d?n lo&agrave;i c&acirc;y c?nh d?c bi?t n&agrave;y. H&atilde;y theo d&otilde;i k? thu?t cham s&oacute;c tr?ng c&acirc;y d&uacute;ng c&aacute;ch d? nh?n k?t qu? ung &yacute; nh&eacute;.</p>

<p><strong>K? thu?t gieo tr?ng:</strong></p>

<p>Tru?c ti&ecirc;n b?n ph?i ch?n gi?ng: Ð? tr?ng du?c&nbsp; c&oacute; m?t c&acirc;y t&ugrave;ng tuy?t mai b?n n&ecirc;n l?a ch?n c&acirc;y gi?ng t? th&aacute;ng 3 ho?c th&aacute;ng 4 khi ?y cung l&agrave; th?i k? hoa n?. Sau khi d&atilde; ch?n du?c c&acirc;y gi?ng b?n n&ecirc;n c?t t?a ph?n r? g?n g&agrave;ng d? tr?ng c&acirc;y hi?u qu? hon. Ph?n d?t tr?ng quan tr?ng c?n ch&uacute; &yacute;, c&acirc;y ph&aacute;t tri?n t?t v?i d?t d?t Akadama h?t nh? (d?t chuy&ecirc;n d?ng tr?ng c&acirc;y bonsai) v?i d?t m&ugrave;n. Ð?c bi?t ch?n noi tho&aacute;ng m&aacute;t v&agrave; thu?ng xuy&ecirc;n x?i d?t v&agrave; tu?i nu?c cho c&acirc;y h?p th? nh?ng d?nh du?ng.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/cay-tung-tuyet-mai-2.jpg" style="height:536px; width:700px" /></p>

<p>Giai do?n ti?p theo khi c&acirc;y gi?ng d&atilde; b&aacute;m r? v&agrave; ra m?m b?n c?n ch&uacute; &yacute; v&agrave; ti?n h&agrave;ng c?t m?m non 2 d?t nh?m d? c&acirc;y ph&aacute;t tri?n t?t hon. Sau m?t th?i gian cung nhu d?n m&ugrave;a b?t d?u ra hoa l&agrave; th?i ti?t b?t d?u chuy?n l?nh v&agrave; xu?t hi?n mua ph&ugrave;n nhi?u ng&agrave;y. Nhung di?u ki?n ua se l?nh nhung kh&ocirc;ng ch?u du?c ?m th?p b?n n&ecirc;n di chuy?n c&acirc;y(ch?u c&acirc;y) d?n noi c&oacute; m&aacute;i che kh&ocirc;ng b? mua t?t. Ð?ng qu&ecirc;n b&oacute;n ph&acirc;n cho c&acirc;y nh&eacute;, m?t th&aacute;ng 2 l?n th&ecirc;m dinh du?ng cho d?t tr?ng.</p>

<p>Giai do?n hoa n? l&agrave; th?i k? c?n cham s&oacute;c g?t gao nh?t. Ch&uacute; &yacute; d?n nhi?t d? hay &aacute;nh n?ng m?t tr?i chi?u tr?c ti?p d?n c&acirc;y n&ecirc;n d?t c&acirc;y v&agrave;o noi m&aacute;t m?, c&oacute; b&oacute;ng r&acirc;m, r?i d?i b? m?t d?t kh&ocirc; h?n m?i ti?p t?c tu?i nu?c.</p>

<p>Ð?i v?i c&aacute;c c&acirc;y tr?ng trong ch?u, sau khi c&acirc;y b&eacute;n r? ph?n r? b&ecirc;n du?i s? ph&aacute;t tri?n r?t nhanh v&igrave; th? n&ecirc;n d?i c&acirc;y sang ch?u tr?ng l?n hon, th?i k? th&iacute;ch h?p nh?t d? d?i ch?u ch&iacute;nh l&agrave; th&aacute;ng 4 b?n nh&eacute;!</p>

<p><strong>Nh?ng luu &yacute; khi tr?ng v&agrave; cham s&oacute;c t&ugrave;ng tuy?t mai</strong></p>

<p>B?n c?n n?m r&otilde; c&acirc;y t&ugrave;ng tuy?t mai s?ng tr&ocirc;ng di?u ki?n se l?nh v&agrave; kh&ocirc;ng ch?u du?c th?i ti?t n?ng n&oacute;ng hay d? ?m cao trong nh?ng m&ugrave;a mua ph&ugrave;n. Kh&ocirc;ng gi?ng nh?ng c&acirc;y c?nh kh&aacute;c, tuy?t t&ugrave;ng mai cung c?n ch&uacute; &yacute; d?n nh?ng l&uacute;c tu?i nu?c kh&ocirc;ng c?n qu&aacute; thu?ng xuy&ecirc;n m&agrave; h&atilde;y d?i b? m?t d?t tr?ng d&atilde; kh&ocirc; h?ng r?i h&atilde;y t?i l?i.</p>

<p>&ndash; Sau khi c&acirc;y d&atilde; ph&aacute;t tri?n n&ecirc;n d?i c&acirc;y sang ch?u l?n hon d? cho b? r? c&oacute; di?u ki?n ph&aacute;t tri?n.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (32, 14, N'Cây hoa hải đường', N'hoa-hai-duong.jpg', 360000, 0, N'Cây hoa hải đường không có màu quá rực rỡ và chói lọi như những loại hoa khác. Chúng khoác lên mình màu hồng đỏ đưa đến cảm giác ấm áp hơn cho không gian.', N'<p><a href="https://cayvahoa.net/cay-hoa-hai-duong/">C&acirc;y hoa h?i du?ng</a>&nbsp;kh&ocirc;ng c&oacute; m&agrave;u qu&aacute; r?c r? v&agrave; ch&oacute;i l?i nhu nh?ng lo?i hoa kh&aacute;c. Ch&uacute;ng kho&aacute;c l&ecirc;n m&igrave;nh m&agrave;u h?ng d? dua d?n c?m gi&aacute;c ?m &aacute;p hon cho kh&ocirc;ng gian. Nhi?u ngu?i v?n lu&ocirc;n ch?n lo?i hoa n&agrave;y d&oacute;n d?n v&agrave;o h&agrave;ng nam trong nh&agrave;. B?t ngu?n t? Trung Qu?c, c&acirc;y thu?c h? nh&agrave; ch&egrave;, du?c du nh?p v? Vi?t Nam r?t l&acirc;u, thu?ng tr?ng l&agrave;m c?nh trang tr&iacute; n?i ngo?i th?t v&agrave; c&acirc;y tr?ng c&ocirc;ng tr&igrave;nh d?p.</p>

<p>***&nbsp;Hoa d?a lan&nbsp;/&nbsp;Hoa tulip</p>

<p><img alt="Hoa h?i du?ng hoa d?p ngày t?t" src="https://cayvahoa.net/wp-content/uploads/2017/01/hoa-hai-duong-dep-1.jpg" style="width:500px" /></p>

<p>L&agrave; lo?i c&acirc;y th&acirc;n g?, thu?ng s?ng l&acirc;u nam v&agrave; cho hoa r?t d?p. N?u du?c tr?ng t? nhi&ecirc;n c&acirc;y c&oacute; th? cao d?n 2m v&agrave; c&oacute; nhi?u nh&aacute;nh nh?. V? c&acirc;y c&oacute; m&agrave;u t&iacute;m v&agrave; gai, thu?ng th&igrave; hoa c?a c&acirc;y s? c&oacute; m&agrave;u h?ng d? nhung c&ograve;n c&oacute; m&agrave;u tr?ng ho?c xanh tr?ng. V&agrave;o m&ugrave;a xu&acirc;n hoa thu?ng n? d? r?c, nhi?u ngu?i r?t ua chu?ng lo?i hoa n&agrave;y d? trang tr&iacute; t?t. Hoa dem d?n s? ?p &aacute;p v&agrave; g?n gui v?i con ngu?i.</p>

<p>V? &yacute; nghia c?a hoa cung r?t d?p, b?i l? ch&uacute;ng du?c ch?n l&agrave;m hoa cho ng&agrave;y t?t, du?c trung b&agrave;y trong nh&agrave; b?i s?c d? c?a hoa mang h&agrave;m &yacute; dua d?n s? may m?n, sum v?y. Ngo&agrave;i ra v?i c&aacute;i t&ecirc;n h?i du?ng du?c nhi?u ngu?i cho r?ng c&acirc;y tu?ng trung cho m?t ng&ocirc;i nh&agrave; l?n, ?p &aacute;p h?nh ph&uacute;c.</p>

<p><img alt="Hoa h?i du?ng hoa d?p ngày t?t" src="https://cayvahoa.net/wp-content/uploads/2017/01/hoa-hai-duong-dep-2.jpg" style="width:500px" /></p>

<p>Theo quan ni?m trong phong th?y c&acirc;y h?i du?ng c&ograve;n th? hi?n cho s? gi&agrave;u sang, ph&uacute; qu&yacute;, t&agrave;i l?c m&agrave; b?t c? ngu?i s? h?u c&acirc;y n&agrave;o cung mong mu?n c&oacute; du?c trong nh?ng ng&agrave;y d?u nam m?i. Hoa h?i du?ng kh&ocirc;ng qu&aacute; ki&ecirc;u sa, l?ng l?y m&agrave; ch&uacute;ng t?a nhu m?t c&ocirc; g&aacute;i m?i l?n dang c&ograve;n e ?p m?t c&aacute;ch thu?n khi?t. Ð?c bi?t m&ugrave;i huong thom nh? d?u c?a hoa khi?n t&acirc;m h?n con ngu?i du?c tho?i m&aacute;i hon.</p>

<p><img alt="hoa-hai-duong" src="https://cayvahoa.net/wp-content/uploads/2017/01/hoa-hai-duong.jpg" style="height:400px; width:600px" /></p>

<p>N?u ai d&oacute; t?ng cho b?n ch?u c&acirc;y h?i du?ng th&igrave; b?n s? nh?n du?c m?t l?i ch&uacute;c m?ng thang quan ti?n ch?c, l?i ch&uacute;c danh v?ng, vinh hoa. C&oacute; l? ch&iacute;nh v&igrave; nh?ng di?u n&agrave;y m&agrave; hoa h?i du?ng du?c b&agrave;y tr&iacute; trong nh&agrave; ng&agrave;y d?p t?t v?.</p>

<p>***&nbsp;C&acirc;y c?nh ng&agrave;y t?t</p>

<p>Nhung c&oacute; nhi?u ngu?i cho r?ng lo?i c&acirc;y n&agrave;y nhu m?t m&oacute;n qu&agrave; ho&agrave;n h?o v&agrave; may m?n cho nh?ng ch&agrave;ng trai. Ch&uacute;ng tu?ng trung cho s? h&ograve;a h?p gi?a b?n b&egrave;, t&igrave;nh anh em v&agrave; g?n k?t m?i ngu?i l?i v?i nhau g?n hon.</p>

<p><img alt="cay-hoa-hai-duong" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-hoa-hai-duong.jpg" style="height:490px; width:350px" /></p>

<p>V?i m&agrave;u d? kh&ocirc;ng qu&aacute; r?c r? v&agrave; khi hoa n? k&eacute;o d&agrave;i 2 d?n 3 ng&agrave;y, nh?ng c&aacute;nh hoa tuoi s?c lu&ocirc;n l&agrave;m kh&ocirc;ng gian th&ecirc;m tuoi m?i. N?u b?n d? &yacute; th&igrave; hoa h?i du?ng thu?ng du?c m&ocirc; ph?ng trong nh?ng tranh v?, th&ecirc;u tr&ecirc;n v?i du?c trang tr&iacute; trong ph&ograve;ng kh&aacute;ch, nhi?u ngu?i treo tranh hoa h?i du?ng v?i h&agrave;m &yacute; dem d?n ph&uacute; qu&yacute; h?nh ph&uacute;c d?y nh&agrave; cho gia d&igrave;nh.</p>

<p><img alt="Hoa h?i du?ng hoa d?p ngày t?t" src="https://cayvahoa.net/wp-content/uploads/2017/01/hoa-hai-duong-dep-4.jpg" style="width:500px" /></p>

<p>N?u tr?ng c&acirc;y trong nh&agrave; th&igrave; ngu?i tr?ng n&ecirc;n luu &yacute; r?ng c?n ph?i t?a c&agrave;nh, lo?i b? l&aacute; s&acirc;u b?nh, h&eacute;o &uacute;a thu?ng xuy&ecirc;n s? gi&uacute;p c&acirc;y th&ocirc;ng tho&aacute;ng v&agrave; tr&agrave;n d?y s?c s?ng hon. C&acirc;y c?n ph?i h?ng n?ng m?i ng&agrave;y d? cung c?p d? &aacute;nh s&aacute;ng cho c&acirc;y ph&aacute;t tri?n v&agrave; hoa lu&ocirc;n tuoi t?n s?c m&agrave;u hon n?a.</p>

<p>V&igrave; lo?i c&acirc;y n&agrave;y r?t d? b? s&acirc;u d?c th&acirc;n n&ecirc;n c?n ph&ograve;ng tr? cho c&acirc;y b?ng c&aacute;ch qu&eacute;t v&ocirc;i v&agrave;o g?c kho?ng 2 d?n 3 l?n trong tu?n.</p>

<p><img alt="Hoa h?i du?ng hoa d?p ngày t?t" src="https://cayvahoa.net/wp-content/uploads/2017/01/hoa-hai-duong-dep-5.jpg" style="width:500px" /></p>

<p>N?u hoa tr&ecirc;n c&agrave;nh qu&aacute; nhi?u c?n ph?i t?a b?t c&aacute;c n? x?u hay qu&aacute; s&aacute;t cu?ng hoa d? hoa n? d?p hon. Ð?nh k? m?i th&aacute;ng c?n ph?i b&oacute;n th&ecirc;m ph&acirc;n cho c&acirc;y ho?c x?i d?t toi x?p d? c&acirc;y h&uacute;t nu?c v&agrave; ch?t dinh du?ng t?t hon.</p>

<p><img alt="Hoa h?i du?ng hoa d?p ngày t?t" src="https://cayvahoa.net/wp-content/uploads/2017/01/hoa-hai-duong-dep-6.jpg" style="width:500px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (33, 14, N'Cây bạch lan dương', N'cay-bach-lan-duong-5.jpg', 280000, 0, N'Những chuỗi hoa màu trắng tinh khôi lung linh trong gió, khiến hút hồn bao nhiêu người yêu cây. Với tên gọi khác của cây bạch lan dương là cây ngọc dạ minh châu, thật mỹ miều và dịu dàng.', N'<p>Nh?ng chu?i hoa m&agrave;u tr?ng tinh kh&ocirc;i lung linh trong gi&oacute;, khi?n h&uacute;t h?n bao nhi&ecirc;u ngu?i y&ecirc;u c&acirc;y. V?i t&ecirc;n g?i kh&aacute;c c?a<a href="https://cayvahoa.net/cay-hoa-bach-lan-duong/">&nbsp;c&acirc;y b?ch lan duong</a>&nbsp;l&agrave; c&acirc;y ng?c&nbsp;d? minh ch&acirc;u, th?t m? mi?u v&agrave; d?u d&agrave;ng. C&acirc;y dem d?n cho ngu?i thu?ng th?c m?t v? d?p ho&agrave;n m?. Ð?c bi?t hoa c?a c&acirc;y thu?ng n? v&agrave;o d?p xu&acirc;n v? n&ecirc;n ch&uacute;ng du?c ch?n l&agrave;m hoa chung t?t kh&aacute; nhi?u.</p>

<p>*** &nbsp;https://cayvahoa.net/cay-canh-ngay-tet/</p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-1.jpg" style="width:500px" /></p>

<p>M?i nam t?t v? ngu?i ngu?i, nh&agrave; nh&agrave; di s?m t?t, nh?ng lo?i b&aacute;nh k?o, b&aacute;nh chung, tr&aacute;i c&acirc;y nhung kh&ocirc;ng th? qu&ecirc;n di nh?ng lo?i hoa trung t?t. M?t trong nh?ng d?c di?m quan tr?ng d? ch?n c&acirc;y c?nh d?p ch&iacute;nh v&agrave; d?a v&agrave;o h&igrave;nh th&aacute;i c?a c&acirc;y v&agrave; &yacute; nghia c?a ch&uacute;ng mang l?i. Hoa c&agrave;ng d?p th&igrave; c&agrave;ng thu h&uacute;t &aacute;nh nh&igrave;n, &yacute; nghia c&agrave;ng t?t th&igrave; du?c l&ograve;ng gia ch?. Nh?ng d?c di?m n&agrave;y th&igrave; b?ch lan duong d&atilde; lu&ocirc;n c&oacute; s?n trong m&igrave;nh d? chinh ph?c v?a l&ograve;ng ngu?i mua c&acirc;y.</p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-2.jpg" style="width:500px" /></p>

<p>N?u b?n d?t m?t&nbsp;c&acirc;y b?ch lan duong&nbsp;trong nh&agrave; th&igrave; ch&iacute;nh nh? m&agrave;u s?c tr?ng c?a hoa x&acirc;u th&agrave;nh nh?ng chu?i d&agrave;i d&atilde; l&agrave;m b?ng s&aacute;ng cho kh&ocirc;ng gian gia d&igrave;nh nh&agrave; b?n. Ch&uacute;ng t?a nhu nh?ng vi&ecirc;n ng?c r?c r? tuoi t?n khi?n ngu?i chi&ecirc;m ngu?ng ph?i tr?m tr? khen ng?i. Thu?ng th&igrave; lo?i hoa n&agrave;y n? t? th&aacute;ng 11 nam n&agrave;y cho d?n th&aacute;ng 5 nam sau. Hoa d?p b? b? v&agrave; c&oacute; s?c h&uacute;t kh&oacute; cu?ng, b?i l? ch&uacute;ng c&oacute; th?i gian ra hoa d&agrave;i l&acirc;u n&ecirc;n ngu?i tr?ng kh&ocirc;ng ph?i lo l?ng v? v?n d? c&acirc;y c&oacute; k?p ra hoa v&agrave;o d?p t?t hay kh&ocirc;ng.</p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-3.jpg" style="width:500px" /></p>

<p>C? m?i d?p t?t v? th&igrave; nh?ng ch?u hoa b?ch lan duong l?i du?c b&agrave;y b&aacute;n tr&ecirc;n du?ng ph? hoa H&agrave; N?i. Thu?ng th&igrave; hoa m?c th&agrave;nh chu?i r? xu?ng n&ecirc;n th&iacute;ch h?p tr?ng trong ch?u s? ho?c ch?u hoa treo d? c&oacute; th? ti?n trang tr&iacute; trong nh&agrave;, nh?ng v? tr&iacute; nhu ban c&ocirc;ng, h&agrave;nh lang ho?c trong ph&ograve;ng kh&aacute;ch.</p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-4.jpg" style="width:500px" /></p>

<p>Anh ch? c?a h&agrave;ng&nbsp;th? gi?i c&acirc;y v&agrave; hoa&nbsp;chia s?&nbsp;<em>&ldquo; C? m?i d?p l? t?t v? l&agrave; nhi?u ngu?i d?n h?i t&igrave;m mua c&acirc;y b?ch lan duong. M?c d&ugrave; nam nay do di?u ki?n th?i ti?t kh&iacute; h?u kh&ocirc;ng du?c thu?n l?i n&ecirc;n gi&aacute; c?a c&acirc;y c?nh c&oacute; ph?n tang nh? nhung nhu c?u c?a ngu?i d&acirc;n v?n kh&aacute; cao. Lo?i hoa n&agrave;y cung du?c x?p v&agrave;o trong danh s&aacute;ch hoa trang tr&iacute; t?t d?p&rdquo;</em></p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-5.jpg" style="width:500px" /></p>

<p>Kh&ocirc;ng ch? d?ng l?i ? v? d?p c?a hoa m&agrave; c&acirc;y c&ograve;n d?p v? c? &yacute; nghia. N?u n&oacute;i d?n v?n d? n&agrave;y th&igrave; nhi?u ngu?i cho r?ng c&acirc;y mang d?n c&ocirc;ng danh tr&iacute; tu? v&agrave; t&agrave;i l?c. N?u du?c trang tr&iacute; v&agrave;o nh?ng d?p l? t?t, nh?ng ng&agrave;y d?u nam m?i th&igrave; ngu?i tr?ng c&acirc;y cho r?ng nhu v?y s? gi&uacute;p cho c? gia d&igrave;nh trong nam g?p du?c nhi?u may m?n, h?nh ph&uacute;c, ti?n b?c d?i d&agrave;o. Theo quan ni?m phong th?y th&igrave; n?u nh&agrave; c&oacute; ngu?i thi c? s? th&agrave;nh c&ocirc;ng danh, nh?c nh? con ch&aacute;u lu&ocirc;n c?u ti?n v&agrave; s&aacute;ng su?t trong m?i t&igrave;nh hu?ng c?a cu?c s?ng.</p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-6.jpg" style="width:500px" /></p>

<p>Thay v&igrave; nh?ng c&acirc;y mai, c&acirc;y d&agrave;o, &nbsp;c&acirc;y qu?t t?t&nbsp;truy?n th?ng c?a ngu?i Vi?t Nam b?n c&oacute; th? trang tr&iacute; th&ecirc;m v&agrave;o d&oacute; l&agrave; nh?ng ch?u b?ch lan duong tuy?t d?p. Ch&uacute;ng s? t&ocirc; di?m cho kh&ocirc;ng gian gia d&igrave;nh b?n th&ecirc;m tuoi s&aacute;ng hon. T&ugrave;y v&agrave;o k&iacute;ch thu?c c&acirc;y s? c&oacute; gi&aacute; ti?n kh&aacute;c nhau v&agrave; b?n c&oacute; th? t? do l?a ch?n tho?i m&aacute;i cho ri&ecirc;ng m&igrave;nh ch?u c&acirc;y c?nh ung &yacute; nh?t.</p>

<p><img alt="B?ch lan duong d?u dàng dón t?t v?" src="https://cayvahoa.net/wp-content/uploads/2017/01/cay-bach-lan-duong-7.jpg" style="width:500px" /></p>

<p>M?t d?c di?m tuy?t v?i n?a c?a c&acirc;y mang l?i cho ngu?i tr?ng ch&iacute;nh l&agrave; ch&uacute;ng kh&aacute; d? cham s&oacute;c. B?n kh&ocirc;ng c?n ph?i m?t qu&aacute; nhi?u th?i gian v&agrave;o ch&uacute;ng m&agrave; v?n cho nh?ng chu?i hoa d?p m&ecirc; h?n. Ch? c?n tu?i nu?c cho c&acirc;y thu?ng xuy&ecirc;n v&agrave; d?t v&agrave;o ch? r&acirc;m m&aacute;t th&igrave; c&acirc;y c&oacute; th? s?ng v&agrave; ph&aacute;t tri?n kh?e m?nh d?ng th?i ra hoa d?p. B?n th?y d?y qu? th?t d&acirc;y l&agrave; m?t lo?i c&acirc;y c?nh r?t tuy?t d&uacute;ng kh&ocirc;ng n&agrave;o, v?y c&ograve;n ch?n ch? di?u g&igrave; m&agrave; kh&ocirc;ng d&oacute;n ch?u b?ch lan duong n&agrave;y v? nh&agrave; trong d?p t?t d?u nam m?i n&agrave;y!</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (34, 14, N'Cây nhất chi mai', N'IMG_4380copy.jpg', 299000, 0, N'Cây nhất chi mai hay còn gọi là mai trắng, bạch mai, lưỡng nhị mai… Chúng có tên khoa học Prunus mume Sieb. & Zucc thuộc họ với đào, mơ, mận.', N'<p><a href="https://cayvahoa.net/cay-nhat-chi-mai/"><strong>C&acirc;y nh?t chi mai</strong></a>&nbsp;hay c&ograve;n g?i l&agrave; mai tr?ng, b?ch mai, lu?ng nh? mai&hellip; Ch&uacute;ng c&oacute; t&ecirc;n khoa h?c Prunus mume Sieb. &amp; Zucc thu?c h? v?i d&agrave;o, mo, m?n. Ð&acirc;y l&agrave; lo&agrave;i mai c?c hi?m, s?ng ? v&ugrave;ng n&uacute;i h?o l&aacute;nh, noi c&oacute; nhi?t d? th?p, ua gi&aacute; l?nh. B? ngo&agrave;i n&oacute; c&oacute; g?c x&ugrave; x&igrave;, th&acirc;n den, n? m&agrave;u d? v&agrave; n? ra th&igrave; l?i chuy?n d?n sang m&agrave;u tr?ng d?n khi t&agrave;n l?i chuy?n d?n v? m&agrave;u d? d&oacute; l&agrave; s? kh&aacute;c bi?t c?a c&acirc;y. Ð&acirc;y l&agrave; lo&agrave;i nh&acirc;n gi?ng r?t kh&oacute; khan v&igrave; c&acirc;y kh&ocirc;ng c&oacute; qu?, tuy nhi&ecirc;n c&acirc;y l?i c&oacute; s?c s?ng m&atilde;nh li?t m?c th?i ti?t gi&aacute; r&eacute;t. B?i v?y ngu?i choi c&acirc;y c?nh l?i c&agrave;ng th&iacute;ch th&uacute; v&agrave; mu?n s? h?u lo&agrave;i c&acirc;y d?p n&agrave;y.<br />
<img alt="nh?t chi mai2" src="https://cayvahoa.net/wp-content/uploads/2016/10/IMG_4380copy.jpg" style="height:349px; width:600px" /></p>

<p>Ch&uacute;ng du?c m?nh danh l&agrave; thi&ecirc;n h? d? nh?t mai, ch? c&oacute; ch&uacute;ng m?i c&oacute; nh?ng d?c di?m phi thu?ng, ch&uacute;ng kh&aacute;c bi?t c&aacute;c lo&agrave;i mai d&agrave;o kh&aacute;c b?i kh? nang t&aacute;i n? hoa v&agrave;o th&aacute;ng 2 &acirc;m l?ch v?i nh?ng ch?i non xanh tuoi. B?n s? c&oacute; kho?ng th?i gian choi hoa l&acirc;u hon v&agrave;o c? 2 d?p l&agrave; t?t v&agrave; v&agrave;o xu&acirc;n.</p>

<p><img alt="nh?t chi mai1" src="https://cayvahoa.net/wp-content/uploads/2016/10/chau-hoa-nhat-chi-mai.jpg" style="height:456px; width:600px" /></p>

<p><strong>C&ugrave;ng t&igrave;m hi?u c&aacute;ch tr?ng v&agrave; cham s&oacute;c c&acirc;y nh?t chi mai b?n nh&eacute;:</strong></p>

<p><img alt="nh?t chi mai3" src="https://cayvahoa.net/wp-content/uploads/2016/10/IMG_4707copy-1.jpg" style="height:471px; width:600px" /></p>

<p>Ch&uacute;ng quen s?ng ? nh?ng noi cao r&aacute;o n&ecirc;n nh?t chi mai kh&ocirc;ng ch?u du?c ng?p &uacute;ng, ch? c?n gi? d? ?m cho c&acirc;y l&agrave; du?c. B?n n&ecirc;n c? d?nh h&agrave;ng th&aacute;ng b&oacute;n ph&acirc;n cho c&acirc;y, luu &yacute; l&agrave; kh&ocirc;ng du?c d? d?t qu&aacute; kh&ocirc;, c&acirc;y s? ch?t d&oacute; b?n nh&eacute;. V?i nh?ng ngu?i c&oacute; kinh nghi?p choi c&acirc;y h? thu?ng ch?n lo?i d?t m?t ru?ng, d?p nh? phoi kh&ocirc; s&agrave;ng l?c l?y nh?ng h?t c&oacute; k&iacute;ch thu?c b&eacute; nhung kh&ocirc;ng qu&aacute; m?n d? l&agrave;m d?t tr?ng nh?t chi mai v&igrave; ch&uacute;ng s? c&oacute; d? tho&aacute;ng cao, r? s? ph&aacute;t tri?n nhanh hon. Trong qu&aacute; tr&igrave;nh l&agrave;m d?t b?n c&oacute; th? tr?n c&ugrave;ng ph&acirc;n chu?ng hoai m?c.</p>

<p>B?n kh&ocirc;ng nh?t thi?t ph?i d&ugrave;ng ph&acirc;n b&oacute;n h&oacute;a h?c m&agrave; c&oacute; th? thay th? b?ng nu?c gi?i pha lo&atilde;ng ho?c c&aacute;c lo?i nu?c nhu vo g?o, nu?c ?c ng&acirc;m tu?i tu?n 1 l?n cho c&acirc;y.</p>

<p>Ð? c&acirc;y c&oacute; d&aacute;ng d?p b?n n&ecirc;n c?t t?a c&agrave;nh t?o d&aacute;ng cho c&acirc;y lu&ocirc;n. Th?i di?m c?t l&agrave; cu?i th&aacute;ng 12 &acirc;m l?ch ho?c b?n quan s&aacute;t xem n?u th?y ng?n hoi sung l&ecirc;n v&agrave; chuy?n sang m&agrave;u xanh nh?t th&igrave; d&oacute; ch&iacute;nh l&agrave; th?i di?m t?a t?t nh?t d? c&acirc;y cho ra nhi?u ch?i non hon. Luu &yacute; r?ng nh?t chi mai ch? cho ra hoa ? nh?ng c&agrave;nh non, c&ograve;n nh?ng c&agrave;nh d&atilde; ra hoa t? nam tru?c th&igrave; n&ecirc;n c?t b? b?n nh&eacute;</p>

<p><strong>L&agrave;m sao d? cho c&acirc;y nh?t chi mai n? hoa d&uacute;ng d?p t?t?</strong></p>

<p>Ð? c&acirc;y ra hoa d&uacute;ng d?p t?t th&igrave; cu?i th&aacute;ng 10 &acirc;m l?ch b?n c?n v?t l&aacute;. N?u th?i ti?t r&eacute;t d?m b?n c&oacute; th? pha nu?c ?m c&ugrave;ng ph&acirc;n l&acirc;n tu?i cho c&acirc;y d? c&acirc;y ra n?.</p>

<p><strong>M?t s? b?nh thu?ng g?p</strong></p>

<p><img alt="nh?t chi mai4" src="https://cayvahoa.net/wp-content/uploads/2016/10/maxresdefault-1.jpg" style="height:338px; width:600px" /></p>

<p>C&acirc;y b? ch?y nh?a thu?ng g?p ? c&acirc;y c&oacute; th? do c&acirc;y th?a nu?c,suong mu?i&hellip; M?t s? b?nh th&igrave; do n?m b?n c&oacute; th? s? d?ng thu?c di?t n?m.&nbsp;</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (35, 14, N'Cây đào tết, cành đào tết', N'trang-tri-canh-dao-don-tet-va-nhung-luu-y-cuc-huu-ich-2.jpg', 99000, 0, N'Cây đào tết là biểu tượng đặc trưng cho ngày tết cổ truyền Việt Nam với nhiều ý nghĩa tốt đẹp. Là nét văn hóa lâu đời không bao giờ mai một.', N'<p><strong>C&acirc;y d&agrave;o t?t</strong>&nbsp;l&agrave; bi?u tu?ng d?c trung cho ng&agrave;y t?t c? truy?n Vi?t Nam v?i nhi?u &yacute; nghia t?t d?p. L&agrave; n&eacute;t van h&oacute;a l&acirc;u d?i kh&ocirc;ng bao gi? mai m?t. M?i khi t?t d?n xu&acirc;n v? hoa d&agrave;o l?i n? r?, ai cung h&aacute;o h?c d&oacute;n nam m?i v?i ni?m vui, hi v?ng r?ng trong nam m?i s? c&oacute; nhi?u di?u t?t d?p hon, an khang v&agrave; th?nh vu?ng.</p>

<p>***&nbsp;<a href="https://cayvahoa.net/mam-ngu-qua-ngay-tet-theo-phong-tuc-co-truyen-3-mien/">https://cayvahoa.net/mam-ngu-qua-ngay-tet-theo-phong-tuc-co-truyen-3-mien/</a></p>

<p>***&nbsp;<a href="https://cayvahoa.net/ban-cay-quat-canh-ngay-tet-gia-re-cho-moi-nha/">https://cayvahoa.net/ban-cay-quat-canh-ngay-tet-gia-re-cho-moi-nha/</a></p>

<p><img alt="Cây dào t?t1" src="https://cayvahoa.net/wp-content/uploads/2016/09/1434356431-xcextrang_tri_dao_tet_at_mui_giadinhonlinevn171_1638_sobk.jpg" style="height:330px; width:500px" /></p>

<p>T?i sao l?i c&oacute;&nbsp;<strong><a href="https://cayvahoa.net/ban-chau-cay-dao-tet-canh-dao-gia-re-tai-ha-noi/%20%E2%80%8E">c&agrave;nh d&agrave;o t?t</a>&nbsp;</strong>? Truy?n thuy?t k? l?i r?ng c&oacute; 2 v? ti&ecirc;n canh gi? m?t c&acirc;y d&agrave;o kh?ng l?. Hai v? ti&ecirc;n l&agrave; n?i khi?p s? c?a b?n ma qu?, khi?n ch&uacute;ng kh&ocirc;ng th? b&eacute;n m?ng d?n noi con ngu?i s?ng. Nhung c? v&agrave;o ng&agrave;y m&ugrave;ng m?t th&aacute;ng ri&ecirc;ng c? hai v? ti&ecirc;n d?u ph?i l&ecirc;n thi&ecirc;n d&igrave;nh b&aacute;o c&aacute;o, d? b?o v? cu?c s?ng b&igrave;nh y&ecirc;n c?a ngu?i d&acirc;n, hai v? ti&ecirc;n d&oacute; d&atilde; ni?m ch&uacute; l&ecirc;n c&acirc;y d&agrave;o v&agrave; cho ngu?i d&acirc;n m?i ng&agrave;y m?t c&agrave;nh ch?t mang tr?ng trong nh&agrave;. T? d&oacute; m?i c&oacute; t?c l?&nbsp;<strong>c&acirc;y d&agrave;o t?t</strong>.</p>

<p><img alt="Cây dào t?t2" src="https://cayvahoa.net/wp-content/uploads/2016/09/hoa-hau-ha-kieu-anh-tro-tai-phu-nu-dam-dang-ngay-tet.jpg" style="height:661px; width:496px" /></p>

<p>C&agrave;nh d&agrave;o t?t mang nhi?u &yacute; nghia t&acirc;m linh t?t d?p trong l&ograve;ng m?i con ngu?i Vi?t Nam. L&agrave; c&acirc;y d? tr? t&agrave; ma ng&agrave;y t?t, l&agrave; tinh hoa van h&oacute;a, l&agrave; s? d?i m?i v&agrave; sinh s&ocirc;i ph&aacute;t tri?n.</p>

<p><strong>Trang tr&iacute; c&agrave;nh d&agrave;o ng&agrave;y t?t</strong></p>

<p><img alt="Cây dào t?t5" src="https://cayvahoa.net/wp-content/uploads/2016/09/trang-tri-canh-dao-don-tet-va-nhung-luu-y-cuc-huu-ich.jpg" style="height:373px; width:500px" /></p>

<p>Trang tr&iacute; m?t c&agrave;nh d&agrave;o d? th? hi?n di?u mong mu?n m?t nam m?i t&agrave;i l?c, an khang. S?c d? v&agrave; v&agrave;ng l&agrave; m&agrave;u s?c ch? d?o khi trang tr&iacute; d&agrave;o. B?n c&oacute; th? treo nh?ng phong bao l&igrave; x&igrave;, d&egrave;n l?ng nh?, nh?ng d?ng ti?n xu c&ugrave;ng nh?ng c&acirc;u d?i, nh?ng l?i ch&uacute;c truy?n th?ng. B?n cung c&oacute; th? k?t h?p trang tr&iacute; c&agrave;nh d&agrave;o b?ng nh?ng d&acirc;y d&egrave;n nh&aacute;y v?i nhi?u m&agrave;u s?c.</p>

<p><img alt="Cây dào t?t3" src="https://cayvahoa.net/wp-content/uploads/2016/09/trang-tri-canh-dao-don-tet-va-nhung-luu-y-cuc-huu-ich-1.jpg" style="height:313px; width:500px" /></p>

<p>Tuy nhi&ecirc;n ? m?t b? ph?n ngu?i choi d&agrave;o, h? thu?ng th&iacute;ch nh?ng c&agrave;nh d&agrave;o mang d?m n&eacute;t t? nhi&ecirc;n, g&oacute;p ph?n g?n gui t? nhi&ecirc;n v?i gia ch?. M?t s? ch&uacute; chim gi? du?c g?n l&ecirc;n c&agrave;nh d&agrave;o t?o m?t phong c&aacute;ch n&ecirc;n tho trong ph&ograve;ng kh&aacute;ch c?a b?n.</p>

<p>M?t di?u quan tr?ng n?a l&agrave; vi?c l?a ch?n ch?u c&acirc;y d&agrave;o t?t sao cho ph&ugrave; h?p v?i kh&ocirc;ng gian c?a b?n. N?u b?n c?m th?y kh&oacute; khan b?n c&oacute; th? d?n v?i shop<a href="https://cayvahoa.net/">&nbsp;c&acirc;y v&agrave; hoa</a>&nbsp;ch&uacute;ng t&ocirc;i c&oacute;&nbsp;<strong>b&aacute;n ch?u c&acirc;y d&agrave;o t?t</strong>&nbsp;v?i nhi?u m?u m&atilde; v&agrave; ki?u d&aacute;ng cho b?n d? d&agrave;ng l?a ch?n. Thu?ng th&igrave; da s? ngu?i mua l?a ch?n nh?ng chi?c b&igrave;nh s? tr?ng mi?ng r?ng, th&acirc;n tr&ograve;n h?p v?i c&agrave;nh d&agrave;o nh? xinh.</p>

<p><img alt="Cây dào t?t4" src="https://cayvahoa.net/wp-content/uploads/2016/09/trang-tri-canh-dao-don-tet-va-nhung-luu-y-cuc-huu-ich-2.jpg" style="height:500px; width:500px" /></p>

<p><strong>M?t s? m?o gi? c&agrave;nh d&agrave;o du?c tuoi l&acirc;u trong ng&agrave;y t?t:</strong></p>

<p>Sau khi c&oacute; trong tay m?t c&agrave;nh d&agrave;o, vi?c d?u ti&ecirc;n c?a b?n l&agrave; d?t g?c d&agrave;o d? nh?a d&agrave;o kh&ocirc;ng b? ch?y ra. B?n c?n thay nu?c s?ch 3 ng&agrave;y m?t l?n v&agrave; cho v&agrave;o m?t vi&ecirc;n Aspirin d? ngan ng?a vi khu?n g&acirc;y th?i c&agrave;nh. M?t c&aacute;ch k&iacute;ch th&iacute;ch d&agrave;o ra hoa nhanh l&agrave; cho d&agrave;o v&agrave;o ch? tho&aacute;ng kh&iacute;, th?p di?n, d?t huong ho?c d?t c&agrave;nh b&ecirc;n ngo&agrave;i tr?i v&agrave;o ban d&ecirc;m.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (36, 14, N'Cây hoa mai vàng', N'hoa-mai-vang-dep-2.png', 199000, 0, N'Cây mai vàng tết là giống kiểng, thú vui của rất nhiều người chơi hoa, chúng mang một nét đặc trưng của con người Việt Nam.', N'<p><strong>C&acirc;y&nbsp;mai v&agrave;ng t?t&nbsp;</strong>l&agrave; gi?ng ki?ng, th&uacute; vui c?a r?t nhi?u ngu?i choi hoa, ch&uacute;ng mang m?t n&eacute;t d?c trung c?a con ngu?i Vi?t Nam. T? th?i xua ngu?i ta thu?ng trang tr&iacute; c&acirc;y mai, c&acirc;y d&agrave;o trong nh&agrave; v&agrave;o d?p t?t. Hoa mai n? khi m&ugrave;a xu&acirc;n d?n, d&acirc;y cung l&agrave; d?u hi?u d&oacute;n ch&agrave;o m?t nam m?i dang t?i. Ð?c bi?t hoa mai c&oacute; 5 c&aacute;nh ?ng v?i kim, m?c, th?y, h?a, th? trong ngu h&agrave;nh. V?y n&ecirc;n lo?i mai v&agrave;ng r?t c&oacute; gi&aacute; tr? d?i v?i con ngu?i kh&ocirc;ng ch? v? th?m m? m&agrave; c&ograve;n v? gi&aacute; tr? tinh th?n. Nh?ng gi&aacute; tr? d&oacute; c&acirc;y v&agrave; hoa s? dua d?n cho c&aacute;c b?n ngay du?i d&acirc;y, d? c&aacute;c b?n hi?u th&ecirc;m v? lo?i&nbsp;<strong>hoa mai v&agrave;ng</strong>&nbsp;n&agrave;y nh&eacute;.</p>

<p>***&nbsp;<a href="https://cayvahoa.net/cay-canh-ngay-tet/">https://cayvahoa.net/cay-canh-ngay-tet/</a></p>

<p>***&nbsp;<a href="https://cayvahoa.net/hoa-su-kien/hoa-ngay-tet/">https://cayvahoa.net/hoa-su-kien/hoa-ngay-tet/</a></p>

<p><img alt="Mai vàng d?y s?c xuân mang tài l?c vào nhà" src="https://cayvahoa.net/wp-content/uploads/2016/08/hoa-mai-vang-dep-1.jpg" style="width:500px" /></p>

<p>Lo?i hoa mai v&agrave;ng c&oacute; m&agrave;u v&agrave;ng d?y sang tr?ng v&agrave; tinh t?, dem d?n cho lo?i hoa n&agrave;y nhi?u &yacute; nghia. V?i v? d?p d?u d&agrave;ng c?a hoa mai d&atilde; dua d?n m?t ni?m y&ecirc;u thuong, g?n gui hon trong cu?c s?ng d?i thu?ng. Ngu?i tr?ng mai s? lu&ocirc;n c?m th?y y&ecirc;u d?i hon khi thu?ng th?c v? d?p c?a ch&uacute;ng. Theo quan ni?m c?a &ocirc;ng cha ta ng&agrave;y xua khi c&acirc;y mai t?t&nbsp;n? v&agrave;o ng&agrave;y t?t d?c bi?t v&agrave;o ng&agrave;y m&ugrave;ng 1 t?t h&agrave;ng nam, th&igrave; d&acirc;y l&agrave; d?u hi?u c?a s? may m?n s?p t?i d?i v?i gia d&igrave;nh. Ngu?i ta thu?ng tr?ng mai trong nh&agrave; khi d&oacute;n t?t.</p>

<p><img alt="Mai vàng d?y s?c xuân mang tài l?c vào nhà" src="https://cayvahoa.net/wp-content/uploads/2016/08/hoa-mai-vang-dep-2.png" style="width:500px" /></p>

<p><strong>C&acirc;y mai</strong>&nbsp;c&ograve;n n?m trong b? t? &ldquo;<strong>t&ugrave;ng, c&uacute;c, tr&uacute;c, mai</strong>&rdquo; g?n li?n v?i nhi?u b&agrave;i tho hay du?c nhi?u nh&agrave; van tho m&ocirc; t? v? v? d?p lo&agrave;i hoa n&agrave;y. Hoa mai n? khi m&ugrave;a xu&acirc;n v? mang d?n hi v?ng, s? may m?n, h?nh ph&uacute;c v&agrave; t&igrave;nh y&ecirc;u trung th&agrave;nh. Ngo&agrave;i ra hoa mai c&ograve;n bi?u tu?ng cho s? cao thu?ng, thanh cao. V&agrave;o nh?ng ng&agrave;y t?t con ch&aacute;u, b?n b&egrave;, d?ng nghi?p hay thu?ng t?ng nhau nh?ng ch?u mai v&agrave;ng v?i mong mu?n dem d?n s?c kh?e d?i d&agrave;o, l&agrave;m an ph&aacute;t d?t, gi&agrave;u sang ph&uacute; qu&yacute; lu&ocirc;n g&otilde; c?a gia d&igrave;nh ch? s? h?u.</p>

<p><img alt="Mai vàng d?y s?c xuân mang tài l?c vào nhà" src="https://cayvahoa.net/wp-content/uploads/2016/08/hoa-mai-vang-dep-3.jpg" style="width:500px" /></p>

<p>Kh&ocirc;ng ph?i ng?u nhi&ecirc;n m&agrave; con ngu?i Vi?t Nam l?i ch?n c&acirc;y mai t?t d? trang tr&iacute; v&agrave;o d?p l? t?t. B?i ch&iacute;nh d?o l&yacute;, th? hi?n ph?m ch?t cao qu&yacute; c?a con ngu?i cung nh?ng tr?i qua nhi?u thang tr?m c?a th?i gian h&igrave;nh tu?ng&nbsp;<strong>c&acirc;y mai v&agrave;ng</strong>&nbsp;cao qu&yacute; mang theo ch&acirc;n l&yacute; cao thu?ng c?a con ngu?i.</p>

<p>B? r? c&acirc;y mai v&agrave;ng c?m s&acirc;u v&agrave;o trong d?t, gi&uacute;p kh&ocirc;ng th? g?c ng&atilde; tru?c nh?ng gi&oacute; b&atilde;o, n?ng mua cung gi?ng nhu con ngu?i Vi?t Nam c&oacute; th? vu?t qua m?i kh&oacute; khan gian kh?, g&igrave;n gi? b?n s?c qu&ecirc; huong, d?o l&yacute; c?i ngu?n van h&oacute;a c?a d?t nu?c m&igrave;nh.</p>

<p><img alt="Mai vàng d?y s?c xuân mang tài l?c vào nhà" src="https://cayvahoa.net/wp-content/uploads/2016/08/hoa-mai-vang-dep-4.jpg" style="width:500px" /></p>

<p>Tru?c khi ra hoa th&igrave; c&acirc;y thu?ng du?c tr&uacute;t b? h?t nh?ng l&aacute; gi&agrave; c?i thay v&agrave;o d&oacute; l&agrave; nh?ng n? hoa v&agrave;ng ch?m n? c&ugrave;ng nh?ng chi?c l&aacute; xanh non mon m?n t?o n&ecirc;n m?t s?c s?ng m&atilde;nh li?t. Ð?c bi?t m&agrave;u c?a hoa mai c&oacute; m&agrave;u v&agrave;ng n&ecirc;n r?t n?i b?t, l&ocirc;i cu?n, thu h&uacute;t m?i &aacute;nh nh&igrave;n.&nbsp;<a href="https://cayvahoa.net/ban-cay-vang-mai-tet-dep-mang-tai-loc/%20%E2%80%8E"><strong>C&acirc;y</strong>&nbsp;<strong>mai v&agrave;ng</strong></a>&nbsp;kh&ocirc;ng ch? d?p mang v? cho ta gi&aacute; tr? cao trong th?m m?, tinh th?n m&agrave; c&ograve;n l&agrave; m?t trong nh?ng b&agrave;i thu?c d&ocirc;ng y m&agrave; &iacute;t ngu?i c&oacute; th? bi?t du?c. Ð&oacute; ch&iacute;nh l&agrave; nh? v&agrave;o nh?ng c&aacute;nh mai v&agrave;ng c&oacute; th? gi&uacute;p ti&ecirc;u h&oacute;a t?t, l&aacute; non c?a hoa d&ugrave;ng l&agrave;m rau d? an. Ngo&agrave;i ra di?u quan tr?ng ch&iacute;nh l&agrave; th&acirc;n v&agrave; r? c&acirc;y l?y v? c&acirc;y mai d? phoi kh&ocirc; ng&acirc;m ru?u s? d?ng t?t cho h? ti&ecirc;u h&oacute;a. R? c&acirc;y c&ograve;n l&agrave;m thu?c tr? m?t s? b?nh r?t hi?u qu?.</p>

<p><img alt="Mai vàng d?y s?c xuân mang tài l?c vào nhà" src="https://cayvahoa.net/wp-content/uploads/2016/08/hoa-mai-vang-dep-5.jpg" style="width:500px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (37, 14, N'Cây quất cảnh ngày tết', N'cay-quat-canh-tet.jpg', 250000, 0, N'Nét đặc trưng trong dịp tết nguyên đán của mỗi người dân Việt Nam đó là cây quất. Người ta chọn quất là loại cây để trưng bày trong ngày tết với mong muốn tài lộc, an khang, thịnh vượng,...', N'<p>N&eacute;t d?c trung trong d?p t?t nguy&ecirc;n d&aacute;n c?a m?i ngu?i d&acirc;n Vi?t Nam d&oacute; l&agrave;&nbsp;<strong>c&acirc;y qu?t</strong>. Ngu?i ta ch?n qu?t l&agrave; lo?i c&acirc;y d? trung b&agrave;y trong ng&agrave;y t?t v?i mong mu?n t&agrave;i l?c, an khang, th?nh vu?ng, kh?i d?u cho m?t nam m?i t?t l&agrave;nh, gi&uacute;p gia ch? gia tang t&agrave;i v?n v&agrave; mang l?i s? may m?n cho m?i ngu?i.</p>

<p><img alt="cay-quat-canh-tet" src="https://cayvahoa.net/wp-content/uploads/2016/09/cay-quat-canh-tet.jpg" style="height:375px; width:500px" /></p>

<p><strong>C&acirc;y qu?t nhu th? n&agrave;o th&igrave; du?c g?i l&agrave; d?p?</strong></p>

<p>Ð? ch?n m?t&nbsp;<a href="https://cayvahoa.net/ban-cay-quat-canh-ngay-tet-gia-re-cho-moi-nha/"><strong>c&acirc;y qu?t ng&agrave;y t?t&nbsp;</strong></a>du?c coi l&agrave; d?p th&igrave; n&oacute; c?n h?i d? 4 y?u t?: d&aacute;ng, qu?, l?c non v&agrave; hoa t?t c? d?u ph?i d?p. N?u c&oacute; di?u ki?n th&igrave; t?t nh?t b?n n&ecirc;n d?n t?n vu?n<strong>&nbsp;b&aacute;n c&acirc;y qu?t c?nh t?t</strong>&nbsp;v? tho?i m&aacute;i l?a ch?n v?i gi&aacute; c? h?p l&yacute;. Th?i di?m mua qu?t t?t nh?t l&agrave; t? 23 &acirc;m l?ch tr? di.</p>

<p>Qu?t c&oacute; d&aacute;ng d?p l&agrave; c&acirc;y c&oacute; d&aacute;ng t? nhi&ecirc;n, ch&uacute;ng kh&ocirc;ng b? g&ograve; &eacute;p, c&oacute; g?c c?ng v&agrave; th&acirc;n th?ng. L&aacute; qu?t v&agrave; qu? ph?i to, xanh b&oacute;ng, qu? kh&ocirc;ng c?n sai, nhung ph?i thua d?u v&agrave; d?y d? c&aacute;c lo?i qu? xanh v&agrave; ch&iacute;n tu?ng trung cho m?t gia d&igrave;nh d?m ?m, du? hu?. B?n nh? l?a ch?n th?t ki nh&eacute;, n?u th?y l&aacute; v&agrave;ng, kh&ocirc; h&eacute;o kh&ocirc;ng du?c mua v&igrave; khi d&oacute; c&acirc;y dang s?p ch?t, b?n mua v? s? r?ng l&aacute; v&agrave; qu? ngay l?p t?c.</p>

<p><img alt="cây qu?t ngày t?t3" src="https://cayvahoa.net/wp-content/uploads/2016/09/Kh%C3%B4ng-n%C3%AAn-ch%C6%B0ng-c%C3%A2y-%C4%91%C3%A0o-mai-qu%E1%BA%A5t-trong-nh%C3%A0-ng%C3%A0y-T%E1%BA%BFt-phunutoday_vn3.png" style="height:369px; width:435px" /></p>

<p>Khi d&atilde; l?a ch?n du?c c&acirc;y qu?t ung &yacute; b?n s? ti?n h&agrave;nh d&aacute;nh b?u qu?t d? v?n chuy?n v? nh&agrave;. B?n ph?i tuong d?i c?n th?n kh&ocirc;ng d? c&acirc;y d?, v? b?u. Vi?c ti?p theo l&agrave; chu?n b? m?t ch?u c&acirc;y ph&ugrave; h?p v?i qu?t. H&atilde;y l&oacute;t s? d? c&acirc;y d? tho&aacute;t nu?c b?n nh&eacute;. Th&aacute;o l?p t&uacute;i b&oacute;ng b?c b&ecirc;n ngo&agrave;i b?u sau d&oacute; cho v&agrave;o ch?u ch&egrave;n d?t d? gi? cho c&acirc;y d?ng th?ng. Sau d&oacute; l&agrave; tu?i nu?c d? ?m cho c&acirc;y.</p>

<p>Vi?c cu?i c&ugrave;ng l&agrave; ch? c?n trang tr&iacute; cho ch?u qu?t n?a l&agrave; xong. B?n c&oacute; th? mua nh?ng c&acirc;u d?i d? mini, nh?ng ch&ugrave;m d&egrave;n l?ng mini v?i ch? an khang, th?nh vu?ng g?n l&ecirc;n c&aacute;c c&agrave;nh nh? c?a c&acirc;y. Du?i ch?u b?n c&oacute; th? mua d&aacute; cu?i tr?ng ho?c c&aacute;c vi&ecirc;n d&atilde; v?i nhi?u m&agrave;u s?c b?t m?t x?p l&ecirc;n che ph?n d?t di.</p>

<p><img alt="cây qu?t ngày t?t2" src="https://cayvahoa.net/wp-content/uploads/2016/09/chung-quat-ngay-tet.jpg" style="height:333px; width:500px" /></p>

<p><strong>M?t s? kinh nghi?m c?a ngu?i choi c&acirc;y qu?t c?nh l&acirc;u nam</strong></p>

<p>B?n n&ecirc;n ch?n c&acirc;y m&agrave; c&aacute;c v?t d?ng t&acirc;m chua loang l?. Ph?i ch?n c&acirc;y to, xanh d?m v&agrave; b&oacute;ng mu?t. T&aacute;n c&acirc;y ph?i tr&ograve;n d?u v?i qu? d?u v&agrave; to. Ð?c bi?t c&acirc;y ph?i c&oacute; nhi?u l?c non v&agrave; hoa nh?.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (38, 12, N'Cây duối kiểng', N'ban-cay-duoi-kieng-gia-tri-cao-600x480.jpg', 499000, 0, N'Cây duối kiểng – Thế giới cây và hoa là nơi bán cây duối kiểng giá trị cao trên toàn quốc, được thực hiện bởi đội ngũ hơn 20 năm kinh nghiệm trong ngành phân phối cây giống. ', N'<p><strong><a href="https://cayvahoa.net/cay-duoi-kieng/">C&acirc;y du?i ki?ng</a>&nbsp;&ndash;&nbsp;</strong>Th? gi?i c&acirc;y v&agrave; hoa l&agrave; noi b&aacute;n c&acirc;y du?i ki?ng gi&aacute; tr? cao tr&ecirc;n to&agrave;n qu?c, du?c th?c hi?n b?i d?i ngu hon 20 nam kinh nghi?m trong ng&agrave;nh ph&acirc;n ph?i c&acirc;y gi?ng. Trong nh?ng nam g?n d&acirc;y nhi?u ngu?i dang san t&igrave;m c&acirc;y du?i ki?ng gi&aacute; tr? cao n?m b?t th?i th? d&aacute;p ?ng hi?u qu? nhu c?u c?a c&aacute;c gia ch?. Ch&uacute;ng t&ocirc;i d&atilde; kh&ocirc;ng ng?ng t&igrave;m t&ograve;i nh?ng gi?ng c&acirc;y c?nh, hoa ki?ng ch?t lu?ng mang d?n v? d?p cho kh&ocirc;ng gian.</p>

<p><strong>Ð?c t&iacute;nh n?i b?t:</strong></p>

<p>C&acirc;y du?i ki?ng hay thu?ng g?i l&agrave; du?i nh&aacute;m, du?i dai. ? m?i khu v?c c&oacute; t&ecirc;n g?i kh&aacute;c nhau. Tuy nhi&ecirc;n c&aacute;i t&ecirc;n g?i th&ocirc;ng d?ng nh?t v?n l&agrave; c&acirc;y du?i. Nghe c&aacute;i t&ecirc;n kh&ocirc;ng c&ograve;n xa l? v&igrave; c&acirc;y du?i d&atilde; c&oacute; t? r?t l&acirc;u d?i du?c nhi?u vua ch&uacute;a bi?t d?n, tru?c d&acirc;y ? nh?ng v&ugrave;ng qu&ecirc; thu?ng c&oacute; nh?ng r?ng du?i l&agrave;m h&agrave;ng r&agrave;o, t?o th? d&aacute;ng r?t d?p khi d?t ? tru?c c?ng hay c?a nh&agrave;, h&agrave;nh lang d?u r?t d?p.</p>

<p>Danh ph&aacute;p: Streblus asper</p>

<p>Ngu?n g?c: Xu?t hi?n ? v&ugrave;ng d?t kh&ocirc; c?a mi?n Ð&ocirc;ng Nam &Aacute;, Philippin, ?n Ð?, Hoa Nam</p>

<p>C&acirc;y du?i thu?c lo?i c&acirc;y m?c, c? trung b&igrave;nh, chi?u cao kho?ng 4m d?n 8m, t&aacute;n r?m, c&agrave;nh d&acirc;m ch&eacute;o nhau. Nh?ng chi?c l&aacute; c?a c&acirc;y du?i c&oacute; d?ng h&igrave;nh tr?ng nh?n v?i chi?u d&agrave;i kho?ng 3cm d?n 7cm, chi?u r?ng 1,5cm d?n 2,5cm. C&aacute;c m?t l&aacute; c&oacute; l&ocirc;ng nh&aacute;m khi s? c?m gi&aacute;c r&aacute;m tay.</p>

<p>C&acirc;y du?i ki?ng thu?c lo?i c&acirc;y m?c c&oacute; th&acirc;n m?m d? u?n n&ecirc;n ngu?i ta thu?ng ch?n l&agrave;m c&acirc;y c?nh u?n d&aacute;ng th? d?p, tu?i th? cao v&agrave; c&oacute; s?c s?ng m&atilde;nh li?t du?c ua chu?ng r?t cao cho nh?ng noi c&oacute; kh&ocirc;ng gian sang tr?ng. Ng&agrave;y nay khi ch&uacute;ng ta d?n nh?ng can bi?t th?, khu ngh? du?ng s? th?y du?c nh?ng c&acirc;y du?i ki?ng gi&aacute; tr? cao d?t ? g&oacute;c s&acirc;n vu?n, h&agrave;nh lang, c?ng ra v&agrave;o,&hellip;Ð&oacute; l&agrave; m?t ph?n c?a v? d?p trong kh&ocirc;ng gian s&acirc;n vu?n, m?t ph?n mang d?n s? may m?n, th?nh vu?ng cho gia ch?.</p>

<p><img alt="Cây du?i ki?ng giá tr? cao" src="https://cayvahoa.net/wp-content/uploads/ban-cay-duoi-kieng-gia-tri-cao.jpg" style="height:480px; width:640px" /></p>

<p>C&acirc;y du?i ki?ng gi&aacute; tr? cao</p>

<p><strong>B&aacute;n c&acirc;y du?i ki?ng gi&aacute; tr? cao&nbsp;</strong></p>

<p>M?t trong nh?ng gi?i ph&aacute;p gi&uacute;p kh&ocirc;ng gian tr? n&ecirc;n d?p hon, th&ocirc;ng tho&aacute;ng, m&aacute;t m? th&igrave; c&acirc;y c?nh l&agrave; xu hu?ng du?c thi?t k? gi&uacute;p kh&ocirc;ng gian s&acirc;n vu?n tr? n&ecirc;n tuoi d?p. Trong d&oacute; c&acirc;y du?i ki?ng l&agrave; m?t lo?i c&acirc;y c&oacute; s?c s?ng m&atilde;nh li?t, tu?i th? cao, th&acirc;n m?m c&oacute; th? u?n du?c nhi?u ki?u d&aacute;ng d?p gi&uacute;p cho nhi?u ngh? nh&acirc;n, ngh? si y&ecirc;u th&iacute;ch. ? hoa c?a du?i ki?ng c&oacute; n&eacute;t d?c trung l&agrave; don t&iacute;nh kh&aacute;c g?c ch? tr? hoa d?c ho?c hoa c&aacute;i. Nh?ng b&ocirc;ng hoa d?c c&oacute; h&igrave;nh c?u, s?c v&agrave;ng l?c, d&ocirc;i khi s? ng&atilde; sang m&agrave;u tr?ng. Hoa c&aacute;i th&igrave; c&oacute; m&agrave;u l?c, m?c l? ho?c t?ng c?p. Khi n? s? r?t thu h&uacute;t t&acirc;m m?t c?a ngu?i xem. N&oacute; t?o s? d?c d&aacute;o, m?i m? k?t h?p v?i d&aacute;ng c&acirc;y l&agrave;m n&ecirc;n kh&ocirc;ng gian c&oacute; gi&aacute; tr? cao c?p hon. Sau kho?ng th?i k&igrave; ra hoa c&acirc;y s? cho ra qu?, nh?ng qu? du?i c&oacute; h&igrave;nh tr?ng d?p, s?c v&agrave;ng n?i b?t v&agrave; qu? c?a ch&uacute;ng ch? to kho?ng 8mm d?n 10mm. Ch&uacute;ng c&oacute; v? ng?t khi ch&iacute;n. ? ph?n d&agrave;i l&aacute; l?n m?c l&ecirc;n bao quanh ph?n qu?. Nh&igrave;n t?ng th? s? r?t d?p, r?t d? l?y du?c s? y&ecirc;u th&iacute;ch c?a ngu?i nh&igrave;n ngay t? c&aacute;i nh&igrave;n d?u ti&ecirc;n.</p>

<p>C&acirc;y du?i ki?ng thu?ng du?c c&aacute;c k? su thi?t k? ki?n tr&uacute;c d?t nh?ng ch?u c&acirc;y c?nh v&agrave;o kh&ocirc;ng gian trang tr&iacute; ngo?i th?t. Gi&aacute; tr? c?a c&acirc;y du?i ki?ng cao b?i ch&uacute;ng c&oacute; d&aacute;ng bonsai d?p th&iacute;ch h?p v?i nh?ng can bi?t th?, khu ngh? du?ng hay gi?i ngh? si. S? y&ecirc;u th&iacute;ch tr?ng c&acirc;y c?nh khi th?y d&aacute;ng c&acirc;y du?i ki?ng kh&oacute; th? b? qua n&oacute; mang d?n m?t g&oacute;c nh&igrave;n ngh? thu?t d? b? thu h&uacute;t.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/ban-cay-duoi-kieng-gia-tri-cao-1.jpg" style="height:462px; width:618px" /></p>

<p>V?i g&oacute;c nh&igrave;n ngh? thu?t y&ecirc;u th&iacute;ch c&acirc;y c?nh th&igrave; kh&ocirc;ng th? b? qua n&eacute;t d?p c?a d&aacute;ng c&acirc;y bonsai du?i ki?ng. Hi?n nay, c&oacute; nh?ng c&acirc;y du?i ki?ng h&agrave;ng ngh&igrave;n nam tu?i v?i ki?u th? d&aacute;ng c&acirc;y r?t d?p v?n ngu?i m&ecirc; c&oacute; gi&aacute; tr? kinh t? r?t cao.</p>

<p>C&acirc;y du?i ki?ng dang n?i ti?ng l&agrave; m?t lo?i c&acirc;y c? th? s?ng h&agrave;ng tram nam tu?i, cao to v&agrave; d?t d?, t?o du?c nhi?u ki?u d&aacute;ng th? bonsai c?u k? v&agrave; d?p. M?t lo?i c&acirc;y kh&aacute; ph? bi?n v&agrave; ua chu?ng t?i Vi?t Nam.</p>

<p>Trong phong th?y th&igrave; c&acirc;y du?i mang l?i s? may m?n cho gia ch?. C&acirc;y c&oacute; s?c s?ng m&atilde;nh li?t th&iacute;ch nghi v?i di?u ki?n kh&iacute; h?u kh?c nghi?t, thu?ng &iacute;t c&oacute; s&acirc;u b?nh h?i, tu?i th? s?ng r?t cao,&hellip;theo quan ni?m phong th?y c?a d&acirc;n gian th&igrave; c&acirc;y du?i ki?ng c&ograve;n c&oacute; kh? nang tr? t&agrave; kh&iacute;, n?p ch&iacute;nh kh&iacute; t?t mang d?n s? an vui, th?nh vu?ng cho gia ch?. C&aacute;c nh&agrave; khoa h?c h? d&atilde; t&igrave;m th?y du?i du?c tr?ng ph? bi?n ? c&aacute;c di ch? c?, lang m? th?i H&ugrave;ng Vuong v&agrave; nh?ng noi sang tr?ng c?a cung vua ph? ch&uacute;a. Ngu?i ta c&ograve;n nh?c d?n du?i c? ? Ðu?ng L&acirc;m, Son T&acirc;y, H&agrave; N?i nhu m?t di t&iacute;ch c?a Ng&ocirc; Quy?n bu?c voi chi?n, ng?a chi?n sau m?i l?n t?p tr?n cho nh?ng cu?c chi?n d&aacute;nh du?i qu&acirc;n Nam H&aacute;n t?i c?a s&ocirc;ng B?ch Ð?ng du?c ch?m d?t ? 1000 nam B?c thu?c.</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/ban-cay-duoi-kieng-gia-tri-cao-2.jpg" style="height:450px; width:720px" /></p>

<p><strong>T&aacute;c d?ng c&acirc;y du?i trong y h?c</strong></p>

<p>Ngu?i ta d&atilde; ph&aacute;t hi?n t? r?, l&aacute;, th&acirc;n, c&agrave;nh cho d?n qu? c?a c&acirc;y du?i c&oacute; nh?ng v? thu?c qu&yacute; du?c nh?c d?n trong c? t&iacute;ch y ph&aacute;p d&acirc;n gian c?a danh y &rdquo; H?i Thu?ng L&atilde;n &Ocirc;ng L&ecirc; H?u Tr&aacute;c&rdquo;. Nhu ngu?i ta bi?t d?n du?i trong y h?c c? truy?n c&oacute; v? d?ng, t&iacute;nh m&aacute;t t&aacute;c d?ng l&agrave;m thanh nhi?t gi?i d?c, th&ocirc;ng huy?t, c?m m&aacute;u v&agrave; s&aacute;t khu?n. ? nhi?u khu v?c d&atilde; s? d?ng c&acirc;y du?i d? ch?a c&aacute;c lo?i b&ecirc;nh nhu: Ðau rang, ti&ecirc;u ch?y,&hellip;l?y v? c&acirc;y d? ch?a b?nh nhu: Phong th?p dau nh?c, s&acirc;u rang, dau b?ng, s?t&hellip;..</p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/ban-cay-duoi-kieng-gia-tri-cao-3.jpg" style="height:480px; width:601px" /></p>

<p>Nhu v?y, ch&uacute;ng ta bi?t c&acirc;y du?i ki?ng gi&aacute; tr? cao kh&ocirc;ng ch? c&oacute; t&aacute;c d?ng l&agrave;m c&acirc;y c?nh m&agrave; c&ograve;n c&oacute; nh?ng t&iacute;nh nang h?u &iacute;ch trong d?i s?ng. Cung ch&iacute;nh v&igrave; v?y, c&acirc;y du?i g?n li?n v?i d?i s?ng van h&oacute;a, t&acirc;m linh sinh ho?t thu?ng ng&agrave;y c?a ngu?i d&acirc;n b?i t? bao gi? ? c&aacute;c l&agrave;ng qu&ecirc; Vi?t Nam nh?ng r?ng du?i c? th? l&agrave; noi h?n h&ograve; c?a nh?ng d&ocirc;i trai g&aacute;i, noi che di c&aacute;i n?ng g?t kh?t khe cho ngu?i n&ocirc;ng d&acirc;n.</p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (39, 12, N'Cây vạn niên tùng', N'van-nien-tung-3.jpg', 599000, 0, N'Để tìm được một cây cảnh phong thủy đẹp để trang trí tại sảnh phòng khách hay sân vườn thêm uy nghi, trang hoàng thì việc chọn cây quả không là điều đơn giản.', N'<p>Ð? t&igrave;m du?c m?t c&acirc;y c?nh phong th?y d?p d? trang tr&iacute; t?i s?nh ph&ograve;ng kh&aacute;ch hay s&acirc;n vu?n th&ecirc;m uy nghi, trang ho&agrave;ng th&igrave; vi?c ch?n c&acirc;y qu? kh&ocirc;ng l&agrave; di?u don gi?n. Trong c&aacute;c lo?i c&acirc;y c?nh th&igrave; v?n ni&ecirc;n t&ugrave;ng v?i d&aacute;ng v? sang tr?ng, h&igrave;nh th&aacute;i d?p c&ugrave;ng v?i tu?i d?i s?ng l&acirc;u nam, c&acirc;y xanh tuoi quanh nam n&ecirc;n r?t ph&ugrave; h?p d? trang tr&iacute; n?i ngo?i th?t. Ð?n v?i c?a h&agrave;ng th? gi?i c&acirc;y v&agrave; hoa c&aacute;c b?n c&oacute; th? b?t g?p nh?ng ch?u c&acirc;y v?n ni&ecirc;n t&ugrave;ng v?i k&iacute;ch thu?c kh&aacute;c nhau, d? d&agrave;ng cho b?n t&igrave;m th?y m?t ch?u c&acirc;y ung &yacute; cho m&igrave;nh nh?t.</p>

<p><img alt="V?n niên tùng – Cây c?nh phong th?y d?p" src="https://cayvahoa.net/wp-content/uploads/2016/11/van-nien-tung-1.jpg" style="width:500px" /></p>

<p>V?n ni&ecirc;n t&ugrave;ng ? d&acirc;y du?c x?p v&agrave;o nh?ng lo?i c&acirc;y d?p v&agrave; dem d?n ngu?i tr?ng nhi?u &yacute; nghia kh&aacute;c nhau d?c bi?t v? m?t phong th?y. Ch&uacute;ng thu?c c&acirc;y th&acirc;n g? thu?ng s?ng l&acirc;u nam n&ecirc;n c&oacute; tu?i th? r?t cao, b?n c&oacute; th? t&igrave;m th?y ch&uacute;ng t?i nh?ng khu r?ng nhi?t d?i tr&ecirc;n n&uacute;i cao. L&aacute; c&acirc;y c&oacute; k&iacute;ch thu?c ng?n d&agrave;i kh&aacute;c nhau t&ugrave;y thu?c v&agrave;o di?u ki?n th?i ti?t, kh&iacute; h?u ?nh hu?ng d?n ch&uacute;ng, thu?ng l&aacute; c?a ch&uacute;ng c&oacute; h&igrave;nh kim v&agrave; m?c xen k? v?i nhau. G?c c&acirc;y to c&oacute; m&agrave;u n&acirc;u v&agrave; xanh th?m, ch&uacute;ng r?t kh?e m?nh v&agrave; xanh tuoi t?t quanh nam.</p>

<p><img alt="V?n niên tùng – Cây c?nh phong th?y d?p" src="https://cayvahoa.net/wp-content/uploads/2016/11/van-nien-tung-2.jpg" style="width:500px" /></p>

<p>Nhi?u ngu?i t&igrave;m v&agrave; s? d?ng lo?i c&acirc;y n&agrave;y d? l&agrave; ki?ng ho?c tr?ng bonsai v?i vi?c trang tr&iacute; n?i ngo?i th?t t&ugrave;y v&agrave;o s? th&iacute;ch c?a t?ng ngu?i. C&oacute; nhi?u c&acirc;y v?i tu?i d?i kh&aacute; cao v&agrave; gi&aacute; c?a c&acirc;y l&ecirc;n d?n b?c tri?u. Ð?i v?i nh?ng d?i gia ho?c nh?ng gia d&igrave;nh b? th? h? thu?ng t&igrave;m, san l&ugrave;ng lo?i c&acirc;y c&oacute; tu?i d?i cao d? trang tr&iacute; cho kh&ocirc;ng gian th&ecirc;m uy nghi, b? th? hon. V&igrave; sao lo?i c&acirc;y v?n ni&ecirc;n t&ugrave;ng l?i c&oacute; s?c h&uacute;t d?n nhi?u ngu?i nhu v?y? N?u n&oacute;i d?n b? ngo&agrave;i c?a c&acirc;y th&igrave; ch&uacute;ng kh&ocirc;ng k&eacute;m b?t c? lo?i c&acirc;y c?nh n&agrave;o m&agrave; c&ograve;n dem d?n s? sang tr?ng cho ngu?i s? h?u. Ngo&agrave;i ra th&ecirc;m m?t uu di?m n?a cho lo?i c&acirc;y n&agrave;y ch&iacute;nh l&agrave; &yacute; nghia c?a ch&uacute;ng mang l?i. Theo nhi?u ngu?i quan di?m, trong phong th?y, c&acirc;y v?n ni&ecirc;n t&ugrave;ng gi&uacute;p xua du?i t&agrave; ma, nh?ng di?u xui x?o, di?m d? ..d? mang d?n cho con ngu?i s? hung th?nh v&agrave; man m?n cho gia ch? d?ng th?i lu&ocirc;n dem v? s?c kh?e t?t cho gia d&igrave;nh du?c an to&agrave;n hon.</p>

<p><img alt="V?n niên tùng – Cây c?nh phong th?y d?p" src="https://cayvahoa.net/wp-content/uploads/2016/11/van-nien-tung-3.jpg" style="width:500px" /></p>

<p>Ð? c&oacute; th? cham s&oacute;c du?c c&acirc;y v?n ni&ecirc;n t&ugrave;ng d?p th&igrave; c?n ph?i bi?t d?n k? thu?t gieo tr?ng, cham s&oacute;c c&acirc;y d&uacute;ng c&aacute;ch. C&oacute; 2 c&aacute;ch tr?ng c&acirc;y l&agrave; tr?ng theo ki?u bonsai ho?c tr?ng trong ch?u ki?ng hay tr?ng c&ocirc;ng tr&igrave;nh. T&ugrave;y thu?c v&agrave;o m?c d&iacute;ch s? d?ng c?a b?n d? c&oacute; th? t&igrave;m ra c&aacute;ch tr?ng v&agrave; cham s&oacute;c c&acirc;y cho m&igrave;nh. Th&ocirc;ng thu?ng th&igrave; lo?i c&acirc;y n&agrave;y du?c tr?ng b?ng c&aacute;ch gi&acirc;m c&agrave;nh v&agrave; sau d&oacute; ph&aacute;t tri?n l&ecirc;n c&acirc;y m?i. Khi c&acirc;y d?t chi?u cao 80cm th&igrave; c&oacute; th? chuy?n ch?u ho?c tr?ng v&agrave;o noi d?t m?i.</p>

<p><img alt="V?n niên tùng – Cây c?nh phong th?y d?p" src="https://cayvahoa.net/wp-content/uploads/2016/11/van-nien-tung-4.jpg" style="width:500px" /></p>

<p>Ð? cham s&oacute;c v?n ni&ecirc;n t&ugrave;ng sao cho c&oacute; d&aacute;ng d?p, l&aacute; d?p d? th?n th&aacute;i ch&uacute;ng xu?t th?n lu&ocirc;n mang l?i s?c kh?e v&agrave; s? hung th?nh cho gia ch? th&igrave; c&aacute;c b?n c?n luu &yacute; m?t s? di?m nhu:</p>

<p>&ndash; Nu?c tu?i cho c&acirc;y c?n d?u d?n h?ng ng&agrave;y, tr&aacute;nh ng?p &uacute;ng tr&agrave;n nu?c ra kh?i ch?u.<br />
&ndash; Ch?n d?t tr?ng cho c&acirc;y ph?i toi x?p, gi&agrave;u ch?t dinh du?ng, tho&aacute;t nu?c t?t. N?u tr?ng c&acirc;y trong ch?u ph?i thu?ng xuy&ecirc;n b&oacute;n ph&acirc;n cho c&acirc;y d? cung c?p d? ch?t dinh du?ng cho c&acirc;y ph&aacute;t tri?n. C&oacute; th? b&oacute;n ph&acirc;n chu?ng ho?c ph&acirc;n NPK t&ugrave;y thu?c v&agrave;o nhu c?u s? d?ng c?a c&acirc;y.</p>

<p>Chung quy th&igrave; lo?i v?n ni&ecirc;n t&ugrave;ng n&agrave;y cung kh&ocirc;ng kh&oacute; cham s&oacute;c nhu d?i v?i c&aacute;c lo?i c&acirc;y bonsai th&igrave; c?n ph?i t?o h&igrave;nh kh&eacute;o l&eacute;o ngay t? l&uacute;c nh? d? d? d&agrave;ng u?n n?n h&igrave;nh d&aacute;ng c&acirc;y sao cho d?p nh?t.</p>

<p><img alt="V?n niên tùng – Cây c?nh phong th?y d?p" src="https://cayvahoa.net/wp-content/uploads/2016/11/van-nien-tung-5.jpg" style="width:500px" /></p>
', 10, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Name], [Image], [Price], [Discount], [ShortDescription], [ProductDetail], [Quantity], [Status]) VALUES (40, 12, N'Cây tùng la hán', N'4d068e093a14da4a8305-600x600.jpg', 300000, 0, N'Vẻ đẹp khí phách cũng như giá trị của cây tùng được nhắc đến trong một câu thơ rất hay.  Cây tùng la hán là cây cảnh được xếp vào những loại cây quý hiếm,...', N'<p>C&acirc;y T&ugrave;ng La H&aacute;n</p>

<p><em>&ldquo;T&ugrave;ng xanh c?t c&aacute;ch th?t thanh tao<br />
N?ng h?, tuy?t d&ocirc;ng ch?ng qu?n n&agrave;o<br />
H? ph&aacute;ch ngh&igrave;n nam gi&agrave;nh thu?c qu&yacute;<br />
B?n c&ugrave;ng h?c tr?ng v?i non cao&rdquo;</em></p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/4d068e093a14da4a8305.jpg" style="height:663px; width:497px" /></p>

<p>V? d?p kh&iacute; ph&aacute;ch cung nhu gi&aacute; tr? c?a c&acirc;y t&ugrave;ng du?c nh?c d?n trong m?t c&acirc;u tho r?t hay. &nbsp;<a href="https://cayvahoa.net/cay-tung-la-han/"><strong>C&acirc;y&nbsp;t&ugrave;ng la h&aacute;n</strong></a>&nbsp;l&agrave; c&acirc;y c?nh du?c x?p v&agrave;o nh?ng lo?i c&acirc;y qu&yacute; hi?m, trong nh?ng nam g?n d&acirc;y lo?i c&acirc;y t&ugrave;ng c&oacute; gi&aacute; tr? l?n, c&oacute; c&acirc;y l&ecirc;n d?n tr? gi&aacute; b?c t?. Du?ng nhu ng&agrave;y xua c&acirc;y t&ugrave;ng la h&aacute;n xu?t hi?n trong kh&ocirc;ng gian c?a nh?ng gia d&igrave;nh gi&agrave;u c&oacute;, qu&yacute; t?c d? th? hi?n s? uy nghi, b? th? c?a gia c?nh d?ng th?i lo?i c&acirc;y n&agrave;y c&oacute; linh kh&iacute; r?t t?t gi&uacute;p xua du?i t&agrave; ma, lo?i tr? c&aacute;c kh&iacute; d?c, dem d?n b&igrave;nh y&ecirc;n cho gia d&igrave;nh.</p>

<p><img alt="Nh?ng di?u chua bi?t v? tùng la hán" src="https://cayvahoa.net/wp-content/uploads/2016/11/tung-la-han-1.jpg" style="width:500px" /></p>

<p>T&ecirc;n g?i c?a&nbsp;<strong>c&acirc;y t&ugrave;ng la h&aacute;n&nbsp;</strong>b?t ngu?n t? ngu?i Trung Qu?c, h? d?a v&agrave;o h&igrave;nh ?nh tr&aacute;i c?a c&acirc;y t&ugrave;ng gi?ng nhu tu?ng ph?t La H&aacute;n n&ecirc;n ch&uacute;ng c&oacute; t&ecirc;n g?i nhu v?y. Hi?n nay vi?c tr?ng c&acirc;y c?nh c&agrave;ng tr? n&ecirc;n ph? bi?n hon, nhi?u ngu?i mu?n san l&ugrave;ng v&agrave; t&igrave;m mua nh?ng lo?i c&acirc;y d?c hi?m n&agrave;y d? th? hi?n d?ng c?p c?a m&igrave;nh. Ð?i v?i vi?c t&igrave;m mua c&acirc;y t&ugrave;ng la h&aacute;n th&igrave; c&aacute;c b?n n&ecirc;n c?n th?n nh?m l?n v?i c&acirc;y t&ugrave;ng v?n ni&ecirc;n. B?i nh?ng ngu?i chua c&oacute; kinh nghi?m v? c&acirc;y c?nh c&oacute; c&oacute; th? ph&acirc;n bi?t r&otilde; gi?a hai lo?i c&acirc;y n&agrave;y. Qua d&acirc;y ch&uacute;ng t&ocirc;i xin gi?i thi?u d?n cho c&aacute;c b?n m?t s? d?c di?m v? t&ugrave;ng la h&aacute;n d? c&aacute;c b?n hi?u r&otilde; hon v? lo?i c&acirc;y c?nh d?p n&agrave;y.</p>

<p><img alt="Nh?ng di?u chua bi?t v? tùng la hán" src="https://cayvahoa.net/wp-content/uploads/2016/11/tung-la-han-2.jpg" style="width:500px" /></p>

<p><strong>C&acirc;y t&ugrave;ng la h&aacute;n</strong>&nbsp;c&ograve;n g?i l&agrave; c&acirc;y th&ocirc;ng tre ch&uacute;ng m?c t? nhi&ecirc;n trong r?ng thu?c khu v?c nhi?t d?i sau n&agrave;y du?c tr?ng l&agrave;m c?nh v&agrave; ph&acirc;n b? nhi?u noi tr&ecirc;n th? gi?i v&agrave; trong c? nu?c Vi?t Nam. Th&acirc;n c&acirc;y c&oacute; m&agrave;u n&acirc;u t?i, l&aacute; m?c g?n d?i nhau, l&aacute; m?c d&agrave;y ? d?u c&agrave;nh c&oacute; h&igrave;nh b?u d?c d?ng lu?i m&aacute;c, m&agrave;u xanh l?c. T&ugrave;y v&agrave;o t?ng v&ugrave;ng c&oacute; di?u ki?n th?i ti?t kh&aacute;c nhau c&oacute; th? l&aacute; c?a c&acirc;y c&oacute; m&agrave;u d?. Th&ocirc;ng thu?ng c&acirc;y du?c nh&acirc;n gi?ng b?ng c&aacute;ch gi&acirc;m c&agrave;nh v&agrave; c&oacute; th? gieo tr?ng b?ng h?t nhu r?t l&acirc;u d? sinh tru?ng th&agrave;nh c&acirc;y l?n. C&acirc;y ua &aacute;nh s&aacute;ng, th&iacute;ch ?m v&agrave; th&acirc;n c&acirc;y d? u?n n?n n&ecirc;n d? d&agrave;ng trong vi?c t?o h&igrave;nh cho c&acirc;y. Nh? v&agrave;o d?c di?m n&agrave;y n&ecirc;n c&aacute;c ngh? nh&acirc;n c&acirc;y c?nh r?t mu?n th? s?c m&igrave;nh v?i c&acirc;y t&ugrave;ng la h&aacute;n n&agrave;y d? bi?n ch&uacute;ng th&agrave;nh nh?ng t&aacute;c ph?m ngh? thu?t d?c s?c nh?t.</p>

<p><img alt="Nh?ng di?u chua bi?t v? tùng la hán" src="https://cayvahoa.net/wp-content/uploads/2016/11/tung-la-han-3.jpg" style="width:500px" /></p>

<p>&Yacute; nghia&nbsp;<strong>c&acirc;y t&ugrave;ng la h&aacute;n</strong>&nbsp;r?t d?c bi?t khi?n nhi?u ngu?i mu?n s? h?u ri&ecirc;ng cho m&igrave;nh lo?i c&acirc;y d?p n&agrave;y. Theo quan ni?m c?a ngu?i xua cho r?ng lo?i c&acirc;y qu&yacute; n&agrave;y c&oacute; linh kh&iacute; r?t t?t b?i ch&uacute;ng c&oacute; th? s?ng h&agrave;ng tram nam tu?i, gi&uacute;p c?n gi&oacute; d?c, tr? ma qu?, xua du?i nh?ng di?u xui x?o d?n v?i gia d&igrave;nh. V?y n&ecirc;n khi tr?ng c&acirc;y c?n c&oacute; s? cham s&oacute;c t?t, k? c&agrave;ng d? gi&uacute;p c&acirc;y ph&aacute;t huy th? m?nh c?a m&igrave;nh dem d?n s? th?nh vu?ng, gi&agrave;u sang, vinh hoa, may m?n d?n cho gia ch?.</p>

<p>Ð?c di?m c?a c&acirc;y r?t d?c bi?t l&agrave; ch&uacute;ng &iacute;t bi?n d?i trong qu&aacute; tr&igrave;nh s?ng, ch&uacute;ng c?ng c?i v&agrave; b?n b? n&ecirc;n du?c v&iacute; nhu t? ch?t kh&iacute; ph&aacute;ch c?a ngu?i anh h&ugrave;ng, hi&ecirc;n ngang, b?t khu?t trong b?t c? tru?ng h?p n&agrave;o. La h&aacute;n t&ugrave;ng kh&ocirc;ng ch? l&agrave; m?t c&acirc;y c?nh ngo?i th?t d?p, ch&uacute;ng c&oacute; th? tr?ng trong vu?n nh&agrave; ho?c b?n c&oacute; th? th?y ? nh?ng khu di t&iacute;ch, noi c?nh quan ch&ugrave;a&hellip; Ngo&agrave;i ra trong ngh? thu?t c&aacute;c c&acirc;y bonsai th&igrave; lo?i c&acirc;y n&agrave;y cung tr? th&agrave;nh nh?ng t&aacute;c ph?m c?c l&ocirc;i cu?n l&ograve;ng ngu?i. V?i b&agrave;n tay ngh? nh&acirc;n th&igrave; lo?i&nbsp;<strong>t&ugrave;ng la h&aacute;n&nbsp;</strong>trong ngh? thu?t bon sai c&agrave;ng tr? n&ecirc;n tinh t? v&agrave; d?p hon bao gi? h?t.</p>

<p><img alt="Nh?ng di?u chua bi?t v? tùng la hán" src="https://cayvahoa.net/wp-content/uploads/2016/11/tung-la-han-4.jpg" style="width:500px" /></p>

<p><em>Ð? ch?n m?t c&acirc;y c?nh ph&ugrave; h?p v?i m&igrave;nh qu? l&agrave; di?u kh&ocirc;ng h? d?, b?n c&oacute; th? d?n v?i&nbsp;<strong>cayvahoa.net</strong>&nbsp;d? du?c tu v?n k? hon v? lo?i c&acirc;y n&agrave;y cung nhu v? gi&aacute; c? c?a c&acirc;y nh&eacute; c&aacute;c b?n!</em></p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/e3a38458c445241b7d54.jpg" style="height:526px; width:394px" />&nbsp;<img alt="" src="https://cayvahoa.net/wp-content/uploads/8161cd788d656d3b3474.jpg" style="height:523px; width:392px" /></p>

<p><img alt="" src="https://cayvahoa.net/wp-content/uploads/800b19a559b8b9e6e0a9.jpg" style="height:526px; width:395px" />&nbsp;<img alt="" src="https://cayvahoa.net/wp-content/uploads/648f2010600d8053d91c.jpg" style="height:528px; width:396px" /></p>

<p>H&igrave;nh ?nh m?t s? c&acirc;y t&ugrave;ng la h&aacute;n t?i vu?n</p>
', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (1, N'Cây nội thất - cây văn phòng')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (2, N'Cây trồng trong nhà')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (3, N'Cây phong thủy')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (4, N'Cây để bàn')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (9, N'Cây không khí')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (10, N'Cây chậu treo')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (11, N'Cây trồng trong nước')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (12, N'Cây cảnh nghệ thuật')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (13, N'Cây công trình')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (14, N'Cây cảnh nghày tết')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (15, N'Bonsai cây cảnh')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
INSERT [dbo].[Role] ([Code], [Name]) VALUES (N'ADMIN', N'Quản trị viên')
INSERT [dbo].[Role] ([Code], [Name]) VALUES (N'CLIENT', N'Khách hàng')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D10534B5AC7F16]    Script Date: 10/28/2021 8:23:50 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleCode])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[BillStatus]  WITH CHECK ADD FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SellingBonsai] SET  READ_WRITE 
GO
