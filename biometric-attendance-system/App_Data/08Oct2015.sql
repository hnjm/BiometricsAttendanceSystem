USE [master]
GO
/****** Object:  Database [BiometricsAttendanceSystem]    Script Date: 08-Oct-15 9:00:34 PM ******/
CREATE DATABASE [BiometricsAttendanceSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BiometricsAttendanceSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BiometricsAttendanceSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BiometricsAttendanceSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BiometricsAttendanceSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BiometricsAttendanceSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BiometricsAttendanceSystem]
GO
/****** Object:  StoredProcedure [dbo].[spAddDuration]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Add an entry to Duration Table
-- =============================================
CREATE PROCEDURE [dbo].[spAddDuration] 
	-- Add the parameters for the stored procedure here
	@duration time(7),
	@isActive bit,
	@createdOn datetime,
	@updatedOn datetime,
	@isDeleted bit
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO 
     tblDuration 
	 VALUES(
			@duration,
			@isActive,
			@createdOn,
			@updatedOn,
			@isDeleted
		   )
END

GO
/****** Object:  StoredProcedure [dbo].[spAddRole]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Add a new role
-- =============================================
CREATE PROCEDURE [dbo].[spAddRole] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(Max), 
	@createdOn datetime,
    @updatedOn datetime,
    @isDeleted bit
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 
	tblRole 
	VALUES(
		@name,
		@createdOn,
		@updatedOn,
		@isDeleted
		)
END

GO
/****** Object:  StoredProcedure [dbo].[spAddShift]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Add a new Shift entry
-- =============================================
CREATE PROCEDURE [dbo].[spAddShift] (
	@firstHalfStart datetime,
	@firstHalfEnd datetime,
	@secondHalfStart datetime,
	@secondHalfEnd datetime,
	@isActive bit,
	@createdOn datetime,
	@updatedOn datetime,
	@isDeleted bit)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO 
		tblShifts 
	VALUES(
			@firstHalfStart,	
			@firstHalfEnd,
			@secondHalfStart,
			@secondHalfEnd,
			@isActive,
			@createdOn,
			@updatedOn,
			@isDeleted)
END

GO
/****** Object:  StoredProcedure [dbo].[spCreateDepartment]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 02nd October 2015
-- Description:	Creates a new Department Entry
-- =============================================
CREATE PROCEDURE [dbo].[spCreateDepartment] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(Max), 
	@createdOn datetime,
	@updatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;
	SELECT @name, @createdOn
	INSERT INTO tblDepartment 
	VALUES(
	@name,
	@createdOn,
	@updatedOn)
END

GO
/****** Object:  StoredProcedure [dbo].[spCreateEmployee]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SI
-- Create date: 29thSeptember2015
-- Description:	Creates a new Employee and returns Employee ID of created Employee 
-- =============================================
CREATE PROCEDURE [dbo].[spCreateEmployee]
	-- Add the parameters for the stored procedure here
	@facultyId nvarchar(MAX),
	@firstName nvarchar(MAX), 
	@middleName nvarchar(MAX),
	@lastName nvarchar(MAX),
	@gender nvarchar(MAX),
	@dateOfBirth datetime,
	@joiningDate datetime,
	@isDeleted bit,
	@createdAt datetime,
	@updatedAt datetime
AS
BEGIN

	SET NOCOUNT ON;

   INSERT INTO dbo.tblEmployeesMaster
          ( 
            FacultyId,
			FirstName,
			MiddleName,
			LastName,
			Gender,
			DateOfBirth,
			JoiningDate,
			CreatedAt,
			UpdatedAt,
			IsDeleted
          ) 
     VALUES 
          ( 
            @facultyId,
			@firstName, 
			@middleName,
			@lastName,
			@gender,
			@dateOfBirth,
			@joiningDate,
			@createdAt,
			@updatedAt,
			@isDeleted
          ) 
	SELECT @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[spCreateEmployeeTransc]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SI
-- Create date: 29thSeptember2015
-- Description:	Creates a new Employee and returns Employee ID of created Employee 
-- =============================================
CREATE PROCEDURE [dbo].[spCreateEmployeeTransc]
	-- Add the parameters for the stored procedure here
	@employeeId bigint,
	@imagepath nvarchar(MAX), 
	@password nvarchar(MAX),
	@departmentId int,
	@roleId int,
	@contactNumber bigint,
	@isDeleted bit,
	@createdAt datetime,
	@updatedAt datetime
AS
BEGIN

   SET NOCOUNT ON;

   INSERT INTO dbo.tblEmployees
          ( 
            EmployeeId,
			ImagePath,
			[Password],
			RoleId,
			DepartmentId,
			CreatedAt,
			UpdatedAt,
			IsDeleted
          ) 
     VALUES 
          ( 
            @employeeId,
			@imagePath, 
			@password,
			@roleId,
			@departmentId,
			@createdAt,
			@updatedAt,
			@isDeleted
          ) 
END

GO
/****** Object:  StoredProcedure [dbo].[spCreateTypeOfLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 03rd October 2015
-- Description:	Add a new type of Leave
-- =============================================
CREATE PROCEDURE [dbo].[spCreateTypeOfLeave] 
	-- Add the parameters for the stored procedure here
	@name nvarchar(MAX), 
	@masterLeaveType int,
	@createdOn datetime,
	@updatedOn datetime,
	@isDeleted bit
AS
BEGIN
	SET NOCOUNT ON;
			INSERT INTO 
			tblTypeOfLeave 
			VALUES (
			@name,
			@masterLeaveType,
			@createdOn,
			@updatedOn,
			@isDeleted)
    END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllDepartments]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 03rd October 2015
-- Description:	Returns all Departments
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllDepartments] 
	
AS
BEGIN

	SET NOCOUNT ON;
	SELECT 
			Id,
			Name 
	FROM    tblDepartment
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllDurations]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Returns list of durations 
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllDurations] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
			Id,
			Duration
	FROM tblDuration
	WHERE
			IsDeleted = 0 
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllRoles]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Get all roles
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllRoles] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		Id,
		Name 
	FROM 
	    tblRole
	WHERE
		IsDeleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllShifts]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 04th October 2015
-- Description:	Get all Shifts
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllShifts]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		Id,
		FirstHalfStart,
		FirstHalfEnd,
		SecondHalfStart,
		SecondHalfEnd,
		isActive 
	FROM 
		tblShifts
	WHERE 
		IsDeleted =0
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllTypeOfLeaves]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Software Incubator
-- Create date: 03rd October 2015
-- Description:	Gets All Types of Leave
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllTypeOfLeaves] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
	      Id,
		  Name,
		  MasterLeaveType 
    FROM  tblTypeOfLeave
	WHERE IsDeleted = 0
END

GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendance](
	[SNo] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[EntryTime] [time](7) NULL,
	[ExitTime] [time](7) NULL,
 CONSTRAINT [PK_tblAttendance] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDuration]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Duration] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSHLDuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDurationalLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDurationalLeave](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LeaveId] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
	[DurationId] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_tblDurationalLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployees](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ContactNumber] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblEmployees_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeesMaster]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeesMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FacultyId] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblEmployees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFullDayLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFullDayLeave](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LeaveId] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_tblFullDayLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHalfDayLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHalfDayLeave](
	[Id] [bigint] NOT NULL,
	[LeaveId] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Shift] [int] NOT NULL,
	[ShiftId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_tblHalfDayLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeave](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeaveAssignedByRole]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeaveAssignedByRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[NoOfLeaves] [int] NOT NULL,
	[IsPromoted] [bit] NOT NULL,
	[Limit] [int] NOT NULL,
 CONSTRAINT [PK_tblLeaveAssignedByRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeaveDetailsMonthWise]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeaveDetailsMonthWise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Month] [date] NOT NULL,
	[LeaveId] [int] NOT NULL,
	[LeavesAllotedForMonth] [int] NOT NULL,
	[LeavesTakentForMonth] [int] NOT NULL,
 CONSTRAINT [PK_tblLeaveDetailsMonthWise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMultiDayLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMultiDayLeave](
	[Id] [bigint] NOT NULL,
	[LeaveId] [bigint] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_tblMultiDayLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblShifts]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShifts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstHalfStart] [time](7) NOT NULL,
	[FirstHalfEnd] [time](7) NOT NULL,
	[SecondHalfStart] [time](7) NOT NULL,
	[SecondHalfEnd] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblShifts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTypeOfLeave]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeOfLeave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[MasterLeaveType] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblTypeOfLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTypeOfLeaveMaster]    Script Date: 08-Oct-15 9:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeOfLeaveMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblTypeOfLeaveMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_tblEmployees]    Script Date: 08-Oct-15 9:00:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblEmployees] ON [dbo].[tblEmployeesMaster]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAttendance]  WITH CHECK ADD  CONSTRAINT [FK_tblAttendance_tblEmployees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
GO
ALTER TABLE [dbo].[tblAttendance] CHECK CONSTRAINT [FK_tblAttendance_tblEmployees]
GO
ALTER TABLE [dbo].[tblDurationalLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblDurationalLeave_tblDuration] FOREIGN KEY([DurationId])
REFERENCES [dbo].[tblDuration] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDurationalLeave] CHECK CONSTRAINT [FK_tblDurationalLeave_tblDuration]
GO
ALTER TABLE [dbo].[tblDurationalLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblDurationalLeave_tblLeave] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[tblLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDurationalLeave] CHECK CONSTRAINT [FK_tblDurationalLeave_tblLeave]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[tblDepartment] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblDepartment]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblEmployeesMaster]
GO
ALTER TABLE [dbo].[tblEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployees_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployees] CHECK CONSTRAINT [FK_tblEmployees_tblRole]
GO
ALTER TABLE [dbo].[tblFullDayLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblFullDayLeave_tblLeave] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[tblLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFullDayLeave] CHECK CONSTRAINT [FK_tblFullDayLeave_tblLeave]
GO
ALTER TABLE [dbo].[tblHalfDayLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblHalfDayLeave_tblLeave] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[tblLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHalfDayLeave] CHECK CONSTRAINT [FK_tblHalfDayLeave_tblLeave]
GO
ALTER TABLE [dbo].[tblHalfDayLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblHalfDayLeave_tblShifts] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[tblShifts] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHalfDayLeave] CHECK CONSTRAINT [FK_tblHalfDayLeave_tblShifts]
GO
ALTER TABLE [dbo].[tblLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblLeave_tblEmployees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
GO
ALTER TABLE [dbo].[tblLeave] CHECK CONSTRAINT [FK_tblLeave_tblEmployees]
GO
ALTER TABLE [dbo].[tblLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblLeave_tblTypeOfLeave] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tblTypeOfLeave] ([Id])
GO
ALTER TABLE [dbo].[tblLeave] CHECK CONSTRAINT [FK_tblLeave_tblTypeOfLeave]
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveAssignedByRole_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole] CHECK CONSTRAINT [FK_tblLeaveAssignedByRole_tblRole]
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveAssignedByRole_tblTypeOfLeave] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[tblTypeOfLeave] ([Id])
GO
ALTER TABLE [dbo].[tblLeaveAssignedByRole] CHECK CONSTRAINT [FK_tblLeaveAssignedByRole_tblTypeOfLeave]
GO
ALTER TABLE [dbo].[tblLeaveDetailsMonthWise]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveDetailsMonthWise_tblEmployeesMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployeesMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeaveDetailsMonthWise] CHECK CONSTRAINT [FK_tblLeaveDetailsMonthWise_tblEmployeesMaster]
GO
ALTER TABLE [dbo].[tblLeaveDetailsMonthWise]  WITH CHECK ADD  CONSTRAINT [FK_tblLeaveDetailsMonthWise_tblTypeOfLeave] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[tblTypeOfLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLeaveDetailsMonthWise] CHECK CONSTRAINT [FK_tblLeaveDetailsMonthWise_tblTypeOfLeave]
GO
ALTER TABLE [dbo].[tblMultiDayLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblMultiDayLeave_tblLeave] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[tblLeave] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblMultiDayLeave] CHECK CONSTRAINT [FK_tblMultiDayLeave_tblLeave]
GO
ALTER TABLE [dbo].[tblTypeOfLeave]  WITH CHECK ADD  CONSTRAINT [FK_tblTypeOfLeave_tblTypeOfLeaveMaster] FOREIGN KEY([MasterLeaveType])
REFERENCES [dbo].[tblTypeOfLeaveMaster] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTypeOfLeave] CHECK CONSTRAINT [FK_tblTypeOfLeave_tblTypeOfLeaveMaster]
GO
USE [master]
GO
ALTER DATABASE [BiometricsAttendanceSystem] SET  READ_WRITE 
GO
