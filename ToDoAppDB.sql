USE [master]
GO
/****** Object:  Database [ToDoApp]    Script Date: 18/09/2020 10:19:34 am ******/
CREATE DATABASE [ToDoApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToDoApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ToDoApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToDoApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ToDoApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ToDoApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToDoApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToDoApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToDoApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToDoApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToDoApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToDoApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToDoApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToDoApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToDoApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToDoApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToDoApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToDoApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToDoApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToDoApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToDoApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToDoApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToDoApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToDoApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToDoApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToDoApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToDoApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToDoApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToDoApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToDoApp] SET RECOVERY FULL 
GO
ALTER DATABASE [ToDoApp] SET  MULTI_USER 
GO
ALTER DATABASE [ToDoApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToDoApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToDoApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToDoApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToDoApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToDoApp', N'ON'
GO
ALTER DATABASE [ToDoApp] SET QUERY_STORE = OFF
GO
USE [ToDoApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/09/2020 10:19:34 am ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/09/2020 10:19:34 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 18/09/2020 10:19:34 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[TodoId] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDo]    Script Date: 18/09/2020 10:19:34 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DeadLine] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[HighPriority] [bit] NOT NULL,
 CONSTRAINT [PK_ToDo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDoCategory]    Script Date: 18/09/2020 10:19:34 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoCategory](
	[ToDoCatId] [int] IDENTITY(1,1) NOT NULL,
	[ToDoId] [int] NOT NULL,
	[CatId] [int] NOT NULL,
 CONSTRAINT [PK_ToDoCategory] PRIMARY KEY CLUSTERED 
(
	[ToDoCatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18/09/2020 10:19:34 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200903132244_initialsetup', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Prioritize your tasks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Schedule everything')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Combine Approaches')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Stay on top of your Day')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [Body], [TodoId]) VALUES (1, N'It is wonderfull ', 1)
INSERT [dbo].[Comment] ([Id], [Body], [TodoId]) VALUES (2, N'It works great', 2)
INSERT [dbo].[Comment] ([Id], [Body], [TodoId]) VALUES (3, N'It is very useful to record data and time', 3)
INSERT [dbo].[Comment] ([Id], [Body], [TodoId]) VALUES (4, N'Need to add crucial features', 4)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[ToDo] ON 

INSERT [dbo].[ToDo] ([Id], [Title], [Description], [DeadLine], [UserId], [HighPriority]) VALUES (1, N'Planning', N'Planning for future', CAST(N'2020-09-18T00:00:00.0000000' AS DateTime2), 2, 1)
INSERT [dbo].[ToDo] ([Id], [Title], [Description], [DeadLine], [UserId], [HighPriority]) VALUES (2, N'Reminder', N'Reminding new thinks ', CAST(N'2018-07-06T00:00:00.0000000' AS DateTime2), 3, 1)
INSERT [dbo].[ToDo] ([Id], [Title], [Description], [DeadLine], [UserId], [HighPriority]) VALUES (3, N'Events', N'Organising events', CAST(N'2020-09-17T00:00:00.0000000' AS DateTime2), 4, 1)
INSERT [dbo].[ToDo] ([Id], [Title], [Description], [DeadLine], [UserId], [HighPriority]) VALUES (4, N'Add Tasks', N'organise task and add them into list', CAST(N'2017-12-16T00:00:00.0000000' AS DateTime2), 5, 1)
SET IDENTITY_INSERT [dbo].[ToDo] OFF
GO
SET IDENTITY_INSERT [dbo].[ToDoCategory] ON 

INSERT [dbo].[ToDoCategory] ([ToDoCatId], [ToDoId], [CatId]) VALUES (1, 1, 1)
INSERT [dbo].[ToDoCategory] ([ToDoCatId], [ToDoId], [CatId]) VALUES (2, 2, 2)
INSERT [dbo].[ToDoCategory] ([ToDoCatId], [ToDoId], [CatId]) VALUES (3, 3, 3)
INSERT [dbo].[ToDoCategory] ([ToDoCatId], [ToDoId], [CatId]) VALUES (4, 4, 4)
SET IDENTITY_INSERT [dbo].[ToDoCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Email]) VALUES (2, N'Vicky ', N'Vicky123@gmail.com')
INSERT [dbo].[User] ([Id], [Name], [Email]) VALUES (3, N'gill', N'gill72652@gmail.com')
INSERT [dbo].[User] ([Id], [Name], [Email]) VALUES (4, N'Khush', N'Anmoldeepsingh@gmail.com')
INSERT [dbo].[User] ([Id], [Name], [Email]) VALUES (5, N'Robin', N'Robinsharma12@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Comment_TodoId]    Script Date: 18/09/2020 10:19:34 am ******/
CREATE NONCLUSTERED INDEX [IX_Comment_TodoId] ON [dbo].[Comment]
(
	[TodoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDo_UserId]    Script Date: 18/09/2020 10:19:34 am ******/
CREATE NONCLUSTERED INDEX [IX_ToDo_UserId] ON [dbo].[ToDo]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDoCategory_CatId]    Script Date: 18/09/2020 10:19:34 am ******/
CREATE NONCLUSTERED INDEX [IX_ToDoCategory_CatId] ON [dbo].[ToDoCategory]
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDoCategory_ToDoId]    Script Date: 18/09/2020 10:19:34 am ******/
CREATE NONCLUSTERED INDEX [IX_ToDoCategory_ToDoId] ON [dbo].[ToDoCategory]
(
	[ToDoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_ToDo_TodoId] FOREIGN KEY([TodoId])
REFERENCES [dbo].[ToDo] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_ToDo_TodoId]
GO
ALTER TABLE [dbo].[ToDo]  WITH CHECK ADD  CONSTRAINT [FK_ToDo_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ToDo] CHECK CONSTRAINT [FK_ToDo_User_UserId]
GO
ALTER TABLE [dbo].[ToDoCategory]  WITH CHECK ADD  CONSTRAINT [FK_ToDoCategory_Category_CatId] FOREIGN KEY([CatId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ToDoCategory] CHECK CONSTRAINT [FK_ToDoCategory_Category_CatId]
GO
ALTER TABLE [dbo].[ToDoCategory]  WITH CHECK ADD  CONSTRAINT [FK_ToDoCategory_ToDo_ToDoId] FOREIGN KEY([ToDoId])
REFERENCES [dbo].[ToDo] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ToDoCategory] CHECK CONSTRAINT [FK_ToDoCategory_ToDo_ToDoId]
GO
USE [master]
GO
ALTER DATABASE [ToDoApp] SET  READ_WRITE 
GO
