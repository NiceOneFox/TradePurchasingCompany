USE [CP]
GO
/****** Object:  Trigger [After_delete_order_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP TRIGGER IF EXISTS [dbo].[After_delete_order_list]
GO
/****** Object:  Trigger [After_update_Goods_price]    Script Date: 15.04.2021 20:46:00 ******/
DROP TRIGGER IF EXISTS [dbo].[After_update_Goods_price]
GO
/****** Object:  Trigger [After_update_Goods]    Script Date: 15.04.2021 20:46:00 ******/
DROP TRIGGER IF EXISTS [dbo].[After_update_Goods]
GO
/****** Object:  Trigger [After_delete_delivery_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP TRIGGER IF EXISTS [dbo].[After_delete_delivery_list]
GO
/****** Object:  StoredProcedure [dbo].[Warehouse_Goods_in_stock]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Warehouse_Goods_in_stock]
GO
/****** Object:  StoredProcedure [dbo].[Goods_agent_category]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Goods_agent_category]
GO
/****** Object:  StoredProcedure [dbo].[Goods_Agent]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Goods_Agent]
GO
/****** Object:  StoredProcedure [dbo].[Good_price_more]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Good_price_more]
GO
/****** Object:  StoredProcedure [dbo].[Get_user_password]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_user_password]
GO
/****** Object:  StoredProcedure [dbo].[Get_last_id_order]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_last_id_order]
GO
/****** Object:  StoredProcedure [dbo].[Get_last_id_delivery]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_last_id_delivery]
GO
/****** Object:  StoredProcedure [dbo].[Get_last_id_auth]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_last_id_auth]
GO
/****** Object:  StoredProcedure [dbo].[Employee_position]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Employee_position]
GO
/****** Object:  StoredProcedure [dbo].[Done_orders]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Done_orders]
GO
/****** Object:  StoredProcedure [dbo].[Delivery_Goods_info]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Delivery_Goods_info]
GO
/****** Object:  StoredProcedure [dbo].[Delete_good_from_delivery]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Delete_good_from_delivery]
GO
/****** Object:  StoredProcedure [dbo].[Change_order_status]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Change_order_status]
GO
/****** Object:  StoredProcedure [dbo].[Agent_info]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Agent_info]
GO
/****** Object:  StoredProcedure [dbo].[Agent_goods_in_stock]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Agent_goods_in_stock]
GO
/****** Object:  StoredProcedure [dbo].[Add_Order_List]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_Order_List]
GO
/****** Object:  StoredProcedure [dbo].[Add_Order]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_Order]
GO
/****** Object:  StoredProcedure [dbo].[Add_Employee]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_Employee]
GO
/****** Object:  StoredProcedure [dbo].[Add_Delivery_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_Delivery_list]
GO
/****** Object:  StoredProcedure [dbo].[Add_Delivery]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_Delivery]
GO
/****** Object:  StoredProcedure [dbo].[Add_auth]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_auth]
GO
/****** Object:  StoredProcedure [dbo].[Add_Agent]    Script Date: 15.04.2021 20:46:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[Add_Agent]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse_Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse_Goods] DROP CONSTRAINT IF EXISTS [Warehouse_goods_total]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_list]') AND type in (N'U'))
ALTER TABLE [dbo].[Order_list] DROP CONSTRAINT IF EXISTS [Order_list_total]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Goods] DROP CONSTRAINT IF EXISTS [Goods_price]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Goods] DROP CONSTRAINT IF EXISTS [Goods_commission]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delivery_list]') AND type in (N'U'))
ALTER TABLE [dbo].[delivery_list] DROP CONSTRAINT IF EXISTS [delive_list_total]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent_Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Agent_Goods] DROP CONSTRAINT IF EXISTS [agent_goods_total]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse_Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse_Goods] DROP CONSTRAINT IF EXISTS [FK_Warehouse_Goods_Warehouse]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse_Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse_Goods] DROP CONSTRAINT IF EXISTS [FK_Warehouse_Goods_Goods]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_list]') AND type in (N'U'))
ALTER TABLE [dbo].[Order_list] DROP CONSTRAINT IF EXISTS [FK_Order_list_Order]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_list]') AND type in (N'U'))
ALTER TABLE [dbo].[Order_list] DROP CONSTRAINT IF EXISTS [FK_Order_list_Goods]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [FK_Order_Order_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [FK_Order_Agent1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Authentication]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delivery_list]') AND type in (N'U'))
ALTER TABLE [dbo].[delivery_list] DROP CONSTRAINT IF EXISTS [FK_delivery_list_Goods]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delivery_list]') AND type in (N'U'))
ALTER TABLE [dbo].[delivery_list] DROP CONSTRAINT IF EXISTS [FK_delivery_list_Delivery]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delivery]') AND type in (N'U'))
ALTER TABLE [dbo].[Delivery] DROP CONSTRAINT IF EXISTS [FK_Delivery_Warehouse1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent_Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Agent_Goods] DROP CONSTRAINT IF EXISTS [FK_Agent_Goods_Goods]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent_Goods]') AND type in (N'U'))
ALTER TABLE [dbo].[Agent_Goods] DROP CONSTRAINT IF EXISTS [FK_Agent_Goods_Agent]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent]') AND type in (N'U'))
ALTER TABLE [dbo].[Agent] DROP CONSTRAINT IF EXISTS [FK_Agent_Authentication]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [DF_Order_status_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [DF_Order_order_date]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[History_Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[History_Employee] DROP CONSTRAINT IF EXISTS [DF__History_Em__date__4BAC3F29]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delivery]') AND type in (N'U'))
ALTER TABLE [dbo].[Delivery] DROP CONSTRAINT IF EXISTS [DF_Delivery_delivery_date]
GO
/****** Object:  Index [IX_Employee]    Script Date: 15.04.2021 20:46:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [IX_Employee]
GO
/****** Object:  Index [IX_Authentication]    Script Date: 15.04.2021 20:46:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authentication]') AND type in (N'U'))
ALTER TABLE [dbo].[Authentication] DROP CONSTRAINT IF EXISTS [IX_Authentication]
GO
/****** Object:  Index [IX_Agent]    Script Date: 15.04.2021 20:46:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent]') AND type in (N'U'))
ALTER TABLE [dbo].[Agent] DROP CONSTRAINT IF EXISTS [IX_Agent]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Warehouse]
GO
/****** Object:  Table [dbo].[Order_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Order_list]
GO
/****** Object:  Table [dbo].[History_order_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[History_order_list]
GO
/****** Object:  Table [dbo].[History_Employee]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[History_Employee]
GO
/****** Object:  Table [dbo].[History_Delivery_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[History_Delivery_list]
GO
/****** Object:  Table [dbo].[History_delivery]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[History_delivery]
GO
/****** Object:  Table [dbo].[Goods_List]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Goods_List]
GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Authentication]
GO
/****** Object:  Table [dbo].[Agent_Goods]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Agent_Goods]
GO
/****** Object:  View [dbo].[Order_status_view]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[Order_status_view]
GO
/****** Object:  View [dbo].[Agent_view]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[Agent_view]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Agent]
GO
/****** Object:  View [dbo].[Employee_view]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[Employee_view]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  View [dbo].[goods_category_view]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[goods_category_view]
GO
/****** Object:  View [dbo].[delivery_goods_view_2]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[delivery_goods_view_2]
GO
/****** Object:  View [dbo].[Oder_status_view_2]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[Oder_status_view_2]
GO
/****** Object:  View [dbo].[Order_status_1]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[Order_status_1]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Order_Status]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Order]
GO
/****** Object:  View [dbo].[delivery_goods_view]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[delivery_goods_view]
GO
/****** Object:  Table [dbo].[delivery_list]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[delivery_list]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Delivery]
GO
/****** Object:  View [dbo].[warehouse_goods_info_view]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[warehouse_goods_info_view]
GO
/****** Object:  View [dbo].[warehouse_goods_info_view3]    Script Date: 15.04.2021 20:46:00 ******/
DROP VIEW IF EXISTS [dbo].[warehouse_goods_info_view3]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Goods]
GO
/****** Object:  Table [dbo].[Warehouse_Goods]    Script Date: 15.04.2021 20:46:00 ******/
DROP TABLE IF EXISTS [dbo].[Warehouse_Goods]
GO
USE [master]
GO
/****** Object:  Database [CP]    Script Date: 15.04.2021 20:46:00 ******/
DROP DATABASE IF EXISTS [CP]
GO
/****** Object:  Database [CP]    Script Date: 15.04.2021 20:46:00 ******/
CREATE DATABASE [CP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CP', FILENAME = N'F:\SQLExpressServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\CP.mdf' , SIZE = 8192KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CP_log', FILENAME = N'F:\SQLExpressServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\CP_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 1%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CP] SET ARITHABORT OFF 
GO
ALTER DATABASE [CP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CP] SET  MULTI_USER 
GO
ALTER DATABASE [CP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CP] SET QUERY_STORE = OFF
GO
USE [CP]
GO
/****** Object:  Table [dbo].[Warehouse_Goods]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse_Goods](
	[warehouse_id] [int] NOT NULL,
	[total] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Warehouse_Goods_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[vender_code] [varchar](30) NOT NULL,
	[category] [varchar](40) NULL,
	[name] [varchar](80) NOT NULL,
	[description] [varchar](255) NULL,
	[price] [money] NOT NULL,
	[commission] [float] NOT NULL,
 CONSTRAINT [PK_Товары] PRIMARY KEY CLUSTERED 
(
	[vender_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[warehouse_goods_info_view3]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[warehouse_goods_info_view3] AS
SELECT w.vender_code, total, g.name, g.category, g.description, g.price, g.commission
FROM Warehouse_Goods AS w
INNER JOIN Goods AS g ON w.vender_code = g.vender_code
GO
/****** Object:  View [dbo].[warehouse_goods_info_view]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[warehouse_goods_info_view] AS
SELECT w.vender_code, total, g.name, g.category, g.description, g.price, g.commission
FROM Warehouse_Goods AS w
INNER JOIN Goods AS g ON w.vender_code = g.vender_code
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[delivery_id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_date] [datetime2](7) NOT NULL,
	[warehouse_id] [int] NULL,
 CONSTRAINT [PK_Поступление товара на склад] PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery_list]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_id] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_delivery_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[delivery_goods_view]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[delivery_goods_view] AS
SELECT t.vender_code, g.name, g.price, t.total, d.delivery_id
FROM Delivery d
INNER JOIN delivery_list t ON d.delivery_id = t.delivery_id 
INNER JOIN Goods g ON t.vender_code = g.vender_code;
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[agent_id] [int] NOT NULL,
	[order_date] [datetime2](7) NOT NULL,
	[status_id] [int] NOT NULL,
 CONSTRAINT [PK_Заявка на поставку товара] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](120) NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Order_status_1]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Order_status_1] AS
SELECT d.agent_id,  d.order_date, s.status
FROM [Order] d
LEFT JOIN Order_Status s On d.status_id = s.status_id
WHERE d.order_id = 4
GO
/****** Object:  View [dbo].[Oder_status_view_2]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Oder_status_view_2] AS
SELECT d.agent_id,  d.order_date, s.status
FROM [Order] d
LEFT JOIN Order_Status s On d.status_id = s.status_id
WHERE d.order_id = 7
GO
/****** Object:  View [dbo].[delivery_goods_view_2]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[delivery_goods_view_2] AS 
SELECT t.vender_code, g.name, g.price, t.total, d.delivery_id
FROM Delivery d
LEFT JOIN delivery_list t ON d.delivery_id = t.delivery_id 
INNER JOIN Goods g ON t.vender_code = g.vender_code
WHERE g.price > 2000
GO
/****** Object:  View [dbo].[goods_category_view]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[goods_category_view] AS
SELECT *
FROM Goods
WHERE category = 'Мебель';
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id_auth] [int] NOT NULL,
	[name] [varchar](80) NOT NULL,
	[phone] [varchar](16) NULL,
	[position] [varchar](50) NULL,
	[employee_addr] [varchar](120) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Employee_view]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Employee_view] AS
SELECT [name] as 'fullname', phone, position, employee_addr as 'address'
FROM Employee
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[agent_id] [int] IDENTITY(1,1) NOT NULL,
	[agent_name] [varchar](80) NOT NULL,
	[agent_addr] [varchar](100) NOT NULL,
	[agent_phone] [varchar](16) NULL,
	[id_auth] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[agent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Agent_view]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Agent_view] AS
SELECT agent_name as 'agent name', agent_addr as 'address', agent_phone as 'phone', agent_id
FROM Agent
GO
/****** Object:  View [dbo].[Order_status_view]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Order_status_view] AS
SELECT d.agent_id, d.order_id, d.order_date, s.status
FROM [Order] d
LEFT JOIN Order_Status s On d.status_id = s.status_id
GO
/****** Object:  Table [dbo].[Agent_Goods]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent_Goods](
	[agent_id] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[total] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Товары у агента] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentication](
	[login] [varchar](30) NOT NULL,
	[password] [nchar](64) NOT NULL,
	[id_auth] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED 
(
	[id_auth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods_List]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods_List](
	[goods_id] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[total] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Список товаров] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_delivery]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_delivery](
	[delivery_id] [int] NOT NULL,
	[delivery_date] [datetime2](7) NOT NULL,
	[warehouse_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_Delivery_list]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Delivery_list](
	[id] [int] NOT NULL,
	[delivery_id] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[total] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_Employee]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Employee](
	[id_auth] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NOT NULL,
	[position] [varchar](50) NOT NULL,
	[phone] [varchar](16) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_order_list]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_order_list](
	[id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[total] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_list]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[vender_code] [varchar](30) NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_Order_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 15.04.2021 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[warehouse_id] [int] NOT NULL,
	[warehouse_addr] [varchar](120) NULL,
	[warehouse_phone] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Склад] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (3, N'Alan Paul Net', N'Санкт-Петербург', N'89561234929', 9)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (7, N'Ширяев Вольдемар Авксентьевич', N'Санкт-Петерубрг, Проспект Ветеранов 42', N'87732046792', 10)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (8, N'Лазарев Егор Гордеевич', N'Москва, Улица Победы 78', N'89247684962', 11)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (9, N'Мясников Виссарион Филатович', N'Москва, Проспект славы 90', N'89728479452', 12)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (10, N'Мясников Виктор Андреевич', N'Санкт-Петербург, Морская 32', N'89263468354', 8)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (19, N'Nil Armno Khlon', N'Санкт-Петербург', N'+79157284363', 37)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (20, N'Name Main Den', N'Санкт-Петербург', N'+792835994334', 38)
INSERT [dbo].[Agent] ([agent_id], [agent_name], [agent_addr], [agent_phone], [id_auth]) VALUES (21, N'Klas', N'SPB', N'8971835923', 39)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[Agent_Goods] ON 

INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (3, N'AL12420', 2, 1)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (8, N'ME89120', 4, 2)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (3, N'ME89120', 6, 3)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (9, N'SD12319', 10, 4)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (10, N'LB12415', 3, 5)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (7, N'LB87218', 5, 6)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (7, N'AL12420', 4, 7)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (10, N'ME89120', 14, 8)
INSERT [dbo].[Agent_Goods] ([agent_id], [vender_code], [total], [id]) VALUES (3, N'LB12415', 3, 9)
SET IDENTITY_INSERT [dbo].[Agent_Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Authentication] ON 

INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Admin', N'12345                                                           ', 1)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Loran', N'82940a                                                          ', 3)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Skkaal', N'628436                                                          ', 4)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'uiSdua', N'ua24kd                                                          ', 5)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'ilAKkf3', N'58001229                                                        ', 6)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Dkkso893', N'klajudgidos                                                     ', 7)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'SKlaldg', N'723469dk                                                        ', 8)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'KKKSlfls', N'572040slg                                                       ', 9)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Mjkleeed3', N'57193mnad                                                       ', 10)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'36shfji3', N'kldfh346k                                                       ', 11)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Akdfghl1', N'llasigi31                                                       ', 12)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Llajdguido', N'yh2i3tyhl                                                       ', 13)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'kiAsofg12', N'Llaidgod2                                                       ', 14)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'NewUser23', N'59e49fbb6f6f6d18c32f18fc0bd9180393f702b2b53419af63507aa5d8a24494', 15)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Mjdsgdooh', N'c3cc1718675c8cd15c868239ed2741a2f2261a0b322f39002d55cee0ccaf1808', 20)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Kasllflfl', N'0f0d4bd3cdd2ff421482504638bdc98663d64079e84e096e783a22d9d25b9676', 21)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'kkadkgldgfd', N'7e8531421f591d6c4ca09f5aa01bf875d2a7c120c0ba71b70352aa6095c8e504', 22)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'jakskfdgdh', N'5f345156e020b597148e709a09f4d581d5f156b714223fb86e8552541a60a896', 23)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'lglhfpokpyt', N'ee3732156731200eb4988bf79c5875b0d7ca9fc03615e449b8cd7f70eba3ca2e', 24)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'kadkfsdfsd', N'1acf35a8c62ba68ade3e8f67e987896a328ef39b9d6f04db6ab2b39bd0f32e82', 25)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Jjadosogdsf', N'13fd32d09681cba805800fa6423fb1723b616758f2b509b512b94241eb056d92', 27)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Kllsifii346', N'e4caea0c8b9a237a39dd1d32a04c566bdb39d00b98afd01460b2d4c0adf67cb0', 28)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Ludvik', N'6ccf5eb0b98684778c3b1a5415fdeecd6819dd2ef1cfb22eee2c775cc41dc9cf', 29)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'ikfgpo[3ko4p', N'cc399d73903f06ee694032ab0538f05634ff7e1ce5e8e50ac330a871484f34cf', 30)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'klaofo', N'3d0a234093378eaffc3fe01cd6edbc3cd4302a37457b0c3bb3dd464a52c5a070', 31)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Main', N'd17f25ecfbcc7857f7bebea469308be0b2580943e96d13a3ad98a13675c4bfc2', 36)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'JHASikfgs', N'00ce76b9adc8717ebf08dffdab8e108398d3af58b082230b2397906d50ff55b9', 37)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Main2', N'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 38)
INSERT [dbo].[Authentication] ([login], [password], [id_auth]) VALUES (N'Login', N'128851640439df5e9720d1c745e363bbedac7705ea52a51eaf7b5ada9fb61a94', 39)
SET IDENTITY_INSERT [dbo].[Authentication] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (1, CAST(N'2020-09-24T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (2, CAST(N'2020-08-12T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (3, CAST(N'2020-10-14T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (4, CAST(N'2020-09-09T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (5, CAST(N'2020-09-28T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (6, CAST(N'2012-12-23T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (7, CAST(N'2020-12-02T23:06:15.0166667' AS DateTime2), 1)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (10, CAST(N'2020-12-02T23:26:08.8300000' AS DateTime2), 3)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (11, CAST(N'2020-12-03T00:43:11.1366667' AS DateTime2), 3)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (12, CAST(N'2020-12-07T12:35:45.1300000' AS DateTime2), 1)
INSERT [dbo].[Delivery] ([delivery_id], [delivery_date], [warehouse_id]) VALUES (13, CAST(N'2020-12-07T12:35:58.3866667' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[delivery_list] ON 

INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (8, 1, N'ME89120', 3)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (9, 1, N'AL12420', 15)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (10, 1, N'AL23519', 5)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (11, 2, N'AL23519', 9)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (12, 2, N'SD33117', 3)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (13, 2, N'ME89120', 5)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (14, 3, N'ME89120', 8)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (15, 3, N'SD33117', 4)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (16, 4, N'SD33117', 2)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (18, 4, N'AL23519', 1)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (19, 5, N'SD12319', 10)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (20, 5, N'ME89120', 5)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1029, 10, N'LB12415', 5)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1030, 11, N'SD12319', 3)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1031, 11, N'AL23519', 5)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1032, 11, N'ME89120', 6)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1033, 12, N'ME82319', 3)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1034, 12, N'SD12319', 5)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1035, 13, N'ME82319', 6)
INSERT [dbo].[delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (1036, 13, N'SD12319', 5)
SET IDENTITY_INSERT [dbo].[delivery_list] OFF
GO
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (1, N'Boris Kennedy Jay', N'89217770025', N'Менеджер', N'Санкт-Петербург')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (3, N'Ken Tennesy Jay', N'89325757102', N'Менеджер склада', N'Улица Ленина')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (4, N'Зайцева Биргит Ивановна', N'89273834567', N'Администратор', N'Санкт-Петербург')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (5, N'Абрамова Ивона Валентиновна', N'89267438545', N'Менеджер', N'Москва, улица Красная 21')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (6, N'Титова Софья Альбертовна', N'88129680460', N'Менеджер склада', N'Санкт-Петерубрг, Улица Ленина 47')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (7, N'Фомичёв Варлам Лукьянович', N'89937239012', N'Менеджер', N'Москва, улица Красноармейская 28')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (25, N'Kkasifios', N'8389469343', N'Менеджер', N'Moscow')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (27, N'Kent Mill', N'899275718343', N'Менеджер', N'Saint-Petersburg')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (28, N'Killlsfkk32', N'8999997347533', N'Менеджер', N'Saint-Petersburg')
INSERT [dbo].[Employee] ([id_auth], [name], [phone], [position], [employee_addr]) VALUES (36, N'Main E', N'89237685355', N'Администратор', N'SPB')
GO
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'AL12420', N'Мебель', N'Диван Шведский', N'материал: Хлопок', 14000.5000, 4)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'AL23519', N'Мебель', N'Стол Шведский', N'материал: Сосна', 12000.0000, 3)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'BK18319', N'Клавиатура компьютерная', N'Logitech K120', N'материал: пластик', 1200.0000, 3)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'LB12415', N'Рюкзаки', N'Рюкзак школьный', N'материал: Синтетика', 1599.9900, 6)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'LB87218', N'Рюкзаки', N'Сумка Летняя', N'материал: кожа', 2800.0000, 6)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'ME82319', N'Монитор', N'Philips 189DK1', N'материал: Пластик', 8204.5000, 8)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'ME89120', N'Монитор', N'LG 7DA2', N'материал: Пластик, Цвет Черный', 9781.3000, 8)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'SD12319', N'Столовые приборы', N'Ложки Столовые', N'материал: Сталь', 500.3900, 2)
INSERT [dbo].[Goods] ([vender_code], [category], [name], [description], [price], [commission]) VALUES (N'SD33117', N'Столовые приборы', N'Ножи', N'материал: Сплав металлов', 1200.0000, 2)
GO
INSERT [dbo].[History_Delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (29, 6, N'AL23519', 10)
INSERT [dbo].[History_Delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (30, 6, N'ME89120', 4)
INSERT [dbo].[History_Delivery_list] ([id], [delivery_id], [vender_code], [total]) VALUES (21, 5, N'AL23519', 1)
GO
INSERT [dbo].[History_order_list] ([id], [order_id], [vender_code], [total]) VALUES (18, 10, N'SD12319', 1)
INSERT [dbo].[History_order_list] ([id], [order_id], [vender_code], [total]) VALUES (21, 9, N'SD12319', 7)
INSERT [dbo].[History_order_list] ([id], [order_id], [vender_code], [total]) VALUES (26, 8, N'LB87218', 2)
INSERT [dbo].[History_order_list] ([id], [order_id], [vender_code], [total]) VALUES (30, 22, N'LB12415', 3)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (5, 3, CAST(N'2020-09-23T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (6, 7, CAST(N'2020-10-12T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (7, 8, CAST(N'2020-10-07T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (8, 9, CAST(N'2020-10-05T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (9, 10, CAST(N'2020-10-14T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (10, 3, CAST(N'2020-09-08T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (13, 3, CAST(N'2020-12-02T20:29:05.6000000' AS DateTime2), 3)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (21, 19, CAST(N'2020-12-03T04:25:28.3033333' AS DateTime2), 5)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (22, 9, CAST(N'2020-12-05T03:24:00.3566667' AS DateTime2), 1)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (23, 10, CAST(N'2020-12-07T12:35:16.2900000' AS DateTime2), 1)
INSERT [dbo].[Order] ([order_id], [agent_id], [order_date], [status_id]) VALUES (24, 3, CAST(N'2020-12-10T20:18:11.6966667' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_list] ON 

INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (2, 5, N'LB87218', 2)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (3, 6, N'SD33117', 5)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (4, 5, N'SD12319', 4)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (5, 6, N'AL23519', 8)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (6, 7, N'SD33117', 6)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (7, 7, N'AL12420', 10)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (8, 7, N'AL23519', 4)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (9, 8, N'ME82319', 5)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (12, 8, N'LB12415', 12)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (13, 9, N'ME89120', 12)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (14, 9, N'LB87218', 12)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (17, 10, N'ME82319', 14)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (22, 6, N'SD33117', 5)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (23, 7, N'LB87218', 3)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (24, 8, N'SD33117', 2)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (27, 21, N'ME82319', 3)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (28, 21, N'AL23519', 6)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (29, 21, N'BK18319', 6)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (31, 22, N'ME89120', 5)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (32, 23, N'AL23519', 5)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (33, 23, N'AL12420', 8)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (34, 24, N'ME89120', 2)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (35, 24, N'LB87218', 5)
INSERT [dbo].[Order_list] ([id], [order_id], [vender_code], [total]) VALUES (36, 24, N'SD12319', 3)
SET IDENTITY_INSERT [dbo].[Order_list] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([status_id], [status]) VALUES (1, N'Заказ создан')
INSERT [dbo].[Order_Status] ([status_id], [status]) VALUES (2, N'Заказ обрабатывается')
INSERT [dbo].[Order_Status] ([status_id], [status]) VALUES (3, N'Заказ отправлен')
INSERT [dbo].[Order_Status] ([status_id], [status]) VALUES (4, N'Заказ доставлен')
INSERT [dbo].[Order_Status] ([status_id], [status]) VALUES (5, N'Заказ отменён')
INSERT [dbo].[Order_Status] ([status_id], [status]) VALUES (6, N'Заказ завершён')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
INSERT [dbo].[Warehouse] ([warehouse_id], [warehouse_addr], [warehouse_phone]) VALUES (1, N'Санкт-Петербург, Улица нижняя 23', N'89917345010')
INSERT [dbo].[Warehouse] ([warehouse_id], [warehouse_addr], [warehouse_phone]) VALUES (2, N'Санкт-Петербург', N'87812358102')
INSERT [dbo].[Warehouse] ([warehouse_id], [warehouse_addr], [warehouse_phone]) VALUES (3, N'Москва, Улица Красноармейская 27', N'81635894131')
INSERT [dbo].[Warehouse] ([warehouse_id], [warehouse_addr], [warehouse_phone]) VALUES (4, N'Москва, Улица Победы 124', N'80091923512')
GO
SET IDENTITY_INSERT [dbo].[Warehouse_Goods] ON 

INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (1, 10, N'AL23519', 1)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (1, 25, N'AL12420', 2)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (1, 5, N'SD12319', 3)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (1, 12, N'SD33117', 4)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (2, 19, N'AL23519', 5)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (1, 45, N'LB12415', 6)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (1, 20, N'LB87218', 7)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (2, 15, N'ME89120', 8)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (2, 10, N'SD12319', 9)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (2, 6, N'SD33117', 10)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (3, 4, N'SD33117', 11)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (3, 10, N'LB87218', 12)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (3, 2, N'AL23519', 13)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (3, 0, N'ME89120', 14)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (3, 1, N'LB12415', 15)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (4, 18, N'ME89120', 16)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (4, 4, N'AL23519', 17)
INSERT [dbo].[Warehouse_Goods] ([warehouse_id], [total], [vender_code], [id]) VALUES (4, 23, N'SD12319', 18)
SET IDENTITY_INSERT [dbo].[Warehouse_Goods] OFF
GO
/****** Object:  Index [IX_Agent]    Script Date: 15.04.2021 20:46:01 ******/
ALTER TABLE [dbo].[Agent] ADD  CONSTRAINT [IX_Agent] UNIQUE NONCLUSTERED 
(
	[id_auth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Authentication]    Script Date: 15.04.2021 20:46:01 ******/
ALTER TABLE [dbo].[Authentication] ADD  CONSTRAINT [IX_Authentication] UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee]    Script Date: 15.04.2021 20:46:01 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
(
	[id_auth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF_Delivery_delivery_date]  DEFAULT (getdate()) FOR [delivery_date]
GO
ALTER TABLE [dbo].[History_Employee] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_order_date]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_status_id]  DEFAULT ((0)) FOR [status_id]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Authentication] FOREIGN KEY([id_auth])
REFERENCES [dbo].[Authentication] ([id_auth])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Authentication]
GO
ALTER TABLE [dbo].[Agent_Goods]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Goods_Agent] FOREIGN KEY([agent_id])
REFERENCES [dbo].[Agent] ([agent_id])
GO
ALTER TABLE [dbo].[Agent_Goods] CHECK CONSTRAINT [FK_Agent_Goods_Agent]
GO
ALTER TABLE [dbo].[Agent_Goods]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Goods_Goods] FOREIGN KEY([vender_code])
REFERENCES [dbo].[Goods] ([vender_code])
GO
ALTER TABLE [dbo].[Agent_Goods] CHECK CONSTRAINT [FK_Agent_Goods_Goods]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Warehouse1] FOREIGN KEY([warehouse_id])
REFERENCES [dbo].[Warehouse] ([warehouse_id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Warehouse1]
GO
ALTER TABLE [dbo].[delivery_list]  WITH CHECK ADD  CONSTRAINT [FK_delivery_list_Delivery] FOREIGN KEY([delivery_id])
REFERENCES [dbo].[Delivery] ([delivery_id])
GO
ALTER TABLE [dbo].[delivery_list] CHECK CONSTRAINT [FK_delivery_list_Delivery]
GO
ALTER TABLE [dbo].[delivery_list]  WITH CHECK ADD  CONSTRAINT [FK_delivery_list_Goods] FOREIGN KEY([vender_code])
REFERENCES [dbo].[Goods] ([vender_code])
GO
ALTER TABLE [dbo].[delivery_list] CHECK CONSTRAINT [FK_delivery_list_Goods]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Authentication] FOREIGN KEY([id_auth])
REFERENCES [dbo].[Authentication] ([id_auth])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Authentication]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Agent1] FOREIGN KEY([agent_id])
REFERENCES [dbo].[Agent] ([agent_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Agent1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Order_Status] ([status_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order_Status]
GO
ALTER TABLE [dbo].[Order_list]  WITH CHECK ADD  CONSTRAINT [FK_Order_list_Goods] FOREIGN KEY([vender_code])
REFERENCES [dbo].[Goods] ([vender_code])
GO
ALTER TABLE [dbo].[Order_list] CHECK CONSTRAINT [FK_Order_list_Goods]
GO
ALTER TABLE [dbo].[Order_list]  WITH CHECK ADD  CONSTRAINT [FK_Order_list_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_list] CHECK CONSTRAINT [FK_Order_list_Order]
GO
ALTER TABLE [dbo].[Warehouse_Goods]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Goods_Goods] FOREIGN KEY([vender_code])
REFERENCES [dbo].[Goods] ([vender_code])
GO
ALTER TABLE [dbo].[Warehouse_Goods] CHECK CONSTRAINT [FK_Warehouse_Goods_Goods]
GO
ALTER TABLE [dbo].[Warehouse_Goods]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Goods_Warehouse] FOREIGN KEY([warehouse_id])
REFERENCES [dbo].[Warehouse] ([warehouse_id])
GO
ALTER TABLE [dbo].[Warehouse_Goods] CHECK CONSTRAINT [FK_Warehouse_Goods_Warehouse]
GO
ALTER TABLE [dbo].[Agent_Goods]  WITH CHECK ADD  CONSTRAINT [agent_goods_total] CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[Agent_Goods] CHECK CONSTRAINT [agent_goods_total]
GO
ALTER TABLE [dbo].[delivery_list]  WITH CHECK ADD  CONSTRAINT [delive_list_total] CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[delivery_list] CHECK CONSTRAINT [delive_list_total]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [Goods_commission] CHECK  (([commission]>=(0)))
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [Goods_commission]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [Goods_price] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [Goods_price]
GO
ALTER TABLE [dbo].[Order_list]  WITH CHECK ADD  CONSTRAINT [Order_list_total] CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[Order_list] CHECK CONSTRAINT [Order_list_total]
GO
ALTER TABLE [dbo].[Warehouse_Goods]  WITH CHECK ADD  CONSTRAINT [Warehouse_goods_total] CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[Warehouse_Goods] CHECK CONSTRAINT [Warehouse_goods_total]
GO
/****** Object:  StoredProcedure [dbo].[Add_Agent]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Agent]
@agent_name AS varchar(80),
@agent_phone AS varchar(16),
@agent_addr AS varchar(100),
@id_auth as int AS
INSERT INTO Agent(agent_name, agent_phone, agent_addr, id_auth)
VALUES (@agent_name, @agent_phone, @agent_addr, @id_auth);
GO
/****** Object:  StoredProcedure [dbo].[Add_auth]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_auth] 
@login varchar(30),
@password nchar(64) AS
INSERT INTO Authentication(login, password)
VALUES (@login, @password);
GO
/****** Object:  StoredProcedure [dbo].[Add_Delivery]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Delivery]
@warehouse_id AS INT AS
INSERT INTO Delivery (delivery_date, warehouse_id)
VALUES (DEFAULT, @warehouse_id);
GO
/****** Object:  StoredProcedure [dbo].[Add_Delivery_list]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Delivery_list]
@delivery_id AS INT,
@vender_code AS varchar(30),
@total AS INT AS
INSERT INTO Delivery_list(delivery_id, vender_code, total)
VALUES (@delivery_id, @vender_code, @total);
GO
/****** Object:  StoredProcedure [dbo].[Add_Employee]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Employee]
@name AS varchar(80),
@phone AS varchar(16),
@position AS varchar(100),
@addr AS varchar(150),
@id_auth AS int AS
INSERT INTO Employee([name], phone, position, employee_addr, id_auth)
VALUES (@name, @phone, @position, @addr, @id_auth);
GO
/****** Object:  StoredProcedure [dbo].[Add_Order]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Order]
@agent_id AS INT,
@status_id AS INT AS
INSERT INTO [Order](agent_id, status_id)
VALUES (@agent_id, @status_id);
GO
/****** Object:  StoredProcedure [dbo].[Add_Order_List]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Order_List] 
@order_id AS INT,
@vender_code AS varchar(30),
@total AS INT AS
INSERT INTO Order_list (order_id, vender_code, total)
VALUES (@order_id, @vender_code, @total);
GO
/****** Object:  StoredProcedure [dbo].[Agent_goods_in_stock]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agent_goods_in_stock]
@agent_name as varchar(80) AS
SELECT a.agent_name, g.name AS good_name, g.category, g.description, g.price, g.commission, ag.total, ag.agent_id
FROM Goods g
INNER JOIN Agent_Goods ag ON g.vender_code = ag.vender_code
INNER JOIN Agent a ON a.agent_id = ag.agent_id
WHERE a.agent_name = @agent_name;
GO
/****** Object:  StoredProcedure [dbo].[Agent_info]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agent_info] @agent_name AS varchar(80) AS
SELECT agent_name, agent_addr, agent_phone
FROM Agent
WHERE agent_name = @agent_name;
GO
/****** Object:  StoredProcedure [dbo].[Change_order_status]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Change_order_status]
	@order_id int,
	@status_id int
AS
	UPDATE [Order]
	SET status_id = @status_id
	WHERE order_id = @order_id
GO
/****** Object:  StoredProcedure [dbo].[Delete_good_from_delivery]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_good_from_delivery]
@delivery_id AS INT,
@vender_code AS varchar(30) AS
DELETE FROM delivery_list
WHERE delivery_id = @delivery_id AND vender_code = @vender_code
GO
/****** Object:  StoredProcedure [dbo].[Delivery_Goods_info]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delivery_Goods_info] 
@delivery_id as INT AS
SELECT g.name, g.description, g.price, g.commission, d.delivery_id, d.delivery_date
FROM Delivery d
LEFT JOIN delivery_list t ON t.delivery_id = d.delivery_id
INNER JOIN Goods g On g.vender_code = t.vender_code
WHERE d.delivery_id = @delivery_id;
GO
/****** Object:  StoredProcedure [dbo].[Done_orders]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--query26
CREATE PROCEDURE [dbo].[Done_orders]
@left as datetime,
@right as datetime AS
SELECT t.vender_code, t.total, d.order_id, d.order_date, d.agent_id
FROM [Order] d
INNER JOIN Order_list t ON t.order_id = d.order_id
WHERE d.status_id = 5 
AND d.order_date BETWEEN @left and @right;
GO
/****** Object:  StoredProcedure [dbo].[Employee_position]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_position] @position AS varchar(50) AS
SELECT name, phone, position, employee_addr
FROM Employee
WHERE position = @position;
GO
/****** Object:  StoredProcedure [dbo].[Get_last_id_auth]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_last_id_auth] 
@id as INT OUT AS
BEGIN
SET @id = (SELECT TOP 1 id_auth FROM Authentication
ORDER BY id_auth DESC)
RETURN @id
END
GO
/****** Object:  StoredProcedure [dbo].[Get_last_id_delivery]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_last_id_delivery]
@id as INT OUT AS
BEGIN
SET @id = (SELECT TOP 1 delivery_id FROM Delivery
ORDER BY delivery_id DESC)
RETURN @id
END
GO
/****** Object:  StoredProcedure [dbo].[Get_last_id_order]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_last_id_order]
@idReturn as INT OUT AS
BEGIN
SET @idReturn = (SELECT TOP 1 order_id FROM [Order]
ORDER BY order_id DESC)
RETURN @idReturn
END
GO
/****** Object:  StoredProcedure [dbo].[Get_user_password]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_user_password]
@login varchar(30) AS
SELECT password
FROM [Authentication]
WHERE login = @login
GO
/****** Object:  StoredProcedure [dbo].[Good_price_more]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Good_price_more] @price_edge AS FLOAT AS
SELECT *
FROM Goods
WHERE price >= @price_edge;
GO
/****** Object:  StoredProcedure [dbo].[Goods_Agent]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Goods_Agent] 
@agent_id as INT AS
SELECT g.name, g.vender_code, t.total, d.agent_id, d.order_id
FROM  [Order] d
LEFT JOIN Order_list t ON t.order_id = d.order_id
INNER JOIN Goods g ON g.vender_code = t.vender_code
WHERE d.agent_id = @agent_id
GO
/****** Object:  StoredProcedure [dbo].[Goods_agent_category]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Goods_agent_category]
@agent_id as INT,
@category as varchar(40) AS
SELECT g.name, g.category, g.price, ag.total, g.commission, g.description
FROM Agent_Goods ag
INNER JOIN Goods g ON g.vender_code = ag.vender_code
LEFT JOIN Agent a ON a.agent_id = ag.agent_id
WHERE ag.agent_id = @agent_id
AND g.category = @category
GO
/****** Object:  StoredProcedure [dbo].[Warehouse_Goods_in_stock]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Query32
CREATE PROCEDURE [dbo].[Warehouse_Goods_in_stock] 
@vender_code as varchar(30) AS
SELECT g.name, g.price, g.commission, wg.total, w.warehouse_addr, w.warehouse_phone
FROM Warehouse w
LEFT JOIN Warehouse_Goods wg ON wg.warehouse_id = w.warehouse_id
INNER JOIN Goods g ON g.vender_code = wg.vender_code
WHERE wg.vender_code = @vender_code AND wg.total > 0;
GO
/****** Object:  Trigger [dbo].[After_delete_delivery_list]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----
CREATE TRIGGER [dbo].[After_delete_delivery_list] On [dbo].[delivery_list]
AFTER DELETE
AS
BEGIN
INSERT INTO History_Delivery_list
SELECT  del.*
FROM deleted del
END;
GO
ALTER TABLE [dbo].[delivery_list] ENABLE TRIGGER [After_delete_delivery_list]
GO
/****** Object:  Trigger [dbo].[After_update_Goods]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[After_update_Goods] On [dbo].[Goods]
AFTER INSERT, UPDATE
AS
BEGIN
UPDATE Goods
SET category = 'Клавиатура компьютерная'
WHERE category = 'Клавиатура'
END;
GO
ALTER TABLE [dbo].[Goods] ENABLE TRIGGER [After_update_Goods]
GO
/****** Object:  Trigger [dbo].[After_update_Goods_price]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[After_update_Goods_price] ON [dbo].[Goods]
FOR UPDATE AS
IF UPDATE (price)
BEGIN

  IF EXISTS(
  SELECT l.vender_code
  FROM Order_list l 
  WHERE l.vender_code = ( SELECT del.vender_code  FROM deleted del)) 
  BEGIN 
     PRINT 'Нельзя изменить цену товара, если он находится в заказе'
	 ROLLBACK TRANSACTION
  END 
  ELSE 
  BEGIN
  
 

  PRINT 'Цена изменена'
  END
  --ROLLBACK TRANSACTION
END
GO
ALTER TABLE [dbo].[Goods] ENABLE TRIGGER [After_update_Goods_price]
GO
/****** Object:  Trigger [dbo].[After_delete_order_list]    Script Date: 15.04.2021 20:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[After_delete_order_list] ON [dbo].[Order_list]
AFTER DELETE
AS
BEGIN
INSERT INTO History_order_list
SELECT del.*
FROM deleted del
END;
GO
ALTER TABLE [dbo].[Order_list] ENABLE TRIGGER [After_delete_order_list]
GO
USE [master]
GO
ALTER DATABASE [CP] SET  READ_WRITE 
GO
