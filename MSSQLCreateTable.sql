drop table [dbo].[Orders]
go
drop table [dbo].[Users]
go
drop table [dbo].[Items]
go

CREATE TABLE [dbo].[Users]
(
	[UserID] bigINT NOT NULL PRIMARY KEY identity,
	[UserName] nvarchar(32) not null,
	[FullName] nvarchar(120) not null,
	[EMail] nvarchar(78) not null,
	[Password] nvarchar(128) not null,
	[Address] nvarchar(200) not null,
	[Rank] nvarchar(25) not null
)

Create table [dbo].[Items]
(
	[ItemsID] bigint not null primary key identity,
	[ItemName] nvarchar(50) not null,
	[Price] bigint not null,
	[Quantity] int not null
)

create table [dbo].[Orders]
(
	[UserID] bigint not null foreign key references [Users](UserID),
	[ItemsID] bigint not null foreign key references [Items](ItemsID),
	[Cart] bit not null
)

insert into [dbo].[Items] (ItemName, Price, Quantity) values ('PS4', 150000, 42), ('PS5', 225000, 420), ('XBONE', 125000, 1337)
insert into [dbo].[Users] (UserName, FullName, EMail, [Password], [Address], [Rank]) values ('admin', 'admin', 'admin@matrix.globalconspracy', '1230', 'That alley down the 3rd street from the Monolith', 'member'), ('JoeSchmoe', 'Average Joe', 'Jonathan.Smith@boring.com', '*s3KKuRe-P4ssW0rd22Ł', '1600 Pennsylvania Avenue NW, Washington, DC 20500, USA', 'user')



select * from [dbo].[Items]
select * from [dbo].[Orders]
select * from [dbo].[Users]