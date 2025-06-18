USE PLSQL;
# 1. Greatest of Three Numbers

DELIMITER //

CREATE PROCEDURE find_greatest()
BEGIN
    DECLARE a INT DEFAULT 10;
    DECLARE b INT DEFAULT 25;
    DECLARE c INT DEFAULT 15;
    DECLARE greatest INT;

    IF a >= b AND a >= c THEN
        SET greatest = a;
    ELSEIF b >= a AND b >= c THEN
        SET greatest = b;
    ELSE
        SET greatest = c;
    END IF;

    SELECT CONCAT('Greatest number is: ', greatest) AS Result;
END;
//

DELIMITER ;

-- To finding greatest of three :
CALL find_greatest();


# 2. Find Grade

DELIMITER //

CREATE PROCEDURE find_grade(IN marks INT)
BEGIN
    DECLARE grade CHAR(1);

    IF marks > 80 THEN
        SET grade = 'A';
    ELSEIF marks > 70 THEN
        SET grade = 'B';
    ELSEIF marks > 50 THEN
        SET grade = 'C';
    ELSEIF marks > 40 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'E';
    END IF;

    SELECT CONCAT('Grade is: ', grade) AS Result;
END;
//

DELIMITER ;

-- To run (example with 75 marks):
CALL find_grade(75);

# 3. Print Table of a Given Number

DELIMITER //

CREATE PROCEDURE print_table(IN num INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO
        SELECT CONCAT(num, ' x ', i, ' = ', num*i) AS Result;
        SET i = i + 1;
    END WHILE;
END;
//

DELIMITER ;

-- To run:
CALL print_table(5);

# 4. Find Factorial of a Number


DELIMITER //

CREATE PROCEDURE find_factorial(IN num INT)
BEGIN
    DECLARE fact INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;

    WHILE i <= num DO
        SET fact = fact * i;
        SET i = i + 1;
    END WHILE;

    SELECT CONCAT('Factorial is: ', fact) AS Result;
END;
//

DELIMITER ;

-- To run:
CALL find_factorial(5);

# 5. Fibonacci Series

DELIMITER //

CREATE PROCEDURE fibonacci_series(IN n INT)
BEGIN
    DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 1;
    DECLARE temp INT;
    DECLARE count INT DEFAULT 0;

    SELECT a AS Fibonacci;
    SELECT b AS Fibonacci;

    WHILE count < n-2 DO
        SET temp = a + b;
        SELECT temp AS Fibonacci;
        SET a = b;
        SET b = temp;
        SET count = count + 1;
    END WHILE;
END;
//

DELIMITER ;

-- To run:
CALL fibonacci_series(10);


# 6. Reverse a Number

DELIMITER //

CREATE PROCEDURE reverse_number(IN num INT)
BEGIN
    DECLARE rev INT DEFAULT 0;
    DECLARE digit INT;

    WHILE num > 0 DO
        SET digit = MOD(num, 10);
        SET rev = rev * 10 + digit;
        SET num = FLOOR(num/10);
    END WHILE;

    SELECT CONCAT('Reversed Number is: ', rev) AS Result;
END;
//

DELIMITER ;

-- To run:
CALL reverse_number(1234);

# 7. Reverse a String

DELIMITER //

CREATE PROCEDURE reverse_string(IN str VARCHAR(100))
BEGIN
    DECLARE rev VARCHAR(100) DEFAULT '';
    DECLARE len INT;

    SET len = CHAR_LENGTH(str);

    WHILE len > 0 DO
        SET rev = CONCAT(rev, SUBSTRING(str, len, 1));
        SET len = len - 1;
    END WHILE;

    SELECT CONCAT('Reversed String: ', rev) AS Result;
END;
//

DELIMITER ;

-- To run:
CALL reverse_string('hello');

# 8. Fine Calculation for Roll No 100

DELIMITER //

CREATE PROCEDURE calculate_fine()
BEGIN
    DECLARE doi DATE DEFAULT '2025-04-10';
    DECLARE dor DATE DEFAULT '2025-04-25';
    DECLARE days_late INT;
    DECLARE fine_per_day INT;
    DECLARE total_fine INT;

    SET days_late = DATEDIFF(dor, doi);

    IF days_late < 7 THEN
        SET fine_per_day = 1;
    ELSEIF days_late <= 14 THEN
        SET fine_per_day = 2;
    ELSE
        SET fine_per_day = 3;
    END IF;

    SET total_fine = days_late * fine_per_day;

    SELECT CONCAT('Total Fine is: Rs ', total_fine) AS Fine;
END;
//

DELIMITER ;

-- To run:
CALL calculate_fine();

# 9. To Perform +, -, *, /

DELIMITER //

CREATE PROCEDURE perform_operation(IN a INT, IN b INT, IN op CHAR(1))
BEGIN
    DECLARE result DOUBLE;

    CASE op
        WHEN '+' THEN SET result = a + b;
        WHEN '-' THEN SET result = a - b;
        WHEN '*' THEN SET result = a * b;
        WHEN '/' THEN SET result = a / b;
        ELSE SELECT 'Invalid Operation' AS Result;
    END CASE;

    SELECT CONCAT('Result is: ', result) AS Result;
END;
//

DELIMITER ;

-- To run (example):
CALL perform_operation(10, 5, '+');

# 10. Multiplication Table from 3 to n

DELIMITER //

CREATE PROCEDURE multiplication_table(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 3;
    DECLARE j INT;

    WHILE i <= n DO
        SET j = 1;
        WHILE j <= 10 DO
            SELECT CONCAT(i, ' x ', j, ' = ', i*j) AS Result;
            SET j = j + 1;
        END WHILE;
        SET i = i + 1;
    END WHILE;
END;
//

DELIMITER ;

-- To run:
CALL multiplication_table(5);

# 11. Print 5,10,15,20

DELIMITER //

CREATE PROCEDURE print_multiples()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 4 DO
        SELECT i*5 AS Result;
        SET i = i + 1;
    END WHILE;
END;
//

DELIMITER 


-- To run:
CALL print_multiples();

# 12. Welcome Message Based on Time

DELIMITER //

CREATE PROCEDURE welcome_message()
BEGIN
    DECLARE hr INT;

    SET hr = HOUR(NOW());

    IF hr < 12 THEN
        SELECT 'Good Morning' AS Message;
    ELSEIF hr < 17 THEN
        SELECT 'Good Afternoon' AS Message;
    ELSE
        SELECT 'Good Night' AS Message;
    END IF;
END;
//

DELIMITER ;

-- To run:
CALL welcome_message();

# 13. Simple Interest Table

CREATE TABLE simple_interest (
    principal INT,
    time INT,
    rate INT,
    interest DOUBLE
);


DELIMITER //

CREATE PROCEDURE insert_interest()
BEGIN
    DECLARE rate INT DEFAULT 5;
    DECLARE interest DOUBLE;

    WHILE rate <= 15 DO
        SET interest = (1000 * rate * 2) / 100;
        INSERT INTO simple_interest VALUES (1000, 2, rate, interest);
        SET rate = rate + 1;
    END WHILE;
END;
//

DELIMITER ;

-- To run:
CALL insert_interest();

-- To see:
SELECT * FROM simple_interest;






