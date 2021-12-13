USE [TourAgentDB]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 13.12.2021 16:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CountOfStars] [int] NULL,
	[CountryCode] [int] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[ID] [int] NOT NULL,
	[HotelID] [int] NULL,
	[Text] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[ID] [int] NOT NULL,
	[HotelID] [int] NULL,
	[ImageSource] [varbinary](50) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TicketsCount] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[ImagePreview] [varbinary](50) NULL,
	[Price] [money] NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourOfHotel]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourOfHotel](
	[HotelID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_TourOfHotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 13.12.2021 16:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TypeID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (1, N'Dominican Republic')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (2, N'Russia')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (3, N'Australia')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (4, N'Bolivia')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (5, N'China')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (6, N'Costa Rica')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (7, N'Egypt')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (8, N'Hawaii')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (9, N'Monaco')
INSERT [dbo].[Country] ([CountryCode], [Name]) VALUES (10, N'Portugal')
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([HotelID], [Name], [CountOfStars], [CountryCode]) VALUES (1, N'Фо сизн', 5, 5)
INSERT [dbo].[Hotel] ([HotelID], [Name], [CountOfStars], [CountryCode]) VALUES (2, N'de Monaco', 4, 2)
INSERT [dbo].[Hotel] ([HotelID], [Name], [CountOfStars], [CountryCode]) VALUES (3, N'HawaiNavaii', 5, 8)
INSERT [dbo].[Hotel] ([HotelID], [Name], [CountOfStars], [CountryCode]) VALUES (4, N'Kenguru', 5, 7)
INSERT [dbo].[Hotel] ([HotelID], [Name], [CountOfStars], [CountryCode]) VALUES (5, N'Kizaru', 5, 9)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
INSERT [dbo].[HotelComment] ([ID], [HotelID], [Text], [Author], [CreateDate]) VALUES (1, 1, N'Отель кайфец', N'Ананда Цынгуев', CAST(N'2010-12-26' AS Date))
INSERT [dbo].[HotelComment] ([ID], [HotelID], [Text], [Author], [CreateDate]) VALUES (2, 2, N'В отеле было очень приятно, спасибо!', N'Вячеслав смирнов', CAST(N'2021-06-18' AS Date))
INSERT [dbo].[HotelComment] ([ID], [HotelID], [Text], [Author], [CreateDate]) VALUES (3, 3, N'Отель не понравился.', N'Антон Мареев', CAST(N'2020-05-20' AS Date))
INSERT [dbo].[HotelComment] ([ID], [HotelID], [Text], [Author], [CreateDate]) VALUES (4, 4, N'Все гуд 10/10/10', N'Антон Збаровский', CAST(N'2015-07-15' AS Date))
INSERT [dbo].[HotelComment] ([ID], [HotelID], [Text], [Author], [CreateDate]) VALUES (5, 5, N'Не приеду больше в этот отель', N'Марина Малинова', CAST(N'2018-07-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (1, 10, N'Тур по Азии', N'Замечательный тур по азии по заманчивой цене', NULL, 90000.0000, 1)
INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (2, 0, N'Сибирь!', N'Тур по красивой сибири!', NULL, 50000.0000, 0)
INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (3, 2, N'Гаваи!', N'Цены ниже не будет!', NULL, 100000.0000, 1)
INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (4, 50, N'Тур по Египту', N'Егопит все включегл', NULL, 70000.0000, 1)
INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (5, 4, N'Монако!', N'Езжай на формулу скорее!', NULL, 110000.0000, 1)
INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (7, 2, N'Гипер тур', N'Супер пупер индийский мотив', NULL, 60000.0000, 1)
INSERT [dbo].[Tour] ([ID], [TicketsCount], [Name], [Description], [ImagePreview], [Price], [IsActual]) VALUES (8, 50, N'Проходной тур', N'Самый дешевый для всей семьи', NULL, 50000.0000, 1)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (1, N'Азия', N'Крутой тур по Азии')
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (2, N'Сибирь', N'Горы, оттыдх, медведи')
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (3, N'Гаваи', N'Ром и тусовки до утра')
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (4, N'Египет', N'Курим сигареты кемл вместе со свинксом')
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (5, N'Монако', N'Формула 1, дорого богато')
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[TourOfHotel]  WITH CHECK ADD  CONSTRAINT [FK_TourOfHotel_Hotel1] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[TourOfHotel] CHECK CONSTRAINT [FK_TourOfHotel_Hotel1]
GO
ALTER TABLE [dbo].[TourOfHotel]  WITH CHECK ADD  CONSTRAINT [FK_TourOfHotel_Tour1] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[TourOfHotel] CHECK CONSTRAINT [FK_TourOfHotel_Tour1]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
