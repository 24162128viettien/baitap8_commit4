-- ==========================================================
-- Script tạo Database + bảng Categories, Products trên SSMS
-- ==========================================================

CREATE DATABASE ShopDB;
GO

USE ShopDB;
GO

-- Bảng Categories
CREATE TABLE Categories (
    categoryId   BIGINT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(200) NOT NULL,
    icon         NVARCHAR(255) NULL
);
GO

-- Bảng Products
CREATE TABLE Products (
    productId    BIGINT IDENTITY(1,1) PRIMARY KEY,
    productName  NVARCHAR(500) NOT NULL,
    quantity     INT NOT NULL,
    unitPrice    FLOAT NOT NULL,
    images       NVARCHAR(200) NULL,
    description  NVARCHAR(500) NOT NULL,
    discount     FLOAT NOT NULL DEFAULT 0,
    createDate   DATETIME NOT NULL DEFAULT GETDATE(),
    status       SMALLINT NOT NULL DEFAULT 1,
    categoryId   BIGINT NOT NULL,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (categoryId)
        REFERENCES Categories(categoryId)
);
GO

-- Dữ liệu mẫu
INSERT INTO Categories (categoryName, icon) VALUES
(N'Điện thoại', 'phone.png'),
(N'Laptop', 'laptop.png'),
(N'Phụ kiện', 'accessory.png');
GO

INSERT INTO Products (productName, quantity, unitPrice, images, description, discount, status, categoryId) VALUES
(N'iPhone 15', 50, 999.0, 'iphone15.png', N'Điện thoại iPhone 15 128GB', 5, 1, 1),
(N'Laptop Dell XPS 13', 20, 1299.0, 'dellxps13.png', N'Laptop Dell XPS 13 i7', 10, 1, 2),
(N'Tai nghe AirPods Pro', 100, 249.0, 'airpods.png', N'Tai nghe không dây chống ồn', 0, 1, 3);
GO
