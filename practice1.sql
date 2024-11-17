-- Question I: a) Create the tables enforcing the constraints sid primary key, cid primary key, gpa should be in the range 0-10.
CREATE TABLE students (
    sid INT PRIMARY KEY,
    name VARCHAR(20),
    age INT DEFAULT 0,
    gpa DECIMAL(2, 2) CHECK (gpa >= 0 AND gpa <= 10),
    branch VARCHAR(20)
);

CREATE TABLE course (
    cid INT PRIMARY KEY,
    cname VARCHAR(20)
);

CREATE TABLE takes (
    sid INT,
    cid INT,
    FOREIGN KEY (sid) REFERENCES students(sid),
    FOREIGN KEY (cid) REFERENCES course(cid),
    PRIMARY KEY (sid, cid)
);

-- Question I: b) Give default value for age as 0. (Already implemented in the "students" table above.)

-- Question I: c) Create a view Toppers as names and gpa of students having gpa greater than 8.
CREATE VIEW toppers AS 
SELECT name, gpa 
FROM students 
WHERE gpa > 8;

-- Question I: d) Find the average age of all the students.
SELECT AVG(age) AS average_age 
FROM students;

-- Question I: e) Find the names of students taking the course DBMS from branch CS.
SELECT name, students.sid 
FROM students 
JOIN takes ON students.sid = takes.sid 
JOIN course ON course.cid = takes.cid 
WHERE course.cname = 'DBMS' AND students.branch = 'CS';

-- Question II: Write a PL/SQL program to accept employee id from the user. If it does not exist in the table, display appropriate error message using exception handling.
CREATE TABLE employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(20),
    designation VARCHAR(20)
);

INSERT INTO employee VALUES (1, 'Jibin', 'Manager');
INSERT INTO employee VALUES (2, 'Manu', 'CTO');

DECLARE
    testid NUMBER;
BEGIN
    testid := &enter_empid;
    BEGIN
        SELECT empid INTO testid 
        FROM employee 
        WHERE empid = testid;
        DBMS_OUTPUT.PUT_LINE('Employee Found');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Message: ' || SQLERRM);
    END;
END;
/

-- Question III: Write a PL/SQL Trigger which should track the deleted entry details in Student table and store that data into student backup table.
CREATE TABLE backup_students (
    sid INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    gpa DECIMAL(2, 2) CHECK (gpa >= 0 AND gpa <= 10),
    branch VARCHAR(20)
);

CREATE OR REPLACE TRIGGER backup_on_delete
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO backup_students (sid, name, age, gpa, branch) 
    VALUES (:old.sid, :old.name, :old.age, :old.gpa, :old.branch);
END;
/

-- Testing the trigger:
DELETE FROM students WHERE sid = 1;

-- Verify the data in the backup table:
SELECT * FROM backup_students;
