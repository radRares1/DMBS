create database lab3
go
use lab3
go


--create the tables: Shops and Buyers and the m:n relationship between them

create table Shops(
id INT PRIMARY KEY IDENTITY(1,1),
sName varchar(100),
address varchar(100)
)

create table Buyers(
id INT PRIMARY KEY IDENTITY(1,1),
bName varchar(100),
budget int)

create table ShopzAndBuyerz(
sId INT FOREIGN KEY REFERENCES Shops(id),
bId INT FOREIGN KEY REFERENCES Buyers(id),
CONSTRAINT pk_ShoopzAndBuyerz PRIMARY KEY(sId,bId))

--add records in the Shops 

insert into Shops values
	('shop1','address1'),
	('shop2','address2'),
	('shop3','address3')


select * from Shops
