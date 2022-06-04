CREATE DATABASE STARLIGHT RESTAURANT:

-- creating schemas for data base STARLIGT RESTAURANT--

USE STARLIGHT


CREATE SCHEMA Menu
GO
CREATE SCHEMA Administration
GO
CREATE SCHEMA OrderItem
GO
CREATE SCHEMA Customers
GO
CREATE SCHEMA FoodItem
GO
CREATE SCHEMA Orders
GO
CREATE SCHEMA Chef
GO
CREATE SCHEMA Payment
--Creating tables using schemas--

CREATE TABLE Menu.menu(
MenuID NVARCHAR(10)NOT NULL,
Price NVARCHAR(10) NOT NULL,
StartDate NVARCHAR(20) NOT NULL,
EndDate NVARCHAR(20) NOT NULL,
FoodID NVARCHAR(10) NOT NULL,
PRIMARY KEY (MenuID))
--UPDATE Menu.menu SET FoodID = 'F_01'  WHERE MenuID = '1'
UPDATE Menu.menu SET FoodID = 'F_02'  WHERE MenuID = '2'
GO
UPDATE Menu.menu SET FoodID = 'F_03'  WHERE MenuID = '3'
GO
UPDATE Menu.menu SET FoodID = 'F_04'  WHERE MenuID = '4'
GO
UPDATE Menu.menu SET FoodID = 'F_05'  WHERE MenuID = '5'
GO
UPDATE Menu.menu SET FoodID = 'F_06'  WHERE MenuID = '6'
GO
UPDATE Menu.menu SET FoodID = 'F_07'  WHERE MenuID = '7'
GO
UPDATE Menu.menu SET FoodID = 'F_08'  WHERE MenuID = '8'
GO
UPDATE Menu.menu SET FoodID = 'F_09'  WHERE MenuID = '9'
GO
UPDATE Menu.menu SET FoodID = 'F_10'  WHERE MenuID = '10'
GO
UPDATE Menu.menu SET FoodID = 'F_11'  WHERE MenuID = '11'
GO
UPDATE Menu.menu SET FoodID = 'F_12'  WHERE MenuID = '12'
GO
UPDATE Menu.menu SET FoodID = 'F_13'  WHERE MenuID = '13'
GO
UPDATE Menu.menu SET FoodID = 'F_14'  WHERE MenuID = '14'
GO
UPDATE Menu.menu SET FoodID = 'F_15'  WHERE MenuID = '15'
GO
UPDATE Menu.menu SET FoodID = 'F_16'  WHERE MenuID = '16'
GO
UPDATE Menu.menu SET FoodID = 'F_17'  WHERE MenuID = '17'
GO
UPDATE Menu.menu SET FoodID = 'F_18'  WHERE MenuID = '18'
GO
UPDATE Menu.menu SET FoodID = 'F_19'  WHERE MenuID = '19'
GO
UPDATE Menu.menu SET FoodID = 'F_20'  WHERE MenuID = '20'
ALTER TABLE Menu.menu
ADD  FOREIGN KEY (FoodID) REFERENCES FoodItem.fooditem (FoodID)
SELECT * FROM Menu.menu

CREATE TABLE Administration.administration(

AdminID NVARCHAR(10) NOT NULL,
FName CHAR(20) NOT NULL,
LName CHAR(20) NOT NULL,
Username NVARCHAR(20) NOT NULL,
Password NVARCHAR (20) NOT NULL,
Status CHAR (20) NOT NULL,
MenuID NVARCHAR (10) NOT NULL,
PRIMARY KEY (AdminID),
FOREIGN KEY (MenuID) REFERENCES Menu.menu(MenuID))

SELECT * FROM Administration.administration

CREATE TABLE Orders.orders (
OrderID NVARCHAR(20) NOT NULL,
FoodID NVARCHAR (10) NOT NULL,
Quantity NVARCHAR(10) NOT NULL,
UnitPrice NVARCHAR (10) NOT NULL,
PRIMARY KEY (OrderID)
)
 --Had to drop fodid and unitprice bcz there ws a mix up--

ALTER TABLE Orders.orders
DROP column FoodID;
        
ALTER TABLE Orders.orders
DROP COLUMN UnitPrice
--
select * from Orders.orders

-- added orderid,customerid and pickupdate for corrections--

ALTER TABLE Orders.orders
ADD OrderDate NVARCHAR(10) NOT NULL,
    CuatomerID NVARCHAR(10) NOT NULL,
	PickupDate NVARCHAR (10) NOT NULL

CREATE TABLE FoodItem.fooditem (
FoodID NVARCHAR(10) NOT NULL,
Name CHAR(30) NOT NULL,
Quantity NVARCHAR(10) NOT NULL,
UnitPrice NVARCHAR(10) NOT NULL,
ItemCategory NVARCHAR(20) NOT NULL,
PRIMARY KEY (FoodID))

SELECT * FROM FoodItem.fooditem

CREATE TABLE OrderItem.orderitem (

OrderID NVARCHAR(10) NOT NULL,
FoodID NVARCHAR(10) NOT NULL,
Quantity NVARCHAR(10) NOT NULL,
UnitPrice NVARCHAR(10) NOT NULL, 
PRIMARY KEY (OrderID),
FOREIGN KEY ( FoodID) 
REFERENCES FoodItem.fooditem (FoodID))

SELECT * FROM OrderItem.orderitem

CREATE TABLE Customers.customers (
CustomerID NVARCHAR(10) NOT NULL,
Email NVARCHAR(20)  NOT NULL,
PhoneNo NVARCHAR(11) NOT NULL,
FName CHAR(20) NOT NULL,
LName CHAR(20) NOT NULL,
PaymentID NVARCHAR(10) NOT NULL,
FoodID NVARCHAR(10) NOT NULL,
PRIMARY KEY (CustomerID),
FOREIGN KEY (FoodID)
REFERENCES FoodItem.fooditem (FoodID))
select * from  Customers.customers
ALTER TABLE Customers.customers
ALTER COLUMN Email NVARCHAR(35) NOT NULL

ALTER 


ALTER TABLE Customers.customers
ADD FOREIGN KEY (PaymentID) REFERENCES Payment.payment (PaymentID)
ALTER TABLE Customers.customers
ADD CONSTRAINT FK_PaymentID
FOREIGN KEY (PaymentID) REFERENCES Payment.payment (PaymentID)
CREATE INDEX IDX_CUSTOMERS ON Customers.customers (CustomerID)

ALTER TABLE Customers.customers
DROP COLUMN PaymentID


SELECT * FROM Customers.customers

CREATE TABLE Chef.chef (

ChefID NVARCHAR(10) NOT NULL,
LastName CHAR(20) NOT NULL,
FirstName CHAR(20) NOT NULL,
Username NVARCHAR(20) NOT NULL,
PhoneNumber NVARCHAR(11) NOT NULL,
Password NVARCHAR(15) NOT NULL,
OrderID NVARCHAR(10) NOT NULL,
PRIMARY KEY (ChefID),

ALTER TABLE Chef.chef ADD FOREIGN KEY (OrderID)
REFERENCES Orders.orders (OrderID)

ALTER TABLE Chef.chef
DROP FK__chef__OrderID__276EDEB3

ALTER TABLE Chef.chef
ALTER COLUMN OrderID NVARCHAR (20) NOT NULL

SELECT * FROM Chef.chef


CREATE TABLE Payment.payment (

PaymentID NVARCHAR(10) NOT NULL,
CustomerID NVARCHAR(10) NOT NULL,
OrderID NVARCHAR(10) NOT NULL,
PaymentDate NVARCHAR(15) NOT NULL,
Amount NVARCHAR(15) NOT NULL,
PaymentType NVARCHAR(20) NOT NULL,
PRIMARY KEY (PaymentID),
FOREIGN KEY (OrderID)
REFERENCES OrderItem.orderItem (OrderID))
ALTER TABLE Payment.payment
ADD FOREIGN KEY (CustomerID) REFERENCES Customers.customers (CustomerID)
SELECT * FROM Payment.payment
ALTER TABLE Payment.payment
DROP CONSTRAINT FK_CustomeID

ALTER TABLE Payment.payment
ALTER COLUMN OrderID NVARCHAR (20) NOT NULL
ALTER TABLE Payment.payment
ADD FOREIGN KEY (OrderID)
REFERENCES Orders.orders (OrderID)
--INPUTING VALUES INTO THE TABLES--



SELECT * FROM Menu.menu
SELECT * FROM Administration.administration
SELECT * FROM OrderItem.orderitem
SELECT * FROM Orders.orders
SELECT * FROM FoodItem.fooditem
SELECT * FROM Customers.customers
SELECT * FROM Payment.payment




INSERT INTO Menu.menu VALUES

( 001, '$ 2500', '12-6-2021', '23-12-2021', 111),
( 002, '$ 1000', '11-1-2020', '20-5-2022', 555),
( 003, '$ 4000', '1-4-2019', '29-6-2023', 777),
(004, '$ 3600', '7-7-2017', '31-8-2027', 222),
(005, '$ 900', '30-3-2021', '10-10-2030', 666),
(006, '$ 1700', '6-5-2015', '3-11-2029', 333),
(007, '$ 5100', '15-7-2011', '7-8-2021', 999),
(008, '$ 3000', '12-6-2012', '5-6-2022', 666),
(009, '$ 2000', '17-3-2017', '9-12-2028', 1010),
(010, '$ 7900', '6-6-2018', '10-6-2023', 444)


INSERT INTO Administration.administration VALUES

('A_001', 'Mukhtar', 'Isa', 'SirMukhtar', 000, 'Manager', 010 ),
('A_002', 'RabbaitulBait', 'Momoh', 'BlushPrincess', 111, 'Ass.Manager', 009),
('A_003', 'Ojile', 'Joseph', 'Ojisco', 222, 'Cashier', 008),
('A_004', 'Maryann', 'Kalunta', 'Gwagwastula', 333, 'Organizer', 007),
('A_005', 'Patience', 'Bitrus', 'PatB', 444, 'Supervisor', 006),
('A_006', 'Jonathan', 'Odubu', 'Prescott', 555, 'Ass.Cashier', 005),
('A_007', 'Bashar', 'Ibrahim', 'SnoopDog', 666, 'HeadCleaner', 004),
('A_008', 'Maryam', 'Usman', 'Mimi', 777, 'Receptionist', 003),
('A_009', 'Abdul', 'Rabiu', 'AbdulR', 888, 'Waiter', 002),
('A_010', 'Salamatu', 'Imran', 'Salma', 999, 'Waiter', 001)


INSERT INTO OrderItem.orderitem VALUES

('O_001', 'F_01', 55, '$ 50'),
( 'O_002', 'F_02', 100, '$ 100'),
( 'O_003', 'F_03', 30, '$ 100'),
( 'O_004', 'F_04', 80, '$ 80'),
( 'O_005', 'F_05', 90, '$ 100'),
( 'O_006', 'F_06', 150, '$ 150'),
( 'O_007', 'F_07', 70, '$ 50'),
( 'O_008', 'F_08', 20, '$ 100'),
( 'O_009', 'F_09', 30, '$ 60'),
( 'O_010', 'F_10', 40, '$ 70')

ALTER TABLE OrderItem.orderitem ADD UnitPrice VARCHAR(20) 

UPDATE OrderItem.orderitem SET UnitPrice =  '$ 50' WHERE OrderID = 'O_001'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 100' WHERE OrderID = 'O_002'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 100' WHERE OrderID = 'O_003'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 80' WHERE OrderID = 'O_004'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 100' WHERE OrderID = 'O_005'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 150' WHERE OrderID = 'O_006'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 50' WHERE OrderID = 'O_007'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 100' WHERE OrderID = 'O_008'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 60' WHERE OrderID = 'O_009'
GO
UPDATE OrderItem.orderitem SET UnitPrice =  '$ 70' WHERE OrderID = 'O_010'





INSERT INTO Orders.orders VALUES
('O_001', 55, '13-6-2021', ' ID_1', '22-7-2021'), 
( 'O_002', 100, '1-7-2021', 'ID_2', '29-7-2021'),
( 'O_003', 30, '1-7-2021', 'ID_3', '27-7-2021'),
( 'O_004', 80, '10-7-2021', 'ID_4', '30-7-2021'),
( 'O_005', 90, '12-7-2021', 'ID_5', '23-7-2021'),
( 'O_006', 150, '13-7-2021', 'ID_6', '22-7-2021'),
( 'O_007', 70, '2-7-2021', 'ID_7', '26-7-2021'),
( 'O_008', 20, '9-7-2021', 'ID_8', '19-7-2021'),
( 'O_009', 30, '4-7-2021', 'ID_9', '17-7-2021'),
( 'O_010', 40, '11-7-2021', 'ID_10', '15-7-2021')



INSERT INTO FoodItem.fooditem VALUES

('F_01', 'Waffles', 150, '$ 50', 'Pastries'),
('F_02', 'Pounded yam', 200, '$ 100', 'Carbohydrate'),
('F_03', 'Rice', 500, '$ 100', 'Carbohydrate'),
('F_04', 'Pasta', 500, '$ 80', 'Carbohydrate'),
('F_05', 'FruitSalad', 300, '$ 100', 'Fruits'),
('F_06', 'SpicyChicken', 500, '$ 150', ' Protein'),
('F_07', 'Yoghurt', 200, '$ 50', 'Dairy'),
('F_08', 'StrawberryPie', 300, '$ 100', 'Pastries'),
('F_09', 'Smoothies', 200, '$ 60', 'Fruits'), 
('F_10', 'Cakes', 200, '$ 70', 'Pastries')

SELECT * FROM Menu.menu
SELECT * FROM Administration.administration
SELECT * FROM OrderItem.orderitem
SELECT * FROM Orders.orders
SELECT * FROM FoodItem.fooditem
SELECT * FROM Payment.payment
SELECT * FROM Chef.chef
SELECT * FROM Customers.customers

INSERT INTO Customers.customers VALUES

( 'ID_1', 'Mukkyisaabubakar@gmail.com', 08187580020, 'Mukhtar', 'Isa', 'F_01' ),
( 'ID_2', 'BluahPrincess@gmail.com',  07062351974, 'RabbaitulBait', 'Momoh', 'F_02'),
( 'ID_3', 'OjileJoseph@gmail.com', 08138650183, 'Ojile', 'Joseph', 'F_03'),
( 'ID_4', 'Aminaisa123@gmail.com', 08133100190, 'Amina', 'Isa', 'F_04'),
( 'ID_5', 'MaryannKalunta@gmail.com', 09094108171, 'Maryann', 'Kalunta','F_05'),
( 'ID_6', 'PatBitrus@gmail.com', 07069874598, 'Patience', 'Bitrus', 'F_06'),
( 'ID_7', 'Odubujohnathan@gmail.com', 08063218974, 'Jonathan', 'Odubu', 'F_07'),
( 'ID_8', 'Basharibrahim@gmail.com', 09028932478, 'Bashar', 'Ibrahim', 'F_08'),
( 'ID_9', 'Ummibilal@gmail.com', 08094441121, 'Hauwa', 'Jubril', 'F_09'),
( 'ID_10','Hajaraaminu@gmail.com', 07039756315, 'Hajara', 'Aminu', 'F_10')



INSERT INTO Payment.payment VALUES

( 'P_01', 'ID_1', 'O_001', '13-6-2021', '$ 2750', 'Cash'),
( 'P_02', 'ID_2', 'O_002', '1-7-2021', '$ 10000', 'Online Transfer'),
( 'P_03', 'ID_3', 'O_003', '1-7-2021', '$ 3000', ' Card Payment'),
( 'P_04', 'ID_4', 'O_004', '10-7-2021', '$ 6400', 'Card Payment'),
( 'P_05', 'ID_5', 'O_005', '12-7-2021', '$ 9000', 'Online Transfer'),
( 'P_06', 'ID_6', 'O_006', '13-7-2021', '$ 22500', 'Cash'),
( 'P_07', 'ID_7', 'O_007', '2-7-2021', '$ 3500', 'Cash'),
( 'P_08', 'ID_8', 'O_008', '9-7-2021', '$ 2000', 'Cash'),
( 'P_09', 'ID_9', 'O_009', '4-7-2021', '$ 1800', 'Cash'),
( 'P_10', 'ID_10', 'O_010', '11-7-2021', '$ 2800', 'Card Payment')



INSERT INTO Chef.chef VALUES

('Ch_001', 'Momoh', 'Laila', 'RbbaitulBait', 07062351974, '*****', 'O_001'),
('Ch_002', 'John', 'Meyers', 'JohnM',  08039712682, '*****', 'O_002'),
('Ch_003', 'Aisha', 'Isyaku', 'AishaIsyaku', 07000369801, '*****', 'O_003'),
('Ch_004', 'Bami', 'Emmanuel', 'TalkwithBami', 08133902058, '*****', 'O_004'),
('Ch_005', 'Joshua', 'Linus', 'MrJoshua', 09099489878, '*****', 'O_005'),
('Ch_006', 'Muhammad', 'Musa', 'MomohMusa', 08094441191, '*****', 'O_006'),
('Ch_007', 'Ibrahim', 'Hamid', 'IbrahimHamid', 08096362587, '*****', 'O_007'),
('Ch_008', 'Emeka', 'Mike', 'ManlikeEmeka', 07045698700, '*****', 'O_008'),
('Ch_009', 'Mubarak', 'Bashar', 'Bashoski', 09066978745, '*****', 'O_009'),
('Ch_010', 'Attah', 'Abubakar', 'AttahOne', 08133988978, '*****', 'O_010')


select * from Payment.payment WHERE Amount >= '$ 1500'
select * from Payment.payment WHERE PaymentType = 'Card Payment'
 
USE STARLIGHT
GO
SELECT * FROM Menu.menu
SELECT * FROM Administration.administration
SELECT * FROM Customers.customers
SELECT * FROM Chef.chef
SELECT * FROM OrderItem.orderitem
SELECT * FROM Orders.orders
SELECT * FROM Payment.payment
SELECT * FROM FoodItem.fooditem

INSERT INTO Menu.menu VALUES
(11, '$ 2000','12-4-2013', '12-7-2030', 112),
(12, '$ 2300', '30-9-2010', '17-7-2026', 113),
(13, '$ 5100', '17-7-2005', '3-1-2026', 114),
(14, '$ 4900', '4-12-2020', '11-8-2025', 115),
(15, '$ 1000', '4-6-2021', '17-7-2026', 116),
(16, '$ 1500', '7-2-2008', '18-7-2022', 117),
(17, '$ 5000', '13-10-2017', '14,7-2023', 118),
(18, '$ 6400', '15-8-2016', '8-9-2020', 119),
(19, '$ 4900', '19-6-2019', '1-1-3030', 120),
(20, '$ 1300', '13-8-2021', '7-6-2025', 121)


SELECT StartDate, EndDate FROM Menu.menu WHERE MenuID = 4 

SELECT MenuID, StartDate, Price, EndDate FROM Menu.menu WHERE Price  BETWEEN '$ 2000' AND '$ 7000' 

INSERT INTO Administration.administration VALUES 
('A_011', 'Elias', 'Williams', 'ElliasW223', '****', 'Director', 11),
('A_012', 'Abdallah', 'Ismail', 'AbdulIsmail', '****', 'HOO', 12),
('A_013', 'Anyi', 'Alex', 'AnyiAlex', '****',  'Driver', 13),
('A_014', 'Harvey', 'Specter', 'MrSpecter', '****', 'AssDriver', 14),
('A_015', 'Louis', 'Litt', 'TalkwithLitt', '****', 'Attorney', 15),
('A_016', 'Alex', 'Williams', 'WilliamsA', '****', 'AssAtorney', 16),
('A_017', 'Dana', 'Paulsin', 'MissPaulsin', '****', 'Secretary', 17),
('A_O18', 'Samantha', 'Willer', 'MissSamantha', '****', 'AssSecretary',18),
('A_019', 'Emeka', 'Jimbo', 'EmekaJimbo', '****', 'Delivery', 19),
('A_020', 'Mubarak', 'Aliyu', 'MAliyu', '****', 'MarketingExpert', 20)


UPDATE Administration.administration
SET AdminID = 'A_018' WHERE MenuID = 18 

--UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_001'
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_002'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_003'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_004'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_005'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_006'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_007'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_008'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_009'
GO
UPDATE Administration.administration
SET Password = '****' WHERE AdminID = 'A_010'
GO


INSERT INTO Customers.customers VALUES
('ID_11', 'JohnDoe@gmail.com', 07026987452, 'John', 'Doe', 'F_11'),
('ID_12', 'MaryamBala@gmail.com', 09065478954, 'Maryam', 'Bala', 'F_12'),
('ID_13', 'IliyasJafar@gmail.com', 08163369896, 'Iliyas', 'Jafar', 'F_13'),
('ID_14', 'OgechiSamson@gmail.com', 07021458978, 'Ogechi', 'Samson', 'F_14'),
('ID_15', 'AbuMusbahu@gmail.com', 09069854785, 'Sbubakar', 'Musbahu', 'F_15'),
('ID_16', 'IbrahimDalhatu@gmail.com', 07078321652, 'Ibrahim', 'Dalhatu', 'F_16'),
('ID_17', 'HalimaAbdul@gmail.com', 08123235009, 'Halima', 'Abdulrahman', 'F_17'),
('ID_18', 'SharonOkay@gmail.com', 08036985214, 'Sharon', 'Okay', 'F_18'),
('ID_19', 'JohnBelion@gmail.com', 07012365478, 'John', 'Beliion', 'F_19'),
('ID_20', 'HajaraBala@gmail.com', 08093178256, 'Hajara', 'Bala', 'F_20')







SELECT * FROM Menu.menu
SELECT * FROM Administration.administration
SELECT * FROM Customers.customers
SELECT * FROM Chef.chef
SELECT * FROM OrderItem.orderitem
SELECT * FROM Orders.orders
SELECT * FROM Payment.payment
SELECT * FROM FoodItem.fooditem



INSERT INTO Customers.customers VALUES
('ID_11', 'AminaSahil@gmail.com',09036985214, 'Amina', 'Sahil', 'F_11'),
('ID_12', 'SharonWilliams@gmail.com', 07096328796, 'Sharon', 'Williams', 'F_12'),
('ID_13', 'IliyasSaad@gmail.com', 08169723654, 'Iliyas', 'Saad', 'F_13'),
('ID_14', 'RahamaSaad@gmail.com', 08026932587, 'Rahama', 'Saad', 'F_14'), 
('ID_15', 'JoyceSaad@gmail.com', 07036987456, 'Joyce', 'Saad', 'F_15'),
('ID_16', 'SaadNegedu@gmai.com', 08036123541, 'Saad', 'Negudu', 'F_16'),
('ID_17', 'HabibAbubakar@gmail.com', 08093178265, 'Habib', 'Abubakar', 'F_17'),
('ID_18', 'KautharHabib@gmail.com', 07069325874, 'Kauthar', 'Habib', 'F_18'),
('ID_19', 'DanjumaGwagwastula@gmail.com', 09032148965, 'Danjuma', 'Gwagwastula', 'F_19'),
('ID_20', 'LinusAgba@gmail.com', 08036541230, 'Linus', 'Agba', 'F_20')




INSERT INTO FoodItem.fooditem VALUES
('F_11', 'Apple pie', 200, '$ 50', 'Pastries'),
('F_12', 'Pizza', 150, '$ 60', 'Pastries'),
('F_13', 'Coffe', 500, '$ 20', 'Beverages'),
('F_14', 'Doughnut', 350, '$20', 'Pastries'),
('F_15', 'Deep Fried Chicken', 500, '$ 120', 'Protein'),
('F_16', 'Pepper Soup', 600, '$ 100', 'Protein'),
('F_17', 'Jollof Rice', 500, '$ 90', 'Carbohydrate'),
('F_18', 'Puff Puff', 700, '$ 5', 'Pastries'),
('F_19', 'Akara(BeansCake)', 700, '$ 5', 'Pastries'),
('F_20', 'Yam Porridge', 250, '60', 'Carbohydrate')




INSERT INTO Chef.chef VALUES
('Ch_11', 'Yusuf', 'Nadia', 'NadiyaYusuf', 07063589214, '*****', 'O_11'),
('Ch_12', 'Yusuf', 'Raniya', 'RaniyaYusuf', 08169875230, '*****', 'O_12'),
('Ch_13', 'Isa', 'Amina', 'AminaIsa', 09026987521, '*****', 'O_13'),
('Ch_14', 'Williams', 'Sharon', 'SharonWilliams', 08169820002, '*****', 'O_14'),
('Ch_15', 'Kuyet', 'Precious', 'KuyetPrecious', 08039002620, '*****', 'O_15'),
('Ch_16', 'Abdulmumin', 'Firdausi', 'AbdulFirdausi', 07069320002, '*****', 'O_16'),
('Ch_17', 'Adaji', 'Aisha', 'AdajiAisha', 08045896320, '*****', 'O_17'),
('Ch_18', 'Cletus','Faith', 'CletusFaith', 07058900520, '*****', 'O_18'),
('Ch_19', 'Emmanuel', 'Kozah', 'EmmanuelKozah', 08169321020, '*****', 'O_19'),
('Ch_20', 'Lebron', 'James', 'lebronJames', 07036900210, '*****', 'O_20')







INSERT INTO OrderItem.orderitem VALUES
('O_11', 'F_11', 200, '$ 50'),
('O_12', 'F_12', 150, '$ 60'),
('O_13', 'F_13', 500, '$ 20'),
('O_14', 'F_14', 350, '$ 20'),
('O_15', 'F_15', 500, '$ 120'),
('O_16', 'F_16', 600, '$ 100'),
('O_17', 'F_17', 500, '$ 90'),
('O_18', 'F_18', 700, '$ 5'),
('O_19', 'F_19', 700, '$ 5'),
('O_20', 'F_20', 250, '$ 60')



INSERT INTO Orders.orders VALUES
('O_11', 200, '28-7-2021', 'ID_11', '30-7-2021'),
('O_12', 150, '25-7-2021', 'ID_12', '29-7-2021'),
('O_13', 500, '27-7-2021', 'ID_13', '31-7-2021'),
('O_14', 350, '28-7-2021', 'ID_14', '30-7-2021'),
('O_15', 500, '26-7-2021', 'ID_15', '29-7-2021'),
('O_16', 600, '29-7-2021', 'ID_16', '1-8-2021'),
('O_17', 500, '29-7-2021', 'ID_17', '31-7-2021'),
('O_18', 700, '27-7-2021', 'ID_18', '29-7-2021'),
('O_19', 700, '25-7-2021', 'ID_19', '27-7-2021'),
('O_20', 250, '22-7 2021', 'ID_20', '25-7-2021')




INSERT INTO Payment.payment VALUES
('P_11', 'ID_11', 'O_11', '28-7-2021', '$ 10000', 'Cash'),
('P_12', 'ID_12', 'O_12', '25-7-2021', '$ 9000',  'Online Transfer'),
('P_13', 'ID_13', 'O_13', '27-7-2021', '$ 10000', 'Card Payment'),
('P_14', 'ID_14', 'O_14', '28-7-2021', '$ 7000',  'Cash'),
('P_15', 'ID_15', 'O_15', '26-7-2021', '$ 60000', 'Cash'),
('P_16', 'ID_16', 'O_16', '29-7-2021', '$ 60000', 'Card Payment'),
('P_17', 'ID_17', 'O_17', '29-7-2021', '$ 45000', 'Online transfer'),
('P_18', 'ID_18', 'O_18', '27-7-2021', '$ 35000', 'Online Transfer'),
('P_19', 'ID_19', 'O_19', '25-7-2021', '$ 35000', 'Card Payment'),
('P_20', 'ID_20', 'O_20', '22-7-2021', '$ 15000', 'Card Payment')




SELECT * FROM Payment.payment
SELECT * FROM Menu.menu
SELECT * FROM Customers.customers
SELECT * FROM OrderItem.orderitem
SELECT * FROM Orders.orders
SELECT * FROM FoodItem.fooditem
SELECT * FROM Administration.administration
SELECT * FROM Chef.chef

SELECT DISTINCT ItemCategory FROM FoodItem.fooditem 
SELECT * FROM FoodItem.fooditem WHERE ItemCategory = 'Pastries'

SELECT * FROM Customers.customers WHERE FName = 'Hajara' OR LName = 'Williams' 
SELECT * FROM OrderItem.orderitem WHERE Quantity = 500 AND UnitPrice = '$ 120'
SELECT * FROM FoodItem.fooditem WHERE NOT ItemCategory = 'Protein'

SELECT Name, ItemCategory FROM FoodItem.fooditem ORDER BY  Name, ItemCategory ASC
SELECT Name, ItemCategory FROM FoodItem.fooditem ORDER BY  Name, ItemCategory DESC
DELETE FROM Chef.chef WHERE FirstName = Laila
SELECT GETDATE()
SELECT Name, Quantity, UnitPrice FROM FoodItem.fooditem WHERE ItemCategory = 'Pastries' 

SELECT Email, Fname, Lname FROM Customers.customers INNER JOIN Orders.orders on Customers.CustomerID = Orders.CuatomerID

select Name, UnitPrice from FoodItem.fooditem inner join Menu.menu on FoodItem.FoodID= Menu.FoodID
SELECT OrderItem.FoodID, OrderItem.Quantity, OrderItem.UnitPrice from OrderItem.orderitem inner join FoodItem.fooditem on OrderItem.FoodID = FoodItem.FoodID

select Fname, Lname from Customers.customers left join Orders.orders on Customers.CustomerID = Orders.CuatomerID
select Fname, Lname from Customers.customers right join Orders.orders on Customers.CustomerID = Orders.CuatomerID
select Name, Quantity from FoodItem.fooditem inner join Menu.menu on FoodItem.FoodID = Menu.FoodID
select * from Customers.customers
update Customers.customers set LName= 'Bala' where CustomerID= 'ID_10'
SELECT Email, PhoneNO, Fname from Customers.customers left join Orders.orders on Customers.CustomerID= Orders.CuatomerID 
select * from Administration.administration where AdminID >= 'A_005'
select * from Customers.customers
update Customers.customers set  Email= 'HajaraBala@gmail.com' where CustomerID= 'ID_10'
SELECT * FROM Customers.customers
select count (*) from Payment.payment
select top 5 * from OrderItem.orderitem
select * from Administration.administration
select * from Customers.customers
select * from Customers.customers where Fname= 'Hajara' or Lname = 'isa' 
select CustomerID, Amount from Payment.payment union select FName, LName from Customers.customers
select count (*) from Payment.payment 
