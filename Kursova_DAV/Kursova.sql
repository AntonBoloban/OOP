USE [master]
GO
/****** Object:  Database [KursovaDB]    Script Date: 18.12.2017 17:41:49 ******/
CREATE DATABASE [KursovaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KursovaDB_dat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KursovaDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KursovaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KursovaDB.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KursovaDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KursovaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KursovaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KursovaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KursovaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KursovaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KursovaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KursovaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KursovaDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KursovaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KursovaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KursovaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KursovaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KursovaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KursovaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KursovaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KursovaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KursovaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KursovaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KursovaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KursovaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KursovaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KursovaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KursovaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KursovaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KursovaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KursovaDB] SET  MULTI_USER 
GO
ALTER DATABASE [KursovaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KursovaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KursovaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KursovaDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KursovaDB]
GO
/****** Object:  Table [dbo].[Автобус]    Script Date: 18.12.2017 17:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Автобус](
	[ID_Avtobus] [int] IDENTITY(1,1) NOT NULL,
	[Номер] [nvarchar](255) NULL,
	[Модель] [nvarchar](255) NULL,
	[Номерний_знак] [nvarchar](255) NULL,
	[Кількість_місць] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Білет]    Script Date: 18.12.2017 17:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Білет](
	[ID_Bilet] [int] IDENTITY(1,1) NOT NULL,
	[Місце] [int] NULL DEFAULT ((0)),
	[Вартість] [int] NULL DEFAULT ((0)),
	[Час_купівлі] [datetime] NULL,
	[П_І_Б_пасажира] [nvarchar](50) NULL,
	[Паспорт] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Водій]    Script Date: 18.12.2017 17:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Водій](
	[ID_Vodij] [int] IDENTITY(1,1) NOT NULL,
	[П_І_Б_водія] [nvarchar](255) NULL,
	[Дата_народження] [datetime] NULL,
	[Паспорт] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Диспетчер]    Script Date: 18.12.2017 17:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Диспетчер](
	[ID_Dispetcher] [int] IDENTITY(1,1) NOT NULL,
	[П_І_Б_диспетчера] [nvarchar](30) NULL,
	[Дата_народження] [datetime] NULL,
	[Адреса] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Маршрут]    Script Date: 18.12.2017 17:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Маршрут](
	[ID_Marshrut] [int] IDENTITY(1,1) NOT NULL,
	[Номер_маршруту] [nvarchar](255) NULL,
	[Пункт_призначення] [nvarchar](255) NULL,
	[Район] [nvarchar](255) NULL,
	[Область] [nvarchar](255) NULL,
	[Відстань] [int] NULL DEFAULT ((0)),
	[Вага] [int] NULL DEFAULT ((0)),
	[Час_відправлення] [datetime] NULL,
	[Час_прибуття] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Перевезення]    Script Date: 18.12.2017 17:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Перевезення](
	[ID_Pereveznia] [int] IDENTITY(1,1) NOT NULL,
	[Номер] [nvarchar](15) NULL,
	[ID_Marshrut] [int] NULL,
	[ID_Bilet] [int] NULL,
	[ID_Dispetcher] [int] NULL,
	[ID_Avtobus] [int] NULL,
	[ID_Vodij] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Автобус] ON 

INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (1, N'2-5', N'IKARUS', N'АІ 1299 ВО', 40)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (2, N'2-1', N'ЛАЗ-100', N'АІ 7777 ВВ', 41)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (3, N'2-А', N'IKARUS', N'АІ 3938 ВА', 25)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (5, N'20-В', N'Sprinter', N'AI 5467 CO', 18)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (7, N'13-А', N'Sprinter', N'AA 1264 BT', 25)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (8, N'3-2', N'Sprinter', N'АА 6453 КР', 21)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (9, N'20-В', N'IKARUS', N'AA 3416 PH', 35)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (10, N'4-1', N'IKARUS', N'AI 7894 AB', 45)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (11, N'7-2', N'Sprinter', N'AI 6341 AE', 25)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (12, N'8-P', N'Sprinter', N'AA 3167 IH', 20)
INSERT [dbo].[Автобус] ([ID_Avtobus], [Номер], [Модель], [Номерний_знак], [Кількість_місць]) VALUES (13, N'18-A', N'ЛАЗ-100', N'АА 3190 РП', 35)
SET IDENTITY_INSERT [dbo].[Автобус] OFF
SET IDENTITY_INSERT [dbo].[Білет] ON 

INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (1, 17, 140, CAST(N'2017-03-07 14:24:00.000' AS DateTime), N'Іванов І.І.', N'ЛО 494888')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (2, 4, 150, CAST(N'2017-03-02 14:54:00.000' AS DateTime), N'Петров П.П.', N'ДС 203999')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (3, 32, 160, CAST(N'2017-03-08 15:25:00.000' AS DateTime), N'Сідоров С.С.', N'ВС 393939')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (4, 11, 150, CAST(N'2017-03-03 13:00:00.000' AS DateTime), N'Сидоренко С.М.', N'КО 009888')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (5, 35, 125, CAST(N'2017-03-02 17:00:00.000' AS DateTime), N'Сигиденко Н.М.', N'ВС 838388')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (12, 12, 120, CAST(N'2017-03-21 01:50:41.000' AS DateTime), N'Майнак П.П.', N'АП 567890')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (13, 23, 145, CAST(N'2017-03-14 20:30:17.000' AS DateTime), N'Жарбченко А.П.', N'ВА 459384')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (14, 12, 123, CAST(N'2017-03-15 13:30:43.000' AS DateTime), N'Варбанов А.П.', N'ВА 421684')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (15, 13, 134, CAST(N'2017-03-08 20:31:25.000' AS DateTime), N'Пупкін В.Р.', N'ФВ 313585')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (16, 14, 54, CAST(N'2017-03-15 10:32:44.000' AS DateTime), N'Гінченко П.А.', N'ВВ 572891')
INSERT [dbo].[Білет] ([ID_Bilet], [Місце], [Вартість], [Час_купівлі], [П_І_Б_пасажира], [Паспорт]) VALUES (17, 6, 126, CAST(N'2017-03-14 10:36:00.000' AS DateTime), N'Занкін Н.Г.', N'ВА 342141')
SET IDENTITY_INSERT [dbo].[Білет] OFF
SET IDENTITY_INSERT [dbo].[Водій] ON 

INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (2, N'Данченко П.А.', CAST(N'1969-01-02 00:00:00.000' AS DateTime), N'ВИ 393838')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (3, N'Воронов Р.Ю.', CAST(N'1970-01-03 00:00:00.000' AS DateTime), N'НИ 398399')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (4, N'Петренко Д.Д.', CAST(N'1969-06-09 00:00:00.000' AS DateTime), N'КА 681485')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (5, N'Юсупов К.М.', CAST(N'1977-11-12 00:00:00.000' AS DateTime), N'ПВ 561248')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (6, N'Маловченко С.С.', CAST(N'1974-09-23 00:00:00.000' AS DateTime), N'РК 081473')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (11, N'Колобков А.П.', CAST(N'1974-11-21 00:00:00.000' AS DateTime), N'ВА 458693')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (12, N'Адамюк А.О.', CAST(N'1988-12-26 00:00:00.000' AS DateTime), N'АА 451535')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (13, N'Майданик Н.О.', CAST(N'1984-06-12 00:00:00.000' AS DateTime), N'ВА 417290')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (14, N'Журков Є.А.', CAST(N'1978-12-26 00:00:00.000' AS DateTime), N'ВА 418406')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (15, N'Карпін Р.Н.', CAST(N'1981-02-26 00:00:00.000' AS DateTime), N'АП 635115')
INSERT [dbo].[Водій] ([ID_Vodij], [П_І_Б_водія], [Дата_народження], [Паспорт]) VALUES (16, N'Рибак Н.Р.', CAST(N'1985-06-13 00:00:00.000' AS DateTime), N'АП 632515')
SET IDENTITY_INSERT [dbo].[Водій] OFF
SET IDENTITY_INSERT [dbo].[Диспетчер] ON 

INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (2, N'Соколова С.С.', CAST(N'1975-08-15 00:00:00.000' AS DateTime), N'м. Сквира')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (3, N'Микитенко В.В.', CAST(N'1985-12-12 00:00:00.000' AS DateTime), N'м. Львів')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (4, N'Корзун Л.А.', CAST(N'1980-11-01 00:00:00.000' AS DateTime), N'м. Київ')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (5, N'Балченко Д.Д.', CAST(N'1978-09-02 00:00:00.000' AS DateTime), N'м. Біла Церква')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (6, N'Юрченко О.О.', CAST(N'1976-12-01 00:00:00.000' AS DateTime), N'м. Умань')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (9, N'Давиденко А.Й.', CAST(N'1974-07-11 00:00:00.000' AS DateTime), N'м. Біла Церква')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (10, N'Колков А.П.', CAST(N'1975-11-21 00:00:00.000' AS DateTime), N'м. Біла Церква')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (11, N'Нурков П.П.', CAST(N'1974-11-21 00:00:00.000' AS DateTime), N'м. Умань')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (12, N'Усіков К.Н.', CAST(N'1978-09-02 00:00:00.000' AS DateTime), N'м. Біла Церква')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (13, N'Ветріков А.А.', CAST(N'1975-08-15 00:00:00.000' AS DateTime), N'м. Умань')
INSERT [dbo].[Диспетчер] ([ID_Dispetcher], [П_І_Б_диспетчера], [Дата_народження], [Адреса]) VALUES (14, N'Жаріков П.А.', CAST(N'1978-09-02 00:00:00.000' AS DateTime), N'м. Київ')
SET IDENTITY_INSERT [dbo].[Диспетчер] OFF
SET IDENTITY_INSERT [dbo].[Маршрут] ON 

INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (1, N'105', N'Чернігів', N'Чернігівський', N'Чернігівська', 226, 2, CAST(N'2017-03-08 13:20:00.000' AS DateTime), CAST(N'2017-03-08 17:25:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (2, N'104', N'Сквира', N'Сквирський', N'Київська', 40, 1, CAST(N'2017-03-12 14:00:00.000' AS DateTime), CAST(N'2017-03-12 14:35:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (3, N'104', N'Васильків', N'Васильківський', N'Київська', 50, 1, CAST(N'2017-03-11 15:20:00.000' AS DateTime), CAST(N'2017-03-11 16:05:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (4, N'105', N'Чернігів', N'Чернігівський', N'Чернігівська', 226, 2, CAST(N'2017-03-08 13:20:00.000' AS DateTime), CAST(N'2017-03-08 17:25:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (5, N'112', N'Черкаси', N'Черкаський', N'Черкаська', 180, 2, CAST(N'2017-03-10 18:10:00.000' AS DateTime), CAST(N'2017-03-10 20:40:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (6, N'107', N'Житомир', N'Житомирський', N'Житомирська', 140, 2, CAST(N'2017-03-17 17:15:00.000' AS DateTime), CAST(N'2017-03-17 19:15:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (9, N'204', N'Умань', N'Уманський', N'Черкаська', 200, 1, CAST(N'2017-03-13 19:48:00.000' AS DateTime), CAST(N'2017-03-13 21:48:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (10, N'109', N'Суми', N'Сумський', N'Сумська', 200, 2, CAST(N'2017-03-15 12:20:00.000' AS DateTime), CAST(N'2017-03-15 16:20:00.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (11, N'112', N'Фастов', N'Фастівський', N'Київська', 60, 2, CAST(N'2017-03-14 20:34:19.000' AS DateTime), CAST(N'2017-03-14 20:34:19.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (12, N'114', N'Вінниця', N'Вінницький', N'Вінницька', 250, 2, CAST(N'2017-03-14 20:35:13.000' AS DateTime), CAST(N'2017-03-14 20:35:13.000' AS DateTime))
INSERT [dbo].[Маршрут] ([ID_Marshrut], [Номер_маршруту], [Пункт_призначення], [Район], [Область], [Відстань], [Вага], [Час_відправлення], [Час_прибуття]) VALUES (14, N'344', N'Калинівка', N'Васильківський', N'Київська', 25, 2, CAST(N'2017-06-04 22:36:40.000' AS DateTime), CAST(N'2017-04-04 22:36:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Маршрут] OFF
SET IDENTITY_INSERT [dbo].[Перевезення] ON 

INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (60, N'13', 3, 3, 3, 3, 3)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (69, N'4', 4, 1, 1, 1, 1)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (84, N'23', 3, 12, 4, 7, 4)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (85, N'1', 1, 3, 5, 3, 5)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (88, N'4', 5, 1, 3, 8, 3)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (91, N'7', 1, 3, 11, 1, 9)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (92, N'56', 1, 5, 2, 8, 2)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (94, N'45', 6, 5, 2, 8, 2)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (95, N'19', 2, 3, 16, 13, 9)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (97, N'33', 12, 4, 14, 2, 6)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (99, N'51', 6, 2, 13, 12, 5)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (100, N'28', 4, 5, 3, 8, 2)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (102, N'98', 1, 3, 5, 8, 12)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (104, N'45', 4, 4, 5, 3, 14)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (109, N'77', 3, 3, 4, 3, 13)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (110, N'89', 4, 4, 3, 5, 12)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (115, N'66', 2, 5, 6, 7, 12)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (118, N'43', 3, 3, 4, 3, 13)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (119, N'45', 3, 3, 3, 7, 12)
INSERT [dbo].[Перевезення] ([ID_Pereveznia], [Номер], [ID_Marshrut], [ID_Bilet], [ID_Dispetcher], [ID_Avtobus], [ID_Vodij]) VALUES (121, N'12', 1, 17, 2, 2, 12)
SET IDENTITY_INSERT [dbo].[Перевезення] OFF
/****** Object:  Index [aaaaaАвтобус_PK]    Script Date: 18.12.2017 17:41:49 ******/
ALTER TABLE [dbo].[Автобус] ADD  CONSTRAINT [aaaaaАвтобус_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID_Avtobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Avtobus]    Script Date: 18.12.2017 17:41:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Avtobus] ON [dbo].[Автобус]
(
	[ID_Avtobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaБілет_PK]    Script Date: 18.12.2017 17:41:49 ******/
ALTER TABLE [dbo].[Білет] ADD  CONSTRAINT [aaaaaБілет_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID_Bilet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Bilet]    Script Date: 18.12.2017 17:41:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Bilet] ON [dbo].[Білет]
(
	[ID_Bilet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaВодій_PK]    Script Date: 18.12.2017 17:41:49 ******/
ALTER TABLE [dbo].[Водій] ADD  CONSTRAINT [aaaaaВодій_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID_Vodij] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaДиспетчер_PK]    Script Date: 18.12.2017 17:41:49 ******/
ALTER TABLE [dbo].[Диспетчер] ADD  CONSTRAINT [aaaaaДиспетчер_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID_Dispetcher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Dispetcher]    Script Date: 18.12.2017 17:41:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Dispetcher] ON [dbo].[Диспетчер]
(
	[ID_Dispetcher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaМаршрут_PK]    Script Date: 18.12.2017 17:41:49 ******/
ALTER TABLE [dbo].[Маршрут] ADD  CONSTRAINT [aaaaaМаршрут_PK] PRIMARY KEY NONCLUSTERED 
(
	[ID_Marshrut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Pereveznia]    Script Date: 18.12.2017 17:41:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ID_Pereveznia] ON [dbo].[Перевезення]
(
	[ID_Pereveznia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Номер]    Script Date: 18.12.2017 17:41:49 ******/
CREATE NONCLUSTERED INDEX [Номер] ON [dbo].[Перевезення]
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ПеревезенняID_Bilet]    Script Date: 18.12.2017 17:41:49 ******/
CREATE NONCLUSTERED INDEX [ПеревезенняID_Bilet] ON [dbo].[Перевезення]
(
	[ID_Bilet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ПеревезенняID_Marshrut]    Script Date: 18.12.2017 17:41:49 ******/
CREATE NONCLUSTERED INDEX [ПеревезенняID_Marshrut] ON [dbo].[Перевезення]
(
	[ID_Marshrut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'껝ᢇ䕽銪罟矬밑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Унікальний ідентифікатор транспортного засобу (ТЗ)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Avtobus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Avtobus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Автобус_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'蘽轢ㅚ䠭㶟ᒒ抏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номер ТЗ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Номер' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Номер' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Автобус_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2655' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'襁些ꈷ䦲鲾』ࣺ၇' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Марка ТЗ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Модель' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Модель' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Автобус_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Модель'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ˍ㶗斶䥁슒왹Ὗ봓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номерний знак' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Номерний_знак' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Номерний_знак' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Автобус_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Номерний_знак'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⸄뀿꺵䫐ᵕ☠ꎃ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Кількість посадкових місць' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Кількість_місць' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Кількість_місць' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Автобус_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус', @level2type=N'COLUMN',@level2name=N'Кількість_місць'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10.03.2017 22:33:29' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'12.12.2017 19:40:18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Автобус_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Автобус'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'是늹䆕᪳熭韢㞧' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Унікальний ідентифікатор білета' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Bilet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Bilet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'캽牭者䟲억抐喷螬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Місце пасажира' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Місце' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Місце' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Місце'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'﫧㔼ᓅ䌚㾤鬐飷衤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Вартість, грн.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Вартість' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Вартість' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Вартість'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4050' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'蘜鎭⬝䯮傏壐算' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата/час придбання білету в касі' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Час_купівлі' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Час_купівлі' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Час_купівлі'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2235' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䇯껩䫋㶏뛖궣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'П.І.Б. пасажира' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'П_І_Б_пасажира' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'П_І_Б_пасажира' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'П_І_Б_пасажира'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鄌ꞩ⾿䍆憑ꑆ⍠낭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Серія та номер поспорту' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Паспорт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Паспорт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10.03.2017 22:19:46' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'12.12.2017 19:40:16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Білет_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Білет'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'暙书椾䏔⮄샄㶬᭷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Унікальний ідентифікатор водія' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Vodij' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Vodij' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Водій_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1830' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⡛驩鬰䦔暨�䢁' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Прізвище, ім''я, по батькові водія' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'П_І_Б_водія' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'П_І_Б_водія' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Водій_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'П_І_Б_водія'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㱏撛㱨䛄埤떯謏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата народження водія' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Дата_народження' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Дата_народження' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Водій_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'筢ꆪ婙䚐ﾡ㳓约巵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Серія та номер паспорта водія' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Паспорт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Паспорт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Водій_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій', @level2type=N'COLUMN',@level2name=N'Паспорт'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10.03.2017 23:13:07' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'12.12.2017 19:40:14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Водій_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Водій'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'勶됦埒䬴鞧︨굲' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Унікальний ідентифікатор диспетчера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Dispetcher' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Dispetcher' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Диспетчер_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2055' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ꋻ貅䯦鲑ﱈ㐯অ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Прізвище, ім''я, по батькові диспетчера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'П_І_Б_диспетчера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'П_І_Б_диспетчера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Диспетчер_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'П_І_Б_диспетчера'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2115' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'풓芑迗仍⾘ૼ綖쬡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Дата народження диспетчера' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Дата_народження' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Дата_народження' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Диспетчер_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Дата_народження'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1755' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⪒猹鿮䇓়ꈽ杴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Адреса проживання' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Адреса' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Адреса' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Диспетчер_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер', @level2type=N'COLUMN',@level2name=N'Адреса'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10.03.2017 22:27:15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'12.12.2017 19:40:13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Диспетчер_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Диспетчер'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'〸₣ܿ䙛Ƨ쐷넨३' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Унікальний ідентифікатор маршруту' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Marshrut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Marshrut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1980' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'揫쌕䀢䴚䎗䘵륶ᆣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номер маршруту' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Номер_маршруту' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Номер_маршруту' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Номер_маршруту'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2280' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'迁⾝䪮᲏幎뷦' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Пункт призначення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Пункт_призначення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Пункт_призначення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Пункт_призначення'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1770' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⁌꭯뿆佖厌韙䂚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Район населеного пункту призначення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Район' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Район' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Район'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ݭ콟懇保뽵ꩮ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Область населеного пункту призначення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Область' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Область' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Область'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1230' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'疼霋⵲䧯�ኙ鵓쉛' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Відстань між населеними пунктами' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Відстань' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Відстань' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Відстань'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'840' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ￇᨇ鏾䢙�呢�쀴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ваговий коефіцієнт' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Вага' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Вага' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Вага'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2250' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'젤籧扆䶼ㆶᎇ렅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Час відправлення з населеного пункту 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'General Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Час_відправлення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Час_відправлення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_відправлення'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1950' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'뚡檬䉣銎ⱪᐁ쎆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Час прибуття до населеного пункту 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Час_прибуття' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Час_прибуття' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут', @level2type=N'COLUMN',@level2name=N'Час_прибуття'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10.03.2017 22:15:59' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'12.12.2017 19:40:10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Маршрут_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Маршрут'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1890' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'๘�鴭亘粞ꍑ靖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Унікальний ідентифікатор перевеpення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Pereveznia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Pereveznia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Pereveznia'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'턒駺㋃䗡눛䖖뱴' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номер перевезення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Номер' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Номер' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'Номер'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1950' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'湌ᲆ뎲䄌농仆ᰖ䕊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ідентифікатор маршруту для даного перевезення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Marshrut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Marshrut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Marshrut'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1425' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⿂ਰ䥆瞅保戋危' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ідентифікатор номеру купленого білету для даного перевезення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Bilet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Bilet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Bilet'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鿤٧䍌冋欥쳾輑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ідентифікатор номеру диспетчера, який заносить дане перевезення в базу даних' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Dispetcher' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Dispetcher' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Dispetcher'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㥫쑅䯕ﶥ٧먃縉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ідентифікатор номеру транспортного засобу, на якому здіснюється перевезення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Avtobus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Avtobus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Avtobus'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ⶰᶗ䝏㞖ឭ鶬䂺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ідентифікатор номеру водія, що здійснює перевезення' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID_Vodij' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID_Vodij' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення', @level2type=N'COLUMN',@level2name=N'ID_Vodij'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'07.03.2017 23:59:47' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'12.12.2017 19:40:06' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Перевезення_локальная' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'RowHeight', @value=N'330' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Перевезення'
GO
USE [master]
GO
ALTER DATABASE [KursovaDB] SET  READ_WRITE 
GO
