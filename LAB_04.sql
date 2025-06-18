-- 1. Create following tables 
-- i) Create table EMP which has the following attributes (empno, ename, Designation, sal, deptno, doj)  
-- Where empno is primary key, ename is unique, designation (Prof, AP, and Lect),  sal is not NULL, and deptno is foreign key 
CREATE DATABASE company;
USE company;
CREATE TABLE EMP (
    empno INT PRIMARY KEY,
    ename VARCHAR(50) UNIQUE,
    Designation ENUM('Prof', 'AP', 'Lect'),
    sal DECIMAL(10,2) NOT NULL,
    deptno INT,
    doj DATE,
    FOREIGN KEY (deptno) REFERENCES DEPT(deptno)
);

-- ii) Create table DEPT which has the following attributes (deptno, dname) 
-- Where deptno is primary key, dname (Acc, comp, elect) 
CREATE TABLE DEPT (
    deptno INT PRIMARY KEY,
    dname ENUM('Acc', 'Comp', 'Elect')
);


-- iii) Create table Salesperson which has the following attributes (sno, sname, city) Where sno is primary key 
CREATE TABLE Salesperson (
    sno INT PRIMARY KEY,
    sname VARCHAR(50),
    city VARCHAR(50)
);


-- iv) Create table Part which has the following attributes (pno, pname, color) Where pno is primary key 
CREATE TABLE Part (
    pno INT PRIMARY KEY,
    pname VARCHAR(50),
    color VARCHAR(30)
);


-- v) Create table Project which has the following attributes (jno, jname, city) Where jno is primary key
CREATE TABLE Project (
    jno INT PRIMARY KEY,
    jname VARCHAR(50),
    city VARCHAR(50)
);


-- vi) Create table SPJ which has the following attributes (sno, pno, jno), qty) 
-- Where combination of (sno, pno, jno) is primary key, also sno, pno, jno are foreign  keys 
CREATE TABLE SPJ (
    sno INT,
    pno INT,
    jno INT,
    qty INT,
    PRIMARY KEY (sno, pno, jno),
    FOREIGN KEY (sno) REFERENCES Salesperson(sno),
    FOREIGN KEY (pno) REFERENCES Part(pno),
    FOREIGN KEY (jno) REFERENCES Project(jno)
);

-- 2. Insert appropriate records in above tables. 
INSERT INTO DEPT VALUES (1, 'Acc'), (2, 'Comp'), (3, 'Elect');

INSERT INTO EMP VALUES 
(100, 'Pooja', 'Prof', 75000, 2, '2023-03-10'),
(101, 'Madhavi', 'APemployee', 60000, 1, '2022-06-15'),
(102, 'Bhawana', 'Lect', 50000, 3, '2024-01-20');

INSERT INTO Salesperson VALUES (1, 'Deepesh', 'Rajasthan'), (2, 'Sahil', 'Gujrat');

INSERT INTO Part VALUES (1, 'Screw', 'Silver'), (2, 'Bolt', 'Black');

INSERT INTO Project VALUES (1, 'Bridge', 'Mumbai'), (2, 'Highway', 'Delhi');

INSERT INTO SPJ VALUES (1, 1, 1, 100), (2, 2, 2, 200);

-- 3. Write SQL queries for the following statements: 
-- Q1) Check the structure of tables. 
DESC EMP;
DESC DEPT;
DESC Salesperson;
DESC Part;
DESC Project;
DESC SPJ;

-- Q2) Check the constraint name for applied constraints. 
SELECT TABLE_NAME, CONSTRAINT_NAME 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA = 'company';

-- Q3) Drop the unique constraint on ENAME 
ALTER TABLE EMP DROP INDEX ename;

-- Q4) Drop the Foreign Key constraint on DEPTNO
ALTER TABLE EMP DROP FOREIGN KEY emp_ibfk_1;


-- Q5) Add Foreign Key constraint on DEPTNO 
ALTER TABLE EMP ADD CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES DEPT(deptno);


-- Q6) Change Data type of ENAME 
ALTER TABLE EMP MODIFY ename VARCHAR(100);


-- Q7) Change width of DNAME 
ALTER TABLE DEPT MODIFY dname VARCHAR(100);


-- Q8) Add COMM column in EMP table 
ALTER TABLE EMP ADD COLUMN comm DECIMAL(10,2);


-- Q9) Drop CITY column from Project table 
ALTER TABLE Project DROP COLUMN city;


-- Q10) Create duplicate copy of EMP table 
CREATE TABLE EMP_COPY AS SELECT * FROM EMP;


-- Q11) Copy structure of DEPT table in another table with different column names 
CREATE TABLE DEPT_NEW LIKE DEPT;


-- Q12) Change the name and job of the employee whose EMPNO =101 
UPDATE EMP SET ename = 'Sakshi', Designation = 'Lect' WHERE empno = 101;


-- Q13) Delete the record of employee who belong to computer department
DELETE FROM EMP WHERE deptno = (SELECT deptno FROM DEPT WHERE dname = 'Comp');


-- Q14) Drop DEPT Table 
DROP TABLE DEPT;


-- Q15) Drop duplicate table of EMP table. 
DROP TABLE EMP_COPY;


-- Q16) Display those employees who join the company on Monday.
SELECT * FROM EMP WHERE DAYNAME(doj) = 'Monday';


-- Q17) Display those employees who join the company this month.
SELECT * FROM EMP WHERE MONTH(doj) = MONTH(CURDATE()) AND YEAR(doj) = YEAR(CURDATE());


-- Q18) Display those employees who join the company in last 30 days. 
SELECT * FROM EMP WHERE doj >= CURDATE() - INTERVAL 30 DAY;


-- Q19) Display name of employee(s) who join the company in 2022.
SELECT ename FROM EMP WHERE YEAR(doj) = 2022;


-- Q20) Display name of the employee(s) who join the company this year.
SELECT ename FROM EMP WHERE YEAR(doj) = YEAR(CURDATE());




