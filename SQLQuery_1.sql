CREATE DATABASE DAMG6210

use DAMG6210
GO

CREATE TABLE Customer (
    CustomerID int not null,
    CustomerName nvarchar(50),
    CustomerAddress nvarchar(50),
    CustomerCity varchar(20),
    CustomerState char(2),
    CustomerPostalCode varchar(9),
    CONSTRAINT Customer_PK primary key (CustomerID)
)
CREATE TABLE [Order] 
(
    OrderID int not null,
    OrderDate datetime default ( getdate()),
    CustomerID int not null,
    CONSTRAINT Order_PK primary key (OrderID),
    CONSTRAINT Order_FK foreign key (CustomerID) references Customer(CustomerID)
)
CREATE TABLE Product (
    ProductID int not null,
    ProductDescription varchar(50),
    ProductFinish varchar(20) CONSTRAINT ProductFinish_CK CHECK
    (ProductFinish IN ('Cherry', 'Natural Ash', 'Red Oak')),
    ProdcutStandardPrice decimal (6,2),
    ProductLineID int 
    CONSTRAINT Product_PK primary key (ProductID)
)

CREATE TABLE OrderLine (
    OrderID int not null,
    ProductID int not null,
    OrderQuantity smallint,
    CONSTRAINT OrderLine_PK primary key (OrderID,  ProductID),
    CONSTRAINT OrderLine_FK1 foreign key (OrderID) references [Order] (OrderID),
    CONSTRAINT OrderLine_FK2 foreign key (ProductID) references Product (ProductID)
)

ALTER TABLE Customer Add CustomerType VARCHAR(20)
ALTER TABLE Customer alter Column CustomerType varChar(30)

DROP TABLE OrderLine
DROP TABLE [Order]
DROP TABLE Product
DROP TABLE Customer