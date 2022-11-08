-- group project on simple industrial park database to improve mysql skill and Database Concepts
CREATE Database Industrial_park_database;
   USE Industrial_park_database;
CREATE TABLE `Employee` (
  `Empid` int PRIMARY KEY NOT NULL AUTO_INCREMENT,   
  `Ename` varchar(25) NOT NULL,
  `gender` varchar(1),
  `age` int,
  `addresNo` int,
  `FactoryID` int,
  `DEPcode` varchar(25) DEFAULT 'TBA'
  
);

CREATE TABLE `Factory` (
  `FactoryID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Fname` varchar(25) NOT NULL,
  `addresNo` int,
  `ManagerID` int
  
);

CREATE TABLE `Department` (
  `DEPcode` varchar(25) PRIMARY KEY NOT NULL,
  `title` varchar(25),
  `no_of_Employees` int
);

CREATE TABLE `Address` (
  `addresNo` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `addresName` varchar(25),
  `country` varchar(25) DEFAULT 'Ethiopia',
  `city` varchar(25) DEFAULT 'Hawassa',
  `streetNo` int
);

CREATE TABLE `supplier` (
  `supplierID` int PRIMARY KEY NOT NULL,
  `Sname` varchar(25) NOT NULL,
  `addresNo` int
);

CREATE TABLE `RawMaterial` (
  `RmID` int PRIMARY KEY NOT NULL,
  `supplierID` int NOT NULL,
  `FactoryID` int NOT NULL,
  `Rname` varchar(25),
  `description` varchar(25),
  `unitPrice` float,
  `quantity` int
);

CREATE TABLE `customer` (
  `customeriD` int PRIMARY KEY,
  `Cname` varchar(25) NOT NULL,
  `addresNo` int,
  `orderID` int not NULL,
  `phone` varchar(15)
);

CREATE TABLE `orderr` (
  `orderID` int PRIMARY KEY NOT NULL,
  `orderDate` varchar(25),
  `num_of_ordered` int,
  `ShippmentDate` varchar(25) DEFAULT 'Unknown'
);

CREATE TABLE `order_item` (
  `orderID` int PRIMARY KEY NOT NULL,
  `productID` int NOT NULL,
  `unitPrice` float,
  `quantity` int,
  `QualityLevel` varchar(25)
);

CREATE TABLE `product` (
  `productID` int PRIMARY KEY NOT NULL,
  `Pname` varchar(25),
  `totalprice` float,
  `description` varchar(25),
  `FactoryID` int NOT NULL
);

CREATE TABLE `payment` (
  `customeriD` int PRIMARY KEY NOT NULL,
  `orderID` int NOT NULL,
  `amountPayed` float
);




ALTER TABLE `Employee` ADD FOREIGN KEY (`FactoryID`) REFERENCES `Factory` (`FactoryID`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`DEPcode`) REFERENCES `Department` (`DEPcode`);

ALTER TABLE `Factory` ADD FOREIGN KEY (`addresNo`) REFERENCES `Address` (`addresNo`);

ALTER TABLE `Factory` ADD FOREIGN KEY (`ManagerID`) REFERENCES `Employee` (`Empid`);

ALTER TABLE `supplier` ADD FOREIGN KEY (`addresNo`) REFERENCES `Address` (`addresNo`);

ALTER TABLE `RawMaterial` ADD FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`supplierID`);

ALTER TABLE `RawMaterial` ADD FOREIGN KEY (`FactoryID`) REFERENCES `Factory` (`FactoryID`);

ALTER TABLE `customer` ADD FOREIGN KEY (`addresNo`) REFERENCES `Address` (`addresNo`);

ALTER TABLE `customer` ADD FOREIGN KEY (`orderID`) REFERENCES `orderr` (`orderID`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`orderID`) REFERENCES `orderr` (`orderID`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

ALTER TABLE `product` ADD FOREIGN KEY (`FactoryID`) REFERENCES `Factory` (`FactoryID`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customeriD`) REFERENCES `customer` (`customeriD`);

ALTER TABLE `payment` ADD FOREIGN KEY (`orderID`) REFERENCES `orderr` (`orderID`);

show tables;
describe  payment;
describe  order_item ;
describe  Employee ;
describe  customer ;
describe  RawMaterial ;
describe  product ;
describe  Factory ;
describe  supplier ;
describe orderr;
describe  Address;
describe  Department;


insert into Address values(1,'Alito','Ethiopia','Hawassa',111);
insert into Address(`addresName`,`country`,`city`,`streetNo`) values('Atote','Ethiopia','Hawassa',222);
insert into Address(`addresName`,`country`,`city`,`streetNo`)  values('Sefere Selam','Ethiopia','Hawassa',333);
insert into Address(`addresName`,`country`,`city`,`streetNo`)  values('Membo','Ethiopia','Hawassa',444);
insert into Address(`addresName`,`country`,`city`,`streetNo`)  values('Zero1','Ethiopia','Hawassa',555);
insert into Address(`addresName`,`country`,`city`,`streetNo`)  values('Piazza','Ethiopia','Hawassa',666);

insert into `Department` values("chem1","Chemistry",250);
insert into `Department` values("Mntnc","maintenance",250);
insert into `Department` values("HR","human resource",125);
insert into `Department` values("FNC","Finanace",170);
insert into `Department` values("sqrt","security",470);
insert into `Department` values("prdc","prodcution",1175);

insert into `Factory` values(1,'Bilt Shoe_factory',5,1);
insert into `Factory`( `Fname`,`addresNo`,`ManagerID`) values('hdase textile_factory',5,2);
insert into `Factory`( `Fname`,`addresNo`,`ManagerID`) values('gojeb SoftDrink_factory',5,3);
insert into `Factory`( `Fname`,`addresNo`,`ManagerID`) values('ras cement_factory',5,4);
insert into `Factory`( `Fname`,`addresNo`,`ManagerID`) values('Rio_ ',5,5);





insert into `supplier` values(1,"Sansamo Feleqe",3);
insert into `supplier` values(2,"sintayew gichew",1);
insert into `supplier` values(3,"bizuneh bekele",4);
insert into `supplier` values(4,"ayelech abebe",1);
insert into `supplier` values(5,"tarekegn yisak",2);
insert into `supplier` values(6,"yetmwork bacha",3);


insert into `RawMaterial` values(1,1,1,'Leather','Packed',150.0,10);
insert into `RawMaterial` values(2,3,2,'Leather','Packed',150.0,15);
insert into `RawMaterial` values(3,2,3,'sugar','Packed',18.0,12);
insert into `RawMaterial` values(4,4,4,'sand','Packed',1500.0,21);
insert into `RawMaterial` values(5,3,3,'glass','Packed',25.0,30);

insert into `customer` values(1,'Emebet Molla ',3,1,0911233547);
insert into `customer` values(2,'abebech alemu',2,1,0913233342);
insert into `customer` values(3,'maru mola',1,4,0916253842);
insert into `customer` values(4,'wendesen gena',5,3,0913233342);
insert into `customer` values(5,'chaltu ayana',3,2,0912323342);

insert into `orderr` values(1,"1/02/2022",100,"11/02/2022");
insert into `orderr` values(2,"12/02/2022",350,"15/02/2022");
insert into `orderr` values(3,"12/02/2022",450,"15/02/2022");
insert into `orderr` values(4,"13/02/2022",450,"17/02/2022");
insert into `orderr` values(5,"18/02/2022",600,"27/02/2022");





insert into `order_item` values(1,1,200.0,100,'Export_level');
insert into `order_item` values(2,5,300.0,350,'High_quality');
insert into `order_item` values(3,2,450.0,150,'Best_quality');
insert into `order_item` values(4,3,100.0,250,'High_quality');
insert into `order_item` values(5,4,350.0,250,'Local');

insert into `product` values(1,'Ambesa Shoe',2000.0,'Export_level',1);
insert into `product` values(2,'Cement',304511.0,'Export_level',4);
insert into `product` values(3,'Trouser',50000.0,'Export_level',2);
insert into `product` values(4,'Gojeb_bottle',450000.0,'Export_level',3);
insert into `product` values(5,'T-shirt',30000.0,'Export_level',5);

insert into `payment` values(1,1,20000.0);
insert into `payment` values(2,2,350000.0);
insert into `payment` values(3,3,750000.0);
insert into `payment` values(4,5,640000.0);
insert into `payment` values(5,2,350000.0);


insert into `Employee` values(1,'Abebe Weya','M',35,1,1,'chem1');
insert into `Employee`(`Ename`,`gender`,`age`,`addresNo`,`FactoryID`,`DEPcode`) values('Martha Zenebe','M',35,1,1,'Mntnc');
insert into `Employee`(`Ename`,`gender`,`age`,`addresNo`,`FactoryID`,`DEPcode`) values('Surafel','M',35,1,1,'FNC');
insert into `Employee`(`Ename`,`gender`,`age`,`addresNo`,`FactoryID`,`DEPcode`) values ('sisay takele','M',25,3,2,'HR');
insert into `Employee`(`Ename`,`gender`,`age`,`addresNo`,`FactoryID`,`DEPcode`)values("bereket birhanu","M",24,2,3,"FNC");
insert into `Employee`(`Ename`,`gender`,`age`,`addresNo`,`FactoryID`,`DEPcode`)values("yohannes masresha","M",26,5,4,"sqrt");



select *from  payment;
select *from  order_item ;
select *from  Employee ;
select *from  customer ;
select *from  RawMaterial ;
select *from  product ;
select *from  Factory ;
select *from  supplier ;
select *from orderr;
select *from  Address;
select *from  Department;


SELECT
  Employee.Ename AS Manager_name,
  Factory.FactoryID AS Manager_Id
FROM Employee
JOIN Factory ON Employee.Empid=Factory.ManagerID;

SELECT
  supplier.Sname AS Supplier_name,
  RawMaterial.Rname AS RawMaterial_supplied
FROM supplier
JOIN RawMaterial ON supplier.supplierID=RawMaterial.supplierID;

SELECT
  Factory.Fname AS Factory_name,
  product.Pname AS produces
FROM Factory
JOIN product ON Factory.FactoryID=product.FactoryID;