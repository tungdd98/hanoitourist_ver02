Use master
go
Drop database QuanLyDuLich
go
Create database QuanLyDuLich
go
USE QuanLyDuLich
go
Create table Customers (
	Id int identity(1,1) primary key,
	Name nvarchar(max),
	Nation nvarchar(100),
	Address ntext,
	Phone varchar(20),
	Email varchar(50),
	Content ntext
)

Create table Users (
	Id int identity(1,1) primary key,
	Password varchar(max),
	Name nvarchar(max),
	Nation nvarchar(100),
	Address ntext,
	Phone varchar(15),
	Email varchar(50),
	Content ntext,
	Permission tinyint default 0,
)

Create table Countries (
	Id int identity(1,1) primary key,
	Title nvarchar(max),
	IsNation tinyint default 0
)

Create table TimeTour (
	Id int identity(1,1) primary key,
	Title nvarchar(max)
)

Create table VehicleTour (
	Id int identity(1,1) primary key,
	Title nvarchar(max)
)

Create table CustomerType (
	Id int identity(1,1) primary key,
	Title nvarchar(max)
)

Create table Locations (
	Id int identity(1,1) primary key,
	CountryId int foreign key(CountryId) references Countries(Id) on update cascade on delete cascade,
	Title nvarchar(max),
	Thumbnail varchar(max),
	Description ntext,
	IsStart tinyint default 0
)

Create table Orders (
	Id int identity(1,1) primary key, 
	CustomerId int,
	UserId int,
	Status tinyint default 1,
	Total float
)

Create table Tours (
	Id varchar(100) primary key,
	Title nvarchar(max),
	Thumbnail varchar(max),
	Description ntext,
	Content ntext,
	DepartureLocationId int foreign key(DepartureLocationId) references Locations(Id),
	DestinationLocationId int foreign key(DestinationLocationId) references Locations(Id),
	TimeId int foreign key(TimeId) references TimeTour(Id),
	VehicleId int foreign key(VehicleId) references VehicleTour(Id),
	Place int,
	Schedule ntext
)

Create table DepartureDay (
	Id int identity(1,1) primary key,
	TourId varchar(100) foreign key(TourId) references Tours(Id) on update cascade on delete cascade,
	StartDay date,
	StartTime time,
)

create table PriceTour (
	OriginalPrice float,
	Price float,
	CustomerTypeId int foreign key(CustomerTypeId) references CustomerType(Id) on update cascade on delete cascade,
	TourId varchar(100) foreign key(TourId) references Tours(Id) on update cascade on delete cascade,
	Primary key(CustomerTypeId, TourId)
)

create table OrderDetail (
	Id int identity(1,1) primary key, 
	OrderId int,
	TourId varchar(100),
	CustomerTypeId int,
	Quantity int 
)

