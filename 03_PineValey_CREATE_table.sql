CREATE DATABASE DAMG6210;
GO
use DAMG6210
go
CREATE TABLE Customer
(
	CustomerID int not null,
	CustomerName nvarchar(25),
	CustomerAddress varchar(30),
	CustomerCity varchar(20),
	CustomerState char(2),
	CustomerPostalCode varchar(9),
CONSTRAINT Customer_PK primary key (CustomerID )
);


CREATE TABLE Product 
(
ProductID int not null,
ProductDescription  varchar(50),
ProductFinish  varchar(20)  CONSTRAINT 
ProductFinish_CHK CHECK ( ProductFinish IN ('Cherry',
								'Natural Ash', 'White Ash', 'Red Oak',
								'Natural Oak',  'Walnut') ),
ProductStandardPrice DECIMAL(6,2),
ProductLineID		int,
CONSTRAINT Product_PK PRIMARY KEY (ProductID)
);
/* order table table creation */
CREATE TABLE [Order]
(
	OrderID int not null,
	OrderDate Datetime default ( getdate()) ,
	CustomerID int not null,
	CONSTRAINT Order_PK  PRIMARY KEY (OrderID),
	CONSTRAINT  Order_FK FOREIGN KEY (CustomerID) 
			references Customer(CustomerID)  
);

CREATE TABLE OrderLine
(
	OrderID int not null,
	ProductID int not null,
	OrderQuantity smallint,
	CONSTRAINT OrderLine_PK PRIMARY KEY (OrderID, ProductID),
	CONSTRAINT OrderLine_FK1 FOREIGN KEY (OrderID) 
		REFERENCES [Order] (OrderID),
	CONSTRAINT  OrderLine_FK2 FOREIGN KEY( ProductID) 
		REFERENCES Product(ProductID)
);

 
 -- Add new column
ALTER TABLE Customer ADD  CustomerType varchar(20) 



