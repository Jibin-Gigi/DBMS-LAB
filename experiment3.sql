CREATE TABLE LANGUAGE(language_id INT PRIMARY KEY, name VARCHAR(20) );
CREATE TABLE PUBLISHER(publisher_id INT PRIMARY KEY, name VARCHAR(20), address VARCHAR(20));
CREATE TABLE MEMBER(member_id INT PRIMARY KEY, 
                    name VARCHAR(20), 
                    branch_code VARCHAR(20), 
                    roll_no INT, 
                    phone_number INT,
                    email_id VARCHAR(20), 
                    date_of_join DATE, 
                    status VARCHAR(20));
CREATE TABLE AUTHOR(author_id INT PRIMARY KEY, name VARCHAR(20), email_id VARCHAR(20), phone_number INT, status VARCHAR (20) );
CREATE TABLE BOOK(book_id INT PRIMARY KEY, 
                  title  VARCHAR(20),
                  language_id INT,  
                  MRP FLOAT, 
                  publisher_id INT, 
                  published_date DATE, 
                  volume INT, 
                  status VARCHAR(20),
                  FOREIGN KEY(language_id)  REFERENCES LANGUAGE,
                  FOREIGN KEY(publisher_id) REFERENCES PUBLISHER);
                  

CREATE TABLE BOOK_AUTHOR(book_id INT, 
                         author_id INT, 
                         PRIMARY KEY(book_id, author_id), 
                         FOREIGN KEY(book_id) REFERENCES BOOK, 
                         FOREIGN KEY(author_id) REFERENCES AUTHOR);
CREATE TABLE BOOK_ISSUE(issue_id INT PRIMARY KEY, 
                        date_of_issue DATE, 
                        book_id INT, 
                        member_id INT, 
                        expected_date_of_join DATE, 
                        status VARCHAR(20), 
                        FOREIGN KEY(book_id) REFERENCES BOOK, 
                        FOREIGN KEY(member_id) REFERENCES MEMBER);
CREATE TABLE BOOK_RETURN(issue_id INT PRIMARY KEY, 
                         actual_date_of_return DATE, 
                         late_days INT, 
                         late_fee FLOAT, 
                         FOREIGN KEY(issue_id) REFERENCES BOOK_ISSUE);
CREATE TABLE LATE_FEE_RULE(from_days INT, 
                           to_days INT, 
                           amount FLOAT,
                           PRIMARY KEY(from_days, to_days, amount));
                           
ALTER TABLE MEMBER MODIFY branch_code  INT;
DESC  PUBLISHER;

ALTER TABLE BOOK ADD no_of_times_issued INT;

INSERT INTO AUTHOR VALUES(1, 'JIBIN', 'j@gmail.com', 6262626262, 'Inactive');
INSERT INTO AUTHOR VALUES(2, 'KEVIN', 'k@gmail.com', 9292696692, 'Active');
INSERT INTO AUTHOR VALUES(3, 'MANU', 'm@gmail.com', 9288628262, 'Inactive');
SELECT * FROM AUTHOR;

ALTER TABLE PUBLISHER MODIFY address VARCHAR(50);
ALTER TABLE MEMBER MODIFY email_id VARCHAR(50);

INSERT INTO PUBLISHER VALUES (1, 'TONY', 'Stark Towers, New York');
INSERT INTO PUBLISHER VALUES (2, 'PETER', 'Tea Nagar, Chennai');
INSERT INTO PUBLISHER VALUES (3, 'MJ', 'Cinema Nagar, Kolkata');
SELECT * FROM PUBLISHER;

INSERT INTO LANGUAGE VALUES (1, 'ENGLISH');
INSERT INTO LANGUAGE VALUES (2, 'HINDI');
INSERT INTO LANGUAGE VALUES (3, 'MALAYALAM');
SELECT * FROM LANGUAGE;

INSERT INTO MEMBER VALUES(1, 'JOHN', 198, 11, 8525852585, 'john@gmail.com', '02-09-24', 'Inactive');
INSERT INTO MEMBER VALUES(2, 'JIZZ', 198, 12, 9525456585, 'jizz@gmail.com', '02-09-24', 'Inactive');
INSERT INTO MEMBER VALUES(3, 'JINO', 198, 13, 6521236585, 'jino@gmail.com', '02-09-24', 'Active');
SELECT * FROM MEMBER;

INSERT INTO BOOK VALUES(1, 'Raj Simha', 1, 82.2, 1, '11-01-1999', 1, 'Available', 10);
INSERT INTO BOOK VALUES(2, 'Raj Bhavan', 2, 82.2 , 2, '11-01-1999', 2, 'Available', 12);
INSERT INTO BOOK VALUES(3, 'Raj Kumar', 3, 82.2 , 3, '19-02-1999', 3, 'Unavailable', 14);
SELECT * FROM BOOK;

INSERT INTO BOOK_AUTHOR VALUES(1, 1);
INSERT INTO BOOK_AUTHOR VALUES(2, 2);
INSERT INTO BOOK_AUTHOR VALUES(3, 3);
SELECT * FROM BOOK_AUTHOR;

INSERT INTO BOOK_ISSUE VALUES(1, '02-02-24', 1, 1, '06-02-24', 'No dues');
INSERT INTO BOOK_ISSUE VALUES(2, '04-02-24', 2, 2, '08-02-24', 'dues');
INSERT INTO BOOK_ISSUE VALUES(3, '06-02-24', 3, 3, '10-02-24', 'dues');
SELECT * FROM BOOK_ISSUE;

INSERT INTO BOOK_RETURN VALUES(1, '06-02-24', 0, 0);
INSERT INTO BOOK_RETURN VALUES(2, '08-02-24', 1, 10);
INSERT INTO BOOK_RETURN VALUES(3, '10-02-24', 2, 20);
SELECT * FROM BOOK_RETURN;

INSERT INTO LATE_FEE_RULE VALUES (0, 7, 10);
INSERT INTO LATE_FEE_RULE VALUES(7, 30, 100);
INSERT INTO LATE_FEE_RULE VALUES(30, 45, 150);
SELECT * FROM LATE_FEE_RULE;

ALTER TABLE BOOK DROP COLUMN Publisher_id; 
TRUNCATE TABLE PUBLISHER;
SELECT * FROM PUBLISHER;

DROP TABLE BOOK_AUTHOR;
DROP TABLE AUTHOR;
SELECT * FROM AUTHOR;

ALTER TABLE LATE_FEE_RULE RENAME TO FINE_TABLE;
SELECT * FROM FINE_TABLE;


COMMIT;
