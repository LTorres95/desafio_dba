USE [master]
GO
/****** Object:  Database [Cars_DBA]    Script Date: 03/07/2023 13:56:06 ******/
CREATE DATABASE [Cars_DBA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Desafio_dba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Desafio_dba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Desafio_dba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Desafio_dba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cars_DBA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cars_DBA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cars_DBA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cars_DBA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cars_DBA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cars_DBA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cars_DBA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cars_DBA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cars_DBA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cars_DBA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cars_DBA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cars_DBA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cars_DBA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cars_DBA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cars_DBA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cars_DBA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cars_DBA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cars_DBA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cars_DBA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cars_DBA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cars_DBA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cars_DBA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cars_DBA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cars_DBA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cars_DBA] SET RECOVERY FULL 
GO
ALTER DATABASE [Cars_DBA] SET  MULTI_USER 
GO
ALTER DATABASE [Cars_DBA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cars_DBA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cars_DBA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cars_DBA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cars_DBA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cars_DBA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cars_DBA', N'ON'
GO
ALTER DATABASE [Cars_DBA] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cars_DBA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cars_DBA]
GO
/****** Object:  Table [dbo].[Carros]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carros](
	[CarrosID] [int] NOT NULL,
	[Modelo] [varchar](20) NULL,
	[versao] [varchar](30) NULL,
	[ano] [int] NULL,
	[valor] [numeric](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarrosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] NOT NULL,
	[nome] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContasAPagar]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContasAPagar](
	[ContaID] [int] NOT NULL,
	[LojaAssociadaID] [int] NOT NULL,
	[NomeConta] [varchar](20) NULL,
	[Valor] [numeric](8, 2) NULL,
	[DiaVencimento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedores]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores](
	[FornecedoresID] [int] NOT NULL,
	[NomeCarro] [varchar](20) NULL,
	[ValorCompra] [numeric](9, 2) NULL,
	[NomeMontadora] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[FornecedoresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionarios]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionarios](
	[FuncionariosID] [int] NOT NULL,
	[LojaVinculada] [int] NULL,
	[nome] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[FuncionariosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loja]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loja](
	[LojaID] [int] NOT NULL,
	[NomeLoja] [varchar](20) NULL,
	[LocalizacaoLoja] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[LojaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendas]    Script Date: 03/07/2023 13:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendas](
	[VendaID] [int] NOT NULL,
	[ClienteID] [int] NOT NULL,
	[CarrosID] [int] NOT NULL,
	[FuncionariosID] [int] NOT NULL,
	[LojaAssociadaID] [int] NULL,
	[ValorVenda] [numeric](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[VendaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContasAPagar]  WITH CHECK ADD FOREIGN KEY([LojaAssociadaID])
REFERENCES [dbo].[Loja] ([LojaID])
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [LojaVinculada] FOREIGN KEY([LojaVinculada])
REFERENCES [dbo].[Loja] ([LojaID])
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [LojaVinculada]
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD FOREIGN KEY([CarrosID])
REFERENCES [dbo].[Carros] ([CarrosID])
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Vendas]  WITH CHECK ADD FOREIGN KEY([FuncionariosID])
REFERENCES [dbo].[Funcionarios] ([FuncionariosID])
GO
USE [master]
GO
ALTER DATABASE [Cars_DBA] SET  READ_WRITE 
GO
