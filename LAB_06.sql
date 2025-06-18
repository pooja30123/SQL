CREATE DATABASE LAB6;
USE LAB6;

-- Table 1: SalesPeople
CREATE TABLE SalesPeople (
    Snum INT PRIMARY KEY,
    Sname VARCHAR(50) UNIQUE,
    City VARCHAR(50),
    Comm DECIMAL(4,2)
);

-- Table 2: Customers
CREATE TABLE Customers (
    Cnum INT PRIMARY KEY,
    Cname VARCHAR(50),
    City VARCHAR(50) NOT NULL,
    Snum INT,
    FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

-- Table 3: Orders
CREATE TABLE Orders (
    Onum INT PRIMARY KEY,
    Amt DECIMAL(10,2),
    Odate DATE,
    Cnum INT,
    Snum INT,
    FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
    FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

-- ✅ Insert into SalesPeople
INSERT INTO SalesPeople (Snum, Sname, City, Comm) VALUES
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'Sanjose', 0.13),
(1004, 'Motika', 'Landon', 0.11),
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'Axelrod', 'Newyork', 0.10);

-- ✅ Insert into Customers
INSERT INTO Customers (Cnum, Cname, City, Snum) VALUES
(2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);


-- ✅ Insert into Orders
INSERT INTO Orders (Onum, Amt, Odate, Cnum, Snum) VALUES
(3001, 18.69, '1990-10-03', 2008, 1007),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4273.00, '1990-10-05', 2006, 1001),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);


-- 1- Find those salesperson name who live in any one of the cities ofcustomers. (do it both with sub-query and join)
SELECT Sname 
FROM SalesPeople 
WHERE City IN (SELECT DISTINCT City FROM Customers);

SELECT DISTINCT S.Sname
FROM SalesPeople S
JOIN Customers C ON S.City = C.City;


-- 2- Find those salesperson name, customers name who belong to any one of the cities of customers. (do it both with sub-query and join)
SELECT S.Sname, C.Cname
FROM SalesPeople S, Customers C
WHERE S.City = C.City 
AND S.City IN (SELECT DISTINCT City FROM Customers);

SELECT DISTINCT S.Sname, C.Cname
FROM SalesPeople S
JOIN Customers C ON S.City = C.City;

-- 3- Find those salesperson name who belong to the city of their customer.(do it both with sub-query and join)
SELECT Sname
FROM SalesPeople
WHERE City IN (SELECT City FROM Customers);

SELECT DISTINCT S.Sname
FROM SalesPeople S
JOIN Customers C ON S.City = C.City;

-- 4- Find those salesperson name, customers name who belong to the city of their customer(s).(do it with co-related sub-query)
SELECT S.Sname, C.Cname
FROM SalesPeople S, Customers C
WHERE S.City = C.City
  AND S.Snum = C.Snum;

-- 5- Find those salesperson name, customer name where salesperson is assigned not assigned to any customer.
-- ✅ Salesperson assigned to any customer
SELECT S.Sname, C.Cname
FROM SalesPeople S
JOIN Customers C ON S.Snum = C.Snum;
-- ❌ Salesperson NOT assigned to any customer
SELECT S.Sname
FROM SalesPeople S
WHERE S.Snum NOT IN (SELECT DISTINCT Snum FROM Customers);

-- 6- Find those customer name who is not assigned to any salesperson.
SELECT Cname
FROM Customers
WHERE Snum NOT IN (SELECT Snum FROM SalesPeople);

-- 7- Find the highest order of each salesperson.
SELECT Snum, MAX(Amt) AS HighestOrder
FROM Orders
GROUP BY Snum;
-- 8- Find the names of salesperson and their highest order.
SELECT s.Sname, MAX(o.Amt) AS HighestOrder
FROM SalesPeople s
JOIN Orders o ON s.Snum = o.Snum
GROUP BY s.Snum, s.Sname;

-- 9- Find those orders of salesperson which is more than his average orders.
SELECT o.Snum, o.Onum, o.Amt
FROM Orders o
WHERE o.Amt > (
    SELECT AVG(o2.Amt)
    FROM Orders o2
    WHERE o2.Snum = o.Snum
);

-- 10- List those salespersons who has more than two customers.
SELECT s.Snum, s.Sname, COUNT(c.Cnum) AS CustomerCount
FROM SalesPeople s
JOIN Customers c ON s.Snum = c.Snum
GROUP BY s.Snum, s.Sname
HAVING COUNT(c.Cnum) > 2;
