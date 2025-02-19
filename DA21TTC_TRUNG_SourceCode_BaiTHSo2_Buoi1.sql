USE [QUANLY_SINHVIEN]

CREATE TABLE KHOA (
  MaKhoa char(4) NOT NULL,
  TenKhoa nvarchar(30) NOT NULL,
  DiaChi nvarchar(50) NOT NULL,
  DienThoai varchar(10) NULL,
  CONSTRAINT PK_KHOA PRIMARY KEY (MaKhoa)
);

CREATE TABLE LOP (
  MaLop char(10) NOT NULL,
  TenLop nvarchar(30) NOT NULL,
  MaKhoa char(4) NOT NULL
  CONSTRAINT PK_LOP PRIMARY KEY (MaLop),
  FOREIGN KEY (MaKhoa) REFERENCES KHOA(MaKhoa)
);

CREATE TABLE SINHVIEN (
  MaSV char(8) NOT NULL,
  HoTenSV nvarchar(30) NOT NULL,
  NgaySinh datetime NULL,
  MaLop char(10) NOT NULL,
  CONSTRAINT PK_SINHVIEN PRIMARY KEY (MaSV),
  CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
);

CREATE TABLE MONHOC (
  MaMon varchar(5) NOT NULL,
  TenMon nvarchar(30) NOT NULL,
  SoTinChi smallint NULL,
  CONSTRAINT PK_MONHOC PRIMARY KEY (MaMon)
);

CREATE TABLE GIANGVIEN (
  MaGV char(9) NOT NULL,
  HoTenGV nvarchar(40) NOT NULL,
  MaKhoa char(4) NOT NULL,
  CONSTRAINT PK_GIANGVIEN PRIMARY KEY (MaGV),
  CONSTRAINT FK_GIANGVIEN_KHOA FOREIGN KEY (MaKhoa) REFERENCES KHOA (MaKhoa)
);

CREATE TABLE GIANGDAY (
  MaGV char(9) NOT NULL,
  MaMon varchar(5) NOT NULL,
  NamHoc char(9) NOT NULL,
  HocKy smallint NOT NULL,
  MaLop char(10) NOT NULL,
  CONSTRAINT PK_GIANGDAY PRIMARY KEY (MaGV, MaMon, NamHoc, HocKy, MaLop),
  CONSTRAINT FK_GIANGDAY_GIANGVIEN FOREIGN KEY (MaGV) REFERENCES GIANGVIEN (MaGV),
  CONSTRAINT FK_GIANGDAY_MONHOC FOREIGN KEY (MaMon) REFERENCES MONHOC (MaMon),
  CONSTRAINT FK_GIANGDAY_MALOP FOREIGN KEY (MaLop) REFERENCES LOP (MaLop)
);

CREATE TABLE DANGKYHOC (
  MaSV char(8) NOT NULL,
  MaMon varchar(5) NOT NULL,
  NamHoc char(9) NOT NULL,
  HocKy smallint NOT NULL,
  MaGV char(9) NOT NULL,
  Diem smallint NULL,
  CONSTRAINT PK_DANGKYHOC PRIMARY KEY (MaSV, MaMon, NamHoc, HocKy),
  CONSTRAINT FK_DANGKYHOC_SINHVIEN FOREIGN KEY (MaSV) REFERENCES SINHVIEN (MaSV),
  CONSTRAINT FK_DANGKYHOC_MONHOC FOREIGN KEY (MaMon) REFERENCES MONHOC (MaMon),
  CONSTRAINT FK_DANGKYHOC_GIANGVIEN FOREIGN KEY (MaGV) REFERENCES GIANGVIEN (MaGV)
);

INSERT INTO KHOA( MaKhoa, TenKhoa, DiaChi, DienThoai) VALUES ( 'TOAN', N'Toán - Tin', N'Nhà C1', '0743447325')
INSERT INTO KHOA( MaKhoa, TenKhoa, DiaChi, DienThoai) VALUES ( 'CNTT', N'Công nghệ Thông tin', N'Nhà C2', '0743447326')
INSERT INTO KHOA( MaKhoa, TenKhoa, DiaChi, DienThoai) VALUES ( 'D_LY', N'Địa lý', N'Nhà A1', '0743447327')
INSERT INTO KHOA( MaKhoa, TenKhoa, DiaChi, DienThoai) VALUES ( 'HHOC', N'Hóa học', N'Nhà A2', '0743328')

INSERT INTO LOP (MaLop, TenLop, MaKhoa) VALUES
('DAIITO12A1', N'ĐH Toán A1 2012', 'TOAN'),
('DA12TT12A1', N'ĐH CNTT A1 2012', 'CNTT'),
('DA12DL12A1', N'ĐH Địa Lý A1 2012', 'D_LY'),
('DA12TT12A2', N'ĐH CNTT A1 2012', 'CNTT'),
('DA12DL12A2', N'ĐH Địa lý A2 2012', 'D_LY'),
('DA12HH12A1', N'ĐH Hóa học A1 2012', 'HHOC');


INSERT INTO SinhVien (MaSV, HoTenSV, NgaySinh, MaLop) VALUES
('K6100001', N'Phạm Văn Bình', '1990-02-24', 'DAIITO12A1'),
('K6100002', N'Nguyễn Thị Hoài Thu', '1991-04-12', 'DA12TT12A1'),
('K6100003', N'Trần Ngọc Thanh', '1990-04-15', 'DA12DL12A1'),
('K6100004', N'Nguyễn Tấn Hùng', '1992-02-03', 'DA12TT12A2'),
('K6100005', N'Trương Thành Sang', '1990-12-04', 'DA12DL12A2'),
('K6100006', N'Nguyễn Anh Dũng', '1982-03-03', 'DA12HH12A1'),
('K6100007', N'Phạm Hồng Ánh', '1990-02-24', 'DAIITO12A1'),
('K6100008', N'Lê Thị Liễu', '1991-04-12', 'DA12TT12A1'),
('K6100009', N'Phạm Ngọc Sương', '1990-04-17', 'DA12DL12A1'),
('K6100010', N'Nguyễn Tấn', '1992-12-03', 'DA12TT12A2'),
('K6100011', N'Thạch Thanh Sang', '1990-02-04', 'DA12DL12A2'),
('K6100012', N'Nguyễn Hồng Anh Ngọc', '1992-12-03', 'DA12HH12A1'),
('K6100013', N'Nguyễn Hồng Ngọc', '1992-12-13', 'DA12TT12A2'),
('K6100014', N'Kim Thanh Sang', '1990-02-04', 'DA12DL12A2'),
('K6100015', N'Hồng Anh Ngọc', '1992-12-13', 'DA12HH12A1');


INSERT INTO MonHoc (MaMon, TenMon, SoTinChi) VALUES
('GTAI', N'Giải tích 1', 2),
('DSTT', N'Đại số tuyến tính', 3),
('HHAF', N'Hình học Afin', 2),
('XSTK', N'Xác suất thống kê', 2),
('THDC', N'Tin học đại cương', 3),
('KTLT', N'Kỹ thuật lập trình', 2);

INSERT INTO GiangVien (MaGV, HoTenGV, MaKhoa)
VALUES 
('15.111.01', N'Phạm Bình Minh', 'TOAN'),
('15.111.02', N'Nguyễn Hoài Thu', 'CNTT'),
('15.111.03', N'Trần Ngọc Án', 'D_LY'),
('15.111.04', N'Nguyễn Hùng Anh', 'HHOC'),
('15.111.05', N'Phạm Ngoc Diệp', 'TOAN'),
('15.111.06', N'Lê Anh Dũng', 'CNTT'),
('15.111.07', N'Phạm Hồng Ánh', 'TOAN'),
('15.111.08', N'Lê Thị Liễu Phượng', 'HHOC'),
('15.111.09', N'Phạm Ngọc Thu Sương', 'CNTT'),
('15.111.10', N'Võ Anh Tài', 'CNTT');

INSERT INTO GIANGDAY0 (MaMon, MaGV, NamHoc, Hocky, MaLop)
VALUES
	('GTAI', '15.111.01', '2012-2013', 1, 'DAIITO12A1'),
	('DSTT', '15.111.05', '2012-2013', 2, 'DAIITO12A1'),
	('HHAF', '15.111.07', '2012-2013', 2, 'DAIITO12A1'),
	('XSTK', '15.111.01', '2011-2012', 2, 'DA12HH12A1'),
	('THDC', '15.111.10', '2012-2013', 1, 'DA12DL12A1'),
	('THDC', '15.111.09', '2011-2012', 1, 'DA12HH12A1'),
	('THDC', '15.111.02', '2012-2013', 1, 'DA12DL12A2'),
	('KTLT', '15.111.02', '2012-2013', 2, 'DA12TT12A1');
GO

INSERT INTO DANGKYHOC( MaSV, MaMon, NamHoc, HocKy, MaGV,Diem)
VALUES
	('K6100001', 'GTAI', '2012-2013', 1, '15.111.01', 6),
	('K6100001', 'DSTT', '2012-2013', 2, '15.111.05', 7),
	('K6100001', 'HHAF', '2012-2013', 2, '15.111.07', 5),
	('K6100002', 'DSTT', '2012-2013', 2, '15.111.05', 4),
	('K6100002', 'XSTK', '2011-2012', 2, '15.111.01', 3),
	('K6100002', 'GTAI', '2012-2013', 1, '15.111.01', 2),
	('K6100005', 'HHAF', '2012-2013', 2, '15.111.07', 5),
	('K6100003', 'GTAI', '2012-2013', 1, '15.111.01', 9),
	('K6100003', 'XSTK', '2011-2012', 2,'15.111.01', 10),
	('K6100004', 'XSTK', '2011-2012', 2, '15.111.01', 4),
	('K6100004', 'DSTT', '2012-2013', 1, '15.111.05', 7),
	('K6100004', 'KTLT', '2012-2013', 2, '15.111.02', 5),
	('K6100012', 'THDC', '2012-2013', 1, '15.111.10', 6),
	('K6100013', 'THDC', '2011-2012', 1, '15.111.09', 9),
	('K6100013', 'KTLT', '2012-2013', 2, '15.111.02', 8),
	('K6100014', 'THDC', '2012-2013', 1, '15.111.02', 10),
	('K6100015', 'THDC', '2012-2013', 1, '15.111.02', 3),
	('K6100015', 'GTAI', '2012-2013', 1, '15.111.01', 6),
	('K6100015', 'DSTT', '2011-2012', 1, '15.111.05', 7),
	('K6100015', 'XSTK', '2012-2013', 1, '15.111.01', 8);
GO

-- Hiển thị danh sách tất cả các sinh viên: --
CREATE VIEW DanhSachSinhVien AS
SELECT MaSV, HoTenSV, NgaySinh, MaLop
FROM SINHVIEN;



-- Hiển thị danh sách tất cả các sinh viên (gồm: họ tên sinh viên, tên lớp, tên khoa): -- 
CREATE VIEW DanhSachSinhVien_Lop_Khoa AS
SELECT SV.HoTenSV, L.TenLop, K.TenKhoa
FROM SINHVIEN SV
INNER JOIN LOP L ON SV.MaLop = L.MaLop
INNER JOIN KHOA K ON L.MaKhoa = K.MaKhoa;

-- Hiển thị danh sách các giảng viên (gồm họ tên giảng viên, tên khoa): -- 
CREATE VIEW DanhSachGiangVien_Khoa AS
SELECT HoTenGV, TenKhoa
FROM GIANGVIEN GV
INNER JOIN KHOA K ON GV.MaKhoa = K.MaKhoa;

-- Hiển thị danh sách các giảng giảng viên giảng dạy các môn học (Tên giảng viên, tên khoa, tên môn học): -- 
CREATE VIEW DanhSachGiangVien_GiangDay_MonHoc AS
SELECT GV.HoTenGV, K.TenKhoa, MH.TenMon
FROM GIANGDAY GD
INNER JOIN GIANGVIEN GV ON GD.MaGV = GV.MaGV
INNER JOIN MONHOC MH ON GD.MaMon = MH.MaMon
INNER JOIN LOP L ON GD.MaLop = L.MaLop
INNER JOIN KHOA K ON GV.MaKhoa = K.MaKhoa;

-- Hiển thị danh sách các giảng viên không dạy môn học nào trong năm học 2011-2012: -- 
CREATE VIEW DanhSachGiangVien_KhongDayMonHoc AS
SELECT GV.HoTenGV, K.TenKhoa
FROM GIANGVIEN GV
INNER JOIN KHOA K ON GV.MaKhoa = K.MaKhoa
WHERE GV.MaGV NOT IN (
    SELECT DISTINCT MaGV
    FROM GIANGDAY
    WHERE NamHoc = '2011-2012'
);
-- Cấp quyền cho user LAMHUETRUNG --
SELECT name FROM sys.sql_logins WHERE name = 'LAMHUETRUNG';
USE QUANLY_SINHVIEN;
GO
DROP USER LAMHUETRUNG; -- Xóa người dùng hiện tại
GO
EXEC sp_grantdbaccess @loginame = 'LAMHUETRUNG';

-- Cấp quyền truy cập SELECT cho người dùng trên view DanhSachSinhVien
GRANT SELECT ON DanhSachSinhVien TO LAMHUETRUNG;

-- Cấp quyền truy cập SELECT cho người dùng trên view DanhSachSinhVien_Lop_Khoa
GRANT SELECT ON DanhSachSinhVien_Lop_Khoa TO LAMHUETRUNG;

-- Cấp quyền truy cập SELECT cho người dùng trên view DanhSachGiangVien_Khoa
GRANT SELECT ON DanhSachGiangVien_Khoa TO LAMHUETRUNG;

-- Cấp quyền truy cập SELECT cho người dùng trên view DanhSachGiangVien_GiangDay_MonHoc
GRANT SELECT ON DanhSachGiangVien_GiangDay_MonHoc TO LAMHUETRUNG;

-- Cấp quyền truy cập SELECT cho người dùng trên view DanhSachGiangVien_KhongDayMonHoc
GRANT SELECT ON DanhSachGiangVien_KhongDayMonHoc TO LAMHUETRUNG;

-- Hiển thị mã, tên các môn học được sinh viên Nguyễn Thị Hoài Thu đăng ký học: -- 
CREATE PROCEDURE SP_MonHoc_SinhVien
    @TenSinhVien NVARCHAR(50)
AS
BEGIN
    SELECT DH.MaMon, MH.TenMon
    FROM DANGKYHOC DH
    INNER JOIN SINHVIEN SV ON DH.MaSV = SV.MaSV
    INNER JOIN MONHOC MH ON DH.MaMon = MH.MaMon
    WHERE SV.HoTenSV = @TenSinhVien;
END;

-- Đếm số môn học mà sinh viên Trần Ngọc Thanh đã đăng ký học: -- 
CREATE PROCEDURE SP_DemMonHoc
    @TenSinhVien NVARCHAR(50),
    @SoMonHoc INT OUTPUT
AS
BEGIN
    SELECT @SoMonHoc = COUNT(*)
    FROM DANGKYHOC DH
    INNER JOIN SINHVIEN SV ON DH.MaSV = SV.MaSV
    WHERE SV.HoTenSV = @TenSinhVien;
END;

-- Hiển thị danh sách các sinh viên đăng ký học môn Giải tích 1 trong học kỳ 1: -- 
CREATE PROCEDURE SP_SinhVien_GiaiTich1
AS
BEGIN
    SELECT SV.MaSV, SV.HoTenSV, K.TenKhoa
    FROM SINHVIEN SV
    INNER JOIN DANGKYHOC DH ON SV.MaSV = DH.MaSV
    INNER JOIN MONHOC MH ON DH.MaMon = MH.MaMon
    INNER JOIN LOP L ON SV.MaLop = L.MaLop
    INNER JOIN KHOA K ON L.MaKhoa = K.MaKhoa
    WHERE MH.MaMon = 'GTAI' AND DH.HocKy = 1;
END;

-- Hiển thị danh sách sinh viên sắp xếp theo tên khoa và họ tên: -- 
CREATE PROCEDURE SP_SinhVien_SapXep
AS
BEGIN
    SELECT SV.MaSV, SV.HoTenSV, SV.NgaySinh, K.TenKhoa
    FROM SINHVIEN SV
    INNER JOIN LOP L ON SV.MaLop = L.MaLop
    INNER JOIN KHOA K ON L.MaKhoa = K.MaKhoa
    ORDER BY K.TenKhoa, SV.HoTenSV;
END;

-- Hiển thị bảng thống kê sinh viên theo khoa: -- 
CREATE PROCEDURE SP_ThongKeSinhVienTheoKhoa
AS
BEGIN
    SELECT K.MaKhoa, K.TenKhoa, COUNT(SV.MaSV) AS SoLuongSinhVien
    FROM KHOA K
    LEFT JOIN LOP L ON K.MaKhoa = L.MaKhoa
    LEFT JOIN SINHVIEN SV ON L.MaLop = SV.MaLop
    GROUP BY K.MaKhoa, K.TenKhoa;
END;

-- Hiển thị danh sách các thầy dạy trong từng kỳ: -- 
CREATE PROCEDURE SP_DanhSachGiangVienTheoKy
AS
BEGIN
    SELECT GV.HoTenGV, MH.TenMon, GD.NamHoc, GD.HocKy, COUNT(DISTINCT DH.MaSV) AS SoLuongSinhVien
    FROM GIANGVIEN GV
    INNER JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
    INNER JOIN MONHOC MH ON GD.MaMon = MH.MaMon
    LEFT JOIN DANGKYHOC DH ON GD.MaMon = DH.MaMon AND GD.NamHoc = DH.NamHoc AND GD.HocKy = DH.HocKy
    GROUP BY GV.HoTenGV, MH.TenMon, GD.NamHoc, GD.HocKy;
END;

-- Hiển thị danh sách sinh viên đăng ký nhiều môn học nhất: -- 
CREATE PROCEDURE SP_SinhVienNhieuMonNhat
AS
BEGIN
    SELECT TOP 1 SV.MaSV, SV.HoTenSV, COUNT(*) AS SoLuongMonHoc
    FROM DANGKYHOC DH
    INNER JOIN SINHVIEN SV ON DH.MaSV = SV.MaSV
    GROUP BY SV.MaSV, SV.HoTenSV
    ORDER BY COUNT(*) DESC;
END;

-- Đếm số sinh viên đăng ký nhiều môn học nhất/học kỳ: -- 
CREATE PROCEDURE SP_DemSinhVienNhieuMonNhat_HocKy
    @HocKy INT,
    @SoSinhVien INT OUTPUT
AS
BEGIN
    SELECT TOP 1 @SoSinhVien = COUNT(*)
    FROM DANGKYHOC DH
    WHERE HocKy = @HocKy
    GROUP BY MaSV
    ORDER BY COUNT(*) DESC;
END;

-- Đếm số giảng viên giảng dạy nhiều môn nhất/ ít môn nhất: -- 
CREATE PROCEDURE SP_SinhVienItMonNhat
AS
BEGIN
    SELECT TOP 1 SV.MaSV, SV.HoTenSV, COUNT(*) AS SoLuongMonHoc
    FROM DANGKYHOC DH
    INNER JOIN SINHVIEN SV ON DH.MaSV = SV.MaSV
    GROUP BY SV.MaSV, SV.HoTenSV
    ORDER BY COUNT(*) ASC;
END;

-- Các môn học mà có số lượng sinh viên đăng ký trong một kỳ nhỏ hơn 2 sẽ không tổ chức lớp học: -- 
CREATE PROCEDURE SP_MonHocBiHuy
AS
BEGIN
    SELECT MH.TenMon, DH.NamHoc, DH.HocKy, COUNT(DH.MaSV) AS SoLuongSinhVienDangKy
    FROM MONHOC MH
    LEFT JOIN DANGKYHOC DH ON MH.MaMon = DH.MaMon AND DH.Diem IS NOT NULL
    GROUP BY MH.TenMon, DH.NamHoc, DH.HocKy
    HAVING COUNT(DH.MaSV) < 2;
END;

-- Đưa ra họ tên, tên lớp và số điểm trung bình của sinh viên có điểm trung bình lớn nhất trong từng học kỳ/năm học: -- 
CREATE PROCEDURE SP_SinhVienDiemCaoNhat
    @NamHoc NVARCHAR(9),
    @HocKy INT
AS
BEGIN
    SELECT TOP 1 SV.HoTenSV, L.TenLop, AVG(DH.Diem) AS DiemTrungBinh
    FROM DANGKYHOC DH
    INNER JOIN SINHVIEN SV ON DH.MaSV = SV.MaSV
    INNER JOIN LOP L ON SV.MaLop = L.MaLop
    WHERE DH.NamHoc = @NamHoc AND DH.HocKy = @HocKy
    GROUP BY SV.MaSV, SV.HoTenSV, L.TenLop
    ORDER BY AVG(DH.Diem) DESC;
END;

-- backup -- 
BACKUP DATABASE QUANLY_SINHVIEN TO DISK = 'D:\110121255\DA21TTC_TRUNG_DataBaiTHSo2.bak' WITH FORMAT;
