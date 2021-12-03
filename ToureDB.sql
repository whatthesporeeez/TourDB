USE [master]
GO
/****** Object:  Database [TourAgentDB]    Script Date: 03.12.2021 15:44:20 ******/
CREATE DATABASE [TourAgentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourAgentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TourAgentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TourAgentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TourAgentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TourAgentDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourAgentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourAgentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourAgentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourAgentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourAgentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourAgentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourAgentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourAgentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourAgentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourAgentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourAgentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourAgentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourAgentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourAgentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourAgentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourAgentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourAgentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourAgentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourAgentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourAgentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourAgentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourAgentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourAgentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourAgentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TourAgentDB] SET  MULTI_USER 
GO
ALTER DATABASE [TourAgentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourAgentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourAgentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourAgentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TourAgentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TourAgentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TourAgentDB', N'ON'
GO
ALTER DATABASE [TourAgentDB] SET QUERY_STORE = OFF
GO
USE [TourAgentDB]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03.12.2021 15:44:20 ******/
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
/****** Object:  Table [dbo].[Hotel]    Script Date: 03.12.2021 15:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CountOfStars] [int] NULL,
	[CountryCode] [int] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 03.12.2021 15:44:21 ******/
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
/****** Object:  Table [dbo].[HotelImage]    Script Date: 03.12.2021 15:44:21 ******/
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
/****** Object:  Table [dbo].[Tour]    Script Date: 03.12.2021 15:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [int] NOT NULL,
	[TicketsCount] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](50) NOT NULL,
	[Price] [money] NULL,
	[IsActual] [bit] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 03.12.2021 15:44:21 ******/
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
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Tour] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Tour]
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
ALTER TABLE [dbo].[Type]  WITH CHECK ADD  CONSTRAINT [FK_Type_Tour] FOREIGN KEY([ID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[Type] CHECK CONSTRAINT [FK_Type_Tour]
GO
USE [master]
GO
ALTER DATABASE [TourAgentDB] SET  READ_WRITE 
GO
