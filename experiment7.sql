CREATE TABLE STUDENT_35_JIBIN (  roll_no INT PRIMARY KEY,  name VARCHAR(50),  physics INT,
 chemistry INT, mathematics INT );

INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (1, 'Adam', 20, 20, 33);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (2, 'Bob', 18, 9, 41);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (3, 'Bright', 22, 7, 31);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (4, 'Duke', 13, 21, 20);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (5, 'Elvin', 14, 22, 23);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (6, 'Fletcher', 2, 10, 48);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (7, 'Georgina', 22, 12, 22);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (8, 'Mary', 24, 14, 31);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (9, 'Tom', 19,15,24);
INSERT INTO STUDENT_35_JIBIN (roll_no, name, physics, chemistry, mathematics)
VALUES (10, 'Zack', 8, 20, 36);


SELECT * FROM STUDENT_35_JIBIN;

SELECT AVG(physics) AS class_average_physics FROM STUDENT_35_JIBIN;
SELECT MAX(mathematics) AS highest_marks_maths FROM STUDENT_35_JIBIN;

SELECT MIN(chemistry) AS lowest_mark_chemistry FROM STUDENT_35_JIBIN;
SELECT COUNT(*) AS pass_in_physics FROM STUDENT_35_JIBIN WHERE physics >= 12; 
SELECT roll_no, name FROM STUDENT_35_JIBIN WHERE physics >= 12 AND chemistry >= 12 AND mathematics >= 25;
SELECT roll_no, name, (physics + chemistry + mathematics) AS total_marks, CASE  WHEN physics >= 12 AND chemistry >= 12 AND mathematics >= 25 THEN 'Pass' ELSE 'Fail'  END AS status FROM STUDENT_35_JIBIN ORDER BY total_marks DESC;
SELECT (COUNT(CASE WHEN mathematics>=25 THEN 1 END)*100.00/COUNT(*))AS PASS_PERCENTAGE_MATHS FROM STUDENT_35_JIBIN;
SELECT   (COUNT(CASE   WHEN physics >= 12 AND chemistry >= 12 AND mathematics >= 25 THEN 1  END) * 100.00 / COUNT(*)) AS overall_pass_percentage FROM STUDENT_35_JIBIN;

SELECT AVG(physics + chemistry + mathematics) AS class_average FROM STUDENT_35_JIBIN;
SELECT COUNT(*) AS total_pass FROM STUDENT_35_JIBIN WHERE physics >= 12 AND chemistry >= 12 AND mathematics >= 25;
