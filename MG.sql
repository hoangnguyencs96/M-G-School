USE [master]
GO
/****** Object:  Database [MAUGIAO]    Script Date: 6/18/2018 1:38:42 PM ******/
CREATE DATABASE [MAUGIAO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MAUGIAO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MAUGIAO.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MAUGIAO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MAUGIAO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MAUGIAO] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MAUGIAO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MAUGIAO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MAUGIAO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MAUGIAO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MAUGIAO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MAUGIAO] SET ARITHABORT OFF 
GO
ALTER DATABASE [MAUGIAO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MAUGIAO] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MAUGIAO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MAUGIAO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MAUGIAO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MAUGIAO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MAUGIAO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MAUGIAO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MAUGIAO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MAUGIAO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MAUGIAO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MAUGIAO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MAUGIAO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MAUGIAO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MAUGIAO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MAUGIAO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MAUGIAO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MAUGIAO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MAUGIAO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MAUGIAO] SET  MULTI_USER 
GO
ALTER DATABASE [MAUGIAO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MAUGIAO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MAUGIAO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MAUGIAO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MAUGIAO]
GO
/****** Object:  Table [dbo].[ABSENCE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ABSENCE](
	[AbsenceID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentID] [bigint] NULL,
	[Reasons] [nvarchar](100) NULL,
	[Date] [date] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_ABSENCE] PRIMARY KEY CLUSTERED 
(
	[AbsenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BILL]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[BillID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[EmployeeID] [bigint] NULL,
	[Comment] [ntext] NULL,
	[Amount] [decimal](18, 0) NULL,
	[StudentID] [bigint] NULL,
 CONSTRAINT [PK_BILL] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BILL_DETAIL]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL_DETAIL](
	[BillDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[BillID] [bigint] NULL,
	[FeeID] [bigint] NULL,
	[Comment] [ntext] NULL,
	[Time] [datetime] NULL,
	[StudentID] [bigint] NULL,
 CONSTRAINT [PK_BILL_DETAIL] PRIMARY KEY CLUSTERED 
(
	[BillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CLASS]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASS](
	[ClassID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Grade] [int] NULL,
	[EmployeeID] [bigint] NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CLASS_1] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COURSE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE](
	[CoursesID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
	[Status] [bit] NULL,
	[Schedule] [varchar](20) NULL,
 CONSTRAINT [PK_COURSE] PRIMARY KEY CLUSTERED 
(
	[CoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPARTMENT](
	[DepartmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[BossID] [bigint] NULL,
	[Fax] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
 CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EmployeeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Sex] [bit] NULL,
	[DateOfBirth] [date] NULL,
	[Image] [varchar](200) NULL,
	[Phone] [varchar](20) NOT NULL,
	[IdentityID] [varchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Religion] [nvarchar](100) NULL,
	[Hometown] [nvarchar](200) NULL,
	[Degree] [nvarchar](100) NULL,
	[Major] [nvarchar](100) NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
	[Status] [bit] NULL,
	[Nationality] [nvarchar](100) NULL,
	[DepartmentID] [bigint] NULL,
	[RoleID] [bigint] NULL,
	[Comment] [ntext] NULL,
	[DealSalary] [decimal](18, 0) NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FEE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FEE](
	[FeeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Amount] [int] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_FEE] PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FOOD]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FOOD](
	[FoodID] [bigint] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](100) NULL,
	[FoodTypeID] [bigint] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_FOOD] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FOOD_TYPE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FOOD_TYPE](
	[FoodTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[FoodTypeName] [nvarchar](100) NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_FOOD_TYPE] PRIMARY KEY CLUSTERED 
(
	[FoodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FUND]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUND](
	[FundID] [bigint] IDENTITY(1,1) NOT NULL,
	[FundName] [nchar](10) NULL,
	[Amount] [decimal](18, 0) NULL,
	[EmployeeID] [bigint] NULL,
 CONSTRAINT [PK_FUND] PRIMARY KEY CLUSTERED 
(
	[FundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FUND_TYPE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUND_TYPE](
	[FundTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[FundTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_FUND_TYPE] PRIMARY KEY CLUSTERED 
(
	[FundTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOG]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [nvarchar](255) NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Logger] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](4000) NOT NULL,
	[Exception] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Log4NetLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[MaterialID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Unit] [int] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATERIAL_PROVIDER]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIAL_PROVIDER](
	[MaterialID] [bigint] NOT NULL,
	[ProviderID] [bigint] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_MATERIAL_PROVIDER] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[PaymentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Comment] [ntext] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENT_BILL]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT_BILL](
	[PaymentBillID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[EmployeeID] [bigint] NULL,
	[Comment] [ntext] NULL,
	[Amount] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
	[PaidAmount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PAYMENT_BILL] PRIMARY KEY CLUSTERED 
(
	[PaymentBillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENT_DETAILL]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT_DETAILL](
	[PaymentDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentBillID] [bigint] NULL,
	[PaymentID] [bigint] NULL,
	[Comment] [ntext] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_PAYMENT_DETAILL] PRIMARY KEY CLUSTERED 
(
	[PaymentDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERMISSON]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISSON](
	[PermissionID] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NULL,
	[Describe] [ntext] NULL,
 CONSTRAINT [PK_PERMISSON] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROVIDER]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVIDER](
	[ProviderID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](100) NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_PROVIDER] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[RoleID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROLE_PERMISSION]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE_PERMISSION](
	[RoleID] [bigint] NOT NULL,
	[PermissionID] [bigint] NOT NULL,
 CONSTRAINT [PK_ROLE_PERMISSION] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SALARY]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALARY](
	[SalaryID] [bigint] IDENTITY(1,1) NOT NULL,
	[SalaryName] [nvarchar](100) NULL,
	[MonthlyAmount] [decimal](18, 0) NULL,
	[SalaryTypeID] [bigint] NULL,
 CONSTRAINT [PK_SALARY] PRIMARY KEY CLUSTERED 
(
	[SalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SALARY_PAYMENT]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALARY_PAYMENT](
	[SalaryPaymentID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[SalaryID] [bigint] NULL,
	[Date] [date] NULL,
	[PaidDate] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SALARY_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[SalaryPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SALARY_TYPE]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALARY_TYPE](
	[SalaryTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[SalaryTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_SALARY_TYPE] PRIMARY KEY CLUSTERED 
(
	[SalaryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STUDENT](
	[StudentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [varchar](200) NULL,
	[DateOfBirth] [date] NULL,
	[Sex] [bit] NULL,
	[Address] [nvarchar](200) NULL,
	[Parent] [nvarchar](100) NULL,
	[ParentPhone] [varchar](20) NULL,
	[Comment] [ntext] NULL,
	[Status] [bit] NULL,
	[ClassID] [bigint] NULL,
	[Height] [decimal](18, 0) NULL,
	[Weight] [decimal](18, 0) NULL,
	[BMI] [decimal](18, 0) NULL,
	[Folk] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[PriorityID] [bigint] NULL,
	[Religious] [nvarchar](100) NULL,
 CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIMEKEEPING]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIMEKEEPING](
	[TimekeepingID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Date] [date] NULL,
	[Value] [varchar](100) NULL,
 CONSTRAINT [PK_TIMEKEEPING] PRIMARY KEY CLUSTERED 
(
	[TimekeepingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER]    Script Date: 6/18/2018 1:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[PassWord] [varchar](100) NULL,
	[EmployeeID] [bigint] NULL,
	[Status] [bit] NULL,
	[UserType] [int] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CLASS] ON 

INSERT [dbo].[CLASS] ([ClassID], [Name], [Grade], [EmployeeID], [StartTime], [EndTime], [Status]) VALUES (1, N'Mầm A', NULL, 1, CAST(N'2015-06-01' AS Date), CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[CLASS] ([ClassID], [Name], [Grade], [EmployeeID], [StartTime], [EndTime], [Status]) VALUES (2, N'Chồi A', NULL, 2, CAST(N'2015-06-01' AS Date), CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[CLASS] ([ClassID], [Name], [Grade], [EmployeeID], [StartTime], [EndTime], [Status]) VALUES (3, N'Chồi B', NULL, 3, CAST(N'2015-06-01' AS Date), CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[CLASS] ([ClassID], [Name], [Grade], [EmployeeID], [StartTime], [EndTime], [Status]) VALUES (4, N'Lá A', NULL, 4, CAST(N'2015-06-01' AS Date), CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[CLASS] ([ClassID], [Name], [Grade], [EmployeeID], [StartTime], [EndTime], [Status]) VALUES (5, N'Lá B', NULL, 5, CAST(N'2015-06-01' AS Date), CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[CLASS] ([ClassID], [Name], [Grade], [EmployeeID], [StartTime], [EndTime], [Status]) VALUES (6, N'Mầm B', NULL, 6, CAST(N'2015-06-01' AS Date), CAST(N'2016-06-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[CLASS] OFF
SET IDENTITY_INSERT [dbo].[EMPLOYEE] ON 

INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Name], [Sex], [DateOfBirth], [Image], [Phone], [IdentityID], [Address], [Religion], [Hometown], [Degree], [Major], [StartTime], [EndTime], [Status], [Nationality], [DepartmentID], [RoleID], [Comment], [DealSalary]) VALUES (3, N'Hiệu trưởng', NULL, NULL, NULL, N'0921365236', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Name], [Sex], [DateOfBirth], [Image], [Phone], [IdentityID], [Address], [Religion], [Hometown], [Degree], [Major], [StartTime], [EndTime], [Status], [Nationality], [DepartmentID], [RoleID], [Comment], [DealSalary]) VALUES (4, N'Giáo viên', NULL, NULL, NULL, N'0912365325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[EMPLOYEE] ([EmployeeID], [Name], [Sex], [DateOfBirth], [Image], [Phone], [IdentityID], [Address], [Religion], [Hometown], [Degree], [Major], [StartTime], [EndTime], [Status], [Nationality], [DepartmentID], [RoleID], [Comment], [DealSalary]) VALUES (5, N'Kế toán', NULL, NULL, NULL, N'0942325634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EMPLOYEE] OFF
SET IDENTITY_INSERT [dbo].[LOG] ON 

INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (2, CAST(N'2018-06-15 01:27:54.773' AS DateTime), N'11', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (3, CAST(N'2018-06-15 01:32:53.490' AS DateTime), N'8', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (4, CAST(N'2018-06-16 16:21:08.060' AS DateTime), N'15', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (5, CAST(N'2018-06-16 18:21:12.697' AS DateTime), N'13', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (6, CAST(N'2018-06-16 18:22:01.663' AS DateTime), N'13', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (7, CAST(N'2018-06-16 18:37:26.313' AS DateTime), N'35', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (8, CAST(N'2018-06-16 18:37:28.037' AS DateTime), N'34', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (9, CAST(N'2018-06-16 18:46:06.087' AS DateTime), N'56', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (10, CAST(N'2018-06-16 18:58:56.220' AS DateTime), N'51', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản hieutruong đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (11, CAST(N'2018-06-16 18:59:03.113' AS DateTime), N'49', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (12, CAST(N'2018-06-16 19:02:28.087' AS DateTime), N'56', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (13, CAST(N'2018-06-16 19:02:33.193' AS DateTime), N'51', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (14, CAST(N'2018-06-16 19:11:38.177' AS DateTime), N'45', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (15, CAST(N'2018-06-16 19:11:47.463' AS DateTime), N'32', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (16, CAST(N'2018-06-16 19:11:48.833' AS DateTime), N'45', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (17, CAST(N'2018-06-16 19:11:50.703' AS DateTime), N'32', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (18, CAST(N'2018-06-16 19:11:56.427' AS DateTime), N'45', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (19, CAST(N'2018-06-16 19:39:02.330' AS DateTime), N'51', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (20, CAST(N'2018-06-16 19:40:18.413' AS DateTime), N'50', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (21, CAST(N'2018-06-16 19:40:22.120' AS DateTime), N'37', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (22, CAST(N'2018-06-16 19:43:29.017' AS DateTime), N'33', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (23, CAST(N'2018-06-17 09:05:29.917' AS DateTime), N'10', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (24, CAST(N'2018-06-17 09:19:21.747' AS DateTime), N'25', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (25, CAST(N'2018-06-17 09:19:27.480' AS DateTime), N'17', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (26, CAST(N'2018-06-17 09:37:38.600' AS DateTime), N'37', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (27, CAST(N'2018-06-17 10:08:39.283' AS DateTime), N'33', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (28, CAST(N'2018-06-17 10:30:08.850' AS DateTime), N'50', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (29, CAST(N'2018-06-17 10:51:25.087' AS DateTime), N'21', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (30, CAST(N'2018-06-17 11:46:00.170' AS DateTime), N'42', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (31, CAST(N'2018-06-17 11:53:47.693' AS DateTime), N'46', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (32, CAST(N'2018-06-17 12:09:57.583' AS DateTime), N'32', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (33, CAST(N'2018-06-17 12:15:48.827' AS DateTime), N'11', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (34, CAST(N'2018-06-17 12:33:46.347' AS DateTime), N'15', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (35, CAST(N'2018-06-17 12:47:46.927' AS DateTime), N'36', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (36, CAST(N'2018-06-17 12:57:59.337' AS DateTime), N'11', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (37, CAST(N'2018-06-17 13:02:06.350' AS DateTime), N'5', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (38, CAST(N'2018-06-17 13:02:16.713' AS DateTime), N'5', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (39, CAST(N'2018-06-17 13:02:19.693' AS DateTime), N'8', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (40, CAST(N'2018-06-17 13:17:38.523' AS DateTime), N'30', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (41, CAST(N'2018-06-17 13:30:17.913' AS DateTime), N'12', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (42, CAST(N'2018-06-17 13:31:40.937' AS DateTime), N'13', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (43, CAST(N'2018-06-17 18:05:31.287' AS DateTime), N'6', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (44, CAST(N'2018-06-17 18:13:55.303' AS DateTime), N'13', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (45, CAST(N'2018-06-17 18:20:36.090' AS DateTime), N'33', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (46, CAST(N'2018-06-17 18:38:15.357' AS DateTime), N'51', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (47, CAST(N'2018-06-17 18:59:37.707' AS DateTime), N'35', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (48, CAST(N'2018-06-17 18:59:43.663' AS DateTime), N'33', N'INFO', N'DESKTOP-PVS04E1', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (49, CAST(N'2018-06-17 19:06:04.850' AS DateTime), N'8', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (50, CAST(N'2018-06-17 19:42:39.050' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (51, CAST(N'2018-06-17 19:47:29.210' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (52, CAST(N'2018-06-17 19:49:06.733' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (53, CAST(N'2018-06-17 20:02:57.323' AS DateTime), N'9', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (54, CAST(N'2018-06-17 20:03:41.680' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (55, CAST(N'2018-06-17 20:05:18.390' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (56, CAST(N'2018-06-17 20:05:54.080' AS DateTime), N'8', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (57, CAST(N'2018-06-17 20:16:06.833' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (58, CAST(N'2018-06-17 20:17:37.957' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (59, CAST(N'2018-06-17 20:44:24.163' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (60, CAST(N'2018-06-17 20:48:37.337' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (61, CAST(N'2018-06-17 21:16:43.447' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (62, CAST(N'2018-06-17 21:19:17.697' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (63, CAST(N'2018-06-17 21:25:32.630' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (64, CAST(N'2018-06-17 21:28:22.710' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (65, CAST(N'2018-06-17 21:29:14.400' AS DateTime), N'9', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (66, CAST(N'2018-06-17 21:29:47.080' AS DateTime), N'9', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (67, CAST(N'2018-06-17 21:33:58.360' AS DateTime), N'8', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (68, CAST(N'2018-06-17 21:34:58.987' AS DateTime), N'24', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (69, CAST(N'2018-06-17 21:37:52.430' AS DateTime), N'11', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (70, CAST(N'2018-06-17 21:39:40.743' AS DateTime), N'31', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (71, CAST(N'2018-06-17 21:40:24.320' AS DateTime), N'31', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (72, CAST(N'2018-06-17 21:45:31.727' AS DateTime), N'35', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (73, CAST(N'2018-06-17 21:56:21.763' AS DateTime), N'48', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (74, CAST(N'2018-06-17 21:59:47.213' AS DateTime), N'59', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (75, CAST(N'2018-06-17 22:08:18.093' AS DateTime), N'48', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (76, CAST(N'2018-06-17 22:08:59.913' AS DateTime), N'29', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (77, CAST(N'2018-06-17 22:12:20.813' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (78, CAST(N'2018-06-17 22:15:17.890' AS DateTime), N'36', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (79, CAST(N'2018-06-17 22:15:45.150' AS DateTime), N'36', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (80, CAST(N'2018-06-17 22:17:18.667' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (81, CAST(N'2018-06-17 22:18:21.747' AS DateTime), N'25', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (82, CAST(N'2018-06-17 22:19:10.850' AS DateTime), N'14', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (83, CAST(N'2018-06-17 22:19:46.430' AS DateTime), N'41', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (84, CAST(N'2018-06-17 22:21:32.270' AS DateTime), N'55', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (85, CAST(N'2018-06-17 22:31:34.143' AS DateTime), N'54', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (86, CAST(N'2018-06-17 22:52:55.010' AS DateTime), N'56', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (87, CAST(N'2018-06-17 23:01:39.193' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (88, CAST(N'2018-06-17 23:02:26.737' AS DateTime), N'34', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (89, CAST(N'2018-06-17 23:02:30.430' AS DateTime), N'26', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản giaovien đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (90, CAST(N'2018-06-17 23:02:42.160' AS DateTime), N'34', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản giaovien đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (91, CAST(N'2018-06-17 23:02:45.363' AS DateTime), N'34', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản ketoan đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (92, CAST(N'2018-06-17 23:02:58.313' AS DateTime), N'7', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản ketoan đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (93, CAST(N'2018-06-17 23:05:33.110' AS DateTime), N'25', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (94, CAST(N'2018-06-17 23:09:49.610' AS DateTime), N'50', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (95, CAST(N'2018-06-17 23:34:12.087' AS DateTime), N'41', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (96, CAST(N'2018-06-17 23:39:08.137' AS DateTime), N'48', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (97, CAST(N'2018-06-17 23:42:06.570' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (98, CAST(N'2018-06-17 23:43:15.203' AS DateTime), N'31', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (99, CAST(N'2018-06-17 23:44:02.630' AS DateTime), N'50', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (100, CAST(N'2018-06-17 23:53:38.763' AS DateTime), N'36', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
GO
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (101, CAST(N'2018-06-18 00:14:57.490' AS DateTime), N'29', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (102, CAST(N'2018-06-18 00:15:52.030' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (103, CAST(N'2018-06-18 00:16:55.243' AS DateTime), N'36', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (104, CAST(N'2018-06-18 00:20:54.180' AS DateTime), N'29', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (105, CAST(N'2018-06-18 00:48:19.017' AS DateTime), N'50', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (106, CAST(N'2018-06-18 00:51:42.413' AS DateTime), N'54', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (107, CAST(N'2018-06-18 00:51:58.860' AS DateTime), N'39', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (108, CAST(N'2018-06-18 00:52:35.267' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (109, CAST(N'2018-06-18 00:55:23.510' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (110, CAST(N'2018-06-18 00:59:36.677' AS DateTime), N'43', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (111, CAST(N'2018-06-18 01:03:23.960' AS DateTime), N'35', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (112, CAST(N'2018-06-18 01:06:27.463' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (113, CAST(N'2018-06-18 01:07:11.853' AS DateTime), N'15', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (114, CAST(N'2018-06-18 01:15:47.557' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (115, CAST(N'2018-06-18 01:17:40.200' AS DateTime), N'33', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (116, CAST(N'2018-06-18 01:18:24.980' AS DateTime), N'54', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (117, CAST(N'2018-06-18 01:20:46.253' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (118, CAST(N'2018-06-18 01:21:26.060' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (119, CAST(N'2018-06-18 01:22:25.620' AS DateTime), N'33', N'WARN', N'DESKTOP-6CBQAK8', N'Ai đó cố đăng nhập nhưng failed. So Stupid!', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (120, CAST(N'2018-06-18 01:22:29.507' AS DateTime), N'50', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (121, CAST(N'2018-06-18 01:23:38.190' AS DateTime), N'54', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (122, CAST(N'2018-06-18 01:25:05.647' AS DateTime), N'33', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (123, CAST(N'2018-06-18 01:25:45.483' AS DateTime), N'36', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (124, CAST(N'2018-06-18 01:27:23.853' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (125, CAST(N'2018-06-18 01:33:28.603' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (126, CAST(N'2018-06-18 01:37:03.573' AS DateTime), N'14', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (127, CAST(N'2018-06-18 01:38:14.150' AS DateTime), N'43', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (128, CAST(N'2018-06-18 01:50:42.657' AS DateTime), N'39', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (129, CAST(N'2018-06-18 01:52:10.737' AS DateTime), N'53', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (130, CAST(N'2018-06-18 01:54:02.567' AS DateTime), N'26', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (131, CAST(N'2018-06-18 01:55:31.553' AS DateTime), N'37', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (132, CAST(N'2018-06-18 01:57:22.767' AS DateTime), N'22', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (133, CAST(N'2018-06-18 01:57:41.500' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (134, CAST(N'2018-06-18 01:58:08.950' AS DateTime), N'22', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (135, CAST(N'2018-06-18 01:58:11.707' AS DateTime), N'38', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (136, CAST(N'2018-06-18 02:07:08.407' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (137, CAST(N'2018-06-18 02:09:20.830' AS DateTime), N'14', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (138, CAST(N'2018-06-18 02:10:44.033' AS DateTime), N'52', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (139, CAST(N'2018-06-18 02:14:10.323' AS DateTime), N'20', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (140, CAST(N'2018-06-18 02:15:00.857' AS DateTime), N'14', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (141, CAST(N'2018-06-18 02:16:58.227' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (142, CAST(N'2018-06-18 02:19:56.120' AS DateTime), N'53', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (143, CAST(N'2018-06-18 02:20:17.370' AS DateTime), N'39', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (144, CAST(N'2018-06-18 02:20:47.947' AS DateTime), N'53', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (145, CAST(N'2018-06-18 02:21:10.340' AS DateTime), N'35', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (146, CAST(N'2018-06-18 02:24:16.940' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (147, CAST(N'2018-06-18 02:27:02.927' AS DateTime), N'37', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (148, CAST(N'2018-06-18 02:28:29.127' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (149, CAST(N'2018-06-18 02:35:27.920' AS DateTime), N'9', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (150, CAST(N'2018-06-18 02:36:33.530' AS DateTime), N'22', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (151, CAST(N'2018-06-18 02:37:19.453' AS DateTime), N'37', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (152, CAST(N'2018-06-18 02:39:54.013' AS DateTime), N'37', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (153, CAST(N'2018-06-18 02:40:36.610' AS DateTime), N'37', N'WARN', N'DESKTOP-6CBQAK8', N'Ai đó cố đăng nhập nhưng failed. So Stupid!', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (154, CAST(N'2018-06-18 02:40:40.790' AS DateTime), N'22', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (155, CAST(N'2018-06-18 02:47:48.810' AS DateTime), N'41', N'WARN', N'DESKTOP-6CBQAK8', N'Ai đó cố đăng nhập nhưng failed. So Stupid!', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (156, CAST(N'2018-06-18 02:47:53.150' AS DateTime), N'41', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (157, CAST(N'2018-06-18 02:48:28.127' AS DateTime), N'15', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (158, CAST(N'2018-06-18 02:49:45.623' AS DateTime), N'10', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (159, CAST(N'2018-06-18 02:54:09.550' AS DateTime), N'41', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (160, CAST(N'2018-06-18 02:57:31.400' AS DateTime), N'14', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (161, CAST(N'2018-06-18 02:57:45.390' AS DateTime), N'15', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (162, CAST(N'2018-06-18 02:58:06.807' AS DateTime), N'49', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (163, CAST(N'2018-06-18 02:58:35.797' AS DateTime), N'39', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (164, CAST(N'2018-06-18 02:59:56.847' AS DateTime), N'54', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (165, CAST(N'2018-06-18 03:00:25.710' AS DateTime), N'29', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (166, CAST(N'2018-06-18 03:07:19.190' AS DateTime), N'29', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (167, CAST(N'2018-06-18 07:21:57.233' AS DateTime), N'6', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (168, CAST(N'2018-06-18 07:25:02.327' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (169, CAST(N'2018-06-18 07:25:28.403' AS DateTime), N'10', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (170, CAST(N'2018-06-18 07:42:01.230' AS DateTime), N'5', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (171, CAST(N'2018-06-18 07:44:04.127' AS DateTime), N'8', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (172, CAST(N'2018-06-18 07:44:45.907' AS DateTime), N'10', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (173, CAST(N'2018-06-18 07:46:07.333' AS DateTime), N'11', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (174, CAST(N'2018-06-18 07:46:32.510' AS DateTime), N'12', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (175, CAST(N'2018-06-18 07:52:29.737' AS DateTime), N'12', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (176, CAST(N'2018-06-18 07:52:36.130' AS DateTime), N'13', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (177, CAST(N'2018-06-18 07:58:03.437' AS DateTime), N'16', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (178, CAST(N'2018-06-18 08:11:16.207' AS DateTime), N'20', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (179, CAST(N'2018-06-18 08:11:52.647' AS DateTime), N'20', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (180, CAST(N'2018-06-18 08:13:44.493' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (181, CAST(N'2018-06-18 08:17:14.993' AS DateTime), N'15', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (182, CAST(N'2018-06-18 08:17:18.690' AS DateTime), N'22', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (183, CAST(N'2018-06-18 08:25:03.357' AS DateTime), N'22', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (184, CAST(N'2018-06-18 08:33:35.057' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (185, CAST(N'2018-06-18 08:55:49.810' AS DateTime), N'31', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (186, CAST(N'2018-06-18 09:17:26.613' AS DateTime), N'15', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (187, CAST(N'2018-06-18 09:27:54.367' AS DateTime), N'15', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (188, CAST(N'2018-06-18 10:09:55.810' AS DateTime), N'10', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (189, CAST(N'2018-06-18 10:13:13.743' AS DateTime), N'20', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (190, CAST(N'2018-06-18 10:13:45.037' AS DateTime), N'10', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đã đăng xuất !', N'')
INSERT [dbo].[LOG] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (191, CAST(N'2018-06-18 10:13:47.560' AS DateTime), N'19', N'INFO', N'DESKTOP-6CBQAK8', N'Tài khoản admin đăng nhập thành công !', N'')
SET IDENTITY_INSERT [dbo].[LOG] OFF
SET IDENTITY_INSERT [dbo].[PERMISSON] ON 

INSERT [dbo].[PERMISSON] ([PermissionID], [PermissionName], [Describe]) VALUES (1, N'XEM_DIEMDANH', N'Xem bảng điểm danh')
INSERT [dbo].[PERMISSON] ([PermissionID], [PermissionName], [Describe]) VALUES (2, N'XEM_BANGTHUCHI', N'Xem bảng thu chi')
INSERT [dbo].[PERMISSON] ([PermissionID], [PermissionName], [Describe]) VALUES (3, N'TAO_TAIKHOAN', N'Tạo tài khoản')
INSERT [dbo].[PERMISSON] ([PermissionID], [PermissionName], [Describe]) VALUES (4, N'XOA_TAIKHOAN', N'Xóa tài khoản')
SET IDENTITY_INSERT [dbo].[PERMISSON] OFF
SET IDENTITY_INSERT [dbo].[ROLE] ON 

INSERT [dbo].[ROLE] ([RoleID], [RoleName]) VALUES (1, N'Hiệu trưởng')
INSERT [dbo].[ROLE] ([RoleID], [RoleName]) VALUES (2, N'Giáo viên')
INSERT [dbo].[ROLE] ([RoleID], [RoleName]) VALUES (3, N'Kế toán')
SET IDENTITY_INSERT [dbo].[ROLE] OFF
INSERT [dbo].[ROLE_PERMISSION] ([RoleID], [PermissionID]) VALUES (1, 1)
INSERT [dbo].[ROLE_PERMISSION] ([RoleID], [PermissionID]) VALUES (1, 2)
INSERT [dbo].[ROLE_PERMISSION] ([RoleID], [PermissionID]) VALUES (2, 1)
INSERT [dbo].[ROLE_PERMISSION] ([RoleID], [PermissionID]) VALUES (3, 2)
SET IDENTITY_INSERT [dbo].[STUDENT] ON 

INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (1, N'Hà Huy Giang', NULL, CAST(N'2009-10-10' AS Date), 1, N'Hà Tĩnh', N'Hà Huy Tập', N'0999999999', N'Dễ ốm', 1, 1, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (2, N'Vũ Tuấn Sơn', NULL, CAST(N'2009-10-01' AS Date), 1, N'Hà Nội ', N'Vũ Tuấn Giang', N'0888888888', N'Dị ứng với nhộng tằm', 1, 1, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (3, N'Nguyễn Văn Lộc', NULL, CAST(N'2009-10-02' AS Date), 1, N'Hà Tĩnh', N'Nguyễn Văn Lá', N'0989898989', N'Dễ ốm', 1, 2, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (29, N'Classico Immobile', NULL, CAST(N'2011-02-20' AS Date), 1, N'Hải Phòng', N'Thành Cát Tư hãn', N'0909090909', N'Hay cắn đồ chơi', NULL, 1, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (30, N'Francesco Totti', NULL, CAST(N'2011-02-20' AS Date), 1, N'Bạc Liêu', N'Thiết Mộc Chân', N'0123456789', N'Dễ ốm', NULL, 1, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (31, N'Antonio Florenzi', NULL, CAST(N'2011-02-20' AS Date), 1, N'Nha Trang', N'Thành Cát Tư hãn', N'0123456789', N'Hay cắn đồ chơi', NULL, 1, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (32, N'Alessandro Nesta', NULL, CAST(N'2011-02-20' AS Date), 1, N'Sóc Trăng', N'Hốt Tất Liệt', N'0909090909', N'Dễ ốm', NULL, 1, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (33, N'Fabio Cannavaro', NULL, CAST(N'2011-02-20' AS Date), 1, N'California', N'Thành Cát Tư hãn', N'0145445214', N'Hay cắn đồ chơi', NULL, 1, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (34, N'Lucas Moura', NULL, CAST(N'2011-02-20' AS Date), 1, N'New York', N'Thiết Mộc Chân', N'0123456789', N'Dễ ốm', NULL, 1, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (35, N'Võ Thị Sáu', NULL, CAST(N'2011-02-20' AS Date), 0, N'Thái Nguyên', N'Thành Cát Tư hãn', N'0909090909', N'Hay cắn đồ chơi', NULL, 1, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (36, N'Nguyễn Thị Kim Ngân', NULL, CAST(N'2011-02-20' AS Date), 0, N'New York', N'Hốt Tất Liệt', N'0145445214', N'Dễ ốm', NULL, 1, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (37, N'Đoàn Thị Điểm', NULL, CAST(N'2011-02-20' AS Date), 0, N'Thái Nguyên', N'Thành Cát Tư hãn', N'0123456789', N'Dị ứng phấn bảng', NULL, 1, NULL, NULL, NULL, N'Mường', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (38, N'Cúc Cu', NULL, CAST(N'2011-02-20' AS Date), 0, N'Sóc Trăng', N'Thiết Mộc Chân', N'0909090909', N'Dễ ốm', NULL, 2, NULL, NULL, NULL, N'Tày', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (39, N'Nguyễn Thị Ngọc Ánh', NULL, CAST(N'2011-02-20' AS Date), 0, N'Hà Tĩnh', N'Thành Cát Tư hãn', N'0125488597', N'Hay cắn đồ chơi', NULL, 2, NULL, NULL, NULL, N'Tày', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (40, N'Nguyễn Thị Kim Soa', NULL, CAST(N'2011-02-20' AS Date), 0, N'Hải Phòng', N'Hốt Tất Liệt', N'0123456789', N'Dễ ốm', NULL, 2, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (41, N'Lê Thị Kiều Trang', NULL, CAST(N'2011-02-20' AS Date), 0, N'Sóc Trăng', N'Thành Cát Tư hãn', N'0909090909', N'Dị ứng phấn bảng', NULL, 2, NULL, NULL, NULL, N'Mường', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (42, N'Nguyễn Thị Thu Trang', NULL, CAST(N'2011-02-20' AS Date), 0, N'Hải Phòng', N'Thiết Mộc Chân', N'0125488597', N'Dễ ốm', NULL, 2, NULL, NULL, NULL, N'Kinh', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (43, N'Nguyễn Văn Thắng', NULL, CAST(N'2011-02-20' AS Date), 1, N'Hà Tĩnh', N'Thành Cát Tư hãn', N'0123456789', N'Dị ứng phấn bảng', NULL, 5, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (44, N'Đoàn Tấn Mỹ', NULL, CAST(N'2011-02-20' AS Date), 1, N'Sóc Trăng', N'Hốt Tất Liệt', N'0909090909', N'Dễ ốm', NULL, 5, NULL, NULL, NULL, N'Tày', N'example@gmail.com', NULL, NULL)
INSERT [dbo].[STUDENT] ([StudentID], [Name], [Image], [DateOfBirth], [Sex], [Address], [Parent], [ParentPhone], [Comment], [Status], [ClassID], [Height], [Weight], [BMI], [Folk], [Email], [PriorityID], [Religious]) VALUES (45, N'Nguyễn Hà Thái Bảo', NULL, CAST(N'2011-02-20' AS Date), 1, N'Hà Tĩnh', N'Thành Cát Tư hãn', N'0123456789', N'Dị ứng với nhộng tằm', NULL, 5, NULL, NULL, NULL, N'Kinh', N'corecorecore@yahoo.com.vn', NULL, NULL)
SET IDENTITY_INSERT [dbo].[STUDENT] OFF
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([UserID], [UserName], [PassWord], [EmployeeID], [Status], [UserType]) VALUES (1, N'hieutruong', N'C4CA4238A0B923820DCC509A6F75849B', 3, 1, 1)
INSERT [dbo].[USER] ([UserID], [UserName], [PassWord], [EmployeeID], [Status], [UserType]) VALUES (2, N'giaovien', N'C4CA4238A0B923820DCC509A6F75849B', 4, 1, 1)
INSERT [dbo].[USER] ([UserID], [UserName], [PassWord], [EmployeeID], [Status], [UserType]) VALUES (3, N'ketoan', N'C4CA4238A0B923820DCC509A6F75849B', 5, 1, 1)
INSERT [dbo].[USER] ([UserID], [UserName], [PassWord], [EmployeeID], [Status], [UserType]) VALUES (4, N'admin', N'C4CA4238A0B923820DCC509A6F75849B', 3, 1, 0)
SET IDENTITY_INSERT [dbo].[USER] OFF
USE [master]
GO
ALTER DATABASE [MAUGIAO] SET  READ_WRITE 
GO
