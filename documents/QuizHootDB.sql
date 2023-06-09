USE [master]
GO
/****** Object:  Database [QuizHoot]    Script Date: 7/26/2022 2:12:07 AM ******/
CREATE DATABASE [QuizHoot]

GO
ALTER DATABASE [QuizHoot] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizHoot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizHoot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizHoot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizHoot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizHoot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizHoot] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizHoot] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuizHoot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizHoot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizHoot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizHoot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizHoot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizHoot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizHoot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizHoot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizHoot] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuizHoot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizHoot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizHoot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizHoot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizHoot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizHoot] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [QuizHoot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizHoot] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizHoot] SET  MULTI_USER 
GO
ALTER DATABASE [QuizHoot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizHoot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizHoot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizHoot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizHoot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizHoot] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuizHoot] SET QUERY_STORE = OFF
GO
USE [QuizHoot]
GO
/****** Object:  User [DESKTOP-7767ROS\namhk]    Script Date: 7/26/2022 2:12:07 AM ******/

GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 7/26/2022 2:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](200) NULL,
	[Correct] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[QuestionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/26/2022 2:12:07 AM ******/
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
/****** Object:  Table [dbo].[Level]    Script Date: 7/26/2022 2:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/26/2022 2:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](200) NULL,
	[Active] [bit] NOT NULL,
	[Score] [int] NOT NULL,
	[LevelID] [int] NULL,
	[QuizID] [int] NULL,
	[MultipleChoice] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/26/2022 2:12:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Content] [varchar](250) NULL,
	[Publish] [bit] NOT NULL,
	[StartAt] [datetime] NULL,
	[EndAt] [datetime] NULL,
	[PassScore] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakeAnswer]    Script Date: 7/26/2022 2:12:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakeAnswer](
	[TakeQuizID] [int] NOT NULL,
	[QuestionId] [int] NULL,
	[AnswerID] [int] NOT NULL,
 CONSTRAINT [PK_TakeAnswer] PRIMARY KEY CLUSTERED 
(
	[TakeQuizID] ASC,
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakeQuiz]    Script Date: 7/26/2022 2:12:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakeQuiz](
	[TakeQuizID] [int] IDENTITY(1,1) NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[FinishAt] [datetime] NULL,
	[Score] [int] NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[QuizID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TakeQuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (3, N'2', 1, 1, 3)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (5, N'3', 0, 1, 3)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (6, N'4', 0, 1, 3)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (8, N'ef', 1, 1, 4)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (9, N'a', 0, 1, 4)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (10, N'b', 0, 1, 4)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (11, N'True', 1, 1, 5)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (12, N'False', 0, 1, 5)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (13, N'sieng nang', 1, 1, 6)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (14, N'thong minh', 0, 1, 6)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (15, N'an', 1, 1, 7)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (16, N'tien', 0, 1, 7)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (28, N'afd', 0, 0, 3)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (65, N'1', 0, 1, 20)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (75, N'1', 0, 1, 22)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (76, N'True', 1, 1, 23)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (77, N'True', 1, 1, 24)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (78, N'False', 0, 1, 5)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (79, N'False', 0, 1, 5)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (80, N'False', 0, 1, 5)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (81, N'2', 1, 1, 20)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (82, N'3', 0, 1, 20)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (83, N'4', 0, 1, 20)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (84, N'2', 0, 1, 22)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (85, N'3', 0, 1, 22)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (86, N'6', 1, 1, 22)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (87, N'False', 0, 1, 23)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (88, N'True', 1, 1, 24)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (89, N'True', 1, 1, 24)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (90, N'False', 0, 1, 24)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (91, N'True', 1, 1, 25)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (92, N'True', 1, 1, 25)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (93, N'fasel', 0, 1, 25)
INSERT [dbo].[Answer] ([AnswerID], [Content], [Correct], [Active], [QuestionID]) VALUES (94, N'false', 0, 1, 25)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca118051-eb52-4a18-b9e3-afcdf2b15a6f', N'user1@gmail.com', N'USER1@GMAIL.COM', N'user1@gmail.com', N'USER1@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEIGyqPbkciGMvpoy8Ija77/tsFryYVewp1qf0V+ucOydB5/uQzDVaGivHG/fFg5imA==', N'SCONZJJORMB44F3XTP7YYDKAF2FQV6F7', N'1822a688-07e9-4c83-a852-dfd9b09162c1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd256bd6c-bcbf-4ed3-82e9-fc4e98ee9d3c', N'namhkse@gmail.com', N'NAMHKSE@GMAIL.COM', N'namhkse@gmail.com', N'NAMHKSE@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENmdjCqxfGNmuiacm4od8DhJzSewQHClsdTf+W3nZEv7I6SXneruI8ltELd6QyPWMA==', N'GRP7PK22CAFVBUEWFZJ3FPZ27PO37UPP', N'5ed1471e-d637-4035-b9cb-8dc015989063', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (1, N'Easy')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (2, N'Medium')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (3, N'Hard')
SET IDENTITY_INSERT [dbo].[Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (3, N'1 + 1', 1, 1, 1, 1, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (4, N'abcd...g', 1, 1, 1, 1, 1)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (5, N'Test Question', 1, 1, 1, 1, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (6, N'Can cu thi bu ...', 1, 1, 1, 1, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (7, N'co lam thi moi co ...', 1, 1, 1, 1, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (20, N'1 + 1 = ?', 1, 5, 1, 12, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (22, N'2 * 3 = ?', 1, 1, 1, 12, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (23, N'2 - 1 = 1', 1, 2, 1, 12, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (24, N'Test Question', 1, 4, 1, 20, 0)
INSERT [dbo].[Question] ([QuestionID], [Content], [Active], [Score], [LevelID], [QuizID], [MultipleChoice]) VALUES (25, N'Nescafe ...', 1, 1, 1, 20, 0)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizId], [Title], [Content], [Publish], [StartAt], [EndAt], [PassScore], [CreatorId]) VALUES (1, N'Firtst Quiz', N'quiz''s contetnt', 1, CAST(N'2012-11-12T00:00:00.000' AS DateTime), CAST(N'2023-07-25T21:10:13.000' AS DateTime), 10, NULL)
INSERT [dbo].[Quiz] ([QuizId], [Title], [Content], [Publish], [StartAt], [EndAt], [PassScore], [CreatorId]) VALUES (12, N'tinh toan', N'1', 1, CAST(N'2022-07-25T21:10:13.000' AS DateTime), CAST(N'2022-07-25T21:10:13.000' AS DateTime), 1, NULL)
INSERT [dbo].[Quiz] ([QuizId], [Title], [Content], [Publish], [StartAt], [EndAt], [PassScore], [CreatorId]) VALUES (20, N'Test Score In Multiple Question', N'Quiz  content', 1, CAST(N'2001-01-01T01:01:00.000' AS DateTime), CAST(N'2030-01-01T11:01:00.000' AS DateTime), 10, N'd256bd6c-bcbf-4ed3-82e9-fc4e98ee9d3c')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (49, 3, 3)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (49, 4, 8)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (49, 5, 11)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (49, 6, 13)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (49, 7, 15)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (50, 23, 76)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (50, 20, 81)
INSERT [dbo].[TakeAnswer] ([TakeQuizID], [QuestionId], [AnswerID]) VALUES (50, 22, 86)
GO
SET IDENTITY_INSERT [dbo].[TakeQuiz] ON 

INSERT [dbo].[TakeQuiz] ([TakeQuizID], [StartAt], [FinishAt], [Score], [UserID], [QuizID]) VALUES (49, CAST(N'2022-07-26T01:52:09.643' AS DateTime), CAST(N'2022-07-26T01:52:24.467' AS DateTime), 5, N'd256bd6c-bcbf-4ed3-82e9-fc4e98ee9d3c', 1)
INSERT [dbo].[TakeQuiz] ([TakeQuizID], [StartAt], [FinishAt], [Score], [UserID], [QuizID]) VALUES (50, CAST(N'2022-07-26T01:55:00.617' AS DateTime), CAST(N'2022-07-26T01:55:40.433' AS DateTime), 8, N'd256bd6c-bcbf-4ed3-82e9-fc4e98ee9d3c', 12)
INSERT [dbo].[TakeQuiz] ([TakeQuizID], [StartAt], [FinishAt], [Score], [UserID], [QuizID]) VALUES (51, CAST(N'2022-07-26T01:55:06.083' AS DateTime), NULL, 0, N'd256bd6c-bcbf-4ed3-82e9-fc4e98ee9d3c', 12)
SET IDENTITY_INSERT [dbo].[TakeQuiz] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/26/2022 2:12:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Question] ADD  DEFAULT ((0)) FOR [MultipleChoice]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question_QuestionID]
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
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Level_LevelID] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Level_LevelID]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_QuizID] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Quiz_QuizID]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_User_UserId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_User_UserId]
GO
ALTER TABLE [dbo].[TakeAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TakeAnswer_Answer_AnswerID] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([AnswerID])
GO
ALTER TABLE [dbo].[TakeAnswer] CHECK CONSTRAINT [FK_TakeAnswer_Answer_AnswerID]
GO
ALTER TABLE [dbo].[TakeAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TakeAnswer_TakeQuiz_TakeQuizID] FOREIGN KEY([TakeQuizID])
REFERENCES [dbo].[TakeQuiz] ([TakeQuizID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakeAnswer] CHECK CONSTRAINT [FK_TakeAnswer_TakeQuiz_TakeQuizID]
GO
ALTER TABLE [dbo].[TakeQuiz]  WITH CHECK ADD  CONSTRAINT [FK_TakeQuiz_Quiz_QuizID] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakeQuiz] CHECK CONSTRAINT [FK_TakeQuiz_Quiz_QuizID]
GO
ALTER TABLE [dbo].[TakeQuiz]  WITH CHECK ADD  CONSTRAINT [FK_TakeQuiz_User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TakeQuiz] CHECK CONSTRAINT [FK_TakeQuiz_User_UserID]
GO
USE [master]
GO
ALTER DATABASE [QuizHoot] SET  READ_WRITE 
GO
