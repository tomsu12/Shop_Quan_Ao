
--https://drive.google.com/drive/folders/1XU11tGtLkMOFlI-p6Ap-E_pEJ8O-0j41?usp=sharing

--https://drive.google.com/drive/folders/1Ypk76w6nzRRieIO7ikTldgudNFeup2jc

CREATE DATABASE QLBCC;
GO
Use QLBCC;
GO
CREATE TABLE NguoiDung (
MaNguoiDung INT PRIMARY KEY IDENTITY(1,1),
TenDangNhap NVARCHAR(50),
SoDienThoai NVARCHAR(20),
Email NVARCHAR(150),
MatKhau NVARCHAR(50)
);


CREATE TABLE DonHang (
MaDonHang INT PRIMARY KEY IDENTITY(1,1),
NgayDatHang DATETIME,
MaNguoiDung INT,
DiaChiGiaoHang NVARCHAR(200),
PTThanhToan NVARCHAR(50),
TinhTrang NVARCHAR(50),
TenNguoiNhanHang NVARCHAR(50),
SoDienThoaiNhanHang NVARCHAR(20),
TongTien MONEY,
GiamGia FLOAT,
GhiChu NVARCHAR(250),
FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);

CREATE TABLE PhanLoai (
MaPhanLoai INT PRIMARY KEY IDENTITY(1,1),
PhanLoaiChinh NVARCHAR(100)
);

CREATE TABLE PhanLoaiPhu (
MaPhanLoaiPhu INT PRIMARY KEY IDENTITY(1,1),
MaPhanLoai INT,
TenPhanLoaiPhu NVARCHAR(100),
FOREIGN KEY (MaPhanLoai) REFERENCES PhanLoai(MaPhanLoai)
);

CREATE TABLE SanPham (
MaSanPham INT PRIMARY KEY IDENTITY(1,1),
TenSanPham NVARCHAR(150),
MaPhanLoai INT,
GiaNhap MONEY,
DonGiaBanNhoNhat MONEY,
DonGiaBanLonNhat MONEY,
TrangThai BIT,
MoTaNgan NVARCHAR(250),
AnhDaiDien NVARCHAR(250),
NoiBat BIT,
MaPhanLoaiPhu INT,
FOREIGN KEY (MaPhanLoai) REFERENCES PhanLoai(MaPhanLoai),
FOREIGN KEY (MaPhanLoaiPhu) REFERENCES PhanLoaiPhu(MaPhanLoaiPhu)
);

CREATE TABLE MauSac (
MaMau INT PRIMARY KEY IDENTITY(1,1),
TenMau NVARCHAR(50)
);

CREATE TABLE SPtheoMau (
MaSPTheoMau INT PRIMARY KEY IDENTITY(1,1),
MaSanPham INT,
MaMau INT,
FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
FOREIGN KEY (MaMau) REFERENCES MauSac(MaMau)
);

CREATE TABLE AnhChiTietSP (
MaAnh INT PRIMARY KEY IDENTITY(1,1),
MaSPTheoMau INT,
TenFileAnh NVARCHAR(250),
FOREIGN KEY (MaSPTheoMau) REFERENCES SPtheoMau(MaSPTheoMau)
);

CREATE TABLE ChiTietDH (
MaDonHang INT,
MaChiTietSP INT,
SoLuongMua INT,
DonGiaBan MONEY,
PRIMARY KEY (MaDonHang, MaChiTietSP),
FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
FOREIGN KEY (MaChiTietSP) REFERENCES SPtheoMau(MaSPTheoMau)
);
--- Thêm dữ liệu cho phân loại chính và phân loại phụ trước khi thêm sản phẩm;
--- Dưới đây là dữ liệu mẫu cho sản phẩm
INSERT INTO SanPham (TenSanPham, MaPhanLoai, GiaNhap, DonGiaBanNhoNhat, DonGiaBanLonNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu)
VALUES
('San pham 1', 1, 10000, 20000, 30000, 1, 'Mo ta san pham 1', 'product1.jpg', 0, 1),
('San pham 2', 1, 15000, 25000, 35000, 1, 'Mo ta san pham 2', 'product1.jpg', 0, 1),
('San pham 3', 1, 20000, 30000, 40000, 1, 'Mo ta san pham 3', 'product1.jpg', 1, 2),
('San pham 4', 1, 25000, 35000, 45000, 1, 'Mo ta san pham 4', 'product1.jpg', 1, 2),
('San pham 5', 1, 30000, 40000, 50000, 1, 'Mo ta san pham 5', 'product1.jpg', 1, 2),
('San pham 6', 2, 35000, 45000, 55000, 1, 'Mo ta san pham 6', 'product1.jpg', 1, 3),
('San pham 7', 2, 40000, 50000, 60000, 1, 'Mo ta san pham 7', 'product1.jpg', 1, 3),
('San pham 8', 2, 50000, 60000, 70000, 1, 'Mo ta san pham 8', 'product1.jpg', 1, 4),
('San pham 9', 2, 60000, 70000, 80000, 1, 'Mo ta san pham 9', 'product1.jpg', 1, 4),
('San pham 10', 2, 70000, 80000, 90000, 1, 'Mo ta san pham 10', 'product1.jpg', 1, 1),
('San pham 11', 2, 80000, 90000, 100000, 1, 'Mo ta san pham 11', 'product1.jpg', 1, 1),
('San pham 12', 2, 90000, 100000, 110000, 1, 'Mo ta san pham 12', 'product1.jpg', 1, 2),
('San pham 13', 2, 90000, 100000, 110000, 1, 'Mo ta san pham 12', 'product1.jpg', 1, 2);


INSERT INTO PhanLoai (PhanLoaiChinh)
VALUES (N'Áo khoác'),
       (N'Quần dài'),
       (N'Áo sơ mi'),
       (N'Quần jean');

INSERT INTO PhanLoaiPhu (MaPhanLoai,TenPhanLoaiPhu)
VALUES (1,'Dep'),(2,'quan'),(3,'ao'),(4,'mu');

