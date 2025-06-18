-- Create a database named StudentDB.
CREATE DATABASE StudentDB;
-- Show the list of databases.
SHOW DATABASES;
-- Use the StudentDB database.
USE StudentDB;
-- Create the Students table inside your StudentDB database.
CREATE TABLE Students(StudentID INT PRIMARY KEY, Name VARCHAR(100), Age INT, Email VARCHAR(100), EnrollmentDate DATE);
-- Verify the table using:
SHOW TABLES;
-- Describe the structure of the table:
DESC Students;
-- Insert at least 3 students into the Students table.
INSERT INTO Students(StudentID, Name, Age, Email, EnrollmentDate) VALUES (24029,'Pooja',22,'pooja@gmail.com','2024-08-20'),(24007,'Madhavi',21,'madhavi@gmail.com','2024-08-21');
INSERT INTO Students(StudentID, Name, Age, Email, EnrollmentDate) VALUES (24002,'Bhawana',22,'bhawanaa@gmail.com','2024-08-18'),(24014,'Dipesh',21,'dipesh@gmail.com','2024-08-21');
-- to display the inserted records
SELECT * FROM Students;
-- Update Dipesh's EnrollmentDate to '2024-08-25'.
UPDATE Students SET Email = 'madhavim@gmail.com' WHERE StudentID = 24007;
UPDATE Students SET EnrollmentDate='2024-08-25' WHERE StudentID = 24014;
-- Delete Bhawana's record from the Students table.
DELETE FROM Students WHERE StudentID = 24002;
-- Add a new column PhoneNumber (VARCHAR(15)) to the Students table.
ALTER TABLE Students ADD (PhoneNumber VARCHAR(15));
-- What will happen if we try to delete a student whose StudentID does not exist in the table?
DELETE FROM Students WHERE StudentID = 24002; -- record that doesn’t exist, nothing happens—no error is shown, and no rows are affected.
-- DELETE: Removes specific rows based on a condition (WHERE). It can be rolled back if used inside a transaction. TRUNCATE: Removes all rows from the table but does not log individual row deletions. It cannot be rolled back in most cases.
START TRANSACTION ;
DELETE FROM Students WHERE StudentID = 2014;
ROLLBACK;
-- Use TRUNCATE to remove all records from the Students table.
TRUNCATE TABLE Students;
-- Insert two new student records into the table.
INSERT INTO Students(StudentID, Name, Age, Email, EnrollmentDate) VALUES (24021,'Shanti',22,'shanti@gmail.com','2024-08-20'),(24007,'Madhavi',21,'madhavi@gmail.com','2024-08-21');
INSERT INTO Students (StudentID, Name, Age, Email, EnrollmentDate, PhoneNumber) VALUES
(24010, 'Aarav Mehta', 23, 'aarav@gmail.com', '2024-08-22', '9876543210'),
(24011, 'Simran Kaur', 22, 'simran@gmail.com', '2024-08-23', '9876543211');
--  Using WHERE to Filter Data
SELECT * FROM Students WHERE StudentID = 24010;
--  Using AND & OR for Multiple Conditions
SELECT * FROM Students WHERE Age=22 and EnrollmentDate > '2024-08-21';
SELECT * FROM Students WHERE Age=22 OR Age = 23;
-- Using BETWEEN for Range Filters
SELECT * FROM Students WHERE EnrollmentDate Between '2024-08-21' AND '2024-08-24';
--  Using LIKE for Pattern Matching
SELECT * FROM Students WHERE Name LIKE '%i';
SELECT * FROM Students WHERE Email LIKE '%@gmail.com';
-- Fetch students who are 23 years old.
SELECT * FROM Students WHERE Age = 23;
-- Fetch students whose names start with 'S'.
SELECT * FROM Students WHERE Name LIKE "s%";
-- Fetch students whose EnrollmentDate is between '2024-08-21' and '2024-08-23'.
SELECT * FROM Students WHERE EnrollmentDate  BETWEEN '2024-08-21' AND '2024-08-23';
-- Fetch students whose phone number ends with '10'
SELECT * FROM students WHERE PhoneNumber LIKE '%10';
SELECT * FROM Students;
UPDATE Students SET PhoneNumber = 8569321478 WHERE StudentID = 24007;
UPDATE Students SET PhoneNumber = 9546475423 WHERE StudentID = 24021;
-- Fetch all students, sorted by Age in ascending order.
SELECT * FROM Students ORDER BY AGE ASC;
-- Fetch students sorted by EnrollmentDate in descending order.
SELECT * FROM Students ORDER BY EnrollmentDate DESC;
-- Fetch only the first 2 students from the sorted list in Task 2.
SELECT * FROM Students ORDER BY EnrollmentDate DESC LIMIT 2;
-- To fetch only the 3rd and 4th students, use:
SELECT * FROM Students ORDER BY EnrollmentDate DESC LIMIT 2 OFFSET 2;
-- COUNT – Count Rows
SELECT COUNT(*) AS TotalStudent FROM Students;
-- SUM – Add Up Values
SELECT SUM(Age) FROM Students;
-- AVG – Find the Average
SELECT AVG(Age) FROM Students;
-- MIN & MAX – Find Smallest & Largest Values
SELECT MIN(Age) AS Younger , MAX(Age) AS Older FROM Students;
--  GROUP BY – Grouping Similar Data
SELECT Age , COUNT(*) AS TotalStudent FROM Students GROUP BY Age;
-- GROUP BY with SUM & AVG
SELECT EnrollmentDate, AVG(Age) AS AvgAge FROM Students GROUP BY EnrollmentDate;
-- HAVING – Filtering Grouped Results
SELECT Age, COUNT(*) AS TotalStudents FROM Students GROUP BY Age HAVING COUNT(*)>1;
DROP TABLE Students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Email VARCHAR(100),
    EnrollmentDate DATE,
    CourseID INT
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);
INSERT INTO Courses (CourseID, CourseName) VALUES
(1, 'AI & ML'),
(2, 'Data Science'),
(3, 'Cybersecurity'),
(4, 'Web Development'),
(5, 'Cloud Computing');
INSERT INTO Students (StudentID, Name, Age, Email, EnrollmentDate, CourseID) VALUES
(24001, 'Pooja Verma', 22, 'pooja@gmail.com', '2024-08-20', 1),
(24002, 'Madhavi Sharma', 21, 'madhavi@gmail.com', '2024-08-21', 2),
(24003, 'Bhawana Yadav', 22, 'bhawana@gmail.com', '2024-08-18', 3),
(24004, 'Dipesh Kumar', 23, 'dipesh@gmail.com', '2024-08-22', 4),
(24005, 'Suresh Patil', 24, 'suresh@gmail.com', '2024-08-19', 1),
(24006, 'Kiran Desai', 21, 'kiran@gmail.com', '2024-08-25', 5),
(24007, 'Aman Gupta', 22, 'aman@gmail.com', '2024-08-17', 2),
(24008, 'Rohit Sen', 23, 'rohit@gmail.com', '2024-08-23', 3),
(24009, 'Sneha Jain', 20, 'sneha@gmail.com', '2024-08-26', NULL),
(24010, 'Priya Singh', 25, 'priya@gmail.com', '2024-08-24', NULL);

SELECT * FROM Students;
SELECT * FROM Courses;
-- Fetch student names and their course names using INNER JOIN.
SELECT s.Name, c.CourseName FROM Students s INNER JOIN Courses c ON s.CourseID = c.CourseID;
-- Fetch all students with their courses, even if they haven’t enrolled, using LEFT JOIN.
SELECT s.NAME ,c.CourseName FROM Students s LEFT JOIN Courses c ON s.CourseID = c.CourseID;
-- Fetch all courses with student names, even if no student is enrolled, using RIGHT JOIN.
SELECT c.CourseName, s.Name FROM Courses c RIGHT JOIN Students s ON s.CourseID = c.CourseID;
SELECT c.CourseName, s.Name 
FROM Courses c 
RIGHT JOIN Students s ON s.CourseID = c.CourseID;

-- Find students older than the average age
SELECT * From Students WHERE Age > (SELECT AVG(Age) FROM Students);
-- Find students who are enrolled in 'AI & ML'
SELECT Name FROM Students WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'AI & ML');
-- Find students who enrolled after the earliest enrollment date.
SELECT Name FROM Students Where EnrollmentDate > (SELECT MIN(EnrollmentDate) FROM Students); 
-- Find students who are older than the youngest student.
SELECT Name FROM Students Where Age > (SELECT MIN(Age) FROM Students); 
-- SQL VIEWS
CREATE VIEW StudentCourses As 
SELECT s.Name,s.Age,c.CourseName 
FROM Students s 
LEFT JOIN Courses c ON s.CourseID = c.CourseID; 

SELECT * FROM StudentCourses;

-- Create a view named YoungStudents that stores students below 23 years old.
CREATE VIEW YoungStudents AS
SELECT * FROM Students WHERE Age < 23;

SELECT * FROM YoungStudents;

-- Create a view named EnrolledStudents that stores students who have enrolled in a course.
CREATE VIEW EnrolledStudents AS
SELECT * FROM Students WHERE CourseID IS NOT NULL;

SELECT * FROM EnrolledStudents;

-- SQL INDEXES
CREATE INDEX Student_idx ON Students(Name);

-- Create an index on EnrollmentDate to speed up queries based on dates.
CREATE INDEX idx_Enrolled ON Students(EnrollmentDate);

-- Create a unique index on Email to prevent duplicate emails.
CREATE UNIQUE INDEX unique_mail ON Students(Email); 

-- SQL TRANSACTIONS
START TRANSACTION;
UPDATE Students SET Age = 55 WHERE StudentID = 24009;
SELECT * FROM Students;
ROLLBACK;
UPDATE Students SET CourseID = 1 WHERE StudentID = 24002;
COMMIT;

--  Start a transaction and update a student's age, then delete another student.
START TRANSACTION;
UPDATE Students SET Age = 25 WHERE StudentID = 24006;
DELETE FROM Students WHERE StudentId = 24005;
-- Use ROLLBACK to cancel the changes.
ROLLBACK;
-- Use COMMIT to save the changes permanently.
INSERT INTO Students (StudentID, Name, Age, Email, EnrollmentDate, CourseID) VALUES
(24011, 'Aarav Mehta', 23, 'aarav@gmail.com', '2024-08-2', 2);
COMMIT;