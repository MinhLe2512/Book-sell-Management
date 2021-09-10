DROP DATABASE DB_HARU
GO

CREATE DATABASE DB_HARU
GO
USE DB_HARU
GO

CREATE TABLE ChiTietSp(
	chiTietSPid int NOT NULL,
	nameTypeSP varchar(50) NOT NULL,
	nhaSanXuat varchar(50) NOT NULL,
	code varchar(50) NOT NULL,
	price int NOT NULL,
	sale float NULL,
	urlPicture varchar(300) NOT NULL,
	urlVideo varchar(300) NULL,
	quantity int NOT NULL,
	createDate datetime NULL,
	chatlieu varchar(50) NOT NULL,
	color varchar(50) NULL,
	active bit NOT NULL,
	CONSTRAINT PK_ChiTietSp PRIMARY KEY(chiTietSPid)
)

GO
CREATE TABLE comments(
	commentID int NOT NULL,
	userID_pk int NOT NULL,
	chiTietSPid_pk int NOT NULL,
	createDate datetime NOT NULL,
	rating int NOT NULL,
	content text NOT NULL,
	active bit NOT NULL,
	idCommentReplied int NULL,
	CONSTRAINT khoa_chinh_comment PRIMARY KEY(commentID, userID_pk, chiTietSPid_pk)
)
GO

CREATE TABLE userLikeComment(
	commentID_pk int NOT NULL,
	userID_pk int NOT NULL,
	CONSTRAINT pk_adminLikeComment PRIMARY KEY(commentID_pk,userID_pk)
)

GO

CREATE TABLE users(
	userID int NOT NULL,
	userName varchar(50) NOT NULL,
	gioiTinh bit NOT NULL,
	urlAvatarPicture varchar(300) NULL,
	password varchar(50) NOT NULL,
	address varchar(200) NOT NULL,
	phone varchar(13) NOT NULL,
	email varchar(80) NOT NULL,
	account varchar(50) NULL,
	ngaySinh datetime NULL,
	isAdmin bit NULL,
	CONSTRAINT PK_admin PRIMARY KEY(userID)
)
GO
CREATE TABLE DonDatHang(
	id int NOT NULL,
	ngayLap datetime default getdate(),
	ghiChu varchar(100),
	tinhTrang int default 1,--0 là chưa xác nhận, 1 là xác nhận(chưa giao), 2 là đang giao ,3 là đã thanh toán
	kieuThanhToan int, --1 là thanh toán khi nhận hàng COD, 2 là thành toán online
	hoTen varchar(50),
	sdt varchar(11),
	email varchar(50),
	diaChi varchar(50),
	CONSTRAINT PK_id PRIMARY KEY(id)
)
GO
CREATE TABLE ChiTietDonDat(
	idDSP int references DonDatHang(id),
	idSP int references chiTietSp(chiTietSPid),
	soLuong int,
	constraint PK_CTDD primary key(idDSP,idSP),
)

ALTER TABLE comments
ADD
CONSTRAINT FK_comments_ChiTietSp FOREIGN KEY(chiTietSPid_pk) REFERENCES ChiTietSp(chiTietSPid)

ALTER TABLE comments
ADD
CONSTRAINT FK_comments_users FOREIGN KEY(userID_pk) REFERENCES users(userID)

ALTER TABLE userLikeComment
ADD
CONSTRAINT FK_userLikeComment_users FOREIGN KEY(userID_pk) REFERENCES users(userID)


INSERT INTO ChiTietSp VALUES
(1, N'Lọ hoa bằng gỗ', 'Thanh Tùng', 'HM001', 40000, NULL, 'https://drive.google.com/file/d/1cwr1kWd28fi15UpFOvdKE--2xeqztgJ2/view?usp=sharing', NULL, 10, NULL, N'Gỗ', NULL, 1),
(2, N'Bình sáp siêu cute', 'Mỹ Phúc', 'HM002', 5000, NULL, 'https://drive.google.com/file/d/1XSDW05GNRfd0gFGU1Q3zFv9kv635v34Z/view?usp=sharing', NULL, 10, NULL, N'Sáp', NULL, 1),
(3, N'Bờm cài bông hoa', 'Thảo My', 'HM003', 22000, NULL, 'https://drive.google.com/file/d/1wWWv-Qb0BAsZoO95e7CQ9I3_fcvYqEzN/view?usp=sharing', NULL, 20, NULL, N'Vải', NULL, 1),
(4, N'Chuông gió dễ thương', N'Hà Uyên', 'HM004', 12000, NULL, 'https://drive.google.com/file/d/1OlIMR0bbMW2DTZh_8oBF6YhwwaIw2iPz/view?usp=sharing', NULL, 5, NULL, N'Thuỷ tinh', NULL, 1),
(5, N'Thú bông cỡ lớn', N'Ngọc Trang', 'HM005', 50000, NULL, 'https://drive.google.com/file/d/1-LuD-PCgKUkaklt0MTeBDhF0r2ltbV-1/view?usp=sharing', NULL, 10, NULL, N'Vải', NULL, 1),
(6, N'Lắc chân kèm chuông nhỏ', N'Quốc Dũng', 'HM006', 18000, NULL, 'https://drive.google.com/file/d/1bYju_Gc24viZLESiMJCl0hLsTDRisOPH/view?usp=sharing', NULL, 30, NULL, N'Kim loại', NULL, 1),
(7, N'Nhẫn Epoxy hình cây khô', N'Hoàng Thái', 'HM007', 15000, NULL, 'https://drive.google.com/file/d/1EF0JdDjz68WgwmVYNs3nddFJeEL0KZb5/view?usp=sharing', NULL, 25, NULL, N'Nhựa', NULL, 1),
(8, N'Khung treo trang trí hình cây anh đào', N'Cao Cường', 'HM008', 25000, NULL, 'https://drive.google.com/file/d/10WJxfKrNNAtxW_JA0-nZSd5unqiiH7ib/view?usp=sharing', NULL, 10, NULL, N'Gỗ', NULL, 1),
(9, N'Túi len', N'Quỳnh Như', 'HM009', 100000, NULL, 'https://drive.google.com/file/d/1Q8Mx7YORqcB0HDKaWcwjj9RJSVekO3BJ/view?usp=sharing', NULL, 22, NULL, N'Vải', NULL, 1),
(10, N'Vòng cổ màu đỏ', N'Mỹ Phúc', 'HM010', 12000, NULL, 'https://drive.google.com/file/d/1BegxIBjT6NUtHZPbLYz6OXMU38w6l1R_/view?usp=sharing', NULL, 15, NULL, N'Vải', NULL, 1),
(11, N'Vòng tay màu đỏ', N'Thiên Phúc', 'HM011', 10000, NULL, 'https://drive.google.com/file/d/1vvcshMFblnGESwpnnnJD_As4uXYXbEym/view?usp=sharing', NULL, 15, NULL, N'Vải', NULL, 1),
(12, N'Vòng tay cá tính nhiều màu', N'Thảo My', 'HM012', 10000, NULL, 'https://drive.google.com/file/d/1vQqug7Q3WET1eg1mg24pa0wrTGx59NVJ/view?usp=sharing', NULL, 20, NULL, N'Vải', NULL, 1),
(13, N'Vòng tay huyền bí', N'Quốc Dũng', 'HM013', 20000, NULL, 'https://drive.google.com/file/d/1RMt5hZ_iPcAqOJiLl5UHBv6NavOJtgdW/view?usp=sharing', NULL, 8, NULL, N'Vải', NULL, 1),
(14, N'Áo len handmade cho trẻ em', N'Quỳnh Như', 'HM014', 100000, NULL, 'https://drive.google.com/file/d/1keSZtGqJWOjDUDC56XrRLNvgJIw-EKmc/view?usp=sharing', NULL, 7, NULL, N'Vải', NULL, 1),
(15, N'Áo tự vẽ bằng tay', N'Ngọc Lan', 'HM015', 60000, NULL, 'https://drive.google.com/file/d/1UcesIfUdCGKk4M89mxwlFwknDytfDN-O/view?usp=sharing', NULL, 5, NULL, N'Vải', NULL, 1),
(16, N'Cú handmade', N'Ngọc Trang', 'HM016', 50000, NULL, 'https://drive.google.com/file/d/10y82Q9_Gz1_24De04NkoHYDH3gjYq-xv/view?usp=sharing', NULL, 20, NULL, N'Vải', NULL, 1);



INSERT INTO users VALUES
(1, 'admin', 1, 'https://drive.google.com/file/d/1U48UvMcrzng54WSPEs4ALet3QzU-YArn/view?usp=sharing', 'admin', N'227 Nguyễn Văn Cừ, Phường 4 Quận 5, TPHCM', '077621456', 'harucontact@gmail.com', NULL, NULL, 1),
(2, 'luthevy', 1, 'https://drive.google.com/file/d/1ErhC9hbPr0wSuVJIR8pH6jq8GuBPA2cO/view?usp=sharing', 'vydeptrai', N'78D Cao Văn Lầu, Phường 2 Quận 6, TPHCM', '0773826118', 'luthevy2001@gmail.com', NULL, '2001-03-17 16:59:04', 1),
(3, 'vybui', 0, 'https://drive.google.com/file/d/1ziB6XLekdV33Xj-_NpLDB8VYiMtQtLuG/view?usp=sharing', 'vybuicute', N'152 Phạm Đình Hổ, Phường 3 Quận 6, TPHCM', '078123456', 'vybuibui@gmail.com', NULL, '2001-08-09 16:59:04', NULL),
(4, 'Mac Hung', 1, NULL, 'machung2001', N'123 Lý Thái Tổ, Quận 1', '0122564789', 'machung2001@gmail.com', NULL, NULL, NULL),
(5, 'hieunghia', 1, NULL, 'hnghia2001', N'45/8 Nguyễn Văn Cừ, Quận 5', '0795566412', 'hieunghia2001@gmail.com', NULL, NULL, NULL),
(6, 'xuanmike', 0, NULL, 'xuanmai', N'124A Lê Đại Hành, Quận 11', '0833232648', 'bexuanmai@gmail.com', NULL, '2005-08-09 15:45:04', NULL),
(7, 'tranthutrang', 0, NULL, 'trangtran', N'23/4 Lê Đại Hành, Quận 11', '08439653125', 'trangxcute@gmail.com', NULL, NULL, NULL),
(8, 'quochung', 1, NULL, '12012000', N'162 Lê Văn Sỹ, Quận 3', '0123456789', 'herosuperman@gmail.com', NULL, NULL, NULL), 
(9, 'thayloc', 1, NULL, 'locfuho', N'375/2/34 Lạc Long Quân, Quận Tân Bình', '0773129412', 'locchacha@gmail.com', NULL, NULL, NULL),
(10, 'cominhthu', 0, NULL, 'cothuvatly', N'189 Vườn Đào, Quận Tân Phú', '0993128510', 'minhthu97gmail.com', NULL, NULL, NULL),
(11, 'phuonghang', 0, NULL, 'cohang', N'1 Pasteur, Quận 1', '09988882222', 'hangdaigia@gmail.com', NULL, NULL, NULL);


INSERT INTO comments VALUES
(1, 2, 1, CAST(N'2021-08-18 22:22:46' AS DateTime), 5, N'Rất đẹp và chất lượng', 1, NULL),
(2, 3, 6, CAST(N'2021-08-17 00:30:19' AS DateTime), 4, N'Sản phẩm được giao giống như hình mô tả, rất hài lòng', 1, NULL),
(3, 3, 7, CAST(N'2021-08-19 00:30:19' AS DateTime), 3, N'Vừa tay nhưng hoạ tiết. bề mặt bị trầy xước nhiều, dịch vụ giao hàng còn lâu so với dự kiến', 1, NULL),
(4, 5, 7, CAST(N'2021-08-27 01:35:30' AS DateTime), 4, N'Cảm ơn về nhận xét, tôi sẽ cân nhắc lại :(', 1, 3),
(5, 4, 6, CAST(N'2021-08-31 01:39:30' AS DateTime), 4, N'Đẹp quá, chắc phải mua 1 cái ^^', 1, 2),
(6, 7, 13, CAST(N'2021-08-30 01:39:30' AS DateTime), 2, N'Dây bị tưa chỉ, màu không tươi, khá thất vọng', 1, NULL),
(7, 7, 1, CAST(N'2021-08-30 01:39:30' AS DateTime), 3, N'Sản phẩm khá nhỏ @@', 1, 1),
(8, 6, 2, CAST(N'2021-08-30 01:39:30' AS DateTime), 5, N'Thật sự dễ thương ^^ rất hài lòng', 1, NULL),
(9, 8, 11, CAST(N'2021-08-30 01:39:30' AS DateTime), 5, N'Màu rất nổi bật, có thể phối với nhiều trang phục', 1, NULL),
(10, 4, 11, CAST(N'2021-08-30 01:39:30' AS DateTime), 5, N'Thật sao? mình sẽ mua thử xem sao', 1, 9);

/* Le Minh chinh sua o day */
INSERT INTO userLikeComment VALUES
/* (comment ID, user ID) */
/* comment ID tu 1->10, user ID tu 1->11 */
(1,2),
(3,5),
(4,3),
(1,3),
(1,8),
(1,6),
(3,11),
(2,3),
(2,6),
(2,8),
(1,10),
(1,11),
(1,5),
(2,5),
(3,5),
(10,5),
(2,5),
(4,5),
(8,5),
(8,1),
(3,4),
(3,2),
(6,1),
(3,5),
(3,1),
(7,5),
(6,5),
(6,3),
(7,3),
(7,8),
(10,1),
(10,2),
(10,3),
(10,4),
(10,7),
(4,1),
(4,2),
(4,6),
(4,11),
(4,7),
(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(9,1),
(9,2),
(9,6),
(9,11),
(9,7);