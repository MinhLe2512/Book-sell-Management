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
	userID_pk int NOT NULL,
	commentID_pk int NOT NULL,
	CONSTRAINT pk_adminLikeComment PRIMARY KEY(userID_pk, commentID_pk)
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
create table DonDatHang(
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
create table ChiTietDonDat(
	idDSP int references DonDatHang(id),
	idSP int references chiTietSp(chiTietSPid),
	soLuong int,
	constraint PK_CTDD primary key(idDSP,idSP),
)