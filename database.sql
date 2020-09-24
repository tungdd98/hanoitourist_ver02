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
	Permission tinyint default 0
	-- 0: member
	-- 1: admin
)

Create table Countries (
	Id int identity(1,1) primary key,
	Title nvarchar(max),
	IsNation tinyint default 0
	-- 0: trong nước
	-- 1: ngoài nước
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
	-- 0: k là điểm đến
	-- 1: là điểm đến
)

Create table Orders (
	Id int identity(1,1) primary key, 
	CustomerId int foreign key(CustomerId) references Customers(Id),
	UserId int foreign key(UserId) references Users(Id),
	Status tinyint default 0,
	-- 0: chưa gọi xác nhận
	-- 1: đã thanh toán
	-- 2: đã đặt cọc
	-- 3: đã hoàn thành
	-- 4: đã huỷ tour
	Total float,
	TypePayment tinyint default 0,
	-- 0: thanh toán 20%
	-- 1: thanh toán toàn bộ
	MethodPayment tinyint default 0,
	-- 0: Thanh toán tại nhà
	-- 1: Thanh toán trực tiếp tại cty,
	CreateAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
	StartTime time
)

Create table PriceTour (
	OriginalPrice float default 0,
	Price float default 0,
	CustomerTypeId int foreign key(CustomerTypeId) references CustomerType(Id) on update cascade on delete cascade,
	TourId varchar(100) foreign key(TourId) references Tours(Id) on update cascade on delete cascade,
	Primary key(CustomerTypeId, TourId)
)

Create table OrderDetail (
	Id int identity(1,1) primary key, 
	OrderId int foreign key(OrderId) references Orders(Id),
	TourId varchar(100),
	CustomerTypeId int,
	DepartureDayId int,
	Quantity int 
)

Create table Images (
	Id int identity(1,1) primary key, 
	Title nvarchar(max),
	Thumbnail varchar(max)
)

Create table CustomerSales (
	Id int identity(1,1) primary key,
	Name nvarchar(max),
	Email nvarchar(50),
	Phone varchar(50)
)

-- Thêm mới dữ liệu

Insert into Users values 
	('e10adc3949ba59abbe56e057f20f883e', 'admin', N'Việt Nam', N'Hà Nội', '0973793711', 'tungdd98@gmail.com', N'Không có', 1)
	
Insert into Countries values
	(N'Miền Bắc', 0),
	(N'Miền Trung', 0),
	(N'Miền Nam', 0)
	
Insert into Locations values
	(1, N'Hà Nội', 'hanoi.jpg', N'Hà Nội là thủ đô của Việt Nam, cũng là kinh đô của hầu hết các vương triều phong kiến tại Việt Nam trước đây. Do đó, lịch sử Hà Nội gắn liền với sự thăng trầm của lịch sử Việt Nam qua các thời kỳ. Song Song là những nét đẹp văn hóa, phong tục tập quán của con người Tràng An.', 1),
	(1, N'Mộc châu', 'mocchau.jpg', N'Mộc Châu được nhiều người ví như Đà Lạt của vùng Tây Bắc. Dù đến Mộc Châu vào bất kỳ mùa nào trong năm, du khách cũng có thể chiêm ngưỡng và trải nghiệm những điều mới lạ tại nơi đây. Khám phá những nét đẹp làm say đắm lòng người để hiểu được vì sao người ta ai cũng muốn đến Mộc Châu một lần trong đời.', 0),
	(1, N'Hà Giang', 'hagiang.jpeg', N'Hà Giang là vùng đất cao nguyên đá nổi tiếng với phong cảnh hùng vĩ đẹp tựa tranh vẽ. Thu hút du khách với những thửa ruộng bậc thang óng ả khắp Hoàng Su Phì, cung đường Mã Pí Lèng uốn lượn hiểm trở nhưng cũng đầy thơ mộng, cao nguyên Đồng Văn bên bờ sông Lô, và chợ tình Khâu Vai nhộn nhịp với những người đồng bào vùng cao hiếu khách, chân chất', 0)
	
Insert into CustomerType values 
	(N'Người lớn'),
	(N'Trẻ em')

Insert into VehicleTour values 
	(N'Tự túc'),
	(N'Xe khách')
	
Insert into TimeTour values
	(N'1 ngày 0 đêm'),
	(N'1 ngày 1 đêm'),
	(N'2 ngày 0 đêm'),
	(N'2 ngày 1 đêm')
	
Insert into Tours values 
	('Tour01', N'Khám phá Mộc Châu', 'mocchau.jpg', N'Không có', N'Không có', 1, 2, 1, 1, 30, N'Không có'),
	('Tour02', N'Khám phá Hà Giang', 'hanoi.jpg', N'Không có', N'Không có', 1, 3, 2, 1, 20, N'Không có')
	
Insert into DepartureDay values 
	('Tour01', '09/03/2020', '19:00'),
	('Tour01', '10/03/2020', '18:00'),
	('Tour02', '11/03/2020', '19:00')
	
Insert into PriceTour values 
	(5000000, 4500000, 1, 'Tour01'),
	(4000000, 2500000, 2, 'Tour01'),
	(15000000, 9000000, 1, 'Tour02'),
	(12000000, 7500000, 2, 'Tour02')

Select * from Orders
Select * from OrderDetail
Select * from Tours

