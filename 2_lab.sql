CREATE DATABASE School;
USE School;
CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    Age INT NOT NULL
);
INSERT INTO Student VALUES(1,'Pooja',22);
INSERT INTO Student VALUES(2,'jay',24);
SELECT * FROM Student;

-- create database xyz company create table employee id,name,salary,1,,adam,25000,  2,bob,30000,  3,kesi,40000  

CREATE TABLE Employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT NOT NULL
);

INSERT INTO Employee (id,name,salary) values
 (1,'adam',25000),
 (2,'bob',30000),
 (3,'kesi',40000);
 
 SELECT * FROM Employee;
 
 