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
CREATE TABLE LATE_FEE_RULE(from_days DATE, 
                           to_days DATE, 
                           amount FLOAT,
                           PRIMARY KEY(from_days, to_days, amount));
                           
ALTER TABLE MEMBER MODIFY branch_code  INT;
DESC  PUBLISHER;

ALTER TABLE BOOK ADD no_of_times_issued INT;

COMMIT;
