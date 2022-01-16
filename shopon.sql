CREATE DATABASE db_Shopon;
GO

USE [db_Shopon]
GO
/****** Object:  Table [dbo].[category]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[categoryid] [int] IDENTITY(2001,1) NOT NULL,
	[categoryname] [varchar](20) NULL CONSTRAINT [DF__category__catego__1A14E395]  DEFAULT (NULL),
 CONSTRAINT [PK__category__23CDE5905F7AC13D] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[companyid] [int] IDENTITY(1000,1) NOT NULL,
	[companyname] [varchar](20) NULL CONSTRAINT [DF__company__company__1CF15040]  DEFAULT (NULL),
	[companystatus] [char](1) NULL,
 CONSTRAINT [PK__company__AD5755B89D886FF5] PRIMARY KEY CLUSTERED 
(
	[companyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[customer](
	[customerid] [int] NOT NULL,
	[customername] [varchar](20) NULL DEFAULT (NULL),
	[mobileno] [varchar](10) NULL DEFAULT (NULL),
	[emailid] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customeraddress]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customeraddress](
	[customeraddressid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NOT NULL,
	[stName] [varchar](100) NULL,
	[city] [varchar](30) NULL,
	[state] [varchar](30) NULL,
 CONSTRAINT [PK_customeraddress] PRIMARY KEY CLUSTERED 
(
	[customeraddressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[log]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log](
	[tablename] [varchar](20) NULL,
	[msg] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orderd]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderd](
	[orderid] [int] NOT NULL,
	[orderstatusid] [int] NULL CONSTRAINT [DF__orderd__ordersta__25869641]  DEFAULT (NULL),
	[orderdate] [date] NULL CONSTRAINT [DF__orderd__orderdat__267ABA7A]  DEFAULT (NULL),
	[customerid] [int] NOT NULL,
	[customeraddressid] [int] NULL,
	[totalamount] [float] NULL,
 CONSTRAINT [PK__orderd__080E377597C3AC66] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderitem]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderitem](
	[orderitemid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL CONSTRAINT [DF__orderitem__order__31EC6D26]  DEFAULT (NULL),
	[qty] [int] NULL CONSTRAINT [DF__orderitem__qty__32E0915F]  DEFAULT (NULL),
	[amount] [float] NULL,
	[productid] [int] NULL CONSTRAINT [DF__orderitem__pid__33D4B598]  DEFAULT (NULL),
 CONSTRAINT [PK_orderitem] PRIMARY KEY CLUSTERED 
(
	[orderitemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderstatus]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orderstatus](
	[orderstatusid] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_orderstatus] PRIMARY KEY CLUSTERED 
(
	[orderstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[product](
	[productid] [int] NOT NULL,
	[productname] [varchar](20) NULL DEFAULT (NULL),
	[price] [float] NULL DEFAULT (NULL),
	[companyid] [int] NULL DEFAULT (NULL),
	[categoryid] [int] NULL DEFAULT (NULL),
	[availablestatus] [char](1) NULL DEFAULT (NULL)
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[product] ADD [imageUrl] [varchar](50) NULL
PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productrating]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productrating](
	[productratingid] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[rating] [nchar](10) NULL,
 CONSTRAINT [PK_productrating] PRIMARY KEY CLUSTERED 
(
	[productratingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stock]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[sohid] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NOT NULL CONSTRAINT [DF__stock__pid__37A5467C]  DEFAULT (NULL),
	[soh] [int] NULL CONSTRAINT [DF__stock__soh__38996AB5]  DEFAULT (NULL),
 CONSTRAINT [PK_stock] PRIMARY KEY CLUSTERED 
(
	[sohid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test]    Script Date: 08-02-2018 15:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[salary] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (2001, N'IOS')
INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (2002, N'Android')
INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (2003, N'Windows')
INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (2004, N'BlackBerry')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1001, N'APPLE', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1002, N'BLACKBERRY', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1003, N'LENOVO', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1004, N'GIONEE', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1005, N'INTEX', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1006, N'MICROMAX', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1007, N'SAMSUNG', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1008, N'MOTO', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1009, N'NOKIA', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1010, N'VIVO', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1011, N'XIOMI', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1012, N'YU', N'Y')
INSERT [dbo].[company] ([companyid], [companyname], [companystatus]) VALUES (1013, N'Xolo', N'Y')
SET IDENTITY_INSERT [dbo].[company] OFF
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (1, N'Amrutha', N'9493611244', N'amruthamandala@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (2, N'Goutham', N'7676484448', N'gouthamreddy@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (3, N'Ravi', N'8956247897', N'ravikanth@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (4, N'Kiranmai', N'789635241', N'kiranmai@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (5, N'Ravi', N'9896345244', N'ravi@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (6, N'Sandeep', N'9896374512', N'sandeep@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (7, N'Rajesh', N'9493617895', N'rajesh@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (8, N'Naresh', N'8963521478', N'naresh@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (9, N'Manoj', N'9127896578', N'manoj@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (10, N'Meghna', N'945936245', N'Meghna@gmail.com')
INSERT [dbo].[customer] ([customerid], [customername], [mobileno], [emailid]) VALUES (11, N'Mahesh', N'9127896578', N'Mahesh@gmail.com')
SET IDENTITY_INSERT [dbo].[customeraddress] ON 

INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (1, 1, N'JP Nagar', N'Bangalore', N'Karnataka')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (2, 2, N'RT Nagar', N'Bangalore', N'Karnataka')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (3, 3, N'BG Road', N'Bangalore', N'Karnataka')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (4, 4, N'Marhthy Nagar', N'Durg', N'Chattisghad')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (5, 5, N'Amerpet', N'Hydrabad', N'AP')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (6, 6, N'Hudson Circle', N'Bangalore', N'Karnataka')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (7, 7, N'Sultanpet', N'Durg', N'Chattisghad')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (8, 8, N'Garibpet', N'Hydrabad', N'AP')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (9, 9, N'Sector 10', N'Bhailai', N'Chattisghad')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (10, 10, N'Sector 9', N'Bhailai', N'Chattisghad')
INSERT [dbo].[customeraddress] ([customeraddressid], [customerid], [stName], [city], [state]) VALUES (11, 11, N'Maruthy Nagar', N'Bhailai', N'Chattisghad')
SET IDENTITY_INSERT [dbo].[customeraddress] OFF
INSERT [dbo].[log] ([tablename], [msg]) VALUES (N'Company', N'Violation of PRIMARY')
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (1, 1, CAST(N'2013-02-02' AS Date), 1, 1, 85099)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (2, 1, CAST(N'2013-02-03' AS Date), 1, 1, 100196)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (3, 1, CAST(N'2013-02-03' AS Date), 2, 2, 70300)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (4, 1, CAST(N'2013-02-03' AS Date), 2, 2, 50899)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (5, 1, CAST(N'2013-02-04' AS Date), 2, 2, 36872)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (6, 1, CAST(N'2013-02-04' AS Date), 3, 3, 83578)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (7, 1, CAST(N'2013-02-04' AS Date), 3, 3, 137736)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (8, 1, CAST(N'2013-02-05' AS Date), 3, 3, 114187)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (9, 1, CAST(N'2013-02-06' AS Date), 4, 4, 44641)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (10, 1, CAST(N'2013-02-07' AS Date), 4, 4, 91197)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (11, 1, CAST(N'2013-02-09' AS Date), 4, 4, 402006)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (12, 1, CAST(N'2013-02-22' AS Date), 4, 4, 114973)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (13, 1, CAST(N'2013-02-25' AS Date), 4, 4, 33998)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (14, 1, CAST(N'2013-03-06' AS Date), 5, 5, 45399)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (15, 1, CAST(N'2013-04-09' AS Date), 5, 5, 43500)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (16, 1, CAST(N'2013-05-02' AS Date), 5, 5, 18499)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (17, 1, CAST(N'2013-05-02' AS Date), 6, 6, 29099)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (18, 1, CAST(N'2013-06-02' AS Date), 6, 6, 9499)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (19, 1, CAST(N'2013-06-02' AS Date), 7, 7, 5915)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (20, 1, CAST(N'2013-06-02' AS Date), 7, 7, 9999)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (21, 1, CAST(N'2013-08-02' AS Date), 7, 7, 202024)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (22, 1, CAST(N'2013-08-02' AS Date), 8, 8, 58099)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (23, 1, CAST(N'2013-12-02' AS Date), 8, 8, 45399)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (24, 1, CAST(N'2013-12-02' AS Date), 1, 1, 25699)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (25, 1, CAST(N'2013-12-02' AS Date), 2, 2, 12399)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (26, 1, CAST(N'2014-01-02' AS Date), 11, 11, 9999)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (27, 1, CAST(N'2014-02-02' AS Date), 11, 11, 120689)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (28, 1, CAST(N'2014-02-02' AS Date), 4, 4, 44438)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (29, 1, CAST(N'2014-02-02' AS Date), 9, 9, 36399)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (30, 1, CAST(N'2014-06-12' AS Date), 9, 9, 53898)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (31, 1, CAST(N'2014-06-23' AS Date), 9, 9, 130456)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (32, 1, CAST(N'2014-06-23' AS Date), 8, 8, 128337)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (33, 1, CAST(N'2014-07-12' AS Date), 8, 8, 92399)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (34, 1, CAST(N'2014-07-13' AS Date), 7, 7, 65637)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (35, 1, CAST(N'2014-08-25' AS Date), 7, 7, 27999)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (36, 1, CAST(N'2014-08-27' AS Date), 7, 7, 13899)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (37, 1, CAST(N'2014-08-23' AS Date), 6, 6, 26900)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (38, 1, CAST(N'2014-12-14' AS Date), 6, 6, 34890)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (39, 1, CAST(N'2014-12-15' AS Date), 6, 6, 18900)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (40, 1, CAST(N'2014-12-16' AS Date), 7, 7, 27389)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (41, 1, CAST(N'2014-12-17' AS Date), 7, 7, 90587)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (42, 1, CAST(N'2014-12-18' AS Date), 7, 7, 98895)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (43, 1, CAST(N'2014-12-20' AS Date), 7, 7, 36186)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (44, 1, CAST(N'2014-12-20' AS Date), 8, 8, 18516)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (45, 1, CAST(N'2014-12-20' AS Date), 8, 8, 16089)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (46, 1, CAST(N'2014-12-22' AS Date), 8, 8, 5349)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (47, 1, CAST(N'2014-12-22' AS Date), 11, 11, 56067)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (48, 1, CAST(N'2014-12-22' AS Date), 1, 1, 19089)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (49, 1, CAST(N'2018-01-19' AS Date), 1, 1, 0)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (50, 1, CAST(N'2018-01-19' AS Date), 1, 1, 0)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (51, 1, CAST(N'2018-01-19' AS Date), 1, 1, 0)
INSERT [dbo].[orderd] ([orderid], [orderstatusid], [orderdate], [customerid], [customeraddressid], [totalamount]) VALUES (52, 1, CAST(N'2018-01-19' AS Date), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[orderitem] ON 

INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (155, 1, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (156, 1, 1, NULL, 2)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (157, 1, 1, NULL, 9)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (158, 2, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (159, 2, 1, NULL, 8)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (160, 2, 2, NULL, 19)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (161, 3, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (162, 3, 1, NULL, 23)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (163, 4, 1, NULL, 23)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (164, 4, 1, NULL, 12)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (165, 5, 1, NULL, 42)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (166, 5, 1, NULL, 10)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (167, 5, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (168, 6, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (169, 6, 1, NULL, 22)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (170, 6, 1, NULL, 43)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (171, 6, 1, NULL, 41)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (172, 7, 1, NULL, 34)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (173, 7, 1, NULL, 31)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (174, 7, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (175, 7, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (176, 7, 1, NULL, 92)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (177, 7, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (178, 8, 1, NULL, 13)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (179, 8, 1, NULL, 31)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (180, 8, 1, NULL, 30)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (181, 8, 1, NULL, 98)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (182, 8, 1, NULL, 51)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (183, 8, 1, NULL, 10)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (184, 8, 1, NULL, 61)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (185, 9, 1, NULL, 71)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (186, 9, 1, NULL, 12)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (187, 9, 1, NULL, 73)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (188, 9, 1, NULL, 12)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (189, 9, 1, NULL, 91)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (190, 9, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (191, 10, 1, NULL, 98)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (192, 10, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (193, 10, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (194, 10, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (195, 11, 1, NULL, 64)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (196, 11, 1, NULL, 2)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (197, 11, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (198, 11, 1, NULL, 28)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (199, 11, 1, NULL, 93)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (200, 11, 1, NULL, 17)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (201, 11, 1, NULL, 2)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (202, 11, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (203, 11, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (204, 12, 1, NULL, 30)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (205, 12, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (206, 12, 1, NULL, 56)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (207, 12, 1, NULL, 41)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (208, 12, 1, NULL, 44)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (209, 12, 1, NULL, 34)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (210, 12, 1, NULL, 17)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (211, 13, 1, NULL, 56)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (212, 13, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (213, 14, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (214, 14, 1, NULL, 13)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (215, 15, 1, NULL, 18)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (216, 16, 1, NULL, 13)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (217, 17, 1, NULL, 81)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (218, 17, 1, NULL, 91)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (219, 17, 1, NULL, 99)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (220, 18, 1, NULL, 96)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (221, 19, 1, NULL, 61)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (222, 20, 1, NULL, 50)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (223, 21, 1, NULL, 98)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (224, 21, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (225, 21, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (226, 22, 1, NULL, 91)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (227, 22, 1, NULL, 99)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (228, 22, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (229, 23, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (230, 23, 1, NULL, 8)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (231, 24, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (232, 25, 1, NULL, 40)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (233, 26, 1, NULL, 50)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (234, 27, 1, NULL, 32)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (235, 27, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (236, 27, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (237, 27, 1, NULL, 22)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (238, 28, 1, NULL, 22)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (256, 28, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (257, 29, 1, NULL, 33)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (258, 29, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (259, 30, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (260, 30, 1, NULL, 20)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (261, 31, 1, NULL, 34)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (262, 31, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (263, 31, 1, NULL, 99)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (264, 31, 1, NULL, 98)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (265, 31, 1, NULL, 100)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (266, 31, 1, NULL, 1)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (267, 32, 1, NULL, 33)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (268, 32, 1, NULL, 29)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (269, 32, 1, NULL, 18)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (270, 32, 1, NULL, 100)
GO
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (271, 32, 1, NULL, 17)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (272, 33, 1, NULL, 11)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (273, 33, 1, NULL, 99)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (274, 33, 1, NULL, 98)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (275, 33, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (276, 34, 1, NULL, 98)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (277, 34, 1, NULL, 18)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (278, 35, 1, NULL, 19)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (279, 36, 1, NULL, 20)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (280, 37, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (281, 38, 1, NULL, 22)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (282, 39, 1, NULL, 32)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (283, 40, 1, NULL, 33)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (284, 40, 1, NULL, 29)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (285, 41, 1, NULL, 32)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (286, 41, 1, NULL, 30)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (287, 41, 1, NULL, 21)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (288, 42, 1, NULL, 24)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (289, 43, 1, NULL, 25)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (290, 44, 1, NULL, 26)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (291, 45, 1, NULL, 27)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (292, 46, 1, NULL, 28)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (293, 47, 1, NULL, 29)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (294, 48, 1, NULL, 30)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (295, 48, 1, NULL, 35)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (296, 48, 1, NULL, 36)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (297, 47, 2, NULL, 38)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (298, 47, 2, NULL, 39)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (299, 47, 1, NULL, 40)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (300, 45, 1, NULL, 41)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (301, 44, 1, NULL, 42)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (302, 43, 1, NULL, 43)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (303, 43, 2, NULL, 44)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (304, 42, 2, NULL, 45)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (305, 42, 3, NULL, 46)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (306, 41, 2, NULL, 45)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (307, 31, 2, NULL, 49)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (308, 21, 1, NULL, 50)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (309, 21, 1, NULL, 51)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (310, 21, 1, NULL, 52)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (311, 11, 1, NULL, 53)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (312, 11, 1, NULL, 54)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (313, 11, 1, NULL, 53)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (314, 21, 3, NULL, 63)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (315, 31, 2, NULL, 78)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (316, 41, 1, NULL, 83)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (317, 41, 1, NULL, 94)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (318, 34, 1, NULL, 85)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (319, 44, 1, NULL, 84)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (322, 49, 2, 92950, 6)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (323, 50, 2, 25102, 90)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (324, 51, 2, 25102, 90)
INSERT [dbo].[orderitem] ([orderitemid], [orderid], [qty], [amount], [productid]) VALUES (325, 52, 2, 25102, 90)
SET IDENTITY_INSERT [dbo].[orderitem] OFF
SET IDENTITY_INSERT [dbo].[orderstatus] ON 

INSERT [dbo].[orderstatus] ([orderstatusid], [status]) VALUES (1, N'Open')
INSERT [dbo].[orderstatus] ([orderstatusid], [status]) VALUES (2, N'Dispatched')
INSERT [dbo].[orderstatus] ([orderstatusid], [status]) VALUES (3, N'Delivered')
INSERT [dbo].[orderstatus] ([orderstatusid], [status]) VALUES (4, N'Returned')
SET IDENTITY_INSERT [dbo].[orderstatus] OFF
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (1, N'Apple I-Pad Mini', 25700, 1001, 2001, N'Y', N'images/Apple/01.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (2, N'Apple I-Phone 4s', 28901, 1001, 2001, N'Y', N'images/Apple/02.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (3, N'Apple I-Phone 5s', 38270, 1001, 2001, N'Y', N'images/Apple/03.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (4, N'Apple I-Phone 6sPlus', 74000, 1001, 2001, N'Y', N'images/Apple/04.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (5, N'Apple I-Phone 6s', 46475, 1001, 2001, N'Y', N'images/Apple/05.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (6, N'Moto Nexus 6', 46475, 1008, 2002, N'Y', N'images/Moto/06.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (7, N'Motorola Gen 3', 12500, 1008, 2002, N'Y', N'images/Moto/07.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (8, N'Motorola X', 18500, 1008, 2002, N'Y', N'images/Moto/08.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (9, N'BlackBerry Classic', 30501, 1002, 2004, N'Y', N'images/BB/09.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (10, N'BlackBerry Leap', 21326, 1002, 2004, N'Y', N'images/BB/10.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (11, N'BlackBerry Passport', 40000, 1002, 2004, N'Y', N'images/BB/11.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (12, N'Nokia Lumia 735', 7500, 1009, 2003, N'Y', N'images/Nokia/12.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (13, N'Nokia Lumia 930', 18500, 1009, 2003, N'Y', N'images/Nokia/13.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (14, N'Nokia X1', 18491, 1009, 2003, N'Y', N'images/Nokia/14.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (15, N'Nokia X Plus', 4981, 1009, 2003, N'Y', N'images/Nokia/15.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (16, N'Samsung Galaxy J1', 6399, 1007, 2002, N'Y', N'images/Samsung/16.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (17, N'Samsung Galaxy Note5', 47901, 1007, 2002, N'Y', N'images/Samsung/17.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (18, N'Samsung Note Edge', 43501, 1007, 2002, N'Y', N'images/Samsung/18.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (19, N'Samsung Galaxy S6E', 28000, 1007, 2002, N'Y', N'images/Samsung/19.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (20, N'Samsung Galaxy On7', 13900, 1007, 2002, N'Y', N'images/Samsung/20.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (21, N'Samsung Galaxy S6', 26901, 1007, 2002, N'Y', N'images/Samsung/21.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (22, N'Samsung GalaxyS6Edge', 34891, 1007, 2002, N'Y', N'images/Samsung/22.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (23, N'Samsung Galaxy S7', 43401, 1007, 2002, N'Y', N'images/Samsung/23.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (24, N'Samsung Galaxy S7E', 45401, 1007, 2002, N'Y', N'images/Samsung/24.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (25, N'Micromax Canvas 6', 14000, 1006, 2002, N'Y', N'images/Micromax/25.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (26, N'Micromax CanvaJuice4', 5300, 1006, 2002, N'Y', N'images/Micromax/26.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (27, N'Gionee F103', 12000, 1004, 2002, N'Y', N'images/Gionee/27.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (28, N'Gionee P5 mini', 5350, 1004, 2002, N'Y', N'images/Gionee/28.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (29, N'Gionee S6s', 17891, 1004, 2002, N'Y', N'images/Gionee/29.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (30, N'Gionee G3', 10001, 1004, 2002, N'Y', N'images/Gionee/30.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (31, N'Vivo V3', 13700, 1010, 2002, N'Y', N'images/Vivo/31.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (32, N'Vivo V3 max', 18901, 1010, 2002, N'Y', N'images/Vivo/32.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (33, N'Vivo y51L', 9500, 1010, 2002, N'Y', N'images/Vivo/33.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (34, N'Vivo Y31', 8991, 1010, 2002, N'Y', N'images/Vivo/34.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (35, N'Micromax Bolt Selfie', 5500, 1006, 2002, N'Y', N'images/Micromax/35.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (36, N'Micromax Canvas P290', 3591, 1006, 2002, N'Y', N'images/Micromax/36.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (37, N'Micromax Bling', 4951, 1006, 2002, N'Y', N'images/Micromax/37.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (38, N'Micromax CanvasSpark', 4200, 1006, 2002, N'Y', N'images/Micromax/38.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (39, N'Micromax Yureka Plus', 8691, 1006, 2002, N'Y', N'images/Micromax/39.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (40, N'Micromax Canvas Play', 12400, 1006, 2002, N'Y', N'images/Micromax/40.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (41, N'Intex Aqua Q7 Pro', 4091, 1005, 2002, N'Y', N'images/Intex/41.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (42, N'Intex Aqua Power 2', 6000, 1005, 2002, N'Y', N'images/Intex/42.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (43, N'Intex Aqua Ring', 4600, 1005, 2002, N'Y', N'images/Intex/43.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (44, N'Intex Aqua Ace', 8795, 1005, 2002, N'Y', N'images/Intex/44.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (45, N'Intex Aqua Extreme 2', 6500, 1005, 2002, N'Y', N'images/Intex/45.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (46, N'Lenovo Vibe K5 Note', 13500, 1003, 2002, N'Y', N'images/Lenovo/46.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (47, N'Lenovo Vibe X3', 24998, 1003, 2002, N'Y', N'images/Lenovo/47.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (48, N'Lenovo Vibe K4 Note', 11000, 1003, 2002, N'Y', N'images/Lenovo/48.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (49, N'Lenovo A1000', 3991, 1003, 2002, N'Y', N'images/Lenovo/49.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (50, N'Lenovo A7000', 10000, 1003, 2002, N'Y', N'images/Lenovo/50.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (51, N'Apple iphone SE', 30000, 1001, 2001, N'Y', N'images/Apple/51.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (52, N'Apple iphone 7plus', 80000, 1001, 2001, N'Y', N'images/Apple/52.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (53, N'Apple iphone 8', 86000, 1001, 2001, N'Y', N'images/Apple/53.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (54, N'Samsung GalaxyGPrime', 8800, 1007, 2002, N'Y', N'images/Samsung/54.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (55, N'Moto g2', 7800, 1008, 2002, N'Y', N'images/Moto/55.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (56, N'Moto g3', 8300, 1008, 2002, N'Y', N'images/Moto/56.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (57, N'Samsung GalaxyNote-4', 26300, 1007, 2002, N'Y', N'images/Samsung/57.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (58, N'Samsung GalaxyNote-6', 48300, 1007, 2002, N'Y', N'images/Samsung/58.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (59, N'Samsung galaxy On-7', 13201, 1007, 2002, N'Y', N'images/Samsung/59.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (60, N'Samsung galaxyJ7-pro', 20701, 1007, 2002, N'Y', N'images/Samsung/60.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (61, N'Moto-C-Starry', 5916, 1008, 2002, N'Y', N'images/Moto/61.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (62, N'Moto-C-Plus', 6996, 1008, 2002, N'Y', N'images/Moto/62.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (63, N'Moto-E4', 5911, 1008, 2002, N'Y', N'images/Moto/63.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (64, N'Moto-Z', 24916, 1008, 2002, N'Y', N'images/Moto/64.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (65, N'Moto-G5-plus', 16000, 1008, 2002, N'Y', N'images/Moto/65.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (66, N'Moto-E-4th gen', 8800, 1008, 2002, N'Y', N'images/Moto/66.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (67, N'Moto-G-play', 8986, 1008, 2002, N'Y', N'images/Moto/67.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (68, N'Nolkia-lumia-630', 4400, 1009, 2003, N'Y', N'images/Nokia/68.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (69, N'Nokia-216', 2556, 1009, 2003, N'Y', N'images/Nokia/69.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (70, N'Nokia-230', 4546, 1009, 2003, N'Y', N'images/Nokia/70.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (71, N'Nokia-CS', 6556, 1009, 2003, N'Y', N'images/Nokia/71.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (72, N'Micromax-X605', 1506, 1006, 2002, N'Y', N'images/Micromax/72.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (73, N'Micromax-Vdeo 3', 6191, 1006, 2002, N'Y', N'images/Micromax/73.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (74, N'Micromax-Vdeo 2', 4506, 1006, 2002, N'Y', N'images/Micromax/74.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (75, N'Micromax Can.Spark-3', 4371, 1006, 2002, N'Y', N'images/Micromax/75.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (76, N'Micromax-Q326 Plus', 3100, 1006, 2002, N'Y', N'images/Micromax/76.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (77, N'Micromax CanvasNitro', 6441, 1006, 2002, N'Y', N'images/Micromax/77.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (78, N'Micromax Can.Nitro4G', 6371, 1006, 2002, N'Y', N'images/Micromax/78.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (79, N'Micromax-X071', 1971, 1006, 2002, N'Y', N'images/Micromax/79.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (80, N'Micromax-318', 2271, 1006, 2002, N'Y', N'images/Micromax/80.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (81, N'Redmi Note 4-32GB', 11000, 1011, 2002, N'Y', N'images/XioMi/81.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (82, N'Redmi Note 4-64GB', 12100, 1011, 2002, N'Y', N'images/XioMi/82.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (83, N'Yu Yunique 2', 12100, 1012, 2002, N'Y', N'images/Yu/83.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (84, N'Redmi 4A Duos Dual', 7219, 1011, 2002, N'Y', N'images/XioMi/84.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (85, N'redmi note prime 4G', 7388, 1011, 2002, N'Y', N'images/XioMi/85.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (86, N'Redmi 4A Duos-16GB', 7203, 1011, 2002, N'Y', N'images/XioMi/86.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (87, N'Redmi 4A Gold 4G', 8500, 1011, 2002, N'Y', N'images/XioMi/87.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (88, N'Redmi 4', 10500, 1011, 2002, N'Y', N'images/XioMi/88.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (89, N'Redmi Note 3', 11100, 1011, 2002, N'Y', N'images/XioMi/89.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (90, N'Redmi 4 Dual 64GB', 12551, 1011, 2002, N'Y', N'images/XioMi/90.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (91, N'Redmi 4A Dual', 7351, 1011, 2002, N'Y', N'images/XioMi/91.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (92, N'Redmi 4A Grey 16GB', 9351, 1011, 2002, N'Y', N'images/XioMi/92.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (93, N'Redmi Note3 GOLD', 10000, 1011, 2002, N'Y', N'images/XioMi/93.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (94, N'Redmi 3S Prime', 9691, 1011, 2002, N'Y', N'images/XioMi/94.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (95, N'Redmi Note4Black64GB', 14000, 1011, 2002, N'Y', N'images/XioMi/95.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (96, N'Redmi 4 Gold', 9500, 1011, 2002, N'Y', N'images/XioMi/96.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (97, N'Redmi Note 4 Gold', 12271, 1011, 2002, N'Y', N'images/XioMi/97.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (98, N'Redmi 4 4GB', 14751, 1011, 2002, N'Y', N'images/XioMi/98.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (99, N'Redmi 3S Prime Gold', 10751, 1011, 2002, N'Y', N'images/XioMi/99.jpg')
INSERT [dbo].[product] ([productid], [productname], [price], [companyid], [categoryid], [availablestatus], [imageUrl]) VALUES (100, N'Redmi 4X', 9549, 1011, 2002, N'Y', N'images/XioMi/100.jpg')
GO
SET IDENTITY_INSERT [dbo].[productrating] ON 

INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (101, 1, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (102, 2, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (103, 3, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (104, 4, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (105, 5, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (106, 6, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (107, 7, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (108, 8, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (109, 9, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (110, 10, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (111, 11, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (112, 12, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (113, 13, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (114, 14, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (115, 15, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (116, 16, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (117, 17, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (118, 18, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (119, 19, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (120, 20, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (121, 21, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (122, 22, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (123, 23, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (124, 24, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (125, 25, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (126, 26, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (127, 27, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (128, 28, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (129, 29, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (130, 30, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (131, 31, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (132, 32, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (133, 33, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (134, 34, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (135, 35, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (136, 36, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (137, 37, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (138, 38, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (139, 39, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (140, 40, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (141, 41, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (142, 42, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (143, 43, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (144, 44, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (145, 45, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (146, 46, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (147, 47, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (148, 48, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (149, 49, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (150, 50, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (151, 51, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (152, 52, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (153, 53, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (154, 54, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (155, 55, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (156, 56, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (157, 57, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (158, 58, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (159, 59, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (160, 60, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (161, 61, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (162, 62, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (163, 63, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (164, 64, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (165, 65, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (166, 66, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (167, 67, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (168, 68, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (169, 69, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (170, 70, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (171, 71, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (172, 72, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (173, 73, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (174, 74, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (175, 75, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (176, 76, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (177, 77, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (178, 78, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (179, 79, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (180, 80, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (181, 81, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (182, 82, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (183, 83, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (184, 84, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (185, 85, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (186, 86, N'5         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (187, 87, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (188, 88, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (189, 89, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (190, 90, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (191, 91, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (192, 92, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (193, 93, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (194, 94, N'2         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (195, 95, N'1         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (196, 96, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (197, 97, N'3         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (198, 98, N'4         ')
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (199, 99, N'3         ')
GO
INSERT [dbo].[productrating] ([productratingid], [productid], [rating]) VALUES (200, 100, N'3         ')
SET IDENTITY_INSERT [dbo].[productrating] OFF
SET IDENTITY_INSERT [dbo].[stock] ON 

INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (358, 1, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (359, 2, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (360, 3, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (361, 4, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (362, 5, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (363, 6, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (364, 7, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (365, 8, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (366, 9, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (367, 10, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (368, 11, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (369, 12, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (370, 13, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (371, 14, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (372, 15, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (373, 16, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (374, 17, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (375, 18, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (376, 19, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (377, 20, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (378, 21, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (379, 22, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (380, 23, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (381, 24, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (382, 25, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (383, 26, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (384, 27, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (385, 28, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (386, 29, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (387, 30, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (388, 31, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (389, 32, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (390, 33, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (391, 34, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (392, 35, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (393, 36, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (394, 37, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (395, 38, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (396, 39, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (397, 40, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (398, 41, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (399, 42, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (400, 43, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (401, 44, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (402, 45, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (403, 46, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (404, 47, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (405, 48, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (406, 49, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (407, 50, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (408, 51, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (409, 52, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (410, 53, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (411, 54, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (412, 55, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (413, 56, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (414, 57, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (415, 58, 5)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (416, 59, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (417, 60, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (418, 61, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (419, 62, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (420, 63, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (421, 64, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (422, 65, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (423, 66, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (424, 67, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (425, 68, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (426, 69, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (427, 70, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (428, 71, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (429, 72, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (430, 73, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (431, 74, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (432, 75, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (433, 76, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (434, 77, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (435, 78, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (436, 79, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (437, 80, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (438, 81, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (439, 82, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (440, 83, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (441, 84, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (442, 85, 7)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (443, 86, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (444, 87, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (445, 88, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (446, 89, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (447, 90, 0)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (448, 91, 2)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (449, 92, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (450, 93, 4)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (451, 94, 3)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (452, 95, 9)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (453, 96, 6)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (454, 97, 1)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (455, 98, 8)
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (456, 99, 4)
GO
INSERT [dbo].[stock] ([sohid], [productid], [soh]) VALUES (457, 100, 4)
SET IDENTITY_INSERT [dbo].[stock] OFF
SET IDENTITY_INSERT [dbo].[test] ON 

INSERT [dbo].[test] ([id], [name], [salary]) VALUES (12, N'AAA', 200.0000)
INSERT [dbo].[test] ([id], [name], [salary]) VALUES (14, N'AAA', 2000.0000)
INSERT [dbo].[test] ([id], [name], [salary]) VALUES (15, N'AAA', 2200.0000)
INSERT [dbo].[test] ([id], [name], [salary]) VALUES (17, N'AAA', 1200.0000)
INSERT [dbo].[test] ([id], [name], [salary]) VALUES (18, N'AAA', 200.0000)
SET IDENTITY_INSERT [dbo].[test] OFF
ALTER TABLE [dbo].[customeraddress]  WITH CHECK ADD  CONSTRAINT [fkcstid] FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([customerid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[customeraddress] CHECK CONSTRAINT [fkcstid]
GO
ALTER TABLE [dbo].[orderd]  WITH CHECK ADD  CONSTRAINT [FK_cust_address] FOREIGN KEY([customeraddressid])
REFERENCES [dbo].[customeraddress] ([customeraddressid])
GO
ALTER TABLE [dbo].[orderd] CHECK CONSTRAINT [FK_cust_address]
GO
ALTER TABLE [dbo].[orderd]  WITH CHECK ADD  CONSTRAINT [FK_orderd_status] FOREIGN KEY([orderstatusid])
REFERENCES [dbo].[orderstatus] ([orderstatusid])
GO
ALTER TABLE [dbo].[orderd] CHECK CONSTRAINT [FK_orderd_status]
GO
ALTER TABLE [dbo].[orderd]  WITH CHECK ADD  CONSTRAINT [pkcsid] FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([customerid])
GO
ALTER TABLE [dbo].[orderd] CHECK CONSTRAINT [pkcsid]
GO
ALTER TABLE [dbo].[orderitem]  WITH CHECK ADD  CONSTRAINT [FK_order] FOREIGN KEY([orderid])
REFERENCES [dbo].[orderd] ([orderid])
GO
ALTER TABLE [dbo].[orderitem] CHECK CONSTRAINT [FK_order]
GO
ALTER TABLE [dbo].[orderitem]  WITH CHECK ADD  CONSTRAINT [FK_pid] FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([productid])
GO
ALTER TABLE [dbo].[orderitem] CHECK CONSTRAINT [FK_pid]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fkcatid] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([categoryid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fkcatid]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fkcid] FOREIGN KEY([companyid])
REFERENCES [dbo].[company] ([companyid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fkcid]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [fksohid] FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([productid])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [fksohid]
GO
