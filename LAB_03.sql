-- Create table “Employee” with following attributes {Empno, Ename, Job, Sal, Dept no, Commission}
CREATE DATABASE Company;
USE Company;
CREATE TABLE Employee (
    Empno INT PRIMARY KEY,
    Ename VARCHAR(50),
    Job VARCHAR(50),
    Sal DECIMAL(10,2),
    Deptno INT,
    Commission DECIMAL(10,2)
);

-- Insert (at least) 10 records in Employee table.
INSERT INTO Employee (Empno, Ename, Job, Sal, Deptno, Commission) VALUES
(101, 'Pooja Verma', 'Manager', 75000.00, 10, 5000.00),
(102, 'Madhavi Mishra', 'Developer', 60000.00, 20, NULL),
(103, 'Bhawana Dhaka', 'Analyst', 55000.00, 30, 2000.00),
(104, 'Dipesh Yadav', 'Clerk', 40000.00, 40, NULL),
(105, 'Sahil Rafaliya', 'HR', 65000.00, 50, 3000.00),
(106, 'Vivesh Kumar', 'Salesman', 50000.00, 60, 7000.00),
(107, 'Anamitra', 'Accountant', 62000.00, 70, 2500.00),
(108, 'Praveen', 'Developer', 58000.00, 20, NULL),
(109, 'Sakshi Vedi', 'Manager', 78000.00, 10, 6000.00),
(110, 'Mansi Dakhle', 'Salesman', 53000.00, 60, 5500.00);

-- Get Empno and Ename of employees who work in dept no 10.
SELECT Empno, Ename FROM employee WHERE Deptno = 10; 

-- Display the employee names of those clerks whose salary > 2000.
SELECT Ename FROM employee WHERE sal > 2000;

-- Display name and salary of Salesperson & Clerks.
SELECT Ename, Sal FROM employee WHERE Job = 'Salesman' OR Job = 'Clerk';

-- INSERT NEW ROW
INSERT INTO Employee (Empno, Ename, Job, Sal, Deptno, Commission) VALUES
(111, 'Ethan Scott', 'Clerk', 2500.00, 30, NULL),
(112, 'Ava Turner', 'Intern', 2800.00, 20, NULL);

-- Display all details of employees whose salary is between 2000 and 3000.
SELECT * FROM employee WHERE Sal BETWEEN 2000 AND 3000;

-- Display all details of employees whose dept no. is 10, 20, or 30.
SELECT * FROM employee WHERE Deptno=10 OR Deptno=20 OR Deptno=30;

-- Display name of those employees whose commission is NULL.
SELECT Ename FROM employee WHERE Commission IS NULL;

-- Display dept no. & salary in ascending order of dept no. and within each dept no. salary should be in descending order.
SELECT Deptno,Sal FROM employee ORDER BY Deptno ASC, Sal DESC;

-- Display name of employees that ends with ‘A’.
SELECT Ename FROM employee WHERE Ename LIKE '%A';

-- Display name of employees having two ‘a’ or ‘A’ characters in their name.
SELECT Ename FROM employee WHERE Ename like '%a%a' AND Ename NOT LIKE '%a%a%a';

-- Display the name of the employees whose first or last character is ‘a’ or ‘A’.
SELECT Ename FROM employee WHERE Ename LIKE 'a%a'; 

-- Display salary + commission of Employee table.
SELECT Empno, Ename, Sal, Commission, (Sal + IFNULL(Commission, 0)) AS Total_Compensation FROM Employee;
