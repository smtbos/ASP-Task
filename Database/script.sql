USE [master]
GO
/****** Object:  Database [Task]    Script Date: 05-07-2022 04:02:36 ******/
CREATE DATABASE [Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Task.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Task_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Task] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Task] SET  MULTI_USER 
GO
ALTER DATABASE [Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Task', N'ON'
GO
USE [Task]
GO
/****** Object:  Table [dbo].[city]    Script Date: 05-07-2022 04:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_state] [int] NULL,
	[city_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[state]    Script Date: 05-07-2022 04:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 05-07-2022 04:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[std_id] [int] IDENTITY(1,1) NOT NULL,
	[std_fname] [nvarchar](50) NULL,
	[std_lname] [nvarchar](50) NULL,
	[std_gender] [nvarchar](50) NULL,
	[std_contact] [nvarchar](50) NULL,
	[std_email] [nvarchar](50) NULL,
	[std_state] [int] NULL,
	[std_city] [int] NULL,
	[std_pin] [int] NULL,
	[std_username] [nvarchar](50) NULL,
	[std_password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[std_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (1, 1, N'Anantapur')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (2, 1, N'Chittoor')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (3, 1, N'Guntur')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (4, 1, N'Kadapa')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (5, 1, N'Krishna')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (6, 1, N'Kurnool')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (7, 2, N'Baksa')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (8, 2, N'Cachar')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (9, 2, N'Darrang')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (10, 2, N'Tezpur')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (11, 3, N'Aldona')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (12, 3, N'Arambol')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (13, 4, N'Ahmedabad')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (14, 4, N'Amreli')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (15, 4, N'Rajkot')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (16, 4, N'Vadodara')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (17, 4, N'Surat')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (18, 4, N'Morbi')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (19, 4, N'Banaskatha')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (20, 4, N'Lathi')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (21, 4, N'Hathigadh')
INSERT [dbo].[city] ([city_id], [city_state], [city_name]) VALUES (22, 4, N'Gandhinagar')
SET IDENTITY_INSERT [dbo].[city] OFF
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([state_id], [state_name]) VALUES (1, N'Andhra Pradesh')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (2, N'Assam')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (3, N'Goa')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (4, N'Gujarat')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (5, N'Haryana')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (6, N'Kerala')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (7, N'Madhya Pradesh')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (8, N'Odisha')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (9, N'Panjab')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (10, N'Tamil Nadu')
SET IDENTITY_INSERT [dbo].[state] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([std_id], [std_fname], [std_lname], [std_gender], [std_contact], [std_email], [std_state], [std_city], [std_pin], [std_username], [std_password]) VALUES (1, N'Smit', N'Bosamiya', N'Male', N'8128389164', N'smtbos@gmail.com', 4, 16, 365220, N'smtbos', N'123')
INSERT [dbo].[student] ([std_id], [std_fname], [std_lname], [std_gender], [std_contact], [std_email], [std_state], [std_city], [std_pin], [std_username], [std_password]) VALUES (3, N'Urmil', N'Rupareliya', N'Male', N'6355558644', N'urmil8989@gmail.com', 4, 21, 365222, N'urmil', N'urmil')
INSERT [dbo].[student] ([std_id], [std_fname], [std_lname], [std_gender], [std_contact], [std_email], [std_state], [std_city], [std_pin], [std_username], [std_password]) VALUES (4, N'Smit', N's', N'Male', N'', N'', 0, 0, 0, N'urmil', N'urmil')
SET IDENTITY_INSERT [dbo].[student] OFF
USE [master]
GO
ALTER DATABASE [Task] SET  READ_WRITE 
GO
