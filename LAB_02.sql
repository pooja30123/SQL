-- Create table “Student” with following attributes {Rno, Name, DOB, Gender,Class, College, City, Marks}
CREATE DATABASE College;
USE College;

-- Insert (at least) 10 records in the created Student table.
CREATE TABLE student(
	Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Gender CHAR(1),
    Class VARCHAR(20),
    College VARCHAR(100),
    City VARCHAR(50),
    Marks INT
);

INSERT INTO Student (Rno, Name, DOB, Gender,Class, College, City, Marks) VALUES 
(1, 'Amit', '2000-05-12', 'M','B.Tech','IIT Lucknow', 'Lucknow', 85),
(2, 'Rahul', '2001-08-23', 'M', 'MCA', 'IIT Delhi', 'Delhi', 72),
(3, 'Chetan', '1999-11-15', 'M', 'B.Sc', 'DU', 'Lucknow', 65),
(4, 'Sneha', '2000-02-28', 'F', 'BCA', 'MIT', 'Pune', 78),
(5, 'Vikas', '2002-07-10', 'M', 'MBA', 'IIM Bangalore', 'Bangalore', 56),
(6, 'Charan', '2003-09-05', 'M', 'B.Tech', 'NIT Warangal', 'Hyderabad', 90),
(7, 'Komal', '1998-06-22', 'F', 'M.Tech', 'IIT Bombay', 'Mumbai', 88),
(8, 'Bhavya', '1997-12-17', 'F', 'B.Com', 'DU', 'Gwalior', 45),
(9, 'Rohit', '2001-04-30', 'M', 'BBA', 'IP University', 'Gwalior', 50),
(10, 'Chirag', '2000-10-19', 'M', 'B.Tech', 'IIIT Hyderabad', 'Hyderabad', 95);

-- Display the information of all the students.
SELECT * FROM Student;

-- Display the detailed structure of the created table.
DESCRIBE Student;

-- Display Rno, Name and Class information of students living in “Lucknow”.
SELECT Rno,Name,Class from Student WHERE City = 'Lucknow';

-- Display information of all the students in ascending order of marks.
SELECT * FROM Student Order by Marks ASC;

-- Change the marks of Rno 5 to 89.
UPDATE Student SET Marks=89 WHERE Rno=5;

-- Change the name and city of Rno 9.
UPDATE Student SET Name = 'Pooja' , City = 'Mumbai' WHERE Rno=9;

SET SQL_SAFE_UPDATES = 0;

-- Delete the records of “Gwalior” city.
DELETE FROM Student WHERE City = 'Gwalior';

-- Display the records of student having marks<30 and then delete them.
SELECT * FROM Student WHERE Marks<30;
DELETE FROM Student WHERE Marks<30;

-- Display name of students that starts with ‘C’.
SELECT * FROM Student WHERE Name = 'C%';

-- Display the name of the employees whose second character is ‘b’ or ‘B’.
SELECT * FROM Student WHERE Name = '_b%' or Name = '_B%';

