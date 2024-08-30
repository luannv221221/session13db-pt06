SET GLOBAL sql_mode='STRICT_ALL_TABLES ';
-- Tạo CSDL 
CREATE DATABASE session02;

-- xóa CSDL 
-- DROP DATABASE database_name 
DROP DATABASE session02;

-- lựa chọn database để thao tác 
USE session02;

-- Tạo bảng person 
CREATE TABLE person(
	id int,
    firstName varchar(50),
    lastName varchar(50),
    address varchar(255)
);
-- xóa bảng 
DROP table student;

-- Tạo bảng category 

CREATE TABLE category(
	id int,
    name varchar(100),
    status tinyint(1)
);
-- chỉnh sửa bảng 
-- thêm 1 cột 
ALTER TABLE category ADD COLUMN desscription varchar(255);

-- xóa bỏ 1 cột 
ALTER TABLE category DROP COLUMN desscription;

-- thay đổi kiểu dữ liệu 
ALTER TABLE category MODIFY COLUMN id bigint;

-- Thêm mới dữ liệu vào bảng category 
INSERT INTO category(id,name,status) VALUE(1,"ÁO",1);
INSERT INTO category(id,name,status) VALUE(2,"QUẦN",1);

INSERT INTO category(name,status) VALUE("ÁO Khoác",1);
-- Thêm nhiều bản ghi 
INSERT INTO category(id,name,status) VALUES 
(2,"Mũ",1),
(3,"ĐÉP",0);
-- LẤY TẤT CẢ TRƯỜNG VÀ BẢN GHI CỦA 1 bảng
SELECT * FROM category;

-- Ràng buộc khóa chính 
DROP TABLE category;

CREATE TABLE category(
	id int primary key,
    name varchar(100),
    status tinyint(1)
);

-- ID khóa chính int thì hay cho tự động tăng 
CREATE TABLE category(
	id int primary key auto_increment,
    name varchar(100),
    status tinyint(1)
);
-- Thêm mới dữ liệu vào bảng category 
INSERT INTO category(name,status) VALUE("ÁO",1);
INSERT INTO category(name,status) VALUE("QUẦN",1);
INSERT INTO category(status) VALUE(1);
SELECT * FROM category;
-- RÀNG BUỘC NOT NULL 
CREATE TABLE category(
	id int primary key auto_increment,
    name varchar(100) NOT NULL,
    status tinyint(1)
);

-- RÀNG BUỘC DUY NHẤT 
DROP TABLE category;
CREATE TABLE category(
	id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    status tinyint(1)
);
-- DEFAULT dữ liệu mặc 
DROP TABLE category;
CREATE TABLE category(
	id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    status tinyint(1) DEFAULT 1
);
INSERT INTO category(name,status) VALUE("ÁO",1);
INSERT INTO category(name) VALUE("QuanÁO");
SELECT * FROM category;

-- Khóa ngoại 
CREATE TABLE product(
	id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    price float NOT NULL,
    category_id int  NOT NULL,
    foreign key (category_id) references category(id) -- taoj khoa ngoai 
);

INSERT INTO product(name,price,category_id) Value('Aos xin',100,1);
INSERT INTO product(name,price,category_id) Value('Giay bata',100,10); -- looi
SELECT * FROM product;

-- khoong xoa duoc du lieu cua bang cha khi ma bang con co du lieu 
DELETE FROM category WHERE id = 1;
-- rang buoc check 
DROP TABLE product;
CREATE TABLE product(
	id int primary key auto_increment,
    name varchar(100) NOT NULL UNIQUE,
    price float NOT NULL,
    check(price > 0), -- rang buoc check ,
    category_id int  NOT NULL,
    foreign key (category_id) references category(id) -- taoj khoa ngoai 
);
INSERT INTO product(name,price,category_id) Value('Khoac2',200,2); 
INSERT INTO product(name,price,category_id) Value('Gio2',150,2); 

SELECT * FROM product;
-- DML
-- INSERT 
-- UPDATE  
-- cập nhật tên của bản ghi có id = 1 thành áo xịn 
UPDATE product SET name = "Áo xịn" WHERE id = 1; 


UPDATE product SET price = 100 WHERE price < 200;

UPDATE product SET price = 150 WHERE id = 3;
-- cập nhật giá tiền của sản phẩm có giá nhỏ 200 về 10% so voi gia hiện tại 
UPDATE product SET price = price - (price*0.1) WHERE price <200;
-- cập nhật tên của sản phẩm thánh khoác và price thành 210 với sản phẩm có id = 2 
UPDATE product SET name = "Khoác", price = 210 WHERE id = 2;

-- DELETE 
DELETE FROM product WHERE id = 3;
-- xóa tất cả sản phẩm có danh mục = 2
DELETE FROM product WHERE category_id = 2;
SELECT * FROM product;
-- SELECT 
-- lấy tất cả bản ghi theo tất cả trường của bảng 
SELECT * FROM product;
-- lấy tất cả bản ghi theo trường lựa chọn 
SELECT name,price FROM product;
