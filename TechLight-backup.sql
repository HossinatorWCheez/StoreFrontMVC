/****** Object:  StoredProcedure [dbo].[sprocUpdateProd]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sprocUpdateProd]
GO
/****** Object:  StoredProcedure [dbo].[sprocProductSearch]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sprocProductSearch]
GO
/****** Object:  StoredProcedure [dbo].[sprocNewProd]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sprocNewProd]
GO
/****** Object:  StoredProcedure [dbo].[sprocDeleteProd]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sprocDeleteProd]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Vendors]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Statuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_RaidStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductOrders]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductOrders] DROP CONSTRAINT IF EXISTS [FK_ProductOrders_Products]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductOrders]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductOrders] DROP CONSTRAINT IF EXISTS [FK_ProductOrders_Orders]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT IF EXISTS [FK_Orders_Customers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT IF EXISTS [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT IF EXISTS [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
/****** Object:  Table [dbo].[Traders]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[Traders]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[Statuses]
GO
/****** Object:  Table [dbo].[RaidStatuses]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[RaidStatuses]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductOrders]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductOrders]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[Orders]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[Customers]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoleClaims]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/10/2024 10:19:58 PM ******/
DROP TABLE IF EXISTS [dbo].[__EFMigrationsHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDesc] [varchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](128) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[AccountLvl] [int] NULL,
	[AccountRegion] [varchar](50) NULL,
	[AccountRep] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](128) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrders]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrders](
	[ProductOrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_ProductOrders] PRIMARY KEY CLUSTERED 
(
	[ProductOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[ProductDesc] [varchar](max) NULL,
	[UnitsInStock] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[TraderID] [int] NULL,
	[RaidStatusID] [int] NULL,
	[ProductImage] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaidStatuses]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaidStatuses](
	[RaidStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RaidStatusDesc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_RaidStatuses] PRIMARY KEY CLUSTERED 
(
	[RaidStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDesc] [varchar](250) NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traders]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traders](
	[TraderID] [int] IDENTITY(1,1) NOT NULL,
	[TraderName] [varchar](100) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Phone] [varchar](24) NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[TraderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.25')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'93a3d83c-480e-483c-b16d-bb7783d53e90', N'Admin', N'ADMIN', N'29ef1ca3-b989-42f4-b963-de666aedfda7')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a05ce825-b0cd-45be-be1d-5694400b16d3', N'93a3d83c-480e-483c-b16d-bb7783d53e90')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dbcff8b0-2904-4ea4-9dcf-d76ac06c99bb', N'93a3d83c-480e-483c-b16d-bb7783d53e90')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a05ce825-b0cd-45be-be1d-5694400b16d3', N'ethanjames.aa@outlook.com', N'ETHANJAMES.AA@OUTLOOK.COM', N'ethanjames.aa@outlook.com', N'ETHANJAMES.AA@OUTLOOK.COM', 1, N'AQAAAAEAACcQAAAAECrAEoaZX9Syh9liiq9rQX2kzypZkoGHBsh9ByVJN2UD7f/q68uVVRH97rE4xG+nKg==', N'BHRI7IST5PI6ECXQNQ74NSUGUICWIJLN', N'928e9195-bada-4bc2-8e70-366acdf72836', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dbcff8b0-2904-4ea4-9dcf-d76ac06c99bb', N'ethanjames.aa@gmail.com', N'ETHANJAMES.AA@GMAIL.COM', N'ethanjames.aa@gmail.com', N'ETHANJAMES.AA@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAELnTKtFq0Y32yJ0Kph3Wu6fiaH6SxpxBhZTXHSgmN9fDMiFrg6qNXtLxq9+uYh0D8g==', N'VNQ47O22K3ZQR5BD2WRGOUK4LSNTSU52', N'61547945-dde2-456a-bc12-cc3e84efe1db', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ed1310f3-8bd9-4319-b4f9-37e94ef7f1e3', N'user@example.com', N'USER@EXAMPLE.COM', N'user@example.com', N'USER@EXAMPLE.COM', 1, N'AQAAAAEAACcQAAAAEIVf83hzZZ6QqZe+QAJS9xmHIOfbTehYjYiVR6AAm3Ni6bK8flYBHwBJy/hdlifNuA==', N'BNOETBAOPE2CFA4COFAX3PXGLBCDU77Y', N'fcf20c6b-34e1-4b84-9925-d174ae45c025', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (1, N'Medical', N'Medical item used for healing')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (2, N'Weapon', N'Used to handle any problems that may occur')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (3, N'Gear', N'utility clothing and armors')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (4, N'Valueable', N'Rare items with high value ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([CustomerID], [Username], [AccountLvl], [AccountRegion], [AccountRep]) VALUES (N'dbcff8b0-2904-4ea4-9dcf-d76ac06c99bb', N'Hossinator', 57, N'NA', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([CustomerID], [Username], [AccountLvl], [AccountRegion], [AccountRep]) VALUES (N'ed1310f3-8bd9-4319-b4f9-37e94ef7f1e3', N'Big Hoss', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Username]) VALUES (1, N'ed1310f3-8bd9-4319-b4f9-37e94ef7f1e3', CAST(N'2024-04-03T15:34:33.123' AS DateTime), N'Big Hoss')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Username]) VALUES (2, N'ed1310f3-8bd9-4319-b4f9-37e94ef7f1e3', CAST(N'2024-04-03T15:38:50.227' AS DateTime), N'Big Hoss')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Username]) VALUES (3, N'dbcff8b0-2904-4ea4-9dcf-d76ac06c99bb', CAST(N'2024-04-03T15:42:53.047' AS DateTime), N'Hossinator')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Username]) VALUES (4, N'ed1310f3-8bd9-4319-b4f9-37e94ef7f1e3', CAST(N'2024-04-07T21:23:01.190' AS DateTime), N'Big Hoss')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOrders] ON 

INSERT [dbo].[ProductOrders] ([ProductOrderID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 1, 59999.0000)
INSERT [dbo].[ProductOrders] ([ProductOrderID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 9, 1, 50000000.0000)
INSERT [dbo].[ProductOrders] ([ProductOrderID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 1, 4, 59999.0000)
INSERT [dbo].[ProductOrders] ([ProductOrderID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 3, 1, 5, 59999.0000)
INSERT [dbo].[ProductOrders] ([ProductOrderID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (5, 4, 10, 1, 85000.0000)
INSERT [dbo].[ProductOrders] ([ProductOrderID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 4, 1, 1, 59999.0000)
SET IDENTITY_INSERT [dbo].[ProductOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (1, N'AK-74M', 59999.0000, N'Assault Rifle', 50, 1, 2, 7, 2, N'b55a015b-9946-40da-a58a-6f22fe4f9479.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (2, N'M1A', 80000.0000, N'Designated Marksman Rifle', 30, 1, 2, 6, 2, N'e293c201-07f0-4e2a-bf50-2d891a3cce7a.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (3, N'Shroud Mask', 22000.0000, N'Protective mask', 100, 1, 3, 5, 1, N'aa5a97ea-245e-4b82-ba60-4d94d4feefa5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (4, N'Salewa First Aid Kit', 24000.0000, N'Medical kit', 0, 3, 1, 5, 2, N'd2cc2866-08ea-404b-bff0-c7ee17567c7d.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (5, N'Graphics Card', 800000.0000, N'PC component', 5, 1, 4, 5, 1, N'7bb74c44-3c56-45d6-bc9b-cccf1c9da8f1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (6, N'Blackrock Chest Rig', 45000.0000, N'Tactical vest', 10, 1, 3, 8, 2, N'770b3c26-e59a-4b6b-b3d4-6f4340a26fe8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (7, N'CMS Kit', 30000.0000, N'Medical tool', 15, 3, 1, 5, 2, N'cf5c75bb-5c1d-4f0a-aefd-8996987a587b.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (8, N'Factory Key', 100000.0000, N'Key for the Factory map', 0, 4, 4, 5, 1, N'4b9dc15e-fbb3-494a-81d7-aad45080844e.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (9, N'Lab Card (Red)', 50000000.0000, N'Access card for the Lab map', 5, 1, 4, 5, 1, N'7b4a3892-3a5a-4167-9926-234f85359209.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [ProductDesc], [UnitsInStock], [StatusID], [CategoryID], [TraderID], [RaidStatusID], [ProductImage]) VALUES (10, N'Tetriz Portable Game', 85000.0000, N'Electronic device', 80, 1, 4, 5, 1, N'3d154652-6ac9-4be3-bace-b4aa8ab69e02.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RaidStatuses] ON 

INSERT [dbo].[RaidStatuses] ([RaidStatusID], [RaidStatusDesc]) VALUES (1, N'Product Is Found In Raid')
INSERT [dbo].[RaidStatuses] ([RaidStatusID], [RaidStatusDesc]) VALUES (2, N'Product Is Not Found In Raid')
SET IDENTITY_INSERT [dbo].[RaidStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([StatusID], [StatusName], [StatusDesc]) VALUES (1, N'In Stock', N'This product is in stock and available for purchase')
INSERT [dbo].[Statuses] ([StatusID], [StatusName], [StatusDesc]) VALUES (2, N'Out of Stock', N'This product is out of stock and cannot be purchased')
INSERT [dbo].[Statuses] ([StatusID], [StatusName], [StatusDesc]) VALUES (3, N'Back Order', N'This product is on order and waiting to be stocked')
INSERT [dbo].[Statuses] ([StatusID], [StatusName], [StatusDesc]) VALUES (4, N'Discontinued', N'This product is no longer offered')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Traders] ON 

INSERT [dbo].[Traders] ([TraderID], [TraderName], [Address], [City], [State], [Zip], [Phone]) VALUES (5, N'Therapist', N'123 Main St', N'Anytown', N'CA', N'90210', N'(813) 348-9864')
INSERT [dbo].[Traders] ([TraderID], [TraderName], [Address], [City], [State], [Zip], [Phone]) VALUES (6, N'Mechanic', N'456 Elm St', N'Smallville', N'NY', N'10001', N'(913) 354-6854')
INSERT [dbo].[Traders] ([TraderID], [TraderName], [Address], [City], [State], [Zip], [Phone]) VALUES (7, N'Prapor', N'789 Oak Ave', N'Suburbia', N'TX', N'75001', N'(620) 684-3541')
INSERT [dbo].[Traders] ([TraderID], [TraderName], [Address], [City], [State], [Zip], [Phone]) VALUES (8, N'Ragman', N'101 Pine Ln', N'Countryside', N'FL', N'33123', N'(352) 684-9677')
SET IDENTITY_INSERT [dbo].[Traders] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[ProductOrders] CHECK CONSTRAINT [FK_ProductOrders_Orders]
GO
ALTER TABLE [dbo].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrders_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductOrders] CHECK CONSTRAINT [FK_ProductOrders_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_RaidStatuses] FOREIGN KEY([RaidStatusID])
REFERENCES [dbo].[RaidStatuses] ([RaidStatusID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_RaidStatuses]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Statuses]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Vendors] FOREIGN KEY([TraderID])
REFERENCES [dbo].[Traders] ([TraderID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Vendors]
GO
/****** Object:  StoredProcedure [dbo].[sprocDeleteProd]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sprocDeleteProd](
	@productid INT)
AS
BEGIN
	DELETE Products
	WHERE ProductID = @productid
END 
GO
/****** Object:  StoredProcedure [dbo].[sprocNewProd]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sprocNewProd](
    @productname VARCHAR(100), @price MONEY, @productdesc VARCHAR(MAX) = NULL, @unitsinstock int, @statusid int, @categoryid int, @traderid int = NULL, @raidstatusid int = NULL, @productimage VARCHAR(100) = NULL)
AS
BEGIN
    INSERT dbo.Products
    VALUES (@productname, @price, @productdesc, @unitsinstock, @statusid, @categoryid, @traderid, @raidstatusid, @productimage);
END
GO
/****** Object:  StoredProcedure [dbo].[sprocProductSearch]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sprocProductSearch] (@search_string VARCHAR(250))
AS
BEGIN
	SELECT p.ProductID, p.ProductName, p.ProductDesc, c.CategoryName
	FROM Products p
		JOIN Categories c ON p.CategoryID = c.CategoryID
	WHERE p.ProductName LIKE CONCAT('%', @search_string, '%')
END;
GO
/****** Object:  StoredProcedure [dbo].[sprocUpdateProd]    Script Date: 4/10/2024 10:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sprocUpdateProd](
	@productid INT, @productname VARCHAR(100), @productdesc VARCHAR(MAX), @price MONEY)
AS
BEGIN
	UPDATE Products
	SET ProductName = @productname, ProductDesc = @productdesc, Price = @price
	WHERE ProductId = @productid
END
GO
