USE [master]
GO

CREATE DATABASE [TestUnP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestUnP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL_DEV\MSSQL\DATA\TestUnP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestUnP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL_DEV\MSSQL\DATA\TestUnP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestUnP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TestUnP] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TestUnP] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TestUnP] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TestUnP] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TestUnP] SET ARITHABORT OFF 
GO

ALTER DATABASE [TestUnP] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TestUnP] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TestUnP] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TestUnP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TestUnP] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TestUnP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TestUnP] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TestUnP] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TestUnP] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TestUnP] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TestUnP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TestUnP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TestUnP] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TestUnP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TestUnP] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TestUnP] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TestUnP] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TestUnP] SET RECOVERY FULL 
GO

ALTER DATABASE [TestUnP] SET  MULTI_USER 
GO

ALTER DATABASE [TestUnP] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TestUnP] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TestUnP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TestUnP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [TestUnP] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TestUnP] SET QUERY_STORE = OFF
GO

USE [TestUnP]
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [TestUnP] SET  READ_WRITE 
GO


