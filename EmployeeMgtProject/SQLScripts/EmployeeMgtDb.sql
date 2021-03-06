USE [master]
GO
/****** Object:  Database [EmployeeMgtDb]    Script Date: 7/12/2022 9:55:22 PM ******/
CREATE DATABASE [EmployeeMgtDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeMgtDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EmployeeMgtDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeMgtDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EmployeeMgtDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeMgtDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeMgtDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeMgtDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeMgtDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeMgtDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeMgtDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeMgtDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EmployeeMgtDb] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeMgtDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeMgtDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeMgtDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeMgtDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EmployeeMgtDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EmployeeMgtDb]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMP_QUALIFICATION]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMP_QUALIFICATION](
	[Employee_id] [int] NULL,
	[Q_id] [int] NULL,
	[Marks] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_id] [int] NOT NULL,
	[Emp_Name] [nvarchar](50) NOT NULL,
	[DOB] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Salary] [nvarchar](50) NULL,
	[Entry_BY] [nvarchar](50) NOT NULL,
	[Entry_date] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[OID] [int] NOT NULL,
	[item_name] [nvarchar](60) NULL,
	[ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Qualification_list]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualification_list](
	[Q_id] [int] NOT NULL,
	[Q_Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Customer] ([ID], [name]) VALUES (1, N'srijana')
INSERT [dbo].[Customer] ([ID], [name]) VALUES (2, N'Ram')
INSERT [dbo].[Customer] ([ID], [name]) VALUES (3, N'Shyam')
INSERT [dbo].[EMP_QUALIFICATION] ([Employee_id], [Q_id], [Marks]) VALUES (1, 5, N'56')
INSERT [dbo].[EMP_QUALIFICATION] ([Employee_id], [Q_id], [Marks]) VALUES (2, 2, N'67')
INSERT [dbo].[EMP_QUALIFICATION] ([Employee_id], [Q_id], [Marks]) VALUES (5, 1, N'40')
INSERT [dbo].[EMP_QUALIFICATION] ([Employee_id], [Q_id], [Marks]) VALUES (4, 1, N'78')
INSERT [dbo].[EMP_QUALIFICATION] ([Employee_id], [Q_id], [Marks]) VALUES (1, 2, N'40')
INSERT [dbo].[Employee] ([Employee_id], [Emp_Name], [DOB], [Gender], [Salary], [Entry_BY], [Entry_date]) VALUES (1, N'Rama sharma', N'2043-09-09', N'2', N'5000', N'hp', N'3/19/2020 10:36:02 AM')
INSERT [dbo].[Employee] ([Employee_id], [Emp_Name], [DOB], [Gender], [Salary], [Entry_BY], [Entry_date]) VALUES (2, N'nisha kc', N'2034-03-43', N'2', N'5000', N'hp', N'3/13/2020 3:21:03 PM')
INSERT [dbo].[Employee] ([Employee_id], [Emp_Name], [DOB], [Gender], [Salary], [Entry_BY], [Entry_date]) VALUES (4, N'sitasad', N'2076-11-08', N'2', N'45545', N'hp', N'3/13/2020 3:56:14 PM')
INSERT [dbo].[Employee] ([Employee_id], [Emp_Name], [DOB], [Gender], [Salary], [Entry_BY], [Entry_date]) VALUES (5, N'srijana', N'2056-09-09', N'2', N'30000', N'hp', N'9/15/2021 11:04:40 PM')
INSERT [dbo].[order] ([OID], [item_name], [ID]) VALUES (1, N'biscuits', 1)
INSERT [dbo].[order] ([OID], [item_name], [ID]) VALUES (2, N'noodles', 1)
INSERT [dbo].[order] ([OID], [item_name], [ID]) VALUES (3, N'coke', 2)
INSERT [dbo].[order] ([OID], [item_name], [ID]) VALUES (4, N'sugar', NULL)
INSERT [dbo].[Qualification_list] ([Q_id], [Q_Name]) VALUES (1, N'SLC')
INSERT [dbo].[Qualification_list] ([Q_id], [Q_Name]) VALUES (2, N'Intermediate')
INSERT [dbo].[Qualification_list] ([Q_id], [Q_Name]) VALUES (3, N'BE')
INSERT [dbo].[Qualification_list] ([Q_id], [Q_Name]) VALUES (4, N'ME')
INSERT [dbo].[Qualification_list] ([Q_id], [Q_Name]) VALUES (5, N'PHD')
ALTER TABLE [dbo].[EMP_QUALIFICATION]  WITH CHECK ADD FOREIGN KEY([Employee_id])
REFERENCES [dbo].[Employee] ([Employee_id])
GO
ALTER TABLE [dbo].[EMP_QUALIFICATION]  WITH CHECK ADD FOREIGN KEY([Q_id])
REFERENCES [dbo].[Qualification_list] ([Q_id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[Customer] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteEmployee]
(
@EmployeeID int
)
as 
begin

delete  from EMP_QUALIFICATION where Employee_id=@EmployeeID;
delete  from Employee where Employee_id=@EmployeeID;
end

GO
/****** Object:  StoredProcedure [dbo].[spDeleteQualification]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[spDeleteQualification]
( @EmployeeId int, @QualId int)
as
begin
delete from EMP_QUALIFICATION where Employee_id=@EmployeeId and Q_id=@QualId;
end
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployee]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetEmployee]
as
begin 
select * from Employee
End 
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeDetailById]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetEmployeeDetailById]
(@EmployeeID int)
as
begin 
Select * from Employee where Employee_id=@EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[spGetQualificationDetails]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetQualificationDetails]
(@EmployeeId int)
as
select EQ.*,QL.Q_Name from EMP_QUALIFICATION EQ,Qualification_list QL where 
EQ.Q_id = QL.Q_id and
EQ.Employee_id= @EmployeeId;


GO
/****** Object:  StoredProcedure [dbo].[spGetQualificationList]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetQualificationList]
as
begin
select * from Qualification_list
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertEmployee]
@EmpName nvarchar(50),
@Gender nvarchar(50),
@DOB nvarchar(50) ,
@salary nvarchar(50),
@EntryBy nvarchar(50),
@EntryDate nvarchar(50),
@id int out
as 
begin
select @id = ISNULL(max(Employee_id),0)+1 from Employee;
insert into Employee(Employee_id,Emp_Name,Gender,DOB,Salary,Entry_By,Entry_date)
values((select ISNULL(max(Employee_id),0)+1 from Employee),@EmpName,@Gender,@DOB,@salary,@EntryBy,@EntryDate)
return @id
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertQualification]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[spInsertQualification]
(
@EmployeeId int,
@QualId int,
@Marks nvarchar(50))
as 
Begin 
Insert into EMP_QUALIFICATION(Employee_id,Q_id,Marks) values(@EmployeeId,@QualId,@Marks);
End
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateEmployee]
	
@EmpName nvarchar(50),
@Gender nvarchar(50),
@DOB nvarchar(50) ,
@salary nvarchar(50),
@EntryBy nvarchar(50),
@EntryDate nvarchar(50),
@id int 
	as 
    begin
	update Employee
	set Emp_Name=@EmpName,Gender=@Gender,DOB=@DOB, Salary=@salary,Entry_By=@EntryBy,Entry_date=@EntryDate
	where Employee_id=@id;
	end

GO
/****** Object:  StoredProcedure [dbo].[spUpdateQualification]    Script Date: 7/12/2022 9:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateQualification]
(
@EmployeeId int,@QualId int ,@Marks varchar(50))
as
begin 
update EMP_QUALIFICATION
set
 Employee_id=@EmployeeId,
 Q_id=@QualId,
 Marks=@Marks
where Employee_id=@EmployeeId and Q_id=@QualId;
end
GO
USE [master]
GO
ALTER DATABASE [EmployeeMgtDb] SET  READ_WRITE 
GO
