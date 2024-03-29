USE [master]
GO
/****** Object:  Database [Kitchen]    Script Date: 12-Sep-19 2:44:38 PM ******/
CREATE DATABASE [Kitchen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kitchen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2\MSSQL\DATA\Kitchen.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kitchen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2\MSSQL\DATA\Kitchen_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Kitchen] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kitchen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kitchen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kitchen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kitchen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kitchen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kitchen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kitchen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kitchen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kitchen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kitchen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kitchen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kitchen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kitchen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kitchen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kitchen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kitchen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kitchen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kitchen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kitchen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kitchen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kitchen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kitchen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kitchen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kitchen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kitchen] SET  MULTI_USER 
GO
ALTER DATABASE [Kitchen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kitchen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kitchen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kitchen] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Kitchen] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Kitchen]
GO
/****** Object:  Table [dbo].[Admin_Login]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin_Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[MenuName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Details]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Ingredients] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Food]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Food](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Ingredients] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_AddFood]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_AddFood]
@MenuName varchar(50),
@Description varchar(50),
@Ingredients varchar(50),
@Category varchar(50),
@Price int
as
begin
insert into Food values(@MenuName,@Description,@Ingredients,@Category,@Price)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteFood]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[usp_DeleteFood]
@Id int
as
begin
delete from Food where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_FOOD]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_FOOD]
as begin
select * from Food
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateFood]    Script Date: 12-Sep-19 2:44:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_UpdateFood]
@Id int,
@MenuName varchar(50),
@Description varchar(50),
@Ingredients varchar(50),
@Category varchar(50),
@Price int
as
begin
update Food 
set MenuName=@MenuName, Description=@Description,Ingredients=@Ingredients,Category=@Category,Price=@Price
where Id=@Id
end

GO
USE [master]
GO
ALTER DATABASE [Kitchen] SET  READ_WRITE 
GO
