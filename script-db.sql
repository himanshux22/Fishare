USE [master]
GO
/****** Object:  Database [dbi388453]    Script Date: 27-9-2018 13:29:19 ******/
CREATE DATABASE [dbi388453]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbi388453', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbi388453.mdf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 2048KB )
 LOG ON 
( NAME = N'dbi388453_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbi388453_log.ldf' , SIZE = 1064KB , MAXSIZE = 262144KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbi388453] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbi388453].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbi388453] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbi388453] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbi388453] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbi388453] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbi388453] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbi388453] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbi388453] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbi388453] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbi388453] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbi388453] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbi388453] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbi388453] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbi388453] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbi388453] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbi388453] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbi388453] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbi388453] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbi388453] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbi388453] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbi388453] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbi388453] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbi388453] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbi388453] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbi388453] SET  MULTI_USER 
GO
ALTER DATABASE [dbi388453] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbi388453] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbi388453] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbi388453] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbi388453] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbi388453', N'ON'
GO
USE [dbi388453]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] NOT NULL,
	[User_UserID] [int] NULL,
	[Event_name] [nchar](10) NULL,
	[DateTime] [datetime] NULL,
	[Location] [nvarchar](50) NULL,
	[Range] [varchar](50) NOT NULL,
	[Type] [varchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Condition] [varchar](50) NULL,
	[Max_Users] [int] NULL,
 CONSTRAINT [PK__Event__7944C870871467D5] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Join]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Join](
	[EventJID] [int] NOT NULL,
	[Event_EventID] [int] NULL,
	[User_UserID] [int] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK__Event_Jo__15AEEC35571EBBB3] PRIMARY KEY CLUSTERED 
(
	[EventJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Photo]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Photo](
	[EPID] [int] NOT NULL,
	[Event_EventID] [int] NULL,
	[Path] [nvarchar](50) NULL,
 CONSTRAINT [PK__Event_Ph__28740BB83CEE548C] PRIMARY KEY CLUSTERED 
(
	[EPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fish]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fish](
	[FishID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](1000) NULL,
	[Sub_Species] [varchar](50) NULL,
	[NameLatin] [varchar](255) NULL,
	[Food] [varchar](255) NULL,
	[Average-Lenght] [decimal](18, 0) NULL,
	[Average-Weight] [decimal](18, 0) NULL,
	[WaterType] [varchar](50) NULL,
	[AnimalType] [varchar](50) NULL,
	[FP_Path] [nvarchar](50) NULL,
 CONSTRAINT [PK__Fish__F82A5BF910AD91E5] PRIMARY KEY CLUSTERED 
(
	[FishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FishInfo]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishInfo](
	[FishInfoID] [int] NOT NULL,
	[Fish_FishID] [int] NULL,
	[Weight] [decimal](18, 0) NULL,
	[Lenght] [decimal](18, 0) NULL,
	[Bait] [varchar](50) NULL,
 CONSTRAINT [PK__FishInfo__9C4E9742D4EDAC8A] PRIMARY KEY CLUSTERED 
(
	[FishInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[User_One_ID] [int] NOT NULL,
	[User_Two_ID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Action_User_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[DateTime] [datetime] NULL,
	[Location] [nvarchar](255) NULL,
	[FishInfo_FishInfoID] [int] NULL,
	[Public] [int] NULL,
 CONSTRAINT [PK__Post__AA126038313EC353] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Like]    Script Date: 27-9-2018 13:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Like](
	[Post_PostID] [int] NOT NULL,
	[User_UserID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Photo]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Photo](
	[PPID] [int] NOT NULL,
	[Post_PostID] [int] NULL,
	[Path] [nvarchar](255) NULL,
 CONSTRAINT [PK__Post_Pho__5FD889CDFFBA7707] PRIMARY KEY CLUSTERED 
(
	[PPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Reaction]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Reaction](
	[PReactionID] [int] NOT NULL,
	[Post_PostID] [int] NULL,
	[User_UserID] [int] NULL,
	[Reaction] [nvarchar](50) NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK__Post_Rea__D3D6B489CE08239A] PRIMARY KEY CLUSTERED 
(
	[PReactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [varchar](60) NULL,
	[Password] [nvarchar](255) NULL,
	[Firstname] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Phone] [varchar](50) NULL,
	[User_photo_Path] [nvarchar](255) NOT NULL,
	[Bio] [varchar](255) NULL,
 CONSTRAINT [PK__tmp_ms_x__1788CCAC8A485176] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCreate_Log]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCreate_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogData] [nvarchar](255) NULL,
	[DateTime] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_UserCreate_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Friends]    Script Date: 27-9-2018 13:29:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Friends] ON [dbo].[Friends]
(
	[User_One_ID] ASC,
	[User_Two_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User]
GO
ALTER TABLE [dbo].[Event_Join]  WITH CHECK ADD  CONSTRAINT [FK_Event_Join_Event] FOREIGN KEY([Event_EventID])
REFERENCES [dbo].[Event] ([EventID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event_Join] CHECK CONSTRAINT [FK_Event_Join_Event]
GO
ALTER TABLE [dbo].[Event_Join]  WITH CHECK ADD  CONSTRAINT [FK_Event_Join_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Event_Join] CHECK CONSTRAINT [FK_Event_Join_User]
GO
ALTER TABLE [dbo].[Event_Photo]  WITH CHECK ADD  CONSTRAINT [FK_Event_Photo_Event] FOREIGN KEY([Event_EventID])
REFERENCES [dbo].[Event] ([EventID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event_Photo] CHECK CONSTRAINT [FK_Event_Photo_Event]
GO
ALTER TABLE [dbo].[FishInfo]  WITH CHECK ADD  CONSTRAINT [FK_FishInfo_Fish] FOREIGN KEY([Fish_FishID])
REFERENCES [dbo].[Fish] ([FishID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FishInfo] CHECK CONSTRAINT [FK_FishInfo_Fish]
GO
ALTER TABLE [dbo].[Post_Like]  WITH CHECK ADD  CONSTRAINT [FK_Post_Like_Post] FOREIGN KEY([Post_PostID])
REFERENCES [dbo].[Post] ([PostID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Like] CHECK CONSTRAINT [FK_Post_Like_Post]
GO
ALTER TABLE [dbo].[Post_Like]  WITH CHECK ADD  CONSTRAINT [FK_Post_Like_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Like] CHECK CONSTRAINT [FK_Post_Like_User]
GO
ALTER TABLE [dbo].[Post_Photo]  WITH CHECK ADD  CONSTRAINT [FK_Post_Photo_Post] FOREIGN KEY([Post_PostID])
REFERENCES [dbo].[Post] ([PostID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Photo] CHECK CONSTRAINT [FK_Post_Photo_Post]
GO
ALTER TABLE [dbo].[Post_Reaction]  WITH CHECK ADD  CONSTRAINT [FK_Post_Reaction_Post] FOREIGN KEY([Post_PostID])
REFERENCES [dbo].[Post] ([PostID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Reaction] CHECK CONSTRAINT [FK_Post_Reaction_Post]
GO
ALTER TABLE [dbo].[Post_Reaction]  WITH CHECK ADD  CONSTRAINT [FK_Post_Reaction_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post_Reaction] CHECK CONSTRAINT [FK_Post_Reaction_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [CK_Event_Range] CHECK  (([Range]='FishClub' OR [Range]='Friends' OR [Range]='Public'))
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [CK_Event_Range]
GO
ALTER TABLE [dbo].[Event_Join]  WITH CHECK ADD  CONSTRAINT [CK_Event_Join_Status] CHECK  (([Status]='Pending' OR [Status]='Accept'))
GO
ALTER TABLE [dbo].[Event_Join] CHECK CONSTRAINT [CK_Event_Join_Status]
GO
ALTER TABLE [dbo].[Fish]  WITH CHECK ADD  CONSTRAINT [CK_Fish_AType] CHECK  (([AnimalType]='Carnivore' OR [AnimalType]='Herbivore' OR [AnimalType]='Omnivore'))
GO
ALTER TABLE [dbo].[Fish] CHECK CONSTRAINT [CK_Fish_AType]
GO
ALTER TABLE [dbo].[Fish]  WITH CHECK ADD  CONSTRAINT [CK_Fish_WType] CHECK  (([WaterType]='SaltWater' OR [WaterType]='FreshWater'))
GO
ALTER TABLE [dbo].[Fish] CHECK CONSTRAINT [CK_Fish_WType]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [CK_Friends_Status] CHECK  (([Status]='Accept' OR [Status]='Blocked' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [CK_Friends_Status]
GO
/****** Object:  StoredProcedure [dbo].[AcceptFriendsRequest]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Accept the friend request
-- =============================================
CREATE PROCEDURE [dbo].[AcceptFriendsRequest] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0, 
	@FriendId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Friends] SET [Status] = 'Accept' WHERE ((Friends.User_One_ID = @UserId AND Friends.User_Two_ID = @FriendId) OR (Friends.User_One_ID = @FriendId AND Friends.User_Two_ID = @UserId)) And Friends.[Status] = 'Pending';
END
GO
/****** Object:  StoredProcedure [dbo].[BlockFriend]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Block a friend
-- =============================================
CREATE PROCEDURE [dbo].[BlockFriend] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0, 
	@FriendId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Friends] SET [Status] = 'Blocked', Action_User_ID = @UserId WHERE ((Friends.User_One_ID = @UserId AND Friends.User_Two_ID = @FriendId) OR (Friends.User_One_ID = @FriendId AND Friends.User_Two_ID = @UserId));
END
GO
/****** Object:  StoredProcedure [dbo].[CheckEmailExistence]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Check if users Email already Exist
-- =============================================
CREATE PROCEDURE [dbo].[CheckEmailExistence] 
	-- Add the parameters for the stored procedure here
	@Email VarChar(60) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select COUNT(UserEmail) AS TotalMatches From [User] Where UserEmail=@Email
END
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Check the users login info if it exist
-- =============================================
CREATE PROCEDURE [dbo].[CheckLogin] 
	-- Add the parameters for the stored procedure here
	@Email Varchar(60) = '', 
	@Password Varchar(255) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select UserEmail From [User] Where UserEmail=@Email And Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUserAccount]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Create a user account
-- =============================================
CREATE PROCEDURE [dbo].[CreateUserAccount] 
	-- Add the parameters for the stored procedure here
	@UserEmail Varchar(60) = '', 
	@Password Varchar(255) = '', 
	@FirstName Varchar(50) = '', 
	@LastName Varchar(50) = '', 
	@BirthDay DateTime = '', 
	@Phone Varchar(20) = '',
	@Ppath Varchar(255) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [User] (UserEmail, [Password], FirstName, LastName, BirthDay, Phone, User_photo_Path) VALUES (@UserEmail, @Password, @FirstName, @LastName, @BirthDay, @Phone, @Ppath)
END
GO
/****** Object:  StoredProcedure [dbo].[DeclineFriendsRequest]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Decline a friend request
-- =============================================
CREATE PROCEDURE [dbo].[DeclineFriendsRequest] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0, 
	@FriendId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Friends] WHERE ((Friends.User_One_ID = @UserId AND Friends.User_Two_ID = @FriendId) OR (Friends.User_One_ID = @FriendId AND Friends.User_Two_ID = @UserId)) And Friends.[Status] = 'Pending';
END
GO
/****** Object:  StoredProcedure [dbo].[GetAcceptedFriends]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCorelissen
-- Create date: 
-- Description:	Get all the Friends
-- =============================================
CREATE PROCEDURE [dbo].[GetAcceptedFriends] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [UserID], FirstName, LastName, User_photo_Path, friends.User_One_ID, friends.User_Two_ID, friends.[Status], friends.Action_User_ID 
	From Friends 
	INNER JOIN [User] ON ([User].UserID = Friends.User_One_ID AND Friends.User_Two_ID = @UserId) OR ([User].UserID = Friends.User_Two_ID AND Friends.User_One_ID = @UserId)
	Where (Friends.User_One_ID = @UserId OR Friends.User_Two_ID = @UserId) And Friends.[Status] = 'Accept';
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllFriendsID]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Get all the id's of your friends
-- =============================================
CREATE PROCEDURE [dbo].[GetAllFriendsID] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [UserID] 
	From Friends 
	INNER JOIN [User] ON ([User].UserID = Friends.User_One_ID AND Friends.User_Two_ID = @UserId) OR ([User].UserID = Friends.User_Two_ID AND Friends.User_One_ID = @UserId)
	Where (Friends.User_One_ID = @UserId OR Friends.User_Two_ID = @UserId) And Friends.[Status] = 'Accept';
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPosts]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Get all Posts from friends and the user self
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPosts] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- get the post from the User
	SELECT P.PostID,P.UserID,P.Title,P.[Description],P.[DateTime],P.[Location],P.FishInfo_FishInfoID,P.[Public], FI.Fish_FishID, F.[Name], FI.Lenght, FI.[Weight], FI.Bait, U.Firstname, U.Lastname, U.User_photo_Path, (SELECT COUNT(User_UserID) FROM Post_Like PL WHERE p.PostID = PL.Post_PostID Group by PL.Post_PostID) AS TotalLikes 
	From Post P 
	INNER JOIN [User] U ON U.UserID = P.UserID
	FULL outer JOIN FishInfo FI ON FI.FishInfoID = P.FishInfo_FishInfoID
	FULL outer JOIN Fish F ON F.FishID = FI.Fish_FishID
	WHERE P.UserID = @UserId
	ORDER BY P.[DateTime] DESC;

	-- Get all the Photos for the posts
	Select pp.Post_PostID,  PP.[Path] From Post_Photo PP 
	INNER JOIN Post P ON PP.Post_PostID = P.PostID
	WHERE P.UserID = @UserId

END
GO
/****** Object:  StoredProcedure [dbo].[GetBlockedFriends]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Get all blocked friends
-- =============================================
CREATE PROCEDURE [dbo].[GetBlockedFriends] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [UserID], FirstName, LastName, User_photo_Path, friends.User_One_ID, friends.User_Two_ID, friends.[Status], friends.Action_User_ID 
	From Friends 
	INNER JOIN [User] ON ([User].UserID = Friends.User_One_ID AND Friends.User_Two_ID = @UserId) OR ([User].UserID = Friends.User_Two_ID AND Friends.User_One_ID = @UserId)
	Where (Friends.User_One_ID = @UserId OR Friends.User_Two_ID = @UserId) And Friends.[Status] = 'Blocked' AND Friends.Action_User_ID = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCookieInfo]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Get all the cookie information
-- =============================================
CREATE PROCEDURE [dbo].[GetCookieInfo] 
	-- Add the parameters for the stored procedure here
	@Email Varchar(60) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select UserID, Firstname, User_Photo_Path From [User] Where UserEmail=@Email
END
GO
/****** Object:  StoredProcedure [dbo].[GetPendingFriends]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Get all pending requests
-- =============================================
CREATE PROCEDURE [dbo].[GetPendingFriends] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [UserID], FirstName, LastName, User_photo_Path, friends.User_One_ID, friends.User_Two_ID, friends.[Status], friends.Action_User_ID 
	From Friends 
	INNER JOIN [User] ON ([User].UserID = Friends.User_One_ID AND Friends.User_Two_ID = @UserId) OR ([User].UserID = Friends.User_Two_ID AND Friends.User_One_ID = @UserId)
	Where (Friends.User_One_ID = @UserId OR Friends.User_Two_ID = @UserId) And Friends.[Status] = 'Pending';
END
GO
/****** Object:  StoredProcedure [dbo].[GetSearchResult]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Get User by SearchInput
-- =============================================
CREATE PROCEDURE [dbo].[GetSearchResult] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0,
	@SearchValue VarChar(255) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [UserID], FirstName, LastName, User_photo_Path
	FROM [User] 
	WHERE ((Firstname LIKE @SearchValue) OR (Lastname LIKE @SearchValue)) AND 
	NOT EXISTS (SELECT * FROM Friends WHERE (User_One_ID = [UserID] AND User_Two_ID = @UserId) OR (User_Two_ID = [UserID] AND User_One_ID = @UserId)) AND ([UserID] <> @UserId);
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserProfile]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 24-04-2018
-- Description:	Get users profile info
-- =============================================
CREATE PROCEDURE [dbo].[GetUserProfile] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select UserID, UserEmail, [Password], Firstname, Lastname, Birthday, Phone, Bio, User_photo_Path From [User] Where UserID=@UserId

	Select P.PostID, P.Title, P.[DateTime], Pp.[Path], P.[Public] From Post P outer apply (
         SELECT TOP 1 [Path]
         FROM    Post_Photo Pp
         WHERE   Pp.Post_PostID = P.PostID
         ) Pp Where UserID= @UserId ORDER BY P.[DateTime] desc

	SELECT [UserID], FirstName, LastName, User_photo_Path, friends.User_One_ID, friends.User_Two_ID, friends.[Status], friends.Action_User_ID 
	From Friends 
	INNER JOIN [User] ON ([User].UserID = Friends.User_One_ID AND Friends.User_Two_ID = @UserId) OR ([User].UserID = Friends.User_Two_ID AND Friends.User_One_ID = @UserId)
	Where (Friends.User_One_ID = @UserId OR Friends.User_Two_ID = @UserId) And Friends.[Status] = 'Accept' OR Friends.[Status] = 'Pending'
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveFriend]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Remove a friend
-- =============================================
CREATE PROCEDURE [dbo].[RemoveFriend] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0, 
	@FriendId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Friends] WHERE ((Friends.User_One_ID = @UserId AND Friends.User_Two_ID = @FriendId) OR (Friends.User_One_ID = @FriendId AND Friends.User_Two_ID = @UserId)) And Friends.[Status] = 'Accept';
END
GO
/****** Object:  StoredProcedure [dbo].[SendFriendRequest]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Send a friend request
-- =============================================
CREATE PROCEDURE [dbo].[SendFriendRequest] 
	-- Add the parameters for the stored procedure here
	@User_One_ID int = 0, 
	@User_Two_ID int = 0,
	@Action_User_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Friends] (User_One_ID,User_Two_ID,[Status],Action_User_ID) VALUES (@User_One_ID, @User_Two_ID, 'Pending', @Action_User_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[UnblockFriend]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Unblock a friend
-- =============================================
CREATE PROCEDURE [dbo].[UnblockFriend] 
	-- Add the parameters for the stored procedure here
	@UserId int = 0, 
	@FriendId int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Friends] SET [Status] = 'Pending', Action_User_ID = @UserId WHERE ((Friends.User_One_ID = @UserId AND Friends.User_Two_ID = @FriendId) OR (Friends.User_One_ID = @FriendId AND Friends.User_Two_ID = @UserId));
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserAccount]    Script Date: 27-9-2018 13:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DaveyCornelissen
-- Create date: 
-- Description:	Update the users info
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserAccount] 
	-- Add the parameters for the stored procedure here
	@UserID int = 0,
	@UserEmail Varchar(60) = '', 
	@Password Varchar(255) = '', 
	@FirstName Varchar(50) = '', 
	@LastName Varchar(50) = '', 
	@BirthDay DateTime = '', 
	@Phone Varchar(20) = '',
	@Bio Varchar(255) = '',
	@ProfilePath Varchar(255) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [User] SET UserEmail = @UserEmail, [Password] = @Password, Firstname = @FirstName, Lastname = @LastName, Birthday = @BirthDay, Phone = @Phone, Bio = @Bio, User_photo_Path = @ProfilePath  WHERE [UserID] = @UserID ;
END
GO
USE [master]
GO
ALTER DATABASE [dbi388453] SET  READ_WRITE 
GO
