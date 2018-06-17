USE [master]
GO
/****** Object:  Database [MAUGIAO]    Script Date: 17/06/2018 7:03:03 PM ******/
CREATE DATABASE [MAUGIAO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MAUGIAO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MAUGIAO.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MAUGIAO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MAUGIAO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [MAUGIAO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MAUGIAO', N'ON'
GO
USE [MAUGIAO]
GO
/****** Object:  Table [dbo].[ABSENCE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[BILL]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[BILL_DETAIL]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[CLASS]    Script Date: 17/06/2018 7:03:03 PM ******/
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
 CONSTRAINT [PK_CLASS_1] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COURSE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[FEE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[FOOD]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[FOOD_TYPE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[FUND]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[FUND_TYPE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[LOG]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[MATERIAL_PROVIDER]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[PAYMENT_BILL]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[PAYMENT_DETAILL]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[PERMISSON]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[PROVIDER]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[ROLE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[ROLE_PERMISSION]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[SALARY]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[SALARY_PAYMENT]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[SALARY_TYPE]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[STUDENT]    Script Date: 17/06/2018 7:03:03 PM ******/
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
 CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIMEKEEPING]    Script Date: 17/06/2018 7:03:03 PM ******/
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
/****** Object:  Table [dbo].[USER]    Script Date: 17/06/2018 7:03:03 PM ******/
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
