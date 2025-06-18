SELECT DATE_FORMAT(CURDATE(), '%Y-%m-01') AS TruncatedMonth;

SELECT DATE_ADD(MAKEDATE(YEAR(CURDATE()), 1), INTERVAL ROUND(DAYOFYEAR(CURDATE()) / 365) YEAR) AS RoundedYear;

SELECT DATE_FORMAT(CURDATE(), '%Y-01-01') AS TruncatedYear;
 
SELECT DATE_ADD(CURDATE(), INTERVAL 3 DAY) AS DayAfterThreeDays;

SELECT DATE_FORMAT(NOW(), '%H:%i:%s') AS CurrentTime;

SELECT CHAR(65) AS CharacterA;  -- Returns 'A'

SELECT CONCAT("POOJA","Verma") AS ConcatenatedName;

SELECT INSTR('Database Systems','S') AS PositionOfS;

SELECT LENGTH('PoojaVerma') AS StringLength;

SELECT LPAD('AI',5,'*') AS LeftPaddedString;

SELECT LTRIM('   Pooja') AS TrimedString;

SELECT LTRIM('   Pooja') AS TrimedString;

SELECT RPAD('AI',5,'*') AS RightPaddedString;

SELECT RTRIM('Pooja      ') AS TrimmedSring;

SELECT REPLACE('Pooja Verma','Verma','Yadav') AS ReplacedString;

SELECT SUBSTRING('Database Systems', 10, 7) AS Substring;

SELECT SUBSTRING('Pooja Dinanath Verma',7,13) AS Substring;

SELECT SUBSTRING('Pooja Dinanath Verma',7,14) AS Substring;

SELECT LOWER('POOJA') AS LowerCaseString;

SELECT UPPER('pooja') AS UpperCaseString;

SELECT REPLACE(REPLACE('12345','1','A'),'2','B') AS TranslatedString;

SELECT ABS(-21) AS AbsoluteValue;

SELECT CEIL(1.43) AS CeilingValue;

SELECT COS(PI()/3) AS CosValue;

SELECT EXP(1) AS ExponntialValue;

SELECT FLOOR(3.14) AS FloorValue;

SELECT MOD(10,3) AS ModValue;

SELECT POW(2,5) AS PowerValue;

SELECT ROUND(5.56543) AS RoundValue;

SELECT SIGN(-21) AS SignValue;

SELECT SQRT(225) AS SquareRootValue;

SELECT ROUND(3.145869,2) AS TruncatedValue;

SELECT SYSDATE() AS SystemDate;

SELECT DATE_ADD(CURDATE(),INTERVAL 1 MONTH) AS DateAfterOneMonth;

SELECT LAST_DAY(CURDATE()) AS LastDayOfMonth;

SELECT PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM '2025-01-01'),EXTRACT(YEAR_MONTH FROM  '2024-12-01')) AS MonthsBetween;

SELECT PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM '2025-01-01'),EXTRACT(YEAR_MONTH FROM  '2024-01-01')) AS MonthsBetween;

SELECT DATE_ADD(CURDATE(), INTERVAL(WEEKDAY(CURDATE()) < 5) + 5 DAY) AS NextFriday;

SELECT GREATEST(10,20,15) AS GreatestValue;

SELECT LEAST(10,20,15) AS LeastValue;

