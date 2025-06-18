USE StudentDB;
SELECT * FROM Students;
SELECT * FROM Courses;

select * from Students as s
left join  Courses as c ON s.CourseID = c.CourseID
where s.id is NULL ;